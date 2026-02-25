const express = require('express');
const router = express.Router();
const pool = require('../config/db');
const authMiddleware = require('../middleware/auth');

// Get all accommodations with filters
router.get('/', async (req, res) => {
  try {
    const { 
      type, 
      season, 
      minPrice, 
      maxPrice, 
      minGuests,
      search
    } = req.query;

    let query = 'SELECT * FROM accommodations WHERE 1=1';
    const params = [];
    let paramIndex = 1;

    // Filter by type (hotel or maison_dhotes)
    if (type) {
      query += ` AND type = $${paramIndex}`;
      params.push(type);
      paramIndex++;
    }

    // Filter by season
    if (season) {
      query += ` AND $${paramIndex} = ANY(available_seasons)`;
      params.push(season);
      paramIndex++;
    }

    // Filter by price range
    if (minPrice) {
      query += ` AND price_per_night >= $${paramIndex}`;
      params.push(parseFloat(minPrice));
      paramIndex++;
    }

    if (maxPrice) {
      query += ` AND price_per_night <= $${paramIndex}`;
      params.push(parseFloat(maxPrice));
      paramIndex++;
    }

    // Filter by minimum guests
    if (minGuests) {
      query += ` AND max_guests >= $${paramIndex}`;
      params.push(parseInt(minGuests));
      paramIndex++;
    }

    // Search by name or description
    if (search) {
      query += ` AND (name ILIKE $${paramIndex} OR description ILIKE $${paramIndex})`;
      params.push(`%${search}%`);
      paramIndex++;
    }

    query += ' ORDER BY rating DESC';

    const result = await pool.query(query, params);
    res.json(result.rows);
  } catch (error) {
    console.error('Get accommodations error:', error);
    res.status(500).json({ error: 'Server error' });
  }
});

// Get accommodation by ID
router.get('/:id', async (req, res) => {
  try {
    const { id } = req.params;
    const result = await pool.query('SELECT * FROM accommodations WHERE id = $1', [id]);
    
    if (result.rows.length === 0) {
      return res.status(404).json({ error: 'Accommodation not found' });
    }

    res.json(result.rows[0]);
  } catch (error) {
    console.error('Get accommodation error:', error);
    res.status(500).json({ error: 'Server error' });
  }
});

// Create booking (protected route)
router.post('/bookings', authMiddleware, async (req, res) => {
  try {
    const { accommodation_id, check_in_date, check_out_date, number_of_guests } = req.body;
    const user_id = req.user.id;

    // Get accommodation to calculate price
    const accommodationResult = await pool.query(
      'SELECT price_per_night FROM accommodations WHERE id = $1',
      [accommodation_id]
    );

    if (accommodationResult.rows.length === 0) {
      return res.status(404).json({ error: 'Accommodation not found' });
    }

    const pricePerNight = accommodationResult.rows[0].price_per_night;
    
    // Calculate number of nights
    const checkIn = new Date(check_in_date);
    const checkOut = new Date(check_out_date);
    
    // Validate dates
    if (checkOut <= checkIn) {
      return res.status(400).json({ error: 'Check-out date must be after check-in date' });
    }
    
    const nights = Math.ceil((checkOut - checkIn) / (1000 * 60 * 60 * 24));
    const totalPrice = pricePerNight * nights;

    // Create booking
    const result = await pool.query(
      `INSERT INTO bookings (user_id, accommodation_id, check_in_date, check_out_date, number_of_guests, total_price)
       VALUES ($1, $2, $3, $4, $5, $6) RETURNING *`,
      [user_id, accommodation_id, check_in_date, check_out_date, number_of_guests, totalPrice]
    );

    res.status(201).json(result.rows[0]);
  } catch (error) {
    console.error('Create booking error:', error);
    res.status(500).json({ error: 'Server error' });
  }
});

// Get user's bookings (protected route)
router.get('/bookings/my-bookings', authMiddleware, async (req, res) => {
  try {
    const user_id = req.user.id;
    const result = await pool.query(
      `SELECT b.*, a.name as accommodation_name, a.type, a.address, a.image_url
       FROM bookings b
       JOIN accommodations a ON b.accommodation_id = a.id
       WHERE b.user_id = $1
       ORDER BY b.created_at DESC`,
      [user_id]
    );

    res.json(result.rows);
  } catch (error) {
    console.error('Get bookings error:', error);
    res.status(500).json({ error: 'Server error' });
  }
});

module.exports = router;

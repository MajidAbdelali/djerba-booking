-- Create database schema for Djerba Booking Application

-- Users table for authentication
CREATE TABLE IF NOT EXISTS users (
    id SERIAL PRIMARY KEY,
    email VARCHAR(255) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    name VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Accommodations table (hotels and maison d'hotes)
CREATE TABLE IF NOT EXISTS accommodations (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    type VARCHAR(50) NOT NULL CHECK (type IN ('hotel', 'maison_dhotes')),
    description TEXT,
    address VARCHAR(255),
    price_per_night DECIMAL(10, 2) NOT NULL,
    max_guests INTEGER NOT NULL,
    available_seasons VARCHAR(100)[], -- Array of seasons: ['summer', 'winter', 'spring', 'fall']
    amenities TEXT[],
    image_url VARCHAR(500),
    rating DECIMAL(2, 1) DEFAULT 0,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Bookings table
CREATE TABLE IF NOT EXISTS bookings (
    id SERIAL PRIMARY KEY,
    user_id INTEGER REFERENCES users(id) ON DELETE CASCADE,
    accommodation_id INTEGER REFERENCES accommodations(id) ON DELETE CASCADE,
    check_in_date DATE NOT NULL,
    check_out_date DATE NOT NULL,
    number_of_guests INTEGER NOT NULL,
    total_price DECIMAL(10, 2) NOT NULL,
    status VARCHAR(50) DEFAULT 'pending',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Insert sample data for accommodations
INSERT INTO accommodations (name, type, description, address, price_per_night, max_guests, available_seasons, amenities, image_url, rating) VALUES
('Hotel Djerba Plaza', 'hotel', 'Luxurious beachfront hotel with modern amenities', 'Zone Touristique, Djerba', 150.00, 4, ARRAY['summer', 'winter', 'spring', 'fall'], ARRAY['WiFi', 'Pool', 'Restaurant', 'Spa', 'Beach Access'], 'https://images.unsplash.com/photo-1566073771259-6a8506099945', 4.5),
('Dar El Bhar', 'maison_dhotes', 'Traditional Tunisian guest house with authentic charm', 'Houmt Souk, Djerba', 80.00, 6, ARRAY['summer', 'spring', 'fall'], ARRAY['WiFi', 'Traditional Breakfast', 'Terrace', 'Garden'], 'https://images.unsplash.com/photo-1571896349842-33c89424de2d', 4.7),
('Hotel Hasdrubal Prestige', 'hotel', 'Five-star resort with thalassotherapy center', 'Zone Touristique, Djerba', 200.00, 3, ARRAY['summer', 'winter', 'spring', 'fall'], ARRAY['WiFi', 'Pool', 'Thalasso', 'Beach', 'Kids Club'], 'https://images.unsplash.com/photo-1542314831-068cd1dbfeeb', 4.8),
('Houch El Janna', 'maison_dhotes', 'Charming traditional house with courtyard', 'Midoun, Djerba', 60.00, 4, ARRAY['summer', 'spring', 'fall'], ARRAY['WiFi', 'Breakfast', 'Courtyard', 'Traditional Decor'], 'https://images.unsplash.com/photo-1520250497591-112f2f40a3f4', 4.3),
('Hotel Dar Djerba', 'hotel', 'Boutique hotel blending tradition and modernity', 'Midoun, Djerba', 120.00, 2, ARRAY['summer', 'winter', 'spring', 'fall'], ARRAY['WiFi', 'Pool', 'Restaurant', 'Spa'], 'https://images.unsplash.com/photo-1445991842772-097fea258e7b', 4.4),
('Maison d''Hôtes Ennakhla', 'maison_dhotes', 'Peaceful guesthouse surrounded by palm trees', 'Erriadh, Djerba', 70.00, 5, ARRAY['summer', 'spring', 'fall'], ARRAY['WiFi', 'Garden', 'Traditional Meals', 'Quiet Location'], 'https://images.unsplash.com/photo-1578683010236-d716f9a3f461', 4.6),
('Hotel Seabel Aladin', 'hotel', 'Family-friendly resort with water park', 'Zone Touristique, Djerba', 180.00, 4, ARRAY['summer', 'winter', 'spring'], ARRAY['WiFi', 'Water Park', 'Beach', 'Animation', 'Kids Club'], 'https://images.unsplash.com/photo-1551882547-ff40c63fe5fa', 4.2),
('Dar Dhiafa', 'maison_dhotes', 'Intimate guesthouse with personalized service', 'Houmt Souk, Djerba', 65.00, 3, ARRAY['summer', 'spring', 'fall'], ARRAY['WiFi', 'Breakfast', 'Terrace', 'Local Experience'], 'https://images.unsplash.com/photo-1564501049412-61c2a3083791', 4.5);

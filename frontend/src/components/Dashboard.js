import React, { useState, useEffect, useCallback } from 'react';
import { accommodationService } from '../services/api';
import AccommodationCard from './AccommodationCard';
import Filters from './Filters';

const Dashboard = () => {
  const [accommodations, setAccommodations] = useState([]);
  const [loading, setLoading] = useState(true);
  const [filters, setFilters] = useState({
    type: '',
    season: '',
    minPrice: '',
    maxPrice: '',
    minGuests: '',
    search: ''
  });

  const fetchAccommodations = useCallback(async () => {
    try {
      setLoading(true);
      const data = await accommodationService.getAll(filters);
      setAccommodations(data);
    } catch (error) {
      console.error('Error fetching accommodations:', error);
    } finally {
      setLoading(false);
    }
  }, [filters]);

  useEffect(() => {
    fetchAccommodations();
  }, [fetchAccommodations]);

  const handleFilterChange = (newFilters) => {
    setFilters(newFilters);
  };

  return (
    <div className="dashboard">
      <div className="dashboard-header">
        <h1 className="dashboard-title">Découvrez Djerba</h1>
        <p className="dashboard-subtitle">
          Trouvez l'hébergement parfait pour votre séjour
        </p>
      </div>

      <Filters filters={filters} onFilterChange={handleFilterChange} />

      {loading ? (
        <div className="loading">Chargement...</div>
      ) : accommodations.length > 0 ? (
        <div className="accommodations-grid">
          {accommodations.map((accommodation) => (
            <AccommodationCard
              key={accommodation.id}
              accommodation={accommodation}
            />
          ))}
        </div>
      ) : (
        <div className="no-results">
          <h2 className="no-results-title">Aucun résultat</h2>
          <p className="no-results-text">
            Essayez de modifier vos critères de recherche
          </p>
        </div>
      )}
    </div>
  );
};

export default Dashboard;

import React from 'react';

const Filters = ({ filters, onFilterChange }) => {
  const handleChange = (e) => {
    onFilterChange({
      ...filters,
      [e.target.name]: e.target.value
    });
  };

  return (
    <div className="filters">
      <h2 className="filters-title">Filtrer votre recherche</h2>
      <div className="filters-grid">
        <div className="filter-group">
          <label className="filter-label">Type d'hébergement</label>
          <select
            name="type"
            className="filter-select"
            value={filters.type}
            onChange={handleChange}
          >
            <option value="">Tous</option>
            <option value="hotel">Hôtel</option>
            <option value="maison_dhotes">Maison d'hôtes</option>
          </select>
        </div>

        <div className="filter-group">
          <label className="filter-label">Saison</label>
          <select
            name="season"
            className="filter-select"
            value={filters.season}
            onChange={handleChange}
          >
            <option value="">Toutes saisons</option>
            <option value="summer">Été</option>
            <option value="winter">Hiver</option>
            <option value="spring">Printemps</option>
            <option value="fall">Automne</option>
          </select>
        </div>

        <div className="filter-group">
          <label className="filter-label">Prix minimum (€)</label>
          <input
            type="number"
            name="minPrice"
            className="filter-input"
            value={filters.minPrice}
            onChange={handleChange}
            placeholder="0"
            min="0"
          />
        </div>

        <div className="filter-group">
          <label className="filter-label">Prix maximum (€)</label>
          <input
            type="number"
            name="maxPrice"
            className="filter-input"
            value={filters.maxPrice}
            onChange={handleChange}
            placeholder="500"
            min="0"
          />
        </div>

        <div className="filter-group">
          <label className="filter-label">Nombre de personnes</label>
          <input
            type="number"
            name="minGuests"
            className="filter-input"
            value={filters.minGuests}
            onChange={handleChange}
            placeholder="1"
            min="1"
          />
        </div>

        <div className="filter-group">
          <label className="filter-label">Recherche</label>
          <input
            type="text"
            name="search"
            className="filter-input"
            value={filters.search}
            onChange={handleChange}
            placeholder="Nom ou description..."
          />
        </div>
      </div>
    </div>
  );
};

export default Filters;

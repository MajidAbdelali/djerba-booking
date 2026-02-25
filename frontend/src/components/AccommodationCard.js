import React from 'react';

const AccommodationCard = ({ accommodation }) => {
  const {
    name,
    type,
    description,
    address,
    price_per_night,
    max_guests,
    amenities,
    image_url,
    rating
  } = accommodation;

  const typeLabel = type === 'hotel' ? 'Hôtel' : 'Maison d\'hôtes';

  return (
    <div className="accommodation-card">
      <img
        src={image_url || 'https://via.placeholder.com/400x250'}
        alt={name}
        className="accommodation-image"
      />
      <div className="accommodation-content">
        <div className="accommodation-header">
          <div>
            <h3 className="accommodation-name">{name}</h3>
            <span className={`accommodation-type ${type}`}>{typeLabel}</span>
          </div>
          <div className="accommodation-rating">⭐ {rating}</div>
        </div>
        
        <p className="accommodation-address">📍 {address}</p>
        <p className="accommodation-description">{description}</p>
        
        {amenities && amenities.length > 0 && (
          <div className="accommodation-amenities">
            {amenities.slice(0, 4).map((amenity, index) => (
              <span key={index} className="amenity-tag">
                {amenity}
              </span>
            ))}
          </div>
        )}
        
        <div className="accommodation-footer">
          <div className="accommodation-price">
            {price_per_night}€
            <span className="price-night"> / nuit</span>
          </div>
          <div className="accommodation-guests">
            👥 Jusqu'à {max_guests} personnes
          </div>
        </div>
      </div>
    </div>
  );
};

export default AccommodationCard;

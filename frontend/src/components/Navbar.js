import React from 'react';
import { authService } from '../services/api';

const Navbar = ({ user, onLogout }) => {
  const handleLogout = () => {
    authService.logout();
    onLogout();
  };

  return (
    <nav className="navbar">
      <div className="navbar-brand">🏖️ Djerba Booking</div>
      <div className="navbar-menu">
        {user && (
          <>
            <span className="navbar-user">Bienvenue, {user.name}</span>
            <button className="btn btn-secondary" onClick={handleLogout}>
              Déconnexion
            </button>
          </>
        )}
      </div>
    </nav>
  );
};

export default Navbar;

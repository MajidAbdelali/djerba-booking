# Djerba Booking 🏖️

Une application web complète pour réserver les meilleurs hôtels et maisons d'hôtes à Djerba.

Djerba est une destination unique, et cette application aide à choisir entre le luxe d'un hôtel de zone touristique et l'authenticité d'un Houch (maison d'hôtes traditionnelle).

## Fonctionnalités

- ✅ Authentification utilisateur (inscription/connexion)
- ✅ Recherche et filtrage d'hébergements
- ✅ Filtres par:
  - Type (Hôtel ou Maison d'hôtes)
  - Saison (Été, Hiver, Printemps, Automne)
  - Budget (Prix minimum et maximum)
  - Nombre de personnes
  - Recherche textuelle
- ✅ Affichage des hébergements avec détails (prix, équipements, note)
- ✅ Interface moderne et responsive

## Technologies Utilisées

### Frontend
- **React.js** - Bibliothèque JavaScript pour l'interface utilisateur
- **HTML5 & CSS3** - Structure et style responsive
- **Axios** - Client HTTP pour les appels API

### Backend
- **Node.js** - Environnement d'exécution JavaScript
- **Express.js** - Framework web pour Node.js
- **JWT** - Authentification par tokens
- **bcryptjs** - Hashage sécurisé des mots de passe

### Base de données
- **PostgreSQL** - Base de données relationnelle

## Installation

### Prérequis

- Node.js (version 14 ou supérieure)
- PostgreSQL (version 12 ou supérieure)
- npm ou yarn

### Configuration de la base de données

1. Créez une base de données PostgreSQL:
```bash
createdb djerba_booking
```

2. Importez le schéma de la base de données:
```bash
psql -d djerba_booking -f backend/schema.sql
```

### Installation du Backend

1. Accédez au dossier backend:
```bash
cd backend
```

2. Installez les dépendances:
```bash
npm install
```

3. Créez un fichier `.env` basé sur `.env.example`:
```bash
cp .env.example .env
```

4. Modifiez le fichier `.env` avec vos configurations:
```
PORT=5000
DB_HOST=localhost
DB_PORT=5432
DB_USER=postgres
DB_PASSWORD=votre_mot_de_passe
DB_NAME=djerba_booking
JWT_SECRET=votre_secret_jwt
```

5. Démarrez le serveur:
```bash
npm start
```

Le serveur backend sera accessible sur `http://localhost:5000`

### Installation du Frontend

1. Accédez au dossier frontend:
```bash
cd frontend
```

2. Installez les dépendances:
```bash
npm install
```

3. Démarrez l'application React:
```bash
npm start
```

L'application frontend sera accessible sur `http://localhost:3000`

## Utilisation

1. **Inscription**: Créez un compte avec votre email et mot de passe
2. **Connexion**: Connectez-vous avec vos identifiants
3. **Recherche**: Utilisez les filtres pour trouver l'hébergement parfait:
   - Choisissez entre hôtel ou maison d'hôtes
   - Sélectionnez la saison de votre séjour
   - Définissez votre budget
   - Indiquez le nombre de personnes
4. **Réservation**: Consultez les détails des hébergements disponibles

## Structure du Projet

```
djerba-booking/
├── backend/
│   ├── config/
│   │   └── db.js              # Configuration PostgreSQL
│   ├── middleware/
│   │   └── auth.js            # Middleware d'authentification
│   ├── routes/
│   │   ├── auth.js            # Routes d'authentification
│   │   └── accommodations.js # Routes des hébergements
│   ├── .env.example           # Template de configuration
│   ├── package.json
│   ├── schema.sql             # Schéma de la base de données
│   └── server.js              # Point d'entrée du serveur
├── frontend/
│   ├── public/
│   │   └── index.html
│   ├── src/
│   │   ├── components/
│   │   │   ├── AccommodationCard.js
│   │   │   ├── Dashboard.js
│   │   │   ├── Filters.js
│   │   │   ├── Login.js
│   │   │   └── Navbar.js
│   │   ├── services/
│   │   │   └── api.js         # Services API
│   │   ├── App.css            # Styles de l'application
│   │   ├── App.js             # Composant principal
│   │   └── index.js
│   └── package.json
└── README.md
```

## API Endpoints

### Authentication
- `POST /api/auth/register` - Inscription
- `POST /api/auth/login` - Connexion

### Accommodations
- `GET /api/accommodations` - Liste des hébergements (avec filtres)
- `GET /api/accommodations/:id` - Détails d'un hébergement
- `POST /api/accommodations/bookings` - Créer une réservation (authentifié)
- `GET /api/accommodations/bookings/my-bookings` - Mes réservations (authentifié)

## Données d'exemple

La base de données est pré-remplie avec 8 hébergements variés:
- 4 hôtels (de luxe, resorts, boutique)
- 4 maisons d'hôtes traditionnelles

## Contribution

Les contributions sont les bienvenues! N'hésitez pas à ouvrir une issue ou un pull request.

## Licence

ISC

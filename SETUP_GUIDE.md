# Guide de Configuration et de Test

## Configuration rapide

### 1. Base de données PostgreSQL

```bash
# Créer la base de données
createdb djerba_booking

# Importer le schéma et les données
psql -d djerba_booking -f backend/schema.sql
```

### 2. Backend

```bash
cd backend
npm install
cp .env.example .env
# Éditez .env avec vos paramètres PostgreSQL
npm start
```

Le serveur backend démarre sur http://localhost:5000

### 3. Frontend

```bash
cd frontend
npm install
npm start
```

L'application frontend démarre sur http://localhost:3000

## Test de l'application

### 1. Test de l'authentification

1. Ouvrez http://localhost:3000
2. Cliquez sur "S'inscrire"
3. Créez un compte avec:
   - Nom: Test User
   - Email: test@example.com
   - Mot de passe: password123
4. Vous serez automatiquement connecté

### 2. Test des filtres

Une fois connecté, testez les différents filtres:

- **Type d'hébergement**: Sélectionnez "Hôtel" ou "Maison d'hôtes"
- **Saison**: Choisissez une saison (Été, Hiver, etc.)
- **Budget**: 
  - Prix minimum: 50
  - Prix maximum: 150
- **Nombre de personnes**: 4
- **Recherche**: Tapez "traditional" ou "beach"

### 3. Vérification des résultats

L'application devrait afficher:
- Des cartes d'hébergement avec images
- Prix par nuit
- Note (étoiles)
- Type d'hébergement
- Équipements disponibles
- Capacité en nombre de personnes

## Tests API (avec curl)

### Test de connexion
```bash
curl -X POST http://localhost:5000/api/auth/login \
  -H "Content-Type: application/json" \
  -d '{"email":"test@example.com","password":"password123"}'
```

### Test de récupération des hébergements
```bash
curl http://localhost:5000/api/accommodations
```

### Test de filtrage
```bash
# Filtrer par type
curl "http://localhost:5000/api/accommodations?type=hotel"

# Filtrer par prix
curl "http://localhost:5000/api/accommodations?minPrice=50&maxPrice=150"

# Filtrer par saison
curl "http://localhost:5000/api/accommodations?season=summer"
```

## Dépannage

### Erreur de connexion à PostgreSQL
- Vérifiez que PostgreSQL est en cours d'exécution
- Vérifiez les paramètres dans .env
- Assurez-vous que la base de données existe

### Le frontend ne peut pas se connecter au backend
- Vérifiez que le backend est en cours d'exécution sur le port 5000
- Vérifiez le proxy dans frontend/package.json

### Erreurs d'installation npm
- Supprimez node_modules et package-lock.json
- Réessayez npm install

## Fonctionnalités implémentées

✅ Authentification (inscription/connexion)
✅ JWT pour la sécurité
✅ Filtrage par type, saison, prix, nombre de personnes
✅ Recherche textuelle
✅ Interface responsive
✅ 8 hébergements de démonstration pré-chargés
✅ Base de données PostgreSQL complète

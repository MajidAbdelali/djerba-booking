# 🏖️ Comment lancer Djerba Booking

## 📋 Table des matières

1. [Méthode Ultra-Rapide (Docker)](#méthode-1-docker---ultra-rapide-)
2. [Méthode avec Scripts (Facile)](#méthode-2-avec-scripts---facile-)
3. [Méthode Manuelle (Contrôle Total)](#méthode-3-manuelle---contrôle-total-)
4. [FAQ & Dépannage](#-faq--dépannage)

---

## Méthode 1: Docker - Ultra Rapide! 🚀

**Temps: 2 minutes**

### Étape unique:

```bash
docker-compose up
```

### Résultat:
✅ Base de données créée et peuplée  
✅ Backend démarré sur http://localhost:5000  
✅ Frontend démarré sur http://localhost:3000

### Ouvrir l'app:
👉 **http://localhost:3000**

---

## Méthode 2: Avec Scripts - Facile! 🛠️

**Temps: 5 minutes**  
**Prérequis:** Node.js 14+ et PostgreSQL 12+

### Étape 1: Setup automatique

```bash
./setup.sh
```

Ce script va:
- ✅ Vérifier vos dépendances
- ✅ Créer la base de données
- ✅ Importer les données de démo
- ✅ Installer toutes les dépendances npm

### Étape 2: Lancer le backend

**Terminal 1:**
```bash
./start-backend.sh
```

Vous verrez:
```
✅ Starting backend server on http://localhost:5000
Server is running on port 5000
Connected to PostgreSQL database
```

### Étape 3: Lancer le frontend

**Terminal 2:**
```bash
./start-frontend.sh
```

Vous verrez:
```
✅ Starting frontend application on http://localhost:3000
Compiled successfully!
```

### Ouvrir l'app:
👉 **http://localhost:3000**

---

## Méthode 3: Manuelle - Contrôle Total! 🔧

**Temps: 10 minutes**  
**Prérequis:** Node.js 14+ et PostgreSQL 12+

### Étape 1: Base de données

```bash
# Créer la base de données
createdb djerba_booking

# Importer le schéma et les données
psql -d djerba_booking -f backend/schema.sql
```

### Étape 2: Backend

**Terminal 1:**
```bash
cd backend

# Installer les dépendances
npm install

# Configurer l'environnement
cp .env.example .env

# IMPORTANT: Éditer .env avec vos paramètres
nano .env  # ou votre éditeur préféré

# Démarrer le serveur
npm start
```

Paramètres à configurer dans `.env`:
```
DB_HOST=localhost
DB_PORT=5432
DB_USER=postgres
DB_PASSWORD=votre_mot_de_passe
DB_NAME=djerba_booking
JWT_SECRET=votre_secret_unique_ici
```

### Étape 3: Frontend

**Terminal 2:**
```bash
cd frontend

# Installer les dépendances
npm install

# Démarrer l'application
npm start
```

### Ouvrir l'app:
👉 **http://localhost:3000**

---

## 🎯 Premier Test

Une fois l'application lancée:

### 1. Créer un compte
- Cliquez sur **"S'inscrire"**
- Remplissez le formulaire:
  - Nom: `Test User`
  - Email: `test@example.com`
  - Mot de passe: `password123`
- Cliquez sur **"S'inscrire"**

### 2. Explorer les hébergements
Vous verrez **8 hébergements** pré-chargés:
- 🏨 4 Hôtels (Hotel Djerba Plaza, Hasdrubal Prestige, etc.)
- 🏠 4 Maisons d'hôtes (Dar El Bhar, Houch El Janna, etc.)

### 3. Tester les filtres
- **Type:** Hôtel / Maison d'hôtes
- **Saison:** Été, Hiver, Printemps, Automne
- **Prix:** Min 50€, Max 200€
- **Personnes:** 2, 4, 6...
- **Recherche:** "beach", "traditional", etc.

---

## 🛑 Arrêter l'Application

### Docker:
```bash
docker-compose down
```

### Scripts/Manuel:
Appuyez sur `Ctrl+C` dans chaque terminal

---

## ❓ FAQ & Dépannage

### Q: Le port 3000 est déjà utilisé

**Solution:**
```bash
# Changer le port du frontend
cd frontend
PORT=3001 npm start
```

### Q: Le port 5000 est déjà utilisé

**Solution:**
Éditer `backend/.env`:
```
PORT=5001
```

### Q: Erreur de connexion PostgreSQL

**Vérifier que PostgreSQL est lancé:**
```bash
# Linux
sudo systemctl status postgresql
sudo systemctl start postgresql

# MacOS
brew services list
brew services start postgresql
```

**Vérifier vos credentials dans `backend/.env`:**
```
DB_USER=postgres
DB_PASSWORD=votre_mot_de_passe
```

### Q: "Module not found" ou erreurs npm

**Solution:**
```bash
# Backend
cd backend
rm -rf node_modules package-lock.json
npm install

# Frontend
cd frontend
rm -rf node_modules package-lock.json
npm install
```

### Q: La base de données est vide

**Réimporter les données:**
```bash
psql -d djerba_booking -f backend/schema.sql
```

### Q: Erreur "JWT_SECRET is not set"

**Solution:**
Éditer `backend/.env` et ajouter:
```
JWT_SECRET=mon_secret_super_securise_changez_moi
```

Ou générer un secret aléatoire:
```bash
node -e "console.log(require('crypto').randomBytes(32).toString('hex'))"
```

---

## 📚 Documentation Complète

- **[README.md](README.md)** - Documentation technique complète
- **[SETUP_GUIDE.md](SETUP_GUIDE.md)** - Guide de configuration détaillé
- **[PROJECT_SUMMARY.md](PROJECT_SUMMARY.md)** - Résumé du projet

---

## 🎉 Vous êtes prêt!

L'application devrait maintenant fonctionner sur **http://localhost:3000**

Bon développement! 🚀

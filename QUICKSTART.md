# 🚀 QUICKSTART - Djerba Booking

## Lancer l'application en 1 minute

### Méthode 1: Docker (Le plus simple - RECOMMANDÉ)

```bash
docker-compose up
```

**C'est tout!** Ouvrez http://localhost:3000

---

### Méthode 2: Installation manuelle en 3 étapes

#### Étape 1: Base de données

**Option A - Ligne de commande:**
```bash
./setup-database.sh
```

**Option B - Interface graphique pgAdmin:**
Voir le guide complet → **[PGADMIN_SETUP.md](PGADMIN_SETUP.md)** 🗄️

#### Étape 2: Backend (Terminal 1)
```bash
./start-backend.sh
```

#### Étape 3: Frontend (Terminal 2)
```bash
./start-frontend.sh
```

**Ouvrez http://localhost:3000**

---

## 🎯 Premier test

1. **Créer un compte**
   - Cliquez sur "S'inscrire"
   - Nom: Test User
   - Email: test@example.com
   - Mot de passe: password123

2. **Chercher des hébergements**
   - Utilisez les filtres:
     - Type: Hôtel ou Maison d'hôtes
     - Saison: Été, Hiver, etc.
     - Prix: 50€ - 200€
     - Nombre de personnes: 2-6

3. **Explorer**
   - 8 hébergements de démonstration disponibles
   - 4 hôtels de luxe
   - 4 maisons d'hôtes traditionnelles

---

## ❓ Problèmes courants

### Port 3000 déjà utilisé?
```bash
# Changer le port du frontend
cd frontend
PORT=3001 npm start
```

### Port 5000 déjà utilisé?
```bash
# Éditer backend/.env
PORT=5001
```

### Base de données ne se connecte pas?
```bash
# Vérifier PostgreSQL
sudo systemctl status postgresql  # Linux
brew services list                 # MacOS

# Éditer backend/.env avec vos credentials
DB_USER=votre_utilisateur
DB_PASSWORD=votre_mot_de_passe
```

---

## 📚 Documentation complète

- **README.md** - Documentation complète
- **SETUP_GUIDE.md** - Guide détaillé de configuration
- **PROJECT_SUMMARY.md** - Résumé du projet

---

## 🛑 Arrêter l'application

**Docker:**
```bash
docker-compose down
```

**Manuel:**
- Appuyez sur `Ctrl+C` dans chaque terminal

---

## 🔧 Prérequis

- **Docker:** Docker et Docker Compose (pour Méthode 1)
- **Manuel:** Node.js 14+ et PostgreSQL 12+ (pour Méthode 2)

---

**Besoin d'aide?** Consultez SETUP_GUIDE.md pour plus de détails.

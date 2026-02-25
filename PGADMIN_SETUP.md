# 🗄️ Configuration de la Base de Données avec pgAdmin

## Guide Étape par Étape

Ce guide vous explique comment configurer la base de données PostgreSQL pour l'application Djerba Booking en utilisant **pgAdmin**, l'interface graphique de PostgreSQL.

---

## 📋 Prérequis

Avant de commencer, assurez-vous d'avoir installé:

1. **PostgreSQL** (version 12 ou supérieure)
   - Windows: [Télécharger PostgreSQL](https://www.postgresql.org/download/windows/)
   - MacOS: `brew install postgresql`
   - Linux: `sudo apt-get install postgresql postgresql-contrib`

2. **pgAdmin 4** (inclus avec PostgreSQL)
   - Normalement installé automatiquement avec PostgreSQL
   - Ou télécharger séparément: [pgAdmin Download](https://www.pgadmin.org/download/)

3. **Mot de passe PostgreSQL**
   - Défini lors de l'installation de PostgreSQL
   - Généralement pour l'utilisateur `postgres`

---

## 🚀 Étape 1: Lancer pgAdmin

1. **Ouvrir pgAdmin 4**
   - Windows: Menu Démarrer → pgAdmin 4
   - MacOS: Applications → pgAdmin 4
   - Linux: Dans le menu d'applications ou `pgadmin4`

2. **Première connexion**
   - pgAdmin s'ouvre dans votre navigateur web
   - URL: `http://127.0.0.1:xxxxx/browser/`
   - Définissez un mot de passe maître pour pgAdmin (si demandé)

3. **Se connecter au serveur PostgreSQL**
   - Dans le panneau de gauche, cliquez sur **"Servers"**
   - Cliquez sur **"PostgreSQL XX"** (où XX est votre version)
   - Entrez le mot de passe de l'utilisateur `postgres`
   - ✅ Le serveur devrait maintenant être connecté (icône verte)

---

## 🗃️ Étape 2: Créer la Base de Données

1. **Clic droit sur "Databases"**
   - Dans le panneau de gauche
   - Sous votre serveur PostgreSQL
   - Sélectionnez **"Create" → "Database..."**

2. **Configurer la nouvelle base de données**
   
   **Onglet "General":**
   - **Database:** `djerba_booking`
   - **Owner:** `postgres` (ou votre utilisateur)
   - **Comment:** `Base de données pour l'application Djerba Booking` (optionnel)
   
   **Onglet "Definition":**
   - **Encoding:** `UTF8`
   - **Template:** `template0`
   - **Collation:** `en_US.UTF-8` (ou votre locale)
   - **Character type:** `en_US.UTF-8` (ou votre locale)

3. **Cliquer sur "Save"**
   - ✅ La base de données `djerba_booking` apparaît maintenant dans la liste

---

## 📊 Étape 3: Importer le Schéma et les Données

### Méthode 1: Utiliser l'Outil Query (Recommandé)

1. **Ouvrir l'éditeur de requêtes**
   - Clic droit sur la base de données `djerba_booking`
   - Sélectionnez **"Query Tool"** (Outil de requête)
   - Une nouvelle fenêtre s'ouvre avec un éditeur SQL

2. **Ouvrir le fichier schema.sql**
   - Dans l'éditeur de requêtes
   - Cliquez sur l'icône **"Open File"** (dossier ouvert) 📁
   - Ou: Menu **"File" → "Open"**
   - Naviguez vers: `backend/schema.sql`
   - Sélectionnez le fichier et cliquez "Open"

3. **Vérifier le contenu**
   - Le fichier SQL devrait apparaître dans l'éditeur
   - Vous devriez voir:
     - CREATE TABLE users
     - CREATE TABLE accommodations
     - CREATE TABLE bookings
     - INSERT INTO accommodations (8 lignes de données)

4. **Exécuter le script**
   - Cliquez sur le bouton **"Execute/Refresh"** (▶️) ou `F5`
   - Attendez quelques secondes
   - ✅ Vous devriez voir un message de succès en bas

5. **Vérifier les résultats**
   - Dans l'onglet "Messages" en bas:
     - `CREATE TABLE` (3 fois)
     - `INSERT 0 8` (8 hébergements insérés)
   - ✅ Si vous voyez ces messages, tout est OK!

### Méthode 2: Copier-Coller (Alternative)

1. **Ouvrir le fichier schema.sql**
   - Avec un éditeur de texte (VS Code, Notepad++, etc.)
   - Chemin: `backend/schema.sql`

2. **Copier tout le contenu**
   - `Ctrl+A` pour tout sélectionner
   - `Ctrl+C` pour copier

3. **Coller dans Query Tool**
   - Retournez dans pgAdmin Query Tool
   - `Ctrl+V` pour coller
   - Cliquez sur **"Execute/Refresh"** (▶️)

---

## 🔍 Étape 4: Vérifier les Tables et les Données

1. **Rafraîchir la base de données**
   - Clic droit sur `djerba_booking`
   - Sélectionnez **"Refresh"**

2. **Voir les tables**
   - Développez: `djerba_booking` → `Schemas` → `public` → `Tables`
   - Vous devriez voir 3 tables:
     - ✅ `accommodations`
     - ✅ `bookings`
     - ✅ `users`

3. **Vérifier les données d'exemple**
   
   **Option A: Interface graphique**
   - Clic droit sur la table `accommodations`
   - Sélectionnez **"View/Edit Data" → "All Rows"**
   - ✅ Vous devriez voir 8 hébergements (4 hôtels + 4 maisons d'hôtes)

   **Option B: Requête SQL**
   - Dans Query Tool, exécutez:
   ```sql
   SELECT * FROM accommodations;
   ```
   - ✅ Vous devriez voir 8 lignes de résultats

4. **Vérifier la structure**
   - Clic droit sur une table → **"Properties"**
   - Onglet **"Columns"**: voir toutes les colonnes
   - Onglet **"Constraints"**: voir les clés primaires/étrangères

---

## ⚙️ Étape 5: Configurer le Backend

1. **Ouvrir le fichier .env.example**
   - Chemin: `backend/.env.example`
   - Avec votre éditeur de code

2. **Créer le fichier .env**
   - Copiez `backend/.env.example` → `backend/.env`
   - Ou créez un nouveau fichier `backend/.env`

3. **Configurer les paramètres de connexion**
   
   Éditez `backend/.env` avec vos informations:

   ```env
   PORT=5000
   DB_HOST=localhost
   DB_PORT=5432
   DB_USER=postgres
   DB_PASSWORD=votre_mot_de_passe_postgresql
   DB_NAME=djerba_booking
   JWT_SECRET=votre_secret_jwt_unique
   ```

   **Important:**
   - `DB_PASSWORD`: Le mot de passe que vous utilisez dans pgAdmin
   - `DB_USER`: Généralement `postgres`, sauf si vous avez créé un autre utilisateur
   - `DB_PORT`: 5432 par défaut (vérifiez dans pgAdmin si différent)
   - `JWT_SECRET`: Générez un secret unique (voir ci-dessous)

4. **Générer un JWT_SECRET sécurisé**
   
   Ouvrez un terminal et exécutez:
   ```bash
   node -e "console.log(require('crypto').randomBytes(32).toString('hex'))"
   ```
   
   Copiez le résultat dans `JWT_SECRET`

5. **Sauvegarder le fichier .env**
   - `Ctrl+S` ou File → Save
   - ✅ Le backend est maintenant configuré!

---

## 🎯 Étape 6: Vérifier la Connexion

### Test depuis pgAdmin

1. **Ouvrir Query Tool** sur `djerba_booking`

2. **Tester une requête simple:**
   ```sql
   SELECT COUNT(*) FROM accommodations;
   ```
   - Résultat attendu: `8`

3. **Tester une requête complexe:**
   ```sql
   SELECT name, type, price_per_night 
   FROM accommodations 
   WHERE type = 'hotel' 
   ORDER BY price_per_night DESC;
   ```
   - Vous devriez voir 4 hôtels classés par prix

### Test depuis l'Application

1. **Installer les dépendances du backend**
   ```bash
   cd backend
   npm install
   ```

2. **Démarrer le serveur backend**
   ```bash
   npm start
   ```

3. **Vérifier la connexion**
   - Vous devriez voir dans le terminal:
   ```
   Server is running on port 5000
   Connected to PostgreSQL database
   ```
   - ✅ Si vous voyez "Connected to PostgreSQL database", c'est parfait!

4. **Tester l'API**
   - Ouvrez votre navigateur
   - Allez sur: `http://localhost:5000/api/accommodations`
   - Vous devriez voir les 8 hébergements en format JSON

---

## 🛠️ Dépannage

### ❌ "Password authentication failed for user postgres"

**Problème:** Mot de passe incorrect

**Solution:**
1. Dans pgAdmin, clic droit sur le serveur → **"Properties"**
2. Onglet **"Connection"**, vérifiez le mot de passe
3. Mettez à jour `DB_PASSWORD` dans `backend/.env`

### ❌ "Database djerba_booking does not exist"

**Problème:** Base de données non créée

**Solution:**
1. Vérifiez dans pgAdmin que `djerba_booking` existe
2. Si non, recommencez l'Étape 2

### ❌ "Connection refused on port 5432"

**Problème:** PostgreSQL n'est pas démarré

**Solution:**
```bash
# Windows
# Services → PostgreSQL → Démarrer

# MacOS
brew services start postgresql

# Linux
sudo systemctl start postgresql
```

### ❌ "relation accommodations does not exist"

**Problème:** Les tables n'ont pas été créées

**Solution:**
1. Recommencez l'Étape 3
2. Vérifiez qu'il n'y a pas d'erreurs dans Query Tool
3. Rafraîchissez la base de données dans pgAdmin

### ❌ Les données ne s'affichent pas dans l'API

**Problème:** Backend ne se connecte pas à la DB

**Solution:**
1. Vérifiez `backend/.env`:
   - DB_HOST=localhost
   - DB_PORT=5432
   - DB_USER=postgres
   - DB_PASSWORD=correct
   - DB_NAME=djerba_booking
2. Redémarrez le serveur backend
3. Vérifiez les logs dans le terminal

---

## 📝 Informations Utiles

### Voir les informations du serveur PostgreSQL

1. Dans pgAdmin, clic droit sur le serveur
2. Sélectionnez **"Properties"**
3. Onglet **"Connection"**:
   - **Host:** localhost
   - **Port:** 5432 (généralement)
   - **Username:** postgres

### Sauvegarder la base de données

1. Clic droit sur `djerba_booking`
2. **"Backup..."**
3. Choisir un nom et un emplacement
4. Format: **"Plain"** ou **"Custom"**
5. Cliquer **"Backup"**

### Restaurer une sauvegarde

1. Clic droit sur `djerba_booking`
2. **"Restore..."**
3. Sélectionner le fichier de sauvegarde
4. Cliquer **"Restore"**

### Supprimer et recommencer

Si vous voulez tout recommencer:

1. Clic droit sur `djerba_booking`
2. **"Delete/Drop"**
3. Cocher **"Cascade"**
4. Recommencez depuis l'Étape 2

---

## ✅ Résumé des Étapes

1. ✅ Installer PostgreSQL et pgAdmin
2. ✅ Lancer pgAdmin et se connecter
3. ✅ Créer la base de données `djerba_booking`
4. ✅ Importer le schéma avec Query Tool
5. ✅ Vérifier les 3 tables et 8 données
6. ✅ Configurer `backend/.env`
7. ✅ Tester la connexion

---

## 🚀 Prochaines Étapes

Une fois la base de données configurée:

1. **Démarrer le backend:**
   ```bash
   cd backend
   npm install
   npm start
   ```

2. **Démarrer le frontend:**
   ```bash
   cd frontend
   npm install
   npm start
   ```

3. **Ouvrir l'application:**
   - http://localhost:3000

---

## 📚 Voir Aussi

- [QUICKSTART.md](QUICKSTART.md) - Guide de démarrage rapide
- [HOW_TO_RUN.md](HOW_TO_RUN.md) - Guide complet d'exécution
- [README.md](README.md) - Documentation principale
- [SETUP_GUIDE.md](SETUP_GUIDE.md) - Guide de configuration détaillé

---

**Besoin d'aide?** Consultez la section Dépannage ci-dessus ou les autres guides de documentation.

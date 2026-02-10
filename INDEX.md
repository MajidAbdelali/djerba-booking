# 📚 Djerba Booking - Documentation Index

## 🎯 "How to Run It" - Quick Answer

Choose your preferred method:

1. **🚀 Fastest (Docker):** → [QUICKSTART.md](QUICKSTART.md)
2. **🛠️ Easy (Scripts):** → [HOW_TO_RUN.md](HOW_TO_RUN.md)
3. **🔧 Manual:** → [README.md](README.md#quick-start)

---

## 📖 All Documentation

### Getting Started
| Document | Purpose | Best For |
|----------|---------|----------|
| [QUICKSTART.md](QUICKSTART.md) | 1-minute fast start | Quick setup |
| [HOW_TO_RUN.md](HOW_TO_RUN.md) | Complete guide | Step-by-step |
| [RUN_INSTRUCTIONS.txt](RUN_INSTRUCTIONS.txt) | Command reference | Quick lookup |

### Detailed Information
| Document | Purpose | Best For |
|----------|---------|----------|
| [README.md](README.md) | Full documentation | Complete overview |
| [SETUP_GUIDE.md](SETUP_GUIDE.md) | Setup & testing | Developers |
| [PROJECT_SUMMARY.md](PROJECT_SUMMARY.md) | Project overview | Understanding features |
| [RUN_SOLUTION_SUMMARY.md](RUN_SOLUTION_SUMMARY.md) | Solution details | Implementation overview |

---

## 🛠️ Helper Scripts

| Script | Purpose | Usage |
|--------|---------|-------|
| `setup.sh` | Complete setup | `./setup.sh` |
| `setup-database.sh` | Database only | `./setup-database.sh` |
| `start-backend.sh` | Start backend | `./start-backend.sh` |
| `start-frontend.sh` | Start frontend | `./start-frontend.sh` |

All scripts are executable and include helpful output messages.

---

## 🚀 Quick Commands

### Docker Method
```bash
docker-compose up
# Open http://localhost:3000
```

### Scripts Method
```bash
./setup.sh              # One time
./start-backend.sh      # Terminal 1
./start-frontend.sh     # Terminal 2
# Open http://localhost:3000
```

### Manual Method
```bash
# Database
createdb djerba_booking
psql -d djerba_booking -f backend/schema.sql

# Backend (Terminal 1)
cd backend && npm install && npm start

# Frontend (Terminal 2)
cd frontend && npm install && npm start
# Open http://localhost:3000
```

---

## 🔍 Find What You Need

**Want to run quickly?**
→ [QUICKSTART.md](QUICKSTART.md)

**Need detailed steps?**
→ [HOW_TO_RUN.md](HOW_TO_RUN.md)

**Having problems?**
→ [HOW_TO_RUN.md - FAQ Section](HOW_TO_RUN.md#-faq--dépannage)

**Want to understand the code?**
→ [PROJECT_SUMMARY.md](PROJECT_SUMMARY.md)

**Need to test features?**
→ [SETUP_GUIDE.md](SETUP_GUIDE.md)

**Looking for API endpoints?**
→ [README.md - API Section](README.md#api-endpoints)

---

## 📊 Project Stats

- **Lines of Code:** 1,300+
- **Technologies:** React.js, Node.js, PostgreSQL
- **Sample Data:** 8 accommodations pre-loaded
- **Documentation Files:** 7
- **Helper Scripts:** 4
- **API Endpoints:** 6

---

## ✅ First Steps After Running

1. Open **http://localhost:3000**
2. Click **"S'inscrire"** (Register)
3. Use test account:
   - Email: `test@example.com`
   - Password: `password123`
4. Browse accommodations
5. Try filters

---

## 🆘 Need Help?

1. Check [HOW_TO_RUN.md - FAQ](HOW_TO_RUN.md#-faq--dépannage)
2. Check [SETUP_GUIDE.md - Troubleshooting](SETUP_GUIDE.md#dépannage)
3. Review [README.md](README.md) for complete docs

---

## 📁 Repository Structure

```
djerba-booking/
├── 📖 Documentation
│   ├── README.md
│   ├── QUICKSTART.md
│   ├── HOW_TO_RUN.md
│   ├── SETUP_GUIDE.md
│   ├── PROJECT_SUMMARY.md
│   ├── RUN_SOLUTION_SUMMARY.md
│   └── RUN_INSTRUCTIONS.txt
├── 🛠️ Scripts
│   ├── setup.sh
│   ├── setup-database.sh
│   ├── start-backend.sh
│   └── start-frontend.sh
├── 🔧 Backend
│   ├── config/
│   ├── middleware/
│   ├── routes/
│   ├── server.js
│   └── schema.sql
├── 🎨 Frontend
│   ├── src/
│   │   ├── components/
│   │   ├── services/
│   │   └── App.js
│   └── public/
└── 🐳 Docker
    └── docker-compose.yml
```

---

**Made with ❤️ for easy setup and deployment!**

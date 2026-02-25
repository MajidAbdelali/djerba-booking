#!/bin/bash

# All-in-one script to setup and run Djerba Booking application

echo "╔════════════════════════════════════════════════════════╗"
echo "║       🏖️  Djerba Booking - Setup & Start             ║"
echo "╚════════════════════════════════════════════════════════╝"
echo ""

# Function to check if a command exists
command_exists() {
    command -v "$1" >/dev/null 2>&1
}

# Check prerequisites
echo "📋 Checking prerequisites..."
echo ""

MISSING_DEPS=0

if ! command_exists node; then
    echo "❌ Node.js is not installed"
    MISSING_DEPS=1
else
    NODE_VERSION=$(node -v)
    echo "✅ Node.js: $NODE_VERSION"
fi

if ! command_exists npm; then
    echo "❌ npm is not installed"
    MISSING_DEPS=1
else
    NPM_VERSION=$(npm -v)
    echo "✅ npm: $NPM_VERSION"
fi

if ! command_exists psql; then
    echo "❌ PostgreSQL is not installed"
    MISSING_DEPS=1
else
    PSQL_VERSION=$(psql --version | cut -d' ' -f3)
    echo "✅ PostgreSQL: $PSQL_VERSION"
fi

echo ""

if [ $MISSING_DEPS -eq 1 ]; then
    echo "❌ Missing dependencies. Please install them first:"
    echo ""
    echo "   Ubuntu/Debian:"
    echo "   sudo apt-get install nodejs npm postgresql"
    echo ""
    echo "   MacOS:"
    echo "   brew install node postgresql"
    echo ""
    echo "   Or use Docker instead:"
    echo "   docker-compose up"
    echo ""
    exit 1
fi

# Setup database
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "Step 1/3: Setting up database"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""

./setup-database.sh

if [ $? -ne 0 ]; then
    echo "❌ Database setup failed. Please check the errors above."
    exit 1
fi

# Setup backend
echo ""
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "Step 2/3: Setting up backend"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""

cd backend

if [ ! -f ".env" ]; then
    echo "⚙️  Creating .env file..."
    cp .env.example .env
    echo "✅ .env file created with default settings"
fi

if [ ! -d "node_modules" ]; then
    echo "📦 Installing backend dependencies..."
    npm install --silent
    echo "✅ Backend dependencies installed"
else
    echo "✅ Backend dependencies already installed"
fi

cd ..

# Setup frontend
echo ""
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "Step 3/3: Setting up frontend"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""

cd frontend

if [ ! -d "node_modules" ]; then
    echo "📦 Installing frontend dependencies..."
    npm install --silent
    echo "✅ Frontend dependencies installed"
else
    echo "✅ Frontend dependencies already installed"
fi

cd ..

# Final instructions
echo ""
echo "╔════════════════════════════════════════════════════════╗"
echo "║           ✅ Setup Complete!                          ║"
echo "╚════════════════════════════════════════════════════════╝"
echo ""
echo "🚀 To start the application, run these commands in separate terminals:"
echo ""
echo "   Terminal 1 (Backend):"
echo "   ./start-backend.sh"
echo ""
echo "   Terminal 2 (Frontend):"
echo "   ./start-frontend.sh"
echo ""
echo "   Then open: http://localhost:3000"
echo ""
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "📝 Note: You can also use Docker:"
echo "   docker-compose up"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""

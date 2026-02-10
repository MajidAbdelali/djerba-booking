#!/bin/bash

# Script to start the backend server for Djerba Booking

echo "🚀 Starting Djerba Booking Backend Server..."
echo ""

# Check if we're in the right directory
if [ ! -f "backend/package.json" ]; then
    echo "❌ Please run this script from the project root directory"
    exit 1
fi

cd backend

# Check if .env exists
if [ ! -f ".env" ]; then
    echo "⚙️  Creating .env file from .env.example..."
    cp .env.example .env
    echo "⚠️  Please edit backend/.env with your PostgreSQL credentials"
    echo "   Default settings:"
    echo "   - DB_HOST=localhost"
    echo "   - DB_USER=postgres"
    echo "   - DB_PASSWORD=postgres"
    echo "   - DB_NAME=djerba_booking"
    echo ""
    read -p "Press Enter to continue once you've updated .env..."
fi

# Check if node_modules exists
if [ ! -d "node_modules" ]; then
    echo "📦 Installing dependencies..."
    npm install
    echo ""
fi

echo "✅ Starting backend server on http://localhost:5000"
echo "   Press Ctrl+C to stop"
echo ""

npm start

#!/bin/bash

# Script to start the frontend app for Djerba Booking

echo "🎨 Starting Djerba Booking Frontend..."
echo ""

# Check if we're in the right directory
if [ ! -f "frontend/package.json" ]; then
    echo "❌ Please run this script from the project root directory"
    exit 1
fi

cd frontend

# Check if node_modules exists
if [ ! -d "node_modules" ]; then
    echo "📦 Installing dependencies..."
    npm install
    echo ""
fi

echo "✅ Starting frontend application on http://localhost:3000"
echo "   Your browser should open automatically"
echo "   Press Ctrl+C to stop"
echo ""

npm start

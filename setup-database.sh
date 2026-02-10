#!/bin/bash

# Script to setup the PostgreSQL database for Djerba Booking

echo "🗄️  Setting up Djerba Booking Database..."
echo ""

# Check if PostgreSQL is installed
if ! command -v psql &> /dev/null; then
    echo "❌ PostgreSQL is not installed. Please install it first."
    echo "   Ubuntu/Debian: sudo apt-get install postgresql"
    echo "   MacOS: brew install postgresql"
    exit 1
fi

# Create database
echo "📦 Creating database 'djerba_booking'..."
createdb djerba_booking 2>/dev/null
if [ $? -eq 0 ]; then
    echo "✅ Database created successfully"
else
    echo "⚠️  Database may already exist, continuing..."
fi

# Import schema
echo "📊 Importing schema and sample data..."
psql -d djerba_booking -f backend/schema.sql

if [ $? -eq 0 ]; then
    echo ""
    echo "✅ Database setup complete!"
    echo ""
    echo "🎉 Your database is ready with 8 sample accommodations:"
    echo "   - 4 Hotels"
    echo "   - 4 Maisons d'hôtes"
    echo ""
else
    echo "❌ Failed to import schema. Please check your PostgreSQL installation."
    exit 1
fi

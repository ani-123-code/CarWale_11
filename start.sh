#!/bin/bash

echo "🚗 Starting Carwale Application..."
echo ""

# Check if MongoDB is running
if ! pgrep -x "mongod" > /dev/null; then
    echo "❌ MongoDB is not running!"
    echo "Starting MongoDB..."
    mkdir -p /data/db
    mongod --fork --logpath /var/log/mongodb.log --dbpath /data/db
    sleep 2
fi

echo "✅ MongoDB is running"
echo ""

# Start the server
echo "🔧 Starting server on port 5000..."
cd server
node server.js &
SERVER_PID=$!
cd ..

sleep 2

# Check if server started successfully
if ps -p $SERVER_PID > /dev/null; then
    echo "✅ Server started successfully (PID: $SERVER_PID)"
else
    echo "❌ Failed to start server"
    exit 1
fi

echo ""
echo "🎨 Starting client on port 3000..."
cd client
npm start &
CLIENT_PID=$!
cd ..

echo ""
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "✅ Carwale is now running!"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""
echo "📱 Client: http://localhost:3000"
echo "🔌 Server: http://localhost:5000"
echo "📊 MongoDB: mongodb://localhost:27017/carwale"
echo ""
echo "Press Ctrl+C to stop all services"
echo ""

# Wait for both processes
wait

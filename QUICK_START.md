# 🚗 Carwale - Quick Start Guide

## Prerequisites Installed ✅
- MongoDB 7.0
- Node.js
- All dependencies installed

## Current Status

### ✅ Completed Setup
1. MongoDB is running on `mongodb://localhost:27017/carwale`
2. Server is configured and running on `http://localhost:5000`
3. Environment files created for both client and server
4. All dependencies installed

### 📁 Environment Files

**Server** (`server/.env`):
```
PORT=5000
MONGO=mongodb://localhost:27017/carwale
JWT_SECRET=your_jwt_secret_key_here_change_in_production
BRAINTREE_MERCHANT_ID=your_braintree_merchant_id
BRAINTREE_PUBLIC_KEY=your_braintree_public_key
BRAINTREE_PRIVATE_KEY=your_braintree_private_key
```

**Client** (`client/.env`):
```
REACT_APP_API_URL=http://localhost:5000
```

## 🚀 Quick Commands

### Start Everything
```bash
./start.sh
```

### Manual Start

#### Terminal 1 - Start MongoDB (if not running)
```bash
mongod --dbpath /data/db
```

#### Terminal 2 - Start Server
```bash
cd server
npm run dev
# Server runs on http://localhost:5000
```

#### Terminal 3 - Start Client
```bash
cd client
npm start
# Client runs on http://localhost:3000
```

## 🧪 Test the API

### Check if server is working:
```bash
curl http://localhost:5000/api/car/getAll-car
curl http://localhost:5000/api/brand/getAll-brand
```

## 📝 Next Steps

1. **Create an Admin User**:
   - Register a new user through the UI or API
   - Update the user role in MongoDB:
   ```javascript
   use carwale
   db.users.updateOne(
     { email: "your-email@example.com" },
     { $set: { role: 1 } }
   )
   ```

2. **Add Car Brands**:
   - Login as admin
   - Go to Admin Dashboard → Create Brands
   - Add brands like BMW, Mercedes, Toyota, etc.

3. **Add Cars**:
   - Go to Admin Dashboard → Create Car
   - Upload images and fill in car details

4. **Optional: Configure Payment**:
   - Sign up for Braintree Sandbox account
   - Add credentials to `server/.env`
   - Payment features will then be enabled

## 🔧 Common Issues

### MongoDB not connected
```bash
# Restart MongoDB
pkill mongod
mongod --fork --logpath /var/log/mongodb.log --dbpath /data/db
```

### Port already in use
```bash
# Kill existing Node processes
pkill -f "node"
# Or change PORT in server/.env
```

### API not responding
```bash
# Check server logs
cd server
npm run dev
# Look for any error messages
```

## 📱 Access Points

- **Frontend**: http://localhost:3000
- **Backend API**: http://localhost:5000
- **MongoDB**: mongodb://localhost:27017/carwale

## 🎉 You're Ready!

The application is fully configured and ready to use. Start the servers and begin adding content through the admin panel.

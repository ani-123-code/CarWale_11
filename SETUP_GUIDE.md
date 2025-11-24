# Carwale - Setup Guide

This guide will help you set up and run the Carwale application locally.

## Prerequisites

- Node.js (v14 or higher)
- MongoDB (v7.0 or higher)
- npm or yarn

## Environment Setup

### 1. Server Configuration

The server requires a `.env` file in the `server/` directory with the following variables:

```env
PORT=5000
MONGO=mongodb://localhost:27017/carwale
JWT_SECRET=your_jwt_secret_key_here_change_in_production
BRAINTREE_MERCHANT_ID=your_braintree_merchant_id
BRAINTREE_PUBLIC_KEY=your_braintree_public_key
BRAINTREE_PRIVATE_KEY=your_braintree_private_key
```

**Note:** The Braintree payment credentials are optional. The application will run without them, but payment functionality will be disabled.

### 2. Client Configuration

The client requires a `.env` file in the `client/` directory:

```env
REACT_APP_API_URL=http://localhost:5000
```

## Installation Steps

### 1. Install MongoDB

Make sure MongoDB is installed and running on your system:

```bash
# Check if MongoDB is running
mongod --version

# Start MongoDB (if not already running)
mongod --dbpath /data/db
```

### 2. Install Server Dependencies

```bash
cd server
npm install
```

### 3. Install Client Dependencies

```bash
cd client
npm install
```

## Running the Application

### 1. Start the Server

```bash
cd server
npm run dev
```

The server will start on `http://localhost:5000`

### 2. Start the Client

```bash
cd client
npm start
```

The client will start on `http://localhost:3000`

## Features

- **User Authentication**: Register and login functionality with JWT
- **Car Listings**: Browse and search cars by brand, price range, and filters
- **Admin Panel**: Manage cars, brands, and orders
- **Shopping Cart**: Add cars to cart and proceed to checkout
- **Payment Integration**: Braintree payment gateway (requires configuration)
- **Image Management**: Upload and display car images

## Default User Roles

- Regular users: `role = 0`
- Admin users: `role = 1`

To create an admin user, register normally and then update the user's role in the MongoDB database:

```javascript
db.users.updateOne(
  { email: "admin@example.com" },
  { $set: { role: 1 } }
)
```

## API Endpoints

### User Routes
- POST `/api/user/register` - Register new user
- POST `/api/user/login` - User login
- GET `/api/user/user-auth` - Protected user route
- GET `/api/user/admin-auth` - Protected admin route
- PUT `/api/user/profileUpdate` - Update user profile
- GET `/api/user/orders` - Get user orders
- GET `/api/user/allOrders` - Get all orders (admin)
- PUT `/api/user/orderStatus/:orderId` - Update order status (admin)

### Brand Routes
- GET `/api/brand/getAll-brand` - Get all brands
- POST `/api/brand/create-brand` - Create brand (admin)
- PUT `/api/brand/update-brand/:id` - Update brand (admin)
- DELETE `/api/brand/delete-brand/:id` - Delete brand (admin)
- GET `/api/brand/getBrandBtId-brand/:slug` - Get brand by slug

### Car Routes
- GET `/api/car/getAll-car` - Get all cars
- GET `/api/car/getCarById-car/:slug` - Get car by slug
- POST `/api/car/create-car` - Create car (admin)
- PUT `/api/car/update-car/:pid` - Update car (admin)
- DELETE `/api/car/delete-car/:pid` - Delete car (admin)
- GET `/api/car/related-car/:cid/:bid` - Get related cars
- GET `/api/car/braintree/token` - Get Braintree token
- POST `/api/car/braintree/payment` - Process payment

## Google Drive Integration (Optional)

The application supports Google Drive for image hosting. To enable:

1. Create a Google Cloud project
2. Enable Google Drive API
3. Create service account credentials
4. Download the credentials JSON file
5. Place it as `server/controllers/cred.json`

If Google Drive is not configured, images will be stored locally in the `server/uploads/` directory.

## Troubleshooting

### MongoDB Connection Issues
- Ensure MongoDB is running: `mongod --version`
- Check connection string in `.env` file
- Verify MongoDB is accessible on port 27017

### Port Already in Use
- Kill existing processes: `pkill node`
- Or change the PORT in `.env` file

### Build Errors
- Clear node_modules: `rm -rf node_modules && npm install`
- Clear cache: `npm cache clean --force`

## Technology Stack

- **Frontend**: React.js, React Router, Axios, Ant Design
- **Backend**: Node.js, Express.js
- **Database**: MongoDB with Mongoose ODM
- **Authentication**: JWT (JSON Web Tokens)
- **Payment**: Braintree Payment Gateway
- **Image Storage**: Google Drive API (optional) or local storage

## License

MIT License

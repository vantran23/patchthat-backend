DROP DATABASE IF EXISTS patchthat;
CREATE DATABASE patchthat;

\c patchthat;

CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  username VARCHAR (100) UNIQUE NOT NULL,
  email VARCHAR (100) UNIQUE NOT NULL,
  token VARCHAR NULL,
);

CREATE TABLE shop (
shop_id SERIAL PRIMARY KEY,
seller INT REFERENCES users(id) NOT NULL,
shop_name VARCHAR (100) NOT NULL,
description VARCHAR
);

CREATE TABLE patches (
  patch_id SERIAL PRIMARY KEY,
  shop_id INT REFERENCES shops(id) NOT NULL,
  patch_name VARCHAR (100) NOT NULL,
  description VARCHAR,
  price FLOAT(2) NOT NULL,
  category VARCHAR (100) NOT NULL,
  ratings INT NULL,
  size INT NULL,
  image_url INT NULL,
);

CREATE TABLE cart (
  cart_id SERIAL PRIMARY KEY,
  userid INT REFERENCES users(id) NOT NULL,
  totalAmount INT NOT NULL
);

CREATE TABLE cartItem (
  cartItem_id SERIAL PRIMARY KEY,
  cart_id INT REFERENCES cart(cart_id) NOT NULL,
  prod_id INT REFERENCES products(prod_id) NOT NULL,
  quantity INT
);

CREATE TABLE orders (
  orderid SERIAL PRIMARY KEY,
  buyer INT REFERENCES users(id) NULL,
  buyer_guest VARCHAR NULL,
  totalAmount INT NOT NULL,
  created_at TIMESTAMP NOT NULL DEFAULT NOW()
);

CREATE TABLE orderItems (
  orderItemsid SERIAL PRIMARY KEY,  
  orderid INT REFERENCES orders(orderid) NOT NULL,
  prod_id INT REFERENCES products(prod_id) NOT NULL,
  quantity INT NOT NULL,
  name VARCHAR(100) NOT NULL,
  payment_token INT NULL,
  address VARCHAR NULL,
  country VARCHAR NULL,
  currentState VARCHAR NULL,
  zipCode VARCHAR NULL,
  shopName VARCHAR (100) NULL,
  shopDescrip VARCHAR NULL,
  created_at TIMESTAMP NOT NULL DEFAULT NOW(),
  updated_at TIMESTAMP NOT NULL DEFAULT NOW(),
);

CREATE TABLE rating (
  rating_id SERIAL PRIMARY KEY,
  prod_id INT REFERENCES products(prod_id) NOT NULL,
  users_id INT REFERENCES users(id) NOT NULL,
  comment VARCHAR NOT NULL,
  rate INT NOT NULL,
  created_at TIMESTAMP NOT NULL DEFAULT NOW(),
  updated_at TIMESTAMP NOT NULL DEFAULT NOW()
);


INSERT INTO users (username, email, token) VALUES
('MarilynPatches', 'marilynpatches@gmail.com', '1234');
('mo.mo', 'mo.mo@gmail.com', '12345');
('patch.dude', 'patch.dude@gmail.com', '123456');

INSERT INTO shop (seller, shop_name, description) VALUES
('MarilynPatches', 'MarilynMakesPatches', '');
('mo.mo', 'MoPatchShop', '12345');
('patch.dude', 'Patch.Dudes', '123456');
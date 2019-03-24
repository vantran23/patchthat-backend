DROP DATABASE IF EXISTS patchthat;
CREATE DATABASE patchthat;

\c patchthat;

CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  username VARCHAR (100) UNIQUE NOT NULL,
  email VARCHAR (100) UNIQUE NOT NULL,
  token VARCHAR NULL,
  created_at TIMESTAMP NOT NULL DEFAULT NOW(),
  updated_at TIMESTAMP NOT NULL DEFAULT NOW()
);

CREATE TABLE shops (
shop_id SERIAL PRIMARY KEY,
seller INT REFERENCES users(id) NOT NULL,
shop_name VARCHAR (100) NOT NULL,
description VARCHAR,
created_at TIMESTAMP NOT NULL DEFAULT NOW(),
updated_at TIMESTAMP NOT NULL DEFAULT NOW()
);

CREATE TABLE patches (
  patch_id SERIAL PRIMARY KEY,
  shop_id INT REFERENCES shops(shop_id) NOT NULL,
  patch_name VARCHAR (100) NOT NULL,
  description VARCHAR,
  price FLOAT(2) NOT NULL,
  category VARCHAR (100) NOT NULL,
  ratings INT NULL,
  size INT NULL,
  image_url INT NULL,
  created_at TIMESTAMP NOT NULL DEFAULT NOW(),
  updated_at TIMESTAMP NOT NULL DEFAULT NOW()
);

CREATE TABLE cart (
  cart_id SERIAL PRIMARY KEY,
  userid INT REFERENCES users(id) NOT NULL,
  totalAmount INT NOT NULL,
  created_at TIMESTAMP NOT NULL DEFAULT NOW(),
  updated_at TIMESTAMP NOT NULL DEFAULT NOW()
);

CREATE TABLE cartItem (
  cartItem_id SERIAL PRIMARY KEY,
  cart_id INT REFERENCES cart(cart_id) NOT NULL,
  patch_id INT REFERENCES patches(patch_id) NOT NULL,
  quantity INT,
  created_at TIMESTAMP NOT NULL DEFAULT NOW(),
  updated_at TIMESTAMP NOT NULL DEFAULT NOW()
);

CREATE TABLE orders (
  orderid SERIAL PRIMARY KEY,
  buyer INT REFERENCES users(id) NULL,
  buyer_guest VARCHAR NULL,
  totalAmount INT NOT NULL,
  created_at TIMESTAMP NOT NULL DEFAULT NOW(),
  updated_at TIMESTAMP NOT NULL DEFAULT NOW()
);

CREATE TABLE orderItems (
  orderItemsid SERIAL PRIMARY KEY,  
  orderid INT REFERENCES orders(orderid) NOT NULL,
  patch_id INT REFERENCES patches(patch_id) NOT NULL,
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
  updated_at TIMESTAMP NOT NULL DEFAULT NOW()
);

CREATE TABLE rating (
  rating_id SERIAL PRIMARY KEY,
  patch_id INT REFERENCES patches(patch_id) NOT NULL,
  users_id INT REFERENCES users(id) NOT NULL,
  comment VARCHAR NOT NULL,
  rate INT NOT NULL,
  created_at TIMESTAMP NOT NULL DEFAULT NOW(),
  updated_at TIMESTAMP NOT NULL DEFAULT NOW()
);


INSERT INTO users (username, email, token) VALUES
('MarilynPatches', 'marilynpatches@gmail.com', '1234'),
('mo.mo', 'mo.mo@gmail.com', '12345'),
('patch.music', 'patch.music@gmail.com', '123456');

INSERT INTO shops (seller, shop_name, description) VALUES
('MarilynPatches', 'MarilynMakesPatches', 'Girly, whimsical patches for the feminist soul'),
('mo.mo', 'MoPatchShop', 'All things that Mo loves and more'),
('patch.music', 'Patch_Music', 'Patches of Musicians');

INSERT INTO patches (shop_id, patch_name, description, price, category, ratings, size, image_url) VALUES
('1', 'Monroe Lipstick', 'Iron-on red lipstick', '4.99', 'Novelty', '5-star', '2"L x 1"W' ),
('1', 'Kissable Lips', 'Iron-on red lips', '4.99', 'Novelty', '5-star', '2"L x 1"W' ),
('1', 'Dump Trump', 'Iron-on face of a man who disrespects women', '6.99', 'Faces', '4-star', '2"L x 1.5"W' ),
('2', 'Drake', 'Iron-on Drake', '7.99', 'Faces', '4-star', '2"L x 2"W'),
('2', 'Waving Pikachu ', 'Sew-on Pikachu', '4.99', 'Novelty', '3-star', '1.5"L x 1.5"W'),
('2', 'I heart Mo', 'Iron-on Heart of Mo', '5.99', 'Hearts', '4-star', '2"L x 2.5"W'),
('3', 'Kanye Head', 'Iron-on Kanye', '7.99', 'Faces', '4-star', '2.5"L x 2"W'),
('3', 'I heart T-Swift', 'Sew-on Taylor Heart', '5.99', 'Hearts', '4-star', '1.5"L x 1.5"W'),
('3', 'Bowie Here', 'Iron-on Bowie Head', '7.99', 'Faces', '4-star', '2"L x 2.5"W');

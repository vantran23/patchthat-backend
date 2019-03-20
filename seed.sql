DROP DATABASE IF EXISTS shopped;
CREATE DATABASE shopped;

\c shopped;

CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  username VARCHAR (100) UNIQUE NOT NULL,
  name VARCHAR(100) NOT NULL,
  email VARCHAR (100) UNIQUE NOT NULL,
  creditCard INT NULL,
  address VARCHAR NULL,
  country VARCHAR NULL,
  state VARCHAR NULL,
  zipCode VARCHAR NULL,
  shopName VARCHAR (100) NULL,
  shopDescrip VARCHAR NULL,
  created_at TIMESTAMP NOT NULL DEFAULT NOW(),
  updated_at TIMESTAMP NOT NULL DEFAULT NOW(),
  token VARCHAR NULL
);

-- CREATE TABLE shop (
--   shop_id SERIAL PRIMARY KEY,
--   seller INT REFERENCES users(id) NOT NULL,
--   shop_name VARCHAR (100) NOT NULL,
--   description VARCHAR
-- );

CREATE TABLE products (
  prod_id SERIAL PRIMARY KEY,
  userid INT REFERENCES users(id) NOT NULL,
  name VARCHAR (100) NOT NULL,
  description VARCHAR,
  price FLOAT(2) NOT NULL,
  category VARCHAR (100) NOT NULL,
  ratings INT NULL,
  size INT NULL
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
  quantity INT NOT NULL
);

CREATE TABLE comments (
  comment_id SERIAL PRIMARY KEY,
  prod_id INT REFERENCES products(prod_id) NOT NULL,
  users_id INT REFERENCES users(id) NOT NULL,
  comment VARCHAR NOT NULL,
  rate INT NOT NULL,
  created_at TIMESTAMP NOT NULL DEFAULT NOW(),
  updated_at TIMESTAMP NOT NULL DEFAULT NOW()
);





-- INSERT INTO users (username, name, email) VALUES
-- ('J123', 'John', 'john@email.com');

-- INSERT INTO posts (author, title, body) VALUES
-- (1, 'bunny', 'Marshmello'), (2, 'dog', 'Chai'), (1, 'cat', 'Pixel');
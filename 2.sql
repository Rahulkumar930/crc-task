-- Create databases
CREATE DATABASE COLLEGE;

CREATE DATABASE IF NOT EXISTS INSTAGRAM;

-- Use database
USE INSTAGRAM;

-- Create users table
CREATE TABLE users (
    id INT,
    age INT,
    name VARCHAR(30) NOT NULL,
    email VARCHAR(50) UNIQUE,
    followers INT DEFAULT 0,
    following INT,
    CONSTRAINT chk_age CHECK (age >= 13),
    PRIMARY KEY (id)
);

-- Insert initial data
INSERT INTO users
(id, age, name, email, followers, following)
VALUES
(1, 14, "adam", "adam@yahoo.in", 123, 145),
(2, 15, "bob", "bob123@gmail.com", 200, 200),
(3, 16, "casey", "casey@gmail.com", 300, 386);

-- Insert more data
INSERT INTO users
(id, age, name, email, followers, following)
VALUES
(5, 14, "eve", "eve@yahoo.in", 400, 145),
(6, 16, "farah", "farah@gmail.com", 1000, 1000);
SELECT max(age)
from users;

-- Select with condition + limit
SELECT name, age, email
FROM users
WHERE age > 14
LIMIT 2;

-- Select users with age < 16
SELECT *
FROM users
WHERE age < 16;

-- Create post table with foreign key
CREATE TABLE post (
    id INT PRIMARY KEY,
    content VARCHAR(100),
    users_id INT,
    FOREIGN KEY (users_id) REFERENCES users(id)
);


USE instagram; 

DROP TABLE IF EXISTS user;

CREATE TABLE IF NOT EXISTS user(
    id INT,
    age INT,
    name VARCHAR(30) NOT NULL,
    email VARCHAR(50) UNIQUE,
    followers INT DEFAULT 0,
    following INT DEFAULT 0,  
    CHECK (age >= 13),     
    PRIMARY KEY (id)
);

INSERT INTO user
(id, age, name, email, followers, following)
VALUES
(1, 14, 'abhi', 'abhi@yahoo.in', 123, 145),
(2, 15, 'adi', 'adi123@gmail.com', 200, 200),
(3, 16, 'spoorti', 'spoorti@gmail.com', 300, 306),
(4, 17, 'bhadra', 'bhadra@gmail.com', 200, 105);

SELECT id, name, email FROM user;
SELECT DISTINCT age FROM user;

SELECT *
FROM user 
WHERE followers >= 200;

SELECT name,age
FROM user
WHERE age + 1 =18;

SELECT name,age,followers
FROM user
WHERE age > 15 OR followers > 200;

SELECT name,email,followers
FROM user
WHERE email IN('abhi@yahoo.in','adi123@gmail.com','spoorti@gmail.com');

SELECT name,email,followers
FROM user
ORDER BY followers ASC;

INSERT INTO user
(id, age, name, email, followers, following)
VALUES
(5, 14, 'ayush', 'ayush@yahoo.in', 400, 145),
(6, 16, 'bhavana', 'bhavana@gmail.com', 10000, 1000);

SELECT max(followers)
FROM user;

SELECT count(age)
FROM user
WHERE age=14;

SELECT age,max(followers)
FROM user 
GROUP BY age
HAVING max(followers) > 200
ORDER BY age DESC;

UPDATE user
SET followers=600
WHERE age = 16;

ALTER TABLE user
ADD COLUMN city VARCHAR(25) DEFAULT "DELHI";

ALTER TABLE user
DROP COLUMN age;

ALTER TABLE instaUser
RENAME TO user;

ALTER TABLE user
CHANGE COLUMN followers subs INT DEFAULT 0;

ALTER TABLE user
MODIFY subs INT DEFAULT 5;

INSERT INTO user
(id,name, email,following)
VALUES
(7,'purvi', 'purvi@yahoo.in',145);

SELECT * FROM user;

TRUNCATE TABLE user;

DROP TABLE post;
CREATE TABLE post(
id INT PRIMARY KEY,
content VARCHAR(100),
user_id INT,
FOREIGN KEY (user_id) REFERENCES user (id)
);

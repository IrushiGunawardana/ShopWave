--IT22312426
--D.D.I Gunawaradna



CREATE TABLE loggedcustomer (
                          id INT NOT NULL AUTO_INCREMENT,
                          fname VARCHAR(50) NOT NULL,
                          lname VARCHAR(50),
                          age int,
                          email VARCHAR(50) NOT NULL,
                          contact VARCHAR(10),
                          address VARCHAR(100),
                          password varchar(300),
                          PRIMARY KEY (id)
);

INSERT INTO loggedcustomer (fname, lname, age, email, contact, address, password)
VALUES ('John', 'Doe', 30, 'johndoe@email.com', '1234567890', '123 Main St', 'hashed_password1');
INSERT INTO loggedcustomer (fname, lname, age, email, contact, address, password)
VALUES ('Alice', 'Smith', 25, 'alicesmith@email.com', '9876543210', '456 Elm St', 'hashed_password2');
INSERT INTO loggedcustomer (fname, lname, age, email, contact, address, password)
VALUES ('Bob', 'Johnson', 40, 'bobjohnson@email.com', '5551234567', '789 Oak St', 'hashed_password3');
INSERT INTO loggedcustomer (fname, lname, age, email, contact, address, password)
VALUES ('Eve', 'Davis', 28, 'evedavis@email.com', '7778889999', '567 Pine St', 'hashed_password4');
INSERT INTO loggedcustomer (fname, lname, age, email, contact, address, password)
VALUES ('Grace', 'Brown', 35, 'gracebrown@email.com', '9990001111', '111 Cedar St', 'hashed_password5');
INSERT INTO loggedcustomer (fname, lname, age, email, contact, address, password)
VALUES ('Frank', 'Wilson', 32, 'frankwilson@email.com', '1234567890', '222 Elm St', 'hashed_password6');
INSERT INTO loggedcustomer (fname, lname, age, email, contact, address, password)
VALUES ('Christopher', 'Lee', 28, 'chrislee@email.com', '7778889999', '123 Willow St', 'hashed_password7');
INSERT INTO loggedcustomer (fname, lname, age, email, contact, address, password)
VALUES ('Sarah', 'Turner', 29, 'sarahturner@email.com', '5551234567', '789 Oak St', 'hashed_password8');


 create table orders(
  `o_id` int NOT NULL AUTO_INCREMENT,
  `p_id` int NOT NULL,
  `u_id` int NOT NULL,
  `o_quantity` int NOT NULL,
  `o_date` varchar(450) NOT NULL,
  PRIMARY KEY (`o_id`)
 
);



CREATE TABLE items (
   id INT NOT NULL AUTO_INCREMENT,
   name VARCHAR(45) NULL,
   des VARCHAR(100) NULL,
   price DECIMAL(10,2) NULL,
   category  VARCHAR(45) NULL,
    image  VARCHAR(45) NULL,
    PRIMARY KEY (id)   
    );
    
INSERT INTO items (name, des, price, category, image)
VALUES ('Bag', 'A stylish and functional bag', 20, 'Accessories', 'bag.png');

INSERT INTO items (name, des, price, category, image)
VALUES ('Dress', 'Elegant evening dress', 50, 'Clothing', 'dress.png');

INSERT INTO items (name, des, price, category, image)
VALUES ('Earrings', 'Beautiful earrings for any occasion', 10, 'Jewelry', 'earings.png');

INSERT INTO items (name, des, price, category, image)
VALUES ('Necklace', 'A stunning necklace to complement your style', 30, 'Jewelry', 'necklace.png');

INSERT INTO items (name, des, price, category, image)
VALUES ('Nike Shoes', 'Comfortable and stylish Nike shoes', 80, 'Footwear', 'nikeshoes.png');

INSERT INTO items (name, des, price, category, image)
VALUES ('Sweatshirt', 'Warm and cozy sweatshirt', 40, 'Clothing', 'sweatshirt.png');

INSERT INTO items (name, des, price, category, image)
VALUES ('T-Shirt', 'Casual and comfortable t-shirt', 25, 'Clothing', 'tshirt.png');

INSERT INTO items (name, des, price, category, image)
VALUES ('Watch', 'Elegant and functional wristwatch', 60, 'Accessories', 'watch.png');


create table shipping (
 id  int(3) NOT NULL AUTO_INCREMENT,
 name varchar(120) NOT NULL,
 address varchar(220) NOT NULL,
 country varchar(120),
 PRIMARY KEY (id)
);

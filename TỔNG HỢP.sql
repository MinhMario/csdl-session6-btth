
CREATE TABLE Users (
    user_id INT PRIMARY KEY,
    name VARCHAR(100)
);


CREATE TABLE Hotels (
    hotel_id INT PRIMARY KEY,
    rating DECIMAL(2,1)
);

CREATE TABLE Bookings (
    booking_id INT PRIMARY KEY,
    user_id INT,
    hotel_id INT,
    total_price BIGINT,
    status VARCHAR(50),
    FOREIGN KEY (user_id) REFERENCES Users(user_id),
    FOREIGN KEY (hotel_id) REFERENCES Hotels(hotel_id)
);


INSERT INTO Users (user_id, name) VALUES
(1, 'Nguyễn Văn An'),
(2, 'Trần Thị Bình'),
(3, 'Lê Văn Cường'),
(4, 'Phạm Thị Dung'),
(5, 'Hoàng Văn Em');


INSERT INTO Hotels (hotel_id, rating) VALUES
(1, 5.0),   
(2, 5.0),   
(3, 4.0), 
(4, 3.0),   
(5, 3.0);   

INSERT INTO Bookings (booking_id, user_id, hotel_id, total_price, status) VALUES
(1,  1, 1, 80000000,  'COMPLETED'), 
(2,  2, 1, 60000000,  'COMPLETED'),  
(3,  3, 1, 30000000,  'COMPLETED'),   
(4,  1, 3, 55000000,  'COMPLETED'),  
(5,  4, 2, 90000000,  'COMPLETED'),   
(6,  5, 4, 20000000,  'COMPLETED'),   
(7,  2, 3, 70000000,  'COMPLETED'),   
(8,  3, 2, 65000000,  'COMPLETED'),  
(9,  1, 1, 40000000,  'pending'),     
(10, 4, 4, 55000000,  'COMPLETED');   


SELECT Users.name,SUM(total_price) AS tong_tien ,status,Hotels.rating FROM BOOKINGS
JOIN Hotels ON Bookings.hotel_id=Hotels.hotel_id 
JOIN Users ON Bookings.user_id=Users.user_id
WHERE status='COMPLETED' 
GROUP BY Hotels.rating,Users.name
HAVING SUM(total_price)>50000000
ORDER BY tong_tien DESC , rating DESC





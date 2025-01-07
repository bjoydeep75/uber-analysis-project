create database uber;
use uber;
select * from booking;
create view Booking_success as 
select * from booking
where Booking_status = "success";
##1.Retrieve all successful bookings:
select * from booking_success;


##2.Find the average ride distance for each vehicle type:
select * from avg_ride;
create view Avg_ride as
select Vehicle_type,avg(Ride_Distance) from booking
group by vehicle_type;

##3.Get the total number of cancelled rides by customers:
create view cancelled_ride as
select Cancelled_Rides_By_Customer ,count(Cancelled_Rides_By_Customer) from booking
group by Cancelled_Rides_By_Customer;
select * from cancelled_ride;

##4.List the top 5 customers who booked the highest number of rides:
create view top5 as
select Customer_ID,count(Booking_ID) as total_rides from booking
group by Customer_ID
order by total_rides desc limit 5;

select * from top5;

##5.Get the number of rides cancelled by drivers due to personal and car-related issues:
select * from booking;

create view due as 
select count(*) from booking
where Reason_for_cancelling_by_Driver = "Personal & Car related issues";
select * from due;


##6.Find the maximum and minimum driver ratings for Prime Sedan bookings:

SELECT * from booking;
select max(Driver_Ratings),min(Driver_Ratings) from booking
where vehicle_type = "prime SUV";
SELECT MAX(Driver_Ratings) as max_rating, MIN(Driver_Ratings) as min_rating FROM
booking WHERE Vehicle_Type = 'Prime Sedan';



##7.Retrieve all rides where payment was made using UPI:
select * from booking;
SELECT * FROM bookings WHERE Payment_Method = 'UPI';

##8.Find the average customer rating per vehicle type:
SELECT Vehicle_Type, AVG(Customer_Rating) as avg_customer_rating FROM booking
GROUP BY Vehicle_Type;



##9.Calculate the total booking value of rides completed successfully:
SELECT SUM(Booking_Value) as total_successful_value FROM booking WHERE
Booking_Status = 'Success';


##10. List 10 incomplete rides along with the reason:
SELECT Booking_ID, Incomplete_Rides_Reason FROM booking WHERE Incomplete_Rides =
'Yes'
limit 10;
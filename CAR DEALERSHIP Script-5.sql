 -- Custom table for Salesperson 
 create table Salesperson_veh(
     EMPLOYEE_ID SERIAL primary key,
     FIRST_NAME VARCHAR(50),
     LAST_NAME VARCHAR(50),
     PHONE_NUMBER VARCHAR(15)
 );
 
 -- Custom table for Customer
 create table Customer_veh(
      Customer_id SERIAL primary key,
      Firstname_customer VARCHAR(50),
      Phonenumber_customer VARCHAR(15),
      Address_customer VARCHAR(100)
 );
 
-- Custom table for Car
create table Car_veh(
    CAR_ID SERIAL primary key,
    SERIAL_ID INTEGER,
    YEAR_ID INTEGER,
    MAKE_CAR VARCHAR(50),
    MODEL_CAR VARCHAR(50)
); 
-- Custom table for Machanic
create table Machanic_veh(
    Mechanic_id SERIAL primary key,
    Firstname_Machanic VARCHAR(50),
    Lastname_Machanic VARCHAR(50),
    Phonenumber_Machanic VARCHAR(50)
);

-- Custom table for Invoice
create table Invoice_veh(
    Invoice_veh SERIAL primary key,
    Customer_id INTEGER not null,
    Car_id INTEGER not null,
    foreign key (Customer_id) references Customer_veh(Customer_id),
    foreign key (Car_id) references Car_veh(Car_id)
);


-- Custom table for Service
create table Service_veh(
    Service_id SERIAL primary key,
    Customer_id INTEGER not null,
    Mechanic_id INTEGER not null,
    foreign key (Customer_id) references Customer_veh(Customer_id),
    foreign key (Mechanic_id) references Machanic_veh(Mechanic_id)
);


-- Custom table for Parts
create table Parts_veh(
    Parts_id SERIAL primary key,
    Parts_name VARCHAR(50),
    Quanity INTEGER,
    Service_id INTEGER not null,
    Mechanic_id INTEGER not null,
    foreign KEY(service_id) references service_veh(service_id),
    foreign key (Mechanic_id) references Machanic_veh(Mechanic_id)
);

-- Insert the Sales person information to the sales person table 
insert into Salesperson_veh(employee_id, first_name, last_name,phone_number)
VALUES(22,'Zion', 'Miller','2523012566');

insert into Salesperson_veh(employee_id, first_name, last_name,phone_number)
VALUES(78,'Bill', 'Byince','8045456696');

insert into Salesperson_veh(employee_id, first_name, last_name,phone_number)
VALUES(33,'Brooklyn', 'Renyolds','9123654545');

drop function add_vehcustomer

-- Customer information
create or replace procedure add_vehcustomer(
    firstname_customer VARCHAR,
    phonenumber_customer VARCHAR, 
    address_customer VARCHAR (100)
)
language plpgsql
as $$
begin
    insert into customer_veh(firstname_customer,phonenumber_customer, address_customer)    
VALUES(firstname_customer,phonenumber_customer,address_customer);
end;
$$

-- ADD CUSTOMER
call add_vehcustomer('Rhonda','7032549566','4401 Caroline Drive');

call add_vehcustomer('Sasha','2024679988','4905 9th Street nw');

-- Insert the Car information into the car table
insert into Car_veh(Car_id, Serial_id, Year_id, Make_car, Model_car)
VALUES(526, 3224, 2016, 'HONDA', 'HRV');

insert into Car_veh(Car_id, Serial_id, Year_id, Make_car, Model_car)
VALUES(123, 6548, 2024, 'Chrysler', 'Sebring');

insert into Car_veh(Car_id, Serial_id, Year_id, Make_car, Model_car)
VALUES(655, 8796, 2023, 'Tesla', 'Model Three');

select * from car_veh

-- Insert the Machanic information into the machanic table
insert into Machanic_veh( Mechanic_id, Firstname_Machanic, Lastname_Machanic, Phonenumber_Machanic)
VALUES(654, 'Henry', 'Smith', '703569985');

insert into Machanic_veh( Mechanic_id, Firstname_Machanic, Lastname_Machanic, Phonenumber_Machanic)
VALUES(757, 'Brian', 'Gover', '7032226363');

insert into Machanic_veh( Mechanic_id, Firstname_Machanic, Lastname_Machanic, Phonenumber_Machanic)
VALUES(999, 'King', 'Johnson', '3022546522');

select * from customer_veh
-- Insert the Invoice information into the invoice table
insert into Invoice_veh(invoice_veh, customer_id, car_id)
VALUES(850, 1, 526);


-- Insert the Service information into Service table
insert into Service_veh(service_id, customer_id, mechanic_id)
VALUES(4535, 2, 654);

-- Insert the Parts information into the Parts table
insert into Parts_veh(parts_id, parts_name, quanity, service_id, mechanic_id)
VALUES(526, 'Airfilter', 1, 4535, 654);



































 
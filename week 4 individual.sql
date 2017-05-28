

drop table workOrders;
drop table product;
drop table customerInfo;
drop table employeeInfo;


---- Next Table ----


create table customerInfo
(
  customerInfoID INTEGER primary key, 
    custFName varchar2 (50) not null,
    custLName varchar2 (50) not null,
    custDelivery varchar2 (50) not null,
    custBilling varchar2 (50) not null,
    custEnrollDate varchar2 (50) not null
  );
  
---- This will be bring down the work orders information-----  
insert into customerInfo
(customerInfoID, custFName, custLName, custDelivery, custBilling, custEnrollDate)
values (1,'John', 'Doe', '5 Days', '111 pluto way CA San Diego 92055', '12/1/1999');
insert into customerInfo
values (2, 'Jane', 'Hines', '3 Days', '222 pluto way San Diego, CA 92111', '11/3/2002');
insert into customerInfo
values (3, 'Robert', 'Roberts', '4 Days', '333 pluto way San Diego, CA 92111', '10/3/2003');
insert into customerInfo
values (4, 'Julia', 'Rodriguez ', '3 Days', '444 pluto way San Diego, CA 92111', '9/3/2007');
insert into customerInfo
values (5, 'Mark', 'Johnson', '6 Days', '555 pluto way San Diego, CA 92111', '11/3/2016');
insert into customerInfo
values (6, 'Matt', 'Collins', '4 Days', '667 pluto way San Diego, CA 92111', '5/3/2001');
insert into customerInfo
values (7, 'Bratt', 'Button', '2 Days', '777 pluto way San Diego, CA 92111', '3/3/1995');
insert into customerInfo
values (8, 'Oscar', 'Clayton', '8 Days', '999 pluto way San Diego, CA 92111', '4/3/2005');
insert into customerInfo
values (9, 'Jane', 'Flores', '6 Days', '100 pluto way San Diego, CA 92111', '8/3/2008');
insert into customerInfo
values (10, 'Elisa', 'Garcia', '4 Days', '123 pluto way San Diego, CA 92111', '7/3/2015');

--- This will find customers that have a delivery time of 4 days" ---
select custFName, custLName, custBilling, custDelivery
from customerInfo
where custDelivery = '4 Days';

---- Next Table ----

create table workOrders
(
  workOrdersID INTEGER primary key, 
    workPriority varchar2 (50) not null,
    workShipping varchar2 (50) not null,
    workDate varchar2 (50) not null,
    workNumber varchar2 (50) not null,
    customerInfoID int 
  references customerInfo (customerInfoID) not null
  );
  
--- This table will show what will appear on the work order ----

insert into workOrders (workOrdersID, workPriority, workShipping, workDate, workNumber, customerInfoID)
values (1,'High Priority', 'USPS', '1/27/2016', '4000', 2);
insert into workOrders 
values (2,'Regular Priority', 'UPS', '1/26/2016', '4001', 3);
insert into workOrders 
values (3,'Regular Priority', 'UPS', '1/27/2016', '4002', 4);
insert into workOrders 
values (4,'High Priority', 'UPS', '1/26/2016', '4003', 5);
insert into workOrders 
values (5,'High Priority', 'UPS', '1/27/2016', '4004', 6);
insert into workOrders 
values (6,'Regular Priority', 'USPS', '1/27/2016', '4005', 7);
insert into workOrders 
values (7,'High Priority', 'USPS', '1/26/2016', '4006', 8);
insert into workOrders 
values (8,'High Priority', 'USPS', '1/26/2016', '4007', 9);
insert into workOrders 
values (9,'Reguar Priority', 'USPS', '1/27/2016', '4008', 10);
insert into workOrders 
values (10,'Regular Priority', 'UPS', '1/67/2016', '4009', 1);

--- This query combines the two tables ---
--- to show information where wo.workPriority = 'High Priority' ---
--- Test of to obtain the priority. ----


select workOrdersID, workShipping, workDate, workNumber, ci.*
from workOrders wo
inner join customerInfo ci
on wo.workOrdersID = ci.customerInfoID
where wo.workPriority = 'High Priority';

--- Next Table ----


create table employeeInfo
(
  employeeInfoID INTEGER primary key, 
    empName varchar2 (50) not null,
    empAge varchar2 (50) not null,
    empWarehouse varchar2 (50) not null,
    empRate varchar2 (50) not null,
    empSchedule varchar2 (50) not null
  );
  
  --- table information ----

insert into employeeInfo (employeeInfoID, empName, empAge, empWarehouse, empRate, empSchedule)
values (1,'John B.', '24', 'Yes', '14.50', 'M, T, W, T, F');
insert into employeeInfo 
values (2,'Jonne T.', '50', 'Yes', '18.00', 'M, T, W, T, F');
insert into employeeInfo 
values (3,'Jack W.', '40', 'Yes', '21.00', 'M, T, W, T, F');
insert into employeeInfo 
values (4,'Jazmine K.', '21', 'Yes', '16.00', 'M, T, W, T, F');
insert into employeeInfo 
values (5,'Frank T.', '32', 'Yes', '12.00', 'M, T, W, T, F');
insert into employeeInfo 
values (6,'Robert G.', '80', 'Yes', '14.50', 'M, T, W, T, F');
insert into employeeInfo 
values (7,'Joe S.', '18', 'Yes', '14.50', 'M, T, W, T, F');
insert into employeeInfo 
values (8,'Juan E.', '56', 'Yes', '13.50', 'M, T, W, T, F');
insert into employeeInfo 
values (9,'Alicia A.', '27', 'Yes', '16.50', 'M, T, W, T, F');
insert into employeeInfo 
values (10,'Elmer B.', '38', 'Yes', '18.50', 'M, T, W, T, F');

----- search for employee's rate about 14.00 ----

select employeeInfoID, empName, empRate
from employeeInfo
where emprate >= '14.00';


---- next table -----

create table product 
( 
  productID INTEGER primary key,
    productName varchar2 (50) not null,
    productType varchar2 (50) not null, 
    productRating varchar2 (50) not null,
    prouctExperation varchar2 (50) not null,
    productCode varchar2 (50) not null 
      employeeInfoID int 
  references employeeInfo (employeeInfoID) not null
  
  );
  
  --- table information ----
  
insert into product (productID, productName, productType, productRating, productExpiration, productCode,employeeInfoID)
values (1,'Beyond Tangy Tangerine', 'Vitamins', '5', '2017', '23221',10);
insert into product 
values (2,'Plant Derived Minerals', 'Vitamins', '4', '2018', '13203',9);
insert into product 
values (3,'Beyond Tangy Tangerine 2.0', 'Vitamins', '5', '2017', '100075',8);
insert into product 
values (4,'Cheri Mins', 'Vitamins', '4', '2018', '13223',7);
insert into product 
values (5,'Total Meal Replacement Vanilla', 'Foods', '4', '2016', '1000061',6);
insert into product 
values (6,'Febraury Love Necklace', 'Jewelry', '4', 'NA', '10001',5);
insert into product 
values (7,'Lily Liplock', 'Makeup', '4', '2017', '100001',4);
insert into product 
values (8,'Gluco-Gel Plus', 'Vitamins', '5', '2018', '100050',3);
insert into product 
values (9,'Pollen Burst', 'Vitamins', '5', '2018', 'PJ330',2);
insert into product 
values (10,'Ultimate CAL', 'Vitamins', '3', '2020', '100004', 1);

----- locate products that have 5 plus stars ----- 

select productName, productType, productRating
from product pji
inner join employeeInfo emi
on pji.productID = emi.employeeInfoID
where pji.productRating >= '5';


--- I have modified some of the attributes in the tables ---



--- Showing all data and rows for all tables ----
select *
from  workOrders;
select *
from product;
select *
from customerInfo;
Select *
from employeeInfo;

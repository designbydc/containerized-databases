drop table if exists customers;
create table customers (
  id int primary key,
  customer_id varchar(20) not null unique key,
  first_name varchar(100) not null,
  last_name varchar(100) not null,
  company varchar(100) not null,
  city varchar(100) not null,
  country varchar(100) not null,
  phone_1 varchar(50) not null,
  phone_2 varchar(50) not null,
  email varchar(100) not null,
  subscription_date DATE not null,
  website varchar(200) not null
) engine=innodb charset=utf8mb4 row_format=dynamic comment='customers';

load data local
  infile "/share/customers.csv"
  into table customers
  character set 'utf8'
  fields terminated by ','
  enclosed by '"'
  lines terminated by '\n'
  ignore 1 lines
  (
    @index,
    @customer_id,
    @first_name,
    @last_name,
    @company,
    @city,
    @country,
    @phone_1,
    @phone_2,
    @email,
    @subscription_date,
    @website
  )
  set
    id = @index,
    customer_id = @customer_id,
    first_name = @first_name,
    last_name = @last_name,
    company = @company,
    city = @city,
    country = @country,
    phone_1 = @phone_1,
    phone_2 = @phone_2,
    email = @email,
    subscription_date = @subscription_date,
    website = @website
;
DROP TABLE IF EXISTS county_wise;
CREATE EXTERNAL TABLE `county_wise`(
    `Country` string,
    `confirm` int,  
    `death` int, 
    `recoverd` int,  
    `active` int)

    ROW FORMAT DELIMITED FIELDS TERMINATED BY ','   
    lines terminated by '\n' STORED AS TEXTFILE
     TBLPROPERTIES("skip.header.line.count"="1"); 

     --LOAD DATA INPATH 'wasb:///hive/county_wise.csv' INTO TABLE county_wise;

     
select Country,confirm from(select *, row_number()over(order by confirm desc) cases
					   from county_wise)x
where cases = 1;


select Country,confirm from(select *, row_number()over(order by confirm asc) cases
					   from county_wise)x
where cases = 1;

--for the death rates

select Country,death from(select *, DENSE_RANK()over(order by death desc) highst_deaths
					   from county_wise)x
where highst_deaths = 1;


select Country,death from(select *, DENSE_RANK()over(order by death asc) lowest_deaths
					   from county_wise)x
where lowest_deaths = 1;

--for the rocovery rates

select Country,recoverd from(select *, DENSE_RANK()over(order by recoverd desc) highst_recoverd
					   from county_wise)x
where highst_deaths = 1;


select Country,recoverd from(select *, DENSE_RANK()over(order by recoverd asc) lowest_recoverd
					   from county_wise)x
where lowest_deaths = 1;

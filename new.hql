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
Select *
From DataCleaning.dbo.['AB_NYC_2019 (2)$']
---------Data Cleaning----------------------
-------Deleting duplicate values------------

;WITH RowNumberCTE AS(
Select *, ROW_NUMBER() OVER(
		  PARTITION BY host_id,
					   latitude,
					   longitude,
					   room_type
					   Order By host_id) as rowNumber
From DataCleaning.dbo.['AB_NYC_2019 (2)$'] 
)
Delete
From RowNumberCTE
Where rowNumber > 1


------------------Droping id,host_name-----------------------
Alter Table [dbo].['AB_NYC_2019 (2)$']
Drop Column id

Alter Table [dbo].['AB_NYC_2019 (2)$']
Drop Column host_name

-----------------Checking for Nulls------------------------------

select name --NULL
From DataCleaning.dbo.['AB_NYC_2019 (2)$']
where name is null

select host_id
From DataCleaning.dbo.['AB_NYC_2019 (2)$']
where host_id is null


select neighbourhood
From DataCleaning.dbo.['AB_NYC_2019 (2)$']
where neighbourhood is null

select neighbourhood_group
From DataCleaning.dbo.['AB_NYC_2019 (2)$']
where neighbourhood_group is null

select latitude
From DataCleaning.dbo.['AB_NYC_2019 (2)$']
where latitude is null

select longitude
From DataCleaning.dbo.['AB_NYC_2019 (2)$']
where longitude is null

select room_type
From DataCleaning.dbo.['AB_NYC_2019 (2)$']
where room_type is null

select price
From DataCleaning.dbo.['AB_NYC_2019 (2)$']
where price is null

select minimum_nights
From DataCleaning.dbo.['AB_NYC_2019 (2)$']
where minimum_nights is null

select number_of_reviews
From DataCleaning.dbo.['AB_NYC_2019 (2)$']
where number_of_reviews is null

select last_review --NULL
From DataCleaning.dbo.['AB_NYC_2019 (2)$']
where last_review is null

select reviews_per_month --NULL
From DataCleaning.dbo.['AB_NYC_2019 (2)$']
where reviews_per_month is null

select calculated_host_listings_count
From DataCleaning.dbo.['AB_NYC_2019 (2)$']
where calculated_host_listings_count is null

select availability_365
From DataCleaning.dbo.['AB_NYC_2019 (2)$']
where availability_365 is null
 --------------------------------------------------------
 ------Raplce Null with 0 in reviews_per_month----------

 update [dbo].['AB_NYC_2019 (2)$']
 SET reviews_per_month = 0
 where reviews_per_month is null

------------table 1---------------------------
Select longitude,latitude
From DataCleaning.dbo.['AB_NYC_2019 (2)$']

----------------------------------------
-----------Table 2----------------

Select longitude,latitude,neighbourhood,neighbourhood_group
From DataCleaning.dbo.['AB_NYC_2019 (2)$']

--------------------------------------------
----------------Table 3-------------------

Select price,neighbourhood,neighbourhood_group
From DataCleaning.dbo.['AB_NYC_2019 (2)$']

---------------------------------------
---------------Table 4-------------------

Select price,room_type,neighbourhood_group
From DataCleaning.dbo.['AB_NYC_2019 (2)$']

-------------------------------------------
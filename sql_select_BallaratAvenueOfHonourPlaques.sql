
-- fid	site	caid	feature	suburb	ward	fname	sname	battalion	rank	enlisted	kia	planter	location	status

-- {"type":"Feature","id":"ba19e100_f7db_443a_b7b8_94d4c6e64580.1","geometry":{"type":"Point","coordinates":[736578.8305527295,5849093.495026071]},"geometry_name":"geom",
-- "properties":{"site":"Avenue Road","caid":"00148237","feature":"AoH-Tree Plaque","suburb":"Burrumbeet","ward":"North",
-- "fname":"Harry","sname":"Beattie","battalion":"A.F.C","rank":"Not Applicable","enlisted":"1916-01-30Z","kia":"No","planter":"Miss L. Wallace","location":"Front","status":"Original"}},

select 'Ballarat Avenue Of Honour Plaques' as FeatureName, 
	* from OPENJSON( (select geojson from geojson where datasourcename = 'BallaratAvenueOfHonourPlaques'), '$.features') 
        WITH (
			  Type varchar(100) '$.properties.feature'
			, coord_0 varchar(100) '$.geometry.coordinates[0]'
			, coord_1 varchar(100) '$.geometry.coordinates[1]'
			,   id varchar(100) '$.properties."caid"'
			, [First Name] varchar(100) '$.properties.fname'
			, Surname varchar(100) '$.properties.sname'
			, Battalion varchar(100) '$.properties.battalion'
			, Rank varchar(100) '$.properties.rank'
			, Enlisted varchar(100) '$.properties.enlisted'
			, [Killed In Action] varchar(100) '$.properties.kia'
			, Planter varchar(100) '$.properties.planter'
			, Location varchar(100) '$.properties."location"'
			, Status varchar(100) '$.properties.status'
			, Ward varchar(100) '$.properties.ward'
			, Suburb varchar(100) '$.properties.suburb'
			, Site varchar(100) '$.properties."site"'
        )

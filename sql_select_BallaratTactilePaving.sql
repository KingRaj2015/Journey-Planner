
--key	value	type
--name	BallaratTactilePaving	1
--type	FeatureCollection	1
--features	[  {"type":"Feature","geometry":{"type":"Point","coordinates":[143.885634003347,-37.5648150165401]},
	-- "properties":{
		-- "Area":"Eureka",
		--	"Central Asset ID":"00212721",
		--	"Class":"OS-Regional","Feature Location":"Eureka Stockade Reserve","Maintaining Authority":"City of Ballarat","Site Name":"Eureka Stockade",
		--  "Type":"Rectangular Rubber","Ward":"Central","long":"143.885634003347","lat":"-37.5648150165401"}} 

--declare @json nvarchar(max);
--set @json = (select geojson from geojson where datasourcename = 'BallaratTactilePaving');

select 'Tactile Paving' as FeatureName, 
	* from OPENJSON( (select geojson from geojson where datasourcename = 'BallaratTactilePaving'), '$.features') 
        WITH (
			  Type varchar(100) '$.properties.Type'
			,  lat varchar(100) '$.geometry.coordinates[1]'
			, long varchar(100) '$.geometry.coordinates[0]'
			,   id varchar(100) '$.properties."Central Asset ID"'
			,  Class varchar(100) '$.properties.Class'
			, Location varchar(100) '$.properties."Feature Location"'
			, Ward varchar(100) '$.properties.Ward'
			, Area varchar(100) '$.properties.Area'
			, Site varchar(100) '$.properties."Site Name"'
        )

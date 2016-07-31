
--{"type":"Feature","id":"4b112645_dcc3_4d55_a0f8_b900ef1b074d.1","geometry":
--	{"type":"Point","coordinates":[749330.84,5840757.94]},"geometry_name":"geom",
--	"properties":{"id":"00231715","cond":"Good","loc_name":"Flora","feat_type":"AH-Statue","maintain":"Ballarat City Council",
--	"site":"Ballarat Botanical Gardens","suburb":"Lake Wendouree","ward":"Central"}},

select 'Ballarat Artwork' as FeatureName, 
	* from OPENJSON( 
			(select geojson from geojson where datasourcename = 'BallaratArtwork'), 
				'$.features') 
        WITH (
			  type varchar(100) '$.properties.feat_type'
			, coord_0 varchar(100) '$.geometry.coordinates[0]'
			, coord_1 varchar(100) '$.geometry.coordinates[1]'
			,   id varchar(100) '$.properties.id'
			,  Condition varchar(100) '$.properties.cond'
			, Location varchar(100) '$.properties."loc_name"'
			, Ward varchar(100) '$.properties.ward'
			, Suburb varchar(100) '$.properties.suburb'
			, Site varchar(100) '$.properties.site'
        )

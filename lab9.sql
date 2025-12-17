CREATE EXTENSION postgis;

SELECT
ST_AsGML(geom,5) as GML,
ST_AsKML(geom,5) As KML,
ST_AsGeoJSON(geom,5) As GeoJSON,
ST_AsSVG(geom,0,5) As SVG_Absolute,
ST_AsSVG(geom,1,5) As SVG_Relative,
ST_AsX3D(geom,6) As X3D
FROM
(SELECT ST_GeomFromText('LINESTRING(2 48 1,0 51 1)',4326) As geom
) X;



SELECT i As rad_meters, ST_GeoHash(geog::geometry) as ghash 
FROM ( 
SELECT i, ST_Buffer(ST_GeogFromText('POINT(2 48)'), i) As geog 
FROM unnest(ARRAY[0.02,1,1000,10000,50000,150000]) AS i 
) As X; 


SELECT * INTO unconstrained_geoms
FROM (
  VALUES
  (ST_GeomFromText('POINT(-100 28 1)',4326)),
  (ST_GeomFromText('LINESTRING(-80 28 1,-90 29 1)',4326)),
  (ST_GeomFromText('POLYGONZ((10 28 1,9 29 1,7 30 1,10 28 1))'))
) As z(geom);




SELECT geom::geometry(LineString,4326) INTO constrained_geoms 
FROM ( 
VALUES 
(ST_GeomFromText('LINESTRING(-80 28, -90 29)', 4326)), 
(ST_GeomFromText('LINESTRING(10 28, 9 29, 7 30)', 4326 )) 
) As x(geom); 



ALTER TABLE constrained_geoms 
ALTER COLUMN geom TYPE geometry(LineString,4326); 


ALTER TABLE constrained_geoms 
ALTER COLUMN geom TYPE geometry(Geometry,4326); 


SELECT ST_GeomFromWKB(E'\\001\\001\\000\\000\\000\\321\\256B\\3120\\304Q\\300\\347\\030\\220\\275\\336%E@', 4326);


SELECT ST_AsBinary(
  ST_GeomFromWKB(E'\\001\\001\\000\\000\\000\\321\\256B\\3120\\304Q\\300\\347\\030\\220\\275\\336%E@', 4326)
);


SET bytea_output = hex;

SELECT ST_AsBinary(
  ST_GeomFromWKB(E'\\001\\001\\000\\000\\000\\321\\256B\\3120\\304Q\\300\\347\\030\\220\\275\\336%E@', 4326)
);









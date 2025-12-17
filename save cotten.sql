SELECT name,
       ST_Area(geom) AS area
FROM schools
WHERE closed = 1;




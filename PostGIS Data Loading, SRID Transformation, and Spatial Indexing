CREATE SCHEMA ch01;

CREATE TABLE ch01.lu_franchises (
  id char(3) PRIMARY KEY,
  franchise varchar(30)
);

INSERT INTO ch01.lu_franchises VALUES
 ('BKG','Burger King'),('CJR','Carl''s Jr'),
 ('HDE','Hardee'),('INO','In-N-Out'),
 ('JIB','Jack in the Box'),('KFC','Kentucky Fried Chicken'),
 ('MCD','McDonald'),('PZH','Pizza Hut'),
 ('TCB','Taco Bell'),('WDY','Wendy''s');


 CREATE TABLE ch01.restaurants (
  id serial PRIMARY KEY,
  franchise char(3) NOT NULL,
  geom geometry(Point,2163)
);
CREATE INDEX idx_restaurants_geom ON ch01.restaurants USING gist(geom);

CREATE TABLE ch01.restaurants_staging (
  franchise text,
  lat double precision,
  lon double precision
);


SELECT COUNT(*) FROM ch01.restaurants_staging;
SELECT * FROM ch01.restaurants_staging LIMIT 5;

INSERT INTO ch01.restaurants (franchise, geom)
SELECT 
    franchise,
    ST_Transform(ST_SetSRID(ST_Point(lon, lat), 4326), 2163) AS geom
FROM ch01.restaurants_staging;


SELECT COUNT(*) FROM ch01.restaurants;
SELECT * FROM ch01.restaurants LIMIT 5;

CREATE TABLE ch01.highways (
    gid integer NOT NULL,
    feature character varying(80),
    name character varying(120),
    state character varying(2),
    geom geometry(Geometry,2163),
    CONSTRAINT pk_highways PRIMARY KEY (gid)
);

CREATE INDEX idx_highways ON ch01.highways USING gist(geom);

DROP TABLE IF EXISTS ch01.highways CASCADE;

CREATE TABLE ch01.highways (
  gid    integer PRIMARY KEY,
  feature varchar(80),
  name    varchar(120),
  state   varchar(2),
  geom    geometry(MultiLineString, 2163)
);

CREATE INDEX idx_highways_geom ON ch01.highways USING gist(geom);


I
                 















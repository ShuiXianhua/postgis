--
-- spatial_ref_sys data
--
INSERT INTO "spatial_ref_sys" ("srid","auth_name","auth_srid","srtext","proj4text") VALUES (4326,'EPSG',4326,'GEOGCS["WGS 84",DATUM["WGS_1984",SPHEROID["WGS 84",6378137,298.257223563,AUTHORITY["EPSG","7030"]],TOWGS84[0,0,0,0,0,0,0],AUTHORITY["EPSG","6326"]],PRIMEM["Greenwich",0,AUTHORITY["EPSG","8901"]],UNIT["degree",0.01745329251994328,AUTHORITY["EPSG","9122"]],AUTHORITY["EPSG","4326"]]','+proj=longlat +ellps=WGS84 +datum=WGS84 +no_defs ');
--- EPSG 27572 : NTF (Paris) / Lambert zone II
INSERT INTO "spatial_ref_sys" ("srid","auth_name","auth_srid","srtext","proj4text") VALUES (27572,'EPSG',27572,'PROJCS["NTF (Paris) / Lambert zone II",GEOGCS["NTF (Paris)",DATUM["Nouvelle_Triangulation_Francaise_Paris",SPHEROID["Clarke 1880 (IGN)",6378249.2,293.4660212936269,AUTHORITY["EPSG","7011"]],TOWGS84[-168,-60,320,0,0,0,0],AUTHORITY["EPSG","6807"]],PRIMEM["Paris",2.33722917,AUTHORITY["EPSG","8903"]],UNIT["grad",0.01570796326794897,AUTHORITY["EPSG","9105"]],AUTHORITY["EPSG","4807"]],PROJECTION["Lambert_Conformal_Conic_1SP"],PARAMETER["latitude_of_origin",52],PARAMETER["central_meridian",0],PARAMETER["scale_factor",0.99987742],PARAMETER["false_easting",600000],PARAMETER["false_northing",2200000],UNIT["metre",1,AUTHORITY["EPSG","9001"]],AUTHORITY["EPSG","27572"]]','+proj=lcc +lat_1=46.8 +lat_0=46.8 +lon_0=0 +k_0=0.99987742 +x_0=600000 +y_0=2200000 +a=6378249.2 +b=6356515 +towgs84=-168,-60,320,0,0,0,0 +pm=paris +units=m +no_defs ');
--- EPSG 31467 : DHDN / Gauss-Kruger zone 3
INSERT INTO "spatial_ref_sys" ("srid","auth_name","auth_srid","srtext","proj4text") VALUES (31467,'EPSG',31467,'PROJCS["DHDN / Gauss-Kruger zone 3",GEOGCS["DHDN",DATUM["Deutsches_Hauptdreiecksnetz",SPHEROID["Bessel 1841",6377397.155,299.1528128,AUTHORITY["EPSG","7004"]],AUTHORITY["EPSG","6314"]],PRIMEM["Greenwich",0,AUTHORITY["EPSG","8901"]],UNIT["degree",0.01745329251994328,AUTHORITY["EPSG","9122"]],AUTHORITY["EPSG","4314"]],PROJECTION["Transverse_Mercator"],PARAMETER["latitude_of_origin",0],PARAMETER["central_meridian",9],PARAMETER["scale_factor",1],PARAMETER["false_easting",3500000],PARAMETER["false_northing",0],UNIT["metre",1,AUTHORITY["EPSG","9001"]],AUTHORITY["EPSG","31467"]]','+proj=tmerc +lat_0=0 +lon_0=9 +k=1.000000 +x_0=3500000 +y_0=0 +ellps=bessel +datum=potsdam +units=m +no_defs ');


-- Simple output
SELECT 'simple_point', ST_AsSVG(GeomFromEWKT('POINT(1 1)'));


-- Empty Geometry
SELECT 'empty_geom', ST_AsSVG(GeomFromEWKT(NULL));

-- Option
SELECT 'option_01', ST_AsSVG(GeomFromEWKT('SRID=4326;LINESTRING(1 1, 4 4, 5 7)'), 0);
SELECT 'option_02', ST_AsSVG(GeomFromEWKT('SRID=4326;LINESTRING(1 1, 4 4, 5 7)'), 1);
SELECT 'option_03', ST_AsSVG(GeomFromEWKT('SRID=4326;LINESTRING(1 1, 4 4, 5 7)'), 0, 0);
SELECT 'option_04', ST_AsSVG(GeomFromEWKT('SRID=4326;LINESTRING(1 1, 4 4, 5 7)'), 1, 0);

-- Precision
SELECT 'precision_01', ST_AsSVG(GeomFromEWKT('SRID=4326;POINT(1.1111111 1.1111111)'), 0);
SELECT 'precision_02', ST_AsSVG(GeomFromEWKT('SRID=4326;POINT(1.1111111 1.1111111)'), 3);
SELECT 'precision_03', ST_AsSVG(GeomFromEWKT('SRID=4326;POINT(1.1111111 1.1111111)'), -2);
SELECT 'precision_04', ST_AsSVG(GeomFromEWKT('SRID=4326;POINT(1.1111111 1.1111111)'), 19);


  
--
-- Line
--

-- Geometry from frida project: <http://frida.intevation.org/>
SELECT 'line_01', ST_AsSVG(GeomFromEWKT('LINESTRING(3429562.6 5799490.68,3429750.99 5799199.87,3429825.45 5799078.39,3429901.8 5798961.45,3429995.54 5798822.93,3430072.89 5798719.46,3430216 5798558.95,3430272.08 5798489.33,3430393.87 5798328.51,3430463.53 5798251.11,3430532.22 5798190.16,3430591.24 5798149.53,3430667.67 5798108.9,3430723.78 5798088.58,3430797.33 5798067.95,3430857.34 5798056.34,3430912.52 5798051.5,3430961.89 5798048.59,3431052.88 5798053.43,3431159.36 5798059.24,3431218.41 5798061.18,3431366.56 5798056.09,3431474.07 5798044.47,3431568.02 5798028.97,3431644.53 5798012.51)'), 0);

SELECT 'line_02', ST_AsSVG(GeomFromEWKT('LINESTRING(3429562.6 5799490.68,3429750.99 5799199.87,3429825.45 5799078.39,3429901.8 5798961.45,3429995.54 5798822.93,3430072.89 5798719.46,3430216 5798558.95,3430272.08 5798489.33,3430393.87 5798328.51,3430463.53 5798251.11,3430532.22 5798190.16,3430591.24 5798149.53,3430667.67 5798108.9,3430723.78 5798088.58,3430797.33 5798067.95,3430857.34 5798056.34,3430912.52 5798051.5,3430961.89 5798048.59,3431052.88 5798053.43,3431159.36 5798059.24,3431218.41 5798061.18,3431366.56 5798056.09,3431474.07 5798044.47,3431568.02 5798028.97,3431644.53 5798012.51)'), 1);


SELECT 'line_03', ST_AsSVG(GeomFromEWKT('LINESTRING(3429562.6 5799490.68,3429750.99 5799199.87,3429825.45 5799078.39,3429901.8 5798961.45,3429995.54 5798822.93,3430072.89 5798719.46,3430216 5798558.95,3430272.08 5798489.33,3430393.87 5798328.51,3430463.53 5798251.11,3430532.22 5798190.16,3430591.24 5798149.53,3430667.67 5798108.9,3430723.78 5798088.58,3430797.33 5798067.95,3430857.34 5798056.34,3430912.52 5798051.5,3430961.89 5798048.59,3431052.88 5798053.43,3431159.36 5798059.24,3431218.41 5798061.18,3431366.56 5798056.09,3431474.07 5798044.47,3431568.02 5798028.97,3431644.53 5798012.51)'), 0, 0);

SELECT 'line_04', ST_AsSVG(GeomFromEWKT('LINESTRING(3429562.6 5799490.68,3429750.99 5799199.87,3429825.45 5799078.39,3429901.8 5798961.45,3429995.54 5798822.93,3430072.89 5798719.46,3430216 5798558.95,3430272.08 5798489.33,3430393.87 5798328.51,3430463.53 5798251.11,3430532.22 5798190.16,3430591.24 5798149.53,3430667.67 5798108.9,3430723.78 5798088.58,3430797.33 5798067.95,3430857.34 5798056.34,3430912.52 5798051.5,3430961.89 5798048.59,3431052.88 5798053.43,3431159.36 5798059.24,3431218.41 5798061.18,3431366.56 5798056.09,3431474.07 5798044.47,3431568.02 5798028.97,3431644.53 5798012.51)'), 1, 0);



--
-- Polygon
--

-- Geometry from frida project: <http://frida.intevation.org/>

SELECT 'polygon_01', ST_AsSVG(GeomFromEWKT('POLYGON((3429857.62 5799440.07,3429873.86 5799496.16,3429904.86 5799503.55,3429972.77 5799561.12,3430034.77 5799577.36,3430031.82 5799639.36,3430139.59 5799691.03,3430146.97 5799724.99,3430271.57 5799792.88,3430289.29 5799776.64,3430312.91 5799662.95,3430416.27 5799710.2,3430419.22 5799614.22,3430268.61 5799612.75,3430291.3 5799203.76,3430255.86 5799175.7,3430214.51 5799347,3430183.49 5799355.87,3430180.54 5799366.2,3430146.57 5799367.68,3430142.14 5799349.96,3430065.35 5799375.06,3429961.97 5799426.75,3429857.62 5799440.07))'), 0);

SELECT 'polygon_02', ST_AsSVG(GeomFromEWKT('POLYGON((3429857.62 5799440.07,3429873.86 5799496.16,3429904.86 5799503.55,3429972.77 5799561.12,3430034.77 5799577.36,3430031.82 5799639.36,3430139.59 5799691.03,3430146.97 5799724.99,3430271.57 5799792.88,3430289.29 5799776.64,3430312.91 5799662.95,3430416.27 5799710.2,3430419.22 5799614.22,3430268.61 5799612.75,3430291.3 5799203.76,3430255.86 5799175.7,3430214.51 5799347,3430183.49 5799355.87,3430180.54 5799366.2,3430146.57 5799367.68,3430142.14 5799349.96,3430065.35 5799375.06,3429961.97 5799426.75,3429857.62 5799440.07))'), 1);

SELECT 'polygon_03', ST_AsSVG(GeomFromEWKT('POLYGON((3429857.62 5799440.07,3429873.86 5799496.16,3429904.86 5799503.55,3429972.77 5799561.12,3430034.77 5799577.36,3430031.82 5799639.36,3430139.59 5799691.03,3430146.97 5799724.99,3430271.57 5799792.88,3430289.29 5799776.64,3430312.91 5799662.95,3430416.27 5799710.2,3430419.22 5799614.22,3430268.61 5799612.75,3430291.3 5799203.76,3430255.86 5799175.7,3430214.51 5799347,3430183.49 5799355.87,3430180.54 5799366.2,3430146.57 5799367.68,3430142.14 5799349.96,3430065.35 5799375.06,3429961.97 5799426.75,3429857.62 5799440.07))'), 0, 0);

SELECT 'polygon_04', ST_AsSVG(GeomFromEWKT('POLYGON((3429857.62 5799440.07,3429873.86 5799496.16,3429904.86 5799503.55,3429972.77 5799561.12,3430034.77 5799577.36,3430031.82 5799639.36,3430139.59 5799691.03,3430146.97 5799724.99,3430271.57 5799792.88,3430289.29 5799776.64,3430312.91 5799662.95,3430416.27 5799710.2,3430419.22 5799614.22,3430268.61 5799612.75,3430291.3 5799203.76,3430255.86 5799175.7,3430214.51 5799347,3430183.49 5799355.87,3430180.54 5799366.2,3430146.57 5799367.68,3430142.14 5799349.96,3430065.35 5799375.06,3429961.97 5799426.75,3429857.62 5799440.07))'), 1, 0);


--
-- Multipoint
--

-- SELECT astext(collect(the_geom)) FROM poi WHERE poitypname='Schule';
-- Geometry from frida project: <http://frida.intevation.org/>

SELECT 'multipoint_01', ST_AsSVG(GeomFromEWKT('MULTIPOINT(3433276.43 5795308.93,3428545.3 5795827.75,3431576.99 5799084.19,3431724.2 5797152.59,3431984.2 5796564.79,3435147.61 5797649.58,3434660.86 5796941.74,3434674.52 5797030.54,3435714.36 5797022.6,3436368.88 5796951.04,3436730.03 5796768.6,3435538.55 5796267.1,3435847.22 5795917.96,3434312.09 5794846.02,3433121.69 5793670.73,3433176.36 5793489.29,3434316.04 5793940.09,3433222.92 5793040.49,3433416.13 5792891.62,3430717.47 5792600.58,3435384.08 5792877.68,3435229.15 5792177.25,3435120 5792319.07,3435088.72 5792111.21,3434484.89 5792110.2,3435777.91 5792419.49,3435717.37 5794318.12,3436895.13 5794569.43,3437621.86 5793931.6,3435597.14 5793467.9,3435246.51 5793394.63,3434722.1 5793374.87,3434712.16 5793810.3,3434773.28 5793816.87,3434629.91 5793855.31,3434992.34 5794140.1,3434927.13 5794252.29,3434958.58 5794286.16,3435120.48 5794163.36,3435850.1 5791727.49,3435930.75 5791636.32,3436268.87 5791882.68,3437110.23 5791664.12,3435960.34 5790928.2,3433545.81 5789755.43,3439096.86 5790884.26,3438576.87 5795046.69,3438396.95 5794858.59,3438193.25 5794695.6,3438447.92 5796130.77,3440688.22 5793670.37)'), 0);

SELECT 'multipoint_02', ST_AsSVG(GeomFromEWKT('MULTIPOINT(3433276.43 5795308.93,3428545.3 5795827.75,3431576.99 5799084.19,3431724.2 5797152.59,3431984.2 5796564.79,3435147.61 5797649.58,3434660.86 5796941.74,3434674.52 5797030.54,3435714.36 5797022.6,3436368.88 5796951.04,3436730.03 5796768.6,3435538.55 5796267.1,3435847.22 5795917.96,3434312.09 5794846.02,3433121.69 5793670.73,3433176.36 5793489.29,3434316.04 5793940.09,3433222.92 5793040.49,3433416.13 5792891.62,3430717.47 5792600.58,3435384.08 5792877.68,3435229.15 5792177.25,3435120 5792319.07,3435088.72 5792111.21,3434484.89 5792110.2,3435777.91 5792419.49,3435717.37 5794318.12,3436895.13 5794569.43,3437621.86 5793931.6,3435597.14 5793467.9,3435246.51 5793394.63,3434722.1 5793374.87,3434712.16 5793810.3,3434773.28 5793816.87,3434629.91 5793855.31,3434992.34 5794140.1,3434927.13 5794252.29,3434958.58 5794286.16,3435120.48 5794163.36,3435850.1 5791727.49,3435930.75 5791636.32,3436268.87 5791882.68,3437110.23 5791664.12,3435960.34 5790928.2,3433545.81 5789755.43,3439096.86 5790884.26,3438576.87 5795046.69,3438396.95 5794858.59,3438193.25 5794695.6,3438447.92 5796130.77,3440688.22 5793670.37)'), 1);


SELECT 'multipoint_03', ST_AsSVG(GeomFromEWKT('MULTIPOINT(3433276.43 5795308.93,3428545.3 5795827.75,3431576.99 5799084.19,3431724.2 5797152.59,3431984.2 5796564.79,3435147.61 5797649.58,3434660.86 5796941.74,3434674.52 5797030.54,3435714.36 5797022.6,3436368.88 5796951.04,3436730.03 5796768.6,3435538.55 5796267.1,3435847.22 5795917.96,3434312.09 5794846.02,3433121.69 5793670.73,3433176.36 5793489.29,3434316.04 5793940.09,3433222.92 5793040.49,3433416.13 5792891.62,3430717.47 5792600.58,3435384.08 5792877.68,3435229.15 5792177.25,3435120 5792319.07,3435088.72 5792111.21,3434484.89 5792110.2,3435777.91 5792419.49,3435717.37 5794318.12,3436895.13 5794569.43,3437621.86 5793931.6,3435597.14 5793467.9,3435246.51 5793394.63,3434722.1 5793374.87,3434712.16 5793810.3,3434773.28 5793816.87,3434629.91 5793855.31,3434992.34 5794140.1,3434927.13 5794252.29,3434958.58 5794286.16,3435120.48 5794163.36,3435850.1 5791727.49,3435930.75 5791636.32,3436268.87 5791882.68,3437110.23 5791664.12,3435960.34 5790928.2,3433545.81 5789755.43,3439096.86 5790884.26,3438576.87 5795046.69,3438396.95 5794858.59,3438193.25 5794695.6,3438447.92 5796130.77,3440688.22 5793670.37)'), 0, 0);

SELECT 'multipoint_04', ST_AsSVG(GeomFromEWKT('MULTIPOINT(3433276.43 5795308.93,3428545.3 5795827.75,3431576.99 5799084.19,3431724.2 5797152.59,3431984.2 5796564.79,3435147.61 5797649.58,3434660.86 5796941.74,3434674.52 5797030.54,3435714.36 5797022.6,3436368.88 5796951.04,3436730.03 5796768.6,3435538.55 5796267.1,3435847.22 5795917.96,3434312.09 5794846.02,3433121.69 5793670.73,3433176.36 5793489.29,3434316.04 5793940.09,3433222.92 5793040.49,3433416.13 5792891.62,3430717.47 5792600.58,3435384.08 5792877.68,3435229.15 5792177.25,3435120 5792319.07,3435088.72 5792111.21,3434484.89 5792110.2,3435777.91 5792419.49,3435717.37 5794318.12,3436895.13 5794569.43,3437621.86 5793931.6,3435597.14 5793467.9,3435246.51 5793394.63,3434722.1 5793374.87,3434712.16 5793810.3,3434773.28 5793816.87,3434629.91 5793855.31,3434992.34 5794140.1,3434927.13 5794252.29,3434958.58 5794286.16,3435120.48 5794163.36,3435850.1 5791727.49,3435930.75 5791636.32,3436268.87 5791882.68,3437110.23 5791664.12,3435960.34 5790928.2,3433545.81 5789755.43,3439096.86 5790884.26,3438576.87 5795046.69,3438396.95 5794858.59,3438193.25 5794695.6,3438447.92 5796130.77,3440688.22 5793670.37)'), 1, 0);



--
-- MultiLine
--
-- Geometry from frida project: <http://frida.intevation.org/>
-- SELECT st_astext(st_linemerge(the_geom)) FROM river WHERE glname='Stichkanal';

SELECT 'multiline_01', ST_AsSVG(GeomFromEWKT('MULTILINESTRING((3429562.6 5799490.68,3429750.99 5799199.87,3429825.45 5799078.39,3429901.8 5798961.45,3429995.54 5798822.93,3430072.89 5798719.46,3430216 5798558.95,3430272.08 5798489.33,3430393.87 5798328.51,3430463.53 5798251.11,3430532.22 5798190.16,3430591.24 5798149.53,3430667.67 5798108.9,3430723.78 5798088.58,3430797.33 5798067.95,3430857.34 5798056.34,3430912.52 5798051.5,3430961.89 5798048.59,3431052.88 5798053.43,3431159.36 5798059.24,3431218.41 5798061.18,3431366.56 5798056.09,3431474.07 5798044.47,3431568.02 5798028.97,3431644.53 5798012.51),(3433260.06 5797002.92,3433234.61 5797070.25,3433138.56 5797278.81,3433074.19 5797398.94,3433033.73 5797461.79,3432961.43 5797551.84,3432882.76 5797626.57,3432780.32 5797701.09,3432706.28 5797743.23,3432542.66 5797808.05,3432360.32 5797842.47,3432258.52 5797836.77,3432197.62 5797837.57,3432081.75 5797865.64,3431876.6 5797945.1,3431865.15 5797948.73),(3431865.15 5797948.73,3431644.53 5798012.51),(3431865.15 5797948.73,3431815.75 5797807.76),(3433260.06 5797002.92,3433361.19 5796788.54,3433467.4 5796572.78,3433670.6 5796160.06),(3433670.6 5796160.06,3433709.27 5796096.88,3433744.46 5796021.84,3433861.98 5795869.38,3434029.1 5795680.43,3434229.42 5795456.34,3434239.36 5795425.11,3434296.02 5795363.18))'), 0);

SELECT 'multiline_02', ST_AsSVG(GeomFromEWKT('MULTILINESTRING((3429562.6 5799490.68,3429750.99 5799199.87,3429825.45 5799078.39,3429901.8 5798961.45,3429995.54 5798822.93,3430072.89 5798719.46,3430216 5798558.95,3430272.08 5798489.33,3430393.87 5798328.51,3430463.53 5798251.11,3430532.22 5798190.16,3430591.24 5798149.53,3430667.67 5798108.9,3430723.78 5798088.58,3430797.33 5798067.95,3430857.34 5798056.34,3430912.52 5798051.5,3430961.89 5798048.59,3431052.88 5798053.43,3431159.36 5798059.24,3431218.41 5798061.18,3431366.56 5798056.09,3431474.07 5798044.47,3431568.02 5798028.97,3431644.53 5798012.51),(3433260.06 5797002.92,3433234.61 5797070.25,3433138.56 5797278.81,3433074.19 5797398.94,3433033.73 5797461.79,3432961.43 5797551.84,3432882.76 5797626.57,3432780.32 5797701.09,3432706.28 5797743.23,3432542.66 5797808.05,3432360.32 5797842.47,3432258.52 5797836.77,3432197.62 5797837.57,3432081.75 5797865.64,3431876.6 5797945.1,3431865.15 5797948.73),(3431865.15 5797948.73,3431644.53 5798012.51),(3431865.15 5797948.73,3431815.75 5797807.76),(3433260.06 5797002.92,3433361.19 5796788.54,3433467.4 5796572.78,3433670.6 5796160.06),(3433670.6 5796160.06,3433709.27 5796096.88,3433744.46 5796021.84,3433861.98 5795869.38,3434029.1 5795680.43,3434229.42 5795456.34,3434239.36 5795425.11,3434296.02 5795363.18))'), 1);
 
SELECT 'multiline_03', ST_AsSVG(GeomFromEWKT('MULTILINESTRING((3429562.6 5799490.68,3429750.99 5799199.87,3429825.45 5799078.39,3429901.8 5798961.45,3429995.54 5798822.93,3430072.89 5798719.46,3430216 5798558.95,3430272.08 5798489.33,3430393.87 5798328.51,3430463.53 5798251.11,3430532.22 5798190.16,3430591.24 5798149.53,3430667.67 5798108.9,3430723.78 5798088.58,3430797.33 5798067.95,3430857.34 5798056.34,3430912.52 5798051.5,3430961.89 5798048.59,3431052.88 5798053.43,3431159.36 5798059.24,3431218.41 5798061.18,3431366.56 5798056.09,3431474.07 5798044.47,3431568.02 5798028.97,3431644.53 5798012.51),(3433260.06 5797002.92,3433234.61 5797070.25,3433138.56 5797278.81,3433074.19 5797398.94,3433033.73 5797461.79,3432961.43 5797551.84,3432882.76 5797626.57,3432780.32 5797701.09,3432706.28 5797743.23,3432542.66 5797808.05,3432360.32 5797842.47,3432258.52 5797836.77,3432197.62 5797837.57,3432081.75 5797865.64,3431876.6 5797945.1,3431865.15 5797948.73),(3431865.15 5797948.73,3431644.53 5798012.51),(3431865.15 5797948.73,3431815.75 5797807.76),(3433260.06 5797002.92,3433361.19 5796788.54,3433467.4 5796572.78,3433670.6 5796160.06),(3433670.6 5796160.06,3433709.27 5796096.88,3433744.46 5796021.84,3433861.98 5795869.38,3434029.1 5795680.43,3434229.42 5795456.34,3434239.36 5795425.11,3434296.02 5795363.18))'), 0, 0);

SELECT 'multiline_04', ST_AsSVG(GeomFromEWKT('MULTILINESTRING((3429562.6 5799490.68,3429750.99 5799199.87,3429825.45 5799078.39,3429901.8 5798961.45,3429995.54 5798822.93,3430072.89 5798719.46,3430216 5798558.95,3430272.08 5798489.33,3430393.87 5798328.51,3430463.53 5798251.11,3430532.22 5798190.16,3430591.24 5798149.53,3430667.67 5798108.9,3430723.78 5798088.58,3430797.33 5798067.95,3430857.34 5798056.34,3430912.52 5798051.5,3430961.89 5798048.59,3431052.88 5798053.43,3431159.36 5798059.24,3431218.41 5798061.18,3431366.56 5798056.09,3431474.07 5798044.47,3431568.02 5798028.97,3431644.53 5798012.51),(3433260.06 5797002.92,3433234.61 5797070.25,3433138.56 5797278.81,3433074.19 5797398.94,3433033.73 5797461.79,3432961.43 5797551.84,3432882.76 5797626.57,3432780.32 5797701.09,3432706.28 5797743.23,3432542.66 5797808.05,3432360.32 5797842.47,3432258.52 5797836.77,3432197.62 5797837.57,3432081.75 5797865.64,3431876.6 5797945.1,3431865.15 5797948.73),(3431865.15 5797948.73,3431644.53 5798012.51),(3431865.15 5797948.73,3431815.75 5797807.76),(3433260.06 5797002.92,3433361.19 5796788.54,3433467.4 5796572.78,3433670.6 5796160.06),(3433670.6 5796160.06,3433709.27 5796096.88,3433744.46 5796021.84,3433861.98 5795869.38,3434029.1 5795680.43,3434229.42 5795456.34,3434239.36 5795425.11,3434296.02 5795363.18))'), 1, 0);
 


--
-- MultiPolygon
--

-- Geometry from frida project: <http://frida.intevation.org/>
-- Leyer Holz Park
-- st_astext(geomunion(the_geom)) FROM park WHERE gfname='Leyer Holz';

SELECT 'multipolygon_01', ST_AsSVG(GeomFromEWKT('MULTIPOLYGON(((3429699.81 5795851.64,3429736.72 5795796.01,3429754.71 5795768.88,3429996.1 5795489.98,3430100.67 5795435.76,3430122.61 5795446.09,3430138.1 5795560.98,3430311.09 5795559.69,3430309.8 5795470.62,3430329.16 5795416.4,3430326.58 5795399.62,3430157.47 5795418.98,3430156.14 5795407.32,3430139.36 5795396.99,3429983.19 5795394.41,3429976.74 5795420.22,3429789.59 5795418.93,3429643.74 5795475.72,3429635.72 5795615.31,3429484.94 5795556.38,3429315.44 5795496.32,3429326.12 5795748.57,3429129.92 5795704.53,3429176.64 5795776.6,3429100.6 5795797.17,3428900.44 5795742.46,3428896.43 5795779.82,3428805.69 5795953.3,3428897.77 5796025.35,3428897.77 5796225.99,3428696.32 5796199.31,3428681.64 5796217.99,3428680.31 5796290.03,3428290.14 5796351.8,3428389.67 5796413.87,3428837.71 5796561.12,3428991.08 5796495.01,3429076.4 5796760.29,3429428.31 5796723.61,3429474.96 5796690.29,3429696.2 5796600.99,3429658.88 5796429.06,3429536.27 5796363.75,3429529.6 5796333.1,3429446.08 5796253.84,3429699.81 5795851.64)),((3429857.62 5799440.07,3429873.86 5799496.16,3429904.86 5799503.55,3429972.77 5799561.12,3430034.77 5799577.36,3430031.82 5799639.36,3430139.59 5799691.03,3430146.97 5799724.99,3430271.57 5799792.88,3430289.29 5799776.64,3430312.91 5799662.95,3430416.27 5799710.2,3430419.22 5799614.22,3430268.61 5799612.75,3430291.3 5799203.76,3430255.86 5799175.7,3430214.51 5799347,3430183.49 5799355.87,3430180.54 5799366.2,3430146.57 5799367.68,3430142.14 5799349.96,3430065.35 5799375.06,3429961.97 5799426.75,3429857.62 5799440.07)))'), 0);

SELECT 'multipolygon_02', ST_AsSVG(GeomFromEWKT('MULTIPOLYGON(((3429699.81 5795851.64,3429736.72 5795796.01,3429754.71 5795768.88,3429996.1 5795489.98,3430100.67 5795435.76,3430122.61 5795446.09,3430138.1 5795560.98,3430311.09 5795559.69,3430309.8 5795470.62,3430329.16 5795416.4,3430326.58 5795399.62,3430157.47 5795418.98,3430156.14 5795407.32,3430139.36 5795396.99,3429983.19 5795394.41,3429976.74 5795420.22,3429789.59 5795418.93,3429643.74 5795475.72,3429635.72 5795615.31,3429484.94 5795556.38,3429315.44 5795496.32,3429326.12 5795748.57,3429129.92 5795704.53,3429176.64 5795776.6,3429100.6 5795797.17,3428900.44 5795742.46,3428896.43 5795779.82,3428805.69 5795953.3,3428897.77 5796025.35,3428897.77 5796225.99,3428696.32 5796199.31,3428681.64 5796217.99,3428680.31 5796290.03,3428290.14 5796351.8,3428389.67 5796413.87,3428837.71 5796561.12,3428991.08 5796495.01,3429076.4 5796760.29,3429428.31 5796723.61,3429474.96 5796690.29,3429696.2 5796600.99,3429658.88 5796429.06,3429536.27 5796363.75,3429529.6 5796333.1,3429446.08 5796253.84,3429699.81 5795851.64)),((3429857.62 5799440.07,3429873.86 5799496.16,3429904.86 5799503.55,3429972.77 5799561.12,3430034.77 5799577.36,3430031.82 5799639.36,3430139.59 5799691.03,3430146.97 5799724.99,3430271.57 5799792.88,3430289.29 5799776.64,3430312.91 5799662.95,3430416.27 5799710.2,3430419.22 5799614.22,3430268.61 5799612.75,3430291.3 5799203.76,3430255.86 5799175.7,3430214.51 5799347,3430183.49 5799355.87,3430180.54 5799366.2,3430146.57 5799367.68,3430142.14 5799349.96,3430065.35 5799375.06,3429961.97 5799426.75,3429857.62 5799440.07)))'), 1);

SELECT 'multipolygon_03', ST_AsSVG(GeomFromEWKT('MULTIPOLYGON(((3429699.81 5795851.64,3429736.72 5795796.01,3429754.71 5795768.88,3429996.1 5795489.98,3430100.67 5795435.76,3430122.61 5795446.09,3430138.1 5795560.98,3430311.09 5795559.69,3430309.8 5795470.62,3430329.16 5795416.4,3430326.58 5795399.62,3430157.47 5795418.98,3430156.14 5795407.32,3430139.36 5795396.99,3429983.19 5795394.41,3429976.74 5795420.22,3429789.59 5795418.93,3429643.74 5795475.72,3429635.72 5795615.31,3429484.94 5795556.38,3429315.44 5795496.32,3429326.12 5795748.57,3429129.92 5795704.53,3429176.64 5795776.6,3429100.6 5795797.17,3428900.44 5795742.46,3428896.43 5795779.82,3428805.69 5795953.3,3428897.77 5796025.35,3428897.77 5796225.99,3428696.32 5796199.31,3428681.64 5796217.99,3428680.31 5796290.03,3428290.14 5796351.8,3428389.67 5796413.87,3428837.71 5796561.12,3428991.08 5796495.01,3429076.4 5796760.29,3429428.31 5796723.61,3429474.96 5796690.29,3429696.2 5796600.99,3429658.88 5796429.06,3429536.27 5796363.75,3429529.6 5796333.1,3429446.08 5796253.84,3429699.81 5795851.64)),((3429857.62 5799440.07,3429873.86 5799496.16,3429904.86 5799503.55,3429972.77 5799561.12,3430034.77 5799577.36,3430031.82 5799639.36,3430139.59 5799691.03,3430146.97 5799724.99,3430271.57 5799792.88,3430289.29 5799776.64,3430312.91 5799662.95,3430416.27 5799710.2,3430419.22 5799614.22,3430268.61 5799612.75,3430291.3 5799203.76,3430255.86 5799175.7,3430214.51 5799347,3430183.49 5799355.87,3430180.54 5799366.2,3430146.57 5799367.68,3430142.14 5799349.96,3430065.35 5799375.06,3429961.97 5799426.75,3429857.62 5799440.07)))'), 0, 0);

SELECT 'multipolygon_04', ST_AsSVG(GeomFromEWKT('MULTIPOLYGON(((3429699.81 5795851.64,3429736.72 5795796.01,3429754.71 5795768.88,3429996.1 5795489.98,3430100.67 5795435.76,3430122.61 5795446.09,3430138.1 5795560.98,3430311.09 5795559.69,3430309.8 5795470.62,3430329.16 5795416.4,3430326.58 5795399.62,3430157.47 5795418.98,3430156.14 5795407.32,3430139.36 5795396.99,3429983.19 5795394.41,3429976.74 5795420.22,3429789.59 5795418.93,3429643.74 5795475.72,3429635.72 5795615.31,3429484.94 5795556.38,3429315.44 5795496.32,3429326.12 5795748.57,3429129.92 5795704.53,3429176.64 5795776.6,3429100.6 5795797.17,3428900.44 5795742.46,3428896.43 5795779.82,3428805.69 5795953.3,3428897.77 5796025.35,3428897.77 5796225.99,3428696.32 5796199.31,3428681.64 5796217.99,3428680.31 5796290.03,3428290.14 5796351.8,3428389.67 5796413.87,3428837.71 5796561.12,3428991.08 5796495.01,3429076.4 5796760.29,3429428.31 5796723.61,3429474.96 5796690.29,3429696.2 5796600.99,3429658.88 5796429.06,3429536.27 5796363.75,3429529.6 5796333.1,3429446.08 5796253.84,3429699.81 5795851.64)),((3429857.62 5799440.07,3429873.86 5799496.16,3429904.86 5799503.55,3429972.77 5799561.12,3430034.77 5799577.36,3430031.82 5799639.36,3430139.59 5799691.03,3430146.97 5799724.99,3430271.57 5799792.88,3430289.29 5799776.64,3430312.91 5799662.95,3430416.27 5799710.2,3430419.22 5799614.22,3430268.61 5799612.75,3430291.3 5799203.76,3430255.86 5799175.7,3430214.51 5799347,3430183.49 5799355.87,3430180.54 5799366.2,3430146.57 5799367.68,3430142.14 5799349.96,3430065.35 5799375.06,3429961.97 5799426.75,3429857.62 5799440.07)))'), 1, 0);


--
-- GeometryCollection
--

-- SELECT astext(collect((SELECT collect(the_geom) FROM poi WHERE poitypname='Schule'), (SELECT collect(st_linemerge(the_geom)) FROM river WHERE glname='Stichkanal')));

-- Geometry from frida project: <http://frida.intevation.org/>
SELECT 'geometrycollection_01', ST_AsSVG(GeomFromEWKT('GEOMETRYCOLLECTION(MULTIPOINT(3433276.43 5795308.93,3428545.3 5795827.75,3431576.99 5799084.19,3431724.2 5797152.59,3431984.2 5796564.79,3435147.61 5797649.58,3434660.86 5796941.74,3434674.52 5797030.54,3435714.36 5797022.6,3436368.88 5796951.04,3436730.03 5796768.6,3435538.55 5796267.1,3435847.22 5795917.96,3434312.09 5794846.02,3433121.69 5793670.73,3433176.36 5793489.29,3434316.04 5793940.09,3433222.92 5793040.49,3433416.13 5792891.62,3430717.47 5792600.58,3435384.08 5792877.68,3435229.15 5792177.25,3435120 5792319.07,3435088.72 5792111.21,3434484.89 5792110.2,3435777.91 5792419.49,3435717.37 5794318.12,3436895.13 5794569.43,3437621.86 5793931.6,3435597.14 5793467.9,3435246.51 5793394.63,3434722.1 5793374.87,3434712.16 5793810.3,3434773.28 5793816.87,3434629.91 5793855.31,3434992.34 5794140.1,3434927.13 5794252.29,3434958.58 5794286.16,3435120.48 5794163.36,3435850.1 5791727.49,3435930.75 5791636.32,3436268.87 5791882.68,3437110.23 5791664.12,3435960.34 5790928.2,3433545.81 5789755.43,3439096.86 5790884.26,3438576.87 5795046.69,3438396.95 5794858.59,3438193.25 5794695.6,3438447.92 5796130.77,3440688.22 5793670.37),MULTILINESTRING((3429562.6 5799490.68,3429750.99 5799199.87,3429825.45 5799078.39,3429901.8 5798961.45,3429995.54 5798822.93,3430072.89 5798719.46,3430216 5798558.95,3430272.08 5798489.33,3430393.87 5798328.51,3430463.53 5798251.11,3430532.22 5798190.16,3430591.24 5798149.53,3430667.67 5798108.9,3430723.78 5798088.58,3430797.33 5798067.95,3430857.34 5798056.34,3430912.52 5798051.5,3430961.89 5798048.59,3431052.88 5798053.43,3431159.36 5798059.24,3431218.41 5798061.18,3431366.56 5798056.09,3431474.07 5798044.47,3431568.02 5798028.97,3431644.53 5798012.51),(3433260.06 5797002.92,3433234.61 5797070.25,3433138.56 5797278.81,3433074.19 5797398.94,3433033.73 5797461.79,3432961.43 5797551.84,3432882.76 5797626.57,3432780.32 5797701.09,3432706.28 5797743.23,3432542.66 5797808.05,3432360.32 5797842.47,3432258.52 5797836.77,3432197.62 5797837.57,3432081.75 5797865.64,3431876.6 5797945.1,3431865.15 5797948.73),(3431865.15 5797948.73,3431644.53 5798012.51),(3431865.15 5797948.73,3431815.75 5797807.76),(3433260.06 5797002.92,3433361.19 5796788.54,3433467.4 5796572.78,3433670.6 5796160.06),(3433670.6 5796160.06,3433709.27 5796096.88,3433744.46 5796021.84,3433861.98 5795869.38,3434029.1 5795680.43,3434229.42 5795456.34,3434239.36 5795425.11,3434296.02 5795363.18)))'), 0);


SELECT 'geometrycollection_02', ST_AsSVG(GeomFromEWKT('GEOMETRYCOLLECTION(MULTIPOINT(3433276.43 5795308.93,3428545.3 5795827.75,3431576.99 5799084.19,3431724.2 5797152.59,3431984.2 5796564.79,3435147.61 5797649.58,3434660.86 5796941.74,3434674.52 5797030.54,3435714.36 5797022.6,3436368.88 5796951.04,3436730.03 5796768.6,3435538.55 5796267.1,3435847.22 5795917.96,3434312.09 5794846.02,3433121.69 5793670.73,3433176.36 5793489.29,3434316.04 5793940.09,3433222.92 5793040.49,3433416.13 5792891.62,3430717.47 5792600.58,3435384.08 5792877.68,3435229.15 5792177.25,3435120 5792319.07,3435088.72 5792111.21,3434484.89 5792110.2,3435777.91 5792419.49,3435717.37 5794318.12,3436895.13 5794569.43,3437621.86 5793931.6,3435597.14 5793467.9,3435246.51 5793394.63,3434722.1 5793374.87,3434712.16 5793810.3,3434773.28 5793816.87,3434629.91 5793855.31,3434992.34 5794140.1,3434927.13 5794252.29,3434958.58 5794286.16,3435120.48 5794163.36,3435850.1 5791727.49,3435930.75 5791636.32,3436268.87 5791882.68,3437110.23 5791664.12,3435960.34 5790928.2,3433545.81 5789755.43,3439096.86 5790884.26,3438576.87 5795046.69,3438396.95 5794858.59,3438193.25 5794695.6,3438447.92 5796130.77,3440688.22 5793670.37),MULTILINESTRING((3429562.6 5799490.68,3429750.99 5799199.87,3429825.45 5799078.39,3429901.8 5798961.45,3429995.54 5798822.93,3430072.89 5798719.46,3430216 5798558.95,3430272.08 5798489.33,3430393.87 5798328.51,3430463.53 5798251.11,3430532.22 5798190.16,3430591.24 5798149.53,3430667.67 5798108.9,3430723.78 5798088.58,3430797.33 5798067.95,3430857.34 5798056.34,3430912.52 5798051.5,3430961.89 5798048.59,3431052.88 5798053.43,3431159.36 5798059.24,3431218.41 5798061.18,3431366.56 5798056.09,3431474.07 5798044.47,3431568.02 5798028.97,3431644.53 5798012.51),(3433260.06 5797002.92,3433234.61 5797070.25,3433138.56 5797278.81,3433074.19 5797398.94,3433033.73 5797461.79,3432961.43 5797551.84,3432882.76 5797626.57,3432780.32 5797701.09,3432706.28 5797743.23,3432542.66 5797808.05,3432360.32 5797842.47,3432258.52 5797836.77,3432197.62 5797837.57,3432081.75 5797865.64,3431876.6 5797945.1,3431865.15 5797948.73),(3431865.15 5797948.73,3431644.53 5798012.51),(3431865.15 5797948.73,3431815.75 5797807.76),(3433260.06 5797002.92,3433361.19 5796788.54,3433467.4 5796572.78,3433670.6 5796160.06),(3433670.6 5796160.06,3433709.27 5796096.88,3433744.46 5796021.84,3433861.98 5795869.38,3434029.1 5795680.43,3434229.42 5795456.34,3434239.36 5795425.11,3434296.02 5795363.18)))'), 1);


SELECT 'geometrycollection_03', ST_AsSVG(GeomFromEWKT('GEOMETRYCOLLECTION(MULTIPOINT(3433276.43 5795308.93,3428545.3 5795827.75,3431576.99 5799084.19,3431724.2 5797152.59,3431984.2 5796564.79,3435147.61 5797649.58,3434660.86 5796941.74,3434674.52 5797030.54,3435714.36 5797022.6,3436368.88 5796951.04,3436730.03 5796768.6,3435538.55 5796267.1,3435847.22 5795917.96,3434312.09 5794846.02,3433121.69 5793670.73,3433176.36 5793489.29,3434316.04 5793940.09,3433222.92 5793040.49,3433416.13 5792891.62,3430717.47 5792600.58,3435384.08 5792877.68,3435229.15 5792177.25,3435120 5792319.07,3435088.72 5792111.21,3434484.89 5792110.2,3435777.91 5792419.49,3435717.37 5794318.12,3436895.13 5794569.43,3437621.86 5793931.6,3435597.14 5793467.9,3435246.51 5793394.63,3434722.1 5793374.87,3434712.16 5793810.3,3434773.28 5793816.87,3434629.91 5793855.31,3434992.34 5794140.1,3434927.13 5794252.29,3434958.58 5794286.16,3435120.48 5794163.36,3435850.1 5791727.49,3435930.75 5791636.32,3436268.87 5791882.68,3437110.23 5791664.12,3435960.34 5790928.2,3433545.81 5789755.43,3439096.86 5790884.26,3438576.87 5795046.69,3438396.95 5794858.59,3438193.25 5794695.6,3438447.92 5796130.77,3440688.22 5793670.37),MULTILINESTRING((3429562.6 5799490.68,3429750.99 5799199.87,3429825.45 5799078.39,3429901.8 5798961.45,3429995.54 5798822.93,3430072.89 5798719.46,3430216 5798558.95,3430272.08 5798489.33,3430393.87 5798328.51,3430463.53 5798251.11,3430532.22 5798190.16,3430591.24 5798149.53,3430667.67 5798108.9,3430723.78 5798088.58,3430797.33 5798067.95,3430857.34 5798056.34,3430912.52 5798051.5,3430961.89 5798048.59,3431052.88 5798053.43,3431159.36 5798059.24,3431218.41 5798061.18,3431366.56 5798056.09,3431474.07 5798044.47,3431568.02 5798028.97,3431644.53 5798012.51),(3433260.06 5797002.92,3433234.61 5797070.25,3433138.56 5797278.81,3433074.19 5797398.94,3433033.73 5797461.79,3432961.43 5797551.84,3432882.76 5797626.57,3432780.32 5797701.09,3432706.28 5797743.23,3432542.66 5797808.05,3432360.32 5797842.47,3432258.52 5797836.77,3432197.62 5797837.57,3432081.75 5797865.64,3431876.6 5797945.1,3431865.15 5797948.73),(3431865.15 5797948.73,3431644.53 5798012.51),(3431865.15 5797948.73,3431815.75 5797807.76),(3433260.06 5797002.92,3433361.19 5796788.54,3433467.4 5796572.78,3433670.6 5796160.06),(3433670.6 5796160.06,3433709.27 5796096.88,3433744.46 5796021.84,3433861.98 5795869.38,3434029.1 5795680.43,3434229.42 5795456.34,3434239.36 5795425.11,3434296.02 5795363.18)))'), 0, 0);


SELECT 'geometrycollection_04', ST_AsSVG(GeomFromEWKT('GEOMETRYCOLLECTION(MULTIPOINT(3433276.43 5795308.93,3428545.3 5795827.75,3431576.99 5799084.19,3431724.2 5797152.59,3431984.2 5796564.79,3435147.61 5797649.58,3434660.86 5796941.74,3434674.52 5797030.54,3435714.36 5797022.6,3436368.88 5796951.04,3436730.03 5796768.6,3435538.55 5796267.1,3435847.22 5795917.96,3434312.09 5794846.02,3433121.69 5793670.73,3433176.36 5793489.29,3434316.04 5793940.09,3433222.92 5793040.49,3433416.13 5792891.62,3430717.47 5792600.58,3435384.08 5792877.68,3435229.15 5792177.25,3435120 5792319.07,3435088.72 5792111.21,3434484.89 5792110.2,3435777.91 5792419.49,3435717.37 5794318.12,3436895.13 5794569.43,3437621.86 5793931.6,3435597.14 5793467.9,3435246.51 5793394.63,3434722.1 5793374.87,3434712.16 5793810.3,3434773.28 5793816.87,3434629.91 5793855.31,3434992.34 5794140.1,3434927.13 5794252.29,3434958.58 5794286.16,3435120.48 5794163.36,3435850.1 5791727.49,3435930.75 5791636.32,3436268.87 5791882.68,3437110.23 5791664.12,3435960.34 5790928.2,3433545.81 5789755.43,3439096.86 5790884.26,3438576.87 5795046.69,3438396.95 5794858.59,3438193.25 5794695.6,3438447.92 5796130.77,3440688.22 5793670.37),MULTILINESTRING((3429562.6 5799490.68,3429750.99 5799199.87,3429825.45 5799078.39,3429901.8 5798961.45,3429995.54 5798822.93,3430072.89 5798719.46,3430216 5798558.95,3430272.08 5798489.33,3430393.87 5798328.51,3430463.53 5798251.11,3430532.22 5798190.16,3430591.24 5798149.53,3430667.67 5798108.9,3430723.78 5798088.58,3430797.33 5798067.95,3430857.34 5798056.34,3430912.52 5798051.5,3430961.89 5798048.59,3431052.88 5798053.43,3431159.36 5798059.24,3431218.41 5798061.18,3431366.56 5798056.09,3431474.07 5798044.47,3431568.02 5798028.97,3431644.53 5798012.51),(3433260.06 5797002.92,3433234.61 5797070.25,3433138.56 5797278.81,3433074.19 5797398.94,3433033.73 5797461.79,3432961.43 5797551.84,3432882.76 5797626.57,3432780.32 5797701.09,3432706.28 5797743.23,3432542.66 5797808.05,3432360.32 5797842.47,3432258.52 5797836.77,3432197.62 5797837.57,3432081.75 5797865.64,3431876.6 5797945.1,3431865.15 5797948.73),(3431865.15 5797948.73,3431644.53 5798012.51),(3431865.15 5797948.73,3431815.75 5797807.76),(3433260.06 5797002.92,3433361.19 5796788.54,3433467.4 5796572.78,3433670.6 5796160.06),(3433670.6 5796160.06,3433709.27 5796096.88,3433744.46 5796021.84,3433861.98 5795869.38,3434029.1 5795680.43,3434229.42 5795456.34,3434239.36 5795425.11,3434296.02 5795363.18)))'), 1, 0);
--
-- Unsupported Geometry 
-- (From AsKml units test)
--
SELECT 'invalid_01', ST_AsSVG(GeomFromEWKT('SRID=4326;CIRCULARSTRING(-2 0,0 2,2 0,0 2,2 4)'));
SELECT 'invalid_02', ST_AsSVG(GeomFromEWKT('SRID=4326;COMPOUNDCURVE(CIRCULARSTRING(0 0,1 1,1 0),(1 0,0 1))'));
SELECT 'invalid_03', ST_AsSVG(GeomFromEWKT('SRID=4326;CURVEPOLYGON(CIRCULARSTRING(-2 0,-1 -1,0 0,1 -1,2 0,0 2,-2 0),(-1 0,0 0.5,1 0,0 1,-1 0))'));
SELECT 'invalid_04', ST_AsSVG(GeomFromEWKT('SRID=4326;MULTICURVE((5 5,3 5,3 3,0 3),CIRCULARSTRING(0 0,2 1,2 2))'));
SELECT 'invalid_05', ST_AsSVG(GeomFromEWKT('SRID=4326;MULTISURFACE(CURVEPOLYGON(CIRCULARSTRING(-2 0,-1 -1,0 0,1 -1,2 0,0 2,-2 0),(-1 0,0 0.5,1 0,0 1,-1 0)),((7 8,10 10,6 14,4 11,7 8)))'));


--
-- 3D Data
--
SELECT '3D_01', ST_AsSVG(GeomFromEWKT('SRID=4326;POINT(1 1 1)'));
SELECT '3D_02', ST_AsSVG(GeomFromEWKT('SRID=4326;POINT(1 1 1)'), 0);
SELECT '3D_03', ST_AsSVG(GeomFromEWKT('SRID=4326;LINESTRING(1 1 1, 2 2 2, 3 3 3, 4 4 4)'), 0);
SELECT '3D_04', ST_AsSVG(GeomFromEWKT('SRID=4326;POLYGON((1 1 1, 2 2 2, 3 3 3, 4 4 4, 5 5 5, 5 0 0, 1 1 1))'), 0);

--
-- Delete inserted spatial data
--
DELETE FROM spatial_ref_sys WHERE srid = 4326;
DELETE FROM spatial_ref_sys WHERE srid = 27572;
DELETE FROM spatial_ref_sys WHERE srid = 31467;

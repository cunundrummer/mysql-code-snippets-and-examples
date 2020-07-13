#
# SQL Export
# Created by Querious (201067)
# Created: June 5, 2020 at 11:32:18 PM GMT-4
# Encoding: Unicode (UTF-8)
#


DROP DATABASE IF EXISTS `geonames`;
CREATE DATABASE `geonames` DEFAULT CHARACTER SET utf8mb4 DEFAULT COLLATE utf8mb4_unicode_ci;
USE `geonames`;




SET @PREVIOUS_FOREIGN_KEY_CHECKS = @@FOREIGN_KEY_CHECKS;
SET FOREIGN_KEY_CHECKS = 0;


DROP TABLE IF EXISTS `timeZones`;
DROP TABLE IF EXISTS `postalCodes`;
DROP TABLE IF EXISTS `Places`;
DROP TABLE IF EXISTS `iso_languagecodes`;
DROP TABLE IF EXISTS `hierarchy`;
DROP TABLE IF EXISTS `geoname_tbl`;
DROP TABLE IF EXISTS `geoname_discarded_noncities`;
DROP TABLE IF EXISTS `featureCodes`;
DROP TABLE IF EXISTS `feature_code_priority`;
DROP TABLE IF EXISTS `feature_class_priority`;
DROP TABLE IF EXISTS `currencyWithSymbols`;
DROP TABLE IF EXISTS `currency`;
DROP TABLE IF EXISTS `countryinfo`;
DROP TABLE IF EXISTS `country_postal_format`;
DROP TABLE IF EXISTS `country_neighbours`;
DROP TABLE IF EXISTS `country_ip`;
DROP TABLE IF EXISTS `countries_for_JSON`;
DROP TABLE IF EXISTS `continentCodes`;
DROP TABLE IF EXISTS `alternate_names`;
DROP TABLE IF EXISTS `all_regions_for_country_JSON`;
DROP TABLE IF EXISTS `all_countries_JSON`;
DROP TABLE IF EXISTS `admin2Codes`;
DROP TABLE IF EXISTS `admin1CodesAscii`;


CREATE TABLE `admin1CodesAscii` (
  `code` char(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` text COLLATE utf8mb4_unicode_ci,
  `nameAscii` text COLLATE utf8mb4_unicode_ci,
  `geonameid` int(11) DEFAULT NULL,
  KEY `code` (`code`),
  KEY `name` (`name`(20)),
  KEY `nameAscii` (`nameAscii`(20)),
  KEY `geonameid` (`geonameid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


CREATE TABLE `admin2Codes` (
  `code` char(35) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` text COLLATE utf8mb4_unicode_ci,
  `nameAscii` text COLLATE utf8mb4_unicode_ci,
  `geonameid` int(11) DEFAULT NULL,
  KEY `code` (`code`),
  KEY `name` (`name`(80)),
  KEY `nameAscii` (`nameAscii`(80)),
  KEY `geonameid` (`geonameid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


CREATE TABLE `all_countries_JSON` (
  `countries` json DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


CREATE TABLE `all_regions_for_country_JSON` (
  `country_code` varchar(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `regions` json DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


CREATE TABLE `alternate_names` (
  `alternatenameId` int(11) NOT NULL,
  `geonameid` int(11) DEFAULT NULL,
  `isoLanguage` varchar(7) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `isPreferredName` tinyint(1) DEFAULT NULL,
  `isShortName` tinyint(1) DEFAULT NULL,
  `isColloquial` tinyint(1) DEFAULT NULL,
  `isHistoric` tinyint(1) DEFAULT NULL,
  `alternate name` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`alternatenameId`),
  KEY `geonameid` (`geonameid`),
  KEY `isoLanguage` (`isoLanguage`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


CREATE TABLE `continentCodes` (
  `code` char(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `geonameid` int(11) DEFAULT NULL,
  KEY `code` (`code`),
  KEY `name` (`name`),
  KEY `geonameid` (`geonameid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


CREATE TABLE `countries_for_JSON` (
  `country` json DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


CREATE TABLE `country_ip` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ip_address` varchar(18) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subnet_mask` int(11) DEFAULT '0',
  `country_code` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4610 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


CREATE TABLE `country_neighbours` (
  `geonameId` int(11) NOT NULL,
  `neighbourId` char(2) COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


CREATE TABLE `country_postal_format` (
  `countryId` int(11) NOT NULL,
  `format` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `regex` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`countryId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


CREATE TABLE `countryinfo` (
  `iso_alpha2` char(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `iso_alpha3` char(3) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `iso_numeric` int(11) DEFAULT NULL,
  `fips_code` varchar(3) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `capital` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `areainsqkm` double DEFAULT NULL,
  `population` int(11) DEFAULT NULL,
  `continent` char(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tld` char(3) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Phone` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `postalCodeFormat` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `postalCodeRegex` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `geonameId` int(11) DEFAULT NULL,
  `languages` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `equivalentFipsCode` char(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  KEY `iso_alpha2` (`iso_alpha2`),
  KEY `iso_alpha3` (`iso_alpha3`),
  KEY `iso_numeric` (`iso_numeric`),
  KEY `fips_code` (`fips_code`),
  KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


CREATE TABLE `currency` (
  `id` char(3) COLLATE utf8mb4_unicode_520_ci NOT NULL COMMENT 'a 3 char abbreviation',
  `countryId` int(11) NOT NULL COMMENT 'geonameid',
  `name` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL COMMENT 'currency name (dollar, shekel, peso, etc..)',
  `symbol` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;


CREATE TABLE `currencyWithSymbols` (
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `code` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `symbol` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;


CREATE TABLE `feature_class_priority` (
  `class` char(1) COLLATE utf8mb4_general_ci NOT NULL,
  `priority` tinyint(2) NOT NULL,
  PRIMARY KEY (`class`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


CREATE TABLE `feature_code_priority` (
  `code` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `priority` tinyint(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


CREATE TABLE `featureCodes` (
  `code` char(7) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  KEY `code` (`code`),
  KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


CREATE TABLE `geoname_discarded_noncities` (
  `geonameid` int(11) NOT NULL,
  `name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `asciiname` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `latitude` decimal(10,7) DEFAULT NULL,
  `longitude` decimal(10,7) DEFAULT NULL,
  `fclass` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fcode` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cc2` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `admin1` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `admin2` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `admin3` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `admin4` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `population` bigint(20) DEFAULT NULL,
  `elevation` int(11) DEFAULT NULL,
  `gtopo30` int(11) DEFAULT NULL,
  `timezone` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `moddate` date DEFAULT NULL,
  UNIQUE KEY `geonameid` (`geonameid`),
  KEY `name` (`name`),
  KEY `asciiname` (`asciiname`),
  KEY `latitude` (`latitude`),
  KEY `longitude` (`longitude`),
  KEY `fclass` (`fclass`),
  KEY `fcode` (`fcode`),
  KEY `country` (`country`),
  KEY `cc2` (`cc2`),
  KEY `admin1` (`admin1`),
  KEY `population` (`population`),
  KEY `elevation` (`elevation`),
  KEY `timezone` (`timezone`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;


CREATE TABLE `geoname_tbl` (
  `geonameid` int(11) NOT NULL,
  `name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `asciiname` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `latitude` decimal(10,7) DEFAULT NULL,
  `longitude` decimal(10,7) DEFAULT NULL,
  `fclass` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fcode` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cc2` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `admin1` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `admin2` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `admin3` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `admin4` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `population` bigint(20) DEFAULT NULL,
  `elevation` int(11) DEFAULT NULL,
  `gtopo30` int(11) DEFAULT NULL,
  `timezone` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `moddate` date DEFAULT NULL,
  UNIQUE KEY `geonameid` (`geonameid`),
  KEY `name` (`name`),
  KEY `asciiname` (`asciiname`),
  KEY `latitude` (`latitude`),
  KEY `longitude` (`longitude`),
  KEY `fclass` (`fclass`),
  KEY `fcode` (`fcode`),
  KEY `country` (`country`),
  KEY `cc2` (`cc2`),
  KEY `admin1` (`admin1`),
  KEY `population` (`population`),
  KEY `elevation` (`elevation`),
  KEY `timezone` (`timezone`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;


CREATE TABLE `hierarchy` (
  `parentId` int(11) DEFAULT NULL,
  `childId` int(11) DEFAULT NULL,
  `type` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  KEY `parentId` (`parentId`),
  KEY `childId` (`childId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


CREATE TABLE `iso_languagecodes` (
  `iso_639_3` char(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'three-letter codes, the same as 639-2/T for languages, but with distinct codes for each variety of an ISO 639 macrolanguage',
  `iso_639_2` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'three-letter codes, for the same languages as 639-1',
  `iso_639_1` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'two-letter codes, one per language for ISO 639 macrolanguage',
  `language_name` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


CREATE TABLE `Places` (
  `country` json DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


CREATE TABLE `postalCodes` (
  `country` char(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `postal_code` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(180) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `admin1_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `admin1_code` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'STATE',
  `admin2_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `admin2_code` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'county/prov',
  `admin3_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `admin3_code` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'community',
  `latitude` decimal(10,7) DEFAULT NULL,
  `longitude` decimal(10,7) DEFAULT NULL,
  `accuracy` tinyint(2) DEFAULT NULL,
  KEY `admin1_code` (`admin1_code`),
  KEY `country` (`country`),
  KEY `name` (`name`),
  KEY `postal_code` (`postal_code`),
  KEY `latitude` (`latitude`),
  KEY `longitude` (`longitude`),
  KEY `admin1_name` (`admin1_name`),
  KEY `admin1_code_2` (`admin1_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


CREATE TABLE `timeZones` (
  `countryCode` char(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `timeZoneId` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `GMT_offset` decimal(3,1) DEFAULT NULL,
  `DST_offset` decimal(3,1) DEFAULT NULL,
  `RAW_offset` decimal(3,1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




SET FOREIGN_KEY_CHECKS = @PREVIOUS_FOREIGN_KEY_CHECKS;


DROP FUNCTION IF EXISTS `STR_SPLIT`;
DROP FUNCTION IF EXISTS `STR_GET_OCCURENCE`;
DROP FUNCTION IF EXISTS `NUM_STATES_PROVS_IN_COUNTRY`;
DROP FUNCTION IF EXISTS `COUNT_ALL_IN_COUNTRY`;


DELIMITER //
CREATE DEFINER=`root`@`localhost` FUNCTION `COUNT_ALL_IN_COUNTRY`(cc varchar(2)) RETURNS int(11)
    DETERMINISTIC
BEGIN
	 
RETURN (select count(*) from geoname_tbl where country=cc);
END;
//
DELIMITER ;


DELIMITER //
CREATE DEFINER=`root`@`localhost` FUNCTION `NUM_STATES_PROVS_IN_COUNTRY`(cc varchar(2)) RETURNS int(11)
    DETERMINISTIC
BEGIN

RETURN 
	(SELECT	count(distinct(admin1))
    FROM geoname_tbl gt
    WHERE gt.country = cc);
END;
//
DELIMITER ;


DELIMITER //
CREATE DEFINER=`root`@`localhost` FUNCTION `STR_GET_OCCURENCE`(s char(100), delim char(1)) RETURNS int(11)
    DETERMINISTIC
BEGIN
    DECLARE len INT DEFAULT 0;
	SET len = LENGTH(s) - LENGTH(REPLACE(s, delim, ''));
    IF len = 0 THEN
		IF LENGTH(s) > 0 THEN
			SET len = len +1;
		END IF;
	END IF;
    
	RETURN len;
# RETURN LENGTH(s) - LENGTH(REPLACE(s, delim, ''))
END;
//
DELIMITER ;


CREATE DEFINER=`root`@`localhost` FUNCTION `STR_SPLIT`(str VARCHAR(255), delim VARCHAR(12), pos INT) RETURNS varchar(255) CHARSET utf8mb4 COLLATE utf8mb4_general_ci
    DETERMINISTIC
RETURN REPLACE(SUBSTRING(SUBSTRING_INDEX(str, delim, pos),
       LENGTH(SUBSTRING_INDEX(str, delim, pos -1)) + 1),
       delim, '');




DROP PROCEDURE IF EXISTS `separate_delimited_str_sp`;
DROP PROCEDURE IF EXISTS `hierarchy`;
DROP PROCEDURE IF EXISTS `getNearestCitiesByRect`;
DROP PROCEDURE IF EXISTS `getFullLocationByLatLng`;
DROP PROCEDURE IF EXISTS `getCommonNameForCity`;
DROP PROCEDURE IF EXISTS `country_to_JSON_sp`;
DROP PROCEDURE IF EXISTS `countAllLocationsWithinCountry`;
DROP PROCEDURE IF EXISTS `copy_postal_from_countryinfo`;
DROP PROCEDURE IF EXISTS `copy_neighbours_from_countryinfo_SETUP_sp`;
DROP PROCEDURE IF EXISTS `check_table_exists`;
DROP PROCEDURE IF EXISTS `All_To_JSON_SP`;
DROP PROCEDURE IF EXISTS `all_regions_for_country_JSON_SP`;
DROP PROCEDURE IF EXISTS `all_countries_JSON_SP`;


DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `all_countries_JSON_SP`()
    DETERMINISTIC
BEGIN
DROP TABLE IF EXISTS all_countries_JSON;
CREATE TABLE all_countries_JSON
(
    countries JSON
);

INSERT INTO all_countries_JSON
SELECT JSON_OBJECT('countries', JSON_ARRAYAGG(JSON_OBJECT('country_code', ci.iso_alpha2 ,'geonameid', ci.geonameid, 'country_name', ci.name))) from countryinfo ci;

#SET @data = (SELECT * from all_countries_JSON);

#SELECT JSON_EXTRACT(@data.country, '$.country');
#SELECT @data as 'TEST DATA';
SELECT * from all_countries_JSON;

END;
//
DELIMITER ;


DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `all_regions_for_country_JSON_SP`(IN cc VARCHAR(2))
    DETERMINISTIC
BEGIN
DROP TABLE IF EXISTS all_regions_for_country_JSON;
CREATE TABLE all_regions_for_country_JSON
(
    country_code varchar(2),
    regions JSON
);

INSERT INTO all_regions_for_country_JSON(country_code, regions)
VALUES(
cc,
(SELECT JSON_OBJECT('regions', JSON_ARRAYAGG(JSON_OBJECT('region', r.name, 'country_code', r.country, 'admin1', r.admin1, 'fcode', r.fcode))) 
from regions_of_countries r 
where r.country=cc));

#SET @data = (SELECT * from all_countries_JSON);

#SELECT JSON_EXTRACT(@data.country, '$.country');
#SELECT @data as 'TEST DATA';
SELECT * from all_regions_for_country_JSON;

END;
//
DELIMITER ;


DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `All_To_JSON_SP`()
    DETERMINISTIC
BEGIN
DROP TABLE IF EXISTS Places;
CREATE TABLE Places 
(
    country JSON
);

INSERT INTO Places (country)
SELECT JSON_OBJECT
	('country', 
		JSON_OBJECT('geonameid', ci.geonameid, 'cc', ci.iso_alpha2, 'continent', ci.continent,
		'regions', JSON_ARRAYAGG( 
			JSON_OBJECT('geonameid', gt.geonameid, 'name', gt.name, 'admin1', gt.admin1, 'timezone', gt.timezone, 'moddate',  gt.moddate, 
			'cities', (select JSON_ARRAYAGG(
				JSON_OBJECT('geonameid', city.geonameid, 'name', city.name, 'fCode', city.fcode, 'admin1', city.admin1, 'timezone', city.timezone, 'moddate',  city.moddate)
			) from geoname_tbl city where city.admin1 = gt.admin1 and city.country = ci.iso_alpha2)
		))
	))
FROM countryinfo ci
INNER JOIN geoname_tbl gt ON
	gt.country = ci.iso_alpha2
WHERE 
	ci.iso_alpha2 = 'ca' # where = select all countries
	AND 
	gt.fcode = 'ADM1'
GROUP BY ci.iso_alpha2, ci.geonameid, ci.continent;


SET @data = (SELECT * from places);

#SELECT JSON_EXTRACT(@data.country, '$.country.regions[1].admin1');
#SELECT @data as 'TEST DATA';
SELECT * from places;

END;
//
DELIMITER ;


DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `check_table_exists`(table_name VARCHAR(100))
    DETERMINISTIC
BEGIN
    DECLARE CONTINUE HANDLER FOR SQLSTATE '42S02' SET @err = 1;
    SET @err = 0;
    SET @table_name = table_name;
    SET @sql_query = CONCAT('SELECT 1 FROM ',@table_name);
    PREPARE stmt1 FROM @sql_query;
    IF (@err = 1) THEN
        SET @table_exists = 'Table does not exist!'; #0
    ELSE
        SET @table_exists = 'Table exists.';#1
        DEALLOCATE PREPARE stmt1;
    END IF;
END;
//
DELIMITER ;


DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `copy_neighbours_from_countryinfo_SETUP_sp`()
BEGIN
DECLARE total_rows INT DEFAULT 0;
DECLARE neighbourCount INT DEFAULT 0;
DECLARE neigh CHAR(2);
DECLARE done BOOLEAN DEFAULT FALSE;
DECLARE nStr CHAR(100) DEFAULT NULL;
DECLARE nStrLength INT DEFAULT 0;
DECLARE geoid INT(11);
DECLARE incr INT DEFAULT 0;
DECLARE DELIM CHAR(1) DEFAULT ',';

DECLARE curs CURSOR FOR 	SELECT geonameId, neighbours from countryinfo; -- This is the query used by the cursor.
DECLARE continue handler FOR NOT FOUND SET done = true; -- This handler will be executed if no row is found in the cursor (for example, if all rows have been read).

DROP TEMPORARY TABLE IF EXISTS tmp_n;
CREATE TEMPORARY TABLE tmp_n (geonameid INT(11), neighbourid CHAR(2));

OPEN curs;

get_neighbour: LOOP
    
	FETCH curs INTO geoid, nStr;
    
    IF done THEN 
		LEAVE get_neighbour;
	END IF;
    -- cursor loop statements
    	
    IF ISNULL (nStr) THEN
        INSERT IGNORE INTO tmp_n (geonameid) VALUE (geoid); # primary key

		SET neighbourCount = 0;
        ITERATE get_neighbour;
	ELSE
		SET neighbourCount = (SELECT IF(STR_GET_OCCURENCE(nStr, ',') > 0, STR_GET_OCCURENCE(nStr, ',')  , 0 ));
	
		IF LENGTH(nStr) > 2 THEN
			SET neighbourCount = neighbourCount + 1;
		END IF;
    END IF;

	# SELECT geoid, nStr, neighbourCount;


	-- should have value(s) from here on
	WHILE neighbourCount > 0 DO
		SET neigh = STR_SPLIT(nStr, DELIM, neighbourCount);
		INSERT INTO tmp_n (geonameid, neighbourid) VALUE(geoid, neigh); # primary key also find a good where geonameid clause
		SET neighbourCount = neighbourCount - 1;
	END WHILE;

		
END LOOP get_neighbour;

CLOSE curs;

INSERT IGNORE INTO country_neighbours SELECT * FROM tmp_n;

# SELECT * FROM tmp_n;
DROP TEMPORARY TABLE IF EXISTS tmp_n;


END;
//
DELIMITER ;


CREATE DEFINER=`root`@`localhost` PROCEDURE `copy_postal_from_countryinfo`()
    DETERMINISTIC
INSERT INTO country_postal_format (countryId, format, regex)
(SELECT c.geonameid, c.postalCodeFormat, c.postalCodeRegex FROM countryinfo c);


DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `countAllLocationsWithinCountry`(IN cc varchar(2))
BEGIN
		select count(*)
		from geoname_tbl 
		where country=cc;
END;
//
DELIMITER ;


DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `country_to_JSON_sp`(IN cc CHAR(2))
    DETERMINISTIC
BEGIN
DROP TABLE IF EXISTS countries_for_JSON;
CREATE TABLE countries_for_JSON
(
    country JSON
);

INSERT INTO countries_for_JSON (country)
SELECT JSON_OBJECT
	('country', 
		JSON_OBJECT('country_code', ci.iso_alpha2 ,'geonameid', ci.geonameid, 'country_name', ci.name)
	)
FROM countryinfo ci
WHERE 
	ci.iso_alpha2 = cc # where = select all countries
;


SET @data = (SELECT * from countries_for_JSON);

#SELECT JSON_EXTRACT(@data.country, '$.country');
#SELECT @data as 'TEST DATA';
SELECT * from countries_for_JSON;

END;
//
DELIMITER ;


DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `getCommonNameForCity`(city varchar(20), region varchar(30), countryCode varchar(2))
BEGIN
	DECLARE geonameide varchar(20);
	DECLARE admin1e varchar(20);
    DECLARE admin2e varchar(20);
    DECLARE admin3e varchar(20);
    DECLARE collationToUse varchar(25);

    
    SET @region = region;
    SET @country = upper(countryCode);
    SET @collationToUse = 'utf8mb4_unicode_ci';
    SET @newcitySTR = concat('%', REPLACE (city, '-', '%'));
    
    #SET @admin1e = (select code from admin1codesascii where name=@region);
    #SET @admin2e = (select code from admin2codes where name like @newcitySTR);
   
	/*select 
		if(
			@admin2e is null, 
			@admin3e:=(select admin3 from geoname_tbl where name like @newcitySTR and country=@country and admin1=10),
            'admin2e is not null'
		);*/
	select admin3 from geoname_tbl where name like @newcitySTR and country=@country and admin1=10 and admin3 is not null into @admin3e;
    select @admin1e, @admin2e, @admin3e;
    
    #select @newcityStr, @region, @country, concat(countryCode, '.', 10); #where is 10 coming from? NO MAGIC NUMS!  But this is used only as a test.
    
    #select distinct(admin1) from geoname_tbl where name=@region and country=countryCode;
    SET @latestDate=(select MAX(moddate) from geoname_tbl where name like @newcityStr and country=@country);
    #select @latestDate;
    #select MAX(moddate) from geoname_tbl where name like @newcityStr and country=countryCode;
    
    SET @codes := null; # codes admin
    
    select
		a1.geonameid as regionId, a1.name as RegionName,
        a2.geonameid as cityId, a2.name as CityName,
		g1.geonameid, g1.name as 'Place Being Searched', g1.asciiname as 'Place Being Searched Asciiname', g1.admin1, g1.admin2, g1.admin3, g1.country, g1.moddate,
       # concat(countryCode, '.', g1.admin1, '.', g1.admin2) as CODES
       @codes:= concat(countryCode, '.', g1.admin1, '.', g1.admin2) as codes,
       if (@codes is not null, 'awesome', 'not awesome')
    from geoname_tbl g1
    left outer join admin2codes a2 on
		a2.code=concat(countryCode, '.', g1.admin1, '.', g1.admin2)
    inner join admin1codesascii a1 on
		a1.code=concat(countryCode, '.', g1.admin1)
    where g1.name like @newcityStr and g1.country=countryCode and moddate=@latestDate
    group by g1.geonameid, a1.geonameid, a1.name, a2.geonameid, a2.name;
END;
//
DELIMITER ;


DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `getFullLocationByLatLng`(IN latitude Decimal(10,7), IN longitude Decimal(10,7))
    DETERMINISTIC
BEGIN
 SET @dist = 15;
 SET @orig_lat = latitude;
 SET @orig_lon = longitude;
 SET @cityId = 0;
 
WITH 
CTE as (
	SELECT geonameid, asciiname, fclass, fcode, country, admin1, admin2, admin3, admin4, timezone, (3956 * 2 
			* ASIN(SQRT( POWER(SIN((@orig_lat -abs( dest.latitude)) * pi()/180 / 2),2) + COS(@orig_lat * pi()/180 ) * COS(abs(dest.latitude) *  pi()/180) * POWER(SIN((@orig_lon - dest.longitude) *  pi()/180 / 2), 2) ))) as distance 
		FROM geoname_tbl dest 
		#WHERE fclass = 'P' or fclass='A' and fcode in ('PPLC', 'PPLA', 'PPLA2', 'PPLA3', 'PPLA4', 'PPL', 'ADM1', 'ADM2', 'ADM3', 'ADM4', 'ADM5') 
		HAVING distance < @dist 
		ORDER BY distance
        LIMIT 5
	)
    select cte.geonameid,
		cte.asciiname, 
        cte.fclass, 
        cte.fcode, 
        (select name from admin2Codes where code=CONCAT(cte.country, '.', cte.admin1, '.', cte.admin2)) as CITY,
        (select geonameid from admin2Codes where code=CONCAT(cte.country, '.', cte.admin1, '.', cte.admin2)) as CITYid,
        (select name from countryinfo where iso_alpha2=cte.country) as COUNTRY,
        (select geonameid from countryinfo where iso_alpha2=cte.country) as COUNTRYid,
        (select name from admin1CodesAscii where code=CONCAT(cte.country, '.', cte.admin1)) as REGION,
        (select geonameid from admin1CodesAscii where code=CONCAT(cte.country, '.', cte.admin1)) as REGIONid,
        cte.admin1, cte.admin2, cte.admin3, cte.admin4, cte.distance from CTE cte ;
 END;
//
DELIMITER ;


DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `getNearestCitiesByRect`(IN latitude Decimal(10,7), IN longitude Decimal(10,7), IN country varchar(2))
BEGIN
	SET @orig_lat = latitude;
	SET @orig_lon = longitude;
    SET @EARTH_RADIUS_KM = 6371;
    SET @R_km = @EARTH_RADIUS_KM;
     
	SELECT dest.name, dest.fcode as dfcode, MIN(fcp.priority) as 'priority',
    (3956 * 2 * ASIN(SQRT( POWER(SIN((@orig_lat -abs( dest.latitude)) * pi()/180 / 2),2) + COS(@orig_lat * pi()/180 ) * COS(abs(dest.latitude) *  pi()/180) * POWER(SIN((@orig_lon - dest.longitude) *  pi()/180 / 2), 2) ))) as distance2
	#sqrt( ( (dest.longitude - @orig_lon) * COS(@orig_lat + dest.latitude) ) * ( (dest.longitude - @orig_lon) * COS(@orig_lat + dest.latitude) )  + ( (dest.latitude + @orig_lat)*(dest.latitude + @orig_lat) ) ) * @R_km as distance2
    FROM geoname_tbl dest 
    INNER JOIN feature_code_priority fcp ON
		dest.fcode = fcp.code
	WHERE dest.country = country
	GROUP BY fcp.priority, distance2, dest.name, dfcode
    HAVING distance2 < 15
    ORDER BY priority, distance2
    LIMIT 5;

END;
//
DELIMITER ;


DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `hierarchy`(city varchar(20), cc varchar(20))
BEGIN
	SELECT 
		#admin4Count, admin3Count, admin2count, admin1count,
		city as 'Searched City',
		ci.name as 'Country Name',
        g1.admin1,
        a1.name as '(ADMIN1)Region Name',
        g1.admin2, 
        (select a2.name from admin2codes a2 where a2.code=concat(g1.country, '.', g1.admin1, '.', g1.admin2)) as '(ADMIN2) City Name',
        g1.admin3,
        (select distinct(name) from geoname_tbl where name=city and country=cc and admin3 is not null) as '(ADMIN3) City Name',
        g1.admin4,
        (select name from geoname_tbl where name=city and country=cc and admin4 is not null)  as '(ADMIN4) City Name',
        MAX(CAST(g1.moddate as CHAR)) as 'Latest date'
    FROM 
		geoname_tbl g1
	INNER JOIN admin1codesascii a1 ON
		a1.code = concat(g1.country, '.', g1.admin1)
	INNER JOIN countryinfo ci ON
		ci.iso_alpha2 = g1.country
	WHERE 
		g1.name=city 
        and g1.country=cc
	GROUP BY
		g1.admin1, g1.admin2, g1.admin3, g1.admin4,
        a1.name,
		ci.name,
        g1.moddate
	ORDER BY 
		IF(g1.admin4 is null, g1.moddate, g1.admin4) desc,
        g1.admin3 desc,
        g1.admin2 desc,
        g1.admin1 desc
    LIMIT 5;
END;
//
DELIMITER ;


DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `separate_delimited_str_sp`()
    DETERMINISTIC
BEGIN

WITH RECURSIVE cte AS
(
  SELECT geonameid, CAST(NULL AS CHAR(100)) as item, neighbours as remaining FROM countryinfo
  UNION ALL
  SELECT geonameid, 
  		 LEFT(remaining, IFNULL(NULLIF(LOCATE(', ', remaining), 0)-1, LENGTH(remaining))), 
  		 RIGHT(remaining, LENGTH(remaining) - IFNULL(NULLIF(LOCATE(', ', remaining), 0)+1, LENGTH(remaining)))
  FROM cte
  WHERE LENGTH(remaining) > 0
)
SELECT geonameid, item FROM cte WHERE item IS NOT NULL ORDER BY geonameid;

END;
//
DELIMITER ;





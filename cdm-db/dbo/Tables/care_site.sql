CREATE TABLE care_site
(
  care_site_id						      INTEGER			  NOT NULL ,
  care_site_name						    VARCHAR(255)  NULL ,
  place_of_service_concept_id	  INTEGER			  NULL ,
  location_id						        INTEGER			  NULL ,
  care_site_source_value			  VARCHAR(50)		NULL ,
  place_of_service_source_value VARCHAR(50)		NULL
)
;
GO
/************************

Standardized health system data

************************/

ALTER TABLE care_site ADD CONSTRAINT fpk_care_site_location FOREIGN KEY (location_id)  REFERENCES location (location_id);
GO
ALTER TABLE care_site ADD CONSTRAINT fpk_care_site_place FOREIGN KEY (place_of_service_concept_id)  REFERENCES concept (concept_id);
GO
ALTER TABLE care_site ADD CONSTRAINT xpk_care_site PRIMARY KEY NONCLUSTERED ( care_site_id ) ;
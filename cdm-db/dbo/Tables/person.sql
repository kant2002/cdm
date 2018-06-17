/************************

Standardized clinical data

************************/

--HINT DISTRIBUTE_ON_KEY(person_id)
CREATE TABLE person
(
  person_id						        INTEGER	  	NOT NULL ,
  gender_concept_id				    INTEGER	  	NOT NULL ,
  year_of_birth					      INTEGER	  	NOT NULL ,
  month_of_birth				      INTEGER	  	NULL,
  day_of_birth					      INTEGER	  	NULL,
  birth_datetime				      DATETIME2	  NULL,
  race_concept_id				      INTEGER		  NOT NULL,
  ethnicity_concept_id			  INTEGER	  	NOT NULL,
  location_id					        INTEGER		  NULL,
  provider_id					        INTEGER		  NULL,
  care_site_id					      INTEGER		  NULL,
  person_source_value			    VARCHAR(50) NULL,
  gender_source_value			    VARCHAR(50) NULL,
  gender_source_concept_id	  INTEGER		  NULL,
  race_source_value				    VARCHAR(50) NULL,
  race_source_concept_id		  INTEGER		  NULL,
  ethnicity_source_value		  VARCHAR(50) NULL,
  ethnicity_source_concept_id	INTEGER		  NULL
)
;
GO
/**************************

Standardized meta-data

***************************/





/************************

Standardized clinical data

************************/

ALTER TABLE person ADD CONSTRAINT fpk_person_gender_concept FOREIGN KEY (gender_concept_id)  REFERENCES concept (concept_id);
GO
ALTER TABLE person ADD CONSTRAINT fpk_person_race_concept FOREIGN KEY (race_concept_id)  REFERENCES concept (concept_id);
GO
ALTER TABLE person ADD CONSTRAINT fpk_person_ethnicity_concept FOREIGN KEY (ethnicity_concept_id)  REFERENCES concept (concept_id);
GO
ALTER TABLE person ADD CONSTRAINT fpk_person_gender_concept_s FOREIGN KEY (gender_source_concept_id)  REFERENCES concept (concept_id);
GO
ALTER TABLE person ADD CONSTRAINT fpk_person_race_concept_s FOREIGN KEY (race_source_concept_id)  REFERENCES concept (concept_id);
GO
ALTER TABLE person ADD CONSTRAINT fpk_person_ethnicity_concept_s FOREIGN KEY (ethnicity_source_concept_id)  REFERENCES concept (concept_id);
GO
ALTER TABLE person ADD CONSTRAINT fpk_person_location FOREIGN KEY (location_id)  REFERENCES location (location_id);
GO
ALTER TABLE person ADD CONSTRAINT fpk_person_provider FOREIGN KEY (provider_id)  REFERENCES provider (provider_id);
GO
ALTER TABLE person ADD CONSTRAINT fpk_person_care_site FOREIGN KEY (care_site_id)  REFERENCES care_site (care_site_id);
GO
/**************************

Standardized meta-data

***************************/



/************************

Standardized clinical data

************************/


/**PRIMARY KEY NONCLUSTERED constraints**/

ALTER TABLE person ADD CONSTRAINT xpk_person PRIMARY KEY NONCLUSTERED ( person_id ) ;
GO
/**************************

Standardized meta-data

***************************/





/************************

Standardized clinical data

************************/

CREATE UNIQUE CLUSTERED INDEX idx_person_id ON person (person_id ASC);
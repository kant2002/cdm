CREATE TABLE provider
(
  provider_id					        INTEGER			  NOT NULL ,
  provider_name					      VARCHAR(255)	NULL ,
  NPI							            VARCHAR(20)		NULL ,
  DEA							            VARCHAR(20)		NULL ,
  specialty_concept_id			  INTEGER			  NULL ,
  care_site_id					      INTEGER			  NULL ,
  year_of_birth					      INTEGER			  NULL ,
  gender_concept_id				    INTEGER			  NULL ,
  provider_source_value			  VARCHAR(50)		NULL ,
  specialty_source_value			VARCHAR(50)		NULL ,
  specialty_source_concept_id	INTEGER			  NULL ,
  gender_source_value			    VARCHAR(50)		NULL ,
  gender_source_concept_id		INTEGER			  NULL
)
;
GO
ALTER TABLE provider ADD CONSTRAINT fpk_provider_specialty FOREIGN KEY (specialty_concept_id)  REFERENCES concept (concept_id);
GO
ALTER TABLE provider ADD CONSTRAINT fpk_provider_care_site FOREIGN KEY (care_site_id)  REFERENCES care_site (care_site_id);
GO
ALTER TABLE provider ADD CONSTRAINT fpk_provider_gender FOREIGN KEY (gender_concept_id)  REFERENCES concept (concept_id);
GO
ALTER TABLE provider ADD CONSTRAINT fpk_provider_specialty_s FOREIGN KEY (specialty_source_concept_id)  REFERENCES concept (concept_id);
GO
ALTER TABLE provider ADD CONSTRAINT fpk_provider_gender_s FOREIGN KEY (gender_source_concept_id)  REFERENCES concept (concept_id);
GO
ALTER TABLE provider ADD CONSTRAINT xpk_provider PRIMARY KEY NONCLUSTERED ( provider_id ) ;
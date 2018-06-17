--HINT DISTRIBUTE_ON_KEY(person_id)
CREATE TABLE device_exposure
(
  device_exposure_id			        INTEGER		  	NOT NULL ,
  person_id						            INTEGER			  NOT NULL ,
  device_concept_id			        	INTEGER			  NOT NULL ,
  device_exposure_start_date	    DATE			    NOT NULL ,
  device_exposure_start_datetime  DATETIME2		  NULL ,
  device_exposure_end_date		    DATE			    NULL ,
  device_exposure_end_datetime    DATETIME2		  NULL ,
  device_type_concept_id		      INTEGER			  NOT NULL ,
  unique_device_id			        	VARCHAR(50)		NULL ,
  quantity						            INTEGER			  NULL ,
  provider_id					            INTEGER			  NULL ,
  visit_occurrence_id			        INTEGER			  NULL ,
  visit_detail_id                 INTEGER       NULL ,
  device_source_value			        VARCHAR(100)	NULL ,
  device_source_concept_id		    INTEGER			  NULL
)
;
GO
ALTER TABLE device_exposure ADD CONSTRAINT fpk_device_person FOREIGN KEY (person_id)  REFERENCES person (person_id);
GO
ALTER TABLE device_exposure ADD CONSTRAINT fpk_device_concept FOREIGN KEY (device_concept_id)  REFERENCES concept (concept_id);
GO
ALTER TABLE device_exposure ADD CONSTRAINT fpk_device_type_concept FOREIGN KEY (device_type_concept_id)  REFERENCES concept (concept_id);
GO
ALTER TABLE device_exposure ADD CONSTRAINT fpk_device_provider FOREIGN KEY (provider_id)  REFERENCES provider (provider_id);
GO
ALTER TABLE device_exposure ADD CONSTRAINT fpk_device_visit FOREIGN KEY (visit_occurrence_id)  REFERENCES visit_occurrence (visit_occurrence_id);
GO
ALTER TABLE device_exposure ADD CONSTRAINT fpk_device_concept_s FOREIGN KEY (device_source_concept_id)  REFERENCES concept (concept_id);
GO
ALTER TABLE device_exposure ADD CONSTRAINT xpk_device_exposure PRIMARY KEY NONCLUSTERED ( device_exposure_id ) ;
GO
CREATE CLUSTERED INDEX idx_device_person_id ON device_exposure (person_id ASC);
GO
CREATE INDEX idx_device_concept_id ON device_exposure (device_concept_id ASC);
GO
CREATE INDEX idx_device_visit_id ON device_exposure (visit_occurrence_id ASC);
--HINT DISTRIBUTE_ON_KEY(person_id)
CREATE TABLE measurement
(
  measurement_id				        INTEGER			NOT NULL ,
  person_id						          INTEGER			NOT NULL ,
  measurement_concept_id		    INTEGER			NOT NULL ,
  measurement_date				      DATE			  NOT NULL ,
  measurement_datetime			    DATETIME2		NULL ,
  measurement_time              VARCHAR(10) NULL,
  measurement_type_concept_id	  INTEGER			NOT NULL ,
  operator_concept_id			      INTEGER			NULL ,
  value_as_number				        FLOAT			  NULL ,
  value_as_concept_id			      INTEGER			NULL ,
  unit_concept_id				        INTEGER			NULL ,
  range_low					          	FLOAT			  NULL ,
  range_high					          FLOAT			  NULL ,
  provider_id					          INTEGER			NULL ,
  visit_occurrence_id			      INTEGER			NULL ,
  visit_detail_id               INTEGER     NULL ,
  measurement_source_value		  VARCHAR(50)	NULL ,
  measurement_source_concept_id	INTEGER			NULL ,
  unit_source_value				      VARCHAR(50)	NULL ,
  value_source_value			      VARCHAR(50)	NULL
)
;
GO
ALTER TABLE measurement ADD CONSTRAINT fpk_measurement_person FOREIGN KEY (person_id)  REFERENCES person (person_id);
GO
ALTER TABLE measurement ADD CONSTRAINT fpk_measurement_concept FOREIGN KEY (measurement_concept_id)  REFERENCES concept (concept_id);
GO
ALTER TABLE measurement ADD CONSTRAINT fpk_measurement_type_concept FOREIGN KEY (measurement_type_concept_id)  REFERENCES concept (concept_id);
GO
ALTER TABLE measurement ADD CONSTRAINT fpk_measurement_operator FOREIGN KEY (operator_concept_id)  REFERENCES concept (concept_id);
GO
ALTER TABLE measurement ADD CONSTRAINT fpk_measurement_value FOREIGN KEY (value_as_concept_id)  REFERENCES concept (concept_id);
GO
ALTER TABLE measurement ADD CONSTRAINT fpk_measurement_unit FOREIGN KEY (unit_concept_id)  REFERENCES concept (concept_id);
GO
ALTER TABLE measurement ADD CONSTRAINT fpk_measurement_provider FOREIGN KEY (provider_id)  REFERENCES provider (provider_id);
GO
ALTER TABLE measurement ADD CONSTRAINT fpk_measurement_visit FOREIGN KEY (visit_occurrence_id)  REFERENCES visit_occurrence (visit_occurrence_id);
GO
ALTER TABLE measurement ADD CONSTRAINT fpk_measurement_concept_s FOREIGN KEY (measurement_source_concept_id)  REFERENCES concept (concept_id);
GO
ALTER TABLE measurement ADD CONSTRAINT xpk_measurement PRIMARY KEY NONCLUSTERED ( measurement_id ) ;
GO
CREATE CLUSTERED INDEX idx_measurement_person_id ON measurement (person_id ASC);
GO
CREATE INDEX idx_measurement_concept_id ON measurement (measurement_concept_id ASC);
GO
CREATE INDEX idx_measurement_visit_id ON measurement (visit_occurrence_id ASC);
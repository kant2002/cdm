--HINT DISTRIBUTE_ON_KEY(person_id)
CREATE TABLE observation
(
  observation_id					      INTEGER			NOT NULL ,
  person_id						          INTEGER			NOT NULL ,
  observation_concept_id			  INTEGER			NOT NULL ,
  observation_date				      DATE			  NOT NULL ,
  observation_datetime				  DATETIME2		NULL ,
  observation_type_concept_id	  INTEGER			NOT NULL ,
  value_as_number				        FLOAT			  NULL ,
  value_as_string				        VARCHAR(60)	NULL ,
  value_as_concept_id			      INTEGER			NULL ,
  qualifier_concept_id			    INTEGER			NULL ,
  unit_concept_id				        INTEGER			NULL ,
  provider_id					          INTEGER			NULL ,
  visit_occurrence_id			      INTEGER			NULL ,
  visit_detail_id               INTEGER     NULL ,
  observation_source_value		  VARCHAR(50)	NULL ,
  observation_source_concept_id	INTEGER			NULL ,
  unit_source_value				      VARCHAR(50)	NULL ,
  qualifier_source_value			  VARCHAR(50)	NULL
)
;
GO
ALTER TABLE observation ADD CONSTRAINT fpk_observation_person FOREIGN KEY (person_id)  REFERENCES person (person_id);
GO
ALTER TABLE observation ADD CONSTRAINT fpk_observation_concept FOREIGN KEY (observation_concept_id)  REFERENCES concept (concept_id);
GO
ALTER TABLE observation ADD CONSTRAINT fpk_observation_type_concept FOREIGN KEY (observation_type_concept_id)  REFERENCES concept (concept_id);
GO
ALTER TABLE observation ADD CONSTRAINT fpk_observation_value FOREIGN KEY (value_as_concept_id)  REFERENCES concept (concept_id);
GO
ALTER TABLE observation ADD CONSTRAINT fpk_observation_qualifier FOREIGN KEY (qualifier_concept_id)  REFERENCES concept (concept_id);
GO
ALTER TABLE observation ADD CONSTRAINT fpk_observation_unit FOREIGN KEY (unit_concept_id)  REFERENCES concept (concept_id);
GO
ALTER TABLE observation ADD CONSTRAINT fpk_observation_provider FOREIGN KEY (provider_id)  REFERENCES provider (provider_id);
GO
ALTER TABLE observation ADD CONSTRAINT fpk_observation_visit FOREIGN KEY (visit_occurrence_id)  REFERENCES visit_occurrence (visit_occurrence_id);
GO
ALTER TABLE observation ADD CONSTRAINT fpk_observation_concept_s FOREIGN KEY (observation_source_concept_id)  REFERENCES concept (concept_id);
GO
ALTER TABLE observation  ADD CONSTRAINT xpk_observation PRIMARY KEY NONCLUSTERED ( observation_id ) ;
GO
CREATE CLUSTERED INDEX idx_observation_person_id ON observation (person_id ASC);
GO
CREATE INDEX idx_observation_concept_id ON observation (observation_concept_id ASC);
GO
CREATE INDEX idx_observation_visit_id ON observation (visit_occurrence_id ASC);
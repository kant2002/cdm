--HINT DISTRIBUTE_ON_KEY(subject_id)
CREATE TABLE cohort_attribute
(
  cohort_definition_id		INTEGER		NOT NULL ,
  subject_id						  INTEGER		NOT NULL ,
  cohort_start_date				DATE			NOT NULL ,
  cohort_end_date				  DATE			NOT NULL ,
  attribute_definition_id INTEGER		NOT NULL ,
  value_as_number				  FLOAT			NULL ,
  value_as_concept_id			INTEGER		NULL
)
;
GO
/************************

Standardized derived elements

************************/


--ALTER TABLE cohort ADD CONSTRAINT fpk_cohort_definition FOREIGN KEY (cohort_definition_id)  REFERENCES cohort_definition (cohort_definition_id);


ALTER TABLE cohort_attribute ADD CONSTRAINT fpk_ca_cohort_definition FOREIGN KEY (cohort_definition_id)  REFERENCES cohort_definition (cohort_definition_id);
GO
ALTER TABLE cohort_attribute ADD CONSTRAINT fpk_ca_attribute_definition FOREIGN KEY (attribute_definition_id)  REFERENCES attribute_definition (attribute_definition_id);
GO
ALTER TABLE cohort_attribute ADD CONSTRAINT fpk_ca_value FOREIGN KEY (value_as_concept_id)  REFERENCES concept (concept_id);
GO
ALTER TABLE cohort_attribute ADD CONSTRAINT xpk_cohort_attribute PRIMARY KEY NONCLUSTERED ( cohort_definition_id, subject_id, cohort_start_date, cohort_end_date, attribute_definition_id ) ;
GO
CREATE INDEX idx_ca_subject_id ON cohort_attribute (subject_id ASC);
GO
CREATE INDEX idx_ca_definition_id ON cohort_attribute (cohort_definition_id ASC);
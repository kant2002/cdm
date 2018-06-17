CREATE TABLE cohort_definition (
  cohort_definition_id				    INTEGER			  NOT NULL,
  cohort_definition_name			    VARCHAR(255)	NOT NULL,
  cohort_definition_description		VARCHAR(MAX)	NULL,
  definition_type_concept_id		  INTEGER			  NOT NULL,
  cohort_definition_syntax			  VARCHAR(MAX)	NULL,
  subject_concept_id				      INTEGER			  NOT NULL,
  cohort_initiation_date			    DATE			    NULL
)
;
GO
ALTER TABLE cohort_definition ADD CONSTRAINT fpk_cohort_definition_concept FOREIGN KEY (definition_type_concept_id)  REFERENCES concept (concept_id);
GO
ALTER TABLE cohort_definition ADD CONSTRAINT fpk_cohort_subject_concept FOREIGN KEY (subject_concept_id)  REFERENCES concept (concept_id);
GO
ALTER TABLE cohort_definition ADD CONSTRAINT xpk_cohort_definition PRIMARY KEY NONCLUSTERED (cohort_definition_id);
GO
CREATE CLUSTERED INDEX idx_cohort_definition_id ON cohort_definition (cohort_definition_id ASC);
/************************

Standardized derived elements

************************/


--HINT DISTRIBUTE_ON_KEY(subject_id)
CREATE TABLE cohort
(
  cohort_definition_id	INTEGER		NOT NULL ,
  subject_id						INTEGER		NOT NULL ,
  cohort_start_date			DATE			NOT NULL ,
  cohort_end_date				DATE			NOT NULL
)
;
GO
/************************

Standardized derived elements

************************/

ALTER TABLE cohort ADD CONSTRAINT xpk_cohort PRIMARY KEY NONCLUSTERED ( cohort_definition_id, subject_id, cohort_start_date, cohort_end_date  ) ;
GO
/************************

Standardized derived elements

************************/


CREATE INDEX idx_cohort_subject_id ON cohort (subject_id ASC);
GO
CREATE INDEX idx_cohort_c_definition_id ON cohort (cohort_definition_id ASC);
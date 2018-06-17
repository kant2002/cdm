--HINT DISTRIBUTE_ON_KEY(person_id)
CREATE TABLE observation_period
(
  observation_period_id				      INTEGER		NOT NULL ,
  person_id							            INTEGER		NOT NULL ,
  observation_period_start_date		  DATE		  NOT NULL ,
  observation_period_end_date		    DATE		  NOT NULL ,
  period_type_concept_id			      INTEGER		NOT NULL
)
;
GO
ALTER TABLE observation_period ADD CONSTRAINT fpk_observation_period_person FOREIGN KEY (person_id)  REFERENCES person (person_id);
GO
ALTER TABLE observation_period ADD CONSTRAINT fpk_observation_period_concept FOREIGN KEY (period_type_concept_id)  REFERENCES concept (concept_id);
GO
ALTER TABLE observation_period ADD CONSTRAINT xpk_observation_period PRIMARY KEY NONCLUSTERED ( observation_period_id ) ;
GO
CREATE CLUSTERED INDEX idx_observation_period_id ON observation_period (person_id ASC);
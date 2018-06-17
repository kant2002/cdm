--HINT DISTRIBUTE_ON_KEY(person_id)
CREATE TABLE condition_era
(
  condition_era_id				    INTEGER			NOT NULL ,
  person_id						        INTEGER			NOT NULL ,
  condition_concept_id			  INTEGER			NOT NULL ,
  condition_era_start_date		DATE			  NOT NULL ,
  condition_era_end_date			DATE			  NOT NULL ,
  condition_occurrence_count	INTEGER			NULL
)
;
GO
ALTER TABLE condition_era ADD CONSTRAINT fpk_condition_era_person FOREIGN KEY (person_id)  REFERENCES person (person_id);
GO
ALTER TABLE condition_era ADD CONSTRAINT fpk_condition_era_concept FOREIGN KEY (condition_concept_id)  REFERENCES concept (concept_id);
GO
ALTER TABLE condition_era ADD CONSTRAINT xpk_condition_era PRIMARY KEY NONCLUSTERED ( condition_era_id ) ;
GO
CREATE CLUSTERED INDEX idx_condition_era_person_id ON condition_era (person_id ASC);
GO
CREATE INDEX idx_condition_era_concept_id ON condition_era (condition_concept_id ASC);
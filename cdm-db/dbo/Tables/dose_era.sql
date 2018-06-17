--HINT DISTRIBUTE_ON_KEY(person_id)
CREATE TABLE dose_era
(
  dose_era_id					  INTEGER			NOT NULL ,
  person_id						  INTEGER			NOT NULL ,
  drug_concept_id				INTEGER			NOT NULL ,
  unit_concept_id				INTEGER			NOT NULL ,
  dose_value						FLOAT			  NOT NULL ,
  dose_era_start_date		DATE			  NOT NULL ,
  dose_era_end_date	    DATE			  NOT NULL
)
;
GO
ALTER TABLE dose_era ADD CONSTRAINT fpk_dose_era_person FOREIGN KEY (person_id)  REFERENCES person (person_id);
GO
ALTER TABLE dose_era ADD CONSTRAINT fpk_dose_era_concept FOREIGN KEY (drug_concept_id)  REFERENCES concept (concept_id);
GO
ALTER TABLE dose_era ADD CONSTRAINT fpk_dose_era_unit_concept FOREIGN KEY (unit_concept_id)  REFERENCES concept (concept_id);
GO
ALTER TABLE dose_era  ADD CONSTRAINT xpk_dose_era PRIMARY KEY NONCLUSTERED ( dose_era_id ) ;
GO
CREATE CLUSTERED INDEX idx_dose_era_person_id ON dose_era (person_id ASC);
GO
CREATE INDEX idx_dose_era_concept_id ON dose_era (drug_concept_id ASC);
--HINT DISTRIBUTE_ON_KEY(person_id)
CREATE TABLE drug_era
(
  drug_era_id					INTEGER			NOT NULL ,
  person_id						INTEGER			NOT NULL ,
  drug_concept_id			INTEGER			NOT NULL ,
  drug_era_start_date	DATE			  NOT NULL ,
  drug_era_end_date		DATE			  NOT NULL ,
  drug_exposure_count	INTEGER			NULL ,
  gap_days						INTEGER			NULL
)
;
GO
ALTER TABLE drug_era ADD CONSTRAINT fpk_drug_era_person FOREIGN KEY (person_id)  REFERENCES person (person_id);
GO
ALTER TABLE drug_era ADD CONSTRAINT fpk_drug_era_concept FOREIGN KEY (drug_concept_id)  REFERENCES concept (concept_id);
GO
ALTER TABLE drug_era ADD CONSTRAINT xpk_drug_era PRIMARY KEY NONCLUSTERED ( drug_era_id ) ;
GO
CREATE CLUSTERED INDEX idx_drug_era_person_id ON drug_era (person_id ASC);
GO
CREATE INDEX idx_drug_era_concept_id ON drug_era (drug_concept_id ASC);
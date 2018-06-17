--HINT DISTRIBUTE_ON_KEY(person_id)
CREATE TABLE death
(
  person_id							  INTEGER			NOT NULL ,
  death_date							DATE			  NOT NULL ,
  death_datetime					DATETIME2		NULL ,
  death_type_concept_id   INTEGER			NOT NULL ,
  cause_concept_id			  INTEGER			NULL ,
  cause_source_value			VARCHAR(50)	NULL,
  cause_source_concept_id INTEGER			NULL
)
;
GO
ALTER TABLE death ADD CONSTRAINT fpk_death_person FOREIGN KEY (person_id)  REFERENCES person (person_id);
GO
ALTER TABLE death ADD CONSTRAINT fpk_death_type_concept FOREIGN KEY (death_type_concept_id)  REFERENCES concept (concept_id);
GO
ALTER TABLE death ADD CONSTRAINT fpk_death_cause_concept FOREIGN KEY (cause_concept_id)  REFERENCES concept (concept_id);
GO
ALTER TABLE death ADD CONSTRAINT fpk_death_cause_concept_s FOREIGN KEY (cause_source_concept_id)  REFERENCES concept (concept_id);
GO
ALTER TABLE death ADD CONSTRAINT xpk_death PRIMARY KEY NONCLUSTERED ( person_id ) ;
GO
CREATE CLUSTERED INDEX idx_death_person_id ON death (person_id ASC);
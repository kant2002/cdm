CREATE TABLE concept_relationship (
  concept_id_1			INTEGER			NOT NULL,
  concept_id_2			INTEGER			NOT NULL,
  relationship_id		VARCHAR(20)	NOT NULL,
  valid_start_date	DATE			  NOT NULL,
  valid_end_date		DATE			  NOT NULL,
  invalid_reason		VARCHAR(1)	NULL
  )
;
GO
ALTER TABLE concept_relationship ADD CONSTRAINT fpk_concept_relationship_c_1 FOREIGN KEY (concept_id_1)  REFERENCES concept (concept_id);
GO
ALTER TABLE concept_relationship ADD CONSTRAINT fpk_concept_relationship_c_2 FOREIGN KEY (concept_id_2)  REFERENCES concept (concept_id);
GO
ALTER TABLE concept_relationship ADD CONSTRAINT fpk_concept_relationship_id FOREIGN KEY (relationship_id)  REFERENCES relationship (relationship_id);
GO
ALTER TABLE concept_relationship ADD CONSTRAINT xpk_concept_relationship PRIMARY KEY NONCLUSTERED (concept_id_1,concept_id_2,relationship_id);
GO
CREATE INDEX idx_concept_relationship_id_1 ON concept_relationship (concept_id_1 ASC);
GO
CREATE INDEX idx_concept_relationship_id_2 ON concept_relationship (concept_id_2 ASC);
GO
CREATE INDEX idx_concept_relationship_id_3 ON concept_relationship (relationship_id ASC);
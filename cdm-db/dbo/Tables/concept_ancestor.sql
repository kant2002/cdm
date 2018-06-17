CREATE TABLE concept_ancestor (
  ancestor_concept_id		    INTEGER		NOT NULL,
  descendant_concept_id		  INTEGER		NOT NULL,
  min_levels_of_separation	INTEGER		NOT NULL,
  max_levels_of_separation	INTEGER		NOT NULL
)
;
GO
ALTER TABLE concept_ancestor ADD CONSTRAINT fpk_concept_ancestor_concept_1 FOREIGN KEY (ancestor_concept_id)  REFERENCES concept (concept_id);
GO
ALTER TABLE concept_ancestor ADD CONSTRAINT fpk_concept_ancestor_concept_2 FOREIGN KEY (descendant_concept_id)  REFERENCES concept (concept_id);
GO
ALTER TABLE concept_ancestor ADD CONSTRAINT xpk_concept_ancestor PRIMARY KEY NONCLUSTERED (ancestor_concept_id,descendant_concept_id);
GO
CREATE CLUSTERED INDEX idx_concept_ancestor_id_1 ON concept_ancestor (ancestor_concept_id ASC);
GO
CREATE INDEX idx_concept_ancestor_id_2 ON concept_ancestor (descendant_concept_id ASC);
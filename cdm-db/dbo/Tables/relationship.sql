CREATE TABLE relationship (
  relationship_id			    VARCHAR(20)		NOT NULL,
  relationship_name			  VARCHAR(255)	NOT NULL,
  is_hierarchical			    VARCHAR(1)		NOT NULL,
  defines_ancestry			  VARCHAR(1)		NOT NULL,
  reverse_relationship_id	VARCHAR(20)		NOT NULL,
  relationship_concept_id	INTEGER			  NOT NULL
)
;
GO
ALTER TABLE relationship ADD CONSTRAINT fpk_relationship_concept FOREIGN KEY (relationship_concept_id)  REFERENCES concept (concept_id);
GO
ALTER TABLE relationship ADD CONSTRAINT fpk_relationship_reverse FOREIGN KEY (reverse_relationship_id)  REFERENCES relationship (relationship_id);
GO
ALTER TABLE relationship ADD CONSTRAINT xpk_relationship PRIMARY KEY NONCLUSTERED (relationship_id);
GO
CREATE UNIQUE CLUSTERED INDEX idx_relationship_rel_id ON relationship (relationship_id ASC);
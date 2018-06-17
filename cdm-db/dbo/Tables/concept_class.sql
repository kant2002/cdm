CREATE TABLE concept_class (
  concept_class_id			    VARCHAR(20)		NOT NULL,
  concept_class_name		    VARCHAR(255)	NOT NULL,
  concept_class_concept_id	INTEGER			  NOT NULL
)
;
GO
ALTER TABLE concept_class ADD CONSTRAINT fpk_concept_class_concept FOREIGN KEY (concept_class_concept_id)  REFERENCES concept (concept_id);
GO
ALTER TABLE concept_class ADD CONSTRAINT xpk_concept_class PRIMARY KEY NONCLUSTERED (concept_class_id);
GO
CREATE UNIQUE CLUSTERED INDEX idx_concept_class_class_id ON concept_class (concept_class_id ASC);
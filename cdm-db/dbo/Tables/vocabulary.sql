CREATE TABLE vocabulary (
  vocabulary_id			    VARCHAR(20)		NOT NULL,
  vocabulary_name		    VARCHAR(255)	NOT NULL,
  vocabulary_reference	VARCHAR(255)	NOT NULL,
  vocabulary_version	  VARCHAR(255)	NOT NULL,
  vocabulary_concept_id	INTEGER			  NOT NULL
)
;
GO
ALTER TABLE vocabulary ADD CONSTRAINT fpk_vocabulary_concept FOREIGN KEY (vocabulary_concept_id)  REFERENCES concept (concept_id);
GO
ALTER TABLE vocabulary ADD CONSTRAINT xpk_vocabulary PRIMARY KEY NONCLUSTERED (vocabulary_id);
GO
CREATE UNIQUE CLUSTERED INDEX idx_vocabulary_vocabulary_id ON vocabulary (vocabulary_id ASC);
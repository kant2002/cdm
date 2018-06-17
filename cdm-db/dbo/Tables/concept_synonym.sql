CREATE TABLE concept_synonym (
  concept_id			      INTEGER			  NOT NULL,
  concept_synonym_name	VARCHAR(1000)	NOT NULL,
  language_concept_id	  INTEGER			  NOT NULL
)
;
GO
ALTER TABLE concept_synonym ADD CONSTRAINT fpk_concept_synonym_concept FOREIGN KEY (concept_id)  REFERENCES concept (concept_id);
GO
ALTER TABLE concept_synonym ADD CONSTRAINT fpk_concept_synonym_language FOREIGN KEY (language_concept_id)  REFERENCES concept (concept_id);
GO
/************************
*************************
*************************
*************************

Unique constraints

*************************
*************************
*************************
************************/

ALTER TABLE concept_synonym ADD CONSTRAINT uq_concept_synonym UNIQUE (concept_id, concept_synonym_name, language_concept_id);
GO
CREATE CLUSTERED INDEX idx_concept_synonym_id ON concept_synonym (concept_id ASC);
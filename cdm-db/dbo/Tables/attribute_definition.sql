CREATE TABLE attribute_definition (
  attribute_definition_id		  INTEGER			  NOT NULL,
  attribute_name				      VARCHAR(255)	NOT NULL,
  attribute_description			  VARCHAR(MAX)	NULL,
  attribute_type_concept_id		INTEGER			  NOT NULL,
  attribute_syntax				    VARCHAR(MAX)	NULL
)
;
GO
ALTER TABLE attribute_definition ADD CONSTRAINT fpk_attribute_type_concept FOREIGN KEY (attribute_type_concept_id)  REFERENCES concept (concept_id);
GO
ALTER TABLE attribute_definition ADD CONSTRAINT xpk_attribute_definition PRIMARY KEY NONCLUSTERED (attribute_definition_id);
GO
CREATE CLUSTERED INDEX idx_attribute_definition_id ON attribute_definition (attribute_definition_id ASC);
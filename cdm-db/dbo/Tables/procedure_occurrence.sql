--HINT DISTRIBUTE_ON_KEY(person_id)
CREATE TABLE procedure_occurrence
(
  procedure_occurrence_id		  INTEGER			NOT NULL ,
  person_id						        INTEGER			NOT NULL ,
  procedure_concept_id			  INTEGER			NOT NULL ,
  procedure_date				      DATE			  NOT NULL ,
  procedure_datetime			    DATETIME2		NULL ,
  procedure_type_concept_id		INTEGER			NOT NULL ,
  modifier_concept_id			    INTEGER			NULL ,
  quantity						        INTEGER			NULL ,
  provider_id					        INTEGER			NULL ,
  visit_occurrence_id			    INTEGER			NULL ,
  visit_detail_id             INTEGER     NULL ,
  procedure_source_value		  VARCHAR(50)	NULL ,
  procedure_source_concept_id	INTEGER			NULL ,
  modifier_source_value		   VARCHAR(50)	NULL
)
;
GO
ALTER TABLE procedure_occurrence ADD CONSTRAINT fpk_procedure_person FOREIGN KEY (person_id)  REFERENCES person (person_id);
GO
ALTER TABLE procedure_occurrence ADD CONSTRAINT fpk_procedure_concept FOREIGN KEY (procedure_concept_id)  REFERENCES concept (concept_id);
GO
ALTER TABLE procedure_occurrence ADD CONSTRAINT fpk_procedure_type_concept FOREIGN KEY (procedure_type_concept_id)  REFERENCES concept (concept_id);
GO
ALTER TABLE procedure_occurrence ADD CONSTRAINT fpk_procedure_modifier FOREIGN KEY (modifier_concept_id)  REFERENCES concept (concept_id);
GO
ALTER TABLE procedure_occurrence ADD CONSTRAINT fpk_procedure_provider FOREIGN KEY (provider_id)  REFERENCES provider (provider_id);
GO
ALTER TABLE procedure_occurrence ADD CONSTRAINT fpk_procedure_visit FOREIGN KEY (visit_occurrence_id)  REFERENCES visit_occurrence (visit_occurrence_id);
GO
ALTER TABLE procedure_occurrence ADD CONSTRAINT fpk_procedure_concept_s FOREIGN KEY (procedure_source_concept_id)  REFERENCES concept (concept_id);
GO
ALTER TABLE procedure_occurrence ADD CONSTRAINT xpk_procedure_occurrence PRIMARY KEY NONCLUSTERED ( procedure_occurrence_id ) ;
GO
CREATE CLUSTERED INDEX idx_procedure_person_id ON procedure_occurrence (person_id ASC);
GO
CREATE INDEX idx_procedure_concept_id ON procedure_occurrence (procedure_concept_id ASC);
GO
CREATE INDEX idx_procedure_visit_id ON procedure_occurrence (visit_occurrence_id ASC);
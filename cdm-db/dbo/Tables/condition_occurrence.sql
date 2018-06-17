--HINT DISTRIBUTE_ON_KEY(person_id)
CREATE TABLE condition_occurrence
(
  condition_occurrence_id		    INTEGER			NOT NULL ,
  person_id						          INTEGER			NOT NULL ,
  condition_concept_id			    INTEGER			NOT NULL ,
  condition_start_date			    DATE			  NOT NULL ,
  condition_start_datetime		  DATETIME2		NULL ,
  condition_end_date			      DATE			  NULL ,
  condition_end_datetime		    DATETIME2		NULL ,
  condition_type_concept_id		  INTEGER			NOT NULL ,
  stop_reason					          VARCHAR(20)	NULL ,
  provider_id					          INTEGER			NULL ,
  visit_occurrence_id			      INTEGER			NULL ,
  visit_detail_id               INTEGER     NULL ,
  condition_source_value		    VARCHAR(50)	NULL ,
  condition_source_concept_id	  INTEGER			NULL ,
  condition_status_source_value	VARCHAR(50)	NULL ,
  condition_status_concept_id	  INTEGER			NULL
)
;
GO
ALTER TABLE condition_occurrence ADD CONSTRAINT fpk_condition_person FOREIGN KEY (person_id)  REFERENCES person (person_id);
GO
ALTER TABLE condition_occurrence ADD CONSTRAINT fpk_condition_concept FOREIGN KEY (condition_concept_id)  REFERENCES concept (concept_id);
GO
ALTER TABLE condition_occurrence ADD CONSTRAINT fpk_condition_type_concept FOREIGN KEY (condition_type_concept_id)  REFERENCES concept (concept_id);
GO
ALTER TABLE condition_occurrence ADD CONSTRAINT fpk_condition_provider FOREIGN KEY (provider_id)  REFERENCES provider (provider_id);
GO
ALTER TABLE condition_occurrence ADD CONSTRAINT fpk_condition_visit FOREIGN KEY (visit_occurrence_id)  REFERENCES visit_occurrence (visit_occurrence_id);
GO
ALTER TABLE condition_occurrence ADD CONSTRAINT fpk_condition_concept_s FOREIGN KEY (condition_source_concept_id)  REFERENCES concept (concept_id);
GO
ALTER TABLE condition_occurrence ADD CONSTRAINT fpk_condition_status_concept FOREIGN KEY (condition_status_concept_id) REFERENCES concept (concept_id);
GO
ALTER TABLE condition_occurrence ADD CONSTRAINT xpk_condition_occurrence PRIMARY KEY NONCLUSTERED ( condition_occurrence_id ) ;
GO
CREATE CLUSTERED INDEX idx_condition_person_id ON condition_occurrence (person_id ASC);
GO
CREATE INDEX idx_condition_concept_id ON condition_occurrence (condition_concept_id ASC);
GO
CREATE INDEX idx_condition_visit_id ON condition_occurrence (visit_occurrence_id ASC);
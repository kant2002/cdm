--HINT DISTRIBUTE_ON_KEY(person_id)
CREATE TABLE visit_occurrence
(
  visit_occurrence_id			      INTEGER			NOT NULL ,
  person_id						          INTEGER			NOT NULL ,
  visit_concept_id				      INTEGER			NOT NULL ,
  visit_start_date				      DATE			  NOT NULL ,
  visit_start_datetime				  DATETIME2		NULL ,
  visit_end_date					      DATE			  NOT NULL ,
  visit_end_datetime					  DATETIME2		NULL ,
  visit_type_concept_id			    INTEGER			NOT NULL ,
  provider_id					          INTEGER			NULL,
  care_site_id					        INTEGER			NULL,
  visit_source_value				    VARCHAR(50)	NULL,
  visit_source_concept_id		    INTEGER			NULL ,
  admitting_source_concept_id	  INTEGER			NULL ,
  admitting_source_value		    VARCHAR(50)	NULL ,
  discharge_to_concept_id		    INTEGER   	NULL ,
  discharge_to_source_value		  VARCHAR(50)	NULL ,
  preceding_visit_occurrence_id	INTEGER			NULL
)
;
GO
ALTER TABLE visit_occurrence ADD CONSTRAINT fpk_visit_person FOREIGN KEY (person_id)  REFERENCES person (person_id);
GO
ALTER TABLE visit_occurrence ADD CONSTRAINT fpk_visit_type_concept FOREIGN KEY (visit_type_concept_id)  REFERENCES concept (concept_id);
GO
ALTER TABLE visit_occurrence ADD CONSTRAINT fpk_visit_provider FOREIGN KEY (provider_id)  REFERENCES provider (provider_id);
GO
ALTER TABLE visit_occurrence ADD CONSTRAINT fpk_visit_care_site FOREIGN KEY (care_site_id)  REFERENCES care_site (care_site_id);
GO
ALTER TABLE visit_occurrence ADD CONSTRAINT fpk_visit_concept_s FOREIGN KEY (visit_source_concept_id)  REFERENCES concept (concept_id);
GO
ALTER TABLE visit_occurrence ADD CONSTRAINT fpk_visit_admitting_s FOREIGN KEY (admitting_source_concept_id) REFERENCES concept (concept_id);
GO
ALTER TABLE visit_occurrence ADD CONSTRAINT fpk_visit_discharge FOREIGN KEY (discharge_to_concept_id) REFERENCES concept (concept_id);
GO
ALTER TABLE visit_occurrence ADD CONSTRAINT fpk_visit_preceding FOREIGN KEY (preceding_visit_occurrence_id) REFERENCES visit_occurrence (visit_occurrence_id);
GO
ALTER TABLE visit_occurrence ADD CONSTRAINT xpk_visit_occurrence PRIMARY KEY NONCLUSTERED ( visit_occurrence_id ) ;
GO
CREATE CLUSTERED INDEX idx_visit_person_id ON visit_occurrence (person_id ASC);
GO
CREATE INDEX idx_visit_concept_id ON visit_occurrence (visit_concept_id ASC);
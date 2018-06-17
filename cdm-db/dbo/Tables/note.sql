--HINT DISTRIBUTE_ON_KEY(person_id)
CREATE TABLE note
(
  note_id						    INTEGER			  NOT NULL ,
  person_id						  INTEGER			  NOT NULL ,
  note_date						  DATE			    NOT NULL ,
  note_datetime					DATETIME2		  NULL ,
  note_type_concept_id	INTEGER			  NOT NULL ,
  note_class_concept_id INTEGER			  NOT NULL ,
  note_title					  VARCHAR(250)	NULL ,
  note_text						  VARCHAR(MAX)  NULL ,
  encoding_concept_id		INTEGER			  NOT NULL ,
  language_concept_id		INTEGER			  NOT NULL ,
  provider_id					  INTEGER			  NULL ,
  visit_occurrence_id		INTEGER			  NULL ,
  visit_detail_id       INTEGER       NULL ,
  note_source_value			VARCHAR(50)		NULL
)
;
GO
ALTER TABLE note ADD CONSTRAINT fpk_note_person FOREIGN KEY (person_id)  REFERENCES person (person_id);
GO
ALTER TABLE note ADD CONSTRAINT fpk_note_type_concept FOREIGN KEY (note_type_concept_id)  REFERENCES concept (concept_id);
GO
ALTER TABLE note ADD CONSTRAINT fpk_note_class_concept FOREIGN KEY (note_class_concept_id) REFERENCES concept (concept_id);
GO
ALTER TABLE note ADD CONSTRAINT fpk_note_encoding_concept FOREIGN KEY (encoding_concept_id) REFERENCES concept (concept_id);
GO
ALTER TABLE note ADD CONSTRAINT fpk_language_concept FOREIGN KEY (language_concept_id) REFERENCES concept (concept_id);
GO
ALTER TABLE note ADD CONSTRAINT fpk_note_provider FOREIGN KEY (provider_id)  REFERENCES provider (provider_id);
GO
ALTER TABLE note ADD CONSTRAINT fpk_note_visit FOREIGN KEY (visit_occurrence_id)  REFERENCES visit_occurrence (visit_occurrence_id);
GO
ALTER TABLE note ADD CONSTRAINT xpk_note PRIMARY KEY NONCLUSTERED ( note_id ) ;
GO
CREATE CLUSTERED INDEX idx_note_person_id ON note (person_id ASC);
GO
CREATE INDEX idx_note_concept_id ON note (note_type_concept_id ASC);
GO
CREATE INDEX idx_note_visit_id ON note (visit_occurrence_id ASC);
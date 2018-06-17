CREATE TABLE note_nlp
(
  note_nlp_id					        INTEGER			  NOT NULL ,
  note_id						          INTEGER			  NOT NULL ,
  section_concept_id			    INTEGER			  NULL ,
  snippet						          VARCHAR(250)	NULL ,
  "offset"					          VARCHAR(250)	NULL ,
  lexical_variant				      VARCHAR(250)	NOT NULL ,
  note_nlp_concept_id			    INTEGER			  NULL ,
  note_nlp_source_concept_id  INTEGER			  NULL ,
  nlp_system					        VARCHAR(250)	NULL ,
  nlp_date						        DATE			    NOT NULL ,
  nlp_datetime					      DATETIME2		  NULL ,
  term_exists					        VARCHAR(1)		NULL ,
  term_temporal					      VARCHAR(50)		NULL ,
  term_modifiers				      VARCHAR(2000)	NULL
)
;
GO
ALTER TABLE note_nlp ADD CONSTRAINT fpk_note_nlp_note FOREIGN KEY (note_id) REFERENCES note (note_id);
GO
ALTER TABLE note_nlp ADD CONSTRAINT fpk_note_nlp_section_concept FOREIGN KEY (section_concept_id) REFERENCES concept (concept_id);
GO
ALTER TABLE note_nlp ADD CONSTRAINT fpk_note_nlp_concept FOREIGN KEY (note_nlp_concept_id) REFERENCES concept (concept_id);
GO
ALTER TABLE note_nlp ADD CONSTRAINT xpk_note_nlp PRIMARY KEY NONCLUSTERED ( note_nlp_id ) ;
GO
CREATE CLUSTERED INDEX idx_note_nlp_note_id ON note_nlp (note_id ASC);
GO
CREATE INDEX idx_note_nlp_concept_id ON note_nlp (note_nlp_concept_id ASC);
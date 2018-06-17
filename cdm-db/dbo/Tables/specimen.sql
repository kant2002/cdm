--HINT DISTRIBUTE_ON_KEY(person_id)
CREATE TABLE specimen
(
  specimen_id						      INTEGER			NOT NULL ,
  person_id							      INTEGER			NOT NULL ,
  specimen_concept_id				  INTEGER			NOT NULL ,
  specimen_type_concept_id		INTEGER			NOT NULL ,
  specimen_date						    DATE			  NOT NULL ,
  specimen_datetime					  DATETIME2		NULL ,
  quantity							      FLOAT			  NULL ,
  unit_concept_id					    INTEGER			NULL ,
  anatomic_site_concept_id		INTEGER			NULL ,
  disease_status_concept_id		INTEGER			NULL ,
  specimen_source_id				  VARCHAR(50)	NULL ,
  specimen_source_value				VARCHAR(50)	NULL ,
  unit_source_value					  VARCHAR(50)	NULL ,
  anatomic_site_source_value	VARCHAR(50)	NULL ,
  disease_status_source_value VARCHAR(50)	NULL
)
;
GO
ALTER TABLE specimen ADD CONSTRAINT fpk_specimen_person FOREIGN KEY (person_id)  REFERENCES person (person_id);
GO
ALTER TABLE specimen ADD CONSTRAINT fpk_specimen_concept FOREIGN KEY (specimen_concept_id)  REFERENCES concept (concept_id);
GO
ALTER TABLE specimen ADD CONSTRAINT fpk_specimen_type_concept FOREIGN KEY (specimen_type_concept_id)  REFERENCES concept (concept_id);
GO
ALTER TABLE specimen ADD CONSTRAINT fpk_specimen_unit_concept FOREIGN KEY (unit_concept_id)  REFERENCES concept (concept_id);
GO
ALTER TABLE specimen ADD CONSTRAINT fpk_specimen_site_concept FOREIGN KEY (anatomic_site_concept_id)  REFERENCES concept (concept_id);
GO
ALTER TABLE specimen ADD CONSTRAINT fpk_specimen_status_concept FOREIGN KEY (disease_status_concept_id)  REFERENCES concept (concept_id);
GO
ALTER TABLE specimen ADD CONSTRAINT xpk_specimen PRIMARY KEY NONCLUSTERED ( specimen_id ) ;
GO
CREATE CLUSTERED INDEX idx_specimen_person_id ON specimen (person_id ASC);
GO
CREATE INDEX idx_specimen_concept_id ON specimen (specimen_concept_id ASC);
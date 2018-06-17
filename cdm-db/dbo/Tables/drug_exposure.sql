--HINT DISTRIBUTE_ON_KEY(person_id)
CREATE TABLE drug_exposure
(
  drug_exposure_id				      INTEGER			  NOT NULL ,
  person_id						          INTEGER			  NOT NULL ,
  drug_concept_id				        INTEGER			  NOT NULL ,
  drug_exposure_start_date		  DATE			    NOT NULL ,
  drug_exposure_start_datetime  DATETIME2		  NULL ,
  drug_exposure_end_date		    DATE			    NOT NULL ,
  drug_exposure_end_datetime	  DATETIME2		  NULL ,
  verbatim_end_date				      DATE			    NULL ,
  drug_type_concept_id			    INTEGER			  NOT NULL ,
  stop_reason					          VARCHAR(20)		NULL ,
  refills						            INTEGER		  	NULL ,
  quantity						          FLOAT			    NULL ,
  days_supply					          INTEGER		  	NULL ,
  sig							              VARCHAR(MAX)	NULL ,
  route_concept_id				      INTEGER			  NULL ,
  lot_number					          VARCHAR(50)	  NULL ,
  provider_id					          INTEGER			  NULL ,
  visit_occurrence_id			      INTEGER			  NULL ,
  visit_detail_id               INTEGER       NULL ,
  drug_source_value				      VARCHAR(50)	  NULL ,
  drug_source_concept_id		    INTEGER			  NULL ,
  route_source_value			      VARCHAR(50)	  NULL ,
  dose_unit_source_value		    VARCHAR(50)	  NULL
)
;
GO
ALTER TABLE drug_exposure ADD CONSTRAINT fpk_drug_person FOREIGN KEY (person_id)  REFERENCES person (person_id);
GO
ALTER TABLE drug_exposure ADD CONSTRAINT fpk_drug_concept FOREIGN KEY (drug_concept_id)  REFERENCES concept (concept_id);
GO
ALTER TABLE drug_exposure ADD CONSTRAINT fpk_drug_type_concept FOREIGN KEY (drug_type_concept_id)  REFERENCES concept (concept_id);
GO
ALTER TABLE drug_exposure ADD CONSTRAINT fpk_drug_route_concept FOREIGN KEY (route_concept_id)  REFERENCES concept (concept_id);
GO
ALTER TABLE drug_exposure ADD CONSTRAINT fpk_drug_provider FOREIGN KEY (provider_id)  REFERENCES provider (provider_id);
GO
ALTER TABLE drug_exposure ADD CONSTRAINT fpk_drug_visit FOREIGN KEY (visit_occurrence_id)  REFERENCES visit_occurrence (visit_occurrence_id);
GO
ALTER TABLE drug_exposure ADD CONSTRAINT fpk_drug_concept_s FOREIGN KEY (drug_source_concept_id)  REFERENCES concept (concept_id);
GO
ALTER TABLE drug_exposure ADD CONSTRAINT xpk_drug_exposure PRIMARY KEY NONCLUSTERED ( drug_exposure_id ) ;
GO
CREATE CLUSTERED INDEX idx_drug_person_id ON drug_exposure (person_id ASC);
GO
CREATE INDEX idx_drug_concept_id ON drug_exposure (drug_concept_id ASC);
GO
CREATE INDEX idx_drug_visit_id ON drug_exposure (visit_occurrence_id ASC);
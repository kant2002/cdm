/************************

Standardized health economics

************************/


--HINT DISTRIBUTE_ON_KEY(person_id)
CREATE TABLE payer_plan_period
(
  payer_plan_period_id			    INTEGER			  NOT NULL ,
  person_id						          INTEGER			  NOT NULL ,
  payer_plan_period_start_date  DATE			    NOT NULL ,
  payer_plan_period_end_date		DATE			    NOT NULL ,
  payer_concept_id              INTEGER       NULL ,
  payer_source_value				    VARCHAR(50)	  NULL ,
  payer_source_concept_id       INTEGER       NULL ,
  plan_concept_id               INTEGER       NULL ,
  plan_source_value				      VARCHAR(50)	  NULL ,
  plan_source_concept_id        INTEGER       NULL ,
  sponsor_concept_id            INTEGER       NULL ,
  sponsor_source_value          VARCHAR(50)   NULL ,
  sponsor_source_concept_id     INTEGER       NULL ,
  family_source_value			      VARCHAR(50)	  NULL ,
  stop_reason_concept_id        INTEGER       NULL ,
  stop_reason_source_value      VARCHAR(50)      NULL ,
  stop_reason_source_concept_id INTEGER       NULL
)
;
GO
/************************

Standardized health economics

************************/

ALTER TABLE payer_plan_period ADD CONSTRAINT fpk_payer_plan_period FOREIGN KEY (person_id)  REFERENCES person (person_id);
GO
/************************

Standardized health economics

************************/


ALTER TABLE payer_plan_period ADD CONSTRAINT xpk_payer_plan_period PRIMARY KEY NONCLUSTERED ( payer_plan_period_id ) ;
GO
/************************

Standardized health system data

************************/





/************************

Standardized health economics

************************/

CREATE CLUSTERED INDEX idx_period_person_id ON payer_plan_period (person_id ASC);
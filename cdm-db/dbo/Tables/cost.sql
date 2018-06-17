CREATE TABLE cost
(
  cost_id					          INTEGER	    NOT NULL ,
  cost_event_id             INTEGER     NOT NULL ,
  cost_domain_id            VARCHAR(20) NOT NULL ,
  cost_type_concept_id      INTEGER     NOT NULL ,
  currency_concept_id			  INTEGER			NULL ,
  total_charge						  FLOAT			  NULL ,
  total_cost						    FLOAT			  NULL ,
  total_paid						    FLOAT			  NULL ,
  paid_by_payer					    FLOAT			  NULL ,
  paid_by_patient						FLOAT			  NULL ,
  paid_patient_copay				FLOAT			  NULL ,
  paid_patient_coinsurance  FLOAT			  NULL ,
  paid_patient_deductible		FLOAT			  NULL ,
  paid_by_primary						FLOAT			  NULL ,
  paid_ingredient_cost			FLOAT			  NULL ,
  paid_dispensing_fee				FLOAT			  NULL ,
  payer_plan_period_id			INTEGER			NULL ,
  amount_allowed		        FLOAT			  NULL ,
  revenue_code_concept_id		INTEGER			NULL ,
  reveue_code_source_value  VARCHAR(50) NULL,
  drg_concept_id			      INTEGER		  NULL,
  drg_source_value			    VARCHAR(3)	NULL
)
;
GO
ALTER TABLE cost ADD CONSTRAINT fpk_visit_cost_currency FOREIGN KEY (currency_concept_id)  REFERENCES concept (concept_id);
GO
ALTER TABLE cost ADD CONSTRAINT fpk_visit_cost_period FOREIGN KEY (payer_plan_period_id)  REFERENCES payer_plan_period (payer_plan_period_id);
GO
ALTER TABLE cost ADD CONSTRAINT fpk_drg_concept FOREIGN KEY (drg_concept_id) REFERENCES concept (concept_id);
GO
ALTER TABLE cost ADD CONSTRAINT xpk_visit_cost PRIMARY KEY NONCLUSTERED ( cost_id ) ;
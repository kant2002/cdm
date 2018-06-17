CREATE TABLE drug_strength (
  drug_concept_id				      INTEGER		  NOT NULL,
  ingredient_concept_id			  INTEGER		  NOT NULL,
  amount_value					      FLOAT		    NULL,
  amount_unit_concept_id		  INTEGER		  NULL,
  numerator_value				      FLOAT		    NULL,
  numerator_unit_concept_id		INTEGER		  NULL,
  denominator_value				    FLOAT		    NULL,
  denominator_unit_concept_id	INTEGER		  NULL,
  box_size						        INTEGER		  NULL,
  valid_start_date				    DATE		    NOT NULL,
  valid_end_date				      DATE		    NOT NULL,
  invalid_reason				      VARCHAR(1)  NULL
)
;
GO
ALTER TABLE drug_strength ADD CONSTRAINT fpk_drug_strength_concept_1 FOREIGN KEY (drug_concept_id)  REFERENCES concept (concept_id);
GO
ALTER TABLE drug_strength ADD CONSTRAINT fpk_drug_strength_concept_2 FOREIGN KEY (ingredient_concept_id)  REFERENCES concept (concept_id);
GO
ALTER TABLE drug_strength ADD CONSTRAINT fpk_drug_strength_unit_1 FOREIGN KEY (amount_unit_concept_id)  REFERENCES concept (concept_id);
GO
ALTER TABLE drug_strength ADD CONSTRAINT fpk_drug_strength_unit_2 FOREIGN KEY (numerator_unit_concept_id)  REFERENCES concept (concept_id);
GO
ALTER TABLE drug_strength ADD CONSTRAINT fpk_drug_strength_unit_3 FOREIGN KEY (denominator_unit_concept_id)  REFERENCES concept (concept_id);
GO
ALTER TABLE drug_strength ADD CONSTRAINT xpk_drug_strength PRIMARY KEY NONCLUSTERED (drug_concept_id, ingredient_concept_id);
GO
CREATE CLUSTERED INDEX idx_drug_strength_id_1 ON drug_strength (drug_concept_id ASC);
GO
CREATE INDEX idx_drug_strength_id_2 ON drug_strength (ingredient_concept_id ASC);
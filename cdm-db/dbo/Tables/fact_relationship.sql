CREATE TABLE fact_relationship
(
  domain_concept_id_1			INTEGER			NOT NULL ,
  fact_id_1						    INTEGER			NOT NULL ,
  domain_concept_id_2			INTEGER			NOT NULL ,
  fact_id_2						    INTEGER			NOT NULL ,
  relationship_concept_id	INTEGER			NOT NULL
)
;
GO
ALTER TABLE fact_relationship ADD CONSTRAINT fpk_fact_domain_1 FOREIGN KEY (domain_concept_id_1)  REFERENCES concept (concept_id);
GO
ALTER TABLE fact_relationship ADD CONSTRAINT fpk_fact_domain_2 FOREIGN KEY (domain_concept_id_2)  REFERENCES concept (concept_id);
GO
ALTER TABLE fact_relationship ADD CONSTRAINT fpk_fact_relationship FOREIGN KEY (relationship_concept_id)  REFERENCES concept (concept_id);
GO
CREATE INDEX idx_fact_relationship_id_1 ON fact_relationship (domain_concept_id_1 ASC);
GO
CREATE INDEX idx_fact_relationship_id_2 ON fact_relationship (domain_concept_id_2 ASC);
GO
CREATE INDEX idx_fact_relationship_id_3 ON fact_relationship (relationship_concept_id ASC);
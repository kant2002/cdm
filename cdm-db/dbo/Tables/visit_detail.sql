--HINT DISTRIBUTE_ON_KEY(person_id)
CREATE TABLE visit_detail
(
  visit_detail_id                    INTEGER     NOT NULL ,
  person_id                          INTEGER     NOT NULL ,
  visit_detail_concept_id            INTEGER     NOT NULL ,
  visit_detail_start_date            DATE        NOT NULL ,
  visit_detail_start_datetime        DATETIME2    NULL ,
  visit_detail_end_date              DATE        NOT NULL ,
  visit_detail_end_datetime          DATETIME2    NULL ,
  visit_detail_type_concept_id       INTEGER     NOT NULL ,
  provider_id                        INTEGER     NULL ,
  care_site_id                       INTEGER     NULL ,
  admitting_source_concept_id        INTEGER     NULL ,
  discharge_to_concept_id            INTEGER     NULL ,
  preceding_visit_detail_id          INTEGER     NULL ,
  visit_detail_source_value          VARCHAR(50) NULL ,
  visit_detail_source_concept_id     INTEGER     NULL ,
  admitting_source_value             VARCHAR(50) NULL ,
  discharge_to_source_value          VARCHAR(50) NULL ,
  visit_detail_parent_id             INTEGER     NULL ,
  visit_occurrence_id                INTEGER     NOT NULL
)
;
GO
ALTER TABLE visit_detail ADD CONSTRAINT fpk_v_detail_person FOREIGN KEY (person_id)  REFERENCES person (person_id);
GO
ALTER TABLE visit_detail ADD CONSTRAINT fpk_v_detail_type_concept FOREIGN KEY (visit_detail_type_concept_id)  REFERENCES concept (concept_id);
GO
ALTER TABLE visit_detail ADD CONSTRAINT fpk_v_detail_provider FOREIGN KEY (provider_id)  REFERENCES provider (provider_id);
GO
ALTER TABLE visit_detail ADD CONSTRAINT fpk_v_detail_care_site FOREIGN KEY (care_site_id)  REFERENCES care_site (care_site_id);
GO
ALTER TABLE visit_detail ADD CONSTRAINT fpk_v_detail_concept_s FOREIGN KEY (visit_detail_source_concept_id)  REFERENCES concept (concept_id);
GO
ALTER TABLE visit_detail ADD CONSTRAINT fpk_v_detail_admitting_s FOREIGN KEY (admitting_source_concept_id) REFERENCES concept (concept_id);
GO
ALTER TABLE visit_detail ADD CONSTRAINT fpk_v_detail_discharge FOREIGN KEY (discharge_to_concept_id) REFERENCES concept (concept_id);
GO
ALTER TABLE visit_detail ADD CONSTRAINT fpk_v_detail_preceding FOREIGN KEY (preceding_visit_detail_id) REFERENCES visit_detail (visit_detail_id);
GO
ALTER TABLE visit_detail ADD CONSTRAINT fpk_v_detail_parent FOREIGN KEY (visit_detail_parent_id) REFERENCES visit_detail (visit_detail_id);
GO
ALTER TABLE visit_detail ADD CONSTRAINT fpd_v_detail_visit FOREIGN KEY (visit_occurrence_id) REFERENCES visit_occurrence (visit_occurrence_id);
GO
ALTER TABLE visit_detail ADD CONSTRAINT xpk_visit_detail PRIMARY KEY NONCLUSTERED ( visit_detail_id ) ;
GO
CREATE CLUSTERED INDEX idx_visit_detail_person_id ON visit_detail (person_id ASC);
GO
CREATE INDEX idx_visit_detail_concept_id ON visit_detail (visit_detail_concept_id ASC);
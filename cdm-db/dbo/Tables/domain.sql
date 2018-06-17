CREATE TABLE domain (
  domain_id			    VARCHAR(20)		NOT NULL,
  domain_name		    VARCHAR(255)	NOT NULL,
  domain_concept_id	INTEGER			  NOT NULL
)
;
GO
ALTER TABLE domain ADD CONSTRAINT fpk_domain_concept FOREIGN KEY (domain_concept_id)  REFERENCES concept (concept_id);
GO
ALTER TABLE domain ADD CONSTRAINT xpk_domain PRIMARY KEY NONCLUSTERED (domain_id);
GO
CREATE UNIQUE CLUSTERED INDEX idx_domain_domain_id ON domain (domain_id ASC);
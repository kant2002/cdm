/*********************************************************************************
# Copyright 2017-11 Observational Health Data Sciences and Informatics
#
#
# Licensed under the Apache License, Version 2.0 (the "License")
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
********************************************************************************/

/************************

 ####### #     # ####### ######      #####  ######  #     #           #######      #####
 #     # ##   ## #     # #     #    #     # #     # ##   ##    #    # #           #     #
 #     # # # # # #     # #     #    #       #     # # # # #    #    # #                 #
 #     # #  #  # #     # ######     #       #     # #  #  #    #    # ######       #####
 #     # #     # #     # #          #       #     # #     #    #    #       # ###       #
 #     # #     # #     # #          #     # #     # #     #     #  #  #     # ### #     #
 ####### #     # ####### #           #####  ######  #     #      ##    #####  ###  #####


sql server script to create OMOP common data model version 5.3

last revised: 14-June-2018

Authors:  Patrick Ryan, Christian Reich, Clair Blacketer


*************************/


/************************

Standardized vocabulary

************************/


CREATE TABLE concept (
  concept_id			    INTEGER			  NOT NULL ,
  concept_name			  VARCHAR(255)	NOT NULL ,
  domain_id				    VARCHAR(20)		NOT NULL ,
  vocabulary_id			  VARCHAR(20)		NOT NULL ,
  concept_class_id		VARCHAR(20)		NOT NULL ,
  standard_concept		VARCHAR(1)		NULL ,
  concept_code			  VARCHAR(50)		NOT NULL ,
  valid_start_date		DATE			    NOT NULL ,
  valid_end_date		  DATE			    NOT NULL ,
  invalid_reason		  VARCHAR(1)		NULL
)
;
GO
/*********************************************************************************
# Copyright 2014 Observational Health Data Sciences and Informatics
#
#
# Licensed under the Apache License, Version 2.0 (the "License")
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
********************************************************************************/

/************************

 ####### #     # ####### ######      #####  ######  #     #           #######      #####      #####
 #     # ##   ## #     # #     #    #     # #     # ##   ##    #    # #           #     #    #     #  ####  #    #  ####  ##### #####    ##   # #    # #####  ####
 #     # # # # # #     # #     #    #       #     # # # # #    #    # #                 #    #       #    # ##   # #        #   #    #  #  #  # ##   #   #   #
 #     # #  #  # #     # ######     #       #     # #  #  #    #    # ######       #####     #       #    # # #  #  ####    #   #    # #    # # # #  #   #    ####
 #     # #     # #     # #          #       #     # #     #    #    #       # ###       #    #       #    # #  # #      #   #   #####  ###### # #  # #   #        #
 #     # #     # #     # #          #     # #     # #     #     #  #  #     # ### #     #    #     # #    # #   ## #    #   #   #   #  #    # # #   ##   #   #    #
 ####### #     # ####### #           #####  ######  #     #      ##    #####  ###  #####      #####   ####  #    #  ####    #   #    # #    # # #    #   #    ####


sql server script to create foreign key constraints within OMOP common data model, version 5.3.0

last revised: 14-June-2018

author:  Patrick Ryan, Clair Blacketer


*************************/


/************************
*************************
*************************
*************************

Foreign key constraints

*************************
*************************
*************************
************************/


/************************

Standardized vocabulary

************************/


ALTER TABLE concept ADD CONSTRAINT fpk_concept_domain FOREIGN KEY (domain_id)  REFERENCES domain (domain_id);
GO
ALTER TABLE concept ADD CONSTRAINT fpk_concept_class FOREIGN KEY (concept_class_id)  REFERENCES concept_class (concept_class_id);
GO
ALTER TABLE concept ADD CONSTRAINT fpk_concept_vocabulary FOREIGN KEY (vocabulary_id)  REFERENCES vocabulary (vocabulary_id);
GO
/*********************************************************************************
# Copyright 2014 Observational Health Data Sciences and Informatics
#
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
********************************************************************************/

/************************

 ####### #     # ####### ######      #####  ######  #     #           #######      #####     ###
 #     # ##   ## #     # #     #    #     # #     # ##   ##    #    # #           #     #     #  #    # #####  ###### #    # ######  ####
 #     # # # # # #     # #     #    #       #     # # # # #    #    # #                 #     #  ##   # #    # #       #  #  #      #
 #     # #  #  # #     # ######     #       #     # #  #  #    #    # ######       #####      #  # #  # #    # #####    ##   #####   ####
 #     # #     # #     # #          #       #     # #     #    #    #       # ###       #     #  #  # # #    # #        ##   #           #
 #     # #     # #     # #          #     # #     # #     #     #  #  #     # ### #     #     #  #   ## #    # #       #  #  #      #    #
 ####### #     # ####### #           #####  ######  #     #      ##    #####  ###  #####     ### #    # #####  ###### #    # ######  ####


sql server script to create the required indexes within OMOP common data model, version 5.3

last revised: 14-November-2017

author:  Patrick Ryan, Clair Blacketer

description:  These primary keys and indices are considered a minimal requirement to ensure adequate performance of analyses.

*************************/


/************************
*************************
*************************
*************************

Primary key constraints

*************************
*************************
*************************
************************/



/************************

Standardized vocabulary

************************/



ALTER TABLE concept ADD CONSTRAINT xpk_concept PRIMARY KEY NONCLUSTERED (concept_id);
GO
/************************
*************************
*************************
*************************

Indices

*************************
*************************
*************************
************************/

/************************

Standardized vocabulary

************************/

CREATE UNIQUE CLUSTERED INDEX idx_concept_concept_id ON concept (concept_id ASC);
GO
CREATE INDEX idx_concept_code ON concept (concept_code ASC);
GO
CREATE INDEX idx_concept_vocabluary_id ON concept (vocabulary_id ASC);
GO
CREATE INDEX idx_concept_domain_id ON concept (domain_id ASC);
GO
CREATE INDEX idx_concept_class_id ON concept (concept_class_id ASC);
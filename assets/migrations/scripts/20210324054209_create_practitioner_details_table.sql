--
--    Copyright 2010-2016 the original author or authors.
--
--    Licensed under the Apache License, Version 2.0 (the "License");
--    you may not use this file except in compliance with the License.
--    You may obtain a copy of the License at
--
--       http://www.apache.org/licenses/LICENSE-2.0
--
--    Unless required by applicable law or agreed to in writing, software
--    distributed under the License is distributed on an "AS IS" BASIS,
--    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
--    See the License for the specific language governing permissions and
--    limitations under the License.
--

-- // create practitioner details table
-- Migration SQL that makes the change goes here.
CREATE TABLE team.practitioner_details (
	id int4 NOT NULL,	
	created_date timestamp NULL,
	email varchar(255) NOT NULL,
	enabled bool NULL, 
	first_name varchar(255) NULL,
	gender varchar(255) NULL,
	identifier varchar(255) NULL, 
	last_name varchar(255) NULL,
	mobile varchar(255) NULL, 	
	modified_date timestamp NULL,	
	uuid varchar(255) NULL, 
	creator int4 NULL,
	parent_user_id int4 NULL, 
	enable_sim_print bool NULL, 
	ss_no varchar(255) NULL, 	
	app_version varchar(255) NULL,
	is_resync varchar NULL DEFAULT ''::character varying, 
	on_maternity_leave bool NULL DEFAULT false, 
	CONSTRAINT uk_r43af9ap4edm43mmtq01oddj6 UNIQUE (username),
	CONSTRAINT practitioner_details_pkey PRIMARY KEY (id),
	CONSTRAINT fk_8yylg530ncoeoqof76not1km3 FOREIGN KEY (parent_user_id) REFERENCES team.practitioner_details(id),
	CONSTRAINT fk_ryd9oryrl6ax5slvr3qihderk FOREIGN KEY (creator) REFERENCES team.practitioner_details(id)
)
WITH (
    OIDS = FALSE
) TABLESPACE ${core_tablespace};

CREATE INDEX practitioner_details_username_index ON team.practitioner_details (username);

-- //@UNDO
-- SQL to undo the change goes here.
DROP TABLE team.practitioner_details;



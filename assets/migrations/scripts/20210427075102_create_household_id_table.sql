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

-- // create household id table
-- Migration SQL that makes the change goes here.
CREATE TABLE core.household_id (
	id bigserial NOT NULL,
	created_date timestamp NULL,
	h_id varchar(255) NULL,
	status bool NULL,
	"type" varchar(255) NULL,
	modified_date timestamp NULL,
	location_id int4 NULL,
	CONSTRAINT health_id_pkey PRIMARY KEY (id)
);
CREATE INDEX household_id_location_id_idx ON core.household_id USING btree (location_id);




CREATE TABLE core.household_id_guest (
	id bigserial NOT NULL,
	h_id varchar(255) NULL,
	status bool NULL,
	"type" varchar(255) NULL,
	location_id int4 NULL,
	created_date timestamp NULL,
	CONSTRAINT household_id_guest_pkey PRIMARY KEY (id)
);
CREATE INDEX household_id_guest_location_id_idx ON core.household_id_guest USING btree (location_id);




-- //@UNDO
-- SQL to undo the change goes here.



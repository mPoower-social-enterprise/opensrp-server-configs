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

-- // create target details table
-- Migration SQL that makes the change goes here.
ALTER TABLE core.client ADD COLUMN IF NOT EXISTS base_entity_id varchar NULL DEFAULT ''::character varying;
ALTER TABLE core.client ADD COLUMN IF NOT EXISTS division varchar NULL DEFAULT ''::character varying;
ALTER TABLE core.client ADD COLUMN IF NOT EXISTS branch varchar NULL DEFAULT ''::character varying;
ALTER TABLE core.client ADD COLUMN IF NOT EXISTS village varchar NULL DEFAULT ''::character varying;
ALTER TABLE core.client ADD COLUMN IF NOT EXISTS district varchar NOT NULL DEFAULT ''::character varying;


ALTER TABLE core.client_metadata ADD COLUMN IF NOT EXISTS address1 varchar NULL;
ALTER TABLE core.client_metadata ADD COLUMN IF NOT EXISTS address2 varchar NULL;
ALTER TABLE core.client_metadata ADD COLUMN IF NOT EXISTS address3 varchar NULL;
ALTER TABLE core.client_metadata ADD COLUMN IF NOT EXISTS village_id int8 NULL;
ALTER TABLE core.client_metadata ADD COLUMN IF NOT EXISTS district varchar NOT NULL DEFAULT ''::character varying;
ALTER TABLE core.client_metadata ADD COLUMN IF NOT EXISTS division varchar NULL;
ALTER TABLE core.client_metadata ADD COLUMN IF NOT EXISTS branch varchar NULL;



ALTER TABLE core."event" ADD COLUMN IF NOT EXISTS base_entity_id varchar NULL DEFAULT ''::character varying;
ALTER TABLE core."event" ADD COLUMN IF NOT EXISTS district varchar NOT NULL DEFAULT ''::character varying;
ALTER TABLE core."event" ADD COLUMN IF NOT EXISTS division varchar NULL DEFAULT ''::character varying;
ALTER TABLE core."event" ADD COLUMN IF NOT EXISTS branch varchar NULL DEFAULT ''::character varying;
ALTER TABLE core."event" ADD COLUMN IF NOT EXISTS village varchar NULL DEFAULT ''::character varying;
ALTER TABLE core."event" ADD COLUMN IF NOT EXISTS provider_id varchar NULL DEFAULT ''::character varying;
ALTER TABLE core."event" ADD COLUMN IF NOT EXISTS event_type varchar NULL DEFAULT ''::character varying;
ALTER TABLE core."event" ADD COLUMN IF NOT EXISTS form_submission_id varchar NULL DEFAULT ''::character varying;


ALTER TABLE core.event_metadata ADD COLUMN IF NOT EXISTS district varchar NOT NULL DEFAULT ''::character varying;
ALTER TABLE core.event_metadata ADD COLUMN IF NOT EXISTS division varchar NULL DEFAULT ''::character varying;
ALTER TABLE core.event_metadata ADD COLUMN IF NOT EXISTS branch varchar NULL DEFAULT ''::character varying;
ALTER TABLE core.event_metadata ADD COLUMN IF NOT EXISTS village varchar NULL DEFAULT ''::character varying;





CREATE TABLE core.client (
	id bigserial NOT NULL,
	"json" jsonb NOT NULL,
	date_deleted timestamp NULL,
	server_version int8 NULL DEFAULT 0,
	base_entity_id varchar NULL DEFAULT ''::character varying,
	district varchar NULL DEFAULT ''::character varying,
	division varchar NULL DEFAULT ''::character varying,
	branch varchar NULL DEFAULT ''::character varying,
	village varchar NULL DEFAULT ''::character varying,
	CONSTRAINT client_pkey PRIMARY KEY (id,district)
)PARTITION BY LIST(district);;
CREATE INDEX client_date_deleted_index ON core.client USING btree (date_deleted);
CREATE INDEX idx_client_sv ON core.client USING btree ((((json ->> 'serverVersion'::text))::bigint));


CREATE TABLE core.client_9267 PARTITION OF core.client  FOR VALUES IN ('9267');
CREATE TABLE core.client_9340 PARTITION OF core.client  FOR VALUES IN ('9340');
CREATE TABLE core.client_10350 PARTITION OF core.client  FOR VALUES IN ('10350');
CREATE TABLE core.client_10355 PARTITION OF core.client  FOR VALUES IN ('10355');
CREATE TABLE core.client_10364 PARTITION OF core.client  FOR VALUES IN ('10364');
CREATE TABLE core.client_10371 PARTITION OF core.client  FOR VALUES IN ('10371');
CREATE TABLE core.client_10377 PARTITION OF core.client  FOR VALUES IN ('10377');
CREATE TABLE core.client_10425 PARTITION OF core.client  FOR VALUES IN ('10425');
CREATE TABLE core.client_10432 PARTITION OF core.client  FOR VALUES IN ('10432');
CREATE TABLE core.client_10520 PARTITION OF core.client  FOR VALUES IN ('10520');
CREATE TABLE core.client_10542 PARTITION OF core.client  FOR VALUES IN ('10542');
CREATE TABLE core.client_10563 PARTITION OF core.client  FOR VALUES IN ('10563');
CREATE TABLE core.client_10568 PARTITION OF core.client  FOR VALUES IN ('10568');
CREATE TABLE core.client_10575 PARTITION OF core.client  FOR VALUES IN ('10575');
CREATE TABLE core.client_10590 PARTITION OF core.client  FOR VALUES IN ('10590');
CREATE TABLE core.client_11539 PARTITION OF core.client  FOR VALUES IN ('11539');
CREATE TABLE core.client_12639 PARTITION OF core.client  FOR VALUES IN ('12639');
CREATE TABLE core.client_20326 PARTITION OF core.client  FOR VALUES IN ('20326');
CREATE TABLE core.client_44044 PARTITION OF core.client  FOR VALUES IN ('44044');
CREATE TABLE core.client_46534 PARTITION OF core.client  FOR VALUES IN ('46534');
CREATE TABLE core.client_48861 PARTITION OF core.client  FOR VALUES IN ('48861');
CREATE TABLE core.client_52017 PARTITION OF core.client  FOR VALUES IN ('52017');
CREATE TABLE core.client_56030 PARTITION OF core.client  FOR VALUES IN ('56030');
CREATE TABLE core.client_56755 PARTITION OF core.client  FOR VALUES IN ('56755');
CREATE TABLE core.client_58455 PARTITION OF core.client  FOR VALUES IN ('58455');
CREATE TABLE core.client_59129 PARTITION OF core.client  FOR VALUES IN ('59129');
CREATE TABLE core.client_59715 PARTITION OF core.client  FOR VALUES IN ('59715');
CREATE TABLE core.client_60860 PARTITION OF core.client  FOR VALUES IN ('60860');
CREATE TABLE core.client_61699 PARTITION OF core.client  FOR VALUES IN ('61699');
CREATE TABLE core.client_61705 PARTITION OF core.client  FOR VALUES IN ('61705');
CREATE TABLE core.client_63945 PARTITION OF core.client  FOR VALUES IN ('63945');
CREATE TABLE core.client_65557 PARTITION OF core.client  FOR VALUES IN ('65557');
CREATE TABLE core.client_67292 PARTITION OF core.client  FOR VALUES IN ('67292');
CREATE TABLE core.client_69521 PARTITION OF core.client  FOR VALUES IN ('69521');
CREATE TABLE core.client_73704 PARTITION OF core.client  FOR VALUES IN ('73704');
CREATE TABLE core.client_75249 PARTITION OF core.client  FOR VALUES IN ('75249');
CREATE TABLE core.client_76039 PARTITION OF core.client  FOR VALUES IN ('76039');
CREATE TABLE core.client_78113 PARTITION OF core.client  FOR VALUES IN ('78113');
CREATE TABLE core.client_78840 PARTITION OF core.client  FOR VALUES IN ('78840');
CREATE TABLE core.client_80189 PARTITION OF core.client  FOR VALUES IN ('80189');
CREATE TABLE core.client_86088 PARTITION OF core.client  FOR VALUES IN ('86088');
CREATE TABLE core.client_88279 PARTITION OF core.client  FOR VALUES IN ('88279');
CREATE TABLE core.client_89831 PARTITION OF core.client  FOR VALUES IN ('89831');
CREATE TABLE core.client_90924 PARTITION OF core.client  FOR VALUES IN ('90924');
CREATE TABLE core.client_93024 PARTITION OF core.client  FOR VALUES IN ('93024');
CREATE TABLE core.client_94343 PARTITION OF core.client  FOR VALUES IN ('94343');
CREATE TABLE core.client_95451 PARTITION OF core.client  FOR VALUES IN ('95451');
CREATE TABLE core.client_97095 PARTITION OF core.client  FOR VALUES IN ('97095');
CREATE TABLE core.client_98423 PARTITION OF core.client  FOR VALUES IN ('98423');
CREATE TABLE core.client_99570 PARTITION OF core.client  FOR VALUES IN ('99570');
CREATE TABLE core.client_101126 PARTITION OF core.client  FOR VALUES IN ('101126');
CREATE TABLE core.client_104320 PARTITION OF core.client  FOR VALUES IN ('104320');
CREATE TABLE core.client_105575 PARTITION OF core.client  FOR VALUES IN ('105575');
CREATE TABLE core.client_106412 PARTITION OF core.client  FOR VALUES IN ('106412');
CREATE TABLE core.client_108475 PARTITION OF core.client  FOR VALUES IN ('108475');
CREATE TABLE core.client_110113 PARTITION OF core.client  FOR VALUES IN ('110113');
CREATE TABLE core.client_111603 PARTITION OF core.client  FOR VALUES IN ('111603');
CREATE TABLE core.client_112890 PARTITION OF core.client  FOR VALUES IN ('112890');
CREATE TABLE core.client_113716 PARTITION OF core.client  FOR VALUES IN ('113716');
CREATE TABLE core.client_114121 PARTITION OF core.client  FOR VALUES IN ('114121');
CREATE TABLE core.client_116626 PARTITION OF core.client  FOR VALUES IN ('116626');
CREATE TABLE core.client_118450 PARTITION OF core.client  FOR VALUES IN ('118450');
CREATE TABLE core.client_121732 PARTITION OF core.client  FOR VALUES IN ('121732');
CREATE TABLE core.client_124321 PARTITION OF core.client  FOR VALUES IN ('124321');

CREATE TABLE core.client_others PARTITION OF core.client DEFAULT;



CREATE TABLE core.client_metadata (
	id int8 NULL,
	client_id int8 NULL,
	document_id varchar NULL,
	base_entity_id varchar NULL,
	relational_id varchar NULL,
	server_version int8 NULL,
	openmrs_uuid varchar NULL,
	unique_id varchar NULL,
	first_name varchar NULL,
	middle_name varchar NULL,
	last_name varchar NULL,
	birth_date date NULL,
	date_deleted timestamp NULL,
	residence varchar NULL,
	location_id varchar NULL,
        client_type varchar NULL,
        date_created timestamp NULL DEFAULT now(),
	date_edited timestamp NULL DEFAULT now(),
	address1 varchar NULL,
	address2 varchar NULL,
	address3 varchar NULL,
	village_id int8 NULL,
	district varchar NULL,
	division varchar NULL,
	branch varchar NULL,
	CONSTRAINT client_metadata_pkey PRIMARY KEY (id,district)
)PARTITION BY LIST(district);
ALTER TABLE core.client_metadata ADD CONSTRAINT client_metadata_base_entity_id_key UNIQUE (base_entity_id,district);
ALTER TABLE core.client_metadata ADD CONSTRAINT client_metadata_document_id_key UNIQUE (document_id,district);



CREATE INDEX client_metadata_client_id_idx ON core.client_metadata USING btree (client_id);
CREATE INDEX client_metadata_date_deleted_index ON core.client_metadata USING btree (date_deleted);
CREATE INDEX client_metadata_identifiers_index ON core.client_metadata USING btree (openmrs_uuid, unique_id);
CREATE INDEX client_metadata_server_version_index ON core.client_metadata USING btree (server_version);
CREATE INDEX client_metadata_village_id_idx ON core.client_metadata USING btree (village_id);


-- core.client_metadata foreign keys

-- ALTER TABLE core.client_metadata ADD CONSTRAINT client_metadata_client_id_fkey FOREIGN KEY (client_id) REFERENCES core.client(id);

CREATE TABLE core.client_metadata_9267 PARTITION OF core.client_metadata FOR VALUES IN ('9267');
CREATE TABLE core.client_metadata_9340 PARTITION OF core.client_metadata FOR VALUES IN ('9340');
CREATE TABLE core.client_metadata_10350 PARTITION OF core.client_metadata FOR VALUES IN ('10350');
CREATE TABLE core.client_metadata_10355 PARTITION OF core.client_metadata FOR VALUES IN ('10355');
CREATE TABLE core.client_metadata_10364 PARTITION OF core.client_metadata FOR VALUES IN ('10364');
CREATE TABLE core.client_metadata_10371 PARTITION OF core.client_metadata FOR VALUES IN ('10371');
CREATE TABLE core.client_metadata_10377 PARTITION OF core.client_metadata FOR VALUES IN ('10377');
CREATE TABLE core.client_metadata_10425 PARTITION OF core.client_metadata FOR VALUES IN ('10425');
CREATE TABLE core.client_metadata_10432 PARTITION OF core.client_metadata FOR VALUES IN ('10432');
CREATE TABLE core.client_metadata_10520 PARTITION OF core.client_metadata FOR VALUES IN ('10520');
CREATE TABLE core.client_metadata_10542 PARTITION OF core.client_metadata FOR VALUES IN ('10542');
CREATE TABLE core.client_metadata_10563 PARTITION OF core.client_metadata FOR VALUES IN ('10563');
CREATE TABLE core.client_metadata_10568 PARTITION OF core.client_metadata FOR VALUES IN ('10568');
CREATE TABLE core.client_metadata_10575 PARTITION OF core.client_metadata FOR VALUES IN ('10575');
CREATE TABLE core.client_metadata_10590 PARTITION OF core.client_metadata FOR VALUES IN ('10590');
CREATE TABLE core.client_metadata_11539 PARTITION OF core.client_metadata FOR VALUES IN ('11539');
CREATE TABLE core.client_metadata_12639 PARTITION OF core.client_metadata FOR VALUES IN ('12639');
CREATE TABLE core.client_metadata_20326 PARTITION OF core.client_metadata FOR VALUES IN ('20326');
CREATE TABLE core.client_metadata_44044 PARTITION OF core.client_metadata FOR VALUES IN ('44044');
CREATE TABLE core.client_metadata_46534 PARTITION OF core.client_metadata FOR VALUES IN ('46534');
CREATE TABLE core.client_metadata_48861 PARTITION OF core.client_metadata FOR VALUES IN ('48861');
CREATE TABLE core.client_metadata_52017 PARTITION OF core.client_metadata FOR VALUES IN ('52017');
CREATE TABLE core.client_metadata_56030 PARTITION OF core.client_metadata FOR VALUES IN ('56030');
CREATE TABLE core.client_metadata_56755 PARTITION OF core.client_metadata FOR VALUES IN ('56755');
CREATE TABLE core.client_metadata_58455 PARTITION OF core.client_metadata FOR VALUES IN ('58455');
CREATE TABLE core.client_metadata_59129 PARTITION OF core.client_metadata FOR VALUES IN ('59129');
CREATE TABLE core.client_metadata_59715 PARTITION OF core.client_metadata FOR VALUES IN ('59715');
CREATE TABLE core.client_metadata_60860 PARTITION OF core.client_metadata FOR VALUES IN ('60860');
CREATE TABLE core.client_metadata_61699 PARTITION OF core.client_metadata FOR VALUES IN ('61699');
CREATE TABLE core.client_metadata_61705 PARTITION OF core.client_metadata FOR VALUES IN ('61705');
CREATE TABLE core.client_metadata_63945 PARTITION OF core.client_metadata FOR VALUES IN ('63945');
CREATE TABLE core.client_metadata_65557 PARTITION OF core.client_metadata FOR VALUES IN ('65557');
CREATE TABLE core.client_metadata_67292 PARTITION OF core.client_metadata FOR VALUES IN ('67292');
CREATE TABLE core.client_metadata_69521 PARTITION OF core.client_metadata FOR VALUES IN ('69521');
CREATE TABLE core.client_metadata_73704 PARTITION OF core.client_metadata FOR VALUES IN ('73704');
CREATE TABLE core.client_metadata_75249 PARTITION OF core.client_metadata FOR VALUES IN ('75249');
CREATE TABLE core.client_metadata_76039 PARTITION OF core.client_metadata FOR VALUES IN ('76039');
CREATE TABLE core.client_metadata_78113 PARTITION OF core.client_metadata FOR VALUES IN ('78113');
CREATE TABLE core.client_metadata_78840 PARTITION OF core.client_metadata FOR VALUES IN ('78840');
CREATE TABLE core.client_metadata_80189 PARTITION OF core.client_metadata FOR VALUES IN ('80189');
CREATE TABLE core.client_metadata_86088 PARTITION OF core.client_metadata FOR VALUES IN ('86088');
CREATE TABLE core.client_metadata_88279 PARTITION OF core.client_metadata FOR VALUES IN ('88279');
CREATE TABLE core.client_metadata_89831 PARTITION OF core.client_metadata FOR VALUES IN ('89831');
CREATE TABLE core.client_metadata_90924 PARTITION OF core.client_metadata FOR VALUES IN ('90924');
CREATE TABLE core.client_metadata_93024 PARTITION OF core.client_metadata FOR VALUES IN ('93024');
CREATE TABLE core.client_metadata_94343 PARTITION OF core.client_metadata FOR VALUES IN ('94343');
CREATE TABLE core.client_metadata_95451 PARTITION OF core.client_metadata FOR VALUES IN ('95451');
CREATE TABLE core.client_metadata_97095 PARTITION OF core.client_metadata FOR VALUES IN ('97095');
CREATE TABLE core.client_metadata_98423 PARTITION OF core.client_metadata FOR VALUES IN ('98423');
CREATE TABLE core.client_metadata_99570 PARTITION OF core.client_metadata FOR VALUES IN ('99570');
CREATE TABLE core.client_metadata_101126 PARTITION OF core.client_metadata FOR VALUES IN ('101126');
CREATE TABLE core.client_metadata_104320 PARTITION OF core.client_metadata FOR VALUES IN ('104320');
CREATE TABLE core.client_metadata_105575 PARTITION OF core.client_metadata FOR VALUES IN ('105575');
CREATE TABLE core.client_metadata_106412 PARTITION OF core.client_metadata FOR VALUES IN ('106412');
CREATE TABLE core.client_metadata_108475 PARTITION OF core.client_metadata FOR VALUES IN ('108475');
CREATE TABLE core.client_metadata_110113 PARTITION OF core.client_metadata FOR VALUES IN ('110113');
CREATE TABLE core.client_metadata_111603 PARTITION OF core.client_metadata FOR VALUES IN ('111603');
CREATE TABLE core.client_metadata_112890 PARTITION OF core.client_metadata FOR VALUES IN ('112890');
CREATE TABLE core.client_metadata_113716 PARTITION OF core.client_metadata FOR VALUES IN ('113716');
CREATE TABLE core.client_metadata_114121 PARTITION OF core.client_metadata FOR VALUES IN ('114121');
CREATE TABLE core.client_metadata_116626 PARTITION OF core.client_metadata FOR VALUES IN ('116626');
CREATE TABLE core.client_metadata_118450 PARTITION OF core.client_metadata FOR VALUES IN ('118450');
CREATE TABLE core.client_metadata_121732 PARTITION OF core.client_metadata FOR VALUES IN ('121732');
CREATE TABLE core.client_metadata_124321 PARTITION OF core.client_metadata FOR VALUES IN ('124321');
CREATE TABLE core.client_metadata_others PARTITION OF core.client_metadata DEFAULT;




CREATE TABLE core."event" (
	id bigserial NOT NULL,
	"json" jsonb NOT NULL,
	date_deleted timestamp NULL,
	server_version int8 NULL DEFAULT 0,
	base_entity_id varchar NULL DEFAULT ''::character varying,
	district varchar NULL DEFAULT ''::character varying,
	division varchar NULL DEFAULT ''::character varying,
	branch varchar NULL DEFAULT ''::character varying,
	village varchar NULL DEFAULT ''::character varying,
	provider_id varchar NULL DEFAULT ''::character varying,
	event_type varchar NULL DEFAULT ''::character varying,
	form_submission_id varchar NULL DEFAULT ''::character varying,
	CONSTRAINT event_pkey PRIMARY KEY (id,district)
)PARTITION BY LIST(district);
CREATE INDEX event_date_deleted_index ON core.event USING btree (date_deleted);
CREATE INDEX idx_event_sv ON core.event USING btree ((((json ->> 'serverVersion'::text))::bigint));





CREATE TABLE core.event_9267 PARTITION OF core.event  FOR VALUES IN ('9267');
CREATE TABLE core.event_9340 PARTITION OF core.event  FOR VALUES IN ('9340');
CREATE TABLE core.event_10350 PARTITION OF core.event  FOR VALUES IN ('10350');
CREATE TABLE core.event_10355 PARTITION OF core.event  FOR VALUES IN ('10355');
CREATE TABLE core.event_10364 PARTITION OF core.event  FOR VALUES IN ('10364');
CREATE TABLE core.event_10371 PARTITION OF core.event  FOR VALUES IN ('10371');
CREATE TABLE core.event_10377 PARTITION OF core.event  FOR VALUES IN ('10377');
CREATE TABLE core.event_10425 PARTITION OF core.event  FOR VALUES IN ('10425');
CREATE TABLE core.event_10432 PARTITION OF core.event  FOR VALUES IN ('10432');
CREATE TABLE core.event_10520 PARTITION OF core.event  FOR VALUES IN ('10520');
CREATE TABLE core.event_10542 PARTITION OF core.event  FOR VALUES IN ('10542');
CREATE TABLE core.event_10563 PARTITION OF core.event  FOR VALUES IN ('10563');
CREATE TABLE core.event_10568 PARTITION OF core.event  FOR VALUES IN ('10568');
CREATE TABLE core.event_10575 PARTITION OF core.event  FOR VALUES IN ('10575');
CREATE TABLE core.event_10590 PARTITION OF core.event  FOR VALUES IN ('10590');
CREATE TABLE core.event_11539 PARTITION OF core.event  FOR VALUES IN ('11539');
CREATE TABLE core.event_12639 PARTITION OF core.event  FOR VALUES IN ('12639');
CREATE TABLE core.event_20326 PARTITION OF core.event  FOR VALUES IN ('20326');
CREATE TABLE core.event_44044 PARTITION OF core.event  FOR VALUES IN ('44044');
CREATE TABLE core.event_46534 PARTITION OF core.event  FOR VALUES IN ('46534');
CREATE TABLE core.event_48861 PARTITION OF core.event  FOR VALUES IN ('48861');
CREATE TABLE core.event_52017 PARTITION OF core.event  FOR VALUES IN ('52017');
CREATE TABLE core.event_56030 PARTITION OF core.event  FOR VALUES IN ('56030');
CREATE TABLE core.event_56755 PARTITION OF core.event  FOR VALUES IN ('56755');
CREATE TABLE core.event_58455 PARTITION OF core.event  FOR VALUES IN ('58455');
CREATE TABLE core.event_59129 PARTITION OF core.event  FOR VALUES IN ('59129');
CREATE TABLE core.event_59715 PARTITION OF core.event  FOR VALUES IN ('59715');
CREATE TABLE core.event_60860 PARTITION OF core.event  FOR VALUES IN ('60860');
CREATE TABLE core.event_61699 PARTITION OF core.event  FOR VALUES IN ('61699');
CREATE TABLE core.event_61705 PARTITION OF core.event  FOR VALUES IN ('61705');
CREATE TABLE core.event_63945 PARTITION OF core.event  FOR VALUES IN ('63945');
CREATE TABLE core.event_65557 PARTITION OF core.event  FOR VALUES IN ('65557');
CREATE TABLE core.event_67292 PARTITION OF core.event  FOR VALUES IN ('67292');
CREATE TABLE core.event_69521 PARTITION OF core.event  FOR VALUES IN ('69521');
CREATE TABLE core.event_73704 PARTITION OF core.event  FOR VALUES IN ('73704');
CREATE TABLE core.event_75249 PARTITION OF core.event  FOR VALUES IN ('75249');
CREATE TABLE core.event_76039 PARTITION OF core.event  FOR VALUES IN ('76039');
CREATE TABLE core.event_78113 PARTITION OF core.event  FOR VALUES IN ('78113');
CREATE TABLE core.event_78840 PARTITION OF core.event  FOR VALUES IN ('78840');
CREATE TABLE core.event_80189 PARTITION OF core.event  FOR VALUES IN ('80189');
CREATE TABLE core.event_86088 PARTITION OF core.event  FOR VALUES IN ('86088');
CREATE TABLE core.event_88279 PARTITION OF core.event  FOR VALUES IN ('88279');
CREATE TABLE core.event_89831 PARTITION OF core.event  FOR VALUES IN ('89831');
CREATE TABLE core.event_90924 PARTITION OF core.event  FOR VALUES IN ('90924');
CREATE TABLE core.event_93024 PARTITION OF core.event  FOR VALUES IN ('93024');
CREATE TABLE core.event_94343 PARTITION OF core.event  FOR VALUES IN ('94343');
CREATE TABLE core.event_95451 PARTITION OF core.event  FOR VALUES IN ('95451');
CREATE TABLE core.event_97095 PARTITION OF core.event  FOR VALUES IN ('97095');
CREATE TABLE core.event_98423 PARTITION OF core.event  FOR VALUES IN ('98423');
CREATE TABLE core.event_99570 PARTITION OF core.event  FOR VALUES IN ('99570');
CREATE TABLE core.event_101126 PARTITION OF core.event  FOR VALUES IN ('101126');
CREATE TABLE core.event_104320 PARTITION OF core.event  FOR VALUES IN ('104320');
CREATE TABLE core.event_105575 PARTITION OF core.event  FOR VALUES IN ('105575');
CREATE TABLE core.event_106412 PARTITION OF core.event  FOR VALUES IN ('106412');
CREATE TABLE core.event_108475 PARTITION OF core.event  FOR VALUES IN ('108475');
CREATE TABLE core.event_110113 PARTITION OF core.event  FOR VALUES IN ('110113');
CREATE TABLE core.event_111603 PARTITION OF core.event  FOR VALUES IN ('111603');
CREATE TABLE core.event_112890 PARTITION OF core.event  FOR VALUES IN ('112890');
CREATE TABLE core.event_113716 PARTITION OF core.event  FOR VALUES IN ('113716');
CREATE TABLE core.event_114121 PARTITION OF core.event  FOR VALUES IN ('114121');
CREATE TABLE core.event_116626 PARTITION OF core.event  FOR VALUES IN ('116626');
CREATE TABLE core.event_118450 PARTITION OF core.event  FOR VALUES IN ('118450');
CREATE TABLE core.event_121732 PARTITION OF core.event  FOR VALUES IN ('121732');
CREATE TABLE core.event_124321 PARTITION OF core.event  FOR VALUES IN ('124321');
CREATE TABLE core.event_others PARTITION OF core.event DEFAULT;

CREATE TABLE core.event_metadata (
	id bigserial NOT NULL,
	event_id int8 NULL,
	document_id varchar NOT NULL,
	base_entity_id varchar NOT NULL,
	form_submission_id varchar NOT NULL,
	server_version int8 NULL,
	openmrs_uuid varchar NULL,
	event_type varchar NULL,
	event_date timestamp NULL,
	entity_type varchar NULL,
	provider_id varchar NULL,
	location_id varchar NULL,
	team varchar NULL,
	team_id varchar NULL,
	date_created timestamp NULL DEFAULT now(),
	date_edited timestamp NULL,
	date_deleted timestamp NULL,
	plan_identifier varchar NULL,
	district varchar NULL DEFAULT ''::character varying,
	division varchar NULL DEFAULT ''::character varying,
	branch varchar NULL DEFAULT ''::character varying,
	village varchar NULL DEFAULT ''::character varying,
	CONSTRAINT event_metadata_document_id_key UNIQUE (document_id,district),
	CONSTRAINT event_metadata_form_submission_id_key UNIQUE (form_submission_id,district),
	CONSTRAINT event_metadata_pkey PRIMARY KEY (id,district)
) PARTITION BY LIST(district);
CREATE INDEX event_metadata_base_entity_id_index ON core.event_metadata USING btree (base_entity_id);
CREATE INDEX event_metadata_date_deleted_index ON core.event_metadata USING btree (date_deleted);
CREATE INDEX event_metadata_event_id_idx ON core.event_metadata USING btree (event_id);
CREATE INDEX event_metadata_sync_index ON core.event_metadata USING btree (provider_id, location_id, team, team_id, server_version);
CREATE INDEX event_metadata_sync_loc_index ON core.event_metadata USING btree (server_version, base_entity_id);


-- core.event_metadata foreign keys

-- ALTER TABLE core.event_metadata ADD CONSTRAINT event_metadata_event_id_fkey FOREIGN KEY (event_id) REFERENCES core.event(id);




-- core.client_metadata foreign keys

-- ALTER TABLE core.client_metadata ADD CONSTRAINT client_metadata_client_id_fkey FOREIGN KEY (client_id) REFERENCES core.client(id);

CREATE TABLE core.event_metadata_9267 PARTITION OF core.event_metadata FOR VALUES IN ('9267');
CREATE TABLE core.event_metadata_9340 PARTITION OF core.event_metadata FOR VALUES IN ('9340');
CREATE TABLE core.event_metadata_10350 PARTITION OF core.event_metadata FOR VALUES IN ('10350');
CREATE TABLE core.event_metadata_10355 PARTITION OF core.event_metadata FOR VALUES IN ('10355');
CREATE TABLE core.event_metadata_10364 PARTITION OF core.event_metadata FOR VALUES IN ('10364');
CREATE TABLE core.event_metadata_10371 PARTITION OF core.event_metadata FOR VALUES IN ('10371');
CREATE TABLE core.event_metadata_10377 PARTITION OF core.event_metadata FOR VALUES IN ('10377');
CREATE TABLE core.event_metadata_10425 PARTITION OF core.event_metadata FOR VALUES IN ('10425');
CREATE TABLE core.event_metadata_10432 PARTITION OF core.event_metadata FOR VALUES IN ('10432');
CREATE TABLE core.event_metadata_10520 PARTITION OF core.event_metadata FOR VALUES IN ('10520');
CREATE TABLE core.event_metadata_10542 PARTITION OF core.event_metadata FOR VALUES IN ('10542');
CREATE TABLE core.event_metadata_10563 PARTITION OF core.event_metadata FOR VALUES IN ('10563');
CREATE TABLE core.event_metadata_10568 PARTITION OF core.event_metadata FOR VALUES IN ('10568');
CREATE TABLE core.event_metadata_10575 PARTITION OF core.event_metadata FOR VALUES IN ('10575');
CREATE TABLE core.event_metadata_10590 PARTITION OF core.event_metadata FOR VALUES IN ('10590');
CREATE TABLE core.event_metadata_11539 PARTITION OF core.event_metadata FOR VALUES IN ('11539');
CREATE TABLE core.event_metadata_12639 PARTITION OF core.event_metadata FOR VALUES IN ('12639');
CREATE TABLE core.event_metadata_20326 PARTITION OF core.event_metadata FOR VALUES IN ('20326');
CREATE TABLE core.event_metadata_44044 PARTITION OF core.event_metadata FOR VALUES IN ('44044');
CREATE TABLE core.event_metadata_46534 PARTITION OF core.event_metadata FOR VALUES IN ('46534');
CREATE TABLE core.event_metadata_48861 PARTITION OF core.event_metadata FOR VALUES IN ('48861');
CREATE TABLE core.event_metadata_52017 PARTITION OF core.event_metadata FOR VALUES IN ('52017');
CREATE TABLE core.event_metadata_56030 PARTITION OF core.event_metadata FOR VALUES IN ('56030');
CREATE TABLE core.event_metadata_56755 PARTITION OF core.event_metadata FOR VALUES IN ('56755');
CREATE TABLE core.event_metadata_58455 PARTITION OF core.event_metadata FOR VALUES IN ('58455');
CREATE TABLE core.event_metadata_59129 PARTITION OF core.event_metadata FOR VALUES IN ('59129');
CREATE TABLE core.event_metadata_59715 PARTITION OF core.event_metadata FOR VALUES IN ('59715');
CREATE TABLE core.event_metadata_60860 PARTITION OF core.event_metadata FOR VALUES IN ('60860');
CREATE TABLE core.event_metadata_61699 PARTITION OF core.event_metadata FOR VALUES IN ('61699');
CREATE TABLE core.event_metadata_61705 PARTITION OF core.event_metadata FOR VALUES IN ('61705');
CREATE TABLE core.event_metadata_63945 PARTITION OF core.event_metadata FOR VALUES IN ('63945');
CREATE TABLE core.event_metadata_65557 PARTITION OF core.event_metadata FOR VALUES IN ('65557');
CREATE TABLE core.event_metadata_67292 PARTITION OF core.event_metadata FOR VALUES IN ('67292');
CREATE TABLE core.event_metadata_69521 PARTITION OF core.event_metadata FOR VALUES IN ('69521');
CREATE TABLE core.event_metadata_73704 PARTITION OF core.event_metadata FOR VALUES IN ('73704');
CREATE TABLE core.event_metadata_75249 PARTITION OF core.event_metadata FOR VALUES IN ('75249');
CREATE TABLE core.event_metadata_76039 PARTITION OF core.event_metadata FOR VALUES IN ('76039');
CREATE TABLE core.event_metadata_78113 PARTITION OF core.event_metadata FOR VALUES IN ('78113');
CREATE TABLE core.event_metadata_78840 PARTITION OF core.event_metadata FOR VALUES IN ('78840');
CREATE TABLE core.event_metadata_80189 PARTITION OF core.event_metadata FOR VALUES IN ('80189');
CREATE TABLE core.event_metadata_86088 PARTITION OF core.event_metadata FOR VALUES IN ('86088');
CREATE TABLE core.event_metadata_88279 PARTITION OF core.event_metadata FOR VALUES IN ('88279');
CREATE TABLE core.event_metadata_89831 PARTITION OF core.event_metadata FOR VALUES IN ('89831');
CREATE TABLE core.event_metadata_90924 PARTITION OF core.event_metadata FOR VALUES IN ('90924');
CREATE TABLE core.event_metadata_93024 PARTITION OF core.event_metadata FOR VALUES IN ('93024');
CREATE TABLE core.event_metadata_94343 PARTITION OF core.event_metadata FOR VALUES IN ('94343');
CREATE TABLE core.event_metadata_95451 PARTITION OF core.event_metadata FOR VALUES IN ('95451');
CREATE TABLE core.event_metadata_97095 PARTITION OF core.event_metadata FOR VALUES IN ('97095');
CREATE TABLE core.event_metadata_98423 PARTITION OF core.event_metadata FOR VALUES IN ('98423');
CREATE TABLE core.event_metadata_99570 PARTITION OF core.event_metadata FOR VALUES IN ('99570');
CREATE TABLE core.event_metadata_101126 PARTITION OF core.event_metadata FOR VALUES IN ('101126');
CREATE TABLE core.event_metadata_104320 PARTITION OF core.event_metadata FOR VALUES IN ('104320');
CREATE TABLE core.event_metadata_105575 PARTITION OF core.event_metadata FOR VALUES IN ('105575');
CREATE TABLE core.event_metadata_106412 PARTITION OF core.event_metadata FOR VALUES IN ('106412');
CREATE TABLE core.event_metadata_108475 PARTITION OF core.event_metadata FOR VALUES IN ('108475');
CREATE TABLE core.event_metadata_110113 PARTITION OF core.event_metadata FOR VALUES IN ('110113');
CREATE TABLE core.event_metadata_111603 PARTITION OF core.event_metadata FOR VALUES IN ('111603');
CREATE TABLE core.event_metadata_112890 PARTITION OF core.event_metadata FOR VALUES IN ('112890');
CREATE TABLE core.event_metadata_113716 PARTITION OF core.event_metadata FOR VALUES IN ('113716');
CREATE TABLE core.event_metadata_114121 PARTITION OF core.event_metadata FOR VALUES IN ('114121');
CREATE TABLE core.event_metadata_116626 PARTITION OF core.event_metadata FOR VALUES IN ('116626');
CREATE TABLE core.event_metadata_118450 PARTITION OF core.event_metadata FOR VALUES IN ('118450');
CREATE TABLE core.event_metadata_121732 PARTITION OF core.event_metadata FOR VALUES IN ('121732');
CREATE TABLE core.event_metadata_124321 PARTITION OF core.event_metadata FOR VALUES IN ('124321');
CREATE TABLE core.event_metadata_others PARTITION OF core.event_metadata DEFAULT;









-- //@UNDO
-- SQL to undo the change goes here.



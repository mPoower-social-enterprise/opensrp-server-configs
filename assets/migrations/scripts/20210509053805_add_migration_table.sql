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

-- // add migration table
-- Migration SQL that makes the change goes here.
CREATE TABLE core.migration (
    id bigserial NOT NULL,
    branch_id_out varchar(255) NULL,
    hh_contact_in varchar(255) NULL,
    hh_contact_out varchar(255) NULL,
    hh_name_in varchar(255) NULL,
    hh_name_out varchar(255) NULL,
    sk_in varchar(255) NULL,
    sk_out varchar(255) NULL,
    ss_in varchar(255) NULL,
    ss_out varchar(255) NULL,
    branch_id_in varchar(255) NULL,
    created_date timestamp NULL,
    district_in varchar(255) NULL,
    district_out varchar(255) NULL,
    division_in varchar(255) NULL,
    division_out varchar(255) NULL,
    dob date NULL,
    is_member varchar(255) NULL,
    member_contact varchar(255) NULL,
    member_id_in varchar(255) NULL,
    member_id_out varchar(255) NULL,
    member_name varchar(255) NULL,
    member_type varchar(255) NULL,
    migration_date date NULL,
    number_of_member_in varchar(255) NULL,
    number_of_member_out varchar(255) NULL,
    pourasava_in varchar(255) NULL,
    pourasava_out varchar(255) NULL,
    relation_with_hh_in varchar(255) NULL,
    relation_with_hh_out varchar(255) NULL,
    relational_id_in varchar(255) NULL,
    relational_id_out varchar(255) NULL,
    status varchar(255) NULL,
    union_in varchar(255) NULL,
    union_out varchar(255) NULL,
    upazila_in varchar(255) NULL,
    upazila_out varchar(255) NULL,
    modified_date timestamp NULL,
    village_id_in varchar(255) NULL,
    village_id_out varchar(255) NULL,
    village_in varchar(255) NULL,
    village_out varchar(255) NULL,
    base_entity_id varchar(255) NULL,
    district_id_in varchar(255) NULL,
    district_id_out varchar(255) NULL,
    mother_id varchar(255) NULL,
    division_id_in varchar(255) NULL,
    division_id_out varchar(255) NULL,
    "timestamp" int8 NULL,
    CONSTRAINT migration_pkey PRIMARY KEY (id)
);


-- //@UNDO
-- SQL to undo the change goes here.



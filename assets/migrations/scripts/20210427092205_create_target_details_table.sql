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
CREATE TABLE core.target_details (
    id bigserial NOT NULL,
    branch_id int4 NULL,
    created_date timestamp NULL,
    end_date date NULL,
    percentage varchar(255) NULL,
    product_id int8 NULL,
    quantity int4 NOT NULL,
    start_date date NULL,
    status varchar(255) NULL,
    "timestamp" int8 NULL,
    unit varchar(255) NULL,
    modified_date timestamp NULL,
    user_id int4 NULL,
    uuid varchar(255) NULL,
    creator int4 NULL,
    "month" int4 NULL,
    "year" int4 NULL,
    updated_by int4 NULL,
    "day" int4 NULL,
    target_type varchar(255) NULL,
    role_id int4 NULL,
    is_personal varchar(255) NULL,
    CONSTRAINT target_details_pkey PRIMARY KEY (id)
);



-- //@UNDO
-- SQL to undo the change goes here.



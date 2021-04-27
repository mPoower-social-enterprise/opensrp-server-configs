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

-- // create web notification table
-- Migration SQL that makes the change goes here.
CREATE TABLE core.web_notification (
    id bigserial NOT NULL,
    branch_id int4 NULL,
    created_date timestamp NULL,
    creator int4 NOT NULL,
    district_id int4 NOT NULL,
    division_id int4 NOT NULL,
    notification text NULL,
    title varchar(255) NOT NULL,
    role_id int4 NULL,
    send_date date NULL,
    send_time_hour int4 NULL,
    send_time_minute int4 NULL,
    status varchar(255) NULL,
    "timestamp" int8 NULL,
    "type" varchar(255) NULL,
    upazila_id int4 NOT NULL,
    modified_date timestamp NULL,
    updated_by int4 NULL,
    uuid varchar(255) NULL,
    send_date_and_time varchar(255) NULL,
    notification_type varchar(255) NULL,
    stock_details_id int8 NULL,
    meeting_training_date_and_time varchar(255) NULL,
    CONSTRAINT web_notification_pkey PRIMARY KEY (id)
);



-- //@UNDO
-- SQL to undo the change goes here.



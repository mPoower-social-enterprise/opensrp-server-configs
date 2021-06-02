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

-- // create _stock details table
-- Migration SQL that makes the change goes here.
CREATE TABLE core."_stock_details" (
    id bigserial NOT NULL,
    branch_id int4 NULL,
    created_date timestamp NULL,
    credit int4 NOT NULL,
    debit int4 NOT NULL,
    expirey_date date NULL,
    product_id int8 NULL,
    receive_date date NULL,
    reference_type varchar(255) NULL,
    sell_or_pass_to int4 NULL,
    status varchar(255) NULL,
    "timestamp" int8 NULL,
    modified_date timestamp NULL,
    uuid varchar(255) NULL,
    creator int4 NULL,
    stock_id int8 NULL,
    invoice_number varchar(255) NULL,
    months int4 NULL,
    years int4 NULL,
    "month" int4 NULL,
    "year" int4 NULL,
    start_date date NULL,
    stock_in_id varchar(255) NULL,
    challan varchar NULL,
    nogod_roshid_no varchar(255) NULL,
    CONSTRAINT "_stock_details_pkey" PRIMARY KEY (id),	
    CONSTRAINT fk_msrytpn4spkljg5uimdyphh3n FOREIGN KEY (stock_id) REFERENCES core._stock(id)
);



-- //@UNDO
-- SQL to undo the change goes here.



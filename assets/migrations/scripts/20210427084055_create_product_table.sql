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

-- // create product table
-- Migration SQL that makes the change goes here.
CREATE TABLE core.product (
	id bigserial NOT NULL,
	created_date timestamp NULL,
	description varchar(255) NULL,
	"name" varchar(255) NOT NULL,
	purchase_price float4 NULL,
	sell_to int4 NULL,
	selling_price float4 NULL,
	status varchar(255) NULL,
	"timestamp" int8 NULL,
	modified_date timestamp NULL,
	uuid varchar(255) NULL,
	creator int4 NULL,
	updated_by int4 NULL,
	"type" varchar(255) NULL,
	code varchar NULL,
	genericname varchar(255) NULL,
	projectgroupid int8 NULL,
	CONSTRAINT product_pkey PRIMARY KEY (id)
);



-- //@UNDO
-- SQL to undo the change goes here.



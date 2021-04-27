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

-- // create function get stock for mobile
-- Migration SQL that makes the change goes here.
CREATE OR REPLACE FUNCTION core.get_stock_for_mobile(_user_name text, _timestamp bigint)
RETURNS TABLE(expirey_date text, product_id bigint, stock_id bigint, product_name text, quantity integer, receive_date text, year_ integer, month_ integer, time_stamp bigint)
LANGUAGE plpgsql
AS $function$
begin
return query
    select sd.expirey_date::text,p.id::bigint product_id,sd.id::bigint stock_id,p.description::text product_name,
    sd.debit::int quantity,sd.receive_date::text, sd."year"::int,sd."month"::int,sd."timestamp"::bigint from core."_stock_details" as sd
    join core.product p on sd.product_id = p.id
    join team.practitioner pr on sd.sell_or_pass_to = pr.id where pr.username = _user_name and sd."timestamp" > _timestamp;

end;
$function$
;



-- //@UNDO
-- SQL to undo the change goes here.



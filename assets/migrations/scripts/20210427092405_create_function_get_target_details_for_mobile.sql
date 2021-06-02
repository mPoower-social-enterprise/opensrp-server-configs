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

-- // create function get target details for mobile
-- Migration SQL that makes the change goes here.
CREATE OR REPLACE FUNCTION core.get_target_details_for_mobile(_user_name text, _timestamp bigint)
    RETURNS TABLE(username text, target_id bigint, target_name text, target_count integer, "month" varchar,
    "year" varchar, "day" varchar, "timestamp" bigint,start_date text,end_date text)
    LANGUAGE plpgsql 
    AS $function$
    begin
    return query
        select pr.username::text,p.id::bigint targetId,
        case
        when lower(p."name") = 'household visit' then 'HH visit'
        when lower(p."name") = 'elco visit' then 'ELCO Registration'
        when lower(p."name") = 'iycf forum' then 'Child Forum'
        when lower(p."name") = 'women forum' then 'WOMEN Forum'
        when lower(p."name") = 'adult forum' then 'ADULT Forum'
        when lower(p."name") = 'women service' then 'Women package'
        when lower(p."name") = 'adolescent service' then 'Adolescent package'
        when lower(p."name") = 'ncd service' then 'NCD package'
        when lower(p."name") = 'delivery' then 'Pregnancy Outcome'
        when lower(p."name") = 'iycf service' then 'IYCF package'
        else p."name"::text
        end targetName,
        td.quantity::int targetCount,
        td."month"::varchar,
        td."year"::varchar,
        td."day"::varchar,
        td."timestamp"::bigint,
        TO_CHAR(td.start_date, 'DD-MM-YYYY')::text start_date,
        TO_CHAR(td.end_date, 'DD-MM-YYYY')::text end_date
        from core.target_details td join core.product p on td.product_id = p.id
        join team.practitioner as pr on pr.id = td.user_id
        where pr.username = _user_name and td."timestamp" > _timestamp
        order by td."timestamp";
    end;
$function$
;



-- //@UNDO
-- SQL to undo the change goes here.



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

-- // add get district and upazila function
-- Migration SQL that makes the change goes here.
CREATE OR REPLACE FUNCTION core.get_district_and_upazila(_location_tag integer)
 RETURNS TABLE(district text, upazilas text)
 LANGUAGE plpgsql
AS $function$
begin
    return query
        with district_upazila as (
            select split_part(l1."name", ':', 1) district,split_part(l2."name", ':', 1) upazilas
                from core.vw_location  l1, core.vw_location l2 where l1.id = l2.parent_location_id and l1.location_tag_id = _location_tag
		)
        select du.district,string_agg(du.upazilas, ',') from district_upazila du group by du.district;			
end;
$function$
;
-- //@UNDO
-- SQL to undo the change goes here.



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

-- // add location function and view
-- Migration SQL that makes the change goes here.

CREATE OR REPLACE FUNCTION core.get_location_tree(_practitioner_id integer, _role_id integer, _assinged_location_tag_id integer)
 RETURNS TABLE(id integer, code text, location_name text, leaf_loc_id integer, member_id integer, username text, first_name text, last_name text, loc_tag_name text)
 LANGUAGE plpgsql
AS $function$
declare
    temprow record;
    rec record;
begin
    
    CREATE temporary TABLE location_tree (
        id int,
        code text,
        location_name text,
        leaf_loc_id int,
        member_id int,
        username text,
        first_name text,
        last_name text,
        loc_tag_name text
    )ON COMMIT DROP;

 

    for temprow in
    
    select pca.location_id, pd.practitioner_id id, pd.first_name, pd.last_name, p.username, pd.ss_no from team.practitioner_catchment_area as pca  join team.practitioner_group as pg   on pg.practitioner_id = pca.practitioner_id join team.practitioner_details as  pd on pd.practitioner_id = pg.practitioner_id
    join team.practitioner p on pd.practitioner_id= p.id
        where location_id in (
            with recursive parent_loc_2 as (
                select * from core.vw_location l where l.id in(
                    select location_id from team.practitioner_catchment_area where practitioner_id = _practitioner_id
                ) union all 
                select loc.* from core.vw_location loc join parent_loc_2 pl on pl.id = loc.parent_location_id
              ) select distinct(pl.id) from parent_loc_2 pl
        ) and pg.practitioner_group_id = _role_id
    
    loop 
        for rec in 
        with recursive parent_loc as (
          select *, l.id as leaf_loc_id from core.vw_location l where l.id in(
              with recursive parent_loc_1 as (
                select * from core.vw_location ll where ll.id = temprow.location_id union all 
                select loc.* from core.vw_location loc join parent_loc_1 pl on pl.id = loc.parent_location_id
              ) select pl1.id from parent_loc_1 pl1 where location_tag_id = _assinged_location_tag_id
          ) union all 
            select loc.*, pl.leaf_loc_id from core.vw_location loc join parent_loc pl on pl.parent_location_id = loc.id
        ) select ploc.id, ploc.code, ploc.name, ploc.leaf_loc_id, temprow.id as member_id, temprow.username as username, concat(temprow.first_name,'(',temprow.ss_no, ')') as first_name, temprow.last_name as last_name, lt.name as loc_tag_name from parent_loc ploc join core.location_tag lt on lt.id = ploc.location_tag_id order by ploc.leaf_loc_id, ploc.id
        loop
            insert into location_tree (id, code, location_name, leaf_loc_id, member_id, username, first_name, last_name, loc_tag_name) values (rec.id, rec.code, rec.name, rec.leaf_loc_id, rec.member_id, rec.username, rec.first_name, rec.last_name, rec.loc_tag_name);
        end loop;
    end loop;
    return query select * from location_tree order by username, leaf_loc_id, id;
end $function$
;


CREATE OR REPLACE VIEW core.vw_location
AS SELECT lm.location_id AS id,
    COALESCE((l.json -> 'properties'::text) ->> 'code'::text, '0'::text) AS code,
    lm.name,
    lm.name AS description,
    lm.geojson_id AS uuid,
    lm.parent_id AS parent_uuid,
    ltm.location_tag_id,
    lmp.location_id AS parent_location_id
   FROM core.location_metadata lm
     JOIN core.location_tag_map ltm ON lm.location_id = ltm.location_id
     JOIN core.location l ON l.id = lm.location_id
     LEFT JOIN core.location_metadata lmp ON lm.parent_id::text = lmp.geojson_id::text;




-- //@UNDO
-- SQL to undo the change goes here.



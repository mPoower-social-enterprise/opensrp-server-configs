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

-- // create function get web notification for mobile
-- Migration SQL that makes the change goes here.
CREATE OR REPLACE FUNCTION core.get_web_notification_for_mobile(_user_name text, _timestamp bigint)
    RETURNS TABLE(notification_type text, id bigint, title text, notification text, send_date text,
        send_time_hour integer, send_time_minute integer, time_stamp bigint)
    LANGUAGE plpgsql
    AS $function$
    begin
    return query
        select wn.notification_type::text, wn.id::bigint,wn.title::text,wn.notification::text,wn.send_date::text,wn.send_time_hour::int,
        wn.send_time_minute::int,wn."timestamp"::bigint from core.web_notification as wn join 
        core.web_notification_user wnu join team.practitioner pr on pr.id=wnu.user_id on wn.id= wnu.web_notification_id 
        where wn."type" = any('{SEND,STOCK,SCHEDULE}') and wn."timestamp" >_timestamp and pr.username = _user_name 
        and ( wn.send_date < date(now())
        or  ( wn.send_date = date(now()) and wn.send_time_hour <= extract(hour from current_timestamp)
            and wn.send_time_minute <= extract(minute from current_timestamp)
            )
        )
;

end;
$function$
;



-- //@UNDO
-- SQL to undo the change goes here.



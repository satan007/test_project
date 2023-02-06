
select 
id,--уникальный ИД регистр. записи
create_time,--время создания регистр. записи
event_time,--время события
component_code,--для определения системы ДБО источника транзакции
CAST(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(JSON_VALUE(description, '$.body'),CHAR(92)+'"','"'),CHAR(92)+'r',Char(13)),CHAR(92)+'n',Char(10)), '<?xml version="1.0" encoding="utf-16"?>', ''), '<?xml version="1.0" encoding="utf-8"?>', ''),'?<?','<?'),Char(13)+Char(10),''),'-<event>', '<event>'),'&amp;','&'),'&','&amp;') as NVARCHAR(max))     as body1,

message,--на всякий случай для проверки корректности сбора и обработки данных, в расчетах роли не играет
description,--на всякий случай для проверки корректности сбора и обработки данных, в расчетах роли не играет
message_uuid--на всякий случай для проверки корректности сбора и обработки данных, в расчетах роли не играет
from eventsjournal
where 
component_code in ('ul_dbobss_key','ul_dbobss20_key','ul_dbosft_key','ul_dbosft_trb_key','ul_dbosft_vip_key')
and category_code='PROC'
and event_number=700

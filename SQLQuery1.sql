
select 
id,--���������� �� �������. ������
create_time,--����� �������� �������. ������
event_time,--����� �������
component_code,--��� ����������� ������� ��� ��������� ����������
CAST(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(JSON_VALUE(description, '$.body'),CHAR(92)+'"','"'),CHAR(92)+'r',Char(13)),CHAR(92)+'n',Char(10)), '<?xml version="1.0" encoding="utf-16"?>', ''), '<?xml version="1.0" encoding="utf-8"?>', ''),'?<?','<?'),Char(13)+Char(10),''),'-<event>', '<event>'),'&amp;','&'),'&','&amp;') as NVARCHAR(max))     as body1,

message,--�� ������ ������ ��� �������� ������������ ����� � ��������� ������, � �������� ���� �� ������
description,--�� ������ ������ ��� �������� ������������ ����� � ��������� ������, � �������� ���� �� ������
message_uuid--�� ������ ������ ��� �������� ������������ ����� � ��������� ������, � �������� ���� �� ������
from eventsjournal
where 
component_code in ('ul_dbobss_key','ul_dbobss20_key','ul_dbosft_key','ul_dbosft_trb_key','ul_dbosft_vip_key')
and category_code='PROC'
and event_number=700

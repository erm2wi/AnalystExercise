data = load '~/ad_data1.txt'  using PigStorage(',') as (campaign_id:chararray,date:chararray,time:chararray,display_site:chararray,placement:chararray,was_clicked:int,cpc:int,keyword:chararray);
describe data;
--dump data;
distincteddata = DISTINCT data;
reordereddata = FOREACH distincteddata GENERATE campaign_id, REPLACE(date,'-','/'),time,UPPER(TRIM(keyword)),display_site,placement,was_clicked,cpc;
describe reordereddata; 
first5 = limit reordereddata 5;
dump first5; 
--store reordereddata into '~/reorder_ad_data1.txt';
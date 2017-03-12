data = load '~/ad_data1.txt'  using PigStorage(',') as (campaign_id:chararray,date:chararray,time:chararray,display_site:chararray,placement:chararray,was_clicked:int,cpc:int,keyword:chararray);
describe data;
--dump data;
distincteddata = DISTINCT data;
reordereddata = FOREACH distincteddata GENERATE campaign_id, REPLACE(date,'-','/'),time,UPPER(TRIM(keyword)),display_site,placement,was_clicked,cpc;
describe reordereddata; 
first_five = limit reordereddata 10;
dump first_five; 
--store reordereddata into '~/reorder_ad_data1.txt';
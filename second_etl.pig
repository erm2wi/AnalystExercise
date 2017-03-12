data = load 'ad_sample.txt'  as (campaign_id:chararray,date:chararray,time:chararray,display_site:chararray,placement:chararray,was_clicked:int,cpc:int,keyword:chararray);
describe data;
dump data;
distincteddata = DISTINCT data;
reordereddata = FOREACH distincteddata Generate (campaign_id, date,time,UPPER(TRIM(keyword)),display_site,placement,was_clicked,cpc);
describe reordereddata; 
dump reordereddata;
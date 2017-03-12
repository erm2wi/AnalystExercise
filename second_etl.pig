data = load '/home/ec2-user/ad_data2.txt'  using PigStorage(',') as (campaign_id:chararray,date:chararray,time:chararray,display_site:chararray,placement:chararray,was_clicked:int,cpc:int,keyword:chararray);
describe data;
--dump data;
distincteddata = DISTINCT data;
reordereddata = FOREACH distincteddata GENERATE campaign_id, REPLACE(date,'-','/'),time,UPPER(TRIM(keyword)),display_site,placement,was_clicked,cpc;
describe reordereddata; 
first_five = limit reordereddata 10;
dump first_five; 
RMF '/home/ec2-user/ad_data2/'
STORE reordereddata INTO '/home/ec2-user/ad_data2/';
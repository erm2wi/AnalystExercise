data = load 'ad_sample.txt'  as (campaign_id,date,time,display_site,placement,was_clicked:int,cpc:int,keyword);
describe data;
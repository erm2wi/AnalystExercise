data = load '/home/ec2-user/ad_data[1-2]' as (campaign_id:chararray,
             date:chararray, time:chararray,
             keyword:chararray, display_site:chararray, 
             placement:chararray, was_clicked:int, cpc:int);
data_5 = limit data 5;
dump data_5;
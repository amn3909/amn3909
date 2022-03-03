#select * from topicimghtml where page_node=12;
#select * from screentypes_aspects;
#select * from sspace_typeslayout;
#select * from keygen_customer order by defdate desc, deftime desc;
#select * from screensite;

#drop    view ssite_hostscreens;
#create view ssite_hostscreens as
#select   b.hs_id,a.ssite_id,a.sshost_id,a.sshost_ipaddr,a.sshost_name,b.hs_screenid,
#         CONCAT(a.sshost_ipaddr,":",b.hs_portid) "rund_target", a.sshost_type,a.sshost_adminwho,b.hs_desc
#from     ssite_host a, hostscreen b
#where    a.sshost_id=b.sshost_id
#order by a.ssite_id, a.sshost_id, b.hs_screenid;

select ssite_id, sshost_id, sshost_name, sshost_type, sshost_adminwho from ssite_host;

#select DISTINCT ssite_id, sshost_id, sshost_name, sshost_type, sshost_adminwho
#from   ssite_hostscreens
#where  ssite_id=2;

#select hs_id, hs_screenid, rund_target
#from   ssite_hostscreens
#where  sshost_id=3;

#select * from screenspace;

#select hs_id,sshost_id,hs_screenid,hs_portid from hostscreen;
#select * from sspace_layout where ss_id < 4 order by ss_id,ssl_order;

#alter table hostscreen add column (hs_portid integer);

start /D  runD.exe "-p 27002 -pmain 27001 -s 1 -wp 0.194444 -hp 0.163507 -locp 0.140394,0.450425 -dec 1 -log"
start /D  runD.exe "-p 27003 -pmain 27001 -s 1 -wp 0.134921 -hp 0.277251 -locp 0.759174,0.809836 -dec 1 -log"
start /D  runD.exe "-p 27004 -pmain 27001 -s 1 -wp 0.194444 -hp 0.163507 -locp 0.480296,0.450425 -dec 1 -log"
start /D  runD.exe "-p 27005 -pmain 27001 -s 1 -wp 0.134921 -hp 0.277251 -locp 0.75,0.078689 -dec 1 -log"
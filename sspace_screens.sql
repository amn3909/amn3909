#select random()*100;
#select * from sspace_layout where ss_id = 15 order by ss_id,ssl_order;
#select ss_id,count(*) from sspace_layout group by ss_id order by 2;
#select * from sspace_screensused where ss_id = 15 order by ssite_id,ss_id,ssl_order;
#select   #* #ssite_id,ss_id,ss_name,ss_width,ss_height,ss_pctborder,
         #ssl_id,ssl_order,ssl_st_orient,st_name,st_width,st_height,
         #pct_x_resid,pct_y_resid
#ssite_id,ss_id,ss_name,ss_desc,ss_width,ss_height,ss_pctborder,ss_image,
#st_id,st_name,st_cost,st_desc,st_width,st_height,st_resX,st_resY,st_pic,
#ssl_id,ssl_order,ssl_st_orient,pct_x_resid,pct_y_resid
#from     sspace_typeslayout
#where    ss_id = 15
#order by ssl_order;
#SELECT *,(st_height/st_width) st_ratio FROM sspace_typeslayout where ss_id=15;

#select * from screentype;

select     a.unique_id, count(distinct b.imagetag) num_tags_grpd,
           group_concat( distinct b.imagetag ) tag_list
from       mf_image a, mf_image_tag b
where      a.unique_id=b.unique_id
#and        a.unique_id=-39
#and        b.imagetag="autumn"
group by   a.unique_id
order by   count(        distinct b.imagetag ) desc,
           group_concat( distinct b.imagetag );

#select     a.unique_id, count(distinct c.imagetag) num_tags_grpd,
#           group_concat( distinct c.imagetag ) tag_list
#from       mf_image a, mf_image_tag b, mf_image_tag c
#where      a.unique_id=b.unique_id
#and        b.unique_id=c.unique_id
##and        a.unique_id=-39
#and        b.imagetag="autumn"
#group by   a.unique_id
#order by   count(        distinct c.imagetag ) desc,
#           group_concat( distinct bsspace_layout.imagetag )

#select * from ssl_hs_assign;
#select * from ssite_hostscreens;
#    DROP   VIEW `sspace_screensused`;
#    CREATE VIEW `sspace_screensused` AS
#SELECT f.ssite_id,b.ss_id,f.sshost_id,f.sshost_type,f.sshost_ipaddr,f.sshost_name,
#       d.hs_portid,e.hs_id,e.hs_screenid,a.st_id,a.st_name,a.st_desc,a.st_width,a.st_height,
#       a.st_resX,a.st_resY,c.ssl_order,c.pct_x_resid,c.pct_y_resid,c.ssl_st_orient
#    FROM
#        (((((`screentype`    `a`
#        JOIN `screenspace`   `b`)
#        JOIN `sspace_layout` `c`)
#        JOIN `ssl_hs_assign` `d`)
#        JOIN `hostscreen`    `e`)
#        JOIN `ssite_host`    `f`)
#    WHERE
#        ((`a`.`st_id`     = `c`.`st_id`)     AND
#         (`b`.`ss_id`     = `c`.`ss_id`)     AND
#         (`c`.`ssl_id`    = `d`.`ssl_id`)    AND
#         (`d`.`hs_id`     = `e`.`hs_id`)     AND
#         (`e`.`sshost_id` = `f`.`sshost_id`))
#ORDER BY `c`.`ssl_id`;
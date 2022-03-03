#select pdspid,progid,displayid,stepid,steporder,progdisplays_displayopparams.preferred_order,
#       displayop_params.preferred_order,displayop_param_name, displayop_param_value
#from   progdisplays_displayopparams , displayop_params
#where  displayop_params.opname=progdisplays_displayopparams.displayop
#and    displayop_params.preferred_order=progdisplays_displayopparams.preferred_order
##and progid=136 and   displayid=0 and   stepid=1 and   steporder=1
#and (displayop_param_name like "%VALUE"
#or displayop_param_name = "URL")
#order by progid,displayid,stepid,steporder,progdisplays_displayopparams.preferred_order;
#update progdisplaystepparam set displayop_param_value="orange"
#where pdspid=31252;

#SELECT displayopid,preferred_order,opname,param_name,default_val
#FROM   displayop_params
#order by displayopid, preferred_order;

#select   distinct progdisplayid
##        pdsid,progid,stepid,steporder,preferred_order ,displayop_param_name,displayop_param_value
#from     progdisplays_displayopparams
#where    displayop="BROWSER"
#group by progid,displayid,stepid,steporder
#having   count(*)=8
#order by progid,displayid,stepid,steporder;

#insert into progdisplaystepparam
#      (pdsid,preferred_order,displayop_paramid,displayop_param_value,author,moddate,modtime,displayop_param_name)
#select   pdsid,preferred_order ,displayop_param_name,displayop_param_value
#from     progdisplays_displayopparams
#where    displayop="BROWSER"
#order by progid,displayid,stepid,steporder;

#select pdsid from progdisplays_displayopparams where displayop='BROWSER' group by pdsid having count(*) < 8 order by  pdsid;
#select   distinct pdsid
#from     progdisplays_displayopparams
#where    displayop="BROWSER"
#order by pdsid;

#order by progid,displayid,stepid,steporder,preferred_order;
#select   preferred_order,displayop_paramid,default_val,opname
#from     displayop_params
#where    opname="BROWSER"
#order by preferred_order;

#delete from screenspace a
#select * from screenspace a
#where not exists (
#      select * from sspace_layout b
#	   where a.ss_id = b.ss_id
#);
#

#select * from mf_image where unique_id=202607;

#select *
#from   mf_image,mf_image_tag
#where  mf_image.unique_id = 874072
#and    mf_image.unique_id = mf_image_tag.unique_id;

#select   mf_image.unique_id, mf_image_tag.imagetag
#from     mf_image, mf_image_tag
#where    mf_image_tag.imagetag=""
#and      mf_image.unique_id=mf_image_tag.unique_id
#order by mf_image_tag.imagetag;

#select mf_image.unique_id, mf_image_tag.imagetag, count(*)
#from   mf_image, mf_image_tag
#group by mf_image.unique_id, mf_image_tag.imagetag
#order by mf_image.unique_id, mf_image_tag.imagetag;

#select   e.imagetag, count(a.unique_id)
#from     mf_image a, mf_image_tag b , mf_image_tag c, mf_image_tag d, mf_image_tag e
#where    a.unique_id  = b.unique_id
#and      a.unique_id  = c.unique_id
#and      a.unique_id  = d.unique_id
#and      a.unique_id  = e.unique_id
#and      b.imagetag   = "night"
#and      c.imagetag   = "NYC"
#and      d.imagetag   = "lights"
#and      e.imagetag  != "night"
#and      e.imagetag  != "NYC"
#and      e.imagetag  != "lights"
#group by e.imagetag
#order by count(a.unique_id) desc;

#select mf_image.unique_id, mf_image_tag.imagetag, count(*)
#from   mf_image, mf_image_tag
#where  mf_image.unique_id in (
#   select   a.unique_id
#   from     mf_image a, mf_image_tag b
#   where    a.unique_id = b.unique_id
#   and      b.imagetag  = "abstract" )
#and    mf_image.unique_id in (
#   select   c.unique_id
#   from     mf_image c, mf_image_tag d
#   where    c.unique_id = d.unique_id
#   and      d.imagetag  = "blue" )
#group by mf_image.unique_id, mf_image_tag.imagetag
#order by mf_image.unique_id, mf_image_tag.imagetag;


#select   a.unique_id, count(distinct imagetag)
#from     mf_image a, mf_image_tag b
#where    a.unique_id=b.unique_id
#and      b.imagetag in ("shape","abstract")
#group by a.unique_id
#having   count(*)=2
#order by count(distinct b.imagetag) desc;
#delete from mf_image_tag where imagetag="";

#select   b.imagetag, count(distinct a.unique_id) "#images"
#from     mf_image a, mf_image_tag b, image_tag c
#where    a.unique_id=b.unique_id
#and      b.imagetag=c.imagetag
#group by b.imagetag
#having   count(distinct a.unique_id) > 12
#order by b.imagetag;
#order by count(distinct a.unique_id) asc;

#select * from mf_image_tag;
#select count(*) from image_tag;
#select count(*) from mf_image order by unique_id;
#select * from mf_user;
#select * from mf_user_image;
#
#select * from master_program_list;
#select *,curdate(),curtime()  from screenspace order by ss_id desc;

select   steporder,
         concat_ws('~',
            concat_ws('/',displayid,
               concat_ws('.',stepid,steporder)),
            displayop)                           readystep,
         pdspid,
         displayop_param_name                    name,
         displayop_param_value                   value
from     progdisplays_displayopparams
where    progid=136
 and     stepid=2 
 and     steporder=2 
 and     displayid=2
 #and     displayop_param_name in ( 'DELAY','DURATION')
#group by steporder
#having 2 between delay and duration
order by stepid,steporder,displayid,preferred_order asc

select a.ss_id,    c.ssl_order,   a.ss_name,     a.ss_width,    a.ss_height,
       c.st_id,    c.pct_x_resid, c.pct_y_resid, c.ssl_st_orient,
       d.st_width, d.st_height
from   screenspace a, sspace_layout c, screentype d
where  a.ss_id = c.ss_id
and    c.st_id = d.st_id
and    a.ss_id in (select   b.ss_id #PRIMARY
                   from     sspace_layout b
	               where    a.ss_id = b.ss_id
                   group by b.ss_id
	               having   count(*)=3)
order by a.ss_id, c.ssl_order;

#select * from hostscreen;

#select   progid,displayid,stepid,steporder,preferred_order,displayop,displayop_param_name,displayop_param_value
#from     progdisplays_displayopparams
#where    progdisplayid=227
#and      stepid=2
#AND      displayop_param_name in ('URL','TEXTVALUE','IMAGEAREA','TEXTAREA','TEXTFONT')
#order by stepid,steporder,preferred_order;

#select   progid,progname,displayid,stepid,steporder,displayop_param_name,displayop_param_value
#from     progdisplays_displayopparams
#where    progid=33 and displayop_param_name="URL"
#order by progid,displayid,stepid,steporder;

#select ssl_id,ss_id,ssl_order,st_id,ssl_st_orient from sspace_layout order by ssl_id;
#select ssl_id,ss_id,ssl_order,st_id,ssl_st_orient from sspace_layout order by ssl_id;
#select date(strftime('%s','now'),'unixepoch') from screenspace;
#select distinct progid,progdisplayid,stepid,steporder from progdisplays_displayopparams where pdsid=240;
#select   displayop,displayop_param_name,count(*)
#from     progdisplays_displayopparams
#where    displayop_param_name in ('URL','TEXTVALUE') #like '%AREA%' #
#group by displayop,displayop_param_name
#order by displayop_param_name, count(*) desc;

#delete from screenspace where ss_id in (5,7,9,10,11);
#SELECT   progid, displayid,stepid,steporder,pdsid, pdspid, displayop, displayop_param_name, displayop_param_value
##concat('http://www.readyshows.com/sites/default/files/deploy',
##                                      substr(displayop_param_value,25))
##         concat('http://www.readyshows.com/sites/default/files',
##                substr(displayop_param_value,10)) newurl
#FROM     progdisplays_displayopparams
#WHERE    progid=9
#AND      stepid=1
##AND      steporder=1
#AND      displayop_param_name in ('URL','TEXTVALUE','IMAGEAREA','TEXTAREA','TEXTFONT')
##where     displayop_param_value like "binfile%"
##where    displayop_param_value like "%192\.168\.1\.10\/pics%"
#order by progid,displayid;
#select * from displayop_params order by displayopid,preferred_order;

#update progdisplaystepparam
#   set displayop_param_value = concat('http://www.readyshows.com/sites/default/files',
#                                      substr(displayop_param_value,10))
#where    displayop_param_value like "binfile:#%";

#update progdisplaystepparam
#   set displayop_param_value = concat('http://www.readyshows.com/sites/default/files/deploy',
#                                      substr(displayop_param_value,25))
#where    displayop_param_value like "%192\.168\.1\.10\/pics%"
#select * from displayop_param where displayopid=3 order by preferred_order;

#insert into displayop_param
#   set displayopid=3, param_name="SCROLLTO",preferred_order=9,
#       defdate=curdate(),deftime=curtime(),default_val="0,0";
#
#select * from displayop_params where displayopid=3 order by preferred_order asc;
#select * from progdisplaystepparam where displayop_paramid in (91,92) order by pdsid,preferred_order;
#select * from progdisplaystepparam where displayop_param_name like 'SCROLL%' order by pdsid,preferred_order;
#select * from progdisplaystepparam where displayop_param_name = 'SCROLL' order by pdsid,preferred_order;
#update progdisplaystepparam set displayop_paramid=91, displayop_param_name="SCROLLTO" where displayop_param_name = 'SCROLL';
#select * from progdisplaystepparam where displayop_paramid=91 and displayop_param_name = 'SCROLLTO';
#update progdisplaystepparam set displayop_param_name="SCROLLBAR" where displayop_paramid=91 and displayop_param_name = 'SCROLLTO';
#select pdsid from progdisplays_displayopparams where displayop='BROWSER' group by pdsid having count(*) < 8 order by  pdsid
#select displayop_paramid from displayop_params where opname='BROWSER' and ) order by pdsid,preferred_order;
#delete from progdisplaystepparam where pdspid is null;
#select * from progdisplays_displayopparams where displayop="BROWSER" order by progid,displayid,stepid,steporder,preferred_order; #param_name="SCROLLBAR";
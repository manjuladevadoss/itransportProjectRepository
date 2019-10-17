-- Drop table

-- DROP TABLE public.gis_expressway;

CREATE TABLE public.gis_expressway (
	gid serial NOT NULL,
	objectid int8 NULL,
	roadcode varchar(15) NULL,
	roadname varchar(65) NULL,
	cat varchar(15) NULL,
	loc_code_i int8 NULL,
	loc_detail varchar(25) NULL,
	dst_km numeric NULL,
	shape_leng numeric NULL,
	shape_le_1 numeric NULL,
	geom geometry(MULTILINESTRINGM) NULL,
	CONSTRAINT gis_expressway_pkey PRIMARY KEY (gid)
);
CREATE INDEX gis_expressway_geom_idx ON public.gis_expressway USING gist (geom);

-- Drop table

-- DROP TABLE public.gis_glide_site;

CREATE TABLE public.gis_glide_site (
	gid serial NOT NULL,
	objectid_1 int8 NULL,
	objectid int8 NULL,
	node_id int8 NULL,
	site_id int8 NULL,
	ctrlbox_id int8 NULL,
	status numeric NULL,
	x numeric NULL,
	y numeric NULL,
	geom geometry(POINT) NULL,
	CONSTRAINT gis_glide_site_pkey PRIMARY KEY (gid)
);
CREATE INDEX gis_glide_site_geom_idx ON public.gis_glide_site USING gist (geom);

-- Drop table

-- DROP TABLE public.gis_ptz_attr;

CREATE TABLE public.gis_ptz_attr (
	gid serial NOT NULL,
	zone_id int4 NULL,
	status varchar(1) NULL,
	last_upd_d date NULL,
	eqt_id varchar(20) NULL,
	"name" varchar(20) NULL,
	eway_code int4 NULL,
	dir int4 NULL,
	loc_desc varchar(100) NULL,
	dst_km numeric NULL,
	x numeric NULL,
	y numeric NULL,
	roadcode varchar(6) NULL,
	alarm int4 NULL,
	ds1 int4 NULL,
	hidden int4 NULL,
	geom geometry(POINT, 3414) NULL,
	CONSTRAINT gis_ptz_attr_pkey PRIMARY KEY (gid)
);
CREATE INDEX gis_ptz_attr_geom_idx ON public.gis_ptz_attr USING gist (geom);

-- Drop table

-- DROP TABLE public.gis_speedlink;

CREATE TABLE public.gis_speedlink (
	gid int4 NULL,
	roadcode varchar(15) NULL,
	roadname varchar(65) NULL,
	cat varchar(15) NULL,
	status varchar(10) NULL,
	last_upd_d date NULL,
	link_id int8 NULL,
	fnode int8 NULL,
	tnode int8 NULL,
	u_id varchar(20) NULL,
	no_of_lane int4 NULL,
	bus_lane int4 NULL,
	dir int4 NULL,
	bus_stop int4 NULL,
	speed_limi int4 NULL,
	restric_ve varchar(20) NULL,
	zone_id int4 NULL,
	disp_cat varchar(15) NULL,
	oneway varchar(10) NULL,
	net_cat int4 NULL,
	"type" int4 NULL,
	corr_id int4 NULL,
	shape_leng numeric NULL,
	shape_le_1 numeric NULL,
	geom geometry(MULTILINESTRINGM, 3414) NULL,
	speed int4 NULL
);

-- Drop table

-- DROP TABLE public.gis_speedlink_data;

CREATE TABLE public.gis_speedlink_data (
	link_id int8 NULL,
	date_time timestamp NULL,
	speed int4 NULL,
	vol int4 NULL,
	occ int4 NULL,
	los int4 NULL,
	cat varchar NULL,
	corr_id int4 NULL,
	shape_leng numeric NULL,
	shape_le_1 numeric NULL,
	geom geometry NULL
);

-- Drop table

-- DROP TABLE public.gis_speedlink_new;

CREATE TABLE public.gis_speedlink_new (
	gid int4 NULL,
	roadcode varchar(15) NULL,
	roadname varchar(65) NULL,
	cat varchar(15) NULL,
	status varchar(10) NULL,
	last_upd_d date NULL,
	link_id int8 NULL,
	fnode int8 NULL,
	tnode int8 NULL,
	u_id varchar(20) NULL,
	no_of_lane int4 NULL,
	bus_lane int4 NULL,
	dir int4 NULL,
	bus_stop int4 NULL,
	speed_limi int4 NULL,
	restric_ve varchar(20) NULL,
	zone_id int4 NULL,
	disp_cat varchar(15) NULL,
	oneway varchar(10) NULL,
	net_cat int4 NULL,
	"type" int4 NULL,
	corr_id int4 NULL,
	shape_leng numeric NULL,
	shape_le_1 numeric NULL,
	geom geometry(MULTILINESTRINGM, 3414) NULL
);

-- Drop table

-- DROP TABLE public.gis_vms_attr_deploy;

CREATE TABLE public.gis_vms_attr_deploy (
	gid serial NOT NULL,
	eqt_id varchar(20) NULL,
	"name" varchar(20) NULL,
	loc_desc varchar(100) NULL,
	"type" varchar(10) NULL,
	bearing int4 NULL,
	status varchar(1) NULL,
	alarm int4 NULL,
	flashing_m int4 NULL,
	dsp int4 NULL,
	ds1 int4 NULL,
	ds2 int4 NULL,
	ds3 int4 NULL,
	graphic_co int4 NULL,
	line1 varchar(18) NULL,
	line1a varchar(18) NULL,
	line1b varchar(18) NULL,
	line2 varchar(18) NULL,
	line2a varchar(18) NULL,
	line3 varchar(18) NULL,
	line3a varchar(18) NULL,
	dest1 varchar(9) NULL,
	dest1a varchar(9) NULL,
	dest2 varchar(9) NULL,
	dest2a varchar(9) NULL,
	dest3 varchar(9) NULL,
	dest3a varchar(9) NULL,
	time1 varchar(2) NULL,
	time1a varchar(2) NULL,
	time2 varchar(2) NULL,
	time2a varchar(2) NULL,
	time3 varchar(2) NULL,
	time3a varchar(2) NULL,
	brightness int4 NULL,
	zone_id int4 NULL,
	last_upd_d date NULL,
	ds4 int4 NULL,
	eway_code int4 NULL,
	dir int4 NULL,
	dst_km numeric NULL,
	x numeric NULL,
	y numeric NULL,
	roadcode varchar(6) NULL,
	hidden int4 NULL,
	dimming_mo int4 NULL,
	dimming_le int4 NULL,
	ds0 int4 NULL,
	ds5 int4 NULL,
	ds6 int4 NULL,
	ds9 int4 NULL,
	dsa int4 NULL,
	dsb int4 NULL,
	dsc int4 NULL,
	geom geometry(POINT, 3414) NULL,
	CONSTRAINT gis_vms_attr_deploy_pkey PRIMARY KEY (gid)
);
CREATE INDEX gis_vms_attr_deploy_geom_idx ON public.gis_vms_attr_deploy USING gist (geom);

-- Drop table

-- DROP TABLE public.gisdbo_gis_carriageway;

CREATE TABLE public.gisdbo_gis_carriageway (
	gid serial NOT NULL,
	roadcode varchar(15) NULL,
	roadname varchar(65) NULL,
	cat varchar(15) NULL,
	status varchar(10) NULL,
	last_upd_d date NULL,
	link_id int8 NULL,
	fnode int8 NULL,
	tnode int8 NULL,
	u_id varchar(20) NULL,
	no_of_lane int4 NULL,
	bus_lane int4 NULL,
	dir int4 NULL,
	bus_stop int4 NULL,
	speed_limi int4 NULL,
	restric_ve varchar(20) NULL,
	zone_id int4 NULL,
	disp_cat varchar(15) NULL,
	oneway varchar(10) NULL,
	net_cat int4 NULL,
	"type" int4 NULL,
	corr_id int4 NULL,
	shape_leng numeric NULL,
	shape_le_1 numeric NULL,
	geom geometry(MULTILINESTRINGM, 3414) NULL,
	CONSTRAINT gisdbo_gis_carriageway_pkey PRIMARY KEY (gid)
);
CREATE INDEX gisdbo_gis_carriageway_geom_idx ON public.gisdbo_gis_carriageway USING gist (geom);

-- Drop table

-- DROP TABLE public.gisdbo_gis_ea_fels_attr;

CREATE TABLE public.gisdbo_gis_ea_fels_attr (
	gid serial NOT NULL,
	eqt_id varchar(20) NULL,
	"name" varchar(20) NULL,
	status varchar(1) NULL,
	eqt_type varchar(5) NULL,
	zone_id int4 NULL,
	last_upd_d date NULL,
	alarm int4 NULL,
	eac_code int4 NULL,
	dir int4 NULL,
	dst_km numeric NULL,
	x numeric NULL,
	y numeric NULL,
	loc_desc varchar(100) NULL,
	geom geometry(POINT, 3414) NULL,
	CONSTRAINT gisdbo_gis_ea_fels_attr_pkey PRIMARY KEY (gid)
);
CREATE INDEX gisdbo_gis_ea_fels_attr_geom_idx ON public.gisdbo_gis_ea_fels_attr USING gist (geom);

-- Drop table

-- DROP TABLE public.gisdbo_gis_ea_vms;

CREATE TABLE public.gisdbo_gis_ea_vms (
	gid serial NOT NULL,
	eqt_id varchar(20) NULL,
	"name" varchar(20) NULL,
	loc_desc varchar(100) NULL,
	"type" varchar(5) NULL,
	status varchar(1) NULL,
	alarm int4 NULL,
	msg_mode int4 NULL,
	tog_mode int4 NULL,
	dim_mode int4 NULL,
	dim_lvl int4 NULL,
	zone_id int4 NULL,
	last_upd_d date NULL,
	dir int4 NULL,
	dst_km numeric NULL,
	loc_id varchar(20) NULL,
	eac_code int4 NULL,
	x numeric NULL,
	y numeric NULL,
	"system" varchar(5) NULL,
	geom geometry(POINT, 3414) NULL,
	CONSTRAINT gisdbo_gis_ea_vms_pkey PRIMARY KEY (gid)
);
CREATE INDEX gisdbo_gis_ea_vms_geom_idx ON public.gisdbo_gis_ea_vms USING gist (geom);

-- Drop table

-- DROP TABLE public.gisdbo_gis_rtsline;

CREATE TABLE public.gisdbo_gis_rtsline (
	gid serial NOT NULL,
	level_ varchar(254) NULL,
	typ varchar(254) NULL,
	unique_id numeric NULL,
	last_upd_d date NULL,
	color int4 NULL,
	line_id int4 NULL,
	u_id varchar(20) NULL,
	shape_leng numeric NULL,
	geom geometry(MULTILINESTRING) NULL,
	CONSTRAINT gisdbo_gis_rtsline_pkey PRIMARY KEY (gid)
);
CREATE INDEX gisdbo_gis_rtsline_geom_idx ON public.gisdbo_gis_rtsline USING gist (geom);

-- Drop table

-- DROP TABLE public.gisdbo_gis_webcam;

CREATE TABLE public.gisdbo_gis_webcam (
	gid serial NOT NULL,
	zone_id int4 NULL,
	status varchar(1) NULL,
	last_upd_d date NULL,
	eqt_id varchar(20) NULL,
	"name" varchar(20) NULL,
	eway_code int4 NULL,
	dir int4 NULL,
	loc_desc varchar(100) NULL,
	dst_km numeric NULL,
	x numeric NULL,
	y numeric NULL,
	roadcode varchar(6) NULL,
	alarm int4 NULL,
	ds1 int4 NULL,
	hidden int4 NULL,
	geom geometry(POINT, 3414) NULL,
	CONSTRAINT gisdbo_gis_webcam_pkey PRIMARY KEY (gid)
);
CREATE INDEX gisdbo_gis_webcam_geom_idx ON public.gisdbo_gis_webcam USING gist (geom);

-- Drop table

-- DROP TABLE public.mrtlrtstnptt;

CREATE TABLE public.mrtlrtstnptt (
	gid serial NOT NULL,
	objectid int8 NULL,
	stn_name varchar(66) NULL,
	stn_no varchar(15) NULL,
	geom geometry(POINT) NULL,
	CONSTRAINT mrtlrtstnptt_pkey PRIMARY KEY (gid)
);
CREATE INDEX mrtlrtstnptt_geom_idx ON public.mrtlrtstnptt USING gist (geom);

-- Drop table

-- DROP TABLE public.pointcloud_formats;

CREATE TABLE public.pointcloud_formats (
	pcid int4 NOT NULL,
	srid int4 NULL,
	"schema" text NULL,
	CONSTRAINT pointcloud_formats_pcid_check CHECK (((pcid > 0) AND (pcid < 65536))),
	CONSTRAINT pointcloud_formats_pkey PRIMARY KEY (pcid),
	CONSTRAINT pointcloud_formats_schema_check CHECK (pc_schemaisvalid(schema))
);

-- Drop table

-- DROP TABLE public.spatial_ref_sys;

CREATE TABLE public.spatial_ref_sys (
	srid int4 NOT NULL,
	auth_name varchar(256) NULL,
	auth_srid int4 NULL,
	srtext varchar(2048) NULL,
	proj4text varchar(2048) NULL,
	CONSTRAINT spatial_ref_sys_pkey PRIMARY KEY (srid),
	CONSTRAINT spatial_ref_sys_srid_check CHECK (((srid > 0) AND (srid <= 998999)))
);

-- Drop table

-- DROP TABLE public.trafficsignalaspect;

CREATE TABLE public.trafficsignalaspect (
	gid serial NOT NULL,
	typ_cd varchar(4) NULL,
	bearg_num numeric NULL,
	typ_cd_des varchar(254) NULL,
	bearg_num_ varchar(254) NULL,
	geom geometry(POINT, 3414) NULL,
	CONSTRAINT trafficsignalaspect_pkey PRIMARY KEY (gid)
);
CREATE INDEX trafficsignalaspect_geom_idx ON public.trafficsignalaspect USING gist (geom);

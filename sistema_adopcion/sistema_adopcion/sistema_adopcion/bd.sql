--drop table sistema_adopcion.donacion;
--drop table sistema_adopcion.mascota;
--drop table sistema_adopcion.users;
--drop table sistema_adopcion.tipo_usuario;

--drop table sistema_adopcion.donacion;
--drop table sistema_adopcion.mascota;
--drop table sistema_adopcion.users;
--drop table sistema_adopcion.tipo_usuario;

create table sistema_adopcion.comuna (
id serial primary key,
nombre_comuna varchar(100) not null,
fecha_creacion timestamp,
fecha_borrado timestamp
)

create table sistema_adopcion.tipo_usuario (
id serial primary key,
nombre_tipo_usuario varchar(100) not null,
fecha_creacion timestamp,
fecha_borrado timestamp
)

create table sistema_adopcion.tipo_mascota (
id serial primary key,
nombre_tipo_mascota varchar (30) not null,
fecha_creacion timestamp,
fecha_borrado timestamp
)

CREATE TABLE sistema_adopcion.usuarios (
id serial PRIMARY KEY,
rut varchar (24) NOT NULL UNIQUE,
nombre varchar(100) NOT NULL
email varchar(60) NOT NULL,
direccion varchar(100) NOT NULL,
comuna_id int4 NOT NULL,
tipo_usuario_id int4 NOT NULL,
fecha_creacion timestamp,
fecha_borrado timestamp,
pass varchar(300) NOT NULL,
telefono varchar(13) NOT NULL,
CONSTRAINT tipo_usuario_id_fkey FOREIGN KEY (tipo_usuario_id)
REFERENCES sistema_adopcion.tipo_usuario (id) MATCH SIMPLE ,
CONSTRAINT comuna_id_fkey FOREIGN KEY (comuna_id)
REFERENCES sistema_adopcion.comuna (id) MATCH SIMPLE 
)

CREATE TABLE sistema_adopcion.mascota (
id serial PRIMARY KEY,
nombre varchar(60) NOT NULL,
tipo_mascota_id int4 NOT NULL,
descripcion text,
edad int4,
usuario_id int4 NOT NULL,
fecha_creacion timestamp,
fecha_borrado timestamp,
CONSTRAINT tipo_mascota_id_fkey FOREIGN KEY (tipo_mascota_id)
	REFERENCES sistema_adopcion.tipo_mascota (id) MATCH SIMPLE,
CONSTRAINT usuario_id_fkey FOREIGN KEY (usuario_id)
	REFERENCES sistema_adopcion.usuarios (id) MATCH SIMPLE
)

CREATE TABLE sistema_adopcion.mascotas_img (
id serial PRIMARY KEY,
nombre_archivo varchar(255),
mascota_id int4,
ruta_s3 varchar(500),
CONSTRAINT img_mascota_fkey FOREIGN KEY (mascota_id)
	REFERENCES sistema_adopcion.mascota (id)
)
CREATE TABLE sistema_adopcion.donacion (
id serial PRIMARY KEY,
monto int4 NOT NULL,
fecha_donacion timestamp,
usuario_id int4 NOT NULL,
CONSTRAINT usiaro_id_donacion_fkey FOREIGN KEY (usuario_id)
	REFERENCES sistema_adopcion.usuarios (id) MATCH
)

insert into 
sistema_adopcion.tipo_usuario 
values 
(
default,
'admin',
current_timestamp
);

insert into
sistema_adopcion.tipo_usuario
values (
default,
'adoptante',
current_timestamp
);

insert into 
sistema_adopcion.tipo_usuario
values 
(
default,
'dueño',
current_timestamp
);

--inserts comunas

insert into 
sistema_adopcion.comuna
values
(
default,
'Santiago',
current_timestamp
);

insert into 
sistema_adopcion.comuna
values
(
default,
'Conchalí',
current_timestamp
);

insert into 
sistema_adopcion.comuna
values
(
default,
'Huechuraba',
current_timestamp
);

insert into 
sistema_adopcion.comuna
values
(
default,
'Independencia',
current_timestamp
);

insert into 
sistema_adopcion.comuna
values
(
default,
'Quilicura',
current_timestamp
);

insert into 
sistema_adopcion.comuna
values
(
default,
'Recoleta',
current_timestamp
);

insert into 
sistema_adopcion.comuna
values
(
default,
'Renca',
current_timestamp
);

insert into 
sistema_adopcion.comuna
values
(
default,
'Las Condes',
current_timestamp
);

insert into 
sistema_adopcion.comuna
values
(
default,
'Lo Barnechea',
current_timestamp
);

insert into 
sistema_adopcion.comuna
values
(
default,
'Providencia',
current_timestamp
);

insert into 
sistema_adopcion.comuna
values
(
default,
'Vitacura',
current_timestamp
);

insert into 
sistema_adopcion.comuna
values
(
default,
'La Reina',
current_timestamp
);

insert into 
sistema_adopcion.comuna
values
(
default,
'Macul',
current_timestamp
);

insert into 
sistema_adopcion.comuna
values
(
default,
'Ñuñoa',
current_timestamp
);

insert into 
sistema_adopcion.comuna
values
(
default,
'Peñalolen',
current_timestamp
);

insert into 
sistema_adopcion.comuna
values
(
default,
'La Florida',
current_timestamp
);

insert into 
sistema_adopcion.comuna
values
(
default,
'La Granja',
current_timestamp
);

insert into 
sistema_adopcion.comuna
values
(
default,
'El Bosque',
current_timestamp
);

insert into 
sistema_adopcion.comuna
values
(
default,
'La Cisterna',
current_timestamp
);

insert into 
sistema_adopcion.comuna
values
(
default,
'La Pintana',
current_timestamp
);

insert into 
sistema_adopcion.comuna
values
(
default,
'San Ramón',
current_timestamp
);

insert into 
sistema_adopcion.comuna
values
(
default,
'Lo Espejo',
current_timestamp
);

insert into 
sistema_adopcion.comuna
values
(
default,
'Pedro Aguirre Cerda',
current_timestamp
);

insert into 
sistema_adopcion.comuna
values
(
default,
'San Joaquín',
current_timestamp
);

insert into 
sistema_adopcion.comuna
values
(
default,
'San Miguel',
current_timestamp
);

insert into 
sistema_adopcion.comuna
values
(
default,
'Cerrillos',
current_timestamp
);

insert into 
sistema_adopcion.comuna
values
(
default,
'Estación Central',
current_timestamp
);

insert into 
sistema_adopcion.comuna
values
(
default,
'Maipú',
current_timestamp
);

insert into 
sistema_adopcion.comuna
values
(
default,
'Cerro Navia',
current_timestamp
);

insert into 
sistema_adopcion.comuna
values
(
default,
'Lo Prado',
current_timestamp
);

insert into 
sistema_adopcion.comuna
values
(
default,
'Pudahuel',
current_timestamp
);

insert into 
sistema_adopcion.comuna
values
(
default,
'Quinta Normal',
current_timestamp
);

insert into
sistema_adopcion.comuna
values 
(
default,
'Puente Alto',
current_timestamp
);
-- Inserts usuarios

insert into 
sistema_adopcion.usuarios
values 
(
default,
'20121614-1',
'Tony Stark',
'rgonbarria@gmail.com',
'Dichato 603',
34,
1,
current_timestamp,
null,
'd282ef263719ab842e05382dc235f69e'
);

insert into
sistema_adopcion.usuarios
values
(
default,
'20049040-1',
'Yaya',
'yanara.cornejo@gmail.com',
'Dichato 603',
34,
1,
current_timestamp,
null,
'b9f94c77652c9a76fc8a442748cd54bd'
);

--Insert tipo mascota

insert into
sistema_adopcion.tipo_mascota
values 
(
default,
'Perro',
current_timestamp,
null
);

insert into
sistema_adopcion.tipo_mascota
values
(
default,
'Gato',
current_timestamp,
null
);
-- Insert mascota

insert into 
sistema_adopcion.mascota
values 
(
default,
'Tikki',
1,
'Perro que se porta mal generalmente',
1,
null,
1
)


CREATE OR REPLACE FUNCTION sistema_adopcion.f_obtener_mascotas(next_set integer, off integer, sort character varying)
 RETURNS json
 LANGUAGE plpgsql
AS $function$

DECLARE

 ov_mascotas JSON;

BEGIN
	
	
	EXECUTE
	 'SELECT ARRAY_TO_JSON(ARRAY_AGG(ROW_TO_JSON(mascota)))
		FROM (
			 SELECT m.nombre, tm.nombre_tipo_mascota as tipo_mascota,
				m.descripcion, m.edad, 
				m.fecha_creacion,
				(SELECT array_to_json(array_agg(row_to_json(img))) 
					FROM (SELECT * FROM sistema_adopcion.mascotas_img
							WHERE mascota_id = m.id ) img) AS imagenes
				FROM sistema_adopcion.mascota m
				JOIN sistema_adopcion.tipo_mascota tm
				ON (m.tipo_mascota_id = tm.id)
				WHERE m.fecha_borrado IS NULL
				ORDER BY m.fecha_creacion DESC
				OFFSET ' || off || ' ) mascota'
				
	INTO ov_mascotas;

	RETURN ov_mascotas;

EXCEPTION

	WHEN OTHERS THEN
		RAISE EXCEPTION 'Error obteniendo las mascotas  - ERROR:  % | STATE: %', SQLERRM, SQLSTATE;
	
END;

$function$
;

CREATE OR REPLACE FUNCTION sistema_adopcion.f_obtener_mascota_por_id(id_mascota integer)
 RETURNS json
 LANGUAGE plpgsql
AS $function$

DECLARE 

 ov_mascota JSON;

BEGIN 
	
	SELECT ROW_TO_JSON(mascota)
	 FROM (
	 	SELECT
	 	m.id,
	 	m.nombre,
	 	tm.nombre_tipo_mascota AS tipo_mascota,
	 	m.descripcion,
	 	m.edad,
	 	m.fecha_creacion
	 	FROM sistema_adopcion.mascota m
	 	JOIN sistema_adopcion.tipo_mascota tm
	 	ON (m.tipo_mascota_id = tm.id )
	 	WHERE m.id = id_mascota 
	  ) mascota
	  INTO ov_mascota;
	 
	 RETURN ov_mascota;
	
EXCEPTION
	
	WHEN OTHERS THEN
		RAISE EXCEPTION 'Error obteniendo mascota - ERROR: % | STATE: % ', SQLERRM, SQLSTATE;
	  
	
END;
$function$
;


CREATE OR REPLACE FUNCTION sistema_adopcion.f_crear_mascota(iv_mascota json, iv_user_id INTEGER)
 RETURNS JSON
 LANGUAGE PLPGSQL
AS $FUNCTION$

DECLARE

 ov_mascota JSON;
 lv_id_mascota INTEGER;
 
BEGIN
	
	INSERT INTO
	sistema_adopcion.mascota
	(nombre, tipo_mascota_id, descripcion, edad, usuario_id, fecha_creacion)
	VALUES
	(
	iv_mascota::json->>'nombre',
	CAST (iv_mascota::json->>'tipo_mascota_id' AS INTEGER),
	iv_mascota::json->>'descripcion',
	CAST (iv_mascota::json->>'edad' AS INTEGER),
	iv_user_id,
	CURRENT_TIMESTAMP
	)
	RETURNING id INTO lv_id_mascota;

	SELECT * FROM sistema_adopcion.f_obtener_mascota_por_id(lv_id_mascota) INTO ov_mascota;

	RETURN ov_mascota;

EXCEPTION
	WHEN OTHERS THEN
		RAISE EXCEPTION 'Error creando la mascota en el sistema - ERROR: % | STATE: % ', SQLERRM, SQLSTATE;
	
END;
$FUNCTION$
;

CREATE OR REPLACE FUNCTION sistema_adopcion.f_obtener_tipo_mascotas(next_set integer, off integer, sort character varying)
 RETURNS json
 LANGUAGE plpgsql
AS $function$

DECLARE

ov_tipo_mascota JSON;

BEGIN
	
	EXECUTE
	 'SELECT ARRAY_TO_JSON(ARRAY_AGG(ROW_TO_JSON(tal)))
		FROM (
			 SELECT * FROM sistema_adopcion.tipo_mascota
				WHERE fecha_borrado IS NULL
				ORDER BY fecha_creacion DESC
				OFFSET ' || off || ' ) tal'
				INTO ov_tipo_mascota;
			
	RETURN ov_tipo_mascota;

EXCEPTION
	WHEN OTHERS THEN
		RAISE EXCEPTION 'Error obteniendo los tipos de mascota del sistema - ERROR: % | STATE: %', SQLERRM, SQLSTATE;
END;
$function$
;


CREATE OR REPLACE FUNCTION sistema_adopcion.f_obtener_comunas(next_set integer, off integer, sort character varying)
 RETURNS json
 LANGUAGE plpgsql
AS $function$

DECLARE

ov_comuna JSON;

BEGIN
	
	EXECUTE
	 'SELECT ARRAY_TO_JSON(ARRAY_AGG(ROW_TO_JSON(tal)))
		FROM (
			 SELECT * FROM sistema_adopcion.comuna
				WHERE fecha_borrado IS NULL
				ORDER BY id DESC) tal'
				INTO ov_comuna;
			
	RETURN ov_comuna;

EXCEPTION
	WHEN OTHERS THEN
		RAISE EXCEPTION 'Error obteniendo las comunas del sistema - ERROR: % | STATE: %', SQLERRM, SQLSTATE;
END;
$function$
;



CREATE OR REPLACE FUNCTION sistema_adopcion.f_obtener_usuario_por_id(id_usuario integer)
 RETURNS json
 LANGUAGE plpgsql
AS $function$

DECLARE 

 ov_usuario JSON;

BEGIN 
	
	SELECT ROW_TO_JSON(usuario)
	 FROM (
	 	SELECT
	 	u.rut,
	 	u.nombre,
	 	u.email,
	 	u.direccion,
	 	u.comuna_id,
	 	c.nombre_comuna AS comuna
	 	FROM sistema_adopcion.usuarios u
	 	JOIN sistema_adopcion.comuna c
	 	ON u.comuna_id = c.id 
	 	WHERE u.id = id_usuario
	  ) usuario
	  INTO ov_usuario;
	 
	 RETURN ov_usuario;
	
EXCEPTION
	
	WHEN OTHERS THEN
		RAISE EXCEPTION 'Error obteniendo usuario - ERROR: % | STATE: % ', SQLERRM, SQLSTATE;
	  
	
END;
$function$
;


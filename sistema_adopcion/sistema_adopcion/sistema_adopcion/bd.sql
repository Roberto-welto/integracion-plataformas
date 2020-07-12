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

create table sistema_adopcion.usuarios (
id serial primary key,
rut varchar (24) not null unique,
nombre varchar(100) not null,
email varchar(60) not null,
direccion varchar(100) not null,
comuna_id int4 not null,
tipo_usuario_id int4 not null,
fecha_creacion timestamp,
fecha_borrado timestamp,
pass varchar(300) not null,
constraint tipo_usuario_id_fkey foreign key (tipo_usuario_id)
references sistema_adopcion.tipo_usuario (id) match simple,
constraint comuna_id_fkey foreign key (comuna_id)
references sistema_adopcion.comuna (id) match simple
)

create table sistema_adopcion.mascota (
id serial primary key,
nombre varchar(60) not null,
tipo_mascota_id int4 not null,
descripcion text,
edad int4,
usuario_id int4 not null,
fecha_creacion timestamp,
fecha_borrado timestamp,
constraint tipo_mascota_id_fkey foreign key (tipo_mascota_id)
	references sistema_adopcion.tipo_mascota (id) match simple,
constraint usuario_id_fkey foreign key (usuario_id)
	references sistema_adopcion.usuarios (id) match simple
)

CREATE TABLE sistema_adopcion.mascotas_img (
id serial PRIMARY KEY,
nombre_archivo varchar(255),
mascota_id int4,
ruta_s3 varchar(500),
CONSTRAINT img_mascota_fkey FOREIGN KEY (mascota_id)
	REFERENCES sistema_adopcion.mascota (id)
)
create table sistema_adopcion.donacion (
id serial primary key,
monto int4 not null,
fecha_donacion timestamp,
usuario_id int4 not null,
constraint usiaro_id_donacion_fkey foreign key (usuario_id)
	references sistema_adopcion.usuarios (id) match simple
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


CREATE OR REPLACE FUNCTION sistema_adopcion.f_obtener_mascotas(next_set INTEGER, off integer, sort CHARACTER VARYING)
 RETURNS JSON
 LANGUAGE PLPGSQL
AS $FUNCTION$

DECLARE

 ov_mascotas JSON;

BEGIN
	
	
	EXECUTE
	 'SELECT ARRAY_TO_JSON(ARRAY_AGG(ROW_TO_JSON(tal)))
		FROM (
			 SELECT * FROM sistema_adopcion.mascota
				WHERE fecha_borrado IS NULL
				ORDER BY fecha_creacion DESC
				OFFSET ' || off || ' ) tal'
				
	INTO ov_mascotas;

	RETURN ov_mascotas;

EXCEPTION

	WHEN OTHERS THEN
		RAISE EXCEPTION 'Error obteniendo las mascotas  - ERROR:  % | STATE: %', SQLERRM, SQLSTATE;
	
END;

$FUNCTION$

;

CREATE OR REPLACE FUNCTION sistema_adopcion.f_obtener_mascota_por_id(id_mascota INTEGER)
 RETURNS JSON
 LANGUAGE PLPGSQL
AS $FUNCTION$

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
$FUNCTION$
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

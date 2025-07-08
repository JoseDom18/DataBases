USE master;
GO

DROP DATABASE Ranchos;
GO

-- Crear de base de datos
create database Ranchos;
GO

-- Seleccionar base de datos
use Ranchos;
GO
-- Crear de tablas
create table
  ejemplares (
    cve_ejemplares int not null,
    cve_secciones int not null,
    cve_colores int not null,
    cve_razas int not null,
    cve_ejemplares_padre int,
    cve_ejemplares_madre int,
    nombre varchar(40) not null,
    sexo bit not null,
    peso numeric not null,
    fecha_nacimiento datetime not null,
    numero_registro int not null,
    costo money not null,
    altura_anterior numeric not null,
    altura_posterior numeric not null
  )
create table
  razas (
    cve_razas int not null,
    nombre varchar(40) not null
  )
create table
  cuidadores (
    cve_cuidadores int not null,
    nombre varchar(30) not null,
    paterno varchar(30) not null,
    materno varchar(30) not null
  )
create table
  secciones (
    cve_secciones int not null,
    cve_ranchos int not null,
    cve_cuidadores int not null,
    cui_cve_cuidadores int not null,
    nombre varchar(40) not null
  )
create table
  colores (cve_colores int not null, nombre varchar(40))
create table
  vacunas (
    cve_vacunas int not null,
    nombre varchar(40) not null
  )
create table
  vacunas_ejemplares (
    cve_vacunas_ejemplares int not null,
    cve_ejemplares int not null,
    cve_vacunas int not null,
    fecha_aplicacion datetime not null
  )
create table
  regiones (
    cve_regiones int not null,
    nombre varchar(40) not null
  )
create table
  estados (
    cve_estados int not null,
    cve_regiones int not null,
    nombre varchar(40) not null
  )
create table
  ciudades (
    cve_ciudades int not null,
    cve_estados int not null,
    nombre varchar(40) not null
  )
create table
  ranchos (
    cve_ranchos int not null,
    cve_ciudades int not null,
    cve_tipos_climas int not null,
    nombre varchar(40) not null
  )
create table
  tipos_climas (cve_tipos_climas int not null, nombre varchar(40))
  -- Crear llaves primarias
alter table ejemplares add constraint pk_ejemplares primary key (cve_ejemplares)
alter table razas add constraint pk_razas primary key (cve_razas)
alter table cuidadores add constraint pk_cuidadores primary key (cve_cuidadores)
alter table secciones add constraint pk_secciones primary key (cve_secciones)
alter table colores add constraint pk_colores primary key (cve_colores)
alter table vacunas add constraint pk_vacunas primary key (cve_vacunas)
alter table vacunas_ejemplares add constraint pk_vacunas_ejemplares primary key (cve_vacunas_ejemplares)
alter table regiones add constraint pk_regiones primary key (cve_regiones)
alter table estados add constraint pk_estados primary key (cve_estados)
alter table ciudades add constraint pk_ciudades primary key (cve_ciudades)
alter table ranchos add constraint pk_ranchos primary key (cve_ranchos)
alter table tipos_climas add constraint pk_tipos_climas primary key (cve_tipos_climas)
-- Crear llaves foraneas
alter table ejemplares add constraint fk_ejemplares_ref_secciones foreign key (cve_secciones) references secciones (cve_secciones)
alter table ejemplares add constraint fk_ejemplares_ref_colores foreign key (cve_colores) references colores (cve_colores)
alter table ejemplares add constraint fk_ejemplares_ref_razas foreign key (cve_razas) references razas (cve_razas)
alter table ejemplares add constraint fk_ejemplares_ref_ejemplares_padre foreign key (cve_ejemplares_padre) references ejemplares (cve_ejemplares)
alter table ejemplares add constraint fk_ejemplares_ref_ejemplares_madre foreign key (cve_ejemplares_madre) references ejemplares (cve_ejemplares)
alter table secciones add constraint fk_secciones_ref_ranchos foreign key (cve_ranchos) references ranchos (cve_ranchos)
alter table secciones add constraint fk_secciones_ref_cuidadores foreign key (cve_cuidadores) references cuidadores (cve_cuidadores)
alter table secciones add constraint fk_secciones_ref_cuidadores_cui foreign key (cui_cve_cuidadores) references cuidadores (cve_cuidadores)
alter table vacunas_ejemplares add constraint fk_vacunas_ejemplares_ref_ejemplares foreign key (cve_ejemplares) references ejemplares (cve_ejemplares)
alter table vacunas_ejemplares add constraint fk_vacunas_ejemplares_ref_vacunas foreign key (cve_vacunas) references vacunas (cve_vacunas)
alter table estados add constraint fk_estados_ref_regiones foreign key (cve_regiones) references regiones (cve_regiones)
alter table ciudades add constraint fk_ciudades_ref_estados foreign key (cve_estados) references estados (cve_estados)
alter table ranchos add constraint fk_ranchos_ref_ciudades foreign key (cve_ciudades) references ciudades (cve_ciudades)
alter table ranchos add constraint fk_ranchos_ref_tipos_climas foreign key (cve_tipos_climas) references tipos_climas (cve_tipos_climas)
-- Hacer modificaciones solo se puede hacer el cambio de tipo de datos
/* alter table ejemplares
alter column costo numeric */
-- Borrar algun campo o constraint
/* alter table ejemplares
drop column costo */
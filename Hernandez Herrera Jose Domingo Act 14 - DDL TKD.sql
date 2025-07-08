USE master;
GO

DROP DATABASE TKD;
GO

CREATE DATABASE TKD;
GO

USE TKD;
GO

-- Crear tablas

CREATE TABLE
alumnos (
  cve_alumnos INT NOT NULL,
  cve_grupos INT NOT NULL,
  cve_grados INT NOT NULL,
  nombre VARCHAR(30) NOT NULL,
  paterno VARCHAR(30) NOT NULL,
  materno VARCHAR(30) NOT NULL,
  direccion VARCHAR(50) NOT NULL,
  telefono VARCHAR(10) NOT NULL,
  matricula VARCHAR(10) NOT NULL,
  numero_chip int,
  CONSTRAINT pk_alumnos PRIMARY KEY (cve_alumnos)
)

CREATE TABLE
grupos (
  cve_grupos INT NOT NULL,
  cve_turnos INT NOT NULL,
  cve_planteles INT NOT NULL,
  nombre VARCHAR(30) NOT NULL,
  CONSTRAINT pk_grupos PRIMARY KEY (cve_grupos)
)

CREATE TABLE
turnos (
  cve_turnos INT NOT NULL,
  nombre VARCHAR(30) NOT NULL,
  CONSTRAINT pk_turnos PRIMARY KEY (cve_turnos)
)

CREATE TABLE
colores (
  cve_colores INT NOT NULL,
  nombre VARCHAR(30) NOT NULL,
  CONSTRAINT pk_colores PRIMARY KEY (cve_colores)
)

CREATE TABLE
grados (
  cve_grados INT NOT NULL,
  cve_colores1 INT NOT NULL,
  cve_colores2 INT NOT NULL,
  nombre VARCHAR(30) NOT NULL,
  CONSTRAINT pk_grados PRIMARY KEY (cve_grados)
)

CREATE TABLE
alumnos_examenes (
  cve_examenes INT NOT NULL,
  cve_alumnos INT NOT NULL,
  cve_grados_actual INT NOT NULL,
  cve_grados_presenta INT NOT NULL,
  asistio BIT NOT NULL,
  aprobado BIT not NULL,
  CONSTRAINT pk_alumnos_examenes PRIMARY KEY (cve_examenes, cve_alumnos)
)

CREATE TABLE
maestros (
  cve_maestros INT NOT NULL,
  cve_turnos INT NOT NULL,
  cve_grados INT NOT NULL,
  cve_grupos INT NOT NULL,
  nombre VARCHAR(30) NOT NULL,
  paterno VARCHAR(30) NOT NULL,
  materno VARCHAR(30) NOT NULL,
  telefono VARCHAR(10) NOT NULL,
  CONSTRAINT pk_maestros PRIMARY KEY (cve_maestros)
)

CREATE TABLE
examenes (
  cve_examenes INT NOT NULL,
  cve_planteles INT NOT NULL,
  cve_maestros INT NOT NULL,
  fecha_hora DATETIME NOT NULL,
  CONSTRAINT pk_examenes PRIMARY KEY (cve_examenes)
)

CREATE TABLE
planteles (
  cve_planteles INT NOT NULL,
  cve_municipios INT NOT NULL,
  nombre VARCHAR(30) NOT NULL,
  CONSTRAINT pk_planteles PRIMARY KEY (cve_planteles)
)

CREATE TABLE
municipios (
  cve_municipios INT NOT NULL,
  nombre VARCHAR(30) NOT NULL,
  CONSTRAINT pk_municipios PRIMARY KEY (cve_municipios)
)

-- Crear llaves foraneas

ALTER TABLE alumnos ADD CONSTRAINT fk_alumnos_ref_grupos FOREIGN KEY (cve_grupos) REFERENCES grupos (cve_grupos)
ALTER TABLE alumnos ADD CONSTRAINT fk_alumnos_ref_grados FOREIGN KEY (cve_grados) REFERENCES grados (cve_grados)
ALTER TABLE grupos ADD CONSTRAINT fk_grupos_ref_turnos FOREIGN KEY (cve_turnos) REFERENCES turnos (cve_turnos)
ALTER TABLE grupos ADD CONSTRAINT fk_grupos_ref_planteles FOREIGN KEY (cve_planteles) REFERENCES planteles (cve_planteles)
ALTER TABLE grados ADD CONSTRAINT fk_grados_ref_colores1 FOREIGN KEY (cve_colores1) REFERENCES colores (cve_colores)
ALTER TABLE grados ADD CONSTRAINT fk_grados_ref_colores2 FOREIGN KEY (cve_colores2) REFERENCES colores (cve_colores)
ALTER TABLE alumnos_examenes ADD CONSTRAINT fk_alumnos_examenes_ref_grados1 FOREIGN KEY (cve_grados_actual) REFERENCES grados (cve_grados)
ALTER TABLE alumnos_examenes ADD CONSTRAINT fk_alumnos_examenes_ref_grados2 FOREIGN KEY (cve_grados_presenta) REFERENCES grados (cve_grados)
ALTER TABLE alumnos_examenes ADD CONSTRAINT fk_alumnos_examenes_ref_examenes FOREIGN KEY (cve_examenes) REFERENCES examenes (cve_examenes)
ALTER TABLE alumnos_examenes ADD CONSTRAINT fk_alumnos_examenes_ref_alumnos FOREIGN KEY (cve_alumnos) REFERENCES alumnos (cve_alumnos)
ALTER TABLE maestros ADD CONSTRAINT fk_maestros_ref_turnos FOREIGN KEY (cve_turnos) REFERENCES turnos (cve_turnos)
ALTER TABLE maestros ADD CONSTRAINT fk_maestros_ref_grados FOREIGN KEY (cve_grados) REFERENCES grados (cve_grados)
ALTER TABLE examenes ADD CONSTRAINT fk_examenes_ref_planteles FOREIGN KEY (cve_planteles) REFERENCES planteles (cve_planteles)
ALTER TABLE examenes ADD CONSTRAINT fk_examenes_ref_maestros FOREIGN KEY (cve_maestros) REFERENCES maestros (cve_maestros)
ALTER TABLE planteles ADD CONSTRAINT fk_planteles_ref_municipios FOREIGN KEY (cve_municipios) REFERENCES municipios (cve_municipios)
USE master;
GO

DROP DATABASE Cancionero;
GO

CREATE DATABASE Cancionero;
GO

USE Cancionero;
GO

-- Crear tablas y llaves primarias

CREATE TABLE
generos (
  cve_generos INT NOT NULL,
  nombre VARCHAR(50) NOT NULL,
  CONSTRAINT pk_generos PRIMARY KEY (cve_generos)
)

CREATE TABLE
canciones (
  cve_canciones INT NOT NULL,
  cve_idiomas INT NOT NULL,
  cve_discos INT NOT NULL,
  nombre VARCHAR(200) NOT NULL,
  duracion INT NOT NULL,
  CONSTRAINT pk_canciones PRIMARY KEY (cve_canciones)
)

CREATE TABLE
discos (
  cve_discos INT NOT NULL,
  cve_disqueras INT NOT NULL,
  cve_artistas INT NOT NULL,
  nombre VARCHAR(60) NOT NULL,
  anho_produccion INT NOT NULL,
  CONSTRAINT pk_discos PRIMARY KEY (cve_discos)
)

CREATE TABLE
artistas (
  cve_artistas INT NOT NULL,
  cve_nacionalidades INT NOT NULL,
  cve_generos INT NOT NULL,
  nombre VARCHAR(40) NOT NULL,
  CONSTRAINT pk_artistas PRIMARY KEY (cve_artistas)
)

CREATE TABLE
idiomas (
  cve_idiomas INT NOT NULL,
  nombre VARCHAR(30) NOT NULL,
  CONSTRAINT pk_idiomas PRIMARY KEY (cve_idiomas)
)

CREATE TABLE
disqueras (
  cve_disqueras INT NOT NULL,
  nombre VARCHAR(100) NOT NULL,
  CONSTRAINT pk_disqueras PRIMARY KEY (cve_disqueras)
)

CREATE TABLE
nacionalidades (
  cve_nacionalidades INT NOT NULL,
  nombre VARCHAR(30) NOT NULL,
  CONSTRAINT pk_nacionalidades PRIMARY KEY (cve_nacionalidades)
)

-- Crear llaves foraneas

ALTER TABLE canciones ADD CONSTRAINT fk_canciones_ref_idiomas FOREIGN KEY (cve_idiomas) REFERENCES idiomas (cve_idiomas)
ALTER TABLE canciones ADD CONSTRAINT fk_canciones_ref_discos FOREIGN KEY (cve_discos) REFERENCES discos (cve_discos)
ALTER TABLE discos ADD CONSTRAINT fk_discos_ref_disqueras FOREIGN KEY (cve_disqueras) REFERENCES disqueras (cve_disqueras)
ALTER TABLE discos ADD CONSTRAINT fk_discos_ref_artistas FOREIGN KEY (cve_artistas) REFERENCES artistas (cve_artistas)
ALTER TABLE artistas ADD CONSTRAINT fk_artistas_ref_nacionalidades FOREIGN KEY (cve_nacionalidades) REFERENCES nacionalidades (cve_nacionalidades)
ALTER TABLE artistas ADD CONSTRAINT fk_artistas_ref_generos FOREIGN KEY (cve_generos) REFERENCES generos (cve_generos)
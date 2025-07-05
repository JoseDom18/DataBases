USE master;
GO

DROP DATABASE Vehiculos;
GO

CREATE DATABASE Vehiculos;
GO

USE Vehiculos;
GO

-- Crear tablas con llaves primarias
/***********************************************************************
 *                             PROCEDENCIAS                            *
 ***********************************************************************/
CREATE TABLE
  procedencias (
    cve_procedencias INT NOT NULL,
    nombre VARCHAR(40) NOT NULL,
    CONSTRAINT pk_procedencias PRIMARY KEY (cve_procedencias)
  )
  /**********************************************************************
   *                             MODELOS                                *
   **********************************************************************/
CREATE TABLE
  modelos (
    cve_modelos INT NOT NULL,
    cve_marcas INT NOT NULL,
    cve_procedencias INT NOT NULL,
    nombre VARCHAR(40) NOT NULL,
    CONSTRAINT pk_modelos PRIMARY KEY (cve_modelos)
  )
  /**********************************************************************
   *                             MARCAS                                 *
   **********************************************************************/
CREATE TABLE
  marcas (
    cve_marcas INT NOT NULL,
    nombre VARCHAR(40),
    CONSTRAINT pk_marcas PRIMARY KEY (cve_marcas)
  )
  /**********************************************************************
   *                             VEHICULOS                              *
   **********************************************************************/
CREATE TABLE
  vehiculos (
    cve_vehiculos INT NOT NULL,
    cve_modelos INT NOT NULL,
    cve_personas INT NOT NULL,
    cve_colores INT NOT NULL,
    placas VARCHAR(9) NOT NULL,
    fecha_fabricacion DATETIME,
    CONSTRAINT pk_vehiculos PRIMARY KEY (cve_vehiculos)
  )
  /**********************************************************************
   *                             COLORES                                *
   **********************************************************************/
CREATE TABLE
  colores (
    cve_colores INT NOT NULL,
    nombre VARCHAR(40) NOT NULL,
    CONSTRAINT pk_colores PRIMARY KEY (cve_colores)
  )
  /**********************************************************************
   *                             ESTADOS                                *
   **********************************************************************/
CREATE TABLE
  estados (
    cve_estados INT NOT NULL,
    nombre VARCHAR(40) NOT NULL,
    letra VARCHAR(1) NOT NULL,
    CONSTRAINT pk_estados PRIMARY KEY (cve_estados)
  )
  /**********************************************************************
   *                             PERSONAS                               *
   **********************************************************************/
CREATE TABLE
  personas (
    cve_personas INT NOT NULL,
    cve_municipios INT NOT NULL,
    cve_estados INT NOT NULL,
    nombre VARCHAR(40) NOT NULL,
    paterno VARCHAR(40) NOT NULL,
    materno VARCHAR(40),
    fecha_nacimiento DATETIME NOT NULL,
    sexo BIT NOT NULL,
    CONSTRAINT pk_personas PRIMARY KEY (cve_personas)
  )
  /**********************************************************************
   *                             Municipios                              *
   **********************************************************************/
CREATE TABLE
  municipios (
    cve_municipios INT NOT NULL,
    cve_estados INT NOT NULL,
    nombre VARCHAR(40) NOT NULL,
    CONSTRAINT pk_municipios PRIMARY KEY (cve_municipios, cve_estados)
  )
  -- Crear llaver foraneas
ALTER TABLE modelos ADD CONSTRAINT fk_modelos_ref_marcas FOREIGN KEY (cve_marcas) REFERENCES marcas (cve_marcas)
ALTER TABLE modelos ADD CONSTRAINT fk_modelos_ref_procedencias FOREIGN KEY (cve_procedencias) REFERENCES procedencias (cve_procedencias)
ALTER TABLE vehiculos ADD CONSTRAINT fk_vehiculos_ref_modelos FOREIGN KEY (cve_modelos) REFERENCES modelos (cve_modelos)
ALTER TABLE vehiculos ADD CONSTRAINT fk_vehiculos_ref_personas FOREIGN KEY (cve_personas) REFERENCES personas (cve_personas)
ALTER TABLE vehiculos ADD CONSTRAINT fk_vehiculos_ref_colores FOREIGN KEY (cve_colores) REFERENCES colores (cve_colores)
ALTER TABLE personas ADD CONSTRAINT fk_personas_ref_municipios FOREIGN KEY (cve_municipios, cve_estados) REFERENCES municipios (cve_municipios, cve_estados)
ALTER TABLE municipios ADD CONSTRAINT fk_municipios_ref_estados FOREIGN KEY (cve_estados) REFERENCES estados (cve_estados)

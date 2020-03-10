-- ----------------------------------------------------
-- sudo docker run -itd --name mydb2 --privileged=true -p 50000:50000 -e LICENSE=accept -e DB2INST1_PASSWORD=password -e DBNAME=elec_db -v /Users/jorgedamianpalacioshristova/Desktop/AvDB/tareAa_1:/database ibmcom/db2
-- docker exec -ti mydb2 bash
-- su - db2inst1
-- 
-- 
--connect to elec_db
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Table ELECCIONES.colegio
-- -----------------------------------------------------
CREATE TABLE colegio (nombre VARCHAR (15), id INT NOT NULL GENERATED ALWAYS AS IDENTITY (START WITH 1 INCREMENT BY 1), PRIMARY KEY (id))

-- -----------------------------------------------------
-- Table ELECCIONES.mesa
-- -----------------------------------------------------
CREATE TABLE mesa(id VARCHAR(3) NOT NULL, votos_nulos INT NULL, votos_vacios INT NULL, colegio_id INT NOT NULL, PRIMARY KEY (id), FOREIGN KEY (colegio_id) REFERENCES colegio(id))

-- -----------------------------------------------------
-- Table ELECCIONES.votante
-- -----------------------------------------------------
CREATE TABLE votante (id VARCHAR(15) NOT NULL, nombre VARCHAR(45) NOT NULL, direccion VARCHAR(100) NOT NULL, fecha_nacimiento DATE NOT NULL, tipo_id CHAR(1) NOT NULL, nacionalidad_mexicana BOOLEAN NOT NULL, fecha_inicio DATE NOT NULL, fecha_fin DATE NOT NULL, PERIOD BUSINESS_TIME(fecha_inicio, fecha_fin), mesa_id VARCHAR(3) NOT NULL, PRIMARY KEY (id), FOREIGN KEY (mesa_id) REFERENCES mesa (id))

-- -----------------------------------------------------
-- Table ELECCIONES.index_periodo_votante Index Of votante
-- -----------------------------------------------------
CREATE UNIQUE INDEX index_periodo_votante ON votante(id, BUSINESS_TIME WITHOUT OVERLAPS)

-- -----------------------------------------------------
-- Table ELECCIONES.miembro
-- -----------------------------------------------------
CREATE TABLE miembro (presidente BOOLEAN NOT NULL, votante_id VARCHAR(15) NOT NULL, FOREIGN KEY (votante_id) REFERENCES votante (id))

-- -----------------------------------------------------
-- Table ELECCIONES.suplente
-- -----------------------------------------------------
CREATE TABLE suplente (votante_id VARCHAR(15) NOT NULL, sustituye_id VARCHAR(15) NOT NULL, FOREIGN KEY (votante_id) REFERENCES votante (id), FOREIGN KEY (sustituye_id) REFERENCES votante (id))

-- -----------------------------------------------------
-- Table ELECCIONES.partido
-- -----------------------------------------------------
CREATE TABLE partido (siglas VARCHAR(5) NOT NULL, nombre VARCHAR(45) NULL, presidente VARCHAR(45) NULL, votante_id_nominal_1 VARCHAR(15) NULL, votante_id_nominal_2 VARCHAR(15) NULL, votante_id_nominal_3 VARCHAR(15) NULL, votante_id_nominal_4 VARCHAR(15) NULL, PRIMARY KEY (siglas), FOREIGN KEY (votante_id_nominal_1) REFERENCES votante (id), FOREIGN KEY (votante_id_nominal_2) REFERENCES votante (id), FOREIGN KEY (votante_id_nominal_3) REFERENCES votante (id), FOREIGN KEY (votante_id_nominal_4) REFERENCES votante (id))

-- -----------------------------------------------------
-- Table ELECCIONES.apoderado
-- -----------------------------------------------------
CREATE TABLE apoderado (ine VARCHAR(15) NOT NULL, nombre VARCHAR(45) NULL, partido_siglas VARCHAR(5) NOT NULL, PRIMARY KEY (ine), FOREIGN KEY (partido_siglas) REFERENCES partido (siglas))

-- -----------------------------------------------------
-- Table ELECCIONES.votacion_municipal
-- -----------------------------------------------------
CREATE TABLE votacion_municipal (mesa_id VARCHAR(3) NOT NULL, partido_siglas VARCHAR(5) NOT NULL, votos INT NOT NULL, fecha DATE NOT NULL, FOREIGN KEY (mesa_id) REFERENCES mesa (id), FOREIGN KEY (partido_siglas) REFERENCES partido (siglas))

-- -----------------------------------------------------
-- Table ELECCIONES.votacion_federal
-- -----------------------------------------------------
CREATE TABLE votacion_federal (mesa_id VARCHAR(3) NOT NULL, partido_siglas VARCHAR(5) NOT NULL, votos INT NULL, fecha DATE NULL, FOREIGN KEY (mesa_id) REFERENCES mesa (id), FOREIGN KEY (partido_siglas) REFERENCES partido (siglas))








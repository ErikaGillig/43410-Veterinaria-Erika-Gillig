-- Crear base de datos si no existe
CREATE DATABASE IF NOT EXISTS veterinaria;

-- Usar la base de datos
USE veterinaria;

-- Creacion de tabla cliente
CREATE TABLE IF NOT EXISTS cliente (
  id_cliente INT NOT NULL AUTO_INCREMENT,
  nombre VARCHAR(50) NOT NULL,
  apellido VARCHAR(100) NOT NULL,
  dni VARCHAR(50) NOT NULL,
  telefono VARCHAR(50) NOT NULL,
  PRIMARY KEY (id_cliente)
) ENGINE = InnoDB,
  AUTO_INCREMENT = 17,
  DEFAULT CHARACTER SET utf8mb4,
  COLLATE utf8mb4_0900_ai_ci;

-- Creacion de tabla mascota
CREATE TABLE IF NOT EXISTS mascota (
  id_mascota INT NOT NULL AUTO_INCREMENT,
  nombre VARCHAR(50) NOT NULL,
  especie VARCHAR(100) NOT NULL,
  peso INT NOT NULL,
  id_cliente INT NOT NULL,
  sexo VARCHAR(50) NOT NULL,
  PRIMARY KEY (id_mascota)
) ENGINE = InnoDB,
  AUTO_INCREMENT = 43,
  DEFAULT CHARACTER SET utf8mb4,
  COLLATE utf8mb4_0900_ai_ci;

-- Creacion de tabla veterinario
CREATE TABLE IF NOT EXISTS veterinario (
  id_veterinario INT NOT NULL AUTO_INCREMENT,
  nombre VARCHAR(50) NOT NULL,
  Apellido VARCHAR(1000) NOT NULL,
  especialidad VARCHAR(50) NULL DEFAULT NULL,
  PRIMARY KEY (id_veterinario)
) ENGINE = InnoDB,
  AUTO_INCREMENT = 20,
  DEFAULT CHARACTER SET utf8mb4,
  COLLATE utf8mb4_0900_ai_ci;

-- Creacion de tabla consulta
CREATE TABLE IF NOT EXISTS consulta (
  id_consulta INT NOT NULL AUTO_INCREMENT,
  horario TIME NOT NULL,
  observaciones VARCHAR(1000) NULL DEFAULT NULL,
  id_mascota INT NULL DEFAULT NULL,
  id_veterinario INT NULL DEFAULT NULL,
  fecha DATE NOT NULL,
  PRIMARY KEY (id_consulta)
) ENGINE = InnoDB,
  AUTO_INCREMENT = 66,
  DEFAULT CHARACTER SET utf8mb4,
  COLLATE utf8mb4_0900_ai_ci;

-- Creacion de tabla Historia clinica
CREATE TABLE IF NOT EXISTS historiaclinica (
  id_hc INT NOT NULL AUTO_INCREMENT,
  observaciones TEXT NOT NULL,
  id_consulta INT NOT NULL,
  id_veterinario INT NOT NULL,
  PRIMARY KEY (id_hc)
) ENGINE = InnoDB,
  AUTO_INCREMENT = 23,
  DEFAULT CHARACTER SET utf8mb4,
  COLLATE utf8mb4_0900_ai_ci;

-- Creacion de tabla intervencion quirurgica
CREATE TABLE IF NOT EXISTS intervencionquirurgica (
  id_iq INT NOT NULL AUTO_INCREMENT,
  operacion VARCHAR(100) NOT NULL,
  observaciones VARCHAR(1000) NOT NULL,
  id_hc INT NOT NULL,
  id_mascota INT NOT NULL,
  PRIMARY KEY (id_iq)
) ENGINE = InnoDB,
  AUTO_INCREMENT = 5,
  DEFAULT CHARACTER SET utf8mb4,
  COLLATE utf8mb4_0900_ai_ci;

-- Creacion de tabla Tratamiento
CREATE TABLE IF NOT EXISTS tratamiento (
  id_tratamiento INT NOT NULL AUTO_INCREMENT,
  tratamiento VARCHAR(100) NOT NULL,
  observaciones VARCHAR(1000) NOT NULL,
  id_hc INT NOT NULL,
  dosis DECIMAL(10,2) NOT NULL DEFAULT '1.00',
  PRIMARY KEY (id_tratamiento)
) ENGINE = InnoDB,
  DEFAULT CHARACTER SET utf8mb4,
  COLLATE utf8mb4_0900_ai_ci,
  AUTO_INCREMENT = 12;

-- Creacion de tabla calendario de vacunas
CREATE TABLE IF NOT EXISTS calendariodevacunas (
  id_cdv INT NOT NULL AUTO_INCREMENT,
  farmaco VARCHAR(100) NOT NULL,
  dosis FLOAT NOT NULL,
  id_mascota INT NOT NULL,
  id_hc INT NOT NULL,
  PRIMARY KEY (id_cdv)
) ENGINE = InnoDB,
  AUTO_INCREMENT = 5,
  DEFAULT CHARACTER SET utf8mb4,
  COLLATE utf8mb4_0900_ai_ci;

-- Creacion de tabla cliente_mascota
CREATE TABLE IF NOT EXISTS cliente_mascota (
  id_cliente INT NULL DEFAULT NULL,
  id_mascota INT NULL DEFAULT NULL
) ENGINE = InnoDB,
  DEFAULT CHARACTER SET utf8mb4,
  COLLATE utf8mb4_0900_ai_ci;

-- Creacion de LOG Veterinario
CREATE TABLE IF NOT EXISTS log_veterinario (
  log_id INT NOT NULL AUTO_INCREMENT,
  fecha_hora DATETIME NULL DEFAULT NULL,
  veterinario_id INT NULL DEFAULT NULL,
  accion_realizada VARCHAR(50) NULL DEFAULT NULL,
  detalles VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (log_id)
) ENGINE = InnoDB,
  DEFAULT CHARACTER SET utf8mb4,
  COLLATE utf8mb4_0900_ai_ci;

-- Creacion de LOG historia clinica (actualizacion de datos)
CREATE TABLE IF NOT EXISTS log_historiaclinica (
  log_id INT NOT NULL AUTO_INCREMENT,
  historia_id INT NULL DEFAULT NULL,
  fecha_hora DATETIME NULL DEFAULT NULL,
  veterinario_id INT NULL DEFAULT NULL,
  accion_realizada VARCHAR(50) NULL DEFAULT NULL,
  detalles VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (log_id)
) ENGINE = InnoDB,
  AUTO_INCREMENT = 6,
  DEFAULT CHARACTER SET utf8mb4,
  COLLATE utf8mb4_0900_ai_ci;

-- Agregar restricciones de clave foránea a la tabla consulta
ALTER TABLE consulta
ADD CONSTRAINT FK_Consulta_Mascota
FOREIGN KEY (id_mascota) REFERENCES mascota (id_mascota),
ADD CONSTRAINT FK_Consulta_Veterinario
FOREIGN KEY (id_veterinario) REFERENCES veterinario (id_veterinario);

-- Agregar restricciones de clave foránea a la tabla tratamiento
ALTER TABLE tratamiento
ADD CONSTRAINT FK_Tratamiento_HistoriaClinica
FOREIGN KEY (id_hc) REFERENCES historiaclinica (id_hc);

-- Agregar restricciones de clave foránea a la tabla calendariodevacunas
ALTER TABLE calendariodevacunas
ADD CONSTRAINT FK_CalendarioDeVacunas_HistoriaClinica
FOREIGN KEY (id_hc) REFERENCES historiaclinica (id_hc),
ADD CONSTRAINT FK_CalendarioDeVacunas_Mascota
FOREIGN KEY (id_mascota) REFERENCES mascota (id_mascota);

-- Agregar restricciones de clave foránea a la tabla intervencionquirurgica
ALTER TABLE intervencionquirurgica
ADD CONSTRAINT FK_IntervencionQuirurgica_HistoriaClinica
FOREIGN KEY (id_hc) REFERENCES historiaclinica (id_hc),
ADD CONSTRAINT FK_IntervencionQuirurgica_Mascota
FOREIGN KEY (id_mascota) REFERENCES mascota (id_mascota);

-- Agregar restricciones de clave foránea a la tabla log_veterinario
ALTER TABLE log_veterinario
ADD CONSTRAINT FK_LogVeterinario_Veterinario
FOREIGN KEY (veterinario_id) REFERENCES veterinario (id_veterinario);

-- Agregar restricciones de clave foránea a la tabla log_historiaclinica
ALTER TABLE log_historiaclinica
ADD CONSTRAINT FK_LogHistoriaClinica_HistoriaClinica
FOREIGN KEY (historia_id) REFERENCES historiaclinica (id_hc),
ADD CONSTRAINT FK_LogHistoriaClinica_Veterinario
FOREIGN KEY (veterinario_id) REFERENCES veterinario (id_veterinario);

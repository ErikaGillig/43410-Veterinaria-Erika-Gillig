USE veterinaria;
-- Creacion de usuario y contraseña
CREATE USER CoderHouse IDENTIFIED BY '456';
CREATE USER ClinicaVeterinaria IDENTIFIED BY '1234';

-- Permisos de solo lectura para el usuario CoderHouse
GRANT SELECT ON veterinaria.* TO CoderHouse;

-- Para subir los cambio correctamente
FLUSH PRIVILEGES;

-- Permisos de Creacion y actualizacion para el Usuario ClinicaVeterinaria
GRANT SELECT, INSERT, UPDATE ON veterinaria.* TO ClinicaVeterinaria;
 
 -- Comando para revocar permisos de eliminacion
 REVOKE DELETE ON veterinaria.* FROM ClinicaVeterinaria;

INSERT INTO historiaclinica (observaciones, id_consulta, id_veterinario) VALUES ('sarasasasasa', 5, 2 );


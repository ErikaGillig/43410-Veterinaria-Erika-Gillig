USE veterinaria;
SELECT * FROM historiaclinica;

-- Eliminacion de registros de la tabla Historia clinica
START TRANSACTION;
DELETE FROM historiaclinica WHERE id_hc IN (20, 21, 22);
ROLLBACK;
COMMIT;

Select * from consulta

-- Insertar los 8 registros en la tabla "consultas"
START TRANSACTION;

-- Insertar los 8 registros en la tabla "consulta"
INSERT INTO consulta (horario, observaciones, id_mascota, id_veterinario, fecha) VALUES ('09:00', 'Consulta de rutina', 1, 2, '2023-07-05');
INSERT INTO consulta (horario, observaciones, id_mascota, id_veterinario, fecha) VALUES ('10:30', 'Dolor abdominal', 2, 2, '2023-07-06');
INSERT INTO consulta (horario, observaciones, id_mascota, id_veterinario, fecha) VALUES ('14:15', 'Vacunación anual', 3, 2, '2023-07-07');
INSERT INTO consulta (horario, observaciones, id_mascota, id_veterinario, fecha) VALUES ('16:45', 'Corte de uñas', 4, 3, '2023-07-08');
SAVEPOINT savepoint_1;
INSERT INTO consulta (horario, observaciones, id_mascota, id_veterinario, fecha) VALUES ('11:00', 'Examen de sangre', 5, 1, '2023-07-09');
INSERT INTO consulta (horario, observaciones, id_mascota, id_veterinario, fecha) VALUES ('13:30', 'Cambio de vendajes', 6, 2, '2023-07-10');
INSERT INTO consulta (horario, observaciones, id_mascota, id_veterinario, fecha) VALUES ('15:45', 'Consulta de control', 7, 3, '2023-07-11');
SAVEPOINT savepoint_2;

-- Obtener el mínimo id_consulta de los registros insertados antes del primer SAVEPOINT
SET @first_id_consulta := (SELECT MIN(id_consulta) FROM consulta WHERE id_consulta < (SELECT MIN(id_consulta) FROM consulta WHERE id_consulta >= LAST_INSERT_ID()));

-- Eliminar los registros insertados antes del primer SAVEPOINT
DELETE FROM consulta WHERE id_consulta < @first_id_consulta;

COMMIT;



USE veterinaria;
DROP PROCEDURE IF EXISTS OrdenarTabla;

DELIMITER //

CREATE PROCEDURE OrdenarTabla(
    IN p_id_mascota INT,
    IN campo_ordenamiento VARCHAR(20),
    IN ordenamiento VARCHAR(5)
)
BEGIN
    SET @sql = CONCAT('SELECT * FROM consulta WHERE id_mascota = ', p_id_mascota, ' ORDER BY ', campo_ordenamiento, ' ', ordenamiento);

    PREPARE stmt FROM @sql;
    EXECUTE stmt;
    DEALLOCATE PREPARE stmt;
END //

DELIMITER ;


select * from consulta ;
SHOW COLUMNS FROM consulta;

-- En este procedimiento solicito una insercion de datos del registro a la tabla consultas. Pero tengo problemas con el id_consulta. El mismo fue revisado y esta colocado como PK y Autoincremental a la vez
DELIMITER //

CREATE PROCEDURE InsertarConsulta(
    IN p_horario TIME,
    IN p_observaciones VARCHAR(1000),
    IN p_id_mascota INT,
    IN p_id_veterinario INT,
    IN p_fecha DATE,
    OUT p_id_consulta INT
)
BEGIN
    INSERT INTO consulta (horario, observaciones, id_mascota, id_veterinario, fecha)
    VALUES (p_horario, p_observaciones, p_id_mascota, p_id_veterinario, p_fecha);

    SET p_id_consulta = LAST_INSERT_ID();
END //

DELIMITER ;


CALL InsertarConsulta('19:30:00', 'Sin cambios alarmantes en el paciente', 1, 2, '2023-06-19', @id_consulta);
SELECT @id_consulta;

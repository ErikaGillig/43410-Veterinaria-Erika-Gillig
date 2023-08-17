USE veterinaria;

-- Este trigger es creado para la actualizacion de la tabla de historias clinicas
DROP TRIGGER IF EXISTS tr_HistoriaClinica_AfterUpdate;
DELIMITER //
CREATE TRIGGER tr_HistoriaClinica_AfterUpdate
AFTER UPDATE ON historiaclinica
FOR EACH ROW
BEGIN
    INSERT INTO log_historiaclinica (historia_id, fecha_hora, veterinario_id, accion_realizada, detalles)
    VALUES (NEW.id_hc, NOW(), NEW.id_veterinario, 'actualizar', CONCAT('Se actualizó la historia clínica por el veterinario ', NEW.id_veterinario, ' a las ', NOW()));
    -- Insertar registro en caso de creación
    IF NEW.observaciones = 'creado' THEN
        INSERT INTO log_historiaclinica (historia_id, fecha_hora, veterinario_id, accion_realizada, detalles)
        VALUES (NEW.id_hc, NOW(), NEW.id_veterinario, 'crear', CONCAT('Se creó la historia clínica por el veterinario ', NEW.id_veterinario, ' a las ', NOW()));
    END IF;

    -- Insertar registro en caso de eliminación
    IF NEW.observaciones = 'eliminado' THEN
        INSERT INTO log_historiaclinica (historia_id, fecha_hora, veterinario_id, accion_realizada, detalles)
        VALUES (NEW.id_hc, NOW(), NEW.id_veterinario, 'eliminar', CONCAT('Se eliminó la historia clínica por el veterinario ', NEW.id_veterinario, ' a las ', NOW()));
    END IF;
END; //
DELIMITER ;

-- Repite el mismo proceso para los otros triggers modificando los nombres.

-- Este trigger es creado para la actualizacion de la tabla de veterinarios
DROP TRIGGER IF EXISTS tr_Veterinario_AfterInsert;
DELIMITER //
CREATE TRIGGER tr_Veterinario_AfterInsert
AFTER INSERT ON veterinario
FOR EACH ROW
BEGIN
    INSERT INTO log_veterinario (fecha_hora, veterinario_id, accion_realizada, detalles)
    VALUES (NOW(), NEW.id_veterinario, 'crear', CONCAT('Se creó un nuevo veterinario por el veterinario ', NEW.id_veterinario, ' a las ', NOW()));
END; //
DELIMITER ;

-- Este trigger es creado para la actualización de la tabla de veterinarios
DROP TRIGGER IF EXISTS tr_Veterinario_AfterUpdate;
DELIMITER //
CREATE TRIGGER tr_Veterinario_AfterUpdate
AFTER UPDATE ON veterinario
FOR EACH ROW
BEGIN
    -- Verificar si se cambió el nombre del veterinario
    IF NEW.nombre != OLD.nombre THEN
        INSERT INTO log_veterinario (fecha_hora, veterinario_id, accion_realizada, detalles)
        VALUES (NOW(), NEW.id_veterinario, 'actualizar', CONCAT('Se cambió el nombre del veterinario de "', OLD.nombre, '" a "', NEW.nombre, '" por el veterinario ', NEW.id_veterinario, ' a las ', NOW()));
    END IF;

    -- Verificar si se cambió la especialidad del veterinario
    IF NEW.especialidad != OLD.especialidad THEN
        INSERT INTO log_veterinario (fecha_hora, veterinario_id, accion_realizada, detalles)
        VALUES (NOW(), NEW.id_veterinario, 'actualizar', CONCAT('Se cambió la especialidad del veterinario de "', OLD.especialidad, '" a "', NEW.especialidad, '" por el veterinario ', NEW.id_veterinario, ' a las ', NOW()));
    END IF;

    -- Agregar más IFs para otras columnas que desees rastrear en el log.

END; //
DELIMITER ;






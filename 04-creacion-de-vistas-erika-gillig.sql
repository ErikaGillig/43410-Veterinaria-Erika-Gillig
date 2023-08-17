USE veterinaria;

-- Mostrar el id consulta con el nombre del cliente , de la mascota y el veterinario  

CREATE OR REPLACE VIEW VW_idconsulta_nombres AS
	SELECT con.id_consulta , c.nombre AS nombre_cliente, m.nombre AS nombre_mascota, v.nombre AS nombre_veterinario
	FROM cliente AS c
	JOIN mascota AS m ON c.id_cliente = m.id_cliente
	JOIN consulta AS con ON con.id_mascota=m.id_mascota 
	JOIN veterinario AS v ON  v.id_veterinario  =  con.id_veterinario;

CREATE OR REPLACE VIEW VW_idconsulta_nombres_2 AS
	SELECT con.id_consulta , c.nombre AS nombre_cliente, m.nombre AS nombre_mascota, v.nombre AS nombre_veterinario
	FROM consulta AS con
	JOIN mascota AS m ON m.id_mascota = con.id_mascota
	JOIN cliente AS c ON m.id_cliente= c.id_cliente
	JOIN veterinario AS v ON  v.id_veterinario  =  con.id_veterinario;
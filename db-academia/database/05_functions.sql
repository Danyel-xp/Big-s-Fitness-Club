CREATE FUNCTION listarNomeCliente()
RETURNS VARCHAR(1000)
READS SQL DATA
BEGIN
    DECLARE resultado VARCHAR(1000);

    SELECT GROUP_CONCAT(nomeC ORDER BY nomeC ASC SEPARATOR '\n ')
    INTO resultado
    FROM tb_cliente;

    RETURN resultado;
END

SELECT listarNomeCliente() AS 'CLIENTES';
DROP FUNCTION funcionarioCargo;

CREATE FUNCTION clienteId(pessoa_id INT)
RETURNS VARCHAR(1000)
READS SQL DATA
BEGIN
    DECLARE resultado VARCHAR(1000);

    SELECT GROUP_CONCAT(nomeC , '  |  ' , cpfC , '  |  ' , foneC , '  |  ' , email )
    INTO resultado
    FROM tb_cliente
    WHERE id_cliente = pessoa_id;

    RETURN resultado;
END

SELECT clienteId(1) AS 'CLINTE';


CREATE FUNCTION funcionarioCargo(cargo_fun VARCHAR(50))
RETURNS VARCHAR(1000)
READS SQL DATA
BEGIN
    DECLARE resultado VARCHAR(1000);

    SELECT GROUP_CONCAT(nomeF ORDER BY nomeF ASC SEPARATOR '\n' )
    INTO resultado
    FROM tb_funcionario
    WHERE cargo = cargo_fun;

    RETURN resultado;
END

SELECT funcionarioCargo('Instrutor');

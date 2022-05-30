SET SQL_SAFE_UPDATES = 0;
#SELECT * FROM financeiro_op WHERE descricao = 'EVENTOS/ SINISTROS CONHECIDOS OU AVISADOS  DE ASSISTÊNCIA A SAÚDE MEDICO HOSPITALAR';

#SELECT * FROM financeiro_op;

UPDATE financeiro_op SET saldo_final = 
	CONVERT(REPLACE(SUBSTRING_INDEX(saldo_final, '"', 1), ',', '.'), DECIMAL(18,2));

SELECT DISTINCT infos_op.registro, infos_op.razao_social, financeiro_op.descricao, financeiro_op.saldo_final 
	FROM financeiro_op
	INNER JOIN financeiro_op 
    ON infos_op.registro = financeiro_op.registro
	WHERE financeiro_op.data_financeiro LIKE '2021-10-01' AND financeiro_op.descricao = 'EVENTOS/ SINISTROS CONHECIDOS OU AVISADOS  DE ASSISTÃŠNCIA A SAÃšDE MEDICO HOSPITALAR '
	ORDER BY financeiro_op.saldo_final DESC 
    LIMIT 10;

SELECT DISTINCT registro, data_financeiro, descricao, saldo_final FROM financeiro_op 
	WHERE data_financeiro LIKE '2021-10-01' AND descricao = 'EVENTOS/ SINISTROS CONHECIDOS OU AVISADOS  DE ASSISTÃŠNCIA A SAÃšDE MEDICO HOSPITALAR '
	ORDER BY saldo_final DESC 
    LIMIT 10;

#EVENTOS/ SINISTROS CONHECIDOS OU AVISADOS  DE ASSISTÊNCIA A SAÚDE MEDICO HOSPITALAR
#SELECT registro from financeiro_op WHERE descricao = 'EVENTOS%';
#CAST(REPLACE(CAST(saldo_final AS CHAR), '.', ',') AS DECIMAL(18,2));
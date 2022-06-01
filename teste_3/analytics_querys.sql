#  as 10 operadoras que mais tiveram despesas com "EVENTOS/ SINISTROS CONHECIDOS OU AVISADOS  DE ASSISTÊNCIA A SAÚDE MEDICO HOSPITALAR" no último trimestre
SELECT DISTINCT infos_op.registro, infos_op.razao_social, financeiro_op.descricao, financeiro_op.saldo_final 
	FROM infos_op
	INNER JOIN financeiro_op 
    ON financeiro_op.registro = infos_op.registro
	WHERE financeiro_op.data_financeiro LIKE '2021-10-01' AND financeiro_op.descricao = 'EVENTOS/ SINISTROS CONHECIDOS OU AVISADOS  DE ASSISTÃŠNCIA A SAÃšDE MEDICO HOSPITALAR '
	ORDER BY financeiro_op.saldo_final DESC 
    LIMIT 10;

#as 10 operadoras que mais tiveram despesas com "EVENTOS/ SINISTROS CONHECIDOS OU AVISADOS  DE ASSISTÊNCIA A SAÚDE MEDICO HOSPITALAR" no último ano
SELECT DISTINCT infos_op.registro, infos_op.razao_social, financeiro_op.descricao, financeiro_op.saldo_final 
	FROM infos_op
	INNER JOIN financeiro_op 
    ON financeiro_op.registro = infos_op.registro
	WHERE financeiro_op.data_financeiro BETWEEN '2020-01-01'  AND '2020-12-31' AND financeiro_op.descricao = 'EVENTOS/ SINISTROS CONHECIDOS OU AVISADOS  DE ASSISTÃŠNCIA A SAÃšDE MEDICO HOSPITALAR '
	ORDER BY financeiro_op.saldo_final DESC 
    LIMIT 10;
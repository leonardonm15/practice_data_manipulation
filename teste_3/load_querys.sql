USE relatorios;
SET SQL_SAFE_UPDATES = 0;
SET GLOBAL local_infile=1; # enables the LOCAL data import

# general querys for loading data from CSV´S
LOAD DATA LOCAL INFILE 'C:/data/Relatorio_cadop teste 3.csv' # gets the data from the path
INTO TABLE infos_op  CHARACTER SET LATIN1 FIELDS TERMINATED BY ';' # insert into the table info_op, set the enconding and the character the determinates the end of a field
ENCLOSED BY '"' LINES TERMINATED BY '\n' IGNORE 3 LINES; #enclosed by means that the information inside the fields must be inside "" and the row ends every time we have a linebreak, and we are ignoring the first 3 lines of the file

LOAD DATA LOCAL INFILE 'C:/data/2020/1T2020.csv'
INTO TABLE financeiro_op CHARACTER SET LATIN1 
FIELDS TERMINATED BY ';'
ENCLOSED BY '"' LINES TERMINATED BY '\r\n'
IGNORE 1 LINES 
(@var1, @var2, @var3, @var4, @var5) SET 
data_financeiro = @var1, registro = @var2, conta_contabil = @var3, descricao = @var4, saldo_final = REPLACE(@var5, ',', '.'); # changing the float point to american standard before it goes to the its place as a decimal

LOAD DATA LOCAL INFILE 'C:/data/2020/2T2020.csv'
INTO TABLE financeiro_op CHARACTER SET LATIN1 
FIELDS TERMINATED BY ';'
ENCLOSED BY '"' LINES TERMINATED BY '\r\n'
IGNORE 1 LINES 
(@var1, @var2, @var3, @var4, @var5) SET 
data_financeiro = @var1, registro = @var2, conta_contabil = @var3, descricao = @var4, saldo_final = REPLACE(@var5, ',', '.');

LOAD DATA LOCAL INFILE 'C:/data/2020/3T2020.csv'
INTO TABLE financeiro_op CHARACTER SET LATIN1 
FIELDS TERMINATED BY ';'
ENCLOSED BY '"' LINES TERMINATED BY '\r\n'
IGNORE 1 LINES 
(@var1, @var2, @var3, @var4, @var5) SET 
data_financeiro = @var1, registro = @var2, conta_contabil = @var3, descricao = @var4, saldo_final = REPLACE(@var5, ',', '.');

LOAD DATA LOCAL INFILE 'C:/data/2020/4T2020.csv'
INTO TABLE financeiro_op CHARACTER SET LATIN1 
FIELDS TERMINATED BY ';'
ENCLOSED BY '"' LINES TERMINATED BY '\r\n'
IGNORE 1 LINES 
(@var1, @var2, @var3, @var4, @var5) SET 
data_financeiro = @var1, registro = @var2, conta_contabil = @var3, descricao = @var4, saldo_final = REPLACE(@var5, ',', '.');

LOAD DATA LOCAL INFILE 'C:/data/2021/1T2021.csv'
INTO TABLE financeiro_op CHARACTER SET LATIN1 
FIELDS TERMINATED BY ';'
ENCLOSED BY '"' LINES TERMINATED BY '\r\n'
IGNORE 1 LINES 
(@var1, @var2, @var3, @var4, @var5) SET 
data_financeiro = @var1, registro = @var2, conta_contabil = @var3, descricao = @var4, saldo_final = REPLACE(@var5, ',', '.');

LOAD DATA LOCAL INFILE 'C:/data/2021/2T2021.csv'
INTO TABLE financeiro_op CHARACTER SET LATIN1 
FIELDS TERMINATED BY ';'
ENCLOSED BY '"' LINES TERMINATED BY '\r\n'
IGNORE 1 LINES 
(@var1, @var2, @var3, @var4, @var5) SET 
data_financeiro = @var1, registro = @var2, conta_contabil = @var3, descricao = @var4, saldo_final = REPLACE(@var5, ',', '.');

LOAD DATA LOCAL INFILE 'C:/data/2021/3T2021.csv'
INTO TABLE financeiro_op CHARACTER SET LATIN1 
FIELDS TERMINATED BY ';'
ENCLOSED BY '"' LINES TERMINATED BY '\r\n'
IGNORE 1 LINES 
(@var1, @var2, @var3, @var4, @var5) SET 
data_financeiro = @var1, registro = @var2, conta_contabil = @var3, descricao = @var4, saldo_final = REPLACE(@var5, ',', '.');

LOAD DATA LOCAL INFILE 'C:/data/2021/4T2021.csv'
INTO TABLE financeiro_op CHARACTER SET LATIN1 
FIELDS TERMINATED BY ';'
ENCLOSED BY '"' LINES TERMINATED BY '\r\n'
IGNORE 1 LINES 
(@var1, @var2, @var3, @var4, @var5) SET 
data_financeiro = @var1, registro = @var2, conta_contabil = @var3, descricao = @var4, saldo_final = REPLACE(@var5, ',', '.');

# changing the date pattern to fit the SQL standards
UPDATE infos_op SET data_registro =
    DATE_FORMAT(STR_TO_DATE(data_registro, '%d/%m/%Y'), '%Y-%m-%d') 
WHERE data_registro LIKE '__/__/____';

UPDATE financeiro_op SET data_financeiro =
    DATE_FORMAT(STR_TO_DATE(data_financeiro, '%d/%m/%Y'), '%Y-%m-%d') 
WHERE data_financeiro LIKE '__/__/____';
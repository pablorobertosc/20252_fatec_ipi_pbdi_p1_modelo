-- ----------------------------------------------------------------
-- 1 Base de dados e criação de tabela
--escreva a sua solução aqui
-- Criar a tabela resultados_paises se não existir
CREATE TABLE IF NOT EXISTS resultados_paises(
   wine_id SERIAL PRIMARY KEY,
   csv_index INT,
   country VARCHAR(100),
   description TEXT,
   designation VARCHAR(255),
   points INT,
   price NUMERIC(10,2),
   province VARCHAR(100),
   region_1 VARCHAR(100),
   region_2 VARCHAR(100),
   taster_name VARCHAR(100),
   taster_twitter_handle VARCHAR(100),
   title TEXT,
   variety VARCHAR(100),
   winery VARCHAR(200)
);



-- ----------------------------------------------------------------
-- 2 Cursor não vinculado (cálculo de preço médio)
--escreva a sua solução aqui


-- ----------------------------------------------------------------
-- 3 Cursor vinculado (Descrição mais longa)
--escreva a sua solução aqui


-- ----------------------------------------------------------------
-- 4 Armazenamento dos resultados
--escreva a sua solução aqui


-- ----------------------------------------------------------------
-- 5 Exportação dos dados
--escreva a sua solução aqui

-- ----------------------------------------------------------------
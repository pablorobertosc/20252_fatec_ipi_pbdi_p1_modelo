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
DO $$
DECLARE
   
    cur_preco_medio REFCURSOR;
    
  
    v_country VARCHAR(100);
    v_preco_medio NUMERIC(10,2);
    
BEGIN
    
    OPEN cur_preco_medio FOR
        SELECT 
            country,
            AVG(price) AS preco_medio
        FROM 
            resultados_paises
        WHERE 
            price IS NOT NULL
            AND country IS NOT NULL
        GROUP BY 
            country
        ORDER BY 
            country;
    
    RAISE NOTICE 'Preço médio por país:';
    RAISE NOTICE '=====================';
        
    LOOP
        FETCH cur_preco_medio INTO v_country, v_preco_medio;
        EXIT WHEN NOT FOUND;
        
        RAISE NOTICE 'País: % | Preço Médio: R$ %', v_country, ROUND(v_preco_medio, 2);
    END LOOP;
    
    CLOSE cur_preco_medio;
END;
$$;

-- ----------------------------------------------------------------
-- 3 Cursor vinculado (Descrição mais longa)
--escreva a sua solução aqui

DO 
$$ 
DECLARE
    country VARCHAR(200);
    description VARCHAR(500);  
    longest_description VARCHAR(500);  
    max_length INTEGER := 0;  
    current_length INTEGER;  
    
    CURSOR wine_cursor IS
        SELECT country, description
        FROM resultados_paises
        ORDER BY country, LENGTH(description) DESC; 
BEGIN
    
    OPEN wine_cursor;

    
    LOOP
        FETCH wine_cursor INTO country, description;
        EXIT WHEN NOT FOUND;

        current_length := LENGTH(description);

        IF current_length > max_length THEN
            longest_description := description;
            max_length := current_length;
        END IF;

        IF NOT FOUND OR country <> country THEN
            RAISE NOTICE 'A descrição mais longa dos vinhos no país % é: %', country, longest_description;
            longest_description := description;
            max_length := current_length;
        END IF;

    END LOOP;

    RAISE NOTICE 'A descrição mais longa dos vinhos no país % é: %', country, longest_description;

    CLOSE wine_cursor;
END 
$$;
-- ----------------------------------------------------------------
-- 4 Armazenamento dos resultados
--escreva a sua solução aqui


-- ----------------------------------------------------------------
-- 5 Exportação dos dados
--escreva a sua solução aqui

-- ----------------------------------------------------------------
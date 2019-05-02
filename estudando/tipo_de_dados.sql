-- comando para criar um esquema:

CREATE SCHEMA nome_esquema;

-- comando para criar uma tabela:

CREATE TABLE nome_tabela:

-- tipos de dados em sql:

-- criar seu tipo de dado:

CREATE TYPE nome_tipo AS ENUM (opcao1, opcao2,..., opcaon);

-- tipos de dados: String 

--                     DESCRIÇÃO:                                       TAMANHO MÁXIMO:                 TAMANHO EM BYTES:
char(n)	            -- Tamanho fixo, completado com espaços em bracos	8,000 caracteres	            Tamanho Definido
varchar(n)	        -- Tamanho variável com limite	                    8,000 caracteres	            2 bytes + número de caracteres
varchar(max)	    -- Tamanho variável com limite	                    1,073,741,824 caracteres	    2 bytes + número de caracteres
text	            -- Tamanho variável	                                2GB de dados (texto)	        4 bytes + número de caracteres
nchar	            -- Tamanho fixo com espaços em bracos	            4,000 caracteres	            Tamanho definido x 2
nvarchar	        -- Tamanho variável	                                4,000 caracteres	 
nvarchar(max)	    -- Tamanho variável	                                536,870,912 caracteres	 
ntext	            -- Tamanho variável	                                2GB de texto	 
binary(n)	        -- Tamanho fixo (binário)	                        8,000 bytes	 
varbinary	        -- Tamanho variável (binário)	                    8,000 bytes	 
varbinary(max)	    -- Tamanho variável (binário)	                    2GB	 
image	            -- Tamanho variável (binário)	                    2GB	 

-- tipos de dados: NUMERICOS

-- Tipo de Dado	    Descrição	                                                                        Tamanho (bytes)
bit	                -- Número Inteiro que pode ser 0, 1 ou NULL	 
tinyint	            -- Permite números inteiros de 0 a 255	                                            1 byte
smallint	        -- Permite números inteiros entre -32,768 e 32,767	                                2 bytes
int	                -- Permite números inteiros entre -2,147,483,648 e 2,147,483,647	                4 bytes
bigint	            -- Permite números inteiros entre -9,223,372,036,854,775,808 e                      8 bytes
                    -- 9,223,372,036,854,775,807


decimal(p,s)	    -- Precisão de número flutuante e número de escala.                                 5-17 bytes
                    -- Permite número de -10^38 +1 a 10^38 –1.
                    -- O parâmetro p indica o número total máximo de dígitos que podem ser ~
                    -- armazenados (ambos à esquerda e à direita do ponto decimal). p deve ser um ~
                    -- valor de 1 a 38. O padrão é 18.
                    -- O parâmetro s indica o número máximo de dígitos armazenados à direita do ~
                    -- ponto decimal. s deve ser um valor de 0 a p. O valor padrão é 0.


numeric(p,s)	    -- Precisão de número flutuante e número de escala.                                 5-17 bytes
                    -- Permite número de -10^38 +1 a 10^38 –1.
                    -- O parâmetro p indica o número total máximo de dígitos que podem ser ~
                    -- armazenados (ambos à esquerda e à direita do ponto decimal). p deve ~
                    -- ser um valor de 1 a 38. O padrão é 18.
                    -- O parâmetro s indica o número máximo de dígitos armazenados à direita ~
                    -- do ponto decimal. s deve ser um valor de 0 a p. O valor padrão é 0

smallmoney	        -- Tipo de "Moeda" de -214,748.3648 a 214,748.3647	                                4 bytes
money	            -- Tipo de "Moeda" de -922,337,203,685,477.5808 a 922,337,203,685,477.5807	        8 bytes
float(n)	        -- Precisão de número flutuante de -1.79E + 308 a 1.79E + 308.                      4 ou 8 bytes
                    -- O parâmetro n indica se o campo deve conter 4 ou 8 bytes. float (24) ~
                    -- contém um campo de 4 bytes e o float(53) mantém um campo de 8 bytes.~
                    -- O valor padrão de n é 53.

real	            -- Precisão de número flutuante de -3,40E + 38 a 3,40E + 38	                        4 bytes

-- tipos de dados: DATA

--Tipo de Dado	     Descrição	                                                                        Tamanho (bytes)

datetime	        -- De 1 de janeiro de 1753 a 31 de dezembro de 9999 com uma precisão ~              8 bytes
                    -- de 3,33 milisegundos	

datetime2	        -- De 1º de janeiro de 0001 a 31 de dezembro de 9999 com precisão de ~              6-8 bytes
                    -- 100 nanossegundos	

smalldatetime	    -- De 1 de janeiro de 1900 a 6 de junho de 2079 com precisão de 1 minuto	        4 bytes

date	            -- Armazena apenas uma data. De 1 de janeiro de 0001 a 31 de dezembro de 9999	    3 bytes

time	            -- Armazena um tempo apenas para uma precisão de 100 nanosegundos	                3-5 bytes

datetimeoffset	    -- O mesmo que datetime2 com a adição de um deslocamento de fuso horário	        8-10 bytes

timestamp	        -- Armazena um número único que é atualizado sempre que uma linha é criada ~
                    -- ou modificada. O valor do timestamp é baseado em um relógio interno e não ~
                    -- corresponde ao tempo real. Cada tabela pode ter apenas uma variável timestamp


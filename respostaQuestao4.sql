-- 4) Banco de dados

-- Uma empresa solicitou a você um aplicativo para manutenção de um cadastro de clientes. 
-- Após a reunião de definição dos requisitos, as conclusões foram as seguintes:

-- Um cliente pode ter um número ilimitado de telefones;

-- Cada telefone de cliente tem um tipo, por exemplo: comercial, residencial, celular, etc. O sistema deve permitir cadastrar novos tipos de telefone;

-- A princípio, é necessário saber apenas em qual estado brasileiro cada cliente se encontra. O sistema deve permitir cadastrar novos estados;

-- Você ficou responsável pela parte da estrutura de banco de dados que será usada pelo aplicativo. Assim sendo:

-- Proponha um modelo lógico para o banco de dados que vai atender a aplicação. Desenhe as tabelas necessárias, 
-- os campos de cada uma e marque com setas os relacionamentos existentes entre as tabelas;

-- Aponte os campos que são chave primária (PK) e chave estrangeira (FK);

-- Faça uma busca utilizando comando SQL que traga o código, a razão social e o(s) telefone(s) de todos os 
-- clientes do estado de São Paulo (código “SP”);Resposta tarefa 4: Consulta SQL que cria os relacionamentos:



-- Tabela: estados
CREATE TABLE estados (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    sigla VARCHAR(2) NOT NULL
);

-- Tabela: tipos_telefone
CREATE TABLE tipos_telefone (
    id INT AUTO_INCREMENT PRIMARY KEY,
    descricao VARCHAR(50) NOT NULL
);

-- Tabela: clientes
CREATE TABLE clientes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    razao_social VARCHAR(255) NOT NULL,
    estado_id INT,
    CONSTRAINT fk_estado FOREIGN KEY (estado_id) REFERENCES estados(id) ON DELETE SET NULL
);

-- Tabela: telefones
CREATE TABLE telefones (
    id INT AUTO_INCREMENT PRIMARY KEY,
    numero VARCHAR(20) NOT NULL,
    tipo_telefone_id INT,
    cliente_id INT,
    CONSTRAINT fk_tipo_telefone FOREIGN KEY (tipo_telefone_id) REFERENCES tipos_telefone(id) ON DELETE CASCADE,
    CONSTRAINT fk_cliente FOREIGN KEY (cliente_id) REFERENCES clientes(id) ON DELETE CASCADE
);

-- Consulta SQL dos clientes de SP
SELECT 
    clientes.id AS cliente_id,
    clientes.razao_social,
    telefones.numero
FROM 
    clientes
JOIN 
    estados ON clientes.estado_id = estados.id
JOIN 
    telefones ON telefones.cliente_id = clientes.id
WHERE 
    estados.sigla = 'SP';

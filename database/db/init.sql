-- Criação da tabela de usuários
CREATE TABLE usuarios (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    senha VARCHAR(255) NOT NULL,
    data_cadastro TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Criação da tabela de categorias (categorias pré-cadastradas)
CREATE TABLE categorias (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL
);

-- Inserção de categorias iniciais
INSERT INTO categorias (nome) VALUES 
('Educação'), 
('Saúde'), 
('Meio Ambiente'), 
('Tecnologia'), 
('Arte e Cultura'), 
('Assistência Social');

-- Criação da tabela de projetos
CREATE TABLE projetos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    descricao TEXT NOT NULL,
    categoria_id INT,
    usuario_id INT,
    data_criacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    valor_meta DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (categoria_id) REFERENCES categorias(id),
    FOREIGN KEY (usuario_id) REFERENCES usuarios(id)
);

-- Criação da tabela de doações
CREATE TABLE doacoes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    projeto_id INT,
    usuario_id INT,
    valor DECIMAL(10, 2) NOT NULL,
    data_doacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (projeto_id) REFERENCES projetos(id),
    FOREIGN KEY (usuario_id) REFERENCES usuarios(id)
);

-- População de usuários (exemplo)
INSERT INTO usuarios (nome, email, senha) VALUES 
('João da Silva', 'joao@example.com', 'senha123'), 
('Maria Oliveira', 'maria@example.com', 'senha123');

-- População de projetos (exemplo)
INSERT INTO projetos (nome, descricao, categoria_id, usuario_id, valor_meta) VALUES 
('Projeto de Educação para Crianças', 'Descrição do projeto...', 1, 1, 5000.00), 
('Campanha de Saúde Pública', 'Descrição do projeto...', 2, 2, 3000.00);
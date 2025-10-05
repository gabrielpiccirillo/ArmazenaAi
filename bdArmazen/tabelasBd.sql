-- Tabela: usuarios
CREATE TABLE usuarios (
    id SERIAL PRIMARY KEY,
    nome TEXT NOT NULL,
    email TEXT NOT NULL UNIQUE,
    senha TEXT NOT NULL,
    tipo TEXT CHECK (tipo IN ('admin', 'operador', 'visualizador')) NOT NULL DEFAULT 'operador',
    ativo BOOLEAN DEFAULT TRUE
);

-- Tabela: categorias
CREATE TABLE categorias (
    id SERIAL PRIMARY KEY,
    nome TEXT NOT NULL,
    descricao TEXT
);

-- Tabela: produtos
CREATE TABLE produtos (
    id SERIAL PRIMARY KEY,
    nome TEXT NOT NULL,
    descricao TEXT,
    codigo_barras TEXT UNIQUE,
    categoria_id INTEGER REFERENCES categorias(id),
    estoque_minimo INTEGER DEFAULT 0,
    ativo BOOLEAN DEFAULT TRUE
);


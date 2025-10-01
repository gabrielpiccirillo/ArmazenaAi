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

-- Tabela: localizacoes
CREATE TABLE localizacoes (
    id SERIAL PRIMARY KEY,
    codigo TEXT NOT NULL UNIQUE,
    descricao TEXT
);

-- Tabela: estoques
CREATE TABLE estoques (
    id SERIAL PRIMARY KEY,
    produto_id INTEGER REFERENCES produtos(id) ON DELETE CASCADE,
    localizacao_id INTEGER REFERENCES localizacoes(id),
    quantidade INTEGER NOT NULL DEFAULT 0,
    UNIQUE (produto_id, localizacao_id)
);

-- Tabela: movimentacoes
CREATE TABLE movimentacoes (
    id SERIAL PRIMARY KEY,
    produto_id INTEGER REFERENCES produtos(id) ON DELETE CASCADE,
    tipo TEXT CHECK (tipo IN ('entrada', 'saida', 'transferencia')) NOT NULL,
    quantidade INTEGER NOT NULL CHECK (quantidade > 0),
    origem_id INTEGER REFERENCES localizacoes(id),
    destino_id INTEGER REFERENCES localizacoes(id),
    data_movimentacao TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    observacoes TEXT
);

-- Tabela: usuarios
CREATE TABLE usuarios (
    id SERIAL PRIMARY KEY,
    nome TEXT NOT NULL,
    email TEXT NOT NULL UNIQUE,
    senha TEXT NOT NULL,
    tipo TEXT CHECK (tipo IN ('admin', 'operador', 'visualizador')) NOT NULL DEFAULT 'operador',
    ativo BOOLEAN DEFAULT TRUE
);

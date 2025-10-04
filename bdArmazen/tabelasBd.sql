-- Tabela: usuarios
CREATE TABLE usuarios (
    id SERIAL PRIMARY KEY,
    nome TEXT NOT NULL,
    email TEXT NOT NULL UNIQUE,
    senha TEXT NOT NULL,
    tipo TEXT CHECK (tipo IN ('admin', 'operador', 'visualizador')) NOT NULL DEFAULT 'operador',
    ativo BOOLEAN DEFAULT TRUE
);

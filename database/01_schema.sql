-- Oracle Database 12c ou superior. Evolucao didatica do MER original.
-- A landing page nao esta integrada a este banco.
CREATE TABLE usuario (
 id_usuario NUMBER(10) PRIMARY KEY,
 nome VARCHAR2(120) NOT NULL,
 email VARCHAR2(254) NOT NULL UNIQUE,
 senha_hash VARCHAR2(255) NOT NULL,
 perfil_financeiro VARCHAR2(50) NOT NULL
);
CREATE TABLE conta_financeira (
 id_conta NUMBER(10) PRIMARY KEY,
 id_usuario NUMBER(10) NOT NULL REFERENCES usuario(id_usuario),
 nome VARCHAR2(100) NOT NULL,
 tipo VARCHAR2(40) NOT NULL,
 saldo_inicial NUMBER(14,2) DEFAULT 0 NOT NULL
);
CREATE TABLE transacao (
 id_transacao NUMBER(10) PRIMARY KEY,
 id_conta NUMBER(10) NOT NULL REFERENCES conta_financeira(id_conta),
 tipo VARCHAR2(7) NOT NULL,
 categoria VARCHAR2(60) NOT NULL,
 descricao VARCHAR2(250),
 valor NUMBER(14,2) NOT NULL,
 data_transacao DATE NOT NULL,
 CONSTRAINT ck_tr_tipo CHECK (tipo IN ('ENTRADA', 'SAIDA')),
 CONSTRAINT ck_tr_valor CHECK (valor > 0)
);
CREATE TABLE investimento (
 id_investimento NUMBER(10) PRIMARY KEY,
 id_usuario NUMBER(10) NOT NULL REFERENCES usuario(id_usuario),
 tipo VARCHAR2(60) NOT NULL,
 valor_investido NUMBER(14,2) NOT NULL,
 data_aplicacao DATE NOT NULL,
 CONSTRAINT ck_inv_valor CHECK (valor_investido >= 0)
);
CREATE TABLE transacao_investimento (
 id_transacao NUMBER(10) NOT NULL REFERENCES transacao(id_transacao),
 id_investimento NUMBER(10) NOT NULL REFERENCES investimento(id_investimento),
 PRIMARY KEY (id_transacao, id_investimento)
);
CREATE TABLE definicao_meta (
 id_meta NUMBER(10) PRIMARY KEY,
 id_usuario NUMBER(10) NOT NULL REFERENCES usuario(id_usuario),
 titulo VARCHAR2(120) NOT NULL,
 valor_alvo NUMBER(14,2) NOT NULL,
 data_alvo DATE,
 CONSTRAINT ck_meta_valor CHECK (valor_alvo > 0)
);
CREATE TABLE alerta (
 id_alerta NUMBER(10) PRIMARY KEY,
 id_usuario NUMBER(10) NOT NULL REFERENCES usuario(id_usuario),
 mensagem VARCHAR2(500) NOT NULL,
 criado_em TIMESTAMP NOT NULL,
 lido NUMBER(1) DEFAULT 0 NOT NULL,
 CONSTRAINT ck_alerta_lido CHECK (lido IN (0, 1))
);
CREATE TABLE conteudo_educativo (
 id_conteudo NUMBER(10) PRIMARY KEY,
 titulo VARCHAR2(150) NOT NULL,
 tipo VARCHAR2(40) NOT NULL,
 nivel VARCHAR2(40) NOT NULL,
 url VARCHAR2(2048) NOT NULL
);

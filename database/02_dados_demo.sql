-- Dados ficticios. DEMO_NAO_AUTENTICA nao e senha nem hash utilizavel.
INSERT INTO usuario VALUES (1, 'Pessoa Demo', 'demo@example.com', 'DEMO_NAO_AUTENTICA', 'Iniciante');
INSERT INTO conta_financeira VALUES (1, 1, 'Conta demonstrativa', 'Corrente', 1000);
INSERT INTO transacao VALUES (1, 1, 'ENTRADA', 'Renda', 'Renda ficticia', 2500, DATE '2026-10-01');
INSERT INTO transacao VALUES (2, 1, 'SAIDA', 'Alimentacao', 'Compra ficticia', 180, DATE '2026-10-02');
INSERT INTO investimento VALUES (1, 1, 'Renda fixa demonstrativa', 200, DATE '2026-10-03');
INSERT INTO transacao VALUES (3, 1, 'SAIDA', 'Investimento', 'Aporte ficticio', 200, DATE '2026-10-03');
INSERT INTO transacao_investimento VALUES (3, 1);
INSERT INTO definicao_meta VALUES (1, 1, 'Reserva de emergencia', 5000, DATE '2027-01-01');
INSERT INTO alerta VALUES (1, 1, 'Revise sua meta mensal', TIMESTAMP '2026-10-03 10:00:00', 0);
INSERT INTO conteudo_educativo VALUES (1, 'Orcamento pessoal', 'Artigo', 'Iniciante', 'https://example.com/educacao-financeira');
COMMIT;

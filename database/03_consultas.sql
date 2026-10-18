-- Saldo demonstrativo calculado a partir das movimentacoes.
SELECT c.id_conta, c.nome,
 c.saldo_inicial + COALESCE(SUM(CASE WHEN t.tipo = 'ENTRADA' THEN t.valor ELSE -t.valor END), 0) AS saldo
FROM conta_financeira c LEFT JOIN transacao t ON t.id_conta = c.id_conta
GROUP BY c.id_conta, c.nome, c.saldo_inicial;

SELECT categoria, SUM(valor) AS total_saidas FROM transacao
WHERE tipo = 'SAIDA' GROUP BY categoria;

SELECT u.nome, m.titulo, m.valor_alvo, m.data_alvo
FROM usuario u JOIN definicao_meta m ON m.id_usuario = u.id_usuario;

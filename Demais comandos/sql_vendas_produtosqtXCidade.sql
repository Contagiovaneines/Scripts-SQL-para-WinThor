SELECT a.codprod, b.descricao, d.municent, SUM(a.qt) AS quantidade_total_vendida
FROM pcpedi a
JOIN pcprodut b ON a.codprod = b.codprod
JOIN pcpedc c ON c.numped = a.numped
JOIN pcclient d ON a.codcli = d.codcli
WHERE c.data BETWEEN '01-jun-2023' and '30-jun-2023'
GROUP BY a.codprod, b.descricao, d.municent;

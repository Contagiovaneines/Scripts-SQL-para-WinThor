
SELECT
  a.CODPROD,
  a.DESCRICAO,
  Sum(b.QT),
  c.CODUSUR,
  d.NOME,
 Avg(b.pvenda),
  Avg(b.PTABELA),
  Avg(b.PERDESC),
  :DTINICIO,
  :DTFIM
FROM
  pcprodut a, pcpedi b, pcpedc c, pcusuari d
  WHERE
  c.CODUSUR = D.CODUSUR
  and a.codprod = b.codprod
  and b.numped = c.numped
  AND C.CODUSUR IN (:CODUSUR)
  AND b.CODPROD IN (:CODPROD)
  AND c.data BETWEEN (:DTINICIO) AND (:DTFIM)
  AND c.codfilial IN (:CODFILIAL)
  AND c.CONDVENDA IN (1, 2, 3, 7, 9, 14, 15, 17, 18, 19, 98)
  AND c.DTCANCEL IS NULL
GROUP BY
  a.CODPROD, a.DESCRICAO, c.CODUSUR, d.NOME
  ORDER BY Avg(b.PERDESC)desc


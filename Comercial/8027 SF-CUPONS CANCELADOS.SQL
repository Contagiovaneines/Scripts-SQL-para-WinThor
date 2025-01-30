SELECT
  a.NUMPEDECF,
  a.NUMCUPOM,
  a.NUMCAIXA,
  a.DTCANCELECF,
  a.DATA,
  a.CODCOB,
  a.VLATEND,
  b.CODAUXILIAR,
  b.CODPROD,
  c.descricao,
  b.QT,
  b.PVENDA,
  :dtinicial,
  :dtfinal
FROM
  pcpedccancecf a, pcpedicancecf b, pcprodut c
WHERE
  a.NUMPEDECF = b.NUMPEDECF
  and b.codprod=c.codprod
  AND a.DTCANCELECF between :dtinicial and :dtfinal
  order by a.NUMPEDECF


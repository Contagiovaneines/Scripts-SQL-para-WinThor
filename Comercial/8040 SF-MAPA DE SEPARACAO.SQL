SELECT
  a.CODPROD,
  b.DESCRICAO,
  b.EMBALAGEM,
  Sum(a.QT) AS qtvendida,
  b.QTUNITCX AS qtmaster,
  trunc((Sum(a.QT) / b.QTUNITCX), 0) AS cx,
     b.UNIDADEMASTER,
  b.UNIDADE,
  Sum(a.QT) - (b.QTUNITCX * trunc((Sum(a.QT) / b.QTUNITCX), 0)) AS unidadevenda,
  b.RUA,
  a.NUMCAR,
  c.DESTINO,
  a.POSICAO,
  c.DTFAT,
  d.nome ,
    COUNT(DISTINCT a.CODPROD) QTITENS,  
  SUM(NVL(a.QT, 0) * NVL(b.pesobruto, 0)) PESOLIQ_TOTAL
FROM
  pcpedi a,
  pcprodut b,
  pccarreg c,
  pcempr d
WHERE
  a.NUMCAR = c.NUMCAR  (+)
  and c.codfuncfat =d.matricula (+) 
  AND a.CODPROD = b.CODPROD
  AND a.NUMCAR in (:NUMCAR)
GROUP BY
  a.CODPROD,
  b.DESCRICAO,
  b.EMBALAGEM,
  b.QTUNITCX,
  b.RUA,
  a.NUMCAR,
  c.DESTINO,
  a.POSICAO,
  c.DTFAT ,
  d.nome  ,
   b.UNIDADEMASTER,
  b.UNIDADE
ORDER BY
  b.RUA,
  b.DESCRICAO


SELECT
c.fornecedor,
  c.DTENT,
  a.DTMOV,
  a.NUMNOTA,
  a.CODPROD,
  b.DESCRICAO,
  a.QT,
  c.obs   ,
  :dtinicio,
  :dtfim     ,
   d.qtestger - d.qtreserv,  
   e.pvenda      ,
   c.chavenfe
FROM
  pcmov a, pcprodut b, pcnfent c , pcest d, pctabpr e
WHERE
  a.CODPROD = b.CODPROD   (+)
  AND a.NUMNOTA = c.NUMNOTA   (+)
  and a.codprod = d.codprod
  and d.codfilial = 6
  and a.codprod = e.codprod 
  and e.numregiao = 1
  --AND a.CODPROD = d.CODPROD
  AND a.CODOPER in('E','ET')
  AND c.CODFILIAL = 5
   and c.vltotal <> 0
 and a.qt>0
  --AND d.NUMREGIAO = 1
  AND c.DTENT BETWEEN :dtinicio and :dtfim
  AND a.DTMOV BETWEEN :dtinicio and :dtfim
  order by b.descricao
 
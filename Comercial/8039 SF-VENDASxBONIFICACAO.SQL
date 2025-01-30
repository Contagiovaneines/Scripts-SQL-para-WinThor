SELECT DISTINCT
  a.CODCLI,
  f.CLIENTE,
  a.CODUSUR,
     :dtnicio1,
  :dtfim3,
  (SELECT
    Sum(pcpedi.QT * pcpedi.PVENDA) FROM
    pcpedc, pcpedi, pcprodut WHERE
    pcpedc.NUMPED = pcpedi.NUMPED AND pcpedi.CODPROD = pcprodut.CODPROD AND pcpedc.DATA BETWEEN :dtnicio1 AND :dtfim1 AND pcpedc.CONDVENDA IN (1, 2, 3, 7, 9, 14, 15, 17, 18, 19, 98) AND pcpedc.DTCANCEL IS NULL
  AND pcpedc.CODCLI = a.CODCLI AND pcpedc.CODUSUR = a.CODUSUR) AS venda,
  (SELECT
    Sum(Nvl(pcpedi.QT * pcpedi.PVENDA, 0)) FROM
    pcpedc, pcpedi, pcprodut WHERE
    pcpedc.NUMPED = pcpedi.NUMPED AND pcpedi.CODPROD = pcprodut.CODPROD AND pcpedc.DATA BETWEEN :dtnicio2 AND :dtfim2 AND pcpedc.CONDVENDA IN (5) AND pcpedc.DTCANCEL IS NULL AND pcpedc.CODCLI = a.CODCLI
  AND pcpedc.CODUSUR = a.CODUSUR) AS BONIFICACAO,
  (SELECT
    Sum(Nvl(pcpedi.QT * pcpedi.PVENDA, 0)) FROM
    pcpedc, pcpedi, pcprodut WHERE
    pcpedc.NUMPED = pcpedi.NUMPED AND pcpedi.CODPROD = pcprodut.CODPROD AND pcpedc.DATA BETWEEN :dtnicio3 AND :dtfim3 AND pcpedc.CONDVENDA IN (11) AND pcpedc.DTCANCEL IS NULL AND pcpedc.CODCLI = a.CODCLI
  AND pcpedc.CODUSUR = a.CODUSUR) AS TROCA,
  
  ((SELECT
    Sum(pcpedi.QT * pcpedi.PVENDA) FROM
    pcpedc, pcpedi, pcprodut WHERE
    pcpedc.NUMPED = pcpedi.NUMPED AND pcpedi.CODPROD = pcprodut.CODPROD AND pcpedc.DATA BETWEEN :dtnicio2 AND :dtfim2 AND pcpedc.CONDVENDA IN (5) AND pcpedc.DTCANCEL IS NULL AND pcpedc.CODCLI = a.CODCLI
  AND pcpedc.CODUSUR = a.CODUSUR) / (SELECT
    Sum(pcpedi.QT * pcpedi.PVENDA) FROM
    pcpedc, pcpedi, pcprodut WHERE
    pcpedc.NUMPED = pcpedi.NUMPED AND pcpedi.CODPROD = pcprodut.CODPROD AND pcpedc.DATA BETWEEN :dtnicio1 AND :dtfim1 AND pcpedc.CONDVENDA IN (1, 2, 3, 7, 9, 14, 15, 17, 18, 19, 98) AND pcpedc.DTCANCEL IS NULL
  AND pcpedc.CODCLI = a.CODCLI AND pcpedc.CODUSUR = a.CODUSUR)*100) AS percent_bonificao
FROM
  pcpedc a,
  pcpedi b,
  pcprodut c,
  pcclient f 
WHERE
  b.CODPROD = c.CODPROD
  AND a.CODCLI = f.CODCLI
  AND a.NUMPED = b.NUMPED
  AND a.DTCANCEL IS NULL
  AND a.CODUSUR IN (:codusur)
  AND a.DATA BETWEEN :dtnicio1 AND :dtfim3
  AND c.CODFORNEC = 30399
GROUP BY
  a.CODCLI,
  f.CLIENTE,
  a.CODUSUR 
  ORDER BY
  A.CODUSUR,F.CLIENTE


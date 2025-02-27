SELECT
  PCNFSAID.CODCLI AS "CODIGO DO CLIENTE",
  PCNFSAID.CLIENTE AS CLIENTE,
  PCNFSAID.NUMPED AS "NUMERO DO PEDIDO",
  PCNFSAID.NUMNOTA AS "NUMERO NOTA FISCAL",
  PCNFSAID.ESPECIE,
  PCNFSAID.SERIE,
  CASE 
  WHEN PCNFSAID.QRCODENFCE IS NULL THEN 'NF-E'
  ELSE 'NFC-E'
  END AS "TIPONOTA",
  PCNFSAID.DTSAIDA AS "DATA DA SAIDA",
  PCNFSAID.CHAVENFE AS "CHAVE DA NFE",
(SELECT NOME FROM PCEMPR WHERE MATRICULA = PCNFSAID.CODFUNCCANCEL) AS "FUNCIONÁRIO CANCELOU"
FROM
  PCNFSAID
WHERE
  PCNFSAID.DTSAIDA BETWEEN TO_DATE('01/06/2021', 'DD/MM/YYYY') AND TO_DATE('30/06/2021', 'DD/MM/YYYY')
  AND PCNFSAID.CODFILIAL IN (2)
  AND PCNFSAID.SITUACAONFE = 101;


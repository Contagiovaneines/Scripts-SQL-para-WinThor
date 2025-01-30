SELECT
  a.CODCLI,
  b.CLIENTE,
  a.NUMCAR,
  c.NOME,
  a.NUMNOTA,
  a.SERIE,
  a.VLTOTAL
FROM
  pcnfsaid a, pcclient b, pcempr c, pccarreg d
WHERE
  a.CODCLI = b.CODCLI
  AND a.NUMCAR = d.NUMCAR
  AND c.MATRICULA = d.CODMOTORISTA
  AND a.NUMCAR IN (:numcar)
  AND a.PROTOCOLOCANCELAMENTO IS NULL
  --AND a.NUMPED IN (:numped)

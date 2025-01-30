SELECT
  a.NUMCAR,
  a.codfilialnf,
  a.horalanc,
  a.minutolanc,
  i.destino,
  a.ESPECIE,
  a.CODCLI,
  b.CLIENTE,
  c.CODPROD,
  c.DESCRICAO,
  c.QT,
  c.PUNIT,
  --d.VLTOTAL,
  a.NUMNOTA,
  a.DTSAIDA,
  d.horafat,
  d.minutofat,
  --a.VLTOTAL,
  a.DTCANCEL,
  a.CHAVENFE,
  a.SITUACAONFE,
  e.DESCRICAO,
  a.CODFUNCCANCEL,
  f.NOME,
  b.CODPRACA,
  g.PRACA,
  (c.qt*c.punit)
  
FROM
  pcnfsaid a, pcclient b, pcmov c, pcpedc d, PCMENSAGEMNFE e, pcempr f, pcpraca g, pccarreg i,
  PCNFCAN g
  
WHERE
a.NUMTRANSVENDA(+) = DECODE(NVL(g.NUMTRANSENT,0),0,g.NUMTRANSVENDA,NULL)
  and a.CODCLI = b.CODCLI
  AND a.NUMNOTA = c.NUMNOTA
  and a.numcar = i.numcar
  AND b.CODPRACA = g.CODPRACA
  AND a.CODFUNCCANCEL = f.MATRICULA
  AND a.SITUACAONFE = e.CODMENSAGEM
  AND a.NUMNOTA = d.NUMNOTA (+)
  and TRUNC(g.DATACANC) between :dtnicio and :dtfim
  AND a.NUMCAR = :numcar
  AND c.QT > 0
  AND a.SITUACAONFE <> 100
   group by
   a.NUMCAR,
  i.destino,
  a.ESPECIE,
  a.CODCLI,
  b.CLIENTE,
  c.CODPROD,
  c.DESCRICAO,
  c.QT,
  c.PUNIT,
  a.NUMNOTA,
  a.DTSAIDA,
  a.DTCANCEL,
  a.CHAVENFE,
  a.SITUACAONFE,
  e.DESCRICAO,
  a.CODFUNCCANCEL,
  f.NOME,
  b.CODPRACA,
  g.PRACA,
  d.horafat,
  d.minutofat ,
  a.codfilialnf,
  a.horalanc,
  a.minutolanc
ORDER BY
  a.numcar,
  a.numnota,
  c.descricao


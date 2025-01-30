select 
  PEDC.POSICAO,
  r.DESCRICAO AS rota_principal,
  cli.CODCLI,
  cli.CLIENTE AS razao_social,
  cli.FANTASIA,
  cob.CODCOB AS cobranca,
  pp.DESCRICAO AS pl_pag,
  pedc.VLTOTAL,
  ped.CODPROD,
  prod.DESCRICAO,
  prod.QTUNIT,
  prod.EMBALAGEM,
  prod.UNIDADE,
  prod.UNIDADE unid,
  ped.QT,
  ped.QT / QTUNIT qt_tot,
  ped.QTCX,
  ped.QTPECAS,
  prod.UNIDADEMASTER,
  ped.PVENDA,
  ped.PVENDA * ped.QT vl_tot_item,
  cob.COBRANCA,
  rca.CODUSUR,
  rca.NOME,
  cli.ENDERENT,
  cli.NUMEROENT,
  cli.BAIRROENT,
  cli.MUNICENT,
  cli.ESTENT,
  cli.CEPENT,
  praca.CODPRACA,
  praca.PRACA,
  pedc.OBS,
  pedc.OBS1,
  pedc.OBS2,
  pedc.OBSENTREGA1,
  pedc.OBSENTREGA2,
  pedc.OBSENTREGA3,
  pedc.NUMPED,
  pedc.NUMSEQMONTAGEM,
  prod.CODAUXILIAR,
  pedc.CODEMITENTE,
  pedc.CODFILIAL,
  pedc.NUMPEDCLI,
  cli.TELENT
FROM
  pcclient cli,pccob cob, pcplpag pp, pcrotaexp r, pcprodut prod,
    pcpedi ped, pcpedc pedc, pcusuari rca, pcpraca praca
WHERE
  R.codrota=PRACA.ROTA
  AND rca.CODUSUR = pedc.CODUSUR
  AND praca.CODPRACA = pedc.CODPRACA
  AND cli.CODPRACA = praca.CODPRACA
  AND pedc.CODCLI = cli.CODCLI
  AND pedc.CODCOB = cob.CODCOB
  AND pedc.CODPLPAG = pp.CODPLPAG
  AND prod.CODPROD = ped.CODPROD
  --AND ped.CODAUXILIAR = emb.CODAUXILIAR
  --AND emb.CODPROD = prod.CODPROD
  --AND emb.CODFILIAL = pedc.CODFILIAL
  AND ped.NUMPED = pedc.NUMPED
  --AND prod.CODPROD = emb.CODPROD
  AND (r.codrota = (:numcar))
  AND prod.tipoestoque = 'FR'
  AND prod.pesovariavel = 'S'
  AND PEDC.POSICAO in ('L','M')
  AND PEDC.data BETWEEN :DATA1 AND :DATA2
  AND QTNAOCOMPRA IS NULL
  and qtapanha is null

union all

select 
  PEDC.POSICAO,
  r.DESCRICAO AS rota_principal,
  cli.CODCLI,
  cli.CLIENTE AS razao_social,
  cli.FANTASIA,
  cob.CODCOB AS cobranca,
  pp.DESCRICAO AS pl_pag,
  pedc.VLTOTAL,
  ped.CODPROD,
  prod.DESCRICAO,
  prod.QTUNIT,
  prod.EMBALAGEM,
  prod.UNIDADE,
  prod.UNIDADE unid,
  ped.QT,
  ped.QT / QTUNIT qt_tot,
  ped.QTCX,
  ped.QTPECAS,
  prod.UNIDADEMASTER,
  ped.PVENDA,
  ped.PVENDA * ped.QT vl_tot_item,
  cob.COBRANCA,
  rca.CODUSUR,
  rca.NOME,
  cli.ENDERENT,
  cli.NUMEROENT,
  cli.BAIRROENT,
  cli.MUNICENT,
  cli.ESTENT,
  cli.CEPENT,
  praca.CODPRACA,
  praca.PRACA,
  pedc.OBS,
  pedc.OBS1,
  pedc.OBS2,
  pedc.OBSENTREGA1,
  pedc.OBSENTREGA2,
  pedc.OBSENTREGA3,
  pedc.NUMPED,
  pedc.NUMSEQMONTAGEM,
  prod.CODAUXILIAR,
  pedc.CODEMITENTE,
  pedc.CODFILIAL,
  pedc.NUMPEDCLI,
  cli.TELENT
FROM
  pcclient cli,pccob cob, pcplpag pp, pcrotaexp r, pcprodut prod,
    pcpedi ped, pcpedc pedc, pcusuari rca, pcpraca praca
WHERE
  R.codrota=PRACA.ROTA
  AND rca.CODUSUR = pedc.CODUSUR
  AND praca.CODPRACA = pedc.CODPRACA
  AND cli.CODPRACA = praca.CODPRACA
  AND pedc.CODCLI = cli.CODCLI
  AND pedc.CODCOB = cob.CODCOB
  AND pedc.CODPLPAG = pp.CODPLPAG
  AND prod.CODPROD = ped.CODPROD
  --AND ped.CODAUXILIAR = emb.CODAUXILIAR
  --AND emb.CODPROD = prod.CODPROD
  --AND emb.CODFILIAL = pedc.CODFILIAL
  AND ped.NUMPED = pedc.NUMPED
  --AND prod.CODPROD = emb.CODPROD
  AND (r.codrota = (:numcar))
  AND prod.tipoestoque = 'FR'
  AND prod.pesovariavel = 'S'
  AND PEDC.POSICAO in ('L','M')
  AND PEDC.data BETWEEN :DATA1 AND :DATA2
  AND QTNAOCOMPRA=0
 
  ORDER BY
  POSICAO,
  NUMPED,
  codprod
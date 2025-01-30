SELECT DISTINCT P.CODPROFISSIONAL
,P.DESCRICAO
,LISTAGG(C.CODCLI, ',') WITHIN GROUP (ORDER BY C.CODCLI) AS CODCLI
,P.PERCOMPROF
,P.CNPJ
,P.TIPOPROF
,P.FONE
,P.CELULAR
,P.SITUACAO
,P.CODUSUR
 FROM PCPROFISSIONAL P, PCCLIENT C
 WHERE P.CODPROFISSIONAL = C.CODPROFISSIONAL(+)
 GROUP BY  P.CODPROFISSIONAL
 ,P.DESCRICAO
 ,P.PERCOMPROF
 ,P.CNPJ
 ,P.TIPOPROF
 ,P.FONE
 ,P.CELULAR
 ,P.SITUACAO
 ,P.CODUSUR
 ORDER BY 1

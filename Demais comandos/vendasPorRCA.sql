select
D.codusur,
D.nome,
A.codcli,
E.cliente,
e.cgcent as cnpj,
e.endercob as endereco,
e.numerocob as numero,
e.cepcob as cep,
e.bairrocob as bairro,
e.municcob as cidade,
a.dtfat,
SUM(B.PVENDA*B.QT) as vlvendido
--COUNT(A.CODCLI)
from pcpedc a, pcpedi b, pcprodut c, pcusuari D, PCCLIENT E, PCFORNEC F
where a.numped = b.numped
and b.codprod = c.codprod
--and c.codfornec IN (480,635)
and a.codsupervisor = 291
AND A.posicao NOT IN ('C')
AND A.condvenda = 1
AND A.codusur = D.codusur
AND A.codcli = E.codcli
AND C.codfornec = F.codfornec
and a.dTFAT BETWEEN '01-jan-2019' and '12-aug-2019'
group by
A.CODCLI,
E.cliente,
e.cgcent,
e.endercob,
e.numerocob,
e.cepcob,
e.bairrocob,
e.municcob,
D.codusur,
D.nome,
a.dtfat
order by 1 desc
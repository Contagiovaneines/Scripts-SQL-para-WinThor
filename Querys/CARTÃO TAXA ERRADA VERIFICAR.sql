select
P.codcli, P.prest, P.duplic, P.valor, P.DTVENC, p.dtemissao, P.codcob, P.codcoborig, P.VALOR
, P.perdesc, B.txjuros,P.valordesc, (P.VALOR - P.valordesc) VLCOMDESC, p.vpago
, P.rotinalancultalt, P.rotinainsert
from pcprest p, PCCOB B
where P.codcoborig = B.codcob
AND P.perdesc <> B.txjuros
and p.dtemissao BETWEEN to_date('13/08/2021','DD/MM/YYYY') AND TRUNC(SYSDATE)
--and p.perdesc <> 2.37
--and p.codcoborig = 'MASP'
AND B.cartao = 'S'
AND P.VPAGO IS NULL
--and p.numtransvenda in (30805662)

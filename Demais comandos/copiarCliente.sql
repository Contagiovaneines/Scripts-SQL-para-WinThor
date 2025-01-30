select 
a.codcli,
a.codusur1,
a.codusur2
from pcclient a
where (a.codusur1 = 131 or a.codusur2=131)
and a.codcli in (
select codcli from pcusurcli where codusur = 131 )
--and codcli not in (557322,558432))
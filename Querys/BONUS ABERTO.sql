select
*
from pcbonusc b
where b.databonus >= trunc(sysdate-180) 
and b.dtfechamento is null
and b.dtcancel is null

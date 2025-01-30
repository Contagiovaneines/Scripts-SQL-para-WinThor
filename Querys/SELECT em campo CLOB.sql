select
e.matricula, SUBSTR(p.nome,0,15) nome, e.codcli, e.dtalteracao, e.rotina, e.obs, e.campo, dbms_lob.substr( e.valorant, 4000, 1 ) VLANT, dbms_lob.substr( e.valoratu, 4000, 1 ) VLATUAL
from pclogaltcli e, pcempr p
where e.matricula = p.matricula 
and e.codcli = 25865
and e.rotina like '302-%';


select
--p.numped
p.posicao, p.numped, p.condvenda, i.posicao as "pcpedi.posicao", p.codfunclibera, i.tipoentrega, p.*
from pcpedc p, pcpedi i
where p.numped = i.numped
and p.posicao <> i.posicao
and p.posicao <> 'F';


select codcli,cliente,fantasia,condvenda5,condvenda11,condvenda13,condvenda14,condvenda20,cgcent 
from pcclient 
where (cgcent like '%111%' or cgcent like '%222%' or cgcent like '%333%')
and tipofj = 'F'
and (condvenda5 = 'S' or condvenda11 = 'S' or condvenda13 = 'S' or condvenda14 = 'S' or condvenda20 = 'S') -- aqui consulta

update pcclient set condvenda5 = 'N',condvenda11='N',condvenda13='N',condvenda14='N',condvenda20='N' where tipofj = 'F'
and (condvenda5 = 'S' or condvenda11 = 'S' or condvenda13 = 'S' or condvenda14 = 'S' or condvenda20 = 'S')
and (cgcent like '%111%' or cgcent like '%222%' or cgcent like '%333%') --aqui corrige

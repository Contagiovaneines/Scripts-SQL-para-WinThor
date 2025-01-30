SELECT 
       C.CODCLI,
       C.NUMPED TV8,
       C.CONDVENDA,
       C.POSICAO POSICAO_TV8,
       C.CODFUNCLIBERA AS LIBERATV8,
       FUT.NUMPED  AS TV7,
       FUT.POSICAO AS POSICAO_TV7,
       FUT.CODFUNCLIBERA AS LIBERATV7
  FROM PCPEDC FUT, PCPEDC C
 WHERE FUT.CONDVENDA = 7
   AND C.NUMPEDENTFUT = FUT.NUMPED
   AND C.POSICAO <> FUT.POSICAO
   AND FUT.POSICAO = 'F'
   AND C.POSICAO NOT IN ('C') -- 'B'
 
 

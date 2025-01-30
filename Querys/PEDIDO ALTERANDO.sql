SELECT P.OBSFRETENF3, p.condvenda, p.posicao, p.codusur, U.nome, P.numped, P.codcli, P.DATA, P.vltotal
FROM PCPEDC P, PCUSUARI U 
WHERE P.CODUSUR = U.CODUSUR 
AND P.OBSFRETENF3 = 'ALTERANDO' 
--and p.minuto is null
AND P.DATA >= TRUNC(SYSDATE-180)

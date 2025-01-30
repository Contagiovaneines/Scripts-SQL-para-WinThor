SELECT
--EXTRACT(MONTH FROM p.data) MES, 
/*
case EXTRACT(MONTH FROM p.data)
when 1 then 'JANEIRO'
when 2 then 'FEVEREIRO'
when 3 then 'MARÇO'
when 4 then 'ABRIL'
when 5 then 'MAIO'
when 6 then 'JUNHO'
when 7 then 'JULHO'
when 8 then 'AGOSTO'
when 9 then 'SETEMBRO'
when 10 then 'OUTUBRO'
when 11 then 'NOVEMBRO'
when 12 then 'DEZEMBRO'
ELSE 'N/A'
END AS NOME 
,*/ EXTRACT(YEAR FROM p.data) ANO
, 'R$ '||to_char( ROUND(SUM(P.VLATEND), 2), 'FM999G999G999G999D99') VLVENDA
--, 'R$ '||to_char( ROUND( (SELECT SUM(DEV.VLDEVOLUCAO) FROM VIEW_DEVOL_RESUMO_FATURAMENTO DEV WHERE EXTRACT(month from DEV.DTENT)||'/'||EXTRACT(year from DEV.DTENT) = EXTRACT(month from p.data)||'/'||EXTRACT(year from p.data) ) ,2), 'FM999G999G999G999D99') VLDEV
--, 'R$ '||to_char( ROUND(SUM(P.VLATEND) - (SELECT SUM(DEV.VLDEVOLUCAO) FROM VIEW_DEVOL_RESUMO_FATURAMENTO DEV WHERE EXTRACT(month from DEV.DTENT)||'/'||EXTRACT(year from DEV.DTENT) = EXTRACT(month from p.data)||'/'||EXTRACT(year from p.data) ), 2), 'FM999G999G999G999D99') AS "VLVENDA-DEV"
, COUNT(P.CODCLI) QTDVENDAS
, 'R$ '||to_char( ROUND(ROUND(SUM(P.VLATEND), 2)/COUNT(P.CODCLI), 2) , 'FM999G999G999G999D99') AS "TICKET MEDIO",
SUM(
    CASE 
        WHEN S.TIPOFJ = 'J' THEN 1
        ELSE 0
    END
) AS "B2B QTVENDAS"
,
'R$ '||to_char( 
SUM(
    CASE 
        WHEN S.TIPOFJ = 'J' THEN P.vlatend
        ELSE 0
    END
) , 'FM999G999G999G999D99') AS "B2B VLVENDAS",
'R$ '||to_char( ROUND( SUM(CASE WHEN S.TIPOFJ = 'J' THEN P.vlatend ELSE 0 END) / SUM(CASE WHEN S.TIPOFJ = 'J' THEN 1 ELSE 0 END),2 ), 'FM999G999G999G999D99') AS "TICKET MEDIO J",


ROUND( ( SUM( CASE WHEN S.TIPOFJ = 'J' THEN P.vlatend ELSE 0 END) / SUM(P.VLATEND) ), 2) *100 || '%' as "PERCENTUAL B2B", 


SUM(
    CASE 
        WHEN S.TIPOFJ = 'F' THEN 1
        ELSE 0
    END
) AS "B2C QTVENDAS"
,
'R$ '||to_char(
SUM(
    CASE 
        WHEN S.TIPOFJ = 'F' THEN P.vlatend
        ELSE 0
    END
) , 'FM999G999G999G999D99') AS "B2C VLVENDAS",
'R$ '||to_char( ROUND( SUM(CASE WHEN S.TIPOFJ = 'F' THEN P.vlatend ELSE 0 END) / SUM(CASE WHEN S.TIPOFJ = 'F' THEN 1 ELSE 0 END),2 ) , 'FM999G999G999G999D99') AS "TICKET MEDIO F",

ROUND( ( SUM( CASE WHEN S.TIPOFJ = 'F' THEN P.vlatend ELSE 0 END) / SUM(P.VLATEND) ), 2) *100 || '%' as "PERCENTUAL B2C"

    from pcpedc p, pcnfsaid s
    where 1=1 
    --and EXTRACT(YEAR FROM p.data) >= EXTRACT(YEAR FROM SYSDATE-30)
   -- AND P.DATA >= TRUNC(SYSDATE-180)
    AND P.DATA BETWEEN to_date('01/01/2018', 'DD/MM/YYYY') AND to_date('31/12/2021', 'DD/MM/YYYY')
    AND P.POSICAO = 'F'
    AND P.CONDVENDA in ('1', '7')
    and p.numtransvenda = s.numtransvenda
    GROUP BY EXTRACT(YEAR FROM P.data)
 --   HAVING EXTRACT(MONTH FROM p.data) = 1
 --   ORDER BY EXTRACT(MONTH FROM p.data)
   

   
SELECT DISTINCT
d.CODSUPERVISOR,
  d.NOME,
  e.CODUSUR,            
e.NOME,
  :dtnicio1 ,:dtfim1,
   (SELECT
    Sum(Nvl(pcpedc.VLATEND, 0)) FROM
    pcpedc WHERE
    pcpedc.DATA BETWEEN :dtnicio1 AND :dtfim1 AND pcpedc.CONDVENDA IN (1, 2, 3, 7, 9, 14, 15, 17, 18, 19, 98)
  AND pcpedc.DTCANCEL IS NULL 
  AND pcpedc.CODUSUR = e.CODUSUR and pcpedc.codsupervisor=d.codsupervisor) AS VLVENDA,
  
(select Sum(Nvl(pcprest.valor,0)) from pcprest where pcprest.CODUSUR = e.CODUSUR and pcprest.codsupervisor=d.codsupervisor and pcprest.dtemissao BETWEEN :dtnicio1 AND :dtfim1
and pcprest.vpago is null and pcprest.codcob not in ('DH','BNF') 
and pcprest.dtvenc<SYSDATE-2) as vlaberto,

(select count(pcprest.duplic) from pcprest where pcprest.CODUSUR = e.CODUSUR and pcprest.codsupervisor=d.codsupervisor and pcprest.dtemissao BETWEEN :dtnicio1 AND :dtfim1
and pcprest.vpago is null and pcprest.codcob not in ('DH','BNF') 
and pcprest.dtvenc<SYSDATE-2) as qtdetitulos,   


((select Sum(Nvl(pcprest.valor,0)) from pcprest where pcprest.CODUSUR = e.CODUSUR and pcprest.codsupervisor=d.codsupervisor 
and pcprest.dtemissao BETWEEN :dtnicio1 AND :dtfim1 
and pcprest.vpago is null and pcprest.codcob not in ('DH','BNF') 
and pcprest.dtvenc<SYSDATE-2)/(SELECT
    Sum(Nvl(pcpedc.VLATEND, 0)) FROM
    pcpedc WHERE
    pcpedc.DATA BETWEEN :dtnicio1 AND :dtfim1 AND pcpedc.CONDVENDA IN (1, 2, 3, 7, 9, 14, 15, 17, 18, 19, 98)
  AND pcpedc.DTCANCEL IS NULL 
  AND pcpedc.CODUSUR = e.CODUSUR and pcpedc.codsupervisor=d.codsupervisor)*100)as percen
  
FROM
   pcpedc b, pcsuperv d, pcusuari e
WHERE
   b.CODSUPERVISOR = d.CODSUPERVISOR
  and b.codusur = e.codusur
   --AND b.DATA BETWEEN :dtnicio1 AND :dtfim2
  AND b.CONDVENDA IN (1, 2, 3, 7, 9, 14, 15, 17, 18, 19, 98)
  AND b.DTCANCEL IS NULL
 -- AND b.CODPRACA IN (:codpraca)
--  AND b.CODUSUR IN (:codusur)
  AND d.CODSUPERVISOR IN (:codsupervisor)
  --AND b.CODSUPERVISOR IN (:codsupervisor)
   and e.dttermino is null
   and 
  (SELECT
    Sum(pcpedc.VLATEND) FROM
    pcpedc WHERE
    pcpedc.DATA BETWEEN :dtnicio1 AND :dtfim1  AND pcpedc.CONDVENDA IN (1, 2, 3, 7, 9, 14, 15, 17, 18, 19, 98)
  AND pcpedc.DTCANCEL IS NULL 
  AND pcpedc.CODUSUR = e.CODUSUR and pcpedc.codsupervisor=d.codsupervisor)>0
GROUP BY
 d.CODSUPERVISOR,
 e.CODUSUR, e.NOME  , d.nome
  order by e.codusur



SELECT 
--COUNT(DUPLIC) QT 
*
FROM PCPREST 
WHERE DTEMISSAO BETWEEN TRUNC(SYSDATE-9) AND TRUNC(SYSDATE-1) 
AND CODCOB IN ( '002' ) AND DTPAG IS NULL AND CODFILIAL IN ( 1, 2 ) AND NOSSONUMBCO IS NULL

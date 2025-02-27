SELECT

  SYSDATE,
  TRUNC(SYSDATE) AS "SYSDATE"
, TRUNC(SYSDATE, 'DD')- LEVEL+1 DIA
, TRUNC(SYSDATE, 'MM') PRIMEIRO_DIA_MES
, ADD_MONTHS(TRUNC(SYSDATE, 'YYYY'), LEVEL-1) AS PRIMEIRO_DIA_CADA_MESES
, LAST_DAY( ADD_MONTHS(TRUNC(SYSDATE, 'YY'), LEVEL-1)) ULTIMO_DIA_CADA_MESES
, TRUNC(LAST_DAY(SYSDATE)) ULTIMO_DIA_MES
, TRUNC(SYSDATE, 'YY') PRIMEIRO_DIA_ANO
, TO_CHAR(TRUNC(SYSDATE, 'DD'), 'DD') DIA
, TO_CHAR(TRUNC(SYSDATE, 'MM'), 'MM') MES
, TO_CHAR(TRUNC(SYSDATE, 'YYYY'), 'YYYY') ANO

FROM DUAL
CONNECT BY LEVEL <= 12

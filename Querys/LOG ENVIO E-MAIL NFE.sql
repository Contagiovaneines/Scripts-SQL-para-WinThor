SELECT
*
FROM PCLOGENVIOEMAIL E
WHERE TRUNC(E.DATAENVIO) = TO_DATE('05/06/2020', 'DD/MM/YYYY')
AND E.NUMTRANSACAO = 30717507

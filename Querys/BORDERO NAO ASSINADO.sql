SELECT COUNT(P.RECNUM) QT 
FROM PCLANC P 
WHERE P.DTLANC >= TRUNC(SYSDATE-366) 
AND P.NUMBORDERO IS NOT NULL 
AND P.VPAGOBORDERO IS NULL 
AND P.DTASSINATURA IS NULL

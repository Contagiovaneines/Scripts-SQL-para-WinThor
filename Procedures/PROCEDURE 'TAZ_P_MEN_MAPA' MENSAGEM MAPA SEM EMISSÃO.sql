CREATE OR REPLACE PROCEDURE TAZ_P_MEN_MAPA
IS
  QTPED number;
  PEDIDO VARCHAR2(10);
BEGIN
    PEDIDO := 'PEDIDO';
    SELECT
        COUNT(P.NUMPED) INTO QTPED
        FROM PCPEDC P
        WHERE NVL(P.NUMVIASMAPASEP, 0) = 0
        AND P.DATA >= TRUNC(SYSDATE-180)
        AND P.POSICAO NOT IN ('C', 'F', 'B')
        AND P.ORIGEMPED = 'T'
        AND (((NVL(P.VENDAASSISTIDA, 'N') = 'S') AND (P.CONDVENDA = 8) AND 
                    ((SELECT PC.POSICAO 
                          FROM PCPEDC PC 
                         WHERE PC.CONDVENDA = 7 
                           AND NVL(PC.VENDAASSISTIDA, 'N') = 'S' 
                           AND PC.NUMPED = P.NUMPEDENTFUT) = 'F')) OR 
                    (NVL(P.VENDAASSISTIDA, 'N') = 'N'));
IF(QTPED > 0)THEN
    IF(QTPED >= 2)THEN 
        PEDIDO := 'PEDIDOS';
    END IF;
       INSERT INTO PCRECFUNC 
                (
                CODFUNCAB
               , CODFUNCRE
               , DTAB
               , CODFUNCDEST
               , ASSUNTO
               , TEXTORECADO
               , NUMRECADO)
         VALUES (
                 50
               , 50
               , SYSDATE
               , 50
               , 'EXISTE ' || QTPED || ' ' || PEDIDO || ' PARA IMPRIMIR MAPA'
               , 'USA A ROTINA 931 PARA EMITIR OS MAPA DE SEPARAÇÃO'
               , DFSEQ_PCRECFUNC.NEXTVAL);
               COMMIT;   
END IF;    
END;

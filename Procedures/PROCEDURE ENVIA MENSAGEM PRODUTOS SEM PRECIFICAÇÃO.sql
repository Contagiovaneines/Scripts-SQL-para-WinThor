CREATE OR REPLACE PROCEDURE TAZ_P_VPRECIFICACAO --coloque o nome que quiser para a procedure
IS
    QTPROD NUMBER;
    COD VARCHAR(100);
  CURSOR U IS 
    --select tras os funcionários quero enviar o recado no menu preencher com as matriculas.
    SELECT
        E.MATRICULA, E.NOME
    FROM PCEMPR E
    WHERE E.SITUACAO = 'A'
    AND E.MATRICULA IN (74);
BEGIN
    SELECT
       TO_CHAR( LISTAGG ( E.CODPROD, '; ' ) WITHIN GROUP (ORDER BY E.CODPROD) ) INTO COD
        FROM PCTABPR E, PCPRODUT P, PCREGIAO R
        WHERE E.CODPROD = P.CODPROD
        AND E.NUMREGIAO = R.NUMREGIAO
        AND E.NUMREGIAO = 1
        AND P.TIPOMERC = 'L'
        AND P.DTEXCLUSAO IS NULL
        AND E.PVENDA IS NULL
        AND (SELECT COUNT(*) FROM PCMOV WHERE CODPROD = E.CODPROD) > 0;
        
        QTPROD := TO_NUMBER( REGEXP_COUNT(COD, '\d+') );

IF(QTPROD > 0)THEN
    --entra em um for loop para enviar os recados no menu do winthor para as matriculas colocou no primeiro select
    FOR rec IN U
    LOOP
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
                rec.matricula
               , rec.matricula
               , SYSDATE
               , rec.matricula
               , 'PRODUTOS SEM PRECIFICAÇÃO: '|| QTPROD
               , 'OS PRODUTOS '|| COD ||' NÃO FORAM PRECIFICADOS'||CHR(13)||CHR(10)||'VEJA NA ROTINA 201 A PRECIFICAÇÃO DOS MESMOS'||CHR(13)||CHR(10)||CHR(13)||CHR(10)||'MENSAGEM ENVIADO SETOR: COMPRAS'
               , DFSEQ_PCRECFUNC.NEXTVAL);
               COMMIT;
    END LOOP;   
END IF;    
END;

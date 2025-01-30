CREATE OR REPLACE TRIGGER TAZ_TRG_BK_REMESSA_CANC
 BEFORE 
 INSERT OR UPDATE OF CODCOB, DTCANCEL
 ON PCPREST
 REFERENCING OLD AS OLD NEW AS NEW
 FOR EACH ROW
 DECLARE
  CURSOR c_t IS
  SELECT e.matricula, e.nome FROM pcempr e where e.situacao = 'A' and e.matricula in (33, 74, 77);
     
BEGIN
    IF(:OLD.CODCOB = '002') THEN
        IF(:NEW.CODCOB = 'CANC') THEN
            IF(:OLD.NUMREMESSA IS NOT NULL) THEN   
                    FOR rec IN c_t
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
                           , 'NF COM BOLETO CANCELADO REMESSA ENVIADA: '
                           , 'FOI CANCELADO UMA NF AONDE EXISTIA UM BOLETO COM A REMESSA JÁ ENVIADA!'||CHR(13)||CHR(10)||'NOSSO NUMERO: '||:NEW.NOSSONUMBCO||CHR(13)||CHR(10)||'CLIENTE: '||:NEW.CODCLI||CHR(13)||CHR(10)||'DUPLICATA: '||:NEW.DUPLIC||'-'||:NEW.PREST||CHR(13)||CHR(10)||'ENVIAR REMESSA DE CANCELAMENTO NA 1510 OU BAIXAR NO ECOBRANÇA.'
                           , DFSEQ_PCRECFUNC.NEXTVAL);
                           COMMIT;
                    END LOOP;
            END IF;
        END IF;    
    END IF; 
END;

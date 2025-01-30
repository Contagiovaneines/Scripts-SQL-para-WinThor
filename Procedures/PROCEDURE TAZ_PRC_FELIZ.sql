CREATE OR REPLACE 
PROCEDURE TAZ_PRC_FELIZ
IS
CURSOR c_t IS
      SELECT
            E.MATRICULA, E.NOME
        FROM PCEMPR E
        WHERE E.SITUACAO = 'A'
        AND E.CODSETOR IN (1, 3, 4, 7, 14, 16, 19)
        AND TO_CHAR(E.DTNASC, 'DD/MM') = TO_CHAR(TRUNC(SYSDATE), 'DD/MM');
BEGIN
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
           , 'FELICIDADES '||rec.nome
           , 'FELIZ ANIVERSÁRIO, QUE SUA VIDA SEJA MARAVILHOSA E CHEIA DE REALIZAÇÕES! ATENCIOSAMENTE AÇO POTIGUAR'
           , DFSEQ_PCRECFUNC.NEXTVAL);
           COMMIT;
  END LOOP;
END;

--CHAMAR PROCEDURE
--EXEC NOME_PROCEDURE;


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
            74
           , 74
           , SYSDATE
           , 74
           , 'FELICIDADES'
           , 'PARABÉNS FELIZ ANIVERSÁRIO'
           , DFSEQ_PCRECFUNC.NEXTVAL);
           
            commit;

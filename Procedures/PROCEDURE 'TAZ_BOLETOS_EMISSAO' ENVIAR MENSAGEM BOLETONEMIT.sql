CREATE OR REPLACE PROCEDURE TAZ_BOLETOS_EMISSAO --coloque o nome que quiser para a procedure
IS
  QTPED number;
  CURSOR U IS 
    --select tras os funcionários quero enviar o recado no menu preencher com as matriculas.
    SELECT
        E.MATRICULA, E.NOME
    FROM PCEMPR E
    WHERE E.SITUACAO = 'A'
    AND E.MATRICULA IN (17, 30, 33, 50, 74, 77);
BEGIN
 -- select verificar se tem algum boleto não emitido no dia anterior e ate 8 dias antes.
 --preencher com o codcob das suas cobrança boletos e com os codfilial da empresa
    SELECT 
    COUNT(DUPLIC) QT INTO QTPED
    FROM PCPREST 
    WHERE DTEMISSAO BETWEEN TRUNC(SYSDATE-9) AND TRUNC(SYSDATE-1) 
    AND CODCOB IN ( '002' ) AND DTPAG IS NULL AND CODFILIAL IN ( 1, 2 ) AND NOSSONUMBCO IS NULL;
--aqui verificar se a quantidade de boletos não emitidos for maior que 0 entra no if
IF(QTPED > 0)THEN
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
               , 'BOLETOS NÃO EMITIDOS: '|| QTPED
               --para quebrar a linhas utilizo chr(13) e chr(10) que corresponde ao CRLF de quebra de linha
               , 'VERIFIQUE NA ROTINA DE EMISSÃO DE BOLETOS, POIS NÃO FORAM EMITIDOS BOLETOS NO DIA ANTERIOR DE ALGUM PEDIDO QUE FOI FATURADO!'||CHR(13)||CHR(10)||'APÓS E EMISSÃO DOS BOLETOS E ENVIADO PARA O CLIENTE COMUNICAR O RESPONSÁVEL POR ENVIAR REMESSA PARA O BANCO DESTES RESPECTIVOS BOLETOS.'||CHR(13)||CHR(10)||CHR(13)||CHR(10)||'MENSAGEM ENVIADO PARA SETORES: FATURAMENTO, ROTAS E GESTORES.'
               , DFSEQ_PCRECFUNC.NEXTVAL);
               COMMIT;
    END LOOP;   
END IF;    

END;

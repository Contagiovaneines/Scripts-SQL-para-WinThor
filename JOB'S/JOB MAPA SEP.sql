/* ESTE JOB EXECUTA A PROCEDURE TAZ_P_MEN_MAPA QUE ENVIA UM RECADO NO MENU DO WINTHOR 
AVISANDO TEM MAPA SEPARAÇÃO A SER EMITIDO NA 931 DE HORA EM HORA DAS 08 AS 17  
PRA ESTE JOB FUNCIONAR TEM DE ESTAR COM ESTA PROCEDURE FUNCIONAL!!*/
BEGIN
  DBMS_SCHEDULER.CREATE_JOB (
   job_name           =>  'POTIGUAR.JOB_TAZ_MEN_MAPA',
   job_type           =>  'STORED_PROCEDURE',
   job_action         =>  'POTIGUAR.TAZ_P_MEN_MAPA',
   start_date         =>  SYSDATE,
   repeat_interval    =>  'FREQ=DAILY; BYHOUR=08,09,10,11,12,13,14,15,16,17', /* vai ser executada 5 em 5 minutos */
   end_date           =>  NULL,
   enabled            =>  TRUE, 
   auto_drop          =>  FALSE,
   comments           =>  'Job roda procedure envia um recado no menu do winthor se tem mapa separação ser impresso!'); --comentário
END;


/*
--ALTERAR UMA JOB
BEGIN
  DBMS_SCHEDULER.SET_ATTRIBUTE
  (
   NAME         =>  'POTIGUAR.JOB_TAZ_MEN_MAPA',
   ATTRIBUTE    =>  'REPEAT_INTERVAL',
   VALUE        =>  'FREQ=MINUTELY;INTERVAL=05'
  );
END;
*/

--apagar
BEGIN
  DBMS_SCHEDULER.DROP_JOB ('JOB_TAZ_MEN_MAPA');
END;

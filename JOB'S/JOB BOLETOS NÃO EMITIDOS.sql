/* ESTE JOB EXECUTA A PROCEDURE TAZ_BOLETOS_EMISSAO QUE ENVIA UM RECADO NO MENU DO WINTHOR 
AVISANDO QUE TEM BOLETOS SEM EMISSÃO NA 1504 RODA UMA VEZ POR DIA AS 04H  
PRA ESTE JOB FUNCIONAR TEM DE ESTAR COM ESTA PROCEDURE FUNCIONAL!!*/
BEGIN
  DBMS_SCHEDULER.CREATE_JOB (
   job_name           =>  'POTIGUAR.JOB_TAZ_BOLETOS_MENSAGEM',
   job_type           =>  'STORED_PROCEDURE',
   job_action         =>  'POTIGUAR.TAZ_BOLETOS_EMISSAO',
   start_date         =>  SYSDATE,
   repeat_interval    =>  'FREQ=DAILY;BYHOUR=04;BYMINUTE=00', /* vai ser executada todo dia as 04:00 */
   end_date           =>  NULL,
   enabled            =>  TRUE, --vai ser criado ativa poderia ser FALSE e depois habilitada
   auto_drop          =>  FALSE,
   comments           =>  'Job roda procedure que verifica se tem algum boleto não emitidos se tiver enviar um recado no menu winthor!'); --comentário
END;

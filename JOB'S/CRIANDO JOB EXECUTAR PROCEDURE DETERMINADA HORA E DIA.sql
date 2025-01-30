--Criando uma JOB para rodar uma vez por dia e hora expecifica
BEGIN
  DBMS_SCHEDULER.CREATE_JOB (
   job_name           =>  'POTIGUAR.JOB_TAZ_FELICITACOES',
   job_type           =>  'STORED_PROCEDURE',
   job_action         =>  'POTIGUAR.TAZ_PRC_FELIZ',
   start_date         =>  SYSDATE,
   repeat_interval    =>  'FREQ=DAILY;BYHOUR=05;BYMINUTE=00', /* vai ser executada todo dia as 05:00 */
   end_date           =>  NULL,
   enabled            =>  TRUE, --vai ser criado ativa poderia ser FALSE e depois habilitada
   auto_drop          =>  FALSE,
   comments           =>  'Job executa procedure envia mensagem no winthor para aniversariantes!'); --comentário
END;

--Ativar e desativar uma JOB
exec DBMS_SCHEDULER.ENABLE('NOME_JOB');

exec DBMS_SCHEDULER.DISABLE('NOME_JOB');

--Executar uma JOB e parar
exec DBMS_SCHEDULER.RUN_JOB('NOME_JOB');
exec DBMS_SCHEDULER.STOP_JOB('NOME_JOB');
--remover JOB
--exec DBMS_SCHEDULER.DROP_JOB ('NOME_JOB');

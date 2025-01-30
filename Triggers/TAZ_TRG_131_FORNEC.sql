CREATE OR REPLACE TRIGGER TAZ_TRG_131_FORNEC
 BEFORE 
 INSERT
 ON PCFORNEC
 REFERENCING OLD AS OLD NEW AS NEW
 FOR EACH ROW 
DECLARE
  CURSOR c_t IS
  SELECT e.matricula FROM pcempr e where e.situacao = 'A' and e.codsetor not in (9, 12, 18);
BEGIN
  FOR rec IN c_t
  LOOP
  INSERT INTO pclib (codfunc
  ,codtabela
  ,codigoa
  ,codigon
  ,codfunc_lib
  ,data_lib)
  VALUES (rec.matricula
  ,3
  ,' '
  ,:new.codfornec
  ,1
  ,SYSDATE);
  END LOOP;
END;
/* Trigger para quando inserir uma nova linha na pcfornec o mesmo ser liberado o acesso para as matriculas acima descritas
no select na PCEMPR neste caso não mais necessário toda vida add um novo fornecedor ir na 131.  Tairone Morais - Analista de T.I Aço Potiguar
31/03/2017 */
/* Atualiza dia 31/01/2019 alterado o select do cursor para trazer somente os empregados ativos*/

update pcpedi set posicao = 'L',numcar=''where numped= 1090009186;

update pcpedc set dtinicialcheckout='',dtfinalcheckout='',posicao='L',numcar='' where numped = 1090009186 ;

commit;

--liberar apenas pedidos que estão como M, F nunca
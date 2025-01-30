SELECT a.numcar,a.numnotas ,a.destino, a.codmotorista,
b.nome,b.celular, c.codveiculo, c.descricao, c.placa, 
a.totpeso,c.pesocargakg, a.vltotal, :dtmontagem
FROM pccarreg a, pcempr b, pcveicul c
WHERE             
a.datamon = :dtmontagem
 --and a.codrotaprinc=d.rota 
and a.codmotorista = b.matricula
and a.codveiculo = c.codveiculo
and a.codmotorista not in (5501,9038)
and a.codveiculo not in(5505)
ORDER BY b.matricula
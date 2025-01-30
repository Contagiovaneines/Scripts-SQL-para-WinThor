# Scripts SQL para WinThor

## Visão Geral
Este repositório contém diversos scripts SQL utilizados no ERP WinThor da Totvs. Os arquivos estão organizados por funcionalidades como relatórios, atualizações, triggers e consultas para gestão de dados no sistema.

## Estrutura de Arquivos
Os arquivos SQL estão nomeados conforme seu tipo e função:

### 1. Relatórios (rel_)
Scripts voltados para a extração de dados e análises:
- `rel_entregas.sql` - Relatório de entregas por carregamento.
- `rel_titulos_prorrogados.sql` - Relatório de títulos prorrogados por rotina.
- `rel_vendas.sql` - Relatório de vendas de produtos por cidade.

### 2. Atualizações e Manutenções (upd_)
Scripts usados para alterações diretas no banco:
- `upd_precificacao.sql` - Atualização de precificação e transporte.
- `upd_clientes.sql` - Atualização e manutenção de dados de clientes.
- `upd_pedidos.sql` - Correção e ajustes em pedidos faturados.

### 3. Triggers (trg_)
Scripts que gerenciam eventos automáticos no banco:
- `trg_alteracoes.sql` - Registro de alterações na base de dados do WinThor.
- `trg_bloqueio_usuarios.sql` - Trigger de bloqueio de usuários inativos.

### 4. Procedures e Funções (proc_)
Códigos que automatizam processos no sistema:
- `proc_faturamento.sql` - Procedimento para faturamento automatizado.
- `proc_registro_pce.sql` - Geração automática de registros PCEST.
- `proc_pedidos.sql` - Controle e gestão de pedidos.

### 5. Outras Consultas e Logs
- `log_alteracoes.sql` - Registro de alterações nos dados de PCPRODUT.
- `lock_usuario.sql` - Bloqueio de usuários no banco de dados.
- `view_atualizacao.sql` - Atualização e correção de views do sistema.

## Como Utilizar
1. Certifique-se de ter permissões adequadas no banco de dados WinThor.
2. Antes de rodar qualquer script de **atualização ou manutenção**, faça backup do banco.
3. Execute os scripts diretamente no SQL Server Management Studio ou ferramenta de sua escolha.

## Contato
Caso tenha dúvidas ou precise de suporte sobre os scripts, entre em contato com a equipe de TI da AG Distribuidora.

---
Este repositório é de uso interno e deve ser manipulado apenas por usuários autorizados.


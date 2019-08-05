select * from ItemVenda;
select * from NotaFiscal;
select * from Produto;
select * from Cliente;
select * from Funcionario;
select * from Departamento;

-- 1) Crie uma view que liste os dados de funcionários (nome, cpf, salario, dataNascimento, sexo e nome do departamento)
CREATE VIEW DadosFuncionario AS (
	select Funcionario.nome as nomeFuncionario, Funcionario.cpf, Funcionario.salario, Funcionario.datanascimento, Funcionario.sexo, Departamento.nome 
as nomeDepartamento from Funcionario inner join Departamento on Funcionario.coddepartamento = Departamento.coddepartamento 
)
select * from DadosFuncionario

-- 2) Crie uma view que liste o número de compras e o total em reais comprado por cada cliente (o nome e cpf do cliente)
select Cliente.nome, count(NotaFiscal.codnotafiscal) as NumCompras, sum(ItemVenda.precounitvenda) as total from Cliente 
inner join NotaFiscal on Cliente.codcliente = NotaFiscal.codcliente
GROUP BY Cliente.codcliente order by Cliente.codcliente 
inner join ItemVenda on NotaFiscal.codnotafiscal = ItemVenda.codnotafiscal
GROUP BY NotaFiscal.codnotafiscal order by NotaFiscal.codnotafiscal

--3) Faça uma consulta que liste o nome dos funcionários e departamentos. Faça uma view para cada item de listagem pedido:
--a. Apenas funcionários alocados em um departamento e departamentos com funcionários.
--b. Todos funcionários e apenas departamentos com funcionários.
--c. Apenas funcionários alocados em um departamento e todos os departamentos.
--d. Todos funcionários e todos departamentos.
--Após criar as views, insira 2 departamentos sem funcionários e 2 funcionários sem vinculo a um departamento e observe as mudanças nas views.

select Funcionario.nome as nomeFuncionario, Departamento.nome 
as nomeDepartamento from Funcionario LEFT OUTER JOIN Departamento on Funcionario.coddepartamento = Departamento.coddepartamento 

select Funcionario.nome as nomeFuncionario, Departamento.nome 
as nomeDepartamento from Funcionario LEFT OUTER JOIN Departamento on Funcionario.coddepartamento = Departamento.coddepartamento 
where Funcionario.coddepartamento is not null

select * from Funcionario;
select * from Departamento;




































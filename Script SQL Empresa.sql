create database empresa;
use empresa;
show databases;
create table Setor (
codigoSetor int auto_increment primary key,
nomeSetor varchar(30) not null,
localSetor varchar(20));
show tables;
/*drop table Funcionarios;*/
create table Funcionario(
matFuncionario int auto_increment primary key,
nomeFuncionario varchar(50) not null,
nascFuncionario date,
codigoSetor int,
 foreign key(codigoSetor) references Setor(codigoSetor));
 create table Dependente(
 codDependente int auto_increment primary key,
 nomeDependente varchar(50) not null,
 parDependente varchar(20) not null,
 nascDependente date,
 matFuncionario int,
 /*relacionamento de dependente com funcionario pelo campo matFuncionario*/
 foreign key(matFuncionario) references funcionario(matFuncionario)
 on delete cascade on update cascade/*se o funcionario for deletado ou atualizado todos seus dependente tambem serão*/);
 desc Setor;
 desc Funcionario;
 alter table Funcionario rename to Funcionarios;
 alter table Dependente rename to Dependentes;
 alter table Funcionarios modify nascFuncionario date not null;
 alter table Dependentes modify nascDependente date not null;
 alter table Dependentes add column sexoDependente varchar(1);
 desc Dependentes;
 insert into Setor (nomeSetor, localSetor) values("Contabilidade","3º Andar");
 select * from Dependentes;
 insert into Setor (nomeSetor,localSetor)
 values("Portaria","Terreo");
 insert into Setor (nomeSetor,localSetor)
 values("Tesouraria","14° Andar"),
       ("RH","1° Andar"),
       ("Secretaria","2° Andar"),
       ("Diretoria",("5º Andar"));
/*deletar quando condisetor dor maior que 6 
delete from Setor
where codigoSetor > 6;*/
update Setor set localSetor="4°andar" where codigoSetor="2";
insert into Funcionarios(nomeFuncionario,nascFuncionario,codigoSetor)
values ("Antonia","1975-10-25","2"),
	   ("Cláudio","1999-05-11","4"),
       ("José da silva","1980-01-01","1"),
       ("Ana Carolina","1991-07-03","4"),
       ("Roberta","1995-03-15","6");      
insert into Dependentes(nomeDependente,parDependente,nascDependente,matFuncionario,sexoDependente)
values ("Pedro","Filho","2009-10-25",2,"M"),
	   ("Raissa","Enteada","1999-08-31","5","F"),
       ("Felipe","Filho","2010-10-19","1","M"),
       ("Maria Luiza","Esposa","1995-02-18","1","F"),
       ("Joyce","Irmã","1998-07-01","3","F"),
       ("Roberto","Pai","1965-04-12","2","M"),
       ("Antonieta","Filha","2001-06-30","1","F"),
       ("Nathan","Filho","2000-05-23","4","M");
select * from Dependentes where sexoDependente="F"
and parDependente like "E%";
select * from SETOR;
insert into SETOR(nomeSETOR, localSETOR)
values ("Biblioteca", "1º Andar"),
	   ("Gerência", "6º Andar");
update SETOR
set localSETOR = "6º Andar"
where codigoSETOR = 3;
alter table FUNCIONARIOS
add column cidFUNCIONARIO varchar(50);
insert into FUNCIONARIOS(nomeFUNCIONARIO, nascFUNCIONARIO,
                         codigoSETOR, cidFUNCIONARIO)
values ("Breno", "1999-09-04", 7, "Contagem");
select * from FUNCIONARIOS;
update FUNCIONARIOS
set cidFUNCIONARIO = "Nova Lima"
where cidFUNCIONARIO is null;
select * from SETOR;
update SETOR
set localSETOR = "4º Andar"
where nomeSETOR = "Gerência"; 
desc funcionarios;
create table Cargo(codCargo int auto_increment primary key,nomeCargo varchar(30)not null,salCargo decimal(5.2) not null);
/*adcionar coluna na tabela*/
alter table Funcionarios add column codCargo int;
/*alterar coluna codCargo da tabela funcionarios */
alter table Funcionarios modify column codCargo double not null;
alter table Funcionarios drop column codCargo ;
alter table Funcionarios add column codCargo int not null;
desc funcionarios;
insert into Cargo(nomeCargo,salCargo)
values ("Gerente",3500.00),("Auxiliar Administrativo",800.00),("Secretaria",1500.00),("Programador",1800.00),("Tesoureiro",3200.00);
select * from Cargo;
select * from dependentes;
select * from funcionarios;
select * from setor;
/*atribuição de valor aleatorio de cargo ao funcionario*/
update funcionarios set codcargo=1  where codcargo=0;
alter table funcionarios add foreign key(codCargo)references Cargo(codCargo);
insert into Funcionarios(nomeFuncionario,nascFuncionario,codigoSetor,codCargo)
values ("Antonia","1975-10-25","2",5);


create table funcionarios (
	Id int identity (1,1) not null primary key,
	Nome Varchar(100) unique not null
);

create table telefones (
	Telefone numeric not null primary key,
	IdFuncionario int references funcionarios(Id)
);

Insert into funcionarios(Nome) values ('Marcos'),('Maria'),('Julia');
Insert into telefones(IdFuncionario, Telefone) values (1, 3654589),(1, 36545987),(2, 3654698),(2, 36524569),(3, 3656942),(3, 12365458);

create table cargos (
	Id int identity(1,1) not null primary key,
	Cargo varchar(50) unique not null
);

Insert  into cargos (Cargo) values ('Atendente'),('Gerente');

select * from funcionarios order by Id asc
select * from cargos order by Id asc
select * from telefones order by IdFuncionario asc, Telefone asc

create table funcionarios_x_cargos (
	IdFuncionario int references funcionarios(Id) not null,	
	IdCargo int references cargos(Id) not null
);

alter table funcionarios_x_cargos add primary key(IdFuncionario, IdCargo);

insert into funcionarios_x_cargos(IdFuncionario, IdCargo) values (1,1),(2,2),(3,1);

select funcionarios.Id, funcionarios.Nome, cargos.Cargo, telefones.Telefone from (((funcionarios_x_cargos 
   inner join funcionarios on funcionarios_x_cargos.IdFuncionario = funcionarios.Id)
   inner join cargos on funcionarios_x_cargos.IdCargo = cargos.Id)
   inner join telefones on funcionarios.Id = telefones.IdFuncionario)
   order by funcionarios.Id asc, cargos.Id asc


   
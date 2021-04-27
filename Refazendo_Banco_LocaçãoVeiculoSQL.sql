
CREATE TABLE Categoria (
	id	 	int 	not 	null identity
	,nome	char(25) not null
	,valorDiario numeric(6,2) not null
	,constraint PK_Categoria primary key(id)

);


CREATE TABLE Cliente (
	id	int 	not null identity	
	,nome	char(25)	not null
	,endereco char(30)	null
	,telefone char(11) not null
	,constraint PK_Cliente primary key(id)

);


ALTER TABLE Cliente 	add SEXO	char (01) 	not null;
ALTER TABLE Cliente 	add UF 		char (02)	null;
ALTER TABLE CLiente 	add 		constraint PK_Cliente primary key(id);
ALTER TABLE Cliente		drop 		constraint PK_Cliente;
--ALTERANDO A TABLE MEXENDO NO OBJETO EM SI, NAO NO CONTEUDO...  ALTER TABLE	Categoria	drop constraint PK_Categoria;


CREATE TABLE Veiculo (
	placa	char(07)	not null identity
	,anoFabricacao int not null
	,situacao	char(01) not null	default 'D' --('M', 'R', 'D', 'A')
	,idCategoria int not null
	,constraint PK_Veiculo primary key(placa)
	,constraint FK_Veiculo_Categoria foreign key(id) references Categoria(id)
);

CREATE TABLE Reserva (
	id 	int 	not null 	identity
	,data 	smalldatetime 	not null 
	,hora		char(05)	not null
	,idCliente 	 int 		not null
	,idCategoria int 		null
	,constraint PK_Reserva primary key(id)
	,constraint FK_Reserva_Cliente foreign key(idCliente)references Cliente(id)
	,constraint FK_Veiculo_Categoria foreign key(idCategoria) references Categoria(id)
);

CREATE TABLE Locacao(
	
	id	int 	not null identity
	,dataInicio smalldatetime not null
	,dataFim 	smalldatetime not null
	,placa 		char(07) not null
	,idCliente int 	not null
	,idRerserva int not null
	,constraint PK_Locacao primary key(id)
	,constraint FK_Locacao_Veiculo foreign key (placa) 		references Veiculo(id)
	,constraint FK_Locacao_Cliente foreign key (idCliente) 	references Cliente(id)
	,constraint FK_Locacao_Reserva foreign key (idReserva) 	references Reserva(id)
	
);

CREATE TABLE Pagamento (
	id 		int 					not null 	identity
	,valor		numeric(8,2) 		not null
	,formaPagamento 	char(02)	not  null 	default 'DI' --('CC', 'DI', 'CD')
	,idLocacao			int 		not null
	,constraint PK_Pagamento primary key(id)
	,constraint FK_Pagamento_Locacao foreign key(idLocacao) references Locacao(id)

);

CREATE formaPagamento(

	id	integer 	not null 	identity
	,

);

DELETE TABLE FROM Pagamento where valorDiario < 90.00;

ALTER TABLE 	Pagamento 	add 	id 	int	not null;
ALTER TABLE 	Pagamento 	drop	id;

SELECT * FROM Veiculo;
SELECT nome FROM Veiculo WHERE Categoria like '%Básico';
SELECT * FROM Veiculo WHERE Categoria not like '%SUV%';


UPDATE Categoria set nome=	'Polular 1.0 sem Ar';
UPDATE Categoria set nome=  'SUV - 4 porta'


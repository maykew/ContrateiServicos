CREATE TABLE Usuario (
    codigo int PRIMARY KEY,
    nome_usuario varchar(30),
    email varchar(50),
    sexo char,
    senha varchar(30),
    nome_completo varchar(60),
    data_nascimento date,
    cpf varchar(14),
    data_cadastro date
);

CREATE TABLE Servico (
    codigo int PRIMARY KEY,
    codigo_prestador int,
    nome varchar(60),
    descricao varchar(500),
    preco decimal(10,2),
    codigo_modo_pagamento int,
    data_publicacao date
);

CREATE TABLE Contato (
    codigo_usuario int,
    telefone varchar(14)
);

CREATE TABLE Endereco (
    codigo int PRIMARY KEY,
    cep varchar(9),
    endereco varchar(100),
    numero int,
    codigo_bairro int,
    codigo_cidade int
);

CREATE TABLE Agendamento (
    codigo int PRIMARY KEY,
    codigo_servico int,
    codigo_cliente int,
    codigo_endereco int,
    data date,
    hora varchar(5)
);

CREATE TABLE Modo_pagamento (
    codigo int PRIMARY KEY,
    modo varchar(50)
);

CREATE TABLE Avaliacoes (
    codigo_servico int,
    avaliacao int,
    comentario varchar(150)
);

CREATE TABLE Bairro (
    codigo int PRIMARY KEY,
    nome varchar(50)
);

CREATE TABLE Cidade (
    codigo int PRIMARY KEY,
    nome varchar(50)
);

CREATE TABLE usuario_endereco (
    codigo_usuario int,
    codigo_endereco int
);
 
ALTER TABLE Servico ADD CONSTRAINT FK_Servico_2
    FOREIGN KEY (codigo_prestador)
    REFERENCES Usuario (codigo)
    ON DELETE CASCADE;
 
ALTER TABLE Servico ADD CONSTRAINT FK_Servico_3
    FOREIGN KEY (codigo_modo_pagamento)
    REFERENCES Modo_pagamento (codigo)
    ON DELETE CASCADE;
 
ALTER TABLE Contato ADD CONSTRAINT FK_Contato_1
    FOREIGN KEY (codigo_usuario)
    REFERENCES Usuario (codigo)
    ON DELETE RESTRICT;
 
ALTER TABLE Endereco ADD CONSTRAINT FK_Endereco_2
    FOREIGN KEY (codigo_bairro)
    REFERENCES Bairro (codigo)
    ON DELETE RESTRICT;
 
ALTER TABLE Endereco ADD CONSTRAINT FK_Endereco_3
    FOREIGN KEY (codigo_cidade)
    REFERENCES Cidade (codigo)
    ON DELETE RESTRICT;
 
ALTER TABLE Agendamento ADD CONSTRAINT FK_Agendamento_2
    FOREIGN KEY (codigo_cliente)
    REFERENCES Usuario (codigo)
    ON DELETE CASCADE;
 
ALTER TABLE Agendamento ADD CONSTRAINT FK_Agendamento_3
    FOREIGN KEY (codigo_endereco)
    REFERENCES Endereco (codigo)
    ON DELETE CASCADE;
 
ALTER TABLE Agendamento ADD CONSTRAINT FK_Agendamento_4
    FOREIGN KEY (codigo_servico)
    REFERENCES Servico (codigo)
    ON DELETE CASCADE;
 
ALTER TABLE Avaliacoes ADD CONSTRAINT FK_Avaliacoes_1
    FOREIGN KEY (codigo_servico)
    REFERENCES Servico (codigo)
    ON DELETE CASCADE;
 
ALTER TABLE usuario_endereco ADD CONSTRAINT FK_usuario_endereco_1
    FOREIGN KEY (codigo_endereco)
    REFERENCES Endereco (codigo)
    ON DELETE RESTRICT;
 
ALTER TABLE usuario_endereco ADD CONSTRAINT FK_usuario_endereco_2
    FOREIGN KEY (codigo_usuario)
    REFERENCES Usuario (codigo)
    ON DELETE SET NULL;

insert into cidade values
(001,	'Aracruz'),
(002,	'Vila Velha'),
(003,	'Serra'),
(004,	'Linhares'),
(005,	'Vitoria'),
(006,	'Cariacica'),
(007,	'Cachoeiro de Itapemirim');

insert into bairro values
(001,	'De Carli'),
(002,	'Aracas'),
(003,	'Central Carapina'),
(004,	'Centro da Serra'),
(005,	'Colina'),
(006,	'das Laranjeiras'),
(007,	'Caratoira'),
(008,	'Campina Grande'),
(009,	'Santa Paula I'),
(010,	'Arariguaba'),
(011,	'Movelar'),
(012,	'Paul'),
(013,	'Joana Darc'),
(014,	'Alterosas'),
(015,	'Cidade da Barra'),
(016,	'Sao Torquato'),
(017,	' Rosario de Fatima'),
(018,	'Consolacao');

insert into endereco values
(001, '29194-025',	'Rua Joao da Costa Rampinelli',	150, 001, 001),
(002, '29103-021',	'Rua Atenas',	1960, 002, 002),
(003,	'29161-583',	'Rua Alfredo Chaves',	1074, 003, 003),
(004,	'29179-177',	'Rua Arrudao',	270,	004, 003),
(005,	'29900-399',  'Avenida Aracruz',	1125,	005, 004),
(006,	'29175-698',	'Rua Primavera',	689, 006, 003),
(007,	'29025-705',	'Escadaria Agripino Moreira Drumond',	676, 007, 005),
(008,	'29144-270',	'Rua Sebastiao Pedro de Oliveira',	615, 008, 006),
(009,	'29126-157',	'Rua Dalia',	506, 009, 002),
(010,	'29305-512',	'Rua Amancio Silva',	496,	010, 007),
(011,	'29906-100',	'Rua Pinheiro',	1941,	011, 004),
(012,	'29115-107',	'Rua Paulo Natali',	637,	012, 002),
(013,	'29048-100',	'Rua Miguel Arcanjo Moreira',	31,	013, 005),
(014,	'29167-029',	'Rua Brasilia',	54,	014, 003),
(015,	'29124-016',	'Rua Castro Alves',	41,	015, 002),
(016,	'29114-240',	'Rua Professora Olga Feres de Cuzzi',	941,	016, 002),
(017,	'29161-583',	'Rua Alfredo Chaves',	854, 003, 003),
(018,	'29179-177',	'Rua Arrudao',	2,	004, 003),
(019,	'29161-192',	'Rua dos Curios',	451,	017, 003),
(020,	'29175-698',	'Rua Primavera',	364,	006, 003),
(021,	'29045-605',	'Escadaria Abrao Sader',	75,	018, 005),
(022,	'29048-100',	'Rua Miguel Arcanjo Moreira',	87,	013, 005);

insert into modo_pagamento values
(001,	'Dinheiro e cartao'),
(002,	'Dinheiro');

insert into usuario values
(001,'mosouza','MiguelOliveiraSouza@gmail.com','M','mortadela5','Miguel Oliveira Souza', '1967/09/28','470.750.937-11','2019/07/22'),
(002,'mlribeiro','MarianaLimaRibeiro@gmail.com','F','Eibai6chee','Mariana Lima Ribeiro','2000/05/30','157.779.187-86','2019/02/23'),
(003,'krpinto','KauanRochaPinto@hotmail.com','M','kovuR6sh','Kauan Rocha Pinto','1990/03/18','496.245.022-00','2019/09/23'),
(004,'alsilva','AlineLimaSilva@hotmail.com','F','ru4cohseCh','Aline Lima Silva','1998/05/17','621.541.500-63','2018/02/15'),
(005,'lasousa','LeonorAzevedoSousa@gmail.com','F','ug2QuoLahje','Leonor Azevedo Sousa','1983/12/03','495.836.132-40','2019/01/12'),
(006,'fmbarros','FabioMeloBarros@hotmail.com','M','Wug3iria6','Fabio Melo Barros','1959/03/16','362.698.964-01','2019/06/13'),
(007,'lcrodrigues','LuisCarvalhoRodrigues@hotmail.com','M','ach9Ooch','Luis Carvalho Rodrigues','1979/07/13','779.033.598-78','2019/07/31'),
(008,'cralves','ClaraRochaAlves@yahoo.com.br','F','Chiexe7otu3','Clara Rocha Alves','1984/11/25','487.398.093-31','2019/07/22'),
(009,'jgalmeida','JoaoGomesAlmeida@gmail.com','M','oG9Ii1sho','Joao Gomes Almeida','1982/03/31','805.302.543-95','2019/04/29'),
(010,'mocorreia','MartimOliveiraCorreia@hotmail.com','M','ob2IXee5oo','Martim Oliveira Correia','1988/09/10','189.096.601-04','2019/09/15'),
(011,'ybcarvalho','YasminBarrosCarvalho@gmail.com','F','Ieph3afegh','Yasmin Barros Carvalho','1965/06/03','620.590.802-66','2019/06/16'),
(012,'lcpereira','LuisCarvalhoPereira@hotmail.com','M','Meothu8lei','Luis Carvalho Pereira','2000/02/18','688.757.541-87','2019/08/20'),
(013,'rcrodrigues','RyanCarvalhoRodrigues@gmail.com','M','vaicorinthians','Ryan Carvalho Rodrigues','1998/08/21','389.195.961-31','2019/07/10'),
(014,'mssilva','MarisaSantosSilva@gmail.com','F','Pho4toongoh','Marisa Santos Silva','1998/01/22','515.134.458-71','2019/02/23'),
(015,'ipcosta','IsabellePereiraCosta@hotmail.com','F','princesadisney','Isabelle Pereira Costa','1978/04/01',	'860.051.981-06','2019/09/01'),
(016,'eccarvalho','EduardaCorreiaCarvalho@hotmail.com','F','jesusetop123','Eduarda Correia Carvalho','1971/06/30','459.188.175-06','2018/02/15'),
(017,'jpcarvalho','JosePereiraCarvalho@gmail.com','M','amominhavida','Jose Pereira Carvalho','1987/03/12','663.280.264-80','2019/01/12'),
(018,'dccastro','DiegoCardosoCastro@gmail.com','M','cardosod','Diego Cardoso Castro','1982/01/05','970.605.561-41','2019/06/13'),
(019,'vitaraujo','VitoriaAraujoPereira@hotmail.com','F','varaujo','Vitoria Araujo Pereira','1963/11/23','823.971.241-06','2019/07/31'),
(020,'jcrocha','JulietaCavalcantiRocha@yahoo.com.br','F','amomeupai','Julieta Cavalcanti Rocha','1991/05/29','770.366.643-20','2019/07/22');

insert into servico values
(001, 003, 'Manutencao de ar-condicionado', 'Instalacao - Manutencao - Higienizacao ar condicionado',	0,	001,	'2019/09/23'),
(002,	017, 'Frete',	'Faco transporte, mudancas, fretes, etc para todo o estado', 	150.00,	002,	'2018/02/15'),
(003,	006, 'Jardinagem',	'Corte de arvores e podas em geral',	0,	001,	'2019/06/13'),
(004,	008, 'Baba',	'Cuido de criancas com responsabilidade. Valor acessivel.',	60.00,	002,	'2019/07/22'),
(005,	009, 'Faxineiro',	'Faco faxinas',	90.00,	002,	'2019/04/29'),
(006,	011, 'Eletricista',	'Instalacao, alteracao, manutencao e reparo em todos os tipos de construcoes',	0,	002,	'2019/06/16'),
(007,	012, 'Pedreiro',	'Orcamento gratuito e servico de qualidade',	0,	002,	'2019/08/14'),
(008,	010, 'Motorista particular',	'Viagens, passeios e corridas rapidas!!',	0,	001,	'2018/02/14'),
(009,	005, 'Borracheiro',	'Atendimento 24 horas',	80.00,	001,	'2019/06/13'),
(010,	020, 'Baba',	'Cuido de criancas ate 6 anos.',	50.00,	002,	'2019/07/10');

insert into contato values
(001,	'(27) 4075-9797'),
(002,	'(28) 4459-2069'),
(003,	'(28) 8799-5493'),
(004,	'(27) 8570-9305'),
(005,	'(27) 5747-8945'),
(006,	'(27) 2525-7502'),
(007,	'(28) 8798-2391'),
(008,	'(27) 7163-5324'),
(009,	'(28) 3389-9972'),
(010,	'(27) 3706-4024'),
(011,	'(27) 7154-2546'),
(012,	'(27) 5079-8415'),
(013,	'(27) 9958-9797'),
(014,	'(28) 9862-2069'),
(015,	'(28) 9745-5493'),
(016,	'(27) 9945-9305'),
(017,	'(27) 9041-8945'),
(018,	'(27) 9700-7502'),
(019,	'(28) 9999-9123'),
(020,	'(27) 9688-2453');

insert into avaliacoes values
(001,	4,	'Muito bom'),
(002,	5,	'Perfeito, resolveu todo o meu problema. Servico mt rapido e atencioso'),
(003,	5,	'Ficou tudo perfeito, amei'),
(004,	5,	'Meu filho adorou'),
(005,	0,	'Atrasou e nao limpou o banheiro'),
(001,	3,	'Resolveu o problema'),
(009,	5,	'Atendimento rapido'),
(007,	4,	'Muito organizado e deixa tudo limpo'),
(010,	5,	'Muito simpatica'),
(008,	4,	'Carro limpo e com balinha');

insert into agendamento values
(001,	001,	001,  001, '2019/09/25',	'9h00'),
(002,	003,	002,  002, '2019/09/26',	'14h30'),
(003,	004,	010,  010, '2019/09/27',  '20h00'),
(004,	006,	012,	012, '2019/09/24',	'12h00'),
(005,	004,	008,	008, '2019/09/09',	'7h00'),
(006,	005,	012,	012, '2019/09/17',	'14h30'),
(007,	001,	010,	010, '2019/10/01',	'17h00'),
(008,	009,	002,	002, '2019/10/10',	'12h00'),
(009,	007,	019,	019, '2019/09/20',	'14h00'),
(010,	010,	006,	006, '2019/10/12',	'11h00'),
(011,	008,	015,	015, '2019/10/10',	'10h00'),
(012,	003,	013,	013, '2019/10/08',	'8h30'),
(013,	009,	001,	001, '2019/10/24',	'9h30'),
(014,	007,	019,	019, '2019/11/07',	'9h00'),
(015,	010,	006,	006, '2019/11/03',	'14h00'),
(016,	007,	002,	002, '2019/10/28',	'8h30'),
(017,	008,  004,	004, '2019/11/07',	'20h00'),
(018,	003,	009,	009, '2019/10/02',	'20h00'),
(019,	009,	015,	015, '2019/11/07',	'9h00'),
(020,	002,	016,	016, '2019/11/05',	'15h00');

insert into usuario_endereco values
(001,	001),
(002,	002),
(003,	003),
(004,	004),
(005,	005),
(006,	006),
(007,	007),
(008,	008),
(009,	009),
(010,	010),
(011,	011),
(012, 012),
(001,	013),
(013,	014),
(014,	015),
(002,	016),
(015,	017),
(016, 018),
(017,	019),
(018,	020),
(019,	021),
(020,	022);
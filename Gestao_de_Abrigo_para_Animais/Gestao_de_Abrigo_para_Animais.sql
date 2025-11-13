create table Animais(
ID_Animal int auto_increment primary key,
Nome varchar(20) not null,
Especie varchar(25) not null,
Raca varchar(25) not null,
Data_entrada datetime not null,
Status_Animal varchar(25) not null,
constraint check_ani check (Status_Animal in ('Disponível','disponível', 'disponivel', 'Disponivel', 'Adotado','adotado', 'Em tratamento', 'em tratamento')), -- Definindo que a coluna Status_Animal só irá aceitar esses resultados 'Disponível', 'Adotado', 'Em tratamento'.
Microchip_ID int not null
)default charset = utf8mb4;
-- ==========================================================================================================================
create table Adotantes (
ID_Adotantes int auto_increment primary key,
Nome varchar(20) not null,
Email varchar(40) not null,
Rua varchar(25) not null,
Numero varchar(5) not null,
Bairro varchar(15) not null,
Cidade varchar(15) not null,
Status_aprovacao varchar(25) not null,
constraint check_apro check ( Status_aprovacao in ( 'Pendente','pendente', 'Aprovado','aprovado', 'Rejeitado', 'rejeitado')) -- Definindo que a coluna Status_Animal só irá aceitar esses resultados 'Pendente', 'Aprovado', 'Rejeitado'.
) default charset = utf8mb4;
-- ========================================================================================================================
create table Historico_Medico(
ID_Registro int auto_increment primary key,
ID_Animal int,
foreign key (ID_Animal) -- (Definindo qual coluna será a chave estrangeira.)
references Animais (ID_Animal) -- (Definindo a referência para a chave estrangeira.)
on delete cascade -- (Define que se você exclui um Cliente, todos os Pedidos associados a esse cliente são excluídos.)
on update restrict, -- (Define que você não pode mudar o ID de um Cliente se houver Pedidos relacionados a ele.)
Data_Atendimento datetime not null,
Tipo_Servico varchar(10) not null,
constraint check_serv check ( Tipo_Servico in ('Vacina', 'vacina', 'Cirurgia', 'cirurgia','Check-up', 'check-up')),
Veterinario_Responsavel varchar (30) not null,
Observacoes varchar(50)
) default charset utf8mb4;
-- ========================================================================================================================
create table Adocoes(
ID_Adocao int auto_increment primary key,
ID_Animal int,
foreign key (ID_Animal) -- (Definindo qual coluna será a chave estrangeira)
references Animais (ID_Animal) -- (Definindo a referência para a chave estrangeira)
on delete cascade -- (Define que se você exclui um Cliente, todos os Pedidos associados a esse cliente são excluídos.)
on update restrict, -- (Define que você não pode mudar o ID de um Cliente se houver Pedidos relacionados a ele.)
ID_Adotantes int,
foreign key (ID_Adotantes) -- (Definindo qual coluna será a chave estrangeira)
references Adotantes (ID_Adotantes) -- (Definindo a referência para a chave estrangeira)
on delete cascade -- (Define que se você exclui um Cliente, todos os Pedidos associados a esse cliente são excluídos.)
on update restrict, -- (Define que você não pode mudar o ID de um Cliente se houver Pedidos relacionados a ele.)
Data_Aprovacao datetime not null,
Data_Fializacao datetime not null,
Resultado varchar (10) not null,
constraint check_resul check (Resultado in ('Sucesso', 'sucesso', 'Cancelada', 'cancelada'))
)default charset utf8mb4;

insert into animais 
(Nome, Especie, Raca, Data_entrada, Status_Animal, Microchip_ID)
values
('Zé', 'papagaio', 'papagaio do mangue', '2021-09-23 14:52:33', 'disponivel', '0932');

select * from animais;

insert into animais
(Nome, Especie, Raca, Data_entrada, Status_Animal, Microchip_ID)
values
('Paçoca', 'Cachorro', 'Vira-lata', '2024-12-12 09:09:00', 'Disponivel', '0011'),
('Ikki', 'Cachorro', 'Labrador', '2025-02-12 19:59:26', 'Disponivel', '2011'),
('Pretinho', 'Cachorro', 'Vira-lata', '2024-04-23 06:49:30', 'Disponivel', '0211'),
('Mimi', 'Gato', 'Siamês', '2025-11-12 04:00:07', 'Disponivel', '5783'),
('Nemo', 'Peixe', 'Carpa', '2014-07-12 15:03:47', 'Disponivel', '0311');

insert into animais
(Nome, Especie, Raca, Data_entrada, Status_Animal, Microchip_ID)
values
('Thor', 'Cachorro', 'Pitbul', '2017-08-19 13:34:29', 'em tratamento', '0001'),
('Happy', 'Gato', 'Siberiano' , '2017-08-22 09:21:09', 'em tratamento','0002'),
('Lily', 'Gato', 'Maine coon', '2017-08-22 11:43:59', 'disponível', '0003'),
('Tom', 'Gato', 'Siamês', '2017-08-22 15:39:02', 'Adotado', 0004);

select * from adotantes;

insert into adotantes
(Nome, Email, Telefone, Rua, Numero, Bairro, Cidade, Status_aprovacao)
value
('Vitor Hugo', 'vitor.hugo@gmail.com','55+ 11 3782-4238', 'José Pereira', '139', 'Freguesia do Ó','São Paulo', 'Aprovado'),
('Laiza Morato', 'lala.morato@gmail.com','55+ 11 97862-9981','João dos Campos', '427', 'Freguesia do Ó', 'São Paulo', 'Aprovado'),
('Breno Miguel', 'Br.miguel@gmail.com','55+ 11 4002-8922', 'Adonias da Silva', '2201', 'Sitío Morro Grande', 'São Paulo', 'Aprovado'),
('Juliana Pereira', 'Ju.pereira@gmail.com','55+ 11 3904-5832', 'José Carvalho de Souza', '30', 'Brasilândia', 'São Paulo', 'Pendente'),
('Roberta de Araujo', 'roberta.araujo@gmail.com','55+ 11 97326-4291', 'Isanga', '427', 'Vila Zatt', 'São Paulo', 'Rejeitado');

select * from historico_medico;

insert into historico_medico
(ID_Animal, Data_Atendimento, Tipo_Servico, Veterinario_Responsavel, Observacoes)
values
('7', '2023-09-29 12:32:03', 'check-up', 'Doutor Carlos Pereira', 'ND'),
('3', '2025-07-31 14:29:07', 'check-up', 'Doutora Andreia Lima', 'ND'),
('3', '2025-08-13 09:27:00', 'cirurgia', 'Doutora Andreia Lima', 'Orquiectomia'),
('2', '2024-12-12 14:13:28', 'check-up', 'Doutora Clarisse Da Silva', 'ND'),
('5', '2025-11-13 07:00:32', 'check-up', 'Doutora Clarisse Da Silva', 'ND'),
('5', '2025-11-27 13:00:00', 'vacina', 'Doutora Clarisse Da Silva', 'Antirrábica'),
('6', '2020-03-03 09:23:09', 'check-up', 'Doutor Pedro Ramos', 'ND'),
('6', '2020-03-03 14:30:09', 'vacina', 'Doutor Pedro Ramos', 'Furunculose'),
('9', '2020-05-20 12:36:05', 'check-up', 'Doutora Clarisse Da Silva', 'ND'),
('10', '2020-02-27 15:06:05', 'check-up', 'Doutora Clarisse Da Silva', 'ND'),
('8', '2022-08-20 09:33:55', 'check-up', 'Doutora Clarisse Da Silva', 'ND'),
('9', '2020-05-20 12:36:05', 'check-up', 'Doutora Clarisse Da Silva', 'ND'),
('1', '2021-11-20 10:30:45', 'check-up', 'Doutora Lucy Heartfila', 'ND'),
('4', '2024-05-20 16:46:42', 'check-up', 'Doutora Lucy Heartfilia', 'ND');

insert into adocoes
(ID_Animal, ID_Adotantes, Data_Aprovacao, Data_Finalizacao, Resultado)
values
('2', '1', '2025-03-29 08:00:02', '2025-04-03 14:00:21', 'Sucesso'),
('5', '2', '2025-05-20 07:28:39', '2025-05-27 10:00:00', 'Sucesso'),
('7', '3', '2022-12-10 09:09:23', '2025-12-20 16:47:41', 'Sucesso'),
('8', '5', '2019-04-17 10:36:00', '2019-04-25 19:42:03', 'Cancelada'),
('3', '4', '2025-06-17 16:16:00', '2025-06-25 18:22:53', 'Cancelada');

select * from adocoes;
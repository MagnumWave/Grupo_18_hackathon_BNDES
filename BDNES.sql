/* desafio bndes */

create database BNDESFINAL;

use BNDESFINAL;

create table usuario(

	idusuario int primary key auto_increment,
	nome varchar(30) not null,
	email varchar(30) not null,
	sexo enum('M','F') not null,
	nascimentodata varchar(10) not null,
	cpf varchar(20) unique not null,
	senha varchar(20) not null
);

create table endereco_u(

	idendereco_u int primary key auto_increment,
	rua varchar(30) not null,
	numero varchar(6) not null,
	complemento varchar(30) not null,
	bairro varchar(20) not null,
	cidade varchar(20) not null,
	estado char(2) not null,
	id_usuario int unique,
	cep varchar(10)
);

create table endereco_e(

	idendereco_e int primary key auto_increment,
	rua varchar(30) not null,
	numero varchar(6) not null,
	bairro varchar(20) not null,
	cidade varchar(20) not null,
	estado char(2) not null,
	zona varchar(15) not null,
	id_empresa int unique
);

create table telefone(

	idtelefone int primary key auto_increment,
	tipo enum('celular','residencial') not null,
	numero varchar(20) not null,
	id_usuario int
);

create table checkin(
		
	id_usuario int,
	id_empresa int,
	checkin_contagem int,
	desconto boolean,
	primary key(id_usuario,id_empresa)
);

create table empresa(

	idempresa int primary key auto_increment,
	nome varchar(30) not null,
	tipo varchar(30) not null,
	site varchar(30),
	descricao varchar(500)
);

alter table endereco_u
add constraint fk_usuario_endereco_u
foreign key (id_usuario)
references usuario(idusuario);

alter table endereco_e
add constraint fk_empresa_endereco_e
foreign key (id_empresa)
references empresa(idempresa);

alter table telefone
add constraint fk_usuario_telefone
foreign key (id_usuario)
references usuario(idusuario);

alter table checkin
add constraint fk_usuario_checkin
foreign key (id_usuario)
references usuario(idusuario);

alter table checkin
add constraint fk_empresa_checkin
foreign key (id_empresa)
references empresa(idempresa);



insert into usuario values (null,'Roberto','roberto@gmail.com','M','18/12/1992','334853884229','334853884229');
insert into usuario values (null,'Kelley','rkelley0@soundcloud.com','F','10/2/2009','674700239329','674700239329');
insert into usuario values (null,'Armstrong','sarmstrong1@infoseek.co.jp','M','3/31/2008','7186345349','7186345349');
insert into usuario values (null,'Carr','fcarr2@woothemes.com','M','7/12/2009','10435341768','10435341768');
insert into usuario values (null,'Murray','jmurray3@gov.uk','F','12/25/2014','96435634897','96435634897');
insert into usuario values (null,'Ellis','jellis4@sciencedirect.com','F','9/19/2002','637324252302','637324252302');
insert into usuario values (null,'Phillips','bphillips5@time.com','M','8/21/2013','1182432432497','1182432432497');
insert into usuario values (null,'Williamson','rwilliamson6@ted.com','M','5/14/2006','6534234889','6534234889');
insert into usuario values (null,'Harris','aharris7@ucoz.com','F','8/12/2003','84418219227','84418219227');
insert into usuario values (null,'James','rjames8@prnewswire.com','M','9/7/2005','108634233557','108634233557');

insert into usuario values (null,'Jacobs','jjacobsa@sbwire.com','F','11/27/2003','12128732966','12128732966');
insert into usuario values (null,'Black','mblackb@edublogs.org','M','2/4/2003','44123342579','44123342579');
insert into usuario values (null,'Schmidt','sschmidtc@state.gov','M','10/13/2002','85223423427','85223423427');
insert into usuario values (null,'Webb','awebbd@baidu.com','F','10/22/2006','5923423763','5923423763');
insert into usuario values (null,'Jacobs','ajacobse@google.it','F','3/4/2007','14123423139','14123423139');
insert into usuario values (null,'Medina','smedinaf@amazonaws.com','F','3/14/2008','10436436659','10436436659');
insert into usuario values (null,'Morgan','dmorgang@123-reg.co.uk','F','5/4/2011','148234253952','148234253952');
insert into usuario values (null,'Nguyen','jnguyenh@google.com','M','11/3/2014','93823424204','93823424204');
insert into usuario values (null,'Day','rdayi@chronoengine.com','M','9/22/2004','109892423430','109892423430');

INSERT INTO TELEFONE VALUES(NULL,'celular','78458743',1);
INSERT INTO TELEFONE VALUES(NULL,'residencial','56576876',1);
INSERT INTO TELEFONE VALUES(NULL,'celular','87866896',2);
INSERT INTO TELEFONE VALUES(NULL,'celular','54768899',3);
INSERT INTO TELEFONE VALUES(NULL,'residencial','99667587',4);
INSERT INTO TELEFONE VALUES(NULL,'celular','78989765',4);
INSERT INTO TELEFONE VALUES(NULL,'celular','99766676',5);
INSERT INTO TELEFONE VALUES(NULL,'residencial','66687899',5);
INSERT INTO TELEFONE VALUES(NULL,'residencial','89986668',6);
INSERT INTO TELEFONE VALUES(NULL,'celular','88687909',6);
INSERT INTO TELEFONE VALUES(NULL,'celular','78458743',7);
INSERT INTO TELEFONE VALUES(NULL,'residencial','56576876',7);
INSERT INTO TELEFONE VALUES(NULL,'celular','87866896',8);
INSERT INTO TELEFONE VALUES(NULL,'residencial','54768899',8);
INSERT INTO TELEFONE VALUES(NULL,'residencial','99667587',9);
INSERT INTO TELEFONE VALUES(NULL,'celular','78989765',9);
INSERT INTO TELEFONE VALUES(NULL,'celular','99766676',10);
INSERT INTO TELEFONE VALUES(NULL,'residencial','66687899',10);
INSERT INTO TELEFONE VALUES(NULL,'residencial','89986668',11);
INSERT INTO TELEFONE VALUES(NULL,'celular','882324879',12);
INSERT INTO TELEFONE VALUES(NULL,'celular','781338743',13);
INSERT INTO TELEFONE VALUES(NULL,'residencial','56576876',13);
INSERT INTO TELEFONE VALUES(NULL,'celular','87812396',14);
INSERT INTO TELEFONE VALUES(NULL,'residencial','54008899',13);
INSERT INTO TELEFONE VALUES(NULL,'residencial','99000587',14);
INSERT INTO TELEFONE VALUES(NULL,'celular','78900065',14);
INSERT INTO TELEFONE VALUES(NULL,'celular','997000076',15);
INSERT INTO TELEFONE VALUES(NULL,'residencial','600687899',15);
INSERT INTO TELEFONE VALUES(NULL,'residencial','8000986668',16);
INSERT INTO TELEFONE VALUES(NULL,'celular','008687909',16);
INSERT INTO TELEFONE VALUES(NULL,'celular','78458003',17);
INSERT INTO TELEFONE VALUES(NULL,'residencial','56576800',17);
INSERT INTO TELEFONE VALUES(NULL,'celular','87866000',18);
INSERT INTO TELEFONE VALUES(NULL,'celular','547000009',19);



insert into endereco_u values (null,"Felipe Camarão","450","ap 710","Tijuca","Rio de Janeiro","RJ",1,"20270-243");
insert into endereco_u values (null,"Felipe Camarão","700","ap 10","Tijuca","Rio de Janeiro","RJ",2,"20270-243");
insert into endereco_u values (null,"Brasilia","67","ap 71","Olaria","Rio de Janeiro","RJ",3,"21021-400");
insert into endereco_u values (null,"Engenho da Pedra","50","ap 110","Olaria","Rio de Janeiro","RJ",4,"21021-400");
insert into endereco_u values (null,"Engenho da Pedra","511","ap 11","Olaria","Rio de Janeiro","RJ",5,"21021-400");
insert into endereco_u values (null,"Bariri","600","ap 11","Olaria","Rio de Janeiro","RJ",6,"21021-400");
insert into endereco_u values (null,"Bruxelas","60","ap 311","Bonsucesso","Rio de Janeiro","RJ",7,"21040-320");
insert into endereco_u values (null,"Teixeira de Castro","80","ap 411","Bonsucesso","Rio de Janeiro","RJ",8,"21040-320");
insert into endereco_u values (null,"Teixeira de Castro","50","ap 300","Bonsucesso","Rio de Janeiro","RJ",9,"21040-320");
insert into endereco_u values (null,"Barreiros","100","ap 500","	Ramos","Rio de Janeiro","RJ",10,"21030-040");
insert into endereco_u values (null,"Alfândega","30","ap 1100","Centro","Rio de Janeiro","RJ",11,"20020-030");
insert into endereco_u values (null,"Ouvidor","40","ap 11","Centro","Rio de Janeiro","RJ",12,"20020-030");
insert into endereco_u values (null,"Sete de Setembro","300","ap 110","Centro","Rio de Janeiro","RJ",13,"20020-030");
insert into endereco_u values (null,"Barata Ribeiro","700","ap 11","Copacabana","Rio de Janeiro","RJ",14,"22041-001");
insert into endereco_u values (null,"Avenida Atlântica","1700","ap 1150","Copacabana","Rio de Janeiro","RJ",15,"22041-001");
insert into endereco_u values (null,"Avenida Atlântica","1750","ap 1250","Copacabana","Rio de Janeiro","RJ",16,"22041-001");
insert into endereco_u values (null,"Avenida Atlântica","2050","ap 2250","Copacabana","Rio de Janeiro","RJ",17,"22041-001");
insert into endereco_u values (null," General Venâncio Flôres","1850","ap 1250","Leblon","Rio de Janeiro","RJ",18,"22450-160");
insert into endereco_u values (null,"Avenida das Américas","2750","ap 1250","Barra da Tijuca","Rio de Janeiro","RJ",19,"22631-000");


insert into empresa values(null,"Mercado Zona Norte","Supermercado","www.zonanorte.com.br","O mercado mais próximo de você e preços mais atrativos");
insert into empresa values(null,"Mercado da Casa","Supermercado","www.dacasa.com","Da loja para a casa dos clientes");
insert into empresa values(null,"Mercado Lua Nova","Supermercado","www.luanova.com","Super mercado com os melhores preços da zona norte!");
insert into empresa values(null,"Mercado Olha o Preço","Supermercado","www.olhaopreco.com.br","Aqui o cliente olha e o preço cai");
insert into empresa values(null,"Mercado Bacana","Supermercado","www.mercadobacana.com.br","Os preços mais justos e ofertas imperdíveis");
insert into empresa values(null,"Mercado na Hora","Supermercado","www.nahora.com.br","O mercado que traz as promoções na hora que se precisa");
insert into empresa values(null,"Mercado Legal","Supermercado","www.legal.com.br","Os preços despencam, e o cliente acha legal");
insert into empresa values(null,"Mercado Vem que Tem","Supermercado","www.vemquetem.com.br","Aqui o preço é tão bom que o cliente nem vai pesquisar em outro lugar");
insert into empresa values(null,"Mercado Zona Sul","Supermercado","www.mercadozonasul.com","O mercado que pensa no seu bem estar");
insert into empresa values(null,"Mercado Zona Oeste","Supermercado","www.oestezona.com.br","Os preços mais em conta da região");
insert into empresa values(null,"Mercado da Casa","Supermercado","www.dacasa.com","Da loja para a casa dos clientes");
insert into empresa values(null,"Mercado Lua Nova","Supermercado","www.luanova.com","Super mercado com os melhores preços da zona norte!");
insert into empresa values(null,"Mercado Olha o Preço","Supermercado","www.olhaopreco.com.br","Aqui o cliente olha e o preço cai");
insert into empresa values(null,"Mercado Bacana","Supermercado","www.mercadobacana.com.br","Os preços mais justos e ofertas imperdíveis");
insert into empresa values(null,"Mercado na Hora","Supermercado","www.nahora.com.br","O mercado que traz as promoções na hora que se precisa");
insert into empresa values(null,"Mercado Legal","Supermercado","www.legal.com.br","Os preços despencam, e o cliente acha legal");
insert into empresa values(null,"Mercado Vem que Tem","Supermercado","www.vemquetem.com.br","Aqui o preço é tão bom que o cliente nem vai pesquisar em outro lugar");
insert into empresa values(null,"Restaurante Varanda","Restaurante","www.varanda.com.br","O lugar mais aconchegante e cardápio de cair o queixo");
insert into empresa values(null,"Restaurante Comequeto","Restaurante","www.comequeto.com.br","O sabor mineiro em pleno Rj");
insert into empresa values(null,"Restaurante Quero Comer","Restaurante","www.querocomer.com.br","O melhot cardápio da região");
insert into empresa values(null,"Restaurante Sabor Tropical","Restaurante","www.sabortrop.com.br","Restaurante com cardápio variado e melhores drinks");
insert into empresa values(null,"Restaurante Tudo do Sabor","Restaurante","www.tudodosabor.com.br","Os melhores pratos e seviço de atendimento que você já viu");
insert into empresa values(null,"Restaurante Irmãos Mario","Restaurante","www.mario.com.br","Sabor Italiano com um toque do Reino do Cogumelo");
insert into empresa values(null,"Restaurante RPG","Restaurante","www.rpgmaker.com.br","Restaurante com tema medieval perfeito para reuniões de rpg de mesa");
insert into empresa values(null,"Restaurante do Mar","Restaurante","www.marfrutos.com.br","Restaurante perfeito para quem gosta de frutos do mar");
insert into empresa values(null,"Restaurante Liga do Sabor","Restaurante","www.ligaflavor.com.br","Uma liga extraordinária de chefes para te atender");
insert into empresa values(null,"Restaurante Comida Caseira","Restaurante","www.kaseira.com.br","O melhor da comida caseira e delivery a todo vapor");
insert into empresa values(null,"Churrascaria MegaBeef","Churrascaria","www.megabeef.com.br","A churrascaria da família carioca");
insert into empresa values(null,"Churrascaria Boigordo","Churrascaria","www.boigordo.com.br","O churrasco mais saboroso da região");
insert into empresa values(null,"Churrascaria Gaúcho","Churrascaria","www.gaucho.com.br","A churrascaria que traz o sabor sulista para perto");
insert into empresa values(null,"Churrascaria Hora da Brasa","Churrascaria","www.brasa.com.br","O churrasco é na brasaaaaaa, vem correndo");
insert into empresa values(null,"Churrascaria Cai no prato","Churrascaria","www.cainoprato.com.br","No rodizio temos o nosso melhor, vemha experimentar");
insert into empresa values(null,"Churrascaria BrasaShow","Churrascaria","www.brasashow.com.br","Churrasco mais gostoso da região, venha provar");
insert into empresa values(null,"Churrascaria Cruzeiro Amarelo","Churrascaria","www.cruzeiroamarelo.com.br","Olha a churrascaria mais visitada do Rio, venha conhecer");
insert into empresa values(null,"Bar Buchicho","Bar","www.buchicho.com.br","O bar da noite carioca");
insert into empresa values(null,"Bar Flamengo","Bar","www.barflamengo.com.br","O bar perfeito para assistir jogos do fla");
insert into empresa values(null,"Bar Coisa Nossa","Bar","www.nossa.com.br","Perfeito para encontros pós expediente de trabalho");
insert into empresa values(null,"Bar Vem Tranquilo","Bar","www.vemtranquilo.com.br","Vem tranquilo e aproveite as promoções para cada noite durante a semana");
insert into empresa values(null,"Bar Leopoldo","Bar","www.leopoldo.com.br","O dono é o Leopoldo mas quem manda é o cliente");
insert into empresa values(null,"Bar Hora de Beber","Bar","www.horadebeber.com.br","Ambiente descontraído perfeito para reunir amigos");
insert into empresa values(null,"Bar Olha a Gelada","Bar","www.olhaagelada.com.br","Vem que a gelada ta trincando e estamos só aguardando você");
insert into empresa values(null,"Bar Altas Horas","Bar","www.baraltashoras.com.br","Música ao vivo e petiscos imperdíveis");
insert into empresa values(null,"Bar PlayNice","Bar","www.playnice.com.br","Alem dos melhores petiscos, oferecemos mesas de jogos");
insert into empresa values(null,"Bar NemVemqueNãoTem","Bar","www.nemvem.com.br","Nem vem de garfo que hoje é dia de sopa, mas também servimos petiscos e cervejas artesanais");
insert into empresa values(null,"Livraria BoaLeitura","Livraria","www.boaleitura.com.br","Acervo enorme e de qualidade ");
insert into empresa values(null,"Livraria Hora da Leitura","Livraria","www.horadaleitura.com.br","Focada em literatura infantil");
insert into empresa values(null,"Livraria Ler é bom","Livraria","www.ler.com.br","Livros de diversos assuntos e tipos");
insert into empresa values(null,"Materiais Alves","Material de Construção","www.materiaisalves.com.br","Tudo em materiais e ferramentas, venha conferir");
insert into empresa values(null,"Materiais e Ferramentas Carlos","Material de Construção","www.mfcarlos.com.br","Ferramentas mecâcnicas e eletrônicas de primeira linha");
insert into empresa values(null,"Construção e Cia","Material de Construção","www.construcaoecia.com.br","Tudo para sua reforma de cotidiano");
insert into empresa values(null,"Ferramentas Top","Material de Construção","www.ferramentastop.com.br","Ferramentas de alta qualidades para usos diversos");
insert into empresa values(null,"Material e Cia","Material de Construção","www.materialecia.com.br","Tudo em materiais e ferramentas, venha conferir");
insert into empresa values(null,"Alicate e Martelo","Material de Construção","www.alicateemartelo.com.br","Ferramenta para qualquer ocasião, venha conferir");
insert into empresa values(null,"Papel e Cia","Papelaria","www.papelecia.com.br","Papelaria para todos os momentos");
insert into empresa values(null,"Papelaria de todos","Papelaria","www.papelariatod.com.br","Papelaria vom preços bacanas e variedades de produtos");
insert into empresa values(null,"Papel e Poesia","Papelaria","www.pepelepoesia.com.br","Papelaria com um toque de literatura");
insert into empresa values(null,"Papelaria Aquarela","Papelaria","www.aquarela.com.br","Papelaria focada em materiais artísticos");
insert into empresa values(null,"Seu José Papelaria","Papelaria","www.josepapel.com.br","Papelaria com preços mais atraentes da região");
insert into empresa values(null,"Papel e Lápis","Papelaria","www.papelelapis.com.br","Papelaria para todos os momentos");
insert into empresa values(null,"Companhia do papel","Papelaria","www.compapel.com.br","Papelaria para todos os momentos");



insert into endereco_e values (null,"São Francisco Xavier","800","Tijuca","Rio de Janeiro","RJ","Norte",1);
insert into endereco_e values (null,"Barata Ribeiro","7100","Copacabana","Rio de Janeiro","RJ","Sul",2);
insert into endereco_e values (null,"Avenida das Américas","25750","Barra da Tijuca","Rio de Janeiro","RJ","Oeste",3);
insert into endereco_e values (null,"Engenho da Pedra","1020","Olaria","Rio de Janeiro","RJ","Norte",4);
insert into endereco_e values (null,"Alfândega","390","Centro","Rio de Janeiro","RJ","Centro",5);
insert into endereco_e values (null," General Venâncio Flôres","18650","Leblon","Rio de Janeiro","RJ","Sul",6);
insert into endereco_e values (null,"Bruxelas","608","Bonsucesso","Rio de Janeiro","RJ","Norte",7);
insert into endereco_e values (null,"Felipe Camarão","4550","Tijuca","Rio de Janeiro","RJ","Norte",8);
insert into endereco_e values (null,"Lins e Cláudio","567","Tijuca","Rio de Janeiro","RJ","Norte",9);
insert into endereco_e values (null,"Barata Ribeiro","7150","Copacabana","Rio de Janeiro","RJ","Sul",10);
insert into endereco_e values (null,"Rua Doutor Caetano de Faria","768","Campo Grande","Rio de Janeiro","RJ","Oeste",11);
insert into endereco_e values (null,"Engenho da Pedra","1300","Olaria","Rio de Janeiro","RJ","Norte",12);
insert into endereco_e values (null,"Alfândega","567","Centro","Rio de Janeiro","RJ","Centro",13);
insert into endereco_e values (null," General Venâncio Flôres","450","Leblon","Rio de Janeiro","RJ","Sul",14);
insert into endereco_e values (null,"Bruxelas","564","Bonsucesso","Rio de Janeiro","RJ","Norte",15);
insert into endereco_e values (null,"Conde de Bonfim","4550","Tijuca","Rio de Janeiro","RJ","Norte",16);
insert into endereco_e values (null,"São Francisco Xavier","74332","Tijuca","Rio de Janeiro","RJ","Norte",17);
insert into endereco_e values (null,"Barata Ribeiro","506","Copacabana","Rio de Janeiro","RJ","Sul",18);
insert into endereco_e values (null,"Avenida das Américas","5764","Barra da Tijuca","Rio de Janeiro","RJ","Oeste",19);
insert into endereco_e values (null,"Engenho da Pedra","446","Olaria","Rio de Janeiro","RJ","Norte",20);
insert into endereco_e values (null,"Ouvidor","390","Centro","Rio de Janeiro","RJ","Centro",21);
insert into endereco_e values (null," General Venâncio Flôres","765","Leblon","Rio de Janeiro","RJ","Sul",22);
insert into endereco_e values (null,"João Torquato","608","Bonsucesso","Rio de Janeiro","RJ","Norte",23);
insert into endereco_e values (null,"Felipe Camarão","763","Tijuca","Rio de Janeiro","RJ","Norte",24);
insert into endereco_e values (null,"Lins e Cláudio","123","Tijuca","Rio de Janeiro","RJ","Norte",25);
insert into endereco_e values (null,"Barata Ribeiro","953","Copacabana","Rio de Janeiro","RJ","Sul",26);
insert into endereco_e values (null,"Rua Doutor Caetano de Faria","912","Campo Grande","Rio de Janeiro","RJ","Oeste",27);
insert into endereco_e values (null,"Barata Ribeiro","103","Copacabana","Rio de Janeiro","RJ","Sul",28);
insert into endereco_e values (null,"Engenho da Pedra","1900","Olaria","Rio de Janeiro","RJ","Norte",29);
insert into endereco_e values (null,"Alfândega","980","Centro","Rio de Janeiro","RJ","Centro",30);
insert into endereco_e values (null," General Venâncio Flôres","183","Leblon","Rio de Janeiro","RJ","Sul",31);
insert into endereco_e values (null,"Bruxelas","720","Bonsucesso","Rio de Janeiro","RJ","Norte",32);
insert into endereco_e values (null,"Conde de Bonfim","1235","Tijuca","Rio de Janeiro","RJ","Norte",33);
insert into endereco_e values (null,"São Francisco Xavier","932","Tijuca","Rio de Janeiro","RJ","Norte",34);
insert into endereco_e values (null,"Barata Ribeiro","832","Copacabana","Rio de Janeiro","RJ","Sul",35);
insert into endereco_e values (null,"Avenida das Américas","982","Barra da Tijuca","Rio de Janeiro","RJ","Oeste",36);
insert into endereco_e values (null,"Engenho da Pedra","934","Olaria","Rio de Janeiro","RJ","Norte",37);
insert into endereco_e values (null,"Alfândega","103","Centro","Rio de Janeiro","RJ","Centro",38);
insert into endereco_e values (null," General Venâncio Flôres","2983","Leblon","Rio de Janeiro","RJ","Sul",39);
insert into endereco_e values (null,"Bruxelas","24","Bonsucesso","Rio de Janeiro","RJ","Norte",40);
insert into endereco_e values (null,"Felipe Camarão","912","Tijuca","Rio de Janeiro","RJ","Norte",41);
insert into endereco_e values (null,"Lins e Cláudio","61","Tijuca","Rio de Janeiro","RJ","Norte",42);
insert into endereco_e values (null,"Barata Ribeiro","821","Copacabana","Rio de Janeiro","RJ","Sul",43);
insert into endereco_e values (null,"Rua Doutor Caetano de Faria","421","Campo Grande","Rio de Janeiro","RJ","Oeste",44);
insert into endereco_e values (null,"Engenho da Pedra","8291","Olaria","Rio de Janeiro","RJ","Norte",45);
insert into endereco_e values (null,"Alfândega","5670","Centro","Rio de Janeiro","RJ","Centro",46);
insert into endereco_e values (null," General Venâncio Flôres","267","Leblon","Rio de Janeiro","RJ","Sul",47);
insert into endereco_e values (null,"Bruxelas","1290","Bonsucesso","Rio de Janeiro","RJ","Norte",48);
insert into endereco_e values (null,"Conde de Bonfim","716","Tijuca","Rio de Janeiro","RJ","Norte",49);
insert into endereco_e values (null,"São Francisco Xavier","4108","Tijuca","Rio de Janeiro","RJ","Norte",50);
insert into endereco_e values (null,"Barata Ribeiro","9182","Copacabana","Rio de Janeiro","RJ","Sul",51);
insert into endereco_e values (null,"Avenida das Américas","8152","Barra da Tijuca","Rio de Janeiro","RJ","Oeste",52);
insert into endereco_e values (null,"Engenho da Pedra","4462","Olaria","Rio de Janeiro","RJ","Norte",53);
insert into endereco_e values (null,"Ouvidor","3900","Centro","Rio de Janeiro","RJ","Centro",54);
insert into endereco_e values (null," General Venâncio Flôres","7265","Leblon","Rio de Janeiro","RJ","Sul",55);
insert into endereco_e values (null,"João Torquato","6008","Bonsucesso","Rio de Janeiro","RJ","Norte",56);
insert into endereco_e values (null,"Felipe Camarão","7563","Tijuca","Rio de Janeiro","RJ","Norte",57);
insert into endereco_e values (null,"Lins e Cláudio","1223","Tijuca","Rio de Janeiro","RJ","Norte",58);
insert into endereco_e values (null,"Barata Ribeiro","9223","Copacabana","Rio de Janeiro","RJ","Sul",59);
insert into endereco_e values (null,"Rua Doutor Caetano de Faria","9992","Campo Grande","Rio de Janeiro","RJ","Oeste",60);

insert into checkin values (1,1,35,false);
insert into checkin values (1,8,10,false);
insert into checkin values (1,56,24,false);
insert into checkin values (1,33,31,false);
insert into checkin values (1,23,12,false);
insert into checkin values (1,60,24,false);
insert into checkin values (1,10,52,false);
insert into checkin values (2,5,35,false);
insert into checkin values (2,8,10,false);
insert into checkin values (2,23,24,false);
insert into checkin values (2,3,31,false);
insert into checkin values (2,13,12,false);
insert into checkin values (2,10,24,false);
insert into checkin values (2,40,52,false);
insert into checkin values (3,3,35,false);
insert into checkin values (3,9,10,false);
insert into checkin values (3,33,24,false);
insert into checkin values (3,32,31,false);
insert into checkin values (3,53,12,false);
insert into checkin values (3,11,24,false);
insert into checkin values (4,10,52,false);
insert into checkin values (4,55,35,false);
insert into checkin values (4,18,10,false);
insert into checkin values (4,43,24,false);
insert into checkin values (4,12,31,false);
insert into checkin values (4,4,12,false);
insert into checkin values (4,19,24,false);
insert into checkin values (4,49,52,false);
insert into checkin values (5,1,35,false);
insert into checkin values (5,18,10,false);
insert into checkin values (5,21,24,false);
insert into checkin values (5,23,31,false);
insert into checkin values (5,34,12,false);
insert into checkin values (5,39,24,false);
insert into checkin values (5,44,52,false);
insert into checkin values (6,7,35,false);
insert into checkin values (6,9,10,false);
insert into checkin values (6,27,24,false);
insert into checkin values (6,38,31,false);
insert into checkin values (6,44,12,false);
insert into checkin values (6,48,24,false);
insert into checkin values (6,57,52,false);
insert into checkin values (7,2,35,false);
insert into checkin values (7,5,10,false);
insert into checkin values (7,17,24,false);
insert into checkin values (7,28,31,false);
insert into checkin values (7,34,12,false);
insert into checkin values (7,38,24,false);
insert into checkin values (7,53,52,false);
insert into checkin values (8,1,35,false);
insert into checkin values (8,3,10,false);
insert into checkin values (8,7,24,false);
insert into checkin values (8,14,31,false);
insert into checkin values (8,21,12,false);
insert into checkin values (8,27,24,false);
insert into checkin values (8,29,52,false);
insert into checkin values (9,4,35,false);
insert into checkin values (9,6,10,false);
insert into checkin values (9,12,24,false);
insert into checkin values (9,18,31,false);
insert into checkin values (9,22,12,false);
insert into checkin values (9,26,24,false);
insert into checkin values (9,27,52,false);
insert into checkin values (10,8,35,false);
insert into checkin values (10,9,10,false);
insert into checkin values (10,15,24,false);
insert into checkin values (10,26,31,false);
insert into checkin values (10,28,12,false);
insert into checkin values (10,31,24,false);
insert into checkin values (10,58,52,false);
insert into checkin values (11,1,35,false);
insert into checkin values (11,6,10,false);
insert into checkin values (11,13,24,false);
insert into checkin values (11,29,31,false);
insert into checkin values (11,30,12,false);
insert into checkin values (11,37,24,false);
insert into checkin values (11,47,52,false);
insert into checkin values (12,8,35,false);
insert into checkin values (12,9,10,false);
insert into checkin values (12,10,24,false);
insert into checkin values (12,25,31,false);
insert into checkin values (12,33,12,false);
insert into checkin values (12,37,24,false);
insert into checkin values (12,42,52,false);
insert into checkin values (13,9,35,false);
insert into checkin values (13,11,10,false);
insert into checkin values (13,13,24,false);
insert into checkin values (13,22,31,false);
insert into checkin values (13,33,12,false);
insert into checkin values (13,48,24,false);
insert into checkin values (13,58,52,false);
insert into checkin values (14,4,35,false);
insert into checkin values (14,15,10,false);
insert into checkin values (14,22,24,false);
insert into checkin values (14,31,31,false);
insert into checkin values (14,39,12,false);
insert into checkin values (14,34,24,false);
insert into checkin values (14,58,52,false);
insert into checkin values (15,1,35,false);
insert into checkin values (15,15,10,false);
insert into checkin values (15,26,24,false);
insert into checkin values (15,30,31,false);
insert into checkin values (15,35,12,false);
insert into checkin values (15,42,24,false);
insert into checkin values (15,55,52,false);
insert into checkin values (16,7,35,false);
insert into checkin values (16,15,10,false);
insert into checkin values (16,24,24,false);
insert into checkin values (16,32,31,false);
insert into checkin values (16,34,12,false);
insert into checkin values (16,48,24,false);
insert into checkin values (16,50,52,false);
insert into checkin values (17,5,35,false);
insert into checkin values (17,15,10,false);
insert into checkin values (17,27,24,false);
insert into checkin values (17,38,31,false);
insert into checkin values (17,44,12,false);
insert into checkin values (17,48,24,false);
insert into checkin values (17,60,52,false);
insert into checkin values (18,1,35,false);
insert into checkin values (18,3,10,false);
insert into checkin values (18,12,24,false);
insert into checkin values (18,20,31,false);
insert into checkin values (18,30,12,false);
insert into checkin values (18,34,24,false);
insert into checkin values (18,50,52,false);
insert into checkin values (19,2,35,false);
insert into checkin values (19,5,10,false);
insert into checkin values (19,17,24,false);
insert into checkin values (19,28,31,false);
insert into checkin values (19,34,12,false);
insert into checkin values (19,38,24,false);
insert into checkin values (19,53,52,false);

/* view para usuários cadastrados */

create view v_usuarios_cadastrados as
select u.idusuario,u.nome,u.cpf,u.sexo,u.email,
		eu.rua,eu.numero,eu.complemento,eu.bairro,eu.cidade,eu.estado,
		t.tipo,t.numero as telefone from usuario u
inner join endereco_u eu
on u.idusuario = eu.id_usuario
inner join telefone t
on u.idusuario = t.id_usuario;

/* ============================================== */

/* view para empresas cadastradas */

create view v_empresas_cadastradas as
select em.idempresa,em.nome,em.tipo,em.site,em.descricao,
		ee.rua,ee.numero,ee.bairro,ee.cidade,ee.zona,ee.estado from empresa em
inner join endereco_e ee
on idempresa = id_empresa;

/* ============================================== */

/* view para vrrificar checkins */

create view v_checkin_lista as
select u.nome,u.email,  
		em.idempresa,em.nome as nome_da_empresa,
		c.checkin_contagem,c.desconto from checkin c
inner join usuario u
on u.idusuario=c.id_usuario
inner join empresa em
on em.idempresa=c.id_empresa;

/* ============================================== */

/* exemplo de insert e update em checkin

insert into checkin values (1,1,1,false);
update checkin
set checkin_contagem = checkin_contagem + 1
where id_usuario = 1 and id_empresa = 1;

 ===================================== */
-- --------------------------------------------------------

-- Servidor:                     127.0.0.1

-- Versão do servidor:           10.1.25-MariaDB - mariadb.org binary distribution

-- OS do Servidor:               Win32

-- HeidiSQL Versão:              9.4.0.5125

-- --------------------------------------------------------



/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;

/*!40101 SET NAMES utf8 */;

/*!50503 SET NAMES utf8mb4 */;

/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;





-- Copiando estrutura do banco de dados para rest_with_asp_net_udemy

CREATE DATABASE IF NOT EXISTS `rest_with_asp_net_udemy` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `rest_with_asp_net_udemy`;



-- Copiando estrutura para tabela rest_with_asp_net_udemy.books

CREATE TABLE IF NOT EXISTS `books` (

  `id` int(10) NOT NULL AUTO_INCREMENT,

  `Author` longtext,

  `LaunchDate` datetime(6) NOT NULL,

  `Price` decimal(65,2) NOT NULL,

  `Title` longtext,

  PRIMARY KEY (`id`)

) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;



-- Copiando dados para a tabela rest_with_asp_net_udemy.books: ~15 rows (aproximadamente)

DELETE FROM `books`;

/*!40000 ALTER TABLE `books` DISABLE KEYS */;

INSERT INTO `books` (`id`, `Author`, `LaunchDate`, `Price`, `Title`) VALUES

	(1, 'Michael C. Feathers', '2017-11-29 13:50:05.878000', 49.00, 'Working effectively with legacy code'),

	(2, 'Ralph Johnson, Erich Gamma, John Vlissides e Richard Helm', '2017-11-29 15:15:13.636000', 45.00, 'Design Patterns'),

	(3, 'Robert C. Martin', '2009-01-10 00:00:00.000000', 77.00, 'Clean Code'),

	(4, 'Crockford', '2017-11-07 15:09:01.674000', 67.00, 'JavaScript'),

	(5, 'Steve McConnell', '2017-11-07 15:09:01.674000', 58.00, 'Code complete'),

	(6, 'Martin Fowler e Kent Beck', '2017-11-07 15:09:01.674000', 88.00, 'Refactoring'),

	(7, 'Eric Freeman, Elisabeth Freeman, Kathy Sierra, Bert Bates', '2017-11-07 15:09:01.674000', 110.00, 'Head First Design Patterns'),

	(8, 'Eric Evans', '2017-11-07 15:09:01.674000', 92.00, 'Domain Driven Design'),

	(9, 'Brian Goetz e Tim Peierls', '2017-11-07 15:09:01.674000', 80.00, 'Java Concurrency in Practice'),

	(10, 'Susan Cain', '2017-11-07 15:09:01.674000', 123.00, 'O poder dos quietos'),

	(11, 'Roger S. Pressman', '2017-11-07 15:09:01.674000', 56.00, 'Engenharia de Software: uma abordagem profissional'),

	(12, 'Viktor Mayer-Schonberger e Kenneth Kukier', '2017-11-07 15:09:01.674000', 54.00, 'Big Data: como extrair volume, variedade, velocidade e valor da avalanche de informação cotidiana'),

	(13, 'Richard Hunter e George Westerman', '2017-11-07 15:09:01.674000', 95.00, 'O verdadeiro valor de TI'),

	(14, 'Marc J. Schiller', '2017-11-07 15:09:01.674000', 45.00, 'Os 11 segredos de líderes de TI altamente influentes'),

	(15, 'Aguinaldo Aragon Fernandes e Vladimir Ferraz de Abreu', '2017-11-07 15:09:01.674000', 54.00, 'Implantando a governança de TI');

/*!40000 ALTER TABLE `books` ENABLE KEYS */;



-- Copiando estrutura para tabela rest_with_asp_net_udemy.changelog

CREATE TABLE IF NOT EXISTS `changelog` (

  `id` int(11) NOT NULL AUTO_INCREMENT,

  `type` tinyint(4) DEFAULT NULL,

  `version` varchar(50) DEFAULT NULL,

  `description` varchar(200) NOT NULL,

  `name` varchar(300) NOT NULL,

  `checksum` varchar(32) DEFAULT NULL,

  `installed_by` varchar(100) NOT NULL,

  `installed_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,

  `success` tinyint(1) NOT NULL,

  PRIMARY KEY (`id`)

) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;



-- Copiando dados para a tabela rest_with_asp_net_udemy.changelog: ~12 rows (aproximadamente)

DELETE FROM `changelog`;

/*!40000 ALTER TABLE `changelog` DISABLE KEYS */;

INSERT INTO `changelog` (`id`, `type`, `version`, `description`, `name`, `checksum`, `installed_by`, `installed_on`, `success`) VALUES

	(1, 2, '0', 'Empty schema found: rest_with_asp_net_udemy.', 'rest_with_asp_net_udemy', '', 'root', '2018-06-05 11:47:20', 1),

	(2, 0, '1.0.1', 'Create Table Persons', 'V1_0_1__Create_Table_Persons.sql', '5C57601C086E1B99BBB04D07959D0F8D', 'root', '2018-06-05 11:47:20', 1),

	(3, 0, '1.0.2', 'Alter Table Persons', 'V1_0_2__Alter_Table_Persons.sql', 'CD743A62C549732597DD40FB2A37EAEA', 'root', '2018-06-05 11:47:20', 1),

	(4, 0, '1.0.3', 'Create table books', 'V1_0_3__Create_table_books.sql', 'F549A23CB0D53684731DC7BCBD1C2CD2', 'root', '2018-06-05 11:47:21', 1),

	(5, 0, '1.0.4', 'Insert data in books', 'V1_0_4__Insert_data_in_books.sql', '176BED6692EB72483D6293F87630A8EE', 'root', '2018-06-05 11:47:21', 1),

	(6, 0, '1.0.5', 'Insert data in persons', 'V1_0_5__Insert_data_in_persons.sql', '9C8C00723D8DE4E5A4AC745F484C1DF2', 'root', '2018-06-05 11:47:21', 1),

	(7, 0, '1.0.6', 'Drop table books', 'V1_0_6__Drop_table_books.sql', '996116D4AC3B9566301DE7B869018E5E', 'root', '2018-06-05 11:47:21', 1),

	(8, 0, '1.0.7', 'Recreate table books', 'V1_0_7__Recreate_table_books.sql', 'A24695A9F3D42357BCC78C08BF2FFD6C', 'root', '2018-06-05 11:47:21', 1),

	(9, 0, '1.0.8', 'Reinsert data in books', 'V1_0_8__Reinsert_data_in_books.sql', '3AA7D3B32D6D452A58B268467172E07E', 'root', '2018-06-05 11:47:21', 1),

	(10, 0, '1.0.9', 'Create table users', 'V1_0_9__Create_table_users.sql', '21A098BE693C455B76FD57CA6ACE1D5F', 'root', '2018-06-05 11:47:21', 1),

	(11, 0, '1.0.10', 'Insert data in users', 'V1_0_10__Insert_data_in_users.sql', 'D5A73E85F99502520B2CA1E89600EF4E', 'root', '2018-06-05 11:47:21', 1),

	(12, 0, '1.0.11', 'Insert data in persons', 'V1_0_11__Insert_data_in_persons.sql', '278532E637A34C97C1AD7B129C9B31CF', 'root', '2018-06-05 11:47:21', 1);

/*!40000 ALTER TABLE `changelog` ENABLE KEYS */;



-- Copiando estrutura para tabela rest_with_asp_net_udemy.persons

CREATE TABLE IF NOT EXISTS `persons` (

  `Id` int(10) NOT NULL AUTO_INCREMENT,

  `FirstName` varchar(50) DEFAULT NULL,

  `LastName` varchar(50) DEFAULT NULL,

  `Address` varchar(50) DEFAULT NULL,

  `Gender` varchar(50) DEFAULT NULL,

  PRIMARY KEY (`Id`)

) ENGINE=InnoDB AUTO_INCREMENT=303 DEFAULT CHARSET=latin1;



-- Copiando dados para a tabela rest_with_asp_net_udemy.persons: ~302 rows (aproximadamente)

DELETE FROM `persons`;

/*!40000 ALTER TABLE `persons` DISABLE KEYS */;

INSERT INTO `persons` (`Id`, `FirstName`, `LastName`, `Address`, `Gender`) VALUES

	(1, 'Leandro', 'Costa', 'Uberlândia - Minas Gerais - Brasil', 'Male'),

	(2, 'Flávio', 'Costa', 'Patos de Minas - Minas Gerais - Brasil', 'Male'),

	(3, 'Nancey', 'Accombe', '343 Oak Hill', 'Female'),

	(4, 'Liz', 'Carcass', '517 New Castle Court', 'Female'),

	(5, 'Bobbe', 'Allett', '18088 Redwing Plaza', 'Female'),

	(6, 'Chas', 'Kinnard', '0016 Green Place', 'Male'),

	(7, 'Brear', 'Pien', '90 Barnett Crossing', 'Female'),

	(8, 'Stephanie', 'Luckings', '0 Northwestern Lane', 'Female'),

	(9, 'Rosy', 'Tash', '3 Di Loreto Street', 'Female'),

	(10, 'Chase', 'Rabl', '4779 Merrick Trail', 'Male'),

	(11, 'Livvy', 'Mulvany', '60 Hooker Parkway', 'Female'),

	(12, 'Rey', 'O\' Sullivan', '55 Oriole Avenue', 'Male'),

	(13, 'Adler', 'Lytell', '30 Moulton Point', 'Male'),

	(14, 'Brodie', 'Glanville', '81 Brown Point', 'Male'),

	(15, 'Hughie', 'Treker', '691 Dixon Lane', 'Male'),

	(16, 'Dominga', 'Cestard', '528 Welch Court', 'Female'),

	(17, 'Janis', 'Tomley', '2 Pearson Road', 'Female'),

	(18, 'Caroline', 'O\'Kennedy', '977 Meadow Vale Court', 'Female'),

	(19, 'Bartolomeo', 'Hover', '080 Pearson Crossing', 'Male'),

	(20, 'Westbrook', 'Klaessen', '4 Mariners Cove Trail', 'Male'),

	(21, 'Larisa', 'Horick', '372 Huxley Junction', 'Female'),

	(22, 'Aaron', 'Hollingshead', '78389 Westport Drive', 'Male'),

	(23, 'Jasen', 'Quest', '010 Waubesa Avenue', 'Male'),

	(24, 'Rosabella', 'Ivashkov', '77 Village Green Junction', 'Female'),

	(25, 'Ali', 'Pugsley', '157 Sutherland Point', 'Male'),

	(26, 'Berni', 'McCrohon', '64297 Butterfield Way', 'Female'),

	(27, 'Gustave', 'Beggini', '842 Kensington Trail', 'Male'),

	(28, 'Mort', 'Pulver', '1 Dwight Lane', 'Male'),

	(29, 'Barbara-anne', 'Watling', '3 Namekagon Terrace', 'Female'),

	(30, 'Fransisco', 'Boulds', '20470 Evergreen Junction', 'Male'),

	(31, 'Deanne', 'Gallichiccio', '809 Dahle Court', 'Female'),

	(32, 'Cherise', 'Prozescky', '1 Drewry Pass', 'Female'),

	(33, 'Percival', 'Pridden', '3910 Badeau Alley', 'Male'),

	(34, 'Noelyn', 'Bugg', '701 Emmet Way', 'Female'),

	(35, 'Ruthanne', 'Tibbles', '2051 Macpherson Alley', 'Female'),

	(36, 'Clark', 'Berndsen', '04248 Harper Plaza', 'Male'),

	(37, 'Kakalina', 'Niven', '326 Fairview Crossing', 'Female'),

	(38, 'Vivia', 'Gunthorpe', '47 Evergreen Street', 'Female'),

	(39, 'Adlai', 'Maude', '5 Heath Circle', 'Male'),

	(40, 'Hogan', 'Higbin', '39 Becker Place', 'Male'),

	(41, 'Virgina', 'Matuszinski', '6974 Village Alley', 'Female'),

	(42, 'Effie', 'Shorten', '81953 Anniversary Circle', 'Female'),

	(43, 'Buffy', 'Plet', '7 Donald Drive', 'Female'),

	(44, 'Fannie', 'Fantonetti', '8737 Gale Road', 'Female'),

	(45, 'Neville', 'Lauthian', '694 Golf View Drive', 'Male'),

	(46, 'Leif', 'Rayhill', '9642 Eagan Circle', 'Male'),

	(47, 'Yehudit', 'Rowberry', '8 Talisman Alley', 'Male'),

	(48, 'Anica', 'Mahady', '3461 Utah Parkway', 'Female'),

	(49, 'Hymie', 'Vanner', '58514 Corscot Drive', 'Male'),

	(50, 'Niall', 'Sleight', '64838 Express Alley', 'Male'),

	(51, 'Sheba', 'Toten', '99 Cherokee Lane', 'Female'),

	(52, 'Minnie', 'Starling', '2 Glacier Hill Road', 'Female'),

	(53, 'Gibb', 'Rodolphe', '219 Sachtjen Court', 'Male'),

	(54, 'Horst', 'Kinloch', '644 American Circle', 'Male'),

	(55, 'Helene', 'Trouncer', '6481 Canary Alley', 'Female'),

	(56, 'Dicky', 'Beazey', '56396 Lerdahl Street', 'Male'),

	(57, 'Berkeley', 'Cristofanini', '8596 Lakeland Park', 'Male'),

	(58, 'Tamara', 'Cleveland', '1 Thompson Court', 'Female'),

	(59, 'Valentin', 'Sandys', '23592 Kensington Crossing', 'Male'),

	(60, 'Miner', 'Cornelisse', '8405 Prentice Place', 'Male'),

	(61, 'Nedda', 'Dawks', '287 Drewry Trail', 'Female'),

	(62, 'Rubi', 'Weedall', '9061 Oriole Way', 'Female'),

	(63, 'Calida', 'Gile', '9769 Morrow Street', 'Female'),

	(64, 'Myron', 'Lethibridge', '1968 Moulton Junction', 'Male'),

	(65, 'Hart', 'Begin', '84 Manufacturers Park', 'Male'),

	(66, 'Ange', 'Kob', '7 Independence Junction', 'Male'),

	(67, 'Wendell', 'Esposito', '2403 Rockefeller Crossing', 'Male'),

	(68, 'Henry', 'Thurber', '6067 Little Fleur Hill', 'Male'),

	(69, 'Donaugh', 'Thies', '6 Westridge Lane', 'Male'),

	(70, 'Kala', 'Hounson', '514 Transport Way', 'Female'),

	(71, 'Phip', 'Clail', '126 Vahlen Circle', 'Male'),

	(72, 'Christy', 'Punchard', '2 Graceland Drive', 'Male'),

	(73, 'Philippa', 'Hartfleet', '79 Center Lane', 'Female'),

	(74, 'Jinny', 'Gelderd', '5 Anhalt Plaza', 'Female'),

	(75, 'Annalise', 'Stanier', '2565 Mockingbird Parkway', 'Female'),

	(76, 'Anatola', 'Harnett', '53360 Donald Road', 'Female'),

	(77, 'Leon', 'De Normanville', '57219 Welch Plaza', 'Male'),

	(78, 'Janessa', 'Edgeley', '84 Almo Circle', 'Female'),

	(79, 'Rolando', 'Spitell', '07158 Hallows Drive', 'Male'),

	(80, 'Pierson', 'Sailer', '8010 John Wall Center', 'Male'),

	(81, 'Dorie', 'Seneschal', '57 Del Mar Court', 'Male'),

	(82, 'Pail', 'Bridgnell', '793 Parkside Trail', 'Male'),

	(83, 'Jacquelyn', 'Stucke', '3 Fisk Pass', 'Female'),

	(84, 'Tito', 'Mance', '07 Fulton Avenue', 'Male'),

	(85, 'Zulema', 'Strowthers', '0101 Aberg Pass', 'Female'),

	(86, 'Derk', 'McCarthy', '584 Oriole Lane', 'Male'),

	(87, 'Hestia', 'Bartkiewicz', '3 Washington Place', 'Female'),

	(88, 'Cliff', 'Scotti', '06449 South Court', 'Male'),

	(89, 'Drugi', 'Janton', '003 Vahlen Lane', 'Male'),

	(90, 'Paco', 'Whiteson', '0161 Riverside Junction', 'Male'),

	(91, 'Leodora', 'Lys', '46277 Rusk Road', 'Female'),

	(92, 'Dionis', 'Krysztofowicz', '5509 Calypso Place', 'Female'),

	(93, 'Carver', 'Fordham', '02 Magdeline Lane', 'Male'),

	(94, 'Jeffy', 'Husselbee', '621 Longview Place', 'Male'),

	(95, 'Kary', 'Geeraert', '32 7th Plaza', 'Female'),

	(96, 'Sherye', 'Gilstoun', '04 Tennyson Court', 'Female'),

	(97, 'Matthus', 'Foulser', '783 Drewry Trail', 'Male'),

	(98, 'Evyn', 'Pavyer', '53428 Morrow Lane', 'Male'),

	(99, 'Lloyd', 'Jaksic', '6959 Arkansas Circle', 'Male'),

	(100, 'Webster', 'Kagan', '1671 Pine View Street', 'Male'),

	(101, 'Alphonse', 'Kunzler', '9 Kenwood Place', 'Male'),

	(102, 'Ramsay', 'Farrans', '9378 Darwin Drive', 'Male'),

	(103, 'Geno', 'Spacie', '7 Harper Way', 'Male'),

	(104, 'Gratia', 'Quennell', '9 Dryden Junction', 'Female'),

	(105, 'Eada', 'Roubeix', '9 Fairfield Circle', 'Female'),

	(106, 'Maurizio', 'Langland', '600 School Street', 'Male'),

	(107, 'Eldin', 'Tizzard', '150 Dryden Crossing', 'Male'),

	(108, 'Nelson', 'Laister', '42407 Sommers Center', 'Male'),

	(109, 'Brockie', 'Grealy', '669 Hollow Ridge Park', 'Male'),

	(110, 'Horten', 'Lamacraft', '89 Thackeray Way', 'Male'),

	(111, 'Lizbeth', 'Loxly', '5306 Bluejay Park', 'Female'),

	(112, 'Aurelia', 'Redish', '44583 Monica Road', 'Female'),

	(113, 'Therese', 'Piquard', '9802 2nd Crossing', 'Female'),

	(114, 'Muire', 'Easterfield', '16 Gulseth Trail', 'Female'),

	(115, 'Inez', 'Mival', '44 Ohio Avenue', 'Female'),

	(116, 'Giorgio', 'Baldetti', '70330 Hanson Lane', 'Male'),

	(117, 'Eddy', 'Ruddiman', '4721 Hintze Parkway', 'Female'),

	(118, 'Bartholomeus', 'Tippett', '7 Debra Court', 'Male'),

	(119, 'Pat', 'Pinsent', '34505 Prairieview Avenue', 'Male'),

	(120, 'Anna-diane', 'Cancelier', '73853 Hazelcrest Street', 'Female'),

	(121, 'Valentin', 'Labrum', '5 Paget Place', 'Male'),

	(122, 'Roarke', 'Probat', '7 Northwestern Way', 'Male'),

	(123, 'Nettie', 'Kinney', '2095 Westport Lane', 'Female'),

	(124, 'Daria', 'Innerstone', '8 Bartillon Crossing', 'Female'),

	(125, 'Eileen', 'Matthaus', '8 Texas Pass', 'Female'),

	(126, 'Bobine', 'Akker', '0 Bobwhite Hill', 'Female'),

	(127, 'Shaun', 'Cosin', '9 Transport Place', 'Male'),

	(128, 'Ximenes', 'O\'Heaney', '429 Sugar Avenue', 'Male'),

	(129, 'Wood', 'Lodden', '07 Lake View Trail', 'Male'),

	(130, 'Lyndsay', 'Finlason', '5201 Rusk Junction', 'Female'),

	(131, 'Camile', 'Commings', '6506 Tennyson Point', 'Female'),

	(132, 'Matilde', 'Lordon', '9 Texas Junction', 'Female'),

	(133, 'Brnaby', 'Whenman', '909 Sugar Crossing', 'Male'),

	(134, 'Darin', 'Pendre', '20 Pine View Place', 'Male'),

	(135, 'Judon', 'Dearnaley', '3 Charing Cross Avenue', 'Male'),

	(136, 'Diane-marie', 'Keightley', '335 Banding Alley', 'Female'),

	(137, 'Ashil', 'Aleksich', '17 Portage Trail', 'Female'),

	(138, 'Jermain', 'McAlpin', '1 Manley Avenue', 'Male'),

	(139, 'Lowe', 'Pavelin', '71 Menomonie Lane', 'Male'),

	(140, 'Tallie', 'Rudiger', '70404 Mifflin Lane', 'Male'),

	(141, 'Elton', 'Navein', '4 Boyd Plaza', 'Male'),

	(142, 'Alyce', 'Sivyour', '57553 Burning Wood Way', 'Female'),

	(143, 'Arv', 'Sifleet', '79 Debra Place', 'Male'),

	(144, 'Claire', 'Melwall', '66041 La Follette Junction', 'Female'),

	(145, 'Elvyn', 'Craft', '965 Nevada Way', 'Male'),

	(146, 'Maible', 'Aasaf', '15 Walton Lane', 'Female'),

	(147, 'Giffer', 'Pattrick', '3345 Mandrake Terrace', 'Male'),

	(148, 'Hermie', 'Claxson', '25 Summer Ridge Lane', 'Male'),

	(149, 'Umberto', 'O\'Scanlan', '65074 Pierstorff Court', 'Male'),

	(150, 'Dalila', 'Leakner', '706 Washington Trail', 'Female'),

	(151, 'Hulda', 'Rathbourne', '97 Ridge Oak Court', 'Female'),

	(152, 'Abie', 'Armsby', '2 Drewry Place', 'Male'),

	(153, 'Billy', 'Betjeman', '611 Jay Road', 'Female'),

	(154, 'Carlo', 'Jenkerson', '80078 Mesta Drive', 'Male'),

	(155, 'Marylee', 'Persitt', '5077 Summit Alley', 'Female'),

	(156, 'Marcellina', 'Roocroft', '38 Goodland Street', 'Female'),

	(157, 'Babette', 'Giovannelli', '8909 Elgar Point', 'Female'),

	(158, 'Kermy', 'Allworthy', '5 Artisan Center', 'Male'),

	(159, 'Oneida', 'Downgate', '8506 Corben Parkway', 'Female'),

	(160, 'Gareth', 'Loding', '11556 Hanover Way', 'Male'),

	(161, 'Herbert', 'Beaver', '0 Butternut Terrace', 'Male'),

	(162, 'Evin', 'Dewsbury', '56080 Magdeline Trail', 'Male'),

	(163, 'Adamo', 'McConnulty', '66 North Parkway', 'Male'),

	(164, 'Egon', 'Andrusyak', '4986 Northland Park', 'Male'),

	(165, 'Kassie', 'Bedenham', '844 Ronald Regan Point', 'Female'),

	(166, 'Scarlett', 'Cawse', '94187 Russell Pass', 'Female'),

	(167, 'Javier', 'Hasted', '6 Westport Lane', 'Male'),

	(168, 'Eadmund', 'Esp', '9 Kropf Junction', 'Male'),

	(169, 'Dolf', 'Risebrow', '09 Pearson Terrace', 'Male'),

	(170, 'Micah', 'Elson', '092 Mariners Cove Crossing', 'Male'),

	(171, 'Rufus', 'Wase', '84 Dovetail Trail', 'Male'),

	(172, 'Alfie', 'Trevear', '30570 Lotheville Point', 'Female'),

	(173, 'Shanda', 'Westphal', '872 Hooker Pass', 'Female'),

	(174, 'Fons', 'Persitt', '51410 Havey Center', 'Male'),

	(175, 'Pearle', 'Drust', '1 Moose Pass', 'Female'),

	(176, 'Mollee', 'Clancy', '4878 Claremont Terrace', 'Female'),

	(177, 'Minny', 'Viste', '553 Algoma Point', 'Female'),

	(178, 'Rebecka', 'De Paepe', '67 Talmadge Parkway', 'Female'),

	(179, 'Christyna', 'Chung', '4 Pond Avenue', 'Female'),

	(180, 'Monica', 'Masi', '20906 Elmside Way', 'Female'),

	(181, 'Lydie', 'Crane', '76505 Arkansas Parkway', 'Female'),

	(182, 'Killy', 'Iacobassi', '0997 Gale Pass', 'Male'),

	(183, 'Torrance', 'Pamplin', '3 Heath Lane', 'Male'),

	(184, 'Rodger', 'Cattach', '74 Fieldstone Park', 'Male'),

	(185, 'Alanson', 'Biernacki', '13586 Debs Pass', 'Male'),

	(186, 'Nikkie', 'Morais', '80 Hovde Drive', 'Female'),

	(187, 'Andres', 'Oger', '1493 Emmet Avenue', 'Male'),

	(188, 'Isac', 'Lyven', '8 Meadow Vale Terrace', 'Male'),

	(189, 'Riva', 'Nials', '9252 Hanover Court', 'Female'),

	(190, 'Rickie', 'Mc Gorley', '25287 Redwing Place', 'Male'),

	(191, 'Elisha', 'MacInerney', '655 Springs Park', 'Male'),

	(192, 'Jamaal', 'Bushen', '5653 Continental Alley', 'Male'),

	(193, 'Denney', 'Eplate', '3 Pierstorff Court', 'Male'),

	(194, 'Erv', 'Horning', '0579 Barnett Drive', 'Male'),

	(195, 'Myrvyn', 'Seawell', '59 Prentice Avenue', 'Male'),

	(196, 'Hamil', 'McHaffy', '5 Independence Crossing', 'Male'),

	(197, 'Gayle', 'Raccio', '88450 Larry Trail', 'Female'),

	(198, 'Cristy', 'Keohane', '543 Blackbird Plaza', 'Female'),

	(199, 'Hugues', 'Sizey', '21 Hauk Park', 'Male'),

	(200, 'Estell', 'Iacopetti', '266 Towne Pass', 'Female'),

	(201, 'Rad', 'Skipton', '85623 Garrison Alley', 'Male'),

	(202, 'Selig', 'Matyashev', '0175 Mayfield Center', 'Male'),

	(203, 'Emlen', 'Ruffler', '0 Shopko Park', 'Male'),

	(204, 'Claus', 'Dench', '2 Delaware Hill', 'Male'),

	(205, 'Egon', 'Crammy', '3016 Hoard Crossing', 'Male'),

	(206, 'Carey', 'Bangle', '05 Mandrake Trail', 'Female'),

	(207, 'Jereme', 'Andresen', '2 Esch Terrace', 'Male'),

	(208, 'Jeri', 'Haslehurst', '178 Anderson Way', 'Female'),

	(209, 'Bernie', 'Thorneywork', '94 Debs Avenue', 'Male'),

	(210, 'Philip', 'McGraw', '1 Dahle Drive', 'Male'),

	(211, 'Klarika', 'Swinerd', '92131 Maple Hill', 'Female'),

	(212, 'Leann', 'Elston', '35 David Park', 'Female'),

	(213, 'Robby', 'Newall', '42473 Dexter Pass', 'Female'),

	(214, 'Lindi', 'Eustes', '50314 Arizona Avenue', 'Female'),

	(215, 'Dominique', 'Crowther', '04 Eastlawn Parkway', 'Female'),

	(216, 'Colette', 'Pessolt', '2 Delaware Drive', 'Female'),

	(217, 'Jimmie', 'Lamps', '9 Pine View Pass', 'Male'),

	(218, 'Laverna', 'Parlett', '98975 Briar Crest Alley', 'Female'),

	(219, 'Linc', 'McChruiter', '8167 Eagan Street', 'Male'),

	(220, 'Dame', 'Ugolotti', '6 North Point', 'Male'),

	(221, 'Gordie', 'Whardley', '06 Norway Maple Hill', 'Male'),

	(222, 'Jerrine', 'Barrasse', '72 Florence Hill', 'Female'),

	(223, 'Nero', 'Ivy', '54100 Chive Terrace', 'Male'),

	(224, 'Eunice', 'Molineaux', '63442 Luster Trail', 'Female'),

	(225, 'Kirsteni', 'Vedekhin', '48 Holy Cross Center', 'Female'),

	(226, 'Cybil', 'Navarro', '36 Sunfield Way', 'Female'),

	(227, 'Brien', 'Lamasna', '43 Katie Junction', 'Male'),

	(228, 'Bram', 'Cruden', '01176 Harper Place', 'Male'),

	(229, 'Arnie', 'Cawdron', '74 North Place', 'Male'),

	(230, 'Germaine', 'O\'Flynn', '87 Jana Parkway', 'Female'),

	(231, 'Frankie', 'Beilby', '31886 Old Gate Parkway', 'Female'),

	(232, 'Celene', 'Lambertson', '30 8th Lane', 'Female'),

	(233, 'Maressa', 'Antonacci', '2961 Eagan Street', 'Female'),

	(234, 'Emmerich', 'Standrin', '72631 Mallory Parkway', 'Male'),

	(235, 'Roxi', 'Mowsdale', '1 Cody Way', 'Female'),

	(236, 'Patten', 'Tattersfield', '6 Milwaukee Alley', 'Male'),

	(237, 'Wyatan', 'Jandl', '1386 Chive Circle', 'Male'),

	(238, 'Dorotea', 'Hassard', '0376 Sycamore Park', 'Female'),

	(239, 'Jesus', 'MacLardie', '35788 Blackbird Alley', 'Male'),

	(240, 'Alexa', 'Fern', '623 Pond Trail', 'Female'),

	(241, 'Algernon', 'Leyes', '5 Starling Alley', 'Male'),

	(242, 'Modesta', 'Hub', '18667 Straubel Parkway', 'Female'),

	(243, 'Dacia', 'Reeson', '788 Farmco Center', 'Female'),

	(244, 'Desdemona', 'Turpey', '029 Elmside Center', 'Female'),

	(245, 'Nari', 'Joinson', '5111 Monterey Avenue', 'Female'),

	(246, 'Ervin', 'Valentin', '0602 Waubesa Crossing', 'Male'),

	(247, 'Daven', 'Weems', '274 Gina Drive', 'Male'),

	(248, 'Velvet', 'Mulliss', '3 Mallory Junction', 'Female'),

	(249, 'Tom', 'Tidgewell', '5 Cottonwood Place', 'Male'),

	(250, 'Gasparo', 'Fawloe', '7 Bay Point', 'Male'),

	(251, 'Cullen', 'Ellery', '71 Harbort Center', 'Male'),

	(252, 'Pandora', 'Mennell', '79 Northview Circle', 'Female'),

	(253, 'Lauritz', 'Gollin', '9797 Lake View Hill', 'Male'),

	(254, 'Alasteir', 'Reeve', '9530 Summer Ridge Park', 'Male'),

	(255, 'Quincey', 'Stelljes', '93123 Hagan Alley', 'Male'),

	(256, 'Anthe', 'Dootson', '52 Clemons Plaza', 'Female'),

	(257, 'Briggs', 'Kem', '3305 Main Lane', 'Male'),

	(258, 'Helli', 'Rosencrantz', '78 Dorton Alley', 'Female'),

	(259, 'Mayne', 'Bendin', '8663 Bartillon Park', 'Male'),

	(260, 'Giulio', 'Wilks', '1753 Maple Pass', 'Male'),

	(261, 'Murry', 'Giles', '3971 Kedzie Circle', 'Male'),

	(262, 'Price', 'Considine', '1628 Dennis Terrace', 'Male'),

	(263, 'Muffin', 'Pinar', '2601 Anthes Lane', 'Male'),

	(264, 'Beckie', 'Breckin', '31 Thackeray Alley', 'Female'),

	(265, 'Ty', 'Galer', '769 Annamark Place', 'Male'),

	(266, 'Georgy', 'Kopfer', '89 Dapin Plaza', 'Male'),

	(267, 'Emelen', 'Booth', '5 Delaware Circle', 'Male'),

	(268, 'Nannie', 'Loftus', '13711 Glendale Park', 'Female'),

	(269, 'Alida', 'Palin', '7752 Mccormick Place', 'Female'),

	(270, 'Penelope', 'Fouracre', '2653 Harper Plaza', 'Female'),

	(271, 'Naoma', 'Nobriga', '6 Jay Trail', 'Female'),

	(272, 'Arlette', 'Townes', '43 Welch Hill', 'Female'),

	(273, 'Rasla', 'Snowman', '0667 Northwestern Avenue', 'Female'),

	(274, 'Koren', 'Bellocht', '14 3rd Trail', 'Female'),

	(275, 'Ulrich', 'Palphramand', '179 Pennsylvania Drive', 'Male'),

	(276, 'Lenette', 'Goede', '18277 Surrey Park', 'Female'),

	(277, 'Adrien', 'Keningham', '51471 Oneill Lane', 'Male'),

	(278, 'Bailie', 'Reside', '5499 Fieldstone Point', 'Male'),

	(279, 'Alec', 'Dowson', '1558 Scott Terrace', 'Male'),

	(280, 'Brendin', 'Button', '07 Chinook Park', 'Male'),

	(281, 'Jemmy', 'Rawlin', '9 La Follette Park', 'Female'),

	(282, 'Galvin', 'Lafayette', '83093 Kensington Lane', 'Male'),

	(283, 'Josy', 'McCrisken', '45 Graceland Road', 'Female'),

	(284, 'Felicio', 'Slyme', '51 Hoepker Park', 'Male'),

	(285, 'Diena', 'Glave', '41 Namekagon Street', 'Female'),

	(286, 'Darryl', 'Greste', '6 Lighthouse Bay Hill', 'Male'),

	(287, 'Sauveur', 'O\'Loinn', '1 Sunbrook Avenue', 'Male'),

	(288, 'Broderic', 'Leggan', '84 Colorado Trail', 'Male'),

	(289, 'Angelica', 'Brockie', '80350 Springview Court', 'Female'),

	(290, 'Edmund', 'Petteford', '044 Milwaukee Crossing', 'Male'),

	(291, 'Obadiah', 'Ochterlonie', '003 Ramsey Way', 'Male'),

	(292, 'Pennie', 'Jeacop', '25283 Buena Vista Junction', 'Female'),

	(293, 'Emlynne', 'Kieran', '8103 Hoepker Avenue', 'Female'),

	(294, 'Jaime', 'Mosco', '517 Crowley Crossing', 'Female'),

	(295, 'Jade', 'Ambrosetti', '85545 Portage Place', 'Female'),

	(296, 'Glendon', 'Ferriman', '99 Sheridan Hill', 'Male'),

	(297, 'Steffane', 'Clutram', '8 Victoria Terrace', 'Female'),

	(298, 'Elayne', 'Arbuckle', '43118 Cardinal Hill', 'Female'),

	(299, 'Bethena', 'Hassey', '32725 Logan Street', 'Female'),

	(300, 'Jehu', 'Sawkin', '30 Lighthouse Bay Hill', 'Male'),

	(301, 'Lyn', 'Langfat', '112 Fremont Crossing', 'Male'),

	(302, 'Rory', 'Friedank', '1 Pine View Way', 'Male');

/*!40000 ALTER TABLE `persons` ENABLE KEYS */;



-- Copiando estrutura para tabela rest_with_asp_net_udemy.users

CREATE TABLE IF NOT EXISTS `users` (

  `ID` int(10) NOT NULL AUTO_INCREMENT,

  `Login` varchar(50) NOT NULL,

  `AccessKey` varchar(50) NOT NULL,

  PRIMARY KEY (`ID`),

  UNIQUE KEY `Login` (`Login`)

) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;



-- Copiando dados para a tabela rest_with_asp_net_udemy.users: ~2 rows (aproximadamente)

DELETE FROM `users`;

/*!40000 ALTER TABLE `users` DISABLE KEYS */;

INSERT INTO `users` (`ID`, `Login`, `AccessKey`) VALUES

	(1, 'leandro', 'admin123'),

	(2, 'flavio', 'user123');

/*!40000 ALTER TABLE `users` ENABLE KEYS */;



/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;

/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
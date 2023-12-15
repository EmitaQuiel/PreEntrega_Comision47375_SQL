-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: proyecto_pokemon
-- ------------------------------------------------------
-- Server version	8.0.34

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Dumping data for table `ciudades`
--

LOCK TABLES `ciudades` WRITE;
/*!40000 ALTER TABLE `ciudades` DISABLE KEYS */;
INSERT INTO `ciudades` VALUES (1,'Ciudad Paleta',1),(2,'Ciudad Plateada',1),(3,'Ciudad Trigal',3),(4,'Ciudad Iris',3),(5,'Ciudad Hoz',4),(6,'Ciudad Azafrán',4),(7,'Ciudad Corazón',5),(8,'Ciudad Luminalia',7),(9,'Ciudad Relieve',7),(10,'Ciudad Hauoli',8),(11,'Ciudad Arbórea',8),(12,'Ciudad Rute',9),(13,'Ciudad Circhester',9),(14,'Ciudad Postwick',10),(15,'Ciudad Spikemuth',10),(16,'Ciudad Verde',1),(17,'Ciudad Celeste',1),(18,'Ciudad Fucsia',1),(19,'Ciudad Almendra',3),(20,'Ciudad Malva',3),(21,'Ciudad Algaria',4),(22,'Ciudad Puntaneva',5),(23,'Ciudad Vetusta',5),(24,'Ciudad Frescor',7),(25,'Ciudad Fluxus',7),(26,'Ciudad Metal',8),(27,'Ciudad Portmanteau',8),(28,'Ciudad Covadonga',9),(29,'Ciudad Shildon',9),(30,'Ciudad Elísea',10),(31,'Ciudad Honoré',10),(32,'Ciudad Carmín',1),(33,'Ciudad Cerezo',3),(34,'Ciudad Olivo',3),(35,'Ciudad Portual',4),(36,'Ciudad Marea',4),(37,'Ciudad Rocavelo',5),(38,'Ciudad Jubileo',5),(39,'Ciudad Témpera',7),(40,'Ciudad Yantara',7),(41,'Ciudad Aurelia',8),(42,'Ciudad Orquídea',8),(43,'Ciudad Antigua',9),(44,'Ciudad Pistón',9),(45,'Ciudad Antón',10),(46,'Ciudad Shield',10),(47,'Ciudad Paleta',1),(48,'Ciudad Plateada',1),(49,'Ciudad Trigal',3),(50,'Ciudad Iris',3),(51,'Ciudad Hoz',4),(52,'Ciudad Azafrán',4),(53,'Ciudad Corazón',5),(54,'Ciudad Luminalia',7),(55,'Ciudad Relieve',7),(56,'Ciudad Hauoli',8),(57,'Ciudad Arbórea',8),(58,'Ciudad Rute',9),(59,'Ciudad Circhester',9),(60,'Ciudad Postwick',10),(61,'Ciudad Spikemuth',10),(62,'Ciudad Verde',1),(63,'Ciudad Celeste',1),(64,'Ciudad Fucsia',1),(65,'Ciudad Almendra',3),(66,'Ciudad Malva',3),(67,'Ciudad Algaria',4),(68,'Ciudad Puntaneva',5),(69,'Ciudad Vetusta',5),(70,'Ciudad Frescor',7),(71,'Ciudad Fluxus',7),(72,'Ciudad Metal',8),(73,'Ciudad Portmanteau',8),(74,'Ciudad Covadonga',9),(75,'Ciudad Shildon',9),(76,'Ciudad Elísea',10),(77,'Ciudad Honoré',10),(78,'Ciudad Carmín',1),(79,'Ciudad Cerezo',3),(80,'Ciudad Olivo',3),(81,'Ciudad Portual',4),(82,'Ciudad Marea',4),(83,'Ciudad Rocavelo',5),(84,'Ciudad Jubileo',5),(85,'Ciudad Témpera',7),(86,'Ciudad Yantara',7),(87,'Ciudad Aurelia',8),(88,'Ciudad Orquídea',8),(89,'Ciudad Antigua',9),(90,'Ciudad Pistón',9),(91,'Ciudad Antón',10),(92,'Ciudad Shield',10);
/*!40000 ALTER TABLE `ciudades` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `habitat`
--

LOCK TABLES `habitat` WRITE;
/*!40000 ALTER TABLE `habitat` DISABLE KEYS */;
INSERT INTO `habitat` VALUES (1,'Pradera','Se encuentran en la hierba alta de las rutas. '),(2,'Bosque','Son en su mayoría Pokémon bicho y planta, viven en lugares un poco más protegidos.'),(3,'Agua dulce','Son en su mayoría Pokémon de tipo agua que viven en lagos o ríos.'),(4,'Agua salada','Son en su mayoría Pokémon de agua que viven en la superficie del mar o en las profundidades.'),(5,'Caverna','Habitan en cuevas siempre aislados, necesitan de la oscuridad y no son vistos en la hierba.'),(6,'Montaña','Son vistos en las zonas rocosas y altas cumbres, pueden ser cuevas o superficie.'),(7,'Campo','Viven aislados de todo contacto humano, en zonas inhóspitas como desiertos.'),(8,'Ciudad','Son Pokémon domesticados o que viven en las ciudades.');
/*!40000 ALTER TABLE `habitat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `habitat_pokemon`
--

LOCK TABLES `habitat_pokemon` WRITE;
/*!40000 ALTER TABLE `habitat_pokemon` DISABLE KEYS */;
INSERT INTO `habitat_pokemon` VALUES (3,1,2),(4,1,3),(5,2,4),(6,2,5),(7,2,6),(8,3,7),(9,3,8),(10,4,16),(11,4,17),(12,5,25),(13,5,26),(14,6,44),(15,6,45),(16,7,46),(17,7,47),(18,8,48),(19,8,49),(20,1,51),(21,2,52),(22,2,154),(23,3,155),(24,3,156),(25,4,157),(26,4,158),(27,5,159),(28,5,160),(29,5,161),(30,6,162),(31,6,163),(32,7,164),(33,7,256),(34,8,257),(35,1,260),(36,2,261),(37,3,262),(38,3,263),(39,4,264),(40,4,265),(41,5,266),(42,5,267),(43,6,268),(44,6,392),(45,7,393),(46,8,394),(47,8,395),(48,1,397),(49,1,398),(50,2,399),(51,2,400),(52,3,401),(53,3,402),(54,4,403),(55,4,404),(56,5,405),(57,5,495),(58,6,496),(59,6,497),(60,7,498),(61,7,499),(62,8,500),(63,8,501),(64,1,658),(65,2,659),(66,3,660),(67,3,661),(68,4,662),(69,4,663),(70,5,664),(71,5,669),(72,6,670),(73,6,671),(74,7,724),(75,7,725),(76,8,726),(77,8,727),(78,4,728),(79,1,729),(80,1,730),(81,2,731),(82,2,732),(83,3,733),(84,3,734),(85,4,735),(86,4,736),(87,5,737),(88,5,813),(89,6,814),(90,6,815),(91,7,816),(92,7,817),(93,8,818),(94,8,819);
/*!40000 ALTER TABLE `habitat_pokemon` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `log_movimiento_pokemon`
--

LOCK TABLES `log_movimiento_pokemon` WRITE;
/*!40000 ALTER TABLE `log_movimiento_pokemon` DISABLE KEYS */;
INSERT INTO `log_movimiento_pokemon` VALUES (1,'root@localhost','2023-12-05','14:55:42','DELETE','Registro con ID: 44 eliminado'),(2,'root@localhost','2023-12-05','14:55:42','DELETE','Registro con ID: 81 eliminado'),(3,'root@localhost','2023-12-05','15:33:54','DELETE','Registro con ID: 39 eliminado'),(4,'root@localhost','2023-12-05','15:33:54','DELETE','Registro con ID: 42 eliminado'),(5,'root@localhost','2023-12-05','15:33:54','DELETE','Registro con ID: 76 eliminado'),(6,'root@localhost','2023-12-05','15:33:54','DELETE','Registro con ID: 79 eliminado');
/*!40000 ALTER TABLE `log_movimiento_pokemon` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `log_pokemon`
--

LOCK TABLES `log_pokemon` WRITE;
/*!40000 ALTER TABLE `log_pokemon` DISABLE KEYS */;
/*!40000 ALTER TABLE `log_pokemon` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `movimiento`
--

LOCK TABLES `movimiento` WRITE;
/*!40000 ALTER TABLE `movimiento` DISABLE KEYS */;
INSERT INTO `movimiento` VALUES (1,'Lanzaroca','Lanza rocas',15,50,90,14),(2,'Drenadoras','Drena energía del objetivo',10,75,100,12),(3,'Agujero Negro','Absorbe al objetivo en un agujero negro',5,120,80,15),(4,'Espada Santa','Ataque de tipo Hada',15,100,100,8),(5,'Terremoto','Provoca un terremoto',10,100,100,16),(6,'Hidrobomba','Dispara un poderoso chorro de agua',5,110,80,2),(7,'Rayo Hielo','Dispara un rayo de hielo',10,95,100,9),(8,'Trueno','Genera una tormenta eléctrica',10,110,70,5),(9,'Hoja Mágica','Ataque de tipo Planta',20,60,100,12),(10,'Lanzallamas','Lanza una llamarada de fuego',15,90,100,7),(11,'Tajo Umbrío','Ataque de tipo Siniestro',20,70,100,15),(12,'Pulso Dragón','Ataque de tipo Dragón',10,85,100,4),(13,'Rayo','Dispara un rayo eléctrico',15,90,100,5),(14,'Golpe Aéreo','Ataque de tipo Volador',20,60,95,17),(15,'Pájaro Osado','Ataque de tipo Volador',15,120,100,17),(16,'Esfera Aural','Ataque de tipo Hada',20,80,100,8),(17,'Ciclón','Ataque de tipo Volador',20,80,90,17),(18,'Alarido','Ataque de tipo Siniestro',40,0,100,15),(19,'Desarme','Ataque de tipo Lucha',20,60,100,10),(20,'Tormenta de Arena','Crea una tormenta de arena',10,0,100,16),(21,'Energibola','Lanza una bola de energía',10,90,100,5),(22,'Rayo Carga','Ataque de tipo Eléctrico',20,50,90,5),(23,'Triturar','Muerde al objetivo con fuerza',10,80,100,15),(24,'Destello','Ataque de tipo Hada',15,80,100,8),(25,'Pantalla Luz','Crea una pantalla de luz',20,0,100,13),(26,'Carantoña','Aumenta la defensa del usuario',40,0,100,11),(27,'Rueda Fuego','Rueda de fuego',20,60,100,7),(28,'Rayo Solar','Carga energía solar y lanza un rayo',10,120,100,12),(29,'Cola Dragón','Ataque de tipo Dragón',10,60,100,4),(30,'Gruñido','Intimida al objetivo',40,0,100,11),(31,'Reflejo','Crea una barrera de luz',20,0,100,13),(32,'Latigazo','Ataque de tipo Planta',20,45,100,12),(33,'Viento Cortante','Corta al objetivo con viento afilado',20,55,95,17),(34,'Tormenta de Arena','Crea una tormenta de arena',10,0,100,16),(35,'Pisotón','Pisa al objetivo',15,65,100,11),(36,'Ataque Ala','Golpea al objetivo con las alas',20,60,100,17),(37,'Colmillo Hielo','Ataque de tipo Hielo',15,65,95,9);
/*!40000 ALTER TABLE `movimiento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `movimiento_pokemon`
--

LOCK TABLES `movimiento_pokemon` WRITE;
/*!40000 ALTER TABLE `movimiento_pokemon` DISABLE KEYS */;
INSERT INTO `movimiento_pokemon` VALUES (2,1,1),(3,2,2),(4,3,3),(5,4,4),(6,5,5),(7,6,6),(8,7,7),(9,8,8),(10,9,9),(11,16,16),(12,17,17),(13,25,25),(14,26,26),(15,7,44),(16,8,45),(17,9,46),(18,10,47),(19,11,48),(20,12,49),(21,14,51),(22,15,52),(23,16,154),(24,17,155),(25,18,156),(26,19,157),(27,20,158),(28,21,159),(29,22,160),(30,23,161),(31,24,162),(32,25,163),(33,26,164),(34,27,256),(35,28,257),(36,29,258),(37,30,259),(38,31,260),(40,33,262),(41,34,263),(43,36,265),(45,1,267),(46,2,268),(47,3,392),(48,4,393),(49,5,394),(50,6,395),(51,7,396),(52,8,397),(53,9,398),(54,10,399),(55,11,400),(56,12,401),(57,13,402),(58,14,403),(59,15,404),(60,16,405),(61,17,495),(62,18,496),(63,19,497),(64,20,498),(65,21,499),(66,22,500),(67,23,501),(68,24,502),(69,25,503),(70,26,658),(71,27,659),(72,28,660),(73,29,661),(74,30,662),(75,31,663),(77,33,669),(78,34,670),(80,36,724),(82,1,726),(83,2,727),(84,3,728),(85,4,729),(86,5,730),(87,6,731),(88,7,732),(89,8,733),(90,9,734),(91,10,735),(92,11,736),(93,12,737),(94,13,813),(95,14,814),(96,15,815),(97,16,816),(98,17,817),(99,18,818),(100,19,819),(101,20,820),(102,21,821);
/*!40000 ALTER TABLE `movimiento_pokemon` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `pokemon`
--

LOCK TABLES `pokemon` WRITE;
/*!40000 ALTER TABLE `pokemon` DISABLE KEYS */;
INSERT INTO `pokemon` VALUES (1,'Bulbasaur',1,3,45,'Espesura','Semilla',0.70,'M/F',6.90,1,12),(2,'Ivysaur',1,1,60,'Espesura','Semilla',1.00,'M/F',13.00,1,12),(3,'Venusaur',1,0,80,'Espesura','Semilla',2.00,'M/F',100.00,1,12),(4,'Charmander',1,1,39,'Mar Llamas','Lagartija',0.60,'M/F',8.50,1,7),(5,'Charmeleon',1,1,58,'Mar Llamas','Lagarto',1.10,'M/F',19.00,1,7),(6,'Charizard',1,0,78,'Mar Llamas','Llama',1.70,'M/F',90.50,1,7),(7,'Squirtle',1,1,44,'Torrente','Tortuga',0.50,'M/F',9.00,1,2),(8,'Wartortle',1,1,59,'Torrente','Tortuga',1.00,'M/F',22.50,1,2),(9,'Blastoise',1,0,79,'Torrente','Marisco',1.60,'M/F',85.50,1,2),(16,'Pidgey',1,1,40,'Tumbos','Pajarito',0.30,'M/F',1.80,1,17),(17,'Pidgeotto',1,1,63,'Tumbos','Pájaro',1.10,'M/F',30.00,1,17),(25,'Pikachu',1,1,35,'Electricidad Estática','Ratón',0.40,'M/F',6.00,1,5),(26,'Raichu',1,0,60,'Electricidad Estática','Ratón',0.80,'M/F',30.00,1,5),(44,'Gloom',1,1,60,'Clorofila','Hierba',0.80,'M/F',8.60,1,10),(45,'Vileplume',1,0,75,'Clorofila','Hierba',1.20,'M/F',18.60,1,10),(46,'Paras',1,1,35,'Efecto Espora','Champiñón',0.30,'M/F',5.40,1,3),(47,'Parasect',1,0,60,'Efecto Espora','Champiñón',1.00,'M/F',29.50,1,3),(48,'Venonat',1,1,60,'Polvo Escama','Insecto',1.00,'M/F',30.00,1,3),(49,'Venomoth',1,0,70,'Polvo Escama','Polilla',1.50,'M/F',12.50,1,3),(51,'Dugtrio',1,0,35,'Fuga','Topo',0.70,'M/F',33.30,1,16),(52,'Meowth',1,1,40,'Recogida','Ratón',0.40,'M/F',4.20,1,11),(154,'Meganium',2,0,80,'Espesura','Hierba',1.80,'M/F',100.50,3,12),(155,'Cyndaquil',2,1,39,'Mar Llamas','Fuego',0.50,'M/F',7.90,3,7),(156,'Quilava',2,1,58,'Mar Llamas','Fuego',0.90,'M/F',19.00,3,7),(157,'Typhlosion',2,0,78,'Mar Llamas','Volcán',1.70,'M/F',79.50,3,7),(158,'Totodile',2,2,50,'Torrente','Cocodrilo',0.60,'M/F',9.50,3,2),(159,'Croconaw',2,1,65,'Torrente','Cocodrilo',1.10,'M/F',25.00,3,2),(160,'Feraligatr',2,0,85,'Torrente','Gran Cocodrilo',2.30,'M/F',88.80,3,2),(161,'Sentret',2,1,35,'Vista Lince','Mapache',0.80,'M/F',6.00,3,11),(162,'Furret',2,0,85,'Vista Lince','Mapache',1.80,'M/F',32.50,3,11),(163,'Hoothoot',2,1,60,'Insomnio','Búho',0.70,'M/F',21.20,3,17),(164,'Noctowl',2,0,100,'Insomnio','Búho',1.60,'M/F',40.80,3,17),(256,'Combusken',3,1,60,'Mar Llamas','Pollo',0.90,'M/F',19.50,4,7),(257,'Blaziken',3,0,80,'Mar Llamas','Gallardo',1.90,'M/F',52.00,4,7),(258,'Mudkip',3,3,50,'Torrente','Alevín',0.40,'M/F',7.60,4,2),(259,'Marshtomp',3,1,70,'Torrente','Anfibio',0.70,'M/F',28.00,4,2),(260,'Swampert',3,0,100,'Torrente','Anfibio',1.50,'M/F',81.90,4,2),(261,'Poochyena',3,1,35,'Fuga','Cachorro',0.50,'M/F',13.60,4,15),(262,'Mightyena',3,0,70,'Fuga','Mordisco',1.00,'M/F',37.00,4,15),(263,'Zigzagoon',3,1,38,'Recogebolas','Mapache',0.40,'M/F',17.50,4,11),(264,'Linoone',3,0,78,'Recogebolas','Mapache',0.50,'M/F',32.50,4,11),(265,'Wurmple',3,2,45,'Polvo Escudo','Gusano',0.30,'M/F',3.60,4,3),(266,'Silcoon',3,1,50,'Muda','Capullo',0.60,'M/F',10.00,4,3),(267,'Beautifly',3,0,60,'Polvo Escudo','Mariposa',1.00,'M/F',28.40,4,3),(268,'Cascoon',3,1,50,'Muda','Capullo',0.70,'M/F',11.50,4,3),(392,'Infernape',4,0,76,'Mar Llamas','Fuego',1.20,'M/F',55.00,5,7),(393,'Piplup',4,3,53,'Torrente','Pingüino',0.40,'M/F',5.20,5,2),(394,'Prinplup',4,1,64,'Torrente','Pingüino',0.80,'M/F',23.00,5,2),(395,'Empoleon',4,0,84,'Torrente','Emperador',1.70,'M/F',84.50,5,2),(396,'Starly',4,1,40,'Mirada Afilada','Estrella',0.30,'M/F',2.00,5,17),(397,'Staravia',4,1,55,'Mirada Afilada','Estrella',0.60,'M/F',15.50,5,17),(398,'Staraptor',4,0,85,'Mirada Afilada','Halcón',1.20,'M/F',24.90,5,17),(399,'Bidoof',4,1,59,'Navegante','Ratón',0.50,'M/F',20.00,5,11),(400,'Bibarel',4,0,79,'Navegante','Ratón Castor',1.00,'M/F',31.50,5,11),(401,'Kricketot',4,1,37,'Voz Sonora','Grillo',0.30,'M/F',2.20,5,3),(402,'Kricketune',4,0,77,'Voz Sonora','Grillo',1.00,'M/F',25.50,5,3),(403,'Shinx',4,1,45,'Rivalidad','Flash',0.50,'M/F',9.50,5,5),(404,'Luxio',4,1,60,'Rivalidad','Flash',0.90,'M/F',30.50,5,5),(405,'Luxray',4,0,80,'Rivalidad','Flash',1.40,'M/F',42.00,5,5),(495,'Snivy',5,3,45,'Espesura','Hierba',0.60,'M/F',8.10,6,12),(496,'Servine',5,1,60,'Espesura','Hierba',0.80,'M/F',16.00,6,12),(497,'Serperior',5,0,75,'Espesura','Regio',3.30,'M/F',63.00,6,12),(498,'Tepig',5,1,65,'Mar Llamas','Cerdo',0.50,'M/F',9.90,6,7),(499,'Pignite',5,1,90,'Mar Llamas','Cerdo',1.00,'M/F',55.50,6,7),(500,'Emboar',5,0,110,'Mar Llamas','Cerdo',1.60,'M/F',150.00,6,7),(501,'Oshawott',5,3,55,'Torrente','Mariscos',0.50,'M/F',5.90,6,2),(502,'Dewott',5,1,75,'Torrente','Reptil',0.80,'M/F',24.50,6,2),(503,'Samurott',5,0,95,'Torrente','Coraza',1.50,'M/F',94.60,6,2),(658,'Greninja',6,0,72,'Torrente','Ninja',1.50,'M/F',40.00,7,2),(659,'Bunnelby',6,1,38,'Recogebolas','Excavador',0.40,'M/F',5.00,7,11),(660,'Diggersby',6,0,85,'Recogebolas','Excavador',1.00,'M/F',42.00,7,11),(661,'Fletchling',6,1,45,'Agallas','Pajarito',0.30,'M/F',1.70,7,17),(662,'Fletchinder',6,1,62,'Agallas','Chispa',0.70,'M/F',16.00,7,17),(663,'Talonflame',6,0,78,'Agallas','Llamas',1.20,'M/F',24.50,7,17),(664,'Scatterbug',6,1,38,'Polvo Escudo','Polvo',0.40,'M/F',2.50,7,3),(669,'Flabébé',6,1,44,'Simbiosis','Unión',0.10,'M/F',0.10,7,8),(670,'Floette',6,1,54,'Simbiosis','Unión',0.20,'M/F',0.90,7,8),(671,'Florges',6,0,78,'Simbiosis','Jardín',1.10,'M/F',10.00,7,8),(724,'Decidueye',7,0,78,'Espesura','Arquero',1.60,'M/F',36.60,8,12),(725,'Litten',7,1,45,'Mar Llamas','Gatito',0.40,'M/F',4.30,8,7),(726,'Torracat',7,1,65,'Mar Llamas','Gatito',0.70,'M/F',25.00,8,7),(727,'Incineroar',7,0,95,'Mar Llamas','Heel',1.80,'M/F',83.00,8,7),(728,'Popplio',7,1,50,'Torrente','León Marino',0.40,'M/F',7.50,8,2),(729,'Brionne',7,1,60,'Torrente','León Marino',0.60,'M/F',17.50,8,2),(730,'Primarina',7,0,80,'Torrente','Sirena',1.80,'M/F',44.00,8,2),(731,'Pikipek',7,1,35,'Agallas','Pájaro Carpintero',0.30,'M/F',1.20,8,17),(732,'Trumbeak',7,1,55,'Agallas','Pájaro Carpintero',0.60,'M/F',14.80,8,17),(733,'Toucannon',7,0,80,'Agallas','Pájaro Carpintero',1.10,'M/F',26.00,8,17),(734,'Yungoos',7,1,48,'Voracidad','Ardilla',0.40,'M/F',6.00,8,11),(735,'Gumshoos',7,0,88,'Voracidad','Ardilla',0.70,'M/F',14.20,8,11),(736,'Grubbin',7,1,47,'Enjambre','Gusano',0.40,'M/F',4.40,8,5),(737,'Charjabug',7,1,57,'Enjambre','Carga',0.50,'M/F',10.50,8,5),(813,'Scorbunny',8,2,50,'Mar Llamas','Conejo',0.30,'M/F',4.50,9,7),(814,'Raboot',8,1,65,'Mar Llamas','Conejo',0.60,'M/F',9.00,9,7),(815,'Cinderace',8,0,80,'Mar Llamas','Conejo',1.40,'M/F',33.00,9,7),(816,'Sobble',8,2,50,'Torrente','Lagarto',0.30,'M/F',4.00,9,2),(817,'Drizzile',8,1,65,'Torrente','Lagarto',0.70,'M/F',11.50,9,2),(818,'Inteleon',8,0,70,'Torrente','Ágil',1.90,'M/F',45.20,9,2),(819,'Skwovet',8,1,70,'Gula','Rata',0.30,'M/F',2.30,9,11),(820,'Greedent',8,0,120,'Gula','Gula',0.60,'M/F',6.00,9,11),(821,'Rookidee',8,1,38,'Agallas','Pájaro',0.20,'M/F',1.80,9,17);
/*!40000 ALTER TABLE `pokemon` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `regiones`
--

LOCK TABLES `regiones` WRITE;
/*!40000 ALTER TABLE `regiones` DISABLE KEYS */;
INSERT INTO `regiones` VALUES (1,'Kanto','Kanto es una de las regiones con menos cuevas y montañas, entre ellas destaca la Cueva Diglett.'),(2,'Archi7','Este archipiélago se encuentra cerca de Kanto y está formado por nueve islas.'),(3,'Johto','Es una región casi llana con una meseta al este y un sistema montañoso '),(4,'Hoenn','Formada por un complejo de islas, es la primera región en contar con zonas donde el clima difiere.'),(5,'Sinnoh','La región de Sinnoh presenta una cantidad de climas muy variados.'),(6,'Teselia','Teselia es la primera región basada en penínsulas.'),(7,'Kalos','Kalos posee una apariencia semejante a un hexágono y que recuerda a Francia.'),(8,'Alola','Es un archipiélago que se divide en cuatro islas principales.'),(9,'Galar','Presenta paisajes muy diversos, con zonas rurales, modernas ciudades y bosques frondosos.'),(10,'Paldea','Es una extensa región repleta de lagos, altas cumbres, terrenos baldíos y cadenas montañosas escarpadas.'),(11,'Kanto','Kanto es una de las regiones con menos cuevas y montañas, entre ellas destaca la Cueva Diglett.'),(12,'Archi7','Este archipiélago se encuentra cerca de Kanto y está formado por nueve islas.'),(13,'Johto','Es una región casi llana con una meseta al este y un sistema montañoso '),(14,'Hoenn','Formada por un complejo de islas, es la primera región en contar con zonas donde el clima difiere.'),(15,'Sinnoh','La región de Sinnoh presenta una cantidad de climas muy variados.'),(16,'Teselia','Teselia es la primera región basada en penínsulas.'),(17,'Kalos','Kalos posee una apariencia semejante a un hexágono y que recuerda a Francia.'),(18,'Alola','Es un archipiélago que se divide en cuatro islas principales.'),(19,'Galar','Presenta paisajes muy diversos, con zonas rurales, modernas ciudades y bosques frondosos.'),(20,'Paldea','Es una extensa región repleta de lagos, altas cumbres, terrenos baldíos y cadenas montañosas escarpadas.');
/*!40000 ALTER TABLE `regiones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `tipo_pokemon`
--

LOCK TABLES `tipo_pokemon` WRITE;
/*!40000 ALTER TABLE `tipo_pokemon` DISABLE KEYS */;
INSERT INTO `tipo_pokemon` VALUES (1,'Acero','Tierra - fuego - lucha','Hielo - roca - hada','Veneno'),(2,'Agua','Planta - eléctrico','Roca - tierra - fuego','Nada'),(3,'Bicho','Volador - roca - fuego','Planta - psíquico - siniestro','Nada'),(4,'Dragon','Hielo - hada - dragon','Dragon','Nada'),(5,'Electrico','Tierra','Volador - agua','Nada'),(6,'Fantasma','Fantasma - siniestro','Psiquico - fantasma','Lucha - normal'),(7,'Fuego','Agua - roca - tierra','Hielo - planta - bicho - acero','Nada'),(8,'Hada','Veneno - acero','Lucha - dragon - siniestro','Dragon'),(9,'Hielo','Roca - fuego - lucha - acero','Volador - planta - tierra - dragón','Nada'),(10,'Lucha','Volador - hada- psíquico','Hielo - normal - roca - siniestro - acero','Nada'),(11,'Normal','Lucha','Ninguno','Fantasma'),(12,'Planta','Hielo - volador - bicho - veneno','Agua - roca - tierra','Nada'),(13,'Psiquico','Bicho - fantasma - siniestro','Lucha - veneno','Nada'),(14,'Roca','Agua - bicho - tierra - lucha - acero','Hielo - volador - bicho - fuego','Nada'),(15,'Siniestro','Fantasma - siniestro','Psiquico - fantasma','Psiquico'),(16,'Tierra','Hielo - agua - planta','Eléctrico - roca - fuego - veneno - acero','Eléctrico'),(17,'Volador','Hielo - eléctrico - roca','Planta - bicho - lucha','Tierra'),(18,'Veneno','Tierra - psiquico','Planta - hada','Nada');
/*!40000 ALTER TABLE `tipo_pokemon` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-12-05 15:52:52

CREATE DATABASE  IF NOT EXISTS `mecanica` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci */;
USE `mecanica`;
-- MariaDB dump 10.19  Distrib 10.4.27-MariaDB, for Win64 (AMD64)
--
-- Host: 127.0.0.1    Database: mecanica
-- ------------------------------------------------------
-- Server version	10.4.27-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `agendamento`
--

DROP TABLE IF EXISTS `agendamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `agendamento` (
  `orcamento_id` int(11) NOT NULL,
  `data_inicio` varchar(45) NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`),
  KEY `fk_agendamento_orcamento1_idx` (`orcamento_id`),
  CONSTRAINT `fk_agendamento_orcamento1` FOREIGN KEY (`orcamento_id`) REFERENCES `orcamento` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `agendamento`
--

LOCK TABLES `agendamento` WRITE;
/*!40000 ALTER TABLE `agendamento` DISABLE KEYS */;
INSERT INTO `agendamento` VALUES (1,'28/10/2023',1),(2,'29/10/2023',2),(3,'30/10/2023',3),(4,'31/10/2023',4),(5,'01/11/2023',5);
/*!40000 ALTER TABLE `agendamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cliente` (
  `idcliente` int(11) NOT NULL AUTO_INCREMENT,
  `endereco` varchar(45) NOT NULL,
  `contato` varchar(45) NOT NULL,
  PRIMARY KEY (`idcliente`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES (1,'jaboticaba','55996944509'),(2,'fw','123456789'),(3,'Boa Vista','1234566543'),(4,'Erechim','2021234456'),(5,'Seberi','gustavomstefanello72@gmail.com'),(6,'Sagrada Familia','40028922'),(7,'Lajeado','123'),(8,'Porto Alegre','40028922'),(9,'Irai','123456'),(10,'fw','43219876');
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `compra_peca`
--

DROP TABLE IF EXISTS `compra_peca`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `compra_peca` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `peca_id` int(11) NOT NULL,
  `data` varchar(45) NOT NULL,
  `mecanico_id` int(11) NOT NULL,
  `fornecedor_id` int(11) NOT NULL,
  `ordem_servico_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_compra_peca_peca1_idx` (`peca_id`),
  KEY `fk_compra_peca_mecanico1_idx` (`mecanico_id`),
  KEY `fk_compra_peca_fornecedor1_idx` (`fornecedor_id`),
  KEY `fk_compra_peca_ordem_servico1_idx` (`ordem_servico_id`),
  CONSTRAINT `fk_compra_peca_fornecedor1` FOREIGN KEY (`fornecedor_id`) REFERENCES `fornecedor` (`id`),
  CONSTRAINT `fk_compra_peca_mecanico1` FOREIGN KEY (`mecanico_id`) REFERENCES `mecanico` (`id`),
  CONSTRAINT `fk_compra_peca_ordem_servico1` FOREIGN KEY (`ordem_servico_id`) REFERENCES `ordem_servico` (`id`),
  CONSTRAINT `fk_compra_peca_peca1` FOREIGN KEY (`peca_id`) REFERENCES `peca` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `compra_peca`
--

LOCK TABLES `compra_peca` WRITE;
/*!40000 ALTER TABLE `compra_peca` DISABLE KEYS */;
INSERT INTO `compra_peca` VALUES (1,1,'10/10/2023',1,1,1),(2,2,'10/10/2023',2,2,2),(3,3,'10/10/2023',3,3,3),(4,4,'10/10/2023',4,4,4),(5,5,'10/10/2023',5,5,5);
/*!40000 ALTER TABLE `compra_peca` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `desconto`
--

DROP TABLE IF EXISTS `desconto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `desconto` (
  `desconto` float NOT NULL CHECK (`desconto` <= 0.20),
  `count` int(11) NOT NULL,
  `cliente_idcliente` int(11) NOT NULL,
  PRIMARY KEY (`cliente_idcliente`),
  CONSTRAINT `fk_desconto_cliente1` FOREIGN KEY (`cliente_idcliente`) REFERENCES `cliente` (`idcliente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `desconto`
--

LOCK TABLES `desconto` WRITE;
/*!40000 ALTER TABLE `desconto` DISABLE KEYS */;
INSERT INTO `desconto` VALUES (0.01,1,1),(0.01,1,2),(0.01,1,3),(0.02,2,6),(0.01,1,7);
/*!40000 ALTER TABLE `desconto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fornecedor`
--

DROP TABLE IF EXISTS `fornecedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fornecedor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) NOT NULL,
  `empresa` varchar(45) NOT NULL,
  `CNPJ` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fornecedor`
--

LOCK TABLES `fornecedor` WRITE;
/*!40000 ALTER TABLE `fornecedor` DISABLE KEYS */;
INSERT INTO `fornecedor` VALUES (1,'Joao','Volvo','37183127'),(2,'Paulo','Jaca','5839853'),(3,'Maria','Intel','538953'),(4,'Luisa','Nakata','5349538'),(5,'Alice','Cibie','48234923');
/*!40000 ALTER TABLE `fornecedor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mecanico`
--

DROP TABLE IF EXISTS `mecanico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mecanico` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) NOT NULL,
  `especializacao` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mecanico`
--

LOCK TABLES `mecanico` WRITE;
/*!40000 ALTER TABLE `mecanico` DISABLE KEYS */;
INSERT INTO `mecanico` VALUES (1,'Marcio','Moto'),(2,'Tião','Carro'),(3,'José','Eletrica'),(4,'Alexandre','Injecao'),(5,'Lindomar','Funilaria');
/*!40000 ALTER TABLE `mecanico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orcamento`
--

DROP TABLE IF EXISTS `orcamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orcamento` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `valor_mao_obra` varchar(45) NOT NULL,
  `valor_peca` varchar(45) NOT NULL,
  `cliente_idcliente` int(11) NOT NULL,
  `mecanico_id` int(11) NOT NULL,
  `tempo_previsto` varchar(45) DEFAULT NULL,
  `veículo_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_orcamento_cliente1_idx` (`cliente_idcliente`),
  KEY `fk_orcamento_mecanico1_idx` (`mecanico_id`),
  KEY `fk_orcamento_veículo1_idx` (`veículo_id`),
  CONSTRAINT `fk_orcamento_cliente1` FOREIGN KEY (`cliente_idcliente`) REFERENCES `cliente` (`idcliente`),
  CONSTRAINT `fk_orcamento_mecanico1` FOREIGN KEY (`mecanico_id`) REFERENCES `mecanico` (`id`),
  CONSTRAINT `fk_orcamento_veículo1` FOREIGN KEY (`veículo_id`) REFERENCES `veículo` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orcamento`
--

LOCK TABLES `orcamento` WRITE;
/*!40000 ALTER TABLE `orcamento` DISABLE KEYS */;
INSERT INTO `orcamento` VALUES (1,'400','340',1,1,'5',1),(2,'1000','450',2,2,'4',2),(3,'2000','220',3,3,'30',3),(4,'3000','0',6,4,'20',4),(5,'4000','0',7,5,'40',5);
/*!40000 ALTER TABLE `orcamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ordem_servico`
--

DROP TABLE IF EXISTS `ordem_servico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ordem_servico` (
  `veículo_id` int(11) NOT NULL,
  `cliente_idcliente` int(11) NOT NULL,
  `entrada` varchar(45) NOT NULL,
  `saida` varchar(45) DEFAULT NULL,
  `mecanico_id` int(11) NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `orcamento_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_Processo_veículo_idx` (`veículo_id`),
  KEY `fk_Processo_cliente1_idx` (`cliente_idcliente`),
  KEY `fk_Processo_mecanico1_idx` (`mecanico_id`),
  KEY `fk_ordem_servico_orcamento1_idx` (`orcamento_id`),
  CONSTRAINT `fk_Processo_cliente1` FOREIGN KEY (`cliente_idcliente`) REFERENCES `cliente` (`idcliente`),
  CONSTRAINT `fk_Processo_mecanico1` FOREIGN KEY (`mecanico_id`) REFERENCES `mecanico` (`id`),
  CONSTRAINT `fk_Processo_veículo` FOREIGN KEY (`veículo_id`) REFERENCES `veículo` (`id`),
  CONSTRAINT `fk_ordem_servico_orcamento1` FOREIGN KEY (`orcamento_id`) REFERENCES `orcamento` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ordem_servico`
--

LOCK TABLES `ordem_servico` WRITE;
/*!40000 ALTER TABLE `ordem_servico` DISABLE KEYS */;
INSERT INTO `ordem_servico` VALUES (1,1,'28/10/2023','28/10/2023',1,1,1),(2,2,'29/10/2023','29/10/2023',2,2,2),(3,3,'30/10/2023','30/10/2023',3,3,3),(4,6,'31/10/2023','31/10/2023',1,4,4),(5,7,'01/10/2023','01/10/2023',1,5,5),(4,6,'01/10/2023','01/10/2023',1,6,5);
/*!40000 ALTER TABLE `ordem_servico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pagamento`
--

DROP TABLE IF EXISTS `pagamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pagamento` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `desconto` varchar(45) DEFAULT NULL,
  `froma` varchar(45) DEFAULT NULL,
  `valor` varchar(45) NOT NULL,
  `cliente_idcliente` int(11) NOT NULL,
  `ordem_servico_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_pagamento_cliente1_idx` (`cliente_idcliente`),
  KEY `fk_pagamento_ordem_servico1_idx` (`ordem_servico_id`),
  CONSTRAINT `fk_pagamento_cliente1` FOREIGN KEY (`cliente_idcliente`) REFERENCES `cliente` (`idcliente`),
  CONSTRAINT `fk_pagamento_ordem_servico1` FOREIGN KEY (`ordem_servico_id`) REFERENCES `ordem_servico` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pagamento`
--

LOCK TABLES `pagamento` WRITE;
/*!40000 ALTER TABLE `pagamento` DISABLE KEYS */;
INSERT INTO `pagamento` VALUES (1,'20','prazo','400',1,1),(2,'5','prazo','1000',2,2),(3,'0','prazo','2000',3,3),(4,'0','prazo','3000',6,4),(5,'0','prazo','4000',7,5);
/*!40000 ALTER TABLE `pagamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `peca`
--

DROP TABLE IF EXISTS `peca`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `peca` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `codigo` varchar(45) NOT NULL,
  `marca` varchar(45) NOT NULL,
  `aplicacao` varchar(45) NOT NULL,
  `valor` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `peca`
--

LOCK TABLES `peca` WRITE;
/*!40000 ALTER TABLE `peca` DISABLE KEYS */;
INSERT INTO `peca` VALUES (1,'12314','Cibie','Farolete','240'),(2,'2131','Nakata','Suspensao','700'),(3,'54346','Fueltech','Injeção Eletronica Programavel','2000'),(4,'378138','Cibie','Farol','400'),(5,'3123','C','escapamento','1000');
/*!40000 ALTER TABLE `peca` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pessoa_fisica`
--

DROP TABLE IF EXISTS `pessoa_fisica`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pessoa_fisica` (
  `CPF` int(11) NOT NULL,
  `nome` varchar(45) NOT NULL,
  `cliente_idcliente` int(11) NOT NULL,
  PRIMARY KEY (`cliente_idcliente`),
  CONSTRAINT `fk_pessoa_fisica_cliente1` FOREIGN KEY (`cliente_idcliente`) REFERENCES `cliente` (`idcliente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pessoa_fisica`
--

LOCK TABLES `pessoa_fisica` WRITE;
/*!40000 ALTER TABLE `pessoa_fisica` DISABLE KEYS */;
INSERT INTO `pessoa_fisica` VALUES (3245213,'Gustavo',1),(312367,'Pedro',2),(3141564,'Matheus',3),(978583573,'Vitor',4),(12318718,'Maria',5);
/*!40000 ALTER TABLE `pessoa_fisica` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pessoajuridica`
--

DROP TABLE IF EXISTS `pessoajuridica`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pessoajuridica` (
  `CNPJ` int(11) NOT NULL,
  `nomefantasia` varchar(45) NOT NULL,
  `cliente_idcliente` int(11) NOT NULL,
  PRIMARY KEY (`cliente_idcliente`),
  CONSTRAINT `fk_pessoajuridica_cliente1` FOREIGN KEY (`cliente_idcliente`) REFERENCES `cliente` (`idcliente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pessoajuridica`
--

LOCK TABLES `pessoajuridica` WRITE;
/*!40000 ALTER TABLE `pessoajuridica` DISABLE KEYS */;
INSERT INTO `pessoajuridica` VALUES (2147483647,'Prefeitura',6),(34226643,'Microsoft',7),(846782472,'Prefeitura',8),(36173167,'Intel',9),(97859,'Volvo',10);
/*!40000 ALTER TABLE `pessoajuridica` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prestacao`
--

DROP TABLE IF EXISTS `prestacao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `prestacao` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `valor` float NOT NULL,
  `vencimento` varchar(45) NOT NULL,
  `parcela` varchar(45) NOT NULL,
  `pagamento_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_prestacao_pagamento1_idx` (`pagamento_id`),
  CONSTRAINT `fk_prestacao_pagamento1` FOREIGN KEY (`pagamento_id`) REFERENCES `pagamento` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prestacao`
--

LOCK TABLES `prestacao` WRITE;
/*!40000 ALTER TABLE `prestacao` DISABLE KEYS */;
INSERT INTO `prestacao` VALUES (1,40,'10/10/2023','1',1),(2,100,'10/10/2023','1',2),(3,200,'10/10/2023','1',3),(4,300,'10/10/2023','1',4),(5,400,'10/10/2023','1',5);
/*!40000 ALTER TABLE `prestacao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `servico`
--

DROP TABLE IF EXISTS `servico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `servico` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mecanico_id` int(11) NOT NULL,
  `peca_id` int(11) NOT NULL,
  `data_ini` varchar(45) NOT NULL,
  `data_fim` varchar(45) DEFAULT NULL,
  `ordem_servico_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_servico_mecanico1_idx` (`mecanico_id`),
  KEY `fk_servico_peca1_idx` (`peca_id`),
  KEY `fk_servico_ordem_servico1_idx` (`ordem_servico_id`),
  CONSTRAINT `fk_servico_mecanico1` FOREIGN KEY (`mecanico_id`) REFERENCES `mecanico` (`id`),
  CONSTRAINT `fk_servico_ordem_servico1` FOREIGN KEY (`ordem_servico_id`) REFERENCES `ordem_servico` (`id`),
  CONSTRAINT `fk_servico_peca1` FOREIGN KEY (`peca_id`) REFERENCES `peca` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `servico`
--

LOCK TABLES `servico` WRITE;
/*!40000 ALTER TABLE `servico` DISABLE KEYS */;
INSERT INTO `servico` VALUES (6,1,1,'10/10/2023','10/10/2023',1),(7,2,2,'10/10/2023','10/10/2023',2),(8,3,3,'10/10/2023','10/10/2023',3),(9,4,4,'10/10/2023','10/10/2023',4),(10,5,5,'10/10/2023','10/10/2023',5);
/*!40000 ALTER TABLE `servico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `veículo`
--

DROP TABLE IF EXISTS `veículo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `veículo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `marca` varchar(45) NOT NULL,
  `modelo` varchar(45) NOT NULL,
  `ano` varchar(45) NOT NULL,
  `placa` varchar(45) NOT NULL,
  `cliente_idcliente` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_veículo_cliente1_idx` (`cliente_idcliente`),
  CONSTRAINT `fk_veículo_cliente1` FOREIGN KEY (`cliente_idcliente`) REFERENCES `cliente` (`idcliente`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `veículo`
--

LOCK TABLES `veículo` WRITE;
/*!40000 ALTER TABLE `veículo` DISABLE KEYS */;
INSERT INTO `veículo` VALUES (1,'Volvo','C14','1982','IDK123',1),(2,'Ford','Focus','2008','ABC123',2),(3,'Ford','Maverick','1978','QWE456',3),(4,'Ford','Ka','2004','XYZ876',6),(5,'Chevrolet','Chevette','1889','XRL832',7);
/*!40000 ALTER TABLE `veículo` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-12-08 12:44:53

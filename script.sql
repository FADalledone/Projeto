/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 80029
 Source Host           : localhost:3306
 Source Schema         : prfabio

 Target Server Type    : MySQL
 Target Server Version : 80029
 File Encoding         : 65001

 Date: 17/07/2023 14:03:28
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for abilitazioni_programmi
-- ----------------------------
DROP TABLE IF EXISTS `abilitazioni_programmi`;
CREATE TABLE `abilitazioni_programmi` (
  `abpAddetto` int unsigned NOT NULL,
  `abpProgramma` varchar(50) NOT NULL DEFAULT '',
  `abpLivello` int unsigned NOT NULL DEFAULT '0',
  `abpSpeciale` varchar(30) DEFAULT NULL,
  `DTID` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`abpAddetto`,`abpProgramma`),
  CONSTRAINT `abilitazioni_programmi_ibfk_1` FOREIGN KEY (`abpAddetto`) REFERENCES `addetti` (`addID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ;

-- ----------------------------
-- Records of abilitazioni_programmi
-- ----------------------------
BEGIN;
INSERT INTO `abilitazioni_programmi` VALUES (1, 'av_adesione', 0, NULL, '2023-07-10 09:23:46');
INSERT INTO `abilitazioni_programmi` VALUES (1, 'av_adesione_ricerca', 0, NULL, '2023-07-10 09:23:57');
INSERT INTO `abilitazioni_programmi` VALUES (1, 'av_prodotti', 0, NULL, '2023-07-10 09:30:24');
INSERT INTO `abilitazioni_programmi` VALUES (1, 'av_prodotti_ricerca', 0, NULL, '2023-07-10 09:30:35');
COMMIT;

-- ----------------------------
-- Table structure for addetti
-- ----------------------------
DROP TABLE IF EXISTS `addetti`;
CREATE TABLE `addetti` (
  `addID` int unsigned NOT NULL AUTO_INCREMENT,
  `addNominativo` varchar(30) NOT NULL,
  `addLogin` varchar(20) NOT NULL,
  `addPassword` varchar(200) NOT NULL DEFAULT '',
  `addPasswordWeb` varchar(200) DEFAULT NULL,
  `addEMail` varchar(40) DEFAULT NULL,
  `DTID` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `addLoginWindows` varchar(25) DEFAULT NULL,
  `addEntMLunDa` datetime DEFAULT NULL,
  `addEntMLunA` datetime DEFAULT NULL,
  `addUscMLunDa` datetime DEFAULT NULL,
  `addUscMLunA` datetime DEFAULT NULL,
  `addEntPLunDa` datetime DEFAULT NULL,
  `addEntPLunA` datetime DEFAULT NULL,
  `addUscPLunDa` datetime DEFAULT NULL,
  `addUscPLunA` datetime DEFAULT NULL,
  `addNOreLun` decimal(5,2) unsigned DEFAULT NULL,
  `addEntMMarDa` datetime DEFAULT NULL,
  `addEntMMarA` datetime DEFAULT NULL,
  `addUscMMarDa` datetime DEFAULT NULL,
  `addUscMMarA` datetime DEFAULT NULL,
  `addEntPMarDa` datetime DEFAULT NULL,
  `addEntPMarA` datetime DEFAULT NULL,
  `addUscPMarDa` datetime DEFAULT NULL,
  `addUscPMarA` datetime DEFAULT NULL,
  `addNOreMar` decimal(5,2) unsigned DEFAULT NULL,
  `addEntMMerDa` datetime DEFAULT NULL,
  `addEntMMerA` datetime DEFAULT NULL,
  `addUscMMerDa` datetime DEFAULT NULL,
  `addUscMMerA` datetime DEFAULT NULL,
  `addEntPMerDa` datetime DEFAULT NULL,
  `addEntPMerA` datetime DEFAULT NULL,
  `addUscPMerDa` datetime DEFAULT NULL,
  `addUscPMerA` datetime DEFAULT NULL,
  `addNOreMer` decimal(5,2) unsigned DEFAULT NULL,
  `addEntMGioDa` datetime DEFAULT NULL,
  `addEntMGioA` datetime DEFAULT NULL,
  `addUscMGioDa` datetime DEFAULT NULL,
  `addUscMGioA` datetime DEFAULT NULL,
  `addEntPGioDa` datetime DEFAULT NULL,
  `addEntPGioA` datetime DEFAULT NULL,
  `addUscPGioDa` datetime DEFAULT NULL,
  `addUscPGioA` datetime DEFAULT NULL,
  `addNOreGio` decimal(5,2) unsigned DEFAULT NULL,
  `addEntMVenDa` datetime DEFAULT NULL,
  `addEntMVenA` datetime DEFAULT NULL,
  `addUscMVenDa` datetime DEFAULT NULL,
  `addUscMVenA` datetime DEFAULT NULL,
  `addEntPVenDa` datetime DEFAULT NULL,
  `addEntPVenA` datetime DEFAULT NULL,
  `addUscPVenDa` datetime DEFAULT NULL,
  `addUscPVenA` datetime DEFAULT NULL,
  `addNOreVen` decimal(5,2) unsigned DEFAULT NULL,
  `addEntMSabDa` datetime DEFAULT NULL,
  `addEntMSabA` datetime DEFAULT NULL,
  `addUscMSabDa` datetime DEFAULT NULL,
  `addUscMSabA` datetime DEFAULT NULL,
  `addEntPSabDa` datetime DEFAULT NULL,
  `addEntPSabA` datetime DEFAULT NULL,
  `addUscPSabDa` datetime DEFAULT NULL,
  `addUscPSabA` datetime DEFAULT NULL,
  `addNOreSab` decimal(5,2) unsigned DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`addID`),
  UNIQUE KEY `addNominativo` (`addNominativo`),
  UNIQUE KEY `addLogin` (`addLogin`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8mb4 ;

-- ----------------------------
-- Records of addetti
-- ----------------------------
BEGIN;
INSERT INTO `addetti` VALUES (1, 'Teste', 'test', '', '$2a$12$JEgUUQphxpeg8yATu2b33eFG/Ytr3G6V1ApWCEGEuj6zckNrAlLyK', NULL, '2023-07-14 15:11:12', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for adesione
-- ----------------------------
DROP TABLE IF EXISTS `adesione`;
CREATE TABLE `adesione` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `adezCodice` int NOT NULL,
  `numPolizza` int DEFAULT NULL,
  `anagraficaId` int unsigned NOT NULL,
  `aziendaId` bigint DEFAULT NULL,
  `convenzioneId` bigint DEFAULT NULL,
  `prodottoId` bigint DEFAULT NULL,
  `adezVerzioneGaranzie` double(10,2) DEFAULT NULL,
  `scadenzaId` bigint DEFAULT NULL,
  `adezEstFamiliari` enum('1','2') CHARACTER SET utf8mb4  DEFAULT NULL COMMENT '1-Sì, 2-NO',
  `adezInGroppo` enum('1','2') CHARACTER SET utf8mb4  DEFAULT NULL COMMENT '1-Sì, 2-NO',
  `adezData` date DEFAULT NULL,
  `adezDataInizio` date DEFAULT NULL,
  `adezDataScadenza` date DEFAULT NULL,
  `adezRinnovoAuto` enum('1','2') CHARACTER SET utf8mb4  DEFAULT '1' COMMENT '1-Sì, 2-NO',
  `adezRinnovoAnno` char(2) CHARACTER SET utf8mb4  DEFAULT '12',
  `tipologieAbbonamentoId` int DEFAULT NULL,
  `modalitaPagamentoId` int DEFAULT NULL,
  `adezAttivo` int NOT NULL DEFAULT '0' COMMENT '5-Revocato, 4-Annullato, 3-Richiesta, 2-In atesa, 1-Attivo, 0-non attivo',
  `dataStato` timestamp NULL DEFAULT NULL,
  `adezSospeso` enum('1','0') CHARACTER SET utf8mb4  DEFAULT '0' COMMENT '1-Sì, 0-NO',
  `provenienzaId` int DEFAULT NULL,
  `utente_create` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `adesione_adezcodice_index` (`adezCodice`),
  KEY `fk_adesione_anagrafica` (`anagraficaId`),
  KEY `adesione_numpolizza_index` (`numPolizza`),
  CONSTRAINT `adesione_ibfk_1` FOREIGN KEY (`anagraficaId`) REFERENCES `anagrafica` (`anaID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 ;

-- ----------------------------
-- Records of adesione
-- ----------------------------
BEGIN;
INSERT INTO `adesione` VALUES (3, 1689342454, NULL, 4, NULL, 1, 8, 1.00, 1, '2', '1', '2023-07-14', '2023-08-01', '2023-12-31', '1', '1', 1, 2, 2, '2023-07-14 00:00:00', '0', 2, 151, '2023-07-14 15:47:34', '2023-07-14 16:46:56', NULL);
INSERT INTO `adesione` VALUES (4, 1689346935, NULL, 5, NULL, 1, 9, 1.00, 1, '2', '1', '2023-07-14', '2023-08-01', '2023-12-31', '1', '1', 1, 2, 2, '2023-07-14 00:00:00', '0', 2, 152, '2023-07-14 17:02:15', '2023-07-14 17:04:29', NULL);
INSERT INTO `adesione` VALUES (5, 1689347599, NULL, 6, NULL, 1, 10, 1.00, 1, '1', '1', '2023-07-14', '2023-08-01', '2023-12-31', '1', '1', 1, 2, 2, '2023-07-14 00:00:00', '0', 2, 153, '2023-07-14 17:13:19', '2023-07-14 17:16:17', NULL);
INSERT INTO `adesione` VALUES (6, 1689348184, NULL, 7, NULL, 1, 12, 1.00, 1, '2', '1', '2023-07-14', '2023-08-01', '2023-12-31', '1', '1', 1, 2, 2, '2023-07-14 00:00:00', '0', 2, 154, '2023-07-14 17:23:04', '2023-07-14 17:25:39', NULL);
COMMIT;

-- ----------------------------
-- Table structure for adesione_modulo_file
-- ----------------------------
DROP TABLE IF EXISTS `adesione_modulo_file`;
CREATE TABLE `adesione_modulo_file` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `adesioneId` bigint unsigned NOT NULL,
  `modulo` varchar(100) CHARACTER SET utf8mb4  NOT NULL,
  `fileName` varchar(100) CHARACTER SET utf8mb4  DEFAULT NULL,
  `dataScadenza` date DEFAULT NULL,
  `data_caricamento_file` datetime DEFAULT NULL,
  `utente_caricamento_file` int DEFAULT NULL,
  `valido` int NOT NULL DEFAULT '2',
  `non_applicabile` bit(1) NOT NULL DEFAULT b'0' COMMENT 'caricamento non obbligatorio',
  `data_valido_file` datetime DEFAULT NULL,
  `motivazioniRespingimento` varchar(400) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `adesione_per_modulo` (`adesioneId`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 ;

-- ----------------------------
-- Records of adesione_modulo_file
-- ----------------------------
BEGIN;
INSERT INTO `adesione_modulo_file` VALUES (5, 3, 'domanda_adesione', '64b15f6c0d8cc.pdf', NULL, '2023-07-14 16:45:00', NULL, 2, b'0', NULL, NULL, '2023-07-14 16:45:00', '2023-07-14 16:45:00');
INSERT INTO `adesione_modulo_file` VALUES (6, 3, 'autorizzazione_sepa_mandato', 'mandatodiaddebitodirettosepacore.pdf', NULL, '2023-07-14 16:46:18', NULL, 2, b'0', NULL, NULL, '2023-07-14 16:46:18', '2023-07-14 16:46:18');
INSERT INTO `adesione_modulo_file` VALUES (7, 4, 'domanda_adesione', '64b163dd4f1e5.pdf', NULL, '2023-07-14 17:03:57', NULL, 2, b'0', NULL, NULL, '2023-07-14 17:03:57', '2023-07-14 17:03:57');
INSERT INTO `adesione_modulo_file` VALUES (8, 4, 'autorizzazione_sepa_mandato', 'mandatodiaddebitodirettosepacore.pdf', NULL, '2023-07-14 17:04:06', NULL, 2, b'0', NULL, NULL, '2023-07-14 17:04:06', '2023-07-14 17:04:06');
INSERT INTO `adesione_modulo_file` VALUES (9, 5, 'domanda_adesione', '64b1668b6d902.pdf', NULL, '2023-07-14 17:15:23', NULL, 2, b'0', NULL, NULL, '2023-07-14 17:15:23', '2023-07-14 17:15:23');
INSERT INTO `adesione_modulo_file` VALUES (10, 5, 'autorizzazione_sepa_mandato', 'mandatodiaddebitodirettosepacore.pdf', NULL, '2023-07-14 17:15:27', NULL, 2, b'0', NULL, NULL, '2023-07-14 17:15:27', '2023-07-14 17:15:27');
INSERT INTO `adesione_modulo_file` VALUES (11, 5, 'carta_identita_TSTFMA80A01L378D_all', '64b166aa09ceb.pdf', '2030-02-23', '2023-07-14 17:15:54', NULL, 2, b'0', NULL, NULL, '2023-07-14 17:15:54', '2023-07-14 17:15:54');
INSERT INTO `adesione_modulo_file` VALUES (12, 5, 'tessera_sanitaria_TSTFMA80A01L378D_all', '64b166b168aaa.pdf', '2030-02-23', '2023-07-14 17:16:01', NULL, 2, b'0', NULL, NULL, '2023-07-14 17:16:01', '2023-07-14 17:16:01');
INSERT INTO `adesione_modulo_file` VALUES (13, 5, 'carta_identita_TSTFMF00A01L378Q_all', '64b166b9136e5.pdf', '2030-02-23', '2023-07-14 17:16:09', NULL, 2, b'0', NULL, NULL, '2023-07-14 17:16:09', '2023-07-14 17:16:09');
INSERT INTO `adesione_modulo_file` VALUES (14, 5, 'tessera_sanitaria_TSTFMF00A01L378Q_all', '64b166c0b2369.pdf', '2030-02-23', '2023-07-14 17:16:16', NULL, 2, b'0', NULL, NULL, '2023-07-14 17:16:16', '2023-07-14 17:16:16');
INSERT INTO `adesione_modulo_file` VALUES (15, 6, 'domanda_adesione', '64b168d975fb2.pdf', NULL, '2023-07-14 17:25:13', NULL, 2, b'0', NULL, NULL, '2023-07-14 17:25:13', '2023-07-14 17:25:13');
INSERT INTO `adesione_modulo_file` VALUES (16, 6, 'autorizzazione_sepa_mandato', 'mandatodiaddebitodirettosepacore.pdf', NULL, '2023-07-14 17:25:17', NULL, 2, b'0', NULL, NULL, '2023-07-14 17:25:17', '2023-07-14 17:25:17');
COMMIT;

-- ----------------------------
-- Table structure for adesione_nucleo_familiare
-- ----------------------------
DROP TABLE IF EXISTS `adesione_nucleo_familiare`;
CREATE TABLE `adesione_nucleo_familiare` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `adesioneId` bigint unsigned DEFAULT NULL,
  `ncfCognome` varchar(255) CHARACTER SET utf8mb4  DEFAULT NULL,
  `ncfNome` varchar(255) CHARACTER SET utf8mb4  DEFAULT NULL,
  `ncfCodiceFiscale` varchar(255) CHARACTER SET utf8mb4  DEFAULT NULL,
  `relazioneParentelaId` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `adesione_familiare` (`adesioneId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 ;

-- ----------------------------
-- Records of adesione_nucleo_familiare
-- ----------------------------
BEGIN;
INSERT INTO `adesione_nucleo_familiare` VALUES (1, 5, 'TESTE', 'FAM1', 'TSTFMA80A01L378D', 1, '2023-07-14 17:13:19', '2023-07-14 17:13:19', NULL);
INSERT INTO `adesione_nucleo_familiare` VALUES (2, 5, 'TESTE', 'FMA2F', 'TSTFMF00A01L378Q', 5, '2023-07-14 17:13:19', '2023-07-14 17:13:19', NULL);
COMMIT;

-- ----------------------------
-- Table structure for adesione_prodotti
-- ----------------------------
DROP TABLE IF EXISTS `adesione_prodotti`;
CREATE TABLE `adesione_prodotti` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `adesioneId` bigint unsigned DEFAULT NULL,
  `prodottoId` bigint DEFAULT NULL,
  `prodottoPrezzoId` bigint DEFAULT NULL,
  `adezpDataInizioValidita` date DEFAULT NULL,
  `adezpDataFinoValidita` date DEFAULT NULL,
  `adezpDataInizioEfetivaValidita` date DEFAULT NULL,
  `adezpAnno` char(4) CHARACTER SET utf8mb4  DEFAULT NULL,
  `adezpPrezzo` double(10,2) DEFAULT NULL,
  `adezpMesi` int DEFAULT NULL,
  `adezpImportoIscritto` double(10,2) DEFAULT NULL,
  `adezpImportoAzienda` double(10,2) DEFAULT NULL,
  `adezpImportoIscrittoTot` double(10,2) DEFAULT NULL,
  `adezpImportoAziendaTot` double(10,2) DEFAULT NULL,
  `adezpImportoTotale` double(10,2) DEFAULT NULL,
  `adezpAttivo` enum('3','2','1','0') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0' COMMENT '3-Richiesta, 2-In atesa, 1-Attivo, 0-non attivo',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `adesione_per_prodotti` (`adesioneId`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 ;

-- ----------------------------
-- Records of adesione_prodotti
-- ----------------------------
BEGIN;
INSERT INTO `adesione_prodotti` VALUES (5, 3, 8, 14, '2023-08-01', '2023-12-31', '2023-08-01', '2023', 20.00, 5, 20.00, NULL, 100.00, NULL, 100.00, '2', '2023-07-14 15:47:34', '2023-07-14 15:47:34', NULL);
INSERT INTO `adesione_prodotti` VALUES (6, 4, 9, 16, '2023-08-01', '2023-12-31', '2023-08-01', '2023', 22.00, 5, 22.00, NULL, 110.00, NULL, 110.00, '2', '2023-07-14 17:02:15', '2023-07-14 17:02:15', NULL);
INSERT INTO `adesione_prodotti` VALUES (7, 5, 10, 17, '2023-08-01', '2023-12-31', '2023-08-01', '2023', 42.00, 5, 42.00, NULL, 210.00, NULL, 210.00, '2', '2023-07-14 17:13:19', '2023-07-14 17:13:19', NULL);
INSERT INTO `adesione_prodotti` VALUES (8, 6, 12, 19, '2023-08-01', '2023-12-31', '2023-08-01', '2023', 20.00, 5, 20.00, NULL, 100.00, NULL, 100.00, '2', '2023-07-14 17:23:04', '2023-07-14 17:23:04', NULL);
COMMIT;

-- ----------------------------
-- Table structure for adesione_provenienza
-- ----------------------------
DROP TABLE IF EXISTS `adesione_provenienza`;
CREATE TABLE `adesione_provenienza` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `provenienza` varchar(50) CHARACTER SET utf8mb4  NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ;

-- ----------------------------
-- Records of adesione_provenienza
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for adesione_quote
-- ----------------------------
DROP TABLE IF EXISTS `adesione_quote`;
CREATE TABLE `adesione_quote` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `adesioneId` bigint unsigned DEFAULT NULL,
  `adezQuoteCodice` char(15) CHARACTER SET utf8mb4  DEFAULT NULL,
  `adesioneProdottoId` bigint DEFAULT NULL,
  `aziendaId` bigint DEFAULT NULL,
  `anagraficaId` int DEFAULT NULL,
  `adsqImporto` double(10,2) DEFAULT NULL,
  `adsqDataScadenza` date DEFAULT NULL,
  `adsqAnno` char(4) CHARACTER SET utf8mb4  DEFAULT NULL,
  `adsqMonth` char(2) CHARACTER SET utf8mb4  DEFAULT NULL,
  `adsqDataIncasso` date DEFAULT NULL,
  `modalitaIncassoId` int DEFAULT NULL,
  `codiceIdentificazione` varchar(255) CHARACTER SET utf8mb4  DEFAULT NULL,
  `dataCodiceIdentificazione` datetime DEFAULT NULL,
  `codiceTransazione` varchar(255) CHARACTER SET utf8mb4  DEFAULT NULL,
  `fileRiconciliazioneCbi` bigint DEFAULT NULL,
  `adsqStato` int NOT NULL DEFAULT '1' COMMENT '1-creato, 2-in pagamento, 3-pagato, 4-annullato',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `adesione_per_quote` (`adesioneId`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 ;

-- ----------------------------
-- Records of adesione_quote
-- ----------------------------
BEGIN;
INSERT INTO `adesione_quote` VALUES (5, 3, NULL, 5, NULL, 4, 20.00, '2023-07-20', '2023', '8', NULL, 2, NULL, NULL, NULL, NULL, 2, '2023-07-14 16:46:56', '2023-07-14 16:46:56', NULL);
INSERT INTO `adesione_quote` VALUES (6, 3, NULL, 5, NULL, 4, 20.00, '2023-08-20', '2023', '9', NULL, 2, NULL, NULL, NULL, NULL, 1, '2023-07-14 16:46:56', '2023-07-14 16:46:56', NULL);
INSERT INTO `adesione_quote` VALUES (7, 3, NULL, 5, NULL, 4, 20.00, '2023-09-20', '2023', '10', NULL, 2, NULL, NULL, NULL, NULL, 1, '2023-07-14 16:46:56', '2023-07-14 16:46:56', NULL);
INSERT INTO `adesione_quote` VALUES (8, 3, NULL, 5, NULL, 4, 20.00, '2023-10-20', '2023', '11', NULL, 2, NULL, NULL, NULL, NULL, 1, '2023-07-14 16:46:56', '2023-07-14 16:46:56', NULL);
INSERT INTO `adesione_quote` VALUES (9, 3, NULL, 5, NULL, 4, 20.00, '2023-11-20', '2023', '12', NULL, 2, NULL, NULL, NULL, NULL, 1, '2023-07-14 16:46:56', '2023-07-14 16:46:56', NULL);
INSERT INTO `adesione_quote` VALUES (10, 4, NULL, 6, NULL, 5, 22.00, '2023-07-20', '2023', '8', NULL, 2, NULL, NULL, NULL, NULL, 2, '2023-07-14 17:04:29', '2023-07-14 17:04:29', NULL);
INSERT INTO `adesione_quote` VALUES (11, 4, NULL, 6, NULL, 5, 22.00, '2023-08-20', '2023', '9', NULL, 2, NULL, NULL, NULL, NULL, 1, '2023-07-14 17:04:29', '2023-07-14 17:04:29', NULL);
INSERT INTO `adesione_quote` VALUES (12, 4, NULL, 6, NULL, 5, 22.00, '2023-09-20', '2023', '10', NULL, 2, NULL, NULL, NULL, NULL, 1, '2023-07-14 17:04:29', '2023-07-14 17:04:29', NULL);
INSERT INTO `adesione_quote` VALUES (13, 4, NULL, 6, NULL, 5, 22.00, '2023-10-20', '2023', '11', NULL, 2, NULL, NULL, NULL, NULL, 1, '2023-07-14 17:04:29', '2023-07-14 17:04:29', NULL);
INSERT INTO `adesione_quote` VALUES (14, 4, NULL, 6, NULL, 5, 22.00, '2023-11-20', '2023', '12', NULL, 2, NULL, NULL, NULL, NULL, 1, '2023-07-14 17:04:29', '2023-07-14 17:04:29', NULL);
INSERT INTO `adesione_quote` VALUES (15, 5, NULL, 7, NULL, 6, 42.00, '2023-07-20', '2023', '8', NULL, 2, NULL, NULL, NULL, NULL, 2, '2023-07-14 17:16:17', '2023-07-14 17:16:17', NULL);
INSERT INTO `adesione_quote` VALUES (16, 5, NULL, 7, NULL, 6, 42.00, '2023-08-20', '2023', '9', NULL, 2, NULL, NULL, NULL, NULL, 1, '2023-07-14 17:16:17', '2023-07-14 17:16:17', NULL);
INSERT INTO `adesione_quote` VALUES (17, 5, NULL, 7, NULL, 6, 42.00, '2023-09-20', '2023', '10', NULL, 2, NULL, NULL, NULL, NULL, 1, '2023-07-14 17:16:17', '2023-07-14 17:16:17', NULL);
INSERT INTO `adesione_quote` VALUES (18, 5, NULL, 7, NULL, 6, 42.00, '2023-10-20', '2023', '11', NULL, 2, NULL, NULL, NULL, NULL, 1, '2023-07-14 17:16:17', '2023-07-14 17:16:17', NULL);
INSERT INTO `adesione_quote` VALUES (19, 5, NULL, 7, NULL, 6, 42.00, '2023-11-20', '2023', '12', NULL, 2, NULL, NULL, NULL, NULL, 1, '2023-07-14 17:16:17', '2023-07-14 17:16:17', NULL);
INSERT INTO `adesione_quote` VALUES (20, 6, NULL, 8, NULL, 7, 20.00, '2023-07-20', '2023', '8', NULL, 2, NULL, NULL, NULL, NULL, 2, '2023-07-14 17:25:39', '2023-07-14 17:25:39', NULL);
INSERT INTO `adesione_quote` VALUES (21, 6, NULL, 8, NULL, 7, 20.00, '2023-08-20', '2023', '9', NULL, 2, NULL, NULL, NULL, NULL, 1, '2023-07-14 17:25:39', '2023-07-14 17:25:39', NULL);
INSERT INTO `adesione_quote` VALUES (22, 6, NULL, 8, NULL, 7, 20.00, '2023-09-20', '2023', '10', NULL, 2, NULL, NULL, NULL, NULL, 1, '2023-07-14 17:25:39', '2023-07-14 17:25:39', NULL);
INSERT INTO `adesione_quote` VALUES (23, 6, NULL, 8, NULL, 7, 20.00, '2023-10-20', '2023', '11', NULL, 2, NULL, NULL, NULL, NULL, 1, '2023-07-14 17:25:39', '2023-07-14 17:25:39', NULL);
INSERT INTO `adesione_quote` VALUES (24, 6, NULL, 8, NULL, 7, 20.00, '2023-11-20', '2023', '12', NULL, 2, NULL, NULL, NULL, NULL, 1, '2023-07-14 17:25:39', '2023-07-14 17:25:39', NULL);
COMMIT;

-- ----------------------------
-- Table structure for adesione_sepa
-- ----------------------------
DROP TABLE IF EXISTS `adesione_sepa`;
CREATE TABLE `adesione_sepa` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `adesioneId` bigint unsigned NOT NULL,
  `anagraficaId` int unsigned NOT NULL,
  `mandatoSddId` varchar(35) CHARACTER SET utf8mb4  DEFAULT NULL,
  `mandatoSddAttivo` enum('1','0') CHARACTER SET utf8mb4  DEFAULT '0',
  `dataMandatoSddAttivo` datetime DEFAULT NULL,
  `iban` varchar(255) CHARACTER SET utf8mb4  NOT NULL,
  `intestatarioIBAN` varchar(100) CHARACTER SET utf8mb4  DEFAULT NULL,
  `CFIntestSdd` varchar(40) CHARACTER SET utf8mb4  DEFAULT NULL,
  `anaSWIFT` varchar(20) CHARACTER SET utf8mb4  DEFAULT NULL,
  `fileName` varchar(255) CHARACTER SET utf8mb4  DEFAULT NULL,
  `data_caricamento_file` datetime DEFAULT NULL,
  `data_autorizzazione` datetime DEFAULT NULL,
  `valido` enum('2','1','0') CHARACTER SET utf8mb4  NOT NULL DEFAULT '2',
  `data_valido_file` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `adesione_per_sepa` (`adesioneId`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 ;

-- ----------------------------
-- Records of adesione_sepa
-- ----------------------------
BEGIN;
INSERT INTO `adesione_sepa` VALUES (3, 3, 4, 'CS3VOL20230714155102', '0', NULL, 'IT27F0817835224000001092477', 'TESTE TSA', 'TSTTSA85E01L378Y', 'DDDDD', NULL, NULL, '2023-07-14 15:51:02', '2', NULL, '2023-07-14 15:51:02', '2023-07-14 15:51:02', NULL);
INSERT INTO `adesione_sepa` VALUES (4, 4, 5, 'CS4VOL20230714170352', '0', NULL, 'IT27F0817835224000001092477', 'TESTE TSA2', 'TSTTSA80L01L378O', 'DDDD', NULL, NULL, '2023-07-14 17:03:52', '2', NULL, '2023-07-14 17:03:52', '2023-07-14 17:03:52', NULL);
INSERT INTO `adesione_sepa` VALUES (5, 5, 6, 'CS5VOL20230714171517', '0', NULL, 'IT27F0817835224000001092477', 'TESTE TSA3', 'TSTTSA80M01L378C', 'SSSSSS', NULL, NULL, '2023-07-14 17:15:17', '2', NULL, '2023-07-14 17:15:17', '2023-07-14 17:15:17', NULL);
INSERT INTO `adesione_sepa` VALUES (6, 6, 7, 'CS6VOL20230714172508', '0', NULL, 'IT27F0817835224000001092477', 'TESTE TSA5', 'TSTTSA90A41L378R', 'DDD', NULL, NULL, '2023-07-14 17:25:08', '2', NULL, '2023-07-14 17:25:08', '2023-07-14 17:25:08', NULL);
COMMIT;

-- ----------------------------
-- Table structure for anagrafica
-- ----------------------------
DROP TABLE IF EXISTS `anagrafica`;
CREATE TABLE `anagrafica` (
  `anaID` int unsigned NOT NULL AUTO_INCREMENT,
  `anaCognome` varchar(30) NOT NULL,
  `anaNome` varchar(30) NOT NULL,
  `anaIndirizzo` varchar(45) DEFAULT NULL,
  `anaLocalita` varchar(45) DEFAULT NULL,
  `anaCAP` char(5) DEFAULT NULL,
  `anaProvincia` char(2) DEFAULT NULL,
  `anaCodiceFiscale` char(16) NOT NULL,
  `anaIBAN` varchar(34) DEFAULT NULL,
  `anaTelefono` varchar(30) DEFAULT NULL,
  `anaCellulare` varchar(30) DEFAULT NULL,
  `anaEMail` varchar(200) DEFAULT NULL,
  `DTID` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `anaNote` text,
  `anaSesso` char(1) NOT NULL,
  `anaLuogoNascita` varchar(45) DEFAULT NULL,
  `anaNazionalita` varchar(100) DEFAULT NULL,
  `anaProvinciaNascita` char(2) DEFAULT NULL,
  `anaDataNascita` date DEFAULT NULL,
  `anaComune` char(6) DEFAULT NULL,
  `anaIntestatarioIBAN` varchar(40) DEFAULT NULL,
  `anaUtenteWeb` bit(1) NOT NULL DEFAULT b'0',
  `anaIBANSdd` varchar(34) DEFAULT NULL,
  `anaIDMandatoSdd` varchar(35) DEFAULT NULL,
  `anaDataMandatoSdd` datetime DEFAULT NULL,
  `anaFlagInviatoFrstSdd` bit(1) DEFAULT b'0',
  `anaIntestCCSdd` varchar(40) DEFAULT NULL,
  `anaCFIntestSdd` varchar(16) DEFAULT NULL,
  `anaIDLingua` char(2) NOT NULL DEFAULT 'IT',
  `anaSWIFT` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`anaID`),
  UNIQUE KEY `anaCodiceFiscale` (`anaCodiceFiscale`),
  UNIQUE KEY `anaNominativoCF` (`anaCognome`,`anaNome`,`anaCodiceFiscale`),
  KEY `anagrafica_comune` (`anaComune`),
  CONSTRAINT `anagrafica_ibfk_1` FOREIGN KEY (`anaComune`) REFERENCES `comuni` (`comCodice`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4  COMMENT='Anagrafica persone fisiche iscritte';

-- ----------------------------
-- Records of anagrafica
-- ----------------------------
BEGIN;
INSERT INTO `anagrafica` VALUES (4, 'TESTE', 'TSA', 'VIA DEI', 'TRENTO', '38057', 'TN', 'TSTTSA85E01L378Y', 'IT27F0817835224000001092477', NULL, '+39.1111222333', 'anderson.ramagnoli@gmail.com', '2023-07-14 15:51:02', NULL, 'M', 'TRENTO', 'ITALIANA', 'TN', '1985-05-01', '022205', 'TESTE TSA', b'0', NULL, NULL, NULL, b'0', NULL, NULL, 'IT', NULL);
INSERT INTO `anagrafica` VALUES (5, 'TESTE', 'TSA2', 'VIA DEI', 'TRENTO', '38057', 'TN', 'TSTTSA80L01L378O', 'IT27F0817835224000001092477', NULL, '+39.1111222333', 'tsa@lincemix.com', '2023-07-14 17:03:52', NULL, 'M', 'TRENTO', 'ITALIANA', 'TN', '1980-07-01', '022205', 'TESTE TSA2', b'0', NULL, NULL, NULL, b'0', NULL, NULL, 'IT', NULL);
INSERT INTO `anagrafica` VALUES (6, 'TESTE', 'TSA3', 'VIA DEI', 'TRENTO', '38057', 'TN', 'TSTTSA80M01L378C', 'IT27F0817835224000001092477', NULL, '+39.1111222333', 'tsa3@lincemix.com', '2023-07-14 17:15:17', NULL, 'M', 'TRENTO', 'ITALIANA', 'TN', '1980-08-01', '022205', 'TESTE TSA3', b'0', NULL, NULL, NULL, b'0', NULL, NULL, 'IT', NULL);
INSERT INTO `anagrafica` VALUES (7, 'TESTE', 'TSA5', 'VIA DEI', 'TRENTO', '38057', 'TN', 'TSTTSA90A41L378R', 'IT27F0817835224000001092477', NULL, '+39.1111222333', 'TSA5@LINCEMIX.COM', '2023-07-14 17:25:08', NULL, 'F', 'TRENTO', 'ITALIANA', 'TN', '1990-01-01', '022205', 'TESTE TSA5', b'0', NULL, NULL, NULL, b'0', NULL, NULL, 'IT', NULL);
COMMIT;

-- ----------------------------
-- Table structure for anagrafica_documentazioni
-- ----------------------------
DROP TABLE IF EXISTS `anagrafica_documentazioni`;
CREATE TABLE `anagrafica_documentazioni` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `anagraficaId` int NOT NULL,
  `modulo` varchar(200) CHARACTER SET utf8mb4  NOT NULL,
  `fileName` varchar(200) CHARACTER SET utf8mb4  DEFAULT NULL,
  `dataScadenza` date DEFAULT NULL,
  `data_caricamento_file` datetime DEFAULT NULL,
  `utente_caricamento_file` int DEFAULT NULL,
  `valido` int NOT NULL DEFAULT '2',
  `non_applicabile` bit(1) NOT NULL DEFAULT b'0' COMMENT 'caricamento non obbligatorio',
  `data_valido_file` datetime DEFAULT NULL,
  `motivazioniRespingimento` varchar(400) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=376 DEFAULT CHARSET=utf8mb4 ;

-- ----------------------------
-- Records of anagrafica_documentazioni
-- ----------------------------
BEGIN;
INSERT INTO `anagrafica_documentazioni` VALUES (367, 4, 'carta_identita_all', '64b15fc80e7a4.pdf', '2030-03-23', '2023-07-14 16:46:32', NULL, 2, b'0', NULL, NULL, '2023-07-14 16:46:32', '2023-07-14 16:46:32');
INSERT INTO `anagrafica_documentazioni` VALUES (368, 4, 'tessera_sanitaria_fronte', '64b15fd4d6ee6.pdf', '2030-02-23', '2023-07-14 16:46:45', NULL, 2, b'0', NULL, NULL, '2023-07-14 16:46:45', '2023-07-14 16:46:45');
INSERT INTO `anagrafica_documentazioni` VALUES (369, 4, 'tessera_sanitaria_retro', '64b15fe04eabc.pdf', '2030-03-23', '2023-07-14 16:46:56', NULL, 2, b'0', NULL, NULL, '2023-07-14 16:46:56', '2023-07-14 16:46:56');
INSERT INTO `anagrafica_documentazioni` VALUES (370, 5, 'carta_identita_all', '64b163f28f8d2.pdf', '2034-03-23', '2023-07-14 17:04:18', NULL, 2, b'0', NULL, NULL, '2023-07-14 17:04:18', '2023-07-14 17:04:18');
INSERT INTO `anagrafica_documentazioni` VALUES (371, 5, 'tessera_sanitaria_all', '64b163fcd8bc5.pdf', '2030-03-23', '2023-07-14 17:04:29', NULL, 2, b'0', NULL, NULL, '2023-07-14 17:04:29', '2023-07-14 17:04:29');
INSERT INTO `anagrafica_documentazioni` VALUES (372, 6, 'carta_identita_all', '64b1669c8908a.pdf', '2030-02-23', '2023-07-14 17:15:40', NULL, 2, b'0', NULL, NULL, '2023-07-14 17:15:40', '2023-07-14 17:15:40');
INSERT INTO `anagrafica_documentazioni` VALUES (373, 6, 'tessera_sanitaria_all', '64b166a395af4.pdf', '2030-02-23', '2023-07-14 17:15:47', NULL, 2, b'0', NULL, NULL, '2023-07-14 17:15:47', '2023-07-14 17:15:47');
INSERT INTO `anagrafica_documentazioni` VALUES (374, 7, 'carta_identita_all', '64b168eb5d540.pdf', '2030-03-20', '2023-07-14 17:25:31', NULL, 2, b'0', NULL, NULL, '2023-07-14 17:25:31', '2023-07-14 17:25:31');
INSERT INTO `anagrafica_documentazioni` VALUES (375, 7, 'tessera_sanitaria_all', '64b168f2eed4f.pdf', '2030-03-20', '2023-07-14 17:25:39', NULL, 2, b'0', NULL, NULL, '2023-07-14 17:25:39', '2023-07-14 17:25:39');
COMMIT;

-- ----------------------------
-- Table structure for av_aziende
-- ----------------------------
DROP TABLE IF EXISTS `av_aziende`;
CREATE TABLE `av_aziende` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `aziDescrizione` varchar(50) CHARACTER SET utf8mb4  NOT NULL,
  `aziIDFondo` int unsigned NOT NULL,
  `aziTargaFederazione` char(2) CHARACTER SET utf8mb4  DEFAULT NULL,
  `aziPartitaIVA` char(16) CHARACTER SET utf8mb4  DEFAULT NULL,
  `aziIndirizzo` varchar(45) CHARACTER SET utf8mb4  DEFAULT NULL,
  `aziLocalita` varchar(45) CHARACTER SET utf8mb4  DEFAULT NULL,
  `aziCAP` char(5) CHARACTER SET utf8mb4  DEFAULT NULL,
  `aziProvincia` char(2) CHARACTER SET utf8mb4  DEFAULT NULL,
  `aziIBAN` varchar(27) CHARACTER SET utf8mb4  DEFAULT NULL,
  `aziTelefono` varchar(30) CHARACTER SET utf8mb4  DEFAULT NULL,
  `aziFax` varchar(30) CHARACTER SET utf8mb4  DEFAULT NULL,
  `aziEMail` varchar(200) DEFAULT NULL,
  `aziPec` varchar(200) DEFAULT NULL,
  `aziReferente` varchar(40) CHARACTER SET utf8mb4  DEFAULT NULL,
  `aziTelefonoReferente` varchar(30) CHARACTER SET utf8mb4  DEFAULT NULL,
  `aziEMailReferente` varchar(60) CHARACTER SET utf8mb4  DEFAULT NULL,
  `aziMorosa` enum('0','1') CHARACTER SET utf8mb4  NOT NULL DEFAULT '0',
  `aziNote` text CHARACTER SET utf8mb4 ,
  `aziComune` char(6) CHARACTER SET utf8mb4  DEFAULT NULL,
  `aziDataPrimaIscrizione` datetime DEFAULT NULL,
  `aziEsclusaGestioneCrediti` enum('0','1') CHARACTER SET utf8mb4  NOT NULL DEFAULT '0',
  `aziDataUscita` datetime DEFAULT NULL,
  `aziIDLingua` char(2) CHARACTER SET utf8mb4  NOT NULL DEFAULT 'IT',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ;

-- ----------------------------
-- Records of av_aziende
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for comuni
-- ----------------------------
DROP TABLE IF EXISTS `comuni`;
CREATE TABLE `comuni` (
  `comCodice` char(6) NOT NULL,
  `comDescrizione` varchar(40) NOT NULL,
  `comCodiceProvincia` char(3) NOT NULL,
  `comIDEnteIntermedio` int unsigned DEFAULT NULL,
  `DTID` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `comCodiceCatastale` char(4) DEFAULT NULL,
  PRIMARY KEY (`comCodice`),
  KEY `comuni_province` (`comCodiceProvincia`),
  KEY `comuni_enti_intermedi` (`comIDEnteIntermedio`),
  KEY `comuni_descrizione` (`comDescrizione`),
  CONSTRAINT `comuni_ibfk_1` FOREIGN KEY (`comIDEnteIntermedio`) REFERENCES `enti_intermedi` (`einID`) ON UPDATE CASCADE,
  CONSTRAINT `comuni_ibfk_2` FOREIGN KEY (`comCodiceProvincia`) REFERENCES `province` (`proCodice`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ;

-- ----------------------------
-- Records of comuni
-- ----------------------------
BEGIN;
INSERT INTO `comuni` VALUES ('00000', 'ESTERO', 'ZZZ', NULL, '2023-02-27 18:49:07', NULL);
INSERT INTO `comuni` VALUES ('000000', 'Svizzera', 'ZZZ', NULL, '2023-02-27 18:49:07', NULL);
INSERT INTO `comuni` VALUES ('000011', 'CROAZIA', 'ZZZ', NULL, '2023-02-27 18:49:07', NULL);
INSERT INTO `comuni` VALUES ('000012', 'SLOVENIA', 'ZZZ', NULL, '2023-02-27 18:49:07', NULL);
INSERT INTO `comuni` VALUES ('001001', 'Agliè', '001', NULL, '2023-02-27 18:49:07', 'A074');
INSERT INTO `comuni` VALUES ('001002', 'Airasca', '001', NULL, '2023-02-27 18:49:07', 'A109');
INSERT INTO `comuni` VALUES ('001003', 'Ala di Stura', '001', NULL, '2023-02-27 18:49:07', 'A117');
INSERT INTO `comuni` VALUES ('001004', 'Albiano d\'Ivrea', '001', NULL, '2023-02-27 18:49:07', 'A157');
INSERT INTO `comuni` VALUES ('001005', 'Alice Superiore', '001', NULL, '2023-02-27 18:49:07', 'A199');
INSERT INTO `comuni` VALUES ('001006', 'Almese', '001', NULL, '2023-02-27 18:49:07', 'A218');
INSERT INTO `comuni` VALUES ('001007', 'Alpette', '001', NULL, '2023-02-27 18:49:07', 'A221');
INSERT INTO `comuni` VALUES ('001008', 'Alpignano', '001', NULL, '2023-02-27 18:49:07', 'A222');
INSERT INTO `comuni` VALUES ('001009', 'Andezeno', '001', NULL, '2023-02-27 18:49:07', 'A275');
INSERT INTO `comuni` VALUES ('001010', 'Andrate', '001', NULL, '2023-02-27 18:49:07', 'A282');
INSERT INTO `comuni` VALUES ('001011', 'Angrogna', '001', NULL, '2023-02-27 18:49:07', 'A295');
INSERT INTO `comuni` VALUES ('001012', 'Arignano', '001', NULL, '2023-02-27 18:49:07', 'A405');
INSERT INTO `comuni` VALUES ('001013', 'Avigliana', '001', NULL, '2023-02-27 18:49:07', 'A518');
INSERT INTO `comuni` VALUES ('001014', 'Azeglio', '001', NULL, '2023-02-27 18:49:07', 'A525');
INSERT INTO `comuni` VALUES ('001015', 'Bairo', '001', NULL, '2023-02-27 18:49:07', 'A584');
INSERT INTO `comuni` VALUES ('001016', 'Balangero', '001', NULL, '2023-02-27 18:49:07', 'A587');
INSERT INTO `comuni` VALUES ('001017', 'Baldissero Canavese', '001', NULL, '2023-02-27 18:49:07', 'A590');
INSERT INTO `comuni` VALUES ('001018', 'Baldissero Torinese', '001', NULL, '2023-02-27 18:49:07', 'A591');
INSERT INTO `comuni` VALUES ('001019', 'Balme', '001', NULL, '2023-02-27 18:49:07', 'A599');
INSERT INTO `comuni` VALUES ('001020', 'Banchette', '001', NULL, '2023-02-27 18:49:07', 'A607');
INSERT INTO `comuni` VALUES ('001021', 'Barbania', '001', NULL, '2023-02-27 18:49:07', 'A625');
INSERT INTO `comuni` VALUES ('001022', 'Bardonecchia', '001', NULL, '2023-02-27 18:49:07', 'A651');
INSERT INTO `comuni` VALUES ('001023', 'Barone Canavese', '001', NULL, '2023-02-27 18:49:07', 'A673');
INSERT INTO `comuni` VALUES ('001024', 'Beinasco', '001', NULL, '2023-02-27 18:49:07', 'A734');
INSERT INTO `comuni` VALUES ('001025', 'Bibiana', '001', NULL, '2023-02-27 18:49:07', 'A853');
INSERT INTO `comuni` VALUES ('001026', 'Bobbio Pellice', '001', NULL, '2023-02-27 18:49:07', 'A910');
INSERT INTO `comuni` VALUES ('001027', 'Bollengo', '001', NULL, '2023-02-27 18:49:07', 'A941');
INSERT INTO `comuni` VALUES ('001028', 'Borgaro Torinese', '001', NULL, '2023-02-27 18:49:07', 'A990');
INSERT INTO `comuni` VALUES ('001029', 'Borgiallo', '001', NULL, '2023-02-27 18:49:07', 'B003');
INSERT INTO `comuni` VALUES ('001030', 'Borgofranco d\'Ivrea', '001', NULL, '2023-02-27 18:49:07', 'B015');
INSERT INTO `comuni` VALUES ('001031', 'Borgomasino', '001', NULL, '2023-02-27 18:49:07', 'B021');
INSERT INTO `comuni` VALUES ('001032', 'Borgone Susa', '001', NULL, '2023-02-27 18:49:07', 'B024');
INSERT INTO `comuni` VALUES ('001033', 'Bosconero', '001', NULL, '2023-02-27 18:49:07', 'B075');
INSERT INTO `comuni` VALUES ('001034', 'Brandizzo', '001', NULL, '2023-02-27 18:49:07', 'B121');
INSERT INTO `comuni` VALUES ('001035', 'Bricherasio', '001', NULL, '2023-02-27 18:49:07', 'B171');
INSERT INTO `comuni` VALUES ('001036', 'Brosso', '001', NULL, '2023-02-27 18:49:07', 'B205');
INSERT INTO `comuni` VALUES ('001037', 'Brozolo', '001', NULL, '2023-02-27 18:49:07', 'B209');
INSERT INTO `comuni` VALUES ('001038', 'Bruino', '001', NULL, '2023-02-27 18:49:07', 'B216');
INSERT INTO `comuni` VALUES ('001039', 'Brusasco', '001', NULL, '2023-02-27 18:49:07', 'B225');
INSERT INTO `comuni` VALUES ('001040', 'Bruzolo', '001', NULL, '2023-02-27 18:49:07', 'B232');
INSERT INTO `comuni` VALUES ('001041', 'Buriasco', '001', NULL, '2023-02-27 18:49:07', 'B278');
INSERT INTO `comuni` VALUES ('001042', 'Burolo', '001', NULL, '2023-02-27 18:49:07', 'B279');
INSERT INTO `comuni` VALUES ('001043', 'Busano', '001', NULL, '2023-02-27 18:49:07', 'B284');
INSERT INTO `comuni` VALUES ('001044', 'Bussoleno', '001', NULL, '2023-02-27 18:49:07', 'B297');
INSERT INTO `comuni` VALUES ('001045', 'Buttigliera Alta', '001', NULL, '2023-02-27 18:49:07', 'B305');
INSERT INTO `comuni` VALUES ('001046', 'Cafasse', '001', NULL, '2023-02-27 18:49:07', 'B350');
INSERT INTO `comuni` VALUES ('001047', 'Caluso', '001', NULL, '2023-02-27 18:49:07', 'B435');
INSERT INTO `comuni` VALUES ('001048', 'Cambiano', '001', NULL, '2023-02-27 18:49:07', 'B462');
INSERT INTO `comuni` VALUES ('001049', 'Campiglione Fenile', '001', NULL, '2023-02-27 18:49:07', 'B512');
INSERT INTO `comuni` VALUES ('001050', 'Candia Canavese', '001', NULL, '2023-02-27 18:49:07', 'B588');
INSERT INTO `comuni` VALUES ('001051', 'Candiolo', '001', NULL, '2023-02-27 18:49:07', 'B592');
INSERT INTO `comuni` VALUES ('001052', 'Canischio', '001', NULL, '2023-02-27 18:49:07', 'B605');
INSERT INTO `comuni` VALUES ('001053', 'Cantalupa', '001', NULL, '2023-02-27 18:49:07', 'B628');
INSERT INTO `comuni` VALUES ('001054', 'Cantoira', '001', NULL, '2023-02-27 18:49:07', 'B637');
INSERT INTO `comuni` VALUES ('001055', 'Caprie', '001', NULL, '2023-02-27 18:49:07', 'B705');
INSERT INTO `comuni` VALUES ('001056', 'Caravino', '001', NULL, '2023-02-27 18:49:07', 'B733');
INSERT INTO `comuni` VALUES ('001057', 'Carema', '001', NULL, '2023-02-27 18:49:07', 'B762');
INSERT INTO `comuni` VALUES ('001058', 'Carignano', '001', NULL, '2023-02-27 18:49:07', 'B777');
INSERT INTO `comuni` VALUES ('001059', 'Carmagnola', '001', NULL, '2023-02-27 18:49:07', 'B791');
INSERT INTO `comuni` VALUES ('001060', 'Casalborgone', '001', NULL, '2023-02-27 18:49:07', 'B867');
INSERT INTO `comuni` VALUES ('001061', 'Cascinette d\'Ivrea', '001', NULL, '2023-02-27 18:49:07', 'B953');
INSERT INTO `comuni` VALUES ('001062', 'Caselette', '001', NULL, '2023-02-27 18:49:07', 'B955');
INSERT INTO `comuni` VALUES ('001063', 'Caselle Torinese', '001', NULL, '2023-02-27 18:49:07', 'B960');
INSERT INTO `comuni` VALUES ('001064', 'Castagneto Po', '001', NULL, '2023-02-27 18:49:07', 'C045');
INSERT INTO `comuni` VALUES ('001065', 'Castagnole Piemonte', '001', NULL, '2023-02-27 18:49:07', 'C048');
INSERT INTO `comuni` VALUES ('001066', 'Castellamonte', '001', NULL, '2023-02-27 18:49:07', 'C133');
INSERT INTO `comuni` VALUES ('001067', 'Castelnuovo Nigra', '001', NULL, '2023-02-27 18:49:07', 'C241');
INSERT INTO `comuni` VALUES ('001068', 'Castiglione Torinese', '001', NULL, '2023-02-27 18:49:07', 'C307');
INSERT INTO `comuni` VALUES ('001069', 'Cavagnolo', '001', NULL, '2023-02-27 18:49:07', 'C369');
INSERT INTO `comuni` VALUES ('001070', 'Cavour', '001', NULL, '2023-02-27 18:49:07', 'C404');
INSERT INTO `comuni` VALUES ('001071', 'Cercenasco', '001', NULL, '2023-02-27 18:49:07', 'C487');
INSERT INTO `comuni` VALUES ('001072', 'Ceres', '001', NULL, '2023-02-27 18:49:07', 'C497');
INSERT INTO `comuni` VALUES ('001073', 'Ceresole Reale', '001', NULL, '2023-02-27 18:49:07', 'C505');
INSERT INTO `comuni` VALUES ('001074', 'Cesana Torinese', '001', NULL, '2023-02-27 18:49:07', 'C564');
INSERT INTO `comuni` VALUES ('001075', 'Chialamberto', '001', NULL, '2023-02-27 18:49:07', 'C604');
INSERT INTO `comuni` VALUES ('001076', 'Chianocco', '001', NULL, '2023-02-27 18:49:07', 'C610');
INSERT INTO `comuni` VALUES ('001077', 'Chiaverano', '001', NULL, '2023-02-27 18:49:07', 'C624');
INSERT INTO `comuni` VALUES ('001078', 'Chieri', '001', NULL, '2023-02-27 18:49:07', 'C627');
INSERT INTO `comuni` VALUES ('001079', 'Chiesanuova', '001', NULL, '2023-02-27 18:49:07', 'C629');
INSERT INTO `comuni` VALUES ('001080', 'Chiomonte', '001', NULL, '2023-02-27 18:49:07', 'C639');
INSERT INTO `comuni` VALUES ('001081', 'Chiusa di San Michele', '001', NULL, '2023-02-27 18:49:07', 'C655');
INSERT INTO `comuni` VALUES ('001082', 'Chivasso', '001', NULL, '2023-02-27 18:49:07', 'C665');
INSERT INTO `comuni` VALUES ('001083', 'Ciconio', '001', NULL, '2023-02-27 18:49:07', 'C679');
INSERT INTO `comuni` VALUES ('001084', 'Cintano', '001', NULL, '2023-02-27 18:49:07', 'C711');
INSERT INTO `comuni` VALUES ('001085', 'Cinzano', '001', NULL, '2023-02-27 18:49:07', 'C715');
INSERT INTO `comuni` VALUES ('001086', 'Ciriè', '001', NULL, '2023-02-27 18:49:07', 'C722');
INSERT INTO `comuni` VALUES ('001087', 'Claviere', '001', NULL, '2023-02-27 18:49:07', 'C793');
INSERT INTO `comuni` VALUES ('001088', 'Coassolo Torinese', '001', NULL, '2023-02-27 18:49:07', 'C801');
INSERT INTO `comuni` VALUES ('001089', 'Coazze', '001', NULL, '2023-02-27 18:49:07', 'C803');
INSERT INTO `comuni` VALUES ('001090', 'Collegno', '001', NULL, '2023-02-27 18:49:07', 'C860');
INSERT INTO `comuni` VALUES ('001091', 'Colleretto Castelnuovo', '001', NULL, '2023-02-27 18:49:07', 'C867');
INSERT INTO `comuni` VALUES ('001092', 'Colleretto Giacosa', '001', NULL, '2023-02-27 18:49:07', 'C868');
INSERT INTO `comuni` VALUES ('001093', 'Condove', '001', NULL, '2023-02-27 18:49:07', 'C955');
INSERT INTO `comuni` VALUES ('001094', 'Corio', '001', NULL, '2023-02-27 18:49:07', 'D008');
INSERT INTO `comuni` VALUES ('001095', 'Cossano Canavese', '001', NULL, '2023-02-27 18:49:07', 'D092');
INSERT INTO `comuni` VALUES ('001096', 'Cuceglio', '001', NULL, '2023-02-27 18:49:07', 'D197');
INSERT INTO `comuni` VALUES ('001097', 'Cumiana', '001', NULL, '2023-02-27 18:49:07', 'D202');
INSERT INTO `comuni` VALUES ('001098', 'Cuorgnè', '001', NULL, '2023-02-27 18:49:07', 'D208');
INSERT INTO `comuni` VALUES ('001099', 'Druento', '001', NULL, '2023-02-27 18:49:07', 'D373');
INSERT INTO `comuni` VALUES ('001100', 'Exilles', '001', NULL, '2023-02-27 18:49:07', 'D433');
INSERT INTO `comuni` VALUES ('001101', 'Favria', '001', NULL, '2023-02-27 18:49:07', 'D520');
INSERT INTO `comuni` VALUES ('001102', 'Feletto', '001', NULL, '2023-02-27 18:49:07', 'D524');
INSERT INTO `comuni` VALUES ('001103', 'Fenestrelle', '001', NULL, '2023-02-27 18:49:07', 'D532');
INSERT INTO `comuni` VALUES ('001104', 'Fiano', '001', NULL, '2023-02-27 18:49:07', 'D562');
INSERT INTO `comuni` VALUES ('001105', 'Fiorano Canavese', '001', NULL, '2023-02-27 18:49:07', 'D608');
INSERT INTO `comuni` VALUES ('001106', 'Foglizzo', '001', NULL, '2023-02-27 18:49:07', 'D646');
INSERT INTO `comuni` VALUES ('001107', 'Forno Canavese', '001', NULL, '2023-02-27 18:49:07', 'D725');
INSERT INTO `comuni` VALUES ('001108', 'Frassinetto', '001', NULL, '2023-02-27 18:49:07', 'D781');
INSERT INTO `comuni` VALUES ('001109', 'Front', '001', NULL, '2023-02-27 18:49:07', 'D805');
INSERT INTO `comuni` VALUES ('001110', 'Frossasco', '001', NULL, '2023-02-27 18:49:07', 'D812');
INSERT INTO `comuni` VALUES ('001111', 'Garzigliana', '001', NULL, '2023-02-27 18:49:07', 'D931');
INSERT INTO `comuni` VALUES ('001112', 'Gassino Torinese', '001', NULL, '2023-02-27 18:49:07', 'D933');
INSERT INTO `comuni` VALUES ('001113', 'Germagnano', '001', NULL, '2023-02-27 18:49:07', 'D983');
INSERT INTO `comuni` VALUES ('001114', 'Giaglione', '001', NULL, '2023-02-27 18:49:07', 'E009');
INSERT INTO `comuni` VALUES ('001115', 'Giaveno', '001', NULL, '2023-02-27 18:49:07', 'E020');
INSERT INTO `comuni` VALUES ('001116', 'Givoletto', '001', NULL, '2023-02-27 18:49:07', 'E067');
INSERT INTO `comuni` VALUES ('001117', 'Gravere', '001', NULL, '2023-02-27 18:49:07', 'E154');
INSERT INTO `comuni` VALUES ('001118', 'Groscavallo', '001', NULL, '2023-02-27 18:49:07', 'E199');
INSERT INTO `comuni` VALUES ('001119', 'Grosso', '001', NULL, '2023-02-27 18:49:07', 'E203');
INSERT INTO `comuni` VALUES ('001120', 'Grugliasco', '001', NULL, '2023-02-27 18:49:07', 'E216');
INSERT INTO `comuni` VALUES ('001121', 'Ingria', '001', NULL, '2023-02-27 18:49:07', 'E301');
INSERT INTO `comuni` VALUES ('001122', 'Inverso Pinasca', '001', NULL, '2023-02-27 18:49:07', 'E311');
INSERT INTO `comuni` VALUES ('001123', 'Isolabella', '001', NULL, '2023-02-27 18:49:07', 'E345');
INSERT INTO `comuni` VALUES ('001124', 'Issiglio', '001', NULL, '2023-02-27 18:49:07', 'E368');
INSERT INTO `comuni` VALUES ('001125', 'Ivrea', '001', NULL, '2023-02-27 18:49:07', 'E379');
INSERT INTO `comuni` VALUES ('001126', 'La Cassa', '001', NULL, '2023-02-27 18:49:07', 'E394');
INSERT INTO `comuni` VALUES ('001127', 'La Loggia', '001', NULL, '2023-02-27 18:49:07', 'E423');
INSERT INTO `comuni` VALUES ('001128', 'Lanzo Torinese', '001', NULL, '2023-02-27 18:49:07', 'E445');
INSERT INTO `comuni` VALUES ('001129', 'Lauriano', '001', NULL, '2023-02-27 18:49:07', 'E484');
INSERT INTO `comuni` VALUES ('001130', 'Leini', '001', NULL, '2023-02-27 18:49:07', 'E518');
INSERT INTO `comuni` VALUES ('001131', 'Lemie', '001', NULL, '2023-02-27 18:49:07', 'E520');
INSERT INTO `comuni` VALUES ('001132', 'Lessolo', '001', NULL, '2023-02-27 18:49:07', 'E551');
INSERT INTO `comuni` VALUES ('001133', 'Levone', '001', NULL, '2023-02-27 18:49:07', 'E566');
INSERT INTO `comuni` VALUES ('001134', 'Locana', '001', NULL, '2023-02-27 18:49:07', 'E635');
INSERT INTO `comuni` VALUES ('001135', 'Lombardore', '001', NULL, '2023-02-27 18:49:07', 'E660');
INSERT INTO `comuni` VALUES ('001136', 'Lombriasco', '001', NULL, '2023-02-27 18:49:07', 'E661');
INSERT INTO `comuni` VALUES ('001137', 'Loranzè', '001', NULL, '2023-02-27 18:49:07', 'E683');
INSERT INTO `comuni` VALUES ('001138', 'Lugnacco', '001', NULL, '2023-02-27 18:49:07', 'E727');
INSERT INTO `comuni` VALUES ('001139', 'Luserna San Giovanni', '001', NULL, '2023-02-27 18:49:07', 'E758');
INSERT INTO `comuni` VALUES ('001140', 'Lusernetta', '001', NULL, '2023-02-27 18:49:07', 'E759');
INSERT INTO `comuni` VALUES ('001141', 'Lusigliè', '001', NULL, '2023-02-27 18:49:07', 'E763');
INSERT INTO `comuni` VALUES ('001142', 'Macello', '001', NULL, '2023-02-27 18:49:07', 'E782');
INSERT INTO `comuni` VALUES ('001143', 'Maglione', '001', NULL, '2023-02-27 18:49:07', 'E817');
INSERT INTO `comuni` VALUES ('001144', 'Marentino', '001', NULL, '2023-02-27 18:49:07', 'E941');
INSERT INTO `comuni` VALUES ('001145', 'Massello', '001', NULL, '2023-02-27 18:49:07', 'F041');
INSERT INTO `comuni` VALUES ('001146', 'Mathi', '001', NULL, '2023-02-27 18:49:07', 'F053');
INSERT INTO `comuni` VALUES ('001147', 'Mattie', '001', NULL, '2023-02-27 18:49:07', 'F058');
INSERT INTO `comuni` VALUES ('001148', 'Mazzè', '001', NULL, '2023-02-27 18:49:07', 'F067');
INSERT INTO `comuni` VALUES ('001149', 'Meana di Susa', '001', NULL, '2023-02-27 18:49:07', 'F074');
INSERT INTO `comuni` VALUES ('001150', 'Mercenasco', '001', NULL, '2023-02-27 18:49:07', 'F140');
INSERT INTO `comuni` VALUES ('001151', 'Meugliano', '001', NULL, '2023-02-27 18:49:07', 'F164');
INSERT INTO `comuni` VALUES ('001152', 'Mezzenile', '001', NULL, '2023-02-27 18:49:07', 'F182');
INSERT INTO `comuni` VALUES ('001153', 'Mombello di Torino', '001', NULL, '2023-02-27 18:49:07', 'F315');
INSERT INTO `comuni` VALUES ('001154', 'Mompantero', '001', NULL, '2023-02-27 18:49:07', 'F318');
INSERT INTO `comuni` VALUES ('001155', 'Monastero di Lanzo', '001', NULL, '2023-02-27 18:49:07', 'F327');
INSERT INTO `comuni` VALUES ('001156', 'Moncalieri', '001', NULL, '2023-02-27 18:49:07', 'F335');
INSERT INTO `comuni` VALUES ('001157', 'Moncenisio', '001', NULL, '2023-02-27 18:49:07', 'D553');
INSERT INTO `comuni` VALUES ('001158', 'Montaldo Torinese', '001', NULL, '2023-02-27 18:49:07', 'F407');
INSERT INTO `comuni` VALUES ('001159', 'Montalenghe', '001', NULL, '2023-02-27 18:49:07', 'F411');
INSERT INTO `comuni` VALUES ('001160', 'Montalto Dora', '001', NULL, '2023-02-27 18:49:07', 'F420');
INSERT INTO `comuni` VALUES ('001161', 'Montanaro', '001', NULL, '2023-02-27 18:49:07', 'F422');
INSERT INTO `comuni` VALUES ('001162', 'Monteu da Po', '001', NULL, '2023-02-27 18:49:07', 'F651');
INSERT INTO `comuni` VALUES ('001163', 'Moriondo Torinese', '001', NULL, '2023-02-27 18:49:07', 'F733');
INSERT INTO `comuni` VALUES ('001164', 'Nichelino', '001', NULL, '2023-02-27 18:49:07', 'F889');
INSERT INTO `comuni` VALUES ('001165', 'Noasca', '001', NULL, '2023-02-27 18:49:07', 'F906');
INSERT INTO `comuni` VALUES ('001166', 'Nole', '001', NULL, '2023-02-27 18:49:07', 'F925');
INSERT INTO `comuni` VALUES ('001167', 'Nomaglio', '001', NULL, '2023-02-27 18:49:07', 'F927');
INSERT INTO `comuni` VALUES ('001168', 'None', '001', NULL, '2023-02-27 18:49:07', 'F931');
INSERT INTO `comuni` VALUES ('001169', 'Novalesa', '001', NULL, '2023-02-27 18:49:07', 'F948');
INSERT INTO `comuni` VALUES ('001170', 'Oglianico', '001', NULL, '2023-02-27 18:49:07', 'G010');
INSERT INTO `comuni` VALUES ('001171', 'Orbassano', '001', NULL, '2023-02-27 18:49:07', 'G087');
INSERT INTO `comuni` VALUES ('001172', 'Orio Canavese', '001', NULL, '2023-02-27 18:49:07', 'G109');
INSERT INTO `comuni` VALUES ('001173', 'Osasco', '001', NULL, '2023-02-27 18:49:07', 'G151');
INSERT INTO `comuni` VALUES ('001174', 'Osasio', '001', NULL, '2023-02-27 18:49:07', 'G152');
INSERT INTO `comuni` VALUES ('001175', 'Oulx', '001', NULL, '2023-02-27 18:49:07', 'G196');
INSERT INTO `comuni` VALUES ('001176', 'Ozegna', '001', NULL, '2023-02-27 18:49:07', 'G202');
INSERT INTO `comuni` VALUES ('001177', 'Palazzo Canavese', '001', NULL, '2023-02-27 18:49:07', 'G262');
INSERT INTO `comuni` VALUES ('001178', 'Pancalieri', '001', NULL, '2023-02-27 18:49:07', 'G303');
INSERT INTO `comuni` VALUES ('001179', 'Parella', '001', NULL, '2023-02-27 18:49:07', 'G330');
INSERT INTO `comuni` VALUES ('001180', 'Pavarolo', '001', NULL, '2023-02-27 18:49:07', 'G387');
INSERT INTO `comuni` VALUES ('001181', 'Pavone Canavese', '001', NULL, '2023-02-27 18:49:07', 'G392');
INSERT INTO `comuni` VALUES ('001182', 'Pecco', '001', NULL, '2023-02-27 18:49:07', 'G396');
INSERT INTO `comuni` VALUES ('001183', 'Pecetto Torinese', '001', NULL, '2023-02-27 18:49:07', 'G398');
INSERT INTO `comuni` VALUES ('001184', 'Perosa Argentina', '001', NULL, '2023-02-27 18:49:07', 'G463');
INSERT INTO `comuni` VALUES ('001185', 'Perosa Canavese', '001', NULL, '2023-02-27 18:49:07', 'G462');
INSERT INTO `comuni` VALUES ('001186', 'Perrero', '001', NULL, '2023-02-27 18:49:07', 'G465');
INSERT INTO `comuni` VALUES ('001187', 'Pertusio', '001', NULL, '2023-02-27 18:49:07', 'G477');
INSERT INTO `comuni` VALUES ('001188', 'Pessinetto', '001', NULL, '2023-02-27 18:49:07', 'G505');
INSERT INTO `comuni` VALUES ('001189', 'Pianezza', '001', NULL, '2023-02-27 18:49:07', 'G559');
INSERT INTO `comuni` VALUES ('001190', 'Pinasca', '001', NULL, '2023-02-27 18:49:07', 'G672');
INSERT INTO `comuni` VALUES ('001191', 'Pinerolo', '001', NULL, '2023-02-27 18:49:07', 'G674');
INSERT INTO `comuni` VALUES ('001192', 'Pino Torinese', '001', NULL, '2023-02-27 18:49:07', 'G678');
INSERT INTO `comuni` VALUES ('001193', 'Piobesi Torinese', '001', NULL, '2023-02-27 18:49:07', 'G684');
INSERT INTO `comuni` VALUES ('001194', 'Piossasco', '001', NULL, '2023-02-27 18:49:07', 'G691');
INSERT INTO `comuni` VALUES ('001195', 'Piscina', '001', NULL, '2023-02-27 18:49:07', 'G705');
INSERT INTO `comuni` VALUES ('001196', 'Piverone', '001', NULL, '2023-02-27 18:49:07', 'G719');
INSERT INTO `comuni` VALUES ('001197', 'Poirino', '001', NULL, '2023-02-27 18:49:07', 'G777');
INSERT INTO `comuni` VALUES ('001198', 'Pomaretto', '001', NULL, '2023-02-27 18:49:07', 'G805');
INSERT INTO `comuni` VALUES ('001199', 'Pont-Canavese', '001', NULL, '2023-02-27 18:49:07', 'G826');
INSERT INTO `comuni` VALUES ('001200', 'Porte', '001', NULL, '2023-02-27 18:49:07', 'G900');
INSERT INTO `comuni` VALUES ('001201', 'Pragelato', '001', NULL, '2023-02-27 18:49:07', 'G973');
INSERT INTO `comuni` VALUES ('001202', 'Prali', '001', NULL, '2023-02-27 18:49:07', 'G978');
INSERT INTO `comuni` VALUES ('001203', 'Pralormo', '001', NULL, '2023-02-27 18:49:07', 'G979');
INSERT INTO `comuni` VALUES ('001204', 'Pramollo', '001', NULL, '2023-02-27 18:49:07', 'G982');
INSERT INTO `comuni` VALUES ('001205', 'Prarostino', '001', NULL, '2023-02-27 18:49:07', 'G986');
INSERT INTO `comuni` VALUES ('001206', 'Prascorsano', '001', NULL, '2023-02-27 18:49:07', 'G988');
INSERT INTO `comuni` VALUES ('001207', 'Pratiglione', '001', NULL, '2023-02-27 18:49:07', 'G997');
INSERT INTO `comuni` VALUES ('001208', 'Quagliuzzo', '001', NULL, '2023-02-27 18:49:07', 'H100');
INSERT INTO `comuni` VALUES ('001209', 'Quassolo', '001', NULL, '2023-02-27 18:49:07', 'H120');
INSERT INTO `comuni` VALUES ('001210', 'Quincinetto', '001', NULL, '2023-02-27 18:49:07', 'H127');
INSERT INTO `comuni` VALUES ('001211', 'Reano', '001', NULL, '2023-02-27 18:49:07', 'H207');
INSERT INTO `comuni` VALUES ('001212', 'Ribordone', '001', NULL, '2023-02-27 18:49:07', 'H270');
INSERT INTO `comuni` VALUES ('001213', 'Rivalba', '001', NULL, '2023-02-27 18:49:07', 'H333');
INSERT INTO `comuni` VALUES ('001214', 'Rivalta di Torino', '001', NULL, '2023-02-27 18:49:07', 'H335');
INSERT INTO `comuni` VALUES ('001215', 'Riva presso Chieri', '001', NULL, '2023-02-27 18:49:07', 'H337');
INSERT INTO `comuni` VALUES ('001216', 'Rivara', '001', NULL, '2023-02-27 18:49:07', 'H338');
INSERT INTO `comuni` VALUES ('001217', 'Rivarolo Canavese', '001', NULL, '2023-02-27 18:49:07', 'H340');
INSERT INTO `comuni` VALUES ('001218', 'Rivarossa', '001', NULL, '2023-02-27 18:49:07', 'H344');
INSERT INTO `comuni` VALUES ('001219', 'Rivoli', '001', NULL, '2023-02-27 18:49:07', 'H355');
INSERT INTO `comuni` VALUES ('001220', 'Robassomero', '001', NULL, '2023-02-27 18:49:07', 'H367');
INSERT INTO `comuni` VALUES ('001221', 'Rocca Canavese', '001', NULL, '2023-02-27 18:49:07', 'H386');
INSERT INTO `comuni` VALUES ('001222', 'Roletto', '001', NULL, '2023-02-27 18:49:07', 'H498');
INSERT INTO `comuni` VALUES ('001223', 'Romano Canavese', '001', NULL, '2023-02-27 18:49:07', 'H511');
INSERT INTO `comuni` VALUES ('001224', 'Ronco Canavese', '001', NULL, '2023-02-27 18:49:07', 'H539');
INSERT INTO `comuni` VALUES ('001225', 'Rondissone', '001', NULL, '2023-02-27 18:49:07', 'H547');
INSERT INTO `comuni` VALUES ('001226', 'Rorà', '001', NULL, '2023-02-27 18:49:07', 'H554');
INSERT INTO `comuni` VALUES ('001227', 'Roure', '001', NULL, '2023-02-27 18:49:07', 'H555');
INSERT INTO `comuni` VALUES ('001228', 'Rosta', '001', NULL, '2023-02-27 18:49:07', 'H583');
INSERT INTO `comuni` VALUES ('001229', 'Rubiana', '001', NULL, '2023-02-27 18:49:07', 'H627');
INSERT INTO `comuni` VALUES ('001230', 'Rueglio', '001', NULL, '2023-02-27 18:49:07', 'H631');
INSERT INTO `comuni` VALUES ('001231', 'Salassa', '001', NULL, '2023-02-27 18:49:07', 'H691');
INSERT INTO `comuni` VALUES ('001232', 'Salbertrand', '001', NULL, '2023-02-27 18:49:07', 'H684');
INSERT INTO `comuni` VALUES ('001233', 'Salerano Canavese', '001', NULL, '2023-02-27 18:49:07', 'H702');
INSERT INTO `comuni` VALUES ('001234', 'Salza di Pinerolo', '001', NULL, '2023-02-27 18:49:07', 'H734');
INSERT INTO `comuni` VALUES ('001235', 'Samone', '001', NULL, '2023-02-27 18:49:07', 'H753');
INSERT INTO `comuni` VALUES ('001236', 'San Benigno Canavese', '001', NULL, '2023-02-27 18:49:07', 'H775');
INSERT INTO `comuni` VALUES ('001237', 'San Carlo Canavese', '001', NULL, '2023-02-27 18:49:07', 'H789');
INSERT INTO `comuni` VALUES ('001238', 'San Colombano Belmonte', '001', NULL, '2023-02-27 18:49:07', 'H804');
INSERT INTO `comuni` VALUES ('001239', 'San Didero', '001', NULL, '2023-02-27 18:49:07', 'H820');
INSERT INTO `comuni` VALUES ('001240', 'San Francesco al Campo', '001', NULL, '2023-02-27 18:49:07', 'H847');
INSERT INTO `comuni` VALUES ('001241', 'Sangano', '001', NULL, '2023-02-27 18:49:07', 'H855');
INSERT INTO `comuni` VALUES ('001242', 'San Germano Chisone', '001', NULL, '2023-02-27 18:49:07', 'H862');
INSERT INTO `comuni` VALUES ('001243', 'San Gillio', '001', NULL, '2023-02-27 18:49:07', 'H873');
INSERT INTO `comuni` VALUES ('001244', 'San Giorgio Canavese', '001', NULL, '2023-02-27 18:49:07', 'H890');
INSERT INTO `comuni` VALUES ('001245', 'San Giorio di Susa', '001', NULL, '2023-02-27 18:49:07', 'H900');
INSERT INTO `comuni` VALUES ('001246', 'San Giusto Canavese', '001', NULL, '2023-02-27 18:49:07', 'H936');
INSERT INTO `comuni` VALUES ('001247', 'San Martino Canavese', '001', NULL, '2023-02-27 18:49:07', 'H997');
INSERT INTO `comuni` VALUES ('001248', 'San Maurizio Canavese', '001', NULL, '2023-02-27 18:49:07', 'I024');
INSERT INTO `comuni` VALUES ('001249', 'San Mauro Torinese', '001', NULL, '2023-02-27 18:49:07', 'I030');
INSERT INTO `comuni` VALUES ('001250', 'San Pietro Val Lemina', '001', NULL, '2023-02-27 18:49:07', 'I090');
INSERT INTO `comuni` VALUES ('001251', 'San Ponso', '001', NULL, '2023-02-27 18:49:07', 'I126');
INSERT INTO `comuni` VALUES ('001252', 'San Raffaele Cimena', '001', NULL, '2023-02-27 18:49:07', 'I137');
INSERT INTO `comuni` VALUES ('001253', 'San Sebastiano da Po', '001', NULL, '2023-02-27 18:49:07', 'I152');
INSERT INTO `comuni` VALUES ('001254', 'San Secondo di Pinerolo', '001', NULL, '2023-02-27 18:49:07', 'I154');
INSERT INTO `comuni` VALUES ('001255', 'Sant\'Ambrogio di Torino', '001', NULL, '2023-02-27 18:49:07', 'I258');
INSERT INTO `comuni` VALUES ('001256', 'Sant\'Antonino di Susa', '001', NULL, '2023-02-27 18:49:07', 'I296');
INSERT INTO `comuni` VALUES ('001257', 'Santena', '001', NULL, '2023-02-27 18:49:07', 'I327');
INSERT INTO `comuni` VALUES ('001258', 'Sauze di Cesana', '001', NULL, '2023-02-27 18:49:07', 'I465');
INSERT INTO `comuni` VALUES ('001259', 'Sauze d\'Oulx', '001', NULL, '2023-02-27 18:49:07', 'I466');
INSERT INTO `comuni` VALUES ('001260', 'Scalenghe', '001', NULL, '2023-02-27 18:49:07', 'I490');
INSERT INTO `comuni` VALUES ('001261', 'Scarmagno', '001', NULL, '2023-02-27 18:49:07', 'I511');
INSERT INTO `comuni` VALUES ('001262', 'Sciolze', '001', NULL, '2023-02-27 18:49:07', 'I539');
INSERT INTO `comuni` VALUES ('001263', 'Sestriere', '001', NULL, '2023-02-27 18:49:07', 'I692');
INSERT INTO `comuni` VALUES ('001264', 'Settimo Rottaro', '001', NULL, '2023-02-27 18:49:07', 'I701');
INSERT INTO `comuni` VALUES ('001265', 'Settimo Torinese', '001', NULL, '2023-02-27 18:49:07', 'I703');
INSERT INTO `comuni` VALUES ('001266', 'Settimo Vittone', '001', NULL, '2023-02-27 18:49:07', 'I702');
INSERT INTO `comuni` VALUES ('001267', 'Sparone', '001', NULL, '2023-02-27 18:49:07', 'I886');
INSERT INTO `comuni` VALUES ('001268', 'Strambinello', '001', NULL, '2023-02-27 18:49:07', 'I969');
INSERT INTO `comuni` VALUES ('001269', 'Strambino', '001', NULL, '2023-02-27 18:49:07', 'I970');
INSERT INTO `comuni` VALUES ('001270', 'Susa', '001', NULL, '2023-02-27 18:49:07', 'L013');
INSERT INTO `comuni` VALUES ('001271', 'Tavagnasco', '001', NULL, '2023-02-27 18:49:07', 'L066');
INSERT INTO `comuni` VALUES ('001272', 'Torino', '001', NULL, '2023-02-27 18:49:07', 'L219');
INSERT INTO `comuni` VALUES ('001273', 'Torrazza Piemonte', '001', NULL, '2023-02-27 18:49:07', 'L238');
INSERT INTO `comuni` VALUES ('001274', 'Torre Canavese', '001', NULL, '2023-02-27 18:49:07', 'L247');
INSERT INTO `comuni` VALUES ('001275', 'Torre Pellice', '001', NULL, '2023-02-27 18:49:07', 'L277');
INSERT INTO `comuni` VALUES ('001276', 'Trana', '001', NULL, '2023-02-27 18:49:07', 'L327');
INSERT INTO `comuni` VALUES ('001277', 'Trausella', '001', NULL, '2023-02-27 18:49:07', 'L338');
INSERT INTO `comuni` VALUES ('001278', 'Traversella', '001', NULL, '2023-02-27 18:49:07', 'L345');
INSERT INTO `comuni` VALUES ('001279', 'Traves', '001', NULL, '2023-02-27 18:49:07', 'L340');
INSERT INTO `comuni` VALUES ('001280', 'Trofarello', '001', NULL, '2023-02-27 18:49:07', 'L445');
INSERT INTO `comuni` VALUES ('001281', 'Usseaux', '001', NULL, '2023-02-27 18:49:07', 'L515');
INSERT INTO `comuni` VALUES ('001282', 'Usseglio', '001', NULL, '2023-02-27 18:49:07', 'L516');
INSERT INTO `comuni` VALUES ('001283', 'Vaie', '001', NULL, '2023-02-27 18:49:07', 'L538');
INSERT INTO `comuni` VALUES ('001284', 'Val della Torre', '001', NULL, '2023-02-27 18:49:07', 'L555');
INSERT INTO `comuni` VALUES ('001285', 'Valgioie', '001', NULL, '2023-02-27 18:49:07', 'L578');
INSERT INTO `comuni` VALUES ('001286', 'Vallo Torinese', '001', NULL, '2023-02-27 18:49:07', 'L629');
INSERT INTO `comuni` VALUES ('001287', 'Valperga', '001', NULL, '2023-02-27 18:49:07', 'L644');
INSERT INTO `comuni` VALUES ('001288', 'Valprato Soana', '001', NULL, '2023-02-27 18:49:07', 'B510');
INSERT INTO `comuni` VALUES ('001289', 'Varisella', '001', NULL, '2023-02-27 18:49:07', 'L685');
INSERT INTO `comuni` VALUES ('001290', 'Vauda Canavese', '001', NULL, '2023-02-27 18:49:07', 'L698');
INSERT INTO `comuni` VALUES ('001291', 'Venaus', '001', NULL, '2023-02-27 18:49:07', 'L726');
INSERT INTO `comuni` VALUES ('001292', 'Venaria Reale', '001', NULL, '2023-02-27 18:49:07', 'L727');
INSERT INTO `comuni` VALUES ('001293', 'Verolengo', '001', NULL, '2023-02-27 18:49:07', 'L779');
INSERT INTO `comuni` VALUES ('001294', 'Verrua Savoia', '001', NULL, '2023-02-27 18:49:07', 'L787');
INSERT INTO `comuni` VALUES ('001295', 'Vestignè', '001', NULL, '2023-02-27 18:49:07', 'L811');
INSERT INTO `comuni` VALUES ('001296', 'Vialfrè', '001', NULL, '2023-02-27 18:49:07', 'L830');
INSERT INTO `comuni` VALUES ('001297', 'Vico Canavese', '001', NULL, '2023-02-27 18:49:07', 'L548');
INSERT INTO `comuni` VALUES ('001298', 'Vidracco', '001', NULL, '2023-02-27 18:49:07', 'L857');
INSERT INTO `comuni` VALUES ('001299', 'Vigone', '001', NULL, '2023-02-27 18:49:07', 'L898');
INSERT INTO `comuni` VALUES ('001300', 'Villafranca Piemonte', '001', NULL, '2023-02-27 18:49:07', 'L948');
INSERT INTO `comuni` VALUES ('001301', 'Villanova Canavese', '001', NULL, '2023-02-27 18:49:07', 'L982');
INSERT INTO `comuni` VALUES ('001302', 'Villarbasse', '001', NULL, '2023-02-27 18:49:07', 'M002');
INSERT INTO `comuni` VALUES ('001303', 'Villar Dora', '001', NULL, '2023-02-27 18:49:07', 'L999');
INSERT INTO `comuni` VALUES ('001304', 'Villareggia', '001', NULL, '2023-02-27 18:49:07', 'M004');
INSERT INTO `comuni` VALUES ('001305', 'Villar Focchiardo', '001', NULL, '2023-02-27 18:49:07', 'M007');
INSERT INTO `comuni` VALUES ('001306', 'Villar Pellice', '001', NULL, '2023-02-27 18:49:07', 'M013');
INSERT INTO `comuni` VALUES ('001307', 'Villar Perosa', '001', NULL, '2023-02-27 18:49:07', 'M014');
INSERT INTO `comuni` VALUES ('001308', 'Villastellone', '001', NULL, '2023-02-27 18:49:07', 'M027');
INSERT INTO `comuni` VALUES ('001309', 'Vinovo', '001', NULL, '2023-02-27 18:49:07', 'M060');
INSERT INTO `comuni` VALUES ('001310', 'Virle Piemonte', '001', NULL, '2023-02-27 18:49:07', 'M069');
INSERT INTO `comuni` VALUES ('001311', 'Vische', '001', NULL, '2023-02-27 18:49:07', 'M071');
INSERT INTO `comuni` VALUES ('001312', 'Vistrorio', '001', NULL, '2023-02-27 18:49:07', 'M080');
INSERT INTO `comuni` VALUES ('001313', 'Viù', '001', NULL, '2023-02-27 18:49:07', 'M094');
INSERT INTO `comuni` VALUES ('001314', 'Volpiano', '001', NULL, '2023-02-27 18:49:07', 'M122');
INSERT INTO `comuni` VALUES ('001315', 'Volvera', '001', NULL, '2023-02-27 18:49:07', 'M133');
INSERT INTO `comuni` VALUES ('002002', 'Alagna Valsesia', '002', NULL, '2023-02-27 18:49:07', 'A119');
INSERT INTO `comuni` VALUES ('002003', 'Albano Vercellese', '002', NULL, '2023-02-27 18:49:07', 'A130');
INSERT INTO `comuni` VALUES ('002004', 'Alice Castello', '002', NULL, '2023-02-27 18:49:07', 'A198');
INSERT INTO `comuni` VALUES ('002006', 'Arborio', '002', NULL, '2023-02-27 18:49:07', 'A358');
INSERT INTO `comuni` VALUES ('002007', 'Asigliano Vercellese', '002', NULL, '2023-02-27 18:49:07', 'A466');
INSERT INTO `comuni` VALUES ('002008', 'Balmuccia', '002', NULL, '2023-02-27 18:49:07', 'A600');
INSERT INTO `comuni` VALUES ('002009', 'Balocco', '002', NULL, '2023-02-27 18:49:07', 'A601');
INSERT INTO `comuni` VALUES ('002011', 'Bianzè', '002', NULL, '2023-02-27 18:49:07', 'A847');
INSERT INTO `comuni` VALUES ('002014', 'Boccioleto', '002', NULL, '2023-02-27 18:49:07', 'A914');
INSERT INTO `comuni` VALUES ('002015', 'Borgo d\'Ale', '002', NULL, '2023-02-27 18:49:07', 'B009');
INSERT INTO `comuni` VALUES ('002016', 'Borgosesia', '002', NULL, '2023-02-27 18:49:07', 'B041');
INSERT INTO `comuni` VALUES ('002017', 'Borgo Vercelli', '002', NULL, '2023-02-27 18:49:07', 'B046');
INSERT INTO `comuni` VALUES ('002019', 'Breia', '002', NULL, '2023-02-27 18:49:07', 'B136');
INSERT INTO `comuni` VALUES ('002021', 'Buronzo', '002', NULL, '2023-02-27 18:49:07', 'B280');
INSERT INTO `comuni` VALUES ('002025', 'Campertogno', '002', NULL, '2023-02-27 18:49:07', 'B505');
INSERT INTO `comuni` VALUES ('002029', 'Carcoforo', '002', NULL, '2023-02-27 18:49:07', 'B752');
INSERT INTO `comuni` VALUES ('002030', 'Caresana', '002', NULL, '2023-02-27 18:49:07', 'B767');
INSERT INTO `comuni` VALUES ('002031', 'Caresanablot', '002', NULL, '2023-02-27 18:49:07', 'B768');
INSERT INTO `comuni` VALUES ('002032', 'Carisio', '002', NULL, '2023-02-27 18:49:07', 'B782');
INSERT INTO `comuni` VALUES ('002033', 'Casanova Elvo', '002', NULL, '2023-02-27 18:49:07', 'B928');
INSERT INTO `comuni` VALUES ('002035', 'San Giacomo Vercellese', '002', NULL, '2023-02-27 18:49:07', 'B952');
INSERT INTO `comuni` VALUES ('002038', 'Cellio', '002', NULL, '2023-02-27 18:49:07', 'C450');
INSERT INTO `comuni` VALUES ('002041', 'Cervatto', '002', NULL, '2023-02-27 18:49:07', 'C548');
INSERT INTO `comuni` VALUES ('002042', 'Cigliano', '002', NULL, '2023-02-27 18:49:07', 'C680');
INSERT INTO `comuni` VALUES ('002043', 'Civiasco', '002', NULL, '2023-02-27 18:49:07', 'C757');
INSERT INTO `comuni` VALUES ('002045', 'Collobiano', '002', NULL, '2023-02-27 18:49:07', 'C884');
INSERT INTO `comuni` VALUES ('002047', 'Costanzana', '002', NULL, '2023-02-27 18:49:07', 'D113');
INSERT INTO `comuni` VALUES ('002048', 'Cravagliana', '002', NULL, '2023-02-27 18:49:07', 'D132');
INSERT INTO `comuni` VALUES ('002049', 'Crescentino', '002', NULL, '2023-02-27 18:49:07', 'D154');
INSERT INTO `comuni` VALUES ('002052', 'Crova', '002', NULL, '2023-02-27 18:49:07', 'D187');
INSERT INTO `comuni` VALUES ('002054', 'Desana', '002', NULL, '2023-02-27 18:49:07', 'D281');
INSERT INTO `comuni` VALUES ('002057', 'Fobello', '002', NULL, '2023-02-27 18:49:07', 'D641');
INSERT INTO `comuni` VALUES ('002058', 'Fontanetto Po', '002', NULL, '2023-02-27 18:49:07', 'D676');
INSERT INTO `comuni` VALUES ('002059', 'Formigliana', '002', NULL, '2023-02-27 18:49:07', 'D712');
INSERT INTO `comuni` VALUES ('002061', 'Gattinara', '002', NULL, '2023-02-27 18:49:07', 'D938');
INSERT INTO `comuni` VALUES ('002062', 'Ghislarengo', '002', NULL, '2023-02-27 18:49:07', 'E007');
INSERT INTO `comuni` VALUES ('002065', 'Greggio', '002', NULL, '2023-02-27 18:49:07', 'E163');
INSERT INTO `comuni` VALUES ('002066', 'Guardabosone', '002', NULL, '2023-02-27 18:49:07', 'E237');
INSERT INTO `comuni` VALUES ('002067', 'Lamporo', '002', NULL, '2023-02-27 18:49:07', 'E433');
INSERT INTO `comuni` VALUES ('002068', 'Lenta', '002', NULL, '2023-02-27 18:49:07', 'E528');
INSERT INTO `comuni` VALUES ('002070', 'Lignana', '002', NULL, '2023-02-27 18:49:07', 'E583');
INSERT INTO `comuni` VALUES ('002071', 'Livorno Ferraris', '002', NULL, '2023-02-27 18:49:07', 'E626');
INSERT INTO `comuni` VALUES ('002072', 'Lozzolo', '002', NULL, '2023-02-27 18:49:07', 'E711');
INSERT INTO `comuni` VALUES ('002078', 'Mollia', '002', NULL, '2023-02-27 18:49:07', 'F297');
INSERT INTO `comuni` VALUES ('002079', 'Moncrivello', '002', NULL, '2023-02-27 18:49:07', 'F342');
INSERT INTO `comuni` VALUES ('002082', 'Motta de\' Conti', '002', NULL, '2023-02-27 18:49:07', 'F774');
INSERT INTO `comuni` VALUES ('002088', 'Olcenengo', '002', NULL, '2023-02-27 18:49:07', 'G016');
INSERT INTO `comuni` VALUES ('002089', 'Oldenico', '002', NULL, '2023-02-27 18:49:07', 'G018');
INSERT INTO `comuni` VALUES ('002090', 'Palazzolo Vercellese', '002', NULL, '2023-02-27 18:49:07', 'G266');
INSERT INTO `comuni` VALUES ('002091', 'Pertengo', '002', NULL, '2023-02-27 18:49:07', 'G471');
INSERT INTO `comuni` VALUES ('002093', 'Pezzana', '002', NULL, '2023-02-27 18:49:07', 'G528');
INSERT INTO `comuni` VALUES ('002096', 'Pila', '002', NULL, '2023-02-27 18:49:07', 'G666');
INSERT INTO `comuni` VALUES ('002097', 'Piode', '002', NULL, '2023-02-27 18:49:07', 'G685');
INSERT INTO `comuni` VALUES ('002102', 'Postua', '002', NULL, '2023-02-27 18:49:07', 'G940');
INSERT INTO `comuni` VALUES ('002104', 'Prarolo', '002', NULL, '2023-02-27 18:49:07', 'G985');
INSERT INTO `comuni` VALUES ('002107', 'Quarona', '002', NULL, '2023-02-27 18:49:07', 'H108');
INSERT INTO `comuni` VALUES ('002108', 'Quinto Vercellese', '002', NULL, '2023-02-27 18:49:07', 'H132');
INSERT INTO `comuni` VALUES ('002110', 'Rassa', '002', NULL, '2023-02-27 18:49:07', 'H188');
INSERT INTO `comuni` VALUES ('002111', 'Rima San Giuseppe', '002', NULL, '2023-02-27 18:49:07', 'H291');
INSERT INTO `comuni` VALUES ('002112', 'Rimasco', '002', NULL, '2023-02-27 18:49:07', 'H292');
INSERT INTO `comuni` VALUES ('002113', 'Rimella', '002', NULL, '2023-02-27 18:49:07', 'H293');
INSERT INTO `comuni` VALUES ('002114', 'Riva Valdobbia', '002', NULL, '2023-02-27 18:49:07', 'H329');
INSERT INTO `comuni` VALUES ('002115', 'Rive', '002', NULL, '2023-02-27 18:49:07', 'H346');
INSERT INTO `comuni` VALUES ('002116', 'Roasio', '002', NULL, '2023-02-27 18:49:07', 'H365');
INSERT INTO `comuni` VALUES ('002118', 'Ronsecco', '002', NULL, '2023-02-27 18:49:07', 'H549');
INSERT INTO `comuni` VALUES ('002121', 'Rossa', '002', NULL, '2023-02-27 18:49:07', 'H577');
INSERT INTO `comuni` VALUES ('002122', 'Rovasenda', '002', NULL, '2023-02-27 18:49:07', 'H364');
INSERT INTO `comuni` VALUES ('002123', 'Sabbia', '002', NULL, '2023-02-27 18:49:07', 'H648');
INSERT INTO `comuni` VALUES ('002126', 'Salasco', '002', NULL, '2023-02-27 18:49:07', 'H690');
INSERT INTO `comuni` VALUES ('002127', 'Sali Vercellese', '002', NULL, '2023-02-27 18:49:07', 'H707');
INSERT INTO `comuni` VALUES ('002128', 'Saluggia', '002', NULL, '2023-02-27 18:49:07', 'H725');
INSERT INTO `comuni` VALUES ('002131', 'San Germano Vercellese', '002', NULL, '2023-02-27 18:49:07', 'H861');
INSERT INTO `comuni` VALUES ('002133', 'Santhià', '002', NULL, '2023-02-27 18:49:07', 'I337');
INSERT INTO `comuni` VALUES ('002134', 'Scopa', '002', NULL, '2023-02-27 18:49:07', 'I544');
INSERT INTO `comuni` VALUES ('002135', 'Scopello', '002', NULL, '2023-02-27 18:49:07', 'I545');
INSERT INTO `comuni` VALUES ('002137', 'Serravalle Sesia', '002', NULL, '2023-02-27 18:49:07', 'I663');
INSERT INTO `comuni` VALUES ('002142', 'Stroppiana', '002', NULL, '2023-02-27 18:49:07', 'I984');
INSERT INTO `comuni` VALUES ('002147', 'Tricerro', '002', NULL, '2023-02-27 18:49:07', 'L420');
INSERT INTO `comuni` VALUES ('002148', 'Trino', '002', NULL, '2023-02-27 18:49:07', 'L429');
INSERT INTO `comuni` VALUES ('002150', 'Tronzano Vercellese', '002', NULL, '2023-02-27 18:49:07', 'L451');
INSERT INTO `comuni` VALUES ('002152', 'Valduggia', '002', NULL, '2023-02-27 18:49:07', 'L566');
INSERT INTO `comuni` VALUES ('002156', 'Varallo', '002', NULL, '2023-02-27 18:49:07', 'L669');
INSERT INTO `comuni` VALUES ('002158', 'Vercelli', '002', NULL, '2023-02-27 18:49:07', 'L750');
INSERT INTO `comuni` VALUES ('002163', 'Villarboit', '002', NULL, '2023-02-27 18:49:07', 'M003');
INSERT INTO `comuni` VALUES ('002164', 'Villata', '002', NULL, '2023-02-27 18:49:07', 'M028');
INSERT INTO `comuni` VALUES ('002166', 'Vocca', '002', NULL, '2023-02-27 18:49:07', 'M106');
INSERT INTO `comuni` VALUES ('003001', 'Agrate Conturbia', '003', NULL, '2023-02-27 18:49:07', 'A088');
INSERT INTO `comuni` VALUES ('003002', 'Ameno', '003', NULL, '2023-02-27 18:49:07', 'A264');
INSERT INTO `comuni` VALUES ('003006', 'Armeno', '003', NULL, '2023-02-27 18:49:07', 'A414');
INSERT INTO `comuni` VALUES ('003008', 'Arona', '003', NULL, '2023-02-27 18:49:07', 'A429');
INSERT INTO `comuni` VALUES ('003012', 'Barengo', '003', NULL, '2023-02-27 18:49:07', 'A653');
INSERT INTO `comuni` VALUES ('003016', 'Bellinzago Novarese', '003', NULL, '2023-02-27 18:49:07', 'A752');
INSERT INTO `comuni` VALUES ('003018', 'Biandrate', '003', NULL, '2023-02-27 18:49:07', 'A844');
INSERT INTO `comuni` VALUES ('003019', 'Boca', '003', NULL, '2023-02-27 18:49:07', 'A911');
INSERT INTO `comuni` VALUES ('003021', 'Bogogno', '003', NULL, '2023-02-27 18:49:07', 'A929');
INSERT INTO `comuni` VALUES ('003022', 'Bolzano Novarese', '003', NULL, '2023-02-27 18:49:07', 'A953');
INSERT INTO `comuni` VALUES ('003023', 'Borgolavezzaro', '003', NULL, '2023-02-27 18:49:07', 'B016');
INSERT INTO `comuni` VALUES ('003024', 'Borgomanero', '003', NULL, '2023-02-27 18:49:07', 'B019');
INSERT INTO `comuni` VALUES ('003025', 'Borgo Ticino', '003', NULL, '2023-02-27 18:49:07', 'B043');
INSERT INTO `comuni` VALUES ('003026', 'Briga Novarese', '003', NULL, '2023-02-27 18:49:07', 'B176');
INSERT INTO `comuni` VALUES ('003027', 'Briona', '003', NULL, '2023-02-27 18:49:07', 'B183');
INSERT INTO `comuni` VALUES ('003030', 'Caltignaga', '003', NULL, '2023-02-27 18:49:07', 'B431');
INSERT INTO `comuni` VALUES ('003032', 'Cameri', '003', NULL, '2023-02-27 18:49:07', 'B473');
INSERT INTO `comuni` VALUES ('003036', 'Carpignano Sesia', '003', NULL, '2023-02-27 18:49:07', 'B823');
INSERT INTO `comuni` VALUES ('003037', 'Casalbeltrame', '003', NULL, '2023-02-27 18:49:07', 'B864');
INSERT INTO `comuni` VALUES ('003039', 'Casaleggio Novara', '003', NULL, '2023-02-27 18:49:07', 'B883');
INSERT INTO `comuni` VALUES ('003040', 'Casalino', '003', NULL, '2023-02-27 18:49:07', 'B897');
INSERT INTO `comuni` VALUES ('003041', 'Casalvolone', '003', NULL, '2023-02-27 18:49:07', 'B920');
INSERT INTO `comuni` VALUES ('003042', 'Castellazzo Novarese', '003', NULL, '2023-02-27 18:49:07', 'C149');
INSERT INTO `comuni` VALUES ('003043', 'Castelletto sopra Ticino', '003', NULL, '2023-02-27 18:49:07', 'C166');
INSERT INTO `comuni` VALUES ('003044', 'Cavaglietto', '003', NULL, '2023-02-27 18:49:07', 'C364');
INSERT INTO `comuni` VALUES ('003045', 'Cavaglio d\'Agogna', '003', NULL, '2023-02-27 18:49:07', 'C365');
INSERT INTO `comuni` VALUES ('003047', 'Cavallirio', '003', NULL, '2023-02-27 18:49:07', 'C378');
INSERT INTO `comuni` VALUES ('003049', 'Cerano', '003', NULL, '2023-02-27 18:49:07', 'C483');
INSERT INTO `comuni` VALUES ('003051', 'Colazza', '003', NULL, '2023-02-27 18:49:07', 'C829');
INSERT INTO `comuni` VALUES ('003052', 'Comignago', '003', NULL, '2023-02-27 18:49:07', 'C926');
INSERT INTO `comuni` VALUES ('003055', 'Cressa', '003', NULL, '2023-02-27 18:49:07', 'D162');
INSERT INTO `comuni` VALUES ('003058', 'Cureggio', '003', NULL, '2023-02-27 18:49:07', 'D216');
INSERT INTO `comuni` VALUES ('003060', 'Divignano', '003', NULL, '2023-02-27 18:49:07', 'D309');
INSERT INTO `comuni` VALUES ('003062', 'Dormelletto', '003', NULL, '2023-02-27 18:49:07', 'D347');
INSERT INTO `comuni` VALUES ('003065', 'Fara Novarese', '003', NULL, '2023-02-27 18:49:07', 'D492');
INSERT INTO `comuni` VALUES ('003066', 'Fontaneto d\'Agogna', '003', NULL, '2023-02-27 18:49:07', 'D675');
INSERT INTO `comuni` VALUES ('003068', 'Galliate', '003', NULL, '2023-02-27 18:49:07', 'D872');
INSERT INTO `comuni` VALUES ('003069', 'Garbagna Novarese', '003', NULL, '2023-02-27 18:49:07', 'D911');
INSERT INTO `comuni` VALUES ('003070', 'Gargallo', '003', NULL, '2023-02-27 18:49:07', 'D921');
INSERT INTO `comuni` VALUES ('003071', 'Gattico', '003', NULL, '2023-02-27 18:49:07', 'D937');
INSERT INTO `comuni` VALUES ('003073', 'Ghemme', '003', NULL, '2023-02-27 18:49:07', 'E001');
INSERT INTO `comuni` VALUES ('003076', 'Gozzano', '003', NULL, '2023-02-27 18:49:07', 'E120');
INSERT INTO `comuni` VALUES ('003077', 'Granozzo con Monticello', '003', NULL, '2023-02-27 18:49:07', 'E143');
INSERT INTO `comuni` VALUES ('003079', 'Grignasco', '003', NULL, '2023-02-27 18:49:07', 'E177');
INSERT INTO `comuni` VALUES ('003082', 'Invorio', '003', NULL, '2023-02-27 18:49:07', 'E314');
INSERT INTO `comuni` VALUES ('003083', 'Landiona', '003', NULL, '2023-02-27 18:49:07', 'E436');
INSERT INTO `comuni` VALUES ('003084', 'Lesa', '003', NULL, '2023-02-27 18:49:07', 'E544');
INSERT INTO `comuni` VALUES ('003088', 'Maggiora', '003', NULL, '2023-02-27 18:49:07', 'E803');
INSERT INTO `comuni` VALUES ('003090', 'Mandello Vitta', '003', NULL, '2023-02-27 18:49:07', 'E880');
INSERT INTO `comuni` VALUES ('003091', 'Marano Ticino', '003', NULL, '2023-02-27 18:49:07', 'E907');
INSERT INTO `comuni` VALUES ('003093', 'Massino Visconti', '003', NULL, '2023-02-27 18:49:07', 'F047');
INSERT INTO `comuni` VALUES ('003095', 'Meina', '003', NULL, '2023-02-27 18:49:07', 'F093');
INSERT INTO `comuni` VALUES ('003097', 'Mezzomerico', '003', NULL, '2023-02-27 18:49:07', 'F188');
INSERT INTO `comuni` VALUES ('003098', 'Miasino', '003', NULL, '2023-02-27 18:49:07', 'F191');
INSERT INTO `comuni` VALUES ('003100', 'Momo', '003', NULL, '2023-02-27 18:49:07', 'F317');
INSERT INTO `comuni` VALUES ('003103', 'Nebbiuno', '003', NULL, '2023-02-27 18:49:07', 'F859');
INSERT INTO `comuni` VALUES ('003104', 'Nibbiola', '003', NULL, '2023-02-27 18:49:07', 'F886');
INSERT INTO `comuni` VALUES ('003106', 'Novara', '003', NULL, '2023-02-27 18:49:07', 'F952');
INSERT INTO `comuni` VALUES ('003108', 'Oleggio', '003', NULL, '2023-02-27 18:49:07', 'G019');
INSERT INTO `comuni` VALUES ('003109', 'Oleggio Castello', '003', NULL, '2023-02-27 18:49:07', 'G020');
INSERT INTO `comuni` VALUES ('003112', 'Orta San Giulio', '003', NULL, '2023-02-27 18:49:07', 'G134');
INSERT INTO `comuni` VALUES ('003114', 'Paruzzaro', '003', NULL, '2023-02-27 18:49:07', 'G349');
INSERT INTO `comuni` VALUES ('003115', 'Pella', '003', NULL, '2023-02-27 18:49:07', 'G421');
INSERT INTO `comuni` VALUES ('003116', 'Pettenasco', '003', NULL, '2023-02-27 18:49:07', 'G520');
INSERT INTO `comuni` VALUES ('003119', 'Pisano', '003', NULL, '2023-02-27 18:49:07', 'G703');
INSERT INTO `comuni` VALUES ('003120', 'Pogno', '003', NULL, '2023-02-27 18:49:07', 'G775');
INSERT INTO `comuni` VALUES ('003121', 'Pombia', '003', NULL, '2023-02-27 18:49:07', 'G809');
INSERT INTO `comuni` VALUES ('003122', 'Prato Sesia', '003', NULL, '2023-02-27 18:49:07', 'H001');
INSERT INTO `comuni` VALUES ('003129', 'Recetto', '003', NULL, '2023-02-27 18:49:07', 'H213');
INSERT INTO `comuni` VALUES ('003130', 'Romagnano Sesia', '003', NULL, '2023-02-27 18:49:07', 'H502');
INSERT INTO `comuni` VALUES ('003131', 'Romentino', '003', NULL, '2023-02-27 18:49:07', 'H518');
INSERT INTO `comuni` VALUES ('003133', 'San Maurizio d\'Opaglio', '003', NULL, '2023-02-27 18:49:07', 'I025');
INSERT INTO `comuni` VALUES ('003134', 'San Nazzaro Sesia', '003', NULL, '2023-02-27 18:49:07', 'I052');
INSERT INTO `comuni` VALUES ('003135', 'San Pietro Mosezzo', '003', NULL, '2023-02-27 18:49:07', 'I116');
INSERT INTO `comuni` VALUES ('003138', 'Sillavengo', '003', NULL, '2023-02-27 18:49:07', 'I736');
INSERT INTO `comuni` VALUES ('003139', 'Sizzano', '003', NULL, '2023-02-27 18:49:07', 'I767');
INSERT INTO `comuni` VALUES ('003140', 'Soriso', '003', NULL, '2023-02-27 18:49:07', 'I857');
INSERT INTO `comuni` VALUES ('003141', 'Sozzago', '003', NULL, '2023-02-27 18:49:07', 'I880');
INSERT INTO `comuni` VALUES ('003143', 'Suno', '003', NULL, '2023-02-27 18:49:07', 'L007');
INSERT INTO `comuni` VALUES ('003144', 'Terdobbiate', '003', NULL, '2023-02-27 18:49:07', 'L104');
INSERT INTO `comuni` VALUES ('003146', 'Tornaco', '003', NULL, '2023-02-27 18:49:07', 'L223');
INSERT INTO `comuni` VALUES ('003149', 'Trecate', '003', NULL, '2023-02-27 18:49:07', 'L356');
INSERT INTO `comuni` VALUES ('003153', 'Vaprio d\'Agogna', '003', NULL, '2023-02-27 18:49:07', 'L668');
INSERT INTO `comuni` VALUES ('003154', 'Varallo Pombia', '003', NULL, '2023-02-27 18:49:07', 'L670');
INSERT INTO `comuni` VALUES ('003157', 'Veruno', '003', NULL, '2023-02-27 18:49:07', 'L798');
INSERT INTO `comuni` VALUES ('003158', 'Vespolate', '003', NULL, '2023-02-27 18:49:07', 'L808');
INSERT INTO `comuni` VALUES ('003159', 'Vicolungo', '003', NULL, '2023-02-27 18:49:07', 'L847');
INSERT INTO `comuni` VALUES ('003164', 'Vinzaglio', '003', NULL, '2023-02-27 18:49:07', 'M062');
INSERT INTO `comuni` VALUES ('004001', 'Acceglio', '004', NULL, '2023-02-27 18:49:07', 'A016');
INSERT INTO `comuni` VALUES ('004002', 'Aisone', '004', NULL, '2023-02-27 18:49:07', 'A113');
INSERT INTO `comuni` VALUES ('004003', 'Alba', '004', NULL, '2023-02-27 18:49:07', 'A124');
INSERT INTO `comuni` VALUES ('004004', 'Albaretto della Torre', '004', NULL, '2023-02-27 18:49:07', 'A139');
INSERT INTO `comuni` VALUES ('004005', 'Alto', '004', NULL, '2023-02-27 18:49:07', 'A238');
INSERT INTO `comuni` VALUES ('004006', 'Argentera', '004', NULL, '2023-02-27 18:49:07', 'A394');
INSERT INTO `comuni` VALUES ('004007', 'Arguello', '004', NULL, '2023-02-27 18:49:07', 'A396');
INSERT INTO `comuni` VALUES ('004008', 'Bagnasco', '004', NULL, '2023-02-27 18:49:07', 'A555');
INSERT INTO `comuni` VALUES ('004009', 'Bagnolo Piemonte', '004', NULL, '2023-02-27 18:49:07', 'A571');
INSERT INTO `comuni` VALUES ('004010', 'Baldissero d\'Alba', '004', NULL, '2023-02-27 18:49:07', 'A589');
INSERT INTO `comuni` VALUES ('004011', 'Barbaresco', '004', NULL, '2023-02-27 18:49:07', 'A629');
INSERT INTO `comuni` VALUES ('004012', 'Barge', '004', NULL, '2023-02-27 18:49:07', 'A660');
INSERT INTO `comuni` VALUES ('004013', 'Barolo', '004', NULL, '2023-02-27 18:49:07', 'A671');
INSERT INTO `comuni` VALUES ('004014', 'Bastia Mondovì', '004', NULL, '2023-02-27 18:49:07', 'A709');
INSERT INTO `comuni` VALUES ('004015', 'Battifollo', '004', NULL, '2023-02-27 18:49:07', 'A716');
INSERT INTO `comuni` VALUES ('004016', 'Beinette', '004', NULL, '2023-02-27 18:49:07', 'A735');
INSERT INTO `comuni` VALUES ('004017', 'Bellino', '004', NULL, '2023-02-27 18:49:07', 'A750');
INSERT INTO `comuni` VALUES ('004018', 'Belvedere Langhe', '004', NULL, '2023-02-27 18:49:07', 'A774');
INSERT INTO `comuni` VALUES ('004019', 'Bene Vagienna', '004', NULL, '2023-02-27 18:49:07', 'A779');
INSERT INTO `comuni` VALUES ('004020', 'Benevello', '004', NULL, '2023-02-27 18:49:07', 'A782');
INSERT INTO `comuni` VALUES ('004021', 'Bergolo', '004', NULL, '2023-02-27 18:49:07', 'A798');
INSERT INTO `comuni` VALUES ('004022', 'Bernezzo', '004', NULL, '2023-02-27 18:49:07', 'A805');
INSERT INTO `comuni` VALUES ('004023', 'Bonvicino', '004', NULL, '2023-02-27 18:49:07', 'A979');
INSERT INTO `comuni` VALUES ('004024', 'Borgomale', '004', NULL, '2023-02-27 18:49:07', 'B018');
INSERT INTO `comuni` VALUES ('004025', 'Borgo San Dalmazzo', '004', NULL, '2023-02-27 18:49:07', 'B033');
INSERT INTO `comuni` VALUES ('004026', 'Bosia', '004', NULL, '2023-02-27 18:49:07', 'B079');
INSERT INTO `comuni` VALUES ('004027', 'Bossolasco', '004', NULL, '2023-02-27 18:49:07', 'B084');
INSERT INTO `comuni` VALUES ('004028', 'Boves', '004', NULL, '2023-02-27 18:49:07', 'B101');
INSERT INTO `comuni` VALUES ('004029', 'Bra', '004', NULL, '2023-02-27 18:49:07', 'B111');
INSERT INTO `comuni` VALUES ('004030', 'Briaglia', '004', NULL, '2023-02-27 18:49:07', 'B167');
INSERT INTO `comuni` VALUES ('004031', 'Briga Alta', '004', NULL, '2023-02-27 18:49:07', 'B175');
INSERT INTO `comuni` VALUES ('004032', 'Brondello', '004', NULL, '2023-02-27 18:49:07', 'B200');
INSERT INTO `comuni` VALUES ('004033', 'Brossasco', '004', NULL, '2023-02-27 18:49:07', 'B204');
INSERT INTO `comuni` VALUES ('004034', 'Busca', '004', NULL, '2023-02-27 18:49:07', 'B285');
INSERT INTO `comuni` VALUES ('004035', 'Camerana', '004', NULL, '2023-02-27 18:49:07', 'B467');
INSERT INTO `comuni` VALUES ('004036', 'Camo', '004', NULL, '2023-02-27 18:49:07', 'B489');
INSERT INTO `comuni` VALUES ('004037', 'Canale', '004', NULL, '2023-02-27 18:49:07', 'B573');
INSERT INTO `comuni` VALUES ('004038', 'Canosio', '004', NULL, '2023-02-27 18:49:07', 'B621');
INSERT INTO `comuni` VALUES ('004039', 'Caprauna', '004', NULL, '2023-02-27 18:49:07', 'B692');
INSERT INTO `comuni` VALUES ('004040', 'Caraglio', '004', NULL, '2023-02-27 18:49:07', 'B719');
INSERT INTO `comuni` VALUES ('004041', 'Caramagna Piemonte', '004', NULL, '2023-02-27 18:49:07', 'B720');
INSERT INTO `comuni` VALUES ('004042', 'Cardè', '004', NULL, '2023-02-27 18:49:07', 'B755');
INSERT INTO `comuni` VALUES ('004043', 'Carrù', '004', NULL, '2023-02-27 18:49:07', 'B841');
INSERT INTO `comuni` VALUES ('004044', 'Cartignano', '004', NULL, '2023-02-27 18:49:07', 'B845');
INSERT INTO `comuni` VALUES ('004045', 'Casalgrasso', '004', NULL, '2023-02-27 18:49:07', 'B894');
INSERT INTO `comuni` VALUES ('004046', 'Castagnito', '004', NULL, '2023-02-27 18:49:07', 'C046');
INSERT INTO `comuni` VALUES ('004047', 'Casteldelfino', '004', NULL, '2023-02-27 18:49:07', 'C081');
INSERT INTO `comuni` VALUES ('004048', 'Castellar', '004', NULL, '2023-02-27 18:49:07', 'C140');
INSERT INTO `comuni` VALUES ('004049', 'Castelletto Stura', '004', NULL, '2023-02-27 18:49:07', 'C165');
INSERT INTO `comuni` VALUES ('004050', 'Castelletto Uzzone', '004', NULL, '2023-02-27 18:49:07', 'C167');
INSERT INTO `comuni` VALUES ('004051', 'Castellinaldo', '004', NULL, '2023-02-27 18:49:07', 'C173');
INSERT INTO `comuni` VALUES ('004052', 'Castellino Tanaro', '004', NULL, '2023-02-27 18:49:07', 'C176');
INSERT INTO `comuni` VALUES ('004053', 'Castelmagno', '004', NULL, '2023-02-27 18:49:07', 'C205');
INSERT INTO `comuni` VALUES ('004054', 'Castelnuovo di Ceva', '004', NULL, '2023-02-27 18:49:07', 'C214');
INSERT INTO `comuni` VALUES ('004055', 'Castiglione Falletto', '004', NULL, '2023-02-27 18:49:07', 'C314');
INSERT INTO `comuni` VALUES ('004056', 'Castiglione Tinella', '004', NULL, '2023-02-27 18:49:07', 'C317');
INSERT INTO `comuni` VALUES ('004057', 'Castino', '004', NULL, '2023-02-27 18:49:07', 'C323');
INSERT INTO `comuni` VALUES ('004058', 'Cavallerleone', '004', NULL, '2023-02-27 18:49:07', 'C375');
INSERT INTO `comuni` VALUES ('004059', 'Cavallermaggiore', '004', NULL, '2023-02-27 18:49:07', 'C376');
INSERT INTO `comuni` VALUES ('004060', 'Celle di Macra', '004', NULL, '2023-02-27 18:49:07', 'C441');
INSERT INTO `comuni` VALUES ('004061', 'Centallo', '004', NULL, '2023-02-27 18:49:07', 'C466');
INSERT INTO `comuni` VALUES ('004062', 'Ceresole Alba', '004', NULL, '2023-02-27 18:49:07', 'C504');
INSERT INTO `comuni` VALUES ('004063', 'Cerretto Langhe', '004', NULL, '2023-02-27 18:49:07', 'C530');
INSERT INTO `comuni` VALUES ('004064', 'Cervasca', '004', NULL, '2023-02-27 18:49:07', 'C547');
INSERT INTO `comuni` VALUES ('004065', 'Cervere', '004', NULL, '2023-02-27 18:49:07', 'C550');
INSERT INTO `comuni` VALUES ('004066', 'Ceva', '004', NULL, '2023-02-27 18:49:07', 'C589');
INSERT INTO `comuni` VALUES ('004067', 'Cherasco', '004', NULL, '2023-02-27 18:49:07', 'C599');
INSERT INTO `comuni` VALUES ('004068', 'Chiusa di Pesio', '004', NULL, '2023-02-27 18:49:07', 'C653');
INSERT INTO `comuni` VALUES ('004069', 'Cigliè', '004', NULL, '2023-02-27 18:49:07', 'C681');
INSERT INTO `comuni` VALUES ('004070', 'Cissone', '004', NULL, '2023-02-27 18:49:07', 'C738');
INSERT INTO `comuni` VALUES ('004071', 'Clavesana', '004', NULL, '2023-02-27 18:49:07', 'C792');
INSERT INTO `comuni` VALUES ('004072', 'Corneliano d\'Alba', '004', NULL, '2023-02-27 18:49:07', 'D022');
INSERT INTO `comuni` VALUES ('004073', 'Cortemilia', '004', NULL, '2023-02-27 18:49:07', 'D062');
INSERT INTO `comuni` VALUES ('004074', 'Cossano Belbo', '004', NULL, '2023-02-27 18:49:07', 'D093');
INSERT INTO `comuni` VALUES ('004075', 'Costigliole Saluzzo', '004', NULL, '2023-02-27 18:49:07', 'D120');
INSERT INTO `comuni` VALUES ('004076', 'Cravanzana', '004', NULL, '2023-02-27 18:49:07', 'D133');
INSERT INTO `comuni` VALUES ('004077', 'Crissolo', '004', NULL, '2023-02-27 18:49:07', 'D172');
INSERT INTO `comuni` VALUES ('004078', 'Cuneo', '004', NULL, '2023-02-27 18:49:07', 'D205');
INSERT INTO `comuni` VALUES ('004079', 'Demonte', '004', NULL, '2023-02-27 18:49:07', 'D271');
INSERT INTO `comuni` VALUES ('004080', 'Diano d\'Alba', '004', NULL, '2023-02-27 18:49:07', 'D291');
INSERT INTO `comuni` VALUES ('004081', 'Dogliani', '004', NULL, '2023-02-27 18:49:07', 'D314');
INSERT INTO `comuni` VALUES ('004082', 'Dronero', '004', NULL, '2023-02-27 18:49:07', 'D372');
INSERT INTO `comuni` VALUES ('004083', 'Elva', '004', NULL, '2023-02-27 18:49:07', 'D401');
INSERT INTO `comuni` VALUES ('004084', 'Entracque', '004', NULL, '2023-02-27 18:49:07', 'D410');
INSERT INTO `comuni` VALUES ('004085', 'Envie', '004', NULL, '2023-02-27 18:49:07', 'D412');
INSERT INTO `comuni` VALUES ('004086', 'Farigliano', '004', NULL, '2023-02-27 18:49:07', 'D499');
INSERT INTO `comuni` VALUES ('004087', 'Faule', '004', NULL, '2023-02-27 18:49:07', 'D511');
INSERT INTO `comuni` VALUES ('004088', 'Feisoglio', '004', NULL, '2023-02-27 18:49:07', 'D523');
INSERT INTO `comuni` VALUES ('004089', 'Fossano', '004', NULL, '2023-02-27 18:49:07', 'D742');
INSERT INTO `comuni` VALUES ('004090', 'Frabosa Soprana', '004', NULL, '2023-02-27 18:49:07', 'D751');
INSERT INTO `comuni` VALUES ('004091', 'Frabosa Sottana', '004', NULL, '2023-02-27 18:49:07', 'D752');
INSERT INTO `comuni` VALUES ('004092', 'Frassino', '004', NULL, '2023-02-27 18:49:07', 'D782');
INSERT INTO `comuni` VALUES ('004093', 'Gaiola', '004', NULL, '2023-02-27 18:49:07', 'D856');
INSERT INTO `comuni` VALUES ('004094', 'Gambasca', '004', NULL, '2023-02-27 18:49:07', 'D894');
INSERT INTO `comuni` VALUES ('004095', 'Garessio', '004', NULL, '2023-02-27 18:49:07', 'D920');
INSERT INTO `comuni` VALUES ('004096', 'Genola', '004', NULL, '2023-02-27 18:49:07', 'D967');
INSERT INTO `comuni` VALUES ('004097', 'Gorzegno', '004', NULL, '2023-02-27 18:49:07', 'E111');
INSERT INTO `comuni` VALUES ('004098', 'Gottasecca', '004', NULL, '2023-02-27 18:49:07', 'E115');
INSERT INTO `comuni` VALUES ('004099', 'Govone', '004', NULL, '2023-02-27 18:49:07', 'E118');
INSERT INTO `comuni` VALUES ('004100', 'Grinzane Cavour', '004', NULL, '2023-02-27 18:49:07', 'E182');
INSERT INTO `comuni` VALUES ('004101', 'Guarene', '004', NULL, '2023-02-27 18:49:07', 'E251');
INSERT INTO `comuni` VALUES ('004102', 'Igliano', '004', NULL, '2023-02-27 18:49:07', 'E282');
INSERT INTO `comuni` VALUES ('004103', 'Isasca', '004', NULL, '2023-02-27 18:49:07', 'E327');
INSERT INTO `comuni` VALUES ('004104', 'Lagnasco', '004', NULL, '2023-02-27 18:49:07', 'E406');
INSERT INTO `comuni` VALUES ('004105', 'La Morra', '004', NULL, '2023-02-27 18:49:07', 'E430');
INSERT INTO `comuni` VALUES ('004106', 'Lequio Berria', '004', NULL, '2023-02-27 18:49:07', 'E540');
INSERT INTO `comuni` VALUES ('004107', 'Lequio Tanaro', '004', NULL, '2023-02-27 18:49:07', 'E539');
INSERT INTO `comuni` VALUES ('004108', 'Lesegno', '004', NULL, '2023-02-27 18:49:07', 'E546');
INSERT INTO `comuni` VALUES ('004109', 'Levice', '004', NULL, '2023-02-27 18:49:07', 'E564');
INSERT INTO `comuni` VALUES ('004110', 'Limone Piemonte', '004', NULL, '2023-02-27 18:49:07', 'E597');
INSERT INTO `comuni` VALUES ('004111', 'Lisio', '004', NULL, '2023-02-27 18:49:07', 'E615');
INSERT INTO `comuni` VALUES ('004112', 'Macra', '004', NULL, '2023-02-27 18:49:07', 'E789');
INSERT INTO `comuni` VALUES ('004113', 'Magliano Alfieri', '004', NULL, '2023-02-27 18:49:07', 'E809');
INSERT INTO `comuni` VALUES ('004114', 'Magliano Alpi', '004', NULL, '2023-02-27 18:49:07', 'E808');
INSERT INTO `comuni` VALUES ('004115', 'Mango', '004', NULL, '2023-02-27 18:49:07', 'E887');
INSERT INTO `comuni` VALUES ('004116', 'Manta', '004', NULL, '2023-02-27 18:49:07', 'E894');
INSERT INTO `comuni` VALUES ('004117', 'Marene', '004', NULL, '2023-02-27 18:49:07', 'E939');
INSERT INTO `comuni` VALUES ('004118', 'Margarita', '004', NULL, '2023-02-27 18:49:07', 'E945');
INSERT INTO `comuni` VALUES ('004119', 'Marmora', '004', NULL, '2023-02-27 18:49:07', 'E963');
INSERT INTO `comuni` VALUES ('004120', 'Marsaglia', '004', NULL, '2023-02-27 18:49:07', 'E973');
INSERT INTO `comuni` VALUES ('004121', 'Martiniana Po', '004', NULL, '2023-02-27 18:49:07', 'E988');
INSERT INTO `comuni` VALUES ('004122', 'Melle', '004', NULL, '2023-02-27 18:49:07', 'F114');
INSERT INTO `comuni` VALUES ('004123', 'Moiola', '004', NULL, '2023-02-27 18:49:07', 'F279');
INSERT INTO `comuni` VALUES ('004124', 'Mombarcaro', '004', NULL, '2023-02-27 18:49:07', 'F309');
INSERT INTO `comuni` VALUES ('004125', 'Mombasiglio', '004', NULL, '2023-02-27 18:49:07', 'F312');
INSERT INTO `comuni` VALUES ('004126', 'Monastero di Vasco', '004', NULL, '2023-02-27 18:49:07', 'F326');
INSERT INTO `comuni` VALUES ('004127', 'Monasterolo Casotto', '004', NULL, '2023-02-27 18:49:07', 'F329');
INSERT INTO `comuni` VALUES ('004128', 'Monasterolo di Savigliano', '004', NULL, '2023-02-27 18:49:07', 'F330');
INSERT INTO `comuni` VALUES ('004129', 'Monchiero', '004', NULL, '2023-02-27 18:49:07', 'F338');
INSERT INTO `comuni` VALUES ('004130', 'Mondovì', '004', NULL, '2023-02-27 18:49:07', 'F351');
INSERT INTO `comuni` VALUES ('004131', 'Monesiglio', '004', NULL, '2023-02-27 18:49:07', 'F355');
INSERT INTO `comuni` VALUES ('004132', 'Monforte d\'Alba', '004', NULL, '2023-02-27 18:49:07', 'F358');
INSERT INTO `comuni` VALUES ('004133', 'Montà', '004', NULL, '2023-02-27 18:49:07', 'F385');
INSERT INTO `comuni` VALUES ('004134', 'Montaldo di Mondovì', '004', NULL, '2023-02-27 18:49:07', 'F405');
INSERT INTO `comuni` VALUES ('004135', 'Montaldo Roero', '004', NULL, '2023-02-27 18:49:07', 'F408');
INSERT INTO `comuni` VALUES ('004136', 'Montanera', '004', NULL, '2023-02-27 18:49:07', 'F424');
INSERT INTO `comuni` VALUES ('004137', 'Montelupo Albese', '004', NULL, '2023-02-27 18:49:07', 'F550');
INSERT INTO `comuni` VALUES ('004138', 'Montemale di Cuneo', '004', NULL, '2023-02-27 18:49:07', 'F558');
INSERT INTO `comuni` VALUES ('004139', 'Monterosso Grana', '004', NULL, '2023-02-27 18:49:07', 'F608');
INSERT INTO `comuni` VALUES ('004140', 'Monteu Roero', '004', NULL, '2023-02-27 18:49:07', 'F654');
INSERT INTO `comuni` VALUES ('004141', 'Montezemolo', '004', NULL, '2023-02-27 18:49:07', 'F666');
INSERT INTO `comuni` VALUES ('004142', 'Monticello d\'Alba', '004', NULL, '2023-02-27 18:49:07', 'F669');
INSERT INTO `comuni` VALUES ('004143', 'Moretta', '004', NULL, '2023-02-27 18:49:07', 'F723');
INSERT INTO `comuni` VALUES ('004144', 'Morozzo', '004', NULL, '2023-02-27 18:49:07', 'F743');
INSERT INTO `comuni` VALUES ('004145', 'Murazzano', '004', NULL, '2023-02-27 18:49:07', 'F809');
INSERT INTO `comuni` VALUES ('004146', 'Murello', '004', NULL, '2023-02-27 18:49:07', 'F811');
INSERT INTO `comuni` VALUES ('004147', 'Narzole', '004', NULL, '2023-02-27 18:49:07', 'F846');
INSERT INTO `comuni` VALUES ('004148', 'Neive', '004', NULL, '2023-02-27 18:49:07', 'F863');
INSERT INTO `comuni` VALUES ('004149', 'Neviglie', '004', NULL, '2023-02-27 18:49:07', 'F883');
INSERT INTO `comuni` VALUES ('004150', 'Niella Belbo', '004', NULL, '2023-02-27 18:49:07', 'F894');
INSERT INTO `comuni` VALUES ('004151', 'Niella Tanaro', '004', NULL, '2023-02-27 18:49:07', 'F895');
INSERT INTO `comuni` VALUES ('004152', 'Novello', '004', NULL, '2023-02-27 18:49:07', 'F961');
INSERT INTO `comuni` VALUES ('004153', 'Nucetto', '004', NULL, '2023-02-27 18:49:07', 'F972');
INSERT INTO `comuni` VALUES ('004154', 'Oncino', '004', NULL, '2023-02-27 18:49:07', 'G066');
INSERT INTO `comuni` VALUES ('004155', 'Ormea', '004', NULL, '2023-02-27 18:49:07', 'G114');
INSERT INTO `comuni` VALUES ('004156', 'Ostana', '004', NULL, '2023-02-27 18:49:07', 'G183');
INSERT INTO `comuni` VALUES ('004157', 'Paesana', '004', NULL, '2023-02-27 18:49:07', 'G228');
INSERT INTO `comuni` VALUES ('004158', 'Pagno', '004', NULL, '2023-02-27 18:49:07', 'G240');
INSERT INTO `comuni` VALUES ('004159', 'Pamparato', '004', NULL, '2023-02-27 18:49:07', 'G302');
INSERT INTO `comuni` VALUES ('004160', 'Paroldo', '004', NULL, '2023-02-27 18:49:07', 'G339');
INSERT INTO `comuni` VALUES ('004161', 'Perletto', '004', NULL, '2023-02-27 18:49:07', 'G457');
INSERT INTO `comuni` VALUES ('004162', 'Perlo', '004', NULL, '2023-02-27 18:49:07', 'G458');
INSERT INTO `comuni` VALUES ('004163', 'Peveragno', '004', NULL, '2023-02-27 18:49:07', 'G526');
INSERT INTO `comuni` VALUES ('004164', 'Pezzolo Valle Uzzone', '004', NULL, '2023-02-27 18:49:07', 'G532');
INSERT INTO `comuni` VALUES ('004165', 'Pianfei', '004', NULL, '2023-02-27 18:49:07', 'G561');
INSERT INTO `comuni` VALUES ('004166', 'Piasco', '004', NULL, '2023-02-27 18:49:07', 'G575');
INSERT INTO `comuni` VALUES ('004167', 'Pietraporzio', '004', NULL, '2023-02-27 18:49:07', 'G625');
INSERT INTO `comuni` VALUES ('004168', 'Piobesi d\'Alba', '004', NULL, '2023-02-27 18:49:07', 'G683');
INSERT INTO `comuni` VALUES ('004169', 'Piozzo', '004', NULL, '2023-02-27 18:49:07', 'G697');
INSERT INTO `comuni` VALUES ('004170', 'Pocapaglia', '004', NULL, '2023-02-27 18:49:07', 'G742');
INSERT INTO `comuni` VALUES ('004171', 'Polonghera', '004', NULL, '2023-02-27 18:49:07', 'G800');
INSERT INTO `comuni` VALUES ('004172', 'Pontechianale', '004', NULL, '2023-02-27 18:49:07', 'G837');
INSERT INTO `comuni` VALUES ('004173', 'Pradleves', '004', NULL, '2023-02-27 18:49:07', 'G970');
INSERT INTO `comuni` VALUES ('004174', 'Prazzo', '004', NULL, '2023-02-27 18:49:07', 'H011');
INSERT INTO `comuni` VALUES ('004175', 'Priero', '004', NULL, '2023-02-27 18:49:07', 'H059');
INSERT INTO `comuni` VALUES ('004176', 'Priocca', '004', NULL, '2023-02-27 18:49:07', 'H068');
INSERT INTO `comuni` VALUES ('004177', 'Priola', '004', NULL, '2023-02-27 18:49:07', 'H069');
INSERT INTO `comuni` VALUES ('004178', 'Prunetto', '004', NULL, '2023-02-27 18:49:07', 'H085');
INSERT INTO `comuni` VALUES ('004179', 'Racconigi', '004', NULL, '2023-02-27 18:49:07', 'H150');
INSERT INTO `comuni` VALUES ('004180', 'Revello', '004', NULL, '2023-02-27 18:49:07', 'H247');
INSERT INTO `comuni` VALUES ('004181', 'Rifreddo', '004', NULL, '2023-02-27 18:49:07', 'H285');
INSERT INTO `comuni` VALUES ('004182', 'Rittana', '004', NULL, '2023-02-27 18:49:07', 'H326');
INSERT INTO `comuni` VALUES ('004183', 'Roaschia', '004', NULL, '2023-02-27 18:49:07', 'H362');
INSERT INTO `comuni` VALUES ('004184', 'Roascio', '004', NULL, '2023-02-27 18:49:07', 'H363');
INSERT INTO `comuni` VALUES ('004185', 'Robilante', '004', NULL, '2023-02-27 18:49:07', 'H377');
INSERT INTO `comuni` VALUES ('004186', 'Roburent', '004', NULL, '2023-02-27 18:49:07', 'H378');
INSERT INTO `comuni` VALUES ('004187', 'Roccabruna', '004', NULL, '2023-02-27 18:49:07', 'H385');
INSERT INTO `comuni` VALUES ('004188', 'Rocca Cigliè', '004', NULL, '2023-02-27 18:49:07', 'H391');
INSERT INTO `comuni` VALUES ('004189', 'Rocca de\' Baldi', '004', NULL, '2023-02-27 18:49:07', 'H395');
INSERT INTO `comuni` VALUES ('004190', 'Roccaforte Mondovì', '004', NULL, '2023-02-27 18:49:07', 'H407');
INSERT INTO `comuni` VALUES ('004191', 'Roccasparvera', '004', NULL, '2023-02-27 18:49:07', 'H447');
INSERT INTO `comuni` VALUES ('004192', 'Roccavione', '004', NULL, '2023-02-27 18:49:07', 'H453');
INSERT INTO `comuni` VALUES ('004193', 'Rocchetta Belbo', '004', NULL, '2023-02-27 18:49:07', 'H462');
INSERT INTO `comuni` VALUES ('004194', 'Roddi', '004', NULL, '2023-02-27 18:49:07', 'H472');
INSERT INTO `comuni` VALUES ('004195', 'Roddino', '004', NULL, '2023-02-27 18:49:07', 'H473');
INSERT INTO `comuni` VALUES ('004196', 'Rodello', '004', NULL, '2023-02-27 18:49:07', 'H474');
INSERT INTO `comuni` VALUES ('004197', 'Rossana', '004', NULL, '2023-02-27 18:49:07', 'H578');
INSERT INTO `comuni` VALUES ('004198', 'Ruffia', '004', NULL, '2023-02-27 18:49:07', 'H633');
INSERT INTO `comuni` VALUES ('004199', 'Sale delle Langhe', '004', NULL, '2023-02-27 18:49:07', 'H695');
INSERT INTO `comuni` VALUES ('004200', 'Sale San Giovanni', '004', NULL, '2023-02-27 18:49:07', 'H704');
INSERT INTO `comuni` VALUES ('004201', 'Saliceto', '004', NULL, '2023-02-27 18:49:07', 'H710');
INSERT INTO `comuni` VALUES ('004202', 'Salmour', '004', NULL, '2023-02-27 18:49:07', 'H716');
INSERT INTO `comuni` VALUES ('004203', 'Saluzzo', '004', NULL, '2023-02-27 18:49:07', 'H727');
INSERT INTO `comuni` VALUES ('004204', 'Sambuco', '004', NULL, '2023-02-27 18:49:07', 'H746');
INSERT INTO `comuni` VALUES ('004205', 'Sampeyre', '004', NULL, '2023-02-27 18:49:07', 'H755');
INSERT INTO `comuni` VALUES ('004206', 'San Benedetto Belbo', '004', NULL, '2023-02-27 18:49:07', 'H770');
INSERT INTO `comuni` VALUES ('004207', 'San Damiano Macra', '004', NULL, '2023-02-27 18:49:07', 'H812');
INSERT INTO `comuni` VALUES ('004208', 'Sanfrè', '004', NULL, '2023-02-27 18:49:07', 'H851');
INSERT INTO `comuni` VALUES ('004209', 'Sanfront', '004', NULL, '2023-02-27 18:49:07', 'H852');
INSERT INTO `comuni` VALUES ('004210', 'San Michele Mondovì', '004', NULL, '2023-02-27 18:49:07', 'I037');
INSERT INTO `comuni` VALUES ('004211', 'Sant\'Albano Stura', '004', NULL, '2023-02-27 18:49:07', 'I210');
INSERT INTO `comuni` VALUES ('004212', 'Santa Vittoria d\'Alba', '004', NULL, '2023-02-27 18:49:07', 'I316');
INSERT INTO `comuni` VALUES ('004213', 'Santo Stefano Belbo', '004', NULL, '2023-02-27 18:49:07', 'I367');
INSERT INTO `comuni` VALUES ('004214', 'Santo Stefano Roero', '004', NULL, '2023-02-27 18:49:07', 'I372');
INSERT INTO `comuni` VALUES ('004215', 'Savigliano', '004', NULL, '2023-02-27 18:49:07', 'I470');
INSERT INTO `comuni` VALUES ('004216', 'Scagnello', '004', NULL, '2023-02-27 18:49:07', 'I484');
INSERT INTO `comuni` VALUES ('004217', 'Scarnafigi', '004', NULL, '2023-02-27 18:49:07', 'I512');
INSERT INTO `comuni` VALUES ('004218', 'Serralunga d\'Alba', '004', NULL, '2023-02-27 18:49:07', 'I646');
INSERT INTO `comuni` VALUES ('004219', 'Serravalle Langhe', '004', NULL, '2023-02-27 18:49:07', 'I659');
INSERT INTO `comuni` VALUES ('004220', 'Sinio', '004', NULL, '2023-02-27 18:49:07', 'I750');
INSERT INTO `comuni` VALUES ('004221', 'Somano', '004', NULL, '2023-02-27 18:49:07', 'I817');
INSERT INTO `comuni` VALUES ('004222', 'Sommariva del Bosco', '004', NULL, '2023-02-27 18:49:07', 'I822');
INSERT INTO `comuni` VALUES ('004223', 'Sommariva Perno', '004', NULL, '2023-02-27 18:49:07', 'I823');
INSERT INTO `comuni` VALUES ('004224', 'Stroppo', '004', NULL, '2023-02-27 18:49:07', 'I985');
INSERT INTO `comuni` VALUES ('004225', 'Tarantasca', '004', NULL, '2023-02-27 18:49:07', 'L048');
INSERT INTO `comuni` VALUES ('004226', 'Torre Bormida', '004', NULL, '2023-02-27 18:49:07', 'L252');
INSERT INTO `comuni` VALUES ('004227', 'Torre Mondovì', '004', NULL, '2023-02-27 18:49:07', 'L241');
INSERT INTO `comuni` VALUES ('004228', 'Torre San Giorgio', '004', NULL, '2023-02-27 18:49:07', 'L278');
INSERT INTO `comuni` VALUES ('004229', 'Torresina', '004', NULL, '2023-02-27 18:49:07', 'L281');
INSERT INTO `comuni` VALUES ('004230', 'Treiso', '004', NULL, '2023-02-27 18:49:07', 'L367');
INSERT INTO `comuni` VALUES ('004231', 'Trezzo Tinella', '004', NULL, '2023-02-27 18:49:07', 'L410');
INSERT INTO `comuni` VALUES ('004232', 'Trinità', '004', NULL, '2023-02-27 18:49:07', 'L427');
INSERT INTO `comuni` VALUES ('004233', 'Valdieri', '004', NULL, '2023-02-27 18:49:07', 'L558');
INSERT INTO `comuni` VALUES ('004234', 'Valgrana', '004', NULL, '2023-02-27 18:49:07', 'L580');
INSERT INTO `comuni` VALUES ('004235', 'Valloriate', '004', NULL, '2023-02-27 18:49:07', 'L631');
INSERT INTO `comuni` VALUES ('004236', 'Valmala', '004', NULL, '2023-02-27 18:49:07', 'L636');
INSERT INTO `comuni` VALUES ('004237', 'Venasca', '004', NULL, '2023-02-27 18:49:07', 'L729');
INSERT INTO `comuni` VALUES ('004238', 'Verduno', '004', NULL, '2023-02-27 18:49:07', 'L758');
INSERT INTO `comuni` VALUES ('004239', 'Vernante', '004', NULL, '2023-02-27 18:49:07', 'L771');
INSERT INTO `comuni` VALUES ('004240', 'Verzuolo', '004', NULL, '2023-02-27 18:49:07', 'L804');
INSERT INTO `comuni` VALUES ('004241', 'Vezza d\'Alba', '004', NULL, '2023-02-27 18:49:07', 'L817');
INSERT INTO `comuni` VALUES ('004242', 'Vicoforte', '004', NULL, '2023-02-27 18:49:07', 'L841');
INSERT INTO `comuni` VALUES ('004243', 'Vignolo', '004', NULL, '2023-02-27 18:49:07', 'L888');
INSERT INTO `comuni` VALUES ('004244', 'Villafalletto', '004', NULL, '2023-02-27 18:49:07', 'L942');
INSERT INTO `comuni` VALUES ('004245', 'Villanova Mondovì', '004', NULL, '2023-02-27 18:49:07', 'L974');
INSERT INTO `comuni` VALUES ('004246', 'Villanova Solaro', '004', NULL, '2023-02-27 18:49:07', 'L990');
INSERT INTO `comuni` VALUES ('004247', 'Villar San Costanzo', '004', NULL, '2023-02-27 18:49:07', 'M015');
INSERT INTO `comuni` VALUES ('004248', 'Vinadio', '004', NULL, '2023-02-27 18:49:07', 'M055');
INSERT INTO `comuni` VALUES ('004249', 'Viola', '004', NULL, '2023-02-27 18:49:07', 'M063');
INSERT INTO `comuni` VALUES ('004250', 'Vottignasco', '004', NULL, '2023-02-27 18:49:07', 'M136');
INSERT INTO `comuni` VALUES ('005001', 'Agliano Terme', '005', NULL, '2023-02-27 18:49:07', 'A072');
INSERT INTO `comuni` VALUES ('005002', 'Albugnano', '005', NULL, '2023-02-27 18:49:07', 'A173');
INSERT INTO `comuni` VALUES ('005003', 'Antignano', '005', NULL, '2023-02-27 18:49:07', 'A312');
INSERT INTO `comuni` VALUES ('005004', 'Aramengo', '005', NULL, '2023-02-27 18:49:07', 'A352');
INSERT INTO `comuni` VALUES ('005005', 'Asti', '005', NULL, '2023-02-27 18:49:07', 'A479');
INSERT INTO `comuni` VALUES ('005006', 'Azzano d\'Asti', '005', NULL, '2023-02-27 18:49:07', 'A527');
INSERT INTO `comuni` VALUES ('005007', 'Baldichieri d\'Asti', '005', NULL, '2023-02-27 18:49:07', 'A588');
INSERT INTO `comuni` VALUES ('005008', 'Belveglio', '005', NULL, '2023-02-27 18:49:07', 'A770');
INSERT INTO `comuni` VALUES ('005009', 'Berzano di San Pietro', '005', NULL, '2023-02-27 18:49:07', 'A812');
INSERT INTO `comuni` VALUES ('005010', 'Bruno', '005', NULL, '2023-02-27 18:49:07', 'B221');
INSERT INTO `comuni` VALUES ('005011', 'Bubbio', '005', NULL, '2023-02-27 18:49:07', 'B236');
INSERT INTO `comuni` VALUES ('005012', 'Buttigliera d\'Asti', '005', NULL, '2023-02-27 18:49:07', 'B306');
INSERT INTO `comuni` VALUES ('005013', 'Calamandrana', '005', NULL, '2023-02-27 18:49:07', 'B376');
INSERT INTO `comuni` VALUES ('005014', 'Calliano', '005', NULL, '2023-02-27 18:49:07', 'B418');
INSERT INTO `comuni` VALUES ('005015', 'Calosso', '005', NULL, '2023-02-27 18:49:07', 'B425');
INSERT INTO `comuni` VALUES ('005016', 'Camerano Casasco', '005', NULL, '2023-02-27 18:49:07', 'B469');
INSERT INTO `comuni` VALUES ('005017', 'Canelli', '005', NULL, '2023-02-27 18:49:07', 'B594');
INSERT INTO `comuni` VALUES ('005018', 'Cantarana', '005', NULL, '2023-02-27 18:49:07', 'B633');
INSERT INTO `comuni` VALUES ('005019', 'Capriglio', '005', NULL, '2023-02-27 18:49:07', 'B707');
INSERT INTO `comuni` VALUES ('005020', 'Casorzo', '005', NULL, '2023-02-27 18:49:07', 'B991');
INSERT INTO `comuni` VALUES ('005021', 'Cassinasco', '005', NULL, '2023-02-27 18:49:07', 'C022');
INSERT INTO `comuni` VALUES ('005022', 'Castagnole delle Lanze', '005', NULL, '2023-02-27 18:49:07', 'C049');
INSERT INTO `comuni` VALUES ('005023', 'Castagnole Monferrato', '005', NULL, '2023-02-27 18:49:07', 'C047');
INSERT INTO `comuni` VALUES ('005024', 'Castel Boglione', '005', NULL, '2023-02-27 18:49:07', 'C064');
INSERT INTO `comuni` VALUES ('005025', 'Castell\'Alfero', '005', NULL, '2023-02-27 18:49:07', 'C127');
INSERT INTO `comuni` VALUES ('005026', 'Castellero', '005', NULL, '2023-02-27 18:49:07', 'C154');
INSERT INTO `comuni` VALUES ('005027', 'Castelletto Molina', '005', NULL, '2023-02-27 18:49:07', 'C161');
INSERT INTO `comuni` VALUES ('005028', 'Castello di Annone', '005', NULL, '2023-02-27 18:49:07', 'A300');
INSERT INTO `comuni` VALUES ('005029', 'Castelnuovo Belbo', '005', NULL, '2023-02-27 18:49:07', 'C226');
INSERT INTO `comuni` VALUES ('005030', 'Castelnuovo Calcea', '005', NULL, '2023-02-27 18:49:07', 'C230');
INSERT INTO `comuni` VALUES ('005031', 'Castelnuovo Don Bosco', '005', NULL, '2023-02-27 18:49:07', 'C232');
INSERT INTO `comuni` VALUES ('005032', 'Castel Rocchero', '005', NULL, '2023-02-27 18:49:07', 'C253');
INSERT INTO `comuni` VALUES ('005033', 'Cellarengo', '005', NULL, '2023-02-27 18:49:07', 'C438');
INSERT INTO `comuni` VALUES ('005034', 'Celle Enomondo', '005', NULL, '2023-02-27 18:49:07', 'C440');
INSERT INTO `comuni` VALUES ('005035', 'Cerreto d\'Asti', '005', NULL, '2023-02-27 18:49:07', 'C528');
INSERT INTO `comuni` VALUES ('005036', 'Cerro Tanaro', '005', NULL, '2023-02-27 18:49:07', 'C533');
INSERT INTO `comuni` VALUES ('005037', 'Cessole', '005', NULL, '2023-02-27 18:49:07', 'C583');
INSERT INTO `comuni` VALUES ('005038', 'Chiusano d\'Asti', '005', NULL, '2023-02-27 18:49:07', 'C658');
INSERT INTO `comuni` VALUES ('005039', 'Cinaglio', '005', NULL, '2023-02-27 18:49:07', 'C701');
INSERT INTO `comuni` VALUES ('005040', 'Cisterna d\'Asti', '005', NULL, '2023-02-27 18:49:07', 'C739');
INSERT INTO `comuni` VALUES ('005041', 'Coazzolo', '005', NULL, '2023-02-27 18:49:07', 'C804');
INSERT INTO `comuni` VALUES ('005042', 'Cocconato', '005', NULL, '2023-02-27 18:49:07', 'C807');
INSERT INTO `comuni` VALUES ('005044', 'Corsione', '005', NULL, '2023-02-27 18:49:07', 'D046');
INSERT INTO `comuni` VALUES ('005045', 'Cortandone', '005', NULL, '2023-02-27 18:49:07', 'D050');
INSERT INTO `comuni` VALUES ('005046', 'Cortanze', '005', NULL, '2023-02-27 18:49:07', 'D051');
INSERT INTO `comuni` VALUES ('005047', 'Cortazzone', '005', NULL, '2023-02-27 18:49:07', 'D052');
INSERT INTO `comuni` VALUES ('005048', 'Cortiglione', '005', NULL, '2023-02-27 18:49:07', 'D072');
INSERT INTO `comuni` VALUES ('005049', 'Cossombrato', '005', NULL, '2023-02-27 18:49:07', 'D101');
INSERT INTO `comuni` VALUES ('005050', 'Costigliole d\'Asti', '005', NULL, '2023-02-27 18:49:07', 'D119');
INSERT INTO `comuni` VALUES ('005051', 'Cunico', '005', NULL, '2023-02-27 18:49:07', 'D207');
INSERT INTO `comuni` VALUES ('005052', 'Dusino San Michele', '005', NULL, '2023-02-27 18:49:07', 'D388');
INSERT INTO `comuni` VALUES ('005053', 'Ferrere', '005', NULL, '2023-02-27 18:49:07', 'D554');
INSERT INTO `comuni` VALUES ('005054', 'Fontanile', '005', NULL, '2023-02-27 18:49:07', 'D678');
INSERT INTO `comuni` VALUES ('005055', 'Frinco', '005', NULL, '2023-02-27 18:49:07', 'D802');
INSERT INTO `comuni` VALUES ('005056', 'Grana', '005', NULL, '2023-02-27 18:49:07', 'E134');
INSERT INTO `comuni` VALUES ('005057', 'Grazzano Badoglio', '005', NULL, '2023-02-27 18:49:07', 'E159');
INSERT INTO `comuni` VALUES ('005058', 'Incisa Scapaccino', '005', NULL, '2023-02-27 18:49:07', 'E295');
INSERT INTO `comuni` VALUES ('005059', 'Isola d\'Asti', '005', NULL, '2023-02-27 18:49:07', 'E338');
INSERT INTO `comuni` VALUES ('005060', 'Loazzolo', '005', NULL, '2023-02-27 18:49:07', 'E633');
INSERT INTO `comuni` VALUES ('005061', 'Maranzana', '005', NULL, '2023-02-27 18:49:07', 'E917');
INSERT INTO `comuni` VALUES ('005062', 'Maretto', '005', NULL, '2023-02-27 18:49:07', 'E944');
INSERT INTO `comuni` VALUES ('005063', 'Moasca', '005', NULL, '2023-02-27 18:49:07', 'F254');
INSERT INTO `comuni` VALUES ('005064', 'Mombaldone', '005', NULL, '2023-02-27 18:49:07', 'F308');
INSERT INTO `comuni` VALUES ('005065', 'Mombaruzzo', '005', NULL, '2023-02-27 18:49:07', 'F311');
INSERT INTO `comuni` VALUES ('005066', 'Mombercelli', '005', NULL, '2023-02-27 18:49:07', 'F316');
INSERT INTO `comuni` VALUES ('005067', 'Monale', '005', NULL, '2023-02-27 18:49:07', 'F323');
INSERT INTO `comuni` VALUES ('005068', 'Monastero Bormida', '005', NULL, '2023-02-27 18:49:07', 'F325');
INSERT INTO `comuni` VALUES ('005069', 'Moncalvo', '005', NULL, '2023-02-27 18:49:07', 'F336');
INSERT INTO `comuni` VALUES ('005070', 'Moncucco Torinese', '005', NULL, '2023-02-27 18:49:07', 'F343');
INSERT INTO `comuni` VALUES ('005071', 'Mongardino', '005', NULL, '2023-02-27 18:49:07', 'F361');
INSERT INTO `comuni` VALUES ('005072', 'Montabone', '005', NULL, '2023-02-27 18:49:07', 'F386');
INSERT INTO `comuni` VALUES ('005073', 'Montafia', '005', NULL, '2023-02-27 18:49:07', 'F390');
INSERT INTO `comuni` VALUES ('005074', 'Montaldo Scarampi', '005', NULL, '2023-02-27 18:49:07', 'F409');
INSERT INTO `comuni` VALUES ('005075', 'Montechiaro d\'Asti', '005', NULL, '2023-02-27 18:49:07', 'F468');
INSERT INTO `comuni` VALUES ('005076', 'Montegrosso d\'Asti', '005', NULL, '2023-02-27 18:49:07', 'F527');
INSERT INTO `comuni` VALUES ('005077', 'Montemagno', '005', NULL, '2023-02-27 18:49:07', 'F556');
INSERT INTO `comuni` VALUES ('005079', 'Moransengo', '005', NULL, '2023-02-27 18:49:07', 'F709');
INSERT INTO `comuni` VALUES ('005080', 'Nizza Monferrato', '005', NULL, '2023-02-27 18:49:07', 'F902');
INSERT INTO `comuni` VALUES ('005081', 'Olmo Gentile', '005', NULL, '2023-02-27 18:49:07', 'G048');
INSERT INTO `comuni` VALUES ('005082', 'Passerano Marmorito', '005', NULL, '2023-02-27 18:49:07', 'G358');
INSERT INTO `comuni` VALUES ('005083', 'Penango', '005', NULL, '2023-02-27 18:49:07', 'G430');
INSERT INTO `comuni` VALUES ('005084', 'Piea', '005', NULL, '2023-02-27 18:49:07', 'G593');
INSERT INTO `comuni` VALUES ('005085', 'Pino d\'Asti', '005', NULL, '2023-02-27 18:49:07', 'G676');
INSERT INTO `comuni` VALUES ('005086', 'Piovà Massaia', '005', NULL, '2023-02-27 18:49:07', 'G692');
INSERT INTO `comuni` VALUES ('005087', 'Portacomaro', '005', NULL, '2023-02-27 18:49:07', 'G894');
INSERT INTO `comuni` VALUES ('005088', 'Quaranti', '005', NULL, '2023-02-27 18:49:07', 'H102');
INSERT INTO `comuni` VALUES ('005089', 'Refrancore', '005', NULL, '2023-02-27 18:49:07', 'H219');
INSERT INTO `comuni` VALUES ('005090', 'Revigliasco d\'Asti', '005', NULL, '2023-02-27 18:49:07', 'H250');
INSERT INTO `comuni` VALUES ('005091', 'Roatto', '005', NULL, '2023-02-27 18:49:07', 'H366');
INSERT INTO `comuni` VALUES ('005092', 'Robella', '005', NULL, '2023-02-27 18:49:07', 'H376');
INSERT INTO `comuni` VALUES ('005093', 'Rocca d\'Arazzo', '005', NULL, '2023-02-27 18:49:07', 'H392');
INSERT INTO `comuni` VALUES ('005094', 'Roccaverano', '005', NULL, '2023-02-27 18:49:07', 'H451');
INSERT INTO `comuni` VALUES ('005095', 'Rocchetta Palafea', '005', NULL, '2023-02-27 18:49:07', 'H466');
INSERT INTO `comuni` VALUES ('005096', 'Rocchetta Tanaro', '005', NULL, '2023-02-27 18:49:07', 'H468');
INSERT INTO `comuni` VALUES ('005097', 'San Damiano d\'Asti', '005', NULL, '2023-02-27 18:49:07', 'H811');
INSERT INTO `comuni` VALUES ('005098', 'San Giorgio Scarampi', '005', NULL, '2023-02-27 18:49:07', 'H899');
INSERT INTO `comuni` VALUES ('005099', 'San Martino Alfieri', '005', NULL, '2023-02-27 18:49:07', 'H987');
INSERT INTO `comuni` VALUES ('005100', 'San Marzano Oliveto', '005', NULL, '2023-02-27 18:49:07', 'I017');
INSERT INTO `comuni` VALUES ('005101', 'San Paolo Solbrito', '005', NULL, '2023-02-27 18:49:07', 'I076');
INSERT INTO `comuni` VALUES ('005103', 'Scurzolengo', '005', NULL, '2023-02-27 18:49:07', 'I555');
INSERT INTO `comuni` VALUES ('005104', 'Serole', '005', NULL, '2023-02-27 18:49:07', 'I637');
INSERT INTO `comuni` VALUES ('005105', 'Sessame', '005', NULL, '2023-02-27 18:49:07', 'I678');
INSERT INTO `comuni` VALUES ('005106', 'Settime', '005', NULL, '2023-02-27 18:49:07', 'I698');
INSERT INTO `comuni` VALUES ('005107', 'Soglio', '005', NULL, '2023-02-27 18:49:07', 'I781');
INSERT INTO `comuni` VALUES ('005108', 'Tigliole', '005', NULL, '2023-02-27 18:49:07', 'L168');
INSERT INTO `comuni` VALUES ('005109', 'Tonco', '005', NULL, '2023-02-27 18:49:07', 'L203');
INSERT INTO `comuni` VALUES ('005110', 'Tonengo', '005', NULL, '2023-02-27 18:49:07', 'L204');
INSERT INTO `comuni` VALUES ('005111', 'Vaglio Serra', '005', NULL, '2023-02-27 18:49:07', 'L531');
INSERT INTO `comuni` VALUES ('005112', 'Valfenera', '005', NULL, '2023-02-27 18:49:07', 'L574');
INSERT INTO `comuni` VALUES ('005113', 'Vesime', '005', NULL, '2023-02-27 18:49:07', 'L807');
INSERT INTO `comuni` VALUES ('005114', 'Viale', '005', NULL, '2023-02-27 18:49:07', 'L829');
INSERT INTO `comuni` VALUES ('005115', 'Viarigi', '005', NULL, '2023-02-27 18:49:07', 'L834');
INSERT INTO `comuni` VALUES ('005116', 'Vigliano d\'Asti', '005', NULL, '2023-02-27 18:49:07', 'L879');
INSERT INTO `comuni` VALUES ('005117', 'Villafranca d\'Asti', '005', NULL, '2023-02-27 18:49:07', 'L945');
INSERT INTO `comuni` VALUES ('005118', 'Villanova d\'Asti', '005', NULL, '2023-02-27 18:49:07', 'L984');
INSERT INTO `comuni` VALUES ('005119', 'Villa San Secondo', '005', NULL, '2023-02-27 18:49:07', 'M019');
INSERT INTO `comuni` VALUES ('005120', 'Vinchio', '005', NULL, '2023-02-27 18:49:07', 'M058');
INSERT INTO `comuni` VALUES ('005121', 'Montiglio Monferrato', '005', NULL, '2023-02-27 18:49:07', 'M302');
INSERT INTO `comuni` VALUES ('006001', 'Acqui Terme', '006', NULL, '2023-02-27 18:49:07', 'A052');
INSERT INTO `comuni` VALUES ('006002', 'Albera Ligure', '006', NULL, '2023-02-27 18:49:07', 'A146');
INSERT INTO `comuni` VALUES ('006003', 'Alessandria', '006', NULL, '2023-02-27 18:49:07', 'A182');
INSERT INTO `comuni` VALUES ('006004', 'Alfiano Natta', '006', NULL, '2023-02-27 18:49:07', 'A189');
INSERT INTO `comuni` VALUES ('006005', 'Alice Bel Colle', '006', NULL, '2023-02-27 18:49:07', 'A197');
INSERT INTO `comuni` VALUES ('006006', 'Alluvioni Cambiò', '006', NULL, '2023-02-27 18:49:07', 'A211');
INSERT INTO `comuni` VALUES ('006007', 'Altavilla Monferrato', '005', NULL, '2023-02-27 18:49:07', 'A227');
INSERT INTO `comuni` VALUES ('006008', 'Alzano Scrivia', '006', NULL, '2023-02-27 18:49:07', 'A245');
INSERT INTO `comuni` VALUES ('006009', 'Arquata Scrivia', '006', NULL, '2023-02-27 18:49:07', 'A436');
INSERT INTO `comuni` VALUES ('006010', 'Avolasca', '006', NULL, '2023-02-27 18:49:07', 'A523');
INSERT INTO `comuni` VALUES ('006011', 'Balzola', '006', NULL, '2023-02-27 18:49:07', 'A605');
INSERT INTO `comuni` VALUES ('006012', 'Basaluzzo', '006', NULL, '2023-02-27 18:49:07', 'A689');
INSERT INTO `comuni` VALUES ('006013', 'Bassignana', '006', NULL, '2023-02-27 18:49:07', 'A708');
INSERT INTO `comuni` VALUES ('006014', 'Belforte Monferrato', '006', NULL, '2023-02-27 18:49:07', 'A738');
INSERT INTO `comuni` VALUES ('006015', 'Bergamasco', '006', NULL, '2023-02-27 18:49:07', 'A793');
INSERT INTO `comuni` VALUES ('006016', 'Berzano di Tortona', '006', NULL, '2023-02-27 18:49:07', 'A813');
INSERT INTO `comuni` VALUES ('006017', 'Bistagno', '006', NULL, '2023-02-27 18:49:07', 'A889');
INSERT INTO `comuni` VALUES ('006018', 'Borghetto di Borbera', '006', NULL, '2023-02-27 18:49:07', 'A998');
INSERT INTO `comuni` VALUES ('006019', 'Borgoratto Alessandrino', '006', NULL, '2023-02-27 18:49:07', 'B029');
INSERT INTO `comuni` VALUES ('006020', 'Borgo San Martino', '006', NULL, '2023-02-27 18:49:07', 'B037');
INSERT INTO `comuni` VALUES ('006021', 'Bosco Marengo', '006', NULL, '2023-02-27 18:49:07', 'B071');
INSERT INTO `comuni` VALUES ('006022', 'Bosio', '006', NULL, '2023-02-27 18:49:07', 'B080');
INSERT INTO `comuni` VALUES ('006023', 'Bozzole', '006', NULL, '2023-02-27 18:49:07', 'B109');
INSERT INTO `comuni` VALUES ('006024', 'Brignano-Frascata', '006', NULL, '2023-02-27 18:49:07', 'B179');
INSERT INTO `comuni` VALUES ('006025', 'Cabella Ligure', '006', NULL, '2023-02-27 18:49:07', 'B311');
INSERT INTO `comuni` VALUES ('006026', 'Camagna Monferrato', '006', NULL, '2023-02-27 18:49:07', 'B453');
INSERT INTO `comuni` VALUES ('006027', 'Camino', '006', NULL, '2023-02-27 18:49:07', 'B482');
INSERT INTO `comuni` VALUES ('006028', 'Cantalupo Ligure', '006', NULL, '2023-02-27 18:49:07', 'B629');
INSERT INTO `comuni` VALUES ('006029', 'Capriata d\'Orba', '006', NULL, '2023-02-27 18:49:07', 'B701');
INSERT INTO `comuni` VALUES ('006030', 'Carbonara Scrivia', '006', NULL, '2023-02-27 18:49:07', 'B736');
INSERT INTO `comuni` VALUES ('006031', 'Carentino', '006', NULL, '2023-02-27 18:49:07', 'B765');
INSERT INTO `comuni` VALUES ('006032', 'Carezzano', '006', NULL, '2023-02-27 18:49:07', 'B769');
INSERT INTO `comuni` VALUES ('006033', 'Carpeneto', '006', NULL, '2023-02-27 18:49:07', 'B818');
INSERT INTO `comuni` VALUES ('006034', 'Carrega Ligure', '006', NULL, '2023-02-27 18:49:07', 'B836');
INSERT INTO `comuni` VALUES ('006035', 'Carrosio', '006', NULL, '2023-02-27 18:49:07', 'B840');
INSERT INTO `comuni` VALUES ('006036', 'Cartosio', '006', NULL, '2023-02-27 18:49:07', 'B847');
INSERT INTO `comuni` VALUES ('006037', 'Casal Cermelli', '006', NULL, '2023-02-27 18:49:07', 'B870');
INSERT INTO `comuni` VALUES ('006038', 'Casaleggio Boiro', '006', NULL, '2023-02-27 18:49:07', 'B882');
INSERT INTO `comuni` VALUES ('006039', 'Casale Monferrato', '006', NULL, '2023-02-27 18:49:07', 'B885');
INSERT INTO `comuni` VALUES ('006040', 'Casalnoceto', '006', NULL, '2023-02-27 18:49:07', 'B902');
INSERT INTO `comuni` VALUES ('006041', 'Casasco', '006', NULL, '2023-02-27 18:49:07', 'B941');
INSERT INTO `comuni` VALUES ('006042', 'Cassano Spinola', '006', NULL, '2023-02-27 18:49:07', 'C005');
INSERT INTO `comuni` VALUES ('006043', 'Cassine', '006', NULL, '2023-02-27 18:49:07', 'C027');
INSERT INTO `comuni` VALUES ('006044', 'Cassinelle', '006', NULL, '2023-02-27 18:49:07', 'C030');
INSERT INTO `comuni` VALUES ('006045', 'Castellania', '006', NULL, '2023-02-27 18:49:07', 'C137');
INSERT INTO `comuni` VALUES ('006046', 'Castellar Guidobono', '006', NULL, '2023-02-27 18:49:07', 'C142');
INSERT INTO `comuni` VALUES ('006047', 'Castellazzo Bormida', '006', NULL, '2023-02-27 18:49:07', 'C148');
INSERT INTO `comuni` VALUES ('006048', 'Castelletto d\'Erro', '006', NULL, '2023-02-27 18:49:07', 'C156');
INSERT INTO `comuni` VALUES ('006049', 'Castelletto d\'Orba', '006', NULL, '2023-02-27 18:49:07', 'C158');
INSERT INTO `comuni` VALUES ('006050', 'Castelletto Merli', '006', NULL, '2023-02-27 18:49:07', 'C160');
INSERT INTO `comuni` VALUES ('006051', 'Castelletto Monferrato', '006', NULL, '2023-02-27 18:49:07', 'C162');
INSERT INTO `comuni` VALUES ('006052', 'Castelnuovo Bormida', '006', NULL, '2023-02-27 18:49:07', 'C229');
INSERT INTO `comuni` VALUES ('006053', 'Castelnuovo Scrivia', '006', NULL, '2023-02-27 18:49:07', 'C243');
INSERT INTO `comuni` VALUES ('006054', 'Castelspina', '006', NULL, '2023-02-27 18:49:07', 'C274');
INSERT INTO `comuni` VALUES ('006055', 'Cavatore', '006', NULL, '2023-02-27 18:49:07', 'C387');
INSERT INTO `comuni` VALUES ('006056', 'Cella Monte', '006', NULL, '2023-02-27 18:49:07', 'C432');
INSERT INTO `comuni` VALUES ('006057', 'Cereseto', '006', NULL, '2023-02-27 18:49:07', 'C503');
INSERT INTO `comuni` VALUES ('006058', 'Cerreto Grue', '006', NULL, '2023-02-27 18:49:07', 'C507');
INSERT INTO `comuni` VALUES ('006059', 'Cerrina Monferrato', '006', NULL, '2023-02-27 18:49:07', 'C531');
INSERT INTO `comuni` VALUES ('006060', 'Coniolo', '006', NULL, '2023-02-27 18:49:07', 'C962');
INSERT INTO `comuni` VALUES ('006061', 'Conzano', '006', NULL, '2023-02-27 18:49:07', 'C977');
INSERT INTO `comuni` VALUES ('006062', 'Costa Vescovato', '006', NULL, '2023-02-27 18:49:07', 'D102');
INSERT INTO `comuni` VALUES ('006063', 'Cremolino', '006', NULL, '2023-02-27 18:49:07', 'D149');
INSERT INTO `comuni` VALUES ('006064', 'Cuccaro Monferrato', '006', NULL, '2023-02-27 18:49:07', 'D194');
INSERT INTO `comuni` VALUES ('006065', 'Denice', '006', NULL, '2023-02-27 18:49:07', 'D272');
INSERT INTO `comuni` VALUES ('006066', 'Dernice', '006', NULL, '2023-02-27 18:49:07', 'D277');
INSERT INTO `comuni` VALUES ('006067', 'Fabbrica Curone', '006', NULL, '2023-02-27 18:49:07', 'D447');
INSERT INTO `comuni` VALUES ('006068', 'Felizzano', '006', NULL, '2023-02-27 18:49:07', 'D528');
INSERT INTO `comuni` VALUES ('006069', 'Fraconalto', '006', NULL, '2023-02-27 18:49:07', 'D559');
INSERT INTO `comuni` VALUES ('006070', 'Francavilla Bisio', '006', NULL, '2023-02-27 18:49:07', 'D759');
INSERT INTO `comuni` VALUES ('006071', 'Frascaro', '006', NULL, '2023-02-27 18:49:07', 'D770');
INSERT INTO `comuni` VALUES ('006072', 'Frassinello Monferrato', '006', NULL, '2023-02-27 18:49:07', 'D777');
INSERT INTO `comuni` VALUES ('006073', 'Frassineto Po', '006', NULL, '2023-02-27 18:49:07', 'D780');
INSERT INTO `comuni` VALUES ('006074', 'Fresonara', '006', NULL, '2023-02-27 18:49:07', 'D797');
INSERT INTO `comuni` VALUES ('006075', 'Frugarolo', '006', NULL, '2023-02-27 18:49:07', 'D813');
INSERT INTO `comuni` VALUES ('006076', 'Fubine', '006', NULL, '2023-02-27 18:49:07', 'D814');
INSERT INTO `comuni` VALUES ('006077', 'Gabiano', '006', NULL, '2023-02-27 18:49:07', 'D835');
INSERT INTO `comuni` VALUES ('006078', 'Gamalero', '006', NULL, '2023-02-27 18:49:07', 'D890');
INSERT INTO `comuni` VALUES ('006079', 'Garbagna', '006', NULL, '2023-02-27 18:49:07', 'D910');
INSERT INTO `comuni` VALUES ('006080', 'Gavazzana', '006', NULL, '2023-02-27 18:49:07', 'D941');
INSERT INTO `comuni` VALUES ('006081', 'Gavi', '006', NULL, '2023-02-27 18:49:07', 'D944');
INSERT INTO `comuni` VALUES ('006082', 'Giarole', '006', NULL, '2023-02-27 18:49:07', 'E015');
INSERT INTO `comuni` VALUES ('006083', 'Gremiasco', '006', NULL, '2023-02-27 18:49:07', 'E164');
INSERT INTO `comuni` VALUES ('006084', 'Grognardo', '006', NULL, '2023-02-27 18:49:07', 'E188');
INSERT INTO `comuni` VALUES ('006085', 'Grondona', '006', NULL, '2023-02-27 18:49:07', 'E191');
INSERT INTO `comuni` VALUES ('006086', 'Guazzora', '006', NULL, '2023-02-27 18:49:07', 'E255');
INSERT INTO `comuni` VALUES ('006087', 'Isola Sant\'Antonio', '006', NULL, '2023-02-27 18:49:07', 'E360');
INSERT INTO `comuni` VALUES ('006088', 'Lerma', '006', NULL, '2023-02-27 18:49:07', 'E543');
INSERT INTO `comuni` VALUES ('006089', 'Lu', '006', NULL, '2023-02-27 18:49:07', 'E712');
INSERT INTO `comuni` VALUES ('006090', 'Malvicino', '006', NULL, '2023-02-27 18:49:07', 'E870');
INSERT INTO `comuni` VALUES ('006091', 'Masio', '006', NULL, '2023-02-27 18:49:07', 'F015');
INSERT INTO `comuni` VALUES ('006092', 'Melazzo', '006', NULL, '2023-02-27 18:49:07', 'F096');
INSERT INTO `comuni` VALUES ('006093', 'Merana', '006', NULL, '2023-02-27 18:49:07', 'F131');
INSERT INTO `comuni` VALUES ('006094', 'Mirabello Monferrato', '006', NULL, '2023-02-27 18:49:07', 'F232');
INSERT INTO `comuni` VALUES ('006095', 'Molare', '006', NULL, '2023-02-27 18:49:07', 'F281');
INSERT INTO `comuni` VALUES ('006096', 'Molino dei Torti', '006', NULL, '2023-02-27 18:49:07', 'F293');
INSERT INTO `comuni` VALUES ('006097', 'Mombello Monferrato', '006', NULL, '2023-02-27 18:49:07', 'F313');
INSERT INTO `comuni` VALUES ('006098', 'Momperone', '006', NULL, '2023-02-27 18:49:07', 'F320');
INSERT INTO `comuni` VALUES ('006099', 'Moncestino', '006', NULL, '2023-02-27 18:49:07', 'F337');
INSERT INTO `comuni` VALUES ('006100', 'Mongiardino Ligure', '006', NULL, '2023-02-27 18:49:07', 'F365');
INSERT INTO `comuni` VALUES ('006101', 'Monleale', '006', NULL, '2023-02-27 18:49:07', 'F374');
INSERT INTO `comuni` VALUES ('006102', 'Montacuto', '006', NULL, '2023-02-27 18:49:07', 'F387');
INSERT INTO `comuni` VALUES ('006103', 'Montaldeo', '006', NULL, '2023-02-27 18:49:07', 'F403');
INSERT INTO `comuni` VALUES ('006104', 'Montaldo Bormida', '006', NULL, '2023-02-27 18:49:07', 'F404');
INSERT INTO `comuni` VALUES ('006105', 'Montecastello', '006', NULL, '2023-02-27 18:49:07', 'F455');
INSERT INTO `comuni` VALUES ('006106', 'Montechiaro d\'Acqui', '006', NULL, '2023-02-27 18:49:07', 'F469');
INSERT INTO `comuni` VALUES ('006107', 'Montegioco', '006', NULL, '2023-02-27 18:49:07', 'F518');
INSERT INTO `comuni` VALUES ('006108', 'Montemarzino', '006', NULL, '2023-02-27 18:49:07', 'F562');
INSERT INTO `comuni` VALUES ('006109', 'Morano sul Po', '006', NULL, '2023-02-27 18:49:07', 'F707');
INSERT INTO `comuni` VALUES ('006110', 'Morbello', '006', NULL, '2023-02-27 18:49:07', 'F713');
INSERT INTO `comuni` VALUES ('006111', 'Mornese', '006', NULL, '2023-02-27 18:49:07', 'F737');
INSERT INTO `comuni` VALUES ('006112', 'Morsasco', '006', NULL, '2023-02-27 18:49:07', 'F751');
INSERT INTO `comuni` VALUES ('006113', 'Murisengo', '006', NULL, '2023-02-27 18:49:07', 'F814');
INSERT INTO `comuni` VALUES ('006114', 'Novi Ligure', '006', NULL, '2023-02-27 18:49:07', 'F965');
INSERT INTO `comuni` VALUES ('006115', 'Occimiano', '006', NULL, '2023-02-27 18:49:07', 'F995');
INSERT INTO `comuni` VALUES ('006116', 'Odalengo Grande', '006', NULL, '2023-02-27 18:49:07', 'F997');
INSERT INTO `comuni` VALUES ('006117', 'Odalengo Piccolo', '006', NULL, '2023-02-27 18:49:07', 'F998');
INSERT INTO `comuni` VALUES ('006118', 'Olivola', '006', NULL, '2023-02-27 18:49:07', 'G042');
INSERT INTO `comuni` VALUES ('006119', 'Orsara Bormida', '006', NULL, '2023-02-27 18:49:07', 'G124');
INSERT INTO `comuni` VALUES ('006120', 'Ottiglio', '006', NULL, '2023-02-27 18:49:07', 'G193');
INSERT INTO `comuni` VALUES ('006121', 'Ovada', '006', NULL, '2023-02-27 18:49:07', 'G197');
INSERT INTO `comuni` VALUES ('006122', 'Oviglio', '006', NULL, '2023-02-27 18:49:07', 'G199');
INSERT INTO `comuni` VALUES ('006123', 'Ozzano Monferrato', '006', NULL, '2023-02-27 18:49:07', 'G204');
INSERT INTO `comuni` VALUES ('006124', 'Paderna', '006', NULL, '2023-02-27 18:49:07', 'G215');
INSERT INTO `comuni` VALUES ('006125', 'Pareto', '006', NULL, '2023-02-27 18:49:07', 'G334');
INSERT INTO `comuni` VALUES ('006126', 'Parodi Ligure', '006', NULL, '2023-02-27 18:49:07', 'G338');
INSERT INTO `comuni` VALUES ('006127', 'Pasturana', '006', NULL, '2023-02-27 18:49:07', 'G367');
INSERT INTO `comuni` VALUES ('006128', 'Pecetto di Valenza', '006', NULL, '2023-02-27 18:49:07', 'G397');
INSERT INTO `comuni` VALUES ('006129', 'Pietra Marazzi', '006', NULL, '2023-02-27 18:49:07', 'G619');
INSERT INTO `comuni` VALUES ('006130', 'Piovera', '006', NULL, '2023-02-27 18:49:07', 'G695');
INSERT INTO `comuni` VALUES ('006131', 'Pomaro Monferrato', '006', NULL, '2023-02-27 18:49:07', 'G807');
INSERT INTO `comuni` VALUES ('006132', 'Pontecurone', '006', NULL, '2023-02-27 18:49:07', 'G839');
INSERT INTO `comuni` VALUES ('006133', 'Pontestura', '006', NULL, '2023-02-27 18:49:07', 'G858');
INSERT INTO `comuni` VALUES ('006134', 'Ponti', '006', NULL, '2023-02-27 18:49:07', 'G861');
INSERT INTO `comuni` VALUES ('006135', 'Ponzano Monferrato', '006', NULL, '2023-02-27 18:49:07', 'G872');
INSERT INTO `comuni` VALUES ('006136', 'Ponzone', '006', NULL, '2023-02-27 18:49:07', 'G877');
INSERT INTO `comuni` VALUES ('006137', 'Pozzol Groppo', '006', NULL, '2023-02-27 18:49:07', 'G960');
INSERT INTO `comuni` VALUES ('006138', 'Pozzolo Formigaro', '006', NULL, '2023-02-27 18:49:07', 'G961');
INSERT INTO `comuni` VALUES ('006139', 'Prasco', '006', NULL, '2023-02-27 18:49:07', 'G987');
INSERT INTO `comuni` VALUES ('006140', 'Predosa', '006', NULL, '2023-02-27 18:49:07', 'H021');
INSERT INTO `comuni` VALUES ('006141', 'Quargnento', '006', NULL, '2023-02-27 18:49:07', 'H104');
INSERT INTO `comuni` VALUES ('006142', 'Quattordio', '006', NULL, '2023-02-27 18:49:07', 'H121');
INSERT INTO `comuni` VALUES ('006143', 'Ricaldone', '006', NULL, '2023-02-27 18:49:07', 'H272');
INSERT INTO `comuni` VALUES ('006144', 'Rivalta Bormida', '006', NULL, '2023-02-27 18:49:07', 'H334');
INSERT INTO `comuni` VALUES ('006145', 'Rivarone', '006', NULL, '2023-02-27 18:49:07', 'H343');
INSERT INTO `comuni` VALUES ('006146', 'Roccaforte Ligure', '006', NULL, '2023-02-27 18:49:07', 'H406');
INSERT INTO `comuni` VALUES ('006147', 'Rocca Grimalda', '006', NULL, '2023-02-27 18:49:07', 'H414');
INSERT INTO `comuni` VALUES ('006148', 'Rocchetta Ligure', '006', NULL, '2023-02-27 18:49:07', 'H465');
INSERT INTO `comuni` VALUES ('006149', 'Rosignano Monferrato', '006', NULL, '2023-02-27 18:49:07', 'H569');
INSERT INTO `comuni` VALUES ('006150', 'Sala Monferrato', '006', NULL, '2023-02-27 18:49:07', 'H677');
INSERT INTO `comuni` VALUES ('006151', 'Sale', '006', NULL, '2023-02-27 18:49:07', 'H694');
INSERT INTO `comuni` VALUES ('006152', 'San Cristoforo', '006', NULL, '2023-02-27 18:49:07', 'H810');
INSERT INTO `comuni` VALUES ('006153', 'San Giorgio Monferrato', '006', NULL, '2023-02-27 18:49:07', 'H878');
INSERT INTO `comuni` VALUES ('006154', 'San Salvatore Monferrato', '006', NULL, '2023-02-27 18:49:07', 'I144');
INSERT INTO `comuni` VALUES ('006155', 'San Sebastiano Curone', '006', NULL, '2023-02-27 18:49:07', 'I150');
INSERT INTO `comuni` VALUES ('006156', 'Sant\'Agata Fossili', '006', NULL, '2023-02-27 18:49:07', 'I190');
INSERT INTO `comuni` VALUES ('006157', 'Sardigliano', '006', NULL, '2023-02-27 18:49:07', 'I429');
INSERT INTO `comuni` VALUES ('006158', 'Sarezzano', '006', NULL, '2023-02-27 18:49:07', 'I432');
INSERT INTO `comuni` VALUES ('006159', 'Serralunga di Crea', '006', NULL, '2023-02-27 18:49:07', 'I645');
INSERT INTO `comuni` VALUES ('006160', 'Serravalle Scrivia', '006', NULL, '2023-02-27 18:49:07', 'I657');
INSERT INTO `comuni` VALUES ('006161', 'Sezzadio', '006', NULL, '2023-02-27 18:49:07', 'I711');
INSERT INTO `comuni` VALUES ('006162', 'Silvano d\'Orba', '006', NULL, '2023-02-27 18:49:07', 'I738');
INSERT INTO `comuni` VALUES ('006163', 'Solero', '006', NULL, '2023-02-27 18:49:07', 'I798');
INSERT INTO `comuni` VALUES ('006164', 'Solonghello', '006', NULL, '2023-02-27 18:49:07', 'I808');
INSERT INTO `comuni` VALUES ('006165', 'Spigno Monferrato', '006', NULL, '2023-02-27 18:49:07', 'I901');
INSERT INTO `comuni` VALUES ('006166', 'Spineto Scrivia', '006', NULL, '2023-02-27 18:49:07', 'I911');
INSERT INTO `comuni` VALUES ('006167', 'Stazzano', '006', NULL, '2023-02-27 18:49:07', 'I941');
INSERT INTO `comuni` VALUES ('006168', 'Strevi', '006', NULL, '2023-02-27 18:49:07', 'I977');
INSERT INTO `comuni` VALUES ('006169', 'Tagliolo Monferrato', '006', NULL, '2023-02-27 18:49:07', 'L027');
INSERT INTO `comuni` VALUES ('006170', 'Tassarolo', '006', NULL, '2023-02-27 18:49:07', 'L059');
INSERT INTO `comuni` VALUES ('006171', 'Terruggia', '006', NULL, '2023-02-27 18:49:07', 'L139');
INSERT INTO `comuni` VALUES ('006172', 'Terzo', '006', NULL, '2023-02-27 18:49:07', 'L143');
INSERT INTO `comuni` VALUES ('006173', 'Ticineto', '006', NULL, '2023-02-27 18:49:07', 'L165');
INSERT INTO `comuni` VALUES ('006174', 'Tortona', '006', NULL, '2023-02-27 18:49:07', 'L304');
INSERT INTO `comuni` VALUES ('006175', 'Treville', '006', NULL, '2023-02-27 18:49:07', 'L403');
INSERT INTO `comuni` VALUES ('006176', 'Trisobbio', '006', NULL, '2023-02-27 18:49:07', 'L432');
INSERT INTO `comuni` VALUES ('006177', 'Valenza', '006', NULL, '2023-02-27 18:49:07', 'L570');
INSERT INTO `comuni` VALUES ('006178', 'Valmacca', '006', NULL, '2023-02-27 18:49:07', 'L633');
INSERT INTO `comuni` VALUES ('006179', 'Vignale Monferrato', '006', NULL, '2023-02-27 18:49:07', 'L881');
INSERT INTO `comuni` VALUES ('006180', 'Vignole Borbera', '006', NULL, '2023-02-27 18:49:07', 'L887');
INSERT INTO `comuni` VALUES ('006181', 'Viguzzolo', '006', NULL, '2023-02-27 18:49:07', 'L904');
INSERT INTO `comuni` VALUES ('006182', 'Villadeati', '006', NULL, '2023-02-27 18:49:07', 'L931');
INSERT INTO `comuni` VALUES ('006183', 'Villalvernia', '006', NULL, '2023-02-27 18:49:07', 'L963');
INSERT INTO `comuni` VALUES ('006184', 'Villamiroglio', '006', NULL, '2023-02-27 18:49:07', 'L970');
INSERT INTO `comuni` VALUES ('006185', 'Villanova Monferrato', '006', NULL, '2023-02-27 18:49:07', 'L972');
INSERT INTO `comuni` VALUES ('006186', 'Villaromagnano', '006', NULL, '2023-02-27 18:49:07', 'M009');
INSERT INTO `comuni` VALUES ('006187', 'Visone', '006', NULL, '2023-02-27 18:49:07', 'M077');
INSERT INTO `comuni` VALUES ('006188', 'Volpedo', '006', NULL, '2023-02-27 18:49:07', 'M120');
INSERT INTO `comuni` VALUES ('006189', 'Volpeglino', '006', NULL, '2023-02-27 18:49:07', 'M121');
INSERT INTO `comuni` VALUES ('006190', 'Voltaggio', '006', NULL, '2023-02-27 18:49:07', 'M123');
INSERT INTO `comuni` VALUES ('007001', 'Allein', '007', NULL, '2023-02-27 18:49:07', 'A205');
INSERT INTO `comuni` VALUES ('007002', 'Antey-Saint-André', '007', NULL, '2023-02-27 18:49:07', 'A305');
INSERT INTO `comuni` VALUES ('007003', 'Aosta', '007', NULL, '2023-02-27 18:49:07', 'A326');
INSERT INTO `comuni` VALUES ('007004', 'Arnad', '007', NULL, '2023-02-27 18:49:07', 'A424');
INSERT INTO `comuni` VALUES ('007005', 'Arvier', '007', NULL, '2023-02-27 18:49:07', 'A452');
INSERT INTO `comuni` VALUES ('007006', 'Avise', '007', NULL, '2023-02-27 18:49:07', 'A521');
INSERT INTO `comuni` VALUES ('007007', 'Ayas', '007', NULL, '2023-02-27 18:49:07', 'A094');
INSERT INTO `comuni` VALUES ('007008', 'Aymavilles', '007', NULL, '2023-02-27 18:49:07', 'A108');
INSERT INTO `comuni` VALUES ('007009', 'Bard', '007', NULL, '2023-02-27 18:49:07', 'A643');
INSERT INTO `comuni` VALUES ('007010', 'Bionaz', '007', NULL, '2023-02-27 18:49:07', 'A877');
INSERT INTO `comuni` VALUES ('007011', 'Brissogne', '007', NULL, '2023-02-27 18:49:07', 'B192');
INSERT INTO `comuni` VALUES ('007012', 'Brusson', '007', NULL, '2023-02-27 18:49:07', 'B230');
INSERT INTO `comuni` VALUES ('007013', 'Challand-Saint-Anselme', '007', NULL, '2023-02-27 18:49:07', 'C593');
INSERT INTO `comuni` VALUES ('007014', 'Challand-Saint-Victor', '007', NULL, '2023-02-27 18:49:07', 'C594');
INSERT INTO `comuni` VALUES ('007015', 'Chambave', '007', NULL, '2023-02-27 18:49:07', 'C595');
INSERT INTO `comuni` VALUES ('007016', 'Chamois', '007', NULL, '2023-02-27 18:49:07', 'B491');
INSERT INTO `comuni` VALUES ('007017', 'Champdepraz', '007', NULL, '2023-02-27 18:49:07', 'C596');
INSERT INTO `comuni` VALUES ('007018', 'Champorcher', '007', NULL, '2023-02-27 18:49:07', 'B540');
INSERT INTO `comuni` VALUES ('007019', 'Charvensod', '007', NULL, '2023-02-27 18:49:07', 'C598');
INSERT INTO `comuni` VALUES ('007020', 'Châtillon', '007', NULL, '2023-02-27 18:49:07', 'C294');
INSERT INTO `comuni` VALUES ('007021', 'Cogne', '007', NULL, '2023-02-27 18:49:07', 'C821');
INSERT INTO `comuni` VALUES ('007022', 'Courmayeur', '007', NULL, '2023-02-27 18:49:07', 'D012');
INSERT INTO `comuni` VALUES ('007023', 'Donnas', '007', NULL, '2023-02-27 18:49:07', 'D338');
INSERT INTO `comuni` VALUES ('007024', 'Doues', '007', NULL, '2023-02-27 18:49:07', 'D356');
INSERT INTO `comuni` VALUES ('007025', 'Emarèse', '007', NULL, '2023-02-27 18:49:07', 'D402');
INSERT INTO `comuni` VALUES ('007026', 'Etroubles', '007', NULL, '2023-02-27 18:49:07', 'D444');
INSERT INTO `comuni` VALUES ('007027', 'Fénis', '007', NULL, '2023-02-27 18:49:07', 'D537');
INSERT INTO `comuni` VALUES ('007028', 'Fontainemore', '007', NULL, '2023-02-27 18:49:07', 'D666');
INSERT INTO `comuni` VALUES ('007029', 'Gaby', '007', NULL, '2023-02-27 18:49:07', 'D839');
INSERT INTO `comuni` VALUES ('007030', 'Gignod', '007', NULL, '2023-02-27 18:49:07', 'E029');
INSERT INTO `comuni` VALUES ('007031', 'Gressan', '007', NULL, '2023-02-27 18:49:07', 'E165');
INSERT INTO `comuni` VALUES ('007032', 'Gressoney-La-Trinité', '007', NULL, '2023-02-27 18:49:07', 'E167');
INSERT INTO `comuni` VALUES ('007033', 'Gressoney-Saint-Jean', '007', NULL, '2023-02-27 18:49:07', 'E168');
INSERT INTO `comuni` VALUES ('007034', 'Hône', '007', NULL, '2023-02-27 18:49:07', 'E273');
INSERT INTO `comuni` VALUES ('007035', 'Introd', '007', NULL, '2023-02-27 18:49:07', 'E306');
INSERT INTO `comuni` VALUES ('007036', 'Issime', '007', NULL, '2023-02-27 18:49:07', 'E369');
INSERT INTO `comuni` VALUES ('007037', 'Issogne', '007', NULL, '2023-02-27 18:49:07', 'E371');
INSERT INTO `comuni` VALUES ('007038', 'Jovençan', '007', NULL, '2023-02-27 18:49:07', 'E391');
INSERT INTO `comuni` VALUES ('007039', 'La Magdeleine', '007', NULL, '2023-02-27 18:49:07', 'A308');
INSERT INTO `comuni` VALUES ('007040', 'La Salle', '007', NULL, '2023-02-27 18:49:07', 'E458');
INSERT INTO `comuni` VALUES ('007041', 'La Thuile', '007', NULL, '2023-02-27 18:49:07', 'E470');
INSERT INTO `comuni` VALUES ('007042', 'Lillianes', '007', NULL, '2023-02-27 18:49:07', 'E587');
INSERT INTO `comuni` VALUES ('007043', 'Montjovet', '007', NULL, '2023-02-27 18:49:07', 'F367');
INSERT INTO `comuni` VALUES ('007044', 'Morgex', '007', NULL, '2023-02-27 18:49:07', 'F726');
INSERT INTO `comuni` VALUES ('007045', 'Nus', '007', NULL, '2023-02-27 18:49:07', 'F987');
INSERT INTO `comuni` VALUES ('007046', 'Ollomont', '007', NULL, '2023-02-27 18:49:07', 'G045');
INSERT INTO `comuni` VALUES ('007047', 'Oyace', '007', NULL, '2023-02-27 18:49:07', 'G012');
INSERT INTO `comuni` VALUES ('007048', 'Perloz', '007', NULL, '2023-02-27 18:49:07', 'G459');
INSERT INTO `comuni` VALUES ('007049', 'Pollein', '007', NULL, '2023-02-27 18:49:07', 'G794');
INSERT INTO `comuni` VALUES ('007050', 'Pontboset', '007', NULL, '2023-02-27 18:49:07', 'G545');
INSERT INTO `comuni` VALUES ('007051', 'Pontey', '007', NULL, '2023-02-27 18:49:07', 'G860');
INSERT INTO `comuni` VALUES ('007052', 'Pont-Saint-Martin', '007', NULL, '2023-02-27 18:49:07', 'G854');
INSERT INTO `comuni` VALUES ('007053', 'Pré-Saint-Didier', '007', NULL, '2023-02-27 18:49:07', 'H042');
INSERT INTO `comuni` VALUES ('007054', 'Quart', '007', NULL, '2023-02-27 18:49:07', 'H110');
INSERT INTO `comuni` VALUES ('007055', 'Rhêmes-Notre-Dame', '007', NULL, '2023-02-27 18:49:07', 'H262');
INSERT INTO `comuni` VALUES ('007056', 'Rhêmes-Saint-Georges', '007', NULL, '2023-02-27 18:49:07', 'H263');
INSERT INTO `comuni` VALUES ('007057', 'Roisan', '007', NULL, '2023-02-27 18:49:07', 'H497');
INSERT INTO `comuni` VALUES ('007058', 'Saint-Christophe', '007', NULL, '2023-02-27 18:49:07', 'H669');
INSERT INTO `comuni` VALUES ('007059', 'Saint-Denis', '007', NULL, '2023-02-27 18:49:07', 'H670');
INSERT INTO `comuni` VALUES ('007060', 'Saint-Marcel', '007', NULL, '2023-02-27 18:49:07', 'H671');
INSERT INTO `comuni` VALUES ('007061', 'Saint-Nicolas', '007', NULL, '2023-02-27 18:49:07', 'H672');
INSERT INTO `comuni` VALUES ('007062', 'Saint-Oyen', '007', NULL, '2023-02-27 18:49:07', 'H673');
INSERT INTO `comuni` VALUES ('007063', 'Saint-Pierre', '007', NULL, '2023-02-27 18:49:07', 'H674');
INSERT INTO `comuni` VALUES ('007064', 'Saint-Rhémy-en-Bosses', '007', NULL, '2023-02-27 18:49:07', 'H675');
INSERT INTO `comuni` VALUES ('007065', 'Saint-Vincent', '007', NULL, '2023-02-27 18:49:07', 'H676');
INSERT INTO `comuni` VALUES ('007066', 'Sarre', '007', NULL, '2023-02-27 18:49:07', 'I442');
INSERT INTO `comuni` VALUES ('007067', 'Torgnon', '007', NULL, '2023-02-27 18:49:07', 'L217');
INSERT INTO `comuni` VALUES ('007068', 'Valgrisenche', '007', NULL, '2023-02-27 18:49:07', 'L582');
INSERT INTO `comuni` VALUES ('007069', 'Valpelline', '007', NULL, '2023-02-27 18:49:07', 'L643');
INSERT INTO `comuni` VALUES ('007070', 'Valsavarenche', '007', NULL, '2023-02-27 18:49:07', 'L647');
INSERT INTO `comuni` VALUES ('007071', 'Valtournenche', '007', NULL, '2023-02-27 18:49:07', 'L654');
INSERT INTO `comuni` VALUES ('007072', 'Verrayes', '007', NULL, '2023-02-27 18:49:07', 'L783');
INSERT INTO `comuni` VALUES ('007073', 'Verrès', '007', NULL, '2023-02-27 18:49:07', 'C282');
INSERT INTO `comuni` VALUES ('007074', 'Villeneuve', '007', NULL, '2023-02-27 18:49:07', 'L981');
INSERT INTO `comuni` VALUES ('008001', 'Airole', '008', NULL, '2023-02-27 18:49:07', 'A111');
INSERT INTO `comuni` VALUES ('008002', 'Apricale', '008', NULL, '2023-02-27 18:49:07', 'A338');
INSERT INTO `comuni` VALUES ('008003', 'Aquila d\'Arroscia', '008', NULL, '2023-02-27 18:49:07', 'A344');
INSERT INTO `comuni` VALUES ('008004', 'Armo', '008', NULL, '2023-02-27 18:49:07', 'A418');
INSERT INTO `comuni` VALUES ('008005', 'Aurigo', '008', NULL, '2023-02-27 18:49:07', 'A499');
INSERT INTO `comuni` VALUES ('008006', 'Badalucco', '008', NULL, '2023-02-27 18:49:07', 'A536');
INSERT INTO `comuni` VALUES ('008007', 'Bajardo', '008', NULL, '2023-02-27 18:49:07', 'A581');
INSERT INTO `comuni` VALUES ('008008', 'Bordighera', '008', NULL, '2023-02-27 18:49:07', 'A984');
INSERT INTO `comuni` VALUES ('008009', 'Borghetto d\'Arroscia', '008', NULL, '2023-02-27 18:49:07', 'A993');
INSERT INTO `comuni` VALUES ('008010', 'Borgomaro', '008', NULL, '2023-02-27 18:49:07', 'B020');
INSERT INTO `comuni` VALUES ('008011', 'Camporosso', '008', NULL, '2023-02-27 18:49:07', 'B559');
INSERT INTO `comuni` VALUES ('008012', 'Caravonica', '008', NULL, '2023-02-27 18:49:07', 'B734');
INSERT INTO `comuni` VALUES ('008013', 'Carpasio', '008', NULL, '2023-02-27 18:49:07', 'B814');
INSERT INTO `comuni` VALUES ('008014', 'Castellaro', '008', NULL, '2023-02-27 18:49:07', 'C143');
INSERT INTO `comuni` VALUES ('008015', 'Castel Vittorio', '008', NULL, '2023-02-27 18:49:07', 'C110');
INSERT INTO `comuni` VALUES ('008016', 'Ceriana', '008', NULL, '2023-02-27 18:49:07', 'C511');
INSERT INTO `comuni` VALUES ('008017', 'Cervo', '008', NULL, '2023-02-27 18:49:07', 'C559');
INSERT INTO `comuni` VALUES ('008018', 'Cesio', '008', NULL, '2023-02-27 18:49:07', 'C578');
INSERT INTO `comuni` VALUES ('008019', 'Chiusanico', '008', NULL, '2023-02-27 18:49:07', 'C657');
INSERT INTO `comuni` VALUES ('008020', 'Chiusavecchia', '008', NULL, '2023-02-27 18:49:07', 'C660');
INSERT INTO `comuni` VALUES ('008021', 'Cipressa', '008', NULL, '2023-02-27 18:49:07', 'C718');
INSERT INTO `comuni` VALUES ('008022', 'Civezza', '008', NULL, '2023-02-27 18:49:07', 'C755');
INSERT INTO `comuni` VALUES ('008023', 'Cosio d\'Arroscia', '008', NULL, '2023-02-27 18:49:07', 'D087');
INSERT INTO `comuni` VALUES ('008024', 'Costarainera', '008', NULL, '2023-02-27 18:49:07', 'D114');
INSERT INTO `comuni` VALUES ('008025', 'Diano Arentino', '008', NULL, '2023-02-27 18:49:07', 'D293');
INSERT INTO `comuni` VALUES ('008026', 'Diano Castello', '008', NULL, '2023-02-27 18:49:07', 'D296');
INSERT INTO `comuni` VALUES ('008027', 'Diano Marina', '008', NULL, '2023-02-27 18:49:07', 'D297');
INSERT INTO `comuni` VALUES ('008028', 'Diano San Pietro', '008', NULL, '2023-02-27 18:49:07', 'D298');
INSERT INTO `comuni` VALUES ('008029', 'Dolceacqua', '008', NULL, '2023-02-27 18:49:07', 'D318');
INSERT INTO `comuni` VALUES ('008030', 'Dolcedo', '008', NULL, '2023-02-27 18:49:07', 'D319');
INSERT INTO `comuni` VALUES ('008031', 'Imperia', '008', NULL, '2023-02-27 18:49:07', 'E290');
INSERT INTO `comuni` VALUES ('008032', 'Isolabona', '008', NULL, '2023-02-27 18:49:07', 'E346');
INSERT INTO `comuni` VALUES ('008033', 'Lucinasco', '008', NULL, '2023-02-27 18:49:07', 'E719');
INSERT INTO `comuni` VALUES ('008034', 'Mendatica', '008', NULL, '2023-02-27 18:49:07', 'F123');
INSERT INTO `comuni` VALUES ('008035', 'Molini di Triora', '008', NULL, '2023-02-27 18:49:07', 'F290');
INSERT INTO `comuni` VALUES ('008036', 'Montalto Ligure', '008', NULL, '2023-02-27 18:49:07', 'F406');
INSERT INTO `comuni` VALUES ('008037', 'Montegrosso Pian Latte', '008', NULL, '2023-02-27 18:49:07', 'F528');
INSERT INTO `comuni` VALUES ('008038', 'Olivetta San Michele', '008', NULL, '2023-02-27 18:49:07', 'G041');
INSERT INTO `comuni` VALUES ('008039', 'Ospedaletti', '008', NULL, '2023-02-27 18:49:07', 'G164');
INSERT INTO `comuni` VALUES ('008040', 'Perinaldo', '008', NULL, '2023-02-27 18:49:07', 'G454');
INSERT INTO `comuni` VALUES ('008041', 'Pietrabruna', '008', NULL, '2023-02-27 18:49:07', 'G607');
INSERT INTO `comuni` VALUES ('008042', 'Pieve di Teco', '008', NULL, '2023-02-27 18:49:07', 'G632');
INSERT INTO `comuni` VALUES ('008043', 'Pigna', '008', NULL, '2023-02-27 18:49:07', 'G660');
INSERT INTO `comuni` VALUES ('008044', 'Pompeiana', '008', NULL, '2023-02-27 18:49:07', 'G814');
INSERT INTO `comuni` VALUES ('008045', 'Pontedassio', '008', NULL, '2023-02-27 18:49:07', 'G840');
INSERT INTO `comuni` VALUES ('008046', 'Pornassio', '008', NULL, '2023-02-27 18:49:07', 'G890');
INSERT INTO `comuni` VALUES ('008047', 'Prelà', '008', NULL, '2023-02-27 18:49:07', 'H027');
INSERT INTO `comuni` VALUES ('008048', 'Ranzo', '008', NULL, '2023-02-27 18:49:07', 'H180');
INSERT INTO `comuni` VALUES ('008049', 'Rezzo', '008', NULL, '2023-02-27 18:49:07', 'H257');
INSERT INTO `comuni` VALUES ('008050', 'Riva Ligure', '008', NULL, '2023-02-27 18:49:07', 'H328');
INSERT INTO `comuni` VALUES ('008051', 'Rocchetta Nervina', '008', NULL, '2023-02-27 18:49:07', 'H460');
INSERT INTO `comuni` VALUES ('008052', 'San Bartolomeo al Mare', '008', NULL, '2023-02-27 18:49:07', 'H763');
INSERT INTO `comuni` VALUES ('008053', 'San Biagio della Cima', '008', NULL, '2023-02-27 18:49:07', 'H780');
INSERT INTO `comuni` VALUES ('008054', 'San Lorenzo al Mare', '008', NULL, '2023-02-27 18:49:07', 'H957');
INSERT INTO `comuni` VALUES ('008055', 'Sanremo', '008', NULL, '2023-02-27 18:49:07', 'I138');
INSERT INTO `comuni` VALUES ('008056', 'Santo Stefano al Mare', '008', NULL, '2023-02-27 18:49:07', 'I365');
INSERT INTO `comuni` VALUES ('008057', 'Seborga', '008', NULL, '2023-02-27 18:49:07', 'I556');
INSERT INTO `comuni` VALUES ('008058', 'Soldano', '008', NULL, '2023-02-27 18:49:07', 'I796');
INSERT INTO `comuni` VALUES ('008059', 'Taggia', '008', NULL, '2023-02-27 18:49:07', 'L024');
INSERT INTO `comuni` VALUES ('008060', 'Terzorio', '008', NULL, '2023-02-27 18:49:07', 'L146');
INSERT INTO `comuni` VALUES ('008061', 'Triora', '008', NULL, '2023-02-27 18:49:07', 'L430');
INSERT INTO `comuni` VALUES ('008062', 'Vallebona', '008', NULL, '2023-02-27 18:49:07', 'L596');
INSERT INTO `comuni` VALUES ('008063', 'Vallecrosia', '008', NULL, '2023-02-27 18:49:07', 'L599');
INSERT INTO `comuni` VALUES ('008064', 'Vasia', '008', NULL, '2023-02-27 18:49:07', 'L693');
INSERT INTO `comuni` VALUES ('008065', 'Ventimiglia', '008', NULL, '2023-02-27 18:49:07', 'L741');
INSERT INTO `comuni` VALUES ('008066', 'Vessalico', '008', NULL, '2023-02-27 18:49:07', 'L809');
INSERT INTO `comuni` VALUES ('008067', 'Villa Faraldi', '008', NULL, '2023-02-27 18:49:07', 'L943');
INSERT INTO `comuni` VALUES ('009001', 'Alassio', '009', NULL, '2023-02-27 18:49:07', 'A122');
INSERT INTO `comuni` VALUES ('009002', 'Albenga', '009', NULL, '2023-02-27 18:49:07', 'A145');
INSERT INTO `comuni` VALUES ('009003', 'Albissola Marina', '009', NULL, '2023-02-27 18:49:07', 'A165');
INSERT INTO `comuni` VALUES ('009004', 'Albisola Superiore', '009', NULL, '2023-02-27 18:49:07', 'A166');
INSERT INTO `comuni` VALUES ('009005', 'Altare', '009', NULL, '2023-02-27 18:49:07', 'A226');
INSERT INTO `comuni` VALUES ('009006', 'Andora', '009', NULL, '2023-02-27 18:49:07', 'A278');
INSERT INTO `comuni` VALUES ('009007', 'Arnasco', '009', NULL, '2023-02-27 18:49:07', 'A422');
INSERT INTO `comuni` VALUES ('009008', 'Balestrino', '009', NULL, '2023-02-27 18:49:07', 'A593');
INSERT INTO `comuni` VALUES ('009009', 'Bardineto', '009', NULL, '2023-02-27 18:49:07', 'A647');
INSERT INTO `comuni` VALUES ('009010', 'Bergeggi', '009', NULL, '2023-02-27 18:49:07', 'A796');
INSERT INTO `comuni` VALUES ('009011', 'Boissano', '009', NULL, '2023-02-27 18:49:07', 'A931');
INSERT INTO `comuni` VALUES ('009012', 'Borghetto Santo Spirito', '009', NULL, '2023-02-27 18:49:07', 'A999');
INSERT INTO `comuni` VALUES ('009013', 'Borgio Verezzi', '009', NULL, '2023-02-27 18:49:07', 'B005');
INSERT INTO `comuni` VALUES ('009014', 'Bormida', '009', NULL, '2023-02-27 18:49:07', 'B048');
INSERT INTO `comuni` VALUES ('009015', 'Cairo Montenotte', '009', NULL, '2023-02-27 18:49:07', 'B369');
INSERT INTO `comuni` VALUES ('009016', 'Calice Ligure', '009', NULL, '2023-02-27 18:49:07', 'B409');
INSERT INTO `comuni` VALUES ('009017', 'Calizzano', '009', NULL, '2023-02-27 18:49:07', 'B416');
INSERT INTO `comuni` VALUES ('009018', 'Carcare', '009', NULL, '2023-02-27 18:49:07', 'B748');
INSERT INTO `comuni` VALUES ('009019', 'Casanova Lerrone', '009', NULL, '2023-02-27 18:49:07', 'B927');
INSERT INTO `comuni` VALUES ('009020', 'Castelbianco', '009', NULL, '2023-02-27 18:49:07', 'C063');
INSERT INTO `comuni` VALUES ('009021', 'Castelvecchio di Rocca Barbena', '009', NULL, '2023-02-27 18:49:07', 'C276');
INSERT INTO `comuni` VALUES ('009022', 'Celle Ligure', '009', NULL, '2023-02-27 18:49:07', 'C443');
INSERT INTO `comuni` VALUES ('009023', 'Cengio', '009', NULL, '2023-02-27 18:49:07', 'C463');
INSERT INTO `comuni` VALUES ('009024', 'Ceriale', '009', NULL, '2023-02-27 18:49:07', 'C510');
INSERT INTO `comuni` VALUES ('009025', 'Cisano sul Neva', '009', NULL, '2023-02-27 18:49:07', 'C729');
INSERT INTO `comuni` VALUES ('009026', 'Cosseria', '009', NULL, '2023-02-27 18:49:07', 'D095');
INSERT INTO `comuni` VALUES ('009027', 'Dego', '009', NULL, '2023-02-27 18:49:07', 'D264');
INSERT INTO `comuni` VALUES ('009028', 'Erli', '009', NULL, '2023-02-27 18:49:07', 'D424');
INSERT INTO `comuni` VALUES ('009029', 'Finale Ligure', '009', NULL, '2023-02-27 18:49:07', 'D600');
INSERT INTO `comuni` VALUES ('009030', 'Garlenda', '009', NULL, '2023-02-27 18:49:07', 'D927');
INSERT INTO `comuni` VALUES ('009031', 'Giustenice', '009', NULL, '2023-02-27 18:49:07', 'E064');
INSERT INTO `comuni` VALUES ('009032', 'Giusvalla', '009', NULL, '2023-02-27 18:49:07', 'E066');
INSERT INTO `comuni` VALUES ('009033', 'Laigueglia', '009', NULL, '2023-02-27 18:49:07', 'E414');
INSERT INTO `comuni` VALUES ('009034', 'Loano', '009', NULL, '2023-02-27 18:49:07', 'E632');
INSERT INTO `comuni` VALUES ('009035', 'Magliolo', '009', NULL, '2023-02-27 18:49:07', 'E816');
INSERT INTO `comuni` VALUES ('009036', 'Mallare', '009', NULL, '2023-02-27 18:49:07', 'E860');
INSERT INTO `comuni` VALUES ('009037', 'Massimino', '009', NULL, '2023-02-27 18:49:07', 'F046');
INSERT INTO `comuni` VALUES ('009038', 'Millesimo', '009', NULL, '2023-02-27 18:49:07', 'F213');
INSERT INTO `comuni` VALUES ('009039', 'Mioglia', '009', NULL, '2023-02-27 18:49:07', 'F226');
INSERT INTO `comuni` VALUES ('009040', 'Murialdo', '009', NULL, '2023-02-27 18:49:07', 'F813');
INSERT INTO `comuni` VALUES ('009041', 'Nasino', '009', NULL, '2023-02-27 18:49:07', 'F847');
INSERT INTO `comuni` VALUES ('009042', 'Noli', '009', NULL, '2023-02-27 18:49:07', 'F926');
INSERT INTO `comuni` VALUES ('009043', 'Onzo', '009', NULL, '2023-02-27 18:49:07', 'G076');
INSERT INTO `comuni` VALUES ('009044', 'Orco Feglino', '009', NULL, '2023-02-27 18:49:07', 'D522');
INSERT INTO `comuni` VALUES ('009045', 'Ortovero', '009', NULL, '2023-02-27 18:49:07', 'G144');
INSERT INTO `comuni` VALUES ('009046', 'Osiglia', '009', NULL, '2023-02-27 18:49:07', 'G155');
INSERT INTO `comuni` VALUES ('009047', 'Pallare', '009', NULL, '2023-02-27 18:49:07', 'G281');
INSERT INTO `comuni` VALUES ('009048', 'Piana Crixia', '009', NULL, '2023-02-27 18:49:07', 'G542');
INSERT INTO `comuni` VALUES ('009049', 'Pietra Ligure', '009', NULL, '2023-02-27 18:49:07', 'G605');
INSERT INTO `comuni` VALUES ('009050', 'Plodio', '009', NULL, '2023-02-27 18:49:07', 'G741');
INSERT INTO `comuni` VALUES ('009051', 'Pontinvrea', '009', NULL, '2023-02-27 18:49:07', 'G866');
INSERT INTO `comuni` VALUES ('009052', 'Quiliano', '009', NULL, '2023-02-27 18:49:07', 'H126');
INSERT INTO `comuni` VALUES ('009053', 'Rialto', '009', NULL, '2023-02-27 18:49:07', 'H266');
INSERT INTO `comuni` VALUES ('009054', 'Roccavignale', '009', NULL, '2023-02-27 18:49:07', 'H452');
INSERT INTO `comuni` VALUES ('009055', 'Sassello', '009', NULL, '2023-02-27 18:49:07', 'I453');
INSERT INTO `comuni` VALUES ('009056', 'Savona', '009', NULL, '2023-02-27 18:49:07', 'I480');
INSERT INTO `comuni` VALUES ('009057', 'Spotorno', '009', NULL, '2023-02-27 18:49:07', 'I926');
INSERT INTO `comuni` VALUES ('009058', 'Stella', '009', NULL, '2023-02-27 18:49:07', 'I946');
INSERT INTO `comuni` VALUES ('009059', 'Stellanello', '009', NULL, '2023-02-27 18:49:07', 'I947');
INSERT INTO `comuni` VALUES ('009060', 'Testico', '009', NULL, '2023-02-27 18:49:07', 'L152');
INSERT INTO `comuni` VALUES ('009061', 'Toirano', '009', NULL, '2023-02-27 18:49:07', 'L190');
INSERT INTO `comuni` VALUES ('009062', 'Tovo San Giacomo', '009', NULL, '2023-02-27 18:49:07', 'L315');
INSERT INTO `comuni` VALUES ('009063', 'Urbe', '009', NULL, '2023-02-27 18:49:07', 'L499');
INSERT INTO `comuni` VALUES ('009064', 'Vado Ligure', '009', NULL, '2023-02-27 18:49:07', 'L528');
INSERT INTO `comuni` VALUES ('009065', 'Varazze', '009', NULL, '2023-02-27 18:49:07', 'L675');
INSERT INTO `comuni` VALUES ('009066', 'Vendone', '009', NULL, '2023-02-27 18:49:07', 'L730');
INSERT INTO `comuni` VALUES ('009067', 'Vezzi Portio', '009', NULL, '2023-02-27 18:49:07', 'L823');
INSERT INTO `comuni` VALUES ('009068', 'Villanova d\'Albenga', '009', NULL, '2023-02-27 18:49:07', 'L975');
INSERT INTO `comuni` VALUES ('009069', 'Zuccarello', '009', NULL, '2023-02-27 18:49:07', 'M197');
INSERT INTO `comuni` VALUES ('010001', 'Arenzano', '010', NULL, '2023-02-27 18:49:07', 'A388');
INSERT INTO `comuni` VALUES ('010002', 'Avegno', '010', NULL, '2023-02-27 18:49:07', 'A506');
INSERT INTO `comuni` VALUES ('010003', 'Bargagli', '010', NULL, '2023-02-27 18:49:07', 'A658');
INSERT INTO `comuni` VALUES ('010004', 'Bogliasco', '010', NULL, '2023-02-27 18:49:07', 'A922');
INSERT INTO `comuni` VALUES ('010005', 'Borzonasca', '010', NULL, '2023-02-27 18:49:07', 'B067');
INSERT INTO `comuni` VALUES ('010006', 'Busalla', '010', NULL, '2023-02-27 18:49:07', 'B282');
INSERT INTO `comuni` VALUES ('010007', 'Camogli', '010', NULL, '2023-02-27 18:49:07', 'B490');
INSERT INTO `comuni` VALUES ('010008', 'Campo Ligure', '010', NULL, '2023-02-27 18:49:07', 'B538');
INSERT INTO `comuni` VALUES ('010009', 'Campomorone', '010', NULL, '2023-02-27 18:49:07', 'B551');
INSERT INTO `comuni` VALUES ('010010', 'Carasco', '010', NULL, '2023-02-27 18:49:07', 'B726');
INSERT INTO `comuni` VALUES ('010011', 'Casarza Ligure', '010', NULL, '2023-02-27 18:49:07', 'B939');
INSERT INTO `comuni` VALUES ('010012', 'Casella', '010', NULL, '2023-02-27 18:49:07', 'B956');
INSERT INTO `comuni` VALUES ('010013', 'Castiglione Chiavarese', '010', NULL, '2023-02-27 18:49:07', 'C302');
INSERT INTO `comuni` VALUES ('010014', 'Ceranesi', '010', NULL, '2023-02-27 18:49:07', 'C481');
INSERT INTO `comuni` VALUES ('010015', 'Chiavari', '010', NULL, '2023-02-27 18:49:07', 'C621');
INSERT INTO `comuni` VALUES ('010016', 'Cicagna', '010', NULL, '2023-02-27 18:49:07', 'C673');
INSERT INTO `comuni` VALUES ('010017', 'Cogoleto', '010', NULL, '2023-02-27 18:49:07', 'C823');
INSERT INTO `comuni` VALUES ('010018', 'Cogorno', '010', NULL, '2023-02-27 18:49:07', 'C826');
INSERT INTO `comuni` VALUES ('010019', 'Coreglia Ligure', '010', NULL, '2023-02-27 18:49:07', 'C995');
INSERT INTO `comuni` VALUES ('010020', 'Crocefieschi', '010', NULL, '2023-02-27 18:49:07', 'D175');
INSERT INTO `comuni` VALUES ('010021', 'Davagna', '010', NULL, '2023-02-27 18:49:07', 'D255');
INSERT INTO `comuni` VALUES ('010022', 'Fascia', '010', NULL, '2023-02-27 18:49:07', 'D509');
INSERT INTO `comuni` VALUES ('010023', 'Favale di Malvaro', '010', NULL, '2023-02-27 18:49:07', 'D512');
INSERT INTO `comuni` VALUES ('010024', 'Fontanigorda', '010', NULL, '2023-02-27 18:49:07', 'D677');
INSERT INTO `comuni` VALUES ('010025', 'Genova', '010', NULL, '2023-02-27 18:49:07', 'D969');
INSERT INTO `comuni` VALUES ('010026', 'Gorreto', '010', NULL, '2023-02-27 18:49:07', 'E109');
INSERT INTO `comuni` VALUES ('010027', 'Isola del Cantone', '010', NULL, '2023-02-27 18:49:07', 'E341');
INSERT INTO `comuni` VALUES ('010028', 'Lavagna', '010', NULL, '2023-02-27 18:49:07', 'E488');
INSERT INTO `comuni` VALUES ('010029', 'Leivi', '010', NULL, '2023-02-27 18:49:07', 'E519');
INSERT INTO `comuni` VALUES ('010030', 'Lorsica', '010', NULL, '2023-02-27 18:49:07', 'E695');
INSERT INTO `comuni` VALUES ('010031', 'Lumarzo', '010', NULL, '2023-02-27 18:49:07', 'E737');
INSERT INTO `comuni` VALUES ('010032', 'Masone', '010', NULL, '2023-02-27 18:49:07', 'F020');
INSERT INTO `comuni` VALUES ('010033', 'Mele', '010', NULL, '2023-02-27 18:49:07', 'F098');
INSERT INTO `comuni` VALUES ('010034', 'Mezzanego', '010', NULL, '2023-02-27 18:49:07', 'F173');
INSERT INTO `comuni` VALUES ('010035', 'Mignanego', '010', NULL, '2023-02-27 18:49:07', 'F202');
INSERT INTO `comuni` VALUES ('010036', 'Moconesi', '010', NULL, '2023-02-27 18:49:07', 'F256');
INSERT INTO `comuni` VALUES ('010037', 'Moneglia', '010', NULL, '2023-02-27 18:49:07', 'F354');
INSERT INTO `comuni` VALUES ('010038', 'Montebruno', '010', NULL, '2023-02-27 18:49:07', 'F445');
INSERT INTO `comuni` VALUES ('010039', 'Montoggio', '010', NULL, '2023-02-27 18:49:07', 'F682');
INSERT INTO `comuni` VALUES ('010040', 'Ne', '010', NULL, '2023-02-27 18:49:07', 'F858');
INSERT INTO `comuni` VALUES ('010041', 'Neirone', '010', NULL, '2023-02-27 18:49:07', 'F862');
INSERT INTO `comuni` VALUES ('010042', 'Orero', '010', NULL, '2023-02-27 18:49:07', 'G093');
INSERT INTO `comuni` VALUES ('010043', 'Pieve Ligure', '010', NULL, '2023-02-27 18:49:07', 'G646');
INSERT INTO `comuni` VALUES ('010044', 'Portofino', '010', NULL, '2023-02-27 18:49:07', 'G913');
INSERT INTO `comuni` VALUES ('010045', 'Propata', '010', NULL, '2023-02-27 18:49:07', 'H073');
INSERT INTO `comuni` VALUES ('010046', 'Rapallo', '010', NULL, '2023-02-27 18:49:07', 'H183');
INSERT INTO `comuni` VALUES ('010047', 'Recco', '010', NULL, '2023-02-27 18:49:07', 'H212');
INSERT INTO `comuni` VALUES ('010048', 'Rezzoaglio', '010', NULL, '2023-02-27 18:49:07', 'H258');
INSERT INTO `comuni` VALUES ('010049', 'Ronco Scrivia', '010', NULL, '2023-02-27 18:49:07', 'H536');
INSERT INTO `comuni` VALUES ('010050', 'Rondanina', '010', NULL, '2023-02-27 18:49:07', 'H546');
INSERT INTO `comuni` VALUES ('010051', 'Rossiglione', '010', NULL, '2023-02-27 18:49:07', 'H581');
INSERT INTO `comuni` VALUES ('010052', 'Rovegno', '010', NULL, '2023-02-27 18:49:07', 'H599');
INSERT INTO `comuni` VALUES ('010053', 'San Colombano Certenoli', '010', NULL, '2023-02-27 18:49:07', 'H802');
INSERT INTO `comuni` VALUES ('010054', 'Santa Margherita Ligure', '010', NULL, '2023-02-27 18:49:07', 'I225');
INSERT INTO `comuni` VALUES ('010055', 'Sant\'Olcese', '010', NULL, '2023-02-27 18:49:07', 'I346');
INSERT INTO `comuni` VALUES ('010056', 'Santo Stefano d\'Aveto', '010', NULL, '2023-02-27 18:49:07', 'I368');
INSERT INTO `comuni` VALUES ('010057', 'Savignone', '010', NULL, '2023-02-27 18:49:07', 'I475');
INSERT INTO `comuni` VALUES ('010058', 'Serra Riccò', '010', NULL, '2023-02-27 18:49:07', 'I640');
INSERT INTO `comuni` VALUES ('010059', 'Sestri Levante', '010', NULL, '2023-02-27 18:49:07', 'I693');
INSERT INTO `comuni` VALUES ('010060', 'Sori', '010', NULL, '2023-02-27 18:49:07', 'I852');
INSERT INTO `comuni` VALUES ('010061', 'Tiglieto', '010', NULL, '2023-02-27 18:49:07', 'L167');
INSERT INTO `comuni` VALUES ('010062', 'Torriglia', '010', NULL, '2023-02-27 18:49:07', 'L298');
INSERT INTO `comuni` VALUES ('010063', 'Tribogna', '010', NULL, '2023-02-27 18:49:07', 'L416');
INSERT INTO `comuni` VALUES ('010064', 'Uscio', '010', NULL, '2023-02-27 18:49:07', 'L507');
INSERT INTO `comuni` VALUES ('010065', 'Valbrevenna', '010', NULL, '2023-02-27 18:49:07', 'L546');
INSERT INTO `comuni` VALUES ('010066', 'Vobbia', '010', NULL, '2023-02-27 18:49:07', 'M105');
INSERT INTO `comuni` VALUES ('010067', 'Zoagli', '010', NULL, '2023-02-27 18:49:07', 'M182');
INSERT INTO `comuni` VALUES ('011001', 'Ameglia', '011', NULL, '2023-02-27 18:49:07', 'A261');
INSERT INTO `comuni` VALUES ('011002', 'Arcola', '011', NULL, '2023-02-27 18:49:07', 'A373');
INSERT INTO `comuni` VALUES ('011003', 'Beverino', '011', NULL, '2023-02-27 18:49:07', 'A836');
INSERT INTO `comuni` VALUES ('011004', 'Bolano', '011', NULL, '2023-02-27 18:49:07', 'A932');
INSERT INTO `comuni` VALUES ('011005', 'Bonassola', '011', NULL, '2023-02-27 18:49:07', 'A961');
INSERT INTO `comuni` VALUES ('011006', 'Borghetto di Vara', '011', NULL, '2023-02-27 18:49:07', 'A992');
INSERT INTO `comuni` VALUES ('011007', 'Brugnato', '011', NULL, '2023-02-27 18:49:07', 'B214');
INSERT INTO `comuni` VALUES ('011008', 'Calice al Cornoviglio', '011', NULL, '2023-02-27 18:49:07', 'B410');
INSERT INTO `comuni` VALUES ('011009', 'Carro', '011', NULL, '2023-02-27 18:49:07', 'B838');
INSERT INTO `comuni` VALUES ('011010', 'Carrodano', '011', NULL, '2023-02-27 18:49:07', 'B839');
INSERT INTO `comuni` VALUES ('011011', 'Castelnuovo Magra', '011', NULL, '2023-02-27 18:49:07', 'C240');
INSERT INTO `comuni` VALUES ('011012', 'Deiva Marina', '011', NULL, '2023-02-27 18:49:07', 'D265');
INSERT INTO `comuni` VALUES ('011013', 'Follo', '011', NULL, '2023-02-27 18:49:07', 'D655');
INSERT INTO `comuni` VALUES ('011014', 'Framura', '011', NULL, '2023-02-27 18:49:07', 'D758');
INSERT INTO `comuni` VALUES ('011015', 'La Spezia', '011', NULL, '2023-02-27 18:49:07', 'E463');
INSERT INTO `comuni` VALUES ('011016', 'Lerici', '011', NULL, '2023-02-27 18:49:07', 'E542');
INSERT INTO `comuni` VALUES ('011017', 'Levanto', '011', NULL, '2023-02-27 18:49:07', 'E560');
INSERT INTO `comuni` VALUES ('011018', 'Maissana', '011', NULL, '2023-02-27 18:49:07', 'E842');
INSERT INTO `comuni` VALUES ('011019', 'Monterosso al Mare', '011', NULL, '2023-02-27 18:49:07', 'F609');
INSERT INTO `comuni` VALUES ('011020', 'Ortonovo', '011', NULL, '2023-02-27 18:49:07', 'G143');
INSERT INTO `comuni` VALUES ('011021', 'Pignone', '011', NULL, '2023-02-27 18:49:07', 'G664');
INSERT INTO `comuni` VALUES ('011022', 'Portovenere', '011', NULL, '2023-02-27 18:49:07', 'G925');
INSERT INTO `comuni` VALUES ('011023', 'Riccò del Golfo di Spezia', '011', NULL, '2023-02-27 18:49:07', 'H275');
INSERT INTO `comuni` VALUES ('011024', 'Riomaggiore', '011', NULL, '2023-02-27 18:49:07', 'H304');
INSERT INTO `comuni` VALUES ('011025', 'Rocchetta di Vara', '011', NULL, '2023-02-27 18:49:07', 'H461');
INSERT INTO `comuni` VALUES ('011026', 'Santo Stefano di Magra', '011', NULL, '2023-02-27 18:49:07', 'I363');
INSERT INTO `comuni` VALUES ('011027', 'Sarzana', '011', NULL, '2023-02-27 18:49:07', 'I449');
INSERT INTO `comuni` VALUES ('011028', 'Sesta Godano', '011', NULL, '2023-02-27 18:49:07', 'E070');
INSERT INTO `comuni` VALUES ('011029', 'Varese Ligure', '011', NULL, '2023-02-27 18:49:07', 'L681');
INSERT INTO `comuni` VALUES ('011030', 'Vernazza', '011', NULL, '2023-02-27 18:49:07', 'L774');
INSERT INTO `comuni` VALUES ('011031', 'Vezzano Ligure', '011', NULL, '2023-02-27 18:49:07', 'L819');
INSERT INTO `comuni` VALUES ('011032', 'Zignago', '011', NULL, '2023-02-27 18:49:07', 'M177');
INSERT INTO `comuni` VALUES ('012001', 'Agra', '012', NULL, '2023-02-27 18:49:07', 'A085');
INSERT INTO `comuni` VALUES ('012002', 'Albizzate', '012', NULL, '2023-02-27 18:49:07', 'A167');
INSERT INTO `comuni` VALUES ('012003', 'Angera', '012', NULL, '2023-02-27 18:49:07', 'A290');
INSERT INTO `comuni` VALUES ('012004', 'Arcisate', '012', NULL, '2023-02-27 18:49:07', 'A371');
INSERT INTO `comuni` VALUES ('012005', 'Arsago Seprio', '012', NULL, '2023-02-27 18:49:07', 'A441');
INSERT INTO `comuni` VALUES ('012006', 'Azzate', '012', NULL, '2023-02-27 18:49:07', 'A531');
INSERT INTO `comuni` VALUES ('012007', 'Azzio', '012', NULL, '2023-02-27 18:49:07', 'A532');
INSERT INTO `comuni` VALUES ('012008', 'Barasso', '012', NULL, '2023-02-27 18:49:07', 'A619');
INSERT INTO `comuni` VALUES ('012009', 'Bardello', '012', NULL, '2023-02-27 18:49:07', 'A645');
INSERT INTO `comuni` VALUES ('012010', 'Bedero Valcuvia', '012', NULL, '2023-02-27 18:49:07', 'A728');
INSERT INTO `comuni` VALUES ('012011', 'Besano', '012', NULL, '2023-02-27 18:49:07', 'A819');
INSERT INTO `comuni` VALUES ('012012', 'Besnate', '012', NULL, '2023-02-27 18:49:07', 'A825');
INSERT INTO `comuni` VALUES ('012013', 'Besozzo', '012', NULL, '2023-02-27 18:49:07', 'A826');
INSERT INTO `comuni` VALUES ('012014', 'Biandronno', '012', NULL, '2023-02-27 18:49:07', 'A845');
INSERT INTO `comuni` VALUES ('012015', 'Bisuschio', '012', NULL, '2023-02-27 18:49:07', 'A891');
INSERT INTO `comuni` VALUES ('012016', 'Bodio Lomnago', '012', NULL, '2023-02-27 18:49:07', 'A918');
INSERT INTO `comuni` VALUES ('012017', 'Brebbia', '012', NULL, '2023-02-27 18:49:07', 'B126');
INSERT INTO `comuni` VALUES ('012018', 'Bregano', '012', NULL, '2023-02-27 18:49:07', 'B131');
INSERT INTO `comuni` VALUES ('012019', 'Brenta', '012', NULL, '2023-02-27 18:49:07', 'B150');
INSERT INTO `comuni` VALUES ('012020', 'Brezzo di Bedero', '012', NULL, '2023-02-27 18:49:07', 'B166');
INSERT INTO `comuni` VALUES ('012021', 'Brinzio', '012', NULL, '2023-02-27 18:49:07', 'B182');
INSERT INTO `comuni` VALUES ('012022', 'Brissago-Valtravaglia', '012', NULL, '2023-02-27 18:49:07', 'B191');
INSERT INTO `comuni` VALUES ('012023', 'Brunello', '012', NULL, '2023-02-27 18:49:07', 'B219');
INSERT INTO `comuni` VALUES ('012024', 'Brusimpiano', '012', NULL, '2023-02-27 18:49:07', 'B228');
INSERT INTO `comuni` VALUES ('012025', 'Buguggiate', '012', NULL, '2023-02-27 18:49:07', 'B258');
INSERT INTO `comuni` VALUES ('012026', 'Busto Arsizio', '012', NULL, '2023-02-27 18:49:07', 'B300');
INSERT INTO `comuni` VALUES ('012027', 'Cadegliano-Viconago', '012', NULL, '2023-02-27 18:49:07', 'B326');
INSERT INTO `comuni` VALUES ('012028', 'Cadrezzate', '012', NULL, '2023-02-27 18:49:07', 'B347');
INSERT INTO `comuni` VALUES ('012029', 'Cairate', '012', NULL, '2023-02-27 18:49:07', 'B368');
INSERT INTO `comuni` VALUES ('012030', 'Cantello', '012', NULL, '2023-02-27 18:49:07', 'B634');
INSERT INTO `comuni` VALUES ('012031', 'Caravate', '012', NULL, '2023-02-27 18:49:07', 'B732');
INSERT INTO `comuni` VALUES ('012032', 'Cardano al Campo', '012', NULL, '2023-02-27 18:49:07', 'B754');
INSERT INTO `comuni` VALUES ('012033', 'Carnago', '012', NULL, '2023-02-27 18:49:07', 'B796');
INSERT INTO `comuni` VALUES ('012034', 'Caronno Pertusella', '012', NULL, '2023-02-27 18:49:07', 'B805');
INSERT INTO `comuni` VALUES ('012035', 'Caronno Varesino', '012', NULL, '2023-02-27 18:49:07', 'B807');
INSERT INTO `comuni` VALUES ('012036', 'Casale Litta', '012', NULL, '2023-02-27 18:49:07', 'B875');
INSERT INTO `comuni` VALUES ('012037', 'Casalzuigno', '012', NULL, '2023-02-27 18:49:07', 'B921');
INSERT INTO `comuni` VALUES ('012038', 'Casciago', '012', NULL, '2023-02-27 18:49:07', 'B949');
INSERT INTO `comuni` VALUES ('012039', 'Casorate Sempione', '012', NULL, '2023-02-27 18:49:07', 'B987');
INSERT INTO `comuni` VALUES ('012040', 'Cassano Magnago', '012', NULL, '2023-02-27 18:49:07', 'C004');
INSERT INTO `comuni` VALUES ('012041', 'Cassano Valcuvia', '012', NULL, '2023-02-27 18:49:07', 'B999');
INSERT INTO `comuni` VALUES ('012042', 'Castellanza', '012', NULL, '2023-02-27 18:49:07', 'C139');
INSERT INTO `comuni` VALUES ('012043', 'Castello Cabiaglio', '012', NULL, '2023-02-27 18:49:07', 'B312');
INSERT INTO `comuni` VALUES ('012044', 'Castelseprio', '012', NULL, '2023-02-27 18:49:07', 'C273');
INSERT INTO `comuni` VALUES ('012045', 'Castelveccana', '012', NULL, '2023-02-27 18:49:07', 'C181');
INSERT INTO `comuni` VALUES ('012046', 'Castiglione Olona', '012', NULL, '2023-02-27 18:49:07', 'C300');
INSERT INTO `comuni` VALUES ('012047', 'Castronno', '012', NULL, '2023-02-27 18:49:07', 'C343');
INSERT INTO `comuni` VALUES ('012048', 'Cavaria con Premezzo', '012', NULL, '2023-02-27 18:49:07', 'C382');
INSERT INTO `comuni` VALUES ('012049', 'Cazzago Brabbia', '012', NULL, '2023-02-27 18:49:07', 'C409');
INSERT INTO `comuni` VALUES ('012050', 'Cislago', '012', NULL, '2023-02-27 18:49:07', 'C732');
INSERT INTO `comuni` VALUES ('012051', 'Cittiglio', '012', NULL, '2023-02-27 18:49:07', 'C751');
INSERT INTO `comuni` VALUES ('012052', 'Clivio', '012', NULL, '2023-02-27 18:49:07', 'C796');
INSERT INTO `comuni` VALUES ('012053', 'Cocquio-Trevisago', '012', NULL, '2023-02-27 18:49:07', 'C810');
INSERT INTO `comuni` VALUES ('012054', 'Comabbio', '012', NULL, '2023-02-27 18:49:07', 'C911');
INSERT INTO `comuni` VALUES ('012055', 'Comerio', '012', NULL, '2023-02-27 18:49:07', 'C922');
INSERT INTO `comuni` VALUES ('012056', 'Cremenaga', '012', NULL, '2023-02-27 18:49:07', 'D144');
INSERT INTO `comuni` VALUES ('012057', 'Crosio della Valle', '012', NULL, '2023-02-27 18:49:07', 'D185');
INSERT INTO `comuni` VALUES ('012058', 'Cuasso al Monte', '012', NULL, '2023-02-27 18:49:07', 'D192');
INSERT INTO `comuni` VALUES ('012059', 'Cugliate-Fabiasco', '012', NULL, '2023-02-27 18:49:07', 'D199');
INSERT INTO `comuni` VALUES ('012060', 'Cunardo', '012', NULL, '2023-02-27 18:49:07', 'D204');
INSERT INTO `comuni` VALUES ('012061', 'Curiglia con Monteviasco', '012', NULL, '2023-02-27 18:49:07', 'D217');
INSERT INTO `comuni` VALUES ('012062', 'Cuveglio', '012', NULL, '2023-02-27 18:49:07', 'D238');
INSERT INTO `comuni` VALUES ('012063', 'Cuvio', '012', NULL, '2023-02-27 18:49:07', 'D239');
INSERT INTO `comuni` VALUES ('012064', 'Daverio', '012', NULL, '2023-02-27 18:49:07', 'D256');
INSERT INTO `comuni` VALUES ('012065', 'Dumenza', '012', NULL, '2023-02-27 18:49:07', 'D384');
INSERT INTO `comuni` VALUES ('012066', 'Duno', '012', NULL, '2023-02-27 18:49:07', 'D385');
INSERT INTO `comuni` VALUES ('012067', 'Fagnano Olona', '012', NULL, '2023-02-27 18:49:07', 'D467');
INSERT INTO `comuni` VALUES ('012068', 'Ferno', '012', NULL, '2023-02-27 18:49:07', 'D543');
INSERT INTO `comuni` VALUES ('012069', 'Ferrera di Varese', '012', NULL, '2023-02-27 18:49:07', 'D551');
INSERT INTO `comuni` VALUES ('012070', 'Gallarate', '012', NULL, '2023-02-27 18:49:07', 'D869');
INSERT INTO `comuni` VALUES ('012071', 'Galliate Lombardo', '012', NULL, '2023-02-27 18:49:07', 'D871');
INSERT INTO `comuni` VALUES ('012072', 'Gavirate', '012', NULL, '2023-02-27 18:49:07', 'D946');
INSERT INTO `comuni` VALUES ('012073', 'Gazzada Schianno', '012', NULL, '2023-02-27 18:49:07', 'D951');
INSERT INTO `comuni` VALUES ('012074', 'Gemonio', '012', NULL, '2023-02-27 18:49:07', 'D963');
INSERT INTO `comuni` VALUES ('012075', 'Gerenzano', '012', NULL, '2023-02-27 18:49:07', 'D981');
INSERT INTO `comuni` VALUES ('012076', 'Germignaga', '012', NULL, '2023-02-27 18:49:07', 'D987');
INSERT INTO `comuni` VALUES ('012077', 'Golasecca', '012', NULL, '2023-02-27 18:49:07', 'E079');
INSERT INTO `comuni` VALUES ('012078', 'Gorla Maggiore', '012', NULL, '2023-02-27 18:49:07', 'E101');
INSERT INTO `comuni` VALUES ('012079', 'Gorla Minore', '012', NULL, '2023-02-27 18:49:07', 'E102');
INSERT INTO `comuni` VALUES ('012080', 'Gornate Olona', '012', NULL, '2023-02-27 18:49:07', 'E104');
INSERT INTO `comuni` VALUES ('012081', 'Grantola', '012', NULL, '2023-02-27 18:49:07', 'E144');
INSERT INTO `comuni` VALUES ('012082', 'Inarzo', '012', NULL, '2023-02-27 18:49:07', 'E292');
INSERT INTO `comuni` VALUES ('012083', 'Induno Olona', '012', NULL, '2023-02-27 18:49:07', 'E299');
INSERT INTO `comuni` VALUES ('012084', 'Ispra', '012', NULL, '2023-02-27 18:49:07', 'E367');
INSERT INTO `comuni` VALUES ('012085', 'Jerago con Orago', '012', NULL, '2023-02-27 18:49:07', 'E386');
INSERT INTO `comuni` VALUES ('012086', 'Lavena Ponte Tresa', '012', NULL, '2023-02-27 18:49:07', 'E494');
INSERT INTO `comuni` VALUES ('012087', 'Laveno-Mombello', '012', NULL, '2023-02-27 18:49:07', 'E496');
INSERT INTO `comuni` VALUES ('012088', 'Leggiuno', '012', NULL, '2023-02-27 18:49:07', 'E510');
INSERT INTO `comuni` VALUES ('012089', 'Lonate Ceppino', '012', NULL, '2023-02-27 18:49:07', 'E665');
INSERT INTO `comuni` VALUES ('012090', 'Lonate Pozzolo', '012', NULL, '2023-02-27 18:49:07', 'E666');
INSERT INTO `comuni` VALUES ('012091', 'Lozza', '012', NULL, '2023-02-27 18:49:07', 'E707');
INSERT INTO `comuni` VALUES ('012092', 'Luino', '012', NULL, '2023-02-27 18:49:07', 'E734');
INSERT INTO `comuni` VALUES ('012093', 'Luvinate', '012', NULL, '2023-02-27 18:49:07', 'E769');
INSERT INTO `comuni` VALUES ('012095', 'Malgesso', '012', NULL, '2023-02-27 18:49:07', 'E856');
INSERT INTO `comuni` VALUES ('012096', 'Malnate', '012', NULL, '2023-02-27 18:49:07', 'E863');
INSERT INTO `comuni` VALUES ('012097', 'Marchirolo', '012', NULL, '2023-02-27 18:49:07', 'E929');
INSERT INTO `comuni` VALUES ('012098', 'Marnate', '012', NULL, '2023-02-27 18:49:07', 'E965');
INSERT INTO `comuni` VALUES ('012099', 'Marzio', '012', NULL, '2023-02-27 18:49:07', 'F002');
INSERT INTO `comuni` VALUES ('012100', 'Masciago Primo', '012', NULL, '2023-02-27 18:49:07', 'F007');
INSERT INTO `comuni` VALUES ('012101', 'Mercallo', '012', NULL, '2023-02-27 18:49:07', 'F134');
INSERT INTO `comuni` VALUES ('012102', 'Mesenzana', '012', NULL, '2023-02-27 18:49:07', 'F154');
INSERT INTO `comuni` VALUES ('012103', 'Montegrino Valtravaglia', '012', NULL, '2023-02-27 18:49:07', 'F526');
INSERT INTO `comuni` VALUES ('012104', 'Monvalle', '012', NULL, '2023-02-27 18:49:07', 'F703');
INSERT INTO `comuni` VALUES ('012105', 'Morazzone', '012', NULL, '2023-02-27 18:49:07', 'F711');
INSERT INTO `comuni` VALUES ('012106', 'Mornago', '012', NULL, '2023-02-27 18:49:07', 'F736');
INSERT INTO `comuni` VALUES ('012107', 'Oggiona con Santo Stefano', '012', NULL, '2023-02-27 18:49:07', 'G008');
INSERT INTO `comuni` VALUES ('012108', 'Olgiate Olona', '012', NULL, '2023-02-27 18:49:07', 'G028');
INSERT INTO `comuni` VALUES ('012109', 'Origgio', '012', NULL, '2023-02-27 18:49:07', 'G103');
INSERT INTO `comuni` VALUES ('012110', 'Orino', '012', NULL, '2023-02-27 18:49:07', 'G105');
INSERT INTO `comuni` VALUES ('012111', 'Osmate', '012', NULL, '2023-02-27 18:49:07', 'E529');
INSERT INTO `comuni` VALUES ('012113', 'Porto Ceresio', '012', NULL, '2023-02-27 18:49:07', 'G906');
INSERT INTO `comuni` VALUES ('012114', 'Porto Valtravaglia', '012', NULL, '2023-02-27 18:49:07', 'G907');
INSERT INTO `comuni` VALUES ('012115', 'Rancio Valcuvia', '012', NULL, '2023-02-27 18:49:07', 'H173');
INSERT INTO `comuni` VALUES ('012116', 'Ranco', '012', NULL, '2023-02-27 18:49:07', 'H174');
INSERT INTO `comuni` VALUES ('012117', 'Saltrio', '012', NULL, '2023-02-27 18:49:07', 'H723');
INSERT INTO `comuni` VALUES ('012118', 'Samarate', '012', NULL, '2023-02-27 18:49:07', 'H736');
INSERT INTO `comuni` VALUES ('012119', 'Saronno', '012', NULL, '2023-02-27 18:49:07', 'I441');
INSERT INTO `comuni` VALUES ('012120', 'Sesto Calende', '012', NULL, '2023-02-27 18:49:07', 'I688');
INSERT INTO `comuni` VALUES ('012121', 'Solbiate Arno', '012', NULL, '2023-02-27 18:49:07', 'I793');
INSERT INTO `comuni` VALUES ('012122', 'Solbiate Olona', '012', NULL, '2023-02-27 18:49:07', 'I794');
INSERT INTO `comuni` VALUES ('012123', 'Somma Lombardo', '012', NULL, '2023-02-27 18:49:07', 'I819');
INSERT INTO `comuni` VALUES ('012124', 'Sumirago', '012', NULL, '2023-02-27 18:49:07', 'L003');
INSERT INTO `comuni` VALUES ('012125', 'Taino', '012', NULL, '2023-02-27 18:49:07', 'L032');
INSERT INTO `comuni` VALUES ('012126', 'Ternate', '012', NULL, '2023-02-27 18:49:07', 'L115');
INSERT INTO `comuni` VALUES ('012127', 'Tradate', '012', NULL, '2023-02-27 18:49:07', 'L319');
INSERT INTO `comuni` VALUES ('012128', 'Travedona-Monate', '012', NULL, '2023-02-27 18:49:07', 'L342');
INSERT INTO `comuni` VALUES ('012129', 'Tronzano Lago Maggiore', '012', NULL, '2023-02-27 18:49:07', 'A705');
INSERT INTO `comuni` VALUES ('012130', 'Uboldo', '012', NULL, '2023-02-27 18:49:07', 'L480');
INSERT INTO `comuni` VALUES ('012131', 'Valganna', '012', NULL, '2023-02-27 18:49:07', 'L577');
INSERT INTO `comuni` VALUES ('012132', 'Varano Borghi', '012', NULL, '2023-02-27 18:49:07', 'L671');
INSERT INTO `comuni` VALUES ('012133', 'Varese', '012', NULL, '2023-02-27 18:49:07', 'L682');
INSERT INTO `comuni` VALUES ('012134', 'Vedano Olona', '012', NULL, '2023-02-27 18:49:07', 'L703');
INSERT INTO `comuni` VALUES ('012136', 'Venegono Inferiore', '012', NULL, '2023-02-27 18:49:07', 'L733');
INSERT INTO `comuni` VALUES ('012137', 'Venegono Superiore', '012', NULL, '2023-02-27 18:49:07', 'L734');
INSERT INTO `comuni` VALUES ('012138', 'Vergiate', '012', NULL, '2023-02-27 18:49:07', 'L765');
INSERT INTO `comuni` VALUES ('012139', 'Viggiù', '012', NULL, '2023-02-27 18:49:07', 'L876');
INSERT INTO `comuni` VALUES ('012140', 'Vizzola Ticino', '012', NULL, '2023-02-27 18:49:07', 'M101');
INSERT INTO `comuni` VALUES ('012141', 'Sangiano', '012', NULL, '2023-02-27 18:49:07', 'H872');
INSERT INTO `comuni` VALUES ('012142', 'Maccagno con Pino e Veddasca', '012', NULL, '2023-02-27 18:49:07', 'M339');
INSERT INTO `comuni` VALUES ('013003', 'Albavilla', '013', NULL, '2023-02-27 18:49:07', 'A143');
INSERT INTO `comuni` VALUES ('013004', 'Albese con Cassano', '013', NULL, '2023-02-27 18:49:07', 'A153');
INSERT INTO `comuni` VALUES ('013005', 'Albiolo', '013', NULL, '2023-02-27 18:49:07', 'A164');
INSERT INTO `comuni` VALUES ('013006', 'Alserio', '013', NULL, '2023-02-27 18:49:07', 'A224');
INSERT INTO `comuni` VALUES ('013007', 'Alzate Brianza', '013', NULL, '2023-02-27 18:49:07', 'A249');
INSERT INTO `comuni` VALUES ('013009', 'Anzano del Parco', '013', NULL, '2023-02-27 18:49:07', 'A319');
INSERT INTO `comuni` VALUES ('013010', 'Appiano Gentile', '013', NULL, '2023-02-27 18:49:07', 'A333');
INSERT INTO `comuni` VALUES ('013011', 'Argegno', '013', NULL, '2023-02-27 18:49:07', 'A391');
INSERT INTO `comuni` VALUES ('013012', 'Arosio', '013', NULL, '2023-02-27 18:49:07', 'A430');
INSERT INTO `comuni` VALUES ('013013', 'Asso', '013', NULL, '2023-02-27 18:49:07', 'A476');
INSERT INTO `comuni` VALUES ('013015', 'Barni', '013', NULL, '2023-02-27 18:49:07', 'A670');
INSERT INTO `comuni` VALUES ('013021', 'Bene Lario', '013', NULL, '2023-02-27 18:49:07', 'A778');
INSERT INTO `comuni` VALUES ('013022', 'Beregazzo con Figliaro', '013', NULL, '2023-02-27 18:49:07', 'A791');
INSERT INTO `comuni` VALUES ('013023', 'Binago', '013', NULL, '2023-02-27 18:49:07', 'A870');
INSERT INTO `comuni` VALUES ('013024', 'Bizzarone', '013', NULL, '2023-02-27 18:49:07', 'A898');
INSERT INTO `comuni` VALUES ('013025', 'Blessagno', '013', NULL, '2023-02-27 18:49:07', 'A904');
INSERT INTO `comuni` VALUES ('013026', 'Blevio', '013', NULL, '2023-02-27 18:49:07', 'A905');
INSERT INTO `comuni` VALUES ('013028', 'Bregnano', '013', NULL, '2023-02-27 18:49:07', 'B134');
INSERT INTO `comuni` VALUES ('013029', 'Brenna', '013', NULL, '2023-02-27 18:49:07', 'B144');
INSERT INTO `comuni` VALUES ('013030', 'Brienno', '013', NULL, '2023-02-27 18:49:07', 'B172');
INSERT INTO `comuni` VALUES ('013032', 'Brunate', '013', NULL, '2023-02-27 18:49:07', 'B218');
INSERT INTO `comuni` VALUES ('013034', 'Bulgarograsso', '013', NULL, '2023-02-27 18:49:07', 'B262');
INSERT INTO `comuni` VALUES ('013035', 'Cabiate', '013', NULL, '2023-02-27 18:49:07', 'B313');
INSERT INTO `comuni` VALUES ('013036', 'Cadorago', '013', NULL, '2023-02-27 18:49:07', 'B346');
INSERT INTO `comuni` VALUES ('013037', 'Caglio', '013', NULL, '2023-02-27 18:49:07', 'B355');
INSERT INTO `comuni` VALUES ('013038', 'Cagno', '013', NULL, '2023-02-27 18:49:07', 'B359');
INSERT INTO `comuni` VALUES ('013040', 'Campione d\'Italia', '013', NULL, '2023-02-27 18:49:07', 'B513');
INSERT INTO `comuni` VALUES ('013041', 'Cantù', '013', NULL, '2023-02-27 18:49:07', 'B639');
INSERT INTO `comuni` VALUES ('013042', 'Canzo', '013', NULL, '2023-02-27 18:49:07', 'B641');
INSERT INTO `comuni` VALUES ('013043', 'Capiago Intimiano', '013', NULL, '2023-02-27 18:49:07', 'B653');
INSERT INTO `comuni` VALUES ('013044', 'Carate Urio', '013', NULL, '2023-02-27 18:49:07', 'B730');
INSERT INTO `comuni` VALUES ('013045', 'Carbonate', '013', NULL, '2023-02-27 18:49:07', 'B742');
INSERT INTO `comuni` VALUES ('013046', 'Carimate', '013', NULL, '2023-02-27 18:49:07', 'B778');
INSERT INTO `comuni` VALUES ('013047', 'Carlazzo', '013', NULL, '2023-02-27 18:49:07', 'B785');
INSERT INTO `comuni` VALUES ('013048', 'Carugo', '013', NULL, '2023-02-27 18:49:07', 'B851');
INSERT INTO `comuni` VALUES ('013050', 'Casasco d\'Intelvi', '013', NULL, '2023-02-27 18:49:07', 'B942');
INSERT INTO `comuni` VALUES ('013052', 'Caslino d\'Erba', '013', NULL, '2023-02-27 18:49:07', 'B974');
INSERT INTO `comuni` VALUES ('013053', 'Casnate con Bernate', '013', NULL, '2023-02-27 18:49:07', 'B977');
INSERT INTO `comuni` VALUES ('013055', 'Cassina Rizzardi', '013', NULL, '2023-02-27 18:49:07', 'C020');
INSERT INTO `comuni` VALUES ('013058', 'Castelmarte', '013', NULL, '2023-02-27 18:49:07', 'C206');
INSERT INTO `comuni` VALUES ('013059', 'Castelnuovo Bozzente', '013', NULL, '2023-02-27 18:49:07', 'C220');
INSERT INTO `comuni` VALUES ('013060', 'Castiglione d\'Intelvi', '013', NULL, '2023-02-27 18:49:07', 'C299');
INSERT INTO `comuni` VALUES ('013061', 'Cavallasca', '013', NULL, '2023-02-27 18:49:07', 'C374');
INSERT INTO `comuni` VALUES ('013062', 'Cavargna', '013', NULL, '2023-02-27 18:49:07', 'C381');
INSERT INTO `comuni` VALUES ('013063', 'Cerano d\'Intelvi', '013', NULL, '2023-02-27 18:49:07', 'C482');
INSERT INTO `comuni` VALUES ('013064', 'Cermenate', '013', NULL, '2023-02-27 18:49:07', 'C516');
INSERT INTO `comuni` VALUES ('013065', 'Cernobbio', '013', NULL, '2023-02-27 18:49:07', 'C520');
INSERT INTO `comuni` VALUES ('013068', 'Cirimido', '013', NULL, '2023-02-27 18:49:07', 'C724');
INSERT INTO `comuni` VALUES ('013071', 'Claino con Osteno', '013', NULL, '2023-02-27 18:49:07', 'C787');
INSERT INTO `comuni` VALUES ('013074', 'Colonno', '013', NULL, '2023-02-27 18:49:07', 'C902');
INSERT INTO `comuni` VALUES ('013075', 'Como', '013', NULL, '2023-02-27 18:49:07', 'C933');
INSERT INTO `comuni` VALUES ('013077', 'Corrido', '013', NULL, '2023-02-27 18:49:07', 'D041');
INSERT INTO `comuni` VALUES ('013083', 'Cremia', '013', NULL, '2023-02-27 18:49:07', 'D147');
INSERT INTO `comuni` VALUES ('013084', 'Cucciago', '013', NULL, '2023-02-27 18:49:07', 'D196');
INSERT INTO `comuni` VALUES ('013085', 'Cusino', '013', NULL, '2023-02-27 18:49:07', 'D232');
INSERT INTO `comuni` VALUES ('013087', 'Dizzasco', '013', NULL, '2023-02-27 18:49:07', 'D310');
INSERT INTO `comuni` VALUES ('013089', 'Domaso', '013', NULL, '2023-02-27 18:49:07', 'D329');
INSERT INTO `comuni` VALUES ('013090', 'Dongo', '013', NULL, '2023-02-27 18:49:07', 'D341');
INSERT INTO `comuni` VALUES ('013092', 'Dosso del Liro', '013', NULL, '2023-02-27 18:49:07', 'D355');
INSERT INTO `comuni` VALUES ('013095', 'Erba', '013', NULL, '2023-02-27 18:49:07', 'D416');
INSERT INTO `comuni` VALUES ('013097', 'Eupilio', '013', NULL, '2023-02-27 18:49:07', 'D445');
INSERT INTO `comuni` VALUES ('013098', 'Faggeto Lario', '013', NULL, '2023-02-27 18:49:07', 'D462');
INSERT INTO `comuni` VALUES ('013099', 'Faloppio', '013', NULL, '2023-02-27 18:49:07', 'D482');
INSERT INTO `comuni` VALUES ('013100', 'Fenegrò', '013', NULL, '2023-02-27 18:49:07', 'D531');
INSERT INTO `comuni` VALUES ('013101', 'Figino Serenza', '013', NULL, '2023-02-27 18:49:07', 'D579');
INSERT INTO `comuni` VALUES ('013102', 'Fino Mornasco', '013', NULL, '2023-02-27 18:49:07', 'D605');
INSERT INTO `comuni` VALUES ('013106', 'Garzeno', '013', NULL, '2023-02-27 18:49:07', 'D930');
INSERT INTO `comuni` VALUES ('013107', 'Gera Lario', '013', NULL, '2023-02-27 18:49:07', 'D974');
INSERT INTO `comuni` VALUES ('013110', 'Grandate', '013', NULL, '2023-02-27 18:49:07', 'E139');
INSERT INTO `comuni` VALUES ('013111', 'Grandola ed Uniti', '013', NULL, '2023-02-27 18:49:07', 'E141');
INSERT INTO `comuni` VALUES ('013113', 'Griante', '013', NULL, '2023-02-27 18:49:07', 'E172');
INSERT INTO `comuni` VALUES ('013114', 'Guanzate', '013', NULL, '2023-02-27 18:49:07', 'E235');
INSERT INTO `comuni` VALUES ('013118', 'Inverigo', '013', NULL, '2023-02-27 18:49:07', 'E309');
INSERT INTO `comuni` VALUES ('013119', 'Laglio', '013', NULL, '2023-02-27 18:49:07', 'E405');
INSERT INTO `comuni` VALUES ('013120', 'Laino', '013', NULL, '2023-02-27 18:49:07', 'E416');
INSERT INTO `comuni` VALUES ('013121', 'Lambrugo', '013', NULL, '2023-02-27 18:49:07', 'E428');
INSERT INTO `comuni` VALUES ('013122', 'Lanzo d\'Intelvi', '013', NULL, '2023-02-27 18:49:07', 'E444');
INSERT INTO `comuni` VALUES ('013123', 'Lasnigo', '013', NULL, '2023-02-27 18:49:07', 'E462');
INSERT INTO `comuni` VALUES ('013126', 'Lezzeno', '013', NULL, '2023-02-27 18:49:07', 'E569');
INSERT INTO `comuni` VALUES ('013128', 'Limido Comasco', '013', NULL, '2023-02-27 18:49:07', 'E593');
INSERT INTO `comuni` VALUES ('013129', 'Lipomo', '013', NULL, '2023-02-27 18:49:07', 'E607');
INSERT INTO `comuni` VALUES ('013130', 'Livo', '013', NULL, '2023-02-27 18:49:07', 'E623');
INSERT INTO `comuni` VALUES ('013131', 'Locate Varesino', '013', NULL, '2023-02-27 18:49:07', 'E638');
INSERT INTO `comuni` VALUES ('013133', 'Lomazzo', '013', NULL, '2023-02-27 18:49:07', 'E659');
INSERT INTO `comuni` VALUES ('013134', 'Longone al Segrino', '013', NULL, '2023-02-27 18:49:07', 'E679');
INSERT INTO `comuni` VALUES ('013135', 'Luisago', '013', NULL, '2023-02-27 18:49:07', 'E735');
INSERT INTO `comuni` VALUES ('013136', 'Lurago d\'Erba', '013', NULL, '2023-02-27 18:49:07', 'E749');
INSERT INTO `comuni` VALUES ('013137', 'Lurago Marinone', '013', NULL, '2023-02-27 18:49:07', 'E750');
INSERT INTO `comuni` VALUES ('013138', 'Lurate Caccivio', '013', NULL, '2023-02-27 18:49:07', 'E753');
INSERT INTO `comuni` VALUES ('013139', 'Magreglio', '013', NULL, '2023-02-27 18:49:07', 'E830');
INSERT INTO `comuni` VALUES ('013143', 'Mariano Comense', '013', NULL, '2023-02-27 18:49:07', 'E951');
INSERT INTO `comuni` VALUES ('013144', 'Maslianico', '013', NULL, '2023-02-27 18:49:07', 'F017');
INSERT INTO `comuni` VALUES ('013145', 'Menaggio', '013', NULL, '2023-02-27 18:49:07', 'F120');
INSERT INTO `comuni` VALUES ('013147', 'Merone', '013', NULL, '2023-02-27 18:49:07', 'F151');
INSERT INTO `comuni` VALUES ('013152', 'Moltrasio', '013', NULL, '2023-02-27 18:49:07', 'F305');
INSERT INTO `comuni` VALUES ('013153', 'Monguzzo', '013', NULL, '2023-02-27 18:49:07', 'F372');
INSERT INTO `comuni` VALUES ('013154', 'Montano Lucino', '013', NULL, '2023-02-27 18:49:07', 'F427');
INSERT INTO `comuni` VALUES ('013155', 'Montemezzo', '013', NULL, '2023-02-27 18:49:07', 'F564');
INSERT INTO `comuni` VALUES ('013157', 'Montorfano', '013', NULL, '2023-02-27 18:49:07', 'F688');
INSERT INTO `comuni` VALUES ('013159', 'Mozzate', '013', NULL, '2023-02-27 18:49:07', 'F788');
INSERT INTO `comuni` VALUES ('013160', 'Musso', '013', NULL, '2023-02-27 18:49:07', 'F828');
INSERT INTO `comuni` VALUES ('013161', 'Nesso', '013', NULL, '2023-02-27 18:49:07', 'F877');
INSERT INTO `comuni` VALUES ('013163', 'Novedrate', '013', NULL, '2023-02-27 18:49:07', 'F958');
INSERT INTO `comuni` VALUES ('013165', 'Olgiate Comasco', '013', NULL, '2023-02-27 18:49:07', 'G025');
INSERT INTO `comuni` VALUES ('013169', 'Oltrona di San Mamette', '013', NULL, '2023-02-27 18:49:07', 'G056');
INSERT INTO `comuni` VALUES ('013170', 'Orsenigo', '013', NULL, '2023-02-27 18:49:07', 'G126');
INSERT INTO `comuni` VALUES ('013178', 'Peglio', '013', NULL, '2023-02-27 18:49:07', 'G415');
INSERT INTO `comuni` VALUES ('013179', 'Pellio Intelvi', '013', NULL, '2023-02-27 18:49:07', 'G427');
INSERT INTO `comuni` VALUES ('013183', 'Pianello del Lario', '013', NULL, '2023-02-27 18:49:07', 'G556');
INSERT INTO `comuni` VALUES ('013184', 'Pigra', '013', NULL, '2023-02-27 18:49:07', 'G665');
INSERT INTO `comuni` VALUES ('013185', 'Plesio', '013', NULL, '2023-02-27 18:49:07', 'G737');
INSERT INTO `comuni` VALUES ('013186', 'Pognana Lario', '013', NULL, '2023-02-27 18:49:07', 'G773');
INSERT INTO `comuni` VALUES ('013187', 'Ponna', '013', NULL, '2023-02-27 18:49:07', 'G821');
INSERT INTO `comuni` VALUES ('013188', 'Ponte Lambro', '013', NULL, '2023-02-27 18:49:07', 'G847');
INSERT INTO `comuni` VALUES ('013189', 'Porlezza', '013', NULL, '2023-02-27 18:49:07', 'G889');
INSERT INTO `comuni` VALUES ('013192', 'Proserpio', '013', NULL, '2023-02-27 18:49:07', 'H074');
INSERT INTO `comuni` VALUES ('013193', 'Pusiano', '013', NULL, '2023-02-27 18:49:07', 'H094');
INSERT INTO `comuni` VALUES ('013194', 'Ramponio Verna', '013', NULL, '2023-02-27 18:49:07', 'H171');
INSERT INTO `comuni` VALUES ('013195', 'Rezzago', '013', NULL, '2023-02-27 18:49:07', 'H255');
INSERT INTO `comuni` VALUES ('013197', 'Rodero', '013', NULL, '2023-02-27 18:49:07', 'H478');
INSERT INTO `comuni` VALUES ('013199', 'Ronago', '013', NULL, '2023-02-27 18:49:07', 'H521');
INSERT INTO `comuni` VALUES ('013201', 'Rovellasca', '013', NULL, '2023-02-27 18:49:07', 'H601');
INSERT INTO `comuni` VALUES ('013202', 'Rovello Porro', '013', NULL, '2023-02-27 18:49:07', 'H602');
INSERT INTO `comuni` VALUES ('013203', 'Sala Comacina', '013', NULL, '2023-02-27 18:49:07', 'H679');
INSERT INTO `comuni` VALUES ('013204', 'San Bartolomeo Val Cavargna', '013', NULL, '2023-02-27 18:49:07', 'H760');
INSERT INTO `comuni` VALUES ('013205', 'San Fedele Intelvi', '013', NULL, '2023-02-27 18:49:07', 'H830');
INSERT INTO `comuni` VALUES ('013206', 'San Fermo della Battaglia', '013', NULL, '2023-02-27 18:49:07', 'H840');
INSERT INTO `comuni` VALUES ('013207', 'San Nazzaro Val Cavargna', '013', NULL, '2023-02-27 18:49:07', 'I051');
INSERT INTO `comuni` VALUES ('013211', 'Schignano', '013', NULL, '2023-02-27 18:49:07', 'I529');
INSERT INTO `comuni` VALUES ('013212', 'Senna Comasco', '013', NULL, '2023-02-27 18:49:07', 'I611');
INSERT INTO `comuni` VALUES ('013215', 'Solbiate', '013', NULL, '2023-02-27 18:49:07', 'I792');
INSERT INTO `comuni` VALUES ('013216', 'Sorico', '013', NULL, '2023-02-27 18:49:07', 'I856');
INSERT INTO `comuni` VALUES ('013217', 'Sormano', '013', NULL, '2023-02-27 18:49:07', 'I860');
INSERT INTO `comuni` VALUES ('013218', 'Stazzona', '013', NULL, '2023-02-27 18:49:07', 'I943');
INSERT INTO `comuni` VALUES ('013222', 'Tavernerio', '013', NULL, '2023-02-27 18:49:07', 'L071');
INSERT INTO `comuni` VALUES ('013223', 'Torno', '013', NULL, '2023-02-27 18:49:07', 'L228');
INSERT INTO `comuni` VALUES ('013226', 'Trezzone', '013', NULL, '2023-02-27 18:49:07', 'L413');
INSERT INTO `comuni` VALUES ('013227', 'Turate', '013', NULL, '2023-02-27 18:49:07', 'L470');
INSERT INTO `comuni` VALUES ('013228', 'Uggiate-Trevano', '013', NULL, '2023-02-27 18:49:07', 'L487');
INSERT INTO `comuni` VALUES ('013229', 'Valbrona', '013', NULL, '2023-02-27 18:49:07', 'L547');
INSERT INTO `comuni` VALUES ('013232', 'Valmorea', '013', NULL, '2023-02-27 18:49:07', 'L640');
INSERT INTO `comuni` VALUES ('013233', 'Val Rezzo', '013', NULL, '2023-02-27 18:49:07', 'H259');
INSERT INTO `comuni` VALUES ('013234', 'Valsolda', '013', NULL, '2023-02-27 18:49:07', 'C936');
INSERT INTO `comuni` VALUES ('013236', 'Veleso', '013', NULL, '2023-02-27 18:49:07', 'L715');
INSERT INTO `comuni` VALUES ('013238', 'Veniano', '013', NULL, '2023-02-27 18:49:07', 'L737');
INSERT INTO `comuni` VALUES ('013239', 'Vercana', '013', NULL, '2023-02-27 18:49:07', 'L748');
INSERT INTO `comuni` VALUES ('013242', 'Vertemate con Minoprio', '013', NULL, '2023-02-27 18:49:07', 'L792');
INSERT INTO `comuni` VALUES ('013245', 'Villa Guardia', '013', NULL, '2023-02-27 18:49:07', 'L956');
INSERT INTO `comuni` VALUES ('013246', 'Zelbio', '013', NULL, '2023-02-27 18:49:07', 'M156');
INSERT INTO `comuni` VALUES ('013248', 'San Siro', '013', NULL, '2023-02-27 18:49:07', 'I162');
INSERT INTO `comuni` VALUES ('013249', 'Gravedona ed Uniti', '013', NULL, '2023-02-27 18:49:07', 'M315');
INSERT INTO `comuni` VALUES ('013250', 'Bellagio', '013', NULL, '2023-02-27 18:49:07', 'M335');
INSERT INTO `comuni` VALUES ('013251', 'Colverde', '013', NULL, '2023-02-27 18:49:07', 'M336');
INSERT INTO `comuni` VALUES ('013252', 'Tremezzina', '013', NULL, '2023-02-27 18:49:07', 'M341');
INSERT INTO `comuni` VALUES ('014001', 'Albaredo per San Marco', '014', NULL, '2023-02-27 18:49:07', 'A135');
INSERT INTO `comuni` VALUES ('014002', 'Albosaggia', '014', NULL, '2023-02-27 18:49:07', 'A172');
INSERT INTO `comuni` VALUES ('014003', 'Andalo Valtellino', '014', NULL, '2023-02-27 18:49:07', 'A273');
INSERT INTO `comuni` VALUES ('014004', 'Aprica', '014', NULL, '2023-02-27 18:49:07', 'A337');
INSERT INTO `comuni` VALUES ('014005', 'Ardenno', '014', NULL, '2023-02-27 18:49:07', 'A382');
INSERT INTO `comuni` VALUES ('014006', 'Bema', '014', NULL, '2023-02-27 18:49:07', 'A777');
INSERT INTO `comuni` VALUES ('014007', 'Berbenno di Valtellina', '014', NULL, '2023-02-27 18:49:07', 'A787');
INSERT INTO `comuni` VALUES ('014008', 'Bianzone', '014', NULL, '2023-02-27 18:49:07', 'A848');
INSERT INTO `comuni` VALUES ('014009', 'Bormio', '014', NULL, '2023-02-27 18:49:07', 'B049');
INSERT INTO `comuni` VALUES ('014010', 'Buglio in Monte', '014', NULL, '2023-02-27 18:49:07', 'B255');
INSERT INTO `comuni` VALUES ('014011', 'Caiolo', '014', NULL, '2023-02-27 18:49:07', 'B366');
INSERT INTO `comuni` VALUES ('014012', 'Campodolcino', '014', NULL, '2023-02-27 18:49:07', 'B530');
INSERT INTO `comuni` VALUES ('014013', 'Caspoggio', '014', NULL, '2023-02-27 18:49:07', 'B993');
INSERT INTO `comuni` VALUES ('014014', 'Castello dell\'Acqua', '014', NULL, '2023-02-27 18:49:07', 'C186');
INSERT INTO `comuni` VALUES ('014015', 'Castione Andevenno', '014', NULL, '2023-02-27 18:49:07', 'C325');
INSERT INTO `comuni` VALUES ('014016', 'Cedrasco', '014', NULL, '2023-02-27 18:49:07', 'C418');
INSERT INTO `comuni` VALUES ('014017', 'Cercino', '014', NULL, '2023-02-27 18:49:07', 'C493');
INSERT INTO `comuni` VALUES ('014018', 'Chiavenna', '014', NULL, '2023-02-27 18:49:07', 'C623');
INSERT INTO `comuni` VALUES ('014019', 'Chiesa in Valmalenco', '014', NULL, '2023-02-27 18:49:07', 'C628');
INSERT INTO `comuni` VALUES ('014020', 'Chiuro', '014', NULL, '2023-02-27 18:49:07', 'C651');
INSERT INTO `comuni` VALUES ('014021', 'Cino', '014', NULL, '2023-02-27 18:49:07', 'C709');
INSERT INTO `comuni` VALUES ('014022', 'Civo', '014', NULL, '2023-02-27 18:49:07', 'C785');
INSERT INTO `comuni` VALUES ('014023', 'Colorina', '014', NULL, '2023-02-27 18:49:07', 'C903');
INSERT INTO `comuni` VALUES ('014024', 'Cosio Valtellino', '014', NULL, '2023-02-27 18:49:07', 'D088');
INSERT INTO `comuni` VALUES ('014025', 'Dazio', '014', NULL, '2023-02-27 18:49:07', 'D258');
INSERT INTO `comuni` VALUES ('014026', 'Delebio', '014', NULL, '2023-02-27 18:49:07', 'D266');
INSERT INTO `comuni` VALUES ('014027', 'Dubino', '014', NULL, '2023-02-27 18:49:07', 'D377');
INSERT INTO `comuni` VALUES ('014028', 'Faedo Valtellino', '014', NULL, '2023-02-27 18:49:07', 'D456');
INSERT INTO `comuni` VALUES ('014029', 'Forcola', '014', NULL, '2023-02-27 18:49:07', 'D694');
INSERT INTO `comuni` VALUES ('014030', 'Fusine', '014', NULL, '2023-02-27 18:49:07', 'D830');
INSERT INTO `comuni` VALUES ('014031', 'Gerola Alta', '014', NULL, '2023-02-27 18:49:07', 'D990');
INSERT INTO `comuni` VALUES ('014032', 'Gordona', '014', NULL, '2023-02-27 18:49:07', 'E090');
INSERT INTO `comuni` VALUES ('014033', 'Grosio', '014', NULL, '2023-02-27 18:49:07', 'E200');
INSERT INTO `comuni` VALUES ('014034', 'Grosotto', '014', NULL, '2023-02-27 18:49:07', 'E201');
INSERT INTO `comuni` VALUES ('014035', 'Madesimo', '014', NULL, '2023-02-27 18:49:07', 'E342');
INSERT INTO `comuni` VALUES ('014036', 'Lanzada', '014', NULL, '2023-02-27 18:49:07', 'E443');
INSERT INTO `comuni` VALUES ('014037', 'Livigno', '014', NULL, '2023-02-27 18:49:07', 'E621');
INSERT INTO `comuni` VALUES ('014038', 'Lovero', '014', NULL, '2023-02-27 18:49:07', 'E705');
INSERT INTO `comuni` VALUES ('014039', 'Mantello', '014', NULL, '2023-02-27 18:49:07', 'E896');
INSERT INTO `comuni` VALUES ('014040', 'Mazzo di Valtellina', '014', NULL, '2023-02-27 18:49:07', 'F070');
INSERT INTO `comuni` VALUES ('014041', 'Mello', '014', NULL, '2023-02-27 18:49:07', 'F115');
INSERT INTO `comuni` VALUES ('014042', 'Menarola', '014', NULL, '2023-02-27 18:49:07', 'F121');
INSERT INTO `comuni` VALUES ('014043', 'Mese', '014', NULL, '2023-02-27 18:49:07', 'F153');
INSERT INTO `comuni` VALUES ('014044', 'Montagna in Valtellina', '014', NULL, '2023-02-27 18:49:07', 'F393');
INSERT INTO `comuni` VALUES ('014045', 'Morbegno', '014', NULL, '2023-02-27 18:49:07', 'F712');
INSERT INTO `comuni` VALUES ('014046', 'Novate Mezzola', '014', NULL, '2023-02-27 18:49:07', 'F956');
INSERT INTO `comuni` VALUES ('014047', 'Pedesina', '014', NULL, '2023-02-27 18:49:07', 'G410');
INSERT INTO `comuni` VALUES ('014048', 'Piantedo', '014', NULL, '2023-02-27 18:49:07', 'G572');
INSERT INTO `comuni` VALUES ('014049', 'Piateda', '014', NULL, '2023-02-27 18:49:07', 'G576');
INSERT INTO `comuni` VALUES ('014050', 'Piuro', '014', NULL, '2023-02-27 18:49:07', 'G718');
INSERT INTO `comuni` VALUES ('014051', 'Poggiridenti', '014', NULL, '2023-02-27 18:49:07', 'G431');
INSERT INTO `comuni` VALUES ('014052', 'Ponte in Valtellina', '014', NULL, '2023-02-27 18:49:07', 'G829');
INSERT INTO `comuni` VALUES ('014053', 'Postalesio', '014', NULL, '2023-02-27 18:49:07', 'G937');
INSERT INTO `comuni` VALUES ('014054', 'Prata Camportaccio', '014', NULL, '2023-02-27 18:49:07', 'G993');
INSERT INTO `comuni` VALUES ('014055', 'Rasura', '014', NULL, '2023-02-27 18:49:07', 'H192');
INSERT INTO `comuni` VALUES ('014056', 'Rogolo', '014', NULL, '2023-02-27 18:49:07', 'H493');
INSERT INTO `comuni` VALUES ('014057', 'Samolaco', '014', NULL, '2023-02-27 18:49:07', 'H752');
INSERT INTO `comuni` VALUES ('014058', 'San Giacomo Filippo', '014', NULL, '2023-02-27 18:49:07', 'H868');
INSERT INTO `comuni` VALUES ('014059', 'Sernio', '014', NULL, '2023-02-27 18:49:07', 'I636');
INSERT INTO `comuni` VALUES ('014060', 'Sondalo', '014', NULL, '2023-02-27 18:49:07', 'I828');
INSERT INTO `comuni` VALUES ('014061', 'Sondrio', '014', NULL, '2023-02-27 18:49:07', 'I829');
INSERT INTO `comuni` VALUES ('014062', 'Spriana', '014', NULL, '2023-02-27 18:49:07', 'I928');
INSERT INTO `comuni` VALUES ('014063', 'Talamona', '014', NULL, '2023-02-27 18:49:07', 'L035');
INSERT INTO `comuni` VALUES ('014064', 'Tartano', '014', NULL, '2023-02-27 18:49:07', 'L056');
INSERT INTO `comuni` VALUES ('014065', 'Teglio', '014', NULL, '2023-02-27 18:49:07', 'L084');
INSERT INTO `comuni` VALUES ('014066', 'Tirano', '014', NULL, '2023-02-27 18:49:07', 'L175');
INSERT INTO `comuni` VALUES ('014067', 'Torre di Santa Maria', '014', NULL, '2023-02-27 18:49:07', 'L244');
INSERT INTO `comuni` VALUES ('014068', 'Tovo di Sant\'Agata', '014', NULL, '2023-02-27 18:49:07', 'L316');
INSERT INTO `comuni` VALUES ('014069', 'Traona', '014', NULL, '2023-02-27 18:49:07', 'L330');
INSERT INTO `comuni` VALUES ('014070', 'Tresivio', '014', NULL, '2023-02-27 18:49:07', 'L392');
INSERT INTO `comuni` VALUES ('014071', 'Valdidentro', '014', NULL, '2023-02-27 18:49:07', 'L557');
INSERT INTO `comuni` VALUES ('014072', 'Valdisotto', '014', NULL, '2023-02-27 18:49:07', 'L563');
INSERT INTO `comuni` VALUES ('014073', 'Valfurva', '014', NULL, '2023-02-27 18:49:07', 'L576');
INSERT INTO `comuni` VALUES ('014074', 'Val Masino', '014', NULL, '2023-02-27 18:49:07', 'L638');
INSERT INTO `comuni` VALUES ('014075', 'Verceia', '014', NULL, '2023-02-27 18:49:07', 'L749');
INSERT INTO `comuni` VALUES ('014076', 'Vervio', '014', NULL, '2023-02-27 18:49:07', 'L799');
INSERT INTO `comuni` VALUES ('014077', 'Villa di Chiavenna', '014', NULL, '2023-02-27 18:49:07', 'L907');
INSERT INTO `comuni` VALUES ('014078', 'Villa di Tirano', '014', NULL, '2023-02-27 18:49:07', 'L908');
INSERT INTO `comuni` VALUES ('015002', 'Abbiategrasso', '015', NULL, '2023-02-27 18:49:07', 'A010');
INSERT INTO `comuni` VALUES ('015005', 'Albairate', '015', NULL, '2023-02-27 18:49:07', 'A127');
INSERT INTO `comuni` VALUES ('015007', 'Arconate', '015', NULL, '2023-02-27 18:49:07', 'A375');
INSERT INTO `comuni` VALUES ('015009', 'Arese', '015', NULL, '2023-02-27 18:49:07', 'A389');
INSERT INTO `comuni` VALUES ('015010', 'Arluno', '015', NULL, '2023-02-27 18:49:07', 'A413');
INSERT INTO `comuni` VALUES ('015011', 'Assago', '015', NULL, '2023-02-27 18:49:07', 'A473');
INSERT INTO `comuni` VALUES ('015012', 'Bareggio', '015', NULL, '2023-02-27 18:49:07', 'A652');
INSERT INTO `comuni` VALUES ('015014', 'Basiano', '015', NULL, '2023-02-27 18:49:07', 'A697');
INSERT INTO `comuni` VALUES ('015015', 'Basiglio', '015', NULL, '2023-02-27 18:49:07', 'A699');
INSERT INTO `comuni` VALUES ('015016', 'Bellinzago Lombardo', '015', NULL, '2023-02-27 18:49:07', 'A751');
INSERT INTO `comuni` VALUES ('015019', 'Bernate Ticino', '015', NULL, '2023-02-27 18:49:07', 'A804');
INSERT INTO `comuni` VALUES ('015022', 'Besate', '015', NULL, '2023-02-27 18:49:07', 'A820');
INSERT INTO `comuni` VALUES ('015024', 'Binasco', '015', NULL, '2023-02-27 18:49:07', 'A872');
INSERT INTO `comuni` VALUES ('015026', 'Boffalora sopra Ticino', '015', NULL, '2023-02-27 18:49:07', 'A920');
INSERT INTO `comuni` VALUES ('015027', 'Bollate', '015', NULL, '2023-02-27 18:49:07', 'A940');
INSERT INTO `comuni` VALUES ('015032', 'Bresso', '015', NULL, '2023-02-27 18:49:07', 'B162');
INSERT INTO `comuni` VALUES ('015035', 'Bubbiano', '015', NULL, '2023-02-27 18:49:07', 'B235');
INSERT INTO `comuni` VALUES ('015036', 'Buccinasco', '015', NULL, '2023-02-27 18:49:07', 'B240');
INSERT INTO `comuni` VALUES ('015038', 'Buscate', '015', NULL, '2023-02-27 18:49:07', 'B286');
INSERT INTO `comuni` VALUES ('015040', 'Bussero', '015', NULL, '2023-02-27 18:49:07', 'B292');
INSERT INTO `comuni` VALUES ('015041', 'Busto Garolfo', '015', NULL, '2023-02-27 18:49:07', 'B301');
INSERT INTO `comuni` VALUES ('015042', 'Calvignasco', '015', NULL, '2023-02-27 18:49:07', 'B448');
INSERT INTO `comuni` VALUES ('015044', 'Cambiago', '015', NULL, '2023-02-27 18:49:07', 'B461');
INSERT INTO `comuni` VALUES ('015046', 'Canegrate', '015', NULL, '2023-02-27 18:49:07', 'B593');
INSERT INTO `comuni` VALUES ('015050', 'Carpiano', '015', NULL, '2023-02-27 18:49:07', 'B820');
INSERT INTO `comuni` VALUES ('015051', 'Carugate', '015', NULL, '2023-02-27 18:49:07', 'B850');
INSERT INTO `comuni` VALUES ('015055', 'Casarile', '015', NULL, '2023-02-27 18:49:07', 'B938');
INSERT INTO `comuni` VALUES ('015058', 'Casorezzo', '015', NULL, '2023-02-27 18:49:07', 'B989');
INSERT INTO `comuni` VALUES ('015059', 'Cassano d\'Adda', '015', NULL, '2023-02-27 18:49:07', 'C003');
INSERT INTO `comuni` VALUES ('015060', 'Cassina de\' Pecchi', '015', NULL, '2023-02-27 18:49:07', 'C014');
INSERT INTO `comuni` VALUES ('015061', 'Cassinetta di Lugagnano', '015', NULL, '2023-02-27 18:49:07', 'C033');
INSERT INTO `comuni` VALUES ('015062', 'Castano Primo', '015', NULL, '2023-02-27 18:49:07', 'C052');
INSERT INTO `comuni` VALUES ('015070', 'Cernusco sul Naviglio', '015', NULL, '2023-02-27 18:49:07', 'C523');
INSERT INTO `comuni` VALUES ('015071', 'Cerro al Lambro', '015', NULL, '2023-02-27 18:49:07', 'C536');
INSERT INTO `comuni` VALUES ('015072', 'Cerro Maggiore', '015', NULL, '2023-02-27 18:49:07', 'C537');
INSERT INTO `comuni` VALUES ('015074', 'Cesano Boscone', '015', NULL, '2023-02-27 18:49:07', 'C565');
INSERT INTO `comuni` VALUES ('015076', 'Cesate', '015', NULL, '2023-02-27 18:49:07', 'C569');
INSERT INTO `comuni` VALUES ('015077', 'Cinisello Balsamo', '015', NULL, '2023-02-27 18:49:07', 'C707');
INSERT INTO `comuni` VALUES ('015078', 'Cisliano', '015', NULL, '2023-02-27 18:49:07', 'C733');
INSERT INTO `comuni` VALUES ('015081', 'Cologno Monzese', '015', NULL, '2023-02-27 18:49:07', 'C895');
INSERT INTO `comuni` VALUES ('015082', 'Colturano', '015', NULL, '2023-02-27 18:49:07', 'C908');
INSERT INTO `comuni` VALUES ('015085', 'Corbetta', '015', NULL, '2023-02-27 18:49:07', 'C986');
INSERT INTO `comuni` VALUES ('015086', 'Cormano', '015', NULL, '2023-02-27 18:49:07', 'D013');
INSERT INTO `comuni` VALUES ('015087', 'Cornaredo', '015', NULL, '2023-02-27 18:49:07', 'D018');
INSERT INTO `comuni` VALUES ('015093', 'Corsico', '015', NULL, '2023-02-27 18:49:07', 'D045');
INSERT INTO `comuni` VALUES ('015096', 'Cuggiono', '015', NULL, '2023-02-27 18:49:07', 'D198');
INSERT INTO `comuni` VALUES ('015097', 'Cusago', '015', NULL, '2023-02-27 18:49:07', 'D229');
INSERT INTO `comuni` VALUES ('015098', 'Cusano Milanino', '015', NULL, '2023-02-27 18:49:07', 'D231');
INSERT INTO `comuni` VALUES ('015099', 'Dairago', '015', NULL, '2023-02-27 18:49:07', 'D244');
INSERT INTO `comuni` VALUES ('015101', 'Dresano', '015', NULL, '2023-02-27 18:49:07', 'D367');
INSERT INTO `comuni` VALUES ('015103', 'Gaggiano', '015', NULL, '2023-02-27 18:49:07', 'D845');
INSERT INTO `comuni` VALUES ('015105', 'Garbagnate Milanese', '015', NULL, '2023-02-27 18:49:07', 'D912');
INSERT INTO `comuni` VALUES ('015106', 'Gessate', '015', NULL, '2023-02-27 18:49:07', 'D995');
INSERT INTO `comuni` VALUES ('015108', 'Gorgonzola', '015', NULL, '2023-02-27 18:49:07', 'E094');
INSERT INTO `comuni` VALUES ('015110', 'Grezzago', '015', NULL, '2023-02-27 18:49:07', 'E170');
INSERT INTO `comuni` VALUES ('015112', 'Gudo Visconti', '015', NULL, '2023-02-27 18:49:07', 'E258');
INSERT INTO `comuni` VALUES ('015113', 'Inveruno', '015', NULL, '2023-02-27 18:49:07', 'E313');
INSERT INTO `comuni` VALUES ('015114', 'Inzago', '015', NULL, '2023-02-27 18:49:07', 'E317');
INSERT INTO `comuni` VALUES ('015115', 'Lacchiarella', '015', NULL, '2023-02-27 18:49:07', 'E395');
INSERT INTO `comuni` VALUES ('015116', 'Lainate', '015', NULL, '2023-02-27 18:49:07', 'E415');
INSERT INTO `comuni` VALUES ('015118', 'Legnano', '015', NULL, '2023-02-27 18:49:07', 'E514');
INSERT INTO `comuni` VALUES ('015122', 'Liscate', '015', NULL, '2023-02-27 18:49:07', 'E610');
INSERT INTO `comuni` VALUES ('015125', 'Locate di Triulzi', '015', NULL, '2023-02-27 18:49:07', 'E639');
INSERT INTO `comuni` VALUES ('015130', 'Magenta', '015', NULL, '2023-02-27 18:49:07', 'E801');
INSERT INTO `comuni` VALUES ('015131', 'Magnago', '015', NULL, '2023-02-27 18:49:07', 'E819');
INSERT INTO `comuni` VALUES ('015134', 'Marcallo con Casone', '015', NULL, '2023-02-27 18:49:07', 'E921');
INSERT INTO `comuni` VALUES ('015136', 'Masate', '015', NULL, '2023-02-27 18:49:07', 'F003');
INSERT INTO `comuni` VALUES ('015139', 'Mediglia', '015', NULL, '2023-02-27 18:49:07', 'F084');
INSERT INTO `comuni` VALUES ('015140', 'Melegnano', '015', NULL, '2023-02-27 18:49:07', 'F100');
INSERT INTO `comuni` VALUES ('015142', 'Melzo', '015', NULL, '2023-02-27 18:49:07', 'F119');
INSERT INTO `comuni` VALUES ('015144', 'Mesero', '015', NULL, '2023-02-27 18:49:07', 'F155');
INSERT INTO `comuni` VALUES ('015146', 'Milano', '015', NULL, '2023-02-27 18:49:07', 'F205');
INSERT INTO `comuni` VALUES ('015150', 'Morimondo', '015', NULL, '2023-02-27 18:49:07', 'D033');
INSERT INTO `comuni` VALUES ('015151', 'Motta Visconti', '015', NULL, '2023-02-27 18:49:07', 'F783');
INSERT INTO `comuni` VALUES ('015154', 'Nerviano', '015', NULL, '2023-02-27 18:49:07', 'F874');
INSERT INTO `comuni` VALUES ('015155', 'Nosate', '015', NULL, '2023-02-27 18:49:07', 'F939');
INSERT INTO `comuni` VALUES ('015157', 'Novate Milanese', '015', NULL, '2023-02-27 18:49:07', 'F955');
INSERT INTO `comuni` VALUES ('015158', 'Noviglio', '015', NULL, '2023-02-27 18:49:07', 'F968');
INSERT INTO `comuni` VALUES ('015159', 'Opera', '015', NULL, '2023-02-27 18:49:07', 'G078');
INSERT INTO `comuni` VALUES ('015164', 'Ossona', '015', NULL, '2023-02-27 18:49:07', 'G181');
INSERT INTO `comuni` VALUES ('015165', 'Ozzero', '015', NULL, '2023-02-27 18:49:07', 'G206');
INSERT INTO `comuni` VALUES ('015166', 'Paderno Dugnano', '015', NULL, '2023-02-27 18:49:07', 'G220');
INSERT INTO `comuni` VALUES ('015167', 'Pantigliate', '015', NULL, '2023-02-27 18:49:07', 'G316');
INSERT INTO `comuni` VALUES ('015168', 'Parabiago', '015', NULL, '2023-02-27 18:49:07', 'G324');
INSERT INTO `comuni` VALUES ('015169', 'Paullo', '015', NULL, '2023-02-27 18:49:07', 'G385');
INSERT INTO `comuni` VALUES ('015170', 'Pero', '015', NULL, '2023-02-27 18:49:07', 'C013');
INSERT INTO `comuni` VALUES ('015171', 'Peschiera Borromeo', '015', NULL, '2023-02-27 18:49:07', 'G488');
INSERT INTO `comuni` VALUES ('015172', 'Pessano con Bornago', '015', NULL, '2023-02-27 18:49:07', 'G502');
INSERT INTO `comuni` VALUES ('015173', 'Pieve Emanuele', '015', NULL, '2023-02-27 18:49:07', 'G634');
INSERT INTO `comuni` VALUES ('015175', 'Pioltello', '015', NULL, '2023-02-27 18:49:07', 'G686');
INSERT INTO `comuni` VALUES ('015176', 'Pogliano Milanese', '015', NULL, '2023-02-27 18:49:07', 'G772');
INSERT INTO `comuni` VALUES ('015177', 'Pozzo d\'Adda', '015', NULL, '2023-02-27 18:49:07', 'G955');
INSERT INTO `comuni` VALUES ('015178', 'Pozzuolo Martesana', '015', NULL, '2023-02-27 18:49:07', 'G965');
INSERT INTO `comuni` VALUES ('015179', 'Pregnana Milanese', '015', NULL, '2023-02-27 18:49:07', 'H026');
INSERT INTO `comuni` VALUES ('015181', 'Rescaldina', '015', NULL, '2023-02-27 18:49:07', 'H240');
INSERT INTO `comuni` VALUES ('015182', 'Rho', '015', NULL, '2023-02-27 18:49:07', 'H264');
INSERT INTO `comuni` VALUES ('015183', 'Robecchetto con Induno', '015', NULL, '2023-02-27 18:49:07', 'H371');
INSERT INTO `comuni` VALUES ('015184', 'Robecco sul Naviglio', '015', NULL, '2023-02-27 18:49:07', 'H373');
INSERT INTO `comuni` VALUES ('015185', 'Rodano', '015', NULL, '2023-02-27 18:49:07', 'H470');
INSERT INTO `comuni` VALUES ('015188', 'Rosate', '015', NULL, '2023-02-27 18:49:07', 'H560');
INSERT INTO `comuni` VALUES ('015189', 'Rozzano', '015', NULL, '2023-02-27 18:49:07', 'H623');
INSERT INTO `comuni` VALUES ('015191', 'San Colombano al Lambro', '015', NULL, '2023-02-27 18:49:07', 'H803');
INSERT INTO `comuni` VALUES ('015192', 'San Donato Milanese', '015', NULL, '2023-02-27 18:49:07', 'H827');
INSERT INTO `comuni` VALUES ('015194', 'San Giorgio su Legnano', '015', NULL, '2023-02-27 18:49:07', 'H884');
INSERT INTO `comuni` VALUES ('015195', 'San Giuliano Milanese', '015', NULL, '2023-02-27 18:49:07', 'H930');
INSERT INTO `comuni` VALUES ('015200', 'Santo Stefano Ticino', '015', NULL, '2023-02-27 18:49:07', 'I361');
INSERT INTO `comuni` VALUES ('015201', 'San Vittore Olona', '015', NULL, '2023-02-27 18:49:07', 'I409');
INSERT INTO `comuni` VALUES ('015202', 'San Zenone al Lambro', '015', NULL, '2023-02-27 18:49:07', 'I415');
INSERT INTO `comuni` VALUES ('015204', 'Sedriano', '015', NULL, '2023-02-27 18:49:07', 'I566');
INSERT INTO `comuni` VALUES ('015205', 'Segrate', '015', NULL, '2023-02-27 18:49:07', 'I577');
INSERT INTO `comuni` VALUES ('015206', 'Senago', '015', NULL, '2023-02-27 18:49:07', 'I602');
INSERT INTO `comuni` VALUES ('015209', 'Sesto San Giovanni', '015', NULL, '2023-02-27 18:49:07', 'I690');
INSERT INTO `comuni` VALUES ('015210', 'Settala', '015', NULL, '2023-02-27 18:49:07', 'I696');
INSERT INTO `comuni` VALUES ('015211', 'Settimo Milanese', '015', NULL, '2023-02-27 18:49:07', 'I700');
INSERT INTO `comuni` VALUES ('015213', 'Solaro', '015', NULL, '2023-02-27 18:49:07', 'I786');
INSERT INTO `comuni` VALUES ('015219', 'Trezzano Rosa', '015', NULL, '2023-02-27 18:49:07', 'L408');
INSERT INTO `comuni` VALUES ('015220', 'Trezzano sul Naviglio', '015', NULL, '2023-02-27 18:49:07', 'L409');
INSERT INTO `comuni` VALUES ('015221', 'Trezzo sull\'Adda', '015', NULL, '2023-02-27 18:49:07', 'L411');
INSERT INTO `comuni` VALUES ('015222', 'Tribiano', '015', NULL, '2023-02-27 18:49:07', 'L415');
INSERT INTO `comuni` VALUES ('015224', 'Truccazzano', '015', NULL, '2023-02-27 18:49:07', 'L454');
INSERT INTO `comuni` VALUES ('015226', 'Turbigo', '015', NULL, '2023-02-27 18:49:07', 'L471');
INSERT INTO `comuni` VALUES ('015229', 'Vanzago', '015', NULL, '2023-02-27 18:49:07', 'L665');
INSERT INTO `comuni` VALUES ('015230', 'Vaprio d\'Adda', '015', NULL, '2023-02-27 18:49:07', 'L667');
INSERT INTO `comuni` VALUES ('015235', 'Vermezzo', '015', NULL, '2023-02-27 18:49:07', 'L768');
INSERT INTO `comuni` VALUES ('015236', 'Vernate', '015', NULL, '2023-02-27 18:49:07', 'L773');
INSERT INTO `comuni` VALUES ('015237', 'Vignate', '015', NULL, '2023-02-27 18:49:07', 'L883');
INSERT INTO `comuni` VALUES ('015242', 'Vimodrone', '015', NULL, '2023-02-27 18:49:07', 'M053');
INSERT INTO `comuni` VALUES ('015243', 'Vittuone', '015', NULL, '2023-02-27 18:49:07', 'M091');
INSERT INTO `comuni` VALUES ('015244', 'Vizzolo Predabissi', '015', NULL, '2023-02-27 18:49:07', 'M102');
INSERT INTO `comuni` VALUES ('015246', 'Zelo Surrigone', '015', NULL, '2023-02-27 18:49:07', 'M160');
INSERT INTO `comuni` VALUES ('015247', 'Zibido San Giacomo', '015', NULL, '2023-02-27 18:49:07', 'M176');
INSERT INTO `comuni` VALUES ('015248', 'Villa Cortese', '015', NULL, '2023-02-27 18:49:07', 'L928');
INSERT INTO `comuni` VALUES ('015249', 'Vanzaghello', '015', NULL, '2023-02-27 18:49:07', 'L664');
INSERT INTO `comuni` VALUES ('015250', 'Baranzate', '015', NULL, '2023-02-27 18:49:07', 'A618');
INSERT INTO `comuni` VALUES ('016001', 'Adrara San Martino', '016', NULL, '2023-02-27 18:49:07', 'A057');
INSERT INTO `comuni` VALUES ('016002', 'Adrara San Rocco', '016', NULL, '2023-02-27 18:49:07', 'A058');
INSERT INTO `comuni` VALUES ('016003', 'Albano Sant\'Alessandro', '016', NULL, '2023-02-27 18:49:07', 'A129');
INSERT INTO `comuni` VALUES ('016004', 'Albino', '016', NULL, '2023-02-27 18:49:07', 'A163');
INSERT INTO `comuni` VALUES ('016005', 'Almè', '016', NULL, '2023-02-27 18:49:07', 'A214');
INSERT INTO `comuni` VALUES ('016006', 'Almenno San Bartolomeo', '016', NULL, '2023-02-27 18:49:07', 'A216');
INSERT INTO `comuni` VALUES ('016007', 'Almenno San Salvatore', '016', NULL, '2023-02-27 18:49:07', 'A217');
INSERT INTO `comuni` VALUES ('016008', 'Alzano Lombardo', '016', NULL, '2023-02-27 18:49:07', 'A246');
INSERT INTO `comuni` VALUES ('016009', 'Ambivere', '016', NULL, '2023-02-27 18:49:07', 'A259');
INSERT INTO `comuni` VALUES ('016010', 'Antegnate', '016', NULL, '2023-02-27 18:49:07', 'A304');
INSERT INTO `comuni` VALUES ('016011', 'Arcene', '016', NULL, '2023-02-27 18:49:07', 'A365');
INSERT INTO `comuni` VALUES ('016012', 'Ardesio', '016', NULL, '2023-02-27 18:49:07', 'A383');
INSERT INTO `comuni` VALUES ('016013', 'Arzago d\'Adda', '016', NULL, '2023-02-27 18:49:07', 'A440');
INSERT INTO `comuni` VALUES ('016014', 'Averara', '016', NULL, '2023-02-27 18:49:07', 'A511');
INSERT INTO `comuni` VALUES ('016015', 'Aviatico', '016', NULL, '2023-02-27 18:49:07', 'A517');
INSERT INTO `comuni` VALUES ('016016', 'Azzano San Paolo', '016', NULL, '2023-02-27 18:49:07', 'A528');
INSERT INTO `comuni` VALUES ('016017', 'Azzone', '016', NULL, '2023-02-27 18:49:07', 'A533');
INSERT INTO `comuni` VALUES ('016018', 'Bagnatica', '016', NULL, '2023-02-27 18:49:07', 'A557');
INSERT INTO `comuni` VALUES ('016019', 'Barbata', '016', NULL, '2023-02-27 18:49:07', 'A631');
INSERT INTO `comuni` VALUES ('016020', 'Bariano', '016', NULL, '2023-02-27 18:49:07', 'A664');
INSERT INTO `comuni` VALUES ('016021', 'Barzana', '016', NULL, '2023-02-27 18:49:07', 'A684');
INSERT INTO `comuni` VALUES ('016022', 'Bedulita', '016', NULL, '2023-02-27 18:49:07', 'A732');
INSERT INTO `comuni` VALUES ('016023', 'Berbenno', '016', NULL, '2023-02-27 18:49:07', 'A786');
INSERT INTO `comuni` VALUES ('016024', 'Bergamo', '016', NULL, '2023-02-27 18:49:07', 'A794');
INSERT INTO `comuni` VALUES ('016025', 'Berzo San Fermo', '016', NULL, '2023-02-27 18:49:07', 'A815');
INSERT INTO `comuni` VALUES ('016026', 'Bianzano', '016', NULL, '2023-02-27 18:49:07', 'A846');
INSERT INTO `comuni` VALUES ('016027', 'Blello', '016', NULL, '2023-02-27 18:49:07', 'A903');
INSERT INTO `comuni` VALUES ('016028', 'Bolgare', '016', NULL, '2023-02-27 18:49:07', 'A937');
INSERT INTO `comuni` VALUES ('016029', 'Boltiere', '016', NULL, '2023-02-27 18:49:07', 'A950');
INSERT INTO `comuni` VALUES ('016030', 'Bonate Sopra', '016', NULL, '2023-02-27 18:49:07', 'A963');
INSERT INTO `comuni` VALUES ('016031', 'Bonate Sotto', '016', NULL, '2023-02-27 18:49:07', 'A962');
INSERT INTO `comuni` VALUES ('016032', 'Borgo di Terzo', '016', NULL, '2023-02-27 18:49:07', 'B010');
INSERT INTO `comuni` VALUES ('016033', 'Bossico', '016', NULL, '2023-02-27 18:49:07', 'B083');
INSERT INTO `comuni` VALUES ('016034', 'Bottanuco', '016', NULL, '2023-02-27 18:49:07', 'B088');
INSERT INTO `comuni` VALUES ('016035', 'Bracca', '016', NULL, '2023-02-27 18:49:07', 'B112');
INSERT INTO `comuni` VALUES ('016036', 'Branzi', '016', NULL, '2023-02-27 18:49:07', 'B123');
INSERT INTO `comuni` VALUES ('016037', 'Brembate', '016', NULL, '2023-02-27 18:49:07', 'B137');
INSERT INTO `comuni` VALUES ('016038', 'Brembate di Sopra', '016', NULL, '2023-02-27 18:49:07', 'B138');
INSERT INTO `comuni` VALUES ('016040', 'Brignano Gera d\'Adda', '016', NULL, '2023-02-27 18:49:07', 'B178');
INSERT INTO `comuni` VALUES ('016041', 'Brumano', '016', NULL, '2023-02-27 18:49:07', 'B217');
INSERT INTO `comuni` VALUES ('016042', 'Brusaporto', '016', NULL, '2023-02-27 18:49:07', 'B223');
INSERT INTO `comuni` VALUES ('016043', 'Calcinate', '016', NULL, '2023-02-27 18:49:07', 'B393');
INSERT INTO `comuni` VALUES ('016044', 'Calcio', '016', NULL, '2023-02-27 18:49:07', 'B395');
INSERT INTO `comuni` VALUES ('016046', 'Calusco d\'Adda', '016', NULL, '2023-02-27 18:49:07', 'B434');
INSERT INTO `comuni` VALUES ('016047', 'Calvenzano', '016', NULL, '2023-02-27 18:49:07', 'B442');
INSERT INTO `comuni` VALUES ('016048', 'Camerata Cornello', '016', NULL, '2023-02-27 18:49:07', 'B471');
INSERT INTO `comuni` VALUES ('016049', 'Canonica d\'Adda', '016', NULL, '2023-02-27 18:49:07', 'B618');
INSERT INTO `comuni` VALUES ('016050', 'Capizzone', '016', NULL, '2023-02-27 18:49:07', 'B661');
INSERT INTO `comuni` VALUES ('016051', 'Capriate San Gervasio', '016', NULL, '2023-02-27 18:49:07', 'B703');
INSERT INTO `comuni` VALUES ('016052', 'Caprino Bergamasco', '016', NULL, '2023-02-27 18:49:07', 'B710');
INSERT INTO `comuni` VALUES ('016053', 'Caravaggio', '016', NULL, '2023-02-27 18:49:07', 'B731');
INSERT INTO `comuni` VALUES ('016055', 'Carobbio degli Angeli', '016', NULL, '2023-02-27 18:49:07', 'B801');
INSERT INTO `comuni` VALUES ('016056', 'Carona', '016', NULL, '2023-02-27 18:49:07', 'B803');
INSERT INTO `comuni` VALUES ('016057', 'Carvico', '016', NULL, '2023-02-27 18:49:07', 'B854');
INSERT INTO `comuni` VALUES ('016058', 'Casazza', '016', NULL, '2023-02-27 18:49:07', 'B947');
INSERT INTO `comuni` VALUES ('016059', 'Casirate d\'Adda', '016', NULL, '2023-02-27 18:49:07', 'B971');
INSERT INTO `comuni` VALUES ('016060', 'Casnigo', '016', NULL, '2023-02-27 18:49:07', 'B978');
INSERT INTO `comuni` VALUES ('016061', 'Cassiglio', '016', NULL, '2023-02-27 18:49:07', 'C007');
INSERT INTO `comuni` VALUES ('016062', 'Castelli Calepio', '016', NULL, '2023-02-27 18:49:07', 'C079');
INSERT INTO `comuni` VALUES ('016063', 'Castel Rozzone', '016', NULL, '2023-02-27 18:49:07', 'C255');
INSERT INTO `comuni` VALUES ('016064', 'Castione della Presolana', '016', NULL, '2023-02-27 18:49:07', 'C324');
INSERT INTO `comuni` VALUES ('016065', 'Castro', '016', NULL, '2023-02-27 18:49:07', 'C337');
INSERT INTO `comuni` VALUES ('016066', 'Cavernago', '016', NULL, '2023-02-27 18:49:07', 'C396');
INSERT INTO `comuni` VALUES ('016067', 'Cazzano Sant\'Andrea', '016', NULL, '2023-02-27 18:49:07', 'C410');
INSERT INTO `comuni` VALUES ('016068', 'Cenate Sopra', '016', NULL, '2023-02-27 18:49:07', 'C456');
INSERT INTO `comuni` VALUES ('016069', 'Cenate Sotto', '016', NULL, '2023-02-27 18:49:07', 'C457');
INSERT INTO `comuni` VALUES ('016070', 'Cene', '016', NULL, '2023-02-27 18:49:07', 'C459');
INSERT INTO `comuni` VALUES ('016071', 'Cerete', '016', NULL, '2023-02-27 18:49:07', 'C506');
INSERT INTO `comuni` VALUES ('016072', 'Chignolo d\'Isola', '016', NULL, '2023-02-27 18:49:07', 'C635');
INSERT INTO `comuni` VALUES ('016073', 'Chiuduno', '016', NULL, '2023-02-27 18:49:07', 'C649');
INSERT INTO `comuni` VALUES ('016074', 'Cisano Bergamasco', '016', NULL, '2023-02-27 18:49:07', 'C728');
INSERT INTO `comuni` VALUES ('016075', 'Ciserano', '016', NULL, '2023-02-27 18:49:07', 'C730');
INSERT INTO `comuni` VALUES ('016076', 'Cividate al Piano', '016', NULL, '2023-02-27 18:49:07', 'C759');
INSERT INTO `comuni` VALUES ('016077', 'Clusone', '016', NULL, '2023-02-27 18:49:07', 'C800');
INSERT INTO `comuni` VALUES ('016078', 'Colere', '016', NULL, '2023-02-27 18:49:07', 'C835');
INSERT INTO `comuni` VALUES ('016079', 'Cologno al Serio', '016', NULL, '2023-02-27 18:49:07', 'C894');
INSERT INTO `comuni` VALUES ('016080', 'Colzate', '016', NULL, '2023-02-27 18:49:07', 'C910');
INSERT INTO `comuni` VALUES ('016081', 'Comun Nuovo', '016', NULL, '2023-02-27 18:49:07', 'C937');
INSERT INTO `comuni` VALUES ('016082', 'Corna Imagna', '016', NULL, '2023-02-27 18:49:07', 'D015');
INSERT INTO `comuni` VALUES ('016083', 'Cortenuova', '016', NULL, '2023-02-27 18:49:07', 'D066');
INSERT INTO `comuni` VALUES ('016084', 'Costa di Mezzate', '016', NULL, '2023-02-27 18:49:07', 'D110');
INSERT INTO `comuni` VALUES ('016085', 'Costa Valle Imagna', '016', NULL, '2023-02-27 18:49:07', 'D103');
INSERT INTO `comuni` VALUES ('016086', 'Costa Volpino', '016', NULL, '2023-02-27 18:49:07', 'D117');
INSERT INTO `comuni` VALUES ('016087', 'Covo', '016', NULL, '2023-02-27 18:49:07', 'D126');
INSERT INTO `comuni` VALUES ('016088', 'Credaro', '016', NULL, '2023-02-27 18:49:07', 'D139');
INSERT INTO `comuni` VALUES ('016089', 'Curno', '016', NULL, '2023-02-27 18:49:07', 'D221');
INSERT INTO `comuni` VALUES ('016090', 'Cusio', '016', NULL, '2023-02-27 18:49:07', 'D233');
INSERT INTO `comuni` VALUES ('016091', 'Dalmine', '016', NULL, '2023-02-27 18:49:07', 'D245');
INSERT INTO `comuni` VALUES ('016092', 'Dossena', '016', NULL, '2023-02-27 18:49:07', 'D352');
INSERT INTO `comuni` VALUES ('016093', 'Endine Gaiano', '016', NULL, '2023-02-27 18:49:07', 'D406');
INSERT INTO `comuni` VALUES ('016094', 'Entratico', '016', NULL, '2023-02-27 18:49:07', 'D411');
INSERT INTO `comuni` VALUES ('016096', 'Fara Gera d\'Adda', '016', NULL, '2023-02-27 18:49:07', 'D490');
INSERT INTO `comuni` VALUES ('016097', 'Fara Olivana con Sola', '016', NULL, '2023-02-27 18:49:07', 'D491');
INSERT INTO `comuni` VALUES ('016098', 'Filago', '016', NULL, '2023-02-27 18:49:07', 'D588');
INSERT INTO `comuni` VALUES ('016099', 'Fino del Monte', '016', NULL, '2023-02-27 18:49:07', 'D604');
INSERT INTO `comuni` VALUES ('016100', 'Fiorano al Serio', '016', NULL, '2023-02-27 18:49:07', 'D606');
INSERT INTO `comuni` VALUES ('016101', 'Fontanella', '016', NULL, '2023-02-27 18:49:07', 'D672');
INSERT INTO `comuni` VALUES ('016102', 'Fonteno', '016', NULL, '2023-02-27 18:49:07', 'D684');
INSERT INTO `comuni` VALUES ('016103', 'Foppolo', '016', NULL, '2023-02-27 18:49:07', 'D688');
INSERT INTO `comuni` VALUES ('016104', 'Foresto Sparso', '016', NULL, '2023-02-27 18:49:07', 'D697');
INSERT INTO `comuni` VALUES ('016105', 'Fornovo San Giovanni', '016', NULL, '2023-02-27 18:49:07', 'D727');
INSERT INTO `comuni` VALUES ('016106', 'Fuipiano Valle Imagna', '016', NULL, '2023-02-27 18:49:07', 'D817');
INSERT INTO `comuni` VALUES ('016107', 'Gandellino', '016', NULL, '2023-02-27 18:49:07', 'D903');
INSERT INTO `comuni` VALUES ('016108', 'Gandino', '016', NULL, '2023-02-27 18:49:07', 'D905');
INSERT INTO `comuni` VALUES ('016109', 'Gandosso', '016', NULL, '2023-02-27 18:49:07', 'D906');
INSERT INTO `comuni` VALUES ('016110', 'Gaverina Terme', '016', NULL, '2023-02-27 18:49:07', 'D943');
INSERT INTO `comuni` VALUES ('016111', 'Gazzaniga', '016', NULL, '2023-02-27 18:49:07', 'D952');
INSERT INTO `comuni` VALUES ('016113', 'Ghisalba', '016', NULL, '2023-02-27 18:49:07', 'E006');
INSERT INTO `comuni` VALUES ('016114', 'Gorlago', '016', NULL, '2023-02-27 18:49:07', 'E100');
INSERT INTO `comuni` VALUES ('016115', 'Gorle', '016', NULL, '2023-02-27 18:49:07', 'E103');
INSERT INTO `comuni` VALUES ('016116', 'Gorno', '016', NULL, '2023-02-27 18:49:07', 'E106');
INSERT INTO `comuni` VALUES ('016117', 'Grassobbio', '016', NULL, '2023-02-27 18:49:07', 'E148');
INSERT INTO `comuni` VALUES ('016118', 'Gromo', '016', NULL, '2023-02-27 18:49:07', 'E189');
INSERT INTO `comuni` VALUES ('016119', 'Grone', '016', NULL, '2023-02-27 18:49:07', 'E192');
INSERT INTO `comuni` VALUES ('016120', 'Grumello del Monte', '016', NULL, '2023-02-27 18:49:07', 'E219');
INSERT INTO `comuni` VALUES ('016121', 'Isola di Fondra', '016', NULL, '2023-02-27 18:49:07', 'E353');
INSERT INTO `comuni` VALUES ('016122', 'Isso', '016', NULL, '2023-02-27 18:49:07', 'E370');
INSERT INTO `comuni` VALUES ('016123', 'Lallio', '016', NULL, '2023-02-27 18:49:07', 'E422');
INSERT INTO `comuni` VALUES ('016124', 'Leffe', '016', NULL, '2023-02-27 18:49:07', 'E509');
INSERT INTO `comuni` VALUES ('016125', 'Lenna', '016', NULL, '2023-02-27 18:49:07', 'E524');
INSERT INTO `comuni` VALUES ('016126', 'Levate', '016', NULL, '2023-02-27 18:49:07', 'E562');
INSERT INTO `comuni` VALUES ('016127', 'Locatello', '016', NULL, '2023-02-27 18:49:07', 'E640');
INSERT INTO `comuni` VALUES ('016128', 'Lovere', '016', NULL, '2023-02-27 18:49:07', 'E704');
INSERT INTO `comuni` VALUES ('016129', 'Lurano', '016', NULL, '2023-02-27 18:49:07', 'E751');
INSERT INTO `comuni` VALUES ('016130', 'Luzzana', '016', NULL, '2023-02-27 18:49:07', 'E770');
INSERT INTO `comuni` VALUES ('016131', 'Madone', '016', NULL, '2023-02-27 18:49:07', 'E794');
INSERT INTO `comuni` VALUES ('016132', 'Mapello', '016', NULL, '2023-02-27 18:49:07', 'E901');
INSERT INTO `comuni` VALUES ('016133', 'Martinengo', '016', NULL, '2023-02-27 18:49:07', 'E987');
INSERT INTO `comuni` VALUES ('016134', 'Mezzoldo', '016', NULL, '2023-02-27 18:49:07', 'F186');
INSERT INTO `comuni` VALUES ('016135', 'Misano di Gera d\'Adda', '016', NULL, '2023-02-27 18:49:07', 'F243');
INSERT INTO `comuni` VALUES ('016136', 'Moio de\' Calvi', '016', NULL, '2023-02-27 18:49:07', 'F276');
INSERT INTO `comuni` VALUES ('016137', 'Monasterolo del Castello', '016', NULL, '2023-02-27 18:49:07', 'F328');
INSERT INTO `comuni` VALUES ('016139', 'Montello', '016', NULL, '2023-02-27 18:49:07', 'F547');
INSERT INTO `comuni` VALUES ('016140', 'Morengo', '016', NULL, '2023-02-27 18:49:07', 'F720');
INSERT INTO `comuni` VALUES ('016141', 'Mornico al Serio', '016', NULL, '2023-02-27 18:49:07', 'F738');
INSERT INTO `comuni` VALUES ('016142', 'Mozzanica', '016', NULL, '2023-02-27 18:49:07', 'F786');
INSERT INTO `comuni` VALUES ('016143', 'Mozzo', '016', NULL, '2023-02-27 18:49:07', 'F791');
INSERT INTO `comuni` VALUES ('016144', 'Nembro', '016', NULL, '2023-02-27 18:49:07', 'F864');
INSERT INTO `comuni` VALUES ('016145', 'Olmo al Brembo', '016', NULL, '2023-02-27 18:49:07', 'G049');
INSERT INTO `comuni` VALUES ('016146', 'Oltre il Colle', '016', NULL, '2023-02-27 18:49:07', 'G050');
INSERT INTO `comuni` VALUES ('016147', 'Oltressenda Alta', '016', NULL, '2023-02-27 18:49:07', 'G054');
INSERT INTO `comuni` VALUES ('016148', 'Oneta', '016', NULL, '2023-02-27 18:49:07', 'G068');
INSERT INTO `comuni` VALUES ('016149', 'Onore', '016', NULL, '2023-02-27 18:49:07', 'G075');
INSERT INTO `comuni` VALUES ('016150', 'Orio al Serio', '016', NULL, '2023-02-27 18:49:07', 'G108');
INSERT INTO `comuni` VALUES ('016151', 'Ornica', '016', NULL, '2023-02-27 18:49:07', 'G118');
INSERT INTO `comuni` VALUES ('016152', 'Osio Sopra', '016', NULL, '2023-02-27 18:49:07', 'G159');
INSERT INTO `comuni` VALUES ('016153', 'Osio Sotto', '016', NULL, '2023-02-27 18:49:07', 'G160');
INSERT INTO `comuni` VALUES ('016154', 'Pagazzano', '016', NULL, '2023-02-27 18:49:07', 'G233');
INSERT INTO `comuni` VALUES ('016155', 'Paladina', '016', NULL, '2023-02-27 18:49:07', 'G249');
INSERT INTO `comuni` VALUES ('016156', 'Palazzago', '016', NULL, '2023-02-27 18:49:07', 'G259');
INSERT INTO `comuni` VALUES ('016157', 'Palosco', '016', NULL, '2023-02-27 18:49:07', 'G295');
INSERT INTO `comuni` VALUES ('016158', 'Parre', '016', NULL, '2023-02-27 18:49:07', 'G346');
INSERT INTO `comuni` VALUES ('016159', 'Parzanica', '016', NULL, '2023-02-27 18:49:07', 'G350');
INSERT INTO `comuni` VALUES ('016160', 'Pedrengo', '016', NULL, '2023-02-27 18:49:07', 'G412');
INSERT INTO `comuni` VALUES ('016161', 'Peia', '016', NULL, '2023-02-27 18:49:07', 'G418');
INSERT INTO `comuni` VALUES ('016162', 'Pianico', '016', NULL, '2023-02-27 18:49:07', 'G564');
INSERT INTO `comuni` VALUES ('016163', 'Piario', '016', NULL, '2023-02-27 18:49:07', 'G574');
INSERT INTO `comuni` VALUES ('016164', 'Piazza Brembana', '016', NULL, '2023-02-27 18:49:07', 'G579');
INSERT INTO `comuni` VALUES ('016165', 'Piazzatorre', '016', NULL, '2023-02-27 18:49:07', 'G583');
INSERT INTO `comuni` VALUES ('016166', 'Piazzolo', '016', NULL, '2023-02-27 18:49:07', 'G588');
INSERT INTO `comuni` VALUES ('016167', 'Pognano', '016', NULL, '2023-02-27 18:49:07', 'G774');
INSERT INTO `comuni` VALUES ('016168', 'Ponte Nossa', '016', NULL, '2023-02-27 18:49:07', 'F941');
INSERT INTO `comuni` VALUES ('016169', 'Ponteranica', '016', NULL, '2023-02-27 18:49:07', 'G853');
INSERT INTO `comuni` VALUES ('016170', 'Ponte San Pietro', '016', NULL, '2023-02-27 18:49:07', 'G856');
INSERT INTO `comuni` VALUES ('016171', 'Pontida', '016', NULL, '2023-02-27 18:49:07', 'G864');
INSERT INTO `comuni` VALUES ('016172', 'Pontirolo Nuovo', '016', NULL, '2023-02-27 18:49:07', 'G867');
INSERT INTO `comuni` VALUES ('016173', 'Pradalunga', '016', NULL, '2023-02-27 18:49:07', 'G968');
INSERT INTO `comuni` VALUES ('016174', 'Predore', '016', NULL, '2023-02-27 18:49:07', 'H020');
INSERT INTO `comuni` VALUES ('016175', 'Premolo', '016', NULL, '2023-02-27 18:49:07', 'H036');
INSERT INTO `comuni` VALUES ('016176', 'Presezzo', '016', NULL, '2023-02-27 18:49:07', 'H046');
INSERT INTO `comuni` VALUES ('016177', 'Pumenengo', '016', NULL, '2023-02-27 18:49:07', 'H091');
INSERT INTO `comuni` VALUES ('016178', 'Ranica', '016', NULL, '2023-02-27 18:49:07', 'H176');
INSERT INTO `comuni` VALUES ('016179', 'Ranzanico', '016', NULL, '2023-02-27 18:49:07', 'H177');
INSERT INTO `comuni` VALUES ('016180', 'Riva di Solto', '016', NULL, '2023-02-27 18:49:07', 'H331');
INSERT INTO `comuni` VALUES ('016182', 'Rogno', '016', NULL, '2023-02-27 18:49:07', 'H492');
INSERT INTO `comuni` VALUES ('016183', 'Romano di Lombardia', '016', NULL, '2023-02-27 18:49:07', 'H509');
INSERT INTO `comuni` VALUES ('016184', 'Roncobello', '016', NULL, '2023-02-27 18:49:07', 'H535');
INSERT INTO `comuni` VALUES ('016185', 'Roncola', '016', NULL, '2023-02-27 18:49:07', 'H544');
INSERT INTO `comuni` VALUES ('016186', 'Rota d\'Imagna', '016', NULL, '2023-02-27 18:49:07', 'H584');
INSERT INTO `comuni` VALUES ('016187', 'Rovetta', '016', NULL, '2023-02-27 18:49:07', 'H615');
INSERT INTO `comuni` VALUES ('016188', 'San Giovanni Bianco', '016', NULL, '2023-02-27 18:49:07', 'H910');
INSERT INTO `comuni` VALUES ('016189', 'San Paolo d\'Argon', '016', NULL, '2023-02-27 18:49:07', 'B310');
INSERT INTO `comuni` VALUES ('016190', 'San Pellegrino Terme', '016', NULL, '2023-02-27 18:49:07', 'I079');
INSERT INTO `comuni` VALUES ('016191', 'Santa Brigida', '016', NULL, '2023-02-27 18:49:07', 'I168');
INSERT INTO `comuni` VALUES ('016193', 'Sarnico', '016', NULL, '2023-02-27 18:49:07', 'I437');
INSERT INTO `comuni` VALUES ('016194', 'Scanzorosciate', '016', NULL, '2023-02-27 18:49:07', 'I506');
INSERT INTO `comuni` VALUES ('016195', 'Schilpario', '016', NULL, '2023-02-27 18:49:07', 'I530');
INSERT INTO `comuni` VALUES ('016196', 'Sedrina', '016', NULL, '2023-02-27 18:49:07', 'I567');
INSERT INTO `comuni` VALUES ('016197', 'Selvino', '016', NULL, '2023-02-27 18:49:07', 'I597');
INSERT INTO `comuni` VALUES ('016198', 'Seriate', '016', NULL, '2023-02-27 18:49:07', 'I628');
INSERT INTO `comuni` VALUES ('016199', 'Serina', '016', NULL, '2023-02-27 18:49:07', 'I629');
INSERT INTO `comuni` VALUES ('016200', 'Solto Collina', '016', NULL, '2023-02-27 18:49:07', 'I812');
INSERT INTO `comuni` VALUES ('016201', 'Songavazzo', '016', NULL, '2023-02-27 18:49:07', 'I830');
INSERT INTO `comuni` VALUES ('016202', 'Sorisole', '016', NULL, '2023-02-27 18:49:07', 'I858');
INSERT INTO `comuni` VALUES ('016203', 'Sotto il Monte Giovanni XXIII', '016', NULL, '2023-02-27 18:49:07', 'I869');
INSERT INTO `comuni` VALUES ('016204', 'Sovere', '016', NULL, '2023-02-27 18:49:07', 'I873');
INSERT INTO `comuni` VALUES ('016205', 'Spinone al Lago', '016', NULL, '2023-02-27 18:49:07', 'I916');
INSERT INTO `comuni` VALUES ('016206', 'Spirano', '016', NULL, '2023-02-27 18:49:07', 'I919');
INSERT INTO `comuni` VALUES ('016207', 'Stezzano', '016', NULL, '2023-02-27 18:49:07', 'I951');
INSERT INTO `comuni` VALUES ('016208', 'Strozza', '016', NULL, '2023-02-27 18:49:07', 'I986');
INSERT INTO `comuni` VALUES ('016209', 'Suisio', '016', NULL, '2023-02-27 18:49:07', 'I997');
INSERT INTO `comuni` VALUES ('016210', 'Taleggio', '016', NULL, '2023-02-27 18:49:07', 'L037');
INSERT INTO `comuni` VALUES ('016211', 'Tavernola Bergamasca', '016', NULL, '2023-02-27 18:49:07', 'L073');
INSERT INTO `comuni` VALUES ('016212', 'Telgate', '016', NULL, '2023-02-27 18:49:07', 'L087');
INSERT INTO `comuni` VALUES ('016213', 'Terno d\'Isola', '016', NULL, '2023-02-27 18:49:07', 'L118');
INSERT INTO `comuni` VALUES ('016214', 'Torre Boldone', '016', NULL, '2023-02-27 18:49:07', 'L251');
INSERT INTO `comuni` VALUES ('016216', 'Torre de\' Roveri', '016', NULL, '2023-02-27 18:49:07', 'L265');
INSERT INTO `comuni` VALUES ('016217', 'Torre Pallavicina', '016', NULL, '2023-02-27 18:49:07', 'L276');
INSERT INTO `comuni` VALUES ('016218', 'Trescore Balneario', '016', NULL, '2023-02-27 18:49:07', 'L388');
INSERT INTO `comuni` VALUES ('016219', 'Treviglio', '016', NULL, '2023-02-27 18:49:07', 'L400');
INSERT INTO `comuni` VALUES ('016220', 'Treviolo', '016', NULL, '2023-02-27 18:49:07', 'L404');
INSERT INTO `comuni` VALUES ('016221', 'Ubiale Clanezzo', '016', NULL, '2023-02-27 18:49:07', 'C789');
INSERT INTO `comuni` VALUES ('016222', 'Urgnano', '016', NULL, '2023-02-27 18:49:07', 'L502');
INSERT INTO `comuni` VALUES ('016223', 'Valbondione', '016', NULL, '2023-02-27 18:49:07', 'L544');
INSERT INTO `comuni` VALUES ('016224', 'Valbrembo', '016', NULL, '2023-02-27 18:49:07', 'L545');
INSERT INTO `comuni` VALUES ('016225', 'Valgoglio', '016', NULL, '2023-02-27 18:49:07', 'L579');
INSERT INTO `comuni` VALUES ('016226', 'Valleve', '016', NULL, '2023-02-27 18:49:07', 'L623');
INSERT INTO `comuni` VALUES ('016227', 'Valnegra', '016', NULL, '2023-02-27 18:49:07', 'L642');
INSERT INTO `comuni` VALUES ('016229', 'Valtorta', '016', NULL, '2023-02-27 18:49:07', 'L655');
INSERT INTO `comuni` VALUES ('016230', 'Vedeseta', '016', NULL, '2023-02-27 18:49:07', 'L707');
INSERT INTO `comuni` VALUES ('016232', 'Verdellino', '016', NULL, '2023-02-27 18:49:07', 'L752');
INSERT INTO `comuni` VALUES ('016233', 'Verdello', '016', NULL, '2023-02-27 18:49:07', 'L753');
INSERT INTO `comuni` VALUES ('016234', 'Vertova', '016', NULL, '2023-02-27 18:49:07', 'L795');
INSERT INTO `comuni` VALUES ('016235', 'Viadanica', '016', NULL, '2023-02-27 18:49:07', 'L827');
INSERT INTO `comuni` VALUES ('016236', 'Vigano San Martino', '016', NULL, '2023-02-27 18:49:07', 'L865');
INSERT INTO `comuni` VALUES ('016237', 'Vigolo', '016', NULL, '2023-02-27 18:49:07', 'L894');
INSERT INTO `comuni` VALUES ('016238', 'Villa d\'Adda', '016', NULL, '2023-02-27 18:49:07', 'L929');
INSERT INTO `comuni` VALUES ('016239', 'Villa d\'Almè', '016', NULL, '2023-02-27 18:49:07', 'A215');
INSERT INTO `comuni` VALUES ('016240', 'Villa di Serio', '016', NULL, '2023-02-27 18:49:07', 'L936');
INSERT INTO `comuni` VALUES ('016241', 'Villa d\'Ogna', '016', NULL, '2023-02-27 18:49:07', 'L938');
INSERT INTO `comuni` VALUES ('016242', 'Villongo', '016', NULL, '2023-02-27 18:49:07', 'M045');
INSERT INTO `comuni` VALUES ('016243', 'Vilminore di Scalve', '016', NULL, '2023-02-27 18:49:07', 'M050');
INSERT INTO `comuni` VALUES ('016244', 'Zandobbio', '016', NULL, '2023-02-27 18:49:07', 'M144');
INSERT INTO `comuni` VALUES ('016245', 'Zanica', '016', NULL, '2023-02-27 18:49:07', 'M147');
INSERT INTO `comuni` VALUES ('016246', 'Zogno', '016', NULL, '2023-02-27 18:49:07', 'M184');
INSERT INTO `comuni` VALUES ('016247', 'Costa Serina', '016', NULL, '2023-02-27 18:49:07', 'D111');
INSERT INTO `comuni` VALUES ('016248', 'Algua', '016', NULL, '2023-02-27 18:49:07', 'A193');
INSERT INTO `comuni` VALUES ('016249', 'Cornalba', '016', NULL, '2023-02-27 18:49:07', 'D016');
INSERT INTO `comuni` VALUES ('016250', 'Medolago', '016', NULL, '2023-02-27 18:49:07', 'F085');
INSERT INTO `comuni` VALUES ('016251', 'Solza', '016', NULL, '2023-02-27 18:49:07', 'I813');
INSERT INTO `comuni` VALUES ('016252', 'Sant\'Omobono Terme', '016', NULL, '2023-02-27 18:49:07', 'M333');
INSERT INTO `comuni` VALUES ('016253', 'Val Brembilla', '016', NULL, '2023-02-27 18:49:07', 'M334');
INSERT INTO `comuni` VALUES ('017001', 'Acquafredda', '017', NULL, '2023-02-27 18:49:07', 'A034');
INSERT INTO `comuni` VALUES ('017002', 'Adro', '017', NULL, '2023-02-27 18:49:07', 'A060');
INSERT INTO `comuni` VALUES ('017003', 'Agnosine', '017', NULL, '2023-02-27 18:49:07', 'A082');
INSERT INTO `comuni` VALUES ('017004', 'Alfianello', '017', NULL, '2023-02-27 18:49:07', 'A188');
INSERT INTO `comuni` VALUES ('017005', 'Anfo', '017', NULL, '2023-02-27 18:49:07', 'A288');
INSERT INTO `comuni` VALUES ('017006', 'Angolo Terme', '017', NULL, '2023-02-27 18:49:07', 'A293');
INSERT INTO `comuni` VALUES ('017007', 'Artogne', '017', NULL, '2023-02-27 18:49:07', 'A451');
INSERT INTO `comuni` VALUES ('017008', 'Azzano Mella', '017', NULL, '2023-02-27 18:49:07', 'A529');
INSERT INTO `comuni` VALUES ('017009', 'Bagnolo Mella', '017', NULL, '2023-02-27 18:49:07', 'A569');
INSERT INTO `comuni` VALUES ('017010', 'Bagolino', '017', NULL, '2023-02-27 18:49:07', 'A578');
INSERT INTO `comuni` VALUES ('017011', 'Barbariga', '017', NULL, '2023-02-27 18:49:07', 'A630');
INSERT INTO `comuni` VALUES ('017012', 'Barghe', '017', NULL, '2023-02-27 18:49:07', 'A661');
INSERT INTO `comuni` VALUES ('017013', 'Bassano Bresciano', '017', NULL, '2023-02-27 18:49:07', 'A702');
INSERT INTO `comuni` VALUES ('017014', 'Bedizzole', '017', NULL, '2023-02-27 18:49:07', 'A729');
INSERT INTO `comuni` VALUES ('017015', 'Berlingo', '017', NULL, '2023-02-27 18:49:07', 'A799');
INSERT INTO `comuni` VALUES ('017016', 'Berzo Demo', '017', NULL, '2023-02-27 18:49:07', 'A816');
INSERT INTO `comuni` VALUES ('017017', 'Berzo Inferiore', '017', NULL, '2023-02-27 18:49:07', 'A817');
INSERT INTO `comuni` VALUES ('017018', 'Bienno', '017', NULL, '2023-02-27 18:49:07', 'A861');
INSERT INTO `comuni` VALUES ('017019', 'Bione', '017', NULL, '2023-02-27 18:49:07', 'A878');
INSERT INTO `comuni` VALUES ('017020', 'Borgo San Giacomo', '017', NULL, '2023-02-27 18:49:07', 'B035');
INSERT INTO `comuni` VALUES ('017021', 'Borgosatollo', '017', NULL, '2023-02-27 18:49:07', 'B040');
INSERT INTO `comuni` VALUES ('017022', 'Borno', '017', NULL, '2023-02-27 18:49:07', 'B054');
INSERT INTO `comuni` VALUES ('017023', 'Botticino', '017', NULL, '2023-02-27 18:49:07', 'B091');
INSERT INTO `comuni` VALUES ('017024', 'Bovegno', '017', NULL, '2023-02-27 18:49:07', 'B100');
INSERT INTO `comuni` VALUES ('017025', 'Bovezzo', '017', NULL, '2023-02-27 18:49:07', 'B102');
INSERT INTO `comuni` VALUES ('017026', 'Brandico', '017', NULL, '2023-02-27 18:49:07', 'B120');
INSERT INTO `comuni` VALUES ('017027', 'Braone', '017', NULL, '2023-02-27 18:49:07', 'B124');
INSERT INTO `comuni` VALUES ('017028', 'Breno', '017', NULL, '2023-02-27 18:49:07', 'B149');
INSERT INTO `comuni` VALUES ('017029', 'Brescia', '017', NULL, '2023-02-27 18:49:07', 'B157');
INSERT INTO `comuni` VALUES ('017030', 'Brione', '017', NULL, '2023-02-27 18:49:07', 'B184');
INSERT INTO `comuni` VALUES ('017031', 'Caino', '017', NULL, '2023-02-27 18:49:07', 'B365');
INSERT INTO `comuni` VALUES ('017032', 'Calcinato', '017', NULL, '2023-02-27 18:49:07', 'B394');
INSERT INTO `comuni` VALUES ('017033', 'Calvagese della Riviera', '017', NULL, '2023-02-27 18:49:07', 'B436');
INSERT INTO `comuni` VALUES ('017034', 'Calvisano', '017', NULL, '2023-02-27 18:49:07', 'B450');
INSERT INTO `comuni` VALUES ('017035', 'Capo di Ponte', '017', NULL, '2023-02-27 18:49:07', 'B664');
INSERT INTO `comuni` VALUES ('017036', 'Capovalle', '017', NULL, '2023-02-27 18:49:07', 'B676');
INSERT INTO `comuni` VALUES ('017037', 'Capriano del Colle', '017', NULL, '2023-02-27 18:49:07', 'B698');
INSERT INTO `comuni` VALUES ('017038', 'Capriolo', '017', NULL, '2023-02-27 18:49:07', 'B711');
INSERT INTO `comuni` VALUES ('017039', 'Carpenedolo', '017', NULL, '2023-02-27 18:49:07', 'B817');
INSERT INTO `comuni` VALUES ('017040', 'Castegnato', '017', NULL, '2023-02-27 18:49:07', 'C055');
INSERT INTO `comuni` VALUES ('017041', 'Castelcovati', '017', NULL, '2023-02-27 18:49:07', 'C072');
INSERT INTO `comuni` VALUES ('017042', 'Castel Mella', '017', NULL, '2023-02-27 18:49:07', 'C208');
INSERT INTO `comuni` VALUES ('017043', 'Castenedolo', '017', NULL, '2023-02-27 18:49:07', 'C293');
INSERT INTO `comuni` VALUES ('017044', 'Casto', '017', NULL, '2023-02-27 18:49:07', 'C330');
INSERT INTO `comuni` VALUES ('017045', 'Castrezzato', '017', NULL, '2023-02-27 18:49:07', 'C332');
INSERT INTO `comuni` VALUES ('017046', 'Cazzago San Martino', '017', NULL, '2023-02-27 18:49:07', 'C408');
INSERT INTO `comuni` VALUES ('017047', 'Cedegolo', '017', NULL, '2023-02-27 18:49:07', 'C417');
INSERT INTO `comuni` VALUES ('017048', 'Cellatica', '017', NULL, '2023-02-27 18:49:07', 'C439');
INSERT INTO `comuni` VALUES ('017049', 'Cerveno', '017', NULL, '2023-02-27 18:49:07', 'C549');
INSERT INTO `comuni` VALUES ('017050', 'Ceto', '017', NULL, '2023-02-27 18:49:07', 'C585');
INSERT INTO `comuni` VALUES ('017051', 'Cevo', '017', NULL, '2023-02-27 18:49:07', 'C591');
INSERT INTO `comuni` VALUES ('017052', 'Chiari', '017', NULL, '2023-02-27 18:49:07', 'C618');
INSERT INTO `comuni` VALUES ('017053', 'Cigole', '017', NULL, '2023-02-27 18:49:07', 'C685');
INSERT INTO `comuni` VALUES ('017054', 'Cimbergo', '017', NULL, '2023-02-27 18:49:07', 'C691');
INSERT INTO `comuni` VALUES ('017055', 'Cividate Camuno', '017', NULL, '2023-02-27 18:49:07', 'C760');
INSERT INTO `comuni` VALUES ('017056', 'Coccaglio', '017', NULL, '2023-02-27 18:49:07', 'C806');
INSERT INTO `comuni` VALUES ('017057', 'Collebeato', '017', NULL, '2023-02-27 18:49:07', 'C850');
INSERT INTO `comuni` VALUES ('017058', 'Collio', '017', NULL, '2023-02-27 18:49:07', 'C883');
INSERT INTO `comuni` VALUES ('017059', 'Cologne', '017', NULL, '2023-02-27 18:49:07', 'C893');
INSERT INTO `comuni` VALUES ('017060', 'Comezzano-Cizzago', '017', NULL, '2023-02-27 18:49:07', 'C925');
INSERT INTO `comuni` VALUES ('017061', 'Concesio', '017', NULL, '2023-02-27 18:49:07', 'C948');
INSERT INTO `comuni` VALUES ('017062', 'Corte Franca', '017', NULL, '2023-02-27 18:49:07', 'D058');
INSERT INTO `comuni` VALUES ('017063', 'Corteno Golgi', '017', NULL, '2023-02-27 18:49:07', 'D064');
INSERT INTO `comuni` VALUES ('017064', 'Corzano', '017', NULL, '2023-02-27 18:49:07', 'D082');
INSERT INTO `comuni` VALUES ('017065', 'Darfo Boario Terme', '017', NULL, '2023-02-27 18:49:07', 'D251');
INSERT INTO `comuni` VALUES ('017066', 'Dello', '017', NULL, '2023-02-27 18:49:07', 'D270');
INSERT INTO `comuni` VALUES ('017067', 'Desenzano del Garda', '017', NULL, '2023-02-27 18:49:07', 'D284');
INSERT INTO `comuni` VALUES ('017068', 'Edolo', '017', NULL, '2023-02-27 18:49:07', 'D391');
INSERT INTO `comuni` VALUES ('017069', 'Erbusco', '017', NULL, '2023-02-27 18:49:07', 'D421');
INSERT INTO `comuni` VALUES ('017070', 'Esine', '017', NULL, '2023-02-27 18:49:07', 'D434');
INSERT INTO `comuni` VALUES ('017071', 'Fiesse', '017', NULL, '2023-02-27 18:49:07', 'D576');
INSERT INTO `comuni` VALUES ('017072', 'Flero', '017', NULL, '2023-02-27 18:49:07', 'D634');
INSERT INTO `comuni` VALUES ('017073', 'Gambara', '017', NULL, '2023-02-27 18:49:07', 'D891');
INSERT INTO `comuni` VALUES ('017074', 'Gardone Riviera', '017', NULL, '2023-02-27 18:49:07', 'D917');
INSERT INTO `comuni` VALUES ('017075', 'Gardone Val Trompia', '017', NULL, '2023-02-27 18:49:07', 'D918');
INSERT INTO `comuni` VALUES ('017076', 'Gargnano', '017', NULL, '2023-02-27 18:49:07', 'D924');
INSERT INTO `comuni` VALUES ('017077', 'Gavardo', '017', NULL, '2023-02-27 18:49:07', 'D940');
INSERT INTO `comuni` VALUES ('017078', 'Ghedi', '017', NULL, '2023-02-27 18:49:07', 'D999');
INSERT INTO `comuni` VALUES ('017079', 'Gianico', '017', NULL, '2023-02-27 18:49:07', 'E010');
INSERT INTO `comuni` VALUES ('017080', 'Gottolengo', '017', NULL, '2023-02-27 18:49:07', 'E116');
INSERT INTO `comuni` VALUES ('017081', 'Gussago', '017', NULL, '2023-02-27 18:49:07', 'E271');
INSERT INTO `comuni` VALUES ('017082', 'Idro', '017', NULL, '2023-02-27 18:49:07', 'E280');
INSERT INTO `comuni` VALUES ('017083', 'Incudine', '017', NULL, '2023-02-27 18:49:07', 'E297');
INSERT INTO `comuni` VALUES ('017084', 'Irma', '017', NULL, '2023-02-27 18:49:07', 'E325');
INSERT INTO `comuni` VALUES ('017085', 'Iseo', '017', NULL, '2023-02-27 18:49:07', 'E333');
INSERT INTO `comuni` VALUES ('017086', 'Isorella', '017', NULL, '2023-02-27 18:49:07', 'E364');
INSERT INTO `comuni` VALUES ('017087', 'Lavenone', '017', NULL, '2023-02-27 18:49:07', 'E497');
INSERT INTO `comuni` VALUES ('017088', 'Leno', '017', NULL, '2023-02-27 18:49:07', 'E526');
INSERT INTO `comuni` VALUES ('017089', 'Limone sul Garda', '017', NULL, '2023-02-27 18:49:07', 'E596');
INSERT INTO `comuni` VALUES ('017090', 'Lodrino', '017', NULL, '2023-02-27 18:49:07', 'E652');
INSERT INTO `comuni` VALUES ('017091', 'Lograto', '017', NULL, '2023-02-27 18:49:07', 'E654');
INSERT INTO `comuni` VALUES ('017092', 'Lonato del Garda', '017', NULL, '2023-02-27 18:49:07', 'M312');
INSERT INTO `comuni` VALUES ('017093', 'Longhena', '017', NULL, '2023-02-27 18:49:07', 'E673');
INSERT INTO `comuni` VALUES ('017094', 'Losine', '017', NULL, '2023-02-27 18:49:07', 'E698');
INSERT INTO `comuni` VALUES ('017095', 'Lozio', '017', NULL, '2023-02-27 18:49:07', 'E706');
INSERT INTO `comuni` VALUES ('017096', 'Lumezzane', '017', NULL, '2023-02-27 18:49:07', 'E738');
INSERT INTO `comuni` VALUES ('017097', 'Maclodio', '017', NULL, '2023-02-27 18:49:07', 'E787');
INSERT INTO `comuni` VALUES ('017098', 'Magasa', '017', NULL, '2023-02-27 18:49:07', 'E800');
INSERT INTO `comuni` VALUES ('017099', 'Mairano', '017', NULL, '2023-02-27 18:49:07', 'E841');
INSERT INTO `comuni` VALUES ('017100', 'Malegno', '017', NULL, '2023-02-27 18:49:07', 'E851');
INSERT INTO `comuni` VALUES ('017101', 'Malonno', '017', NULL, '2023-02-27 18:49:07', 'E865');
INSERT INTO `comuni` VALUES ('017102', 'Manerba del Garda', '017', NULL, '2023-02-27 18:49:07', 'E883');
INSERT INTO `comuni` VALUES ('017103', 'Manerbio', '017', NULL, '2023-02-27 18:49:07', 'E884');
INSERT INTO `comuni` VALUES ('017104', 'Marcheno', '017', NULL, '2023-02-27 18:49:07', 'E928');
INSERT INTO `comuni` VALUES ('017105', 'Marmentino', '017', NULL, '2023-02-27 18:49:07', 'E961');
INSERT INTO `comuni` VALUES ('017106', 'Marone', '017', NULL, '2023-02-27 18:49:07', 'E967');
INSERT INTO `comuni` VALUES ('017107', 'Mazzano', '017', NULL, '2023-02-27 18:49:07', 'F063');
INSERT INTO `comuni` VALUES ('017108', 'Milzano', '017', NULL, '2023-02-27 18:49:07', 'F216');
INSERT INTO `comuni` VALUES ('017109', 'Moniga del Garda', '017', NULL, '2023-02-27 18:49:07', 'F373');
INSERT INTO `comuni` VALUES ('017110', 'Monno', '017', NULL, '2023-02-27 18:49:07', 'F375');
INSERT INTO `comuni` VALUES ('017111', 'Monte Isola', '017', NULL, '2023-02-27 18:49:07', 'F532');
INSERT INTO `comuni` VALUES ('017112', 'Monticelli Brusati', '017', NULL, '2023-02-27 18:49:07', 'F672');
INSERT INTO `comuni` VALUES ('017113', 'Montichiari', '017', NULL, '2023-02-27 18:49:07', 'F471');
INSERT INTO `comuni` VALUES ('017114', 'Montirone', '017', NULL, '2023-02-27 18:49:07', 'F680');
INSERT INTO `comuni` VALUES ('017115', 'Mura', '017', NULL, '2023-02-27 18:49:07', 'F806');
INSERT INTO `comuni` VALUES ('017116', 'Muscoline', '017', NULL, '2023-02-27 18:49:07', 'F820');
INSERT INTO `comuni` VALUES ('017117', 'Nave', '017', NULL, '2023-02-27 18:49:07', 'F851');
INSERT INTO `comuni` VALUES ('017118', 'Niardo', '017', NULL, '2023-02-27 18:49:07', 'F884');
INSERT INTO `comuni` VALUES ('017119', 'Nuvolento', '017', NULL, '2023-02-27 18:49:07', 'F989');
INSERT INTO `comuni` VALUES ('017120', 'Nuvolera', '017', NULL, '2023-02-27 18:49:07', 'F990');
INSERT INTO `comuni` VALUES ('017121', 'Odolo', '017', NULL, '2023-02-27 18:49:07', 'G001');
INSERT INTO `comuni` VALUES ('017122', 'Offlaga', '017', NULL, '2023-02-27 18:49:07', 'G006');
INSERT INTO `comuni` VALUES ('017123', 'Ome', '017', NULL, '2023-02-27 18:49:07', 'G061');
INSERT INTO `comuni` VALUES ('017124', 'Ono San Pietro', '017', NULL, '2023-02-27 18:49:07', 'G074');
INSERT INTO `comuni` VALUES ('017125', 'Orzinuovi', '017', NULL, '2023-02-27 18:49:07', 'G149');
INSERT INTO `comuni` VALUES ('017126', 'Orzivecchi', '017', NULL, '2023-02-27 18:49:07', 'G150');
INSERT INTO `comuni` VALUES ('017127', 'Ospitaletto', '017', NULL, '2023-02-27 18:49:07', 'G170');
INSERT INTO `comuni` VALUES ('017128', 'Ossimo', '017', NULL, '2023-02-27 18:49:07', 'G179');
INSERT INTO `comuni` VALUES ('017129', 'Padenghe sul Garda', '017', NULL, '2023-02-27 18:49:07', 'G213');
INSERT INTO `comuni` VALUES ('017130', 'Paderno Franciacorta', '017', NULL, '2023-02-27 18:49:07', 'G217');
INSERT INTO `comuni` VALUES ('017131', 'Paisco Loveno', '017', NULL, '2023-02-27 18:49:07', 'G247');
INSERT INTO `comuni` VALUES ('017132', 'Paitone', '017', NULL, '2023-02-27 18:49:07', 'G248');
INSERT INTO `comuni` VALUES ('017133', 'Palazzolo sull\'Oglio', '017', NULL, '2023-02-27 18:49:07', 'G264');
INSERT INTO `comuni` VALUES ('017134', 'Paratico', '017', NULL, '2023-02-27 18:49:07', 'G327');
INSERT INTO `comuni` VALUES ('017135', 'Paspardo', '017', NULL, '2023-02-27 18:49:07', 'G354');
INSERT INTO `comuni` VALUES ('017136', 'Passirano', '017', NULL, '2023-02-27 18:49:07', 'G361');
INSERT INTO `comuni` VALUES ('017137', 'Pavone del Mella', '017', NULL, '2023-02-27 18:49:07', 'G391');
INSERT INTO `comuni` VALUES ('017138', 'San Paolo', '017', NULL, '2023-02-27 18:49:07', 'G407');
INSERT INTO `comuni` VALUES ('017139', 'Pertica Alta', '017', NULL, '2023-02-27 18:49:07', 'G474');
INSERT INTO `comuni` VALUES ('017140', 'Pertica Bassa', '017', NULL, '2023-02-27 18:49:07', 'G475');
INSERT INTO `comuni` VALUES ('017141', 'Pezzaze', '017', NULL, '2023-02-27 18:49:07', 'G529');
INSERT INTO `comuni` VALUES ('017142', 'Pian Camuno', '017', NULL, '2023-02-27 18:49:07', 'G546');
INSERT INTO `comuni` VALUES ('017143', 'Pisogne', '017', NULL, '2023-02-27 18:49:07', 'G710');
INSERT INTO `comuni` VALUES ('017144', 'Polaveno', '017', NULL, '2023-02-27 18:49:07', 'G779');
INSERT INTO `comuni` VALUES ('017145', 'Polpenazze del Garda', '017', NULL, '2023-02-27 18:49:07', 'G801');
INSERT INTO `comuni` VALUES ('017146', 'Pompiano', '017', NULL, '2023-02-27 18:49:07', 'G815');
INSERT INTO `comuni` VALUES ('017147', 'Poncarale', '017', NULL, '2023-02-27 18:49:07', 'G818');
INSERT INTO `comuni` VALUES ('017148', 'Ponte di Legno', '017', NULL, '2023-02-27 18:49:07', 'G844');
INSERT INTO `comuni` VALUES ('017149', 'Pontevico', '017', NULL, '2023-02-27 18:49:07', 'G859');
INSERT INTO `comuni` VALUES ('017150', 'Pontoglio', '017', NULL, '2023-02-27 18:49:07', 'G869');
INSERT INTO `comuni` VALUES ('017151', 'Pozzolengo', '017', NULL, '2023-02-27 18:49:07', 'G959');
INSERT INTO `comuni` VALUES ('017152', 'Pralboino', '017', NULL, '2023-02-27 18:49:07', 'G977');
INSERT INTO `comuni` VALUES ('017153', 'Preseglie', '017', NULL, '2023-02-27 18:49:07', 'H043');
INSERT INTO `comuni` VALUES ('017154', 'Prestine', '017', NULL, '2023-02-27 18:49:07', 'H050');
INSERT INTO `comuni` VALUES ('017155', 'Prevalle', '017', NULL, '2023-02-27 18:49:07', 'H055');
INSERT INTO `comuni` VALUES ('017156', 'Provaglio d\'Iseo', '017', NULL, '2023-02-27 18:49:07', 'H078');
INSERT INTO `comuni` VALUES ('017157', 'Provaglio Val Sabbia', '017', NULL, '2023-02-27 18:49:07', 'H077');
INSERT INTO `comuni` VALUES ('017158', 'Puegnago sul Garda', '017', NULL, '2023-02-27 18:49:07', 'H086');
INSERT INTO `comuni` VALUES ('017159', 'Quinzano d\'Oglio', '017', NULL, '2023-02-27 18:49:07', 'H140');
INSERT INTO `comuni` VALUES ('017160', 'Remedello', '017', NULL, '2023-02-27 18:49:07', 'H230');
INSERT INTO `comuni` VALUES ('017161', 'Rezzato', '017', NULL, '2023-02-27 18:49:07', 'H256');
INSERT INTO `comuni` VALUES ('017162', 'Roccafranca', '017', NULL, '2023-02-27 18:49:07', 'H410');
INSERT INTO `comuni` VALUES ('017163', 'Rodengo Saiano', '017', NULL, '2023-02-27 18:49:07', 'H477');
INSERT INTO `comuni` VALUES ('017164', 'Roè Volciano', '017', NULL, '2023-02-27 18:49:07', 'H484');
INSERT INTO `comuni` VALUES ('017165', 'Roncadelle', '017', NULL, '2023-02-27 18:49:07', 'H525');
INSERT INTO `comuni` VALUES ('017166', 'Rovato', '017', NULL, '2023-02-27 18:49:07', 'H598');
INSERT INTO `comuni` VALUES ('017167', 'Rudiano', '017', NULL, '2023-02-27 18:49:07', 'H630');
INSERT INTO `comuni` VALUES ('017168', 'Sabbio Chiese', '017', NULL, '2023-02-27 18:49:07', 'H650');
INSERT INTO `comuni` VALUES ('017169', 'Sale Marasino', '017', NULL, '2023-02-27 18:49:07', 'H699');
INSERT INTO `comuni` VALUES ('017170', 'Salò', '017', NULL, '2023-02-27 18:49:07', 'H717');
INSERT INTO `comuni` VALUES ('017171', 'San Felice del Benaco', '017', NULL, '2023-02-27 18:49:07', 'H838');
INSERT INTO `comuni` VALUES ('017172', 'San Gervasio Bresciano', '017', NULL, '2023-02-27 18:49:07', 'H865');
INSERT INTO `comuni` VALUES ('017173', 'San Zeno Naviglio', '017', NULL, '2023-02-27 18:49:07', 'I412');
INSERT INTO `comuni` VALUES ('017174', 'Sarezzo', '017', NULL, '2023-02-27 18:49:07', 'I433');
INSERT INTO `comuni` VALUES ('017175', 'Saviore dell\'Adamello', '017', NULL, '2023-02-27 18:49:07', 'I476');
INSERT INTO `comuni` VALUES ('017176', 'Sellero', '017', NULL, '2023-02-27 18:49:07', 'I588');
INSERT INTO `comuni` VALUES ('017177', 'Seniga', '017', NULL, '2023-02-27 18:49:07', 'I607');
INSERT INTO `comuni` VALUES ('017178', 'Serle', '017', NULL, '2023-02-27 18:49:07', 'I631');
INSERT INTO `comuni` VALUES ('017179', 'Sirmione', '017', NULL, '2023-02-27 18:49:07', 'I633');
INSERT INTO `comuni` VALUES ('017180', 'Soiano del Lago', '017', NULL, '2023-02-27 18:49:07', 'I782');
INSERT INTO `comuni` VALUES ('017181', 'Sonico', '017', NULL, '2023-02-27 18:49:07', 'I831');
INSERT INTO `comuni` VALUES ('017182', 'Sulzano', '017', NULL, '2023-02-27 18:49:07', 'L002');
INSERT INTO `comuni` VALUES ('017183', 'Tavernole sul Mella', '017', NULL, '2023-02-27 18:49:07', 'C698');
INSERT INTO `comuni` VALUES ('017184', 'Temù', '017', NULL, '2023-02-27 18:49:07', 'L094');
INSERT INTO `comuni` VALUES ('017185', 'Tignale', '017', NULL, '2023-02-27 18:49:07', 'L169');
INSERT INTO `comuni` VALUES ('017186', 'Torbole Casaglia', '017', NULL, '2023-02-27 18:49:07', 'L210');
INSERT INTO `comuni` VALUES ('017187', 'Toscolano-Maderno', '017', NULL, '2023-02-27 18:49:07', 'L312');
INSERT INTO `comuni` VALUES ('017188', 'Travagliato', '017', NULL, '2023-02-27 18:49:07', 'L339');
INSERT INTO `comuni` VALUES ('017189', 'Tremosine sul Garda', '017', NULL, '2023-02-27 18:49:07', 'L372');
INSERT INTO `comuni` VALUES ('017190', 'Trenzano', '017', NULL, '2023-02-27 18:49:07', 'L380');
INSERT INTO `comuni` VALUES ('017191', 'Treviso Bresciano', '017', NULL, '2023-02-27 18:49:07', 'L406');
INSERT INTO `comuni` VALUES ('017192', 'Urago d\'Oglio', '017', NULL, '2023-02-27 18:49:07', 'L494');
INSERT INTO `comuni` VALUES ('017193', 'Vallio Terme', '017', NULL, '2023-02-27 18:49:07', 'L626');
INSERT INTO `comuni` VALUES ('017194', 'Valvestino', '017', NULL, '2023-02-27 18:49:07', 'L468');
INSERT INTO `comuni` VALUES ('017195', 'Verolanuova', '017', NULL, '2023-02-27 18:49:07', 'L777');
INSERT INTO `comuni` VALUES ('017196', 'Verolavecchia', '017', NULL, '2023-02-27 18:49:07', 'L778');
INSERT INTO `comuni` VALUES ('017197', 'Vestone', '017', NULL, '2023-02-27 18:49:07', 'L812');
INSERT INTO `comuni` VALUES ('017198', 'Vezza d\'Oglio', '017', NULL, '2023-02-27 18:49:07', 'L816');
INSERT INTO `comuni` VALUES ('017199', 'Villa Carcina', '017', NULL, '2023-02-27 18:49:07', 'L919');
INSERT INTO `comuni` VALUES ('017200', 'Villachiara', '017', NULL, '2023-02-27 18:49:07', 'L923');
INSERT INTO `comuni` VALUES ('017201', 'Villanuova sul Clisi', '017', NULL, '2023-02-27 18:49:07', 'L995');
INSERT INTO `comuni` VALUES ('017202', 'Vione', '017', NULL, '2023-02-27 18:49:07', 'M065');
INSERT INTO `comuni` VALUES ('017203', 'Visano', '017', NULL, '2023-02-27 18:49:07', 'M070');
INSERT INTO `comuni` VALUES ('017204', 'Vobarno', '017', NULL, '2023-02-27 18:49:07', 'M104');
INSERT INTO `comuni` VALUES ('017205', 'Zone', '017', NULL, '2023-02-27 18:49:07', 'M188');
INSERT INTO `comuni` VALUES ('017206', 'Piancogno', '017', NULL, '2023-02-27 18:49:07', 'G549');
INSERT INTO `comuni` VALUES ('018001', 'Alagna', '018', NULL, '2023-02-27 18:49:07', 'A118');
INSERT INTO `comuni` VALUES ('018002', 'Albaredo Arnaboldi', '018', NULL, '2023-02-27 18:49:07', 'A134');
INSERT INTO `comuni` VALUES ('018003', 'Albonese', '018', NULL, '2023-02-27 18:49:07', 'A171');
INSERT INTO `comuni` VALUES ('018004', 'Albuzzano', '018', NULL, '2023-02-27 18:49:07', 'A175');
INSERT INTO `comuni` VALUES ('018005', 'Arena Po', '018', NULL, '2023-02-27 18:49:07', 'A387');
INSERT INTO `comuni` VALUES ('018006', 'Badia Pavese', '018', NULL, '2023-02-27 18:49:07', 'A538');
INSERT INTO `comuni` VALUES ('018007', 'Bagnaria', '018', NULL, '2023-02-27 18:49:07', 'A550');
INSERT INTO `comuni` VALUES ('018008', 'Barbianello', '018', NULL, '2023-02-27 18:49:07', 'A634');
INSERT INTO `comuni` VALUES ('018009', 'Bascapè', '018', NULL, '2023-02-27 18:49:07', 'A690');
INSERT INTO `comuni` VALUES ('018011', 'Bastida Pancarana', '018', NULL, '2023-02-27 18:49:07', 'A712');
INSERT INTO `comuni` VALUES ('018012', 'Battuda', '018', NULL, '2023-02-27 18:49:07', 'A718');
INSERT INTO `comuni` VALUES ('018013', 'Belgioioso', '018', NULL, '2023-02-27 18:49:07', 'A741');
INSERT INTO `comuni` VALUES ('018014', 'Bereguardo', '018', NULL, '2023-02-27 18:49:07', 'A792');
INSERT INTO `comuni` VALUES ('018015', 'Borgarello', '018', NULL, '2023-02-27 18:49:07', 'A989');
INSERT INTO `comuni` VALUES ('018016', 'Borgo Priolo', '018', NULL, '2023-02-27 18:49:07', 'B028');
INSERT INTO `comuni` VALUES ('018017', 'Borgoratto Mormorolo', '018', NULL, '2023-02-27 18:49:07', 'B030');
INSERT INTO `comuni` VALUES ('018018', 'Borgo San Siro', '018', NULL, '2023-02-27 18:49:07', 'B038');
INSERT INTO `comuni` VALUES ('018019', 'Bornasco', '018', NULL, '2023-02-27 18:49:07', 'B051');
INSERT INTO `comuni` VALUES ('018020', 'Bosnasco', '018', NULL, '2023-02-27 18:49:07', 'B082');
INSERT INTO `comuni` VALUES ('018021', 'Brallo di Pregola', '018', NULL, '2023-02-27 18:49:07', 'B117');
INSERT INTO `comuni` VALUES ('018022', 'Breme', '018', NULL, '2023-02-27 18:49:07', 'B142');
INSERT INTO `comuni` VALUES ('018023', 'Bressana Bottarone', '018', NULL, '2023-02-27 18:49:07', 'B159');
INSERT INTO `comuni` VALUES ('018024', 'Broni', '018', NULL, '2023-02-27 18:49:07', 'B201');
INSERT INTO `comuni` VALUES ('018025', 'Calvignano', '018', NULL, '2023-02-27 18:49:07', 'B447');
INSERT INTO `comuni` VALUES ('018026', 'Campospinoso', '018', NULL, '2023-02-27 18:49:07', 'B567');
INSERT INTO `comuni` VALUES ('018027', 'Candia Lomellina', '018', NULL, '2023-02-27 18:49:07', 'B587');
INSERT INTO `comuni` VALUES ('018028', 'Canevino', '018', NULL, '2023-02-27 18:49:07', 'B599');
INSERT INTO `comuni` VALUES ('018029', 'Canneto Pavese', '018', NULL, '2023-02-27 18:49:07', 'B613');
INSERT INTO `comuni` VALUES ('018030', 'Carbonara al Ticino', '018', NULL, '2023-02-27 18:49:07', 'B741');
INSERT INTO `comuni` VALUES ('018031', 'Casanova Lonati', '018', NULL, '2023-02-27 18:49:07', 'B929');
INSERT INTO `comuni` VALUES ('018032', 'Casatisma', '018', NULL, '2023-02-27 18:49:07', 'B945');
INSERT INTO `comuni` VALUES ('018033', 'Casei Gerola', '018', NULL, '2023-02-27 18:49:07', 'B954');
INSERT INTO `comuni` VALUES ('018034', 'Casorate Primo', '018', NULL, '2023-02-27 18:49:07', 'B988');
INSERT INTO `comuni` VALUES ('018035', 'Cassolnovo', '018', NULL, '2023-02-27 18:49:07', 'C038');
INSERT INTO `comuni` VALUES ('018036', 'Castana', '018', NULL, '2023-02-27 18:49:07', 'C050');
INSERT INTO `comuni` VALUES ('018037', 'Casteggio', '018', NULL, '2023-02-27 18:49:07', 'C053');
INSERT INTO `comuni` VALUES ('018038', 'Castelletto di Branduzzo', '018', NULL, '2023-02-27 18:49:07', 'C157');
INSERT INTO `comuni` VALUES ('018039', 'Castello d\'Agogna', '018', NULL, '2023-02-27 18:49:07', 'C184');
INSERT INTO `comuni` VALUES ('018040', 'Castelnovetto', '018', NULL, '2023-02-27 18:49:07', 'C213');
INSERT INTO `comuni` VALUES ('018041', 'Cava Manara', '018', NULL, '2023-02-27 18:49:07', 'C360');
INSERT INTO `comuni` VALUES ('018042', 'Cecima', '018', NULL, '2023-02-27 18:49:07', 'C414');
INSERT INTO `comuni` VALUES ('018043', 'Ceranova', '018', NULL, '2023-02-27 18:49:07', 'C484');
INSERT INTO `comuni` VALUES ('018044', 'Ceretto Lomellina', '018', NULL, '2023-02-27 18:49:07', 'C508');
INSERT INTO `comuni` VALUES ('018045', 'Cergnago', '018', NULL, '2023-02-27 18:49:07', 'C509');
INSERT INTO `comuni` VALUES ('018046', 'Certosa di Pavia', '018', NULL, '2023-02-27 18:49:07', 'C541');
INSERT INTO `comuni` VALUES ('018047', 'Cervesina', '018', NULL, '2023-02-27 18:49:07', 'C551');
INSERT INTO `comuni` VALUES ('018048', 'Chignolo Po', '018', NULL, '2023-02-27 18:49:07', 'C637');
INSERT INTO `comuni` VALUES ('018049', 'Cigognola', '018', NULL, '2023-02-27 18:49:07', 'C684');
INSERT INTO `comuni` VALUES ('018050', 'Cilavegna', '018', NULL, '2023-02-27 18:49:07', 'C686');
INSERT INTO `comuni` VALUES ('018051', 'Codevilla', '018', NULL, '2023-02-27 18:49:07', 'C813');
INSERT INTO `comuni` VALUES ('018052', 'Confienza', '018', NULL, '2023-02-27 18:49:07', 'C958');
INSERT INTO `comuni` VALUES ('018053', 'Copiano', '018', NULL, '2023-02-27 18:49:07', 'C979');
INSERT INTO `comuni` VALUES ('018054', 'Corana', '018', NULL, '2023-02-27 18:49:07', 'C982');
INSERT INTO `comuni` VALUES ('018056', 'Corteolona', '018', NULL, '2023-02-27 18:49:07', 'D067');
INSERT INTO `comuni` VALUES ('018057', 'Corvino San Quirico', '018', NULL, '2023-02-27 18:49:07', 'D081');
INSERT INTO `comuni` VALUES ('018058', 'Costa de\' Nobili', '018', NULL, '2023-02-27 18:49:07', 'D109');
INSERT INTO `comuni` VALUES ('018059', 'Cozzo', '018', NULL, '2023-02-27 18:49:07', 'D127');
INSERT INTO `comuni` VALUES ('018060', 'Cura Carpignano', '018', NULL, '2023-02-27 18:49:07', 'B824');
INSERT INTO `comuni` VALUES ('018061', 'Dorno', '018', NULL, '2023-02-27 18:49:07', 'D348');
INSERT INTO `comuni` VALUES ('018062', 'Ferrera Erbognone', '018', NULL, '2023-02-27 18:49:07', 'D552');
INSERT INTO `comuni` VALUES ('018063', 'Filighera', '018', NULL, '2023-02-27 18:49:07', 'D594');
INSERT INTO `comuni` VALUES ('018064', 'Fortunago', '018', NULL, '2023-02-27 18:49:07', 'D732');
INSERT INTO `comuni` VALUES ('018065', 'Frascarolo', '018', NULL, '2023-02-27 18:49:07', 'D771');
INSERT INTO `comuni` VALUES ('018066', 'Galliavola', '018', NULL, '2023-02-27 18:49:07', 'D873');
INSERT INTO `comuni` VALUES ('018067', 'Gambarana', '018', NULL, '2023-02-27 18:49:07', 'D892');
INSERT INTO `comuni` VALUES ('018068', 'Gambolò', '018', NULL, '2023-02-27 18:49:07', 'D901');
INSERT INTO `comuni` VALUES ('018069', 'Garlasco', '018', NULL, '2023-02-27 18:49:07', 'D925');
INSERT INTO `comuni` VALUES ('018070', 'Genzone', '018', NULL, '2023-02-27 18:49:07', 'D973');
INSERT INTO `comuni` VALUES ('018071', 'Gerenzago', '018', NULL, '2023-02-27 18:49:07', 'D980');
INSERT INTO `comuni` VALUES ('018072', 'Giussago', '018', NULL, '2023-02-27 18:49:07', 'E062');
INSERT INTO `comuni` VALUES ('018073', 'Godiasco Salice Terme', '018', NULL, '2023-02-27 18:49:07', 'E072');
INSERT INTO `comuni` VALUES ('018074', 'Golferenzo', '018', NULL, '2023-02-27 18:49:07', 'E081');
INSERT INTO `comuni` VALUES ('018075', 'Gravellona Lomellina', '018', NULL, '2023-02-27 18:49:07', 'E152');
INSERT INTO `comuni` VALUES ('018076', 'Gropello Cairoli', '018', NULL, '2023-02-27 18:49:07', 'E195');
INSERT INTO `comuni` VALUES ('018077', 'Inverno e Monteleone', '018', NULL, '2023-02-27 18:49:07', 'E310');
INSERT INTO `comuni` VALUES ('018078', 'Landriano', '018', NULL, '2023-02-27 18:49:07', 'E437');
INSERT INTO `comuni` VALUES ('018079', 'Langosco', '018', NULL, '2023-02-27 18:49:07', 'E439');
INSERT INTO `comuni` VALUES ('018080', 'Lardirago', '018', NULL, '2023-02-27 18:49:07', 'E454');
INSERT INTO `comuni` VALUES ('018081', 'Linarolo', '018', NULL, '2023-02-27 18:49:07', 'E600');
INSERT INTO `comuni` VALUES ('018082', 'Lirio', '018', NULL, '2023-02-27 18:49:07', 'E608');
INSERT INTO `comuni` VALUES ('018083', 'Lomello', '018', NULL, '2023-02-27 18:49:07', 'E662');
INSERT INTO `comuni` VALUES ('018084', 'Lungavilla', '018', NULL, '2023-02-27 18:49:07', 'B387');
INSERT INTO `comuni` VALUES ('018085', 'Magherno', '018', NULL, '2023-02-27 18:49:07', 'E804');
INSERT INTO `comuni` VALUES ('018086', 'Marcignago', '018', NULL, '2023-02-27 18:49:07', 'E934');
INSERT INTO `comuni` VALUES ('018087', 'Marzano', '018', NULL, '2023-02-27 18:49:07', 'E999');
INSERT INTO `comuni` VALUES ('018088', 'Mede', '018', NULL, '2023-02-27 18:49:07', 'F080');
INSERT INTO `comuni` VALUES ('018089', 'Menconico', '018', NULL, '2023-02-27 18:49:07', 'F122');
INSERT INTO `comuni` VALUES ('018090', 'Mezzana Bigli', '018', NULL, '2023-02-27 18:49:07', 'F170');
INSERT INTO `comuni` VALUES ('018091', 'Mezzana Rabattone', '018', NULL, '2023-02-27 18:49:07', 'F171');
INSERT INTO `comuni` VALUES ('018092', 'Mezzanino', '018', NULL, '2023-02-27 18:49:07', 'F175');
INSERT INTO `comuni` VALUES ('018093', 'Miradolo Terme', '018', NULL, '2023-02-27 18:49:07', 'F238');
INSERT INTO `comuni` VALUES ('018094', 'Montalto Pavese', '018', NULL, '2023-02-27 18:49:07', 'F417');
INSERT INTO `comuni` VALUES ('018095', 'Montebello della Battaglia', '018', NULL, '2023-02-27 18:49:07', 'F440');
INSERT INTO `comuni` VALUES ('018096', 'Montecalvo Versiggia', '018', NULL, '2023-02-27 18:49:07', 'F449');
INSERT INTO `comuni` VALUES ('018097', 'Montescano', '018', NULL, '2023-02-27 18:49:07', 'F638');
INSERT INTO `comuni` VALUES ('018098', 'Montesegale', '018', NULL, '2023-02-27 18:49:07', 'F644');
INSERT INTO `comuni` VALUES ('018099', 'Monticelli Pavese', '018', NULL, '2023-02-27 18:49:07', 'F670');
INSERT INTO `comuni` VALUES ('018100', 'Montù Beccaria', '018', NULL, '2023-02-27 18:49:07', 'F701');
INSERT INTO `comuni` VALUES ('018101', 'Mornico Losana', '018', NULL, '2023-02-27 18:49:07', 'F739');
INSERT INTO `comuni` VALUES ('018102', 'Mortara', '018', NULL, '2023-02-27 18:49:07', 'F754');
INSERT INTO `comuni` VALUES ('018103', 'Nicorvo', '018', NULL, '2023-02-27 18:49:07', 'F891');
INSERT INTO `comuni` VALUES ('018104', 'Olevano di Lomellina', '018', NULL, '2023-02-27 18:49:07', 'G021');
INSERT INTO `comuni` VALUES ('018105', 'Oliva Gessi', '018', NULL, '2023-02-27 18:49:07', 'G032');
INSERT INTO `comuni` VALUES ('018106', 'Ottobiano', '018', NULL, '2023-02-27 18:49:07', 'G194');
INSERT INTO `comuni` VALUES ('018107', 'Palestro', '018', NULL, '2023-02-27 18:49:07', 'G275');
INSERT INTO `comuni` VALUES ('018108', 'Pancarana', '018', NULL, '2023-02-27 18:49:07', 'G304');
INSERT INTO `comuni` VALUES ('018109', 'Parona', '018', NULL, '2023-02-27 18:49:07', 'G342');
INSERT INTO `comuni` VALUES ('018110', 'Pavia', '018', NULL, '2023-02-27 18:49:07', 'G388');
INSERT INTO `comuni` VALUES ('018111', 'Pietra de\' Giorgi', '018', NULL, '2023-02-27 18:49:07', 'G612');
INSERT INTO `comuni` VALUES ('018112', 'Pieve Albignola', '018', NULL, '2023-02-27 18:49:07', 'G635');
INSERT INTO `comuni` VALUES ('018113', 'Pieve del Cairo', '018', NULL, '2023-02-27 18:49:07', 'G639');
INSERT INTO `comuni` VALUES ('018114', 'Pieve Porto Morone', '018', NULL, '2023-02-27 18:49:07', 'G650');
INSERT INTO `comuni` VALUES ('018115', 'Pinarolo Po', '018', NULL, '2023-02-27 18:49:07', 'G671');
INSERT INTO `comuni` VALUES ('018116', 'Pizzale', '018', NULL, '2023-02-27 18:49:07', 'G720');
INSERT INTO `comuni` VALUES ('018117', 'Ponte Nizza', '018', NULL, '2023-02-27 18:49:07', 'G851');
INSERT INTO `comuni` VALUES ('018118', 'Portalbera', '018', NULL, '2023-02-27 18:49:07', 'G895');
INSERT INTO `comuni` VALUES ('018119', 'Rea', '018', NULL, '2023-02-27 18:49:07', 'H204');
INSERT INTO `comuni` VALUES ('018120', 'Redavalle', '018', NULL, '2023-02-27 18:49:07', 'H216');
INSERT INTO `comuni` VALUES ('018121', 'Retorbido', '018', NULL, '2023-02-27 18:49:07', 'H246');
INSERT INTO `comuni` VALUES ('018122', 'Rivanazzano Terme', '018', NULL, '2023-02-27 18:49:07', 'H336');
INSERT INTO `comuni` VALUES ('018123', 'Robbio', '018', NULL, '2023-02-27 18:49:07', 'H369');
INSERT INTO `comuni` VALUES ('018124', 'Robecco Pavese', '018', NULL, '2023-02-27 18:49:07', 'H375');
INSERT INTO `comuni` VALUES ('018125', 'Rocca de\' Giorgi', '018', NULL, '2023-02-27 18:49:07', 'H396');
INSERT INTO `comuni` VALUES ('018126', 'Rocca Susella', '018', NULL, '2023-02-27 18:49:07', 'H450');
INSERT INTO `comuni` VALUES ('018127', 'Rognano', '018', NULL, '2023-02-27 18:49:07', 'H491');
INSERT INTO `comuni` VALUES ('018128', 'Romagnese', '018', NULL, '2023-02-27 18:49:07', 'H505');
INSERT INTO `comuni` VALUES ('018129', 'Roncaro', '018', NULL, '2023-02-27 18:49:07', 'H527');
INSERT INTO `comuni` VALUES ('018130', 'Rosasco', '018', NULL, '2023-02-27 18:49:07', 'H559');
INSERT INTO `comuni` VALUES ('018131', 'Rovescala', '018', NULL, '2023-02-27 18:49:07', 'H614');
INSERT INTO `comuni` VALUES ('018132', 'Ruino', '018', NULL, '2023-02-27 18:49:07', 'H637');
INSERT INTO `comuni` VALUES ('018133', 'San Cipriano Po', '018', NULL, '2023-02-27 18:49:07', 'H799');
INSERT INTO `comuni` VALUES ('018134', 'San Damiano al Colle', '018', NULL, '2023-02-27 18:49:07', 'H814');
INSERT INTO `comuni` VALUES ('018135', 'San Genesio ed Uniti', '018', NULL, '2023-02-27 18:49:07', 'H859');
INSERT INTO `comuni` VALUES ('018136', 'San Giorgio di Lomellina', '018', NULL, '2023-02-27 18:49:07', 'H885');
INSERT INTO `comuni` VALUES ('018137', 'San Martino Siccomario', '018', NULL, '2023-02-27 18:49:07', 'I014');
INSERT INTO `comuni` VALUES ('018138', 'Sannazzaro de\' Burgondi', '018', NULL, '2023-02-27 18:49:07', 'I048');
INSERT INTO `comuni` VALUES ('018139', 'Santa Cristina e Bissone', '018', NULL, '2023-02-27 18:49:07', 'I175');
INSERT INTO `comuni` VALUES ('018140', 'Santa Giuletta', '018', NULL, '2023-02-27 18:49:07', 'I203');
INSERT INTO `comuni` VALUES ('018141', 'Sant\'Alessio con Vialone', '018', NULL, '2023-02-27 18:49:07', 'I213');
INSERT INTO `comuni` VALUES ('018142', 'Santa Margherita di Staffora', '018', NULL, '2023-02-27 18:49:07', 'I230');
INSERT INTO `comuni` VALUES ('018143', 'Santa Maria della Versa', '018', NULL, '2023-02-27 18:49:07', 'I237');
INSERT INTO `comuni` VALUES ('018144', 'Sant\'Angelo Lomellina', '018', NULL, '2023-02-27 18:49:07', 'I276');
INSERT INTO `comuni` VALUES ('018145', 'San Zenone al Po', '018', NULL, '2023-02-27 18:49:07', 'I416');
INSERT INTO `comuni` VALUES ('018146', 'Sartirana Lomellina', '018', NULL, '2023-02-27 18:49:07', 'I447');
INSERT INTO `comuni` VALUES ('018147', 'Scaldasole', '018', NULL, '2023-02-27 18:49:07', 'I487');
INSERT INTO `comuni` VALUES ('018148', 'Semiana', '018', NULL, '2023-02-27 18:49:07', 'I599');
INSERT INTO `comuni` VALUES ('018149', 'Silvano Pietra', '018', NULL, '2023-02-27 18:49:07', 'I739');
INSERT INTO `comuni` VALUES ('018150', 'Siziano', '018', NULL, '2023-02-27 18:49:07', 'E265');
INSERT INTO `comuni` VALUES ('018151', 'Sommo', '018', NULL, '2023-02-27 18:49:07', 'I825');
INSERT INTO `comuni` VALUES ('018152', 'Spessa', '018', NULL, '2023-02-27 18:49:07', 'I894');
INSERT INTO `comuni` VALUES ('018153', 'Stradella', '018', NULL, '2023-02-27 18:49:07', 'I968');
INSERT INTO `comuni` VALUES ('018154', 'Suardi', '018', NULL, '2023-02-27 18:49:07', 'B014');
INSERT INTO `comuni` VALUES ('018155', 'Torrazza Coste', '018', NULL, '2023-02-27 18:49:07', 'L237');
INSERT INTO `comuni` VALUES ('018156', 'Torre Beretti e Castellaro', '018', NULL, '2023-02-27 18:49:07', 'L250');
INSERT INTO `comuni` VALUES ('018157', 'Torre d\'Arese', '018', NULL, '2023-02-27 18:49:07', 'L256');
INSERT INTO `comuni` VALUES ('018158', 'Torre de\' Negri', '018', NULL, '2023-02-27 18:49:07', 'L262');
INSERT INTO `comuni` VALUES ('018159', 'Torre d\'Isola', '018', NULL, '2023-02-27 18:49:07', 'L269');
INSERT INTO `comuni` VALUES ('018160', 'Torrevecchia Pia', '018', NULL, '2023-02-27 18:49:07', 'L285');
INSERT INTO `comuni` VALUES ('018161', 'Torricella Verzate', '018', NULL, '2023-02-27 18:49:07', 'L292');
INSERT INTO `comuni` VALUES ('018162', 'Travacò Siccomario', '018', NULL, '2023-02-27 18:49:07', 'I236');
INSERT INTO `comuni` VALUES ('018163', 'Trivolzio', '018', NULL, '2023-02-27 18:49:07', 'L440');
INSERT INTO `comuni` VALUES ('018164', 'Tromello', '018', NULL, '2023-02-27 18:49:07', 'L449');
INSERT INTO `comuni` VALUES ('018165', 'Trovo', '018', NULL, '2023-02-27 18:49:07', 'L453');
INSERT INTO `comuni` VALUES ('018166', 'Val di Nizza', '018', NULL, '2023-02-27 18:49:07', 'L562');
INSERT INTO `comuni` VALUES ('018167', 'Valeggio', '018', NULL, '2023-02-27 18:49:07', 'L568');
INSERT INTO `comuni` VALUES ('018168', 'Valle Lomellina', '018', NULL, '2023-02-27 18:49:07', 'L593');
INSERT INTO `comuni` VALUES ('018169', 'Valle Salimbene', '018', NULL, '2023-02-27 18:49:07', 'L617');
INSERT INTO `comuni` VALUES ('018170', 'Valverde', '018', NULL, '2023-02-27 18:49:07', 'L659');
INSERT INTO `comuni` VALUES ('018171', 'Varzi', '018', NULL, '2023-02-27 18:49:07', 'L690');
INSERT INTO `comuni` VALUES ('018172', 'Velezzo Lomellina', '018', NULL, '2023-02-27 18:49:07', 'L716');
INSERT INTO `comuni` VALUES ('018173', 'Vellezzo Bellini', '018', NULL, '2023-02-27 18:49:07', 'L720');
INSERT INTO `comuni` VALUES ('018174', 'Verretto', '018', NULL, '2023-02-27 18:49:07', 'L784');
INSERT INTO `comuni` VALUES ('018175', 'Verrua Po', '018', NULL, '2023-02-27 18:49:07', 'L788');
INSERT INTO `comuni` VALUES ('018176', 'Vidigulfo', '018', NULL, '2023-02-27 18:49:07', 'L854');
INSERT INTO `comuni` VALUES ('018177', 'Vigevano', '018', NULL, '2023-02-27 18:49:07', 'L872');
INSERT INTO `comuni` VALUES ('018178', 'Villa Biscossi', '018', NULL, '2023-02-27 18:49:07', 'L917');
INSERT INTO `comuni` VALUES ('018179', 'Villanova d\'Ardenghi', '018', NULL, '2023-02-27 18:49:07', 'L983');
INSERT INTO `comuni` VALUES ('018180', 'Villanterio', '018', NULL, '2023-02-27 18:49:07', 'L994');
INSERT INTO `comuni` VALUES ('018181', 'Vistarino', '018', NULL, '2023-02-27 18:49:07', 'M079');
INSERT INTO `comuni` VALUES ('018182', 'Voghera', '018', NULL, '2023-02-27 18:49:07', 'M109');
INSERT INTO `comuni` VALUES ('018183', 'Volpara', '018', NULL, '2023-02-27 18:49:07', 'M119');
INSERT INTO `comuni` VALUES ('018184', 'Zavattarello', '018', NULL, '2023-02-27 18:49:07', 'M150');
INSERT INTO `comuni` VALUES ('018185', 'Zeccone', '018', NULL, '2023-02-27 18:49:07', 'M152');
INSERT INTO `comuni` VALUES ('018186', 'Zeme', '018', NULL, '2023-02-27 18:49:07', 'M161');
INSERT INTO `comuni` VALUES ('018187', 'Zenevredo', '018', NULL, '2023-02-27 18:49:07', 'M162');
INSERT INTO `comuni` VALUES ('018188', 'Zerbo', '018', NULL, '2023-02-27 18:49:07', 'M166');
INSERT INTO `comuni` VALUES ('018189', 'Zerbolò', '018', NULL, '2023-02-27 18:49:07', 'M167');
INSERT INTO `comuni` VALUES ('018190', 'Zinasco', '018', NULL, '2023-02-27 18:49:07', 'M180');
INSERT INTO `comuni` VALUES ('018191', 'Cornale e Bastida', '018', NULL, '2023-02-27 18:49:07', 'M338');
INSERT INTO `comuni` VALUES ('019001', 'Acquanegra Cremonese', '019', NULL, '2023-02-27 18:49:07', 'A039');
INSERT INTO `comuni` VALUES ('019002', 'Agnadello', '019', NULL, '2023-02-27 18:49:07', 'A076');
INSERT INTO `comuni` VALUES ('019003', 'Annicco', '019', NULL, '2023-02-27 18:49:07', 'A299');
INSERT INTO `comuni` VALUES ('019004', 'Azzanello', '019', NULL, '2023-02-27 18:49:07', 'A526');
INSERT INTO `comuni` VALUES ('019005', 'Bagnolo Cremasco', '019', NULL, '2023-02-27 18:49:07', 'A570');
INSERT INTO `comuni` VALUES ('019006', 'Bonemerse', '019', NULL, '2023-02-27 18:49:07', 'A972');
INSERT INTO `comuni` VALUES ('019007', 'Bordolano', '019', NULL, '2023-02-27 18:49:07', 'A986');
INSERT INTO `comuni` VALUES ('019008', 'Ca\' d\'Andrea', '019', NULL, '2023-02-27 18:49:07', 'B320');
INSERT INTO `comuni` VALUES ('019009', 'Calvatone', '019', NULL, '2023-02-27 18:49:07', 'B439');
INSERT INTO `comuni` VALUES ('019010', 'Camisano', '019', NULL, '2023-02-27 18:49:07', 'B484');
INSERT INTO `comuni` VALUES ('019011', 'Campagnola Cremasca', '019', NULL, '2023-02-27 18:49:07', 'B498');
INSERT INTO `comuni` VALUES ('019012', 'Capergnanica', '019', NULL, '2023-02-27 18:49:07', 'B650');
INSERT INTO `comuni` VALUES ('019013', 'Cappella Cantone', '019', NULL, '2023-02-27 18:49:07', 'B679');
INSERT INTO `comuni` VALUES ('019014', 'Cappella de\' Picenardi', '019', NULL, '2023-02-27 18:49:07', 'B680');
INSERT INTO `comuni` VALUES ('019015', 'Capralba', '019', NULL, '2023-02-27 18:49:07', 'B686');
INSERT INTO `comuni` VALUES ('019016', 'Casalbuttano ed Uniti', '019', NULL, '2023-02-27 18:49:07', 'B869');
INSERT INTO `comuni` VALUES ('019017', 'Casale Cremasco-Vidolasco', '019', NULL, '2023-02-27 18:49:07', 'B881');
INSERT INTO `comuni` VALUES ('019018', 'Casaletto Ceredano', '019', NULL, '2023-02-27 18:49:07', 'B889');
INSERT INTO `comuni` VALUES ('019019', 'Casaletto di Sopra', '019', NULL, '2023-02-27 18:49:07', 'B890');
INSERT INTO `comuni` VALUES ('019020', 'Casaletto Vaprio', '019', NULL, '2023-02-27 18:49:07', 'B891');
INSERT INTO `comuni` VALUES ('019021', 'Casalmaggiore', '019', NULL, '2023-02-27 18:49:07', 'B898');
INSERT INTO `comuni` VALUES ('019022', 'Casalmorano', '019', NULL, '2023-02-27 18:49:07', 'B900');
INSERT INTO `comuni` VALUES ('019023', 'Casteldidone', '019', NULL, '2023-02-27 18:49:07', 'C089');
INSERT INTO `comuni` VALUES ('019024', 'Castel Gabbiano', '019', NULL, '2023-02-27 18:49:07', 'C115');
INSERT INTO `comuni` VALUES ('019025', 'Castelleone', '019', NULL, '2023-02-27 18:49:07', 'C153');
INSERT INTO `comuni` VALUES ('019026', 'Castelverde', '019', NULL, '2023-02-27 18:49:07', 'B129');
INSERT INTO `comuni` VALUES ('019027', 'Castelvisconti', '019', NULL, '2023-02-27 18:49:07', 'C290');
INSERT INTO `comuni` VALUES ('019028', 'Cella Dati', '019', NULL, '2023-02-27 18:49:07', 'C435');
INSERT INTO `comuni` VALUES ('019029', 'Chieve', '019', NULL, '2023-02-27 18:49:07', 'C634');
INSERT INTO `comuni` VALUES ('019030', 'Cicognolo', '019', NULL, '2023-02-27 18:49:07', 'C678');
INSERT INTO `comuni` VALUES ('019031', 'Cingia de\' Botti', '019', NULL, '2023-02-27 18:49:07', 'C703');
INSERT INTO `comuni` VALUES ('019032', 'Corte de\' Cortesi con Cignone', '019', NULL, '2023-02-27 18:49:07', 'D056');
INSERT INTO `comuni` VALUES ('019033', 'Corte de\' Frati', '019', NULL, '2023-02-27 18:49:07', 'D057');
INSERT INTO `comuni` VALUES ('019034', 'Credera Rubbiano', '019', NULL, '2023-02-27 18:49:07', 'D141');
INSERT INTO `comuni` VALUES ('019035', 'Crema', '019', NULL, '2023-02-27 18:49:07', 'D142');
INSERT INTO `comuni` VALUES ('019036', 'Cremona', '019', NULL, '2023-02-27 18:49:07', 'D150');
INSERT INTO `comuni` VALUES ('019037', 'Cremosano', '019', NULL, '2023-02-27 18:49:07', 'D151');
INSERT INTO `comuni` VALUES ('019038', 'Crotta d\'Adda', '019', NULL, '2023-02-27 18:49:07', 'D186');
INSERT INTO `comuni` VALUES ('019039', 'Cumignano sul Naviglio', '019', NULL, '2023-02-27 18:49:07', 'D203');
INSERT INTO `comuni` VALUES ('019040', 'Derovere', '019', NULL, '2023-02-27 18:49:07', 'D278');
INSERT INTO `comuni` VALUES ('019041', 'Dovera', '019', NULL, '2023-02-27 18:49:07', 'D358');
INSERT INTO `comuni` VALUES ('019042', 'Drizzona', '019', NULL, '2023-02-27 18:49:07', 'D370');
INSERT INTO `comuni` VALUES ('019043', 'Fiesco', '019', NULL, '2023-02-27 18:49:07', 'D574');
INSERT INTO `comuni` VALUES ('019044', 'Formigara', '019', NULL, '2023-02-27 18:49:07', 'D710');
INSERT INTO `comuni` VALUES ('019045', 'Gabbioneta-Binanuova', '019', NULL, '2023-02-27 18:49:07', 'D834');
INSERT INTO `comuni` VALUES ('019046', 'Gadesco-Pieve Delmona', '019', NULL, '2023-02-27 18:49:07', 'D841');
INSERT INTO `comuni` VALUES ('019047', 'Genivolta', '019', NULL, '2023-02-27 18:49:07', 'D966');
INSERT INTO `comuni` VALUES ('019048', 'Gerre de\' Caprioli', '019', NULL, '2023-02-27 18:49:07', 'D993');
INSERT INTO `comuni` VALUES ('019049', 'Gombito', '019', NULL, '2023-02-27 18:49:07', 'E082');
INSERT INTO `comuni` VALUES ('019050', 'Grontardo', '019', NULL, '2023-02-27 18:49:07', 'E193');
INSERT INTO `comuni` VALUES ('019051', 'Grumello Cremonese ed Uniti', '019', NULL, '2023-02-27 18:49:07', 'E217');
INSERT INTO `comuni` VALUES ('019052', 'Gussola', '019', NULL, '2023-02-27 18:49:07', 'E272');
INSERT INTO `comuni` VALUES ('019053', 'Isola Dovarese', '019', NULL, '2023-02-27 18:49:07', 'E356');
INSERT INTO `comuni` VALUES ('019054', 'Izano', '019', NULL, '2023-02-27 18:49:07', 'E380');
INSERT INTO `comuni` VALUES ('019055', 'Madignano', '019', NULL, '2023-02-27 18:49:07', 'E793');
INSERT INTO `comuni` VALUES ('019056', 'Malagnino', '019', NULL, '2023-02-27 18:49:07', 'E843');
INSERT INTO `comuni` VALUES ('019057', 'Martignana di Po', '019', NULL, '2023-02-27 18:49:07', 'E983');
INSERT INTO `comuni` VALUES ('019058', 'Monte Cremasco', '019', NULL, '2023-02-27 18:49:07', 'F434');
INSERT INTO `comuni` VALUES ('019059', 'Montodine', '019', NULL, '2023-02-27 18:49:07', 'F681');
INSERT INTO `comuni` VALUES ('019060', 'Moscazzano', '019', NULL, '2023-02-27 18:49:07', 'F761');
INSERT INTO `comuni` VALUES ('019061', 'Motta Baluffi', '019', NULL, '2023-02-27 18:49:07', 'F771');
INSERT INTO `comuni` VALUES ('019062', 'Offanengo', '019', NULL, '2023-02-27 18:49:07', 'G004');
INSERT INTO `comuni` VALUES ('019063', 'Olmeneta', '019', NULL, '2023-02-27 18:49:07', 'G047');
INSERT INTO `comuni` VALUES ('019064', 'Ostiano', '019', NULL, '2023-02-27 18:49:07', 'G185');
INSERT INTO `comuni` VALUES ('019065', 'Paderno Ponchielli', '019', NULL, '2023-02-27 18:49:07', 'G222');
INSERT INTO `comuni` VALUES ('019066', 'Palazzo Pignano', '019', NULL, '2023-02-27 18:49:07', 'G260');
INSERT INTO `comuni` VALUES ('019067', 'Pandino', '019', NULL, '2023-02-27 18:49:07', 'G306');
INSERT INTO `comuni` VALUES ('019068', 'Persico Dosimo', '019', NULL, '2023-02-27 18:49:07', 'G469');
INSERT INTO `comuni` VALUES ('019069', 'Pescarolo ed Uniti', '019', NULL, '2023-02-27 18:49:07', 'G483');
INSERT INTO `comuni` VALUES ('019070', 'Pessina Cremonese', '019', NULL, '2023-02-27 18:49:07', 'G504');
INSERT INTO `comuni` VALUES ('019071', 'Piadena', '019', NULL, '2023-02-27 18:49:07', 'G536');
INSERT INTO `comuni` VALUES ('019072', 'Pianengo', '019', NULL, '2023-02-27 18:49:07', 'G558');
INSERT INTO `comuni` VALUES ('019073', 'Pieranica', '019', NULL, '2023-02-27 18:49:07', 'G603');
INSERT INTO `comuni` VALUES ('019074', 'Pieve d\'Olmi', '019', NULL, '2023-02-27 18:49:07', 'G647');
INSERT INTO `comuni` VALUES ('019075', 'Pieve San Giacomo', '019', NULL, '2023-02-27 18:49:07', 'G651');
INSERT INTO `comuni` VALUES ('019076', 'Pizzighettone', '019', NULL, '2023-02-27 18:49:07', 'G721');
INSERT INTO `comuni` VALUES ('019077', 'Pozzaglio ed Uniti', '019', NULL, '2023-02-27 18:49:07', 'B914');
INSERT INTO `comuni` VALUES ('019078', 'Quintano', '019', NULL, '2023-02-27 18:49:07', 'H130');
INSERT INTO `comuni` VALUES ('019079', 'Ricengo', '019', NULL, '2023-02-27 18:49:07', 'H276');
INSERT INTO `comuni` VALUES ('019080', 'Ripalta Arpina', '019', NULL, '2023-02-27 18:49:07', 'H314');
INSERT INTO `comuni` VALUES ('019081', 'Ripalta Cremasca', '019', NULL, '2023-02-27 18:49:07', 'H315');
INSERT INTO `comuni` VALUES ('019082', 'Ripalta Guerina', '019', NULL, '2023-02-27 18:49:07', 'H316');
INSERT INTO `comuni` VALUES ('019083', 'Rivarolo del Re ed Uniti', '019', NULL, '2023-02-27 18:49:07', 'H341');
INSERT INTO `comuni` VALUES ('019084', 'Rivolta d\'Adda', '019', NULL, '2023-02-27 18:49:07', 'H357');
INSERT INTO `comuni` VALUES ('019085', 'Robecco d\'Oglio', '019', NULL, '2023-02-27 18:49:07', 'H372');
INSERT INTO `comuni` VALUES ('019086', 'Romanengo', '019', NULL, '2023-02-27 18:49:07', 'H508');
INSERT INTO `comuni` VALUES ('019087', 'Salvirola', '019', NULL, '2023-02-27 18:49:07', 'H731');
INSERT INTO `comuni` VALUES ('019088', 'San Bassano', '019', NULL, '2023-02-27 18:49:07', 'H767');
INSERT INTO `comuni` VALUES ('019089', 'San Daniele Po', '019', NULL, '2023-02-27 18:49:07', 'H815');
INSERT INTO `comuni` VALUES ('019090', 'San Giovanni in Croce', '019', NULL, '2023-02-27 18:49:07', 'H918');
INSERT INTO `comuni` VALUES ('019091', 'San Martino del Lago', '019', NULL, '2023-02-27 18:49:07', 'I007');
INSERT INTO `comuni` VALUES ('019092', 'Scandolara Ravara', '019', NULL, '2023-02-27 18:49:07', 'I497');
INSERT INTO `comuni` VALUES ('019093', 'Scandolara Ripa d\'Oglio', '019', NULL, '2023-02-27 18:49:07', 'I498');
INSERT INTO `comuni` VALUES ('019094', 'Sergnano', '019', NULL, '2023-02-27 18:49:07', 'I627');
INSERT INTO `comuni` VALUES ('019095', 'Sesto ed Uniti', '019', NULL, '2023-02-27 18:49:07', 'I683');
INSERT INTO `comuni` VALUES ('019096', 'Solarolo Rainerio', '019', NULL, '2023-02-27 18:49:07', 'I790');
INSERT INTO `comuni` VALUES ('019097', 'Soncino', '019', NULL, '2023-02-27 18:49:07', 'I827');
INSERT INTO `comuni` VALUES ('019098', 'Soresina', '019', NULL, '2023-02-27 18:49:07', 'I849');
INSERT INTO `comuni` VALUES ('019099', 'Sospiro', '019', NULL, '2023-02-27 18:49:07', 'I865');
INSERT INTO `comuni` VALUES ('019100', 'Spinadesco', '019', NULL, '2023-02-27 18:49:07', 'I906');
INSERT INTO `comuni` VALUES ('019101', 'Spineda', '019', NULL, '2023-02-27 18:49:07', 'I909');
INSERT INTO `comuni` VALUES ('019102', 'Spino d\'Adda', '019', NULL, '2023-02-27 18:49:07', 'I914');
INSERT INTO `comuni` VALUES ('019103', 'Stagno Lombardo', '019', NULL, '2023-02-27 18:49:07', 'I935');
INSERT INTO `comuni` VALUES ('019104', 'Ticengo', '019', NULL, '2023-02-27 18:49:07', 'L164');
INSERT INTO `comuni` VALUES ('019105', 'Torlino Vimercati', '019', NULL, '2023-02-27 18:49:07', 'L221');
INSERT INTO `comuni` VALUES ('019106', 'Tornata', '019', NULL, '2023-02-27 18:49:07', 'L225');
INSERT INTO `comuni` VALUES ('019107', 'Torre de\' Picenardi', '019', NULL, '2023-02-27 18:49:07', 'L258');
INSERT INTO `comuni` VALUES ('019108', 'Torricella del Pizzo', '019', NULL, '2023-02-27 18:49:07', 'L296');
INSERT INTO `comuni` VALUES ('019109', 'Trescore Cremasco', '019', NULL, '2023-02-27 18:49:07', 'L389');
INSERT INTO `comuni` VALUES ('019110', 'Trigolo', '019', NULL, '2023-02-27 18:49:07', 'L426');
INSERT INTO `comuni` VALUES ('019111', 'Vaiano Cremasco', '019', NULL, '2023-02-27 18:49:07', 'L535');
INSERT INTO `comuni` VALUES ('019112', 'Vailate', '019', NULL, '2023-02-27 18:49:07', 'L539');
INSERT INTO `comuni` VALUES ('019113', 'Vescovato', '019', NULL, '2023-02-27 18:49:07', 'L806');
INSERT INTO `comuni` VALUES ('019114', 'Volongo', '019', NULL, '2023-02-27 18:49:07', 'M116');
INSERT INTO `comuni` VALUES ('019115', 'Voltido', '019', NULL, '2023-02-27 18:49:07', 'M127');
INSERT INTO `comuni` VALUES ('020001', 'Acquanegra sul Chiese', '020', NULL, '2023-02-27 18:49:07', 'A038');
INSERT INTO `comuni` VALUES ('020002', 'Asola', '020', NULL, '2023-02-27 18:49:07', 'A470');
INSERT INTO `comuni` VALUES ('020003', 'Bagnolo San Vito', '020', NULL, '2023-02-27 18:49:07', 'A575');
INSERT INTO `comuni` VALUES ('020004', 'Bigarello', '020', NULL, '2023-02-27 18:49:07', 'A866');
INSERT INTO `comuni` VALUES ('020006', 'Borgofranco sul Po', '020', NULL, '2023-02-27 18:49:07', 'B013');
INSERT INTO `comuni` VALUES ('020007', 'Bozzolo', '020', NULL, '2023-02-27 18:49:07', 'B110');
INSERT INTO `comuni` VALUES ('020008', 'Canneto sull\'Oglio', '020', NULL, '2023-02-27 18:49:07', 'B612');
INSERT INTO `comuni` VALUES ('020009', 'Carbonara di Po', '020', NULL, '2023-02-27 18:49:07', 'B739');
INSERT INTO `comuni` VALUES ('020010', 'Casalmoro', '020', NULL, '2023-02-27 18:49:07', 'B901');
INSERT INTO `comuni` VALUES ('020011', 'Casaloldo', '020', NULL, '2023-02-27 18:49:07', 'B907');
INSERT INTO `comuni` VALUES ('020012', 'Casalromano', '020', NULL, '2023-02-27 18:49:07', 'B911');
INSERT INTO `comuni` VALUES ('020013', 'Castelbelforte', '020', NULL, '2023-02-27 18:49:07', 'C059');
INSERT INTO `comuni` VALUES ('020014', 'Castel d\'Ario', '020', NULL, '2023-02-27 18:49:07', 'C076');
INSERT INTO `comuni` VALUES ('020015', 'Castel Goffredo', '020', NULL, '2023-02-27 18:49:07', 'C118');
INSERT INTO `comuni` VALUES ('020016', 'Castellucchio', '020', NULL, '2023-02-27 18:49:07', 'C195');
INSERT INTO `comuni` VALUES ('020017', 'Castiglione delle Stiviere', '020', NULL, '2023-02-27 18:49:07', 'C312');
INSERT INTO `comuni` VALUES ('020018', 'Cavriana', '020', NULL, '2023-02-27 18:49:07', 'C406');
INSERT INTO `comuni` VALUES ('020019', 'Ceresara', '020', NULL, '2023-02-27 18:49:07', 'C502');
INSERT INTO `comuni` VALUES ('020020', 'Commessaggio', '020', NULL, '2023-02-27 18:49:07', 'C930');
INSERT INTO `comuni` VALUES ('020021', 'Curtatone', '020', NULL, '2023-02-27 18:49:07', 'D227');
INSERT INTO `comuni` VALUES ('020022', 'Dosolo', '020', NULL, '2023-02-27 18:49:07', 'D351');
INSERT INTO `comuni` VALUES ('020023', 'Felonica', '020', NULL, '2023-02-27 18:49:07', 'D529');
INSERT INTO `comuni` VALUES ('020024', 'Gazoldo degli Ippoliti', '020', NULL, '2023-02-27 18:49:07', 'D949');
INSERT INTO `comuni` VALUES ('020025', 'Gazzuolo', '020', NULL, '2023-02-27 18:49:07', 'D959');
INSERT INTO `comuni` VALUES ('020026', 'Goito', '020', NULL, '2023-02-27 18:49:07', 'E078');
INSERT INTO `comuni` VALUES ('020027', 'Gonzaga', '020', NULL, '2023-02-27 18:49:07', 'E089');
INSERT INTO `comuni` VALUES ('020028', 'Guidizzolo', '020', NULL, '2023-02-27 18:49:07', 'E261');
INSERT INTO `comuni` VALUES ('020029', 'Magnacavallo', '020', NULL, '2023-02-27 18:49:07', 'E818');
INSERT INTO `comuni` VALUES ('020030', 'Mantova', '020', NULL, '2023-02-27 18:49:07', 'E897');
INSERT INTO `comuni` VALUES ('020031', 'Marcaria', '020', NULL, '2023-02-27 18:49:07', 'E922');
INSERT INTO `comuni` VALUES ('020032', 'Mariana Mantovana', '020', NULL, '2023-02-27 18:49:07', 'E949');
INSERT INTO `comuni` VALUES ('020033', 'Marmirolo', '020', NULL, '2023-02-27 18:49:07', 'E962');
INSERT INTO `comuni` VALUES ('020034', 'Medole', '020', NULL, '2023-02-27 18:49:07', 'F086');
INSERT INTO `comuni` VALUES ('020035', 'Moglia', '020', NULL, '2023-02-27 18:49:07', 'F267');
INSERT INTO `comuni` VALUES ('020036', 'Monzambano', '020', NULL, '2023-02-27 18:49:07', 'F705');
INSERT INTO `comuni` VALUES ('020037', 'Motteggiana', '020', NULL, '2023-02-27 18:49:07', 'B012');
INSERT INTO `comuni` VALUES ('020038', 'Ostiglia', '020', NULL, '2023-02-27 18:49:07', 'G186');
INSERT INTO `comuni` VALUES ('020039', 'Pegognaga', '020', NULL, '2023-02-27 18:49:07', 'G417');
INSERT INTO `comuni` VALUES ('020040', 'Pieve di Coriano', '020', NULL, '2023-02-27 18:49:07', 'G633');
INSERT INTO `comuni` VALUES ('020041', 'Piubega', '020', NULL, '2023-02-27 18:49:07', 'G717');
INSERT INTO `comuni` VALUES ('020042', 'Poggio Rusco', '020', NULL, '2023-02-27 18:49:07', 'G753');
INSERT INTO `comuni` VALUES ('020043', 'Pomponesco', '020', NULL, '2023-02-27 18:49:07', 'G816');
INSERT INTO `comuni` VALUES ('020044', 'Ponti sul Mincio', '020', NULL, '2023-02-27 18:49:07', 'G862');
INSERT INTO `comuni` VALUES ('020045', 'Porto Mantovano', '020', NULL, '2023-02-27 18:49:07', 'G917');
INSERT INTO `comuni` VALUES ('020046', 'Quingentole', '020', NULL, '2023-02-27 18:49:07', 'H129');
INSERT INTO `comuni` VALUES ('020047', 'Quistello', '020', NULL, '2023-02-27 18:49:07', 'H143');
INSERT INTO `comuni` VALUES ('020048', 'Redondesco', '020', NULL, '2023-02-27 18:49:07', 'H218');
INSERT INTO `comuni` VALUES ('020049', 'Revere', '020', NULL, '2023-02-27 18:49:07', 'H248');
INSERT INTO `comuni` VALUES ('020050', 'Rivarolo Mantovano', '020', NULL, '2023-02-27 18:49:07', 'H342');
INSERT INTO `comuni` VALUES ('020051', 'Rodigo', '020', NULL, '2023-02-27 18:49:07', 'H481');
INSERT INTO `comuni` VALUES ('020052', 'Roncoferraro', '020', NULL, '2023-02-27 18:49:07', 'H541');
INSERT INTO `comuni` VALUES ('020053', 'Roverbella', '020', NULL, '2023-02-27 18:49:07', 'H604');
INSERT INTO `comuni` VALUES ('020054', 'Sabbioneta', '020', NULL, '2023-02-27 18:49:07', 'H652');
INSERT INTO `comuni` VALUES ('020055', 'San Benedetto Po', '020', NULL, '2023-02-27 18:49:07', 'H771');
INSERT INTO `comuni` VALUES ('020056', 'San Giacomo delle Segnate', '020', NULL, '2023-02-27 18:49:07', 'H870');
INSERT INTO `comuni` VALUES ('020057', 'San Giorgio di Mantova', '020', NULL, '2023-02-27 18:49:07', 'H883');
INSERT INTO `comuni` VALUES ('020058', 'San Giovanni del Dosso', '020', NULL, '2023-02-27 18:49:07', 'H912');
INSERT INTO `comuni` VALUES ('020059', 'San Martino dall\'Argine', '020', NULL, '2023-02-27 18:49:07', 'I005');
INSERT INTO `comuni` VALUES ('020060', 'Schivenoglia', '020', NULL, '2023-02-27 18:49:07', 'I532');
INSERT INTO `comuni` VALUES ('020061', 'Sermide', '020', NULL, '2023-02-27 18:49:07', 'I632');
INSERT INTO `comuni` VALUES ('020062', 'Serravalle a Po', '020', NULL, '2023-02-27 18:49:07', 'I662');
INSERT INTO `comuni` VALUES ('020063', 'Solferino', '020', NULL, '2023-02-27 18:49:07', 'I801');
INSERT INTO `comuni` VALUES ('020064', 'Sustinente', '020', NULL, '2023-02-27 18:49:07', 'L015');
INSERT INTO `comuni` VALUES ('020065', 'Suzzara', '020', NULL, '2023-02-27 18:49:07', 'L020');
INSERT INTO `comuni` VALUES ('020066', 'Viadana', '020', NULL, '2023-02-27 18:49:07', 'L826');
INSERT INTO `comuni` VALUES ('020067', 'Villa Poma', '020', NULL, '2023-02-27 18:49:07', 'F804');
INSERT INTO `comuni` VALUES ('020068', 'Villimpenta', '020', NULL, '2023-02-27 18:49:07', 'M044');
INSERT INTO `comuni` VALUES ('020070', 'Volta Mantovana', '020', NULL, '2023-02-27 18:49:07', 'M125');
INSERT INTO `comuni` VALUES ('020071', 'Borgo Virgilio', '020', NULL, '2023-02-27 18:49:07', 'M340');
INSERT INTO `comuni` VALUES ('021001', 'Aldino', '021', NULL, '2023-02-27 18:49:07', 'A179');
INSERT INTO `comuni` VALUES ('021002', 'Andriano', '021', NULL, '2023-02-27 18:49:07', 'A286');
INSERT INTO `comuni` VALUES ('021003', 'Anterivo', '021', NULL, '2023-02-27 18:49:07', 'A306');
INSERT INTO `comuni` VALUES ('021004', 'Appiano sulla strada del vino', '021', NULL, '2023-02-27 18:49:07', 'A332');
INSERT INTO `comuni` VALUES ('021005', 'Avelengo', '021', NULL, '2023-02-27 18:49:07', 'A507');
INSERT INTO `comuni` VALUES ('021006', 'Badia', '021', NULL, '2023-02-27 18:49:07', 'A537');
INSERT INTO `comuni` VALUES ('021007', 'Barbiano', '021', NULL, '2023-02-27 18:49:07', 'A635');
INSERT INTO `comuni` VALUES ('021008', 'Bolzano', '021', NULL, '2023-02-27 18:49:07', 'A952');
INSERT INTO `comuni` VALUES ('021009', 'Braies', '021', NULL, '2023-02-27 18:49:07', 'B116');
INSERT INTO `comuni` VALUES ('021010', 'Brennero', '021', NULL, '2023-02-27 18:49:07', 'B145');
INSERT INTO `comuni` VALUES ('021011', 'Bressanone', '021', NULL, '2023-02-27 18:49:07', 'B160');
INSERT INTO `comuni` VALUES ('021012', 'Bronzolo', '021', NULL, '2023-02-27 18:49:07', 'B203');
INSERT INTO `comuni` VALUES ('021013', 'Brunico', '021', NULL, '2023-02-27 18:49:07', 'B220');
INSERT INTO `comuni` VALUES ('021014', 'Caines', '021', NULL, '2023-02-27 18:49:07', 'B364');
INSERT INTO `comuni` VALUES ('021015', 'Caldaro sulla strada del vino', '021', NULL, '2023-02-27 18:49:07', 'B397');
INSERT INTO `comuni` VALUES ('021016', 'Campo di Trens', '021', NULL, '2023-02-27 18:49:07', 'B529');
INSERT INTO `comuni` VALUES ('021017', 'Campo Tures', '021', NULL, '2023-02-27 18:49:07', 'B570');
INSERT INTO `comuni` VALUES ('021018', 'Castelbello-Ciardes', '021', NULL, '2023-02-27 18:49:07', 'C062');
INSERT INTO `comuni` VALUES ('021019', 'Castelrotto', '021', NULL, '2023-02-27 18:49:07', 'C254');
INSERT INTO `comuni` VALUES ('021020', 'Cermes', '021', NULL, '2023-02-27 18:49:07', 'A022');
INSERT INTO `comuni` VALUES ('021021', 'Chienes', '021', NULL, '2023-02-27 18:49:07', 'C625');
INSERT INTO `comuni` VALUES ('021022', 'Chiusa', '021', NULL, '2023-02-27 18:49:07', 'C652');
INSERT INTO `comuni` VALUES ('021023', 'Cornedo all\'Isarco', '021', NULL, '2023-02-27 18:49:07', 'B799');
INSERT INTO `comuni` VALUES ('021024', 'Cortaccia sulla strada del vino', '021', NULL, '2023-02-27 18:49:07', 'D048');
INSERT INTO `comuni` VALUES ('021025', 'Cortina sulla strada del vino', '021', NULL, '2023-02-27 18:49:07', 'D075');
INSERT INTO `comuni` VALUES ('021026', 'Corvara in Badia', '021', NULL, '2023-02-27 18:49:07', 'D079');
INSERT INTO `comuni` VALUES ('021027', 'Curon Venosta', '021', NULL, '2023-02-27 18:49:07', 'D222');
INSERT INTO `comuni` VALUES ('021028', 'Dobbiaco', '021', NULL, '2023-02-27 18:49:07', 'D311');
INSERT INTO `comuni` VALUES ('021029', 'Egna', '021', NULL, '2023-02-27 18:49:07', 'D392');
INSERT INTO `comuni` VALUES ('021030', 'Falzes', '021', NULL, '2023-02-27 18:49:07', 'D484');
INSERT INTO `comuni` VALUES ('021031', 'Fiè allo Sciliar', '021', NULL, '2023-02-27 18:49:07', 'D571');
INSERT INTO `comuni` VALUES ('021032', 'Fortezza', '021', NULL, '2023-02-27 18:49:07', 'D731');
INSERT INTO `comuni` VALUES ('021033', 'Funes', '021', NULL, '2023-02-27 18:49:07', 'D821');
INSERT INTO `comuni` VALUES ('021034', 'Gais', '021', NULL, '2023-02-27 18:49:07', 'D860');
INSERT INTO `comuni` VALUES ('021035', 'Gargazzone', '021', NULL, '2023-02-27 18:49:07', 'D923');
INSERT INTO `comuni` VALUES ('021036', 'Glorenza', '021', NULL, '2023-02-27 18:49:07', 'E069');
INSERT INTO `comuni` VALUES ('021037', 'Laces', '021', NULL, '2023-02-27 18:49:07', 'E398');
INSERT INTO `comuni` VALUES ('021038', 'Lagundo', '021', NULL, '2023-02-27 18:49:07', 'E412');
INSERT INTO `comuni` VALUES ('021039', 'Laion', '021', NULL, '2023-02-27 18:49:07', 'E420');
INSERT INTO `comuni` VALUES ('021040', 'Laives', '021', NULL, '2023-02-27 18:49:07', 'E421');
INSERT INTO `comuni` VALUES ('021041', 'Lana', '021', NULL, '2023-02-27 18:49:07', 'E434');
INSERT INTO `comuni` VALUES ('021042', 'Lasa', '021', NULL, '2023-02-27 18:49:07', 'E457');
INSERT INTO `comuni` VALUES ('021043', 'Lauregno', '021', NULL, '2023-02-27 18:49:07', 'E481');
INSERT INTO `comuni` VALUES ('021044', 'Luson', '021', NULL, '2023-02-27 18:49:07', 'E764');
INSERT INTO `comuni` VALUES ('021045', 'Magrè sulla strada del vino', '021', NULL, '2023-02-27 18:49:07', 'E829');
INSERT INTO `comuni` VALUES ('021046', 'Malles Venosta', '021', NULL, '2023-02-27 18:49:07', 'E862');
INSERT INTO `comuni` VALUES ('021047', 'Marebbe', '021', NULL, '2023-02-27 18:49:07', 'E938');
INSERT INTO `comuni` VALUES ('021048', 'Marlengo', '021', NULL, '2023-02-27 18:49:07', 'E959');
INSERT INTO `comuni` VALUES ('021049', 'Martello', '021', NULL, '2023-02-27 18:49:07', 'E981');
INSERT INTO `comuni` VALUES ('021050', 'Meltina', '021', NULL, '2023-02-27 18:49:07', 'F118');
INSERT INTO `comuni` VALUES ('021051', 'Merano', '021', NULL, '2023-02-27 18:49:07', 'F132');
INSERT INTO `comuni` VALUES ('021052', 'Monguelfo-Tesido', '021', NULL, '2023-02-27 18:49:07', 'F371');
INSERT INTO `comuni` VALUES ('021053', 'Montagna', '021', NULL, '2023-02-27 18:49:07', 'F392');
INSERT INTO `comuni` VALUES ('021054', 'Moso in Passiria', '021', NULL, '2023-02-27 18:49:07', 'F766');
INSERT INTO `comuni` VALUES ('021055', 'Nalles', '021', NULL, '2023-02-27 18:49:07', 'F836');
INSERT INTO `comuni` VALUES ('021056', 'Naturno', '021', NULL, '2023-02-27 18:49:07', 'F849');
INSERT INTO `comuni` VALUES ('021057', 'Naz-Sciaves', '021', NULL, '2023-02-27 18:49:07', 'F856');
INSERT INTO `comuni` VALUES ('021058', 'Nova Levante', '021', NULL, '2023-02-27 18:49:07', 'F949');
INSERT INTO `comuni` VALUES ('021059', 'Nova Ponente', '021', NULL, '2023-02-27 18:49:07', 'F950');
INSERT INTO `comuni` VALUES ('021060', 'Ora', '021', NULL, '2023-02-27 18:49:07', 'G083');
INSERT INTO `comuni` VALUES ('021061', 'Ortisei', '021', NULL, '2023-02-27 18:49:07', 'G140');
INSERT INTO `comuni` VALUES ('021062', 'Parcines', '021', NULL, '2023-02-27 18:49:07', 'G328');
INSERT INTO `comuni` VALUES ('021063', 'Perca', '021', NULL, '2023-02-27 18:49:07', 'G443');
INSERT INTO `comuni` VALUES ('021064', 'Plaus', '021', NULL, '2023-02-27 18:49:07', 'G299');
INSERT INTO `comuni` VALUES ('021065', 'Ponte Gardena', '021', NULL, '2023-02-27 18:49:07', 'G830');
INSERT INTO `comuni` VALUES ('021066', 'Postal', '021', NULL, '2023-02-27 18:49:07', 'G936');
INSERT INTO `comuni` VALUES ('021067', 'Prato allo Stelvio', '021', NULL, '2023-02-27 18:49:07', 'H004');
INSERT INTO `comuni` VALUES ('021068', 'Predoi', '021', NULL, '2023-02-27 18:49:07', 'H019');
INSERT INTO `comuni` VALUES ('021069', 'Proves', '021', NULL, '2023-02-27 18:49:07', 'H081');
INSERT INTO `comuni` VALUES ('021070', 'Racines', '021', NULL, '2023-02-27 18:49:07', 'H152');
INSERT INTO `comuni` VALUES ('021071', 'Rasun-Anterselva', '021', NULL, '2023-02-27 18:49:07', 'H189');
INSERT INTO `comuni` VALUES ('021072', 'Renon', '021', NULL, '2023-02-27 18:49:07', 'H236');
INSERT INTO `comuni` VALUES ('021073', 'Rifiano', '021', NULL, '2023-02-27 18:49:07', 'H284');
INSERT INTO `comuni` VALUES ('021074', 'Rio di Pusteria', '021', NULL, '2023-02-27 18:49:07', 'H299');
INSERT INTO `comuni` VALUES ('021075', 'Rodengo', '021', NULL, '2023-02-27 18:49:07', 'H475');
INSERT INTO `comuni` VALUES ('021076', 'Salorno', '021', NULL, '2023-02-27 18:49:07', 'H719');
INSERT INTO `comuni` VALUES ('021077', 'San Candido', '021', NULL, '2023-02-27 18:49:07', 'H786');
INSERT INTO `comuni` VALUES ('021079', 'San Genesio Atesino', '021', NULL, '2023-02-27 18:49:07', 'H858');
INSERT INTO `comuni` VALUES ('021080', 'San Leonardo in Passiria', '021', NULL, '2023-02-27 18:49:07', 'H952');
INSERT INTO `comuni` VALUES ('021081', 'San Lorenzo di Sebato', '021', NULL, '2023-02-27 18:49:07', 'H956');
INSERT INTO `comuni` VALUES ('021082', 'San Martino in Badia', '021', NULL, '2023-02-27 18:49:07', 'H988');
INSERT INTO `comuni` VALUES ('021083', 'San Martino in Passiria', '021', NULL, '2023-02-27 18:49:07', 'H989');
INSERT INTO `comuni` VALUES ('021084', 'San Pancrazio', '021', NULL, '2023-02-27 18:49:07', 'I065');
INSERT INTO `comuni` VALUES ('021085', 'Santa Cristina Valgardena', '021', NULL, '2023-02-27 18:49:07', 'I173');
INSERT INTO `comuni` VALUES ('021086', 'Sarentino', '021', NULL, '2023-02-27 18:49:07', 'I431');
INSERT INTO `comuni` VALUES ('021087', 'Scena', '021', NULL, '2023-02-27 18:49:07', 'I519');
INSERT INTO `comuni` VALUES ('021088', 'Selva dei Molini', '021', NULL, '2023-02-27 18:49:07', 'I593');
INSERT INTO `comuni` VALUES ('021089', 'Selva di Val Gardena', '021', NULL, '2023-02-27 18:49:07', 'I591');
INSERT INTO `comuni` VALUES ('021091', 'Senales', '021', NULL, '2023-02-27 18:49:07', 'I604');
INSERT INTO `comuni` VALUES ('021092', 'Sesto', '021', NULL, '2023-02-27 18:49:07', 'I687');
INSERT INTO `comuni` VALUES ('021093', 'Silandro', '021', NULL, '2023-02-27 18:49:07', 'I729');
INSERT INTO `comuni` VALUES ('021094', 'Sluderno', '021', NULL, '2023-02-27 18:49:07', 'I771');
INSERT INTO `comuni` VALUES ('021095', 'Stelvio', '021', NULL, '2023-02-27 18:49:07', 'I948');
INSERT INTO `comuni` VALUES ('021096', 'Terento', '021', NULL, '2023-02-27 18:49:07', 'L106');
INSERT INTO `comuni` VALUES ('021097', 'Terlano', '021', NULL, '2023-02-27 18:49:07', 'L108');
INSERT INTO `comuni` VALUES ('021098', 'Termeno sulla strada del vino', '021', NULL, '2023-02-27 18:49:07', 'L111');
INSERT INTO `comuni` VALUES ('021099', 'Tesimo', '021', NULL, '2023-02-27 18:49:07', 'L149');
INSERT INTO `comuni` VALUES ('021100', 'Tires', '021', NULL, '2023-02-27 18:49:07', 'L176');
INSERT INTO `comuni` VALUES ('021101', 'Tirolo', '021', NULL, '2023-02-27 18:49:07', 'L178');
INSERT INTO `comuni` VALUES ('021102', 'Trodena nel parco naturale', '021', NULL, '2023-02-27 18:49:07', 'L444');
INSERT INTO `comuni` VALUES ('021103', 'Tubre', '021', NULL, '2023-02-27 18:49:07', 'L455');
INSERT INTO `comuni` VALUES ('021104', 'Ultimo', '021', NULL, '2023-02-27 18:49:07', 'L490');
INSERT INTO `comuni` VALUES ('021105', 'Vadena', '021', NULL, '2023-02-27 18:49:07', 'L527');
INSERT INTO `comuni` VALUES ('021106', 'Valdaora', '021', NULL, '2023-02-27 18:49:07', 'L552');
INSERT INTO `comuni` VALUES ('021107', 'Val di Vizze', '021', NULL, '2023-02-27 18:49:07', 'L564');
INSERT INTO `comuni` VALUES ('021108', 'Valle Aurina', '021', NULL, '2023-02-27 18:49:07', 'L595');
INSERT INTO `comuni` VALUES ('021109', 'Valle di Casies', '021', NULL, '2023-02-27 18:49:07', 'L601');
INSERT INTO `comuni` VALUES ('021110', 'Vandoies', '021', NULL, '2023-02-27 18:49:07', 'L660');
INSERT INTO `comuni` VALUES ('021111', 'Varna', '021', NULL, '2023-02-27 18:49:07', 'L687');
INSERT INTO `comuni` VALUES ('021112', 'Verano', '021', NULL, '2023-02-27 18:49:07', 'L745');
INSERT INTO `comuni` VALUES ('021113', 'Villabassa', '021', NULL, '2023-02-27 18:49:07', 'L915');
INSERT INTO `comuni` VALUES ('021114', 'Villandro', '021', NULL, '2023-02-27 18:49:07', 'L971');
INSERT INTO `comuni` VALUES ('021115', 'Vipiteno', '021', NULL, '2023-02-27 18:49:07', 'M067');
INSERT INTO `comuni` VALUES ('021116', 'Velturno', '021', NULL, '2023-02-27 18:49:07', 'L724');
INSERT INTO `comuni` VALUES ('021117', 'La Valle', '021', NULL, '2023-02-27 18:49:07', 'E491');
INSERT INTO `comuni` VALUES ('021118', 'Senale-San Felice', '021', NULL, '2023-02-27 18:49:07', 'I603');
INSERT INTO `comuni` VALUES ('022001', 'Ala', '022', 10, '2023-02-27 18:49:07', 'A116');
INSERT INTO `comuni` VALUES ('022002', 'Albiano', '022', 5, '2023-02-27 18:49:07', 'A158');
INSERT INTO `comuni` VALUES ('022003', 'Aldeno', '022', 16, '2023-02-27 18:49:07', 'A178');
INSERT INTO `comuni` VALUES ('022004', 'Amblar', '022', 6, '2023-02-27 18:49:07', 'A260');
INSERT INTO `comuni` VALUES ('022005', 'Andalo', '022', 14, '2023-02-27 18:49:07', 'A274');
INSERT INTO `comuni` VALUES ('022006', 'Arco', '022', 9, '2023-02-27 18:49:07', 'A372');
INSERT INTO `comuni` VALUES ('022007', 'Avio', '022', 10, '2023-02-27 18:49:07', 'A520');
INSERT INTO `comuni` VALUES ('022009', 'Baselga di Pinè', '022', 4, '2023-02-27 18:49:07', 'A694');
INSERT INTO `comuni` VALUES ('022011', 'Bedollo', '022', 4, '2023-02-27 18:49:07', 'A730');
INSERT INTO `comuni` VALUES ('022012', 'Bersone', '022', 8, '2023-02-27 18:49:07', 'A808');
INSERT INTO `comuni` VALUES ('022013', 'Besenello', '022', 10, '2023-02-27 18:49:07', 'A821');
INSERT INTO `comuni` VALUES ('022015', 'Bieno', '022', 3, '2023-02-27 18:49:07', 'A863');
INSERT INTO `comuni` VALUES ('022017', 'Bleggio Superiore', '022', 8, '2023-02-27 18:49:07', 'A902');
INSERT INTO `comuni` VALUES ('022018', 'Bocenago', '022', 8, '2023-02-27 18:49:07', 'A916');
INSERT INTO `comuni` VALUES ('022019', 'Bolbeno', '022', 8, '2023-02-27 18:49:07', 'A933');
INSERT INTO `comuni` VALUES ('022020', 'Bondo', '022', 8, '2023-02-27 18:49:07', 'A967');
INSERT INTO `comuni` VALUES ('022021', 'Bondone', '022', 8, '2023-02-27 18:49:07', 'A968');
INSERT INTO `comuni` VALUES ('022022', 'Borgo Valsugana', '022', 3, '2023-02-27 18:49:07', 'B006');
INSERT INTO `comuni` VALUES ('022023', 'Bosentino', '022', 4, '2023-02-27 18:49:07', 'B078');
INSERT INTO `comuni` VALUES ('022024', 'Breguzzo', '022', 8, '2023-02-27 18:49:07', 'B135');
INSERT INTO `comuni` VALUES ('022025', 'Brentonico', '022', 10, '2023-02-27 18:49:07', 'B153');
INSERT INTO `comuni` VALUES ('022026', 'Bresimo', '022', 6, '2023-02-27 18:49:07', 'B158');
INSERT INTO `comuni` VALUES ('022027', 'Brez', '022', 6, '2023-02-27 18:49:07', 'B165');
INSERT INTO `comuni` VALUES ('022028', 'Brione', '022', 8, '2023-02-27 18:49:07', 'B185');
INSERT INTO `comuni` VALUES ('022029', 'Caderzone Terme', '022', 8, '2023-02-27 18:49:07', 'B335');
INSERT INTO `comuni` VALUES ('022030', 'Cagnò', '022', 6, '2023-02-27 18:49:07', 'B360');
INSERT INTO `comuni` VALUES ('022031', 'Calavino', '022', 15, '2023-02-27 18:49:07', 'B386');
INSERT INTO `comuni` VALUES ('022032', 'Calceranica al Lago', '022', 4, '2023-02-27 18:49:07', 'B389');
INSERT INTO `comuni` VALUES ('022033', 'Caldes', '022', 7, '2023-02-27 18:49:07', 'B400');
INSERT INTO `comuni` VALUES ('022034', 'Caldonazzo', '022', 4, '2023-02-27 18:49:07', 'B404');
INSERT INTO `comuni` VALUES ('022035', 'Calliano', '022', 10, '2023-02-27 18:49:07', 'B419');
INSERT INTO `comuni` VALUES ('022036', 'Campitello di Fassa', '022', 11, '2023-02-27 18:49:07', 'B514');
INSERT INTO `comuni` VALUES ('022037', 'Campodenno', '022', 6, '2023-02-27 18:49:07', 'B525');
INSERT INTO `comuni` VALUES ('022038', 'Canal San Bovo', '022', 2, '2023-02-27 18:49:07', 'B577');
INSERT INTO `comuni` VALUES ('022039', 'Canazei', '022', 11, '2023-02-27 18:49:07', 'B579');
INSERT INTO `comuni` VALUES ('022040', 'Capriana', '022', 1, '2023-02-27 18:49:07', 'B697');
INSERT INTO `comuni` VALUES ('022041', 'Carano', '022', 1, '2023-02-27 18:49:07', 'B723');
INSERT INTO `comuni` VALUES ('022042', 'Carisolo', '022', 8, '2023-02-27 18:49:07', 'B783');
INSERT INTO `comuni` VALUES ('022043', 'Carzano', '022', 3, '2023-02-27 18:49:07', 'B856');
INSERT INTO `comuni` VALUES ('022045', 'Castel Condino', '022', 8, '2023-02-27 18:49:07', 'C183');
INSERT INTO `comuni` VALUES ('022046', 'Castelfondo', '022', 6, '2023-02-27 18:49:07', 'C103');
INSERT INTO `comuni` VALUES ('022047', 'Castello-Molina di Fiemme', '022', 1, '2023-02-27 18:49:07', 'C189');
INSERT INTO `comuni` VALUES ('022048', 'Castello Tesino', '022', 3, '2023-02-27 18:49:07', 'C194');
INSERT INTO `comuni` VALUES ('022049', 'Castelnuovo', '022', 3, '2023-02-27 18:49:07', 'C216');
INSERT INTO `comuni` VALUES ('022050', 'Cavalese', '022', 1, '2023-02-27 18:49:07', 'C372');
INSERT INTO `comuni` VALUES ('022051', 'Cavareno', '022', 6, '2023-02-27 18:49:07', 'C380');
INSERT INTO `comuni` VALUES ('022052', 'Cavedago', '022', 14, '2023-02-27 18:49:07', 'C392');
INSERT INTO `comuni` VALUES ('022053', 'Cavedine', '022', 15, '2023-02-27 18:49:07', 'C393');
INSERT INTO `comuni` VALUES ('022054', 'Cavizzana', '022', 7, '2023-02-27 18:49:07', 'C400');
INSERT INTO `comuni` VALUES ('022055', 'Cembra', '022', 5, '2023-02-27 18:49:07', 'C452');
INSERT INTO `comuni` VALUES ('022056', 'Centa San Nicolò', '022', 4, '2023-02-27 18:49:07', 'C467');
INSERT INTO `comuni` VALUES ('022057', 'Cimego', '022', 8, '2023-02-27 18:49:07', 'C694');
INSERT INTO `comuni` VALUES ('022058', 'Cimone', '022', 16, '2023-02-27 18:49:07', 'C700');
INSERT INTO `comuni` VALUES ('022059', 'Cinte Tesino', '022', 3, '2023-02-27 18:49:07', 'C712');
INSERT INTO `comuni` VALUES ('022060', 'Cis', '022', 6, '2023-02-27 18:49:07', 'C727');
INSERT INTO `comuni` VALUES ('022061', 'Civezzano', '022', 4, '2023-02-27 18:49:07', 'C756');
INSERT INTO `comuni` VALUES ('022062', 'Cles', '022', 6, '2023-02-27 18:49:07', 'C794');
INSERT INTO `comuni` VALUES ('022063', 'Cloz', '022', 6, '2023-02-27 18:49:07', 'C797');
INSERT INTO `comuni` VALUES ('022064', 'Commezzadura', '022', 7, '2023-02-27 18:49:07', 'C931');
INSERT INTO `comuni` VALUES ('022066', 'Condino', '022', 8, '2023-02-27 18:49:07', 'C953');
INSERT INTO `comuni` VALUES ('022067', 'Coredo', '022', 6, '2023-02-27 18:49:07', 'C994');
INSERT INTO `comuni` VALUES ('022068', 'Croviana', '022', 7, '2023-02-27 18:49:07', 'D188');
INSERT INTO `comuni` VALUES ('022069', 'Cunevo', '022', 6, '2023-02-27 18:49:07', 'D206');
INSERT INTO `comuni` VALUES ('022070', 'Daiano', '022', 1, '2023-02-27 18:49:07', 'D243');
INSERT INTO `comuni` VALUES ('022071', 'Dambel', '022', 6, '2023-02-27 18:49:07', 'D246');
INSERT INTO `comuni` VALUES ('022072', 'Daone', '022', 8, '2023-02-27 18:49:07', 'D248');
INSERT INTO `comuni` VALUES ('022073', 'Darè', '022', 8, '2023-02-27 18:49:07', 'D250');
INSERT INTO `comuni` VALUES ('022074', 'Denno', '022', 6, '2023-02-27 18:49:07', 'D273');
INSERT INTO `comuni` VALUES ('022075', 'Dimaro', '022', 7, '2023-02-27 18:49:07', 'D302');
INSERT INTO `comuni` VALUES ('022076', 'Don', '022', 6, '2023-02-27 18:49:07', 'D336');
INSERT INTO `comuni` VALUES ('022077', 'Dorsino', '022', 8, '2023-02-27 18:49:07', 'D349');
INSERT INTO `comuni` VALUES ('022078', 'Drena', '022', 9, '2023-02-27 18:49:07', 'D365');
INSERT INTO `comuni` VALUES ('022079', 'Dro', '022', 9, '2023-02-27 18:49:07', 'D371');
INSERT INTO `comuni` VALUES ('022080', 'Faedo', '022', 13, '2023-02-27 18:49:07', 'D457');
INSERT INTO `comuni` VALUES ('022081', 'Fai della Paganella', '022', 14, '2023-02-27 18:49:07', 'D468');
INSERT INTO `comuni` VALUES ('022082', 'Faver', '022', 5, '2023-02-27 18:49:07', 'D516');
INSERT INTO `comuni` VALUES ('022083', 'Fiavè', '022', 8, '2023-02-27 18:49:07', 'D565');
INSERT INTO `comuni` VALUES ('022084', 'Fiera di Primiero', '022', 2, '2023-02-27 18:49:07', 'D572');
INSERT INTO `comuni` VALUES ('022085', 'Fierozzo', '022', 4, '2023-02-27 18:49:07', 'D573');
INSERT INTO `comuni` VALUES ('022086', 'Flavon', '022', 6, '2023-02-27 18:49:07', 'D631');
INSERT INTO `comuni` VALUES ('022087', 'Folgaria', '022', 12, '2023-02-27 18:49:07', 'D651');
INSERT INTO `comuni` VALUES ('022088', 'Fondo', '022', 6, '2023-02-27 18:49:07', 'D663');
INSERT INTO `comuni` VALUES ('022089', 'Fornace', '022', 4, '2023-02-27 18:49:07', 'D714');
INSERT INTO `comuni` VALUES ('022090', 'Frassilongo', '022', 4, '2023-02-27 18:49:07', 'D775');
INSERT INTO `comuni` VALUES ('022091', 'Garniga Terme', '022', 16, '2023-02-27 18:49:07', 'D928');
INSERT INTO `comuni` VALUES ('022092', 'Giovo', '022', 5, '2023-02-27 18:49:07', 'E048');
INSERT INTO `comuni` VALUES ('022093', 'Giustino', '022', 8, '2023-02-27 18:49:07', 'E065');
INSERT INTO `comuni` VALUES ('022094', 'Grauno', '022', 5, '2023-02-27 18:49:07', 'E150');
INSERT INTO `comuni` VALUES ('022095', 'Grigno', '022', 3, '2023-02-27 18:49:07', 'E178');
INSERT INTO `comuni` VALUES ('022096', 'Grumes', '022', 5, '2023-02-27 18:49:07', 'E222');
INSERT INTO `comuni` VALUES ('022097', 'Imer', '022', 2, '2023-02-27 18:49:07', 'E288');
INSERT INTO `comuni` VALUES ('022098', 'Isera', '022', 10, '2023-02-27 18:49:07', 'E334');
INSERT INTO `comuni` VALUES ('022099', 'Ivano-Fracena', '022', 3, '2023-02-27 18:49:07', 'E378');
INSERT INTO `comuni` VALUES ('022100', 'Lardaro', '022', 8, '2023-02-27 18:49:07', 'E452');
INSERT INTO `comuni` VALUES ('022101', 'Lasino', '022', 15, '2023-02-27 18:49:07', 'E461');
INSERT INTO `comuni` VALUES ('022102', 'Lavarone', '022', 12, '2023-02-27 18:49:07', 'E492');
INSERT INTO `comuni` VALUES ('022103', 'Lavis', '022', 13, '2023-02-27 18:49:07', 'E500');
INSERT INTO `comuni` VALUES ('022104', 'Levico Terme', '022', 4, '2023-02-27 18:49:07', 'E565');
INSERT INTO `comuni` VALUES ('022105', 'Lisignago', '022', 5, '2023-02-27 18:49:07', 'E614');
INSERT INTO `comuni` VALUES ('022106', 'Livo', '022', 6, '2023-02-27 18:49:07', 'E624');
INSERT INTO `comuni` VALUES ('022108', 'Lona-Lases', '022', 5, '2023-02-27 18:49:07', 'E664');
INSERT INTO `comuni` VALUES ('022109', 'Luserna', '022', 12, '2023-02-27 18:49:07', 'E757');
INSERT INTO `comuni` VALUES ('022110', 'Malè', '022', 7, '2023-02-27 18:49:07', 'E850');
INSERT INTO `comuni` VALUES ('022111', 'Malosco', '022', 6, '2023-02-27 18:49:07', 'E866');
INSERT INTO `comuni` VALUES ('022112', 'Massimeno', '022', 8, '2023-02-27 18:49:07', 'F045');
INSERT INTO `comuni` VALUES ('022113', 'Mazzin', '022', 11, '2023-02-27 18:49:07', 'F068');
INSERT INTO `comuni` VALUES ('022114', 'Mezzana', '022', 7, '2023-02-27 18:49:07', 'F168');
INSERT INTO `comuni` VALUES ('022115', 'Mezzano', '022', 2, '2023-02-27 18:49:07', 'F176');
INSERT INTO `comuni` VALUES ('022116', 'Mezzocorona', '022', 13, '2023-02-27 18:49:07', 'F183');
INSERT INTO `comuni` VALUES ('022117', 'Mezzolombardo', '022', 13, '2023-02-27 18:49:07', 'F187');
INSERT INTO `comuni` VALUES ('022118', 'Moena', '022', 11, '2023-02-27 18:49:07', 'F263');
INSERT INTO `comuni` VALUES ('022120', 'Molveno', '022', 14, '2023-02-27 18:49:07', 'F307');
INSERT INTO `comuni` VALUES ('022121', 'Monclassico', '022', 7, '2023-02-27 18:49:07', 'F341');
INSERT INTO `comuni` VALUES ('022122', 'Montagne', '022', 8, '2023-02-27 18:49:07', 'F396');
INSERT INTO `comuni` VALUES ('022123', 'Mori', '022', 10, '2023-02-27 18:49:07', 'F728');
INSERT INTO `comuni` VALUES ('022124', 'Nago-Torbole', '022', 9, '2023-02-27 18:49:07', 'F835');
INSERT INTO `comuni` VALUES ('022125', 'Nanno', '022', 6, '2023-02-27 18:49:07', 'F837');
INSERT INTO `comuni` VALUES ('022126', 'Nave San Rocco', '022', 13, '2023-02-27 18:49:07', 'F853');
INSERT INTO `comuni` VALUES ('022127', 'Nogaredo', '022', 10, '2023-02-27 18:49:07', 'F920');
INSERT INTO `comuni` VALUES ('022128', 'Nomi', '022', 10, '2023-02-27 18:49:07', 'F929');
INSERT INTO `comuni` VALUES ('022129', 'Novaledo', '022', 3, '2023-02-27 18:49:07', 'F947');
INSERT INTO `comuni` VALUES ('022130', 'Ospedaletto', '022', 3, '2023-02-27 18:49:07', 'G168');
INSERT INTO `comuni` VALUES ('022131', 'Ossana', '022', 7, '2023-02-27 18:49:07', 'G173');
INSERT INTO `comuni` VALUES ('022132', 'Padergnone', '022', 15, '2023-02-27 18:49:07', 'G214');
INSERT INTO `comuni` VALUES ('022133', 'Palù del Fersina', '022', 4, '2023-02-27 18:49:07', 'G296');
INSERT INTO `comuni` VALUES ('022134', 'Panchià', '022', 1, '2023-02-27 18:49:07', 'G305');
INSERT INTO `comuni` VALUES ('022135', 'Ronzo-Chienis', '022', 10, '2023-02-27 18:49:07', 'M303');
INSERT INTO `comuni` VALUES ('022136', 'Peio', '022', 7, '2023-02-27 18:49:07', 'G419');
INSERT INTO `comuni` VALUES ('022137', 'Pellizzano', '022', 7, '2023-02-27 18:49:07', 'G428');
INSERT INTO `comuni` VALUES ('022138', 'Pelugo', '022', 8, '2023-02-27 18:49:07', 'G429');
INSERT INTO `comuni` VALUES ('022139', 'Pergine Valsugana', '022', 4, '2023-02-27 18:49:07', 'G452');
INSERT INTO `comuni` VALUES ('022140', 'Pieve di Bono', '022', 8, '2023-02-27 18:49:07', 'G641');
INSERT INTO `comuni` VALUES ('022142', 'Pieve Tesino', '022', 3, '2023-02-27 18:49:07', 'G656');
INSERT INTO `comuni` VALUES ('022143', 'Pinzolo', '022', 8, '2023-02-27 18:49:07', 'G681');
INSERT INTO `comuni` VALUES ('022144', 'Pomarolo', '022', 10, '2023-02-27 18:49:07', 'G808');
INSERT INTO `comuni` VALUES ('022145', 'Pozza di Fassa', '022', 11, '2023-02-27 18:49:07', 'G950');
INSERT INTO `comuni` VALUES ('022146', 'Praso', '022', 8, '2023-02-27 18:49:07', 'G989');
INSERT INTO `comuni` VALUES ('022147', 'Predazzo', '022', 1, '2023-02-27 18:49:07', 'H018');
INSERT INTO `comuni` VALUES ('022148', 'Preore', '022', 8, '2023-02-27 18:49:07', 'H039');
INSERT INTO `comuni` VALUES ('022149', 'Prezzo', '022', 8, '2023-02-27 18:49:07', 'H057');
INSERT INTO `comuni` VALUES ('022150', 'Rabbi', '022', 7, '2023-02-27 18:49:07', 'H146');
INSERT INTO `comuni` VALUES ('022151', 'Ragoli', '022', 8, '2023-02-27 18:49:07', 'H162');
INSERT INTO `comuni` VALUES ('022152', 'Revò', '022', 6, '2023-02-27 18:49:07', 'H254');
INSERT INTO `comuni` VALUES ('022153', 'Riva del Garda', '022', 9, '2023-02-27 18:49:07', 'H330');
INSERT INTO `comuni` VALUES ('022154', 'Romallo', '022', 6, '2023-02-27 18:49:07', 'H506');
INSERT INTO `comuni` VALUES ('022155', 'Romeno', '022', 6, '2023-02-27 18:49:07', 'H517');
INSERT INTO `comuni` VALUES ('022156', 'Roncegno Terme', '022', 3, '2023-02-27 18:49:07', 'H528');
INSERT INTO `comuni` VALUES ('022157', 'Ronchi Valsugana', '022', 3, '2023-02-27 18:49:07', 'H532');
INSERT INTO `comuni` VALUES ('022158', 'Roncone', '022', 8, '2023-02-27 18:49:07', 'H545');
INSERT INTO `comuni` VALUES ('022159', 'Ronzone', '022', 6, '2023-02-27 18:49:07', 'H552');
INSERT INTO `comuni` VALUES ('022160', 'Roverè della Luna', '022', 13, '2023-02-27 18:49:07', 'H607');
INSERT INTO `comuni` VALUES ('022161', 'Rovereto', '022', 10, '2023-02-27 18:49:07', 'H612');
INSERT INTO `comuni` VALUES ('022162', 'Ruffrè-Mendola', '022', 6, '2023-02-27 18:49:07', 'H634');
INSERT INTO `comuni` VALUES ('022163', 'Rumo', '022', 6, '2023-02-27 18:49:07', 'H639');
INSERT INTO `comuni` VALUES ('022164', 'Sagron Mis', '022', 2, '2023-02-27 18:49:07', 'H666');
INSERT INTO `comuni` VALUES ('022165', 'Samone', '022', 3, '2023-02-27 18:49:07', 'H754');
INSERT INTO `comuni` VALUES ('022166', 'San Lorenzo in Banale', '022', 8, '2023-02-27 18:49:07', 'H966');
INSERT INTO `comuni` VALUES ('022167', 'San Michele all\'Adige', '022', 13, '2023-02-27 18:49:07', 'I042');
INSERT INTO `comuni` VALUES ('022168', 'Sant\'Orsola Terme', '022', 4, '2023-02-27 18:49:07', 'I354');
INSERT INTO `comuni` VALUES ('022169', 'Sanzeno', '022', 6, '2023-02-27 18:49:07', 'I411');
INSERT INTO `comuni` VALUES ('022170', 'Sarnonico', '022', 6, '2023-02-27 18:49:07', 'I439');
INSERT INTO `comuni` VALUES ('022171', 'Scurelle', '022', 3, '2023-02-27 18:49:07', 'I554');
INSERT INTO `comuni` VALUES ('022172', 'Segonzano', '022', 5, '2023-02-27 18:49:07', 'I576');
INSERT INTO `comuni` VALUES ('022173', 'Sfruz', '022', 6, '2023-02-27 18:49:07', 'I714');
INSERT INTO `comuni` VALUES ('022174', 'Siror', '022', 2, '2023-02-27 18:49:07', 'I760');
INSERT INTO `comuni` VALUES ('022175', 'Smarano', '022', 6, '2023-02-27 18:49:07', 'I772');
INSERT INTO `comuni` VALUES ('022176', 'Soraga', '022', 11, '2023-02-27 18:49:07', 'I839');
INSERT INTO `comuni` VALUES ('022177', 'Sover', '022', 5, '2023-02-27 18:49:07', 'I871');
INSERT INTO `comuni` VALUES ('022178', 'Spera', '022', 3, '2023-02-27 18:49:07', 'I889');
INSERT INTO `comuni` VALUES ('022179', 'Spiazzo', '022', 8, '2023-02-27 18:49:07', 'I899');
INSERT INTO `comuni` VALUES ('022180', 'Spormaggiore', '022', 14, '2023-02-27 18:49:07', 'I924');
INSERT INTO `comuni` VALUES ('022181', 'Sporminore', '022', 6, '2023-02-27 18:49:07', 'I925');
INSERT INTO `comuni` VALUES ('022182', 'Stenico', '022', 8, '2023-02-27 18:49:07', 'I949');
INSERT INTO `comuni` VALUES ('022183', 'Storo', '022', 8, '2023-02-27 18:49:07', 'I964');
INSERT INTO `comuni` VALUES ('022184', 'Strembo', '022', 8, '2023-02-27 18:49:07', 'I975');
INSERT INTO `comuni` VALUES ('022185', 'Strigno', '022', 3, '2023-02-27 18:49:07', 'I979');
INSERT INTO `comuni` VALUES ('022186', 'Taio', '022', 6, '2023-02-27 18:49:07', 'L033');
INSERT INTO `comuni` VALUES ('022187', 'Tassullo', '022', 6, '2023-02-27 18:49:07', 'L060');
INSERT INTO `comuni` VALUES ('022188', 'Telve', '022', 3, '2023-02-27 18:49:07', 'L089');
INSERT INTO `comuni` VALUES ('022189', 'Telve di Sopra', '022', 3, '2023-02-27 18:49:07', 'L090');
INSERT INTO `comuni` VALUES ('022190', 'Tenna', '022', 4, '2023-02-27 18:49:07', 'L096');
INSERT INTO `comuni` VALUES ('022191', 'Tenno', '022', 9, '2023-02-27 18:49:07', 'L097');
INSERT INTO `comuni` VALUES ('022192', 'Terlago', '022', 15, '2023-02-27 18:49:07', 'L107');
INSERT INTO `comuni` VALUES ('022193', 'Terragnolo', '022', 10, '2023-02-27 18:49:07', 'L121');
INSERT INTO `comuni` VALUES ('022194', 'Terres', '022', 6, '2023-02-27 18:49:07', 'L137');
INSERT INTO `comuni` VALUES ('022195', 'Terzolas', '022', 7, '2023-02-27 18:49:07', 'L145');
INSERT INTO `comuni` VALUES ('022196', 'Tesero', '022', 1, '2023-02-27 18:49:07', 'L147');
INSERT INTO `comuni` VALUES ('022199', 'Tione di Trento', '022', 8, '2023-02-27 18:49:07', 'L174');
INSERT INTO `comuni` VALUES ('022200', 'Ton', '022', 6, '2023-02-27 18:49:07', 'L200');
INSERT INTO `comuni` VALUES ('022201', 'Tonadico', '022', 2, '2023-02-27 18:49:07', 'L201');
INSERT INTO `comuni` VALUES ('022202', 'Torcegno', '022', 3, '2023-02-27 18:49:07', 'L211');
INSERT INTO `comuni` VALUES ('022203', 'Trambileno', '022', 10, '2023-02-27 18:49:07', 'L322');
INSERT INTO `comuni` VALUES ('022204', 'Transacqua', '022', 2, '2023-02-27 18:49:07', 'L329');
INSERT INTO `comuni` VALUES ('022205', 'Trento', '022', 16, '2023-02-27 18:49:07', 'L378');
INSERT INTO `comuni` VALUES ('022206', 'Tres', '022', 6, '2023-02-27 18:49:07', 'L385');
INSERT INTO `comuni` VALUES ('022207', 'Tuenno', '022', 6, '2023-02-27 18:49:07', 'L457');
INSERT INTO `comuni` VALUES ('022208', 'Valda', '022', 5, '2023-02-27 18:49:07', 'L550');
INSERT INTO `comuni` VALUES ('022209', 'Valfloriana', '022', 1, '2023-02-27 18:49:07', 'L575');
INSERT INTO `comuni` VALUES ('022210', 'Vallarsa', '022', 10, '2023-02-27 18:49:07', 'L588');
INSERT INTO `comuni` VALUES ('022211', 'Varena', '022', 1, '2023-02-27 18:49:07', 'L678');
INSERT INTO `comuni` VALUES ('022212', 'Vattaro', '022', 4, '2023-02-27 18:49:07', 'L697');
INSERT INTO `comuni` VALUES ('022213', 'Vermiglio', '022', 7, '2023-02-27 18:49:07', 'L769');
INSERT INTO `comuni` VALUES ('022214', 'Vervò', '022', 6, '2023-02-27 18:49:07', 'L800');
INSERT INTO `comuni` VALUES ('022215', 'Vezzano', '022', 15, '2023-02-27 18:49:07', 'L821');
INSERT INTO `comuni` VALUES ('022216', 'Vignola-Falesina', '022', 4, '2023-02-27 18:49:07', 'L886');
INSERT INTO `comuni` VALUES ('022217', 'Vigo di Fassa', '022', 11, '2023-02-27 18:49:07', 'L893');
INSERT INTO `comuni` VALUES ('022219', 'Vigolo Vattaro', '022', 4, '2023-02-27 18:49:07', 'L896');
INSERT INTO `comuni` VALUES ('022220', 'Porte Rendena', '022', 8, '2023-02-27 18:49:07', 'L903');
INSERT INTO `comuni` VALUES ('022221', 'Villa Agnedo', '022', 3, '2023-02-27 18:49:07', 'L910');
INSERT INTO `comuni` VALUES ('022222', 'Villa Lagarina', '022', 10, '2023-02-27 18:49:07', 'L957');
INSERT INTO `comuni` VALUES ('022223', 'Villa Rendena', '022', 8, '2023-02-27 18:49:07', 'M006');
INSERT INTO `comuni` VALUES ('022224', 'Volano', '022', 10, '2023-02-27 18:49:07', 'M113');
INSERT INTO `comuni` VALUES ('022225', 'Zambana', '022', 13, '2023-02-27 18:49:07', 'M142');
INSERT INTO `comuni` VALUES ('022226', 'Ziano di Fiemme', '022', 1, '2023-02-27 18:49:07', 'M173');
INSERT INTO `comuni` VALUES ('022227', 'Zuclo', '022', 8, '2023-02-27 18:49:07', 'M198');
INSERT INTO `comuni` VALUES ('022228', 'Comano Terme', '022', 8, '2023-02-27 18:49:07', 'M314');
INSERT INTO `comuni` VALUES ('022229', 'Ledro', '022', 9, '2023-02-27 18:49:07', 'M313');
INSERT INTO `comuni` VALUES ('022230', 'Predaia', '022', 999, '2023-02-27 18:49:07', 'M344');
INSERT INTO `comuni` VALUES ('022231', 'San Lorenzo Dorsino', '022', 999, '2023-02-27 18:49:07', 'M345');
INSERT INTO `comuni` VALUES ('022232', 'Valdaone', '022', 999, '2023-02-27 18:49:07', 'M343');
INSERT INTO `comuni` VALUES ('022233', 'Dimaro Folgarida', '022', 999, '2023-02-27 18:49:07', 'M366');
INSERT INTO `comuni` VALUES ('022234', 'Pieve di Bono-Prezzo', '022', 999, '2023-02-27 18:49:07', 'M365');
INSERT INTO `comuni` VALUES ('022235', 'Altavalle', '022', 999, '2023-02-27 18:49:07', 'M349');
INSERT INTO `comuni` VALUES ('022236', 'Altopiano della Vigolana', '022', 999, '2023-02-27 18:49:07', 'M350');
INSERT INTO `comuni` VALUES ('022237', 'Amblar-Don', '022', 999, '2023-02-27 18:49:07', 'M351');
INSERT INTO `comuni` VALUES ('022238', 'Borgo Chiese', '022', 999, '2023-02-27 18:49:07', 'M352');
INSERT INTO `comuni` VALUES ('022239', 'Borgo Lares', '022', 999, '2023-02-27 18:49:07', 'M353');
INSERT INTO `comuni` VALUES ('022240', 'Castel Ivano', '022', 999, '2023-02-27 18:49:07', 'M354');
INSERT INTO `comuni` VALUES ('022241', 'Cembra Lisignago', '022', 999, '2023-02-27 18:49:07', 'M355');
INSERT INTO `comuni` VALUES ('022242', 'Contà', '022', 999, '2023-02-27 18:49:07', 'M356');
INSERT INTO `comuni` VALUES ('022243', 'Madruzzo', '022', 999, '2023-02-27 18:49:07', 'M357');
INSERT INTO `comuni` VALUES ('022244', 'Porte di Rendena', '022', 999, '2023-02-27 18:49:07', 'M358');
INSERT INTO `comuni` VALUES ('022245', 'Primiero San Martino di Castrozza', '022', 2, '2023-02-27 18:49:07', 'M359');
INSERT INTO `comuni` VALUES ('022246', 'Sella Giudicarie', '022', 999, '2023-02-27 18:49:07', 'M360');
INSERT INTO `comuni` VALUES ('022247', 'Tre Ville', '022', 999, '2023-02-27 18:49:07', 'M361');
INSERT INTO `comuni` VALUES ('022248', 'Vallelaghi', '022', 999, '2023-02-27 18:49:07', 'M362');
INSERT INTO `comuni` VALUES ('022249', 'Ville d\'Anaunia', '022', 999, '2023-02-27 18:49:07', 'M363');
INSERT INTO `comuni` VALUES ('022250', 'San Giovanni di Fassa-Sèn Jan', '022', 999, '2023-02-27 18:49:07', 'M390');
INSERT INTO `comuni` VALUES ('022251', 'Terre d\'Adige', '022', 999, '2023-02-27 18:49:07', 'M407');
INSERT INTO `comuni` VALUES ('022252', 'Borgo d\'Anaunia', '022', 999, '2023-02-27 18:49:07', 'M429');
INSERT INTO `comuni` VALUES ('022253', 'Novella', '022', 999, '2023-02-27 18:49:07', 'M430');
INSERT INTO `comuni` VALUES ('022254', 'Ville di Fiemme', '022', 999, '2023-02-27 18:49:07', 'M431');
INSERT INTO `comuni` VALUES ('023001', 'Affi', '023', NULL, '2023-02-27 18:49:07', 'A061');
INSERT INTO `comuni` VALUES ('023002', 'Albaredo d\'Adige', '023', NULL, '2023-02-27 18:49:07', 'A137');
INSERT INTO `comuni` VALUES ('023003', 'Angiari', '023', NULL, '2023-02-27 18:49:07', 'A292');
INSERT INTO `comuni` VALUES ('023004', 'Arcole', '023', NULL, '2023-02-27 18:49:07', 'A374');
INSERT INTO `comuni` VALUES ('023005', 'Badia Calavena', '023', NULL, '2023-02-27 18:49:07', 'A540');
INSERT INTO `comuni` VALUES ('023006', 'Bardolino', '023', NULL, '2023-02-27 18:49:07', 'A650');
INSERT INTO `comuni` VALUES ('023007', 'Belfiore', '023', NULL, '2023-02-27 18:49:07', 'A737');
INSERT INTO `comuni` VALUES ('023008', 'Bevilacqua', '023', NULL, '2023-02-27 18:49:07', 'A837');
INSERT INTO `comuni` VALUES ('023009', 'Bonavigo', '023', NULL, '2023-02-27 18:49:07', 'A964');
INSERT INTO `comuni` VALUES ('023010', 'Boschi Sant\'Anna', '023', NULL, '2023-02-27 18:49:07', 'B070');
INSERT INTO `comuni` VALUES ('023011', 'Bosco Chiesanuova', '023', NULL, '2023-02-27 18:49:07', 'B073');
INSERT INTO `comuni` VALUES ('023012', 'Bovolone', '023', NULL, '2023-02-27 18:49:07', 'B107');
INSERT INTO `comuni` VALUES ('023013', 'Brentino Belluno', '023', NULL, '2023-02-27 18:49:07', 'B152');
INSERT INTO `comuni` VALUES ('023014', 'Brenzone', '023', NULL, '2023-02-27 18:49:07', 'B154');
INSERT INTO `comuni` VALUES ('023015', 'Bussolengo', '023', NULL, '2023-02-27 18:49:07', 'B296');
INSERT INTO `comuni` VALUES ('023016', 'Buttapietra', '023', NULL, '2023-02-27 18:49:07', 'B304');
INSERT INTO `comuni` VALUES ('023017', 'Caldiero', '023', NULL, '2023-02-27 18:49:07', 'B402');
INSERT INTO `comuni` VALUES ('023018', 'Caprino Veronese', '023', NULL, '2023-02-27 18:49:07', 'B709');
INSERT INTO `comuni` VALUES ('023019', 'Casaleone', '023', NULL, '2023-02-27 18:49:07', 'B886');
INSERT INTO `comuni` VALUES ('023020', 'Castagnaro', '023', NULL, '2023-02-27 18:49:07', 'C041');
INSERT INTO `comuni` VALUES ('023021', 'Castel d\'Azzano', '023', NULL, '2023-02-27 18:49:07', 'C078');
INSERT INTO `comuni` VALUES ('023022', 'Castelnuovo del Garda', '023', NULL, '2023-02-27 18:49:07', 'C225');
INSERT INTO `comuni` VALUES ('023023', 'Cavaion Veronese', '023', NULL, '2023-02-27 18:49:07', 'C370');
INSERT INTO `comuni` VALUES ('023024', 'Cazzano di Tramigna', '023', NULL, '2023-02-27 18:49:07', 'C412');
INSERT INTO `comuni` VALUES ('023025', 'Cerea', '023', NULL, '2023-02-27 18:49:07', 'C498');
INSERT INTO `comuni` VALUES ('023026', 'Cerro Veronese', '023', NULL, '2023-02-27 18:49:07', 'C538');
INSERT INTO `comuni` VALUES ('023027', 'Cologna Veneta', '023', NULL, '2023-02-27 18:49:07', 'C890');
INSERT INTO `comuni` VALUES ('023028', 'Colognola ai Colli', '023', NULL, '2023-02-27 18:49:07', 'C897');
INSERT INTO `comuni` VALUES ('023029', 'Concamarise', '023', NULL, '2023-02-27 18:49:07', 'C943');
INSERT INTO `comuni` VALUES ('023030', 'Costermano', '023', NULL, '2023-02-27 18:49:07', 'D118');
INSERT INTO `comuni` VALUES ('023031', 'Dolcè', '023', NULL, '2023-02-27 18:49:07', 'D317');
INSERT INTO `comuni` VALUES ('023032', 'Erbè', '023', NULL, '2023-02-27 18:49:07', 'D419');
INSERT INTO `comuni` VALUES ('023033', 'Erbezzo', '023', NULL, '2023-02-27 18:49:07', 'D420');
INSERT INTO `comuni` VALUES ('023034', 'Ferrara di Monte Baldo', '023', NULL, '2023-02-27 18:49:07', 'D549');
INSERT INTO `comuni` VALUES ('023035', 'Fumane', '023', NULL, '2023-02-27 18:49:07', 'D818');
INSERT INTO `comuni` VALUES ('023036', 'Garda', '023', NULL, '2023-02-27 18:49:07', 'D915');
INSERT INTO `comuni` VALUES ('023037', 'Gazzo Veronese', '023', NULL, '2023-02-27 18:49:07', 'D957');
INSERT INTO `comuni` VALUES ('023038', 'Grezzana', '023', NULL, '2023-02-27 18:49:07', 'E171');
INSERT INTO `comuni` VALUES ('023039', 'Illasi', '023', NULL, '2023-02-27 18:49:07', 'E284');
INSERT INTO `comuni` VALUES ('023040', 'Isola della Scala', '023', NULL, '2023-02-27 18:49:07', 'E349');
INSERT INTO `comuni` VALUES ('023041', 'Isola Rizza', '023', NULL, '2023-02-27 18:49:07', 'E358');
INSERT INTO `comuni` VALUES ('023042', 'Lavagno', '023', NULL, '2023-02-27 18:49:07', 'E489');
INSERT INTO `comuni` VALUES ('023043', 'Lazise', '023', NULL, '2023-02-27 18:49:07', 'E502');
INSERT INTO `comuni` VALUES ('023044', 'Legnago', '023', NULL, '2023-02-27 18:49:07', 'E512');
INSERT INTO `comuni` VALUES ('023045', 'Malcesine', '023', NULL, '2023-02-27 18:49:07', 'E848');
INSERT INTO `comuni` VALUES ('023046', 'Marano di Valpolicella', '023', NULL, '2023-02-27 18:49:07', 'E911');
INSERT INTO `comuni` VALUES ('023047', 'Mezzane di Sotto', '023', NULL, '2023-02-27 18:49:07', 'F172');
INSERT INTO `comuni` VALUES ('023048', 'Minerbe', '023', NULL, '2023-02-27 18:49:07', 'F218');
INSERT INTO `comuni` VALUES ('023049', 'Montecchia di Crosara', '023', NULL, '2023-02-27 18:49:07', 'F461');
INSERT INTO `comuni` VALUES ('023050', 'Monteforte d\'Alpone', '023', NULL, '2023-02-27 18:49:07', 'F508');
INSERT INTO `comuni` VALUES ('023051', 'Mozzecane', '023', NULL, '2023-02-27 18:49:07', 'F789');
INSERT INTO `comuni` VALUES ('023052', 'Negrar', '023', NULL, '2023-02-27 18:49:07', 'F861');
INSERT INTO `comuni` VALUES ('023053', 'Nogara', '023', NULL, '2023-02-27 18:49:07', 'F918');
INSERT INTO `comuni` VALUES ('023054', 'Nogarole Rocca', '023', NULL, '2023-02-27 18:49:07', 'F921');
INSERT INTO `comuni` VALUES ('023055', 'Oppeano', '023', NULL, '2023-02-27 18:49:07', 'G080');
INSERT INTO `comuni` VALUES ('023056', 'Palù', '023', NULL, '2023-02-27 18:49:07', 'G297');
INSERT INTO `comuni` VALUES ('023057', 'Pastrengo', '023', NULL, '2023-02-27 18:49:07', 'G365');
INSERT INTO `comuni` VALUES ('023058', 'Pescantina', '023', NULL, '2023-02-27 18:49:07', 'G481');
INSERT INTO `comuni` VALUES ('023059', 'Peschiera del Garda', '023', NULL, '2023-02-27 18:49:07', 'G489');
INSERT INTO `comuni` VALUES ('023060', 'Povegliano Veronese', '023', NULL, '2023-02-27 18:49:07', 'G945');
INSERT INTO `comuni` VALUES ('023061', 'Pressana', '023', NULL, '2023-02-27 18:49:07', 'H048');
INSERT INTO `comuni` VALUES ('023062', 'Rivoli Veronese', '023', NULL, '2023-02-27 18:49:07', 'H356');
INSERT INTO `comuni` VALUES ('023063', 'Roncà', '023', NULL, '2023-02-27 18:49:07', 'H522');
INSERT INTO `comuni` VALUES ('023064', 'Ronco all\'Adige', '023', NULL, '2023-02-27 18:49:07', 'H540');
INSERT INTO `comuni` VALUES ('023065', 'Roverchiara', '023', NULL, '2023-02-27 18:49:07', 'H606');
INSERT INTO `comuni` VALUES ('023066', 'Roveredo di Guà', '023', NULL, '2023-02-27 18:49:07', 'H610');
INSERT INTO `comuni` VALUES ('023067', 'Roverè Veronese', '023', NULL, '2023-02-27 18:49:07', 'H608');
INSERT INTO `comuni` VALUES ('023068', 'Salizzole', '023', NULL, '2023-02-27 18:49:07', 'H714');
INSERT INTO `comuni` VALUES ('023069', 'San Bonifacio', '023', NULL, '2023-02-27 18:49:07', 'H783');
INSERT INTO `comuni` VALUES ('023070', 'San Giovanni Ilarione', '023', NULL, '2023-02-27 18:49:07', 'H916');
INSERT INTO `comuni` VALUES ('023071', 'San Giovanni Lupatoto', '023', NULL, '2023-02-27 18:49:07', 'H924');
INSERT INTO `comuni` VALUES ('023072', 'Sanguinetto', '023', NULL, '2023-02-27 18:49:07', 'H944');
INSERT INTO `comuni` VALUES ('023073', 'San Martino Buon Albergo', '023', NULL, '2023-02-27 18:49:07', 'I003');
INSERT INTO `comuni` VALUES ('023074', 'San Mauro di Saline', '023', NULL, '2023-02-27 18:49:07', 'H712');
INSERT INTO `comuni` VALUES ('023075', 'San Pietro di Morubio', '023', NULL, '2023-02-27 18:49:07', 'I105');
INSERT INTO `comuni` VALUES ('023076', 'San Pietro in Cariano', '023', NULL, '2023-02-27 18:49:07', 'I109');
INSERT INTO `comuni` VALUES ('023077', 'Sant\'Ambrogio di Valpolicella', '023', NULL, '2023-02-27 18:49:07', 'I259');
INSERT INTO `comuni` VALUES ('023078', 'Sant\'Anna d\'Alfaedo', '023', NULL, '2023-02-27 18:49:07', 'I292');
INSERT INTO `comuni` VALUES ('023079', 'San Zeno di Montagna', '023', NULL, '2023-02-27 18:49:07', 'I414');
INSERT INTO `comuni` VALUES ('023080', 'Selva di Progno', '023', NULL, '2023-02-27 18:49:07', 'I594');
INSERT INTO `comuni` VALUES ('023081', 'Soave', '023', NULL, '2023-02-27 18:49:07', 'I775');
INSERT INTO `comuni` VALUES ('023082', 'Sommacampagna', '023', NULL, '2023-02-27 18:49:07', 'I821');
INSERT INTO `comuni` VALUES ('023083', 'Sona', '023', NULL, '2023-02-27 18:49:07', 'I826');
INSERT INTO `comuni` VALUES ('023084', 'Sorgà', '023', NULL, '2023-02-27 18:49:07', 'I850');
INSERT INTO `comuni` VALUES ('023085', 'Terrazzo', '023', NULL, '2023-02-27 18:49:07', 'L136');
INSERT INTO `comuni` VALUES ('023086', 'Torri del Benaco', '023', NULL, '2023-02-27 18:49:07', 'L287');
INSERT INTO `comuni` VALUES ('023087', 'Tregnago', '023', NULL, '2023-02-27 18:49:07', 'L364');
INSERT INTO `comuni` VALUES ('023088', 'Trevenzuolo', '023', NULL, '2023-02-27 18:49:07', 'L396');
INSERT INTO `comuni` VALUES ('023089', 'Valeggio sul Mincio', '023', NULL, '2023-02-27 18:49:07', 'L567');
INSERT INTO `comuni` VALUES ('023090', 'Velo Veronese', '023', NULL, '2023-02-27 18:49:07', 'L722');
INSERT INTO `comuni` VALUES ('023091', 'Verona', '023', NULL, '2023-02-27 18:49:07', 'L781');
INSERT INTO `comuni` VALUES ('023092', 'Veronella', '023', NULL, '2023-02-27 18:49:07', 'D193');
INSERT INTO `comuni` VALUES ('023093', 'Vestenanova', '023', NULL, '2023-02-27 18:49:07', 'L810');
INSERT INTO `comuni` VALUES ('023094', 'Vigasio', '023', NULL, '2023-02-27 18:49:07', 'L869');
INSERT INTO `comuni` VALUES ('023095', 'Villa Bartolomea', '023', NULL, '2023-02-27 18:49:07', 'L912');
INSERT INTO `comuni` VALUES ('023096', 'Villafranca di Verona', '023', NULL, '2023-02-27 18:49:07', 'L949');
INSERT INTO `comuni` VALUES ('023097', 'Zevio', '023', NULL, '2023-02-27 18:49:07', 'M172');
INSERT INTO `comuni` VALUES ('023098', 'Zimella', '023', NULL, '2023-02-27 18:49:07', 'M178');
INSERT INTO `comuni` VALUES ('024001', 'Agugliaro', '024', NULL, '2023-02-27 18:49:07', 'A093');
INSERT INTO `comuni` VALUES ('024002', 'Albettone', '024', NULL, '2023-02-27 18:49:07', 'A154');
INSERT INTO `comuni` VALUES ('024003', 'Alonte', '024', NULL, '2023-02-27 18:49:07', 'A220');
INSERT INTO `comuni` VALUES ('024004', 'Altavilla Vicentina', '024', NULL, '2023-02-27 18:49:07', 'A231');
INSERT INTO `comuni` VALUES ('024005', 'Altissimo', '024', NULL, '2023-02-27 18:49:07', 'A236');
INSERT INTO `comuni` VALUES ('024006', 'Arcugnano', '024', NULL, '2023-02-27 18:49:07', 'A377');
INSERT INTO `comuni` VALUES ('024007', 'Arsiero', '024', NULL, '2023-02-27 18:49:07', 'A444');
INSERT INTO `comuni` VALUES ('024008', 'Arzignano', '024', NULL, '2023-02-27 18:49:07', 'A459');
INSERT INTO `comuni` VALUES ('024009', 'Asiago', '024', NULL, '2023-02-27 18:49:07', 'A465');
INSERT INTO `comuni` VALUES ('024010', 'Asigliano Veneto', '024', NULL, '2023-02-27 18:49:07', 'A467');
INSERT INTO `comuni` VALUES ('024011', 'Barbarano Vicentino', '024', NULL, '2023-02-27 18:49:07', 'A627');
INSERT INTO `comuni` VALUES ('024012', 'Bassano del Grappa', '024', NULL, '2023-02-27 18:49:07', 'A703');
INSERT INTO `comuni` VALUES ('024013', 'Bolzano Vicentino', '024', NULL, '2023-02-27 18:49:07', 'A954');
INSERT INTO `comuni` VALUES ('024014', 'Breganze', '024', NULL, '2023-02-27 18:49:07', 'B132');
INSERT INTO `comuni` VALUES ('024015', 'Brendola', '024', NULL, '2023-02-27 18:49:07', 'B143');
INSERT INTO `comuni` VALUES ('024016', 'Bressanvido', '024', NULL, '2023-02-27 18:49:07', 'B161');
INSERT INTO `comuni` VALUES ('024017', 'Brogliano', '024', NULL, '2023-02-27 18:49:07', 'B196');
INSERT INTO `comuni` VALUES ('024018', 'Caldogno', '024', NULL, '2023-02-27 18:49:07', 'B403');
INSERT INTO `comuni` VALUES ('024019', 'Caltrano', '024', NULL, '2023-02-27 18:49:07', 'B433');
INSERT INTO `comuni` VALUES ('024020', 'Calvene', '024', NULL, '2023-02-27 18:49:07', 'B441');
INSERT INTO `comuni` VALUES ('024021', 'Camisano Vicentino', '024', NULL, '2023-02-27 18:49:07', 'B485');
INSERT INTO `comuni` VALUES ('024022', 'Campiglia dei Berici', '024', NULL, '2023-02-27 18:49:07', 'B511');
INSERT INTO `comuni` VALUES ('024023', 'Campolongo sul Brenta', '024', NULL, '2023-02-27 18:49:07', 'B547');
INSERT INTO `comuni` VALUES ('024024', 'Carrè', '024', NULL, '2023-02-27 18:49:07', 'B835');
INSERT INTO `comuni` VALUES ('024025', 'Cartigliano', '024', NULL, '2023-02-27 18:49:07', 'B844');
INSERT INTO `comuni` VALUES ('024026', 'Cassola', '024', NULL, '2023-02-27 18:49:07', 'C037');
INSERT INTO `comuni` VALUES ('024027', 'Castegnero', '024', NULL, '2023-02-27 18:49:07', 'C056');
INSERT INTO `comuni` VALUES ('024028', 'Castelgomberto', '024', NULL, '2023-02-27 18:49:07', 'C119');
INSERT INTO `comuni` VALUES ('024029', 'Chiampo', '024', NULL, '2023-02-27 18:49:07', 'C605');
INSERT INTO `comuni` VALUES ('024030', 'Chiuppano', '024', NULL, '2023-02-27 18:49:07', 'C650');
INSERT INTO `comuni` VALUES ('024031', 'Cismon del Grappa', '024', NULL, '2023-02-27 18:49:07', 'C734');
INSERT INTO `comuni` VALUES ('024032', 'Cogollo del Cengio', '024', NULL, '2023-02-27 18:49:07', 'C824');
INSERT INTO `comuni` VALUES ('024033', 'Conco', '024', NULL, '2023-02-27 18:49:07', 'C949');
INSERT INTO `comuni` VALUES ('024034', 'Cornedo Vicentino', '024', NULL, '2023-02-27 18:49:07', 'D020');
INSERT INTO `comuni` VALUES ('024035', 'Costabissara', '024', NULL, '2023-02-27 18:49:07', 'D107');
INSERT INTO `comuni` VALUES ('024036', 'Creazzo', '024', NULL, '2023-02-27 18:49:07', 'D136');
INSERT INTO `comuni` VALUES ('024037', 'Crespadoro', '024', NULL, '2023-02-27 18:49:07', 'D156');
INSERT INTO `comuni` VALUES ('024038', 'Dueville', '024', NULL, '2023-02-27 18:49:07', 'D379');
INSERT INTO `comuni` VALUES ('024039', 'Enego', '024', NULL, '2023-02-27 18:49:07', 'D407');
INSERT INTO `comuni` VALUES ('024040', 'Fara Vicentino', '024', NULL, '2023-02-27 18:49:07', 'D496');
INSERT INTO `comuni` VALUES ('024041', 'Foza', '024', NULL, '2023-02-27 18:49:07', 'D750');
INSERT INTO `comuni` VALUES ('024042', 'Gallio', '024', NULL, '2023-02-27 18:49:07', 'D882');
INSERT INTO `comuni` VALUES ('024043', 'Gambellara', '024', NULL, '2023-02-27 18:49:07', 'D897');
INSERT INTO `comuni` VALUES ('024044', 'Gambugliano', '024', NULL, '2023-02-27 18:49:07', 'D902');
INSERT INTO `comuni` VALUES ('024045', 'Grancona', '024', NULL, '2023-02-27 18:49:07', 'E138');
INSERT INTO `comuni` VALUES ('024046', 'Grisignano di Zocco', '024', NULL, '2023-02-27 18:49:07', 'E184');
INSERT INTO `comuni` VALUES ('024047', 'Grumolo delle Abbadesse', '024', NULL, '2023-02-27 18:49:07', 'E226');
INSERT INTO `comuni` VALUES ('024048', 'Isola Vicentina', '024', NULL, '2023-02-27 18:49:07', 'E354');
INSERT INTO `comuni` VALUES ('024049', 'Laghi', '024', NULL, '2023-02-27 18:49:07', 'E403');
INSERT INTO `comuni` VALUES ('024050', 'Lastebasse', '024', NULL, '2023-02-27 18:49:07', 'E465');
INSERT INTO `comuni` VALUES ('024051', 'Longare', '024', NULL, '2023-02-27 18:49:07', 'E671');
INSERT INTO `comuni` VALUES ('024052', 'Lonigo', '024', NULL, '2023-02-27 18:49:07', 'E682');
INSERT INTO `comuni` VALUES ('024053', 'Lugo di Vicenza', '024', NULL, '2023-02-27 18:49:07', 'E731');
INSERT INTO `comuni` VALUES ('024054', 'Lusiana', '024', NULL, '2023-02-27 18:49:07', 'E762');
INSERT INTO `comuni` VALUES ('024055', 'Malo', '024', NULL, '2023-02-27 18:49:07', 'E864');
INSERT INTO `comuni` VALUES ('024056', 'Marano Vicentino', '024', NULL, '2023-02-27 18:49:07', 'E912');
INSERT INTO `comuni` VALUES ('024057', 'Marostica', '024', NULL, '2023-02-27 18:49:07', 'E970');
INSERT INTO `comuni` VALUES ('024058', 'Mason Vicentino', '024', NULL, '2023-02-27 18:49:07', 'F019');
INSERT INTO `comuni` VALUES ('024059', 'Molvena', '024', NULL, '2023-02-27 18:49:07', 'F306');
INSERT INTO `comuni` VALUES ('024060', 'Montebello Vicentino', '024', NULL, '2023-02-27 18:49:07', 'F442');
INSERT INTO `comuni` VALUES ('024061', 'Montecchio Maggiore', '024', NULL, '2023-02-27 18:49:07', 'F464');
INSERT INTO `comuni` VALUES ('024062', 'Montecchio Precalcino', '024', NULL, '2023-02-27 18:49:07', 'F465');
INSERT INTO `comuni` VALUES ('024063', 'Monte di Malo', '024', NULL, '2023-02-27 18:49:07', 'F486');
INSERT INTO `comuni` VALUES ('024064', 'Montegalda', '024', NULL, '2023-02-27 18:49:07', 'F514');
INSERT INTO `comuni` VALUES ('024065', 'Montegaldella', '024', NULL, '2023-02-27 18:49:07', 'F515');
INSERT INTO `comuni` VALUES ('024066', 'Monteviale', '024', NULL, '2023-02-27 18:49:07', 'F662');
INSERT INTO `comuni` VALUES ('024067', 'Monticello Conte Otto', '024', NULL, '2023-02-27 18:49:07', 'F675');
INSERT INTO `comuni` VALUES ('024068', 'Montorso Vicentino', '024', NULL, '2023-02-27 18:49:07', 'F696');
INSERT INTO `comuni` VALUES ('024069', 'Mossano', '024', NULL, '2023-02-27 18:49:07', 'F768');
INSERT INTO `comuni` VALUES ('024070', 'Mussolente', '024', NULL, '2023-02-27 18:49:07', 'F829');
INSERT INTO `comuni` VALUES ('024071', 'Nanto', '024', NULL, '2023-02-27 18:49:07', 'F838');
INSERT INTO `comuni` VALUES ('024072', 'Nogarole Vicentino', '024', NULL, '2023-02-27 18:49:07', 'F922');
INSERT INTO `comuni` VALUES ('024073', 'Nove', '024', NULL, '2023-02-27 18:49:07', 'F957');
INSERT INTO `comuni` VALUES ('024074', 'Noventa Vicentina', '024', NULL, '2023-02-27 18:49:07', 'F964');
INSERT INTO `comuni` VALUES ('024075', 'Orgiano', '024', NULL, '2023-02-27 18:49:07', 'G095');
INSERT INTO `comuni` VALUES ('024076', 'Pedemonte', '024', NULL, '2023-02-27 18:49:07', 'G406');
INSERT INTO `comuni` VALUES ('024077', 'Pianezze', '024', NULL, '2023-02-27 18:49:07', 'G560');
INSERT INTO `comuni` VALUES ('024078', 'Piovene Rocchette', '024', NULL, '2023-02-27 18:49:07', 'G694');
INSERT INTO `comuni` VALUES ('024079', 'Pojana Maggiore', '024', NULL, '2023-02-27 18:49:07', 'G776');
INSERT INTO `comuni` VALUES ('024080', 'Posina', '024', NULL, '2023-02-27 18:49:07', 'G931');
INSERT INTO `comuni` VALUES ('024081', 'Pove del Grappa', '024', NULL, '2023-02-27 18:49:07', 'G943');
INSERT INTO `comuni` VALUES ('024082', 'Pozzoleone', '024', NULL, '2023-02-27 18:49:07', 'G957');
INSERT INTO `comuni` VALUES ('024083', 'Quinto Vicentino', '024', NULL, '2023-02-27 18:49:07', 'H134');
INSERT INTO `comuni` VALUES ('024084', 'Recoaro Terme', '024', NULL, '2023-02-27 18:49:07', 'H214');
INSERT INTO `comuni` VALUES ('024085', 'Roana', '024', NULL, '2023-02-27 18:49:07', 'H361');
INSERT INTO `comuni` VALUES ('024086', 'Romano d\'Ezzelino', '024', NULL, '2023-02-27 18:49:07', 'H512');
INSERT INTO `comuni` VALUES ('024087', 'Rosà', '024', NULL, '2023-02-27 18:49:07', 'H556');
INSERT INTO `comuni` VALUES ('024088', 'Rossano Veneto', '024', NULL, '2023-02-27 18:49:07', 'H580');
INSERT INTO `comuni` VALUES ('024089', 'Rotzo', '024', NULL, '2023-02-27 18:49:07', 'H594');
INSERT INTO `comuni` VALUES ('024090', 'Salcedo', '024', NULL, '2023-02-27 18:49:07', 'F810');
INSERT INTO `comuni` VALUES ('024091', 'Sandrigo', '024', NULL, '2023-02-27 18:49:07', 'H829');
INSERT INTO `comuni` VALUES ('024092', 'San Germano dei Berici', '024', NULL, '2023-02-27 18:49:07', 'H863');
INSERT INTO `comuni` VALUES ('024093', 'San Nazario', '024', NULL, '2023-02-27 18:49:07', 'I047');
INSERT INTO `comuni` VALUES ('024094', 'San Pietro Mussolino', '024', NULL, '2023-02-27 18:49:07', 'I117');
INSERT INTO `comuni` VALUES ('024095', 'Santorso', '024', NULL, '2023-02-27 18:49:07', 'I353');
INSERT INTO `comuni` VALUES ('024096', 'San Vito di Leguzzano', '024', NULL, '2023-02-27 18:49:07', 'I401');
INSERT INTO `comuni` VALUES ('024097', 'Sarcedo', '024', NULL, '2023-02-27 18:49:07', 'I425');
INSERT INTO `comuni` VALUES ('024098', 'Sarego', '024', NULL, '2023-02-27 18:49:07', 'I430');
INSERT INTO `comuni` VALUES ('024099', 'Schiavon', '024', NULL, '2023-02-27 18:49:07', 'I527');
INSERT INTO `comuni` VALUES ('024100', 'Schio', '024', NULL, '2023-02-27 18:49:07', 'I531');
INSERT INTO `comuni` VALUES ('024101', 'Solagna', '024', NULL, '2023-02-27 18:49:07', 'I783');
INSERT INTO `comuni` VALUES ('024102', 'Sossano', '024', NULL, '2023-02-27 18:49:07', 'I867');
INSERT INTO `comuni` VALUES ('024103', 'Sovizzo', '024', NULL, '2023-02-27 18:49:07', 'I879');
INSERT INTO `comuni` VALUES ('024104', 'Tezze sul Brenta', '024', NULL, '2023-02-27 18:49:07', 'L156');
INSERT INTO `comuni` VALUES ('024105', 'Thiene', '024', NULL, '2023-02-27 18:49:07', 'L157');
INSERT INTO `comuni` VALUES ('024106', 'Tonezza del Cimone', '024', NULL, '2023-02-27 18:49:07', 'D717');
INSERT INTO `comuni` VALUES ('024107', 'Torrebelvicino', '024', NULL, '2023-02-27 18:49:07', 'L248');
INSERT INTO `comuni` VALUES ('024108', 'Torri di Quartesolo', '024', NULL, '2023-02-27 18:49:07', 'L297');
INSERT INTO `comuni` VALUES ('024110', 'Trissino', '024', NULL, '2023-02-27 18:49:07', 'L433');
INSERT INTO `comuni` VALUES ('024111', 'Valdagno', '024', NULL, '2023-02-27 18:49:07', 'L551');
INSERT INTO `comuni` VALUES ('024112', 'Valdastico', '024', NULL, '2023-02-27 18:49:07', 'L554');
INSERT INTO `comuni` VALUES ('024113', 'Valli del Pasubio', '024', NULL, '2023-02-27 18:49:07', 'L624');
INSERT INTO `comuni` VALUES ('024114', 'Valstagna', '024', NULL, '2023-02-27 18:49:07', 'L650');
INSERT INTO `comuni` VALUES ('024115', 'Velo d\'Astico', '024', NULL, '2023-02-27 18:49:07', 'L723');
INSERT INTO `comuni` VALUES ('024116', 'Vicenza', '024', NULL, '2023-02-27 18:49:07', 'L840');
INSERT INTO `comuni` VALUES ('024117', 'Villaga', '024', NULL, '2023-02-27 18:49:07', 'L952');
INSERT INTO `comuni` VALUES ('024118', 'Villaverla', '024', NULL, '2023-02-27 18:49:07', 'M032');
INSERT INTO `comuni` VALUES ('024119', 'Zanè', '024', NULL, '2023-02-27 18:49:07', 'M145');
INSERT INTO `comuni` VALUES ('024120', 'Zermeghedo', '024', NULL, '2023-02-27 18:49:07', 'M170');
INSERT INTO `comuni` VALUES ('024121', 'Zovencedo', '024', NULL, '2023-02-27 18:49:07', 'M194');
INSERT INTO `comuni` VALUES ('024122', 'Zugliano', '024', NULL, '2023-02-27 18:49:07', 'M199');
INSERT INTO `comuni` VALUES ('025001', 'Agordo', '025', NULL, '2023-02-27 18:49:07', 'A083');
INSERT INTO `comuni` VALUES ('025002', 'Alano di Piave', '025', NULL, '2023-02-27 18:49:07', 'A121');
INSERT INTO `comuni` VALUES ('025003', 'Alleghe', '025', NULL, '2023-02-27 18:49:07', 'A206');
INSERT INTO `comuni` VALUES ('025004', 'Arsiè', '025', NULL, '2023-02-27 18:49:07', 'A443');
INSERT INTO `comuni` VALUES ('025005', 'Auronzo di Cadore', '025', NULL, '2023-02-27 18:49:07', 'A501');
INSERT INTO `comuni` VALUES ('025006', 'Belluno', '025', NULL, '2023-02-27 18:49:07', 'A757');
INSERT INTO `comuni` VALUES ('025007', 'Borca di Cadore', '025', NULL, '2023-02-27 18:49:07', 'A982');
INSERT INTO `comuni` VALUES ('025008', 'Calalzo di Cadore', '025', NULL, '2023-02-27 18:49:07', 'B375');
INSERT INTO `comuni` VALUES ('025009', 'Castellavazzo', '025', NULL, '2023-02-27 18:49:07', 'C146');
INSERT INTO `comuni` VALUES ('025010', 'Cencenighe Agordino', '025', NULL, '2023-02-27 18:49:07', 'C458');
INSERT INTO `comuni` VALUES ('025011', 'Cesiomaggiore', '025', NULL, '2023-02-27 18:49:07', 'C577');
INSERT INTO `comuni` VALUES ('025012', 'Chies d\'Alpago', '025', NULL, '2023-02-27 18:49:07', 'C630');
INSERT INTO `comuni` VALUES ('025013', 'Cibiana di Cadore', '025', NULL, '2023-02-27 18:49:07', 'C672');
INSERT INTO `comuni` VALUES ('025014', 'Colle Santa Lucia', '025', NULL, '2023-02-27 18:49:07', 'C872');
INSERT INTO `comuni` VALUES ('025015', 'Comelico Superiore', '025', NULL, '2023-02-27 18:49:07', 'C920');
INSERT INTO `comuni` VALUES ('025016', 'Cortina d\'Ampezzo', '025', NULL, '2023-02-27 18:49:07', 'A266');
INSERT INTO `comuni` VALUES ('025017', 'Danta di Cadore', '025', NULL, '2023-02-27 18:49:07', 'D247');
INSERT INTO `comuni` VALUES ('025018', 'Domegge di Cadore', '025', NULL, '2023-02-27 18:49:07', 'D330');
INSERT INTO `comuni` VALUES ('025019', 'Falcade', '025', NULL, '2023-02-27 18:49:07', 'D470');
INSERT INTO `comuni` VALUES ('025020', 'Farra d\'Alpago', '025', NULL, '2023-02-27 18:49:07', 'D506');
INSERT INTO `comuni` VALUES ('025021', 'Feltre', '025', NULL, '2023-02-27 18:49:07', 'D530');
INSERT INTO `comuni` VALUES ('025022', 'Fonzaso', '025', NULL, '2023-02-27 18:49:07', 'D686');
INSERT INTO `comuni` VALUES ('025023', 'Canale d\'Agordo', '025', NULL, '2023-02-27 18:49:07', 'B574');
INSERT INTO `comuni` VALUES ('025024', 'Forno di Zoldo', '025', NULL, '2023-02-27 18:49:07', 'D726');
INSERT INTO `comuni` VALUES ('025025', 'Gosaldo', '025', NULL, '2023-02-27 18:49:07', 'E113');
INSERT INTO `comuni` VALUES ('025026', 'Lamon', '025', NULL, '2023-02-27 18:49:07', 'E429');
INSERT INTO `comuni` VALUES ('025027', 'La Valle Agordina', '025', NULL, '2023-02-27 18:49:07', 'E490');
INSERT INTO `comuni` VALUES ('025028', 'Lentiai', '025', NULL, '2023-02-27 18:49:07', 'C562');
INSERT INTO `comuni` VALUES ('025029', 'Limana', '025', NULL, '2023-02-27 18:49:07', 'E588');
INSERT INTO `comuni` VALUES ('025030', 'Livinallongo del Col di Lana', '025', NULL, '2023-02-27 18:49:07', 'E622');
INSERT INTO `comuni` VALUES ('025031', 'Longarone', '025', NULL, '2023-02-27 18:49:07', 'E672');
INSERT INTO `comuni` VALUES ('025032', 'Lorenzago di Cadore', '025', NULL, '2023-02-27 18:49:07', 'E687');
INSERT INTO `comuni` VALUES ('025033', 'Lozzo di Cadore', '025', NULL, '2023-02-27 18:49:07', 'E708');
INSERT INTO `comuni` VALUES ('025034', 'Mel', '025', NULL, '2023-02-27 18:49:07', 'F094');
INSERT INTO `comuni` VALUES ('025035', 'Ospitale di Cadore', '025', NULL, '2023-02-27 18:49:07', 'G169');
INSERT INTO `comuni` VALUES ('025036', 'Pedavena', '025', NULL, '2023-02-27 18:49:07', 'G404');
INSERT INTO `comuni` VALUES ('025037', 'Perarolo di Cadore', '025', NULL, '2023-02-27 18:49:07', 'G442');
INSERT INTO `comuni` VALUES ('025038', 'Pieve d\'Alpago', '025', NULL, '2023-02-27 18:49:07', 'G638');
INSERT INTO `comuni` VALUES ('025039', 'Pieve di Cadore', '025', NULL, '2023-02-27 18:49:07', 'G642');
INSERT INTO `comuni` VALUES ('025040', 'Ponte nelle Alpi', '025', NULL, '2023-02-27 18:49:07', 'B662');
INSERT INTO `comuni` VALUES ('025041', 'Puos d\'Alpago', '025', NULL, '2023-02-27 18:49:07', 'H092');
INSERT INTO `comuni` VALUES ('025043', 'Rivamonte Agordino', '025', NULL, '2023-02-27 18:49:07', 'H327');
INSERT INTO `comuni` VALUES ('025044', 'Rocca Pietore', '025', NULL, '2023-02-27 18:49:07', 'H379');
INSERT INTO `comuni` VALUES ('025045', 'San Gregorio nelle Alpi', '025', NULL, '2023-02-27 18:49:07', 'H938');
INSERT INTO `comuni` VALUES ('025046', 'San Nicolò di Comelico', '025', NULL, '2023-02-27 18:49:07', 'I063');
INSERT INTO `comuni` VALUES ('025047', 'San Pietro di Cadore', '025', NULL, '2023-02-27 18:49:07', 'I088');
INSERT INTO `comuni` VALUES ('025048', 'Santa Giustina', '025', NULL, '2023-02-27 18:49:07', 'I206');
INSERT INTO `comuni` VALUES ('025049', 'San Tomaso Agordino', '025', NULL, '2023-02-27 18:49:07', 'I347');
INSERT INTO `comuni` VALUES ('025050', 'Santo Stefano di Cadore', '025', NULL, '2023-02-27 18:49:07', 'C919');
INSERT INTO `comuni` VALUES ('025051', 'San Vito di Cadore', '025', NULL, '2023-02-27 18:49:07', 'I392');
INSERT INTO `comuni` VALUES ('025052', 'Sappada', '025', NULL, '2023-02-27 18:49:07', 'I421');
INSERT INTO `comuni` VALUES ('025053', 'Sedico', '025', NULL, '2023-02-27 18:49:07', 'I563');
INSERT INTO `comuni` VALUES ('025054', 'Selva di Cadore', '025', NULL, '2023-02-27 18:49:07', 'I592');
INSERT INTO `comuni` VALUES ('025055', 'Seren del Grappa', '025', NULL, '2023-02-27 18:49:07', 'I626');
INSERT INTO `comuni` VALUES ('025056', 'Sospirolo', '025', NULL, '2023-02-27 18:49:07', 'I866');
INSERT INTO `comuni` VALUES ('025057', 'Soverzene', '025', NULL, '2023-02-27 18:49:07', 'I876');
INSERT INTO `comuni` VALUES ('025058', 'Sovramonte', '025', NULL, '2023-02-27 18:49:07', 'I673');
INSERT INTO `comuni` VALUES ('025059', 'Taibon Agordino', '025', NULL, '2023-02-27 18:49:07', 'L030');
INSERT INTO `comuni` VALUES ('025060', 'Tambre', '025', NULL, '2023-02-27 18:49:07', 'L040');
INSERT INTO `comuni` VALUES ('025061', 'Trichiana', '025', NULL, '2023-02-27 18:49:07', 'L422');
INSERT INTO `comuni` VALUES ('025062', 'Vallada Agordina', '025', NULL, '2023-02-27 18:49:07', 'L584');
INSERT INTO `comuni` VALUES ('025063', 'Valle di Cadore', '025', NULL, '2023-02-27 18:49:07', 'L590');
INSERT INTO `comuni` VALUES ('025065', 'Vigo di Cadore', '025', NULL, '2023-02-27 18:49:07', 'L890');
INSERT INTO `comuni` VALUES ('025066', 'Vodo Cadore', '025', NULL, '2023-02-27 18:49:07', 'M108');
INSERT INTO `comuni` VALUES ('025067', 'Voltago Agordino', '025', NULL, '2023-02-27 18:49:07', 'M124');
INSERT INTO `comuni` VALUES ('025068', 'Zoldo Alto', '025', NULL, '2023-02-27 18:49:07', 'I345');
INSERT INTO `comuni` VALUES ('025069', 'Zoppè di Cadore', '025', NULL, '2023-02-27 18:49:07', 'M189');
INSERT INTO `comuni` VALUES ('025070', 'Quero Vas', '025', NULL, '2023-02-27 18:49:07', 'M332');
INSERT INTO `comuni` VALUES ('026001', 'Altivole', '026', NULL, '2023-02-27 18:49:07', 'A237');
INSERT INTO `comuni` VALUES ('026002', 'Arcade', '026', NULL, '2023-02-27 18:49:07', 'A360');
INSERT INTO `comuni` VALUES ('026003', 'Asolo', '026', NULL, '2023-02-27 18:49:07', 'A471');
INSERT INTO `comuni` VALUES ('026004', 'Borso del Grappa', '026', NULL, '2023-02-27 18:49:07', 'B061');
INSERT INTO `comuni` VALUES ('026005', 'Breda di Piave', '026', NULL, '2023-02-27 18:49:07', 'B128');
INSERT INTO `comuni` VALUES ('026006', 'Caerano di San Marco', '026', NULL, '2023-02-27 18:49:07', 'B349');
INSERT INTO `comuni` VALUES ('026007', 'Cappella Maggiore', '026', NULL, '2023-02-27 18:49:07', 'B678');
INSERT INTO `comuni` VALUES ('026008', 'Carbonera', '026', NULL, '2023-02-27 18:49:07', 'B744');
INSERT INTO `comuni` VALUES ('026009', 'Casale sul Sile', '026', NULL, '2023-02-27 18:49:07', 'B879');
INSERT INTO `comuni` VALUES ('026010', 'Casier', '026', NULL, '2023-02-27 18:49:07', 'B965');
INSERT INTO `comuni` VALUES ('026011', 'Castelcucco', '026', NULL, '2023-02-27 18:49:07', 'C073');
INSERT INTO `comuni` VALUES ('026012', 'Castelfranco Veneto', '026', NULL, '2023-02-27 18:49:07', 'C111');
INSERT INTO `comuni` VALUES ('026013', 'Castello di Godego', '026', NULL, '2023-02-27 18:49:07', 'C190');
INSERT INTO `comuni` VALUES ('026014', 'Cavaso del Tomba', '026', NULL, '2023-02-27 18:49:07', 'C384');
INSERT INTO `comuni` VALUES ('026015', 'Cessalto', '026', NULL, '2023-02-27 18:49:07', 'C580');
INSERT INTO `comuni` VALUES ('026016', 'Chiarano', '026', NULL, '2023-02-27 18:49:07', 'C614');
INSERT INTO `comuni` VALUES ('026017', 'Cimadolmo', '026', NULL, '2023-02-27 18:49:07', 'C689');
INSERT INTO `comuni` VALUES ('026018', 'Cison di Valmarino', '026', NULL, '2023-02-27 18:49:07', 'C735');
INSERT INTO `comuni` VALUES ('026019', 'Codognè', '026', NULL, '2023-02-27 18:49:07', 'C815');
INSERT INTO `comuni` VALUES ('026020', 'Colle Umberto', '026', NULL, '2023-02-27 18:49:07', 'C848');
INSERT INTO `comuni` VALUES ('026021', 'Conegliano', '026', NULL, '2023-02-27 18:49:07', 'C957');
INSERT INTO `comuni` VALUES ('026022', 'Cordignano', '026', NULL, '2023-02-27 18:49:07', 'C992');
INSERT INTO `comuni` VALUES ('026023', 'Cornuda', '026', NULL, '2023-02-27 18:49:07', 'D030');
INSERT INTO `comuni` VALUES ('026024', 'Crespano del Grappa', '026', NULL, '2023-02-27 18:49:07', 'D157');
INSERT INTO `comuni` VALUES ('026025', 'Crocetta del Montello', '026', NULL, '2023-02-27 18:49:07', 'C670');
INSERT INTO `comuni` VALUES ('026026', 'Farra di Soligo', '026', NULL, '2023-02-27 18:49:07', 'D505');
INSERT INTO `comuni` VALUES ('026027', 'Follina', '026', NULL, '2023-02-27 18:49:07', 'D654');
INSERT INTO `comuni` VALUES ('026028', 'Fontanelle', '026', NULL, '2023-02-27 18:49:07', 'D674');
INSERT INTO `comuni` VALUES ('026029', 'Fonte', '026', NULL, '2023-02-27 18:49:07', 'D680');
INSERT INTO `comuni` VALUES ('026030', 'Fregona', '026', NULL, '2023-02-27 18:49:07', 'D794');
INSERT INTO `comuni` VALUES ('026031', 'Gaiarine', '026', NULL, '2023-02-27 18:49:07', 'D854');
INSERT INTO `comuni` VALUES ('026032', 'Giavera del Montello', '026', NULL, '2023-02-27 18:49:07', 'E021');
INSERT INTO `comuni` VALUES ('026033', 'Godega di Sant\'Urbano', '026', NULL, '2023-02-27 18:49:07', 'E071');
INSERT INTO `comuni` VALUES ('026034', 'Gorgo al Monticano', '026', NULL, '2023-02-27 18:49:07', 'E092');
INSERT INTO `comuni` VALUES ('026035', 'Istrana', '026', NULL, '2023-02-27 18:49:07', 'E373');
INSERT INTO `comuni` VALUES ('026036', 'Loria', '026', NULL, '2023-02-27 18:49:07', 'E692');
INSERT INTO `comuni` VALUES ('026037', 'Mansuè', '026', NULL, '2023-02-27 18:49:07', 'E893');
INSERT INTO `comuni` VALUES ('026038', 'Mareno di Piave', '026', NULL, '2023-02-27 18:49:07', 'E940');
INSERT INTO `comuni` VALUES ('026039', 'Maser', '026', NULL, '2023-02-27 18:49:07', 'F009');
INSERT INTO `comuni` VALUES ('026040', 'Maserada sul Piave', '026', NULL, '2023-02-27 18:49:07', 'F012');
INSERT INTO `comuni` VALUES ('026041', 'Meduna di Livenza', '026', NULL, '2023-02-27 18:49:07', 'F088');
INSERT INTO `comuni` VALUES ('026042', 'Miane', '026', NULL, '2023-02-27 18:49:07', 'F190');
INSERT INTO `comuni` VALUES ('026043', 'Mogliano Veneto', '026', NULL, '2023-02-27 18:49:07', 'F269');
INSERT INTO `comuni` VALUES ('026044', 'Monastier di Treviso', '026', NULL, '2023-02-27 18:49:07', 'F332');
INSERT INTO `comuni` VALUES ('026045', 'Monfumo', '026', NULL, '2023-02-27 18:49:07', 'F360');
INSERT INTO `comuni` VALUES ('026046', 'Montebelluna', '026', NULL, '2023-02-27 18:49:07', 'F443');
INSERT INTO `comuni` VALUES ('026047', 'Morgano', '026', NULL, '2023-02-27 18:49:07', 'F725');
INSERT INTO `comuni` VALUES ('026048', 'Moriago della Battaglia', '026', NULL, '2023-02-27 18:49:07', 'F729');
INSERT INTO `comuni` VALUES ('026049', 'Motta di Livenza', '026', NULL, '2023-02-27 18:49:07', 'F770');
INSERT INTO `comuni` VALUES ('026050', 'Nervesa della Battaglia', '026', NULL, '2023-02-27 18:49:07', 'F872');
INSERT INTO `comuni` VALUES ('026051', 'Oderzo', '026', NULL, '2023-02-27 18:49:07', 'F999');
INSERT INTO `comuni` VALUES ('026052', 'Ormelle', '026', NULL, '2023-02-27 18:49:07', 'G115');
INSERT INTO `comuni` VALUES ('026053', 'Orsago', '026', NULL, '2023-02-27 18:49:07', 'G123');
INSERT INTO `comuni` VALUES ('026054', 'Paderno del Grappa', '026', NULL, '2023-02-27 18:49:07', 'G221');
INSERT INTO `comuni` VALUES ('026055', 'Paese', '026', NULL, '2023-02-27 18:49:07', 'G229');
INSERT INTO `comuni` VALUES ('026056', 'Pederobba', '026', NULL, '2023-02-27 18:49:07', 'G408');
INSERT INTO `comuni` VALUES ('026057', 'Pieve di Soligo', '026', NULL, '2023-02-27 18:49:07', 'G645');
INSERT INTO `comuni` VALUES ('026058', 'Ponte di Piave', '026', NULL, '2023-02-27 18:49:07', 'G846');
INSERT INTO `comuni` VALUES ('026059', 'Ponzano Veneto', '026', NULL, '2023-02-27 18:49:07', 'G875');
INSERT INTO `comuni` VALUES ('026060', 'Portobuffolè', '026', NULL, '2023-02-27 18:49:07', 'G909');
INSERT INTO `comuni` VALUES ('026061', 'Possagno', '026', NULL, '2023-02-27 18:49:07', 'G933');
INSERT INTO `comuni` VALUES ('026062', 'Povegliano', '026', NULL, '2023-02-27 18:49:07', 'G944');
INSERT INTO `comuni` VALUES ('026063', 'Preganziol', '026', NULL, '2023-02-27 18:49:07', 'H022');
INSERT INTO `comuni` VALUES ('026064', 'Quinto di Treviso', '026', NULL, '2023-02-27 18:49:07', 'H131');
INSERT INTO `comuni` VALUES ('026065', 'Refrontolo', '026', NULL, '2023-02-27 18:49:07', 'H220');
INSERT INTO `comuni` VALUES ('026066', 'Resana', '026', NULL, '2023-02-27 18:49:07', 'H238');
INSERT INTO `comuni` VALUES ('026067', 'Revine Lago', '026', NULL, '2023-02-27 18:49:07', 'H253');
INSERT INTO `comuni` VALUES ('026068', 'Riese Pio X', '026', NULL, '2023-02-27 18:49:07', 'H280');
INSERT INTO `comuni` VALUES ('026069', 'Roncade', '026', NULL, '2023-02-27 18:49:07', 'H523');
INSERT INTO `comuni` VALUES ('026070', 'Salgareda', '026', NULL, '2023-02-27 18:49:07', 'H706');
INSERT INTO `comuni` VALUES ('026071', 'San Biagio di Callalta', '026', NULL, '2023-02-27 18:49:07', 'H781');
INSERT INTO `comuni` VALUES ('026072', 'San Fior', '026', NULL, '2023-02-27 18:49:07', 'H843');
INSERT INTO `comuni` VALUES ('026073', 'San Pietro di Feletto', '026', NULL, '2023-02-27 18:49:07', 'I103');
INSERT INTO `comuni` VALUES ('026074', 'San Polo di Piave', '026', NULL, '2023-02-27 18:49:07', 'I124');
INSERT INTO `comuni` VALUES ('026075', 'Santa Lucia di Piave', '026', NULL, '2023-02-27 18:49:07', 'I221');
INSERT INTO `comuni` VALUES ('026076', 'San Vendemiano', '026', NULL, '2023-02-27 18:49:07', 'I382');
INSERT INTO `comuni` VALUES ('026077', 'San Zenone degli Ezzelini', '026', NULL, '2023-02-27 18:49:07', 'I417');
INSERT INTO `comuni` VALUES ('026078', 'Sarmede', '026', NULL, '2023-02-27 18:49:07', 'I435');
INSERT INTO `comuni` VALUES ('026079', 'Segusino', '026', NULL, '2023-02-27 18:49:07', 'I578');
INSERT INTO `comuni` VALUES ('026080', 'Sernaglia della Battaglia', '026', NULL, '2023-02-27 18:49:07', 'I635');
INSERT INTO `comuni` VALUES ('026081', 'Silea', '026', NULL, '2023-02-27 18:49:07', 'F116');
INSERT INTO `comuni` VALUES ('026082', 'Spresiano', '026', NULL, '2023-02-27 18:49:07', 'I927');
INSERT INTO `comuni` VALUES ('026083', 'Susegana', '026', NULL, '2023-02-27 18:49:07', 'L014');
INSERT INTO `comuni` VALUES ('026084', 'Tarzo', '026', NULL, '2023-02-27 18:49:07', 'L058');
INSERT INTO `comuni` VALUES ('026085', 'Trevignano', '026', NULL, '2023-02-27 18:49:07', 'L402');
INSERT INTO `comuni` VALUES ('026086', 'Treviso', '026', NULL, '2023-02-27 18:49:07', 'L407');
INSERT INTO `comuni` VALUES ('026087', 'Valdobbiadene', '026', NULL, '2023-02-27 18:49:07', 'L565');
INSERT INTO `comuni` VALUES ('026088', 'Vazzola', '026', NULL, '2023-02-27 18:49:07', 'L700');
INSERT INTO `comuni` VALUES ('026089', 'Vedelago', '026', NULL, '2023-02-27 18:49:07', 'L706');
INSERT INTO `comuni` VALUES ('026090', 'Vidor', '026', NULL, '2023-02-27 18:49:07', 'L856');
INSERT INTO `comuni` VALUES ('026091', 'Villorba', '026', NULL, '2023-02-27 18:49:07', 'M048');
INSERT INTO `comuni` VALUES ('026092', 'Vittorio Veneto', '026', NULL, '2023-02-27 18:49:07', 'M089');
INSERT INTO `comuni` VALUES ('026093', 'Volpago del Montello', '026', NULL, '2023-02-27 18:49:07', 'M118');
INSERT INTO `comuni` VALUES ('026094', 'Zenson di Piave', '026', NULL, '2023-02-27 18:49:07', 'M163');
INSERT INTO `comuni` VALUES ('026095', 'Zero Branco', '026', NULL, '2023-02-27 18:49:07', 'M171');
INSERT INTO `comuni` VALUES ('027001', 'Annone Veneto', '027', NULL, '2023-02-27 18:49:07', 'A302');
INSERT INTO `comuni` VALUES ('027002', 'Campagna Lupia', '027', NULL, '2023-02-27 18:49:07', 'B493');
INSERT INTO `comuni` VALUES ('027003', 'Campolongo Maggiore', '027', NULL, '2023-02-27 18:49:07', 'B546');
INSERT INTO `comuni` VALUES ('027004', 'Camponogara', '027', NULL, '2023-02-27 18:49:07', 'B554');
INSERT INTO `comuni` VALUES ('027005', 'Caorle', '027', NULL, '2023-02-27 18:49:07', 'B642');
INSERT INTO `comuni` VALUES ('027006', 'Cavarzere', '027', NULL, '2023-02-27 18:49:07', 'C383');
INSERT INTO `comuni` VALUES ('027007', 'Ceggia', '027', NULL, '2023-02-27 18:49:07', 'C422');
INSERT INTO `comuni` VALUES ('027008', 'Chioggia', '027', NULL, '2023-02-27 18:49:07', 'C638');
INSERT INTO `comuni` VALUES ('027009', 'Cinto Caomaggiore', '027', NULL, '2023-02-27 18:49:07', 'C714');
INSERT INTO `comuni` VALUES ('027010', 'Cona', '027', NULL, '2023-02-27 18:49:07', 'C938');
INSERT INTO `comuni` VALUES ('027011', 'Concordia Sagittaria', '027', NULL, '2023-02-27 18:49:07', 'C950');
INSERT INTO `comuni` VALUES ('027012', 'Dolo', '027', NULL, '2023-02-27 18:49:07', 'D325');
INSERT INTO `comuni` VALUES ('027013', 'Eraclea', '027', NULL, '2023-02-27 18:49:07', 'D415');
INSERT INTO `comuni` VALUES ('027014', 'Fiesso d\'Artico', '027', NULL, '2023-02-27 18:49:07', 'D578');
INSERT INTO `comuni` VALUES ('027015', 'Fossalta di Piave', '027', NULL, '2023-02-27 18:49:07', 'D740');
INSERT INTO `comuni` VALUES ('027016', 'Fossalta di Portogruaro', '027', NULL, '2023-02-27 18:49:07', 'D741');
INSERT INTO `comuni` VALUES ('027017', 'Fossò', '027', NULL, '2023-02-27 18:49:07', 'D748');
INSERT INTO `comuni` VALUES ('027018', 'Gruaro', '027', NULL, '2023-02-27 18:49:07', 'E215');
INSERT INTO `comuni` VALUES ('027019', 'Jesolo', '027', NULL, '2023-02-27 18:49:07', 'C388');
INSERT INTO `comuni` VALUES ('027020', 'Marcon', '027', NULL, '2023-02-27 18:49:07', 'E936');
INSERT INTO `comuni` VALUES ('027021', 'Martellago', '027', NULL, '2023-02-27 18:49:07', 'E980');
INSERT INTO `comuni` VALUES ('027022', 'Meolo', '027', NULL, '2023-02-27 18:49:07', 'F130');
INSERT INTO `comuni` VALUES ('027023', 'Mira', '027', NULL, '2023-02-27 18:49:07', 'F229');
INSERT INTO `comuni` VALUES ('027024', 'Mirano', '027', NULL, '2023-02-27 18:49:07', 'F241');
INSERT INTO `comuni` VALUES ('027025', 'Musile di Piave', '027', NULL, '2023-02-27 18:49:07', 'F826');
INSERT INTO `comuni` VALUES ('027026', 'Noale', '027', NULL, '2023-02-27 18:49:07', 'F904');
INSERT INTO `comuni` VALUES ('027027', 'Noventa di Piave', '027', NULL, '2023-02-27 18:49:07', 'F963');
INSERT INTO `comuni` VALUES ('027028', 'Pianiga', '027', NULL, '2023-02-27 18:49:07', 'G565');
INSERT INTO `comuni` VALUES ('027029', 'Portogruaro', '027', NULL, '2023-02-27 18:49:07', 'G914');
INSERT INTO `comuni` VALUES ('027030', 'Pramaggiore', '027', NULL, '2023-02-27 18:49:07', 'G981');
INSERT INTO `comuni` VALUES ('027031', 'Quarto d\'Altino', '027', NULL, '2023-02-27 18:49:07', 'H117');
INSERT INTO `comuni` VALUES ('027032', 'Salzano', '027', NULL, '2023-02-27 18:49:07', 'H735');
INSERT INTO `comuni` VALUES ('027033', 'San Donà di Piave', '027', NULL, '2023-02-27 18:49:07', 'H823');
INSERT INTO `comuni` VALUES ('027034', 'San Michele al Tagliamento', '027', NULL, '2023-02-27 18:49:07', 'I040');
INSERT INTO `comuni` VALUES ('027035', 'Santa Maria di Sala', '027', NULL, '2023-02-27 18:49:07', 'I242');
INSERT INTO `comuni` VALUES ('027036', 'San Stino di Livenza', '027', NULL, '2023-02-27 18:49:07', 'I373');
INSERT INTO `comuni` VALUES ('027037', 'Scorzè', '027', NULL, '2023-02-27 18:49:07', 'I551');
INSERT INTO `comuni` VALUES ('027038', 'Spinea', '027', NULL, '2023-02-27 18:49:07', 'I908');
INSERT INTO `comuni` VALUES ('027039', 'Stra', '027', NULL, '2023-02-27 18:49:07', 'I965');
INSERT INTO `comuni` VALUES ('027040', 'Teglio Veneto', '027', NULL, '2023-02-27 18:49:07', 'L085');
INSERT INTO `comuni` VALUES ('027041', 'Torre di Mosto', '027', NULL, '2023-02-27 18:49:07', 'L267');
INSERT INTO `comuni` VALUES ('027042', 'Venezia', '027', NULL, '2023-02-27 18:49:07', 'L736');
INSERT INTO `comuni` VALUES ('027043', 'Vigonovo', '027', NULL, '2023-02-27 18:49:07', 'L899');
INSERT INTO `comuni` VALUES ('027044', 'Cavallino-Treporti', '027', NULL, '2023-02-27 18:49:07', 'M308');
INSERT INTO `comuni` VALUES ('028001', 'Abano Terme', '028', NULL, '2023-02-27 18:49:07', 'A001');
INSERT INTO `comuni` VALUES ('028002', 'Agna', '028', NULL, '2023-02-27 18:49:07', 'A075');
INSERT INTO `comuni` VALUES ('028003', 'Albignasego', '028', NULL, '2023-02-27 18:49:07', 'A161');
INSERT INTO `comuni` VALUES ('028004', 'Anguillara Veneta', '028', NULL, '2023-02-27 18:49:07', 'A296');
INSERT INTO `comuni` VALUES ('028005', 'Arquà Petrarca', '028', NULL, '2023-02-27 18:49:07', 'A434');
INSERT INTO `comuni` VALUES ('028006', 'Arre', '028', NULL, '2023-02-27 18:49:07', 'A438');
INSERT INTO `comuni` VALUES ('028007', 'Arzergrande', '028', NULL, '2023-02-27 18:49:07', 'A458');
INSERT INTO `comuni` VALUES ('028008', 'Bagnoli di Sopra', '028', NULL, '2023-02-27 18:49:07', 'A568');
INSERT INTO `comuni` VALUES ('028009', 'Baone', '028', NULL, '2023-02-27 18:49:07', 'A613');
INSERT INTO `comuni` VALUES ('028010', 'Barbona', '028', NULL, '2023-02-27 18:49:07', 'A637');
INSERT INTO `comuni` VALUES ('028011', 'Battaglia Terme', '028', NULL, '2023-02-27 18:49:07', 'A714');
INSERT INTO `comuni` VALUES ('028012', 'Boara Pisani', '028', NULL, '2023-02-27 18:49:07', 'A906');
INSERT INTO `comuni` VALUES ('028013', 'Borgoricco', '028', NULL, '2023-02-27 18:49:07', 'B031');
INSERT INTO `comuni` VALUES ('028014', 'Bovolenta', '028', NULL, '2023-02-27 18:49:07', 'B106');
INSERT INTO `comuni` VALUES ('028015', 'Brugine', '028', NULL, '2023-02-27 18:49:07', 'B213');
INSERT INTO `comuni` VALUES ('028016', 'Cadoneghe', '028', NULL, '2023-02-27 18:49:07', 'B345');
INSERT INTO `comuni` VALUES ('028017', 'Campodarsego', '028', NULL, '2023-02-27 18:49:07', 'B524');
INSERT INTO `comuni` VALUES ('028018', 'Campodoro', '028', NULL, '2023-02-27 18:49:07', 'B531');
INSERT INTO `comuni` VALUES ('028019', 'Camposampiero', '028', NULL, '2023-02-27 18:49:07', 'B563');
INSERT INTO `comuni` VALUES ('028020', 'Campo San Martino', '028', NULL, '2023-02-27 18:49:07', 'B564');
INSERT INTO `comuni` VALUES ('028021', 'Candiana', '028', NULL, '2023-02-27 18:49:07', 'B589');
INSERT INTO `comuni` VALUES ('028022', 'Carceri', '028', NULL, '2023-02-27 18:49:07', 'B749');
INSERT INTO `comuni` VALUES ('028023', 'Carmignano di Brenta', '028', NULL, '2023-02-27 18:49:07', 'B795');
INSERT INTO `comuni` VALUES ('028026', 'Cartura', '028', NULL, '2023-02-27 18:49:07', 'B848');
INSERT INTO `comuni` VALUES ('028027', 'Casale di Scodosia', '028', NULL, '2023-02-27 18:49:07', 'B877');
INSERT INTO `comuni` VALUES ('028028', 'Casalserugo', '028', NULL, '2023-02-27 18:49:07', 'B912');
INSERT INTO `comuni` VALUES ('028029', 'Castelbaldo', '028', NULL, '2023-02-27 18:49:07', 'C057');
INSERT INTO `comuni` VALUES ('028030', 'Cervarese Santa Croce', '028', NULL, '2023-02-27 18:49:07', 'C544');
INSERT INTO `comuni` VALUES ('028031', 'Cinto Euganeo', '028', NULL, '2023-02-27 18:49:07', 'C713');
INSERT INTO `comuni` VALUES ('028032', 'Cittadella', '028', NULL, '2023-02-27 18:49:07', 'C743');
INSERT INTO `comuni` VALUES ('028033', 'Codevigo', '028', NULL, '2023-02-27 18:49:07', 'C812');
INSERT INTO `comuni` VALUES ('028034', 'Conselve', '028', NULL, '2023-02-27 18:49:07', 'C964');
INSERT INTO `comuni` VALUES ('028035', 'Correzzola', '028', NULL, '2023-02-27 18:49:07', 'D040');
INSERT INTO `comuni` VALUES ('028036', 'Curtarolo', '028', NULL, '2023-02-27 18:49:07', 'D226');
INSERT INTO `comuni` VALUES ('028037', 'Este', '028', NULL, '2023-02-27 18:49:07', 'D442');
INSERT INTO `comuni` VALUES ('028038', 'Fontaniva', '028', NULL, '2023-02-27 18:49:07', 'D679');
INSERT INTO `comuni` VALUES ('028039', 'Galliera Veneta', '028', NULL, '2023-02-27 18:49:07', 'D879');
INSERT INTO `comuni` VALUES ('028040', 'Galzignano Terme', '028', NULL, '2023-02-27 18:49:07', 'D889');
INSERT INTO `comuni` VALUES ('028041', 'Gazzo', '028', NULL, '2023-02-27 18:49:07', 'D956');
INSERT INTO `comuni` VALUES ('028042', 'Grantorto', '028', NULL, '2023-02-27 18:49:07', 'E145');
INSERT INTO `comuni` VALUES ('028043', 'Granze', '028', NULL, '2023-02-27 18:49:07', 'E146');
INSERT INTO `comuni` VALUES ('028044', 'Legnaro', '028', NULL, '2023-02-27 18:49:07', 'E515');
INSERT INTO `comuni` VALUES ('028045', 'Limena', '028', NULL, '2023-02-27 18:49:07', 'E592');
INSERT INTO `comuni` VALUES ('028046', 'Loreggia', '028', NULL, '2023-02-27 18:49:07', 'E684');
INSERT INTO `comuni` VALUES ('028047', 'Lozzo Atestino', '028', NULL, '2023-02-27 18:49:07', 'E709');
INSERT INTO `comuni` VALUES ('028048', 'Maserà di Padova', '028', NULL, '2023-02-27 18:49:07', 'F011');
INSERT INTO `comuni` VALUES ('028049', 'Masi', '028', NULL, '2023-02-27 18:49:07', 'F013');
INSERT INTO `comuni` VALUES ('028050', 'Massanzago', '028', NULL, '2023-02-27 18:49:07', 'F033');
INSERT INTO `comuni` VALUES ('028051', 'Megliadino San Fidenzio', '028', NULL, '2023-02-27 18:49:07', 'F091');
INSERT INTO `comuni` VALUES ('028052', 'Megliadino San Vitale', '028', NULL, '2023-02-27 18:49:07', 'F092');
INSERT INTO `comuni` VALUES ('028053', 'Merlara', '028', NULL, '2023-02-27 18:49:07', 'F148');
INSERT INTO `comuni` VALUES ('028054', 'Mestrino', '028', NULL, '2023-02-27 18:49:07', 'F161');
INSERT INTO `comuni` VALUES ('028055', 'Monselice', '028', NULL, '2023-02-27 18:49:07', 'F382');
INSERT INTO `comuni` VALUES ('028056', 'Montagnana', '028', NULL, '2023-02-27 18:49:07', 'F394');
INSERT INTO `comuni` VALUES ('028057', 'Montegrotto Terme', '028', NULL, '2023-02-27 18:49:07', 'F529');
INSERT INTO `comuni` VALUES ('028058', 'Noventa Padovana', '028', NULL, '2023-02-27 18:49:07', 'F962');
INSERT INTO `comuni` VALUES ('028059', 'Ospedaletto Euganeo', '028', NULL, '2023-02-27 18:49:07', 'G167');
INSERT INTO `comuni` VALUES ('028060', 'Padova', '028', NULL, '2023-02-27 18:49:07', 'G224');
INSERT INTO `comuni` VALUES ('028061', 'Pernumia', '028', NULL, '2023-02-27 18:49:07', 'G461');
INSERT INTO `comuni` VALUES ('028062', 'Piacenza d\'Adige', '028', NULL, '2023-02-27 18:49:07', 'G534');
INSERT INTO `comuni` VALUES ('028063', 'Piazzola sul Brenta', '028', NULL, '2023-02-27 18:49:07', 'G587');
INSERT INTO `comuni` VALUES ('028064', 'Piombino Dese', '028', NULL, '2023-02-27 18:49:07', 'G688');
INSERT INTO `comuni` VALUES ('028065', 'Piove di Sacco', '028', NULL, '2023-02-27 18:49:07', 'G693');
INSERT INTO `comuni` VALUES ('028066', 'Polverara', '028', NULL, '2023-02-27 18:49:07', 'G802');
INSERT INTO `comuni` VALUES ('028067', 'Ponso', '028', NULL, '2023-02-27 18:49:07', 'G823');
INSERT INTO `comuni` VALUES ('028068', 'Pontelongo', '028', NULL, '2023-02-27 18:49:07', 'G850');
INSERT INTO `comuni` VALUES ('028069', 'Ponte San Nicolò', '028', NULL, '2023-02-27 18:49:07', 'G855');
INSERT INTO `comuni` VALUES ('028070', 'Pozzonovo', '028', NULL, '2023-02-27 18:49:07', 'G963');
INSERT INTO `comuni` VALUES ('028071', 'Rovolon', '028', NULL, '2023-02-27 18:49:07', 'H622');
INSERT INTO `comuni` VALUES ('028072', 'Rubano', '028', NULL, '2023-02-27 18:49:07', 'H625');
INSERT INTO `comuni` VALUES ('028073', 'Saccolongo', '028', NULL, '2023-02-27 18:49:07', 'H655');
INSERT INTO `comuni` VALUES ('028074', 'Saletto', '028', NULL, '2023-02-27 18:49:07', 'H705');
INSERT INTO `comuni` VALUES ('028075', 'San Giorgio delle Pertiche', '028', NULL, '2023-02-27 18:49:07', 'H893');
INSERT INTO `comuni` VALUES ('028076', 'San Giorgio in Bosco', '028', NULL, '2023-02-27 18:49:07', 'H897');
INSERT INTO `comuni` VALUES ('028077', 'San Martino di Lupari', '028', NULL, '2023-02-27 18:49:07', 'I008');
INSERT INTO `comuni` VALUES ('028078', 'San Pietro in Gu', '028', NULL, '2023-02-27 18:49:07', 'I107');
INSERT INTO `comuni` VALUES ('028079', 'San Pietro Viminario', '028', NULL, '2023-02-27 18:49:07', 'I120');
INSERT INTO `comuni` VALUES ('028080', 'Santa Giustina in Colle', '028', NULL, '2023-02-27 18:49:07', 'I207');
INSERT INTO `comuni` VALUES ('028081', 'Santa Margherita d\'Adige', '028', NULL, '2023-02-27 18:49:07', 'I226');
INSERT INTO `comuni` VALUES ('028082', 'Sant\'Angelo di Piove di Sacco', '028', NULL, '2023-02-27 18:49:07', 'I275');
INSERT INTO `comuni` VALUES ('028083', 'Sant\'Elena', '028', NULL, '2023-02-27 18:49:07', 'I319');
INSERT INTO `comuni` VALUES ('028084', 'Sant\'Urbano', '028', NULL, '2023-02-27 18:49:07', 'I375');
INSERT INTO `comuni` VALUES ('028085', 'Saonara', '028', NULL, '2023-02-27 18:49:07', 'I418');
INSERT INTO `comuni` VALUES ('028086', 'Selvazzano Dentro', '028', NULL, '2023-02-27 18:49:07', 'I595');
INSERT INTO `comuni` VALUES ('028087', 'Solesino', '028', NULL, '2023-02-27 18:49:07', 'I799');
INSERT INTO `comuni` VALUES ('028088', 'Stanghella', '028', NULL, '2023-02-27 18:49:07', 'I938');
INSERT INTO `comuni` VALUES ('028089', 'Teolo', '028', NULL, '2023-02-27 18:49:07', 'L100');
INSERT INTO `comuni` VALUES ('028090', 'Terrassa Padovana', '028', NULL, '2023-02-27 18:49:07', 'L132');
INSERT INTO `comuni` VALUES ('028091', 'Tombolo', '028', NULL, '2023-02-27 18:49:07', 'L199');
INSERT INTO `comuni` VALUES ('028092', 'Torreglia', '028', NULL, '2023-02-27 18:49:07', 'L270');
INSERT INTO `comuni` VALUES ('028093', 'Trebaseleghe', '028', NULL, '2023-02-27 18:49:07', 'L349');
INSERT INTO `comuni` VALUES ('028094', 'Tribano', '028', NULL, '2023-02-27 18:49:07', 'L414');
INSERT INTO `comuni` VALUES ('028095', 'Urbana', '028', NULL, '2023-02-27 18:49:07', 'L497');
INSERT INTO `comuni` VALUES ('028096', 'Veggiano', '028', NULL, '2023-02-27 18:49:07', 'L710');
INSERT INTO `comuni` VALUES ('028097', 'Vescovana', '028', NULL, '2023-02-27 18:49:07', 'L805');
INSERT INTO `comuni` VALUES ('028098', 'Vighizzolo d\'Este', '028', NULL, '2023-02-27 18:49:07', 'L878');
INSERT INTO `comuni` VALUES ('028099', 'Vigodarzere', '028', NULL, '2023-02-27 18:49:07', 'L892');
INSERT INTO `comuni` VALUES ('028100', 'Vigonza', '028', NULL, '2023-02-27 18:49:07', 'L900');
INSERT INTO `comuni` VALUES ('028101', 'Villa del Conte', '028', NULL, '2023-02-27 18:49:07', 'L934');
INSERT INTO `comuni` VALUES ('028102', 'Villa Estense', '028', NULL, '2023-02-27 18:49:07', 'L937');
INSERT INTO `comuni` VALUES ('028103', 'Villafranca Padovana', '028', NULL, '2023-02-27 18:49:07', 'L947');
INSERT INTO `comuni` VALUES ('028104', 'Villanova di Camposampiero', '028', NULL, '2023-02-27 18:49:07', 'L979');
INSERT INTO `comuni` VALUES ('028105', 'Vo\'', '028', NULL, '2023-02-27 18:49:07', 'M103');
INSERT INTO `comuni` VALUES ('028106', 'Due Carrare', '028', NULL, '2023-02-27 18:49:07', 'M300');
INSERT INTO `comuni` VALUES ('029001', 'Adria', '029', NULL, '2023-02-27 18:49:07', 'A059');
INSERT INTO `comuni` VALUES ('029002', 'Ariano nel Polesine', '029', NULL, '2023-02-27 18:49:07', 'A400');
INSERT INTO `comuni` VALUES ('029003', 'Arquà Polesine', '029', NULL, '2023-02-27 18:49:07', 'A435');
INSERT INTO `comuni` VALUES ('029004', 'Badia Polesine', '029', NULL, '2023-02-27 18:49:07', 'A539');
INSERT INTO `comuni` VALUES ('029005', 'Bagnolo di Po', '029', NULL, '2023-02-27 18:49:07', 'A574');
INSERT INTO `comuni` VALUES ('029006', 'Bergantino', '029', NULL, '2023-02-27 18:49:07', 'A795');
INSERT INTO `comuni` VALUES ('029007', 'Bosaro', '029', NULL, '2023-02-27 18:49:07', 'B069');
INSERT INTO `comuni` VALUES ('029008', 'Calto', '029', NULL, '2023-02-27 18:49:07', 'B432');
INSERT INTO `comuni` VALUES ('029009', 'Canaro', '029', NULL, '2023-02-27 18:49:07', 'B578');
INSERT INTO `comuni` VALUES ('029010', 'Canda', '029', NULL, '2023-02-27 18:49:07', 'B582');
INSERT INTO `comuni` VALUES ('029011', 'Castelguglielmo', '029', NULL, '2023-02-27 18:49:07', 'C122');
INSERT INTO `comuni` VALUES ('029012', 'Castelmassa', '029', NULL, '2023-02-27 18:49:07', 'C207');
INSERT INTO `comuni` VALUES ('029013', 'Castelnovo Bariano', '029', NULL, '2023-02-27 18:49:07', 'C215');
INSERT INTO `comuni` VALUES ('029014', 'Ceneselli', '029', NULL, '2023-02-27 18:49:07', 'C461');
INSERT INTO `comuni` VALUES ('029015', 'Ceregnano', '029', NULL, '2023-02-27 18:49:07', 'C500');
INSERT INTO `comuni` VALUES ('029017', 'Corbola', '029', NULL, '2023-02-27 18:49:07', 'C987');
INSERT INTO `comuni` VALUES ('029018', 'Costa di Rovigo', '029', NULL, '2023-02-27 18:49:07', 'D105');
INSERT INTO `comuni` VALUES ('029019', 'Crespino', '029', NULL, '2023-02-27 18:49:07', 'D161');
INSERT INTO `comuni` VALUES ('029021', 'Ficarolo', '029', NULL, '2023-02-27 18:49:07', 'D568');
INSERT INTO `comuni` VALUES ('029022', 'Fiesso Umbertiano', '029', NULL, '2023-02-27 18:49:07', 'D577');
INSERT INTO `comuni` VALUES ('029023', 'Frassinelle Polesine', '029', NULL, '2023-02-27 18:49:07', 'D776');
INSERT INTO `comuni` VALUES ('029024', 'Fratta Polesine', '029', NULL, '2023-02-27 18:49:07', 'D788');
INSERT INTO `comuni` VALUES ('029025', 'Gaiba', '029', NULL, '2023-02-27 18:49:07', 'D855');
INSERT INTO `comuni` VALUES ('029026', 'Gavello', '029', NULL, '2023-02-27 18:49:07', 'D942');
INSERT INTO `comuni` VALUES ('029027', 'Giacciano con Baruchella', '029', NULL, '2023-02-27 18:49:07', 'E008');
INSERT INTO `comuni` VALUES ('029028', 'Guarda Veneta', '029', NULL, '2023-02-27 18:49:07', 'E240');
INSERT INTO `comuni` VALUES ('029029', 'Lendinara', '029', NULL, '2023-02-27 18:49:07', 'E522');
INSERT INTO `comuni` VALUES ('029030', 'Loreo', '029', NULL, '2023-02-27 18:49:07', 'E689');
INSERT INTO `comuni` VALUES ('029031', 'Lusia', '029', NULL, '2023-02-27 18:49:07', 'E761');
INSERT INTO `comuni` VALUES ('029032', 'Melara', '029', NULL, '2023-02-27 18:49:07', 'F095');
INSERT INTO `comuni` VALUES ('029033', 'Occhiobello', '029', NULL, '2023-02-27 18:49:07', 'F994');
INSERT INTO `comuni` VALUES ('029034', 'Papozze', '029', NULL, '2023-02-27 18:49:07', 'G323');
INSERT INTO `comuni` VALUES ('029035', 'Pettorazza Grimani', '029', NULL, '2023-02-27 18:49:07', 'G525');
INSERT INTO `comuni` VALUES ('029036', 'Pincara', '029', NULL, '2023-02-27 18:49:07', 'G673');
INSERT INTO `comuni` VALUES ('029037', 'Polesella', '029', NULL, '2023-02-27 18:49:07', 'G782');
INSERT INTO `comuni` VALUES ('029038', 'Pontecchio Polesine', '029', NULL, '2023-02-27 18:49:07', 'G836');
INSERT INTO `comuni` VALUES ('029039', 'Porto Tolle', '029', NULL, '2023-02-27 18:49:07', 'G923');
INSERT INTO `comuni` VALUES ('029040', 'Rosolina', '029', NULL, '2023-02-27 18:49:07', 'H573');
INSERT INTO `comuni` VALUES ('029041', 'Rovigo', '029', NULL, '2023-02-27 18:49:07', 'H620');
INSERT INTO `comuni` VALUES ('029042', 'Salara', '029', NULL, '2023-02-27 18:49:07', 'H689');
INSERT INTO `comuni` VALUES ('029043', 'San Bellino', '029', NULL, '2023-02-27 18:49:07', 'H768');
INSERT INTO `comuni` VALUES ('029044', 'San Martino di Venezze', '029', NULL, '2023-02-27 18:49:07', 'H996');
INSERT INTO `comuni` VALUES ('029045', 'Stienta', '029', NULL, '2023-02-27 18:49:07', 'I953');
INSERT INTO `comuni` VALUES ('029046', 'Taglio di Po', '029', NULL, '2023-02-27 18:49:07', 'L026');
INSERT INTO `comuni` VALUES ('029047', 'Trecenta', '029', NULL, '2023-02-27 18:49:07', 'L359');
INSERT INTO `comuni` VALUES ('029048', 'Villadose', '029', NULL, '2023-02-27 18:49:07', 'L939');
INSERT INTO `comuni` VALUES ('029049', 'Villamarzana', '029', NULL, '2023-02-27 18:49:07', 'L967');
INSERT INTO `comuni` VALUES ('029050', 'Villanova del Ghebbo', '029', NULL, '2023-02-27 18:49:07', 'L985');
INSERT INTO `comuni` VALUES ('029051', 'Villanova Marchesana', '029', NULL, '2023-02-27 18:49:07', 'L988');
INSERT INTO `comuni` VALUES ('029052', 'Porto Viro', '029', NULL, '2023-02-27 18:49:07', 'G926');
INSERT INTO `comuni` VALUES ('030001', 'Aiello del Friuli', '030', NULL, '2023-02-27 18:49:07', 'A103');
INSERT INTO `comuni` VALUES ('030002', 'Amaro', '030', NULL, '2023-02-27 18:49:07', 'A254');
INSERT INTO `comuni` VALUES ('030003', 'Ampezzo', '030', NULL, '2023-02-27 18:49:07', 'A267');
INSERT INTO `comuni` VALUES ('030004', 'Aquileia', '030', NULL, '2023-02-27 18:49:07', 'A346');
INSERT INTO `comuni` VALUES ('030005', 'Arta Terme', '030', NULL, '2023-02-27 18:49:07', 'A447');
INSERT INTO `comuni` VALUES ('030006', 'Artegna', '030', NULL, '2023-02-27 18:49:07', 'A448');
INSERT INTO `comuni` VALUES ('030007', 'Attimis', '030', NULL, '2023-02-27 18:49:07', 'A491');
INSERT INTO `comuni` VALUES ('030008', 'Bagnaria Arsa', '030', NULL, '2023-02-27 18:49:07', 'A553');
INSERT INTO `comuni` VALUES ('030009', 'Basiliano', '030', NULL, '2023-02-27 18:49:07', 'A700');
INSERT INTO `comuni` VALUES ('030010', 'Bertiolo', '030', NULL, '2023-02-27 18:49:07', 'A810');
INSERT INTO `comuni` VALUES ('030011', 'Bicinicco', '030', NULL, '2023-02-27 18:49:07', 'A855');
INSERT INTO `comuni` VALUES ('030012', 'Bordano', '030', NULL, '2023-02-27 18:49:07', 'A983');
INSERT INTO `comuni` VALUES ('030013', 'Buja', '030', NULL, '2023-02-27 18:49:07', 'B259');
INSERT INTO `comuni` VALUES ('030014', 'Buttrio', '030', NULL, '2023-02-27 18:49:07', 'B309');
INSERT INTO `comuni` VALUES ('030015', 'Camino al Tagliamento', '030', NULL, '2023-02-27 18:49:07', 'B483');
INSERT INTO `comuni` VALUES ('030016', 'Campoformido', '030', NULL, '2023-02-27 18:49:07', 'B536');
INSERT INTO `comuni` VALUES ('030018', 'Carlino', '030', NULL, '2023-02-27 18:49:07', 'B788');
INSERT INTO `comuni` VALUES ('030019', 'Cassacco', '030', NULL, '2023-02-27 18:49:07', 'B994');
INSERT INTO `comuni` VALUES ('030020', 'Castions di Strada', '030', NULL, '2023-02-27 18:49:07', 'C327');
INSERT INTO `comuni` VALUES ('030021', 'Cavazzo Carnico', '030', NULL, '2023-02-27 18:49:07', 'C389');
INSERT INTO `comuni` VALUES ('030022', 'Cercivento', '030', NULL, '2023-02-27 18:49:07', 'C494');
INSERT INTO `comuni` VALUES ('030023', 'Cervignano del Friuli', '030', NULL, '2023-02-27 18:49:07', 'C556');
INSERT INTO `comuni` VALUES ('030024', 'Chiopris-Viscone', '030', NULL, '2023-02-27 18:49:07', 'C641');
INSERT INTO `comuni` VALUES ('030025', 'Chiusaforte', '030', NULL, '2023-02-27 18:49:07', 'C656');
INSERT INTO `comuni` VALUES ('030026', 'Cividale del Friuli', '030', NULL, '2023-02-27 18:49:07', 'C758');
INSERT INTO `comuni` VALUES ('030027', 'Codroipo', '030', NULL, '2023-02-27 18:49:07', 'C817');
INSERT INTO `comuni` VALUES ('030028', 'Colloredo di Monte Albano', '030', NULL, '2023-02-27 18:49:07', 'C885');
INSERT INTO `comuni` VALUES ('030029', 'Comeglians', '030', NULL, '2023-02-27 18:49:07', 'C918');
INSERT INTO `comuni` VALUES ('030030', 'Corno di Rosazzo', '030', NULL, '2023-02-27 18:49:07', 'D027');
INSERT INTO `comuni` VALUES ('030031', 'Coseano', '030', NULL, '2023-02-27 18:49:07', 'D085');
INSERT INTO `comuni` VALUES ('030032', 'Dignano', '030', NULL, '2023-02-27 18:49:07', 'D300');
INSERT INTO `comuni` VALUES ('030033', 'Dogna', '030', NULL, '2023-02-27 18:49:07', 'D316');
INSERT INTO `comuni` VALUES ('030034', 'Drenchia', '030', NULL, '2023-02-27 18:49:07', 'D366');
INSERT INTO `comuni` VALUES ('030035', 'Enemonzo', '030', NULL, '2023-02-27 18:49:07', 'D408');
INSERT INTO `comuni` VALUES ('030036', 'Faedis', '030', NULL, '2023-02-27 18:49:07', 'D455');
INSERT INTO `comuni` VALUES ('030037', 'Fagagna', '030', NULL, '2023-02-27 18:49:07', 'D461');
INSERT INTO `comuni` VALUES ('030038', 'Fiumicello', '030', NULL, '2023-02-27 18:49:07', 'D627');
INSERT INTO `comuni` VALUES ('030039', 'Flaibano', '030', NULL, '2023-02-27 18:49:07', 'D630');
INSERT INTO `comuni` VALUES ('030040', 'Forni Avoltri', '030', NULL, '2023-02-27 18:49:07', 'D718');
INSERT INTO `comuni` VALUES ('030041', 'Forni di Sopra', '030', NULL, '2023-02-27 18:49:07', 'D719');
INSERT INTO `comuni` VALUES ('030042', 'Forni di Sotto', '030', NULL, '2023-02-27 18:49:07', 'D720');
INSERT INTO `comuni` VALUES ('030043', 'Gemona del Friuli', '030', NULL, '2023-02-27 18:49:07', 'D962');
INSERT INTO `comuni` VALUES ('030044', 'Gonars', '030', NULL, '2023-02-27 18:49:07', 'E083');
INSERT INTO `comuni` VALUES ('030045', 'Grimacco', '030', NULL, '2023-02-27 18:49:07', 'E179');
INSERT INTO `comuni` VALUES ('030046', 'Latisana', '030', NULL, '2023-02-27 18:49:07', 'E473');
INSERT INTO `comuni` VALUES ('030047', 'Lauco', '030', NULL, '2023-02-27 18:49:07', 'E476');
INSERT INTO `comuni` VALUES ('030048', 'Lestizza', '030', NULL, '2023-02-27 18:49:07', 'E553');
INSERT INTO `comuni` VALUES ('030049', 'Lignano Sabbiadoro', '030', NULL, '2023-02-27 18:49:07', 'E584');
INSERT INTO `comuni` VALUES ('030050', 'Ligosullo', '030', NULL, '2023-02-27 18:49:07', 'E586');
INSERT INTO `comuni` VALUES ('030051', 'Lusevera', '030', NULL, '2023-02-27 18:49:07', 'E760');
INSERT INTO `comuni` VALUES ('030052', 'Magnano in Riviera', '030', NULL, '2023-02-27 18:49:07', 'E820');
INSERT INTO `comuni` VALUES ('030053', 'Majano', '030', NULL, '2023-02-27 18:49:07', 'E833');
INSERT INTO `comuni` VALUES ('030054', 'Malborghetto Valbruna', '030', NULL, '2023-02-27 18:49:07', 'E847');
INSERT INTO `comuni` VALUES ('030055', 'Manzano', '030', NULL, '2023-02-27 18:49:07', 'E899');
INSERT INTO `comuni` VALUES ('030056', 'Marano Lagunare', '030', NULL, '2023-02-27 18:49:07', 'E910');
INSERT INTO `comuni` VALUES ('030057', 'Martignacco', '030', NULL, '2023-02-27 18:49:07', 'E982');
INSERT INTO `comuni` VALUES ('030058', 'Mereto di Tomba', '030', NULL, '2023-02-27 18:49:07', 'F144');
INSERT INTO `comuni` VALUES ('030059', 'Moggio Udinese', '030', NULL, '2023-02-27 18:49:07', 'F266');
INSERT INTO `comuni` VALUES ('030060', 'Moimacco', '030', NULL, '2023-02-27 18:49:07', 'F275');
INSERT INTO `comuni` VALUES ('030061', 'Montenars', '030', NULL, '2023-02-27 18:49:07', 'F574');
INSERT INTO `comuni` VALUES ('030062', 'Mortegliano', '030', NULL, '2023-02-27 18:49:07', 'F756');
INSERT INTO `comuni` VALUES ('030063', 'Moruzzo', '030', NULL, '2023-02-27 18:49:07', 'F760');
INSERT INTO `comuni` VALUES ('030064', 'Muzzana del Turgnano', '030', NULL, '2023-02-27 18:49:07', 'F832');
INSERT INTO `comuni` VALUES ('030065', 'Nimis', '030', NULL, '2023-02-27 18:49:07', 'F898');
INSERT INTO `comuni` VALUES ('030066', 'Osoppo', '030', NULL, '2023-02-27 18:49:07', 'G163');
INSERT INTO `comuni` VALUES ('030067', 'Ovaro', '030', NULL, '2023-02-27 18:49:07', 'G198');
INSERT INTO `comuni` VALUES ('030068', 'Pagnacco', '030', NULL, '2023-02-27 18:49:07', 'G238');
INSERT INTO `comuni` VALUES ('030069', 'Palazzolo dello Stella', '030', NULL, '2023-02-27 18:49:07', 'G268');
INSERT INTO `comuni` VALUES ('030070', 'Palmanova', '030', NULL, '2023-02-27 18:49:07', 'G284');
INSERT INTO `comuni` VALUES ('030071', 'Paluzza', '030', NULL, '2023-02-27 18:49:07', 'G300');
INSERT INTO `comuni` VALUES ('030072', 'Pasian di Prato', '030', NULL, '2023-02-27 18:49:07', 'G352');
INSERT INTO `comuni` VALUES ('030073', 'Paularo', '030', NULL, '2023-02-27 18:49:07', 'G381');
INSERT INTO `comuni` VALUES ('030074', 'Pavia di Udine', '030', NULL, '2023-02-27 18:49:07', 'G389');
INSERT INTO `comuni` VALUES ('030075', 'Pocenia', '030', NULL, '2023-02-27 18:49:07', 'G743');
INSERT INTO `comuni` VALUES ('030076', 'Pontebba', '030', NULL, '2023-02-27 18:49:07', 'G831');
INSERT INTO `comuni` VALUES ('030077', 'Porpetto', '030', NULL, '2023-02-27 18:49:07', 'G891');
INSERT INTO `comuni` VALUES ('030078', 'Povoletto', '030', NULL, '2023-02-27 18:49:07', 'G949');
INSERT INTO `comuni` VALUES ('030079', 'Pozzuolo del Friuli', '030', NULL, '2023-02-27 18:49:07', 'G966');
INSERT INTO `comuni` VALUES ('030080', 'Pradamano', '030', NULL, '2023-02-27 18:49:07', 'G969');
INSERT INTO `comuni` VALUES ('030081', 'Prato Carnico', '030', NULL, '2023-02-27 18:49:07', 'H002');
INSERT INTO `comuni` VALUES ('030082', 'Precenicco', '030', NULL, '2023-02-27 18:49:07', 'H014');
INSERT INTO `comuni` VALUES ('030083', 'Premariacco', '030', NULL, '2023-02-27 18:49:07', 'H029');
INSERT INTO `comuni` VALUES ('030084', 'Preone', '030', NULL, '2023-02-27 18:49:07', 'H038');
INSERT INTO `comuni` VALUES ('030085', 'Prepotto', '030', NULL, '2023-02-27 18:49:07', 'H040');
INSERT INTO `comuni` VALUES ('030086', 'Pulfero', '030', NULL, '2023-02-27 18:49:07', 'H089');
INSERT INTO `comuni` VALUES ('030087', 'Ragogna', '030', NULL, '2023-02-27 18:49:07', 'H161');
INSERT INTO `comuni` VALUES ('030088', 'Ravascletto', '030', NULL, '2023-02-27 18:49:07', 'H196');
INSERT INTO `comuni` VALUES ('030089', 'Raveo', '030', NULL, '2023-02-27 18:49:07', 'H200');
INSERT INTO `comuni` VALUES ('030090', 'Reana del Rojale', '030', NULL, '2023-02-27 18:49:07', 'H206');
INSERT INTO `comuni` VALUES ('030091', 'Remanzacco', '030', NULL, '2023-02-27 18:49:07', 'H229');
INSERT INTO `comuni` VALUES ('030092', 'Resia', '030', NULL, '2023-02-27 18:49:07', 'H242');
INSERT INTO `comuni` VALUES ('030093', 'Resiutta', '030', NULL, '2023-02-27 18:49:07', 'H244');
INSERT INTO `comuni` VALUES ('030094', 'Rigolato', '030', NULL, '2023-02-27 18:49:07', 'H289');
INSERT INTO `comuni` VALUES ('030095', 'Rive d\'Arcano', '030', NULL, '2023-02-27 18:49:07', 'H347');
INSERT INTO `comuni` VALUES ('030097', 'Ronchis', '030', NULL, '2023-02-27 18:49:07', 'H533');
INSERT INTO `comuni` VALUES ('030098', 'Ruda', '030', NULL, '2023-02-27 18:49:07', 'H629');
INSERT INTO `comuni` VALUES ('030099', 'San Daniele del Friuli', '030', NULL, '2023-02-27 18:49:07', 'H816');
INSERT INTO `comuni` VALUES ('030100', 'San Giorgio di Nogaro', '030', NULL, '2023-02-27 18:49:07', 'H895');
INSERT INTO `comuni` VALUES ('030101', 'San Giovanni al Natisone', '030', NULL, '2023-02-27 18:49:07', 'H906');
INSERT INTO `comuni` VALUES ('030102', 'San Leonardo', '030', NULL, '2023-02-27 18:49:07', 'H951');
INSERT INTO `comuni` VALUES ('030103', 'San Pietro al Natisone', '030', NULL, '2023-02-27 18:49:07', 'I092');
INSERT INTO `comuni` VALUES ('030104', 'Santa Maria la Longa', '030', NULL, '2023-02-27 18:49:07', 'I248');
INSERT INTO `comuni` VALUES ('030105', 'San Vito al Torre', '030', NULL, '2023-02-27 18:49:07', 'I404');
INSERT INTO `comuni` VALUES ('030106', 'San Vito di Fagagna', '030', NULL, '2023-02-27 18:49:07', 'I405');
INSERT INTO `comuni` VALUES ('030107', 'Sauris', '030', NULL, '2023-02-27 18:49:07', 'I464');
INSERT INTO `comuni` VALUES ('030108', 'Savogna', '030', NULL, '2023-02-27 18:49:07', 'I478');
INSERT INTO `comuni` VALUES ('030109', 'Sedegliano', '030', NULL, '2023-02-27 18:49:07', 'I562');
INSERT INTO `comuni` VALUES ('030110', 'Socchieve', '030', NULL, '2023-02-27 18:49:07', 'I777');
INSERT INTO `comuni` VALUES ('030111', 'Stregna', '030', NULL, '2023-02-27 18:49:07', 'I974');
INSERT INTO `comuni` VALUES ('030112', 'Sutrio', '030', NULL, '2023-02-27 18:49:07', 'L018');
INSERT INTO `comuni` VALUES ('030113', 'Taipana', '030', NULL, '2023-02-27 18:49:07', 'G736');
INSERT INTO `comuni` VALUES ('030114', 'Talmassons', '030', NULL, '2023-02-27 18:49:07', 'L039');
INSERT INTO `comuni` VALUES ('030116', 'Tarcento', '030', NULL, '2023-02-27 18:49:07', 'L050');
INSERT INTO `comuni` VALUES ('030117', 'Tarvisio', '030', NULL, '2023-02-27 18:49:07', 'L057');
INSERT INTO `comuni` VALUES ('030118', 'Tavagnacco', '030', NULL, '2023-02-27 18:49:07', 'L065');
INSERT INTO `comuni` VALUES ('030120', 'Terzo d\'Aquileia', '030', NULL, '2023-02-27 18:49:07', 'L144');
INSERT INTO `comuni` VALUES ('030121', 'Tolmezzo', '030', NULL, '2023-02-27 18:49:07', 'L195');
INSERT INTO `comuni` VALUES ('030122', 'Torreano', '030', NULL, '2023-02-27 18:49:07', 'L246');
INSERT INTO `comuni` VALUES ('030123', 'Torviscosa', '030', NULL, '2023-02-27 18:49:07', 'L309');
INSERT INTO `comuni` VALUES ('030124', 'Trasaghis', '030', NULL, '2023-02-27 18:49:07', 'L335');
INSERT INTO `comuni` VALUES ('030125', 'Treppo Carnico', '030', NULL, '2023-02-27 18:49:07', 'L381');
INSERT INTO `comuni` VALUES ('030126', 'Treppo Grande', '030', NULL, '2023-02-27 18:49:07', 'L382');
INSERT INTO `comuni` VALUES ('030127', 'Tricesimo', '030', NULL, '2023-02-27 18:49:07', 'L421');
INSERT INTO `comuni` VALUES ('030128', 'Trivignano Udinese', '030', NULL, '2023-02-27 18:49:07', 'L438');
INSERT INTO `comuni` VALUES ('030129', 'Udine', '030', NULL, '2023-02-27 18:49:07', 'L483');
INSERT INTO `comuni` VALUES ('030130', 'Varmo', '030', NULL, '2023-02-27 18:49:07', 'L686');
INSERT INTO `comuni` VALUES ('030131', 'Venzone', '030', NULL, '2023-02-27 18:49:07', 'L743');
INSERT INTO `comuni` VALUES ('030132', 'Verzegnis', '030', NULL, '2023-02-27 18:49:07', 'L801');
INSERT INTO `comuni` VALUES ('030133', 'Villa Santina', '030', NULL, '2023-02-27 18:49:07', 'L909');
INSERT INTO `comuni` VALUES ('030134', 'Villa Vicentina', '030', NULL, '2023-02-27 18:49:07', 'M034');
INSERT INTO `comuni` VALUES ('030135', 'Visco', '030', NULL, '2023-02-27 18:49:07', 'M073');
INSERT INTO `comuni` VALUES ('030136', 'Zuglio', '030', NULL, '2023-02-27 18:49:07', 'M200');
INSERT INTO `comuni` VALUES ('030137', 'Forgaria nel Friuli', '030', NULL, '2023-02-27 18:49:07', 'D700');
INSERT INTO `comuni` VALUES ('030138', 'Campolongo Tapogliano', '030', NULL, '2023-02-27 18:49:07', 'M311');
INSERT INTO `comuni` VALUES ('030188', 'Rivignano Teor', '030', NULL, '2023-02-27 18:49:07', 'M317');
INSERT INTO `comuni` VALUES ('031001', 'Capriva del Friuli', '031', NULL, '2023-02-27 18:49:07', 'B712');
INSERT INTO `comuni` VALUES ('031002', 'Cormons', '031', NULL, '2023-02-27 18:49:07', 'D014');
INSERT INTO `comuni` VALUES ('031003', 'Doberdò del Lago', '031', NULL, '2023-02-27 18:49:07', 'D312');
INSERT INTO `comuni` VALUES ('031004', 'Dolegna del Collio', '031', NULL, '2023-02-27 18:49:07', 'D321');
INSERT INTO `comuni` VALUES ('031005', 'Farra d\'Isonzo', '031', NULL, '2023-02-27 18:49:07', 'D504');
INSERT INTO `comuni` VALUES ('031006', 'Fogliano Redipuglia', '031', NULL, '2023-02-27 18:49:07', 'D645');
INSERT INTO `comuni` VALUES ('031007', 'Gorizia', '031', NULL, '2023-02-27 18:49:07', 'E098');
INSERT INTO `comuni` VALUES ('031008', 'Gradisca d\'Isonzo', '031', NULL, '2023-02-27 18:49:07', 'E124');
INSERT INTO `comuni` VALUES ('031009', 'Grado', '031', NULL, '2023-02-27 18:49:07', 'E125');
INSERT INTO `comuni` VALUES ('031010', 'Mariano del Friuli', '031', NULL, '2023-02-27 18:49:07', 'E952');
INSERT INTO `comuni` VALUES ('031011', 'Medea', '031', NULL, '2023-02-27 18:49:07', 'F081');
INSERT INTO `comuni` VALUES ('031012', 'Monfalcone', '031', NULL, '2023-02-27 18:49:07', 'F356');
INSERT INTO `comuni` VALUES ('031013', 'Moraro', '031', NULL, '2023-02-27 18:49:07', 'F710');
INSERT INTO `comuni` VALUES ('031014', 'Mossa', '031', NULL, '2023-02-27 18:49:07', 'F767');
INSERT INTO `comuni` VALUES ('031015', 'Romans d\'Isonzo', '031', NULL, '2023-02-27 18:49:07', 'H514');
INSERT INTO `comuni` VALUES ('031016', 'Ronchi dei Legionari', '031', NULL, '2023-02-27 18:49:07', 'H531');
INSERT INTO `comuni` VALUES ('031017', 'Sagrado', '031', NULL, '2023-02-27 18:49:07', 'H665');
INSERT INTO `comuni` VALUES ('031018', 'San Canzian d\'Isonzo', '031', NULL, '2023-02-27 18:49:07', 'H787');
INSERT INTO `comuni` VALUES ('031019', 'San Floriano del Collio', '031', NULL, '2023-02-27 18:49:07', 'H845');
INSERT INTO `comuni` VALUES ('031020', 'San Lorenzo Isontino', '031', NULL, '2023-02-27 18:49:07', 'H964');
INSERT INTO `comuni` VALUES ('031021', 'San Pier d\'Isonzo', '031', NULL, '2023-02-27 18:49:07', 'I082');
INSERT INTO `comuni` VALUES ('031022', 'Savogna d\'Isonzo', '031', NULL, '2023-02-27 18:49:07', 'I479');
INSERT INTO `comuni` VALUES ('031023', 'Staranzano', '031', NULL, '2023-02-27 18:49:07', 'I939');
INSERT INTO `comuni` VALUES ('031024', 'Turriaco', '031', NULL, '2023-02-27 18:49:07', 'L474');
INSERT INTO `comuni` VALUES ('031025', 'Villesse', '031', NULL, '2023-02-27 18:49:07', 'M043');
INSERT INTO `comuni` VALUES ('032001', 'Duino-Aurisina', '032', NULL, '2023-02-27 18:49:07', 'D383');
INSERT INTO `comuni` VALUES ('032002', 'Monrupino', '032', NULL, '2023-02-27 18:49:07', 'F378');
INSERT INTO `comuni` VALUES ('032003', 'Muggia', '032', NULL, '2023-02-27 18:49:07', 'F795');
INSERT INTO `comuni` VALUES ('032004', 'San Dorligo della Valle-Dolina', '032', NULL, '2023-02-27 18:49:07', 'D324');
INSERT INTO `comuni` VALUES ('032005', 'Sgonico', '032', NULL, '2023-02-27 18:49:07', 'I715');
INSERT INTO `comuni` VALUES ('032006', 'Trieste', '032', NULL, '2023-02-27 18:49:07', 'L424');
INSERT INTO `comuni` VALUES ('033001', 'Agazzano', '033', NULL, '2023-02-27 18:49:07', 'A067');
INSERT INTO `comuni` VALUES ('033002', 'Alseno', '033', NULL, '2023-02-27 18:49:07', 'A223');
INSERT INTO `comuni` VALUES ('033003', 'Besenzone', '033', NULL, '2023-02-27 18:49:07', 'A823');
INSERT INTO `comuni` VALUES ('033004', 'Bettola', '033', NULL, '2023-02-27 18:49:07', 'A831');
INSERT INTO `comuni` VALUES ('033005', 'Bobbio', '033', NULL, '2023-02-27 18:49:07', 'A909');
INSERT INTO `comuni` VALUES ('033006', 'Borgonovo Val Tidone', '033', NULL, '2023-02-27 18:49:07', 'B025');
INSERT INTO `comuni` VALUES ('033007', 'Cadeo', '033', NULL, '2023-02-27 18:49:07', 'B332');
INSERT INTO `comuni` VALUES ('033008', 'Calendasco', '033', NULL, '2023-02-27 18:49:07', 'B405');
INSERT INTO `comuni` VALUES ('033009', 'Caminata', '033', NULL, '2023-02-27 18:49:07', 'B479');
INSERT INTO `comuni` VALUES ('033010', 'Caorso', '033', NULL, '2023-02-27 18:49:07', 'B643');
INSERT INTO `comuni` VALUES ('033011', 'Carpaneto Piacentino', '033', NULL, '2023-02-27 18:49:07', 'B812');
INSERT INTO `comuni` VALUES ('033012', 'Castell\'Arquato', '033', NULL, '2023-02-27 18:49:07', 'C145');
INSERT INTO `comuni` VALUES ('033013', 'Castel San Giovanni', '033', NULL, '2023-02-27 18:49:07', 'C261');
INSERT INTO `comuni` VALUES ('033014', 'Castelvetro Piacentino', '033', NULL, '2023-02-27 18:49:07', 'C288');
INSERT INTO `comuni` VALUES ('033015', 'Cerignale', '033', NULL, '2023-02-27 18:49:07', 'C513');
INSERT INTO `comuni` VALUES ('033016', 'Coli', '033', NULL, '2023-02-27 18:49:07', 'C838');
INSERT INTO `comuni` VALUES ('033017', 'Corte Brugnatella', '033', NULL, '2023-02-27 18:49:07', 'D054');
INSERT INTO `comuni` VALUES ('033018', 'Cortemaggiore', '033', NULL, '2023-02-27 18:49:07', 'D061');
INSERT INTO `comuni` VALUES ('033019', 'Farini', '033', NULL, '2023-02-27 18:49:07', 'D502');
INSERT INTO `comuni` VALUES ('033020', 'Ferriere', '033', NULL, '2023-02-27 18:49:07', 'D555');
INSERT INTO `comuni` VALUES ('033021', 'Fiorenzuola d\'Arda', '033', NULL, '2023-02-27 18:49:07', 'D611');
INSERT INTO `comuni` VALUES ('033022', 'Gazzola', '033', NULL, '2023-02-27 18:49:07', 'D958');
INSERT INTO `comuni` VALUES ('033023', 'Gossolengo', '033', NULL, '2023-02-27 18:49:07', 'E114');
INSERT INTO `comuni` VALUES ('033024', 'Gragnano Trebbiense', '033', NULL, '2023-02-27 18:49:07', 'E132');
INSERT INTO `comuni` VALUES ('033025', 'Gropparello', '033', NULL, '2023-02-27 18:49:07', 'E196');
INSERT INTO `comuni` VALUES ('033026', 'Lugagnano Val d\'Arda', '033', NULL, '2023-02-27 18:49:07', 'E726');
INSERT INTO `comuni` VALUES ('033027', 'Monticelli d\'Ongina', '033', NULL, '2023-02-27 18:49:07', 'F671');
INSERT INTO `comuni` VALUES ('033028', 'Morfasso', '033', NULL, '2023-02-27 18:49:07', 'F724');
INSERT INTO `comuni` VALUES ('033029', 'Nibbiano', '033', NULL, '2023-02-27 18:49:07', 'F885');
INSERT INTO `comuni` VALUES ('033030', 'Ottone', '033', NULL, '2023-02-27 18:49:07', 'G195');
INSERT INTO `comuni` VALUES ('033031', 'Pecorara', '033', NULL, '2023-02-27 18:49:07', 'G399');
INSERT INTO `comuni` VALUES ('033032', 'Piacenza', '033', NULL, '2023-02-27 18:49:07', 'G535');
INSERT INTO `comuni` VALUES ('033033', 'Pianello Val Tidone', '033', NULL, '2023-02-27 18:49:07', 'G557');
INSERT INTO `comuni` VALUES ('033034', 'Piozzano', '033', NULL, '2023-02-27 18:49:07', 'G696');
INSERT INTO `comuni` VALUES ('033035', 'Podenzano', '033', NULL, '2023-02-27 18:49:07', 'G747');
INSERT INTO `comuni` VALUES ('033036', 'Ponte dell\'Olio', '033', NULL, '2023-02-27 18:49:07', 'G842');
INSERT INTO `comuni` VALUES ('033037', 'Pontenure', '033', NULL, '2023-02-27 18:49:07', 'G852');
INSERT INTO `comuni` VALUES ('033038', 'Rivergaro', '033', NULL, '2023-02-27 18:49:07', 'H350');
INSERT INTO `comuni` VALUES ('033039', 'Rottofreno', '033', NULL, '2023-02-27 18:49:07', 'H593');
INSERT INTO `comuni` VALUES ('033040', 'San Giorgio Piacentino', '033', NULL, '2023-02-27 18:49:07', 'H887');
INSERT INTO `comuni` VALUES ('033041', 'San Pietro in Cerro', '033', NULL, '2023-02-27 18:49:07', 'G788');
INSERT INTO `comuni` VALUES ('033042', 'Sarmato', '033', NULL, '2023-02-27 18:49:07', 'I434');
INSERT INTO `comuni` VALUES ('033043', 'Travo', '033', NULL, '2023-02-27 18:49:07', 'L348');
INSERT INTO `comuni` VALUES ('033044', 'Vernasca', '033', NULL, '2023-02-27 18:49:07', 'L772');
INSERT INTO `comuni` VALUES ('033045', 'Vigolzone', '033', NULL, '2023-02-27 18:49:07', 'L897');
INSERT INTO `comuni` VALUES ('033046', 'Villanova sull\'Arda', '033', NULL, '2023-02-27 18:49:07', 'L980');
INSERT INTO `comuni` VALUES ('033047', 'Zerba', '033', NULL, '2023-02-27 18:49:07', 'M165');
INSERT INTO `comuni` VALUES ('033048', 'Ziano Piacentino', '033', NULL, '2023-02-27 18:49:07', 'L848');
INSERT INTO `comuni` VALUES ('034001', 'Albareto', '034', NULL, '2023-02-27 18:49:07', 'A138');
INSERT INTO `comuni` VALUES ('034002', 'Bardi', '034', NULL, '2023-02-27 18:49:07', 'A646');
INSERT INTO `comuni` VALUES ('034003', 'Bedonia', '034', NULL, '2023-02-27 18:49:07', 'A731');
INSERT INTO `comuni` VALUES ('034004', 'Berceto', '034', NULL, '2023-02-27 18:49:07', 'A788');
INSERT INTO `comuni` VALUES ('034005', 'Bore', '034', NULL, '2023-02-27 18:49:07', 'A987');
INSERT INTO `comuni` VALUES ('034006', 'Borgo Val di Taro', '034', NULL, '2023-02-27 18:49:07', 'B042');
INSERT INTO `comuni` VALUES ('034007', 'Busseto', '034', NULL, '2023-02-27 18:49:07', 'B293');
INSERT INTO `comuni` VALUES ('034008', 'Calestano', '034', NULL, '2023-02-27 18:49:07', 'B408');
INSERT INTO `comuni` VALUES ('034009', 'Collecchio', '034', NULL, '2023-02-27 18:49:07', 'C852');
INSERT INTO `comuni` VALUES ('034010', 'Colorno', '034', NULL, '2023-02-27 18:49:07', 'C904');
INSERT INTO `comuni` VALUES ('034011', 'Compiano', '034', NULL, '2023-02-27 18:49:07', 'C934');
INSERT INTO `comuni` VALUES ('034012', 'Corniglio', '034', NULL, '2023-02-27 18:49:07', 'D026');
INSERT INTO `comuni` VALUES ('034013', 'Felino', '034', NULL, '2023-02-27 18:49:07', 'D526');
INSERT INTO `comuni` VALUES ('034014', 'Fidenza', '034', NULL, '2023-02-27 18:49:07', 'B034');
INSERT INTO `comuni` VALUES ('034015', 'Fontanellato', '034', NULL, '2023-02-27 18:49:07', 'D673');
INSERT INTO `comuni` VALUES ('034016', 'Fontevivo', '034', NULL, '2023-02-27 18:49:07', 'D685');
INSERT INTO `comuni` VALUES ('034017', 'Fornovo di Taro', '034', NULL, '2023-02-27 18:49:07', 'D728');
INSERT INTO `comuni` VALUES ('034018', 'Langhirano', '034', NULL, '2023-02-27 18:49:07', 'E438');
INSERT INTO `comuni` VALUES ('034019', 'Lesignano de\' Bagni', '034', NULL, '2023-02-27 18:49:07', 'E547');
INSERT INTO `comuni` VALUES ('034020', 'Medesano', '034', NULL, '2023-02-27 18:49:07', 'F082');
INSERT INTO `comuni` VALUES ('034021', 'Mezzani', '034', NULL, '2023-02-27 18:49:07', 'F174');
INSERT INTO `comuni` VALUES ('034022', 'Monchio delle Corti', '034', NULL, '2023-02-27 18:49:07', 'F340');
INSERT INTO `comuni` VALUES ('034023', 'Montechiarugolo', '034', NULL, '2023-02-27 18:49:07', 'F473');
INSERT INTO `comuni` VALUES ('034024', 'Neviano degli Arduini', '034', NULL, '2023-02-27 18:49:07', 'F882');
INSERT INTO `comuni` VALUES ('034025', 'Noceto', '034', NULL, '2023-02-27 18:49:07', 'F914');
INSERT INTO `comuni` VALUES ('034026', 'Palanzano', '034', NULL, '2023-02-27 18:49:07', 'G255');
INSERT INTO `comuni` VALUES ('034027', 'Parma', '034', NULL, '2023-02-27 18:49:07', 'G337');
INSERT INTO `comuni` VALUES ('034028', 'Pellegrino Parmense', '034', NULL, '2023-02-27 18:49:07', 'G424');
INSERT INTO `comuni` VALUES ('034029', 'Polesine Parmense', '034', NULL, '2023-02-27 18:49:07', 'G783');
INSERT INTO `comuni` VALUES ('034030', 'Roccabianca', '034', NULL, '2023-02-27 18:49:07', 'H384');
INSERT INTO `comuni` VALUES ('034031', 'Sala Baganza', '034', NULL, '2023-02-27 18:49:07', 'H682');
INSERT INTO `comuni` VALUES ('034032', 'Salsomaggiore Terme', '034', NULL, '2023-02-27 18:49:07', 'H720');
INSERT INTO `comuni` VALUES ('034033', 'San Secondo Parmense', '034', NULL, '2023-02-27 18:49:07', 'I153');
INSERT INTO `comuni` VALUES ('034035', 'Solignano', '034', NULL, '2023-02-27 18:49:07', 'I803');
INSERT INTO `comuni` VALUES ('034036', 'Soragna', '034', NULL, '2023-02-27 18:49:07', 'I840');
INSERT INTO `comuni` VALUES ('034037', 'Sorbolo', '034', NULL, '2023-02-27 18:49:07', 'I845');
INSERT INTO `comuni` VALUES ('034038', 'Terenzo', '034', NULL, '2023-02-27 18:49:07', 'E548');
INSERT INTO `comuni` VALUES ('034039', 'Tizzano Val Parma', '034', NULL, '2023-02-27 18:49:07', 'L183');
INSERT INTO `comuni` VALUES ('034040', 'Tornolo', '034', NULL, '2023-02-27 18:49:07', 'L229');
INSERT INTO `comuni` VALUES ('034041', 'Torrile', '034', NULL, '2023-02-27 18:49:07', 'L299');
INSERT INTO `comuni` VALUES ('034042', 'Traversetolo', '034', NULL, '2023-02-27 18:49:07', 'L346');
INSERT INTO `comuni` VALUES ('034044', 'Valmozzola', '034', NULL, '2023-02-27 18:49:07', 'L641');
INSERT INTO `comuni` VALUES ('034045', 'Varano de\' Melegari', '034', NULL, '2023-02-27 18:49:07', 'L672');
INSERT INTO `comuni` VALUES ('034046', 'Varsi', '034', NULL, '2023-02-27 18:49:07', 'L689');
INSERT INTO `comuni` VALUES ('034048', 'Zibello', '034', NULL, '2023-02-27 18:49:07', 'M174');
INSERT INTO `comuni` VALUES ('034049', 'Sissa Trecasali', '034', NULL, '2023-02-27 18:49:07', 'M325');
INSERT INTO `comuni` VALUES ('035001', 'Albinea', '035', NULL, '2023-02-27 18:49:07', 'A162');
INSERT INTO `comuni` VALUES ('035002', 'Bagnolo in Piano', '035', NULL, '2023-02-27 18:49:07', 'A573');
INSERT INTO `comuni` VALUES ('035003', 'Baiso', '035', NULL, '2023-02-27 18:49:07', 'A586');
INSERT INTO `comuni` VALUES ('035004', 'Bibbiano', '035', NULL, '2023-02-27 18:49:07', 'A850');
INSERT INTO `comuni` VALUES ('035005', 'Boretto', '035', NULL, '2023-02-27 18:49:07', 'A988');
INSERT INTO `comuni` VALUES ('035006', 'Brescello', '035', NULL, '2023-02-27 18:49:07', 'B156');
INSERT INTO `comuni` VALUES ('035007', 'Busana', '035', NULL, '2023-02-27 18:49:07', 'B283');
INSERT INTO `comuni` VALUES ('035008', 'Cadelbosco di Sopra', '035', NULL, '2023-02-27 18:49:07', 'B328');
INSERT INTO `comuni` VALUES ('035009', 'Campagnola Emilia', '035', NULL, '2023-02-27 18:49:07', 'B499');
INSERT INTO `comuni` VALUES ('035010', 'Campegine', '035', NULL, '2023-02-27 18:49:07', 'B502');
INSERT INTO `comuni` VALUES ('035011', 'Carpineti', '035', NULL, '2023-02-27 18:49:07', 'B825');
INSERT INTO `comuni` VALUES ('035012', 'Casalgrande', '035', NULL, '2023-02-27 18:49:07', 'B893');
INSERT INTO `comuni` VALUES ('035013', 'Casina', '035', NULL, '2023-02-27 18:49:07', 'B967');
INSERT INTO `comuni` VALUES ('035014', 'Castellarano', '035', NULL, '2023-02-27 18:49:07', 'C141');
INSERT INTO `comuni` VALUES ('035015', 'Castelnovo di Sotto', '035', NULL, '2023-02-27 18:49:07', 'C218');
INSERT INTO `comuni` VALUES ('035016', 'Castelnovo ne\' Monti', '035', NULL, '2023-02-27 18:49:07', 'C219');
INSERT INTO `comuni` VALUES ('035017', 'Cavriago', '035', NULL, '2023-02-27 18:49:07', 'C405');
INSERT INTO `comuni` VALUES ('035018', 'Canossa', '035', NULL, '2023-02-27 18:49:07', 'C669');
INSERT INTO `comuni` VALUES ('035019', 'Collagna', '035', NULL, '2023-02-27 18:49:07', 'C840');
INSERT INTO `comuni` VALUES ('035020', 'Correggio', '035', NULL, '2023-02-27 18:49:07', 'D037');
INSERT INTO `comuni` VALUES ('035021', 'Fabbrico', '035', NULL, '2023-02-27 18:49:07', 'D450');
INSERT INTO `comuni` VALUES ('035022', 'Gattatico', '035', NULL, '2023-02-27 18:49:07', 'D934');
INSERT INTO `comuni` VALUES ('035023', 'Gualtieri', '035', NULL, '2023-02-27 18:49:07', 'E232');
INSERT INTO `comuni` VALUES ('035024', 'Guastalla', '035', NULL, '2023-02-27 18:49:07', 'E253');
INSERT INTO `comuni` VALUES ('035025', 'Ligonchio', '035', NULL, '2023-02-27 18:49:07', 'E585');
INSERT INTO `comuni` VALUES ('035026', 'Luzzara', '035', NULL, '2023-02-27 18:49:07', 'E772');
INSERT INTO `comuni` VALUES ('035027', 'Montecchio Emilia', '035', NULL, '2023-02-27 18:49:07', 'F463');
INSERT INTO `comuni` VALUES ('035028', 'Novellara', '035', NULL, '2023-02-27 18:49:07', 'F960');
INSERT INTO `comuni` VALUES ('035029', 'Poviglio', '035', NULL, '2023-02-27 18:49:07', 'G947');
INSERT INTO `comuni` VALUES ('035030', 'Quattro Castella', '035', NULL, '2023-02-27 18:49:07', 'H122');
INSERT INTO `comuni` VALUES ('035031', 'Ramiseto', '035', NULL, '2023-02-27 18:49:07', 'G654');
INSERT INTO `comuni` VALUES ('035032', 'Reggiolo', '035', NULL, '2023-02-27 18:49:07', 'H225');
INSERT INTO `comuni` VALUES ('035033', 'Reggio nell\'Emilia', '035', NULL, '2023-02-27 18:49:07', 'H223');
INSERT INTO `comuni` VALUES ('035034', 'Rio Saliceto', '035', NULL, '2023-02-27 18:49:07', 'H298');
INSERT INTO `comuni` VALUES ('035035', 'Rolo', '035', NULL, '2023-02-27 18:49:07', 'H500');
INSERT INTO `comuni` VALUES ('035036', 'Rubiera', '035', NULL, '2023-02-27 18:49:07', 'H628');
INSERT INTO `comuni` VALUES ('035037', 'San Martino in Rio', '035', NULL, '2023-02-27 18:49:07', 'I011');
INSERT INTO `comuni` VALUES ('035038', 'San Polo d\'Enza', '035', NULL, '2023-02-27 18:49:07', 'I123');
INSERT INTO `comuni` VALUES ('035039', 'Sant\'Ilario d\'Enza', '035', NULL, '2023-02-27 18:49:07', 'I342');
INSERT INTO `comuni` VALUES ('035040', 'Scandiano', '035', NULL, '2023-02-27 18:49:07', 'I496');
INSERT INTO `comuni` VALUES ('035041', 'Toano', '035', NULL, '2023-02-27 18:49:07', 'L184');
INSERT INTO `comuni` VALUES ('035042', 'Vetto', '035', NULL, '2023-02-27 18:49:07', 'L815');
INSERT INTO `comuni` VALUES ('035043', 'Vezzano sul Crostolo', '035', NULL, '2023-02-27 18:49:07', 'L820');
INSERT INTO `comuni` VALUES ('035044', 'Viano', '035', NULL, '2023-02-27 18:49:07', 'L831');
INSERT INTO `comuni` VALUES ('035045', 'Villa Minozzo', '035', NULL, '2023-02-27 18:49:07', 'L969');
INSERT INTO `comuni` VALUES ('036001', 'Bastiglia', '036', NULL, '2023-02-27 18:49:07', 'A713');
INSERT INTO `comuni` VALUES ('036002', 'Bomporto', '036', NULL, '2023-02-27 18:49:07', 'A959');
INSERT INTO `comuni` VALUES ('036003', 'Campogalliano', '036', NULL, '2023-02-27 18:49:07', 'B539');
INSERT INTO `comuni` VALUES ('036004', 'Camposanto', '036', NULL, '2023-02-27 18:49:07', 'B566');
INSERT INTO `comuni` VALUES ('036005', 'Carpi', '036', NULL, '2023-02-27 18:49:07', 'B819');
INSERT INTO `comuni` VALUES ('036006', 'Castelfranco Emilia', '036', NULL, '2023-02-27 18:49:07', 'C107');
INSERT INTO `comuni` VALUES ('036007', 'Castelnuovo Rangone', '036', NULL, '2023-02-27 18:49:07', 'C242');
INSERT INTO `comuni` VALUES ('036008', 'Castelvetro di Modena', '036', NULL, '2023-02-27 18:49:07', 'C287');
INSERT INTO `comuni` VALUES ('036009', 'Cavezzo', '036', NULL, '2023-02-27 18:49:07', 'C398');
INSERT INTO `comuni` VALUES ('036010', 'Concordia sulla Secchia', '036', NULL, '2023-02-27 18:49:07', 'C951');
INSERT INTO `comuni` VALUES ('036011', 'Fanano', '036', NULL, '2023-02-27 18:49:07', 'D486');
INSERT INTO `comuni` VALUES ('036012', 'Finale Emilia', '036', NULL, '2023-02-27 18:49:07', 'D599');
INSERT INTO `comuni` VALUES ('036013', 'Fiorano Modenese', '036', NULL, '2023-02-27 18:49:07', 'D607');
INSERT INTO `comuni` VALUES ('036014', 'Fiumalbo', '036', NULL, '2023-02-27 18:49:07', 'D617');
INSERT INTO `comuni` VALUES ('036015', 'Formigine', '036', NULL, '2023-02-27 18:49:07', 'D711');
INSERT INTO `comuni` VALUES ('036016', 'Frassinoro', '036', NULL, '2023-02-27 18:49:07', 'D783');
INSERT INTO `comuni` VALUES ('036017', 'Guiglia', '036', NULL, '2023-02-27 18:49:07', 'E264');
INSERT INTO `comuni` VALUES ('036018', 'Lama Mocogno', '036', NULL, '2023-02-27 18:49:07', 'E426');
INSERT INTO `comuni` VALUES ('036019', 'Maranello', '036', NULL, '2023-02-27 18:49:07', 'E904');
INSERT INTO `comuni` VALUES ('036020', 'Marano sul Panaro', '036', NULL, '2023-02-27 18:49:07', 'E905');
INSERT INTO `comuni` VALUES ('036021', 'Medolla', '036', NULL, '2023-02-27 18:49:07', 'F087');
INSERT INTO `comuni` VALUES ('036022', 'Mirandola', '036', NULL, '2023-02-27 18:49:07', 'F240');
INSERT INTO `comuni` VALUES ('036023', 'Modena', '036', NULL, '2023-02-27 18:49:07', 'F257');
INSERT INTO `comuni` VALUES ('036024', 'Montecreto', '036', NULL, '2023-02-27 18:49:07', 'F484');
INSERT INTO `comuni` VALUES ('036025', 'Montefiorino', '036', NULL, '2023-02-27 18:49:07', 'F503');
INSERT INTO `comuni` VALUES ('036026', 'Montese', '036', NULL, '2023-02-27 18:49:07', 'F642');
INSERT INTO `comuni` VALUES ('036027', 'Nonantola', '036', NULL, '2023-02-27 18:49:07', 'F930');
INSERT INTO `comuni` VALUES ('036028', 'Novi di Modena', '036', NULL, '2023-02-27 18:49:07', 'F966');
INSERT INTO `comuni` VALUES ('036029', 'Palagano', '036', NULL, '2023-02-27 18:49:07', 'G250');
INSERT INTO `comuni` VALUES ('036030', 'Pavullo nel Frignano', '036', NULL, '2023-02-27 18:49:07', 'G393');
INSERT INTO `comuni` VALUES ('036031', 'Pievepelago', '036', NULL, '2023-02-27 18:49:07', 'G649');
INSERT INTO `comuni` VALUES ('036032', 'Polinago', '036', NULL, '2023-02-27 18:49:07', 'G789');
INSERT INTO `comuni` VALUES ('036033', 'Prignano sulla Secchia', '036', NULL, '2023-02-27 18:49:07', 'H061');
INSERT INTO `comuni` VALUES ('036034', 'Ravarino', '036', NULL, '2023-02-27 18:49:07', 'H195');
INSERT INTO `comuni` VALUES ('036035', 'Riolunato', '036', NULL, '2023-02-27 18:49:07', 'H303');
INSERT INTO `comuni` VALUES ('036036', 'San Cesario sul Panaro', '036', NULL, '2023-02-27 18:49:07', 'H794');
INSERT INTO `comuni` VALUES ('036037', 'San Felice sul Panaro', '036', NULL, '2023-02-27 18:49:07', 'H835');
INSERT INTO `comuni` VALUES ('036038', 'San Possidonio', '036', NULL, '2023-02-27 18:49:07', 'I128');
INSERT INTO `comuni` VALUES ('036039', 'San Prospero', '036', NULL, '2023-02-27 18:49:07', 'I133');
INSERT INTO `comuni` VALUES ('036040', 'Sassuolo', '036', NULL, '2023-02-27 18:49:07', 'I462');
INSERT INTO `comuni` VALUES ('036041', 'Savignano sul Panaro', '036', NULL, '2023-02-27 18:49:07', 'I473');
INSERT INTO `comuni` VALUES ('036042', 'Serramazzoni', '036', NULL, '2023-02-27 18:49:07', 'F357');
INSERT INTO `comuni` VALUES ('036043', 'Sestola', '036', NULL, '2023-02-27 18:49:07', 'I689');
INSERT INTO `comuni` VALUES ('036044', 'Soliera', '036', NULL, '2023-02-27 18:49:07', 'I802');
INSERT INTO `comuni` VALUES ('036045', 'Spilamberto', '036', NULL, '2023-02-27 18:49:07', 'I903');
INSERT INTO `comuni` VALUES ('036046', 'Vignola', '036', NULL, '2023-02-27 18:49:07', 'L885');
INSERT INTO `comuni` VALUES ('036047', 'Zocca', '036', NULL, '2023-02-27 18:49:07', 'M183');
INSERT INTO `comuni` VALUES ('037001', 'Anzola dell\'Emilia', '037', NULL, '2023-02-27 18:49:07', 'A324');
INSERT INTO `comuni` VALUES ('037002', 'Argelato', '037', NULL, '2023-02-27 18:49:07', 'A392');
INSERT INTO `comuni` VALUES ('037003', 'Baricella', '037', NULL, '2023-02-27 18:49:07', 'A665');
INSERT INTO `comuni` VALUES ('037005', 'Bentivoglio', '037', NULL, '2023-02-27 18:49:07', 'A785');
INSERT INTO `comuni` VALUES ('037006', 'Bologna', '037', NULL, '2023-02-27 18:49:07', 'A944');
INSERT INTO `comuni` VALUES ('037007', 'Borgo Tossignano', '037', NULL, '2023-02-27 18:49:07', 'B044');
INSERT INTO `comuni` VALUES ('037008', 'Budrio', '037', NULL, '2023-02-27 18:49:07', 'B249');
INSERT INTO `comuni` VALUES ('037009', 'Calderara di Reno', '037', NULL, '2023-02-27 18:49:07', 'B399');
INSERT INTO `comuni` VALUES ('037010', 'Camugnano', '037', NULL, '2023-02-27 18:49:07', 'B572');
INSERT INTO `comuni` VALUES ('037011', 'Casalecchio di Reno', '037', NULL, '2023-02-27 18:49:07', 'B880');
INSERT INTO `comuni` VALUES ('037012', 'Casalfiumanese', '037', NULL, '2023-02-27 18:49:07', 'B892');
INSERT INTO `comuni` VALUES ('037013', 'Castel d\'Aiano', '037', NULL, '2023-02-27 18:49:07', 'C075');
INSERT INTO `comuni` VALUES ('037014', 'Castel del Rio', '037', NULL, '2023-02-27 18:49:07', 'C086');
INSERT INTO `comuni` VALUES ('037015', 'Castel di Casio', '037', NULL, '2023-02-27 18:49:07', 'B969');
INSERT INTO `comuni` VALUES ('037016', 'Castel Guelfo di Bologna', '037', NULL, '2023-02-27 18:49:07', 'C121');
INSERT INTO `comuni` VALUES ('037017', 'Castello d\'Argile', '037', NULL, '2023-02-27 18:49:07', 'C185');
INSERT INTO `comuni` VALUES ('037019', 'Castel Maggiore', '037', NULL, '2023-02-27 18:49:07', 'C204');
INSERT INTO `comuni` VALUES ('037020', 'Castel San Pietro Terme', '037', NULL, '2023-02-27 18:49:07', 'C265');
INSERT INTO `comuni` VALUES ('037021', 'Castenaso', '037', NULL, '2023-02-27 18:49:07', 'C292');
INSERT INTO `comuni` VALUES ('037022', 'Castiglione dei Pepoli', '037', NULL, '2023-02-27 18:49:07', 'C296');
INSERT INTO `comuni` VALUES ('037024', 'Crevalcore', '037', NULL, '2023-02-27 18:49:07', 'D166');
INSERT INTO `comuni` VALUES ('037025', 'Dozza', '037', NULL, '2023-02-27 18:49:07', 'D360');
INSERT INTO `comuni` VALUES ('037026', 'Fontanelice', '037', NULL, '2023-02-27 18:49:07', 'D668');
INSERT INTO `comuni` VALUES ('037027', 'Gaggio Montano', '037', NULL, '2023-02-27 18:49:07', 'D847');
INSERT INTO `comuni` VALUES ('037028', 'Galliera', '037', NULL, '2023-02-27 18:49:07', 'D878');
INSERT INTO `comuni` VALUES ('037029', 'Granaglione', '037', NULL, '2023-02-27 18:49:07', 'E135');
INSERT INTO `comuni` VALUES ('037030', 'Granarolo dell\'Emilia', '037', NULL, '2023-02-27 18:49:07', 'E136');
INSERT INTO `comuni` VALUES ('037031', 'Grizzana Morandi', '037', NULL, '2023-02-27 18:49:07', 'E187');
INSERT INTO `comuni` VALUES ('037032', 'Imola', '037', NULL, '2023-02-27 18:49:07', 'E289');
INSERT INTO `comuni` VALUES ('037033', 'Lizzano in Belvedere', '037', NULL, '2023-02-27 18:49:07', 'A771');
INSERT INTO `comuni` VALUES ('037034', 'Loiano', '037', NULL, '2023-02-27 18:49:07', 'E655');
INSERT INTO `comuni` VALUES ('037035', 'Malalbergo', '037', NULL, '2023-02-27 18:49:07', 'E844');
INSERT INTO `comuni` VALUES ('037036', 'Marzabotto', '037', NULL, '2023-02-27 18:49:07', 'B689');
INSERT INTO `comuni` VALUES ('037037', 'Medicina', '037', NULL, '2023-02-27 18:49:07', 'F083');
INSERT INTO `comuni` VALUES ('037038', 'Minerbio', '037', NULL, '2023-02-27 18:49:07', 'F219');
INSERT INTO `comuni` VALUES ('037039', 'Molinella', '037', NULL, '2023-02-27 18:49:07', 'F288');
INSERT INTO `comuni` VALUES ('037040', 'Monghidoro', '037', NULL, '2023-02-27 18:49:07', 'F363');
INSERT INTO `comuni` VALUES ('037041', 'Monterenzio', '037', NULL, '2023-02-27 18:49:07', 'F597');
INSERT INTO `comuni` VALUES ('037042', 'Monte San Pietro', '037', NULL, '2023-02-27 18:49:07', 'F627');
INSERT INTO `comuni` VALUES ('037044', 'Monzuno', '037', NULL, '2023-02-27 18:49:07', 'F706');
INSERT INTO `comuni` VALUES ('037045', 'Mordano', '037', NULL, '2023-02-27 18:49:07', 'F718');
INSERT INTO `comuni` VALUES ('037046', 'Ozzano dell\'Emilia', '037', NULL, '2023-02-27 18:49:07', 'G205');
INSERT INTO `comuni` VALUES ('037047', 'Pianoro', '037', NULL, '2023-02-27 18:49:07', 'G570');
INSERT INTO `comuni` VALUES ('037048', 'Pieve di Cento', '037', NULL, '2023-02-27 18:49:07', 'G643');
INSERT INTO `comuni` VALUES ('037049', 'Porretta Terme', '037', NULL, '2023-02-27 18:49:07', 'A558');
INSERT INTO `comuni` VALUES ('037050', 'Sala Bolognese', '037', NULL, '2023-02-27 18:49:07', 'H678');
INSERT INTO `comuni` VALUES ('037051', 'San Benedetto Val di Sambro', '037', NULL, '2023-02-27 18:49:07', 'G566');
INSERT INTO `comuni` VALUES ('037052', 'San Giorgio di Piano', '037', NULL, '2023-02-27 18:49:07', 'H896');
INSERT INTO `comuni` VALUES ('037053', 'San Giovanni in Persiceto', '037', NULL, '2023-02-27 18:49:07', 'G467');
INSERT INTO `comuni` VALUES ('037054', 'San Lazzaro di Savena', '037', NULL, '2023-02-27 18:49:07', 'H945');
INSERT INTO `comuni` VALUES ('037055', 'San Pietro in Casale', '037', NULL, '2023-02-27 18:49:07', 'I110');
INSERT INTO `comuni` VALUES ('037056', 'Sant\'Agata Bolognese', '037', NULL, '2023-02-27 18:49:07', 'I191');
INSERT INTO `comuni` VALUES ('037057', 'Sasso Marconi', '037', NULL, '2023-02-27 18:49:07', 'G972');
INSERT INTO `comuni` VALUES ('037059', 'Vergato', '037', NULL, '2023-02-27 18:49:07', 'L762');
INSERT INTO `comuni` VALUES ('037060', 'Zola Predosa', '037', NULL, '2023-02-27 18:49:07', 'M185');
INSERT INTO `comuni` VALUES ('037061', 'Valsamoggia', '037', NULL, '2023-02-27 18:49:07', 'M320');
INSERT INTO `comuni` VALUES ('038001', 'Argenta', '038', NULL, '2023-02-27 18:49:07', 'A393');
INSERT INTO `comuni` VALUES ('038002', 'Berra', '038', NULL, '2023-02-27 18:49:07', 'A806');
INSERT INTO `comuni` VALUES ('038003', 'Bondeno', '038', NULL, '2023-02-27 18:49:07', 'A965');
INSERT INTO `comuni` VALUES ('038004', 'Cento', '038', NULL, '2023-02-27 18:49:07', 'C469');
INSERT INTO `comuni` VALUES ('038005', 'Codigoro', '038', NULL, '2023-02-27 18:49:07', 'C814');
INSERT INTO `comuni` VALUES ('038006', 'Comacchio', '038', NULL, '2023-02-27 18:49:07', 'C912');
INSERT INTO `comuni` VALUES ('038007', 'Copparo', '038', NULL, '2023-02-27 18:49:07', 'C980');
INSERT INTO `comuni` VALUES ('038008', 'Ferrara', '038', NULL, '2023-02-27 18:49:07', 'D548');
INSERT INTO `comuni` VALUES ('038009', 'Formignana', '038', NULL, '2023-02-27 18:49:07', 'D713');
INSERT INTO `comuni` VALUES ('038010', 'Jolanda di Savoia', '038', NULL, '2023-02-27 18:49:07', 'E320');
INSERT INTO `comuni` VALUES ('038011', 'Lagosanto', '038', NULL, '2023-02-27 18:49:07', 'E410');
INSERT INTO `comuni` VALUES ('038012', 'Masi Torello', '038', NULL, '2023-02-27 18:49:07', 'F016');
INSERT INTO `comuni` VALUES ('038014', 'Mesola', '038', NULL, '2023-02-27 18:49:07', 'F156');
INSERT INTO `comuni` VALUES ('038016', 'Mirabello', '038', NULL, '2023-02-27 18:49:07', 'F235');
INSERT INTO `comuni` VALUES ('038017', 'Ostellato', '038', NULL, '2023-02-27 18:49:07', 'G184');
INSERT INTO `comuni` VALUES ('038018', 'Poggio Renatico', '038', NULL, '2023-02-27 18:49:07', 'G768');
INSERT INTO `comuni` VALUES ('038019', 'Portomaggiore', '038', NULL, '2023-02-27 18:49:07', 'G916');
INSERT INTO `comuni` VALUES ('038020', 'Ro', '038', NULL, '2023-02-27 18:49:07', 'H360');
INSERT INTO `comuni` VALUES ('038021', 'Sant\'Agostino', '038', NULL, '2023-02-27 18:49:07', 'I209');
INSERT INTO `comuni` VALUES ('038022', 'Vigarano Mainarda', '038', NULL, '2023-02-27 18:49:07', 'L868');
INSERT INTO `comuni` VALUES ('038023', 'Voghiera', '038', NULL, '2023-02-27 18:49:07', 'M110');
INSERT INTO `comuni` VALUES ('038024', 'Tresigallo', '038', NULL, '2023-02-27 18:49:07', 'L390');
INSERT INTO `comuni` VALUES ('038025', 'Goro', '038', NULL, '2023-02-27 18:49:07', 'E107');
INSERT INTO `comuni` VALUES ('038027', 'Fiscaglia', '038', NULL, '2023-02-27 18:49:07', 'M323');
INSERT INTO `comuni` VALUES ('039001', 'Alfonsine', '039', NULL, '2023-02-27 18:49:07', 'A191');
INSERT INTO `comuni` VALUES ('039002', 'Bagnacavallo', '039', NULL, '2023-02-27 18:49:07', 'A547');
INSERT INTO `comuni` VALUES ('039003', 'Bagnara di Romagna', '039', NULL, '2023-02-27 18:49:07', 'A551');
INSERT INTO `comuni` VALUES ('039004', 'Brisighella', '039', NULL, '2023-02-27 18:49:07', 'B188');
INSERT INTO `comuni` VALUES ('039005', 'Casola Valsenio', '039', NULL, '2023-02-27 18:49:07', 'B982');
INSERT INTO `comuni` VALUES ('039006', 'Castel Bolognese', '039', NULL, '2023-02-27 18:49:07', 'C065');
INSERT INTO `comuni` VALUES ('039007', 'Cervia', '039', NULL, '2023-02-27 18:49:07', 'C553');
INSERT INTO `comuni` VALUES ('039008', 'Conselice', '039', NULL, '2023-02-27 18:49:07', 'C963');
INSERT INTO `comuni` VALUES ('039009', 'Cotignola', '039', NULL, '2023-02-27 18:49:07', 'D121');
INSERT INTO `comuni` VALUES ('039010', 'Faenza', '039', NULL, '2023-02-27 18:49:07', 'D458');
INSERT INTO `comuni` VALUES ('039011', 'Fusignano', '039', NULL, '2023-02-27 18:49:07', 'D829');
INSERT INTO `comuni` VALUES ('039012', 'Lugo', '039', NULL, '2023-02-27 18:49:07', 'E730');
INSERT INTO `comuni` VALUES ('039013', 'Massa Lombarda', '039', NULL, '2023-02-27 18:49:07', 'F029');
INSERT INTO `comuni` VALUES ('039014', 'Ravenna', '039', NULL, '2023-02-27 18:49:07', 'H199');
INSERT INTO `comuni` VALUES ('039015', 'Riolo Terme', '039', NULL, '2023-02-27 18:49:07', 'H302');
INSERT INTO `comuni` VALUES ('039016', 'Russi', '039', NULL, '2023-02-27 18:49:07', 'H642');
INSERT INTO `comuni` VALUES ('039017', 'Sant\'Agata sul Santerno', '039', NULL, '2023-02-27 18:49:07', 'I196');
INSERT INTO `comuni` VALUES ('039018', 'Solarolo', '039', NULL, '2023-02-27 18:49:07', 'I787');
INSERT INTO `comuni` VALUES ('040001', 'Bagno di Romagna', '040', NULL, '2023-02-27 18:49:07', 'A565');
INSERT INTO `comuni` VALUES ('040003', 'Bertinoro', '040', NULL, '2023-02-27 18:49:07', 'A809');
INSERT INTO `comuni` VALUES ('040004', 'Borghi', '040', NULL, '2023-02-27 18:49:07', 'B001');
INSERT INTO `comuni` VALUES ('040005', 'Castrocaro Terme e Terra del Sole', '040', NULL, '2023-02-27 18:49:07', 'C339');
INSERT INTO `comuni` VALUES ('040007', 'Cesena', '040', NULL, '2023-02-27 18:49:07', 'C573');
INSERT INTO `comuni` VALUES ('040008', 'Cesenatico', '040', NULL, '2023-02-27 18:49:07', 'C574');
INSERT INTO `comuni` VALUES ('040009', 'Civitella di Romagna', '040', NULL, '2023-02-27 18:49:07', 'C777');
INSERT INTO `comuni` VALUES ('040011', 'Dovadola', '040', NULL, '2023-02-27 18:49:07', 'D357');
INSERT INTO `comuni` VALUES ('040012', 'Forlì', '040', NULL, '2023-02-27 18:49:07', 'D704');
INSERT INTO `comuni` VALUES ('040013', 'Forlimpopoli', '040', NULL, '2023-02-27 18:49:07', 'D705');
INSERT INTO `comuni` VALUES ('040014', 'Galeata', '040', NULL, '2023-02-27 18:49:07', 'D867');
INSERT INTO `comuni` VALUES ('040015', 'Gambettola', '040', NULL, '2023-02-27 18:49:07', 'D899');
INSERT INTO `comuni` VALUES ('040016', 'Gatteo', '040', NULL, '2023-02-27 18:49:07', 'D935');
INSERT INTO `comuni` VALUES ('040018', 'Longiano', '040', NULL, '2023-02-27 18:49:07', 'E675');
INSERT INTO `comuni` VALUES ('040019', 'Meldola', '040', NULL, '2023-02-27 18:49:07', 'F097');
INSERT INTO `comuni` VALUES ('040020', 'Mercato Saraceno', '040', NULL, '2023-02-27 18:49:07', 'F139');
INSERT INTO `comuni` VALUES ('040022', 'Modigliana', '040', NULL, '2023-02-27 18:49:07', 'F259');
INSERT INTO `comuni` VALUES ('040028', 'Montiano', '040', NULL, '2023-02-27 18:49:07', 'F668');
INSERT INTO `comuni` VALUES ('040031', 'Portico e San Benedetto', '040', NULL, '2023-02-27 18:49:07', 'G904');
INSERT INTO `comuni` VALUES ('040032', 'Predappio', '040', NULL, '2023-02-27 18:49:07', 'H017');
INSERT INTO `comuni` VALUES ('040033', 'Premilcuore', '040', NULL, '2023-02-27 18:49:07', 'H034');
INSERT INTO `comuni` VALUES ('040036', 'Rocca San Casciano', '040', NULL, '2023-02-27 18:49:07', 'H437');
INSERT INTO `comuni` VALUES ('040037', 'Roncofreddo', '040', NULL, '2023-02-27 18:49:07', 'H542');
INSERT INTO `comuni` VALUES ('040041', 'San Mauro Pascoli', '040', NULL, '2023-02-27 18:49:07', 'I027');
INSERT INTO `comuni` VALUES ('040043', 'Santa Sofia', '040', NULL, '2023-02-27 18:49:07', 'I310');
INSERT INTO `comuni` VALUES ('040044', 'Sarsina', '040', NULL, '2023-02-27 18:49:07', 'I444');
INSERT INTO `comuni` VALUES ('040045', 'Savignano sul Rubicone', '040', NULL, '2023-02-27 18:49:07', 'I472');
INSERT INTO `comuni` VALUES ('040046', 'Sogliano al Rubicone', '040', NULL, '2023-02-27 18:49:07', 'I779');
INSERT INTO `comuni` VALUES ('040049', 'Tredozio', '040', NULL, '2023-02-27 18:49:07', 'L361');
INSERT INTO `comuni` VALUES ('040050', 'Verghereto', '040', NULL, '2023-02-27 18:49:07', 'L764');
INSERT INTO `comuni` VALUES ('041001', 'Acqualagna', '041', NULL, '2023-02-27 18:49:07', 'A035');
INSERT INTO `comuni` VALUES ('041002', 'Apecchio', '041', NULL, '2023-02-27 18:49:07', 'A327');
INSERT INTO `comuni` VALUES ('041003', 'Auditore', '041', NULL, '2023-02-27 18:49:07', 'A493');
INSERT INTO `comuni` VALUES ('041004', 'Barchi', '041', NULL, '2023-02-27 18:49:07', 'A639');
INSERT INTO `comuni` VALUES ('041005', 'Belforte all\'Isauro', '041', NULL, '2023-02-27 18:49:07', 'A740');
INSERT INTO `comuni` VALUES ('041006', 'Borgo Pace', '041', NULL, '2023-02-27 18:49:07', 'B026');
INSERT INTO `comuni` VALUES ('041007', 'Cagli', '041', NULL, '2023-02-27 18:49:07', 'B352');
INSERT INTO `comuni` VALUES ('041008', 'Cantiano', '041', NULL, '2023-02-27 18:49:07', 'B636');
INSERT INTO `comuni` VALUES ('041009', 'Carpegna', '041', NULL, '2023-02-27 18:49:07', 'B816');
INSERT INTO `comuni` VALUES ('041010', 'Cartoceto', '041', NULL, '2023-02-27 18:49:07', 'B846');
INSERT INTO `comuni` VALUES ('041013', 'Fano', '041', NULL, '2023-02-27 18:49:07', 'D488');
INSERT INTO `comuni` VALUES ('041014', 'Fermignano', '041', NULL, '2023-02-27 18:49:07', 'D541');
INSERT INTO `comuni` VALUES ('041015', 'Fossombrone', '041', NULL, '2023-02-27 18:49:07', 'D749');
INSERT INTO `comuni` VALUES ('041016', 'Fratte Rosa', '041', NULL, '2023-02-27 18:49:07', 'D791');
INSERT INTO `comuni` VALUES ('041017', 'Frontino', '041', NULL, '2023-02-27 18:49:07', 'D807');
INSERT INTO `comuni` VALUES ('041018', 'Frontone', '041', NULL, '2023-02-27 18:49:07', 'D808');
INSERT INTO `comuni` VALUES ('041019', 'Gabicce Mare', '041', NULL, '2023-02-27 18:49:07', 'D836');
INSERT INTO `comuni` VALUES ('041020', 'Gradara', '041', NULL, '2023-02-27 18:49:07', 'E122');
INSERT INTO `comuni` VALUES ('041021', 'Isola del Piano', '041', NULL, '2023-02-27 18:49:07', 'E351');
INSERT INTO `comuni` VALUES ('041022', 'Lunano', '041', NULL, '2023-02-27 18:49:07', 'E743');
INSERT INTO `comuni` VALUES ('041023', 'Macerata Feltria', '041', NULL, '2023-02-27 18:49:07', 'E785');
INSERT INTO `comuni` VALUES ('041025', 'Mercatello sul Metauro', '041', NULL, '2023-02-27 18:49:07', 'F135');
INSERT INTO `comuni` VALUES ('041026', 'Mercatino Conca', '041', NULL, '2023-02-27 18:49:07', 'F136');
INSERT INTO `comuni` VALUES ('041027', 'Mombaroccio', '041', NULL, '2023-02-27 18:49:07', 'F310');
INSERT INTO `comuni` VALUES ('041028', 'Mondavio', '041', NULL, '2023-02-27 18:49:07', 'F347');
INSERT INTO `comuni` VALUES ('041029', 'Mondolfo', '041', NULL, '2023-02-27 18:49:07', 'F348');
INSERT INTO `comuni` VALUES ('041030', 'Montecalvo in Foglia', '041', NULL, '2023-02-27 18:49:07', 'F450');
INSERT INTO `comuni` VALUES ('041031', 'Monte Cerignone', '041', NULL, '2023-02-27 18:49:07', 'F467');
INSERT INTO `comuni` VALUES ('041032', 'Monteciccardo', '041', NULL, '2023-02-27 18:49:07', 'F474');
INSERT INTO `comuni` VALUES ('041033', 'Montecopiolo', '041', NULL, '2023-02-27 18:49:07', 'F478');
INSERT INTO `comuni` VALUES ('041034', 'Montefelcino', '041', NULL, '2023-02-27 18:49:07', 'F497');
INSERT INTO `comuni` VALUES ('041035', 'Monte Grimano Terme', '041', NULL, '2023-02-27 18:49:07', 'F524');
INSERT INTO `comuni` VALUES ('041036', 'Montelabbate', '041', NULL, '2023-02-27 18:49:07', 'F533');
INSERT INTO `comuni` VALUES ('041037', 'Montemaggiore al Metauro', '041', NULL, '2023-02-27 18:49:07', 'F555');
INSERT INTO `comuni` VALUES ('041038', 'Monte Porzio', '041', NULL, '2023-02-27 18:49:07', 'F589');
INSERT INTO `comuni` VALUES ('041040', 'Orciano di Pesaro', '041', NULL, '2023-02-27 18:49:07', 'G089');
INSERT INTO `comuni` VALUES ('041041', 'Peglio', '041', NULL, '2023-02-27 18:49:07', 'G416');
INSERT INTO `comuni` VALUES ('041043', 'Pergola', '041', NULL, '2023-02-27 18:49:07', 'G453');
INSERT INTO `comuni` VALUES ('041044', 'Pesaro', '041', NULL, '2023-02-27 18:49:07', 'G479');
INSERT INTO `comuni` VALUES ('041045', 'Petriano', '041', NULL, '2023-02-27 18:49:07', 'G514');
INSERT INTO `comuni` VALUES ('041046', 'Piagge', '041', NULL, '2023-02-27 18:49:07', 'G537');
INSERT INTO `comuni` VALUES ('041047', 'Piandimeleto', '041', NULL, '2023-02-27 18:49:07', 'G551');
INSERT INTO `comuni` VALUES ('041048', 'Pietrarubbia', '041', NULL, '2023-02-27 18:49:07', 'G627');
INSERT INTO `comuni` VALUES ('041049', 'Piobbico', '041', NULL, '2023-02-27 18:49:07', 'G682');
INSERT INTO `comuni` VALUES ('041050', 'Saltara', '041', NULL, '2023-02-27 18:49:07', 'H721');
INSERT INTO `comuni` VALUES ('041051', 'San Costanzo', '041', NULL, '2023-02-27 18:49:07', 'H809');
INSERT INTO `comuni` VALUES ('041052', 'San Giorgio di Pesaro', '041', NULL, '2023-02-27 18:49:07', 'H886');
INSERT INTO `comuni` VALUES ('041054', 'San Lorenzo in Campo', '041', NULL, '2023-02-27 18:49:07', 'H958');
INSERT INTO `comuni` VALUES ('041057', 'Sant\'Angelo in Vado', '041', NULL, '2023-02-27 18:49:07', 'I287');
INSERT INTO `comuni` VALUES ('041058', 'Sant\'Ippolito', '041', NULL, '2023-02-27 18:49:07', 'I344');
INSERT INTO `comuni` VALUES ('041059', 'Sassocorvaro', '041', NULL, '2023-02-27 18:49:07', 'I459');
INSERT INTO `comuni` VALUES ('041060', 'Sassofeltrio', '041', NULL, '2023-02-27 18:49:07', 'I460');
INSERT INTO `comuni` VALUES ('041061', 'Serra Sant\'Abbondio', '041', NULL, '2023-02-27 18:49:07', 'I654');
INSERT INTO `comuni` VALUES ('041062', 'Serrungarina', '041', NULL, '2023-02-27 18:49:07', 'I670');
INSERT INTO `comuni` VALUES ('041064', 'Tavoleto', '041', NULL, '2023-02-27 18:49:07', 'L078');
INSERT INTO `comuni` VALUES ('041065', 'Tavullia', '041', NULL, '2023-02-27 18:49:07', 'L081');
INSERT INTO `comuni` VALUES ('041066', 'Urbania', '041', NULL, '2023-02-27 18:49:07', 'L498');
INSERT INTO `comuni` VALUES ('041067', 'Urbino', '041', NULL, '2023-02-27 18:49:07', 'L500');
INSERT INTO `comuni` VALUES ('041068', 'Vallefoglia', '041', NULL, '2023-02-27 18:49:07', 'M331');
INSERT INTO `comuni` VALUES ('042001', 'Agugliano', '042', NULL, '2023-02-27 18:49:07', 'A092');
INSERT INTO `comuni` VALUES ('042002', 'Ancona', '042', NULL, '2023-02-27 18:49:07', 'A271');
INSERT INTO `comuni` VALUES ('042003', 'Arcevia', '042', NULL, '2023-02-27 18:49:07', 'A366');
INSERT INTO `comuni` VALUES ('042004', 'Barbara', '042', NULL, '2023-02-27 18:49:07', 'A626');
INSERT INTO `comuni` VALUES ('042005', 'Belvedere Ostrense', '042', NULL, '2023-02-27 18:49:07', 'A769');
INSERT INTO `comuni` VALUES ('042006', 'Camerano', '042', NULL, '2023-02-27 18:49:07', 'B468');
INSERT INTO `comuni` VALUES ('042007', 'Camerata Picena', '042', NULL, '2023-02-27 18:49:07', 'B470');
INSERT INTO `comuni` VALUES ('042008', 'Castelbellino', '042', NULL, '2023-02-27 18:49:07', 'C060');
INSERT INTO `comuni` VALUES ('042010', 'Castelfidardo', '042', NULL, '2023-02-27 18:49:07', 'C100');
INSERT INTO `comuni` VALUES ('042011', 'Castelleone di Suasa', '042', NULL, '2023-02-27 18:49:07', 'C152');
INSERT INTO `comuni` VALUES ('042012', 'Castelplanio', '042', NULL, '2023-02-27 18:49:07', 'C248');
INSERT INTO `comuni` VALUES ('042013', 'Cerreto d\'Esi', '042', NULL, '2023-02-27 18:49:07', 'C524');
INSERT INTO `comuni` VALUES ('042014', 'Chiaravalle', '042', NULL, '2023-02-27 18:49:07', 'C615');
INSERT INTO `comuni` VALUES ('042015', 'Corinaldo', '042', NULL, '2023-02-27 18:49:07', 'D007');
INSERT INTO `comuni` VALUES ('042016', 'Cupramontana', '042', NULL, '2023-02-27 18:49:07', 'D211');
INSERT INTO `comuni` VALUES ('042017', 'Fabriano', '042', NULL, '2023-02-27 18:49:07', 'D451');
INSERT INTO `comuni` VALUES ('042018', 'Falconara Marittima', '042', NULL, '2023-02-27 18:49:07', 'D472');
INSERT INTO `comuni` VALUES ('042019', 'Filottrano', '042', NULL, '2023-02-27 18:49:07', 'D597');
INSERT INTO `comuni` VALUES ('042020', 'Genga', '042', NULL, '2023-02-27 18:49:07', 'D965');
INSERT INTO `comuni` VALUES ('042021', 'Jesi', '042', NULL, '2023-02-27 18:49:07', 'E388');
INSERT INTO `comuni` VALUES ('042022', 'Loreto', '042', NULL, '2023-02-27 18:49:07', 'E690');
INSERT INTO `comuni` VALUES ('042023', 'Maiolati Spontini', '042', NULL, '2023-02-27 18:49:07', 'E837');
INSERT INTO `comuni` VALUES ('042024', 'Mergo', '042', NULL, '2023-02-27 18:49:07', 'F145');
INSERT INTO `comuni` VALUES ('042025', 'Monsano', '042', NULL, '2023-02-27 18:49:07', 'F381');
INSERT INTO `comuni` VALUES ('042026', 'Montecarotto', '042', NULL, '2023-02-27 18:49:07', 'F453');
INSERT INTO `comuni` VALUES ('042027', 'Montemarciano', '042', NULL, '2023-02-27 18:49:07', 'F560');
INSERT INTO `comuni` VALUES ('042029', 'Monte Roberto', '042', NULL, '2023-02-27 18:49:07', 'F600');
INSERT INTO `comuni` VALUES ('042030', 'Monte San Vito', '042', NULL, '2023-02-27 18:49:07', 'F634');
INSERT INTO `comuni` VALUES ('042031', 'Morro d\'Alba', '042', NULL, '2023-02-27 18:49:07', 'F745');
INSERT INTO `comuni` VALUES ('042032', 'Numana', '042', NULL, '2023-02-27 18:49:07', 'F978');
INSERT INTO `comuni` VALUES ('042033', 'Offagna', '042', NULL, '2023-02-27 18:49:07', 'G003');
INSERT INTO `comuni` VALUES ('042034', 'Osimo', '042', NULL, '2023-02-27 18:49:07', 'G157');
INSERT INTO `comuni` VALUES ('042035', 'Ostra', '042', NULL, '2023-02-27 18:49:07', 'F401');
INSERT INTO `comuni` VALUES ('042036', 'Ostra Vetere', '042', NULL, '2023-02-27 18:49:07', 'F581');
INSERT INTO `comuni` VALUES ('042037', 'Poggio San Marcello', '042', NULL, '2023-02-27 18:49:07', 'G771');
INSERT INTO `comuni` VALUES ('042038', 'Polverigi', '042', NULL, '2023-02-27 18:49:07', 'G803');
INSERT INTO `comuni` VALUES ('042040', 'Rosora', '042', NULL, '2023-02-27 18:49:07', 'H575');
INSERT INTO `comuni` VALUES ('042041', 'San Marcello', '042', NULL, '2023-02-27 18:49:07', 'H979');
INSERT INTO `comuni` VALUES ('042042', 'San Paolo di Jesi', '042', NULL, '2023-02-27 18:49:07', 'I071');
INSERT INTO `comuni` VALUES ('042043', 'Santa Maria Nuova', '042', NULL, '2023-02-27 18:49:07', 'I251');
INSERT INTO `comuni` VALUES ('042044', 'Sassoferrato', '042', NULL, '2023-02-27 18:49:07', 'I461');
INSERT INTO `comuni` VALUES ('042045', 'Senigallia', '042', NULL, '2023-02-27 18:49:07', 'I608');
INSERT INTO `comuni` VALUES ('042046', 'Serra de\' Conti', '042', NULL, '2023-02-27 18:49:07', 'I643');
INSERT INTO `comuni` VALUES ('042047', 'Serra San Quirico', '042', NULL, '2023-02-27 18:49:07', 'I653');
INSERT INTO `comuni` VALUES ('042048', 'Sirolo', '042', NULL, '2023-02-27 18:49:07', 'I758');
INSERT INTO `comuni` VALUES ('042049', 'Staffolo', '042', NULL, '2023-02-27 18:49:07', 'I932');
INSERT INTO `comuni` VALUES ('042050', 'Trecastelli', '042', NULL, '2023-02-27 18:49:07', 'M318');
INSERT INTO `comuni` VALUES ('043001', 'Acquacanina', '043', NULL, '2023-02-27 18:49:07', 'A031');
INSERT INTO `comuni` VALUES ('043002', 'Apiro', '043', NULL, '2023-02-27 18:49:07', 'A329');
INSERT INTO `comuni` VALUES ('043003', 'Appignano', '043', NULL, '2023-02-27 18:49:07', 'A334');
INSERT INTO `comuni` VALUES ('043004', 'Belforte del Chienti', '043', NULL, '2023-02-27 18:49:07', 'A739');
INSERT INTO `comuni` VALUES ('043005', 'Bolognola', '043', NULL, '2023-02-27 18:49:07', 'A947');
INSERT INTO `comuni` VALUES ('043006', 'Caldarola', '043', NULL, '2023-02-27 18:49:07', 'B398');
INSERT INTO `comuni` VALUES ('043007', 'Camerino', '043', NULL, '2023-02-27 18:49:07', 'B474');
INSERT INTO `comuni` VALUES ('043008', 'Camporotondo di Fiastrone', '043', NULL, '2023-02-27 18:49:07', 'B562');
INSERT INTO `comuni` VALUES ('043009', 'Castelraimondo', '043', NULL, '2023-02-27 18:49:07', 'C251');
INSERT INTO `comuni` VALUES ('043010', 'Castelsantangelo sul Nera', '043', NULL, '2023-02-27 18:49:07', 'C267');
INSERT INTO `comuni` VALUES ('043011', 'Cessapalombo', '043', NULL, '2023-02-27 18:49:07', 'C582');
INSERT INTO `comuni` VALUES ('043012', 'Cingoli', '043', NULL, '2023-02-27 18:49:07', 'C704');
INSERT INTO `comuni` VALUES ('043013', 'Civitanova Marche', '043', NULL, '2023-02-27 18:49:07', 'C770');
INSERT INTO `comuni` VALUES ('043014', 'Colmurano', '043', NULL, '2023-02-27 18:49:07', 'C886');
INSERT INTO `comuni` VALUES ('043015', 'Corridonia', '043', NULL, '2023-02-27 18:49:07', 'D042');
INSERT INTO `comuni` VALUES ('043016', 'Esanatoglia', '043', NULL, '2023-02-27 18:49:07', 'D429');
INSERT INTO `comuni` VALUES ('043017', 'Fiastra', '043', NULL, '2023-02-27 18:49:07', 'D564');
INSERT INTO `comuni` VALUES ('043018', 'Fiordimonte', '043', NULL, '2023-02-27 18:49:07', 'D609');
INSERT INTO `comuni` VALUES ('043019', 'Fiuminata', '043', NULL, '2023-02-27 18:49:07', 'D628');
INSERT INTO `comuni` VALUES ('043020', 'Gagliole', '043', NULL, '2023-02-27 18:49:07', 'D853');
INSERT INTO `comuni` VALUES ('043021', 'Gualdo', '043', NULL, '2023-02-27 18:49:07', 'E228');
INSERT INTO `comuni` VALUES ('043022', 'Loro Piceno', '043', NULL, '2023-02-27 18:49:07', 'E694');
INSERT INTO `comuni` VALUES ('043023', 'Macerata', '043', NULL, '2023-02-27 18:49:07', 'E783');
INSERT INTO `comuni` VALUES ('043024', 'Matelica', '043', NULL, '2023-02-27 18:49:07', 'F051');
INSERT INTO `comuni` VALUES ('043025', 'Mogliano', '043', NULL, '2023-02-27 18:49:07', 'F268');
INSERT INTO `comuni` VALUES ('043026', 'Montecassiano', '043', NULL, '2023-02-27 18:49:07', 'F454');
INSERT INTO `comuni` VALUES ('043027', 'Monte Cavallo', '043', NULL, '2023-02-27 18:49:07', 'F460');
INSERT INTO `comuni` VALUES ('043028', 'Montecosaro', '043', NULL, '2023-02-27 18:49:07', 'F482');
INSERT INTO `comuni` VALUES ('043029', 'Montefano', '043', NULL, '2023-02-27 18:49:07', 'F496');
INSERT INTO `comuni` VALUES ('043030', 'Montelupone', '043', NULL, '2023-02-27 18:49:07', 'F552');
INSERT INTO `comuni` VALUES ('043031', 'Monte San Giusto', '043', NULL, '2023-02-27 18:49:07', 'F621');
INSERT INTO `comuni` VALUES ('043032', 'Monte San Martino', '043', NULL, '2023-02-27 18:49:07', 'F622');
INSERT INTO `comuni` VALUES ('043033', 'Morrovalle', '043', NULL, '2023-02-27 18:49:07', 'F749');
INSERT INTO `comuni` VALUES ('043034', 'Muccia', '043', NULL, '2023-02-27 18:49:07', 'F793');
INSERT INTO `comuni` VALUES ('043035', 'Penna San Giovanni', '043', NULL, '2023-02-27 18:49:07', 'G436');
INSERT INTO `comuni` VALUES ('043036', 'Petriolo', '043', NULL, '2023-02-27 18:49:07', 'G515');
INSERT INTO `comuni` VALUES ('043037', 'Pievebovigliana', '043', NULL, '2023-02-27 18:49:07', 'G637');
INSERT INTO `comuni` VALUES ('043038', 'Pieve Torina', '043', NULL, '2023-02-27 18:49:07', 'G657');
INSERT INTO `comuni` VALUES ('043039', 'Pioraco', '043', NULL, '2023-02-27 18:49:07', 'G690');
INSERT INTO `comuni` VALUES ('043040', 'Poggio San Vicino', '043', NULL, '2023-02-27 18:49:07', 'D566');
INSERT INTO `comuni` VALUES ('043041', 'Pollenza', '043', NULL, '2023-02-27 18:49:07', 'F567');
INSERT INTO `comuni` VALUES ('043042', 'Porto Recanati', '043', NULL, '2023-02-27 18:49:07', 'G919');
INSERT INTO `comuni` VALUES ('043043', 'Potenza Picena', '043', NULL, '2023-02-27 18:49:07', 'F632');
INSERT INTO `comuni` VALUES ('043044', 'Recanati', '043', NULL, '2023-02-27 18:49:07', 'H211');
INSERT INTO `comuni` VALUES ('043045', 'Ripe San Ginesio', '043', NULL, '2023-02-27 18:49:07', 'H323');
INSERT INTO `comuni` VALUES ('043046', 'San Ginesio', '043', NULL, '2023-02-27 18:49:07', 'H876');
INSERT INTO `comuni` VALUES ('043047', 'San Severino Marche', '043', NULL, '2023-02-27 18:49:07', 'I156');
INSERT INTO `comuni` VALUES ('043048', 'Sant\'Angelo in Pontano', '043', NULL, '2023-02-27 18:49:07', 'I286');
INSERT INTO `comuni` VALUES ('043049', 'Sarnano', '043', NULL, '2023-02-27 18:49:07', 'I436');
INSERT INTO `comuni` VALUES ('043050', 'Sefro', '043', NULL, '2023-02-27 18:49:07', 'I569');
INSERT INTO `comuni` VALUES ('043051', 'Serrapetrona', '043', NULL, '2023-02-27 18:49:07', 'I651');
INSERT INTO `comuni` VALUES ('043052', 'Serravalle di Chienti', '043', NULL, '2023-02-27 18:49:07', 'I661');
INSERT INTO `comuni` VALUES ('043053', 'Tolentino', '043', NULL, '2023-02-27 18:49:07', 'L191');
INSERT INTO `comuni` VALUES ('043054', 'Treia', '043', NULL, '2023-02-27 18:49:07', 'L366');
INSERT INTO `comuni` VALUES ('043055', 'Urbisaglia', '043', NULL, '2023-02-27 18:49:07', 'L501');
INSERT INTO `comuni` VALUES ('043056', 'Ussita', '043', NULL, '2023-02-27 18:49:07', 'L517');
INSERT INTO `comuni` VALUES ('043057', 'Visso', '043', NULL, '2023-02-27 18:49:07', 'M078');
INSERT INTO `comuni` VALUES ('044001', 'Acquasanta Terme', '044', NULL, '2023-02-27 18:49:07', 'A044');
INSERT INTO `comuni` VALUES ('044002', 'Acquaviva Picena', '044', NULL, '2023-02-27 18:49:07', 'A047');
INSERT INTO `comuni` VALUES ('044005', 'Appignano del Tronto', '044', NULL, '2023-02-27 18:49:07', 'A335');
INSERT INTO `comuni` VALUES ('044006', 'Arquata del Tronto', '044', NULL, '2023-02-27 18:49:07', 'A437');
INSERT INTO `comuni` VALUES ('044007', 'Ascoli Piceno', '044', NULL, '2023-02-27 18:49:07', 'A462');
INSERT INTO `comuni` VALUES ('044010', 'Carassai', '044', NULL, '2023-02-27 18:49:07', 'B727');
INSERT INTO `comuni` VALUES ('044011', 'Castel di Lama', '044', NULL, '2023-02-27 18:49:07', 'C093');
INSERT INTO `comuni` VALUES ('044012', 'Castignano', '044', NULL, '2023-02-27 18:49:07', 'C321');
INSERT INTO `comuni` VALUES ('044013', 'Castorano', '044', NULL, '2023-02-27 18:49:07', 'C331');
INSERT INTO `comuni` VALUES ('044014', 'Colli del Tronto', '044', NULL, '2023-02-27 18:49:07', 'C877');
INSERT INTO `comuni` VALUES ('044015', 'Comunanza', '044', NULL, '2023-02-27 18:49:07', 'C935');
INSERT INTO `comuni` VALUES ('044016', 'Cossignano', '044', NULL, '2023-02-27 18:49:07', 'D096');
INSERT INTO `comuni` VALUES ('044017', 'Cupra Marittima', '044', NULL, '2023-02-27 18:49:07', 'D210');
INSERT INTO `comuni` VALUES ('044020', 'Folignano', '044', NULL, '2023-02-27 18:49:07', 'D652');
INSERT INTO `comuni` VALUES ('044021', 'Force', '044', NULL, '2023-02-27 18:49:07', 'D691');
INSERT INTO `comuni` VALUES ('044023', 'Grottammare', '044', NULL, '2023-02-27 18:49:07', 'E207');
INSERT INTO `comuni` VALUES ('044027', 'Maltignano', '044', NULL, '2023-02-27 18:49:07', 'E868');
INSERT INTO `comuni` VALUES ('044029', 'Massignano', '044', NULL, '2023-02-27 18:49:07', 'F044');
INSERT INTO `comuni` VALUES ('044031', 'Monsampolo del Tronto', '044', NULL, '2023-02-27 18:49:07', 'F380');
INSERT INTO `comuni` VALUES ('044032', 'Montalto delle Marche', '044', NULL, '2023-02-27 18:49:07', 'F415');
INSERT INTO `comuni` VALUES ('044034', 'Montedinove', '044', NULL, '2023-02-27 18:49:07', 'F487');
INSERT INTO `comuni` VALUES ('044036', 'Montefiore dell\'Aso', '044', NULL, '2023-02-27 18:49:07', 'F501');
INSERT INTO `comuni` VALUES ('044038', 'Montegallo', '044', NULL, '2023-02-27 18:49:07', 'F516');
INSERT INTO `comuni` VALUES ('044044', 'Montemonaco', '044', NULL, '2023-02-27 18:49:07', 'F570');
INSERT INTO `comuni` VALUES ('044045', 'Monteprandone', '044', NULL, '2023-02-27 18:49:07', 'F591');
INSERT INTO `comuni` VALUES ('044054', 'Offida', '044', NULL, '2023-02-27 18:49:07', 'G005');
INSERT INTO `comuni` VALUES ('044056', 'Palmiano', '044', NULL, '2023-02-27 18:49:07', 'G289');
INSERT INTO `comuni` VALUES ('044063', 'Ripatransone', '044', NULL, '2023-02-27 18:49:07', 'H321');
INSERT INTO `comuni` VALUES ('044064', 'Roccafluvione', '044', NULL, '2023-02-27 18:49:07', 'H390');
INSERT INTO `comuni` VALUES ('044065', 'Rotella', '044', NULL, '2023-02-27 18:49:07', 'H588');
INSERT INTO `comuni` VALUES ('044066', 'San Benedetto del Tronto', '044', NULL, '2023-02-27 18:49:07', 'H769');
INSERT INTO `comuni` VALUES ('044071', 'Spinetoli', '044', NULL, '2023-02-27 18:49:07', 'I912');
INSERT INTO `comuni` VALUES ('044073', 'Venarotta', '044', NULL, '2023-02-27 18:49:07', 'L728');
INSERT INTO `comuni` VALUES ('045001', 'Aulla', '045', NULL, '2023-02-27 18:49:07', 'A496');
INSERT INTO `comuni` VALUES ('045002', 'Bagnone', '045', NULL, '2023-02-27 18:49:07', 'A576');
INSERT INTO `comuni` VALUES ('045003', 'Carrara', '045', NULL, '2023-02-27 18:49:07', 'B832');
INSERT INTO `comuni` VALUES ('045004', 'Casola in Lunigiana', '045', NULL, '2023-02-27 18:49:07', 'B979');
INSERT INTO `comuni` VALUES ('045005', 'Comano', '045', NULL, '2023-02-27 18:49:07', 'C914');
INSERT INTO `comuni` VALUES ('045006', 'Filattiera', '045', NULL, '2023-02-27 18:49:07', 'D590');
INSERT INTO `comuni` VALUES ('045007', 'Fivizzano', '045', NULL, '2023-02-27 18:49:07', 'D629');
INSERT INTO `comuni` VALUES ('045008', 'Fosdinovo', '045', NULL, '2023-02-27 18:49:07', 'D735');
INSERT INTO `comuni` VALUES ('045009', 'Licciana Nardi', '045', NULL, '2023-02-27 18:49:07', 'E574');
INSERT INTO `comuni` VALUES ('045010', 'Massa', '045', NULL, '2023-02-27 18:49:07', 'F023');
INSERT INTO `comuni` VALUES ('045011', 'Montignoso', '045', NULL, '2023-02-27 18:49:07', 'F679');
INSERT INTO `comuni` VALUES ('045012', 'Mulazzo', '045', NULL, '2023-02-27 18:49:07', 'F802');
INSERT INTO `comuni` VALUES ('045013', 'Podenzana', '045', NULL, '2023-02-27 18:49:07', 'G746');
INSERT INTO `comuni` VALUES ('045014', 'Pontremoli', '045', NULL, '2023-02-27 18:49:07', 'G870');
INSERT INTO `comuni` VALUES ('045015', 'Tresana', '045', NULL, '2023-02-27 18:49:07', 'L386');
INSERT INTO `comuni` VALUES ('045016', 'Villafranca in Lunigiana', '045', NULL, '2023-02-27 18:49:07', 'L946');
INSERT INTO `comuni` VALUES ('045017', 'Zeri', '045', NULL, '2023-02-27 18:49:07', 'M169');
INSERT INTO `comuni` VALUES ('046001', 'Altopascio', '046', NULL, '2023-02-27 18:49:07', 'A241');
INSERT INTO `comuni` VALUES ('046002', 'Bagni di Lucca', '046', NULL, '2023-02-27 18:49:07', 'A560');
INSERT INTO `comuni` VALUES ('046003', 'Barga', '046', NULL, '2023-02-27 18:49:07', 'A657');
INSERT INTO `comuni` VALUES ('046004', 'Borgo a Mozzano', '046', NULL, '2023-02-27 18:49:07', 'B007');
INSERT INTO `comuni` VALUES ('046005', 'Camaiore', '046', NULL, '2023-02-27 18:49:07', 'B455');
INSERT INTO `comuni` VALUES ('046006', 'Camporgiano', '046', NULL, '2023-02-27 18:49:07', 'B557');
INSERT INTO `comuni` VALUES ('046007', 'Capannori', '046', NULL, '2023-02-27 18:49:07', 'B648');
INSERT INTO `comuni` VALUES ('046008', 'Careggine', '046', NULL, '2023-02-27 18:49:07', 'B760');
INSERT INTO `comuni` VALUES ('046009', 'Castelnuovo di Garfagnana', '046', NULL, '2023-02-27 18:49:07', 'C236');
INSERT INTO `comuni` VALUES ('046010', 'Castiglione di Garfagnana', '046', NULL, '2023-02-27 18:49:07', 'C303');
INSERT INTO `comuni` VALUES ('046011', 'Coreglia Antelminelli', '046', NULL, '2023-02-27 18:49:07', 'C996');
INSERT INTO `comuni` VALUES ('046013', 'Forte dei Marmi', '046', NULL, '2023-02-27 18:49:07', 'D730');
INSERT INTO `comuni` VALUES ('046014', 'Fosciandora', '046', NULL, '2023-02-27 18:49:07', 'D734');
INSERT INTO `comuni` VALUES ('046015', 'Gallicano', '046', NULL, '2023-02-27 18:49:07', 'D874');
INSERT INTO `comuni` VALUES ('046016', 'Giuncugnano', '046', NULL, '2023-02-27 18:49:07', 'E059');
INSERT INTO `comuni` VALUES ('046017', 'Lucca', '046', NULL, '2023-02-27 18:49:07', 'E715');
INSERT INTO `comuni` VALUES ('046018', 'Massarosa', '046', NULL, '2023-02-27 18:49:07', 'F035');
INSERT INTO `comuni` VALUES ('046019', 'Minucciano', '046', NULL, '2023-02-27 18:49:07', 'F225');
INSERT INTO `comuni` VALUES ('046020', 'Molazzana', '046', NULL, '2023-02-27 18:49:07', 'F283');
INSERT INTO `comuni` VALUES ('046021', 'Montecarlo', '046', NULL, '2023-02-27 18:49:07', 'F452');
INSERT INTO `comuni` VALUES ('046022', 'Pescaglia', '046', NULL, '2023-02-27 18:49:07', 'G480');
INSERT INTO `comuni` VALUES ('046023', 'Piazza al Serchio', '046', NULL, '2023-02-27 18:49:07', 'G582');
INSERT INTO `comuni` VALUES ('046024', 'Pietrasanta', '046', NULL, '2023-02-27 18:49:07', 'G628');
INSERT INTO `comuni` VALUES ('046025', 'Pieve Fosciana', '046', NULL, '2023-02-27 18:49:07', 'G648');
INSERT INTO `comuni` VALUES ('046026', 'Porcari', '046', NULL, '2023-02-27 18:49:07', 'G882');
INSERT INTO `comuni` VALUES ('046027', 'San Romano in Garfagnana', '046', NULL, '2023-02-27 18:49:07', 'I142');
INSERT INTO `comuni` VALUES ('046028', 'Seravezza', '046', NULL, '2023-02-27 18:49:07', 'I622');
INSERT INTO `comuni` VALUES ('046029', 'Sillano', '046', NULL, '2023-02-27 18:49:07', 'I737');
INSERT INTO `comuni` VALUES ('046030', 'Stazzema', '046', NULL, '2023-02-27 18:49:07', 'I942');
INSERT INTO `comuni` VALUES ('046031', 'Vagli Sotto', '046', NULL, '2023-02-27 18:49:07', 'L533');
INSERT INTO `comuni` VALUES ('046033', 'Viareggio', '046', NULL, '2023-02-27 18:49:07', 'L833');
INSERT INTO `comuni` VALUES ('046034', 'Villa Basilica', '046', NULL, '2023-02-27 18:49:07', 'L913');
INSERT INTO `comuni` VALUES ('046035', 'Villa Collemandina', '046', NULL, '2023-02-27 18:49:07', 'L926');
INSERT INTO `comuni` VALUES ('046036', 'Fabbriche di Vergemoli', '046', NULL, '2023-02-27 18:49:07', 'M319');
INSERT INTO `comuni` VALUES ('047001', 'Abetone', '047', NULL, '2023-02-27 18:49:07', 'A012');
INSERT INTO `comuni` VALUES ('047002', 'Agliana', '047', NULL, '2023-02-27 18:49:07', 'A071');
INSERT INTO `comuni` VALUES ('047003', 'Buggiano', '047', NULL, '2023-02-27 18:49:07', 'B251');
INSERT INTO `comuni` VALUES ('047004', 'Cutigliano', '047', NULL, '2023-02-27 18:49:07', 'D235');
INSERT INTO `comuni` VALUES ('047005', 'Lamporecchio', '047', NULL, '2023-02-27 18:49:07', 'E432');
INSERT INTO `comuni` VALUES ('047006', 'Larciano', '047', NULL, '2023-02-27 18:49:07', 'E451');
INSERT INTO `comuni` VALUES ('047007', 'Marliana', '047', NULL, '2023-02-27 18:49:07', 'E960');
INSERT INTO `comuni` VALUES ('047008', 'Massa e Cozzile', '047', NULL, '2023-02-27 18:49:07', 'F025');
INSERT INTO `comuni` VALUES ('047009', 'Monsummano Terme', '047', NULL, '2023-02-27 18:49:07', 'F384');
INSERT INTO `comuni` VALUES ('047010', 'Montale', '047', NULL, '2023-02-27 18:49:07', 'F410');
INSERT INTO `comuni` VALUES ('047011', 'Montecatini-Terme', '047', NULL, '2023-02-27 18:49:07', 'A561');
INSERT INTO `comuni` VALUES ('047012', 'Pescia', '047', NULL, '2023-02-27 18:49:07', 'G491');
INSERT INTO `comuni` VALUES ('047013', 'Pieve a Nievole', '047', NULL, '2023-02-27 18:49:07', 'G636');
INSERT INTO `comuni` VALUES ('047014', 'Pistoia', '047', NULL, '2023-02-27 18:49:07', 'G713');
INSERT INTO `comuni` VALUES ('047015', 'Piteglio', '047', NULL, '2023-02-27 18:49:07', 'G715');
INSERT INTO `comuni` VALUES ('047016', 'Ponte Buggianese', '047', NULL, '2023-02-27 18:49:07', 'G833');
INSERT INTO `comuni` VALUES ('047017', 'Quarrata', '047', NULL, '2023-02-27 18:49:07', 'H109');
INSERT INTO `comuni` VALUES ('047018', 'Sambuca Pistoiese', '047', NULL, '2023-02-27 18:49:07', 'H744');
INSERT INTO `comuni` VALUES ('047019', 'San Marcello Pistoiese', '047', NULL, '2023-02-27 18:49:07', 'H980');
INSERT INTO `comuni` VALUES ('047020', 'Serravalle Pistoiese', '047', NULL, '2023-02-27 18:49:07', 'I660');
INSERT INTO `comuni` VALUES ('047021', 'Uzzano', '047', NULL, '2023-02-27 18:49:07', 'L522');
INSERT INTO `comuni` VALUES ('047022', 'Chiesina Uzzanese', '047', NULL, '2023-02-27 18:49:07', 'C631');
INSERT INTO `comuni` VALUES ('048001', 'Bagno a Ripoli', '048', NULL, '2023-02-27 18:49:07', 'A564');
INSERT INTO `comuni` VALUES ('048002', 'Barberino di Mugello', '048', NULL, '2023-02-27 18:49:07', 'A632');
INSERT INTO `comuni` VALUES ('048003', 'Barberino Val d\'Elsa', '048', NULL, '2023-02-27 18:49:07', 'A633');
INSERT INTO `comuni` VALUES ('048004', 'Borgo San Lorenzo', '048', NULL, '2023-02-27 18:49:07', 'B036');
INSERT INTO `comuni` VALUES ('048005', 'Calenzano', '048', NULL, '2023-02-27 18:49:07', 'B406');
INSERT INTO `comuni` VALUES ('048006', 'Campi Bisenzio', '048', NULL, '2023-02-27 18:49:07', 'B507');
INSERT INTO `comuni` VALUES ('048008', 'Capraia e Limite', '048', NULL, '2023-02-27 18:49:07', 'B684');
INSERT INTO `comuni` VALUES ('048010', 'Castelfiorentino', '048', NULL, '2023-02-27 18:49:07', 'C101');
INSERT INTO `comuni` VALUES ('048011', 'Cerreto Guidi', '048', NULL, '2023-02-27 18:49:07', 'C529');
INSERT INTO `comuni` VALUES ('048012', 'Certaldo', '048', NULL, '2023-02-27 18:49:07', 'C540');
INSERT INTO `comuni` VALUES ('048013', 'Dicomano', '048', NULL, '2023-02-27 18:49:07', 'D299');
INSERT INTO `comuni` VALUES ('048014', 'Empoli', '048', NULL, '2023-02-27 18:49:07', 'D403');
INSERT INTO `comuni` VALUES ('048015', 'Fiesole', '048', NULL, '2023-02-27 18:49:07', 'D575');
INSERT INTO `comuni` VALUES ('048017', 'Firenze', '048', NULL, '2023-02-27 18:49:07', 'D612');
INSERT INTO `comuni` VALUES ('048018', 'Firenzuola', '048', NULL, '2023-02-27 18:49:07', 'D613');
INSERT INTO `comuni` VALUES ('048019', 'Fucecchio', '048', NULL, '2023-02-27 18:49:07', 'D815');
INSERT INTO `comuni` VALUES ('048020', 'Gambassi Terme', '048', NULL, '2023-02-27 18:49:07', 'D895');
INSERT INTO `comuni` VALUES ('048021', 'Greve in Chianti', '048', NULL, '2023-02-27 18:49:07', 'E169');
INSERT INTO `comuni` VALUES ('048022', 'Impruneta', '048', NULL, '2023-02-27 18:49:07', 'E291');
INSERT INTO `comuni` VALUES ('048024', 'Lastra a Signa', '048', NULL, '2023-02-27 18:49:07', 'E466');
INSERT INTO `comuni` VALUES ('048025', 'Londa', '048', NULL, '2023-02-27 18:49:07', 'E668');
INSERT INTO `comuni` VALUES ('048026', 'Marradi', '048', NULL, '2023-02-27 18:49:07', 'E971');
INSERT INTO `comuni` VALUES ('048027', 'Montaione', '048', NULL, '2023-02-27 18:49:07', 'F398');
INSERT INTO `comuni` VALUES ('048028', 'Montelupo Fiorentino', '048', NULL, '2023-02-27 18:49:07', 'F551');
INSERT INTO `comuni` VALUES ('048030', 'Montespertoli', '048', NULL, '2023-02-27 18:49:07', 'F648');
INSERT INTO `comuni` VALUES ('048031', 'Palazzuolo sul Senio', '048', NULL, '2023-02-27 18:49:07', 'G270');
INSERT INTO `comuni` VALUES ('048032', 'Pelago', '048', NULL, '2023-02-27 18:49:07', 'G420');
INSERT INTO `comuni` VALUES ('048033', 'Pontassieve', '048', NULL, '2023-02-27 18:49:07', 'G825');
INSERT INTO `comuni` VALUES ('048035', 'Reggello', '048', NULL, '2023-02-27 18:49:07', 'H222');
INSERT INTO `comuni` VALUES ('048036', 'Rignano sull\'Arno', '048', NULL, '2023-02-27 18:49:07', 'H286');
INSERT INTO `comuni` VALUES ('048037', 'Rufina', '048', NULL, '2023-02-27 18:49:07', 'H635');
INSERT INTO `comuni` VALUES ('048038', 'San Casciano in Val di Pesa', '048', NULL, '2023-02-27 18:49:07', 'H791');
INSERT INTO `comuni` VALUES ('048039', 'San Godenzo', '048', NULL, '2023-02-27 18:49:07', 'H937');
INSERT INTO `comuni` VALUES ('048041', 'Scandicci', '048', NULL, '2023-02-27 18:49:07', 'B962');
INSERT INTO `comuni` VALUES ('048043', 'Sesto Fiorentino', '048', NULL, '2023-02-27 18:49:07', 'I684');
INSERT INTO `comuni` VALUES ('048044', 'Signa', '048', NULL, '2023-02-27 18:49:07', 'I728');
INSERT INTO `comuni` VALUES ('048045', 'Tavarnelle Val di Pesa', '048', NULL, '2023-02-27 18:49:07', 'L067');
INSERT INTO `comuni` VALUES ('048046', 'Vaglia', '048', NULL, '2023-02-27 18:49:07', 'L529');
INSERT INTO `comuni` VALUES ('048049', 'Vicchio', '048', NULL, '2023-02-27 18:49:07', 'L838');
INSERT INTO `comuni` VALUES ('048050', 'Vinci', '048', NULL, '2023-02-27 18:49:07', 'M059');
INSERT INTO `comuni` VALUES ('048052', 'Figline e Incisa Valdarno', '048', NULL, '2023-02-27 18:49:07', 'M321');
INSERT INTO `comuni` VALUES ('048053', 'Scarperia e San Piero', '048', NULL, '2023-02-27 18:49:07', 'M326');
INSERT INTO `comuni` VALUES ('049001', 'Bibbona', '049', NULL, '2023-02-27 18:49:07', 'A852');
INSERT INTO `comuni` VALUES ('049002', 'Campiglia Marittima', '049', NULL, '2023-02-27 18:49:07', 'B509');
INSERT INTO `comuni` VALUES ('049003', 'Campo nell\'Elba', '049', NULL, '2023-02-27 18:49:07', 'B553');
INSERT INTO `comuni` VALUES ('049004', 'Capoliveri', '049', NULL, '2023-02-27 18:49:07', 'B669');
INSERT INTO `comuni` VALUES ('049005', 'Capraia Isola', '049', NULL, '2023-02-27 18:49:07', 'B685');
INSERT INTO `comuni` VALUES ('049006', 'Castagneto Carducci', '049', NULL, '2023-02-27 18:49:07', 'C044');
INSERT INTO `comuni` VALUES ('049007', 'Cecina', '049', NULL, '2023-02-27 18:49:07', 'C415');
INSERT INTO `comuni` VALUES ('049008', 'Collesalvetti', '049', NULL, '2023-02-27 18:49:07', 'C869');
INSERT INTO `comuni` VALUES ('049009', 'Livorno', '049', NULL, '2023-02-27 18:49:07', 'E625');
INSERT INTO `comuni` VALUES ('049010', 'Marciana', '049', NULL, '2023-02-27 18:49:07', 'E930');
INSERT INTO `comuni` VALUES ('049011', 'Marciana Marina', '049', NULL, '2023-02-27 18:49:07', 'E931');
INSERT INTO `comuni` VALUES ('049012', 'Piombino', '049', NULL, '2023-02-27 18:49:07', 'G687');
INSERT INTO `comuni` VALUES ('049013', 'Porto Azzurro', '049', NULL, '2023-02-27 18:49:07', 'E680');
INSERT INTO `comuni` VALUES ('049014', 'Portoferraio', '049', NULL, '2023-02-27 18:49:07', 'G912');
INSERT INTO `comuni` VALUES ('049015', 'Rio Marina', '049', NULL, '2023-02-27 18:49:07', 'H305');
INSERT INTO `comuni` VALUES ('049016', 'Rio nell\'Elba', '049', NULL, '2023-02-27 18:49:07', 'H297');
INSERT INTO `comuni` VALUES ('049017', 'Rosignano Marittimo', '049', NULL, '2023-02-27 18:49:07', 'H570');
INSERT INTO `comuni` VALUES ('049018', 'San Vincenzo', '049', NULL, '2023-02-27 18:49:07', 'I390');
INSERT INTO `comuni` VALUES ('049019', 'Sassetta', '049', NULL, '2023-02-27 18:49:07', 'I454');
INSERT INTO `comuni` VALUES ('049020', 'Suvereto', '049', NULL, '2023-02-27 18:49:07', 'L019');
INSERT INTO `comuni` VALUES ('050001', 'Bientina', '050', NULL, '2023-02-27 18:49:07', 'A864');
INSERT INTO `comuni` VALUES ('050002', 'Buti', '050', NULL, '2023-02-27 18:49:07', 'B303');
INSERT INTO `comuni` VALUES ('050003', 'Calci', '050', NULL, '2023-02-27 18:49:07', 'B390');
INSERT INTO `comuni` VALUES ('050004', 'Calcinaia', '050', NULL, '2023-02-27 18:49:07', 'B392');
INSERT INTO `comuni` VALUES ('050005', 'Capannoli', '050', NULL, '2023-02-27 18:49:07', 'B647');
INSERT INTO `comuni` VALUES ('050006', 'Casale Marittimo', '050', NULL, '2023-02-27 18:49:07', 'B878');
INSERT INTO `comuni` VALUES ('050008', 'Cascina', '050', NULL, '2023-02-27 18:49:07', 'B950');
INSERT INTO `comuni` VALUES ('050009', 'Castelfranco di Sotto', '050', NULL, '2023-02-27 18:49:07', 'C113');
INSERT INTO `comuni` VALUES ('050010', 'Castellina Marittima', '050', NULL, '2023-02-27 18:49:07', 'C174');
INSERT INTO `comuni` VALUES ('050011', 'Castelnuovo di Val di Cecina', '050', NULL, '2023-02-27 18:49:07', 'C244');
INSERT INTO `comuni` VALUES ('050012', 'Chianni', '050', NULL, '2023-02-27 18:49:07', 'C609');
INSERT INTO `comuni` VALUES ('050014', 'Fauglia', '050', NULL, '2023-02-27 18:49:07', 'D510');
INSERT INTO `comuni` VALUES ('050015', 'Guardistallo', '050', NULL, '2023-02-27 18:49:07', 'E250');
INSERT INTO `comuni` VALUES ('050016', 'Lajatico', '050', NULL, '2023-02-27 18:49:07', 'E413');
INSERT INTO `comuni` VALUES ('050019', 'Montecatini Val di Cecina', '050', NULL, '2023-02-27 18:49:07', 'F458');
INSERT INTO `comuni` VALUES ('050020', 'Montescudaio', '050', NULL, '2023-02-27 18:49:07', 'F640');
INSERT INTO `comuni` VALUES ('050021', 'Monteverdi Marittimo', '050', NULL, '2023-02-27 18:49:07', 'F661');
INSERT INTO `comuni` VALUES ('050022', 'Montopoli in Val d\'Arno', '050', NULL, '2023-02-27 18:49:07', 'F686');
INSERT INTO `comuni` VALUES ('050023', 'Orciano Pisano', '050', NULL, '2023-02-27 18:49:07', 'G090');
INSERT INTO `comuni` VALUES ('050024', 'Palaia', '050', NULL, '2023-02-27 18:49:07', 'G254');
INSERT INTO `comuni` VALUES ('050025', 'Peccioli', '050', NULL, '2023-02-27 18:49:07', 'G395');
INSERT INTO `comuni` VALUES ('050026', 'Pisa', '050', NULL, '2023-02-27 18:49:07', 'G702');
INSERT INTO `comuni` VALUES ('050027', 'Pomarance', '050', NULL, '2023-02-27 18:49:07', 'G804');
INSERT INTO `comuni` VALUES ('050028', 'Ponsacco', '050', NULL, '2023-02-27 18:49:07', 'G822');
INSERT INTO `comuni` VALUES ('050029', 'Pontedera', '050', NULL, '2023-02-27 18:49:07', 'G843');
INSERT INTO `comuni` VALUES ('050030', 'Riparbella', '050', NULL, '2023-02-27 18:49:07', 'H319');
INSERT INTO `comuni` VALUES ('050031', 'San Giuliano Terme', '050', NULL, '2023-02-27 18:49:07', 'A562');
INSERT INTO `comuni` VALUES ('050032', 'San Miniato', '050', NULL, '2023-02-27 18:49:07', 'I046');
INSERT INTO `comuni` VALUES ('050033', 'Santa Croce sull\'Arno', '050', NULL, '2023-02-27 18:49:07', 'I177');
INSERT INTO `comuni` VALUES ('050034', 'Santa Luce', '050', NULL, '2023-02-27 18:49:07', 'I217');
INSERT INTO `comuni` VALUES ('050035', 'Santa Maria a Monte', '050', NULL, '2023-02-27 18:49:07', 'I232');
INSERT INTO `comuni` VALUES ('050036', 'Terricciola', '050', NULL, '2023-02-27 18:49:07', 'L138');
INSERT INTO `comuni` VALUES ('050037', 'Vecchiano', '050', NULL, '2023-02-27 18:49:07', 'L702');
INSERT INTO `comuni` VALUES ('050038', 'Vicopisano', '050', NULL, '2023-02-27 18:49:07', 'L850');
INSERT INTO `comuni` VALUES ('050039', 'Volterra', '050', NULL, '2023-02-27 18:49:07', 'M126');
INSERT INTO `comuni` VALUES ('050040', 'Casciana Terme Lari', '050', NULL, '2023-02-27 18:49:07', 'M327');
INSERT INTO `comuni` VALUES ('050041', 'Crespina Lorenzana', '050', NULL, '2023-02-27 18:49:07', 'M328');
INSERT INTO `comuni` VALUES ('051001', 'Anghiari', '051', NULL, '2023-02-27 18:49:07', 'A291');
INSERT INTO `comuni` VALUES ('051002', 'Arezzo', '051', NULL, '2023-02-27 18:49:07', 'A390');
INSERT INTO `comuni` VALUES ('051003', 'Badia Tedalda', '051', NULL, '2023-02-27 18:49:07', 'A541');
INSERT INTO `comuni` VALUES ('051004', 'Bibbiena', '051', NULL, '2023-02-27 18:49:07', 'A851');
INSERT INTO `comuni` VALUES ('051005', 'Bucine', '051', NULL, '2023-02-27 18:49:07', 'B243');
INSERT INTO `comuni` VALUES ('051006', 'Capolona', '051', NULL, '2023-02-27 18:49:07', 'B670');
INSERT INTO `comuni` VALUES ('051007', 'Caprese Michelangelo', '051', NULL, '2023-02-27 18:49:07', 'B693');
INSERT INTO `comuni` VALUES ('051008', 'Castel Focognano', '051', NULL, '2023-02-27 18:49:07', 'C102');
INSERT INTO `comuni` VALUES ('051010', 'Castel San Niccolò', '051', NULL, '2023-02-27 18:49:07', 'C263');
INSERT INTO `comuni` VALUES ('051011', 'Castiglion Fibocchi', '051', NULL, '2023-02-27 18:49:07', 'C318');
INSERT INTO `comuni` VALUES ('051012', 'Castiglion Fiorentino', '051', NULL, '2023-02-27 18:49:07', 'C319');
INSERT INTO `comuni` VALUES ('051013', 'Cavriglia', '051', NULL, '2023-02-27 18:49:07', 'C407');
INSERT INTO `comuni` VALUES ('051014', 'Chitignano', '051', NULL, '2023-02-27 18:49:07', 'C648');
INSERT INTO `comuni` VALUES ('051015', 'Chiusi della Verna', '051', NULL, '2023-02-27 18:49:07', 'C663');
INSERT INTO `comuni` VALUES ('051016', 'Civitella in Val di Chiana', '051', NULL, '2023-02-27 18:49:07', 'C774');
INSERT INTO `comuni` VALUES ('051017', 'Cortona', '051', NULL, '2023-02-27 18:49:07', 'D077');
INSERT INTO `comuni` VALUES ('051018', 'Foiano della Chiana', '051', NULL, '2023-02-27 18:49:07', 'D649');
INSERT INTO `comuni` VALUES ('051019', 'Laterina', '051', NULL, '2023-02-27 18:49:07', 'E468');
INSERT INTO `comuni` VALUES ('051020', 'Loro Ciuffenna', '051', NULL, '2023-02-27 18:49:07', 'E693');
INSERT INTO `comuni` VALUES ('051021', 'Lucignano', '051', NULL, '2023-02-27 18:49:07', 'E718');
INSERT INTO `comuni` VALUES ('051022', 'Marciano della Chiana', '051', NULL, '2023-02-27 18:49:07', 'E933');
INSERT INTO `comuni` VALUES ('051023', 'Montemignaio', '051', NULL, '2023-02-27 18:49:07', 'F565');
INSERT INTO `comuni` VALUES ('051024', 'Monterchi', '051', NULL, '2023-02-27 18:49:07', 'F594');
INSERT INTO `comuni` VALUES ('051025', 'Monte San Savino', '051', NULL, '2023-02-27 18:49:07', 'F628');
INSERT INTO `comuni` VALUES ('051026', 'Montevarchi', '051', NULL, '2023-02-27 18:49:07', 'F656');
INSERT INTO `comuni` VALUES ('051027', 'Ortignano Raggiolo', '051', NULL, '2023-02-27 18:49:07', 'G139');
INSERT INTO `comuni` VALUES ('051028', 'Pergine Valdarno', '051', NULL, '2023-02-27 18:49:07', 'G451');
INSERT INTO `comuni` VALUES ('051030', 'Pieve Santo Stefano', '051', NULL, '2023-02-27 18:49:07', 'G653');
INSERT INTO `comuni` VALUES ('051031', 'Poppi', '051', NULL, '2023-02-27 18:49:07', 'G879');
INSERT INTO `comuni` VALUES ('051033', 'San Giovanni Valdarno', '051', NULL, '2023-02-27 18:49:07', 'H901');
INSERT INTO `comuni` VALUES ('051034', 'Sansepolcro', '051', NULL, '2023-02-27 18:49:07', 'I155');
INSERT INTO `comuni` VALUES ('051035', 'Sestino', '051', NULL, '2023-02-27 18:49:07', 'I681');
INSERT INTO `comuni` VALUES ('051037', 'Subbiano', '051', NULL, '2023-02-27 18:49:07', 'I991');
INSERT INTO `comuni` VALUES ('051038', 'Talla', '051', NULL, '2023-02-27 18:49:07', 'L038');
INSERT INTO `comuni` VALUES ('051039', 'Terranuova Bracciolini', '051', NULL, '2023-02-27 18:49:07', 'L123');
INSERT INTO `comuni` VALUES ('051040', 'Castelfranco Piandiscò', '051', NULL, '2023-02-27 18:49:07', 'M322');
INSERT INTO `comuni` VALUES ('051041', 'Pratovecchio Stia', '051', NULL, '2023-02-27 18:49:07', 'M329');
INSERT INTO `comuni` VALUES ('052001', 'Abbadia San Salvatore', '052', NULL, '2023-02-27 18:49:07', 'A006');
INSERT INTO `comuni` VALUES ('052002', 'Asciano', '052', NULL, '2023-02-27 18:49:07', 'A461');
INSERT INTO `comuni` VALUES ('052003', 'Buonconvento', '052', NULL, '2023-02-27 18:49:07', 'B269');
INSERT INTO `comuni` VALUES ('052004', 'Casole d\'Elsa', '052', NULL, '2023-02-27 18:49:07', 'B984');
INSERT INTO `comuni` VALUES ('052005', 'Castellina in Chianti', '052', NULL, '2023-02-27 18:49:07', 'C172');
INSERT INTO `comuni` VALUES ('052006', 'Castelnuovo Berardenga', '052', NULL, '2023-02-27 18:49:07', 'C227');
INSERT INTO `comuni` VALUES ('052007', 'Castiglione d\'Orcia', '052', NULL, '2023-02-27 18:49:07', 'C313');
INSERT INTO `comuni` VALUES ('052008', 'Cetona', '052', NULL, '2023-02-27 18:49:07', 'C587');
INSERT INTO `comuni` VALUES ('052009', 'Chianciano Terme', '052', NULL, '2023-02-27 18:49:07', 'C608');
INSERT INTO `comuni` VALUES ('052010', 'Chiusdino', '052', NULL, '2023-02-27 18:49:07', 'C661');
INSERT INTO `comuni` VALUES ('052011', 'Chiusi', '052', NULL, '2023-02-27 18:49:07', 'C662');
INSERT INTO `comuni` VALUES ('052012', 'Colle di Val d\'Elsa', '052', NULL, '2023-02-27 18:49:07', 'C847');
INSERT INTO `comuni` VALUES ('052013', 'Gaiole in Chianti', '052', NULL, '2023-02-27 18:49:07', 'D858');
INSERT INTO `comuni` VALUES ('052014', 'Montalcino', '052', NULL, '2023-02-27 18:49:07', 'F402');
INSERT INTO `comuni` VALUES ('052015', 'Montepulciano', '052', NULL, '2023-02-27 18:49:07', 'F592');
INSERT INTO `comuni` VALUES ('052016', 'Monteriggioni', '052', NULL, '2023-02-27 18:49:07', 'F598');
INSERT INTO `comuni` VALUES ('052017', 'Monteroni d\'Arbia', '052', NULL, '2023-02-27 18:49:07', 'F605');
INSERT INTO `comuni` VALUES ('052018', 'Monticiano', '052', NULL, '2023-02-27 18:49:07', 'F676');
INSERT INTO `comuni` VALUES ('052019', 'Murlo', '052', NULL, '2023-02-27 18:49:07', 'F815');
INSERT INTO `comuni` VALUES ('052020', 'Piancastagnaio', '052', NULL, '2023-02-27 18:49:07', 'G547');
INSERT INTO `comuni` VALUES ('052021', 'Pienza', '052', NULL, '2023-02-27 18:49:07', 'G602');
INSERT INTO `comuni` VALUES ('052022', 'Poggibonsi', '052', NULL, '2023-02-27 18:49:07', 'G752');
INSERT INTO `comuni` VALUES ('052023', 'Radda in Chianti', '052', NULL, '2023-02-27 18:49:07', 'H153');
INSERT INTO `comuni` VALUES ('052024', 'Radicofani', '052', NULL, '2023-02-27 18:49:07', 'H156');
INSERT INTO `comuni` VALUES ('052025', 'Radicondoli', '052', NULL, '2023-02-27 18:49:07', 'H157');
INSERT INTO `comuni` VALUES ('052026', 'Rapolano Terme', '052', NULL, '2023-02-27 18:49:07', 'H185');
INSERT INTO `comuni` VALUES ('052027', 'San Casciano dei Bagni', '052', NULL, '2023-02-27 18:49:07', 'H790');
INSERT INTO `comuni` VALUES ('052028', 'San Gimignano', '052', NULL, '2023-02-27 18:49:07', 'H875');
INSERT INTO `comuni` VALUES ('052029', 'San Giovanni d\'Asso', '052', NULL, '2023-02-27 18:49:07', 'H911');
INSERT INTO `comuni` VALUES ('052030', 'San Quirico d\'Orcia', '052', NULL, '2023-02-27 18:49:07', 'I135');
INSERT INTO `comuni` VALUES ('052031', 'Sarteano', '052', NULL, '2023-02-27 18:49:07', 'I445');
INSERT INTO `comuni` VALUES ('052032', 'Siena', '052', NULL, '2023-02-27 18:49:07', 'I726');
INSERT INTO `comuni` VALUES ('052033', 'Sinalunga', '052', NULL, '2023-02-27 18:49:07', 'A468');
INSERT INTO `comuni` VALUES ('052034', 'Sovicille', '052', NULL, '2023-02-27 18:49:07', 'I877');
INSERT INTO `comuni` VALUES ('052035', 'Torrita di Siena', '052', NULL, '2023-02-27 18:49:07', 'L303');
INSERT INTO `comuni` VALUES ('052036', 'Trequanda', '052', NULL, '2023-02-27 18:49:07', 'L384');
INSERT INTO `comuni` VALUES ('053001', 'Arcidosso', '053', NULL, '2023-02-27 18:49:07', 'A369');
INSERT INTO `comuni` VALUES ('053002', 'Campagnatico', '053', NULL, '2023-02-27 18:49:07', 'B497');
INSERT INTO `comuni` VALUES ('053003', 'Capalbio', '053', NULL, '2023-02-27 18:49:07', 'B646');
INSERT INTO `comuni` VALUES ('053004', 'Castel del Piano', '053', NULL, '2023-02-27 18:49:07', 'C085');
INSERT INTO `comuni` VALUES ('053005', 'Castell\'Azzara', '053', NULL, '2023-02-27 18:49:07', 'C147');
INSERT INTO `comuni` VALUES ('053006', 'Castiglione della Pescaia', '053', NULL, '2023-02-27 18:49:07', 'C310');
INSERT INTO `comuni` VALUES ('053007', 'Cinigiano', '053', NULL, '2023-02-27 18:49:07', 'C705');
INSERT INTO `comuni` VALUES ('053008', 'Civitella Paganico', '053', NULL, '2023-02-27 18:49:07', 'C782');
INSERT INTO `comuni` VALUES ('053009', 'Follonica', '053', NULL, '2023-02-27 18:49:07', 'D656');
INSERT INTO `comuni` VALUES ('053010', 'Gavorrano', '053', NULL, '2023-02-27 18:49:07', 'D948');
INSERT INTO `comuni` VALUES ('053011', 'Grosseto', '053', NULL, '2023-02-27 18:49:07', 'E202');
INSERT INTO `comuni` VALUES ('053012', 'Isola del Giglio', '053', NULL, '2023-02-27 18:49:07', 'E348');
INSERT INTO `comuni` VALUES ('053013', 'Magliano in Toscana', '053', NULL, '2023-02-27 18:49:07', 'E810');
INSERT INTO `comuni` VALUES ('053014', 'Manciano', '053', NULL, '2023-02-27 18:49:07', 'E875');
INSERT INTO `comuni` VALUES ('053015', 'Massa Marittima', '053', NULL, '2023-02-27 18:49:07', 'F032');
INSERT INTO `comuni` VALUES ('053016', 'Monte Argentario', '053', NULL, '2023-02-27 18:49:07', 'F437');
INSERT INTO `comuni` VALUES ('053017', 'Montieri', '053', NULL, '2023-02-27 18:49:07', 'F677');
INSERT INTO `comuni` VALUES ('053018', 'Orbetello', '053', NULL, '2023-02-27 18:49:07', 'G088');
INSERT INTO `comuni` VALUES ('053019', 'Pitigliano', '053', NULL, '2023-02-27 18:49:07', 'G716');
INSERT INTO `comuni` VALUES ('053020', 'Roccalbegna', '053', NULL, '2023-02-27 18:49:07', 'H417');
INSERT INTO `comuni` VALUES ('053021', 'Roccastrada', '053', NULL, '2023-02-27 18:49:07', 'H449');
INSERT INTO `comuni` VALUES ('053022', 'Santa Fiora', '053', NULL, '2023-02-27 18:49:07', 'I187');
INSERT INTO `comuni` VALUES ('053023', 'Scansano', '053', NULL, '2023-02-27 18:49:07', 'I504');
INSERT INTO `comuni` VALUES ('053024', 'Scarlino', '053', NULL, '2023-02-27 18:49:07', 'I510');
INSERT INTO `comuni` VALUES ('053025', 'Seggiano', '053', NULL, '2023-02-27 18:49:07', 'I571');
INSERT INTO `comuni` VALUES ('053026', 'Sorano', '053', NULL, '2023-02-27 18:49:07', 'I841');
INSERT INTO `comuni` VALUES ('053027', 'Monterotondo Marittimo', '053', NULL, '2023-02-27 18:49:07', 'F612');
INSERT INTO `comuni` VALUES ('053028', 'Semproniano', '053', NULL, '2023-02-27 18:49:07', 'I601');
INSERT INTO `comuni` VALUES ('054001', 'Assisi', '054', NULL, '2023-02-27 18:49:07', 'A475');
INSERT INTO `comuni` VALUES ('054002', 'Bastia Umbra', '054', NULL, '2023-02-27 18:49:07', 'A710');
INSERT INTO `comuni` VALUES ('054003', 'Bettona', '054', NULL, '2023-02-27 18:49:07', 'A832');
INSERT INTO `comuni` VALUES ('054004', 'Bevagna', '054', NULL, '2023-02-27 18:49:07', 'A835');
INSERT INTO `comuni` VALUES ('054005', 'Campello sul Clitunno', '054', NULL, '2023-02-27 18:49:07', 'B504');
INSERT INTO `comuni` VALUES ('054006', 'Cannara', '054', NULL, '2023-02-27 18:49:07', 'B609');
INSERT INTO `comuni` VALUES ('054007', 'Cascia', '054', NULL, '2023-02-27 18:49:07', 'B948');
INSERT INTO `comuni` VALUES ('054008', 'Castel Ritaldi', '054', NULL, '2023-02-27 18:49:07', 'C252');
INSERT INTO `comuni` VALUES ('054009', 'Castiglione del Lago', '054', NULL, '2023-02-27 18:49:07', 'C309');
INSERT INTO `comuni` VALUES ('054010', 'Cerreto di Spoleto', '054', NULL, '2023-02-27 18:49:07', 'C527');
INSERT INTO `comuni` VALUES ('054011', 'Citerna', '054', NULL, '2023-02-27 18:49:07', 'C742');
INSERT INTO `comuni` VALUES ('054012', 'Città della Pieve', '054', NULL, '2023-02-27 18:49:07', 'C744');
INSERT INTO `comuni` VALUES ('054013', 'Città di Castello', '054', NULL, '2023-02-27 18:49:07', 'C745');
INSERT INTO `comuni` VALUES ('054014', 'Collazzone', '054', NULL, '2023-02-27 18:49:07', 'C845');
INSERT INTO `comuni` VALUES ('054015', 'Corciano', '054', NULL, '2023-02-27 18:49:07', 'C990');
INSERT INTO `comuni` VALUES ('054016', 'Costacciaro', '054', NULL, '2023-02-27 18:49:07', 'D108');
INSERT INTO `comuni` VALUES ('054017', 'Deruta', '054', NULL, '2023-02-27 18:49:07', 'D279');
INSERT INTO `comuni` VALUES ('054018', 'Foligno', '054', NULL, '2023-02-27 18:49:07', 'D653');
INSERT INTO `comuni` VALUES ('054019', 'Fossato di Vico', '054', NULL, '2023-02-27 18:49:07', 'D745');
INSERT INTO `comuni` VALUES ('054020', 'Fratta Todina', '054', NULL, '2023-02-27 18:49:07', 'D787');
INSERT INTO `comuni` VALUES ('054021', 'Giano dell\'Umbria', '054', NULL, '2023-02-27 18:49:07', 'E012');
INSERT INTO `comuni` VALUES ('054022', 'Gualdo Cattaneo', '054', NULL, '2023-02-27 18:49:07', 'E229');
INSERT INTO `comuni` VALUES ('054023', 'Gualdo Tadino', '054', NULL, '2023-02-27 18:49:07', 'E230');
INSERT INTO `comuni` VALUES ('054024', 'Gubbio', '054', NULL, '2023-02-27 18:49:07', 'E256');
INSERT INTO `comuni` VALUES ('054025', 'Lisciano Niccone', '054', NULL, '2023-02-27 18:49:07', 'E613');
INSERT INTO `comuni` VALUES ('054026', 'Magione', '054', NULL, '2023-02-27 18:49:07', 'E805');
INSERT INTO `comuni` VALUES ('054027', 'Marsciano', '054', NULL, '2023-02-27 18:49:07', 'E975');
INSERT INTO `comuni` VALUES ('054028', 'Massa Martana', '054', NULL, '2023-02-27 18:49:07', 'F024');
INSERT INTO `comuni` VALUES ('054029', 'Monte Castello di Vibio', '054', NULL, '2023-02-27 18:49:07', 'F456');
INSERT INTO `comuni` VALUES ('054030', 'Montefalco', '054', NULL, '2023-02-27 18:49:07', 'F492');
INSERT INTO `comuni` VALUES ('054031', 'Monteleone di Spoleto', '054', NULL, '2023-02-27 18:49:07', 'F540');
INSERT INTO `comuni` VALUES ('054032', 'Monte Santa Maria Tiberina', '054', NULL, '2023-02-27 18:49:07', 'F629');
INSERT INTO `comuni` VALUES ('054033', 'Montone', '054', NULL, '2023-02-27 18:49:07', 'F685');
INSERT INTO `comuni` VALUES ('054034', 'Nocera Umbra', '054', NULL, '2023-02-27 18:49:07', 'F911');
INSERT INTO `comuni` VALUES ('054035', 'Norcia', '054', NULL, '2023-02-27 18:49:07', 'F935');
INSERT INTO `comuni` VALUES ('054036', 'Paciano', '054', NULL, '2023-02-27 18:49:07', 'G212');
INSERT INTO `comuni` VALUES ('054037', 'Panicale', '054', NULL, '2023-02-27 18:49:07', 'G308');
INSERT INTO `comuni` VALUES ('054038', 'Passignano sul Trasimeno', '054', NULL, '2023-02-27 18:49:07', 'G359');
INSERT INTO `comuni` VALUES ('054039', 'Perugia', '054', NULL, '2023-02-27 18:49:07', 'G478');
INSERT INTO `comuni` VALUES ('054040', 'Piegaro', '054', NULL, '2023-02-27 18:49:07', 'G601');
INSERT INTO `comuni` VALUES ('054041', 'Pietralunga', '054', NULL, '2023-02-27 18:49:07', 'G618');
INSERT INTO `comuni` VALUES ('054042', 'Poggiodomo', '054', NULL, '2023-02-27 18:49:07', 'G758');
INSERT INTO `comuni` VALUES ('054043', 'Preci', '054', NULL, '2023-02-27 18:49:07', 'H015');
INSERT INTO `comuni` VALUES ('054044', 'San Giustino', '054', NULL, '2023-02-27 18:49:07', 'H935');
INSERT INTO `comuni` VALUES ('054045', 'Sant\'Anatolia di Narco', '054', NULL, '2023-02-27 18:49:07', 'I263');
INSERT INTO `comuni` VALUES ('054046', 'Scheggia e Pascelupo', '054', NULL, '2023-02-27 18:49:07', 'I522');
INSERT INTO `comuni` VALUES ('054047', 'Scheggino', '054', NULL, '2023-02-27 18:49:07', 'I523');
INSERT INTO `comuni` VALUES ('054048', 'Sellano', '054', NULL, '2023-02-27 18:49:07', 'I585');
INSERT INTO `comuni` VALUES ('054049', 'Sigillo', '054', NULL, '2023-02-27 18:49:07', 'I727');
INSERT INTO `comuni` VALUES ('054050', 'Spello', '054', NULL, '2023-02-27 18:49:07', 'I888');
INSERT INTO `comuni` VALUES ('054051', 'Spoleto', '054', NULL, '2023-02-27 18:49:07', 'I921');
INSERT INTO `comuni` VALUES ('054052', 'Todi', '054', NULL, '2023-02-27 18:49:07', 'L188');
INSERT INTO `comuni` VALUES ('054053', 'Torgiano', '054', NULL, '2023-02-27 18:49:07', 'L216');
INSERT INTO `comuni` VALUES ('054054', 'Trevi', '054', NULL, '2023-02-27 18:49:07', 'L397');
INSERT INTO `comuni` VALUES ('054055', 'Tuoro sul Trasimeno', '054', NULL, '2023-02-27 18:49:07', 'L466');
INSERT INTO `comuni` VALUES ('054056', 'Umbertide', '054', NULL, '2023-02-27 18:49:07', 'D786');
INSERT INTO `comuni` VALUES ('054057', 'Valfabbrica', '054', NULL, '2023-02-27 18:49:07', 'L573');
INSERT INTO `comuni` VALUES ('054058', 'Vallo di Nera', '054', NULL, '2023-02-27 18:49:07', 'L627');
INSERT INTO `comuni` VALUES ('054059', 'Valtopina', '054', NULL, '2023-02-27 18:49:07', 'L653');
INSERT INTO `comuni` VALUES ('055001', 'Acquasparta', '055', NULL, '2023-02-27 18:49:07', 'A045');
INSERT INTO `comuni` VALUES ('055002', 'Allerona', '055', NULL, '2023-02-27 18:49:07', 'A207');
INSERT INTO `comuni` VALUES ('055003', 'Alviano', '055', NULL, '2023-02-27 18:49:07', 'A242');
INSERT INTO `comuni` VALUES ('055004', 'Amelia', '055', NULL, '2023-02-27 18:49:07', 'A262');
INSERT INTO `comuni` VALUES ('055005', 'Arrone', '055', NULL, '2023-02-27 18:49:07', 'A439');
INSERT INTO `comuni` VALUES ('055006', 'Attigliano', '055', NULL, '2023-02-27 18:49:07', 'A490');
INSERT INTO `comuni` VALUES ('055007', 'Baschi', '055', NULL, '2023-02-27 18:49:07', 'A691');
INSERT INTO `comuni` VALUES ('055008', 'Calvi dell\'Umbria', '055', NULL, '2023-02-27 18:49:07', 'B446');
INSERT INTO `comuni` VALUES ('055009', 'Castel Giorgio', '055', NULL, '2023-02-27 18:49:07', 'C117');
INSERT INTO `comuni` VALUES ('055010', 'Castel Viscardo', '055', NULL, '2023-02-27 18:49:07', 'C289');
INSERT INTO `comuni` VALUES ('055011', 'Fabro', '055', NULL, '2023-02-27 18:49:07', 'D454');
INSERT INTO `comuni` VALUES ('055012', 'Ferentillo', '055', NULL, '2023-02-27 18:49:07', 'D538');
INSERT INTO `comuni` VALUES ('055013', 'Ficulle', '055', NULL, '2023-02-27 18:49:07', 'D570');
INSERT INTO `comuni` VALUES ('055014', 'Giove', '055', NULL, '2023-02-27 18:49:07', 'E045');
INSERT INTO `comuni` VALUES ('055015', 'Guardea', '055', NULL, '2023-02-27 18:49:07', 'E241');
INSERT INTO `comuni` VALUES ('055016', 'Lugnano in Teverina', '055', NULL, '2023-02-27 18:49:07', 'E729');
INSERT INTO `comuni` VALUES ('055017', 'Montecastrilli', '055', NULL, '2023-02-27 18:49:07', 'F457');
INSERT INTO `comuni` VALUES ('055018', 'Montecchio', '055', NULL, '2023-02-27 18:49:07', 'F462');
INSERT INTO `comuni` VALUES ('055019', 'Montefranco', '055', NULL, '2023-02-27 18:49:07', 'F510');
INSERT INTO `comuni` VALUES ('055020', 'Montegabbione', '055', NULL, '2023-02-27 18:49:07', 'F513');
INSERT INTO `comuni` VALUES ('055021', 'Monteleone d\'Orvieto', '055', NULL, '2023-02-27 18:49:07', 'F543');
INSERT INTO `comuni` VALUES ('055022', 'Narni', '055', NULL, '2023-02-27 18:49:07', 'F844');
INSERT INTO `comuni` VALUES ('055023', 'Orvieto', '055', NULL, '2023-02-27 18:49:07', 'G148');
INSERT INTO `comuni` VALUES ('055024', 'Otricoli', '055', NULL, '2023-02-27 18:49:07', 'G189');
INSERT INTO `comuni` VALUES ('055025', 'Parrano', '055', NULL, '2023-02-27 18:49:07', 'G344');
INSERT INTO `comuni` VALUES ('055026', 'Penna in Teverina', '055', NULL, '2023-02-27 18:49:07', 'G432');
INSERT INTO `comuni` VALUES ('055027', 'Polino', '055', NULL, '2023-02-27 18:49:07', 'G790');
INSERT INTO `comuni` VALUES ('055028', 'Porano', '055', NULL, '2023-02-27 18:49:07', 'G881');
INSERT INTO `comuni` VALUES ('055029', 'San Gemini', '055', NULL, '2023-02-27 18:49:07', 'H857');
INSERT INTO `comuni` VALUES ('055030', 'San Venanzo', '055', NULL, '2023-02-27 18:49:07', 'I381');
INSERT INTO `comuni` VALUES ('055031', 'Stroncone', '055', NULL, '2023-02-27 18:49:07', 'I981');
INSERT INTO `comuni` VALUES ('055032', 'Terni', '055', NULL, '2023-02-27 18:49:07', 'L117');
INSERT INTO `comuni` VALUES ('055033', 'Avigliano Umbro', '055', NULL, '2023-02-27 18:49:07', 'M258');
INSERT INTO `comuni` VALUES ('056001', 'Acquapendente', '056', NULL, '2023-02-27 18:49:07', 'A040');
INSERT INTO `comuni` VALUES ('056002', 'Arlena di Castro', '056', NULL, '2023-02-27 18:49:07', 'A412');
INSERT INTO `comuni` VALUES ('056003', 'Bagnoregio', '056', NULL, '2023-02-27 18:49:07', 'A577');
INSERT INTO `comuni` VALUES ('056004', 'Barbarano Romano', '056', NULL, '2023-02-27 18:49:07', 'A628');
INSERT INTO `comuni` VALUES ('056005', 'Bassano Romano', '056', NULL, '2023-02-27 18:49:07', 'A704');
INSERT INTO `comuni` VALUES ('056006', 'Bassano in Teverina', '056', NULL, '2023-02-27 18:49:07', 'A706');
INSERT INTO `comuni` VALUES ('056007', 'Blera', '056', NULL, '2023-02-27 18:49:07', 'A857');
INSERT INTO `comuni` VALUES ('056008', 'Bolsena', '056', NULL, '2023-02-27 18:49:07', 'A949');
INSERT INTO `comuni` VALUES ('056009', 'Bomarzo', '056', NULL, '2023-02-27 18:49:07', 'A955');
INSERT INTO `comuni` VALUES ('056010', 'Calcata', '056', NULL, '2023-02-27 18:49:07', 'B388');
INSERT INTO `comuni` VALUES ('056011', 'Canepina', '056', NULL, '2023-02-27 18:49:07', 'B597');
INSERT INTO `comuni` VALUES ('056012', 'Canino', '056', NULL, '2023-02-27 18:49:07', 'B604');
INSERT INTO `comuni` VALUES ('056013', 'Capodimonte', '056', NULL, '2023-02-27 18:49:07', 'B663');
INSERT INTO `comuni` VALUES ('056014', 'Capranica', '056', NULL, '2023-02-27 18:49:07', 'B688');
INSERT INTO `comuni` VALUES ('056015', 'Caprarola', '056', NULL, '2023-02-27 18:49:07', 'B691');
INSERT INTO `comuni` VALUES ('056016', 'Carbognano', '056', NULL, '2023-02-27 18:49:07', 'B735');
INSERT INTO `comuni` VALUES ('056017', 'Castel Sant\'Elia', '056', NULL, '2023-02-27 18:49:07', 'C269');
INSERT INTO `comuni` VALUES ('056018', 'Castiglione in Teverina', '056', NULL, '2023-02-27 18:49:07', 'C315');
INSERT INTO `comuni` VALUES ('056019', 'Celleno', '056', NULL, '2023-02-27 18:49:07', 'C446');
INSERT INTO `comuni` VALUES ('056020', 'Cellere', '056', NULL, '2023-02-27 18:49:07', 'C447');
INSERT INTO `comuni` VALUES ('056021', 'Civita Castellana', '056', NULL, '2023-02-27 18:49:07', 'C765');
INSERT INTO `comuni` VALUES ('056022', 'Civitella d\'Agliano', '056', NULL, '2023-02-27 18:49:07', 'C780');
INSERT INTO `comuni` VALUES ('056023', 'Corchiano', '056', NULL, '2023-02-27 18:49:07', 'C988');
INSERT INTO `comuni` VALUES ('056024', 'Fabrica di Roma', '056', NULL, '2023-02-27 18:49:07', 'D452');
INSERT INTO `comuni` VALUES ('056025', 'Faleria', '056', NULL, '2023-02-27 18:49:07', 'D475');
INSERT INTO `comuni` VALUES ('056026', 'Farnese', '056', NULL, '2023-02-27 18:49:07', 'D503');
INSERT INTO `comuni` VALUES ('056027', 'Gallese', '056', NULL, '2023-02-27 18:49:07', 'D870');
INSERT INTO `comuni` VALUES ('056028', 'Gradoli', '056', NULL, '2023-02-27 18:49:07', 'E126');
INSERT INTO `comuni` VALUES ('056029', 'Graffignano', '056', NULL, '2023-02-27 18:49:07', 'E128');
INSERT INTO `comuni` VALUES ('056030', 'Grotte di Castro', '056', NULL, '2023-02-27 18:49:07', 'E210');
INSERT INTO `comuni` VALUES ('056031', 'Ischia di Castro', '056', NULL, '2023-02-27 18:49:07', 'E330');
INSERT INTO `comuni` VALUES ('056032', 'Latera', '056', NULL, '2023-02-27 18:49:07', 'E467');
INSERT INTO `comuni` VALUES ('056033', 'Lubriano', '056', NULL, '2023-02-27 18:49:07', 'E713');
INSERT INTO `comuni` VALUES ('056034', 'Marta', '056', NULL, '2023-02-27 18:49:07', 'E978');
INSERT INTO `comuni` VALUES ('056035', 'Montalto di Castro', '056', NULL, '2023-02-27 18:49:07', 'F419');
INSERT INTO `comuni` VALUES ('056036', 'Montefiascone', '056', NULL, '2023-02-27 18:49:07', 'F499');
INSERT INTO `comuni` VALUES ('056037', 'Monte Romano', '056', NULL, '2023-02-27 18:49:07', 'F603');
INSERT INTO `comuni` VALUES ('056038', 'Monterosi', '056', NULL, '2023-02-27 18:49:07', 'F606');
INSERT INTO `comuni` VALUES ('056039', 'Nepi', '056', NULL, '2023-02-27 18:49:07', 'F868');
INSERT INTO `comuni` VALUES ('056040', 'Onano', '056', NULL, '2023-02-27 18:49:07', 'G065');
INSERT INTO `comuni` VALUES ('056041', 'Oriolo Romano', '056', NULL, '2023-02-27 18:49:07', 'G111');
INSERT INTO `comuni` VALUES ('056042', 'Orte', '056', NULL, '2023-02-27 18:49:07', 'G135');
INSERT INTO `comuni` VALUES ('056043', 'Piansano', '056', NULL, '2023-02-27 18:49:07', 'G571');
INSERT INTO `comuni` VALUES ('056044', 'Proceno', '056', NULL, '2023-02-27 18:49:07', 'H071');
INSERT INTO `comuni` VALUES ('056045', 'Ronciglione', '056', NULL, '2023-02-27 18:49:07', 'H534');
INSERT INTO `comuni` VALUES ('056046', 'Villa San Giovanni in Tuscia', '056', NULL, '2023-02-27 18:49:07', 'H913');
INSERT INTO `comuni` VALUES ('056047', 'San Lorenzo Nuovo', '056', NULL, '2023-02-27 18:49:07', 'H969');
INSERT INTO `comuni` VALUES ('056048', 'Soriano nel Cimino', '056', NULL, '2023-02-27 18:49:07', 'I855');
INSERT INTO `comuni` VALUES ('056049', 'Sutri', '056', NULL, '2023-02-27 18:49:07', 'L017');
INSERT INTO `comuni` VALUES ('056050', 'Tarquinia', '056', NULL, '2023-02-27 18:49:07', 'D024');
INSERT INTO `comuni` VALUES ('056051', 'Tessennano', '056', NULL, '2023-02-27 18:49:07', 'L150');
INSERT INTO `comuni` VALUES ('056052', 'Tuscania', '056', NULL, '2023-02-27 18:49:07', 'L310');
INSERT INTO `comuni` VALUES ('056053', 'Valentano', '056', NULL, '2023-02-27 18:49:07', 'L569');
INSERT INTO `comuni` VALUES ('056054', 'Vallerano', '056', NULL, '2023-02-27 18:49:07', 'L612');
INSERT INTO `comuni` VALUES ('056055', 'Vasanello', '056', NULL, '2023-02-27 18:49:07', 'A701');
INSERT INTO `comuni` VALUES ('056056', 'Vejano', '056', NULL, '2023-02-27 18:49:07', 'L713');
INSERT INTO `comuni` VALUES ('056057', 'Vetralla', '056', NULL, '2023-02-27 18:49:07', 'L814');
INSERT INTO `comuni` VALUES ('056058', 'Vignanello', '056', NULL, '2023-02-27 18:49:07', 'L882');
INSERT INTO `comuni` VALUES ('056059', 'Viterbo', '056', NULL, '2023-02-27 18:49:07', 'M082');
INSERT INTO `comuni` VALUES ('056060', 'Vitorchiano', '056', NULL, '2023-02-27 18:49:07', 'M086');
INSERT INTO `comuni` VALUES ('057001', 'Accumoli', '057', NULL, '2023-02-27 18:49:07', 'A019');
INSERT INTO `comuni` VALUES ('057002', 'Amatrice', '057', NULL, '2023-02-27 18:49:07', 'A258');
INSERT INTO `comuni` VALUES ('057003', 'Antrodoco', '057', NULL, '2023-02-27 18:49:07', 'A315');
INSERT INTO `comuni` VALUES ('057004', 'Ascrea', '057', NULL, '2023-02-27 18:49:07', 'A464');
INSERT INTO `comuni` VALUES ('057005', 'Belmonte in Sabina', '057', NULL, '2023-02-27 18:49:07', 'A765');
INSERT INTO `comuni` VALUES ('057006', 'Borbona', '057', NULL, '2023-02-27 18:49:07', 'A981');
INSERT INTO `comuni` VALUES ('057007', 'Borgorose', '057', NULL, '2023-02-27 18:49:07', 'B008');
INSERT INTO `comuni` VALUES ('057008', 'Borgo Velino', '057', NULL, '2023-02-27 18:49:07', 'A996');
INSERT INTO `comuni` VALUES ('057009', 'Cantalice', '057', NULL, '2023-02-27 18:49:07', 'B627');
INSERT INTO `comuni` VALUES ('057010', 'Cantalupo in Sabina', '057', NULL, '2023-02-27 18:49:07', 'B631');
INSERT INTO `comuni` VALUES ('057011', 'Casaprota', '057', NULL, '2023-02-27 18:49:07', 'B934');
INSERT INTO `comuni` VALUES ('057012', 'Casperia', '057', NULL, '2023-02-27 18:49:07', 'A472');
INSERT INTO `comuni` VALUES ('057013', 'Castel di Tora', '057', NULL, '2023-02-27 18:49:07', 'C098');
INSERT INTO `comuni` VALUES ('057014', 'Castelnuovo di Farfa', '057', NULL, '2023-02-27 18:49:07', 'C224');
INSERT INTO `comuni` VALUES ('057015', 'Castel Sant\'Angelo', '057', NULL, '2023-02-27 18:49:07', 'C268');
INSERT INTO `comuni` VALUES ('057016', 'Cittaducale', '057', NULL, '2023-02-27 18:49:07', 'C746');
INSERT INTO `comuni` VALUES ('057017', 'Cittareale', '057', NULL, '2023-02-27 18:49:07', 'C749');
INSERT INTO `comuni` VALUES ('057018', 'Collalto Sabino', '057', NULL, '2023-02-27 18:49:07', 'C841');
INSERT INTO `comuni` VALUES ('057019', 'Colle di Tora', '057', NULL, '2023-02-27 18:49:07', 'C857');
INSERT INTO `comuni` VALUES ('057020', 'Collegiove', '057', NULL, '2023-02-27 18:49:07', 'C859');
INSERT INTO `comuni` VALUES ('057021', 'Collevecchio', '057', NULL, '2023-02-27 18:49:07', 'C876');
INSERT INTO `comuni` VALUES ('057022', 'Colli sul Velino', '057', NULL, '2023-02-27 18:49:07', 'C880');
INSERT INTO `comuni` VALUES ('057023', 'Concerviano', '057', NULL, '2023-02-27 18:49:07', 'C946');
INSERT INTO `comuni` VALUES ('057024', 'Configni', '057', NULL, '2023-02-27 18:49:07', 'C959');
INSERT INTO `comuni` VALUES ('057025', 'Contigliano', '057', NULL, '2023-02-27 18:49:07', 'C969');
INSERT INTO `comuni` VALUES ('057026', 'Cottanello', '057', NULL, '2023-02-27 18:49:07', 'D124');
INSERT INTO `comuni` VALUES ('057027', 'Fara in Sabina', '057', NULL, '2023-02-27 18:49:07', 'D493');
INSERT INTO `comuni` VALUES ('057028', 'Fiamignano', '057', NULL, '2023-02-27 18:49:07', 'D560');
INSERT INTO `comuni` VALUES ('057029', 'Forano', '057', NULL, '2023-02-27 18:49:07', 'D689');
INSERT INTO `comuni` VALUES ('057030', 'Frasso Sabino', '057', NULL, '2023-02-27 18:49:07', 'D785');
INSERT INTO `comuni` VALUES ('057031', 'Greccio', '057', NULL, '2023-02-27 18:49:07', 'E160');
INSERT INTO `comuni` VALUES ('057032', 'Labro', '057', NULL, '2023-02-27 18:49:07', 'E393');
INSERT INTO `comuni` VALUES ('057033', 'Leonessa', '057', NULL, '2023-02-27 18:49:07', 'E535');
INSERT INTO `comuni` VALUES ('057034', 'Longone Sabino', '057', NULL, '2023-02-27 18:49:07', 'E681');
INSERT INTO `comuni` VALUES ('057035', 'Magliano Sabina', '057', NULL, '2023-02-27 18:49:07', 'E812');
INSERT INTO `comuni` VALUES ('057036', 'Marcetelli', '057', NULL, '2023-02-27 18:49:07', 'E927');
INSERT INTO `comuni` VALUES ('057037', 'Micigliano', '057', NULL, '2023-02-27 18:49:07', 'F193');
INSERT INTO `comuni` VALUES ('057038', 'Mompeo', '057', NULL, '2023-02-27 18:49:07', 'F319');
INSERT INTO `comuni` VALUES ('057039', 'Montasola', '057', NULL, '2023-02-27 18:49:07', 'F430');
INSERT INTO `comuni` VALUES ('057040', 'Montebuono', '057', NULL, '2023-02-27 18:49:07', 'F446');
INSERT INTO `comuni` VALUES ('057041', 'Monteleone Sabino', '057', NULL, '2023-02-27 18:49:07', 'F541');
INSERT INTO `comuni` VALUES ('057042', 'Montenero Sabino', '057', NULL, '2023-02-27 18:49:07', 'F579');
INSERT INTO `comuni` VALUES ('057043', 'Monte San Giovanni in Sabina', '057', NULL, '2023-02-27 18:49:07', 'F619');
INSERT INTO `comuni` VALUES ('057044', 'Montopoli di Sabina', '057', NULL, '2023-02-27 18:49:07', 'F687');
INSERT INTO `comuni` VALUES ('057045', 'Morro Reatino', '057', NULL, '2023-02-27 18:49:07', 'F746');
INSERT INTO `comuni` VALUES ('057046', 'Nespolo', '057', NULL, '2023-02-27 18:49:07', 'F876');
INSERT INTO `comuni` VALUES ('057047', 'Orvinio', '057', NULL, '2023-02-27 18:49:07', 'B595');
INSERT INTO `comuni` VALUES ('057048', 'Paganico Sabino', '057', NULL, '2023-02-27 18:49:07', 'G232');
INSERT INTO `comuni` VALUES ('057049', 'Pescorocchiano', '057', NULL, '2023-02-27 18:49:07', 'G498');
INSERT INTO `comuni` VALUES ('057050', 'Petrella Salto', '057', NULL, '2023-02-27 18:49:07', 'G513');
INSERT INTO `comuni` VALUES ('057051', 'Poggio Bustone', '057', NULL, '2023-02-27 18:49:07', 'G756');
INSERT INTO `comuni` VALUES ('057052', 'Poggio Catino', '057', NULL, '2023-02-27 18:49:07', 'G757');
INSERT INTO `comuni` VALUES ('057053', 'Poggio Mirteto', '057', NULL, '2023-02-27 18:49:07', 'G763');
INSERT INTO `comuni` VALUES ('057054', 'Poggio Moiano', '057', NULL, '2023-02-27 18:49:07', 'G764');
INSERT INTO `comuni` VALUES ('057055', 'Poggio Nativo', '057', NULL, '2023-02-27 18:49:07', 'G765');
INSERT INTO `comuni` VALUES ('057056', 'Poggio San Lorenzo', '057', NULL, '2023-02-27 18:49:07', 'G770');
INSERT INTO `comuni` VALUES ('057057', 'Posta', '057', NULL, '2023-02-27 18:49:07', 'G934');
INSERT INTO `comuni` VALUES ('057058', 'Pozzaglia Sabina', '057', NULL, '2023-02-27 18:49:07', 'G951');
INSERT INTO `comuni` VALUES ('057059', 'Rieti', '057', NULL, '2023-02-27 18:49:07', 'H282');
INSERT INTO `comuni` VALUES ('057060', 'Rivodutri', '057', NULL, '2023-02-27 18:49:07', 'H354');
INSERT INTO `comuni` VALUES ('057061', 'Roccantica', '057', NULL, '2023-02-27 18:49:07', 'H427');
INSERT INTO `comuni` VALUES ('057062', 'Rocca Sinibalda', '057', NULL, '2023-02-27 18:49:07', 'H446');
INSERT INTO `comuni` VALUES ('057063', 'Salisano', '057', NULL, '2023-02-27 18:49:07', 'H713');
INSERT INTO `comuni` VALUES ('057064', 'Scandriglia', '057', NULL, '2023-02-27 18:49:07', 'I499');
INSERT INTO `comuni` VALUES ('057065', 'Selci', '057', NULL, '2023-02-27 18:49:07', 'I581');
INSERT INTO `comuni` VALUES ('057066', 'Stimigliano', '057', NULL, '2023-02-27 18:49:07', 'I959');
INSERT INTO `comuni` VALUES ('057067', 'Tarano', '057', NULL, '2023-02-27 18:49:07', 'L046');
INSERT INTO `comuni` VALUES ('057068', 'Toffia', '057', NULL, '2023-02-27 18:49:07', 'L189');
INSERT INTO `comuni` VALUES ('057069', 'Torricella in Sabina', '057', NULL, '2023-02-27 18:49:07', 'L293');
INSERT INTO `comuni` VALUES ('057070', 'Torri in Sabina', '057', NULL, '2023-02-27 18:49:07', 'L286');
INSERT INTO `comuni` VALUES ('057071', 'Turania', '057', NULL, '2023-02-27 18:49:07', 'G507');
INSERT INTO `comuni` VALUES ('057072', 'Vacone', '057', NULL, '2023-02-27 18:49:07', 'L525');
INSERT INTO `comuni` VALUES ('057073', 'Varco Sabino', '057', NULL, '2023-02-27 18:49:07', 'L676');
INSERT INTO `comuni` VALUES ('058001', 'Affile', '058', NULL, '2023-02-27 18:49:07', 'A062');
INSERT INTO `comuni` VALUES ('058002', 'Agosta', '058', NULL, '2023-02-27 18:49:07', 'A084');
INSERT INTO `comuni` VALUES ('058003', 'Albano Laziale', '058', NULL, '2023-02-27 18:49:07', 'A132');
INSERT INTO `comuni` VALUES ('058004', 'Allumiere', '058', NULL, '2023-02-27 18:49:07', 'A210');
INSERT INTO `comuni` VALUES ('058005', 'Anguillara Sabazia', '058', NULL, '2023-02-27 18:49:07', 'A297');
INSERT INTO `comuni` VALUES ('058006', 'Anticoli Corrado', '058', NULL, '2023-02-27 18:49:07', 'A309');
INSERT INTO `comuni` VALUES ('058007', 'Anzio', '058', NULL, '2023-02-27 18:49:07', 'A323');
INSERT INTO `comuni` VALUES ('058008', 'Arcinazzo Romano', '058', NULL, '2023-02-27 18:49:07', 'A370');
INSERT INTO `comuni` VALUES ('058009', 'Ariccia', '058', NULL, '2023-02-27 18:49:07', 'A401');
INSERT INTO `comuni` VALUES ('058010', 'Arsoli', '058', NULL, '2023-02-27 18:49:07', 'A446');
INSERT INTO `comuni` VALUES ('058011', 'Artena', '058', NULL, '2023-02-27 18:49:07', 'A449');
INSERT INTO `comuni` VALUES ('058012', 'Bellegra', '058', NULL, '2023-02-27 18:49:07', 'A749');
INSERT INTO `comuni` VALUES ('058013', 'Bracciano', '058', NULL, '2023-02-27 18:49:07', 'B114');
INSERT INTO `comuni` VALUES ('058014', 'Camerata Nuova', '058', NULL, '2023-02-27 18:49:07', 'B472');
INSERT INTO `comuni` VALUES ('058015', 'Campagnano di Roma', '058', NULL, '2023-02-27 18:49:07', 'B496');
INSERT INTO `comuni` VALUES ('058016', 'Canale Monterano', '058', NULL, '2023-02-27 18:49:07', 'B576');
INSERT INTO `comuni` VALUES ('058017', 'Canterano', '058', NULL, '2023-02-27 18:49:07', 'B635');
INSERT INTO `comuni` VALUES ('058018', 'Capena', '058', NULL, '2023-02-27 18:49:07', 'B649');
INSERT INTO `comuni` VALUES ('058019', 'Capranica Prenestina', '058', NULL, '2023-02-27 18:49:07', 'B687');
INSERT INTO `comuni` VALUES ('058020', 'Carpineto Romano', '058', NULL, '2023-02-27 18:49:07', 'B828');
INSERT INTO `comuni` VALUES ('058021', 'Casape', '058', NULL, '2023-02-27 18:49:07', 'B932');
INSERT INTO `comuni` VALUES ('058022', 'Castel Gandolfo', '058', NULL, '2023-02-27 18:49:07', 'C116');
INSERT INTO `comuni` VALUES ('058023', 'Castel Madama', '058', NULL, '2023-02-27 18:49:07', 'C203');
INSERT INTO `comuni` VALUES ('058024', 'Castelnuovo di Porto', '058', NULL, '2023-02-27 18:49:07', 'C237');
INSERT INTO `comuni` VALUES ('058025', 'Castel San Pietro Romano', '058', NULL, '2023-02-27 18:49:07', 'C266');
INSERT INTO `comuni` VALUES ('058026', 'Cave', '058', NULL, '2023-02-27 18:49:07', 'C390');
INSERT INTO `comuni` VALUES ('058027', 'Cerreto Laziale', '058', NULL, '2023-02-27 18:49:07', 'C518');
INSERT INTO `comuni` VALUES ('058028', 'Cervara di Roma', '058', NULL, '2023-02-27 18:49:07', 'C543');
INSERT INTO `comuni` VALUES ('058029', 'Cerveteri', '058', NULL, '2023-02-27 18:49:07', 'C552');
INSERT INTO `comuni` VALUES ('058030', 'Ciciliano', '058', NULL, '2023-02-27 18:49:07', 'C677');
INSERT INTO `comuni` VALUES ('058031', 'Cineto Romano', '058', NULL, '2023-02-27 18:49:07', 'C702');
INSERT INTO `comuni` VALUES ('058032', 'Civitavecchia', '058', NULL, '2023-02-27 18:49:07', 'C773');
INSERT INTO `comuni` VALUES ('058033', 'Civitella San Paolo', '058', NULL, '2023-02-27 18:49:07', 'C784');
INSERT INTO `comuni` VALUES ('058034', 'Colleferro', '058', NULL, '2023-02-27 18:49:07', 'C858');
INSERT INTO `comuni` VALUES ('058035', 'Colonna', '058', NULL, '2023-02-27 18:49:07', 'C900');
INSERT INTO `comuni` VALUES ('058036', 'Fiano Romano', '058', NULL, '2023-02-27 18:49:07', 'D561');
INSERT INTO `comuni` VALUES ('058037', 'Filacciano', '058', NULL, '2023-02-27 18:49:07', 'D586');
INSERT INTO `comuni` VALUES ('058038', 'Formello', '058', NULL, '2023-02-27 18:49:07', 'D707');
INSERT INTO `comuni` VALUES ('058039', 'Frascati', '058', NULL, '2023-02-27 18:49:07', 'D773');
INSERT INTO `comuni` VALUES ('058040', 'Gallicano nel Lazio', '058', NULL, '2023-02-27 18:49:07', 'D875');
INSERT INTO `comuni` VALUES ('058041', 'Gavignano', '058', NULL, '2023-02-27 18:49:07', 'D945');
INSERT INTO `comuni` VALUES ('058042', 'Genazzano', '058', NULL, '2023-02-27 18:49:07', 'D964');
INSERT INTO `comuni` VALUES ('058043', 'Genzano di Roma', '058', NULL, '2023-02-27 18:49:07', 'D972');
INSERT INTO `comuni` VALUES ('058044', 'Gerano', '058', NULL, '2023-02-27 18:49:07', 'D978');
INSERT INTO `comuni` VALUES ('058045', 'Gorga', '058', NULL, '2023-02-27 18:49:07', 'E091');
INSERT INTO `comuni` VALUES ('058046', 'Grottaferrata', '058', NULL, '2023-02-27 18:49:07', 'E204');
INSERT INTO `comuni` VALUES ('058047', 'Guidonia Montecelio', '058', NULL, '2023-02-27 18:49:07', 'E263');
INSERT INTO `comuni` VALUES ('058048', 'Jenne', '058', NULL, '2023-02-27 18:49:07', 'E382');
INSERT INTO `comuni` VALUES ('058049', 'Labico', '058', NULL, '2023-02-27 18:49:07', 'E392');
INSERT INTO `comuni` VALUES ('058050', 'Lanuvio', '058', NULL, '2023-02-27 18:49:07', 'C767');
INSERT INTO `comuni` VALUES ('058051', 'Licenza', '058', NULL, '2023-02-27 18:49:07', 'E576');
INSERT INTO `comuni` VALUES ('058052', 'Magliano Romano', '058', NULL, '2023-02-27 18:49:07', 'E813');
INSERT INTO `comuni` VALUES ('058053', 'Mandela', '058', NULL, '2023-02-27 18:49:07', 'B632');
INSERT INTO `comuni` VALUES ('058054', 'Manziana', '058', NULL, '2023-02-27 18:49:07', 'E900');
INSERT INTO `comuni` VALUES ('058055', 'Marano Equo', '058', NULL, '2023-02-27 18:49:07', 'E908');
INSERT INTO `comuni` VALUES ('058056', 'Marcellina', '058', NULL, '2023-02-27 18:49:07', 'E924');
INSERT INTO `comuni` VALUES ('058057', 'Marino', '058', NULL, '2023-02-27 18:49:07', 'E958');
INSERT INTO `comuni` VALUES ('058058', 'Mazzano Romano', '058', NULL, '2023-02-27 18:49:07', 'F064');
INSERT INTO `comuni` VALUES ('058059', 'Mentana', '058', NULL, '2023-02-27 18:49:07', 'F127');
INSERT INTO `comuni` VALUES ('058060', 'Monte Compatri', '058', NULL, '2023-02-27 18:49:07', 'F477');
INSERT INTO `comuni` VALUES ('058061', 'Monteflavio', '058', NULL, '2023-02-27 18:49:07', 'F504');
INSERT INTO `comuni` VALUES ('058062', 'Montelanico', '058', NULL, '2023-02-27 18:49:07', 'F534');
INSERT INTO `comuni` VALUES ('058063', 'Montelibretti', '058', NULL, '2023-02-27 18:49:07', 'F545');
INSERT INTO `comuni` VALUES ('058064', 'Monte Porzio Catone', '058', NULL, '2023-02-27 18:49:07', 'F590');
INSERT INTO `comuni` VALUES ('058065', 'Monterotondo', '058', NULL, '2023-02-27 18:49:07', 'F611');
INSERT INTO `comuni` VALUES ('058066', 'Montorio Romano', '058', NULL, '2023-02-27 18:49:07', 'F692');
INSERT INTO `comuni` VALUES ('058067', 'Moricone', '058', NULL, '2023-02-27 18:49:07', 'F730');
INSERT INTO `comuni` VALUES ('058068', 'Morlupo', '058', NULL, '2023-02-27 18:49:07', 'F734');
INSERT INTO `comuni` VALUES ('058069', 'Nazzano', '058', NULL, '2023-02-27 18:49:07', 'F857');
INSERT INTO `comuni` VALUES ('058070', 'Nemi', '058', NULL, '2023-02-27 18:49:07', 'F865');
INSERT INTO `comuni` VALUES ('058071', 'Nerola', '058', NULL, '2023-02-27 18:49:07', 'F871');
INSERT INTO `comuni` VALUES ('058072', 'Nettuno', '058', NULL, '2023-02-27 18:49:07', 'F880');
INSERT INTO `comuni` VALUES ('058073', 'Olevano Romano', '058', NULL, '2023-02-27 18:49:07', 'G022');
INSERT INTO `comuni` VALUES ('058074', 'Palestrina', '058', NULL, '2023-02-27 18:49:07', 'G274');
INSERT INTO `comuni` VALUES ('058075', 'Palombara Sabina', '058', NULL, '2023-02-27 18:49:07', 'G293');
INSERT INTO `comuni` VALUES ('058076', 'Percile', '058', NULL, '2023-02-27 18:49:07', 'G444');
INSERT INTO `comuni` VALUES ('058077', 'Pisoniano', '058', NULL, '2023-02-27 18:49:07', 'G704');
INSERT INTO `comuni` VALUES ('058078', 'Poli', '058', NULL, '2023-02-27 18:49:07', 'G784');
INSERT INTO `comuni` VALUES ('058079', 'Pomezia', '058', NULL, '2023-02-27 18:49:07', 'G811');
INSERT INTO `comuni` VALUES ('058080', 'Ponzano Romano', '058', NULL, '2023-02-27 18:49:07', 'G874');
INSERT INTO `comuni` VALUES ('058081', 'Riano', '058', NULL, '2023-02-27 18:49:07', 'H267');
INSERT INTO `comuni` VALUES ('058082', 'Rignano Flaminio', '058', NULL, '2023-02-27 18:49:07', 'H288');
INSERT INTO `comuni` VALUES ('058083', 'Riofreddo', '058', NULL, '2023-02-27 18:49:07', 'H300');
INSERT INTO `comuni` VALUES ('058084', 'Rocca Canterano', '058', NULL, '2023-02-27 18:49:07', 'H387');
INSERT INTO `comuni` VALUES ('058085', 'Rocca di Cave', '058', NULL, '2023-02-27 18:49:07', 'H401');
INSERT INTO `comuni` VALUES ('058086', 'Rocca di Papa', '058', NULL, '2023-02-27 18:49:07', 'H404');
INSERT INTO `comuni` VALUES ('058087', 'Roccagiovine', '058', NULL, '2023-02-27 18:49:07', 'H411');
INSERT INTO `comuni` VALUES ('058088', 'Rocca Priora', '058', NULL, '2023-02-27 18:49:07', 'H432');
INSERT INTO `comuni` VALUES ('058089', 'Rocca Santo Stefano', '058', NULL, '2023-02-27 18:49:07', 'H441');
INSERT INTO `comuni` VALUES ('058090', 'Roiate', '058', NULL, '2023-02-27 18:49:07', 'H494');
INSERT INTO `comuni` VALUES ('058091', 'Roma', '058', NULL, '2023-02-27 18:49:07', 'H501');
INSERT INTO `comuni` VALUES ('058092', 'Roviano', '058', NULL, '2023-02-27 18:49:07', 'H618');
INSERT INTO `comuni` VALUES ('058093', 'Sacrofano', '058', NULL, '2023-02-27 18:49:07', 'H658');
INSERT INTO `comuni` VALUES ('058094', 'Sambuci', '058', NULL, '2023-02-27 18:49:07', 'H745');
INSERT INTO `comuni` VALUES ('058095', 'San Gregorio da Sassola', '058', NULL, '2023-02-27 18:49:07', 'H942');
INSERT INTO `comuni` VALUES ('058096', 'San Polo dei Cavalieri', '058', NULL, '2023-02-27 18:49:07', 'I125');
INSERT INTO `comuni` VALUES ('058097', 'Santa Marinella', '058', NULL, '2023-02-27 18:49:07', 'I255');
INSERT INTO `comuni` VALUES ('058098', 'Sant\'Angelo Romano', '058', NULL, '2023-02-27 18:49:07', 'I284');
INSERT INTO `comuni` VALUES ('058099', 'Sant\'Oreste', '058', NULL, '2023-02-27 18:49:07', 'I352');
INSERT INTO `comuni` VALUES ('058100', 'San Vito Romano', '058', NULL, '2023-02-27 18:49:07', 'I400');
INSERT INTO `comuni` VALUES ('058101', 'Saracinesco', '058', NULL, '2023-02-27 18:49:07', 'I424');
INSERT INTO `comuni` VALUES ('058102', 'Segni', '058', NULL, '2023-02-27 18:49:07', 'I573');
INSERT INTO `comuni` VALUES ('058103', 'Subiaco', '058', NULL, '2023-02-27 18:49:07', 'I992');
INSERT INTO `comuni` VALUES ('058104', 'Tivoli', '058', NULL, '2023-02-27 18:49:07', 'L182');
INSERT INTO `comuni` VALUES ('058105', 'Tolfa', '058', NULL, '2023-02-27 18:49:07', 'L192');
INSERT INTO `comuni` VALUES ('058106', 'Torrita Tiberina', '058', NULL, '2023-02-27 18:49:07', 'L302');
INSERT INTO `comuni` VALUES ('058107', 'Trevignano Romano', '058', NULL, '2023-02-27 18:49:07', 'L401');
INSERT INTO `comuni` VALUES ('058108', 'Vallepietra', '058', NULL, '2023-02-27 18:49:07', 'L611');
INSERT INTO `comuni` VALUES ('058109', 'Vallinfreda', '058', NULL, '2023-02-27 18:49:07', 'L625');
INSERT INTO `comuni` VALUES ('058110', 'Valmontone', '058', NULL, '2023-02-27 18:49:07', 'L639');
INSERT INTO `comuni` VALUES ('058111', 'Velletri', '058', NULL, '2023-02-27 18:49:07', 'L719');
INSERT INTO `comuni` VALUES ('058112', 'Vicovaro', '058', NULL, '2023-02-27 18:49:07', 'L851');
INSERT INTO `comuni` VALUES ('058113', 'Vivaro Romano', '058', NULL, '2023-02-27 18:49:07', 'M095');
INSERT INTO `comuni` VALUES ('058114', 'Zagarolo', '058', NULL, '2023-02-27 18:49:07', 'M141');
INSERT INTO `comuni` VALUES ('058115', 'Lariano', '058', NULL, '2023-02-27 18:49:07', 'M207');
INSERT INTO `comuni` VALUES ('058116', 'Ladispoli', '058', NULL, '2023-02-27 18:49:07', 'M212');
INSERT INTO `comuni` VALUES ('058117', 'Ardea', '058', NULL, '2023-02-27 18:49:07', 'M213');
INSERT INTO `comuni` VALUES ('058118', 'Ciampino', '058', NULL, '2023-02-27 18:49:07', 'M272');
INSERT INTO `comuni` VALUES ('058119', 'San Cesareo', '058', NULL, '2023-02-27 18:49:07', 'M295');
INSERT INTO `comuni` VALUES ('058120', 'Fiumicino', '058', NULL, '2023-02-27 18:49:07', 'M297');
INSERT INTO `comuni` VALUES ('058122', 'Fonte Nuova', '058', NULL, '2023-02-27 18:49:07', 'M309');
INSERT INTO `comuni` VALUES ('059001', 'Aprilia', '059', NULL, '2023-02-27 18:49:07', 'A341');
INSERT INTO `comuni` VALUES ('059002', 'Bassiano', '059', NULL, '2023-02-27 18:49:07', 'A707');
INSERT INTO `comuni` VALUES ('059003', 'Campodimele', '059', NULL, '2023-02-27 18:49:07', 'B527');
INSERT INTO `comuni` VALUES ('059004', 'Castelforte', '059', NULL, '2023-02-27 18:49:07', 'C104');
INSERT INTO `comuni` VALUES ('059005', 'Cisterna di Latina', '059', NULL, '2023-02-27 18:49:07', 'C740');
INSERT INTO `comuni` VALUES ('059006', 'Cori', '059', NULL, '2023-02-27 18:49:07', 'D003');
INSERT INTO `comuni` VALUES ('059007', 'Fondi', '059', NULL, '2023-02-27 18:49:07', 'D662');
INSERT INTO `comuni` VALUES ('059008', 'Formia', '059', NULL, '2023-02-27 18:49:07', 'D708');
INSERT INTO `comuni` VALUES ('059009', 'Gaeta', '059', NULL, '2023-02-27 18:49:07', 'D843');
INSERT INTO `comuni` VALUES ('059010', 'Itri', '059', NULL, '2023-02-27 18:49:07', 'E375');
INSERT INTO `comuni` VALUES ('059011', 'Latina', '059', NULL, '2023-02-27 18:49:07', 'E472');
INSERT INTO `comuni` VALUES ('059012', 'Lenola', '059', NULL, '2023-02-27 18:49:07', 'E527');
INSERT INTO `comuni` VALUES ('059013', 'Maenza', '059', NULL, '2023-02-27 18:49:07', 'E798');
INSERT INTO `comuni` VALUES ('059014', 'Minturno', '059', NULL, '2023-02-27 18:49:07', 'F224');
INSERT INTO `comuni` VALUES ('059015', 'Monte San Biagio', '059', NULL, '2023-02-27 18:49:07', 'F616');
INSERT INTO `comuni` VALUES ('059016', 'Norma', '059', NULL, '2023-02-27 18:49:07', 'F937');
INSERT INTO `comuni` VALUES ('059017', 'Pontinia', '059', NULL, '2023-02-27 18:49:07', 'G865');
INSERT INTO `comuni` VALUES ('059018', 'Ponza', '059', NULL, '2023-02-27 18:49:07', 'G871');
INSERT INTO `comuni` VALUES ('059019', 'Priverno', '059', NULL, '2023-02-27 18:49:07', 'G698');
INSERT INTO `comuni` VALUES ('059020', 'Prossedi', '059', NULL, '2023-02-27 18:49:07', 'H076');
INSERT INTO `comuni` VALUES ('059021', 'Roccagorga', '059', NULL, '2023-02-27 18:49:07', 'H413');
INSERT INTO `comuni` VALUES ('059022', 'Rocca Massima', '059', NULL, '2023-02-27 18:49:07', 'H421');
INSERT INTO `comuni` VALUES ('059023', 'Roccasecca dei Volsci', '059', NULL, '2023-02-27 18:49:07', 'H444');
INSERT INTO `comuni` VALUES ('059024', 'Sabaudia', '059', NULL, '2023-02-27 18:49:07', 'H647');
INSERT INTO `comuni` VALUES ('059025', 'San Felice Circeo', '059', NULL, '2023-02-27 18:49:07', 'H836');
INSERT INTO `comuni` VALUES ('059026', 'Santi Cosma e Damiano', '059', NULL, '2023-02-27 18:49:07', 'I339');
INSERT INTO `comuni` VALUES ('059027', 'Sermoneta', '059', NULL, '2023-02-27 18:49:07', 'I634');
INSERT INTO `comuni` VALUES ('059028', 'Sezze', '059', NULL, '2023-02-27 18:49:07', 'I712');
INSERT INTO `comuni` VALUES ('059029', 'Sonnino', '059', NULL, '2023-02-27 18:49:07', 'I832');
INSERT INTO `comuni` VALUES ('059030', 'Sperlonga', '059', NULL, '2023-02-27 18:49:07', 'I892');
INSERT INTO `comuni` VALUES ('059031', 'Spigno Saturnia', '059', NULL, '2023-02-27 18:49:07', 'I902');
INSERT INTO `comuni` VALUES ('059032', 'Terracina', '059', NULL, '2023-02-27 18:49:07', 'L120');
INSERT INTO `comuni` VALUES ('059033', 'Ventotene', '059', NULL, '2023-02-27 18:49:07', 'L742');
INSERT INTO `comuni` VALUES ('060001', 'Acquafondata', '060', NULL, '2023-02-27 18:49:07', 'A032');
INSERT INTO `comuni` VALUES ('060002', 'Acuto', '060', NULL, '2023-02-27 18:49:07', 'A054');
INSERT INTO `comuni` VALUES ('060003', 'Alatri', '060', NULL, '2023-02-27 18:49:07', 'A123');
INSERT INTO `comuni` VALUES ('060004', 'Alvito', '060', NULL, '2023-02-27 18:49:07', 'A244');
INSERT INTO `comuni` VALUES ('060005', 'Amaseno', '060', NULL, '2023-02-27 18:49:07', 'A256');
INSERT INTO `comuni` VALUES ('060006', 'Anagni', '060', NULL, '2023-02-27 18:49:07', 'A269');
INSERT INTO `comuni` VALUES ('060007', 'Aquino', '060', NULL, '2023-02-27 18:49:07', 'A348');
INSERT INTO `comuni` VALUES ('060008', 'Arce', '060', NULL, '2023-02-27 18:49:07', 'A363');
INSERT INTO `comuni` VALUES ('060009', 'Arnara', '060', NULL, '2023-02-27 18:49:07', 'A421');
INSERT INTO `comuni` VALUES ('060010', 'Arpino', '060', NULL, '2023-02-27 18:49:07', 'A433');
INSERT INTO `comuni` VALUES ('060011', 'Atina', '060', NULL, '2023-02-27 18:49:07', 'A486');
INSERT INTO `comuni` VALUES ('060012', 'Ausonia', '060', NULL, '2023-02-27 18:49:07', 'A502');
INSERT INTO `comuni` VALUES ('060013', 'Belmonte Castello', '060', NULL, '2023-02-27 18:49:07', 'A763');
INSERT INTO `comuni` VALUES ('060014', 'Boville Ernica', '060', NULL, '2023-02-27 18:49:07', 'A720');
INSERT INTO `comuni` VALUES ('060015', 'Broccostella', '060', NULL, '2023-02-27 18:49:07', 'B195');
INSERT INTO `comuni` VALUES ('060016', 'Campoli Appennino', '060', NULL, '2023-02-27 18:49:07', 'B543');
INSERT INTO `comuni` VALUES ('060017', 'Casalattico', '060', NULL, '2023-02-27 18:49:07', 'B862');
INSERT INTO `comuni` VALUES ('060018', 'Casalvieri', '060', NULL, '2023-02-27 18:49:07', 'B919');
INSERT INTO `comuni` VALUES ('060019', 'Cassino', '060', NULL, '2023-02-27 18:49:07', 'C034');
INSERT INTO `comuni` VALUES ('060020', 'Castelliri', '060', NULL, '2023-02-27 18:49:07', 'C177');
INSERT INTO `comuni` VALUES ('060021', 'Castelnuovo Parano', '060', NULL, '2023-02-27 18:49:07', 'C223');
INSERT INTO `comuni` VALUES ('060022', 'Castrocielo', '060', NULL, '2023-02-27 18:49:07', 'C340');
INSERT INTO `comuni` VALUES ('060023', 'Castro dei Volsci', '060', NULL, '2023-02-27 18:49:07', 'C338');
INSERT INTO `comuni` VALUES ('060024', 'Ceccano', '060', NULL, '2023-02-27 18:49:07', 'C413');
INSERT INTO `comuni` VALUES ('060025', 'Ceprano', '060', NULL, '2023-02-27 18:49:07', 'C479');
INSERT INTO `comuni` VALUES ('060026', 'Cervaro', '060', NULL, '2023-02-27 18:49:07', 'C545');
INSERT INTO `comuni` VALUES ('060027', 'Colfelice', '060', NULL, '2023-02-27 18:49:07', 'C836');
INSERT INTO `comuni` VALUES ('060028', 'Collepardo', '060', NULL, '2023-02-27 18:49:07', 'C864');
INSERT INTO `comuni` VALUES ('060029', 'Colle San Magno', '060', NULL, '2023-02-27 18:49:07', 'C870');
INSERT INTO `comuni` VALUES ('060030', 'Coreno Ausonio', '060', NULL, '2023-02-27 18:49:07', 'C998');
INSERT INTO `comuni` VALUES ('060031', 'Esperia', '060', NULL, '2023-02-27 18:49:07', 'D440');
INSERT INTO `comuni` VALUES ('060032', 'Falvaterra', '060', NULL, '2023-02-27 18:49:07', 'D483');
INSERT INTO `comuni` VALUES ('060033', 'Ferentino', '060', NULL, '2023-02-27 18:49:07', 'D539');
INSERT INTO `comuni` VALUES ('060034', 'Filettino', '060', NULL, '2023-02-27 18:49:07', 'D591');
INSERT INTO `comuni` VALUES ('060035', 'Fiuggi', '060', NULL, '2023-02-27 18:49:07', 'A310');
INSERT INTO `comuni` VALUES ('060036', 'Fontana Liri', '060', NULL, '2023-02-27 18:49:07', 'D667');
INSERT INTO `comuni` VALUES ('060037', 'Fontechiari', '060', NULL, '2023-02-27 18:49:07', 'D682');
INSERT INTO `comuni` VALUES ('060038', 'Frosinone', '060', NULL, '2023-02-27 18:49:07', 'D810');
INSERT INTO `comuni` VALUES ('060039', 'Fumone', '060', NULL, '2023-02-27 18:49:07', 'D819');
INSERT INTO `comuni` VALUES ('060040', 'Gallinaro', '060', NULL, '2023-02-27 18:49:07', 'D881');
INSERT INTO `comuni` VALUES ('060041', 'Giuliano di Roma', '060', NULL, '2023-02-27 18:49:07', 'E057');
INSERT INTO `comuni` VALUES ('060042', 'Guarcino', '060', NULL, '2023-02-27 18:49:07', 'E236');
INSERT INTO `comuni` VALUES ('060043', 'Isola del Liri', '060', NULL, '2023-02-27 18:49:07', 'E340');
INSERT INTO `comuni` VALUES ('060044', 'Monte San Giovanni Campano', '060', NULL, '2023-02-27 18:49:07', 'F620');
INSERT INTO `comuni` VALUES ('060045', 'Morolo', '060', NULL, '2023-02-27 18:49:07', 'F740');
INSERT INTO `comuni` VALUES ('060046', 'Paliano', '060', NULL, '2023-02-27 18:49:07', 'G276');
INSERT INTO `comuni` VALUES ('060047', 'Pastena', '060', NULL, '2023-02-27 18:49:07', 'G362');
INSERT INTO `comuni` VALUES ('060048', 'Patrica', '060', NULL, '2023-02-27 18:49:07', 'G374');
INSERT INTO `comuni` VALUES ('060049', 'Pescosolido', '060', NULL, '2023-02-27 18:49:07', 'G500');
INSERT INTO `comuni` VALUES ('060050', 'Picinisco', '060', NULL, '2023-02-27 18:49:07', 'G591');
INSERT INTO `comuni` VALUES ('060051', 'Pico', '060', NULL, '2023-02-27 18:49:07', 'G592');
INSERT INTO `comuni` VALUES ('060052', 'Piedimonte San Germano', '060', NULL, '2023-02-27 18:49:07', 'G598');
INSERT INTO `comuni` VALUES ('060053', 'Piglio', '060', NULL, '2023-02-27 18:49:07', 'G659');
INSERT INTO `comuni` VALUES ('060054', 'Pignataro Interamna', '060', NULL, '2023-02-27 18:49:07', 'G662');
INSERT INTO `comuni` VALUES ('060055', 'Pofi', '060', NULL, '2023-02-27 18:49:07', 'G749');
INSERT INTO `comuni` VALUES ('060056', 'Pontecorvo', '060', NULL, '2023-02-27 18:49:07', 'G838');
INSERT INTO `comuni` VALUES ('060057', 'Posta Fibreno', '060', NULL, '2023-02-27 18:49:07', 'G935');
INSERT INTO `comuni` VALUES ('060058', 'Ripi', '060', NULL, '2023-02-27 18:49:07', 'H324');
INSERT INTO `comuni` VALUES ('060059', 'Rocca d\'Arce', '060', NULL, '2023-02-27 18:49:07', 'H393');
INSERT INTO `comuni` VALUES ('060060', 'Roccasecca', '060', NULL, '2023-02-27 18:49:07', 'H443');
INSERT INTO `comuni` VALUES ('060061', 'San Biagio Saracinisco', '060', NULL, '2023-02-27 18:49:07', 'H779');
INSERT INTO `comuni` VALUES ('060062', 'San Donato Val di Comino', '060', NULL, '2023-02-27 18:49:07', 'H824');
INSERT INTO `comuni` VALUES ('060063', 'San Giorgio a Liri', '060', NULL, '2023-02-27 18:49:07', 'H880');
INSERT INTO `comuni` VALUES ('060064', 'San Giovanni Incarico', '060', NULL, '2023-02-27 18:49:07', 'H917');
INSERT INTO `comuni` VALUES ('060065', 'Sant\'Ambrogio sul Garigliano', '060', NULL, '2023-02-27 18:49:07', 'I256');
INSERT INTO `comuni` VALUES ('060066', 'Sant\'Andrea del Garigliano', '060', NULL, '2023-02-27 18:49:07', 'I265');
INSERT INTO `comuni` VALUES ('060067', 'Sant\'Apollinare', '060', NULL, '2023-02-27 18:49:07', 'I302');
INSERT INTO `comuni` VALUES ('060068', 'Sant\'Elia Fiumerapido', '060', NULL, '2023-02-27 18:49:07', 'I321');
INSERT INTO `comuni` VALUES ('060069', 'Santopadre', '060', NULL, '2023-02-27 18:49:07', 'I351');
INSERT INTO `comuni` VALUES ('060070', 'San Vittore del Lazio', '060', NULL, '2023-02-27 18:49:07', 'I408');
INSERT INTO `comuni` VALUES ('060071', 'Serrone', '060', NULL, '2023-02-27 18:49:07', 'I669');
INSERT INTO `comuni` VALUES ('060072', 'Settefrati', '060', NULL, '2023-02-27 18:49:07', 'I697');
INSERT INTO `comuni` VALUES ('060073', 'Sgurgola', '060', NULL, '2023-02-27 18:49:07', 'I716');
INSERT INTO `comuni` VALUES ('060074', 'Sora', '060', NULL, '2023-02-27 18:49:07', 'I838');
INSERT INTO `comuni` VALUES ('060075', 'Strangolagalli', '060', NULL, '2023-02-27 18:49:07', 'I973');
INSERT INTO `comuni` VALUES ('060076', 'Supino', '060', NULL, '2023-02-27 18:49:07', 'L009');
INSERT INTO `comuni` VALUES ('060077', 'Terelle', '060', NULL, '2023-02-27 18:49:07', 'L105');
INSERT INTO `comuni` VALUES ('060078', 'Torre Cajetani', '060', NULL, '2023-02-27 18:49:07', 'L243');
INSERT INTO `comuni` VALUES ('060079', 'Torrice', '060', NULL, '2023-02-27 18:49:07', 'L290');
INSERT INTO `comuni` VALUES ('060080', 'Trevi nel Lazio', '060', NULL, '2023-02-27 18:49:07', 'L398');
INSERT INTO `comuni` VALUES ('060081', 'Trivigliano', '060', NULL, '2023-02-27 18:49:07', 'L437');
INSERT INTO `comuni` VALUES ('060082', 'Vallecorsa', '060', NULL, '2023-02-27 18:49:07', 'L598');
INSERT INTO `comuni` VALUES ('060083', 'Vallemaio', '060', NULL, '2023-02-27 18:49:07', 'L605');
INSERT INTO `comuni` VALUES ('060084', 'Vallerotonda', '060', NULL, '2023-02-27 18:49:07', 'L614');
INSERT INTO `comuni` VALUES ('060085', 'Veroli', '060', NULL, '2023-02-27 18:49:07', 'L780');
INSERT INTO `comuni` VALUES ('060086', 'Vicalvi', '060', NULL, '2023-02-27 18:49:07', 'L836');
INSERT INTO `comuni` VALUES ('060087', 'Vico nel Lazio', '060', NULL, '2023-02-27 18:49:07', 'L843');
INSERT INTO `comuni` VALUES ('060088', 'Villa Latina', '060', NULL, '2023-02-27 18:49:07', 'A081');
INSERT INTO `comuni` VALUES ('060089', 'Villa Santa Lucia', '060', NULL, '2023-02-27 18:49:07', 'L905');
INSERT INTO `comuni` VALUES ('060090', 'Villa Santo Stefano', '060', NULL, '2023-02-27 18:49:07', 'I364');
INSERT INTO `comuni` VALUES ('060091', 'Viticuso', '060', NULL, '2023-02-27 18:49:07', 'M083');
INSERT INTO `comuni` VALUES ('061001', 'Ailano', '061', NULL, '2023-02-27 18:49:07', 'A106');
INSERT INTO `comuni` VALUES ('061002', 'Alife', '061', NULL, '2023-02-27 18:49:07', 'A200');
INSERT INTO `comuni` VALUES ('061003', 'Alvignano', '061', NULL, '2023-02-27 18:49:07', 'A243');
INSERT INTO `comuni` VALUES ('061004', 'Arienzo', '061', NULL, '2023-02-27 18:49:07', 'A403');
INSERT INTO `comuni` VALUES ('061005', 'Aversa', '061', NULL, '2023-02-27 18:49:07', 'A512');
INSERT INTO `comuni` VALUES ('061006', 'Baia e Latina', '061', NULL, '2023-02-27 18:49:07', 'A579');
INSERT INTO `comuni` VALUES ('061007', 'Bellona', '061', NULL, '2023-02-27 18:49:07', 'A755');
INSERT INTO `comuni` VALUES ('061008', 'Caianello', '061', NULL, '2023-02-27 18:49:07', 'B361');
INSERT INTO `comuni` VALUES ('061009', 'Caiazzo', '061', NULL, '2023-02-27 18:49:07', 'B362');
INSERT INTO `comuni` VALUES ('061010', 'Calvi Risorta', '061', NULL, '2023-02-27 18:49:07', 'B445');
INSERT INTO `comuni` VALUES ('061011', 'Camigliano', '061', NULL, '2023-02-27 18:49:07', 'B477');
INSERT INTO `comuni` VALUES ('061012', 'Cancello ed Arnone', '061', NULL, '2023-02-27 18:49:07', 'B581');
INSERT INTO `comuni` VALUES ('061013', 'Capodrise', '061', NULL, '2023-02-27 18:49:07', 'B667');
INSERT INTO `comuni` VALUES ('061014', 'Capriati a Volturno', '061', NULL, '2023-02-27 18:49:07', 'B704');
INSERT INTO `comuni` VALUES ('061015', 'Capua', '061', NULL, '2023-02-27 18:49:07', 'B715');
INSERT INTO `comuni` VALUES ('061016', 'Carinaro', '061', NULL, '2023-02-27 18:49:07', 'B779');
INSERT INTO `comuni` VALUES ('061017', 'Carinola', '061', NULL, '2023-02-27 18:49:07', 'B781');
INSERT INTO `comuni` VALUES ('061018', 'Casagiove', '061', NULL, '2023-02-27 18:49:07', 'B860');
INSERT INTO `comuni` VALUES ('061019', 'Casal di Principe', '061', NULL, '2023-02-27 18:49:07', 'B872');
INSERT INTO `comuni` VALUES ('061020', 'Casaluce', '061', NULL, '2023-02-27 18:49:07', 'B916');
INSERT INTO `comuni` VALUES ('061021', 'Casapulla', '061', NULL, '2023-02-27 18:49:07', 'B935');
INSERT INTO `comuni` VALUES ('061022', 'Caserta', '061', NULL, '2023-02-27 18:49:07', 'B963');
INSERT INTO `comuni` VALUES ('061023', 'Castel Campagnano', '061', NULL, '2023-02-27 18:49:07', 'B494');
INSERT INTO `comuni` VALUES ('061024', 'Castel di Sasso', '061', NULL, '2023-02-27 18:49:07', 'C097');
INSERT INTO `comuni` VALUES ('061025', 'Castello del Matese', '061', NULL, '2023-02-27 18:49:07', 'C178');
INSERT INTO `comuni` VALUES ('061026', 'Castel Morrone', '061', NULL, '2023-02-27 18:49:07', 'C211');
INSERT INTO `comuni` VALUES ('061027', 'Castel Volturno', '061', NULL, '2023-02-27 18:49:07', 'C291');
INSERT INTO `comuni` VALUES ('061028', 'Cervino', '061', NULL, '2023-02-27 18:49:07', 'C558');
INSERT INTO `comuni` VALUES ('061029', 'Cesa', '061', NULL, '2023-02-27 18:49:07', 'C561');
INSERT INTO `comuni` VALUES ('061030', 'Ciorlano', '061', NULL, '2023-02-27 18:49:07', 'C716');
INSERT INTO `comuni` VALUES ('061031', 'Conca della Campania', '061', NULL, '2023-02-27 18:49:07', 'C939');
INSERT INTO `comuni` VALUES ('061032', 'Curti', '061', NULL, '2023-02-27 18:49:07', 'D228');
INSERT INTO `comuni` VALUES ('061033', 'Dragoni', '061', NULL, '2023-02-27 18:49:07', 'D361');
INSERT INTO `comuni` VALUES ('061034', 'Fontegreca', '061', NULL, '2023-02-27 18:49:07', 'D683');
INSERT INTO `comuni` VALUES ('061035', 'Formicola', '061', NULL, '2023-02-27 18:49:07', 'D709');
INSERT INTO `comuni` VALUES ('061036', 'Francolise', '061', NULL, '2023-02-27 18:49:07', 'D769');
INSERT INTO `comuni` VALUES ('061037', 'Frignano', '061', NULL, '2023-02-27 18:49:07', 'D799');
INSERT INTO `comuni` VALUES ('061038', 'Gallo Matese', '061', NULL, '2023-02-27 18:49:07', 'D884');
INSERT INTO `comuni` VALUES ('061039', 'Galluccio', '061', NULL, '2023-02-27 18:49:07', 'D886');
INSERT INTO `comuni` VALUES ('061040', 'Giano Vetusto', '061', NULL, '2023-02-27 18:49:07', 'E011');
INSERT INTO `comuni` VALUES ('061041', 'Gioia Sannitica', '061', NULL, '2023-02-27 18:49:07', 'E039');
INSERT INTO `comuni` VALUES ('061042', 'Grazzanise', '061', NULL, '2023-02-27 18:49:07', 'E158');
INSERT INTO `comuni` VALUES ('061043', 'Gricignano di Aversa', '061', NULL, '2023-02-27 18:49:07', 'E173');
INSERT INTO `comuni` VALUES ('061044', 'Letino', '061', NULL, '2023-02-27 18:49:07', 'E554');
INSERT INTO `comuni` VALUES ('061045', 'Liberi', '061', NULL, '2023-02-27 18:49:07', 'E570');
INSERT INTO `comuni` VALUES ('061046', 'Lusciano', '061', NULL, '2023-02-27 18:49:07', 'E754');
INSERT INTO `comuni` VALUES ('061047', 'Macerata Campania', '061', NULL, '2023-02-27 18:49:07', 'E784');
INSERT INTO `comuni` VALUES ('061048', 'Maddaloni', '061', NULL, '2023-02-27 18:49:07', 'E791');
INSERT INTO `comuni` VALUES ('061049', 'Marcianise', '061', NULL, '2023-02-27 18:49:07', 'E932');
INSERT INTO `comuni` VALUES ('061050', 'Marzano Appio', '061', NULL, '2023-02-27 18:49:07', 'E998');
INSERT INTO `comuni` VALUES ('061051', 'Mignano Monte Lungo', '061', NULL, '2023-02-27 18:49:07', 'F203');
INSERT INTO `comuni` VALUES ('061052', 'Mondragone', '061', NULL, '2023-02-27 18:49:07', 'F352');
INSERT INTO `comuni` VALUES ('061053', 'Orta di Atella', '061', NULL, '2023-02-27 18:49:07', 'G130');
INSERT INTO `comuni` VALUES ('061054', 'Parete', '061', NULL, '2023-02-27 18:49:07', 'G333');
INSERT INTO `comuni` VALUES ('061055', 'Pastorano', '061', NULL, '2023-02-27 18:49:07', 'G364');
INSERT INTO `comuni` VALUES ('061056', 'Piana di Monte Verna', '061', NULL, '2023-02-27 18:49:07', 'G541');
INSERT INTO `comuni` VALUES ('061057', 'Piedimonte Matese', '061', NULL, '2023-02-27 18:49:07', 'G596');
INSERT INTO `comuni` VALUES ('061058', 'Pietramelara', '061', NULL, '2023-02-27 18:49:07', 'G620');
INSERT INTO `comuni` VALUES ('061059', 'Pietravairano', '061', NULL, '2023-02-27 18:49:07', 'G630');
INSERT INTO `comuni` VALUES ('061060', 'Pignataro Maggiore', '061', NULL, '2023-02-27 18:49:07', 'G661');
INSERT INTO `comuni` VALUES ('061061', 'Pontelatone', '061', NULL, '2023-02-27 18:49:07', 'G849');
INSERT INTO `comuni` VALUES ('061062', 'Portico di Caserta', '061', NULL, '2023-02-27 18:49:07', 'G903');
INSERT INTO `comuni` VALUES ('061063', 'Prata Sannita', '061', NULL, '2023-02-27 18:49:07', 'G991');
INSERT INTO `comuni` VALUES ('061064', 'Pratella', '061', NULL, '2023-02-27 18:49:07', 'G995');
INSERT INTO `comuni` VALUES ('061065', 'Presenzano', '061', NULL, '2023-02-27 18:49:07', 'H045');
INSERT INTO `comuni` VALUES ('061066', 'Raviscanina', '061', NULL, '2023-02-27 18:49:07', 'H202');
INSERT INTO `comuni` VALUES ('061067', 'Recale', '061', NULL, '2023-02-27 18:49:07', 'H210');
INSERT INTO `comuni` VALUES ('061068', 'Riardo', '061', NULL, '2023-02-27 18:49:07', 'H268');
INSERT INTO `comuni` VALUES ('061069', 'Rocca d\'Evandro', '061', NULL, '2023-02-27 18:49:07', 'H398');
INSERT INTO `comuni` VALUES ('061070', 'Roccamonfina', '061', NULL, '2023-02-27 18:49:07', 'H423');
INSERT INTO `comuni` VALUES ('061071', 'Roccaromana', '061', NULL, '2023-02-27 18:49:07', 'H436');
INSERT INTO `comuni` VALUES ('061072', 'Rocchetta e Croce', '061', NULL, '2023-02-27 18:49:07', 'H459');
INSERT INTO `comuni` VALUES ('061073', 'Ruviano', '061', NULL, '2023-02-27 18:49:07', 'H165');
INSERT INTO `comuni` VALUES ('061074', 'San Cipriano d\'Aversa', '061', NULL, '2023-02-27 18:49:07', 'H798');
INSERT INTO `comuni` VALUES ('061075', 'San Felice a Cancello', '061', NULL, '2023-02-27 18:49:07', 'H834');
INSERT INTO `comuni` VALUES ('061076', 'San Gregorio Matese', '061', NULL, '2023-02-27 18:49:07', 'H939');
INSERT INTO `comuni` VALUES ('061077', 'San Marcellino', '061', NULL, '2023-02-27 18:49:07', 'H978');
INSERT INTO `comuni` VALUES ('061078', 'San Nicola la Strada', '061', NULL, '2023-02-27 18:49:07', 'I056');
INSERT INTO `comuni` VALUES ('061079', 'San Pietro Infine', '061', NULL, '2023-02-27 18:49:07', 'I113');
INSERT INTO `comuni` VALUES ('061080', 'San Potito Sannitico', '061', NULL, '2023-02-27 18:49:07', 'I130');
INSERT INTO `comuni` VALUES ('061081', 'San Prisco', '061', NULL, '2023-02-27 18:49:07', 'I131');
INSERT INTO `comuni` VALUES ('061082', 'Santa Maria a Vico', '061', NULL, '2023-02-27 18:49:07', 'I233');
INSERT INTO `comuni` VALUES ('061083', 'Santa Maria Capua Vetere', '061', NULL, '2023-02-27 18:49:07', 'I234');
INSERT INTO `comuni` VALUES ('061084', 'Santa Maria la Fossa', '061', NULL, '2023-02-27 18:49:07', 'I247');
INSERT INTO `comuni` VALUES ('061085', 'San Tammaro', '061', NULL, '2023-02-27 18:49:07', 'I261');
INSERT INTO `comuni` VALUES ('061086', 'Sant\'Angelo d\'Alife', '061', NULL, '2023-02-27 18:49:07', 'I273');
INSERT INTO `comuni` VALUES ('061087', 'Sant\'Arpino', '061', NULL, '2023-02-27 18:49:07', 'I306');
INSERT INTO `comuni` VALUES ('061088', 'Sessa Aurunca', '061', NULL, '2023-02-27 18:49:07', 'I676');
INSERT INTO `comuni` VALUES ('061089', 'Sparanise', '061', NULL, '2023-02-27 18:49:07', 'I885');
INSERT INTO `comuni` VALUES ('061090', 'Succivo', '061', NULL, '2023-02-27 18:49:07', 'I993');
INSERT INTO `comuni` VALUES ('061091', 'Teano', '061', NULL, '2023-02-27 18:49:07', 'L083');
INSERT INTO `comuni` VALUES ('061092', 'Teverola', '061', NULL, '2023-02-27 18:49:07', 'L155');
INSERT INTO `comuni` VALUES ('061093', 'Tora e Piccilli', '061', NULL, '2023-02-27 18:49:07', 'L205');
INSERT INTO `comuni` VALUES ('061094', 'Trentola-Ducenta', '061', NULL, '2023-02-27 18:49:07', 'L379');
INSERT INTO `comuni` VALUES ('061095', 'Vairano Patenora', '061', NULL, '2023-02-27 18:49:07', 'L540');
INSERT INTO `comuni` VALUES ('061096', 'Valle Agricola', '061', NULL, '2023-02-27 18:49:07', 'L594');
INSERT INTO `comuni` VALUES ('061097', 'Valle di Maddaloni', '061', NULL, '2023-02-27 18:49:07', 'L591');
INSERT INTO `comuni` VALUES ('061098', 'Villa di Briano', '061', NULL, '2023-02-27 18:49:07', 'D801');
INSERT INTO `comuni` VALUES ('061099', 'Villa Literno', '061', NULL, '2023-02-27 18:49:07', 'L844');
INSERT INTO `comuni` VALUES ('061100', 'Vitulazio', '061', NULL, '2023-02-27 18:49:07', 'M092');
INSERT INTO `comuni` VALUES ('061101', 'Falciano del Massico', '061', NULL, '2023-02-27 18:49:07', 'D471');
INSERT INTO `comuni` VALUES ('061102', 'Cellole', '061', NULL, '2023-02-27 18:49:07', 'M262');
INSERT INTO `comuni` VALUES ('061103', 'Casapesenna', '061', NULL, '2023-02-27 18:49:07', 'M260');
INSERT INTO `comuni` VALUES ('061104', 'San Marco Evangelista', '061', NULL, '2023-02-27 18:49:07', 'F043');
INSERT INTO `comuni` VALUES ('062001', 'Airola', '062', NULL, '2023-02-27 18:49:07', 'A110');
INSERT INTO `comuni` VALUES ('062002', 'Amorosi', '062', NULL, '2023-02-27 18:49:07', 'A265');
INSERT INTO `comuni` VALUES ('062003', 'Apice', '062', NULL, '2023-02-27 18:49:07', 'A328');
INSERT INTO `comuni` VALUES ('062004', 'Apollosa', '062', NULL, '2023-02-27 18:49:07', 'A330');
INSERT INTO `comuni` VALUES ('062005', 'Arpaia', '062', NULL, '2023-02-27 18:49:07', 'A431');
INSERT INTO `comuni` VALUES ('062006', 'Arpaise', '062', NULL, '2023-02-27 18:49:07', 'A432');
INSERT INTO `comuni` VALUES ('062007', 'Baselice', '062', NULL, '2023-02-27 18:49:07', 'A696');
INSERT INTO `comuni` VALUES ('062008', 'Benevento', '062', NULL, '2023-02-27 18:49:07', 'A783');
INSERT INTO `comuni` VALUES ('062009', 'Bonea', '062', NULL, '2023-02-27 18:49:07', 'A970');
INSERT INTO `comuni` VALUES ('062010', 'Bucciano', '062', NULL, '2023-02-27 18:49:07', 'B239');
INSERT INTO `comuni` VALUES ('062011', 'Buonalbergo', '062', NULL, '2023-02-27 18:49:07', 'B267');
INSERT INTO `comuni` VALUES ('062012', 'Calvi', '062', NULL, '2023-02-27 18:49:07', 'B444');
INSERT INTO `comuni` VALUES ('062013', 'Campolattaro', '062', NULL, '2023-02-27 18:49:07', 'B541');
INSERT INTO `comuni` VALUES ('062014', 'Campoli del Monte Taburno', '062', NULL, '2023-02-27 18:49:07', 'B542');
INSERT INTO `comuni` VALUES ('062015', 'Casalduni', '062', NULL, '2023-02-27 18:49:07', 'B873');
INSERT INTO `comuni` VALUES ('062016', 'Castelfranco in Miscano', '062', NULL, '2023-02-27 18:49:07', 'C106');
INSERT INTO `comuni` VALUES ('062017', 'Castelpagano', '062', NULL, '2023-02-27 18:49:07', 'C245');
INSERT INTO `comuni` VALUES ('062018', 'Castelpoto', '062', NULL, '2023-02-27 18:49:07', 'C250');
INSERT INTO `comuni` VALUES ('062019', 'Castelvenere', '062', NULL, '2023-02-27 18:49:07', 'C280');
INSERT INTO `comuni` VALUES ('062020', 'Castelvetere in Val Fortore', '062', NULL, '2023-02-27 18:49:07', 'C284');
INSERT INTO `comuni` VALUES ('062021', 'Cautano', '062', NULL, '2023-02-27 18:49:07', 'C359');
INSERT INTO `comuni` VALUES ('062022', 'Ceppaloni', '062', NULL, '2023-02-27 18:49:07', 'C476');
INSERT INTO `comuni` VALUES ('062023', 'Cerreto Sannita', '062', NULL, '2023-02-27 18:49:07', 'C525');
INSERT INTO `comuni` VALUES ('062024', 'Circello', '062', NULL, '2023-02-27 18:49:07', 'C719');
INSERT INTO `comuni` VALUES ('062025', 'Colle Sannita', '062', NULL, '2023-02-27 18:49:07', 'C846');
INSERT INTO `comuni` VALUES ('062026', 'Cusano Mutri', '062', NULL, '2023-02-27 18:49:07', 'D230');
INSERT INTO `comuni` VALUES ('062027', 'Dugenta', '062', NULL, '2023-02-27 18:49:07', 'D380');
INSERT INTO `comuni` VALUES ('062028', 'Durazzano', '062', NULL, '2023-02-27 18:49:07', 'D386');
INSERT INTO `comuni` VALUES ('062029', 'Faicchio', '062', NULL, '2023-02-27 18:49:07', 'D469');
INSERT INTO `comuni` VALUES ('062030', 'Foglianise', '062', NULL, '2023-02-27 18:49:07', 'D644');
INSERT INTO `comuni` VALUES ('062031', 'Foiano di Val Fortore', '062', NULL, '2023-02-27 18:49:07', 'D650');
INSERT INTO `comuni` VALUES ('062032', 'Forchia', '062', NULL, '2023-02-27 18:49:07', 'D693');
INSERT INTO `comuni` VALUES ('062033', 'Fragneto l\'Abate', '062', NULL, '2023-02-27 18:49:07', 'D755');
INSERT INTO `comuni` VALUES ('062034', 'Fragneto Monforte', '062', NULL, '2023-02-27 18:49:07', 'D756');
INSERT INTO `comuni` VALUES ('062035', 'Frasso Telesino', '062', NULL, '2023-02-27 18:49:07', 'D784');
INSERT INTO `comuni` VALUES ('062036', 'Ginestra degli Schiavoni', '062', NULL, '2023-02-27 18:49:07', 'E034');
INSERT INTO `comuni` VALUES ('062037', 'Guardia Sanframondi', '062', NULL, '2023-02-27 18:49:07', 'E249');
INSERT INTO `comuni` VALUES ('062038', 'Limatola', '062', NULL, '2023-02-27 18:49:07', 'E589');
INSERT INTO `comuni` VALUES ('062039', 'Melizzano', '062', NULL, '2023-02-27 18:49:07', 'F113');
INSERT INTO `comuni` VALUES ('062040', 'Moiano', '062', NULL, '2023-02-27 18:49:07', 'F274');
INSERT INTO `comuni` VALUES ('062041', 'Molinara', '062', NULL, '2023-02-27 18:49:07', 'F287');
INSERT INTO `comuni` VALUES ('062042', 'Montefalcone di Val Fortore', '062', NULL, '2023-02-27 18:49:07', 'F494');
INSERT INTO `comuni` VALUES ('062043', 'Montesarchio', '062', NULL, '2023-02-27 18:49:07', 'F636');
INSERT INTO `comuni` VALUES ('062044', 'Morcone', '062', NULL, '2023-02-27 18:49:07', 'F717');
INSERT INTO `comuni` VALUES ('062045', 'Paduli', '062', NULL, '2023-02-27 18:49:07', 'G227');
INSERT INTO `comuni` VALUES ('062046', 'Pago Veiano', '062', NULL, '2023-02-27 18:49:07', 'G243');
INSERT INTO `comuni` VALUES ('062047', 'Pannarano', '062', NULL, '2023-02-27 18:49:07', 'G311');
INSERT INTO `comuni` VALUES ('062048', 'Paolisi', '062', NULL, '2023-02-27 18:49:07', 'G318');
INSERT INTO `comuni` VALUES ('062049', 'Paupisi', '062', NULL, '2023-02-27 18:49:07', 'G386');
INSERT INTO `comuni` VALUES ('062050', 'Pesco Sannita', '062', NULL, '2023-02-27 18:49:07', 'G494');
INSERT INTO `comuni` VALUES ('062051', 'Pietraroja', '062', NULL, '2023-02-27 18:49:07', 'G626');
INSERT INTO `comuni` VALUES ('062052', 'Pietrelcina', '062', NULL, '2023-02-27 18:49:07', 'G631');
INSERT INTO `comuni` VALUES ('062053', 'Ponte', '062', NULL, '2023-02-27 18:49:07', 'G827');
INSERT INTO `comuni` VALUES ('062054', 'Pontelandolfo', '062', NULL, '2023-02-27 18:49:07', 'G848');
INSERT INTO `comuni` VALUES ('062055', 'Puglianello', '062', NULL, '2023-02-27 18:49:07', 'H087');
INSERT INTO `comuni` VALUES ('062056', 'Reino', '062', NULL, '2023-02-27 18:49:07', 'H227');
INSERT INTO `comuni` VALUES ('062057', 'San Bartolomeo in Galdo', '062', NULL, '2023-02-27 18:49:07', 'H764');
INSERT INTO `comuni` VALUES ('062058', 'San Giorgio del Sannio', '062', NULL, '2023-02-27 18:49:07', 'H894');
INSERT INTO `comuni` VALUES ('062059', 'San Giorgio La Molara', '062', NULL, '2023-02-27 18:49:07', 'H898');
INSERT INTO `comuni` VALUES ('062060', 'San Leucio del Sannio', '062', NULL, '2023-02-27 18:49:07', 'H953');
INSERT INTO `comuni` VALUES ('062061', 'San Lorenzello', '062', NULL, '2023-02-27 18:49:07', 'H955');
INSERT INTO `comuni` VALUES ('062062', 'San Lorenzo Maggiore', '062', NULL, '2023-02-27 18:49:07', 'H967');
INSERT INTO `comuni` VALUES ('062063', 'San Lupo', '062', NULL, '2023-02-27 18:49:07', 'H973');
INSERT INTO `comuni` VALUES ('062064', 'San Marco dei Cavoti', '062', NULL, '2023-02-27 18:49:07', 'H984');
INSERT INTO `comuni` VALUES ('062065', 'San Martino Sannita', '062', NULL, '2023-02-27 18:49:07', 'I002');
INSERT INTO `comuni` VALUES ('062066', 'San Nazzaro', '062', NULL, '2023-02-27 18:49:07', 'I049');
INSERT INTO `comuni` VALUES ('062067', 'San Nicola Manfredi', '062', NULL, '2023-02-27 18:49:07', 'I062');
INSERT INTO `comuni` VALUES ('062068', 'San Salvatore Telesino', '062', NULL, '2023-02-27 18:49:07', 'I145');
INSERT INTO `comuni` VALUES ('062069', 'Santa Croce del Sannio', '062', NULL, '2023-02-27 18:49:07', 'I179');
INSERT INTO `comuni` VALUES ('062070', 'Sant\'Agata de\' Goti', '062', NULL, '2023-02-27 18:49:07', 'I197');
INSERT INTO `comuni` VALUES ('062071', 'Sant\'Angelo a Cupolo', '062', NULL, '2023-02-27 18:49:07', 'I277');
INSERT INTO `comuni` VALUES ('062072', 'Sassinoro', '062', NULL, '2023-02-27 18:49:07', 'I455');
INSERT INTO `comuni` VALUES ('062073', 'Solopaca', '062', NULL, '2023-02-27 18:49:07', 'I809');
INSERT INTO `comuni` VALUES ('062074', 'Telese Terme', '062', NULL, '2023-02-27 18:49:07', 'L086');
INSERT INTO `comuni` VALUES ('062075', 'Tocco Caudio', '062', NULL, '2023-02-27 18:49:07', 'L185');
INSERT INTO `comuni` VALUES ('062076', 'Torrecuso', '062', NULL, '2023-02-27 18:49:07', 'L254');
INSERT INTO `comuni` VALUES ('062077', 'Vitulano', '062', NULL, '2023-02-27 18:49:07', 'M093');
INSERT INTO `comuni` VALUES ('062078', 'Sant\'Arcangelo Trimonte', '062', NULL, '2023-02-27 18:49:07', 'F557');
INSERT INTO `comuni` VALUES ('063001', 'Acerra', '063', NULL, '2023-02-27 18:49:07', 'A024');
INSERT INTO `comuni` VALUES ('063002', 'Afragola', '063', NULL, '2023-02-27 18:49:07', 'A064');
INSERT INTO `comuni` VALUES ('063003', 'Agerola', '063', NULL, '2023-02-27 18:49:07', 'A068');
INSERT INTO `comuni` VALUES ('063004', 'Anacapri', '063', NULL, '2023-02-27 18:49:07', 'A268');
INSERT INTO `comuni` VALUES ('063005', 'Arzano', '063', NULL, '2023-02-27 18:49:07', 'A455');
INSERT INTO `comuni` VALUES ('063006', 'Bacoli', '063', NULL, '2023-02-27 18:49:07', 'A535');
INSERT INTO `comuni` VALUES ('063007', 'Barano d\'Ischia', '063', NULL, '2023-02-27 18:49:07', 'A617');
INSERT INTO `comuni` VALUES ('063008', 'Boscoreale', '063', NULL, '2023-02-27 18:49:07', 'B076');
INSERT INTO `comuni` VALUES ('063009', 'Boscotrecase', '063', NULL, '2023-02-27 18:49:07', 'B077');
INSERT INTO `comuni` VALUES ('063010', 'Brusciano', '063', NULL, '2023-02-27 18:49:07', 'B227');
INSERT INTO `comuni` VALUES ('063011', 'Caivano', '063', NULL, '2023-02-27 18:49:07', 'B371');
INSERT INTO `comuni` VALUES ('063012', 'Calvizzano', '063', NULL, '2023-02-27 18:49:07', 'B452');
INSERT INTO `comuni` VALUES ('063013', 'Camposano', '063', NULL, '2023-02-27 18:49:07', 'B565');
INSERT INTO `comuni` VALUES ('063014', 'Capri', '063', NULL, '2023-02-27 18:49:07', 'B696');
INSERT INTO `comuni` VALUES ('063015', 'Carbonara di Nola', '063', NULL, '2023-02-27 18:49:07', 'B740');
INSERT INTO `comuni` VALUES ('063016', 'Cardito', '063', NULL, '2023-02-27 18:49:07', 'B759');
INSERT INTO `comuni` VALUES ('063017', 'Casalnuovo di Napoli', '063', NULL, '2023-02-27 18:49:07', 'B905');
INSERT INTO `comuni` VALUES ('063018', 'Casamarciano', '063', NULL, '2023-02-27 18:49:07', 'B922');
INSERT INTO `comuni` VALUES ('063019', 'Casamicciola Terme', '063', NULL, '2023-02-27 18:49:07', 'B924');
INSERT INTO `comuni` VALUES ('063020', 'Casandrino', '063', NULL, '2023-02-27 18:49:07', 'B925');
INSERT INTO `comuni` VALUES ('063021', 'Casavatore', '063', NULL, '2023-02-27 18:49:07', 'B946');
INSERT INTO `comuni` VALUES ('063022', 'Casola di Napoli', '063', NULL, '2023-02-27 18:49:07', 'B980');
INSERT INTO `comuni` VALUES ('063023', 'Casoria', '063', NULL, '2023-02-27 18:49:07', 'B990');
INSERT INTO `comuni` VALUES ('063024', 'Castellammare di Stabia', '063', NULL, '2023-02-27 18:49:07', 'C129');
INSERT INTO `comuni` VALUES ('063025', 'Castello di Cisterna', '063', NULL, '2023-02-27 18:49:07', 'C188');
INSERT INTO `comuni` VALUES ('063026', 'Cercola', '063', NULL, '2023-02-27 18:49:07', 'C495');
INSERT INTO `comuni` VALUES ('063027', 'Cicciano', '063', NULL, '2023-02-27 18:49:07', 'C675');
INSERT INTO `comuni` VALUES ('063028', 'Cimitile', '063', NULL, '2023-02-27 18:49:07', 'C697');
INSERT INTO `comuni` VALUES ('063029', 'Comiziano', '063', NULL, '2023-02-27 18:49:07', 'C929');
INSERT INTO `comuni` VALUES ('063030', 'Crispano', '063', NULL, '2023-02-27 18:49:07', 'D170');
INSERT INTO `comuni` VALUES ('063031', 'Forio', '063', NULL, '2023-02-27 18:49:07', 'D702');
INSERT INTO `comuni` VALUES ('063032', 'Frattamaggiore', '063', NULL, '2023-02-27 18:49:07', 'D789');
INSERT INTO `comuni` VALUES ('063033', 'Frattaminore', '063', NULL, '2023-02-27 18:49:07', 'D790');
INSERT INTO `comuni` VALUES ('063034', 'Giugliano in Campania', '063', NULL, '2023-02-27 18:49:07', 'E054');
INSERT INTO `comuni` VALUES ('063035', 'Gragnano', '063', NULL, '2023-02-27 18:49:07', 'E131');
INSERT INTO `comuni` VALUES ('063036', 'Grumo Nevano', '063', NULL, '2023-02-27 18:49:07', 'E224');
INSERT INTO `comuni` VALUES ('063037', 'Ischia', '063', NULL, '2023-02-27 18:49:07', 'E329');
INSERT INTO `comuni` VALUES ('063038', 'Lacco Ameno', '063', NULL, '2023-02-27 18:49:07', 'E396');
INSERT INTO `comuni` VALUES ('063039', 'Lettere', '063', NULL, '2023-02-27 18:49:07', 'E557');
INSERT INTO `comuni` VALUES ('063040', 'Liveri', '063', NULL, '2023-02-27 18:49:07', 'E620');
INSERT INTO `comuni` VALUES ('063041', 'Marano di Napoli', '063', NULL, '2023-02-27 18:49:07', 'E906');
INSERT INTO `comuni` VALUES ('063042', 'Mariglianella', '063', NULL, '2023-02-27 18:49:07', 'E954');
INSERT INTO `comuni` VALUES ('063043', 'Marigliano', '063', NULL, '2023-02-27 18:49:07', 'E955');
INSERT INTO `comuni` VALUES ('063044', 'Massa Lubrense', '063', NULL, '2023-02-27 18:49:07', 'F030');
INSERT INTO `comuni` VALUES ('063045', 'Melito di Napoli', '063', NULL, '2023-02-27 18:49:07', 'F111');
INSERT INTO `comuni` VALUES ('063046', 'Meta', '063', NULL, '2023-02-27 18:49:07', 'F162');
INSERT INTO `comuni` VALUES ('063047', 'Monte di Procida', '063', NULL, '2023-02-27 18:49:07', 'F488');
INSERT INTO `comuni` VALUES ('063048', 'Mugnano di Napoli', '063', NULL, '2023-02-27 18:49:07', 'F799');
INSERT INTO `comuni` VALUES ('063049', 'Napoli', '063', NULL, '2023-02-27 18:49:07', 'F839');
INSERT INTO `comuni` VALUES ('063050', 'Nola', '063', NULL, '2023-02-27 18:49:07', 'F924');
INSERT INTO `comuni` VALUES ('063051', 'Ottaviano', '063', NULL, '2023-02-27 18:49:07', 'G190');
INSERT INTO `comuni` VALUES ('063052', 'Palma Campania', '063', NULL, '2023-02-27 18:49:07', 'G283');
INSERT INTO `comuni` VALUES ('063053', 'Piano di Sorrento', '063', NULL, '2023-02-27 18:49:07', 'G568');
INSERT INTO `comuni` VALUES ('063054', 'Pimonte', '063', NULL, '2023-02-27 18:49:07', 'G670');
INSERT INTO `comuni` VALUES ('063055', 'Poggiomarino', '063', NULL, '2023-02-27 18:49:07', 'G762');
INSERT INTO `comuni` VALUES ('063056', 'Pollena Trocchia', '063', NULL, '2023-02-27 18:49:07', 'G795');
INSERT INTO `comuni` VALUES ('063057', 'Pomigliano d\'Arco', '063', NULL, '2023-02-27 18:49:07', 'G812');
INSERT INTO `comuni` VALUES ('063058', 'Pompei', '063', NULL, '2023-02-27 18:49:07', 'G813');
INSERT INTO `comuni` VALUES ('063059', 'Portici', '063', NULL, '2023-02-27 18:49:07', 'G902');
INSERT INTO `comuni` VALUES ('063060', 'Pozzuoli', '063', NULL, '2023-02-27 18:49:07', 'G964');
INSERT INTO `comuni` VALUES ('063061', 'Procida', '063', NULL, '2023-02-27 18:49:07', 'H072');
INSERT INTO `comuni` VALUES ('063062', 'Qualiano', '063', NULL, '2023-02-27 18:49:07', 'H101');
INSERT INTO `comuni` VALUES ('063063', 'Quarto', '063', NULL, '2023-02-27 18:49:07', 'H114');
INSERT INTO `comuni` VALUES ('063064', 'Ercolano', '063', NULL, '2023-02-27 18:49:07', 'H243');
INSERT INTO `comuni` VALUES ('063065', 'Roccarainola', '063', NULL, '2023-02-27 18:49:07', 'H433');
INSERT INTO `comuni` VALUES ('063066', 'San Gennaro Vesuviano', '063', NULL, '2023-02-27 18:49:07', 'H860');
INSERT INTO `comuni` VALUES ('063067', 'San Giorgio a Cremano', '063', NULL, '2023-02-27 18:49:07', 'H892');
INSERT INTO `comuni` VALUES ('063068', 'San Giuseppe Vesuviano', '063', NULL, '2023-02-27 18:49:07', 'H931');
INSERT INTO `comuni` VALUES ('063069', 'San Paolo Bel Sito', '063', NULL, '2023-02-27 18:49:07', 'I073');
INSERT INTO `comuni` VALUES ('063070', 'San Sebastiano al Vesuvio', '063', NULL, '2023-02-27 18:49:07', 'I151');
INSERT INTO `comuni` VALUES ('063071', 'Sant\'Agnello', '063', NULL, '2023-02-27 18:49:07', 'I208');
INSERT INTO `comuni` VALUES ('063072', 'Sant\'Anastasia', '063', NULL, '2023-02-27 18:49:07', 'I262');
INSERT INTO `comuni` VALUES ('063073', 'Sant\'Antimo', '063', NULL, '2023-02-27 18:49:07', 'I293');
INSERT INTO `comuni` VALUES ('063074', 'Sant\'Antonio Abate', '063', NULL, '2023-02-27 18:49:07', 'I300');
INSERT INTO `comuni` VALUES ('063075', 'San Vitaliano', '063', NULL, '2023-02-27 18:49:07', 'I391');
INSERT INTO `comuni` VALUES ('063076', 'Saviano', '063', NULL, '2023-02-27 18:49:07', 'I469');
INSERT INTO `comuni` VALUES ('063077', 'Scisciano', '063', NULL, '2023-02-27 18:49:07', 'I540');
INSERT INTO `comuni` VALUES ('063078', 'Serrara Fontana', '063', NULL, '2023-02-27 18:49:07', 'I652');
INSERT INTO `comuni` VALUES ('063079', 'Somma Vesuviana', '063', NULL, '2023-02-27 18:49:07', 'I820');
INSERT INTO `comuni` VALUES ('063080', 'Sorrento', '063', NULL, '2023-02-27 18:49:07', 'I862');
INSERT INTO `comuni` VALUES ('063081', 'Striano', '063', NULL, '2023-02-27 18:49:07', 'I978');
INSERT INTO `comuni` VALUES ('063082', 'Terzigno', '063', NULL, '2023-02-27 18:49:07', 'L142');
INSERT INTO `comuni` VALUES ('063083', 'Torre Annunziata', '063', NULL, '2023-02-27 18:49:07', 'L245');
INSERT INTO `comuni` VALUES ('063084', 'Torre del Greco', '063', NULL, '2023-02-27 18:49:07', 'L259');
INSERT INTO `comuni` VALUES ('063085', 'Tufino', '063', NULL, '2023-02-27 18:49:07', 'L460');
INSERT INTO `comuni` VALUES ('063086', 'Vico Equense', '063', NULL, '2023-02-27 18:49:07', 'L845');
INSERT INTO `comuni` VALUES ('063087', 'Villaricca', '063', NULL, '2023-02-27 18:49:07', 'G309');
INSERT INTO `comuni` VALUES ('063088', 'Visciano', '063', NULL, '2023-02-27 18:49:07', 'M072');
INSERT INTO `comuni` VALUES ('063089', 'Volla', '063', NULL, '2023-02-27 18:49:07', 'M115');
INSERT INTO `comuni` VALUES ('063090', 'Santa Maria la Carità', '063', NULL, '2023-02-27 18:49:07', 'M273');
INSERT INTO `comuni` VALUES ('063091', 'Trecase', '063', NULL, '2023-02-27 18:49:07', 'M280');
INSERT INTO `comuni` VALUES ('063092', 'Massa di Somma', '063', NULL, '2023-02-27 18:49:07', 'M289');
INSERT INTO `comuni` VALUES ('064001', 'Aiello del Sabato', '064', NULL, '2023-02-27 18:49:07', 'A101');
INSERT INTO `comuni` VALUES ('064002', 'Altavilla Irpina', '064', NULL, '2023-02-27 18:49:07', 'A228');
INSERT INTO `comuni` VALUES ('064003', 'Andretta', '064', NULL, '2023-02-27 18:49:07', 'A284');
INSERT INTO `comuni` VALUES ('064004', 'Aquilonia', '064', NULL, '2023-02-27 18:49:07', 'A347');
INSERT INTO `comuni` VALUES ('064005', 'Ariano Irpino', '064', NULL, '2023-02-27 18:49:07', 'A399');
INSERT INTO `comuni` VALUES ('064006', 'Atripalda', '064', NULL, '2023-02-27 18:49:07', 'A489');
INSERT INTO `comuni` VALUES ('064007', 'Avella', '064', NULL, '2023-02-27 18:49:07', 'A508');
INSERT INTO `comuni` VALUES ('064008', 'Avellino', '064', NULL, '2023-02-27 18:49:07', 'A509');
INSERT INTO `comuni` VALUES ('064009', 'Bagnoli Irpino', '064', NULL, '2023-02-27 18:49:07', 'A566');
INSERT INTO `comuni` VALUES ('064010', 'Baiano', '064', NULL, '2023-02-27 18:49:07', 'A580');
INSERT INTO `comuni` VALUES ('064011', 'Bisaccia', '064', NULL, '2023-02-27 18:49:07', 'A881');
INSERT INTO `comuni` VALUES ('064012', 'Bonito', '064', NULL, '2023-02-27 18:49:07', 'A975');
INSERT INTO `comuni` VALUES ('064013', 'Cairano', '064', NULL, '2023-02-27 18:49:07', 'B367');
INSERT INTO `comuni` VALUES ('064014', 'Calabritto', '064', NULL, '2023-02-27 18:49:07', 'B374');
INSERT INTO `comuni` VALUES ('064015', 'Calitri', '064', NULL, '2023-02-27 18:49:07', 'B415');
INSERT INTO `comuni` VALUES ('064016', 'Candida', '064', NULL, '2023-02-27 18:49:07', 'B590');
INSERT INTO `comuni` VALUES ('064017', 'Caposele', '064', NULL, '2023-02-27 18:49:07', 'B674');
INSERT INTO `comuni` VALUES ('064018', 'Capriglia Irpina', '064', NULL, '2023-02-27 18:49:07', 'B706');
INSERT INTO `comuni` VALUES ('064019', 'Carife', '064', NULL, '2023-02-27 18:49:07', 'B776');
INSERT INTO `comuni` VALUES ('064020', 'Casalbore', '064', NULL, '2023-02-27 18:49:07', 'B866');
INSERT INTO `comuni` VALUES ('064021', 'Cassano Irpino', '064', NULL, '2023-02-27 18:49:07', 'B997');
INSERT INTO `comuni` VALUES ('064022', 'Castel Baronia', '064', NULL, '2023-02-27 18:49:07', 'C058');
INSERT INTO `comuni` VALUES ('064023', 'Castelfranci', '064', NULL, '2023-02-27 18:49:07', 'C105');
INSERT INTO `comuni` VALUES ('064024', 'Castelvetere sul Calore', '064', NULL, '2023-02-27 18:49:07', 'C283');
INSERT INTO `comuni` VALUES ('064025', 'Cervinara', '064', NULL, '2023-02-27 18:49:07', 'C557');
INSERT INTO `comuni` VALUES ('064026', 'Cesinali', '064', NULL, '2023-02-27 18:49:07', 'C576');
INSERT INTO `comuni` VALUES ('064027', 'Chianche', '064', NULL, '2023-02-27 18:49:07', 'C606');
INSERT INTO `comuni` VALUES ('064028', 'Chiusano di San Domenico', '064', NULL, '2023-02-27 18:49:07', 'C659');
INSERT INTO `comuni` VALUES ('064029', 'Contrada', '064', NULL, '2023-02-27 18:49:07', 'C971');
INSERT INTO `comuni` VALUES ('064030', 'Conza della Campania', '064', NULL, '2023-02-27 18:49:07', 'C976');
INSERT INTO `comuni` VALUES ('064031', 'Domicella', '064', NULL, '2023-02-27 18:49:07', 'D331');
INSERT INTO `comuni` VALUES ('064032', 'Flumeri', '064', NULL, '2023-02-27 18:49:07', 'D638');
INSERT INTO `comuni` VALUES ('064033', 'Fontanarosa', '064', NULL, '2023-02-27 18:49:07', 'D671');
INSERT INTO `comuni` VALUES ('064034', 'Forino', '064', NULL, '2023-02-27 18:49:07', 'D701');
INSERT INTO `comuni` VALUES ('064035', 'Frigento', '064', NULL, '2023-02-27 18:49:07', 'D798');
INSERT INTO `comuni` VALUES ('064036', 'Gesualdo', '064', NULL, '2023-02-27 18:49:07', 'D998');
INSERT INTO `comuni` VALUES ('064037', 'Greci', '064', NULL, '2023-02-27 18:49:07', 'E161');
INSERT INTO `comuni` VALUES ('064038', 'Grottaminarda', '064', NULL, '2023-02-27 18:49:07', 'E206');
INSERT INTO `comuni` VALUES ('064039', 'Grottolella', '064', NULL, '2023-02-27 18:49:07', 'E214');
INSERT INTO `comuni` VALUES ('064040', 'Guardia Lombardi', '064', NULL, '2023-02-27 18:49:07', 'E245');
INSERT INTO `comuni` VALUES ('064041', 'Lacedonia', '064', NULL, '2023-02-27 18:49:07', 'E397');
INSERT INTO `comuni` VALUES ('064042', 'Lapio', '064', NULL, '2023-02-27 18:49:07', 'E448');
INSERT INTO `comuni` VALUES ('064043', 'Lauro', '064', NULL, '2023-02-27 18:49:07', 'E487');
INSERT INTO `comuni` VALUES ('064044', 'Lioni', '064', NULL, '2023-02-27 18:49:07', 'E605');
INSERT INTO `comuni` VALUES ('064045', 'Luogosano', '064', NULL, '2023-02-27 18:49:07', 'E746');
INSERT INTO `comuni` VALUES ('064046', 'Manocalzati', '064', NULL, '2023-02-27 18:49:07', 'E891');
INSERT INTO `comuni` VALUES ('064047', 'Marzano di Nola', '064', NULL, '2023-02-27 18:49:07', 'E997');
INSERT INTO `comuni` VALUES ('064048', 'Melito Irpino', '064', NULL, '2023-02-27 18:49:07', 'F110');
INSERT INTO `comuni` VALUES ('064049', 'Mercogliano', '064', NULL, '2023-02-27 18:49:07', 'F141');
INSERT INTO `comuni` VALUES ('064050', 'Mirabella Eclano', '064', NULL, '2023-02-27 18:49:07', 'F230');
INSERT INTO `comuni` VALUES ('064051', 'Montaguto', '064', NULL, '2023-02-27 18:49:07', 'F397');
INSERT INTO `comuni` VALUES ('064052', 'Montecalvo Irpino', '064', NULL, '2023-02-27 18:49:07', 'F448');
INSERT INTO `comuni` VALUES ('064053', 'Montefalcione', '064', NULL, '2023-02-27 18:49:07', 'F491');
INSERT INTO `comuni` VALUES ('064054', 'Monteforte Irpino', '064', NULL, '2023-02-27 18:49:07', 'F506');
INSERT INTO `comuni` VALUES ('064055', 'Montefredane', '064', NULL, '2023-02-27 18:49:07', 'F511');
INSERT INTO `comuni` VALUES ('064056', 'Montefusco', '064', NULL, '2023-02-27 18:49:07', 'F512');
INSERT INTO `comuni` VALUES ('064057', 'Montella', '064', NULL, '2023-02-27 18:49:07', 'F546');
INSERT INTO `comuni` VALUES ('064058', 'Montemarano', '064', NULL, '2023-02-27 18:49:07', 'F559');
INSERT INTO `comuni` VALUES ('064059', 'Montemiletto', '064', NULL, '2023-02-27 18:49:07', 'F566');
INSERT INTO `comuni` VALUES ('064060', 'Monteverde', '064', NULL, '2023-02-27 18:49:07', 'F660');
INSERT INTO `comuni` VALUES ('064063', 'Morra De Sanctis', '064', NULL, '2023-02-27 18:49:07', 'F744');
INSERT INTO `comuni` VALUES ('064064', 'Moschiano', '064', NULL, '2023-02-27 18:49:07', 'F762');
INSERT INTO `comuni` VALUES ('064065', 'Mugnano del Cardinale', '064', NULL, '2023-02-27 18:49:07', 'F798');
INSERT INTO `comuni` VALUES ('064066', 'Nusco', '064', NULL, '2023-02-27 18:49:07', 'F988');
INSERT INTO `comuni` VALUES ('064067', 'Ospedaletto d\'Alpinolo', '064', NULL, '2023-02-27 18:49:07', 'G165');
INSERT INTO `comuni` VALUES ('064068', 'Pago del Vallo di Lauro', '064', NULL, '2023-02-27 18:49:07', 'G242');
INSERT INTO `comuni` VALUES ('064069', 'Parolise', '064', NULL, '2023-02-27 18:49:07', 'G340');
INSERT INTO `comuni` VALUES ('064070', 'Paternopoli', '064', NULL, '2023-02-27 18:49:07', 'G370');
INSERT INTO `comuni` VALUES ('064071', 'Petruro Irpino', '064', NULL, '2023-02-27 18:49:07', 'G519');
INSERT INTO `comuni` VALUES ('064072', 'Pietradefusi', '064', NULL, '2023-02-27 18:49:07', 'G611');
INSERT INTO `comuni` VALUES ('064073', 'Pietrastornina', '064', NULL, '2023-02-27 18:49:07', 'G629');
INSERT INTO `comuni` VALUES ('064074', 'Prata di Principato Ultra', '064', NULL, '2023-02-27 18:49:07', 'G990');
INSERT INTO `comuni` VALUES ('064075', 'Pratola Serra', '064', NULL, '2023-02-27 18:49:07', 'H006');
INSERT INTO `comuni` VALUES ('064076', 'Quadrelle', '064', NULL, '2023-02-27 18:49:07', 'H097');
INSERT INTO `comuni` VALUES ('064077', 'Quindici', '064', NULL, '2023-02-27 18:49:07', 'H128');
INSERT INTO `comuni` VALUES ('064078', 'Roccabascerana', '064', NULL, '2023-02-27 18:49:07', 'H382');
INSERT INTO `comuni` VALUES ('064079', 'Rocca San Felice', '064', NULL, '2023-02-27 18:49:07', 'H438');
INSERT INTO `comuni` VALUES ('064080', 'Rotondi', '064', NULL, '2023-02-27 18:49:07', 'H592');
INSERT INTO `comuni` VALUES ('064081', 'Salza Irpina', '064', NULL, '2023-02-27 18:49:07', 'H733');
INSERT INTO `comuni` VALUES ('064082', 'San Mango sul Calore', '064', NULL, '2023-02-27 18:49:07', 'H975');
INSERT INTO `comuni` VALUES ('064083', 'San Martino Valle Caudina', '064', NULL, '2023-02-27 18:49:07', 'I016');
INSERT INTO `comuni` VALUES ('064084', 'San Michele di Serino', '064', NULL, '2023-02-27 18:49:07', 'I034');
INSERT INTO `comuni` VALUES ('064085', 'San Nicola Baronia', '064', NULL, '2023-02-27 18:49:07', 'I061');
INSERT INTO `comuni` VALUES ('064086', 'San Potito Ultra', '064', NULL, '2023-02-27 18:49:07', 'I129');
INSERT INTO `comuni` VALUES ('064087', 'San Sossio Baronia', '064', NULL, '2023-02-27 18:49:07', 'I163');
INSERT INTO `comuni` VALUES ('064088', 'Santa Lucia di Serino', '064', NULL, '2023-02-27 18:49:07', 'I219');
INSERT INTO `comuni` VALUES ('064089', 'Sant\'Andrea di Conza', '064', NULL, '2023-02-27 18:49:07', 'I264');
INSERT INTO `comuni` VALUES ('064090', 'Sant\'Angelo all\'Esca', '064', NULL, '2023-02-27 18:49:07', 'I279');
INSERT INTO `comuni` VALUES ('064091', 'Sant\'Angelo a Scala', '064', NULL, '2023-02-27 18:49:07', 'I280');
INSERT INTO `comuni` VALUES ('064092', 'Sant\'Angelo dei Lombardi', '064', NULL, '2023-02-27 18:49:07', 'I281');
INSERT INTO `comuni` VALUES ('064093', 'Santa Paolina', '064', NULL, '2023-02-27 18:49:07', 'I301');
INSERT INTO `comuni` VALUES ('064095', 'Santo Stefano del Sole', '064', NULL, '2023-02-27 18:49:07', 'I357');
INSERT INTO `comuni` VALUES ('064096', 'Savignano Irpino', '064', NULL, '2023-02-27 18:49:07', 'I471');
INSERT INTO `comuni` VALUES ('064097', 'Scampitella', '064', NULL, '2023-02-27 18:49:07', 'I493');
INSERT INTO `comuni` VALUES ('064098', 'Senerchia', '064', NULL, '2023-02-27 18:49:07', 'I606');
INSERT INTO `comuni` VALUES ('064099', 'Serino', '064', NULL, '2023-02-27 18:49:07', 'I630');
INSERT INTO `comuni` VALUES ('064100', 'Sirignano', '064', NULL, '2023-02-27 18:49:07', 'I756');
INSERT INTO `comuni` VALUES ('064101', 'Solofra', '064', NULL, '2023-02-27 18:49:07', 'I805');
INSERT INTO `comuni` VALUES ('064102', 'Sorbo Serpico', '064', NULL, '2023-02-27 18:49:07', 'I843');
INSERT INTO `comuni` VALUES ('064103', 'Sperone', '064', NULL, '2023-02-27 18:49:07', 'I893');
INSERT INTO `comuni` VALUES ('064104', 'Sturno', '064', NULL, '2023-02-27 18:49:07', 'I990');
INSERT INTO `comuni` VALUES ('064105', 'Summonte', '064', NULL, '2023-02-27 18:49:07', 'L004');
INSERT INTO `comuni` VALUES ('064106', 'Taurano', '064', NULL, '2023-02-27 18:49:07', 'L061');
INSERT INTO `comuni` VALUES ('064107', 'Taurasi', '064', NULL, '2023-02-27 18:49:07', 'L062');
INSERT INTO `comuni` VALUES ('064108', 'Teora', '064', NULL, '2023-02-27 18:49:07', 'L102');
INSERT INTO `comuni` VALUES ('064109', 'Torella dei Lombardi', '064', NULL, '2023-02-27 18:49:07', 'L214');
INSERT INTO `comuni` VALUES ('064110', 'Torre Le Nocelle', '064', NULL, '2023-02-27 18:49:07', 'L272');
INSERT INTO `comuni` VALUES ('064111', 'Torrioni', '064', NULL, '2023-02-27 18:49:07', 'L301');
INSERT INTO `comuni` VALUES ('064112', 'Trevico', '064', NULL, '2023-02-27 18:49:07', 'L399');
INSERT INTO `comuni` VALUES ('064113', 'Tufo', '064', NULL, '2023-02-27 18:49:07', 'L461');
INSERT INTO `comuni` VALUES ('064114', 'Vallata', '064', NULL, '2023-02-27 18:49:07', 'L589');
INSERT INTO `comuni` VALUES ('064115', 'Vallesaccarda', '064', NULL, '2023-02-27 18:49:07', 'L616');
INSERT INTO `comuni` VALUES ('064116', 'Venticano', '064', NULL, '2023-02-27 18:49:07', 'L739');
INSERT INTO `comuni` VALUES ('064117', 'Villamaina', '064', NULL, '2023-02-27 18:49:07', 'L965');
INSERT INTO `comuni` VALUES ('064118', 'Villanova del Battista', '064', NULL, '2023-02-27 18:49:07', 'L973');
INSERT INTO `comuni` VALUES ('064119', 'Volturara Irpina', '064', NULL, '2023-02-27 18:49:07', 'M130');
INSERT INTO `comuni` VALUES ('064120', 'Zungoli', '064', NULL, '2023-02-27 18:49:07', 'M203');
INSERT INTO `comuni` VALUES ('064121', 'Montoro', '064', NULL, '2023-02-27 18:49:07', 'M330');
INSERT INTO `comuni` VALUES ('065001', 'Acerno', '065', NULL, '2023-02-27 18:49:07', 'A023');
INSERT INTO `comuni` VALUES ('065002', 'Agropoli', '065', NULL, '2023-02-27 18:49:07', 'A091');
INSERT INTO `comuni` VALUES ('065003', 'Albanella', '065', NULL, '2023-02-27 18:49:07', 'A128');
INSERT INTO `comuni` VALUES ('065004', 'Alfano', '065', NULL, '2023-02-27 18:49:07', 'A186');
INSERT INTO `comuni` VALUES ('065005', 'Altavilla Silentina', '065', NULL, '2023-02-27 18:49:07', 'A230');
INSERT INTO `comuni` VALUES ('065006', 'Amalfi', '065', NULL, '2023-02-27 18:49:07', 'A251');
INSERT INTO `comuni` VALUES ('065007', 'Angri', '065', NULL, '2023-02-27 18:49:07', 'A294');
INSERT INTO `comuni` VALUES ('065008', 'Aquara', '065', NULL, '2023-02-27 18:49:07', 'A343');
INSERT INTO `comuni` VALUES ('065009', 'Ascea', '065', NULL, '2023-02-27 18:49:07', 'A460');
INSERT INTO `comuni` VALUES ('065010', 'Atena Lucana', '065', NULL, '2023-02-27 18:49:07', 'A484');
INSERT INTO `comuni` VALUES ('065011', 'Atrani', '065', NULL, '2023-02-27 18:49:07', 'A487');
INSERT INTO `comuni` VALUES ('065012', 'Auletta', '065', NULL, '2023-02-27 18:49:07', 'A495');
INSERT INTO `comuni` VALUES ('065013', 'Baronissi', '065', NULL, '2023-02-27 18:49:07', 'A674');
INSERT INTO `comuni` VALUES ('065014', 'Battipaglia', '065', NULL, '2023-02-27 18:49:07', 'A717');
INSERT INTO `comuni` VALUES ('065015', 'Bellosguardo', '065', NULL, '2023-02-27 18:49:07', 'A756');
INSERT INTO `comuni` VALUES ('065016', 'Bracigliano', '065', NULL, '2023-02-27 18:49:07', 'B115');
INSERT INTO `comuni` VALUES ('065017', 'Buccino', '065', NULL, '2023-02-27 18:49:07', 'B242');
INSERT INTO `comuni` VALUES ('065018', 'Buonabitacolo', '065', NULL, '2023-02-27 18:49:07', 'B266');
INSERT INTO `comuni` VALUES ('065019', 'Caggiano', '065', NULL, '2023-02-27 18:49:07', 'B351');
INSERT INTO `comuni` VALUES ('065020', 'Calvanico', '065', NULL, '2023-02-27 18:49:07', 'B437');
INSERT INTO `comuni` VALUES ('065021', 'Camerota', '065', NULL, '2023-02-27 18:49:07', 'B476');
INSERT INTO `comuni` VALUES ('065022', 'Campagna', '065', NULL, '2023-02-27 18:49:07', 'B492');
INSERT INTO `comuni` VALUES ('065023', 'Campora', '065', NULL, '2023-02-27 18:49:07', 'B555');
INSERT INTO `comuni` VALUES ('065024', 'Cannalonga', '065', NULL, '2023-02-27 18:49:07', 'B608');
INSERT INTO `comuni` VALUES ('065025', 'Capaccio', '065', NULL, '2023-02-27 18:49:07', 'B644');
INSERT INTO `comuni` VALUES ('065026', 'Casalbuono', '065', NULL, '2023-02-27 18:49:07', 'B868');
INSERT INTO `comuni` VALUES ('065027', 'Casaletto Spartano', '065', NULL, '2023-02-27 18:49:07', 'B888');
INSERT INTO `comuni` VALUES ('065028', 'Casal Velino', '065', NULL, '2023-02-27 18:49:07', 'B895');
INSERT INTO `comuni` VALUES ('065029', 'Caselle in Pittari', '065', NULL, '2023-02-27 18:49:07', 'B959');
INSERT INTO `comuni` VALUES ('065030', 'Castelcivita', '065', NULL, '2023-02-27 18:49:07', 'C069');
INSERT INTO `comuni` VALUES ('065031', 'Castellabate', '065', NULL, '2023-02-27 18:49:07', 'C125');
INSERT INTO `comuni` VALUES ('065032', 'Castelnuovo Cilento', '065', NULL, '2023-02-27 18:49:07', 'C231');
INSERT INTO `comuni` VALUES ('065033', 'Castelnuovo di Conza', '065', NULL, '2023-02-27 18:49:07', 'C235');
INSERT INTO `comuni` VALUES ('065034', 'Castel San Giorgio', '065', NULL, '2023-02-27 18:49:07', 'C259');
INSERT INTO `comuni` VALUES ('065035', 'Castel San Lorenzo', '065', NULL, '2023-02-27 18:49:07', 'C262');
INSERT INTO `comuni` VALUES ('065036', 'Castiglione del Genovesi', '065', NULL, '2023-02-27 18:49:07', 'C306');
INSERT INTO `comuni` VALUES ('065037', 'Cava de\' Tirreni', '065', NULL, '2023-02-27 18:49:07', 'C361');
INSERT INTO `comuni` VALUES ('065038', 'Celle di Bulgheria', '065', NULL, '2023-02-27 18:49:07', 'C444');
INSERT INTO `comuni` VALUES ('065039', 'Centola', '065', NULL, '2023-02-27 18:49:07', 'C470');
INSERT INTO `comuni` VALUES ('065040', 'Ceraso', '065', NULL, '2023-02-27 18:49:07', 'C485');
INSERT INTO `comuni` VALUES ('065041', 'Cetara', '065', NULL, '2023-02-27 18:49:07', 'C584');
INSERT INTO `comuni` VALUES ('065042', 'Cicerale', '065', NULL, '2023-02-27 18:49:07', 'C676');
INSERT INTO `comuni` VALUES ('065043', 'Colliano', '065', NULL, '2023-02-27 18:49:07', 'C879');
INSERT INTO `comuni` VALUES ('065044', 'Conca dei Marini', '065', NULL, '2023-02-27 18:49:07', 'C940');
INSERT INTO `comuni` VALUES ('065045', 'Controne', '065', NULL, '2023-02-27 18:49:07', 'C973');
INSERT INTO `comuni` VALUES ('065046', 'Contursi Terme', '065', NULL, '2023-02-27 18:49:07', 'C974');
INSERT INTO `comuni` VALUES ('065047', 'Corbara', '065', NULL, '2023-02-27 18:49:07', 'C984');
INSERT INTO `comuni` VALUES ('065048', 'Corleto Monforte', '065', NULL, '2023-02-27 18:49:07', 'D011');
INSERT INTO `comuni` VALUES ('065049', 'Cuccaro Vetere', '065', NULL, '2023-02-27 18:49:07', 'D195');
INSERT INTO `comuni` VALUES ('065050', 'Eboli', '065', NULL, '2023-02-27 18:49:07', 'D390');
INSERT INTO `comuni` VALUES ('065051', 'Felitto', '065', NULL, '2023-02-27 18:49:07', 'D527');
INSERT INTO `comuni` VALUES ('065052', 'Fisciano', '065', NULL, '2023-02-27 18:49:07', 'D615');
INSERT INTO `comuni` VALUES ('065053', 'Furore', '065', NULL, '2023-02-27 18:49:07', 'D826');
INSERT INTO `comuni` VALUES ('065054', 'Futani', '065', NULL, '2023-02-27 18:49:07', 'D832');
INSERT INTO `comuni` VALUES ('065055', 'Giffoni Sei Casali', '065', NULL, '2023-02-27 18:49:07', 'E026');
INSERT INTO `comuni` VALUES ('065056', 'Giffoni Valle Piana', '065', NULL, '2023-02-27 18:49:07', 'E027');
INSERT INTO `comuni` VALUES ('065057', 'Gioi', '065', NULL, '2023-02-27 18:49:07', 'E037');
INSERT INTO `comuni` VALUES ('065058', 'Giungano', '065', NULL, '2023-02-27 18:49:07', 'E060');
INSERT INTO `comuni` VALUES ('065059', 'Ispani', '065', NULL, '2023-02-27 18:49:07', 'E365');
INSERT INTO `comuni` VALUES ('065060', 'Laureana Cilento', '065', NULL, '2023-02-27 18:49:07', 'E480');
INSERT INTO `comuni` VALUES ('065061', 'Laurino', '065', NULL, '2023-02-27 18:49:07', 'E485');
INSERT INTO `comuni` VALUES ('065062', 'Laurito', '065', NULL, '2023-02-27 18:49:07', 'E486');
INSERT INTO `comuni` VALUES ('065063', 'Laviano', '065', NULL, '2023-02-27 18:49:07', 'E498');
INSERT INTO `comuni` VALUES ('065064', 'Lustra', '065', NULL, '2023-02-27 18:49:07', 'E767');
INSERT INTO `comuni` VALUES ('065065', 'Magliano Vetere', '065', NULL, '2023-02-27 18:49:07', 'E814');
INSERT INTO `comuni` VALUES ('065066', 'Maiori', '065', NULL, '2023-02-27 18:49:07', 'E839');
INSERT INTO `comuni` VALUES ('065067', 'Mercato San Severino', '065', NULL, '2023-02-27 18:49:07', 'F138');
INSERT INTO `comuni` VALUES ('065068', 'Minori', '065', NULL, '2023-02-27 18:49:07', 'F223');
INSERT INTO `comuni` VALUES ('065069', 'Moio della Civitella', '065', NULL, '2023-02-27 18:49:07', 'F278');
INSERT INTO `comuni` VALUES ('065070', 'Montano Antilia', '065', NULL, '2023-02-27 18:49:07', 'F426');
INSERT INTO `comuni` VALUES ('065071', 'Montecorice', '065', NULL, '2023-02-27 18:49:07', 'F479');
INSERT INTO `comuni` VALUES ('065072', 'Montecorvino Pugliano', '065', NULL, '2023-02-27 18:49:07', 'F480');
INSERT INTO `comuni` VALUES ('065073', 'Montecorvino Rovella', '065', NULL, '2023-02-27 18:49:07', 'F481');
INSERT INTO `comuni` VALUES ('065074', 'Monteforte Cilento', '065', NULL, '2023-02-27 18:49:07', 'F507');
INSERT INTO `comuni` VALUES ('065075', 'Monte San Giacomo', '065', NULL, '2023-02-27 18:49:07', 'F618');
INSERT INTO `comuni` VALUES ('065076', 'Montesano sulla Marcellana', '065', NULL, '2023-02-27 18:49:07', 'F625');
INSERT INTO `comuni` VALUES ('065077', 'Morigerati', '065', NULL, '2023-02-27 18:49:07', 'F731');
INSERT INTO `comuni` VALUES ('065078', 'Nocera Inferiore', '065', NULL, '2023-02-27 18:49:07', 'F912');
INSERT INTO `comuni` VALUES ('065079', 'Nocera Superiore', '065', NULL, '2023-02-27 18:49:07', 'F913');
INSERT INTO `comuni` VALUES ('065080', 'Novi Velia', '065', NULL, '2023-02-27 18:49:07', 'F967');
INSERT INTO `comuni` VALUES ('065081', 'Ogliastro Cilento', '065', NULL, '2023-02-27 18:49:07', 'G011');
INSERT INTO `comuni` VALUES ('065082', 'Olevano sul Tusciano', '065', NULL, '2023-02-27 18:49:07', 'G023');
INSERT INTO `comuni` VALUES ('065083', 'Oliveto Citra', '065', NULL, '2023-02-27 18:49:07', 'G039');
INSERT INTO `comuni` VALUES ('065084', 'Omignano', '065', NULL, '2023-02-27 18:49:07', 'G063');
INSERT INTO `comuni` VALUES ('065085', 'Orria', '065', NULL, '2023-02-27 18:49:07', 'G121');
INSERT INTO `comuni` VALUES ('065086', 'Ottati', '065', NULL, '2023-02-27 18:49:07', 'G192');
INSERT INTO `comuni` VALUES ('065087', 'Padula', '065', NULL, '2023-02-27 18:49:07', 'G226');
INSERT INTO `comuni` VALUES ('065088', 'Pagani', '065', NULL, '2023-02-27 18:49:07', 'G230');
INSERT INTO `comuni` VALUES ('065089', 'Palomonte', '065', NULL, '2023-02-27 18:49:07', 'G292');
INSERT INTO `comuni` VALUES ('065090', 'Pellezzano', '065', NULL, '2023-02-27 18:49:07', 'G426');
INSERT INTO `comuni` VALUES ('065091', 'Perdifumo', '065', NULL, '2023-02-27 18:49:07', 'G447');
INSERT INTO `comuni` VALUES ('065092', 'Perito', '065', NULL, '2023-02-27 18:49:07', 'G455');
INSERT INTO `comuni` VALUES ('065093', 'Pertosa', '065', NULL, '2023-02-27 18:49:07', 'G476');
INSERT INTO `comuni` VALUES ('065094', 'Petina', '065', NULL, '2023-02-27 18:49:07', 'G509');
INSERT INTO `comuni` VALUES ('065095', 'Piaggine', '065', NULL, '2023-02-27 18:49:07', 'G538');
INSERT INTO `comuni` VALUES ('065096', 'Pisciotta', '065', NULL, '2023-02-27 18:49:07', 'G707');
INSERT INTO `comuni` VALUES ('065097', 'Polla', '065', NULL, '2023-02-27 18:49:07', 'G793');
INSERT INTO `comuni` VALUES ('065098', 'Pollica', '065', NULL, '2023-02-27 18:49:07', 'G796');
INSERT INTO `comuni` VALUES ('065099', 'Pontecagnano Faiano', '065', NULL, '2023-02-27 18:49:07', 'G834');
INSERT INTO `comuni` VALUES ('065100', 'Positano', '065', NULL, '2023-02-27 18:49:07', 'G932');
INSERT INTO `comuni` VALUES ('065101', 'Postiglione', '065', NULL, '2023-02-27 18:49:07', 'G939');
INSERT INTO `comuni` VALUES ('065102', 'Praiano', '065', NULL, '2023-02-27 18:49:07', 'G976');
INSERT INTO `comuni` VALUES ('065103', 'Prignano Cilento', '065', NULL, '2023-02-27 18:49:07', 'H062');
INSERT INTO `comuni` VALUES ('065104', 'Ravello', '065', NULL, '2023-02-27 18:49:07', 'H198');
INSERT INTO `comuni` VALUES ('065105', 'Ricigliano', '065', NULL, '2023-02-27 18:49:07', 'H277');
INSERT INTO `comuni` VALUES ('065106', 'Roccadaspide', '065', NULL, '2023-02-27 18:49:07', 'H394');
INSERT INTO `comuni` VALUES ('065107', 'Roccagloriosa', '065', NULL, '2023-02-27 18:49:07', 'H412');
INSERT INTO `comuni` VALUES ('065108', 'Roccapiemonte', '065', NULL, '2023-02-27 18:49:07', 'H431');
INSERT INTO `comuni` VALUES ('065109', 'Rofrano', '065', NULL, '2023-02-27 18:49:07', 'H485');
INSERT INTO `comuni` VALUES ('065110', 'Romagnano al Monte', '065', NULL, '2023-02-27 18:49:07', 'H503');
INSERT INTO `comuni` VALUES ('065111', 'Roscigno', '065', NULL, '2023-02-27 18:49:07', 'H564');
INSERT INTO `comuni` VALUES ('065112', 'Rutino', '065', NULL, '2023-02-27 18:49:07', 'H644');
INSERT INTO `comuni` VALUES ('065113', 'Sacco', '065', NULL, '2023-02-27 18:49:07', 'H654');
INSERT INTO `comuni` VALUES ('065114', 'Sala Consilina', '065', NULL, '2023-02-27 18:49:07', 'H683');
INSERT INTO `comuni` VALUES ('065115', 'Salento', '065', NULL, '2023-02-27 18:49:07', 'H686');
INSERT INTO `comuni` VALUES ('065116', 'Salerno', '065', NULL, '2023-02-27 18:49:07', 'H703');
INSERT INTO `comuni` VALUES ('065117', 'Salvitelle', '065', NULL, '2023-02-27 18:49:07', 'H732');
INSERT INTO `comuni` VALUES ('065118', 'San Cipriano Picentino', '065', NULL, '2023-02-27 18:49:07', 'H800');
INSERT INTO `comuni` VALUES ('065119', 'San Giovanni a Piro', '065', NULL, '2023-02-27 18:49:07', 'H907');
INSERT INTO `comuni` VALUES ('065120', 'San Gregorio Magno', '065', NULL, '2023-02-27 18:49:07', 'H943');
INSERT INTO `comuni` VALUES ('065121', 'San Mango Piemonte', '065', NULL, '2023-02-27 18:49:07', 'H977');
INSERT INTO `comuni` VALUES ('065122', 'San Marzano sul Sarno', '065', NULL, '2023-02-27 18:49:07', 'I019');
INSERT INTO `comuni` VALUES ('065123', 'San Mauro Cilento', '065', NULL, '2023-02-27 18:49:07', 'I031');
INSERT INTO `comuni` VALUES ('065124', 'San Mauro la Bruca', '065', NULL, '2023-02-27 18:49:07', 'I032');
INSERT INTO `comuni` VALUES ('065125', 'San Pietro al Tanagro', '065', NULL, '2023-02-27 18:49:07', 'I089');
INSERT INTO `comuni` VALUES ('065126', 'San Rufo', '065', NULL, '2023-02-27 18:49:07', 'I143');
INSERT INTO `comuni` VALUES ('065127', 'Santa Marina', '065', NULL, '2023-02-27 18:49:07', 'I253');
INSERT INTO `comuni` VALUES ('065128', 'Sant\'Angelo a Fasanella', '065', NULL, '2023-02-27 18:49:07', 'I278');
INSERT INTO `comuni` VALUES ('065129', 'Sant\'Arsenio', '065', NULL, '2023-02-27 18:49:07', 'I307');
INSERT INTO `comuni` VALUES ('065130', 'Sant\'Egidio del Monte Albino', '065', NULL, '2023-02-27 18:49:07', 'I317');
INSERT INTO `comuni` VALUES ('065131', 'Santomenna', '065', NULL, '2023-02-27 18:49:07', 'I260');
INSERT INTO `comuni` VALUES ('065132', 'San Valentino Torio', '065', NULL, '2023-02-27 18:49:07', 'I377');
INSERT INTO `comuni` VALUES ('065133', 'Sanza', '065', NULL, '2023-02-27 18:49:07', 'I410');
INSERT INTO `comuni` VALUES ('065134', 'Sapri', '065', NULL, '2023-02-27 18:49:07', 'I422');
INSERT INTO `comuni` VALUES ('065135', 'Sarno', '065', NULL, '2023-02-27 18:49:07', 'I438');
INSERT INTO `comuni` VALUES ('065136', 'Sassano', '065', NULL, '2023-02-27 18:49:07', 'I451');
INSERT INTO `comuni` VALUES ('065137', 'Scafati', '065', NULL, '2023-02-27 18:49:07', 'I483');
INSERT INTO `comuni` VALUES ('065138', 'Scala', '065', NULL, '2023-02-27 18:49:07', 'I486');
INSERT INTO `comuni` VALUES ('065139', 'Serramezzana', '065', NULL, '2023-02-27 18:49:07', 'I648');
INSERT INTO `comuni` VALUES ('065140', 'Serre', '065', NULL, '2023-02-27 18:49:07', 'I666');
INSERT INTO `comuni` VALUES ('065141', 'Sessa Cilento', '065', NULL, '2023-02-27 18:49:07', 'I677');
INSERT INTO `comuni` VALUES ('065142', 'Siano', '065', NULL, '2023-02-27 18:49:07', 'I720');
INSERT INTO `comuni` VALUES ('065143', 'Sicignano degli Alburni', '065', NULL, '2023-02-27 18:49:07', 'M253');
INSERT INTO `comuni` VALUES ('065144', 'Stella Cilento', '065', NULL, '2023-02-27 18:49:07', 'G887');
INSERT INTO `comuni` VALUES ('065145', 'Stio', '065', NULL, '2023-02-27 18:49:07', 'I960');
INSERT INTO `comuni` VALUES ('065146', 'Teggiano', '065', NULL, '2023-02-27 18:49:07', 'D292');
INSERT INTO `comuni` VALUES ('065147', 'Torchiara', '065', NULL, '2023-02-27 18:49:07', 'L212');
INSERT INTO `comuni` VALUES ('065148', 'Torraca', '065', NULL, '2023-02-27 18:49:07', 'L233');
INSERT INTO `comuni` VALUES ('065149', 'Torre Orsaia', '065', NULL, '2023-02-27 18:49:07', 'L274');
INSERT INTO `comuni` VALUES ('065150', 'Tortorella', '065', NULL, '2023-02-27 18:49:07', 'L306');
INSERT INTO `comuni` VALUES ('065151', 'Tramonti', '065', NULL, '2023-02-27 18:49:07', 'L323');
INSERT INTO `comuni` VALUES ('065152', 'Trentinara', '065', NULL, '2023-02-27 18:49:07', 'L377');
INSERT INTO `comuni` VALUES ('065153', 'Valle dell\'Angelo', '065', NULL, '2023-02-27 18:49:07', 'G540');
INSERT INTO `comuni` VALUES ('065154', 'Vallo della Lucania', '065', NULL, '2023-02-27 18:49:07', 'L628');
INSERT INTO `comuni` VALUES ('065155', 'Valva', '065', NULL, '2023-02-27 18:49:07', 'L656');
INSERT INTO `comuni` VALUES ('065156', 'Vibonati', '065', NULL, '2023-02-27 18:49:07', 'L835');
INSERT INTO `comuni` VALUES ('065157', 'Vietri sul Mare', '065', NULL, '2023-02-27 18:49:07', 'L860');
INSERT INTO `comuni` VALUES ('065158', 'Bellizzi', '065', NULL, '2023-02-27 18:49:07', 'M294');
INSERT INTO `comuni` VALUES ('066001', 'Acciano', '066', NULL, '2023-02-27 18:49:07', 'A018');
INSERT INTO `comuni` VALUES ('066002', 'Aielli', '066', NULL, '2023-02-27 18:49:07', 'A100');
INSERT INTO `comuni` VALUES ('066003', 'Alfedena', '066', NULL, '2023-02-27 18:49:07', 'A187');
INSERT INTO `comuni` VALUES ('066004', 'Anversa degli Abruzzi', '066', NULL, '2023-02-27 18:49:07', 'A318');
INSERT INTO `comuni` VALUES ('066005', 'Ateleta', '066', NULL, '2023-02-27 18:49:07', 'A481');
INSERT INTO `comuni` VALUES ('066006', 'Avezzano', '066', NULL, '2023-02-27 18:49:07', 'A515');
INSERT INTO `comuni` VALUES ('066007', 'Balsorano', '066', NULL, '2023-02-27 18:49:07', 'A603');
INSERT INTO `comuni` VALUES ('066008', 'Barete', '066', NULL, '2023-02-27 18:49:07', 'A656');
INSERT INTO `comuni` VALUES ('066009', 'Barisciano', '066', NULL, '2023-02-27 18:49:07', 'A667');
INSERT INTO `comuni` VALUES ('066010', 'Barrea', '066', NULL, '2023-02-27 18:49:07', 'A678');
INSERT INTO `comuni` VALUES ('066011', 'Bisegna', '066', NULL, '2023-02-27 18:49:07', 'A884');
INSERT INTO `comuni` VALUES ('066012', 'Bugnara', '066', NULL, '2023-02-27 18:49:07', 'B256');
INSERT INTO `comuni` VALUES ('066013', 'Cagnano Amiterno', '066', NULL, '2023-02-27 18:49:07', 'B358');
INSERT INTO `comuni` VALUES ('066014', 'Calascio', '066', NULL, '2023-02-27 18:49:07', 'B382');
INSERT INTO `comuni` VALUES ('066015', 'Campo di Giove', '066', NULL, '2023-02-27 18:49:07', 'B526');
INSERT INTO `comuni` VALUES ('066016', 'Campotosto', '066', NULL, '2023-02-27 18:49:07', 'B569');
INSERT INTO `comuni` VALUES ('066017', 'Canistro', '066', NULL, '2023-02-27 18:49:07', 'B606');
INSERT INTO `comuni` VALUES ('066018', 'Cansano', '066', NULL, '2023-02-27 18:49:07', 'B624');
INSERT INTO `comuni` VALUES ('066019', 'Capestrano', '066', NULL, '2023-02-27 18:49:07', 'B651');
INSERT INTO `comuni` VALUES ('066020', 'Capistrello', '066', NULL, '2023-02-27 18:49:07', 'B656');
INSERT INTO `comuni` VALUES ('066021', 'Capitignano', '066', NULL, '2023-02-27 18:49:07', 'B658');
INSERT INTO `comuni` VALUES ('066022', 'Caporciano', '066', NULL, '2023-02-27 18:49:07', 'B672');
INSERT INTO `comuni` VALUES ('066023', 'Cappadocia', '066', NULL, '2023-02-27 18:49:07', 'B677');
INSERT INTO `comuni` VALUES ('066024', 'Carapelle Calvisio', '066', NULL, '2023-02-27 18:49:07', 'B725');
INSERT INTO `comuni` VALUES ('066025', 'Carsoli', '066', NULL, '2023-02-27 18:49:07', 'B842');
INSERT INTO `comuni` VALUES ('066026', 'Castel del Monte', '066', NULL, '2023-02-27 18:49:07', 'C083');
INSERT INTO `comuni` VALUES ('066027', 'Castel di Ieri', '066', NULL, '2023-02-27 18:49:07', 'C090');
INSERT INTO `comuni` VALUES ('066028', 'Castel di Sangro', '066', NULL, '2023-02-27 18:49:07', 'C096');
INSERT INTO `comuni` VALUES ('066029', 'Castellafiume', '066', NULL, '2023-02-27 18:49:07', 'C126');
INSERT INTO `comuni` VALUES ('066030', 'Castelvecchio Calvisio', '066', NULL, '2023-02-27 18:49:07', 'C278');
INSERT INTO `comuni` VALUES ('066031', 'Castelvecchio Subequo', '066', NULL, '2023-02-27 18:49:07', 'C279');
INSERT INTO `comuni` VALUES ('066032', 'Celano', '066', NULL, '2023-02-27 18:49:07', 'C426');
INSERT INTO `comuni` VALUES ('066033', 'Cerchio', '066', NULL, '2023-02-27 18:49:07', 'C492');
INSERT INTO `comuni` VALUES ('066034', 'Civita d\'Antino', '066', NULL, '2023-02-27 18:49:07', 'C766');
INSERT INTO `comuni` VALUES ('066035', 'Civitella Alfedena', '066', NULL, '2023-02-27 18:49:07', 'C778');
INSERT INTO `comuni` VALUES ('066036', 'Civitella Roveto', '066', NULL, '2023-02-27 18:49:07', 'C783');
INSERT INTO `comuni` VALUES ('066037', 'Cocullo', '066', NULL, '2023-02-27 18:49:07', 'C811');
INSERT INTO `comuni` VALUES ('066038', 'Collarmele', '066', NULL, '2023-02-27 18:49:07', 'C844');
INSERT INTO `comuni` VALUES ('066039', 'Collelongo', '066', NULL, '2023-02-27 18:49:07', 'C862');
INSERT INTO `comuni` VALUES ('066040', 'Collepietro', '066', NULL, '2023-02-27 18:49:07', 'C866');
INSERT INTO `comuni` VALUES ('066041', 'Corfinio', '066', NULL, '2023-02-27 18:49:07', 'C999');
INSERT INTO `comuni` VALUES ('066042', 'Fagnano Alto', '066', NULL, '2023-02-27 18:49:07', 'D465');
INSERT INTO `comuni` VALUES ('066043', 'Fontecchio', '066', NULL, '2023-02-27 18:49:07', 'D681');
INSERT INTO `comuni` VALUES ('066044', 'Fossa', '066', NULL, '2023-02-27 18:49:07', 'D736');
INSERT INTO `comuni` VALUES ('066045', 'Gagliano Aterno', '066', NULL, '2023-02-27 18:49:07', 'D850');
INSERT INTO `comuni` VALUES ('066046', 'Gioia dei Marsi', '066', NULL, '2023-02-27 18:49:07', 'E040');
INSERT INTO `comuni` VALUES ('066047', 'Goriano Sicoli', '066', NULL, '2023-02-27 18:49:07', 'E096');
INSERT INTO `comuni` VALUES ('066048', 'Introdacqua', '066', NULL, '2023-02-27 18:49:07', 'E307');
INSERT INTO `comuni` VALUES ('066049', 'L\'Aquila', '066', NULL, '2023-02-27 18:49:07', 'A345');
INSERT INTO `comuni` VALUES ('066050', 'Lecce nei Marsi', '066', NULL, '2023-02-27 18:49:07', 'E505');
INSERT INTO `comuni` VALUES ('066051', 'Luco dei Marsi', '066', NULL, '2023-02-27 18:49:07', 'E723');
INSERT INTO `comuni` VALUES ('066052', 'Lucoli', '066', NULL, '2023-02-27 18:49:07', 'E724');
INSERT INTO `comuni` VALUES ('066053', 'Magliano de\' Marsi', '066', NULL, '2023-02-27 18:49:07', 'E811');
INSERT INTO `comuni` VALUES ('066054', 'Massa d\'Albe', '066', NULL, '2023-02-27 18:49:07', 'F022');
INSERT INTO `comuni` VALUES ('066055', 'Molina Aterno', '066', NULL, '2023-02-27 18:49:07', 'M255');
INSERT INTO `comuni` VALUES ('066056', 'Montereale', '066', NULL, '2023-02-27 18:49:07', 'F595');
INSERT INTO `comuni` VALUES ('066057', 'Morino', '066', NULL, '2023-02-27 18:49:07', 'F732');
INSERT INTO `comuni` VALUES ('066058', 'Navelli', '066', NULL, '2023-02-27 18:49:07', 'F852');
INSERT INTO `comuni` VALUES ('066059', 'Ocre', '066', NULL, '2023-02-27 18:49:07', 'F996');
INSERT INTO `comuni` VALUES ('066060', 'Ofena', '066', NULL, '2023-02-27 18:49:07', 'G002');
INSERT INTO `comuni` VALUES ('066061', 'Opi', '066', NULL, '2023-02-27 18:49:07', 'G079');
INSERT INTO `comuni` VALUES ('066062', 'Oricola', '066', NULL, '2023-02-27 18:49:07', 'G102');
INSERT INTO `comuni` VALUES ('066063', 'Ortona dei Marsi', '066', NULL, '2023-02-27 18:49:07', 'G142');
INSERT INTO `comuni` VALUES ('066064', 'Ortucchio', '066', NULL, '2023-02-27 18:49:07', 'G145');
INSERT INTO `comuni` VALUES ('066065', 'Ovindoli', '066', NULL, '2023-02-27 18:49:07', 'G200');
INSERT INTO `comuni` VALUES ('066066', 'Pacentro', '066', NULL, '2023-02-27 18:49:07', 'G210');
INSERT INTO `comuni` VALUES ('066067', 'Pereto', '066', NULL, '2023-02-27 18:49:07', 'G449');
INSERT INTO `comuni` VALUES ('066068', 'Pescasseroli', '066', NULL, '2023-02-27 18:49:07', 'G484');
INSERT INTO `comuni` VALUES ('066069', 'Pescina', '066', NULL, '2023-02-27 18:49:07', 'G492');
INSERT INTO `comuni` VALUES ('066070', 'Pescocostanzo', '066', NULL, '2023-02-27 18:49:07', 'G493');
INSERT INTO `comuni` VALUES ('066071', 'Pettorano sul Gizio', '066', NULL, '2023-02-27 18:49:07', 'G524');
INSERT INTO `comuni` VALUES ('066072', 'Pizzoli', '066', NULL, '2023-02-27 18:49:07', 'G726');
INSERT INTO `comuni` VALUES ('066073', 'Poggio Picenze', '066', NULL, '2023-02-27 18:49:07', 'G766');
INSERT INTO `comuni` VALUES ('066074', 'Prata d\'Ansidonia', '066', NULL, '2023-02-27 18:49:07', 'G992');
INSERT INTO `comuni` VALUES ('066075', 'Pratola Peligna', '066', NULL, '2023-02-27 18:49:07', 'H007');
INSERT INTO `comuni` VALUES ('066076', 'Prezza', '066', NULL, '2023-02-27 18:49:07', 'H056');
INSERT INTO `comuni` VALUES ('066077', 'Raiano', '066', NULL, '2023-02-27 18:49:07', 'H166');
INSERT INTO `comuni` VALUES ('066078', 'Rivisondoli', '066', NULL, '2023-02-27 18:49:07', 'H353');
INSERT INTO `comuni` VALUES ('066079', 'Roccacasale', '066', NULL, '2023-02-27 18:49:07', 'H389');
INSERT INTO `comuni` VALUES ('066080', 'Rocca di Botte', '066', NULL, '2023-02-27 18:49:07', 'H399');
INSERT INTO `comuni` VALUES ('066081', 'Rocca di Cambio', '066', NULL, '2023-02-27 18:49:07', 'H400');
INSERT INTO `comuni` VALUES ('066082', 'Rocca di Mezzo', '066', NULL, '2023-02-27 18:49:07', 'H402');
INSERT INTO `comuni` VALUES ('066083', 'Rocca Pia', '066', NULL, '2023-02-27 18:49:07', 'H429');
INSERT INTO `comuni` VALUES ('066084', 'Roccaraso', '066', NULL, '2023-02-27 18:49:07', 'H434');
INSERT INTO `comuni` VALUES ('066085', 'San Benedetto dei Marsi', '066', NULL, '2023-02-27 18:49:07', 'H772');
INSERT INTO `comuni` VALUES ('066086', 'San Benedetto in Perillis', '066', NULL, '2023-02-27 18:49:07', 'H773');
INSERT INTO `comuni` VALUES ('066087', 'San Demetrio ne\' Vestini', '066', NULL, '2023-02-27 18:49:07', 'H819');
INSERT INTO `comuni` VALUES ('066088', 'San Pio delle Camere', '066', NULL, '2023-02-27 18:49:07', 'I121');
INSERT INTO `comuni` VALUES ('066089', 'Sante Marie', '066', NULL, '2023-02-27 18:49:07', 'I326');
INSERT INTO `comuni` VALUES ('066090', 'Sant\'Eusanio Forconese', '066', NULL, '2023-02-27 18:49:07', 'I336');
INSERT INTO `comuni` VALUES ('066091', 'Santo Stefano di Sessanio', '066', NULL, '2023-02-27 18:49:07', 'I360');
INSERT INTO `comuni` VALUES ('066092', 'San Vincenzo Valle Roveto', '066', NULL, '2023-02-27 18:49:07', 'I389');
INSERT INTO `comuni` VALUES ('066093', 'Scanno', '066', NULL, '2023-02-27 18:49:07', 'I501');
INSERT INTO `comuni` VALUES ('066094', 'Scontrone', '066', NULL, '2023-02-27 18:49:07', 'I543');
INSERT INTO `comuni` VALUES ('066095', 'Scoppito', '066', NULL, '2023-02-27 18:49:07', 'I546');
INSERT INTO `comuni` VALUES ('066096', 'Scurcola Marsicana', '066', NULL, '2023-02-27 18:49:07', 'I553');
INSERT INTO `comuni` VALUES ('066097', 'Secinaro', '066', NULL, '2023-02-27 18:49:07', 'I558');
INSERT INTO `comuni` VALUES ('066098', 'Sulmona', '066', NULL, '2023-02-27 18:49:07', 'I804');
INSERT INTO `comuni` VALUES ('066099', 'Tagliacozzo', '066', NULL, '2023-02-27 18:49:07', 'L025');
INSERT INTO `comuni` VALUES ('066100', 'Tione degli Abruzzi', '066', NULL, '2023-02-27 18:49:07', 'L173');
INSERT INTO `comuni` VALUES ('066101', 'Tornimparte', '066', NULL, '2023-02-27 18:49:07', 'L227');
INSERT INTO `comuni` VALUES ('066102', 'Trasacco', '066', NULL, '2023-02-27 18:49:07', 'L334');
INSERT INTO `comuni` VALUES ('066103', 'Villalago', '066', NULL, '2023-02-27 18:49:07', 'L958');
INSERT INTO `comuni` VALUES ('066104', 'Villa Santa Lucia degli Abruzzi', '066', NULL, '2023-02-27 18:49:07', 'M021');
INSERT INTO `comuni` VALUES ('066105', 'Villa Sant\'Angelo', '066', NULL, '2023-02-27 18:49:07', 'M023');
INSERT INTO `comuni` VALUES ('066106', 'Villavallelonga', '066', NULL, '2023-02-27 18:49:07', 'M031');
INSERT INTO `comuni` VALUES ('066107', 'Villetta Barrea', '066', NULL, '2023-02-27 18:49:07', 'M041');
INSERT INTO `comuni` VALUES ('066108', 'Vittorito', '066', NULL, '2023-02-27 18:49:07', 'M090');
INSERT INTO `comuni` VALUES ('067001', 'Alba Adriatica', '067', NULL, '2023-02-27 18:49:07', 'A125');
INSERT INTO `comuni` VALUES ('067002', 'Ancarano', '067', NULL, '2023-02-27 18:49:07', 'A270');
INSERT INTO `comuni` VALUES ('067003', 'Arsita', '067', NULL, '2023-02-27 18:49:07', 'A445');
INSERT INTO `comuni` VALUES ('067004', 'Atri', '067', NULL, '2023-02-27 18:49:07', 'A488');
INSERT INTO `comuni` VALUES ('067005', 'Basciano', '067', NULL, '2023-02-27 18:49:07', 'A692');
INSERT INTO `comuni` VALUES ('067006', 'Bellante', '067', NULL, '2023-02-27 18:49:07', 'A746');
INSERT INTO `comuni` VALUES ('067007', 'Bisenti', '067', NULL, '2023-02-27 18:49:07', 'A885');
INSERT INTO `comuni` VALUES ('067008', 'Campli', '067', NULL, '2023-02-27 18:49:07', 'B515');
INSERT INTO `comuni` VALUES ('067009', 'Canzano', '067', NULL, '2023-02-27 18:49:07', 'B640');
INSERT INTO `comuni` VALUES ('067010', 'Castel Castagna', '067', NULL, '2023-02-27 18:49:07', 'C040');
INSERT INTO `comuni` VALUES ('067011', 'Castellalto', '067', NULL, '2023-02-27 18:49:07', 'C128');
INSERT INTO `comuni` VALUES ('067012', 'Castelli', '067', NULL, '2023-02-27 18:49:07', 'C169');
INSERT INTO `comuni` VALUES ('067013', 'Castiglione Messer Raimondo', '067', NULL, '2023-02-27 18:49:07', 'C316');
INSERT INTO `comuni` VALUES ('067014', 'Castilenti', '067', NULL, '2023-02-27 18:49:07', 'C322');
INSERT INTO `comuni` VALUES ('067015', 'Cellino Attanasio', '067', NULL, '2023-02-27 18:49:07', 'C449');
INSERT INTO `comuni` VALUES ('067016', 'Cermignano', '067', NULL, '2023-02-27 18:49:07', 'C517');
INSERT INTO `comuni` VALUES ('067017', 'Civitella del Tronto', '067', NULL, '2023-02-27 18:49:07', 'C781');
INSERT INTO `comuni` VALUES ('067018', 'Colledara', '067', NULL, '2023-02-27 18:49:07', 'C311');
INSERT INTO `comuni` VALUES ('067019', 'Colonnella', '067', NULL, '2023-02-27 18:49:07', 'C901');
INSERT INTO `comuni` VALUES ('067020', 'Controguerra', '067', NULL, '2023-02-27 18:49:07', 'C972');
INSERT INTO `comuni` VALUES ('067021', 'Corropoli', '067', NULL, '2023-02-27 18:49:07', 'D043');
INSERT INTO `comuni` VALUES ('067022', 'Cortino', '067', NULL, '2023-02-27 18:49:07', 'D076');
INSERT INTO `comuni` VALUES ('067023', 'Crognaleto', '067', NULL, '2023-02-27 18:49:07', 'D179');
INSERT INTO `comuni` VALUES ('067024', 'Fano Adriano', '067', NULL, '2023-02-27 18:49:07', 'D489');
INSERT INTO `comuni` VALUES ('067025', 'Giulianova', '067', NULL, '2023-02-27 18:49:07', 'E058');
INSERT INTO `comuni` VALUES ('067026', 'Isola del Gran Sasso d\'Italia', '067', NULL, '2023-02-27 18:49:07', 'E343');
INSERT INTO `comuni` VALUES ('067027', 'Montefino', '067', NULL, '2023-02-27 18:49:07', 'F500');
INSERT INTO `comuni` VALUES ('067028', 'Montorio al Vomano', '067', NULL, '2023-02-27 18:49:07', 'F690');
INSERT INTO `comuni` VALUES ('067029', 'Morro d\'Oro', '067', NULL, '2023-02-27 18:49:07', 'F747');
INSERT INTO `comuni` VALUES ('067030', 'Mosciano Sant\'Angelo', '067', NULL, '2023-02-27 18:49:07', 'F764');
INSERT INTO `comuni` VALUES ('067031', 'Nereto', '067', NULL, '2023-02-27 18:49:07', 'F870');
INSERT INTO `comuni` VALUES ('067032', 'Notaresco', '067', NULL, '2023-02-27 18:49:07', 'F942');
INSERT INTO `comuni` VALUES ('067033', 'Penna Sant\'Andrea', '067', NULL, '2023-02-27 18:49:07', 'G437');
INSERT INTO `comuni` VALUES ('067034', 'Pietracamela', '067', NULL, '2023-02-27 18:49:07', 'G608');
INSERT INTO `comuni` VALUES ('067035', 'Pineto', '067', NULL, '2023-02-27 18:49:07', 'F831');
INSERT INTO `comuni` VALUES ('067036', 'Rocca Santa Maria', '067', NULL, '2023-02-27 18:49:07', 'H440');
INSERT INTO `comuni` VALUES ('067037', 'Roseto degli Abruzzi', '067', NULL, '2023-02-27 18:49:07', 'F585');
INSERT INTO `comuni` VALUES ('067038', 'Sant\'Egidio alla Vibrata', '067', NULL, '2023-02-27 18:49:07', 'I318');
INSERT INTO `comuni` VALUES ('067039', 'Sant\'Omero', '067', NULL, '2023-02-27 18:49:07', 'I348');
INSERT INTO `comuni` VALUES ('067040', 'Silvi', '067', NULL, '2023-02-27 18:49:07', 'I741');
INSERT INTO `comuni` VALUES ('067041', 'Teramo', '067', NULL, '2023-02-27 18:49:07', 'L103');
INSERT INTO `comuni` VALUES ('067042', 'Torano Nuovo', '067', NULL, '2023-02-27 18:49:07', 'L207');
INSERT INTO `comuni` VALUES ('067043', 'Torricella Sicura', '067', NULL, '2023-02-27 18:49:07', 'L295');
INSERT INTO `comuni` VALUES ('067044', 'Tortoreto', '067', NULL, '2023-02-27 18:49:07', 'L307');
INSERT INTO `comuni` VALUES ('067045', 'Tossicia', '067', NULL, '2023-02-27 18:49:07', 'L314');
INSERT INTO `comuni` VALUES ('067046', 'Valle Castellana', '067', NULL, '2023-02-27 18:49:07', 'L597');
INSERT INTO `comuni` VALUES ('067047', 'Martinsicuro', '067', NULL, '2023-02-27 18:49:07', 'E989');
INSERT INTO `comuni` VALUES ('068001', 'Abbateggio', '068', NULL, '2023-02-27 18:49:07', 'A008');
INSERT INTO `comuni` VALUES ('068002', 'Alanno', '068', NULL, '2023-02-27 18:49:07', 'A120');
INSERT INTO `comuni` VALUES ('068003', 'Bolognano', '068', NULL, '2023-02-27 18:49:07', 'A945');
INSERT INTO `comuni` VALUES ('068004', 'Brittoli', '068', NULL, '2023-02-27 18:49:07', 'B193');
INSERT INTO `comuni` VALUES ('068005', 'Bussi sul Tirino', '068', NULL, '2023-02-27 18:49:07', 'B294');
INSERT INTO `comuni` VALUES ('068006', 'Cappelle sul Tavo', '068', NULL, '2023-02-27 18:49:07', 'B681');
INSERT INTO `comuni` VALUES ('068007', 'Caramanico Terme', '068', NULL, '2023-02-27 18:49:07', 'B722');
INSERT INTO `comuni` VALUES ('068008', 'Carpineto della Nora', '068', NULL, '2023-02-27 18:49:07', 'B827');
INSERT INTO `comuni` VALUES ('068009', 'Castiglione a Casauria', '068', NULL, '2023-02-27 18:49:07', 'C308');
INSERT INTO `comuni` VALUES ('068010', 'Catignano', '068', NULL, '2023-02-27 18:49:07', 'C354');
INSERT INTO `comuni` VALUES ('068011', 'Cepagatti', '068', NULL, '2023-02-27 18:49:07', 'C474');
INSERT INTO `comuni` VALUES ('068012', 'Città Sant\'Angelo', '068', NULL, '2023-02-27 18:49:07', 'C750');
INSERT INTO `comuni` VALUES ('068013', 'Civitaquana', '068', NULL, '2023-02-27 18:49:07', 'C771');
INSERT INTO `comuni` VALUES ('068014', 'Civitella Casanova', '068', NULL, '2023-02-27 18:49:07', 'C779');
INSERT INTO `comuni` VALUES ('068015', 'Collecorvino', '068', NULL, '2023-02-27 18:49:07', 'C853');
INSERT INTO `comuni` VALUES ('068016', 'Corvara', '068', NULL, '2023-02-27 18:49:07', 'D078');
INSERT INTO `comuni` VALUES ('068017', 'Cugnoli', '068', NULL, '2023-02-27 18:49:07', 'D201');
INSERT INTO `comuni` VALUES ('068018', 'Elice', '068', NULL, '2023-02-27 18:49:07', 'D394');
INSERT INTO `comuni` VALUES ('068019', 'Farindola', '068', NULL, '2023-02-27 18:49:07', 'D501');
INSERT INTO `comuni` VALUES ('068020', 'Lettomanoppello', '068', NULL, '2023-02-27 18:49:07', 'E558');
INSERT INTO `comuni` VALUES ('068021', 'Loreto Aprutino', '068', NULL, '2023-02-27 18:49:07', 'E691');
INSERT INTO `comuni` VALUES ('068022', 'Manoppello', '068', NULL, '2023-02-27 18:49:07', 'E892');
INSERT INTO `comuni` VALUES ('068023', 'Montebello di Bertona', '068', NULL, '2023-02-27 18:49:07', 'F441');
INSERT INTO `comuni` VALUES ('068024', 'Montesilvano', '068', NULL, '2023-02-27 18:49:07', 'F646');
INSERT INTO `comuni` VALUES ('068025', 'Moscufo', '068', NULL, '2023-02-27 18:49:07', 'F765');
INSERT INTO `comuni` VALUES ('068026', 'Nocciano', '068', NULL, '2023-02-27 18:49:07', 'F908');
INSERT INTO `comuni` VALUES ('068027', 'Penne', '068', NULL, '2023-02-27 18:49:07', 'G438');
INSERT INTO `comuni` VALUES ('068028', 'Pescara', '068', NULL, '2023-02-27 18:49:07', 'G482');
INSERT INTO `comuni` VALUES ('068029', 'Pescosansonesco', '068', NULL, '2023-02-27 18:49:07', 'G499');
INSERT INTO `comuni` VALUES ('068030', 'Pianella', '068', NULL, '2023-02-27 18:49:07', 'G555');
INSERT INTO `comuni` VALUES ('068031', 'Picciano', '068', NULL, '2023-02-27 18:49:07', 'G589');
INSERT INTO `comuni` VALUES ('068032', 'Pietranico', '068', NULL, '2023-02-27 18:49:07', 'G621');
INSERT INTO `comuni` VALUES ('068033', 'Popoli', '068', NULL, '2023-02-27 18:49:07', 'G878');
INSERT INTO `comuni` VALUES ('068034', 'Roccamorice', '068', NULL, '2023-02-27 18:49:07', 'H425');
INSERT INTO `comuni` VALUES ('068035', 'Rosciano', '068', NULL, '2023-02-27 18:49:07', 'H562');
INSERT INTO `comuni` VALUES ('068036', 'Salle', '068', NULL, '2023-02-27 18:49:07', 'H715');
INSERT INTO `comuni` VALUES ('068037', 'Sant\'Eufemia a Maiella', '068', NULL, '2023-02-27 18:49:07', 'I332');
INSERT INTO `comuni` VALUES ('068038', 'San Valentino in Abruzzo Citeriore', '068', NULL, '2023-02-27 18:49:07', 'I376');
INSERT INTO `comuni` VALUES ('068039', 'Scafa', '068', NULL, '2023-02-27 18:49:07', 'I482');
INSERT INTO `comuni` VALUES ('068040', 'Serramonacesca', '068', NULL, '2023-02-27 18:49:07', 'I649');
INSERT INTO `comuni` VALUES ('068041', 'Spoltore', '068', NULL, '2023-02-27 18:49:07', 'I922');
INSERT INTO `comuni` VALUES ('068042', 'Tocco da Casauria', '068', NULL, '2023-02-27 18:49:07', 'L186');
INSERT INTO `comuni` VALUES ('068043', 'Torre de\' Passeri', '068', NULL, '2023-02-27 18:49:07', 'L263');
INSERT INTO `comuni` VALUES ('068044', 'Turrivalignani', '068', NULL, '2023-02-27 18:49:07', 'L475');
INSERT INTO `comuni` VALUES ('068045', 'Vicoli', '068', NULL, '2023-02-27 18:49:07', 'L846');
INSERT INTO `comuni` VALUES ('068046', 'Villa Celiera', '068', NULL, '2023-02-27 18:49:07', 'L922');
INSERT INTO `comuni` VALUES ('069001', 'Altino', '069', NULL, '2023-02-27 18:49:07', 'A235');
INSERT INTO `comuni` VALUES ('069002', 'Archi', '069', NULL, '2023-02-27 18:49:07', 'A367');
INSERT INTO `comuni` VALUES ('069003', 'Ari', '069', NULL, '2023-02-27 18:49:07', 'A398');
INSERT INTO `comuni` VALUES ('069004', 'Arielli', '069', NULL, '2023-02-27 18:49:07', 'A402');
INSERT INTO `comuni` VALUES ('069005', 'Atessa', '069', NULL, '2023-02-27 18:49:07', 'A485');
INSERT INTO `comuni` VALUES ('069006', 'Bomba', '069', NULL, '2023-02-27 18:49:07', 'A956');
INSERT INTO `comuni` VALUES ('069007', 'Borrello', '069', NULL, '2023-02-27 18:49:07', 'B057');
INSERT INTO `comuni` VALUES ('069008', 'Bucchianico', '069', NULL, '2023-02-27 18:49:07', 'B238');
INSERT INTO `comuni` VALUES ('069009', 'Montebello sul Sangro', '069', NULL, '2023-02-27 18:49:07', 'B268');
INSERT INTO `comuni` VALUES ('069010', 'Canosa Sannita', '069', NULL, '2023-02-27 18:49:07', 'B620');
INSERT INTO `comuni` VALUES ('069011', 'Carpineto Sinello', '069', NULL, '2023-02-27 18:49:07', 'B826');
INSERT INTO `comuni` VALUES ('069012', 'Carunchio', '069', NULL, '2023-02-27 18:49:07', 'B853');
INSERT INTO `comuni` VALUES ('069013', 'Casacanditella', '069', NULL, '2023-02-27 18:49:07', 'B859');
INSERT INTO `comuni` VALUES ('069014', 'Casalanguida', '069', NULL, '2023-02-27 18:49:07', 'B861');
INSERT INTO `comuni` VALUES ('069015', 'Casalbordino', '069', NULL, '2023-02-27 18:49:07', 'B865');
INSERT INTO `comuni` VALUES ('069016', 'Casalincontrada', '069', NULL, '2023-02-27 18:49:07', 'B896');
INSERT INTO `comuni` VALUES ('069017', 'Casoli', '069', NULL, '2023-02-27 18:49:07', 'B985');
INSERT INTO `comuni` VALUES ('069018', 'Castel Frentano', '069', NULL, '2023-02-27 18:49:07', 'C114');
INSERT INTO `comuni` VALUES ('069019', 'Castelguidone', '069', NULL, '2023-02-27 18:49:07', 'C123');
INSERT INTO `comuni` VALUES ('069020', 'Castiglione Messer Marino', '069', NULL, '2023-02-27 18:49:07', 'C298');
INSERT INTO `comuni` VALUES ('069021', 'Celenza sul Trigno', '069', NULL, '2023-02-27 18:49:07', 'C428');
INSERT INTO `comuni` VALUES ('069022', 'Chieti', '069', NULL, '2023-02-27 18:49:07', 'C632');
INSERT INTO `comuni` VALUES ('069023', 'Civitaluparella', '069', NULL, '2023-02-27 18:49:07', 'C768');
INSERT INTO `comuni` VALUES ('069024', 'Civitella Messer Raimondo', '069', NULL, '2023-02-27 18:49:07', 'C776');
INSERT INTO `comuni` VALUES ('069025', 'Colledimacine', '069', NULL, '2023-02-27 18:49:07', 'C855');
INSERT INTO `comuni` VALUES ('069026', 'Colledimezzo', '069', NULL, '2023-02-27 18:49:07', 'C856');
INSERT INTO `comuni` VALUES ('069027', 'Crecchio', '069', NULL, '2023-02-27 18:49:07', 'D137');
INSERT INTO `comuni` VALUES ('069028', 'Cupello', '069', NULL, '2023-02-27 18:49:07', 'D209');
INSERT INTO `comuni` VALUES ('069029', 'Dogliola', '069', NULL, '2023-02-27 18:49:07', 'D315');
INSERT INTO `comuni` VALUES ('069030', 'Fara Filiorum Petri', '069', NULL, '2023-02-27 18:49:07', 'D494');
INSERT INTO `comuni` VALUES ('069031', 'Fara San Martino', '069', NULL, '2023-02-27 18:49:07', 'D495');
INSERT INTO `comuni` VALUES ('069032', 'Filetto', '069', NULL, '2023-02-27 18:49:07', 'D592');
INSERT INTO `comuni` VALUES ('069033', 'Fossacesia', '069', NULL, '2023-02-27 18:49:07', 'D738');
INSERT INTO `comuni` VALUES ('069034', 'Fraine', '069', NULL, '2023-02-27 18:49:07', 'D757');
INSERT INTO `comuni` VALUES ('069035', 'Francavilla al Mare', '069', NULL, '2023-02-27 18:49:07', 'D763');
INSERT INTO `comuni` VALUES ('069036', 'Fresagrandinaria', '069', NULL, '2023-02-27 18:49:07', 'D796');
INSERT INTO `comuni` VALUES ('069037', 'Frisa', '069', NULL, '2023-02-27 18:49:07', 'D803');
INSERT INTO `comuni` VALUES ('069038', 'Furci', '069', NULL, '2023-02-27 18:49:07', 'D823');
INSERT INTO `comuni` VALUES ('069039', 'Gamberale', '069', NULL, '2023-02-27 18:49:07', 'D898');
INSERT INTO `comuni` VALUES ('069040', 'Gessopalena', '069', NULL, '2023-02-27 18:49:07', 'D996');
INSERT INTO `comuni` VALUES ('069041', 'Gissi', '069', NULL, '2023-02-27 18:49:07', 'E052');
INSERT INTO `comuni` VALUES ('069042', 'Giuliano Teatino', '069', NULL, '2023-02-27 18:49:07', 'E056');
INSERT INTO `comuni` VALUES ('069043', 'Guardiagrele', '069', NULL, '2023-02-27 18:49:07', 'E243');
INSERT INTO `comuni` VALUES ('069044', 'Guilmi', '069', NULL, '2023-02-27 18:49:07', 'E266');
INSERT INTO `comuni` VALUES ('069045', 'Lama dei Peligni', '069', NULL, '2023-02-27 18:49:07', 'E424');
INSERT INTO `comuni` VALUES ('069046', 'Lanciano', '069', NULL, '2023-02-27 18:49:07', 'E435');
INSERT INTO `comuni` VALUES ('069047', 'Lentella', '069', NULL, '2023-02-27 18:49:07', 'E531');
INSERT INTO `comuni` VALUES ('069048', 'Lettopalena', '069', NULL, '2023-02-27 18:49:07', 'E559');
INSERT INTO `comuni` VALUES ('069049', 'Liscia', '069', NULL, '2023-02-27 18:49:07', 'E611');
INSERT INTO `comuni` VALUES ('069050', 'Miglianico', '069', NULL, '2023-02-27 18:49:07', 'F196');
INSERT INTO `comuni` VALUES ('069051', 'Montazzoli', '069', NULL, '2023-02-27 18:49:07', 'F433');
INSERT INTO `comuni` VALUES ('069052', 'Monteferrante', '069', NULL, '2023-02-27 18:49:07', 'F498');
INSERT INTO `comuni` VALUES ('069053', 'Montelapiano', '069', NULL, '2023-02-27 18:49:07', 'F535');
INSERT INTO `comuni` VALUES ('069054', 'Montenerodomo', '069', NULL, '2023-02-27 18:49:07', 'F578');
INSERT INTO `comuni` VALUES ('069055', 'Monteodorisio', '069', NULL, '2023-02-27 18:49:07', 'F582');
INSERT INTO `comuni` VALUES ('069056', 'Mozzagrogna', '069', NULL, '2023-02-27 18:49:07', 'F785');
INSERT INTO `comuni` VALUES ('069057', 'Orsogna', '069', NULL, '2023-02-27 18:49:07', 'G128');
INSERT INTO `comuni` VALUES ('069058', 'Ortona', '069', NULL, '2023-02-27 18:49:07', 'G141');
INSERT INTO `comuni` VALUES ('069059', 'Paglieta', '069', NULL, '2023-02-27 18:49:07', 'G237');
INSERT INTO `comuni` VALUES ('069060', 'Palena', '069', NULL, '2023-02-27 18:49:07', 'G271');
INSERT INTO `comuni` VALUES ('069061', 'Palmoli', '069', NULL, '2023-02-27 18:49:07', 'G290');
INSERT INTO `comuni` VALUES ('069062', 'Palombaro', '069', NULL, '2023-02-27 18:49:07', 'G294');
INSERT INTO `comuni` VALUES ('069063', 'Pennadomo', '069', NULL, '2023-02-27 18:49:07', 'G434');
INSERT INTO `comuni` VALUES ('069064', 'Pennapiedimonte', '069', NULL, '2023-02-27 18:49:07', 'G435');
INSERT INTO `comuni` VALUES ('069065', 'Perano', '069', NULL, '2023-02-27 18:49:07', 'G441');
INSERT INTO `comuni` VALUES ('069066', 'Pizzoferrato', '069', NULL, '2023-02-27 18:49:07', 'G724');
INSERT INTO `comuni` VALUES ('069067', 'Poggiofiorito', '069', NULL, '2023-02-27 18:49:07', 'G760');
INSERT INTO `comuni` VALUES ('069068', 'Pollutri', '069', NULL, '2023-02-27 18:49:07', 'G799');
INSERT INTO `comuni` VALUES ('069069', 'Pretoro', '069', NULL, '2023-02-27 18:49:07', 'H052');
INSERT INTO `comuni` VALUES ('069070', 'Quadri', '069', NULL, '2023-02-27 18:49:07', 'H098');
INSERT INTO `comuni` VALUES ('069071', 'Rapino', '069', NULL, '2023-02-27 18:49:07', 'H184');
INSERT INTO `comuni` VALUES ('069072', 'Ripa Teatina', '069', NULL, '2023-02-27 18:49:07', 'H320');
INSERT INTO `comuni` VALUES ('069073', 'Roccamontepiano', '069', NULL, '2023-02-27 18:49:07', 'H424');
INSERT INTO `comuni` VALUES ('069074', 'Rocca San Giovanni', '069', NULL, '2023-02-27 18:49:07', 'H439');
INSERT INTO `comuni` VALUES ('069075', 'Roccascalegna', '069', NULL, '2023-02-27 18:49:07', 'H442');
INSERT INTO `comuni` VALUES ('069076', 'Roccaspinalveti', '069', NULL, '2023-02-27 18:49:07', 'H448');
INSERT INTO `comuni` VALUES ('069077', 'Roio del Sangro', '069', NULL, '2023-02-27 18:49:07', 'H495');
INSERT INTO `comuni` VALUES ('069078', 'Rosello', '069', NULL, '2023-02-27 18:49:07', 'H566');
INSERT INTO `comuni` VALUES ('069079', 'San Buono', '069', NULL, '2023-02-27 18:49:07', 'H784');
INSERT INTO `comuni` VALUES ('069080', 'San Giovanni Lipioni', '069', NULL, '2023-02-27 18:49:07', 'H923');
INSERT INTO `comuni` VALUES ('069081', 'San Giovanni Teatino', '069', NULL, '2023-02-27 18:49:07', 'D690');
INSERT INTO `comuni` VALUES ('069082', 'San Martino sulla Marrucina', '069', NULL, '2023-02-27 18:49:07', 'H991');
INSERT INTO `comuni` VALUES ('069083', 'San Salvo', '069', NULL, '2023-02-27 18:49:07', 'I148');
INSERT INTO `comuni` VALUES ('069084', 'Santa Maria Imbaro', '069', NULL, '2023-02-27 18:49:07', 'I244');
INSERT INTO `comuni` VALUES ('069085', 'Sant\'Eusanio del Sangro', '069', NULL, '2023-02-27 18:49:07', 'I335');
INSERT INTO `comuni` VALUES ('069086', 'San Vito Chietino', '069', NULL, '2023-02-27 18:49:07', 'I394');
INSERT INTO `comuni` VALUES ('069087', 'Scerni', '069', NULL, '2023-02-27 18:49:07', 'I520');
INSERT INTO `comuni` VALUES ('069088', 'Schiavi di Abruzzo', '069', NULL, '2023-02-27 18:49:07', 'I526');
INSERT INTO `comuni` VALUES ('069089', 'Taranta Peligna', '069', NULL, '2023-02-27 18:49:07', 'L047');
INSERT INTO `comuni` VALUES ('069090', 'Tollo', '069', NULL, '2023-02-27 18:49:07', 'L194');
INSERT INTO `comuni` VALUES ('069091', 'Torino di Sangro', '069', NULL, '2023-02-27 18:49:07', 'L218');
INSERT INTO `comuni` VALUES ('069092', 'Tornareccio', '069', NULL, '2023-02-27 18:49:07', 'L224');
INSERT INTO `comuni` VALUES ('069093', 'Torrebruna', '069', NULL, '2023-02-27 18:49:07', 'L253');
INSERT INTO `comuni` VALUES ('069094', 'Torrevecchia Teatina', '069', NULL, '2023-02-27 18:49:07', 'L284');
INSERT INTO `comuni` VALUES ('069095', 'Torricella Peligna', '069', NULL, '2023-02-27 18:49:07', 'L291');
INSERT INTO `comuni` VALUES ('069096', 'Treglio', '069', NULL, '2023-02-27 18:49:07', 'L363');
INSERT INTO `comuni` VALUES ('069097', 'Tufillo', '069', NULL, '2023-02-27 18:49:07', 'L459');
INSERT INTO `comuni` VALUES ('069098', 'Vacri', '069', NULL, '2023-02-27 18:49:07', 'L526');
INSERT INTO `comuni` VALUES ('069099', 'Vasto', '069', NULL, '2023-02-27 18:49:07', 'E372');
INSERT INTO `comuni` VALUES ('069100', 'Villalfonsina', '069', NULL, '2023-02-27 18:49:07', 'L961');
INSERT INTO `comuni` VALUES ('069101', 'Villamagna', '069', NULL, '2023-02-27 18:49:07', 'L964');
INSERT INTO `comuni` VALUES ('069102', 'Villa Santa Maria', '069', NULL, '2023-02-27 18:49:07', 'M022');
INSERT INTO `comuni` VALUES ('069103', 'Pietraferrazzana', '069', NULL, '2023-02-27 18:49:07', 'G613');
INSERT INTO `comuni` VALUES ('069104', 'Fallo', '069', NULL, '2023-02-27 18:49:07', 'D480');
INSERT INTO `comuni` VALUES ('070001', 'Acquaviva Collecroce', '070', NULL, '2023-02-27 18:49:07', 'A050');
INSERT INTO `comuni` VALUES ('070002', 'Baranello', '070', NULL, '2023-02-27 18:49:07', 'A616');
INSERT INTO `comuni` VALUES ('070003', 'Bojano', '070', NULL, '2023-02-27 18:49:07', 'A930');
INSERT INTO `comuni` VALUES ('070004', 'Bonefro', '070', NULL, '2023-02-27 18:49:07', 'A971');
INSERT INTO `comuni` VALUES ('070005', 'Busso', '070', NULL, '2023-02-27 18:49:07', 'B295');
INSERT INTO `comuni` VALUES ('070006', 'Campobasso', '070', NULL, '2023-02-27 18:49:07', 'B519');
INSERT INTO `comuni` VALUES ('070007', 'Campochiaro', '070', NULL, '2023-02-27 18:49:07', 'B522');
INSERT INTO `comuni` VALUES ('070008', 'Campodipietra', '070', NULL, '2023-02-27 18:49:07', 'B528');
INSERT INTO `comuni` VALUES ('070009', 'Campolieto', '070', NULL, '2023-02-27 18:49:07', 'B544');
INSERT INTO `comuni` VALUES ('070010', 'Campomarino', '070', NULL, '2023-02-27 18:49:07', 'B550');
INSERT INTO `comuni` VALUES ('070011', 'Casacalenda', '070', NULL, '2023-02-27 18:49:07', 'B858');
INSERT INTO `comuni` VALUES ('070012', 'Casalciprano', '070', NULL, '2023-02-27 18:49:07', 'B871');
INSERT INTO `comuni` VALUES ('070013', 'Castelbottaccio', '070', NULL, '2023-02-27 18:49:07', 'C066');
INSERT INTO `comuni` VALUES ('070014', 'Castellino del Biferno', '070', NULL, '2023-02-27 18:49:07', 'C175');
INSERT INTO `comuni` VALUES ('070015', 'Castelmauro', '070', NULL, '2023-02-27 18:49:07', 'C197');
INSERT INTO `comuni` VALUES ('070016', 'Castropignano', '070', NULL, '2023-02-27 18:49:07', 'C346');
INSERT INTO `comuni` VALUES ('070017', 'Cercemaggiore', '070', NULL, '2023-02-27 18:49:07', 'C486');
INSERT INTO `comuni` VALUES ('070018', 'Cercepiccola', '070', NULL, '2023-02-27 18:49:07', 'C488');
INSERT INTO `comuni` VALUES ('070019', 'Civitacampomarano', '070', NULL, '2023-02-27 18:49:07', 'C764');
INSERT INTO `comuni` VALUES ('070020', 'Colle d\'Anchise', '070', NULL, '2023-02-27 18:49:07', 'C854');
INSERT INTO `comuni` VALUES ('070021', 'Colletorto', '070', NULL, '2023-02-27 18:49:07', 'C875');
INSERT INTO `comuni` VALUES ('070022', 'Duronia', '070', NULL, '2023-02-27 18:49:07', 'C772');
INSERT INTO `comuni` VALUES ('070023', 'Ferrazzano', '070', NULL, '2023-02-27 18:49:07', 'D550');
INSERT INTO `comuni` VALUES ('070024', 'Fossalto', '070', NULL, '2023-02-27 18:49:07', 'D737');
INSERT INTO `comuni` VALUES ('070025', 'Gambatesa', '070', NULL, '2023-02-27 18:49:07', 'D896');
INSERT INTO `comuni` VALUES ('070026', 'Gildone', '070', NULL, '2023-02-27 18:49:07', 'E030');
INSERT INTO `comuni` VALUES ('070027', 'Guardialfiera', '070', NULL, '2023-02-27 18:49:07', 'E244');
INSERT INTO `comuni` VALUES ('070028', 'Guardiaregia', '070', NULL, '2023-02-27 18:49:07', 'E248');
INSERT INTO `comuni` VALUES ('070029', 'Guglionesi', '070', NULL, '2023-02-27 18:49:07', 'E259');
INSERT INTO `comuni` VALUES ('070030', 'Jelsi', '070', NULL, '2023-02-27 18:49:07', 'E381');
INSERT INTO `comuni` VALUES ('070031', 'Larino', '070', NULL, '2023-02-27 18:49:07', 'E456');
INSERT INTO `comuni` VALUES ('070032', 'Limosano', '070', NULL, '2023-02-27 18:49:07', 'E599');
INSERT INTO `comuni` VALUES ('070033', 'Lucito', '070', NULL, '2023-02-27 18:49:07', 'E722');
INSERT INTO `comuni` VALUES ('070034', 'Lupara', '070', NULL, '2023-02-27 18:49:07', 'E748');
INSERT INTO `comuni` VALUES ('070035', 'Macchia Valfortore', '070', NULL, '2023-02-27 18:49:07', 'E780');
INSERT INTO `comuni` VALUES ('070036', 'Mafalda', '070', NULL, '2023-02-27 18:49:07', 'E799');
INSERT INTO `comuni` VALUES ('070037', 'Matrice', '070', NULL, '2023-02-27 18:49:07', 'F055');
INSERT INTO `comuni` VALUES ('070038', 'Mirabello Sannitico', '070', NULL, '2023-02-27 18:49:07', 'F233');
INSERT INTO `comuni` VALUES ('070039', 'Molise', '070', NULL, '2023-02-27 18:49:07', 'F294');
INSERT INTO `comuni` VALUES ('070040', 'Monacilioni', '070', NULL, '2023-02-27 18:49:07', 'F322');
INSERT INTO `comuni` VALUES ('070041', 'Montagano', '070', NULL, '2023-02-27 18:49:07', 'F391');
INSERT INTO `comuni` VALUES ('070042', 'Montecilfone', '070', NULL, '2023-02-27 18:49:07', 'F475');
INSERT INTO `comuni` VALUES ('070043', 'Montefalcone nel Sannio', '070', NULL, '2023-02-27 18:49:07', 'F495');
INSERT INTO `comuni` VALUES ('070044', 'Montelongo', '070', NULL, '2023-02-27 18:49:07', 'F548');
INSERT INTO `comuni` VALUES ('070045', 'Montemitro', '070', NULL, '2023-02-27 18:49:07', 'F569');
INSERT INTO `comuni` VALUES ('070046', 'Montenero di Bisaccia', '070', NULL, '2023-02-27 18:49:07', 'F576');
INSERT INTO `comuni` VALUES ('070047', 'Montorio nei Frentani', '070', NULL, '2023-02-27 18:49:07', 'F689');
INSERT INTO `comuni` VALUES ('070048', 'Morrone del Sannio', '070', NULL, '2023-02-27 18:49:07', 'F748');
INSERT INTO `comuni` VALUES ('070049', 'Oratino', '070', NULL, '2023-02-27 18:49:07', 'G086');
INSERT INTO `comuni` VALUES ('070050', 'Palata', '070', NULL, '2023-02-27 18:49:07', 'G257');
INSERT INTO `comuni` VALUES ('070051', 'Petacciato', '070', NULL, '2023-02-27 18:49:07', 'G506');
INSERT INTO `comuni` VALUES ('070052', 'Petrella Tifernina', '070', NULL, '2023-02-27 18:49:07', 'G512');
INSERT INTO `comuni` VALUES ('070053', 'Pietracatella', '070', NULL, '2023-02-27 18:49:07', 'G609');
INSERT INTO `comuni` VALUES ('070054', 'Pietracupa', '070', NULL, '2023-02-27 18:49:07', 'G610');
INSERT INTO `comuni` VALUES ('070055', 'Portocannone', '070', NULL, '2023-02-27 18:49:07', 'G910');
INSERT INTO `comuni` VALUES ('070056', 'Provvidenti', '070', NULL, '2023-02-27 18:49:07', 'H083');
INSERT INTO `comuni` VALUES ('070057', 'Riccia', '070', NULL, '2023-02-27 18:49:07', 'H273');
INSERT INTO `comuni` VALUES ('070058', 'Ripabottoni', '070', NULL, '2023-02-27 18:49:07', 'H311');
INSERT INTO `comuni` VALUES ('070059', 'Ripalimosani', '070', NULL, '2023-02-27 18:49:07', 'H313');
INSERT INTO `comuni` VALUES ('070060', 'Roccavivara', '070', NULL, '2023-02-27 18:49:07', 'H454');
INSERT INTO `comuni` VALUES ('070061', 'Rotello', '070', NULL, '2023-02-27 18:49:07', 'H589');
INSERT INTO `comuni` VALUES ('070062', 'Salcito', '070', NULL, '2023-02-27 18:49:07', 'H693');
INSERT INTO `comuni` VALUES ('070063', 'San Biase', '070', NULL, '2023-02-27 18:49:07', 'H782');
INSERT INTO `comuni` VALUES ('070064', 'San Felice del Molise', '070', NULL, '2023-02-27 18:49:07', 'H833');
INSERT INTO `comuni` VALUES ('070065', 'San Giacomo degli Schiavoni', '070', NULL, '2023-02-27 18:49:07', 'H867');
INSERT INTO `comuni` VALUES ('070066', 'San Giovanni in Galdo', '070', NULL, '2023-02-27 18:49:07', 'H920');
INSERT INTO `comuni` VALUES ('070067', 'San Giuliano del Sannio', '070', NULL, '2023-02-27 18:49:07', 'H928');
INSERT INTO `comuni` VALUES ('070068', 'San Giuliano di Puglia', '070', NULL, '2023-02-27 18:49:07', 'H929');
INSERT INTO `comuni` VALUES ('070069', 'San Martino in Pensilis', '070', NULL, '2023-02-27 18:49:07', 'H990');
INSERT INTO `comuni` VALUES ('070070', 'San Massimo', '070', NULL, '2023-02-27 18:49:07', 'I023');
INSERT INTO `comuni` VALUES ('070071', 'San Polo Matese', '070', NULL, '2023-02-27 18:49:07', 'I122');
INSERT INTO `comuni` VALUES ('070072', 'Santa Croce di Magliano', '070', NULL, '2023-02-27 18:49:07', 'I181');
INSERT INTO `comuni` VALUES ('070073', 'Sant\'Angelo Limosano', '070', NULL, '2023-02-27 18:49:07', 'I289');
INSERT INTO `comuni` VALUES ('070074', 'Sant\'Elia a Pianisi', '070', NULL, '2023-02-27 18:49:07', 'I320');
INSERT INTO `comuni` VALUES ('070075', 'Sepino', '070', NULL, '2023-02-27 18:49:07', 'I618');
INSERT INTO `comuni` VALUES ('070076', 'Spinete', '070', NULL, '2023-02-27 18:49:07', 'I910');
INSERT INTO `comuni` VALUES ('070077', 'Tavenna', '070', NULL, '2023-02-27 18:49:07', 'L069');
INSERT INTO `comuni` VALUES ('070078', 'Termoli', '070', NULL, '2023-02-27 18:49:07', 'L113');
INSERT INTO `comuni` VALUES ('070079', 'Torella del Sannio', '070', NULL, '2023-02-27 18:49:07', 'L215');
INSERT INTO `comuni` VALUES ('070080', 'Toro', '070', NULL, '2023-02-27 18:49:07', 'L230');
INSERT INTO `comuni` VALUES ('070081', 'Trivento', '070', NULL, '2023-02-27 18:49:07', 'L435');
INSERT INTO `comuni` VALUES ('070082', 'Tufara', '070', NULL, '2023-02-27 18:49:07', 'L458');
INSERT INTO `comuni` VALUES ('070083', 'Ururi', '070', NULL, '2023-02-27 18:49:07', 'L505');
INSERT INTO `comuni` VALUES ('070084', 'Vinchiaturo', '070', NULL, '2023-02-27 18:49:07', 'M057');
INSERT INTO `comuni` VALUES ('071001', 'Accadia', '071', NULL, '2023-02-27 18:49:07', 'A015');
INSERT INTO `comuni` VALUES ('071002', 'Alberona', '071', NULL, '2023-02-27 18:49:07', 'A150');
INSERT INTO `comuni` VALUES ('071003', 'Anzano di Puglia', '071', NULL, '2023-02-27 18:49:07', 'A320');
INSERT INTO `comuni` VALUES ('071004', 'Apricena', '071', NULL, '2023-02-27 18:49:07', 'A339');
INSERT INTO `comuni` VALUES ('071005', 'Ascoli Satriano', '071', NULL, '2023-02-27 18:49:07', 'A463');
INSERT INTO `comuni` VALUES ('071006', 'Biccari', '071', NULL, '2023-02-27 18:49:07', 'A854');
INSERT INTO `comuni` VALUES ('071007', 'Bovino', '071', NULL, '2023-02-27 18:49:07', 'B104');
INSERT INTO `comuni` VALUES ('071008', 'Cagnano Varano', '071', NULL, '2023-02-27 18:49:07', 'B357');
INSERT INTO `comuni` VALUES ('071009', 'Candela', '071', NULL, '2023-02-27 18:49:07', 'B584');
INSERT INTO `comuni` VALUES ('071010', 'Carapelle', '071', NULL, '2023-02-27 18:49:07', 'B724');
INSERT INTO `comuni` VALUES ('071011', 'Carlantino', '071', NULL, '2023-02-27 18:49:07', 'B784');
INSERT INTO `comuni` VALUES ('071012', 'Carpino', '071', NULL, '2023-02-27 18:49:07', 'B829');
INSERT INTO `comuni` VALUES ('071013', 'Casalnuovo Monterotaro', '071', NULL, '2023-02-27 18:49:07', 'B904');
INSERT INTO `comuni` VALUES ('071014', 'Casalvecchio di Puglia', '071', NULL, '2023-02-27 18:49:07', 'B917');
INSERT INTO `comuni` VALUES ('071015', 'Castelluccio dei Sauri', '071', NULL, '2023-02-27 18:49:07', 'C198');
INSERT INTO `comuni` VALUES ('071016', 'Castelluccio Valmaggiore', '071', NULL, '2023-02-27 18:49:07', 'C202');
INSERT INTO `comuni` VALUES ('071017', 'Castelnuovo della Daunia', '071', NULL, '2023-02-27 18:49:07', 'C222');
INSERT INTO `comuni` VALUES ('071018', 'Celenza Valfortore', '071', NULL, '2023-02-27 18:49:07', 'C429');
INSERT INTO `comuni` VALUES ('071019', 'Celle di San Vito', '071', NULL, '2023-02-27 18:49:07', 'C442');
INSERT INTO `comuni` VALUES ('071020', 'Cerignola', '071', NULL, '2023-02-27 18:49:07', 'C514');
INSERT INTO `comuni` VALUES ('071021', 'Chieuti', '071', NULL, '2023-02-27 18:49:07', 'C633');
INSERT INTO `comuni` VALUES ('071022', 'Deliceto', '071', NULL, '2023-02-27 18:49:07', 'D269');
INSERT INTO `comuni` VALUES ('071023', 'Faeto', '071', NULL, '2023-02-27 18:49:07', 'D459');
INSERT INTO `comuni` VALUES ('071024', 'Foggia', '071', NULL, '2023-02-27 18:49:07', 'D643');
INSERT INTO `comuni` VALUES ('071025', 'Ischitella', '071', NULL, '2023-02-27 18:49:07', 'E332');
INSERT INTO `comuni` VALUES ('071026', 'Isole Tremiti', '071', NULL, '2023-02-27 18:49:07', 'E363');
INSERT INTO `comuni` VALUES ('071027', 'Lesina', '071', NULL, '2023-02-27 18:49:07', 'E549');
INSERT INTO `comuni` VALUES ('071028', 'Lucera', '071', NULL, '2023-02-27 18:49:07', 'E716');
INSERT INTO `comuni` VALUES ('071029', 'Manfredonia', '071', NULL, '2023-02-27 18:49:07', 'E885');
INSERT INTO `comuni` VALUES ('071031', 'Mattinata', '071', NULL, '2023-02-27 18:49:07', 'F059');
INSERT INTO `comuni` VALUES ('071032', 'Monteleone di Puglia', '071', NULL, '2023-02-27 18:49:07', 'F538');
INSERT INTO `comuni` VALUES ('071033', 'Monte Sant\'Angelo', '071', NULL, '2023-02-27 18:49:07', 'F631');
INSERT INTO `comuni` VALUES ('071034', 'Motta Montecorvino', '071', NULL, '2023-02-27 18:49:07', 'F777');
INSERT INTO `comuni` VALUES ('071035', 'Orsara di Puglia', '071', NULL, '2023-02-27 18:49:07', 'G125');
INSERT INTO `comuni` VALUES ('071036', 'Orta Nova', '071', NULL, '2023-02-27 18:49:07', 'G131');
INSERT INTO `comuni` VALUES ('071037', 'Panni', '071', NULL, '2023-02-27 18:49:07', 'G312');
INSERT INTO `comuni` VALUES ('071038', 'Peschici', '071', NULL, '2023-02-27 18:49:07', 'G487');
INSERT INTO `comuni` VALUES ('071039', 'Pietramontecorvino', '071', NULL, '2023-02-27 18:49:07', 'G604');
INSERT INTO `comuni` VALUES ('071040', 'Poggio Imperiale', '071', NULL, '2023-02-27 18:49:07', 'G761');
INSERT INTO `comuni` VALUES ('071041', 'Rignano Garganico', '071', NULL, '2023-02-27 18:49:07', 'H287');
INSERT INTO `comuni` VALUES ('071042', 'Rocchetta Sant\'Antonio', '071', NULL, '2023-02-27 18:49:07', 'H467');
INSERT INTO `comuni` VALUES ('071043', 'Rodi Garganico', '071', NULL, '2023-02-27 18:49:07', 'H480');
INSERT INTO `comuni` VALUES ('071044', 'Roseto Valfortore', '071', NULL, '2023-02-27 18:49:07', 'H568');
INSERT INTO `comuni` VALUES ('071046', 'San Giovanni Rotondo', '071', NULL, '2023-02-27 18:49:07', 'H926');
INSERT INTO `comuni` VALUES ('071047', 'San Marco in Lamis', '071', NULL, '2023-02-27 18:49:07', 'H985');
INSERT INTO `comuni` VALUES ('071048', 'San Marco la Catola', '071', NULL, '2023-02-27 18:49:07', 'H986');
INSERT INTO `comuni` VALUES ('071049', 'San Nicandro Garganico', '071', NULL, '2023-02-27 18:49:07', 'I054');
INSERT INTO `comuni` VALUES ('071050', 'San Paolo di Civitate', '071', NULL, '2023-02-27 18:49:07', 'I072');
INSERT INTO `comuni` VALUES ('071051', 'San Severo', '071', NULL, '2023-02-27 18:49:07', 'I158');
INSERT INTO `comuni` VALUES ('071052', 'Sant\'Agata di Puglia', '071', NULL, '2023-02-27 18:49:07', 'I193');
INSERT INTO `comuni` VALUES ('071053', 'Serracapriola', '071', NULL, '2023-02-27 18:49:07', 'I641');
INSERT INTO `comuni` VALUES ('071054', 'Stornara', '071', NULL, '2023-02-27 18:49:07', 'I962');
INSERT INTO `comuni` VALUES ('071055', 'Stornarella', '071', NULL, '2023-02-27 18:49:07', 'I963');
INSERT INTO `comuni` VALUES ('071056', 'Torremaggiore', '071', NULL, '2023-02-27 18:49:07', 'L273');
INSERT INTO `comuni` VALUES ('071058', 'Troia', '071', NULL, '2023-02-27 18:49:07', 'L447');
INSERT INTO `comuni` VALUES ('071059', 'Vico del Gargano', '071', NULL, '2023-02-27 18:49:07', 'L842');
INSERT INTO `comuni` VALUES ('071060', 'Vieste', '071', NULL, '2023-02-27 18:49:07', 'L858');
INSERT INTO `comuni` VALUES ('071061', 'Volturara Appula', '071', NULL, '2023-02-27 18:49:07', 'M131');
INSERT INTO `comuni` VALUES ('071062', 'Volturino', '071', NULL, '2023-02-27 18:49:07', 'M132');
INSERT INTO `comuni` VALUES ('071063', 'Ordona', '071', NULL, '2023-02-27 18:49:07', 'M266');
INSERT INTO `comuni` VALUES ('071064', 'Zapponeta', '071', NULL, '2023-02-27 18:49:07', 'M267');
INSERT INTO `comuni` VALUES ('072001', 'Acquaviva delle Fonti', '072', NULL, '2023-02-27 18:49:07', 'A048');
INSERT INTO `comuni` VALUES ('072002', 'Adelfia', '072', NULL, '2023-02-27 18:49:07', 'A055');
INSERT INTO `comuni` VALUES ('072003', 'Alberobello', '072', NULL, '2023-02-27 18:49:07', 'A149');
INSERT INTO `comuni` VALUES ('072004', 'Altamura', '072', NULL, '2023-02-27 18:49:07', 'A225');
INSERT INTO `comuni` VALUES ('072006', 'Bari', '072', NULL, '2023-02-27 18:49:07', 'A662');
INSERT INTO `comuni` VALUES ('072008', 'Binetto', '072', NULL, '2023-02-27 18:49:07', 'A874');
INSERT INTO `comuni` VALUES ('072010', 'Bitetto', '072', NULL, '2023-02-27 18:49:07', 'A892');
INSERT INTO `comuni` VALUES ('072011', 'Bitonto', '072', NULL, '2023-02-27 18:49:07', 'A893');
INSERT INTO `comuni` VALUES ('072012', 'Bitritto', '072', NULL, '2023-02-27 18:49:07', 'A894');
INSERT INTO `comuni` VALUES ('072014', 'Capurso', '072', NULL, '2023-02-27 18:49:07', 'B716');
INSERT INTO `comuni` VALUES ('072015', 'Casamassima', '072', NULL, '2023-02-27 18:49:07', 'B923');
INSERT INTO `comuni` VALUES ('072016', 'Cassano delle Murge', '072', NULL, '2023-02-27 18:49:07', 'B998');
INSERT INTO `comuni` VALUES ('072017', 'Castellana Grotte', '072', NULL, '2023-02-27 18:49:07', 'C134');
INSERT INTO `comuni` VALUES ('072018', 'Cellamare', '072', NULL, '2023-02-27 18:49:07', 'C436');
INSERT INTO `comuni` VALUES ('072019', 'Conversano', '072', NULL, '2023-02-27 18:49:07', 'C975');
INSERT INTO `comuni` VALUES ('072020', 'Corato', '072', NULL, '2023-02-27 18:49:07', 'C983');
INSERT INTO `comuni` VALUES ('072021', 'Gioia del Colle', '072', NULL, '2023-02-27 18:49:07', 'E038');
INSERT INTO `comuni` VALUES ('072022', 'Giovinazzo', '072', NULL, '2023-02-27 18:49:07', 'E047');
INSERT INTO `comuni` VALUES ('072023', 'Gravina in Puglia', '072', NULL, '2023-02-27 18:49:07', 'E155');
INSERT INTO `comuni` VALUES ('072024', 'Grumo Appula', '072', NULL, '2023-02-27 18:49:07', 'E223');
INSERT INTO `comuni` VALUES ('072025', 'Locorotondo', '072', NULL, '2023-02-27 18:49:07', 'E645');
INSERT INTO `comuni` VALUES ('072027', 'Modugno', '072', NULL, '2023-02-27 18:49:07', 'F262');
INSERT INTO `comuni` VALUES ('072028', 'Mola di Bari', '072', NULL, '2023-02-27 18:49:07', 'F280');
INSERT INTO `comuni` VALUES ('072029', 'Molfetta', '072', NULL, '2023-02-27 18:49:07', 'F284');
INSERT INTO `comuni` VALUES ('072030', 'Monopoli', '072', NULL, '2023-02-27 18:49:07', 'F376');
INSERT INTO `comuni` VALUES ('072031', 'Noci', '072', NULL, '2023-02-27 18:49:07', 'F915');
INSERT INTO `comuni` VALUES ('072032', 'Noicattaro', '072', NULL, '2023-02-27 18:49:07', 'F923');
INSERT INTO `comuni` VALUES ('072033', 'Palo del Colle', '072', NULL, '2023-02-27 18:49:07', 'G291');
INSERT INTO `comuni` VALUES ('072034', 'Poggiorsini', '072', NULL, '2023-02-27 18:49:07', 'G769');
INSERT INTO `comuni` VALUES ('072035', 'Polignano a Mare', '072', NULL, '2023-02-27 18:49:07', 'G787');
INSERT INTO `comuni` VALUES ('072036', 'Putignano', '072', NULL, '2023-02-27 18:49:07', 'H096');
INSERT INTO `comuni` VALUES ('072037', 'Rutigliano', '072', NULL, '2023-02-27 18:49:07', 'H643');
INSERT INTO `comuni` VALUES ('072038', 'Ruvo di Puglia', '072', NULL, '2023-02-27 18:49:07', 'H645');
INSERT INTO `comuni` VALUES ('072039', 'Sammichele di Bari', '072', NULL, '2023-02-27 18:49:07', 'H749');
INSERT INTO `comuni` VALUES ('072040', 'Sannicandro di Bari', '072', NULL, '2023-02-27 18:49:07', 'I053');
INSERT INTO `comuni` VALUES ('072041', 'Santeramo in Colle', '072', NULL, '2023-02-27 18:49:07', 'I330');
INSERT INTO `comuni` VALUES ('072043', 'Terlizzi', '072', NULL, '2023-02-27 18:49:07', 'L109');
INSERT INTO `comuni` VALUES ('072044', 'Toritto', '072', NULL, '2023-02-27 18:49:07', 'L220');
INSERT INTO `comuni` VALUES ('072046', 'Triggiano', '072', NULL, '2023-02-27 18:49:07', 'L425');
INSERT INTO `comuni` VALUES ('072047', 'Turi', '072', NULL, '2023-02-27 18:49:07', 'L472');
INSERT INTO `comuni` VALUES ('072048', 'Valenzano', '072', NULL, '2023-02-27 18:49:07', 'L571');
INSERT INTO `comuni` VALUES ('073001', 'Avetrana', '073', NULL, '2023-02-27 18:49:07', 'A514');
INSERT INTO `comuni` VALUES ('073002', 'Carosino', '073', NULL, '2023-02-27 18:49:07', 'B808');
INSERT INTO `comuni` VALUES ('073003', 'Castellaneta', '073', NULL, '2023-02-27 18:49:07', 'C136');
INSERT INTO `comuni` VALUES ('073004', 'Crispiano', '073', NULL, '2023-02-27 18:49:07', 'D171');
INSERT INTO `comuni` VALUES ('073005', 'Faggiano', '073', NULL, '2023-02-27 18:49:07', 'D463');
INSERT INTO `comuni` VALUES ('073006', 'Fragagnano', '073', NULL, '2023-02-27 18:49:07', 'D754');
INSERT INTO `comuni` VALUES ('073007', 'Ginosa', '073', NULL, '2023-02-27 18:49:07', 'E036');
INSERT INTO `comuni` VALUES ('073008', 'Grottaglie', '073', NULL, '2023-02-27 18:49:07', 'E205');
INSERT INTO `comuni` VALUES ('073009', 'Laterza', '073', NULL, '2023-02-27 18:49:07', 'E469');
INSERT INTO `comuni` VALUES ('073010', 'Leporano', '073', NULL, '2023-02-27 18:49:07', 'E537');
INSERT INTO `comuni` VALUES ('073011', 'Lizzano', '073', NULL, '2023-02-27 18:49:07', 'E630');
INSERT INTO `comuni` VALUES ('073012', 'Manduria', '073', NULL, '2023-02-27 18:49:07', 'E882');
INSERT INTO `comuni` VALUES ('073013', 'Martina Franca', '073', NULL, '2023-02-27 18:49:07', 'E986');
INSERT INTO `comuni` VALUES ('073014', 'Maruggio', '073', NULL, '2023-02-27 18:49:07', 'E995');
INSERT INTO `comuni` VALUES ('073015', 'Massafra', '073', NULL, '2023-02-27 18:49:07', 'F027');
INSERT INTO `comuni` VALUES ('073016', 'Monteiasi', '073', NULL, '2023-02-27 18:49:07', 'F531');
INSERT INTO `comuni` VALUES ('073017', 'Montemesola', '073', NULL, '2023-02-27 18:49:07', 'F563');
INSERT INTO `comuni` VALUES ('073018', 'Monteparano', '073', NULL, '2023-02-27 18:49:07', 'F587');
INSERT INTO `comuni` VALUES ('073019', 'Mottola', '073', NULL, '2023-02-27 18:49:07', 'F784');
INSERT INTO `comuni` VALUES ('073020', 'Palagianello', '073', NULL, '2023-02-27 18:49:07', 'G251');
INSERT INTO `comuni` VALUES ('073021', 'Palagiano', '073', NULL, '2023-02-27 18:49:07', 'G252');
INSERT INTO `comuni` VALUES ('073022', 'Pulsano', '073', NULL, '2023-02-27 18:49:07', 'H090');
INSERT INTO `comuni` VALUES ('073023', 'Roccaforzata', '073', NULL, '2023-02-27 18:49:07', 'H409');
INSERT INTO `comuni` VALUES ('073024', 'San Giorgio Ionico', '073', NULL, '2023-02-27 18:49:07', 'H882');
INSERT INTO `comuni` VALUES ('073025', 'San Marzano di San Giuseppe', '073', NULL, '2023-02-27 18:49:07', 'I018');
INSERT INTO `comuni` VALUES ('073026', 'Sava', '073', NULL, '2023-02-27 18:49:07', 'I467');
INSERT INTO `comuni` VALUES ('073027', 'Taranto', '073', NULL, '2023-02-27 18:49:07', 'L049');
INSERT INTO `comuni` VALUES ('073028', 'Torricella', '073', NULL, '2023-02-27 18:49:07', 'L294');
INSERT INTO `comuni` VALUES ('073029', 'Statte', '073', NULL, '2023-02-27 18:49:07', 'M298');
INSERT INTO `comuni` VALUES ('074001', 'Brindisi', '074', NULL, '2023-02-27 18:49:07', 'B180');
INSERT INTO `comuni` VALUES ('074002', 'Carovigno', '074', NULL, '2023-02-27 18:49:07', 'B809');
INSERT INTO `comuni` VALUES ('074003', 'Ceglie Messapica', '074', NULL, '2023-02-27 18:49:07', 'C424');
INSERT INTO `comuni` VALUES ('074004', 'Cellino San Marco', '074', NULL, '2023-02-27 18:49:07', 'C448');
INSERT INTO `comuni` VALUES ('074005', 'Cisternino', '074', NULL, '2023-02-27 18:49:07', 'C741');
INSERT INTO `comuni` VALUES ('074006', 'Erchie', '074', NULL, '2023-02-27 18:49:07', 'D422');
INSERT INTO `comuni` VALUES ('074007', 'Fasano', '074', NULL, '2023-02-27 18:49:07', 'D508');
INSERT INTO `comuni` VALUES ('074008', 'Francavilla Fontana', '074', NULL, '2023-02-27 18:49:07', 'D761');
INSERT INTO `comuni` VALUES ('074009', 'Latiano', '074', NULL, '2023-02-27 18:49:07', 'E471');
INSERT INTO `comuni` VALUES ('074010', 'Mesagne', '074', NULL, '2023-02-27 18:49:07', 'F152');
INSERT INTO `comuni` VALUES ('074011', 'Oria', '074', NULL, '2023-02-27 18:49:07', 'G098');
INSERT INTO `comuni` VALUES ('074012', 'Ostuni', '074', NULL, '2023-02-27 18:49:07', 'G187');
INSERT INTO `comuni` VALUES ('074013', 'San Donaci', '074', NULL, '2023-02-27 18:49:07', 'H822');
INSERT INTO `comuni` VALUES ('074014', 'San Michele Salentino', '074', NULL, '2023-02-27 18:49:07', 'I045');
INSERT INTO `comuni` VALUES ('074015', 'San Pancrazio Salentino', '074', NULL, '2023-02-27 18:49:07', 'I066');
INSERT INTO `comuni` VALUES ('074016', 'San Pietro Vernotico', '074', NULL, '2023-02-27 18:49:07', 'I119');
INSERT INTO `comuni` VALUES ('074017', 'San Vito dei Normanni', '074', NULL, '2023-02-27 18:49:07', 'I396');
INSERT INTO `comuni` VALUES ('074018', 'Torchiarolo', '074', NULL, '2023-02-27 18:49:07', 'L213');
INSERT INTO `comuni` VALUES ('074019', 'Torre Santa Susanna', '074', NULL, '2023-02-27 18:49:07', 'L280');
INSERT INTO `comuni` VALUES ('074020', 'Villa Castelli', '074', NULL, '2023-02-27 18:49:07', 'L920');
INSERT INTO `comuni` VALUES ('075001', 'Acquarica del Capo', '075', NULL, '2023-02-27 18:49:07', 'A042');
INSERT INTO `comuni` VALUES ('075002', 'Alessano', '075', NULL, '2023-02-27 18:49:07', 'A184');
INSERT INTO `comuni` VALUES ('075003', 'Alezio', '075', NULL, '2023-02-27 18:49:07', 'A185');
INSERT INTO `comuni` VALUES ('075004', 'Alliste', '075', NULL, '2023-02-27 18:49:07', 'A208');
INSERT INTO `comuni` VALUES ('075005', 'Andrano', '075', NULL, '2023-02-27 18:49:07', 'A281');
INSERT INTO `comuni` VALUES ('075006', 'Aradeo', '075', NULL, '2023-02-27 18:49:07', 'A350');
INSERT INTO `comuni` VALUES ('075007', 'Arnesano', '075', NULL, '2023-02-27 18:49:07', 'A425');
INSERT INTO `comuni` VALUES ('075008', 'Bagnolo del Salento', '075', NULL, '2023-02-27 18:49:07', 'A572');
INSERT INTO `comuni` VALUES ('075009', 'Botrugno', '075', NULL, '2023-02-27 18:49:07', 'B086');
INSERT INTO `comuni` VALUES ('075010', 'Calimera', '075', NULL, '2023-02-27 18:49:07', 'B413');
INSERT INTO `comuni` VALUES ('075011', 'Campi Salentina', '075', NULL, '2023-02-27 18:49:07', 'B506');
INSERT INTO `comuni` VALUES ('075012', 'Cannole', '075', NULL, '2023-02-27 18:49:07', 'B616');
INSERT INTO `comuni` VALUES ('075013', 'Caprarica di Lecce', '075', NULL, '2023-02-27 18:49:07', 'B690');
INSERT INTO `comuni` VALUES ('075014', 'Carmiano', '075', NULL, '2023-02-27 18:49:07', 'B792');
INSERT INTO `comuni` VALUES ('075015', 'Carpignano Salentino', '075', NULL, '2023-02-27 18:49:07', 'B822');
INSERT INTO `comuni` VALUES ('075016', 'Casarano', '075', NULL, '2023-02-27 18:49:07', 'B936');
INSERT INTO `comuni` VALUES ('075017', 'Castri di Lecce', '075', NULL, '2023-02-27 18:49:07', 'C334');
INSERT INTO `comuni` VALUES ('075018', 'Castrignano de\' Greci', '075', NULL, '2023-02-27 18:49:07', 'C335');
INSERT INTO `comuni` VALUES ('075019', 'Castrignano del Capo', '075', NULL, '2023-02-27 18:49:07', 'C336');
INSERT INTO `comuni` VALUES ('075020', 'Cavallino', '075', NULL, '2023-02-27 18:49:07', 'C377');
INSERT INTO `comuni` VALUES ('075021', 'Collepasso', '075', NULL, '2023-02-27 18:49:07', 'C865');
INSERT INTO `comuni` VALUES ('075022', 'Copertino', '075', NULL, '2023-02-27 18:49:07', 'C978');
INSERT INTO `comuni` VALUES ('075023', 'Corigliano d\'Otranto', '075', NULL, '2023-02-27 18:49:07', 'D006');
INSERT INTO `comuni` VALUES ('075024', 'Corsano', '075', NULL, '2023-02-27 18:49:07', 'D044');
INSERT INTO `comuni` VALUES ('075025', 'Cursi', '075', NULL, '2023-02-27 18:49:07', 'D223');
INSERT INTO `comuni` VALUES ('075026', 'Cutrofiano', '075', NULL, '2023-02-27 18:49:07', 'D237');
INSERT INTO `comuni` VALUES ('075027', 'Diso', '075', NULL, '2023-02-27 18:49:07', 'D305');
INSERT INTO `comuni` VALUES ('075028', 'Gagliano del Capo', '075', NULL, '2023-02-27 18:49:07', 'D851');
INSERT INTO `comuni` VALUES ('075029', 'Galatina', '075', NULL, '2023-02-27 18:49:07', 'D862');
INSERT INTO `comuni` VALUES ('075030', 'Galatone', '075', NULL, '2023-02-27 18:49:07', 'D863');
INSERT INTO `comuni` VALUES ('075031', 'Gallipoli', '075', NULL, '2023-02-27 18:49:07', 'D883');
INSERT INTO `comuni` VALUES ('075032', 'Giuggianello', '075', NULL, '2023-02-27 18:49:07', 'E053');
INSERT INTO `comuni` VALUES ('075033', 'Giurdignano', '075', NULL, '2023-02-27 18:49:07', 'E061');
INSERT INTO `comuni` VALUES ('075034', 'Guagnano', '075', NULL, '2023-02-27 18:49:07', 'E227');
INSERT INTO `comuni` VALUES ('075035', 'Lecce', '075', NULL, '2023-02-27 18:49:07', 'E506');
INSERT INTO `comuni` VALUES ('075036', 'Lequile', '075', NULL, '2023-02-27 18:49:07', 'E538');
INSERT INTO `comuni` VALUES ('075037', 'Leverano', '075', NULL, '2023-02-27 18:49:07', 'E563');
INSERT INTO `comuni` VALUES ('075038', 'Lizzanello', '075', NULL, '2023-02-27 18:49:07', 'E629');
INSERT INTO `comuni` VALUES ('075039', 'Maglie', '075', NULL, '2023-02-27 18:49:07', 'E815');
INSERT INTO `comuni` VALUES ('075040', 'Martano', '075', NULL, '2023-02-27 18:49:07', 'E979');
INSERT INTO `comuni` VALUES ('075041', 'Martignano', '075', NULL, '2023-02-27 18:49:07', 'E984');
INSERT INTO `comuni` VALUES ('075042', 'Matino', '075', NULL, '2023-02-27 18:49:07', 'F054');
INSERT INTO `comuni` VALUES ('075043', 'Melendugno', '075', NULL, '2023-02-27 18:49:07', 'F101');
INSERT INTO `comuni` VALUES ('075044', 'Melissano', '075', NULL, '2023-02-27 18:49:07', 'F109');
INSERT INTO `comuni` VALUES ('075045', 'Melpignano', '075', NULL, '2023-02-27 18:49:07', 'F117');
INSERT INTO `comuni` VALUES ('075046', 'Miggiano', '075', NULL, '2023-02-27 18:49:07', 'F194');
INSERT INTO `comuni` VALUES ('075047', 'Minervino di Lecce', '075', NULL, '2023-02-27 18:49:07', 'F221');
INSERT INTO `comuni` VALUES ('075048', 'Monteroni di Lecce', '075', NULL, '2023-02-27 18:49:07', 'F604');
INSERT INTO `comuni` VALUES ('075049', 'Montesano Salentino', '075', NULL, '2023-02-27 18:49:07', 'F623');
INSERT INTO `comuni` VALUES ('075050', 'Morciano di Leuca', '075', NULL, '2023-02-27 18:49:07', 'F716');
INSERT INTO `comuni` VALUES ('075051', 'Muro Leccese', '075', NULL, '2023-02-27 18:49:07', 'F816');
INSERT INTO `comuni` VALUES ('075052', 'Nardò', '075', NULL, '2023-02-27 18:49:07', 'F842');
INSERT INTO `comuni` VALUES ('075053', 'Neviano', '075', NULL, '2023-02-27 18:49:07', 'F881');
INSERT INTO `comuni` VALUES ('075054', 'Nociglia', '075', NULL, '2023-02-27 18:49:07', 'F916');
INSERT INTO `comuni` VALUES ('075055', 'Novoli', '075', NULL, '2023-02-27 18:49:07', 'F970');
INSERT INTO `comuni` VALUES ('075056', 'Ortelle', '075', NULL, '2023-02-27 18:49:07', 'G136');
INSERT INTO `comuni` VALUES ('075057', 'Otranto', '075', NULL, '2023-02-27 18:49:07', 'G188');
INSERT INTO `comuni` VALUES ('075058', 'Palmariggi', '075', NULL, '2023-02-27 18:49:07', 'G285');
INSERT INTO `comuni` VALUES ('075059', 'Parabita', '075', NULL, '2023-02-27 18:49:07', 'G325');
INSERT INTO `comuni` VALUES ('075060', 'Patù', '075', NULL, '2023-02-27 18:49:07', 'G378');
INSERT INTO `comuni` VALUES ('075061', 'Poggiardo', '075', NULL, '2023-02-27 18:49:07', 'G751');
INSERT INTO `comuni` VALUES ('075062', 'Presicce', '075', NULL, '2023-02-27 18:49:07', 'H047');
INSERT INTO `comuni` VALUES ('075063', 'Racale', '075', NULL, '2023-02-27 18:49:07', 'H147');
INSERT INTO `comuni` VALUES ('075064', 'Ruffano', '075', NULL, '2023-02-27 18:49:07', 'H632');
INSERT INTO `comuni` VALUES ('075065', 'Salice Salentino', '075', NULL, '2023-02-27 18:49:07', 'H708');
INSERT INTO `comuni` VALUES ('075066', 'Salve', '075', NULL, '2023-02-27 18:49:07', 'H729');
INSERT INTO `comuni` VALUES ('075067', 'Sanarica', '075', NULL, '2023-02-27 18:49:07', 'H757');
INSERT INTO `comuni` VALUES ('075068', 'San Cesario di Lecce', '075', NULL, '2023-02-27 18:49:07', 'H793');
INSERT INTO `comuni` VALUES ('075069', 'San Donato di Lecce', '075', NULL, '2023-02-27 18:49:07', 'H826');
INSERT INTO `comuni` VALUES ('075070', 'Sannicola', '075', NULL, '2023-02-27 18:49:07', 'I059');
INSERT INTO `comuni` VALUES ('075071', 'San Pietro in Lama', '075', NULL, '2023-02-27 18:49:07', 'I115');
INSERT INTO `comuni` VALUES ('075072', 'Santa Cesarea Terme', '075', NULL, '2023-02-27 18:49:07', 'I172');
INSERT INTO `comuni` VALUES ('075073', 'Scorrano', '075', NULL, '2023-02-27 18:49:07', 'I549');
INSERT INTO `comuni` VALUES ('075074', 'Seclì', '075', NULL, '2023-02-27 18:49:07', 'I559');
INSERT INTO `comuni` VALUES ('075075', 'Sogliano Cavour', '075', NULL, '2023-02-27 18:49:07', 'I780');
INSERT INTO `comuni` VALUES ('075076', 'Soleto', '075', NULL, '2023-02-27 18:49:07', 'I800');
INSERT INTO `comuni` VALUES ('075077', 'Specchia', '075', NULL, '2023-02-27 18:49:07', 'I887');
INSERT INTO `comuni` VALUES ('075078', 'Spongano', '075', NULL, '2023-02-27 18:49:07', 'I923');
INSERT INTO `comuni` VALUES ('075079', 'Squinzano', '075', NULL, '2023-02-27 18:49:07', 'I930');
INSERT INTO `comuni` VALUES ('075080', 'Sternatia', '075', NULL, '2023-02-27 18:49:07', 'I950');
INSERT INTO `comuni` VALUES ('075081', 'Supersano', '075', NULL, '2023-02-27 18:49:07', 'L008');
INSERT INTO `comuni` VALUES ('075082', 'Surano', '075', NULL, '2023-02-27 18:49:07', 'L010');
INSERT INTO `comuni` VALUES ('075083', 'Surbo', '075', NULL, '2023-02-27 18:49:07', 'L011');
INSERT INTO `comuni` VALUES ('075084', 'Taurisano', '075', NULL, '2023-02-27 18:49:07', 'L064');
INSERT INTO `comuni` VALUES ('075085', 'Taviano', '075', NULL, '2023-02-27 18:49:07', 'L074');
INSERT INTO `comuni` VALUES ('075086', 'Tiggiano', '075', NULL, '2023-02-27 18:49:07', 'L166');
INSERT INTO `comuni` VALUES ('075087', 'Trepuzzi', '075', NULL, '2023-02-27 18:49:07', 'L383');
INSERT INTO `comuni` VALUES ('075088', 'Tricase', '075', NULL, '2023-02-27 18:49:07', 'L419');
INSERT INTO `comuni` VALUES ('075089', 'Tuglie', '075', NULL, '2023-02-27 18:49:07', 'L462');
INSERT INTO `comuni` VALUES ('075090', 'Ugento', '075', NULL, '2023-02-27 18:49:07', 'L484');
INSERT INTO `comuni` VALUES ('075091', 'Uggiano la Chiesa', '075', NULL, '2023-02-27 18:49:07', 'L485');
INSERT INTO `comuni` VALUES ('075092', 'Veglie', '075', NULL, '2023-02-27 18:49:07', 'L711');
INSERT INTO `comuni` VALUES ('075093', 'Vernole', '075', NULL, '2023-02-27 18:49:07', 'L776');
INSERT INTO `comuni` VALUES ('075094', 'Zollino', '075', NULL, '2023-02-27 18:49:07', 'M187');
INSERT INTO `comuni` VALUES ('075095', 'San Cassiano', '075', NULL, '2023-02-27 18:49:07', 'M264');
INSERT INTO `comuni` VALUES ('075096', 'Castro', '075', NULL, '2023-02-27 18:49:07', 'M261');
INSERT INTO `comuni` VALUES ('075097', 'Porto Cesareo', '075', NULL, '2023-02-27 18:49:07', 'M263');
INSERT INTO `comuni` VALUES ('076001', 'Abriola', '076', NULL, '2023-02-27 18:49:07', 'A013');
INSERT INTO `comuni` VALUES ('076002', 'Acerenza', '076', NULL, '2023-02-27 18:49:07', 'A020');
INSERT INTO `comuni` VALUES ('076003', 'Albano di Lucania', '076', NULL, '2023-02-27 18:49:07', 'A131');
INSERT INTO `comuni` VALUES ('076004', 'Anzi', '076', NULL, '2023-02-27 18:49:07', 'A321');
INSERT INTO `comuni` VALUES ('076005', 'Armento', '076', NULL, '2023-02-27 18:49:07', 'A415');
INSERT INTO `comuni` VALUES ('076006', 'Atella', '076', NULL, '2023-02-27 18:49:07', 'A482');
INSERT INTO `comuni` VALUES ('076007', 'Avigliano', '076', NULL, '2023-02-27 18:49:07', 'A519');
INSERT INTO `comuni` VALUES ('076008', 'Balvano', '076', NULL, '2023-02-27 18:49:07', 'A604');
INSERT INTO `comuni` VALUES ('076009', 'Banzi', '076', NULL, '2023-02-27 18:49:07', 'A612');
INSERT INTO `comuni` VALUES ('076010', 'Baragiano', '076', NULL, '2023-02-27 18:49:07', 'A615');
INSERT INTO `comuni` VALUES ('076011', 'Barile', '076', NULL, '2023-02-27 18:49:07', 'A666');
INSERT INTO `comuni` VALUES ('076012', 'Bella', '076', NULL, '2023-02-27 18:49:07', 'A743');
INSERT INTO `comuni` VALUES ('076013', 'Brienza', '076', NULL, '2023-02-27 18:49:07', 'B173');
INSERT INTO `comuni` VALUES ('076014', 'Brindisi Montagna', '076', NULL, '2023-02-27 18:49:07', 'B181');
INSERT INTO `comuni` VALUES ('076015', 'Calvello', '076', NULL, '2023-02-27 18:49:07', 'B440');
INSERT INTO `comuni` VALUES ('076016', 'Calvera', '076', NULL, '2023-02-27 18:49:07', 'B443');
INSERT INTO `comuni` VALUES ('076017', 'Campomaggiore', '076', NULL, '2023-02-27 18:49:07', 'B549');
INSERT INTO `comuni` VALUES ('076018', 'Cancellara', '076', NULL, '2023-02-27 18:49:07', 'B580');
INSERT INTO `comuni` VALUES ('076019', 'Carbone', '076', NULL, '2023-02-27 18:49:07', 'B743');
INSERT INTO `comuni` VALUES ('076020', 'San Paolo Albanese', '076', NULL, '2023-02-27 18:49:07', 'B906');
INSERT INTO `comuni` VALUES ('076021', 'Castelgrande', '076', NULL, '2023-02-27 18:49:07', 'C120');
INSERT INTO `comuni` VALUES ('076022', 'Castelluccio Inferiore', '076', NULL, '2023-02-27 18:49:07', 'C199');
INSERT INTO `comuni` VALUES ('076023', 'Castelluccio Superiore', '076', NULL, '2023-02-27 18:49:07', 'C201');
INSERT INTO `comuni` VALUES ('076024', 'Castelmezzano', '076', NULL, '2023-02-27 18:49:07', 'C209');
INSERT INTO `comuni` VALUES ('076025', 'Castelsaraceno', '076', NULL, '2023-02-27 18:49:07', 'C271');
INSERT INTO `comuni` VALUES ('076026', 'Castronuovo di Sant\'Andrea', '076', NULL, '2023-02-27 18:49:07', 'C345');
INSERT INTO `comuni` VALUES ('076027', 'Cersosimo', '076', NULL, '2023-02-27 18:49:07', 'C539');
INSERT INTO `comuni` VALUES ('076028', 'Chiaromonte', '076', NULL, '2023-02-27 18:49:07', 'C619');
INSERT INTO `comuni` VALUES ('076029', 'Corleto Perticara', '076', NULL, '2023-02-27 18:49:07', 'D010');
INSERT INTO `comuni` VALUES ('076030', 'Episcopia', '076', NULL, '2023-02-27 18:49:07', 'D414');
INSERT INTO `comuni` VALUES ('076031', 'Fardella', '076', NULL, '2023-02-27 18:49:07', 'D497');
INSERT INTO `comuni` VALUES ('076032', 'Filiano', '076', NULL, '2023-02-27 18:49:07', 'D593');
INSERT INTO `comuni` VALUES ('076033', 'Forenza', '076', NULL, '2023-02-27 18:49:07', 'D696');
INSERT INTO `comuni` VALUES ('076034', 'Francavilla in Sinni', '076', NULL, '2023-02-27 18:49:07', 'D766');
INSERT INTO `comuni` VALUES ('076035', 'Gallicchio', '076', NULL, '2023-02-27 18:49:07', 'D876');
INSERT INTO `comuni` VALUES ('076036', 'Genzano di Lucania', '076', NULL, '2023-02-27 18:49:07', 'D971');
INSERT INTO `comuni` VALUES ('076037', 'Grumento Nova', '076', NULL, '2023-02-27 18:49:07', 'E221');
INSERT INTO `comuni` VALUES ('076038', 'Guardia Perticara', '076', NULL, '2023-02-27 18:49:07', 'E246');
INSERT INTO `comuni` VALUES ('076039', 'Lagonegro', '076', NULL, '2023-02-27 18:49:07', 'E409');
INSERT INTO `comuni` VALUES ('076040', 'Latronico', '076', NULL, '2023-02-27 18:49:07', 'E474');
INSERT INTO `comuni` VALUES ('076041', 'Laurenzana', '076', NULL, '2023-02-27 18:49:07', 'E482');
INSERT INTO `comuni` VALUES ('076042', 'Lauria', '076', NULL, '2023-02-27 18:49:07', 'E483');
INSERT INTO `comuni` VALUES ('076043', 'Lavello', '076', NULL, '2023-02-27 18:49:07', 'E493');
INSERT INTO `comuni` VALUES ('076044', 'Maratea', '076', NULL, '2023-02-27 18:49:07', 'E919');
INSERT INTO `comuni` VALUES ('076045', 'Marsico Nuovo', '076', NULL, '2023-02-27 18:49:07', 'E976');
INSERT INTO `comuni` VALUES ('076046', 'Marsicovetere', '076', NULL, '2023-02-27 18:49:07', 'E977');
INSERT INTO `comuni` VALUES ('076047', 'Maschito', '076', NULL, '2023-02-27 18:49:07', 'F006');
INSERT INTO `comuni` VALUES ('076048', 'Melfi', '076', NULL, '2023-02-27 18:49:07', 'F104');
INSERT INTO `comuni` VALUES ('076049', 'Missanello', '076', NULL, '2023-02-27 18:49:07', 'F249');
INSERT INTO `comuni` VALUES ('076050', 'Moliterno', '076', NULL, '2023-02-27 18:49:07', 'F295');
INSERT INTO `comuni` VALUES ('076051', 'Montemilone', '076', NULL, '2023-02-27 18:49:07', 'F568');
INSERT INTO `comuni` VALUES ('076052', 'Montemurro', '076', NULL, '2023-02-27 18:49:07', 'F573');
INSERT INTO `comuni` VALUES ('076053', 'Muro Lucano', '076', NULL, '2023-02-27 18:49:07', 'F817');
INSERT INTO `comuni` VALUES ('076054', 'Nemoli', '076', NULL, '2023-02-27 18:49:07', 'F866');
INSERT INTO `comuni` VALUES ('076055', 'Noepoli', '076', NULL, '2023-02-27 18:49:07', 'F917');
INSERT INTO `comuni` VALUES ('076056', 'Oppido Lucano', '076', NULL, '2023-02-27 18:49:07', 'G081');
INSERT INTO `comuni` VALUES ('076057', 'Palazzo San Gervasio', '076', NULL, '2023-02-27 18:49:07', 'G261');
INSERT INTO `comuni` VALUES ('076058', 'Pescopagano', '076', NULL, '2023-02-27 18:49:07', 'G496');
INSERT INTO `comuni` VALUES ('076059', 'Picerno', '076', NULL, '2023-02-27 18:49:07', 'G590');
INSERT INTO `comuni` VALUES ('076060', 'Pietragalla', '076', NULL, '2023-02-27 18:49:07', 'G616');
INSERT INTO `comuni` VALUES ('076061', 'Pietrapertosa', '076', NULL, '2023-02-27 18:49:07', 'G623');
INSERT INTO `comuni` VALUES ('076062', 'Pignola', '076', NULL, '2023-02-27 18:49:07', 'G663');
INSERT INTO `comuni` VALUES ('076063', 'Potenza', '076', NULL, '2023-02-27 18:49:07', 'G942');
INSERT INTO `comuni` VALUES ('076064', 'Rapolla', '076', NULL, '2023-02-27 18:49:07', 'H186');
INSERT INTO `comuni` VALUES ('076065', 'Rapone', '076', NULL, '2023-02-27 18:49:07', 'H187');
INSERT INTO `comuni` VALUES ('076066', 'Rionero in Vulture', '076', NULL, '2023-02-27 18:49:07', 'H307');
INSERT INTO `comuni` VALUES ('076067', 'Ripacandida', '076', NULL, '2023-02-27 18:49:07', 'H312');
INSERT INTO `comuni` VALUES ('076068', 'Rivello', '076', NULL, '2023-02-27 18:49:07', 'H348');
INSERT INTO `comuni` VALUES ('076069', 'Roccanova', '076', NULL, '2023-02-27 18:49:07', 'H426');
INSERT INTO `comuni` VALUES ('076070', 'Rotonda', '076', NULL, '2023-02-27 18:49:07', 'H590');
INSERT INTO `comuni` VALUES ('076071', 'Ruoti', '076', NULL, '2023-02-27 18:49:07', 'H641');
INSERT INTO `comuni` VALUES ('076072', 'Ruvo del Monte', '076', NULL, '2023-02-27 18:49:07', 'H646');
INSERT INTO `comuni` VALUES ('076073', 'San Chirico Nuovo', '076', NULL, '2023-02-27 18:49:07', 'H795');
INSERT INTO `comuni` VALUES ('076074', 'San Chirico Raparo', '076', NULL, '2023-02-27 18:49:07', 'H796');
INSERT INTO `comuni` VALUES ('076075', 'San Costantino Albanese', '076', NULL, '2023-02-27 18:49:07', 'H808');
INSERT INTO `comuni` VALUES ('076076', 'San Fele', '076', NULL, '2023-02-27 18:49:07', 'H831');
INSERT INTO `comuni` VALUES ('076077', 'San Martino d\'Agri', '076', NULL, '2023-02-27 18:49:07', 'H994');
INSERT INTO `comuni` VALUES ('076078', 'San Severino Lucano', '076', NULL, '2023-02-27 18:49:07', 'I157');
INSERT INTO `comuni` VALUES ('076079', 'Sant\'Angelo Le Fratte', '076', NULL, '2023-02-27 18:49:07', 'I288');
INSERT INTO `comuni` VALUES ('076080', 'Sant\'Arcangelo', '076', NULL, '2023-02-27 18:49:07', 'I305');
INSERT INTO `comuni` VALUES ('076081', 'Sarconi', '076', NULL, '2023-02-27 18:49:07', 'I426');
INSERT INTO `comuni` VALUES ('076082', 'Sasso di Castalda', '076', NULL, '2023-02-27 18:49:07', 'I457');
INSERT INTO `comuni` VALUES ('076083', 'Satriano di Lucania', '076', NULL, '2023-02-27 18:49:07', 'G614');
INSERT INTO `comuni` VALUES ('076084', 'Savoia di Lucania', '076', NULL, '2023-02-27 18:49:07', 'H730');
INSERT INTO `comuni` VALUES ('076085', 'Senise', '076', NULL, '2023-02-27 18:49:07', 'I610');
INSERT INTO `comuni` VALUES ('076086', 'Spinoso', '076', NULL, '2023-02-27 18:49:07', 'I917');
INSERT INTO `comuni` VALUES ('076087', 'Teana', '076', NULL, '2023-02-27 18:49:07', 'L082');
INSERT INTO `comuni` VALUES ('076088', 'Terranova di Pollino', '076', NULL, '2023-02-27 18:49:07', 'L126');
INSERT INTO `comuni` VALUES ('076089', 'Tito', '076', NULL, '2023-02-27 18:49:07', 'L181');
INSERT INTO `comuni` VALUES ('076090', 'Tolve', '076', NULL, '2023-02-27 18:49:07', 'L197');
INSERT INTO `comuni` VALUES ('076091', 'Tramutola', '076', NULL, '2023-02-27 18:49:07', 'L326');
INSERT INTO `comuni` VALUES ('076092', 'Trecchina', '076', NULL, '2023-02-27 18:49:07', 'L357');
INSERT INTO `comuni` VALUES ('076093', 'Trivigno', '076', NULL, '2023-02-27 18:49:07', 'L439');
INSERT INTO `comuni` VALUES ('076094', 'Vaglio Basilicata', '076', NULL, '2023-02-27 18:49:07', 'L532');
INSERT INTO `comuni` VALUES ('076095', 'Venosa', '076', NULL, '2023-02-27 18:49:07', 'L738');
INSERT INTO `comuni` VALUES ('076096', 'Vietri di Potenza', '076', NULL, '2023-02-27 18:49:07', 'L859');
INSERT INTO `comuni` VALUES ('076097', 'Viggianello', '076', NULL, '2023-02-27 18:49:07', 'L873');
INSERT INTO `comuni` VALUES ('076098', 'Viggiano', '076', NULL, '2023-02-27 18:49:07', 'L874');
INSERT INTO `comuni` VALUES ('076099', 'Ginestra', '076', NULL, '2023-02-27 18:49:07', 'E033');
INSERT INTO `comuni` VALUES ('076100', 'Paterno', '076', NULL, '2023-02-27 18:49:07', 'M269');
INSERT INTO `comuni` VALUES ('077001', 'Accettura', '077', NULL, '2023-02-27 18:49:07', 'A017');
INSERT INTO `comuni` VALUES ('077002', 'Aliano', '077', NULL, '2023-02-27 18:49:07', 'A196');
INSERT INTO `comuni` VALUES ('077003', 'Bernalda', '077', NULL, '2023-02-27 18:49:07', 'A801');
INSERT INTO `comuni` VALUES ('077004', 'Calciano', '077', NULL, '2023-02-27 18:49:07', 'B391');
INSERT INTO `comuni` VALUES ('077005', 'Cirigliano', '077', NULL, '2023-02-27 18:49:07', 'C723');
INSERT INTO `comuni` VALUES ('077006', 'Colobraro', '077', NULL, '2023-02-27 18:49:07', 'C888');
INSERT INTO `comuni` VALUES ('077007', 'Craco', '077', NULL, '2023-02-27 18:49:07', 'D128');
INSERT INTO `comuni` VALUES ('077008', 'Ferrandina', '077', NULL, '2023-02-27 18:49:07', 'D547');
INSERT INTO `comuni` VALUES ('077009', 'Garaguso', '077', NULL, '2023-02-27 18:49:07', 'D909');
INSERT INTO `comuni` VALUES ('077010', 'Gorgoglione', '077', NULL, '2023-02-27 18:49:07', 'E093');
INSERT INTO `comuni` VALUES ('077011', 'Grassano', '077', NULL, '2023-02-27 18:49:07', 'E147');
INSERT INTO `comuni` VALUES ('077012', 'Grottole', '077', NULL, '2023-02-27 18:49:07', 'E213');
INSERT INTO `comuni` VALUES ('077013', 'Irsina', '077', NULL, '2023-02-27 18:49:07', 'E326');
INSERT INTO `comuni` VALUES ('077014', 'Matera', '077', NULL, '2023-02-27 18:49:07', 'F052');
INSERT INTO `comuni` VALUES ('077015', 'Miglionico', '077', NULL, '2023-02-27 18:49:07', 'F201');
INSERT INTO `comuni` VALUES ('077016', 'Montalbano Jonico', '077', NULL, '2023-02-27 18:49:07', 'F399');
INSERT INTO `comuni` VALUES ('077017', 'Montescaglioso', '077', NULL, '2023-02-27 18:49:07', 'F637');
INSERT INTO `comuni` VALUES ('077018', 'Nova Siri', '077', NULL, '2023-02-27 18:49:07', 'A942');
INSERT INTO `comuni` VALUES ('077019', 'Oliveto Lucano', '077', NULL, '2023-02-27 18:49:07', 'G037');
INSERT INTO `comuni` VALUES ('077020', 'Pisticci', '077', NULL, '2023-02-27 18:49:07', 'G712');
INSERT INTO `comuni` VALUES ('077021', 'Policoro', '077', NULL, '2023-02-27 18:49:07', 'G786');
INSERT INTO `comuni` VALUES ('077022', 'Pomarico', '077', NULL, '2023-02-27 18:49:07', 'G806');
INSERT INTO `comuni` VALUES ('077023', 'Rotondella', '077', NULL, '2023-02-27 18:49:07', 'H591');
INSERT INTO `comuni` VALUES ('077024', 'Salandra', '077', NULL, '2023-02-27 18:49:07', 'H687');
INSERT INTO `comuni` VALUES ('077025', 'San Giorgio Lucano', '077', NULL, '2023-02-27 18:49:07', 'H888');
INSERT INTO `comuni` VALUES ('077026', 'San Mauro Forte', '077', NULL, '2023-02-27 18:49:07', 'I029');
INSERT INTO `comuni` VALUES ('077027', 'Stigliano', '077', NULL, '2023-02-27 18:49:07', 'I954');
INSERT INTO `comuni` VALUES ('077028', 'Tricarico', '077', NULL, '2023-02-27 18:49:07', 'L418');
INSERT INTO `comuni` VALUES ('077029', 'Tursi', '077', NULL, '2023-02-27 18:49:07', 'L477');
INSERT INTO `comuni` VALUES ('077030', 'Valsinni', '077', NULL, '2023-02-27 18:49:07', 'D513');
INSERT INTO `comuni` VALUES ('077031', 'Scanzano Jonico', '077', NULL, '2023-02-27 18:49:07', 'M256');
INSERT INTO `comuni` VALUES ('078001', 'Acquaformosa', '078', NULL, '2023-02-27 18:49:07', 'A033');
INSERT INTO `comuni` VALUES ('078002', 'Acquappesa', '078', NULL, '2023-02-27 18:49:07', 'A041');
INSERT INTO `comuni` VALUES ('078003', 'Acri', '078', NULL, '2023-02-27 18:49:07', 'A053');
INSERT INTO `comuni` VALUES ('078004', 'Aiello Calabro', '078', NULL, '2023-02-27 18:49:07', 'A102');
INSERT INTO `comuni` VALUES ('078005', 'Aieta', '078', NULL, '2023-02-27 18:49:07', 'A105');
INSERT INTO `comuni` VALUES ('078006', 'Albidona', '078', NULL, '2023-02-27 18:49:07', 'A160');
INSERT INTO `comuni` VALUES ('078007', 'Alessandria del Carretto', '078', NULL, '2023-02-27 18:49:07', 'A183');
INSERT INTO `comuni` VALUES ('078008', 'Altilia', '078', NULL, '2023-02-27 18:49:07', 'A234');
INSERT INTO `comuni` VALUES ('078009', 'Altomonte', '078', NULL, '2023-02-27 18:49:07', 'A240');
INSERT INTO `comuni` VALUES ('078010', 'Amantea', '078', NULL, '2023-02-27 18:49:07', 'A253');
INSERT INTO `comuni` VALUES ('078011', 'Amendolara', '078', NULL, '2023-02-27 18:49:07', 'A263');
INSERT INTO `comuni` VALUES ('078012', 'Aprigliano', '078', NULL, '2023-02-27 18:49:07', 'A340');
INSERT INTO `comuni` VALUES ('078013', 'Belmonte Calabro', '078', NULL, '2023-02-27 18:49:07', 'A762');
INSERT INTO `comuni` VALUES ('078014', 'Belsito', '078', NULL, '2023-02-27 18:49:07', 'A768');
INSERT INTO `comuni` VALUES ('078015', 'Belvedere Marittimo', '078', NULL, '2023-02-27 18:49:07', 'A773');
INSERT INTO `comuni` VALUES ('078016', 'Bianchi', '078', NULL, '2023-02-27 18:49:07', 'A842');
INSERT INTO `comuni` VALUES ('078017', 'Bisignano', '078', NULL, '2023-02-27 18:49:07', 'A887');
INSERT INTO `comuni` VALUES ('078018', 'Bocchigliero', '078', NULL, '2023-02-27 18:49:07', 'A912');
INSERT INTO `comuni` VALUES ('078019', 'Bonifati', '078', NULL, '2023-02-27 18:49:07', 'A973');
INSERT INTO `comuni` VALUES ('078020', 'Buonvicino', '078', NULL, '2023-02-27 18:49:07', 'B270');
INSERT INTO `comuni` VALUES ('078021', 'Calopezzati', '078', NULL, '2023-02-27 18:49:07', 'B424');
INSERT INTO `comuni` VALUES ('078022', 'Caloveto', '078', NULL, '2023-02-27 18:49:07', 'B426');
INSERT INTO `comuni` VALUES ('078023', 'Campana', '078', NULL, '2023-02-27 18:49:07', 'B500');
INSERT INTO `comuni` VALUES ('078024', 'Canna', '078', NULL, '2023-02-27 18:49:07', 'B607');
INSERT INTO `comuni` VALUES ('078025', 'Cariati', '078', NULL, '2023-02-27 18:49:07', 'B774');
INSERT INTO `comuni` VALUES ('078026', 'Carolei', '078', NULL, '2023-02-27 18:49:07', 'B802');
INSERT INTO `comuni` VALUES ('078027', 'Carpanzano', '078', NULL, '2023-02-27 18:49:07', 'B813');
INSERT INTO `comuni` VALUES ('078028', 'Casole Bruzio', '078', NULL, '2023-02-27 18:49:07', 'B983');
INSERT INTO `comuni` VALUES ('078029', 'Cassano all\'Ionio', '078', NULL, '2023-02-27 18:49:07', 'C002');
INSERT INTO `comuni` VALUES ('078030', 'Castiglione Cosentino', '078', NULL, '2023-02-27 18:49:07', 'C301');
INSERT INTO `comuni` VALUES ('078031', 'Castrolibero', '078', NULL, '2023-02-27 18:49:07', 'C108');
INSERT INTO `comuni` VALUES ('078032', 'Castroregio', '078', NULL, '2023-02-27 18:49:07', 'C348');
INSERT INTO `comuni` VALUES ('078033', 'Castrovillari', '078', NULL, '2023-02-27 18:49:07', 'C349');
INSERT INTO `comuni` VALUES ('078034', 'Celico', '078', NULL, '2023-02-27 18:49:07', 'C430');
INSERT INTO `comuni` VALUES ('078035', 'Cellara', '078', NULL, '2023-02-27 18:49:07', 'C437');
INSERT INTO `comuni` VALUES ('078036', 'Cerchiara di Calabria', '078', NULL, '2023-02-27 18:49:07', 'C489');
INSERT INTO `comuni` VALUES ('078037', 'Cerisano', '078', NULL, '2023-02-27 18:49:07', 'C515');
INSERT INTO `comuni` VALUES ('078038', 'Cervicati', '078', NULL, '2023-02-27 18:49:07', 'C554');
INSERT INTO `comuni` VALUES ('078039', 'Cerzeto', '078', NULL, '2023-02-27 18:49:07', 'C560');
INSERT INTO `comuni` VALUES ('078040', 'Cetraro', '078', NULL, '2023-02-27 18:49:07', 'C588');
INSERT INTO `comuni` VALUES ('078041', 'Civita', '078', NULL, '2023-02-27 18:49:07', 'C763');
INSERT INTO `comuni` VALUES ('078042', 'Cleto', '078', NULL, '2023-02-27 18:49:07', 'C795');
INSERT INTO `comuni` VALUES ('078043', 'Colosimi', '078', NULL, '2023-02-27 18:49:07', 'C905');
INSERT INTO `comuni` VALUES ('078044', 'Corigliano Calabro', '078', NULL, '2023-02-27 18:49:07', 'D005');
INSERT INTO `comuni` VALUES ('078045', 'Cosenza', '078', NULL, '2023-02-27 18:49:07', 'D086');
INSERT INTO `comuni` VALUES ('078046', 'Cropalati', '078', NULL, '2023-02-27 18:49:07', 'D180');
INSERT INTO `comuni` VALUES ('078047', 'Crosia', '078', NULL, '2023-02-27 18:49:07', 'D184');
INSERT INTO `comuni` VALUES ('078048', 'Diamante', '078', NULL, '2023-02-27 18:49:07', 'D289');
INSERT INTO `comuni` VALUES ('078049', 'Dipignano', '078', NULL, '2023-02-27 18:49:07', 'D304');
INSERT INTO `comuni` VALUES ('078050', 'Domanico', '078', NULL, '2023-02-27 18:49:07', 'D328');
INSERT INTO `comuni` VALUES ('078051', 'Fagnano Castello', '078', NULL, '2023-02-27 18:49:07', 'D464');
INSERT INTO `comuni` VALUES ('078052', 'Falconara Albanese', '078', NULL, '2023-02-27 18:49:07', 'D473');
INSERT INTO `comuni` VALUES ('078053', 'Figline Vegliaturo', '078', NULL, '2023-02-27 18:49:07', 'D582');
INSERT INTO `comuni` VALUES ('078054', 'Firmo', '078', NULL, '2023-02-27 18:49:07', 'D614');
INSERT INTO `comuni` VALUES ('078055', 'Fiumefreddo Bruzio', '078', NULL, '2023-02-27 18:49:07', 'D624');
INSERT INTO `comuni` VALUES ('078056', 'Francavilla Marittima', '078', NULL, '2023-02-27 18:49:07', 'D764');
INSERT INTO `comuni` VALUES ('078057', 'Frascineto', '078', NULL, '2023-02-27 18:49:07', 'D774');
INSERT INTO `comuni` VALUES ('078058', 'Fuscaldo', '078', NULL, '2023-02-27 18:49:07', 'D828');
INSERT INTO `comuni` VALUES ('078059', 'Grimaldi', '078', NULL, '2023-02-27 18:49:07', 'E180');
INSERT INTO `comuni` VALUES ('078060', 'Grisolia', '078', NULL, '2023-02-27 18:49:07', 'E185');
INSERT INTO `comuni` VALUES ('078061', 'Guardia Piemontese', '078', NULL, '2023-02-27 18:49:07', 'E242');
INSERT INTO `comuni` VALUES ('078062', 'Lago', '078', NULL, '2023-02-27 18:49:07', 'E407');
INSERT INTO `comuni` VALUES ('078063', 'Laino Borgo', '078', NULL, '2023-02-27 18:49:07', 'E417');
INSERT INTO `comuni` VALUES ('078064', 'Laino Castello', '078', NULL, '2023-02-27 18:49:07', 'E419');
INSERT INTO `comuni` VALUES ('078065', 'Lappano', '078', NULL, '2023-02-27 18:49:07', 'E450');
INSERT INTO `comuni` VALUES ('078066', 'Lattarico', '078', NULL, '2023-02-27 18:49:07', 'E475');
INSERT INTO `comuni` VALUES ('078067', 'Longobardi', '078', NULL, '2023-02-27 18:49:07', 'E677');
INSERT INTO `comuni` VALUES ('078068', 'Longobucco', '078', NULL, '2023-02-27 18:49:07', 'E678');
INSERT INTO `comuni` VALUES ('078069', 'Lungro', '078', NULL, '2023-02-27 18:49:07', 'E745');
INSERT INTO `comuni` VALUES ('078070', 'Luzzi', '078', NULL, '2023-02-27 18:49:07', 'E773');
INSERT INTO `comuni` VALUES ('078071', 'Maierà', '078', NULL, '2023-02-27 18:49:07', 'E835');
INSERT INTO `comuni` VALUES ('078072', 'Malito', '078', NULL, '2023-02-27 18:49:07', 'E859');
INSERT INTO `comuni` VALUES ('078073', 'Malvito', '078', NULL, '2023-02-27 18:49:07', 'E872');
INSERT INTO `comuni` VALUES ('078074', 'Mandatoriccio', '078', NULL, '2023-02-27 18:49:07', 'E878');
INSERT INTO `comuni` VALUES ('078075', 'Mangone', '078', NULL, '2023-02-27 18:49:07', 'E888');
INSERT INTO `comuni` VALUES ('078076', 'Marano Marchesato', '078', NULL, '2023-02-27 18:49:07', 'E914');
INSERT INTO `comuni` VALUES ('078077', 'Marano Principato', '078', NULL, '2023-02-27 18:49:07', 'E915');
INSERT INTO `comuni` VALUES ('078078', 'Marzi', '078', NULL, '2023-02-27 18:49:07', 'F001');
INSERT INTO `comuni` VALUES ('078079', 'Mendicino', '078', NULL, '2023-02-27 18:49:07', 'F125');
INSERT INTO `comuni` VALUES ('078080', 'Mongrassano', '078', NULL, '2023-02-27 18:49:07', 'F370');
INSERT INTO `comuni` VALUES ('078081', 'Montalto Uffugo', '078', NULL, '2023-02-27 18:49:07', 'F416');
INSERT INTO `comuni` VALUES ('078082', 'Montegiordano', '078', NULL, '2023-02-27 18:49:07', 'F519');
INSERT INTO `comuni` VALUES ('078083', 'Morano Calabro', '078', NULL, '2023-02-27 18:49:07', 'F708');
INSERT INTO `comuni` VALUES ('078084', 'Mormanno', '078', NULL, '2023-02-27 18:49:07', 'F735');
INSERT INTO `comuni` VALUES ('078085', 'Mottafollone', '078', NULL, '2023-02-27 18:49:07', 'F775');
INSERT INTO `comuni` VALUES ('078086', 'Nocara', '078', NULL, '2023-02-27 18:49:07', 'F907');
INSERT INTO `comuni` VALUES ('078087', 'Oriolo', '078', NULL, '2023-02-27 18:49:07', 'G110');
INSERT INTO `comuni` VALUES ('078088', 'Orsomarso', '078', NULL, '2023-02-27 18:49:07', 'G129');
INSERT INTO `comuni` VALUES ('078089', 'Paludi', '078', NULL, '2023-02-27 18:49:07', 'G298');
INSERT INTO `comuni` VALUES ('078090', 'Panettieri', '078', NULL, '2023-02-27 18:49:07', 'G307');
INSERT INTO `comuni` VALUES ('078091', 'Paola', '078', NULL, '2023-02-27 18:49:07', 'G317');
INSERT INTO `comuni` VALUES ('078092', 'Papasidero', '078', NULL, '2023-02-27 18:49:07', 'G320');
INSERT INTO `comuni` VALUES ('078093', 'Parenti', '078', NULL, '2023-02-27 18:49:07', 'G331');
INSERT INTO `comuni` VALUES ('078094', 'Paterno Calabro', '078', NULL, '2023-02-27 18:49:07', 'G372');
INSERT INTO `comuni` VALUES ('078095', 'Pedace', '078', NULL, '2023-02-27 18:49:07', 'G400');
INSERT INTO `comuni` VALUES ('078096', 'Pedivigliano', '078', NULL, '2023-02-27 18:49:07', 'G411');
INSERT INTO `comuni` VALUES ('078097', 'Piane Crati', '078', NULL, '2023-02-27 18:49:07', 'G553');
INSERT INTO `comuni` VALUES ('078098', 'Pietrafitta', '078', NULL, '2023-02-27 18:49:07', 'G615');
INSERT INTO `comuni` VALUES ('078099', 'Pietrapaola', '078', NULL, '2023-02-27 18:49:07', 'G622');
INSERT INTO `comuni` VALUES ('078100', 'Plataci', '078', NULL, '2023-02-27 18:49:07', 'G733');
INSERT INTO `comuni` VALUES ('078101', 'Praia a Mare', '078', NULL, '2023-02-27 18:49:07', 'G975');
INSERT INTO `comuni` VALUES ('078102', 'Rende', '078', NULL, '2023-02-27 18:49:07', 'H235');
INSERT INTO `comuni` VALUES ('078103', 'Rocca Imperiale', '078', NULL, '2023-02-27 18:49:07', 'H416');
INSERT INTO `comuni` VALUES ('078104', 'Roggiano Gravina', '078', NULL, '2023-02-27 18:49:07', 'H488');
INSERT INTO `comuni` VALUES ('078105', 'Rogliano', '078', NULL, '2023-02-27 18:49:07', 'H490');
INSERT INTO `comuni` VALUES ('078106', 'Rose', '078', NULL, '2023-02-27 18:49:07', 'H565');
INSERT INTO `comuni` VALUES ('078107', 'Roseto Capo Spulico', '078', NULL, '2023-02-27 18:49:07', 'H572');
INSERT INTO `comuni` VALUES ('078108', 'Rossano', '078', NULL, '2023-02-27 18:49:07', 'H579');
INSERT INTO `comuni` VALUES ('078109', 'Rota Greca', '078', NULL, '2023-02-27 18:49:07', 'H585');
INSERT INTO `comuni` VALUES ('078110', 'Rovito', '078', NULL, '2023-02-27 18:49:07', 'H621');
INSERT INTO `comuni` VALUES ('078111', 'San Basile', '078', NULL, '2023-02-27 18:49:07', 'H765');
INSERT INTO `comuni` VALUES ('078112', 'San Benedetto Ullano', '078', NULL, '2023-02-27 18:49:07', 'H774');
INSERT INTO `comuni` VALUES ('078113', 'San Cosmo Albanese', '078', NULL, '2023-02-27 18:49:07', 'H806');
INSERT INTO `comuni` VALUES ('078114', 'San Demetrio Corone', '078', NULL, '2023-02-27 18:49:07', 'H818');
INSERT INTO `comuni` VALUES ('078115', 'San Donato di Ninea', '078', NULL, '2023-02-27 18:49:07', 'H825');
INSERT INTO `comuni` VALUES ('078116', 'San Fili', '078', NULL, '2023-02-27 18:49:07', 'H841');
INSERT INTO `comuni` VALUES ('078117', 'Sangineto', '078', NULL, '2023-02-27 18:49:07', 'H877');
INSERT INTO `comuni` VALUES ('078118', 'San Giorgio Albanese', '078', NULL, '2023-02-27 18:49:07', 'H881');
INSERT INTO `comuni` VALUES ('078119', 'San Giovanni in Fiore', '078', NULL, '2023-02-27 18:49:07', 'H919');
INSERT INTO `comuni` VALUES ('078120', 'San Lorenzo Bellizzi', '078', NULL, '2023-02-27 18:49:07', 'H961');
INSERT INTO `comuni` VALUES ('078121', 'San Lorenzo del Vallo', '078', NULL, '2023-02-27 18:49:07', 'H962');
INSERT INTO `comuni` VALUES ('078122', 'San Lucido', '078', NULL, '2023-02-27 18:49:07', 'H971');
INSERT INTO `comuni` VALUES ('078123', 'San Marco Argentano', '078', NULL, '2023-02-27 18:49:07', 'H981');
INSERT INTO `comuni` VALUES ('078124', 'San Martino di Finita', '078', NULL, '2023-02-27 18:49:07', 'H992');
INSERT INTO `comuni` VALUES ('078125', 'San Nicola Arcella', '078', NULL, '2023-02-27 18:49:07', 'I060');
INSERT INTO `comuni` VALUES ('078126', 'San Pietro in Amantea', '078', NULL, '2023-02-27 18:49:07', 'I108');
INSERT INTO `comuni` VALUES ('078127', 'San Pietro in Guarano', '078', NULL, '2023-02-27 18:49:07', 'I114');
INSERT INTO `comuni` VALUES ('078128', 'San Sosti', '078', NULL, '2023-02-27 18:49:07', 'I165');
INSERT INTO `comuni` VALUES ('078129', 'Santa Caterina Albanese', '078', NULL, '2023-02-27 18:49:07', 'I171');
INSERT INTO `comuni` VALUES ('078130', 'Santa Domenica Talao', '078', NULL, '2023-02-27 18:49:07', 'I183');
INSERT INTO `comuni` VALUES ('078131', 'Sant\'Agata di Esaro', '078', NULL, '2023-02-27 18:49:07', 'I192');
INSERT INTO `comuni` VALUES ('078132', 'Santa Maria del Cedro', '078', NULL, '2023-02-27 18:49:07', 'C717');
INSERT INTO `comuni` VALUES ('078133', 'Santa Sofia d\'Epiro', '078', NULL, '2023-02-27 18:49:07', 'I309');
INSERT INTO `comuni` VALUES ('078134', 'Santo Stefano di Rogliano', '078', NULL, '2023-02-27 18:49:07', 'I359');
INSERT INTO `comuni` VALUES ('078135', 'San Vincenzo La Costa', '078', NULL, '2023-02-27 18:49:07', 'I388');
INSERT INTO `comuni` VALUES ('078136', 'Saracena', '078', NULL, '2023-02-27 18:49:07', 'I423');
INSERT INTO `comuni` VALUES ('078137', 'Scala Coeli', '078', NULL, '2023-02-27 18:49:07', 'I485');
INSERT INTO `comuni` VALUES ('078138', 'Scalea', '078', NULL, '2023-02-27 18:49:07', 'I489');
INSERT INTO `comuni` VALUES ('078139', 'Scigliano', '078', NULL, '2023-02-27 18:49:07', 'D290');
INSERT INTO `comuni` VALUES ('078140', 'Serra d\'Aiello', '078', NULL, '2023-02-27 18:49:07', 'I642');
INSERT INTO `comuni` VALUES ('078141', 'Serra Pedace', '078', NULL, '2023-02-27 18:49:07', 'I650');
INSERT INTO `comuni` VALUES ('078142', 'Spezzano Albanese', '078', NULL, '2023-02-27 18:49:07', 'I895');
INSERT INTO `comuni` VALUES ('078143', 'Spezzano della Sila', '078', NULL, '2023-02-27 18:49:07', 'I896');
INSERT INTO `comuni` VALUES ('078144', 'Spezzano Piccolo', '078', NULL, '2023-02-27 18:49:07', 'I898');
INSERT INTO `comuni` VALUES ('078145', 'Tarsia', '078', NULL, '2023-02-27 18:49:07', 'L055');
INSERT INTO `comuni` VALUES ('078146', 'Terranova da Sibari', '078', NULL, '2023-02-27 18:49:07', 'L124');
INSERT INTO `comuni` VALUES ('078147', 'Terravecchia', '078', NULL, '2023-02-27 18:49:07', 'L134');
INSERT INTO `comuni` VALUES ('078148', 'Torano Castello', '078', NULL, '2023-02-27 18:49:07', 'L206');
INSERT INTO `comuni` VALUES ('078149', 'Tortora', '078', NULL, '2023-02-27 18:49:07', 'L305');
INSERT INTO `comuni` VALUES ('078150', 'Trebisacce', '078', NULL, '2023-02-27 18:49:07', 'L353');
INSERT INTO `comuni` VALUES ('078151', 'Trenta', '078', NULL, '2023-02-27 18:49:07', 'L375');
INSERT INTO `comuni` VALUES ('078152', 'Vaccarizzo Albanese', '078', NULL, '2023-02-27 18:49:07', 'L524');
INSERT INTO `comuni` VALUES ('078153', 'Verbicaro', '078', NULL, '2023-02-27 18:49:07', 'L747');
INSERT INTO `comuni` VALUES ('078154', 'Villapiana', '078', NULL, '2023-02-27 18:49:07', 'B903');
INSERT INTO `comuni` VALUES ('078155', 'Zumpano', '078', NULL, '2023-02-27 18:49:07', 'M202');
INSERT INTO `comuni` VALUES ('079002', 'Albi', '079', NULL, '2023-02-27 18:49:07', 'A155');
INSERT INTO `comuni` VALUES ('079003', 'Amaroni', '079', NULL, '2023-02-27 18:49:07', 'A255');
INSERT INTO `comuni` VALUES ('079004', 'Amato', '079', NULL, '2023-02-27 18:49:07', 'A257');
INSERT INTO `comuni` VALUES ('079005', 'Andali', '079', NULL, '2023-02-27 18:49:07', 'A272');
INSERT INTO `comuni` VALUES ('079007', 'Argusto', '079', NULL, '2023-02-27 18:49:07', 'A397');
INSERT INTO `comuni` VALUES ('079008', 'Badolato', '079', NULL, '2023-02-27 18:49:07', 'A542');
INSERT INTO `comuni` VALUES ('079009', 'Belcastro', '079', NULL, '2023-02-27 18:49:07', 'A736');
INSERT INTO `comuni` VALUES ('079011', 'Borgia', '079', NULL, '2023-02-27 18:49:07', 'B002');
INSERT INTO `comuni` VALUES ('079012', 'Botricello', '079', NULL, '2023-02-27 18:49:07', 'B085');
INSERT INTO `comuni` VALUES ('079017', 'Caraffa di Catanzaro', '079', NULL, '2023-02-27 18:49:07', 'B717');
INSERT INTO `comuni` VALUES ('079018', 'Cardinale', '079', NULL, '2023-02-27 18:49:07', 'B758');
INSERT INTO `comuni` VALUES ('079020', 'Carlopoli', '079', NULL, '2023-02-27 18:49:07', 'B790');
INSERT INTO `comuni` VALUES ('079023', 'Catanzaro', '079', NULL, '2023-02-27 18:49:07', 'C352');
INSERT INTO `comuni` VALUES ('079024', 'Cenadi', '079', NULL, '2023-02-27 18:49:07', 'C453');
INSERT INTO `comuni` VALUES ('079025', 'Centrache', '079', NULL, '2023-02-27 18:49:07', 'C472');
INSERT INTO `comuni` VALUES ('079027', 'Cerva', '079', NULL, '2023-02-27 18:49:07', 'C542');
INSERT INTO `comuni` VALUES ('079029', 'Chiaravalle Centrale', '079', NULL, '2023-02-27 18:49:07', 'C616');
INSERT INTO `comuni` VALUES ('079030', 'Cicala', '079', NULL, '2023-02-27 18:49:07', 'C674');
INSERT INTO `comuni` VALUES ('079033', 'Conflenti', '079', NULL, '2023-02-27 18:49:07', 'C960');
INSERT INTO `comuni` VALUES ('079034', 'Cortale', '079', NULL, '2023-02-27 18:49:07', 'D049');
INSERT INTO `comuni` VALUES ('079036', 'Cropani', '079', NULL, '2023-02-27 18:49:07', 'D181');
INSERT INTO `comuni` VALUES ('079039', 'Curinga', '079', NULL, '2023-02-27 18:49:07', 'D218');
INSERT INTO `comuni` VALUES ('079042', 'Davoli', '079', NULL, '2023-02-27 18:49:07', 'D257');
INSERT INTO `comuni` VALUES ('079043', 'Decollatura', '079', NULL, '2023-02-27 18:49:07', 'D261');
INSERT INTO `comuni` VALUES ('079047', 'Falerna', '079', NULL, '2023-02-27 18:49:07', 'D476');
INSERT INTO `comuni` VALUES ('079048', 'Feroleto Antico', '079', NULL, '2023-02-27 18:49:07', 'D544');
INSERT INTO `comuni` VALUES ('079052', 'Fossato Serralta', '079', NULL, '2023-02-27 18:49:07', 'D744');
INSERT INTO `comuni` VALUES ('079055', 'Gagliato', '079', NULL, '2023-02-27 18:49:07', 'D852');
INSERT INTO `comuni` VALUES ('079056', 'Gasperina', '079', NULL, '2023-02-27 18:49:07', 'D932');
INSERT INTO `comuni` VALUES ('079058', 'Gimigliano', '079', NULL, '2023-02-27 18:49:07', 'E031');
INSERT INTO `comuni` VALUES ('079059', 'Girifalco', '079', NULL, '2023-02-27 18:49:07', 'E050');
INSERT INTO `comuni` VALUES ('079060', 'Gizzeria', '079', NULL, '2023-02-27 18:49:07', 'E068');
INSERT INTO `comuni` VALUES ('079061', 'Guardavalle', '079', NULL, '2023-02-27 18:49:07', 'E239');
INSERT INTO `comuni` VALUES ('079063', 'Isca sullo Ionio', '079', NULL, '2023-02-27 18:49:07', 'E328');
INSERT INTO `comuni` VALUES ('079065', 'Jacurso', '079', NULL, '2023-02-27 18:49:07', 'E274');
INSERT INTO `comuni` VALUES ('079068', 'Magisano', '079', NULL, '2023-02-27 18:49:07', 'E806');
INSERT INTO `comuni` VALUES ('079069', 'Maida', '079', NULL, '2023-02-27 18:49:07', 'E834');
INSERT INTO `comuni` VALUES ('079071', 'Marcedusa', '079', NULL, '2023-02-27 18:49:07', 'E923');
INSERT INTO `comuni` VALUES ('079072', 'Marcellinara', '079', NULL, '2023-02-27 18:49:07', 'E925');
INSERT INTO `comuni` VALUES ('079073', 'Martirano', '079', NULL, '2023-02-27 18:49:07', 'E990');
INSERT INTO `comuni` VALUES ('079074', 'Martirano Lombardo', '079', NULL, '2023-02-27 18:49:07', 'E991');
INSERT INTO `comuni` VALUES ('079077', 'Miglierina', '079', NULL, '2023-02-27 18:49:07', 'F200');
INSERT INTO `comuni` VALUES ('079080', 'Montauro', '079', NULL, '2023-02-27 18:49:07', 'F432');
INSERT INTO `comuni` VALUES ('079081', 'Montepaone', '079', NULL, '2023-02-27 18:49:07', 'F586');
INSERT INTO `comuni` VALUES ('079083', 'Motta Santa Lucia', '079', NULL, '2023-02-27 18:49:07', 'F780');
INSERT INTO `comuni` VALUES ('079087', 'Nocera Terinese', '079', NULL, '2023-02-27 18:49:07', 'F910');
INSERT INTO `comuni` VALUES ('079088', 'Olivadi', '079', NULL, '2023-02-27 18:49:07', 'G034');
INSERT INTO `comuni` VALUES ('079089', 'Palermiti', '079', NULL, '2023-02-27 18:49:07', 'G272');
INSERT INTO `comuni` VALUES ('079092', 'Pentone', '079', NULL, '2023-02-27 18:49:07', 'G439');
INSERT INTO `comuni` VALUES ('079094', 'Petrizzi', '079', NULL, '2023-02-27 18:49:07', 'G517');
INSERT INTO `comuni` VALUES ('079095', 'Petronà', '079', NULL, '2023-02-27 18:49:07', 'G518');
INSERT INTO `comuni` VALUES ('079096', 'Pianopoli', '079', NULL, '2023-02-27 18:49:07', 'D546');
INSERT INTO `comuni` VALUES ('079099', 'Platania', '079', NULL, '2023-02-27 18:49:07', 'G734');
INSERT INTO `comuni` VALUES ('079108', 'San Floro', '079', NULL, '2023-02-27 18:49:07', 'H846');
INSERT INTO `comuni` VALUES ('079110', 'San Mango d\'Aquino', '079', NULL, '2023-02-27 18:49:07', 'H976');
INSERT INTO `comuni` VALUES ('079114', 'San Pietro a Maida', '079', NULL, '2023-02-27 18:49:07', 'I093');
INSERT INTO `comuni` VALUES ('079115', 'San Pietro Apostolo', '079', NULL, '2023-02-27 18:49:07', 'I095');
INSERT INTO `comuni` VALUES ('079116', 'San Sostene', '079', NULL, '2023-02-27 18:49:07', 'I164');
INSERT INTO `comuni` VALUES ('079117', 'Santa Caterina dello Ionio', '079', NULL, '2023-02-27 18:49:07', 'I170');
INSERT INTO `comuni` VALUES ('079118', 'Sant\'Andrea Apostolo dello Ionio', '079', NULL, '2023-02-27 18:49:07', 'I266');
INSERT INTO `comuni` VALUES ('079122', 'San Vito sullo Ionio', '079', NULL, '2023-02-27 18:49:07', 'I393');
INSERT INTO `comuni` VALUES ('079123', 'Satriano', '079', NULL, '2023-02-27 18:49:07', 'I463');
INSERT INTO `comuni` VALUES ('079126', 'Sellia', '079', NULL, '2023-02-27 18:49:07', 'I589');
INSERT INTO `comuni` VALUES ('079127', 'Sellia Marina', '079', NULL, '2023-02-27 18:49:07', 'I590');
INSERT INTO `comuni` VALUES ('079129', 'Serrastretta', '079', NULL, '2023-02-27 18:49:07', 'I655');
INSERT INTO `comuni` VALUES ('079130', 'Sersale', '079', NULL, '2023-02-27 18:49:07', 'I671');
INSERT INTO `comuni` VALUES ('079131', 'Settingiano', '079', NULL, '2023-02-27 18:49:07', 'I704');
INSERT INTO `comuni` VALUES ('079133', 'Simeri Crichi', '079', NULL, '2023-02-27 18:49:07', 'I745');
INSERT INTO `comuni` VALUES ('079134', 'Sorbo San Basile', '079', NULL, '2023-02-27 18:49:07', 'I844');
INSERT INTO `comuni` VALUES ('079137', 'Soverato', '079', NULL, '2023-02-27 18:49:07', 'I872');
INSERT INTO `comuni` VALUES ('079138', 'Soveria Mannelli', '079', NULL, '2023-02-27 18:49:07', 'I874');
INSERT INTO `comuni` VALUES ('079139', 'Soveria Simeri', '079', NULL, '2023-02-27 18:49:07', 'I875');
INSERT INTO `comuni` VALUES ('079142', 'Squillace', '079', NULL, '2023-02-27 18:49:07', 'I929');
INSERT INTO `comuni` VALUES ('079143', 'Stalettì', '079', NULL, '2023-02-27 18:49:07', 'I937');
INSERT INTO `comuni` VALUES ('079146', 'Taverna', '079', NULL, '2023-02-27 18:49:07', 'L070');
INSERT INTO `comuni` VALUES ('079147', 'Tiriolo', '079', NULL, '2023-02-27 18:49:07', 'L177');
INSERT INTO `comuni` VALUES ('079148', 'Torre di Ruggiero', '079', NULL, '2023-02-27 18:49:07', 'L240');
INSERT INTO `comuni` VALUES ('079151', 'Vallefiorita', '079', NULL, '2023-02-27 18:49:07', 'I322');
INSERT INTO `comuni` VALUES ('079157', 'Zagarise', '079', NULL, '2023-02-27 18:49:07', 'M140');
INSERT INTO `comuni` VALUES ('079160', 'Lamezia Terme', '079', NULL, '2023-02-27 18:49:07', 'M208');
INSERT INTO `comuni` VALUES ('080001', 'Africo', '080', NULL, '2023-02-27 18:49:07', 'A065');
INSERT INTO `comuni` VALUES ('080002', 'Agnana Calabra', '080', NULL, '2023-02-27 18:49:07', 'A077');
INSERT INTO `comuni` VALUES ('080003', 'Anoia', '080', NULL, '2023-02-27 18:49:07', 'A303');
INSERT INTO `comuni` VALUES ('080004', 'Antonimina', '080', NULL, '2023-02-27 18:49:07', 'A314');
INSERT INTO `comuni` VALUES ('080005', 'Ardore', '080', NULL, '2023-02-27 18:49:07', 'A385');
INSERT INTO `comuni` VALUES ('080006', 'Bagaladi', '080', NULL, '2023-02-27 18:49:07', 'A544');
INSERT INTO `comuni` VALUES ('080007', 'Bagnara Calabra', '080', NULL, '2023-02-27 18:49:07', 'A552');
INSERT INTO `comuni` VALUES ('080008', 'Benestare', '080', NULL, '2023-02-27 18:49:07', 'A780');
INSERT INTO `comuni` VALUES ('080009', 'Bianco', '080', NULL, '2023-02-27 18:49:07', 'A843');
INSERT INTO `comuni` VALUES ('080010', 'Bivongi', '080', NULL, '2023-02-27 18:49:07', 'A897');
INSERT INTO `comuni` VALUES ('080011', 'Bova', '080', NULL, '2023-02-27 18:49:07', 'B097');
INSERT INTO `comuni` VALUES ('080012', 'Bovalino', '080', NULL, '2023-02-27 18:49:07', 'B098');
INSERT INTO `comuni` VALUES ('080013', 'Bova Marina', '080', NULL, '2023-02-27 18:49:07', 'B099');
INSERT INTO `comuni` VALUES ('080014', 'Brancaleone', '080', NULL, '2023-02-27 18:49:07', 'B118');
INSERT INTO `comuni` VALUES ('080015', 'Bruzzano Zeffirio', '080', NULL, '2023-02-27 18:49:07', 'B234');
INSERT INTO `comuni` VALUES ('080016', 'Calanna', '080', NULL, '2023-02-27 18:49:07', 'B379');
INSERT INTO `comuni` VALUES ('080017', 'Camini', '080', NULL, '2023-02-27 18:49:07', 'B481');
INSERT INTO `comuni` VALUES ('080018', 'Campo Calabro', '080', NULL, '2023-02-27 18:49:07', 'B516');
INSERT INTO `comuni` VALUES ('080019', 'Candidoni', '080', NULL, '2023-02-27 18:49:07', 'B591');
INSERT INTO `comuni` VALUES ('080020', 'Canolo', '080', NULL, '2023-02-27 18:49:07', 'B617');
INSERT INTO `comuni` VALUES ('080021', 'Caraffa del Bianco', '080', NULL, '2023-02-27 18:49:07', 'B718');
INSERT INTO `comuni` VALUES ('080022', 'Cardeto', '080', NULL, '2023-02-27 18:49:07', 'B756');
INSERT INTO `comuni` VALUES ('080023', 'Careri', '080', NULL, '2023-02-27 18:49:07', 'B766');
INSERT INTO `comuni` VALUES ('080024', 'Casignana', '080', NULL, '2023-02-27 18:49:07', 'B966');
INSERT INTO `comuni` VALUES ('080025', 'Caulonia', '080', NULL, '2023-02-27 18:49:07', 'C285');
INSERT INTO `comuni` VALUES ('080026', 'Ciminà', '080', NULL, '2023-02-27 18:49:07', 'C695');
INSERT INTO `comuni` VALUES ('080027', 'Cinquefrondi', '080', NULL, '2023-02-27 18:49:07', 'C710');
INSERT INTO `comuni` VALUES ('080028', 'Cittanova', '080', NULL, '2023-02-27 18:49:07', 'C747');
INSERT INTO `comuni` VALUES ('080029', 'Condofuri', '080', NULL, '2023-02-27 18:49:07', 'C954');
INSERT INTO `comuni` VALUES ('080030', 'Cosoleto', '080', NULL, '2023-02-27 18:49:07', 'D089');
INSERT INTO `comuni` VALUES ('080031', 'Delianuova', '080', NULL, '2023-02-27 18:49:07', 'D268');
INSERT INTO `comuni` VALUES ('080032', 'Feroleto della Chiesa', '080', NULL, '2023-02-27 18:49:07', 'D545');
INSERT INTO `comuni` VALUES ('080033', 'Ferruzzano', '080', NULL, '2023-02-27 18:49:07', 'D557');
INSERT INTO `comuni` VALUES ('080034', 'Fiumara', '080', NULL, '2023-02-27 18:49:07', 'D619');
INSERT INTO `comuni` VALUES ('080035', 'Galatro', '080', NULL, '2023-02-27 18:49:07', 'D864');
INSERT INTO `comuni` VALUES ('080036', 'Gerace', '080', NULL, '2023-02-27 18:49:07', 'D975');
INSERT INTO `comuni` VALUES ('080037', 'Giffone', '080', NULL, '2023-02-27 18:49:07', 'E025');
INSERT INTO `comuni` VALUES ('080038', 'Gioia Tauro', '080', NULL, '2023-02-27 18:49:07', 'E041');
INSERT INTO `comuni` VALUES ('080039', 'Gioiosa Ionica', '080', NULL, '2023-02-27 18:49:07', 'E044');
INSERT INTO `comuni` VALUES ('080040', 'Grotteria', '080', NULL, '2023-02-27 18:49:07', 'E212');
INSERT INTO `comuni` VALUES ('080041', 'Laganadi', '080', NULL, '2023-02-27 18:49:07', 'E402');
INSERT INTO `comuni` VALUES ('080042', 'Laureana di Borrello', '080', NULL, '2023-02-27 18:49:07', 'E479');
INSERT INTO `comuni` VALUES ('080043', 'Locri', '080', NULL, '2023-02-27 18:49:07', 'D976');
INSERT INTO `comuni` VALUES ('080044', 'Mammola', '080', NULL, '2023-02-27 18:49:07', 'E873');
INSERT INTO `comuni` VALUES ('080045', 'Marina di Gioiosa Ionica', '080', NULL, '2023-02-27 18:49:07', 'E956');
INSERT INTO `comuni` VALUES ('080046', 'Maropati', '080', NULL, '2023-02-27 18:49:07', 'E968');
INSERT INTO `comuni` VALUES ('080047', 'Martone', '080', NULL, '2023-02-27 18:49:07', 'E993');
INSERT INTO `comuni` VALUES ('080048', 'Melicuccà', '080', NULL, '2023-02-27 18:49:07', 'F105');
INSERT INTO `comuni` VALUES ('080049', 'Melicucco', '080', NULL, '2023-02-27 18:49:07', 'F106');
INSERT INTO `comuni` VALUES ('080050', 'Melito di Porto Salvo', '080', NULL, '2023-02-27 18:49:07', 'F112');
INSERT INTO `comuni` VALUES ('080051', 'Molochio', '080', NULL, '2023-02-27 18:49:07', 'F301');
INSERT INTO `comuni` VALUES ('080052', 'Monasterace', '080', NULL, '2023-02-27 18:49:07', 'F324');
INSERT INTO `comuni` VALUES ('080053', 'Montebello Ionico', '080', NULL, '2023-02-27 18:49:07', 'D746');
INSERT INTO `comuni` VALUES ('080054', 'Motta San Giovanni', '080', NULL, '2023-02-27 18:49:07', 'F779');
INSERT INTO `comuni` VALUES ('080055', 'Oppido Mamertina', '080', NULL, '2023-02-27 18:49:07', 'G082');
INSERT INTO `comuni` VALUES ('080056', 'Palizzi', '080', NULL, '2023-02-27 18:49:07', 'G277');
INSERT INTO `comuni` VALUES ('080057', 'Palmi', '080', NULL, '2023-02-27 18:49:07', 'G288');
INSERT INTO `comuni` VALUES ('080058', 'Pazzano', '080', NULL, '2023-02-27 18:49:07', 'G394');
INSERT INTO `comuni` VALUES ('080059', 'Placanica', '080', NULL, '2023-02-27 18:49:07', 'G729');
INSERT INTO `comuni` VALUES ('080060', 'Platì', '080', NULL, '2023-02-27 18:49:07', 'G735');
INSERT INTO `comuni` VALUES ('080061', 'Polistena', '080', NULL, '2023-02-27 18:49:07', 'G791');
INSERT INTO `comuni` VALUES ('080062', 'Portigliola', '080', NULL, '2023-02-27 18:49:07', 'G905');
INSERT INTO `comuni` VALUES ('080063', 'Reggio di Calabria', '080', NULL, '2023-02-27 18:49:07', 'H224');
INSERT INTO `comuni` VALUES ('080064', 'Riace', '080', NULL, '2023-02-27 18:49:07', 'H265');
INSERT INTO `comuni` VALUES ('080065', 'Rizziconi', '080', NULL, '2023-02-27 18:49:07', 'H359');
INSERT INTO `comuni` VALUES ('080066', 'Roccaforte del Greco', '080', NULL, '2023-02-27 18:49:07', 'H408');
INSERT INTO `comuni` VALUES ('080067', 'Roccella Ionica', '080', NULL, '2023-02-27 18:49:07', 'H456');
INSERT INTO `comuni` VALUES ('080068', 'Roghudi', '080', NULL, '2023-02-27 18:49:07', 'H489');
INSERT INTO `comuni` VALUES ('080069', 'Rosarno', '080', NULL, '2023-02-27 18:49:07', 'H558');
INSERT INTO `comuni` VALUES ('080070', 'Samo', '080', NULL, '2023-02-27 18:49:07', 'H013');
INSERT INTO `comuni` VALUES ('080071', 'San Giorgio Morgeto', '080', NULL, '2023-02-27 18:49:07', 'H889');
INSERT INTO `comuni` VALUES ('080072', 'San Giovanni di Gerace', '080', NULL, '2023-02-27 18:49:07', 'H903');
INSERT INTO `comuni` VALUES ('080073', 'San Lorenzo', '080', NULL, '2023-02-27 18:49:07', 'H959');
INSERT INTO `comuni` VALUES ('080074', 'San Luca', '080', NULL, '2023-02-27 18:49:07', 'H970');
INSERT INTO `comuni` VALUES ('080075', 'San Pietro di Caridà', '080', NULL, '2023-02-27 18:49:07', 'I102');
INSERT INTO `comuni` VALUES ('080076', 'San Procopio', '080', NULL, '2023-02-27 18:49:07', 'I132');
INSERT INTO `comuni` VALUES ('080077', 'San Roberto', '080', NULL, '2023-02-27 18:49:07', 'I139');
INSERT INTO `comuni` VALUES ('080078', 'Santa Cristina d\'Aspromonte', '080', NULL, '2023-02-27 18:49:07', 'I176');
INSERT INTO `comuni` VALUES ('080079', 'Sant\'Agata del Bianco', '080', NULL, '2023-02-27 18:49:07', 'I198');
INSERT INTO `comuni` VALUES ('080080', 'Sant\'Alessio in Aspromonte', '080', NULL, '2023-02-27 18:49:07', 'I214');
INSERT INTO `comuni` VALUES ('080081', 'Sant\'Eufemia d\'Aspromonte', '080', NULL, '2023-02-27 18:49:07', 'I333');
INSERT INTO `comuni` VALUES ('080082', 'Sant\'Ilario dello Ionio', '080', NULL, '2023-02-27 18:49:07', 'I341');
INSERT INTO `comuni` VALUES ('080083', 'Santo Stefano in Aspromonte', '080', NULL, '2023-02-27 18:49:07', 'I371');
INSERT INTO `comuni` VALUES ('080084', 'Scido', '080', NULL, '2023-02-27 18:49:07', 'I536');
INSERT INTO `comuni` VALUES ('080085', 'Scilla', '080', NULL, '2023-02-27 18:49:07', 'I537');
INSERT INTO `comuni` VALUES ('080086', 'Seminara', '080', NULL, '2023-02-27 18:49:07', 'I600');
INSERT INTO `comuni` VALUES ('080087', 'Serrata', '080', NULL, '2023-02-27 18:49:07', 'I656');
INSERT INTO `comuni` VALUES ('080088', 'Siderno', '080', NULL, '2023-02-27 18:49:07', 'I725');
INSERT INTO `comuni` VALUES ('080089', 'Sinopoli', '080', NULL, '2023-02-27 18:49:07', 'I753');
INSERT INTO `comuni` VALUES ('080090', 'Staiti', '080', NULL, '2023-02-27 18:49:07', 'I936');
INSERT INTO `comuni` VALUES ('080091', 'Stignano', '080', NULL, '2023-02-27 18:49:07', 'I955');
INSERT INTO `comuni` VALUES ('080092', 'Stilo', '080', NULL, '2023-02-27 18:49:07', 'I956');
INSERT INTO `comuni` VALUES ('080093', 'Taurianova', '080', NULL, '2023-02-27 18:49:07', 'L063');
INSERT INTO `comuni` VALUES ('080094', 'Terranova Sappo Minulio', '080', NULL, '2023-02-27 18:49:07', 'L127');
INSERT INTO `comuni` VALUES ('080095', 'Varapodio', '080', NULL, '2023-02-27 18:49:07', 'L673');
INSERT INTO `comuni` VALUES ('080096', 'Villa San Giovanni', '080', NULL, '2023-02-27 18:49:07', 'M018');
INSERT INTO `comuni` VALUES ('080097', 'San Ferdinando', '080', NULL, '2023-02-27 18:49:07', 'M277');
INSERT INTO `comuni` VALUES ('081001', 'Alcamo', '081', NULL, '2023-02-27 18:49:07', 'A176');
INSERT INTO `comuni` VALUES ('081002', 'Buseto Palizzolo', '081', NULL, '2023-02-27 18:49:07', 'B288');
INSERT INTO `comuni` VALUES ('081003', 'Calatafimi-Segesta', '081', NULL, '2023-02-27 18:49:07', 'B385');
INSERT INTO `comuni` VALUES ('081004', 'Campobello di Mazara', '081', NULL, '2023-02-27 18:49:07', 'B521');
INSERT INTO `comuni` VALUES ('081005', 'Castellammare del Golfo', '081', NULL, '2023-02-27 18:49:07', 'C130');
INSERT INTO `comuni` VALUES ('081006', 'Castelvetrano', '081', NULL, '2023-02-27 18:49:07', 'C286');
INSERT INTO `comuni` VALUES ('081007', 'Custonaci', '081', NULL, '2023-02-27 18:49:07', 'D234');
INSERT INTO `comuni` VALUES ('081008', 'Erice', '081', NULL, '2023-02-27 18:49:07', 'D423');
INSERT INTO `comuni` VALUES ('081009', 'Favignana', '081', NULL, '2023-02-27 18:49:07', 'D518');
INSERT INTO `comuni` VALUES ('081010', 'Gibellina', '081', NULL, '2023-02-27 18:49:07', 'E023');
INSERT INTO `comuni` VALUES ('081011', 'Marsala', '081', NULL, '2023-02-27 18:49:07', 'E974');
INSERT INTO `comuni` VALUES ('081012', 'Mazara del Vallo', '081', NULL, '2023-02-27 18:49:07', 'F061');
INSERT INTO `comuni` VALUES ('081013', 'Paceco', '081', NULL, '2023-02-27 18:49:07', 'G208');
INSERT INTO `comuni` VALUES ('081014', 'Pantelleria', '081', NULL, '2023-02-27 18:49:07', 'G315');
INSERT INTO `comuni` VALUES ('081015', 'Partanna', '081', NULL, '2023-02-27 18:49:07', 'G347');
INSERT INTO `comuni` VALUES ('081016', 'Poggioreale', '081', NULL, '2023-02-27 18:49:07', 'G767');
INSERT INTO `comuni` VALUES ('081017', 'Salaparuta', '081', NULL, '2023-02-27 18:49:07', 'H688');
INSERT INTO `comuni` VALUES ('081018', 'Salemi', '081', NULL, '2023-02-27 18:49:07', 'H700');
INSERT INTO `comuni` VALUES ('081019', 'Santa Ninfa', '081', NULL, '2023-02-27 18:49:07', 'I291');
INSERT INTO `comuni` VALUES ('081020', 'San Vito Lo Capo', '081', NULL, '2023-02-27 18:49:07', 'I407');
INSERT INTO `comuni` VALUES ('081021', 'Trapani', '081', NULL, '2023-02-27 18:49:07', 'L331');
INSERT INTO `comuni` VALUES ('081022', 'Valderice', '081', NULL, '2023-02-27 18:49:07', 'G319');
INSERT INTO `comuni` VALUES ('081023', 'Vita', '081', NULL, '2023-02-27 18:49:07', 'M081');
INSERT INTO `comuni` VALUES ('081024', 'Petrosino', '081', NULL, '2023-02-27 18:49:07', 'M281');
INSERT INTO `comuni` VALUES ('082001', 'Alia', '082', NULL, '2023-02-27 18:49:07', 'A195');
INSERT INTO `comuni` VALUES ('082002', 'Alimena', '082', NULL, '2023-02-27 18:49:07', 'A202');
INSERT INTO `comuni` VALUES ('082003', 'Aliminusa', '082', NULL, '2023-02-27 18:49:07', 'A203');
INSERT INTO `comuni` VALUES ('082004', 'Altavilla Milicia', '082', NULL, '2023-02-27 18:49:07', 'A229');
INSERT INTO `comuni` VALUES ('082005', 'Altofonte', '082', NULL, '2023-02-27 18:49:07', 'A239');
INSERT INTO `comuni` VALUES ('082006', 'Bagheria', '082', NULL, '2023-02-27 18:49:07', 'A546');
INSERT INTO `comuni` VALUES ('082007', 'Balestrate', '082', NULL, '2023-02-27 18:49:07', 'A592');
INSERT INTO `comuni` VALUES ('082008', 'Baucina', '082', NULL, '2023-02-27 18:49:07', 'A719');
INSERT INTO `comuni` VALUES ('082009', 'Belmonte Mezzagno', '082', NULL, '2023-02-27 18:49:07', 'A764');
INSERT INTO `comuni` VALUES ('082010', 'Bisacquino', '082', NULL, '2023-02-27 18:49:07', 'A882');
INSERT INTO `comuni` VALUES ('082011', 'Bolognetta', '082', NULL, '2023-02-27 18:49:07', 'A946');
INSERT INTO `comuni` VALUES ('082012', 'Bompietro', '082', NULL, '2023-02-27 18:49:07', 'A958');
INSERT INTO `comuni` VALUES ('082013', 'Borgetto', '082', NULL, '2023-02-27 18:49:07', 'A991');
INSERT INTO `comuni` VALUES ('082014', 'Caccamo', '082', NULL, '2023-02-27 18:49:07', 'B315');
INSERT INTO `comuni` VALUES ('082015', 'Caltavuturo', '082', NULL, '2023-02-27 18:49:07', 'B430');
INSERT INTO `comuni` VALUES ('082016', 'Campofelice di Fitalia', '082', NULL, '2023-02-27 18:49:07', 'B533');
INSERT INTO `comuni` VALUES ('082017', 'Campofelice di Roccella', '082', NULL, '2023-02-27 18:49:07', 'B532');
INSERT INTO `comuni` VALUES ('082018', 'Campofiorito', '082', NULL, '2023-02-27 18:49:07', 'B535');
INSERT INTO `comuni` VALUES ('082019', 'Camporeale', '082', NULL, '2023-02-27 18:49:07', 'B556');
INSERT INTO `comuni` VALUES ('082020', 'Capaci', '082', NULL, '2023-02-27 18:49:07', 'B645');
INSERT INTO `comuni` VALUES ('082021', 'Carini', '082', NULL, '2023-02-27 18:49:07', 'B780');
INSERT INTO `comuni` VALUES ('082022', 'Castelbuono', '082', NULL, '2023-02-27 18:49:07', 'C067');
INSERT INTO `comuni` VALUES ('082023', 'Casteldaccia', '082', NULL, '2023-02-27 18:49:07', 'C074');
INSERT INTO `comuni` VALUES ('082024', 'Castellana Sicula', '082', NULL, '2023-02-27 18:49:07', 'C135');
INSERT INTO `comuni` VALUES ('082025', 'Castronovo di Sicilia', '082', NULL, '2023-02-27 18:49:07', 'C344');
INSERT INTO `comuni` VALUES ('082026', 'Cefalà Diana', '082', NULL, '2023-02-27 18:49:07', 'C420');
INSERT INTO `comuni` VALUES ('082027', 'Cefalù', '082', NULL, '2023-02-27 18:49:07', 'C421');
INSERT INTO `comuni` VALUES ('082028', 'Cerda', '082', NULL, '2023-02-27 18:49:07', 'C496');
INSERT INTO `comuni` VALUES ('082029', 'Chiusa Sclafani', '082', NULL, '2023-02-27 18:49:07', 'C654');
INSERT INTO `comuni` VALUES ('082030', 'Ciminna', '082', NULL, '2023-02-27 18:49:07', 'C696');
INSERT INTO `comuni` VALUES ('082031', 'Cinisi', '082', NULL, '2023-02-27 18:49:07', 'C708');
INSERT INTO `comuni` VALUES ('082032', 'Collesano', '082', NULL, '2023-02-27 18:49:07', 'C871');
INSERT INTO `comuni` VALUES ('082033', 'Contessa Entellina', '082', NULL, '2023-02-27 18:49:07', 'C968');
INSERT INTO `comuni` VALUES ('082034', 'Corleone', '082', NULL, '2023-02-27 18:49:07', 'D009');
INSERT INTO `comuni` VALUES ('082035', 'Ficarazzi', '082', NULL, '2023-02-27 18:49:07', 'D567');
INSERT INTO `comuni` VALUES ('082036', 'Gangi', '082', NULL, '2023-02-27 18:49:07', 'D907');
INSERT INTO `comuni` VALUES ('082037', 'Geraci Siculo', '082', NULL, '2023-02-27 18:49:07', 'D977');
INSERT INTO `comuni` VALUES ('082038', 'Giardinello', '082', NULL, '2023-02-27 18:49:07', 'E013');
INSERT INTO `comuni` VALUES ('082039', 'Giuliana', '082', NULL, '2023-02-27 18:49:07', 'E055');
INSERT INTO `comuni` VALUES ('082040', 'Godrano', '082', NULL, '2023-02-27 18:49:07', 'E074');
INSERT INTO `comuni` VALUES ('082041', 'Gratteri', '082', NULL, '2023-02-27 18:49:07', 'E149');
INSERT INTO `comuni` VALUES ('082042', 'Isnello', '082', NULL, '2023-02-27 18:49:07', 'E337');
INSERT INTO `comuni` VALUES ('082043', 'Isola delle Femmine', '082', NULL, '2023-02-27 18:49:07', 'E350');
INSERT INTO `comuni` VALUES ('082044', 'Lascari', '082', NULL, '2023-02-27 18:49:07', 'E459');
INSERT INTO `comuni` VALUES ('082045', 'Lercara Friddi', '082', NULL, '2023-02-27 18:49:07', 'E541');
INSERT INTO `comuni` VALUES ('082046', 'Marineo', '082', NULL, '2023-02-27 18:49:07', 'E957');
INSERT INTO `comuni` VALUES ('082047', 'Mezzojuso', '082', NULL, '2023-02-27 18:49:07', 'F184');
INSERT INTO `comuni` VALUES ('082048', 'Misilmeri', '082', NULL, '2023-02-27 18:49:07', 'F246');
INSERT INTO `comuni` VALUES ('082049', 'Monreale', '082', NULL, '2023-02-27 18:49:07', 'F377');
INSERT INTO `comuni` VALUES ('082050', 'Montelepre', '082', NULL, '2023-02-27 18:49:07', 'F544');
INSERT INTO `comuni` VALUES ('082051', 'Montemaggiore Belsito', '082', NULL, '2023-02-27 18:49:07', 'F553');
INSERT INTO `comuni` VALUES ('082052', 'Palazzo Adriano', '082', NULL, '2023-02-27 18:49:07', 'G263');
INSERT INTO `comuni` VALUES ('082053', 'Palermo', '082', NULL, '2023-02-27 18:49:07', 'G273');
INSERT INTO `comuni` VALUES ('082054', 'Partinico', '082', NULL, '2023-02-27 18:49:07', 'G348');
INSERT INTO `comuni` VALUES ('082055', 'Petralia Soprana', '082', NULL, '2023-02-27 18:49:07', 'G510');
INSERT INTO `comuni` VALUES ('082056', 'Petralia Sottana', '082', NULL, '2023-02-27 18:49:07', 'G511');
INSERT INTO `comuni` VALUES ('082057', 'Piana degli Albanesi', '082', NULL, '2023-02-27 18:49:07', 'G543');
INSERT INTO `comuni` VALUES ('082058', 'Polizzi Generosa', '082', NULL, '2023-02-27 18:49:07', 'G792');
INSERT INTO `comuni` VALUES ('082059', 'Pollina', '082', NULL, '2023-02-27 18:49:07', 'G797');
INSERT INTO `comuni` VALUES ('082060', 'Prizzi', '082', NULL, '2023-02-27 18:49:07', 'H070');
INSERT INTO `comuni` VALUES ('082061', 'Roccamena', '082', NULL, '2023-02-27 18:49:07', 'H422');
INSERT INTO `comuni` VALUES ('082062', 'Roccapalumba', '082', NULL, '2023-02-27 18:49:07', 'H428');
INSERT INTO `comuni` VALUES ('082063', 'San Cipirello', '082', NULL, '2023-02-27 18:49:07', 'H797');
INSERT INTO `comuni` VALUES ('082064', 'San Giuseppe Jato', '082', NULL, '2023-02-27 18:49:07', 'H933');
INSERT INTO `comuni` VALUES ('082065', 'San Mauro Castelverde', '082', NULL, '2023-02-27 18:49:07', 'I028');
INSERT INTO `comuni` VALUES ('082066', 'Santa Cristina Gela', '082', NULL, '2023-02-27 18:49:07', 'I174');
INSERT INTO `comuni` VALUES ('082067', 'Santa Flavia', '082', NULL, '2023-02-27 18:49:07', 'I188');
INSERT INTO `comuni` VALUES ('082068', 'Sciara', '082', NULL, '2023-02-27 18:49:07', 'I534');
INSERT INTO `comuni` VALUES ('082069', 'Sclafani Bagni', '082', NULL, '2023-02-27 18:49:07', 'I541');
INSERT INTO `comuni` VALUES ('082070', 'Termini Imerese', '082', NULL, '2023-02-27 18:49:07', 'L112');
INSERT INTO `comuni` VALUES ('082071', 'Terrasini', '082', NULL, '2023-02-27 18:49:07', 'L131');
INSERT INTO `comuni` VALUES ('082072', 'Torretta', '082', NULL, '2023-02-27 18:49:07', 'L282');
INSERT INTO `comuni` VALUES ('082073', 'Trabia', '082', NULL, '2023-02-27 18:49:07', 'L317');
INSERT INTO `comuni` VALUES ('082074', 'Trappeto', '082', NULL, '2023-02-27 18:49:07', 'L332');
INSERT INTO `comuni` VALUES ('082075', 'Ustica', '082', NULL, '2023-02-27 18:49:07', 'L519');
INSERT INTO `comuni` VALUES ('082076', 'Valledolmo', '082', NULL, '2023-02-27 18:49:07', 'L603');
INSERT INTO `comuni` VALUES ('082077', 'Ventimiglia di Sicilia', '082', NULL, '2023-02-27 18:49:07', 'L740');
INSERT INTO `comuni` VALUES ('082078', 'Vicari', '082', NULL, '2023-02-27 18:49:07', 'L837');
INSERT INTO `comuni` VALUES ('082079', 'Villabate', '082', NULL, '2023-02-27 18:49:07', 'L916');
INSERT INTO `comuni` VALUES ('082080', 'Villafrati', '082', NULL, '2023-02-27 18:49:07', 'L951');
INSERT INTO `comuni` VALUES ('082081', 'Scillato', '082', NULL, '2023-02-27 18:49:07', 'I538');
INSERT INTO `comuni` VALUES ('082082', 'Blufi', '082', NULL, '2023-02-27 18:49:07', 'M268');
INSERT INTO `comuni` VALUES ('083001', 'Alcara li Fusi', '083', NULL, '2023-02-27 18:49:07', 'A177');
INSERT INTO `comuni` VALUES ('083002', 'Alì', '083', NULL, '2023-02-27 18:49:07', 'A194');
INSERT INTO `comuni` VALUES ('083003', 'Alì Terme', '083', NULL, '2023-02-27 18:49:07', 'A201');
INSERT INTO `comuni` VALUES ('083004', 'Antillo', '083', NULL, '2023-02-27 18:49:07', 'A313');
INSERT INTO `comuni` VALUES ('083005', 'Barcellona Pozzo di Gotto', '083', NULL, '2023-02-27 18:49:07', 'A638');
INSERT INTO `comuni` VALUES ('083006', 'Basicò', '083', NULL, '2023-02-27 18:49:07', 'A698');
INSERT INTO `comuni` VALUES ('083007', 'Brolo', '083', NULL, '2023-02-27 18:49:07', 'B198');
INSERT INTO `comuni` VALUES ('083008', 'Capizzi', '083', NULL, '2023-02-27 18:49:07', 'B660');
INSERT INTO `comuni` VALUES ('083009', 'Capo d\'Orlando', '083', NULL, '2023-02-27 18:49:07', 'B666');
INSERT INTO `comuni` VALUES ('083010', 'Capri Leone', '083', NULL, '2023-02-27 18:49:07', 'B695');
INSERT INTO `comuni` VALUES ('083011', 'Caronia', '083', NULL, '2023-02-27 18:49:07', 'B804');
INSERT INTO `comuni` VALUES ('083012', 'Casalvecchio Siculo', '083', NULL, '2023-02-27 18:49:07', 'B918');
INSERT INTO `comuni` VALUES ('083013', 'Castel di Lucio', '083', NULL, '2023-02-27 18:49:07', 'C094');
INSERT INTO `comuni` VALUES ('083014', 'Castell\'Umberto', '083', NULL, '2023-02-27 18:49:07', 'C051');
INSERT INTO `comuni` VALUES ('083015', 'Castelmola', '083', NULL, '2023-02-27 18:49:07', 'C210');
INSERT INTO `comuni` VALUES ('083016', 'Castroreale', '083', NULL, '2023-02-27 18:49:07', 'C347');
INSERT INTO `comuni` VALUES ('083017', 'Cesarò', '083', NULL, '2023-02-27 18:49:07', 'C568');
INSERT INTO `comuni` VALUES ('083018', 'Condrò', '083', NULL, '2023-02-27 18:49:07', 'C956');
INSERT INTO `comuni` VALUES ('083019', 'Falcone', '083', NULL, '2023-02-27 18:49:07', 'D474');
INSERT INTO `comuni` VALUES ('083020', 'Ficarra', '083', NULL, '2023-02-27 18:49:07', 'D569');
INSERT INTO `comuni` VALUES ('083021', 'Fiumedinisi', '083', NULL, '2023-02-27 18:49:07', 'D622');
INSERT INTO `comuni` VALUES ('083022', 'Floresta', '083', NULL, '2023-02-27 18:49:07', 'D635');
INSERT INTO `comuni` VALUES ('083023', 'Fondachelli-Fantina', '083', NULL, '2023-02-27 18:49:07', 'D661');
INSERT INTO `comuni` VALUES ('083024', 'Forza d\'Agrò', '083', NULL, '2023-02-27 18:49:07', 'D733');
INSERT INTO `comuni` VALUES ('083025', 'Francavilla di Sicilia', '083', NULL, '2023-02-27 18:49:07', 'D765');
INSERT INTO `comuni` VALUES ('083026', 'Frazzanò', '083', NULL, '2023-02-27 18:49:07', 'D793');
INSERT INTO `comuni` VALUES ('083027', 'Furci Siculo', '083', NULL, '2023-02-27 18:49:07', 'D824');
INSERT INTO `comuni` VALUES ('083028', 'Furnari', '083', NULL, '2023-02-27 18:49:07', 'D825');
INSERT INTO `comuni` VALUES ('083029', 'Gaggi', '083', NULL, '2023-02-27 18:49:07', 'D844');
INSERT INTO `comuni` VALUES ('083030', 'Galati Mamertino', '083', NULL, '2023-02-27 18:49:07', 'D861');
INSERT INTO `comuni` VALUES ('083031', 'Gallodoro', '083', NULL, '2023-02-27 18:49:07', 'D885');
INSERT INTO `comuni` VALUES ('083032', 'Giardini-Naxos', '083', NULL, '2023-02-27 18:49:07', 'E014');
INSERT INTO `comuni` VALUES ('083033', 'Gioiosa Marea', '083', NULL, '2023-02-27 18:49:07', 'E043');
INSERT INTO `comuni` VALUES ('083034', 'Graniti', '083', NULL, '2023-02-27 18:49:07', 'E142');
INSERT INTO `comuni` VALUES ('083035', 'Gualtieri Sicaminò', '083', NULL, '2023-02-27 18:49:07', 'E233');
INSERT INTO `comuni` VALUES ('083036', 'Itala', '083', NULL, '2023-02-27 18:49:07', 'E374');
INSERT INTO `comuni` VALUES ('083037', 'Leni', '083', NULL, '2023-02-27 18:49:07', 'E523');
INSERT INTO `comuni` VALUES ('083038', 'Letojanni', '083', NULL, '2023-02-27 18:49:07', 'E555');
INSERT INTO `comuni` VALUES ('083039', 'Librizzi', '083', NULL, '2023-02-27 18:49:07', 'E571');
INSERT INTO `comuni` VALUES ('083040', 'Limina', '083', NULL, '2023-02-27 18:49:07', 'E594');
INSERT INTO `comuni` VALUES ('083041', 'Lipari', '083', NULL, '2023-02-27 18:49:07', 'E606');
INSERT INTO `comuni` VALUES ('083042', 'Longi', '083', NULL, '2023-02-27 18:49:07', 'E674');
INSERT INTO `comuni` VALUES ('083043', 'Malfa', '083', NULL, '2023-02-27 18:49:07', 'E855');
INSERT INTO `comuni` VALUES ('083044', 'Malvagna', '083', NULL, '2023-02-27 18:49:07', 'E869');
INSERT INTO `comuni` VALUES ('083045', 'Mandanici', '083', NULL, '2023-02-27 18:49:07', 'E876');
INSERT INTO `comuni` VALUES ('083046', 'Mazzarrà Sant\'Andrea', '083', NULL, '2023-02-27 18:49:07', 'F066');
INSERT INTO `comuni` VALUES ('083047', 'Merì', '083', NULL, '2023-02-27 18:49:07', 'F147');
INSERT INTO `comuni` VALUES ('083048', 'Messina', '083', NULL, '2023-02-27 18:49:07', 'F158');
INSERT INTO `comuni` VALUES ('083049', 'Milazzo', '083', NULL, '2023-02-27 18:49:07', 'F206');
INSERT INTO `comuni` VALUES ('083050', 'Militello Rosmarino', '083', NULL, '2023-02-27 18:49:07', 'F210');
INSERT INTO `comuni` VALUES ('083051', 'Mirto', '083', NULL, '2023-02-27 18:49:07', 'F242');
INSERT INTO `comuni` VALUES ('083052', 'Mistretta', '083', NULL, '2023-02-27 18:49:07', 'F251');
INSERT INTO `comuni` VALUES ('083053', 'Moio Alcantara', '083', NULL, '2023-02-27 18:49:07', 'F277');
INSERT INTO `comuni` VALUES ('083054', 'Monforte San Giorgio', '083', NULL, '2023-02-27 18:49:07', 'F359');
INSERT INTO `comuni` VALUES ('083055', 'Mongiuffi Melia', '083', NULL, '2023-02-27 18:49:07', 'F368');
INSERT INTO `comuni` VALUES ('083056', 'Montagnareale', '083', NULL, '2023-02-27 18:49:07', 'F395');
INSERT INTO `comuni` VALUES ('083057', 'Montalbano Elicona', '083', NULL, '2023-02-27 18:49:07', 'F400');
INSERT INTO `comuni` VALUES ('083058', 'Motta Camastra', '083', NULL, '2023-02-27 18:49:07', 'F772');
INSERT INTO `comuni` VALUES ('083059', 'Motta d\'Affermo', '083', NULL, '2023-02-27 18:49:07', 'F773');
INSERT INTO `comuni` VALUES ('083060', 'Naso', '083', NULL, '2023-02-27 18:49:07', 'F848');
INSERT INTO `comuni` VALUES ('083061', 'Nizza di Sicilia', '083', NULL, '2023-02-27 18:49:07', 'F901');
INSERT INTO `comuni` VALUES ('083062', 'Novara di Sicilia', '083', NULL, '2023-02-27 18:49:07', 'F951');
INSERT INTO `comuni` VALUES ('083063', 'Oliveri', '083', NULL, '2023-02-27 18:49:07', 'G036');
INSERT INTO `comuni` VALUES ('083064', 'Pace del Mela', '083', NULL, '2023-02-27 18:49:07', 'G209');
INSERT INTO `comuni` VALUES ('083065', 'Pagliara', '083', NULL, '2023-02-27 18:49:07', 'G234');
INSERT INTO `comuni` VALUES ('083066', 'Patti', '083', NULL, '2023-02-27 18:49:07', 'G377');
INSERT INTO `comuni` VALUES ('083067', 'Pettineo', '083', NULL, '2023-02-27 18:49:07', 'G522');
INSERT INTO `comuni` VALUES ('083068', 'Piraino', '083', NULL, '2023-02-27 18:49:07', 'G699');
INSERT INTO `comuni` VALUES ('083069', 'Raccuja', '083', NULL, '2023-02-27 18:49:07', 'H151');
INSERT INTO `comuni` VALUES ('083070', 'Reitano', '083', NULL, '2023-02-27 18:49:07', 'H228');
INSERT INTO `comuni` VALUES ('083071', 'Roccafiorita', '083', NULL, '2023-02-27 18:49:07', 'H405');
INSERT INTO `comuni` VALUES ('083072', 'Roccalumera', '083', NULL, '2023-02-27 18:49:07', 'H418');
INSERT INTO `comuni` VALUES ('083073', 'Roccavaldina', '083', NULL, '2023-02-27 18:49:07', 'H380');
INSERT INTO `comuni` VALUES ('083074', 'Roccella Valdemone', '083', NULL, '2023-02-27 18:49:07', 'H455');
INSERT INTO `comuni` VALUES ('083075', 'Rodì Milici', '083', NULL, '2023-02-27 18:49:07', 'H479');
INSERT INTO `comuni` VALUES ('083076', 'Rometta', '083', NULL, '2023-02-27 18:49:07', 'H519');
INSERT INTO `comuni` VALUES ('083077', 'San Filippo del Mela', '083', NULL, '2023-02-27 18:49:07', 'H842');
INSERT INTO `comuni` VALUES ('083078', 'San Fratello', '083', NULL, '2023-02-27 18:49:07', 'H850');
INSERT INTO `comuni` VALUES ('083079', 'San Marco d\'Alunzio', '083', NULL, '2023-02-27 18:49:07', 'H982');
INSERT INTO `comuni` VALUES ('083080', 'San Pier Niceto', '083', NULL, '2023-02-27 18:49:07', 'I084');
INSERT INTO `comuni` VALUES ('083081', 'San Piero Patti', '083', NULL, '2023-02-27 18:49:07', 'I086');
INSERT INTO `comuni` VALUES ('083082', 'San Salvatore di Fitalia', '083', NULL, '2023-02-27 18:49:07', 'I147');
INSERT INTO `comuni` VALUES ('083083', 'Santa Domenica Vittoria', '083', NULL, '2023-02-27 18:49:07', 'I184');
INSERT INTO `comuni` VALUES ('083084', 'Sant\'Agata di Militello', '083', NULL, '2023-02-27 18:49:07', 'I199');
INSERT INTO `comuni` VALUES ('083085', 'Sant\'Alessio Siculo', '083', NULL, '2023-02-27 18:49:07', 'I215');
INSERT INTO `comuni` VALUES ('083086', 'Santa Lucia del Mela', '083', NULL, '2023-02-27 18:49:07', 'I220');
INSERT INTO `comuni` VALUES ('083087', 'Santa Marina Salina', '083', NULL, '2023-02-27 18:49:07', 'I254');
INSERT INTO `comuni` VALUES ('083088', 'Sant\'Angelo di Brolo', '083', NULL, '2023-02-27 18:49:07', 'I283');
INSERT INTO `comuni` VALUES ('083089', 'Santa Teresa di Riva', '083', NULL, '2023-02-27 18:49:07', 'I311');
INSERT INTO `comuni` VALUES ('083090', 'San Teodoro', '083', NULL, '2023-02-27 18:49:07', 'I328');
INSERT INTO `comuni` VALUES ('083091', 'Santo Stefano di Camastra', '083', NULL, '2023-02-27 18:49:07', 'I370');
INSERT INTO `comuni` VALUES ('083092', 'Saponara', '083', NULL, '2023-02-27 18:49:07', 'I420');
INSERT INTO `comuni` VALUES ('083093', 'Savoca', '083', NULL, '2023-02-27 18:49:07', 'I477');
INSERT INTO `comuni` VALUES ('083094', 'Scaletta Zanclea', '083', NULL, '2023-02-27 18:49:07', 'I492');
INSERT INTO `comuni` VALUES ('083095', 'Sinagra', '083', NULL, '2023-02-27 18:49:07', 'I747');
INSERT INTO `comuni` VALUES ('083096', 'Spadafora', '083', NULL, '2023-02-27 18:49:07', 'I881');
INSERT INTO `comuni` VALUES ('083097', 'Taormina', '083', NULL, '2023-02-27 18:49:07', 'L042');
INSERT INTO `comuni` VALUES ('083098', 'Torregrotta', '083', NULL, '2023-02-27 18:49:07', 'L271');
INSERT INTO `comuni` VALUES ('083099', 'Tortorici', '083', NULL, '2023-02-27 18:49:07', 'L308');
INSERT INTO `comuni` VALUES ('083100', 'Tripi', '083', NULL, '2023-02-27 18:49:07', 'L431');
INSERT INTO `comuni` VALUES ('083101', 'Tusa', '083', NULL, '2023-02-27 18:49:07', 'L478');
INSERT INTO `comuni` VALUES ('083102', 'Ucria', '083', NULL, '2023-02-27 18:49:07', 'L482');
INSERT INTO `comuni` VALUES ('083103', 'Valdina', '083', NULL, '2023-02-27 18:49:07', 'L561');
INSERT INTO `comuni` VALUES ('083104', 'Venetico', '083', NULL, '2023-02-27 18:49:07', 'L735');
INSERT INTO `comuni` VALUES ('083105', 'Villafranca Tirrena', '083', NULL, '2023-02-27 18:49:07', 'L950');
INSERT INTO `comuni` VALUES ('083106', 'Terme Vigliatore', '083', NULL, '2023-02-27 18:49:07', 'M210');
INSERT INTO `comuni` VALUES ('083107', 'Acquedolci', '083', NULL, '2023-02-27 18:49:07', 'M211');
INSERT INTO `comuni` VALUES ('083108', 'Torrenova', '083', NULL, '2023-02-27 18:49:07', 'M286');
INSERT INTO `comuni` VALUES ('084001', 'Agrigento', '084', NULL, '2023-02-27 18:49:07', 'A089');
INSERT INTO `comuni` VALUES ('084002', 'Alessandria della Rocca', '084', NULL, '2023-02-27 18:49:07', 'A181');
INSERT INTO `comuni` VALUES ('084003', 'Aragona', '084', NULL, '2023-02-27 18:49:07', 'A351');
INSERT INTO `comuni` VALUES ('084004', 'Bivona', '084', NULL, '2023-02-27 18:49:07', 'A896');
INSERT INTO `comuni` VALUES ('084005', 'Burgio', '084', NULL, '2023-02-27 18:49:07', 'B275');
INSERT INTO `comuni` VALUES ('084006', 'Calamonaci', '084', NULL, '2023-02-27 18:49:07', 'B377');
INSERT INTO `comuni` VALUES ('084007', 'Caltabellotta', '084', NULL, '2023-02-27 18:49:07', 'B427');
INSERT INTO `comuni` VALUES ('084008', 'Camastra', '084', NULL, '2023-02-27 18:49:07', 'B460');
INSERT INTO `comuni` VALUES ('084009', 'Cammarata', '084', NULL, '2023-02-27 18:49:07', 'B486');
INSERT INTO `comuni` VALUES ('084010', 'Campobello di Licata', '084', NULL, '2023-02-27 18:49:07', 'B520');
INSERT INTO `comuni` VALUES ('084011', 'Canicattì', '084', NULL, '2023-02-27 18:49:07', 'B602');
INSERT INTO `comuni` VALUES ('084012', 'Casteltermini', '084', NULL, '2023-02-27 18:49:07', 'C275');
INSERT INTO `comuni` VALUES ('084013', 'Castrofilippo', '084', NULL, '2023-02-27 18:49:07', 'C341');
INSERT INTO `comuni` VALUES ('084014', 'Cattolica Eraclea', '084', NULL, '2023-02-27 18:49:07', 'C356');
INSERT INTO `comuni` VALUES ('084015', 'Cianciana', '084', NULL, '2023-02-27 18:49:07', 'C668');
INSERT INTO `comuni` VALUES ('084016', 'Comitini', '084', NULL, '2023-02-27 18:49:07', 'C928');
INSERT INTO `comuni` VALUES ('084017', 'Favara', '084', NULL, '2023-02-27 18:49:07', 'D514');
INSERT INTO `comuni` VALUES ('084018', 'Grotte', '084', NULL, '2023-02-27 18:49:07', 'E209');
INSERT INTO `comuni` VALUES ('084019', 'Joppolo Giancaxio', '084', NULL, '2023-02-27 18:49:07', 'E390');
INSERT INTO `comuni` VALUES ('084020', 'Lampedusa e Linosa', '084', NULL, '2023-02-27 18:49:07', 'E431');
INSERT INTO `comuni` VALUES ('084021', 'Licata', '084', NULL, '2023-02-27 18:49:07', 'E573');
INSERT INTO `comuni` VALUES ('084022', 'Lucca Sicula', '084', NULL, '2023-02-27 18:49:07', 'E714');
INSERT INTO `comuni` VALUES ('084023', 'Menfi', '084', NULL, '2023-02-27 18:49:07', 'F126');
INSERT INTO `comuni` VALUES ('084024', 'Montallegro', '084', NULL, '2023-02-27 18:49:07', 'F414');
INSERT INTO `comuni` VALUES ('084025', 'Montevago', '084', NULL, '2023-02-27 18:49:07', 'F655');
INSERT INTO `comuni` VALUES ('084026', 'Naro', '084', NULL, '2023-02-27 18:49:07', 'F845');
INSERT INTO `comuni` VALUES ('084027', 'Palma di Montechiaro', '084', NULL, '2023-02-27 18:49:07', 'G282');
INSERT INTO `comuni` VALUES ('084028', 'Porto Empedocle', '084', NULL, '2023-02-27 18:49:07', 'F299');
INSERT INTO `comuni` VALUES ('084029', 'Racalmuto', '084', NULL, '2023-02-27 18:49:07', 'H148');
INSERT INTO `comuni` VALUES ('084030', 'Raffadali', '084', NULL, '2023-02-27 18:49:07', 'H159');
INSERT INTO `comuni` VALUES ('084031', 'Ravanusa', '084', NULL, '2023-02-27 18:49:07', 'H194');
INSERT INTO `comuni` VALUES ('084032', 'Realmonte', '084', NULL, '2023-02-27 18:49:07', 'H205');
INSERT INTO `comuni` VALUES ('084033', 'Ribera', '084', NULL, '2023-02-27 18:49:07', 'H269');
INSERT INTO `comuni` VALUES ('084034', 'Sambuca di Sicilia', '084', NULL, '2023-02-27 18:49:07', 'H743');
INSERT INTO `comuni` VALUES ('084035', 'San Biagio Platani', '084', NULL, '2023-02-27 18:49:07', 'H778');
INSERT INTO `comuni` VALUES ('084036', 'San Giovanni Gemini', '084', NULL, '2023-02-27 18:49:07', 'H914');
INSERT INTO `comuni` VALUES ('084037', 'Santa Elisabetta', '084', NULL, '2023-02-27 18:49:07', 'I185');
INSERT INTO `comuni` VALUES ('084038', 'Santa Margherita di Belice', '084', NULL, '2023-02-27 18:49:07', 'I224');
INSERT INTO `comuni` VALUES ('084039', 'Sant\'Angelo Muxaro', '084', NULL, '2023-02-27 18:49:07', 'I290');
INSERT INTO `comuni` VALUES ('084040', 'Santo Stefano Quisquina', '084', NULL, '2023-02-27 18:49:07', 'I356');
INSERT INTO `comuni` VALUES ('084041', 'Sciacca', '084', NULL, '2023-02-27 18:49:07', 'I533');
INSERT INTO `comuni` VALUES ('084042', 'Siculiana', '084', NULL, '2023-02-27 18:49:07', 'I723');
INSERT INTO `comuni` VALUES ('084043', 'Villafranca Sicula', '084', NULL, '2023-02-27 18:49:07', 'L944');
INSERT INTO `comuni` VALUES ('085001', 'Acquaviva Platani', '085', NULL, '2023-02-27 18:49:07', 'A049');
INSERT INTO `comuni` VALUES ('085002', 'Bompensiere', '085', NULL, '2023-02-27 18:49:07', 'A957');
INSERT INTO `comuni` VALUES ('085003', 'Butera', '085', NULL, '2023-02-27 18:49:07', 'B302');
INSERT INTO `comuni` VALUES ('085004', 'Caltanissetta', '085', NULL, '2023-02-27 18:49:07', 'B429');
INSERT INTO `comuni` VALUES ('085005', 'Campofranco', '085', NULL, '2023-02-27 18:49:07', 'B537');
INSERT INTO `comuni` VALUES ('085006', 'Delia', '085', NULL, '2023-02-27 18:49:07', 'D267');
INSERT INTO `comuni` VALUES ('085007', 'Gela', '085', NULL, '2023-02-27 18:49:07', 'D960');
INSERT INTO `comuni` VALUES ('085008', 'Marianopoli', '085', NULL, '2023-02-27 18:49:07', 'E953');
INSERT INTO `comuni` VALUES ('085009', 'Mazzarino', '085', NULL, '2023-02-27 18:49:07', 'F065');
INSERT INTO `comuni` VALUES ('085010', 'Milena', '085', NULL, '2023-02-27 18:49:07', 'E618');
INSERT INTO `comuni` VALUES ('085011', 'Montedoro', '085', NULL, '2023-02-27 18:49:07', 'F489');
INSERT INTO `comuni` VALUES ('085012', 'Mussomeli', '085', NULL, '2023-02-27 18:49:07', 'F830');
INSERT INTO `comuni` VALUES ('085013', 'Niscemi', '085', NULL, '2023-02-27 18:49:07', 'F899');
INSERT INTO `comuni` VALUES ('085014', 'Resuttano', '085', NULL, '2023-02-27 18:49:07', 'H245');
INSERT INTO `comuni` VALUES ('085015', 'Riesi', '085', NULL, '2023-02-27 18:49:07', 'H281');
INSERT INTO `comuni` VALUES ('085016', 'San Cataldo', '085', NULL, '2023-02-27 18:49:07', 'H792');
INSERT INTO `comuni` VALUES ('085017', 'Santa Caterina Villarmosa', '085', NULL, '2023-02-27 18:49:07', 'I169');
INSERT INTO `comuni` VALUES ('085018', 'Serradifalco', '085', NULL, '2023-02-27 18:49:07', 'I644');
INSERT INTO `comuni` VALUES ('085019', 'Sommatino', '085', NULL, '2023-02-27 18:49:07', 'I824');
INSERT INTO `comuni` VALUES ('085020', 'Sutera', '085', NULL, '2023-02-27 18:49:07', 'L016');
INSERT INTO `comuni` VALUES ('085021', 'Vallelunga Pratameno', '085', NULL, '2023-02-27 18:49:07', 'L609');
INSERT INTO `comuni` VALUES ('085022', 'Villalba', '085', NULL, '2023-02-27 18:49:07', 'L959');
INSERT INTO `comuni` VALUES ('086001', 'Agira', '086', NULL, '2023-02-27 18:49:07', 'A070');
INSERT INTO `comuni` VALUES ('086002', 'Aidone', '086', NULL, '2023-02-27 18:49:07', 'A098');
INSERT INTO `comuni` VALUES ('086003', 'Assoro', '086', NULL, '2023-02-27 18:49:07', 'A478');
INSERT INTO `comuni` VALUES ('086004', 'Barrafranca', '086', NULL, '2023-02-27 18:49:07', 'A676');
INSERT INTO `comuni` VALUES ('086005', 'Calascibetta', '086', NULL, '2023-02-27 18:49:07', 'B381');
INSERT INTO `comuni` VALUES ('086006', 'Catenanuova', '086', NULL, '2023-02-27 18:49:07', 'C353');
INSERT INTO `comuni` VALUES ('086007', 'Centuripe', '086', NULL, '2023-02-27 18:49:07', 'C471');
INSERT INTO `comuni` VALUES ('086008', 'Cerami', '086', NULL, '2023-02-27 18:49:07', 'C480');
INSERT INTO `comuni` VALUES ('086009', 'Enna', '086', NULL, '2023-02-27 18:49:07', 'C342');
INSERT INTO `comuni` VALUES ('086010', 'Gagliano Castelferrato', '086', NULL, '2023-02-27 18:49:07', 'D849');
INSERT INTO `comuni` VALUES ('086011', 'Leonforte', '086', NULL, '2023-02-27 18:49:07', 'E536');
INSERT INTO `comuni` VALUES ('086012', 'Nicosia', '086', NULL, '2023-02-27 18:49:07', 'F892');
INSERT INTO `comuni` VALUES ('086013', 'Nissoria', '086', NULL, '2023-02-27 18:49:07', 'F900');
INSERT INTO `comuni` VALUES ('086014', 'Piazza Armerina', '086', NULL, '2023-02-27 18:49:07', 'G580');
INSERT INTO `comuni` VALUES ('086015', 'Pietraperzia', '086', NULL, '2023-02-27 18:49:07', 'G624');
INSERT INTO `comuni` VALUES ('086016', 'Regalbuto', '086', NULL, '2023-02-27 18:49:07', 'H221');
INSERT INTO `comuni` VALUES ('086017', 'Sperlinga', '086', NULL, '2023-02-27 18:49:07', 'I891');
INSERT INTO `comuni` VALUES ('086018', 'Troina', '086', NULL, '2023-02-27 18:49:07', 'L448');
INSERT INTO `comuni` VALUES ('086019', 'Valguarnera Caropepe', '086', NULL, '2023-02-27 18:49:07', 'L583');
INSERT INTO `comuni` VALUES ('086020', 'Villarosa', '086', NULL, '2023-02-27 18:49:07', 'M011');
INSERT INTO `comuni` VALUES ('087001', 'Aci Bonaccorsi', '087', NULL, '2023-02-27 18:49:07', 'A025');
INSERT INTO `comuni` VALUES ('087002', 'Aci Castello', '087', NULL, '2023-02-27 18:49:07', 'A026');
INSERT INTO `comuni` VALUES ('087003', 'Aci Catena', '087', NULL, '2023-02-27 18:49:07', 'A027');
INSERT INTO `comuni` VALUES ('087004', 'Acireale', '087', NULL, '2023-02-27 18:49:07', 'A028');
INSERT INTO `comuni` VALUES ('087005', 'Aci Sant\'Antonio', '087', NULL, '2023-02-27 18:49:07', 'A029');
INSERT INTO `comuni` VALUES ('087006', 'Adrano', '087', NULL, '2023-02-27 18:49:07', 'A056');
INSERT INTO `comuni` VALUES ('087007', 'Belpasso', '087', NULL, '2023-02-27 18:49:07', 'A766');
INSERT INTO `comuni` VALUES ('087008', 'Biancavilla', '087', NULL, '2023-02-27 18:49:07', 'A841');
INSERT INTO `comuni` VALUES ('087009', 'Bronte', '087', NULL, '2023-02-27 18:49:07', 'B202');
INSERT INTO `comuni` VALUES ('087010', 'Calatabiano', '087', NULL, '2023-02-27 18:49:07', 'B384');
INSERT INTO `comuni` VALUES ('087011', 'Caltagirone', '087', NULL, '2023-02-27 18:49:07', 'B428');
INSERT INTO `comuni` VALUES ('087012', 'Camporotondo Etneo', '087', NULL, '2023-02-27 18:49:07', 'B561');
INSERT INTO `comuni` VALUES ('087013', 'Castel di Iudica', '087', NULL, '2023-02-27 18:49:07', 'C091');
INSERT INTO `comuni` VALUES ('087014', 'Castiglione di Sicilia', '087', NULL, '2023-02-27 18:49:07', 'C297');
INSERT INTO `comuni` VALUES ('087015', 'Catania', '087', NULL, '2023-02-27 18:49:07', 'C351');
INSERT INTO `comuni` VALUES ('087016', 'Fiumefreddo di Sicilia', '087', NULL, '2023-02-27 18:49:07', 'D623');
INSERT INTO `comuni` VALUES ('087017', 'Giarre', '087', NULL, '2023-02-27 18:49:07', 'E017');
INSERT INTO `comuni` VALUES ('087018', 'Grammichele', '087', NULL, '2023-02-27 18:49:07', 'E133');
INSERT INTO `comuni` VALUES ('087019', 'Gravina di Catania', '087', NULL, '2023-02-27 18:49:07', 'E156');
INSERT INTO `comuni` VALUES ('087020', 'Licodia Eubea', '087', NULL, '2023-02-27 18:49:07', 'E578');
INSERT INTO `comuni` VALUES ('087021', 'Linguaglossa', '087', NULL, '2023-02-27 18:49:07', 'E602');
INSERT INTO `comuni` VALUES ('087022', 'Maletto', '087', NULL, '2023-02-27 18:49:07', 'E854');
INSERT INTO `comuni` VALUES ('087023', 'Mascali', '087', NULL, '2023-02-27 18:49:07', 'F004');
INSERT INTO `comuni` VALUES ('087024', 'Mascalucia', '087', NULL, '2023-02-27 18:49:07', 'F005');
INSERT INTO `comuni` VALUES ('087025', 'Militello in Val di Catania', '087', NULL, '2023-02-27 18:49:07', 'F209');
INSERT INTO `comuni` VALUES ('087026', 'Milo', '087', NULL, '2023-02-27 18:49:07', 'F214');
INSERT INTO `comuni` VALUES ('087027', 'Mineo', '087', NULL, '2023-02-27 18:49:07', 'F217');
INSERT INTO `comuni` VALUES ('087028', 'Mirabella Imbaccari', '087', NULL, '2023-02-27 18:49:07', 'F231');
INSERT INTO `comuni` VALUES ('087029', 'Misterbianco', '087', NULL, '2023-02-27 18:49:07', 'F250');
INSERT INTO `comuni` VALUES ('087030', 'Motta Sant\'Anastasia', '087', NULL, '2023-02-27 18:49:07', 'F781');
INSERT INTO `comuni` VALUES ('087031', 'Nicolosi', '087', NULL, '2023-02-27 18:49:07', 'F890');
INSERT INTO `comuni` VALUES ('087032', 'Palagonia', '087', NULL, '2023-02-27 18:49:07', 'G253');
INSERT INTO `comuni` VALUES ('087033', 'Paternò', '087', NULL, '2023-02-27 18:49:07', 'G371');
INSERT INTO `comuni` VALUES ('087034', 'Pedara', '087', NULL, '2023-02-27 18:49:07', 'G402');
INSERT INTO `comuni` VALUES ('087035', 'Piedimonte Etneo', '087', NULL, '2023-02-27 18:49:07', 'G597');
INSERT INTO `comuni` VALUES ('087036', 'Raddusa', '087', NULL, '2023-02-27 18:49:07', 'H154');
INSERT INTO `comuni` VALUES ('087037', 'Ramacca', '087', NULL, '2023-02-27 18:49:07', 'H168');
INSERT INTO `comuni` VALUES ('087038', 'Randazzo', '087', NULL, '2023-02-27 18:49:07', 'H175');
INSERT INTO `comuni` VALUES ('087039', 'Riposto', '087', NULL, '2023-02-27 18:49:07', 'H325');
INSERT INTO `comuni` VALUES ('087040', 'San Cono', '087', NULL, '2023-02-27 18:49:07', 'H805');
INSERT INTO `comuni` VALUES ('087041', 'San Giovanni la Punta', '087', NULL, '2023-02-27 18:49:07', 'H922');
INSERT INTO `comuni` VALUES ('087042', 'San Gregorio di Catania', '087', NULL, '2023-02-27 18:49:07', 'H940');
INSERT INTO `comuni` VALUES ('087043', 'San Michele di Ganzaria', '087', NULL, '2023-02-27 18:49:07', 'I035');
INSERT INTO `comuni` VALUES ('087044', 'San Pietro Clarenza', '087', NULL, '2023-02-27 18:49:07', 'I098');
INSERT INTO `comuni` VALUES ('087045', 'Sant\'Agata li Battiati', '087', NULL, '2023-02-27 18:49:07', 'I202');
INSERT INTO `comuni` VALUES ('087046', 'Sant\'Alfio', '087', NULL, '2023-02-27 18:49:07', 'I216');
INSERT INTO `comuni` VALUES ('087047', 'Santa Maria di Licodia', '087', NULL, '2023-02-27 18:49:07', 'I240');
INSERT INTO `comuni` VALUES ('087048', 'Santa Venerina', '087', NULL, '2023-02-27 18:49:07', 'I314');
INSERT INTO `comuni` VALUES ('087049', 'Scordia', '087', NULL, '2023-02-27 18:49:07', 'I548');
INSERT INTO `comuni` VALUES ('087050', 'Trecastagni', '087', NULL, '2023-02-27 18:49:07', 'L355');
INSERT INTO `comuni` VALUES ('087051', 'Tremestieri Etneo', '087', NULL, '2023-02-27 18:49:07', 'L369');
INSERT INTO `comuni` VALUES ('087052', 'Valverde', '087', NULL, '2023-02-27 18:49:07', 'L658');
INSERT INTO `comuni` VALUES ('087053', 'Viagrande', '087', NULL, '2023-02-27 18:49:07', 'L828');
INSERT INTO `comuni` VALUES ('087054', 'Vizzini', '087', NULL, '2023-02-27 18:49:07', 'M100');
INSERT INTO `comuni` VALUES ('087055', 'Zafferana Etnea', '087', NULL, '2023-02-27 18:49:07', 'M139');
INSERT INTO `comuni` VALUES ('087056', 'Mazzarrone', '087', NULL, '2023-02-27 18:49:07', 'M271');
INSERT INTO `comuni` VALUES ('087057', 'Maniace', '087', NULL, '2023-02-27 18:49:07', 'M283');
INSERT INTO `comuni` VALUES ('087058', 'Ragalna', '087', NULL, '2023-02-27 18:49:07', 'M287');
INSERT INTO `comuni` VALUES ('088001', 'Acate', '088', NULL, '2023-02-27 18:49:07', 'A014');
INSERT INTO `comuni` VALUES ('088002', 'Chiaramonte Gulfi', '088', NULL, '2023-02-27 18:49:07', 'C612');
INSERT INTO `comuni` VALUES ('088003', 'Comiso', '088', NULL, '2023-02-27 18:49:07', 'C927');
INSERT INTO `comuni` VALUES ('088004', 'Giarratana', '088', NULL, '2023-02-27 18:49:07', 'E016');
INSERT INTO `comuni` VALUES ('088005', 'Ispica', '088', NULL, '2023-02-27 18:49:07', 'E366');
INSERT INTO `comuni` VALUES ('088006', 'Modica', '088', NULL, '2023-02-27 18:49:07', 'F258');
INSERT INTO `comuni` VALUES ('088007', 'Monterosso Almo', '088', NULL, '2023-02-27 18:49:07', 'F610');
INSERT INTO `comuni` VALUES ('088008', 'Pozzallo', '088', NULL, '2023-02-27 18:49:07', 'G953');
INSERT INTO `comuni` VALUES ('088009', 'Ragusa', '088', NULL, '2023-02-27 18:49:07', 'H163');
INSERT INTO `comuni` VALUES ('088010', 'Santa Croce Camerina', '088', NULL, '2023-02-27 18:49:07', 'I178');
INSERT INTO `comuni` VALUES ('088011', 'Scicli', '088', NULL, '2023-02-27 18:49:07', 'I535');
INSERT INTO `comuni` VALUES ('088012', 'Vittoria', '088', NULL, '2023-02-27 18:49:07', 'M088');
INSERT INTO `comuni` VALUES ('089001', 'Augusta', '089', NULL, '2023-02-27 18:49:07', 'A494');
INSERT INTO `comuni` VALUES ('089002', 'Avola', '089', NULL, '2023-02-27 18:49:07', 'A522');
INSERT INTO `comuni` VALUES ('089003', 'Buccheri', '089', NULL, '2023-02-27 18:49:07', 'B237');
INSERT INTO `comuni` VALUES ('089004', 'Buscemi', '089', NULL, '2023-02-27 18:49:07', 'B287');
INSERT INTO `comuni` VALUES ('089005', 'Canicattini Bagni', '089', NULL, '2023-02-27 18:49:07', 'B603');
INSERT INTO `comuni` VALUES ('089006', 'Carlentini', '089', NULL, '2023-02-27 18:49:07', 'B787');
INSERT INTO `comuni` VALUES ('089007', 'Cassaro', '089', NULL, '2023-02-27 18:49:07', 'C006');
INSERT INTO `comuni` VALUES ('089008', 'Ferla', '089', NULL, '2023-02-27 18:49:07', 'D540');
INSERT INTO `comuni` VALUES ('089009', 'Floridia', '089', NULL, '2023-02-27 18:49:07', 'D636');
INSERT INTO `comuni` VALUES ('089010', 'Francofonte', '089', NULL, '2023-02-27 18:49:07', 'D768');
INSERT INTO `comuni` VALUES ('089011', 'Lentini', '089', NULL, '2023-02-27 18:49:07', 'E532');
INSERT INTO `comuni` VALUES ('089012', 'Melilli', '089', NULL, '2023-02-27 18:49:07', 'F107');
INSERT INTO `comuni` VALUES ('089013', 'Noto', '089', NULL, '2023-02-27 18:49:07', 'F943');
INSERT INTO `comuni` VALUES ('089014', 'Pachino', '089', NULL, '2023-02-27 18:49:07', 'G211');
INSERT INTO `comuni` VALUES ('089015', 'Palazzolo Acreide', '089', NULL, '2023-02-27 18:49:07', 'G267');
INSERT INTO `comuni` VALUES ('089016', 'Rosolini', '089', NULL, '2023-02-27 18:49:07', 'H574');
INSERT INTO `comuni` VALUES ('089017', 'Siracusa', '089', NULL, '2023-02-27 18:49:07', 'I754');
INSERT INTO `comuni` VALUES ('089018', 'Solarino', '089', NULL, '2023-02-27 18:49:07', 'I785');
INSERT INTO `comuni` VALUES ('089019', 'Sortino', '089', NULL, '2023-02-27 18:49:07', 'I864');
INSERT INTO `comuni` VALUES ('089020', 'Portopalo di Capo Passero', '089', NULL, '2023-02-27 18:49:07', 'M257');
INSERT INTO `comuni` VALUES ('089021', 'Priolo Gargallo', '089', NULL, '2023-02-27 18:49:07', 'M279');
INSERT INTO `comuni` VALUES ('090003', 'Alghero', '090', NULL, '2023-02-27 18:49:07', 'A192');
INSERT INTO `comuni` VALUES ('090004', 'Anela', '090', NULL, '2023-02-27 18:49:07', 'A287');
INSERT INTO `comuni` VALUES ('090005', 'Ardara', '090', NULL, '2023-02-27 18:49:07', 'A379');
INSERT INTO `comuni` VALUES ('090007', 'Banari', '090', NULL, '2023-02-27 18:49:07', 'A606');
INSERT INTO `comuni` VALUES ('090008', 'Benetutti', '090', NULL, '2023-02-27 18:49:07', 'A781');
INSERT INTO `comuni` VALUES ('090010', 'Bessude', '090', NULL, '2023-02-27 18:49:07', 'A827');
INSERT INTO `comuni` VALUES ('090011', 'Bonnanaro', '090', NULL, '2023-02-27 18:49:07', 'A976');
INSERT INTO `comuni` VALUES ('090012', 'Bono', '090', NULL, '2023-02-27 18:49:07', 'A977');
INSERT INTO `comuni` VALUES ('090013', 'Bonorva', '090', NULL, '2023-02-27 18:49:07', 'A978');
INSERT INTO `comuni` VALUES ('090015', 'Borutta', '090', NULL, '2023-02-27 18:49:07', 'B064');
INSERT INTO `comuni` VALUES ('090016', 'Bottidda', '090', NULL, '2023-02-27 18:49:07', 'B094');
INSERT INTO `comuni` VALUES ('090018', 'Bultei', '090', NULL, '2023-02-27 18:49:07', 'B264');
INSERT INTO `comuni` VALUES ('090019', 'Bulzi', '090', NULL, '2023-02-27 18:49:07', 'B265');
INSERT INTO `comuni` VALUES ('090020', 'Burgos', '090', NULL, '2023-02-27 18:49:07', 'B276');
INSERT INTO `comuni` VALUES ('090022', 'Cargeghe', '090', NULL, '2023-02-27 18:49:07', 'B772');
INSERT INTO `comuni` VALUES ('090023', 'Castelsardo', '090', NULL, '2023-02-27 18:49:07', 'C272');
INSERT INTO `comuni` VALUES ('090024', 'Cheremule', '090', NULL, '2023-02-27 18:49:07', 'C600');
INSERT INTO `comuni` VALUES ('090025', 'Chiaramonti', '090', NULL, '2023-02-27 18:49:07', 'C613');
INSERT INTO `comuni` VALUES ('090026', 'Codrongianos', '090', NULL, '2023-02-27 18:49:07', 'C818');
INSERT INTO `comuni` VALUES ('090027', 'Cossoine', '090', NULL, '2023-02-27 18:49:07', 'D100');
INSERT INTO `comuni` VALUES ('090028', 'Esporlatu', '090', NULL, '2023-02-27 18:49:07', 'D441');
INSERT INTO `comuni` VALUES ('090029', 'Florinas', '090', NULL, '2023-02-27 18:49:07', 'D637');
INSERT INTO `comuni` VALUES ('090030', 'Giave', '090', NULL, '2023-02-27 18:49:07', 'E019');
INSERT INTO `comuni` VALUES ('090031', 'Illorai', '090', NULL, '2023-02-27 18:49:07', 'E285');
INSERT INTO `comuni` VALUES ('090032', 'Ittireddu', '090', NULL, '2023-02-27 18:49:07', 'E376');
INSERT INTO `comuni` VALUES ('090033', 'Ittiri', '090', NULL, '2023-02-27 18:49:07', 'E377');
INSERT INTO `comuni` VALUES ('090034', 'Laerru', '090', NULL, '2023-02-27 18:49:07', 'E401');
INSERT INTO `comuni` VALUES ('090038', 'Mara', '090', NULL, '2023-02-27 18:49:07', 'E902');
INSERT INTO `comuni` VALUES ('090039', 'Martis', '090', NULL, '2023-02-27 18:49:07', 'E992');
INSERT INTO `comuni` VALUES ('090040', 'Monteleone Rocca Doria', '090', NULL, '2023-02-27 18:49:07', 'F542');
INSERT INTO `comuni` VALUES ('090042', 'Mores', '090', NULL, '2023-02-27 18:49:07', 'F721');
INSERT INTO `comuni` VALUES ('090043', 'Muros', '090', NULL, '2023-02-27 18:49:07', 'F818');
INSERT INTO `comuni` VALUES ('090044', 'Nughedu San Nicolò', '090', NULL, '2023-02-27 18:49:07', 'F975');
INSERT INTO `comuni` VALUES ('090045', 'Nule', '090', NULL, '2023-02-27 18:49:07', 'F976');
INSERT INTO `comuni` VALUES ('090046', 'Nulvi', '090', NULL, '2023-02-27 18:49:07', 'F977');
INSERT INTO `comuni` VALUES ('090048', 'Olmedo', '090', NULL, '2023-02-27 18:49:07', 'G046');
INSERT INTO `comuni` VALUES ('090050', 'Osilo', '090', NULL, '2023-02-27 18:49:07', 'G156');
INSERT INTO `comuni` VALUES ('090051', 'Ossi', '090', NULL, '2023-02-27 18:49:07', 'G178');
INSERT INTO `comuni` VALUES ('090052', 'Ozieri', '090', NULL, '2023-02-27 18:49:07', 'G203');
INSERT INTO `comuni` VALUES ('090053', 'Padria', '090', NULL, '2023-02-27 18:49:07', 'G225');
INSERT INTO `comuni` VALUES ('090055', 'Pattada', '090', NULL, '2023-02-27 18:49:07', 'G376');
INSERT INTO `comuni` VALUES ('090056', 'Perfugas', '090', NULL, '2023-02-27 18:49:07', 'G450');
INSERT INTO `comuni` VALUES ('090057', 'Ploaghe', '090', NULL, '2023-02-27 18:49:07', 'G740');
INSERT INTO `comuni` VALUES ('090058', 'Porto Torres', '090', NULL, '2023-02-27 18:49:07', 'G924');
INSERT INTO `comuni` VALUES ('090059', 'Pozzomaggiore', '090', NULL, '2023-02-27 18:49:07', 'G962');
INSERT INTO `comuni` VALUES ('090060', 'Putifigari', '090', NULL, '2023-02-27 18:49:07', 'H095');
INSERT INTO `comuni` VALUES ('090061', 'Romana', '090', NULL, '2023-02-27 18:49:07', 'H507');
INSERT INTO `comuni` VALUES ('090064', 'Sassari', '090', NULL, '2023-02-27 18:49:07', 'I452');
INSERT INTO `comuni` VALUES ('090065', 'Sedini', '090', NULL, '2023-02-27 18:49:07', 'I565');
INSERT INTO `comuni` VALUES ('090066', 'Semestene', '090', NULL, '2023-02-27 18:49:07', 'I598');
INSERT INTO `comuni` VALUES ('090067', 'Sennori', '090', NULL, '2023-02-27 18:49:07', 'I614');
INSERT INTO `comuni` VALUES ('090068', 'Siligo', '090', NULL, '2023-02-27 18:49:07', 'I732');
INSERT INTO `comuni` VALUES ('090069', 'Sorso', '090', NULL, '2023-02-27 18:49:07', 'I863');
INSERT INTO `comuni` VALUES ('090071', 'Thiesi', '090', NULL, '2023-02-27 18:49:07', 'L158');
INSERT INTO `comuni` VALUES ('090072', 'Tissi', '090', NULL, '2023-02-27 18:49:07', 'L180');
INSERT INTO `comuni` VALUES ('090073', 'Torralba', '090', NULL, '2023-02-27 18:49:07', 'L235');
INSERT INTO `comuni` VALUES ('090075', 'Tula', '090', NULL, '2023-02-27 18:49:07', 'L464');
INSERT INTO `comuni` VALUES ('090076', 'Uri', '090', NULL, '2023-02-27 18:49:07', 'L503');
INSERT INTO `comuni` VALUES ('090077', 'Usini', '090', NULL, '2023-02-27 18:49:07', 'L509');
INSERT INTO `comuni` VALUES ('090078', 'Villanova Monteleone', '090', NULL, '2023-02-27 18:49:07', 'L989');
INSERT INTO `comuni` VALUES ('090079', 'Valledoria', '090', NULL, '2023-02-27 18:49:07', 'L604');
INSERT INTO `comuni` VALUES ('090082', 'Viddalba', '090', NULL, '2023-02-27 18:49:07', 'M259');
INSERT INTO `comuni` VALUES ('090086', 'Tergu', '090', NULL, '2023-02-27 18:49:07', 'M282');
INSERT INTO `comuni` VALUES ('090087', 'Santa Maria Coghinas', '090', NULL, '2023-02-27 18:49:07', 'M284');
INSERT INTO `comuni` VALUES ('090088', 'Erula', '090', NULL, '2023-02-27 18:49:07', 'M292');
INSERT INTO `comuni` VALUES ('090089', 'Stintino', '090', NULL, '2023-02-27 18:49:07', 'M290');
INSERT INTO `comuni` VALUES ('091001', 'Aritzo', '091', NULL, '2023-02-27 18:49:07', 'A407');
INSERT INTO `comuni` VALUES ('091003', 'Atzara', '091', NULL, '2023-02-27 18:49:07', 'A492');
INSERT INTO `comuni` VALUES ('091004', 'Austis', '091', NULL, '2023-02-27 18:49:07', 'A503');
INSERT INTO `comuni` VALUES ('091007', 'Belvì', '091', NULL, '2023-02-27 18:49:07', 'A776');
INSERT INTO `comuni` VALUES ('091008', 'Birori', '091', NULL, '2023-02-27 18:49:07', 'A880');
INSERT INTO `comuni` VALUES ('091009', 'Bitti', '091', NULL, '2023-02-27 18:49:07', 'A895');
INSERT INTO `comuni` VALUES ('091010', 'Bolotana', '091', NULL, '2023-02-27 18:49:07', 'A948');
INSERT INTO `comuni` VALUES ('091011', 'Borore', '091', NULL, '2023-02-27 18:49:07', 'B056');
INSERT INTO `comuni` VALUES ('091012', 'Bortigali', '091', NULL, '2023-02-27 18:49:07', 'B062');
INSERT INTO `comuni` VALUES ('091016', 'Desulo', '091', NULL, '2023-02-27 18:49:07', 'D287');
INSERT INTO `comuni` VALUES ('091017', 'Dorgali', '091', NULL, '2023-02-27 18:49:07', 'D345');
INSERT INTO `comuni` VALUES ('091018', 'Dualchi', '091', NULL, '2023-02-27 18:49:07', 'D376');
INSERT INTO `comuni` VALUES ('091024', 'Fonni', '091', NULL, '2023-02-27 18:49:07', 'D665');
INSERT INTO `comuni` VALUES ('091025', 'Gadoni', '091', NULL, '2023-02-27 18:49:07', 'D842');
INSERT INTO `comuni` VALUES ('091027', 'Galtellì', '091', NULL, '2023-02-27 18:49:07', 'D888');
INSERT INTO `comuni` VALUES ('091028', 'Gavoi', '091', NULL, '2023-02-27 18:49:07', 'D947');
INSERT INTO `comuni` VALUES ('091033', 'Irgoli', '091', NULL, '2023-02-27 18:49:07', 'E323');
INSERT INTO `comuni` VALUES ('091038', 'Lei', '091', NULL, '2023-02-27 18:49:07', 'E517');
INSERT INTO `comuni` VALUES ('091040', 'Loculi', '091', NULL, '2023-02-27 18:49:07', 'E646');
INSERT INTO `comuni` VALUES ('091041', 'Lodè', '091', NULL, '2023-02-27 18:49:07', 'E647');
INSERT INTO `comuni` VALUES ('091043', 'Lula', '091', NULL, '2023-02-27 18:49:07', 'E736');
INSERT INTO `comuni` VALUES ('091044', 'Macomer', '091', NULL, '2023-02-27 18:49:07', 'E788');
INSERT INTO `comuni` VALUES ('091046', 'Mamoiada', '091', NULL, '2023-02-27 18:49:07', 'E874');
INSERT INTO `comuni` VALUES ('091047', 'Meana Sardo', '091', NULL, '2023-02-27 18:49:07', 'F073');
INSERT INTO `comuni` VALUES ('091050', 'Noragugume', '091', NULL, '2023-02-27 18:49:07', 'F933');
INSERT INTO `comuni` VALUES ('091051', 'Nuoro', '091', NULL, '2023-02-27 18:49:07', 'F979');
INSERT INTO `comuni` VALUES ('091055', 'Oliena', '091', NULL, '2023-02-27 18:49:07', 'G031');
INSERT INTO `comuni` VALUES ('091056', 'Ollolai', '091', NULL, '2023-02-27 18:49:07', 'G044');
INSERT INTO `comuni` VALUES ('091057', 'Olzai', '091', NULL, '2023-02-27 18:49:07', 'G058');
INSERT INTO `comuni` VALUES ('091058', 'Onanì', '091', NULL, '2023-02-27 18:49:07', 'G064');
INSERT INTO `comuni` VALUES ('091059', 'Onifai', '091', NULL, '2023-02-27 18:49:07', 'G070');
INSERT INTO `comuni` VALUES ('091060', 'Oniferi', '091', NULL, '2023-02-27 18:49:07', 'G071');
INSERT INTO `comuni` VALUES ('091061', 'Orani', '091', NULL, '2023-02-27 18:49:07', 'G084');
INSERT INTO `comuni` VALUES ('091062', 'Orgosolo', '091', NULL, '2023-02-27 18:49:07', 'G097');
INSERT INTO `comuni` VALUES ('091063', 'Orosei', '091', NULL, '2023-02-27 18:49:07', 'G119');
INSERT INTO `comuni` VALUES ('091064', 'Orotelli', '091', NULL, '2023-02-27 18:49:07', 'G120');
INSERT INTO `comuni` VALUES ('091066', 'Ortueri', '091', NULL, '2023-02-27 18:49:07', 'G146');
INSERT INTO `comuni` VALUES ('091067', 'Orune', '091', NULL, '2023-02-27 18:49:07', 'G147');
INSERT INTO `comuni` VALUES ('091068', 'Osidda', '091', NULL, '2023-02-27 18:49:07', 'G154');
INSERT INTO `comuni` VALUES ('091070', 'Ottana', '091', NULL, '2023-02-27 18:49:07', 'G191');
INSERT INTO `comuni` VALUES ('091071', 'Ovodda', '091', NULL, '2023-02-27 18:49:07', 'G201');
INSERT INTO `comuni` VALUES ('091073', 'Posada', '091', NULL, '2023-02-27 18:49:07', 'G929');
INSERT INTO `comuni` VALUES ('091077', 'Sarule', '091', NULL, '2023-02-27 18:49:07', 'I448');
INSERT INTO `comuni` VALUES ('091083', 'Silanus', '091', NULL, '2023-02-27 18:49:07', 'I730');
INSERT INTO `comuni` VALUES ('091084', 'Sindia', '091', NULL, '2023-02-27 18:49:07', 'I748');
INSERT INTO `comuni` VALUES ('091085', 'Siniscola', '091', NULL, '2023-02-27 18:49:07', 'I751');
INSERT INTO `comuni` VALUES ('091086', 'Sorgono', '091', NULL, '2023-02-27 18:49:07', 'I851');
INSERT INTO `comuni` VALUES ('091090', 'Teti', '091', NULL, '2023-02-27 18:49:07', 'L153');
INSERT INTO `comuni` VALUES ('091091', 'Tiana', '091', NULL, '2023-02-27 18:49:07', 'L160');
INSERT INTO `comuni` VALUES ('091093', 'Tonara', '091', NULL, '2023-02-27 18:49:07', 'L202');
INSERT INTO `comuni` VALUES ('091094', 'Torpè', '091', NULL, '2023-02-27 18:49:07', 'L231');
INSERT INTO `comuni` VALUES ('091104', 'Lodine', '091', NULL, '2023-02-27 18:49:07', 'E649');
INSERT INTO `comuni` VALUES ('092002', 'Armungia', '092', NULL, '2023-02-27 18:49:07', 'A419');
INSERT INTO `comuni` VALUES ('092003', 'Assemini', '092', NULL, '2023-02-27 18:49:07', 'A474');
INSERT INTO `comuni` VALUES ('092004', 'Ballao', '092', NULL, '2023-02-27 18:49:07', 'A597');
INSERT INTO `comuni` VALUES ('092005', 'Barrali', '092', NULL, '2023-02-27 18:49:07', 'A677');
INSERT INTO `comuni` VALUES ('092008', 'Burcei', '092', NULL, '2023-02-27 18:49:07', 'B274');
INSERT INTO `comuni` VALUES ('092009', 'Cagliari', '092', NULL, '2023-02-27 18:49:07', 'B354');
INSERT INTO `comuni` VALUES ('092011', 'Capoterra', '092', NULL, '2023-02-27 18:49:07', 'B675');
INSERT INTO `comuni` VALUES ('092015', 'Decimomannu', '092', NULL, '2023-02-27 18:49:07', 'D259');
INSERT INTO `comuni` VALUES ('092016', 'Decimoputzu', '092', NULL, '2023-02-27 18:49:07', 'D260');
INSERT INTO `comuni` VALUES ('092017', 'Dolianova', '092', NULL, '2023-02-27 18:49:07', 'D323');
INSERT INTO `comuni` VALUES ('092018', 'Domus de Maria', '092', NULL, '2023-02-27 18:49:07', 'D333');
INSERT INTO `comuni` VALUES ('092020', 'Donori', '092', NULL, '2023-02-27 18:49:07', 'D344');
INSERT INTO `comuni` VALUES ('092024', 'Gesico', '092', NULL, '2023-02-27 18:49:07', 'D994');
INSERT INTO `comuni` VALUES ('092027', 'Goni', '092', NULL, '2023-02-27 18:49:07', 'E084');
INSERT INTO `comuni` VALUES ('092030', 'Guamaggiore', '092', NULL, '2023-02-27 18:49:07', 'E234');
INSERT INTO `comuni` VALUES ('092031', 'Guasila', '092', NULL, '2023-02-27 18:49:07', 'E252');
INSERT INTO `comuni` VALUES ('092036', 'Mandas', '092', NULL, '2023-02-27 18:49:07', 'E877');
INSERT INTO `comuni` VALUES ('092037', 'Maracalagonis', '092', NULL, '2023-02-27 18:49:07', 'E903');
INSERT INTO `comuni` VALUES ('092038', 'Monastir', '092', NULL, '2023-02-27 18:49:07', 'F333');
INSERT INTO `comuni` VALUES ('092039', 'Muravera', '092', NULL, '2023-02-27 18:49:07', 'F808');
INSERT INTO `comuni` VALUES ('092042', 'Nuraminis', '092', NULL, '2023-02-27 18:49:07', 'F983');
INSERT INTO `comuni` VALUES ('092044', 'Ortacesus', '092', NULL, '2023-02-27 18:49:07', 'G133');
INSERT INTO `comuni` VALUES ('092048', 'Pimentel', '092', NULL, '2023-02-27 18:49:07', 'G669');
INSERT INTO `comuni` VALUES ('092050', 'Pula', '092', NULL, '2023-02-27 18:49:07', 'H088');
INSERT INTO `comuni` VALUES ('092051', 'Quartu Sant\'Elena', '092', NULL, '2023-02-27 18:49:07', 'H118');
INSERT INTO `comuni` VALUES ('092053', 'Samatzai', '092', NULL, '2023-02-27 18:49:07', 'H739');
INSERT INTO `comuni` VALUES ('092054', 'San Basilio', '092', NULL, '2023-02-27 18:49:07', 'H766');
INSERT INTO `comuni` VALUES ('092058', 'San Nicolò Gerrei', '092', NULL, '2023-02-27 18:49:07', 'G383');
INSERT INTO `comuni` VALUES ('092059', 'San Sperate', '092', NULL, '2023-02-27 18:49:07', 'I166');
INSERT INTO `comuni` VALUES ('092061', 'Sant\'Andrea Frius', '092', NULL, '2023-02-27 18:49:07', 'I271');
INSERT INTO `comuni` VALUES ('092064', 'San Vito', '092', NULL, '2023-02-27 18:49:07', 'I402');
INSERT INTO `comuni` VALUES ('092066', 'Sarroch', '092', NULL, '2023-02-27 18:49:07', 'I443');
INSERT INTO `comuni` VALUES ('092068', 'Selargius', '092', NULL, '2023-02-27 18:49:07', 'I580');
INSERT INTO `comuni` VALUES ('092069', 'Selegas', '092', NULL, '2023-02-27 18:49:07', 'I582');
INSERT INTO `comuni` VALUES ('092070', 'Senorbì', '092', NULL, '2023-02-27 18:49:07', 'I615');
INSERT INTO `comuni` VALUES ('092071', 'Serdiana', '092', NULL, '2023-02-27 18:49:07', 'I624');
INSERT INTO `comuni` VALUES ('092074', 'Sestu', '092', NULL, '2023-02-27 18:49:07', 'I695');
INSERT INTO `comuni` VALUES ('092075', 'Settimo San Pietro', '092', NULL, '2023-02-27 18:49:07', 'I699');
INSERT INTO `comuni` VALUES ('092078', 'Siliqua', '092', NULL, '2023-02-27 18:49:07', 'I734');
INSERT INTO `comuni` VALUES ('092079', 'Silius', '092', NULL, '2023-02-27 18:49:07', 'I735');
INSERT INTO `comuni` VALUES ('092080', 'Sinnai', '092', NULL, '2023-02-27 18:49:07', 'I752');
INSERT INTO `comuni` VALUES ('092081', 'Siurgus Donigala', '092', NULL, '2023-02-27 18:49:07', 'I765');
INSERT INTO `comuni` VALUES ('092082', 'Soleminis', '092', NULL, '2023-02-27 18:49:07', 'I797');
INSERT INTO `comuni` VALUES ('092083', 'Suelli', '092', NULL, '2023-02-27 18:49:07', 'I995');
INSERT INTO `comuni` VALUES ('092084', 'Teulada', '092', NULL, '2023-02-27 18:49:07', 'L154');
INSERT INTO `comuni` VALUES ('092088', 'Ussana', '092', NULL, '2023-02-27 18:49:07', 'L512');
INSERT INTO `comuni` VALUES ('092090', 'Uta', '092', NULL, '2023-02-27 18:49:07', 'L521');
INSERT INTO `comuni` VALUES ('092091', 'Vallermosa', '092', NULL, '2023-02-27 18:49:07', 'L613');
INSERT INTO `comuni` VALUES ('092097', 'Villaputzu', '092', NULL, '2023-02-27 18:49:07', 'L998');
INSERT INTO `comuni` VALUES ('092098', 'Villasalto', '092', NULL, '2023-02-27 18:49:07', 'M016');
INSERT INTO `comuni` VALUES ('092099', 'Villa San Pietro', '092', NULL, '2023-02-27 18:49:07', 'I118');
INSERT INTO `comuni` VALUES ('092100', 'Villasimius', '092', NULL, '2023-02-27 18:49:07', 'B738');
INSERT INTO `comuni` VALUES ('092101', 'Villasor', '092', NULL, '2023-02-27 18:49:07', 'M025');
INSERT INTO `comuni` VALUES ('092102', 'Villaspeciosa', '092', NULL, '2023-02-27 18:49:07', 'M026');
INSERT INTO `comuni` VALUES ('092105', 'Quartucciu', '092', NULL, '2023-02-27 18:49:07', 'H119');
INSERT INTO `comuni` VALUES ('092106', 'Castiadas', '092', NULL, '2023-02-27 18:49:07', 'M288');
INSERT INTO `comuni` VALUES ('092108', 'Elmas', '092', NULL, '2023-02-27 18:49:07', 'D399');
INSERT INTO `comuni` VALUES ('092109', 'Monserrato', '092', NULL, '2023-02-27 18:49:07', 'F383');
INSERT INTO `comuni` VALUES ('092110', 'Escalaplano', '092', NULL, '2023-02-27 18:49:07', 'D430');
INSERT INTO `comuni` VALUES ('092111', 'Escolca', '092', NULL, '2023-02-27 18:49:07', 'D431');
INSERT INTO `comuni` VALUES ('092112', 'Esterzili', '092', NULL, '2023-02-27 18:49:07', 'D443');
INSERT INTO `comuni` VALUES ('092113', 'Gergei', '092', NULL, '2023-02-27 18:49:07', 'D982');
INSERT INTO `comuni` VALUES ('092114', 'Isili', '092', NULL, '2023-02-27 18:49:07', 'E336');
INSERT INTO `comuni` VALUES ('092115', 'Nuragus', '092', NULL, '2023-02-27 18:49:07', 'F981');
INSERT INTO `comuni` VALUES ('092116', 'Nurallao', '092', NULL, '2023-02-27 18:49:07', 'F982');
INSERT INTO `comuni` VALUES ('092117', 'Nurri', '092', NULL, '2023-02-27 18:49:07', 'F986');
INSERT INTO `comuni` VALUES ('092118', 'Orroli', '092', NULL, '2023-02-27 18:49:07', 'G122');
INSERT INTO `comuni` VALUES ('092119', 'Sadali', '092', NULL, '2023-02-27 18:49:07', 'H659');
INSERT INTO `comuni` VALUES ('092120', 'Serri', '092', NULL, '2023-02-27 18:49:07', 'I668');
INSERT INTO `comuni` VALUES ('092121', 'Seulo', '092', NULL, '2023-02-27 18:49:07', 'I707');
INSERT INTO `comuni` VALUES ('092122', 'Villanova Tulo', '092', NULL, '2023-02-27 18:49:07', 'L992');
INSERT INTO `comuni` VALUES ('093001', 'Andreis', '093', NULL, '2023-02-27 18:49:07', 'A283');
INSERT INTO `comuni` VALUES ('093002', 'Arba', '093', NULL, '2023-02-27 18:49:07', 'A354');
INSERT INTO `comuni` VALUES ('093003', 'Arzene', '093', NULL, '2023-02-27 18:49:07', 'A456');
INSERT INTO `comuni` VALUES ('093004', 'Aviano', '093', NULL, '2023-02-27 18:49:07', 'A516');
INSERT INTO `comuni` VALUES ('093005', 'Azzano Decimo', '093', NULL, '2023-02-27 18:49:07', 'A530');
INSERT INTO `comuni` VALUES ('093006', 'Barcis', '093', NULL, '2023-02-27 18:49:07', 'A640');
INSERT INTO `comuni` VALUES ('093007', 'Brugnera', '093', NULL, '2023-02-27 18:49:07', 'B215');
INSERT INTO `comuni` VALUES ('093008', 'Budoia', '093', NULL, '2023-02-27 18:49:07', 'B247');
INSERT INTO `comuni` VALUES ('093009', 'Caneva', '093', NULL, '2023-02-27 18:49:07', 'B598');
INSERT INTO `comuni` VALUES ('093010', 'Casarsa della Delizia', '093', NULL, '2023-02-27 18:49:07', 'B940');
INSERT INTO `comuni` VALUES ('093011', 'Castelnovo del Friuli', '093', NULL, '2023-02-27 18:49:07', 'C217');
INSERT INTO `comuni` VALUES ('093012', 'Cavasso Nuovo', '093', NULL, '2023-02-27 18:49:07', 'C385');
INSERT INTO `comuni` VALUES ('093013', 'Chions', '093', NULL, '2023-02-27 18:49:07', 'C640');
INSERT INTO `comuni` VALUES ('093014', 'Cimolais', '093', NULL, '2023-02-27 18:49:07', 'C699');
INSERT INTO `comuni` VALUES ('093015', 'Claut', '093', NULL, '2023-02-27 18:49:07', 'C790');
INSERT INTO `comuni` VALUES ('093016', 'Clauzetto', '093', NULL, '2023-02-27 18:49:07', 'C791');
INSERT INTO `comuni` VALUES ('093017', 'Cordenons', '093', NULL, '2023-02-27 18:49:07', 'C991');
INSERT INTO `comuni` VALUES ('093018', 'Cordovado', '093', NULL, '2023-02-27 18:49:07', 'C993');
INSERT INTO `comuni` VALUES ('093019', 'Erto e Casso', '093', NULL, '2023-02-27 18:49:07', 'D426');
INSERT INTO `comuni` VALUES ('093020', 'Fanna', '093', NULL, '2023-02-27 18:49:07', 'D487');
INSERT INTO `comuni` VALUES ('093021', 'Fiume Veneto', '093', NULL, '2023-02-27 18:49:07', 'D621');
INSERT INTO `comuni` VALUES ('093022', 'Fontanafredda', '093', NULL, '2023-02-27 18:49:07', 'D670');
INSERT INTO `comuni` VALUES ('093024', 'Frisanco', '093', NULL, '2023-02-27 18:49:07', 'D804');
INSERT INTO `comuni` VALUES ('093025', 'Maniago', '093', NULL, '2023-02-27 18:49:07', 'E889');
INSERT INTO `comuni` VALUES ('093026', 'Meduno', '093', NULL, '2023-02-27 18:49:07', 'F089');
INSERT INTO `comuni` VALUES ('093027', 'Montereale Valcellina', '093', NULL, '2023-02-27 18:49:07', 'F596');
INSERT INTO `comuni` VALUES ('093028', 'Morsano al Tagliamento', '093', NULL, '2023-02-27 18:49:07', 'F750');
INSERT INTO `comuni` VALUES ('093029', 'Pasiano di Pordenone', '093', NULL, '2023-02-27 18:49:07', 'G353');
INSERT INTO `comuni` VALUES ('093030', 'Pinzano al Tagliamento', '093', NULL, '2023-02-27 18:49:07', 'G680');
INSERT INTO `comuni` VALUES ('093031', 'Polcenigo', '093', NULL, '2023-02-27 18:49:07', 'G780');
INSERT INTO `comuni` VALUES ('093032', 'Porcia', '093', NULL, '2023-02-27 18:49:07', 'G886');
INSERT INTO `comuni` VALUES ('093033', 'Pordenone', '093', NULL, '2023-02-27 18:49:07', 'G888');
INSERT INTO `comuni` VALUES ('093034', 'Prata di Pordenone', '093', NULL, '2023-02-27 18:49:07', 'G994');
INSERT INTO `comuni` VALUES ('093035', 'Pravisdomini', '093', NULL, '2023-02-27 18:49:07', 'H010');
INSERT INTO `comuni` VALUES ('093036', 'Roveredo in Piano', '093', NULL, '2023-02-27 18:49:07', 'H609');
INSERT INTO `comuni` VALUES ('093037', 'Sacile', '093', NULL, '2023-02-27 18:49:07', 'H657');
INSERT INTO `comuni` VALUES ('093038', 'San Giorgio della Richinvelda', '093', NULL, '2023-02-27 18:49:07', 'H891');
INSERT INTO `comuni` VALUES ('093039', 'San Martino al Tagliamento', '093', NULL, '2023-02-27 18:49:07', 'H999');
INSERT INTO `comuni` VALUES ('093040', 'San Quirino', '093', NULL, '2023-02-27 18:49:07', 'I136');
INSERT INTO `comuni` VALUES ('093041', 'San Vito al Tagliamento', '093', NULL, '2023-02-27 18:49:07', 'I403');
INSERT INTO `comuni` VALUES ('093042', 'Sequals', '093', NULL, '2023-02-27 18:49:07', 'I621');
INSERT INTO `comuni` VALUES ('093043', 'Sesto al Reghena', '093', NULL, '2023-02-27 18:49:07', 'I686');
INSERT INTO `comuni` VALUES ('093044', 'Spilimbergo', '093', NULL, '2023-02-27 18:49:07', 'I904');
INSERT INTO `comuni` VALUES ('093045', 'Tramonti di Sopra', '093', NULL, '2023-02-27 18:49:07', 'L324');
INSERT INTO `comuni` VALUES ('093046', 'Tramonti di Sotto', '093', NULL, '2023-02-27 18:49:07', 'L325');
INSERT INTO `comuni` VALUES ('093047', 'Travesio', '093', NULL, '2023-02-27 18:49:07', 'L347');
INSERT INTO `comuni` VALUES ('093048', 'Valvasone', '093', NULL, '2023-02-27 18:49:07', 'L657');
INSERT INTO `comuni` VALUES ('093049', 'Vito d\'Asio', '093', NULL, '2023-02-27 18:49:07', 'M085');
INSERT INTO `comuni` VALUES ('093050', 'Vivaro', '093', NULL, '2023-02-27 18:49:07', 'M096');
INSERT INTO `comuni` VALUES ('093051', 'Zoppola', '093', NULL, '2023-02-27 18:49:07', 'M190');
INSERT INTO `comuni` VALUES ('093052', 'Vajont', '093', NULL, '2023-02-27 18:49:07', 'M265');
INSERT INTO `comuni` VALUES ('094001', 'Acquaviva d\'Isernia', '094', NULL, '2023-02-27 18:49:07', 'A051');
INSERT INTO `comuni` VALUES ('094002', 'Agnone', '094', NULL, '2023-02-27 18:49:07', 'A080');
INSERT INTO `comuni` VALUES ('094003', 'Bagnoli del Trigno', '094', NULL, '2023-02-27 18:49:07', 'A567');
INSERT INTO `comuni` VALUES ('094004', 'Belmonte del Sannio', '094', NULL, '2023-02-27 18:49:07', 'A761');
INSERT INTO `comuni` VALUES ('094005', 'Cantalupo nel Sannio', '094', NULL, '2023-02-27 18:49:07', 'B630');
INSERT INTO `comuni` VALUES ('094006', 'Capracotta', '094', NULL, '2023-02-27 18:49:07', 'B682');
INSERT INTO `comuni` VALUES ('094007', 'Carovilli', '094', NULL, '2023-02-27 18:49:07', 'B810');
INSERT INTO `comuni` VALUES ('094008', 'Carpinone', '094', NULL, '2023-02-27 18:49:07', 'B830');
INSERT INTO `comuni` VALUES ('094009', 'Castel del Giudice', '094', NULL, '2023-02-27 18:49:07', 'C082');
INSERT INTO `comuni` VALUES ('094010', 'Castelpetroso', '094', NULL, '2023-02-27 18:49:07', 'C246');
INSERT INTO `comuni` VALUES ('094011', 'Castelpizzuto', '094', NULL, '2023-02-27 18:49:07', 'C247');
INSERT INTO `comuni` VALUES ('094012', 'Castel San Vincenzo', '094', NULL, '2023-02-27 18:49:07', 'C270');
INSERT INTO `comuni` VALUES ('094013', 'Castelverrino', '094', NULL, '2023-02-27 18:49:07', 'C200');
INSERT INTO `comuni` VALUES ('094014', 'Cerro al Volturno', '094', NULL, '2023-02-27 18:49:07', 'C534');
INSERT INTO `comuni` VALUES ('094015', 'Chiauci', '094', NULL, '2023-02-27 18:49:07', 'C620');
INSERT INTO `comuni` VALUES ('094016', 'Civitanova del Sannio', '094', NULL, '2023-02-27 18:49:07', 'C769');
INSERT INTO `comuni` VALUES ('094017', 'Colli a Volturno', '094', NULL, '2023-02-27 18:49:07', 'C878');
INSERT INTO `comuni` VALUES ('094018', 'Conca Casale', '094', NULL, '2023-02-27 18:49:07', 'C941');
INSERT INTO `comuni` VALUES ('094019', 'Filignano', '094', NULL, '2023-02-27 18:49:07', 'D595');
INSERT INTO `comuni` VALUES ('094020', 'Forlì del Sannio', '094', NULL, '2023-02-27 18:49:07', 'D703');
INSERT INTO `comuni` VALUES ('094021', 'Fornelli', '094', NULL, '2023-02-27 18:49:07', 'D715');
INSERT INTO `comuni` VALUES ('094022', 'Frosolone', '094', NULL, '2023-02-27 18:49:07', 'D811');
INSERT INTO `comuni` VALUES ('094023', 'Isernia', '094', NULL, '2023-02-27 18:49:07', 'E335');
INSERT INTO `comuni` VALUES ('094024', 'Longano', '094', NULL, '2023-02-27 18:49:07', 'E669');
INSERT INTO `comuni` VALUES ('094025', 'Macchia d\'Isernia', '094', NULL, '2023-02-27 18:49:07', 'E778');
INSERT INTO `comuni` VALUES ('094026', 'Macchiagodena', '094', NULL, '2023-02-27 18:49:07', 'E779');
INSERT INTO `comuni` VALUES ('094027', 'Miranda', '094', NULL, '2023-02-27 18:49:07', 'F239');
INSERT INTO `comuni` VALUES ('094028', 'Montaquila', '094', NULL, '2023-02-27 18:49:07', 'F429');
INSERT INTO `comuni` VALUES ('094029', 'Montenero Val Cocchiara', '094', NULL, '2023-02-27 18:49:07', 'F580');
INSERT INTO `comuni` VALUES ('094030', 'Monteroduni', '094', NULL, '2023-02-27 18:49:07', 'F601');
INSERT INTO `comuni` VALUES ('094031', 'Pesche', '094', NULL, '2023-02-27 18:49:07', 'G486');
INSERT INTO `comuni` VALUES ('094032', 'Pescolanciano', '094', NULL, '2023-02-27 18:49:07', 'G495');
INSERT INTO `comuni` VALUES ('094033', 'Pescopennataro', '094', NULL, '2023-02-27 18:49:07', 'G497');
INSERT INTO `comuni` VALUES ('094034', 'Pettoranello del Molise', '094', NULL, '2023-02-27 18:49:07', 'G523');
INSERT INTO `comuni` VALUES ('094035', 'Pietrabbondante', '094', NULL, '2023-02-27 18:49:07', 'G606');
INSERT INTO `comuni` VALUES ('094036', 'Pizzone', '094', NULL, '2023-02-27 18:49:07', 'G727');
INSERT INTO `comuni` VALUES ('094037', 'Poggio Sannita', '094', NULL, '2023-02-27 18:49:07', 'B317');
INSERT INTO `comuni` VALUES ('094038', 'Pozzilli', '094', NULL, '2023-02-27 18:49:07', 'G954');
INSERT INTO `comuni` VALUES ('094039', 'Rionero Sannitico', '094', NULL, '2023-02-27 18:49:07', 'H308');
INSERT INTO `comuni` VALUES ('094040', 'Roccamandolfi', '094', NULL, '2023-02-27 18:49:07', 'H420');
INSERT INTO `comuni` VALUES ('094041', 'Roccasicura', '094', NULL, '2023-02-27 18:49:07', 'H445');
INSERT INTO `comuni` VALUES ('094042', 'Rocchetta a Volturno', '094', NULL, '2023-02-27 18:49:07', 'H458');
INSERT INTO `comuni` VALUES ('094043', 'San Pietro Avellana', '094', NULL, '2023-02-27 18:49:07', 'I096');
INSERT INTO `comuni` VALUES ('094044', 'Sant\'Agapito', '094', NULL, '2023-02-27 18:49:07', 'I189');
INSERT INTO `comuni` VALUES ('094045', 'Santa Maria del Molise', '094', NULL, '2023-02-27 18:49:07', 'I238');
INSERT INTO `comuni` VALUES ('094046', 'Sant\'Angelo del Pesco', '094', NULL, '2023-02-27 18:49:07', 'I282');
INSERT INTO `comuni` VALUES ('094047', 'Sant\'Elena Sannita', '094', NULL, '2023-02-27 18:49:07', 'B466');
INSERT INTO `comuni` VALUES ('094048', 'Scapoli', '094', NULL, '2023-02-27 18:49:07', 'I507');
INSERT INTO `comuni` VALUES ('094049', 'Sessano del Molise', '094', NULL, '2023-02-27 18:49:07', 'I679');
INSERT INTO `comuni` VALUES ('094050', 'Sesto Campano', '094', NULL, '2023-02-27 18:49:07', 'I682');
INSERT INTO `comuni` VALUES ('094051', 'Vastogirardi', '094', NULL, '2023-02-27 18:49:07', 'L696');
INSERT INTO `comuni` VALUES ('094052', 'Venafro', '094', NULL, '2023-02-27 18:49:07', 'L725');
INSERT INTO `comuni` VALUES ('095001', 'Abbasanta', '095', NULL, '2023-02-27 18:49:07', 'A007');
INSERT INTO `comuni` VALUES ('095002', 'Aidomaggiore', '095', NULL, '2023-02-27 18:49:07', 'A097');
INSERT INTO `comuni` VALUES ('095003', 'Albagiara', '095', NULL, '2023-02-27 18:49:07', 'A126');
INSERT INTO `comuni` VALUES ('095004', 'Ales', '095', NULL, '2023-02-27 18:49:07', 'A180');
INSERT INTO `comuni` VALUES ('095005', 'Allai', '095', NULL, '2023-02-27 18:49:07', 'A204');
INSERT INTO `comuni` VALUES ('095006', 'Arborea', '095', NULL, '2023-02-27 18:49:07', 'A357');
INSERT INTO `comuni` VALUES ('095007', 'Ardauli', '095', NULL, '2023-02-27 18:49:07', 'A380');
INSERT INTO `comuni` VALUES ('095008', 'Assolo', '095', NULL, '2023-02-27 18:49:07', 'A477');
INSERT INTO `comuni` VALUES ('095009', 'Asuni', '095', NULL, '2023-02-27 18:49:07', 'A480');
INSERT INTO `comuni` VALUES ('095010', 'Baradili', '095', NULL, '2023-02-27 18:49:07', 'A614');
INSERT INTO `comuni` VALUES ('095011', 'Baratili San Pietro', '095', NULL, '2023-02-27 18:49:07', 'A621');
INSERT INTO `comuni` VALUES ('095012', 'Baressa', '095', NULL, '2023-02-27 18:49:07', 'A655');
INSERT INTO `comuni` VALUES ('095013', 'Bauladu', '095', NULL, '2023-02-27 18:49:07', 'A721');
INSERT INTO `comuni` VALUES ('095014', 'Bidonì', '095', NULL, '2023-02-27 18:49:07', 'A856');
INSERT INTO `comuni` VALUES ('095015', 'Bonarcado', '095', NULL, '2023-02-27 18:49:07', 'A960');
INSERT INTO `comuni` VALUES ('095016', 'Boroneddu', '095', NULL, '2023-02-27 18:49:07', 'B055');
INSERT INTO `comuni` VALUES ('095017', 'Busachi', '095', NULL, '2023-02-27 18:49:07', 'B281');
INSERT INTO `comuni` VALUES ('095018', 'Cabras', '095', NULL, '2023-02-27 18:49:07', 'B314');
INSERT INTO `comuni` VALUES ('095019', 'Cuglieri', '095', NULL, '2023-02-27 18:49:07', 'D200');
INSERT INTO `comuni` VALUES ('095020', 'Fordongianus', '095', NULL, '2023-02-27 18:49:07', 'D695');
INSERT INTO `comuni` VALUES ('095021', 'Ghilarza', '095', NULL, '2023-02-27 18:49:07', 'E004');
INSERT INTO `comuni` VALUES ('095022', 'Gonnoscodina', '095', NULL, '2023-02-27 18:49:07', 'E087');
INSERT INTO `comuni` VALUES ('095023', 'Gonnosnò', '095', NULL, '2023-02-27 18:49:07', 'D585');
INSERT INTO `comuni` VALUES ('095024', 'Gonnostramatza', '095', NULL, '2023-02-27 18:49:07', 'E088');
INSERT INTO `comuni` VALUES ('095025', 'Marrubiu', '095', NULL, '2023-02-27 18:49:07', 'E972');
INSERT INTO `comuni` VALUES ('095026', 'Masullas', '095', NULL, '2023-02-27 18:49:07', 'F050');
INSERT INTO `comuni` VALUES ('095027', 'Milis', '095', NULL, '2023-02-27 18:49:07', 'F208');
INSERT INTO `comuni` VALUES ('095028', 'Mogorella', '095', NULL, '2023-02-27 18:49:07', 'F270');
INSERT INTO `comuni` VALUES ('095029', 'Mogoro', '095', NULL, '2023-02-27 18:49:07', 'F272');
INSERT INTO `comuni` VALUES ('095030', 'Morgongiori', '095', NULL, '2023-02-27 18:49:07', 'F727');
INSERT INTO `comuni` VALUES ('095031', 'Narbolia', '095', NULL, '2023-02-27 18:49:07', 'F840');
INSERT INTO `comuni` VALUES ('095032', 'Neoneli', '095', NULL, '2023-02-27 18:49:07', 'F867');
INSERT INTO `comuni` VALUES ('095033', 'Norbello', '095', NULL, '2023-02-27 18:49:07', 'F934');
INSERT INTO `comuni` VALUES ('095034', 'Nughedu Santa Vittoria', '095', NULL, '2023-02-27 18:49:07', 'F974');
INSERT INTO `comuni` VALUES ('095035', 'Nurachi', '095', NULL, '2023-02-27 18:49:07', 'F980');
INSERT INTO `comuni` VALUES ('095036', 'Nureci', '095', NULL, '2023-02-27 18:49:07', 'F985');
INSERT INTO `comuni` VALUES ('095037', 'Ollastra', '095', NULL, '2023-02-27 18:49:07', 'G043');
INSERT INTO `comuni` VALUES ('095038', 'Oristano', '095', NULL, '2023-02-27 18:49:07', 'G113');
INSERT INTO `comuni` VALUES ('095039', 'Palmas Arborea', '095', NULL, '2023-02-27 18:49:07', 'G286');
INSERT INTO `comuni` VALUES ('095040', 'Pau', '095', NULL, '2023-02-27 18:49:07', 'G379');
INSERT INTO `comuni` VALUES ('095041', 'Paulilatino', '095', NULL, '2023-02-27 18:49:07', 'G384');
INSERT INTO `comuni` VALUES ('095042', 'Pompu', '095', NULL, '2023-02-27 18:49:07', 'G817');
INSERT INTO `comuni` VALUES ('095043', 'Riola Sardo', '095', NULL, '2023-02-27 18:49:07', 'H301');
INSERT INTO `comuni` VALUES ('095044', 'Ruinas', '095', NULL, '2023-02-27 18:49:07', 'F271');
INSERT INTO `comuni` VALUES ('095045', 'Samugheo', '095', NULL, '2023-02-27 18:49:07', 'H756');
INSERT INTO `comuni` VALUES ('095046', 'San Nicolò d\'Arcidano', '095', NULL, '2023-02-27 18:49:07', 'A368');
INSERT INTO `comuni` VALUES ('095047', 'Santa Giusta', '095', NULL, '2023-02-27 18:49:07', 'I205');
INSERT INTO `comuni` VALUES ('095048', 'Villa Sant\'Antonio', '095', NULL, '2023-02-27 18:49:07', 'I298');
INSERT INTO `comuni` VALUES ('095049', 'Santu Lussurgiu', '095', NULL, '2023-02-27 18:49:07', 'I374');
INSERT INTO `comuni` VALUES ('095050', 'San Vero Milis', '095', NULL, '2023-02-27 18:49:07', 'I384');
INSERT INTO `comuni` VALUES ('095051', 'Scano di Montiferro', '095', NULL, '2023-02-27 18:49:07', 'I503');
INSERT INTO `comuni` VALUES ('095052', 'Sedilo', '095', NULL, '2023-02-27 18:49:07', 'I564');
INSERT INTO `comuni` VALUES ('095053', 'Seneghe', '095', NULL, '2023-02-27 18:49:07', 'I605');
INSERT INTO `comuni` VALUES ('095054', 'Senis', '095', NULL, '2023-02-27 18:49:07', 'I609');
INSERT INTO `comuni` VALUES ('095055', 'Sennariolo', '095', NULL, '2023-02-27 18:49:07', 'I613');
INSERT INTO `comuni` VALUES ('095056', 'Siamaggiore', '095', NULL, '2023-02-27 18:49:07', 'I717');
INSERT INTO `comuni` VALUES ('095057', 'Siamanna', '095', NULL, '2023-02-27 18:49:07', 'I718');
INSERT INTO `comuni` VALUES ('095058', 'Simala', '095', NULL, '2023-02-27 18:49:07', 'I742');
INSERT INTO `comuni` VALUES ('095059', 'Simaxis', '095', NULL, '2023-02-27 18:49:07', 'I743');
INSERT INTO `comuni` VALUES ('095060', 'Sini', '095', NULL, '2023-02-27 18:49:07', 'I749');
INSERT INTO `comuni` VALUES ('095061', 'Siris', '095', NULL, '2023-02-27 18:49:07', 'I757');
INSERT INTO `comuni` VALUES ('095062', 'Solarussa', '095', NULL, '2023-02-27 18:49:07', 'I791');
INSERT INTO `comuni` VALUES ('095063', 'Sorradile', '095', NULL, '2023-02-27 18:49:07', 'I861');
INSERT INTO `comuni` VALUES ('095064', 'Tadasuni', '095', NULL, '2023-02-27 18:49:07', 'L023');
INSERT INTO `comuni` VALUES ('095065', 'Terralba', '095', NULL, '2023-02-27 18:49:07', 'L122');
INSERT INTO `comuni` VALUES ('095066', 'Tramatza', '095', NULL, '2023-02-27 18:49:07', 'L321');
INSERT INTO `comuni` VALUES ('095067', 'Tresnuraghes', '095', NULL, '2023-02-27 18:49:07', 'L393');
INSERT INTO `comuni` VALUES ('095068', 'Ulà Tirso', '095', NULL, '2023-02-27 18:49:07', 'L488');
INSERT INTO `comuni` VALUES ('095069', 'Uras', '095', NULL, '2023-02-27 18:49:07', 'L496');
INSERT INTO `comuni` VALUES ('095070', 'Usellus', '095', NULL, '2023-02-27 18:49:07', 'L508');
INSERT INTO `comuni` VALUES ('095071', 'Villanova Truschedu', '095', NULL, '2023-02-27 18:49:07', 'L991');
INSERT INTO `comuni` VALUES ('095072', 'Villaurbana', '095', NULL, '2023-02-27 18:49:07', 'M030');
INSERT INTO `comuni` VALUES ('095073', 'Villa Verde', '095', NULL, '2023-02-27 18:49:07', 'A609');
INSERT INTO `comuni` VALUES ('095074', 'Zeddiani', '095', NULL, '2023-02-27 18:49:07', 'M153');
INSERT INTO `comuni` VALUES ('095075', 'Zerfaliu', '095', NULL, '2023-02-27 18:49:07', 'M168');
INSERT INTO `comuni` VALUES ('095076', 'Siapiccia', '095', NULL, '2023-02-27 18:49:07', 'I721');
INSERT INTO `comuni` VALUES ('095077', 'Curcuris', '095', NULL, '2023-02-27 18:49:07', 'D214');
INSERT INTO `comuni` VALUES ('095078', 'Soddì', '095', NULL, '2023-02-27 18:49:07', 'I778');
INSERT INTO `comuni` VALUES ('095079', 'Bosa', '095', NULL, '2023-02-27 18:49:07', 'B068');
INSERT INTO `comuni` VALUES ('095080', 'Flussio', '095', NULL, '2023-02-27 18:49:07', 'D640');
INSERT INTO `comuni` VALUES ('095081', 'Genoni', '095', NULL, '2023-02-27 18:49:07', 'D968');
INSERT INTO `comuni` VALUES ('095082', 'Laconi', '095', NULL, '2023-02-27 18:49:07', 'E400');
INSERT INTO `comuni` VALUES ('095083', 'Magomadas', '095', NULL, '2023-02-27 18:49:07', 'E825');
INSERT INTO `comuni` VALUES ('095084', 'Modolo', '095', NULL, '2023-02-27 18:49:07', 'F261');
INSERT INTO `comuni` VALUES ('095085', 'Montresta', '095', NULL, '2023-02-27 18:49:07', 'F698');
INSERT INTO `comuni` VALUES ('095086', 'Sagama', '095', NULL, '2023-02-27 18:49:07', 'H661');
INSERT INTO `comuni` VALUES ('095087', 'Suni', '095', NULL, '2023-02-27 18:49:07', 'L006');
INSERT INTO `comuni` VALUES ('095088', 'Tinnura', '095', NULL, '2023-02-27 18:49:07', 'L172');
INSERT INTO `comuni` VALUES ('096001', 'Ailoche', '096', NULL, '2023-02-27 18:49:07', 'A107');
INSERT INTO `comuni` VALUES ('096002', 'Andorno Micca', '096', NULL, '2023-02-27 18:49:07', 'A280');
INSERT INTO `comuni` VALUES ('096003', 'Benna', '096', NULL, '2023-02-27 18:49:07', 'A784');
INSERT INTO `comuni` VALUES ('096004', 'Biella', '096', NULL, '2023-02-27 18:49:07', 'A859');
INSERT INTO `comuni` VALUES ('096005', 'Bioglio', '096', NULL, '2023-02-27 18:49:07', 'A876');
INSERT INTO `comuni` VALUES ('096006', 'Borriana', '096', NULL, '2023-02-27 18:49:07', 'B058');
INSERT INTO `comuni` VALUES ('096007', 'Brusnengo', '096', NULL, '2023-02-27 18:49:07', 'B229');
INSERT INTO `comuni` VALUES ('096008', 'Callabiana', '096', NULL, '2023-02-27 18:49:07', 'B417');
INSERT INTO `comuni` VALUES ('096009', 'Camandona', '096', NULL, '2023-02-27 18:49:07', 'B457');
INSERT INTO `comuni` VALUES ('096010', 'Camburzano', '096', NULL, '2023-02-27 18:49:07', 'B465');
INSERT INTO `comuni` VALUES ('096011', 'Campiglia Cervo', '096', NULL, '2023-02-27 18:49:07', 'B508');
INSERT INTO `comuni` VALUES ('096012', 'Candelo', '096', NULL, '2023-02-27 18:49:07', 'B586');
INSERT INTO `comuni` VALUES ('096013', 'Caprile', '096', NULL, '2023-02-27 18:49:07', 'B708');
INSERT INTO `comuni` VALUES ('096014', 'Casapinta', '096', NULL, '2023-02-27 18:49:07', 'B933');
INSERT INTO `comuni` VALUES ('096015', 'Castelletto Cervo', '096', NULL, '2023-02-27 18:49:07', 'C155');
INSERT INTO `comuni` VALUES ('096016', 'Cavaglià', '096', NULL, '2023-02-27 18:49:07', 'C363');
INSERT INTO `comuni` VALUES ('096017', 'Cerreto Castello', '096', NULL, '2023-02-27 18:49:07', 'C526');
INSERT INTO `comuni` VALUES ('096018', 'Cerrione', '096', NULL, '2023-02-27 18:49:07', 'C532');
INSERT INTO `comuni` VALUES ('096019', 'Coggiola', '096', NULL, '2023-02-27 18:49:07', 'C819');
INSERT INTO `comuni` VALUES ('096020', 'Cossato', '096', NULL, '2023-02-27 18:49:07', 'D094');
INSERT INTO `comuni` VALUES ('096021', 'Crevacuore', '096', NULL, '2023-02-27 18:49:07', 'D165');
INSERT INTO `comuni` VALUES ('096022', 'Crosa', '096', NULL, '2023-02-27 18:49:07', 'D182');
INSERT INTO `comuni` VALUES ('096023', 'Curino', '096', NULL, '2023-02-27 18:49:07', 'D219');
INSERT INTO `comuni` VALUES ('096024', 'Donato', '096', NULL, '2023-02-27 18:49:07', 'D339');
INSERT INTO `comuni` VALUES ('096025', 'Dorzano', '096', NULL, '2023-02-27 18:49:07', 'D350');
INSERT INTO `comuni` VALUES ('096026', 'Gaglianico', '096', NULL, '2023-02-27 18:49:07', 'D848');
INSERT INTO `comuni` VALUES ('096027', 'Gifflenga', '096', NULL, '2023-02-27 18:49:07', 'E024');
INSERT INTO `comuni` VALUES ('096028', 'Graglia', '096', NULL, '2023-02-27 18:49:07', 'E130');
INSERT INTO `comuni` VALUES ('096029', 'Lessona', '096', NULL, '2023-02-27 18:49:07', 'E552');
INSERT INTO `comuni` VALUES ('096030', 'Magnano', '096', NULL, '2023-02-27 18:49:07', 'E821');
INSERT INTO `comuni` VALUES ('096031', 'Massazza', '096', NULL, '2023-02-27 18:49:07', 'F037');
INSERT INTO `comuni` VALUES ('096032', 'Masserano', '096', NULL, '2023-02-27 18:49:07', 'F042');
INSERT INTO `comuni` VALUES ('096033', 'Mezzana Mortigliengo', '096', NULL, '2023-02-27 18:49:07', 'F167');
INSERT INTO `comuni` VALUES ('096034', 'Miagliano', '096', NULL, '2023-02-27 18:49:07', 'F189');
INSERT INTO `comuni` VALUES ('096035', 'Mongrando', '096', NULL, '2023-02-27 18:49:07', 'F369');
INSERT INTO `comuni` VALUES ('096037', 'Mottalciata', '096', NULL, '2023-02-27 18:49:07', 'F776');
INSERT INTO `comuni` VALUES ('096038', 'Muzzano', '096', NULL, '2023-02-27 18:49:07', 'F833');
INSERT INTO `comuni` VALUES ('096039', 'Netro', '096', NULL, '2023-02-27 18:49:07', 'F878');
INSERT INTO `comuni` VALUES ('096040', 'Occhieppo Inferiore', '096', NULL, '2023-02-27 18:49:07', 'F992');
INSERT INTO `comuni` VALUES ('096041', 'Occhieppo Superiore', '096', NULL, '2023-02-27 18:49:07', 'F993');
INSERT INTO `comuni` VALUES ('096042', 'Pettinengo', '096', NULL, '2023-02-27 18:49:07', 'G521');
INSERT INTO `comuni` VALUES ('096043', 'Piatto', '096', NULL, '2023-02-27 18:49:07', 'G577');
INSERT INTO `comuni` VALUES ('096044', 'Piedicavallo', '096', NULL, '2023-02-27 18:49:07', 'G594');
INSERT INTO `comuni` VALUES ('096046', 'Pollone', '096', NULL, '2023-02-27 18:49:07', 'G798');
INSERT INTO `comuni` VALUES ('096047', 'Ponderano', '096', NULL, '2023-02-27 18:49:07', 'G820');
INSERT INTO `comuni` VALUES ('096048', 'Portula', '096', NULL, '2023-02-27 18:49:07', 'G927');
INSERT INTO `comuni` VALUES ('096049', 'Pralungo', '096', NULL, '2023-02-27 18:49:07', 'G980');
INSERT INTO `comuni` VALUES ('096050', 'Pray', '096', NULL, '2023-02-27 18:49:07', 'G974');
INSERT INTO `comuni` VALUES ('096051', 'Quaregna', '096', NULL, '2023-02-27 18:49:07', 'H103');
INSERT INTO `comuni` VALUES ('096052', 'Quittengo', '096', NULL, '2023-02-27 18:49:07', 'H145');
INSERT INTO `comuni` VALUES ('096053', 'Ronco Biellese', '096', NULL, '2023-02-27 18:49:07', 'H538');
INSERT INTO `comuni` VALUES ('096054', 'Roppolo', '096', NULL, '2023-02-27 18:49:07', 'H553');
INSERT INTO `comuni` VALUES ('096055', 'Rosazza', '096', NULL, '2023-02-27 18:49:07', 'H561');
INSERT INTO `comuni` VALUES ('096056', 'Sagliano Micca', '096', NULL, '2023-02-27 18:49:07', 'H662');
INSERT INTO `comuni` VALUES ('096057', 'Sala Biellese', '096', NULL, '2023-02-27 18:49:07', 'H681');
INSERT INTO `comuni` VALUES ('096058', 'Salussola', '096', NULL, '2023-02-27 18:49:07', 'H726');
INSERT INTO `comuni` VALUES ('096059', 'Sandigliano', '096', NULL, '2023-02-27 18:49:07', 'H821');
INSERT INTO `comuni` VALUES ('096060', 'San Paolo Cervo', '096', NULL, '2023-02-27 18:49:07', 'I074');
INSERT INTO `comuni` VALUES ('096061', 'Selve Marcone', '096', NULL, '2023-02-27 18:49:07', 'I596');
INSERT INTO `comuni` VALUES ('096062', 'Soprana', '096', NULL, '2023-02-27 18:49:07', 'I835');
INSERT INTO `comuni` VALUES ('096063', 'Sordevolo', '096', NULL, '2023-02-27 18:49:07', 'I847');
INSERT INTO `comuni` VALUES ('096064', 'Sostegno', '096', NULL, '2023-02-27 18:49:07', 'I868');
INSERT INTO `comuni` VALUES ('096065', 'Strona', '096', NULL, '2023-02-27 18:49:07', 'I980');
INSERT INTO `comuni` VALUES ('096066', 'Tavigliano', '096', NULL, '2023-02-27 18:49:07', 'L075');
INSERT INTO `comuni` VALUES ('096067', 'Ternengo', '096', NULL, '2023-02-27 18:49:07', 'L116');
INSERT INTO `comuni` VALUES ('096068', 'Tollegno', '096', NULL, '2023-02-27 18:49:07', 'L193');
INSERT INTO `comuni` VALUES ('096069', 'Torrazzo', '096', NULL, '2023-02-27 18:49:07', 'L239');
INSERT INTO `comuni` VALUES ('096070', 'Trivero', '096', NULL, '2023-02-27 18:49:07', 'L436');
INSERT INTO `comuni` VALUES ('096071', 'Valdengo', '096', NULL, '2023-02-27 18:49:07', 'L556');
INSERT INTO `comuni` VALUES ('096072', 'Vallanzengo', '096', NULL, '2023-02-27 18:49:07', 'L586');
INSERT INTO `comuni` VALUES ('096073', 'Valle Mosso', '096', NULL, '2023-02-27 18:49:07', 'L606');
INSERT INTO `comuni` VALUES ('096074', 'Valle San Nicolao', '096', NULL, '2023-02-27 18:49:07', 'L620');
INSERT INTO `comuni` VALUES ('096075', 'Veglio', '096', NULL, '2023-02-27 18:49:07', 'L712');
INSERT INTO `comuni` VALUES ('096076', 'Verrone', '096', NULL, '2023-02-27 18:49:07', 'L785');
INSERT INTO `comuni` VALUES ('096077', 'Vigliano Biellese', '096', NULL, '2023-02-27 18:49:07', 'L880');
INSERT INTO `comuni` VALUES ('096078', 'Villa del Bosco', '096', NULL, '2023-02-27 18:49:07', 'L933');
INSERT INTO `comuni` VALUES ('096079', 'Villanova Biellese', '096', NULL, '2023-02-27 18:49:07', 'L978');
INSERT INTO `comuni` VALUES ('096080', 'Viverone', '096', NULL, '2023-02-27 18:49:07', 'M098');
INSERT INTO `comuni` VALUES ('096081', 'Zimone', '096', NULL, '2023-02-27 18:49:07', 'M179');
INSERT INTO `comuni` VALUES ('096082', 'Zubiena', '096', NULL, '2023-02-27 18:49:07', 'M196');
INSERT INTO `comuni` VALUES ('096083', 'Zumaglia', '096', NULL, '2023-02-27 18:49:07', 'M201');
INSERT INTO `comuni` VALUES ('096084', 'Mosso', '096', NULL, '2023-02-27 18:49:07', 'M304');
INSERT INTO `comuni` VALUES ('097001', 'Abbadia Lariana', '097', NULL, '2023-02-27 18:49:07', 'A005');
INSERT INTO `comuni` VALUES ('097002', 'Airuno', '097', NULL, '2023-02-27 18:49:07', 'A112');
INSERT INTO `comuni` VALUES ('097003', 'Annone di Brianza', '097', NULL, '2023-02-27 18:49:07', 'A301');
INSERT INTO `comuni` VALUES ('097004', 'Ballabio', '097', NULL, '2023-02-27 18:49:07', 'A594');
INSERT INTO `comuni` VALUES ('097005', 'Barzago', '097', NULL, '2023-02-27 18:49:07', 'A683');
INSERT INTO `comuni` VALUES ('097006', 'Barzanò', '097', NULL, '2023-02-27 18:49:07', 'A686');
INSERT INTO `comuni` VALUES ('097007', 'Barzio', '097', NULL, '2023-02-27 18:49:07', 'A687');
INSERT INTO `comuni` VALUES ('097008', 'Bellano', '097', NULL, '2023-02-27 18:49:07', 'A745');
INSERT INTO `comuni` VALUES ('097009', 'Bosisio Parini', '097', NULL, '2023-02-27 18:49:07', 'B081');
INSERT INTO `comuni` VALUES ('097010', 'Brivio', '097', NULL, '2023-02-27 18:49:07', 'B194');
INSERT INTO `comuni` VALUES ('097011', 'Bulciago', '097', NULL, '2023-02-27 18:49:07', 'B261');
INSERT INTO `comuni` VALUES ('097012', 'Calco', '097', NULL, '2023-02-27 18:49:07', 'B396');
INSERT INTO `comuni` VALUES ('097013', 'Calolziocorte', '097', NULL, '2023-02-27 18:49:07', 'B423');
INSERT INTO `comuni` VALUES ('097014', 'Carenno', '097', NULL, '2023-02-27 18:49:07', 'B763');
INSERT INTO `comuni` VALUES ('097015', 'Casargo', '097', NULL, '2023-02-27 18:49:07', 'B937');
INSERT INTO `comuni` VALUES ('097016', 'Casatenovo', '097', NULL, '2023-02-27 18:49:07', 'B943');
INSERT INTO `comuni` VALUES ('097017', 'Cassago Brianza', '097', NULL, '2023-02-27 18:49:07', 'B996');
INSERT INTO `comuni` VALUES ('097018', 'Cassina Valsassina', '097', NULL, '2023-02-27 18:49:07', 'C024');
INSERT INTO `comuni` VALUES ('097019', 'Castello di Brianza', '097', NULL, '2023-02-27 18:49:07', 'C187');
INSERT INTO `comuni` VALUES ('097020', 'Cernusco Lombardone', '097', NULL, '2023-02-27 18:49:07', 'C521');
INSERT INTO `comuni` VALUES ('097021', 'Cesana Brianza', '097', NULL, '2023-02-27 18:49:07', 'C563');
INSERT INTO `comuni` VALUES ('097022', 'Civate', '097', NULL, '2023-02-27 18:49:07', 'C752');
INSERT INTO `comuni` VALUES ('097023', 'Colico', '097', NULL, '2023-02-27 18:49:07', 'C839');
INSERT INTO `comuni` VALUES ('097024', 'Colle Brianza', '097', NULL, '2023-02-27 18:49:07', 'C851');
INSERT INTO `comuni` VALUES ('097025', 'Cortenova', '097', NULL, '2023-02-27 18:49:07', 'D065');
INSERT INTO `comuni` VALUES ('097026', 'Costa Masnaga', '097', NULL, '2023-02-27 18:49:07', 'D112');
INSERT INTO `comuni` VALUES ('097027', 'Crandola Valsassina', '097', NULL, '2023-02-27 18:49:07', 'D131');
INSERT INTO `comuni` VALUES ('097028', 'Cremella', '097', NULL, '2023-02-27 18:49:07', 'D143');
INSERT INTO `comuni` VALUES ('097029', 'Cremeno', '097', NULL, '2023-02-27 18:49:07', 'D145');
INSERT INTO `comuni` VALUES ('097030', 'Dervio', '097', NULL, '2023-02-27 18:49:07', 'D280');
INSERT INTO `comuni` VALUES ('097031', 'Dolzago', '097', NULL, '2023-02-27 18:49:07', 'D327');
INSERT INTO `comuni` VALUES ('097032', 'Dorio', '097', NULL, '2023-02-27 18:49:07', 'D346');
INSERT INTO `comuni` VALUES ('097033', 'Ello', '097', NULL, '2023-02-27 18:49:07', 'D398');
INSERT INTO `comuni` VALUES ('097034', 'Erve', '097', NULL, '2023-02-27 18:49:07', 'D428');
INSERT INTO `comuni` VALUES ('097035', 'Esino Lario', '097', NULL, '2023-02-27 18:49:07', 'D436');
INSERT INTO `comuni` VALUES ('097036', 'Galbiate', '097', NULL, '2023-02-27 18:49:07', 'D865');
INSERT INTO `comuni` VALUES ('097037', 'Garbagnate Monastero', '097', NULL, '2023-02-27 18:49:07', 'D913');
INSERT INTO `comuni` VALUES ('097038', 'Garlate', '097', NULL, '2023-02-27 18:49:07', 'D926');
INSERT INTO `comuni` VALUES ('097039', 'Imbersago', '097', NULL, '2023-02-27 18:49:07', 'E287');
INSERT INTO `comuni` VALUES ('097040', 'Introbio', '097', NULL, '2023-02-27 18:49:07', 'E305');
INSERT INTO `comuni` VALUES ('097041', 'Introzzo', '097', NULL, '2023-02-27 18:49:07', 'E308');
INSERT INTO `comuni` VALUES ('097042', 'Lecco', '097', NULL, '2023-02-27 18:49:07', 'E507');
INSERT INTO `comuni` VALUES ('097043', 'Lierna', '097', NULL, '2023-02-27 18:49:07', 'E581');
INSERT INTO `comuni` VALUES ('097044', 'Lomagna', '097', NULL, '2023-02-27 18:49:07', 'E656');
INSERT INTO `comuni` VALUES ('097045', 'Malgrate', '097', NULL, '2023-02-27 18:49:07', 'E858');
INSERT INTO `comuni` VALUES ('097046', 'Mandello del Lario', '097', NULL, '2023-02-27 18:49:07', 'E879');
INSERT INTO `comuni` VALUES ('097047', 'Margno', '097', NULL, '2023-02-27 18:49:07', 'E947');
INSERT INTO `comuni` VALUES ('097048', 'Merate', '097', NULL, '2023-02-27 18:49:07', 'F133');
INSERT INTO `comuni` VALUES ('097049', 'Missaglia', '097', NULL, '2023-02-27 18:49:07', 'F248');
INSERT INTO `comuni` VALUES ('097050', 'Moggio', '097', NULL, '2023-02-27 18:49:07', 'F265');
INSERT INTO `comuni` VALUES ('097051', 'Molteno', '097', NULL, '2023-02-27 18:49:07', 'F304');
INSERT INTO `comuni` VALUES ('097052', 'Monte Marenzo', '097', NULL, '2023-02-27 18:49:07', 'F561');
INSERT INTO `comuni` VALUES ('097053', 'Montevecchia', '097', NULL, '2023-02-27 18:49:07', 'F657');
INSERT INTO `comuni` VALUES ('097054', 'Monticello Brianza', '097', NULL, '2023-02-27 18:49:07', 'F674');
INSERT INTO `comuni` VALUES ('097055', 'Morterone', '097', NULL, '2023-02-27 18:49:07', 'F758');
INSERT INTO `comuni` VALUES ('097056', 'Nibionno', '097', NULL, '2023-02-27 18:49:07', 'F887');
INSERT INTO `comuni` VALUES ('097057', 'Oggiono', '097', NULL, '2023-02-27 18:49:07', 'G009');
INSERT INTO `comuni` VALUES ('097058', 'Olgiate Molgora', '097', NULL, '2023-02-27 18:49:07', 'G026');
INSERT INTO `comuni` VALUES ('097059', 'Olginate', '097', NULL, '2023-02-27 18:49:07', 'G030');
INSERT INTO `comuni` VALUES ('097060', 'Oliveto Lario', '097', NULL, '2023-02-27 18:49:07', 'G040');
INSERT INTO `comuni` VALUES ('097061', 'Osnago', '097', NULL, '2023-02-27 18:49:07', 'G161');
INSERT INTO `comuni` VALUES ('097062', 'Paderno d\'Adda', '097', NULL, '2023-02-27 18:49:07', 'G218');
INSERT INTO `comuni` VALUES ('097063', 'Pagnona', '097', NULL, '2023-02-27 18:49:07', 'G241');
INSERT INTO `comuni` VALUES ('097064', 'Parlasco', '097', NULL, '2023-02-27 18:49:07', 'G336');
INSERT INTO `comuni` VALUES ('097065', 'Pasturo', '097', NULL, '2023-02-27 18:49:07', 'G368');
INSERT INTO `comuni` VALUES ('097066', 'Perego', '097', NULL, '2023-02-27 18:49:07', 'G448');
INSERT INTO `comuni` VALUES ('097067', 'Perledo', '097', NULL, '2023-02-27 18:49:07', 'G456');
INSERT INTO `comuni` VALUES ('097068', 'Pescate', '097', NULL, '2023-02-27 18:49:07', 'G485');
INSERT INTO `comuni` VALUES ('097069', 'Premana', '097', NULL, '2023-02-27 18:49:07', 'H028');
INSERT INTO `comuni` VALUES ('097070', 'Primaluna', '097', NULL, '2023-02-27 18:49:07', 'H063');
INSERT INTO `comuni` VALUES ('097071', 'Robbiate', '097', NULL, '2023-02-27 18:49:07', 'G223');
INSERT INTO `comuni` VALUES ('097072', 'Rogeno', '097', NULL, '2023-02-27 18:49:07', 'H486');
INSERT INTO `comuni` VALUES ('097073', 'Rovagnate', '097', NULL, '2023-02-27 18:49:07', 'H596');
INSERT INTO `comuni` VALUES ('097074', 'Santa Maria Hoè', '097', NULL, '2023-02-27 18:49:07', 'I243');
INSERT INTO `comuni` VALUES ('097075', 'Sirone', '097', NULL, '2023-02-27 18:49:07', 'I759');
INSERT INTO `comuni` VALUES ('097076', 'Sirtori', '097', NULL, '2023-02-27 18:49:07', 'I761');
INSERT INTO `comuni` VALUES ('097077', 'Sueglio', '097', NULL, '2023-02-27 18:49:07', 'I994');
INSERT INTO `comuni` VALUES ('097078', 'Suello', '097', NULL, '2023-02-27 18:49:07', 'I996');
INSERT INTO `comuni` VALUES ('097079', 'Taceno', '097', NULL, '2023-02-27 18:49:07', 'L022');
INSERT INTO `comuni` VALUES ('097080', 'Torre de\' Busi', '097', NULL, '2023-02-27 18:49:07', 'L257');
INSERT INTO `comuni` VALUES ('097081', 'Tremenico', '097', NULL, '2023-02-27 18:49:07', 'L368');
INSERT INTO `comuni` VALUES ('097082', 'Valgreghentino', '097', NULL, '2023-02-27 18:49:07', 'L581');
INSERT INTO `comuni` VALUES ('097083', 'Valmadrera', '097', NULL, '2023-02-27 18:49:07', 'L634');
INSERT INTO `comuni` VALUES ('097084', 'Varenna', '097', NULL, '2023-02-27 18:49:07', 'L680');
INSERT INTO `comuni` VALUES ('097085', 'Vendrogno', '097', NULL, '2023-02-27 18:49:07', 'L731');
INSERT INTO `comuni` VALUES ('097086', 'Vercurago', '097', NULL, '2023-02-27 18:49:07', 'L751');
INSERT INTO `comuni` VALUES ('097089', 'Vestreno', '097', NULL, '2023-02-27 18:49:07', 'L813');
INSERT INTO `comuni` VALUES ('097090', 'Viganò', '097', NULL, '2023-02-27 18:49:07', 'L866');
INSERT INTO `comuni` VALUES ('097091', 'Verderio', '097', NULL, '2023-02-27 18:49:07', 'M337');
INSERT INTO `comuni` VALUES ('098001', 'Abbadia Cerreto', '098', NULL, '2023-02-27 18:49:07', 'A004');
INSERT INTO `comuni` VALUES ('098002', 'Bertonico', '098', NULL, '2023-02-27 18:49:07', 'A811');
INSERT INTO `comuni` VALUES ('098003', 'Boffalora d\'Adda', '098', NULL, '2023-02-27 18:49:07', 'A919');
INSERT INTO `comuni` VALUES ('098004', 'Borghetto Lodigiano', '098', NULL, '2023-02-27 18:49:07', 'A995');
INSERT INTO `comuni` VALUES ('098005', 'Borgo San Giovanni', '098', NULL, '2023-02-27 18:49:07', 'B017');
INSERT INTO `comuni` VALUES ('098006', 'Brembio', '098', NULL, '2023-02-27 18:49:07', 'B141');
INSERT INTO `comuni` VALUES ('098007', 'Camairago', '098', NULL, '2023-02-27 18:49:07', 'B456');
INSERT INTO `comuni` VALUES ('098008', 'Casaletto Lodigiano', '098', NULL, '2023-02-27 18:49:07', 'B887');
INSERT INTO `comuni` VALUES ('098009', 'Casalmaiocco', '098', NULL, '2023-02-27 18:49:07', 'B899');
INSERT INTO `comuni` VALUES ('098010', 'Casalpusterlengo', '098', NULL, '2023-02-27 18:49:07', 'B910');
INSERT INTO `comuni` VALUES ('098011', 'Caselle Landi', '098', NULL, '2023-02-27 18:49:07', 'B961');
INSERT INTO `comuni` VALUES ('098012', 'Caselle Lurani', '098', NULL, '2023-02-27 18:49:07', 'B958');
INSERT INTO `comuni` VALUES ('098013', 'Castelnuovo Bocca d\'Adda', '098', NULL, '2023-02-27 18:49:07', 'C228');
INSERT INTO `comuni` VALUES ('098014', 'Castiglione d\'Adda', '098', NULL, '2023-02-27 18:49:07', 'C304');
INSERT INTO `comuni` VALUES ('098015', 'Castiraga Vidardo', '098', NULL, '2023-02-27 18:49:07', 'C329');
INSERT INTO `comuni` VALUES ('098016', 'Cavacurta', '098', NULL, '2023-02-27 18:49:07', 'C362');
INSERT INTO `comuni` VALUES ('098017', 'Cavenago d\'Adda', '098', NULL, '2023-02-27 18:49:07', 'C394');
INSERT INTO `comuni` VALUES ('098018', 'Cervignano d\'Adda', '098', NULL, '2023-02-27 18:49:07', 'C555');
INSERT INTO `comuni` VALUES ('098019', 'Codogno', '098', NULL, '2023-02-27 18:49:07', 'C816');
INSERT INTO `comuni` VALUES ('098020', 'Comazzo', '098', NULL, '2023-02-27 18:49:07', 'C917');
INSERT INTO `comuni` VALUES ('098021', 'Cornegliano Laudense', '098', NULL, '2023-02-27 18:49:07', 'D021');
INSERT INTO `comuni` VALUES ('098022', 'Corno Giovine', '098', NULL, '2023-02-27 18:49:07', 'D028');
INSERT INTO `comuni` VALUES ('098023', 'Cornovecchio', '098', NULL, '2023-02-27 18:49:07', 'D029');
INSERT INTO `comuni` VALUES ('098024', 'Corte Palasio', '098', NULL, '2023-02-27 18:49:07', 'D068');
INSERT INTO `comuni` VALUES ('098025', 'Crespiatica', '098', NULL, '2023-02-27 18:49:07', 'D159');
INSERT INTO `comuni` VALUES ('098026', 'Fombio', '098', NULL, '2023-02-27 18:49:07', 'D660');
INSERT INTO `comuni` VALUES ('098027', 'Galgagnano', '098', NULL, '2023-02-27 18:49:07', 'D868');
INSERT INTO `comuni` VALUES ('098028', 'Graffignana', '098', NULL, '2023-02-27 18:49:07', 'E127');
INSERT INTO `comuni` VALUES ('098029', 'Guardamiglio', '098', NULL, '2023-02-27 18:49:07', 'E238');
INSERT INTO `comuni` VALUES ('098030', 'Livraga', '098', NULL, '2023-02-27 18:49:07', 'E627');
INSERT INTO `comuni` VALUES ('098031', 'Lodi', '098', NULL, '2023-02-27 18:49:07', 'E648');
INSERT INTO `comuni` VALUES ('098032', 'Lodi Vecchio', '098', NULL, '2023-02-27 18:49:07', 'E651');
INSERT INTO `comuni` VALUES ('098033', 'Maccastorna', '098', NULL, '2023-02-27 18:49:07', 'E777');
INSERT INTO `comuni` VALUES ('098034', 'Mairago', '098', NULL, '2023-02-27 18:49:07', 'E840');
INSERT INTO `comuni` VALUES ('098035', 'Maleo', '098', NULL, '2023-02-27 18:49:07', 'E852');
INSERT INTO `comuni` VALUES ('098036', 'Marudo', '098', NULL, '2023-02-27 18:49:07', 'E994');
INSERT INTO `comuni` VALUES ('098037', 'Massalengo', '098', NULL, '2023-02-27 18:49:07', 'F028');
INSERT INTO `comuni` VALUES ('098038', 'Meleti', '098', NULL, '2023-02-27 18:49:07', 'F102');
INSERT INTO `comuni` VALUES ('098039', 'Merlino', '098', NULL, '2023-02-27 18:49:07', 'F149');
INSERT INTO `comuni` VALUES ('098040', 'Montanaso Lombardo', '098', NULL, '2023-02-27 18:49:07', 'F423');
INSERT INTO `comuni` VALUES ('098041', 'Mulazzano', '098', NULL, '2023-02-27 18:49:07', 'F801');
INSERT INTO `comuni` VALUES ('098042', 'Orio Litta', '098', NULL, '2023-02-27 18:49:07', 'G107');
INSERT INTO `comuni` VALUES ('098043', 'Ospedaletto Lodigiano', '098', NULL, '2023-02-27 18:49:07', 'G166');
INSERT INTO `comuni` VALUES ('098044', 'Ossago Lodigiano', '098', NULL, '2023-02-27 18:49:07', 'G171');
INSERT INTO `comuni` VALUES ('098045', 'Pieve Fissiraga', '098', NULL, '2023-02-27 18:49:07', 'G096');
INSERT INTO `comuni` VALUES ('098046', 'Salerano sul Lambro', '098', NULL, '2023-02-27 18:49:07', 'H701');
INSERT INTO `comuni` VALUES ('098047', 'San Fiorano', '098', NULL, '2023-02-27 18:49:07', 'H844');
INSERT INTO `comuni` VALUES ('098048', 'San Martino in Strada', '098', NULL, '2023-02-27 18:49:07', 'I012');
INSERT INTO `comuni` VALUES ('098049', 'San Rocco al Porto', '098', NULL, '2023-02-27 18:49:07', 'I140');
INSERT INTO `comuni` VALUES ('098050', 'Sant\'Angelo Lodigiano', '098', NULL, '2023-02-27 18:49:07', 'I274');
INSERT INTO `comuni` VALUES ('098051', 'Santo Stefano Lodigiano', '098', NULL, '2023-02-27 18:49:07', 'I362');
INSERT INTO `comuni` VALUES ('098052', 'Secugnago', '098', NULL, '2023-02-27 18:49:07', 'I561');
INSERT INTO `comuni` VALUES ('098053', 'Senna Lodigiana', '098', NULL, '2023-02-27 18:49:07', 'I612');
INSERT INTO `comuni` VALUES ('098054', 'Somaglia', '098', NULL, '2023-02-27 18:49:07', 'I815');
INSERT INTO `comuni` VALUES ('098055', 'Sordio', '098', NULL, '2023-02-27 18:49:07', 'I848');
INSERT INTO `comuni` VALUES ('098056', 'Tavazzano con Villavesco', '098', NULL, '2023-02-27 18:49:07', 'F260');
INSERT INTO `comuni` VALUES ('098057', 'Terranova dei Passerini', '098', NULL, '2023-02-27 18:49:07', 'L125');
INSERT INTO `comuni` VALUES ('098058', 'Turano Lodigiano', '098', NULL, '2023-02-27 18:49:07', 'L469');
INSERT INTO `comuni` VALUES ('098059', 'Valera Fratta', '098', NULL, '2023-02-27 18:49:07', 'L572');
INSERT INTO `comuni` VALUES ('098060', 'Villanova del Sillaro', '098', NULL, '2023-02-27 18:49:07', 'L977');
INSERT INTO `comuni` VALUES ('098061', 'Zelo Buon Persico', '098', NULL, '2023-02-27 18:49:07', 'M158');
INSERT INTO `comuni` VALUES ('099001', 'Bellaria-Igea Marina', '099', NULL, '2023-02-27 18:49:07', 'A747');
INSERT INTO `comuni` VALUES ('099002', 'Cattolica', '099', NULL, '2023-02-27 18:49:07', 'C357');
INSERT INTO `comuni` VALUES ('099003', 'Coriano', '099', NULL, '2023-02-27 18:49:07', 'D004');
INSERT INTO `comuni` VALUES ('099004', 'Gemmano', '099', NULL, '2023-02-27 18:49:07', 'D961');
INSERT INTO `comuni` VALUES ('099005', 'Misano Adriatico', '099', NULL, '2023-02-27 18:49:07', 'F244');
INSERT INTO `comuni` VALUES ('099006', 'Mondaino', '099', NULL, '2023-02-27 18:49:07', 'F346');
INSERT INTO `comuni` VALUES ('099007', 'Monte Colombo', '099', NULL, '2023-02-27 18:49:07', 'F476');
INSERT INTO `comuni` VALUES ('099008', 'Montefiore Conca', '099', NULL, '2023-02-27 18:49:07', 'F502');
INSERT INTO `comuni` VALUES ('099009', 'Montegridolfo', '099', NULL, '2023-02-27 18:49:07', 'F523');
INSERT INTO `comuni` VALUES ('099010', 'Montescudo', '099', NULL, '2023-02-27 18:49:07', 'F641');
INSERT INTO `comuni` VALUES ('099011', 'Morciano di Romagna', '099', NULL, '2023-02-27 18:49:07', 'F715');
INSERT INTO `comuni` VALUES ('099013', 'Riccione', '099', NULL, '2023-02-27 18:49:07', 'H274');
INSERT INTO `comuni` VALUES ('099014', 'Rimini', '099', NULL, '2023-02-27 18:49:07', 'H294');
INSERT INTO `comuni` VALUES ('099015', 'Saludecio', '099', NULL, '2023-02-27 18:49:07', 'H724');
INSERT INTO `comuni` VALUES ('099016', 'San Clemente', '099', NULL, '2023-02-27 18:49:07', 'H801');
INSERT INTO `comuni` VALUES ('099017', 'San Giovanni in Marignano', '099', NULL, '2023-02-27 18:49:07', 'H921');
INSERT INTO `comuni` VALUES ('099018', 'Santarcangelo di Romagna', '099', NULL, '2023-02-27 18:49:07', 'I304');
INSERT INTO `comuni` VALUES ('099020', 'Verucchio', '099', NULL, '2023-02-27 18:49:07', 'L797');
INSERT INTO `comuni` VALUES ('099021', 'Casteldelci', '099', NULL, '2023-02-27 18:49:07', 'C080');
INSERT INTO `comuni` VALUES ('099022', 'Maiolo', '099', NULL, '2023-02-27 18:49:07', 'E838');
INSERT INTO `comuni` VALUES ('099023', 'Novafeltria', '099', NULL, '2023-02-27 18:49:07', 'F137');
INSERT INTO `comuni` VALUES ('099024', 'Pennabilli', '099', NULL, '2023-02-27 18:49:07', 'G433');
INSERT INTO `comuni` VALUES ('099025', 'San Leo', '099', NULL, '2023-02-27 18:49:07', 'H949');
INSERT INTO `comuni` VALUES ('099026', 'Sant\'Agata Feltria', '099', NULL, '2023-02-27 18:49:07', 'I201');
INSERT INTO `comuni` VALUES ('099027', 'Talamello', '099', NULL, '2023-02-27 18:49:07', 'L034');
INSERT INTO `comuni` VALUES ('099028', 'Poggio Torriana', '099', NULL, '2023-02-27 18:49:07', 'M324');
INSERT INTO `comuni` VALUES ('100001', 'Cantagallo', '100', NULL, '2023-02-27 18:49:07', 'B626');
INSERT INTO `comuni` VALUES ('100002', 'Carmignano', '100', NULL, '2023-02-27 18:49:07', 'B794');
INSERT INTO `comuni` VALUES ('100003', 'Montemurlo', '100', NULL, '2023-02-27 18:49:07', 'F572');
INSERT INTO `comuni` VALUES ('100004', 'Poggio a Caiano', '100', NULL, '2023-02-27 18:49:07', 'G754');
INSERT INTO `comuni` VALUES ('100005', 'Prato', '100', NULL, '2023-02-27 18:49:07', 'G999');
INSERT INTO `comuni` VALUES ('100006', 'Vaiano', '100', NULL, '2023-02-27 18:49:07', 'L537');
INSERT INTO `comuni` VALUES ('100007', 'Vernio', '100', NULL, '2023-02-27 18:49:07', 'L775');
INSERT INTO `comuni` VALUES ('101001', 'Belvedere di Spinello', '101', NULL, '2023-02-27 18:49:07', 'A772');
INSERT INTO `comuni` VALUES ('101002', 'Caccuri', '101', NULL, '2023-02-27 18:49:07', 'B319');
INSERT INTO `comuni` VALUES ('101003', 'Carfizzi', '101', NULL, '2023-02-27 18:49:07', 'B771');
INSERT INTO `comuni` VALUES ('101004', 'Casabona', '101', NULL, '2023-02-27 18:49:07', 'B857');
INSERT INTO `comuni` VALUES ('101005', 'Castelsilano', '101', NULL, '2023-02-27 18:49:07', 'B968');
INSERT INTO `comuni` VALUES ('101006', 'Cerenzia', '101', NULL, '2023-02-27 18:49:07', 'C501');
INSERT INTO `comuni` VALUES ('101007', 'Cirò', '101', NULL, '2023-02-27 18:49:07', 'C725');
INSERT INTO `comuni` VALUES ('101008', 'Cirò Marina', '101', NULL, '2023-02-27 18:49:07', 'C726');
INSERT INTO `comuni` VALUES ('101009', 'Cotronei', '101', NULL, '2023-02-27 18:49:07', 'D123');
INSERT INTO `comuni` VALUES ('101010', 'Crotone', '101', NULL, '2023-02-27 18:49:07', 'D122');
INSERT INTO `comuni` VALUES ('101011', 'Crucoli', '101', NULL, '2023-02-27 18:49:07', 'D189');
INSERT INTO `comuni` VALUES ('101012', 'Cutro', '101', NULL, '2023-02-27 18:49:07', 'D236');
INSERT INTO `comuni` VALUES ('101013', 'Isola di Capo Rizzuto', '101', NULL, '2023-02-27 18:49:07', 'E339');
INSERT INTO `comuni` VALUES ('101014', 'Melissa', '101', NULL, '2023-02-27 18:49:07', 'F108');
INSERT INTO `comuni` VALUES ('101015', 'Mesoraca', '101', NULL, '2023-02-27 18:49:07', 'F157');
INSERT INTO `comuni` VALUES ('101016', 'Pallagorio', '101', NULL, '2023-02-27 18:49:07', 'G278');
INSERT INTO `comuni` VALUES ('101017', 'Petilia Policastro', '101', NULL, '2023-02-27 18:49:07', 'G508');
INSERT INTO `comuni` VALUES ('101018', 'Roccabernarda', '101', NULL, '2023-02-27 18:49:07', 'H383');
INSERT INTO `comuni` VALUES ('101019', 'Rocca di Neto', '101', NULL, '2023-02-27 18:49:07', 'H403');
INSERT INTO `comuni` VALUES ('101020', 'San Mauro Marchesato', '101', NULL, '2023-02-27 18:49:07', 'I026');
INSERT INTO `comuni` VALUES ('101021', 'San Nicola dell\'Alto', '101', NULL, '2023-02-27 18:49:07', 'I057');
INSERT INTO `comuni` VALUES ('101022', 'Santa Severina', '101', NULL, '2023-02-27 18:49:07', 'I308');
INSERT INTO `comuni` VALUES ('101023', 'Savelli', '101', NULL, '2023-02-27 18:49:07', 'I468');
INSERT INTO `comuni` VALUES ('101024', 'Scandale', '101', NULL, '2023-02-27 18:49:07', 'I494');
INSERT INTO `comuni` VALUES ('101025', 'Strongoli', '101', NULL, '2023-02-27 18:49:07', 'I982');
INSERT INTO `comuni` VALUES ('101026', 'Umbriatico', '101', NULL, '2023-02-27 18:49:07', 'L492');
INSERT INTO `comuni` VALUES ('101027', 'Verzino', '101', NULL, '2023-02-27 18:49:07', 'L802');
INSERT INTO `comuni` VALUES ('102001', 'Acquaro', '102', NULL, '2023-02-27 18:49:07', 'A043');
INSERT INTO `comuni` VALUES ('102002', 'Arena', '102', NULL, '2023-02-27 18:49:07', 'A386');
INSERT INTO `comuni` VALUES ('102003', 'Briatico', '102', NULL, '2023-02-27 18:49:07', 'B169');
INSERT INTO `comuni` VALUES ('102004', 'Brognaturo', '102', NULL, '2023-02-27 18:49:07', 'B197');
INSERT INTO `comuni` VALUES ('102005', 'Capistrano', '102', NULL, '2023-02-27 18:49:07', 'B655');
INSERT INTO `comuni` VALUES ('102006', 'Cessaniti', '102', NULL, '2023-02-27 18:49:07', 'C581');
INSERT INTO `comuni` VALUES ('102007', 'Dasà', '102', NULL, '2023-02-27 18:49:07', 'D253');
INSERT INTO `comuni` VALUES ('102008', 'Dinami', '102', NULL, '2023-02-27 18:49:07', 'D303');
INSERT INTO `comuni` VALUES ('102009', 'Drapia', '102', NULL, '2023-02-27 18:49:07', 'D364');
INSERT INTO `comuni` VALUES ('102010', 'Fabrizia', '102', NULL, '2023-02-27 18:49:07', 'D453');
INSERT INTO `comuni` VALUES ('102011', 'Filadelfia', '102', NULL, '2023-02-27 18:49:07', 'D587');
INSERT INTO `comuni` VALUES ('102012', 'Filandari', '102', NULL, '2023-02-27 18:49:07', 'D589');
INSERT INTO `comuni` VALUES ('102013', 'Filogaso', '102', NULL, '2023-02-27 18:49:07', 'D596');
INSERT INTO `comuni` VALUES ('102014', 'Francavilla Angitola', '102', NULL, '2023-02-27 18:49:07', 'D762');
INSERT INTO `comuni` VALUES ('102015', 'Francica', '102', NULL, '2023-02-27 18:49:07', 'D767');
INSERT INTO `comuni` VALUES ('102016', 'Gerocarne', '102', NULL, '2023-02-27 18:49:07', 'D988');
INSERT INTO `comuni` VALUES ('102017', 'Ionadi', '102', NULL, '2023-02-27 18:49:07', 'E321');
INSERT INTO `comuni` VALUES ('102018', 'Joppolo', '102', NULL, '2023-02-27 18:49:07', 'E389');
INSERT INTO `comuni` VALUES ('102019', 'Limbadi', '102', NULL, '2023-02-27 18:49:07', 'E590');
INSERT INTO `comuni` VALUES ('102020', 'Maierato', '102', NULL, '2023-02-27 18:49:07', 'E836');
INSERT INTO `comuni` VALUES ('102021', 'Mileto', '102', NULL, '2023-02-27 18:49:07', 'F207');
INSERT INTO `comuni` VALUES ('102022', 'Mongiana', '102', NULL, '2023-02-27 18:49:07', 'F364');
INSERT INTO `comuni` VALUES ('102023', 'Monterosso Calabro', '102', NULL, '2023-02-27 18:49:07', 'F607');
INSERT INTO `comuni` VALUES ('102024', 'Nardodipace', '102', NULL, '2023-02-27 18:49:07', 'F843');
INSERT INTO `comuni` VALUES ('102025', 'Nicotera', '102', NULL, '2023-02-27 18:49:07', 'F893');
INSERT INTO `comuni` VALUES ('102026', 'Parghelia', '102', NULL, '2023-02-27 18:49:07', 'G335');
INSERT INTO `comuni` VALUES ('102027', 'Pizzo', '102', NULL, '2023-02-27 18:49:07', 'G722');
INSERT INTO `comuni` VALUES ('102028', 'Pizzoni', '102', NULL, '2023-02-27 18:49:07', 'G728');
INSERT INTO `comuni` VALUES ('102029', 'Polia', '102', NULL, '2023-02-27 18:49:07', 'G785');
INSERT INTO `comuni` VALUES ('102030', 'Ricadi', '102', NULL, '2023-02-27 18:49:07', 'H271');
INSERT INTO `comuni` VALUES ('102031', 'Rombiolo', '102', NULL, '2023-02-27 18:49:07', 'H516');
INSERT INTO `comuni` VALUES ('102032', 'San Calogero', '102', NULL, '2023-02-27 18:49:07', 'H785');
INSERT INTO `comuni` VALUES ('102033', 'San Costantino Calabro', '102', NULL, '2023-02-27 18:49:07', 'H807');
INSERT INTO `comuni` VALUES ('102034', 'San Gregorio d\'Ippona', '102', NULL, '2023-02-27 18:49:07', 'H941');
INSERT INTO `comuni` VALUES ('102035', 'San Nicola da Crissa', '102', NULL, '2023-02-27 18:49:07', 'I058');
INSERT INTO `comuni` VALUES ('102036', 'Sant\'Onofrio', '102', NULL, '2023-02-27 18:49:07', 'I350');
INSERT INTO `comuni` VALUES ('102037', 'Serra San Bruno', '102', NULL, '2023-02-27 18:49:07', 'I639');
INSERT INTO `comuni` VALUES ('102038', 'Simbario', '102', NULL, '2023-02-27 18:49:07', 'I744');
INSERT INTO `comuni` VALUES ('102039', 'Sorianello', '102', NULL, '2023-02-27 18:49:07', 'I853');
INSERT INTO `comuni` VALUES ('102040', 'Soriano Calabro', '102', NULL, '2023-02-27 18:49:07', 'I854');
INSERT INTO `comuni` VALUES ('102041', 'Spadola', '102', NULL, '2023-02-27 18:49:07', 'I884');
INSERT INTO `comuni` VALUES ('102042', 'Spilinga', '102', NULL, '2023-02-27 18:49:07', 'I905');
INSERT INTO `comuni` VALUES ('102043', 'Stefanaconi', '102', NULL, '2023-02-27 18:49:07', 'I945');
INSERT INTO `comuni` VALUES ('102044', 'Tropea', '102', NULL, '2023-02-27 18:49:07', 'L452');
INSERT INTO `comuni` VALUES ('102045', 'Vallelonga', '102', NULL, '2023-02-27 18:49:07', 'L607');
INSERT INTO `comuni` VALUES ('102046', 'Vazzano', '102', NULL, '2023-02-27 18:49:07', 'L699');
INSERT INTO `comuni` VALUES ('102047', 'Vibo Valentia', '102', NULL, '2023-02-27 18:49:07', 'F537');
INSERT INTO `comuni` VALUES ('102048', 'Zaccanopoli', '102', NULL, '2023-02-27 18:49:07', 'M138');
INSERT INTO `comuni` VALUES ('102049', 'Zambrone', '102', NULL, '2023-02-27 18:49:07', 'M143');
INSERT INTO `comuni` VALUES ('102050', 'Zungri', '102', NULL, '2023-02-27 18:49:07', 'M204');
INSERT INTO `comuni` VALUES ('103001', 'Antrona Schieranco', '103', NULL, '2023-02-27 18:49:07', 'A317');
INSERT INTO `comuni` VALUES ('103002', 'Anzola d\'Ossola', '103', NULL, '2023-02-27 18:49:07', 'A325');
INSERT INTO `comuni` VALUES ('103003', 'Arizzano', '103', NULL, '2023-02-27 18:49:07', 'A409');
INSERT INTO `comuni` VALUES ('103004', 'Arola', '103', NULL, '2023-02-27 18:49:07', 'A427');
INSERT INTO `comuni` VALUES ('103005', 'Aurano', '103', NULL, '2023-02-27 18:49:07', 'A497');
INSERT INTO `comuni` VALUES ('103006', 'Baceno', '103', NULL, '2023-02-27 18:49:07', 'A534');
INSERT INTO `comuni` VALUES ('103007', 'Bannio Anzino', '103', NULL, '2023-02-27 18:49:07', 'A610');
INSERT INTO `comuni` VALUES ('103008', 'Baveno', '103', NULL, '2023-02-27 18:49:07', 'A725');
INSERT INTO `comuni` VALUES ('103009', 'Bee', '103', NULL, '2023-02-27 18:49:07', 'A733');
INSERT INTO `comuni` VALUES ('103010', 'Belgirate', '103', NULL, '2023-02-27 18:49:07', 'A742');
INSERT INTO `comuni` VALUES ('103011', 'Beura-Cardezza', '103', NULL, '2023-02-27 18:49:07', 'A834');
INSERT INTO `comuni` VALUES ('103012', 'Bognanco', '103', NULL, '2023-02-27 18:49:07', 'A925');
INSERT INTO `comuni` VALUES ('103013', 'Brovello-Carpugnino', '103', NULL, '2023-02-27 18:49:07', 'B207');
INSERT INTO `comuni` VALUES ('103014', 'Calasca-Castiglione', '103', NULL, '2023-02-27 18:49:07', 'B380');
INSERT INTO `comuni` VALUES ('103015', 'Cambiasca', '103', NULL, '2023-02-27 18:49:07', 'B463');
INSERT INTO `comuni` VALUES ('103016', 'Cannero Riviera', '103', NULL, '2023-02-27 18:49:07', 'B610');
INSERT INTO `comuni` VALUES ('103017', 'Cannobio', '103', NULL, '2023-02-27 18:49:07', 'B615');
INSERT INTO `comuni` VALUES ('103018', 'Caprezzo', '103', NULL, '2023-02-27 18:49:07', 'B694');
INSERT INTO `comuni` VALUES ('103019', 'Casale Corte Cerro', '103', NULL, '2023-02-27 18:49:07', 'B876');
INSERT INTO `comuni` VALUES ('103020', 'Cavaglio-Spoccia', '103', NULL, '2023-02-27 18:49:07', 'C367');
INSERT INTO `comuni` VALUES ('103021', 'Ceppo Morelli', '103', NULL, '2023-02-27 18:49:07', 'C478');
INSERT INTO `comuni` VALUES ('103022', 'Cesara', '103', NULL, '2023-02-27 18:49:07', 'C567');
INSERT INTO `comuni` VALUES ('103023', 'Cossogno', '103', NULL, '2023-02-27 18:49:07', 'D099');
INSERT INTO `comuni` VALUES ('103024', 'Craveggia', '103', NULL, '2023-02-27 18:49:07', 'D134');
INSERT INTO `comuni` VALUES ('103025', 'Crevoladossola', '103', NULL, '2023-02-27 18:49:07', 'D168');
INSERT INTO `comuni` VALUES ('103026', 'Crodo', '103', NULL, '2023-02-27 18:49:07', 'D177');
INSERT INTO `comuni` VALUES ('103027', 'Cursolo-Orasso', '103', NULL, '2023-02-27 18:49:07', 'D225');
INSERT INTO `comuni` VALUES ('103028', 'Domodossola', '103', NULL, '2023-02-27 18:49:07', 'D332');
INSERT INTO `comuni` VALUES ('103029', 'Druogno', '103', NULL, '2023-02-27 18:49:07', 'D374');
INSERT INTO `comuni` VALUES ('103030', 'Falmenta', '103', NULL, '2023-02-27 18:49:07', 'D481');
INSERT INTO `comuni` VALUES ('103031', 'Formazza', '103', NULL, '2023-02-27 18:49:07', 'D706');
INSERT INTO `comuni` VALUES ('103032', 'Germagno', '103', NULL, '2023-02-27 18:49:07', 'D984');
INSERT INTO `comuni` VALUES ('103033', 'Ghiffa', '103', NULL, '2023-02-27 18:49:07', 'E003');
INSERT INTO `comuni` VALUES ('103034', 'Gignese', '103', NULL, '2023-02-27 18:49:07', 'E028');
INSERT INTO `comuni` VALUES ('103035', 'Gravellona Toce', '103', NULL, '2023-02-27 18:49:07', 'E153');
INSERT INTO `comuni` VALUES ('103036', 'Gurro', '103', NULL, '2023-02-27 18:49:07', 'E269');
INSERT INTO `comuni` VALUES ('103037', 'Intragna', '103', NULL, '2023-02-27 18:49:07', 'E304');
INSERT INTO `comuni` VALUES ('103038', 'Loreglia', '103', NULL, '2023-02-27 18:49:07', 'E685');
INSERT INTO `comuni` VALUES ('103039', 'Macugnaga', '103', NULL, '2023-02-27 18:49:07', 'E790');
INSERT INTO `comuni` VALUES ('103040', 'Madonna del Sasso', '103', NULL, '2023-02-27 18:49:07', 'E795');
INSERT INTO `comuni` VALUES ('103041', 'Malesco', '103', NULL, '2023-02-27 18:49:07', 'E853');
INSERT INTO `comuni` VALUES ('103042', 'Masera', '103', NULL, '2023-02-27 18:49:07', 'F010');
INSERT INTO `comuni` VALUES ('103043', 'Massiola', '103', NULL, '2023-02-27 18:49:07', 'F048');
INSERT INTO `comuni` VALUES ('103044', 'Mergozzo', '103', NULL, '2023-02-27 18:49:07', 'F146');
INSERT INTO `comuni` VALUES ('103045', 'Miazzina', '103', NULL, '2023-02-27 18:49:07', 'F192');
INSERT INTO `comuni` VALUES ('103046', 'Montecrestese', '103', NULL, '2023-02-27 18:49:07', 'F483');
INSERT INTO `comuni` VALUES ('103047', 'Montescheno', '103', NULL, '2023-02-27 18:49:07', 'F639');
INSERT INTO `comuni` VALUES ('103048', 'Nonio', '103', NULL, '2023-02-27 18:49:07', 'F932');
INSERT INTO `comuni` VALUES ('103049', 'Oggebbio', '103', NULL, '2023-02-27 18:49:07', 'G007');
INSERT INTO `comuni` VALUES ('103050', 'Omegna', '103', NULL, '2023-02-27 18:49:07', 'G062');
INSERT INTO `comuni` VALUES ('103051', 'Ornavasso', '103', NULL, '2023-02-27 18:49:07', 'G117');
INSERT INTO `comuni` VALUES ('103052', 'Pallanzeno', '103', NULL, '2023-02-27 18:49:07', 'G280');
INSERT INTO `comuni` VALUES ('103053', 'Piedimulera', '103', NULL, '2023-02-27 18:49:07', 'G600');
INSERT INTO `comuni` VALUES ('103054', 'Pieve Vergonte', '103', NULL, '2023-02-27 18:49:07', 'G658');
INSERT INTO `comuni` VALUES ('103055', 'Premeno', '103', NULL, '2023-02-27 18:49:07', 'H030');
INSERT INTO `comuni` VALUES ('103056', 'Premia', '103', NULL, '2023-02-27 18:49:07', 'H033');
INSERT INTO `comuni` VALUES ('103057', 'Premosello-Chiovenda', '103', NULL, '2023-02-27 18:49:07', 'H037');
INSERT INTO `comuni` VALUES ('103058', 'Quarna Sopra', '103', NULL, '2023-02-27 18:49:07', 'H106');
INSERT INTO `comuni` VALUES ('103059', 'Quarna Sotto', '103', NULL, '2023-02-27 18:49:07', 'H107');
INSERT INTO `comuni` VALUES ('103060', 'Re', '103', NULL, '2023-02-27 18:49:07', 'H203');
INSERT INTO `comuni` VALUES ('103061', 'San Bernardino Verbano', '103', NULL, '2023-02-27 18:49:07', 'H777');
INSERT INTO `comuni` VALUES ('103062', 'Santa Maria Maggiore', '103', NULL, '2023-02-27 18:49:07', 'I249');
INSERT INTO `comuni` VALUES ('103063', 'Seppiana', '103', NULL, '2023-02-27 18:49:07', 'I619');
INSERT INTO `comuni` VALUES ('103064', 'Stresa', '103', NULL, '2023-02-27 18:49:07', 'I976');
INSERT INTO `comuni` VALUES ('103065', 'Toceno', '103', NULL, '2023-02-27 18:49:07', 'L187');
INSERT INTO `comuni` VALUES ('103066', 'Trarego Viggiona', '103', NULL, '2023-02-27 18:49:07', 'L333');
INSERT INTO `comuni` VALUES ('103067', 'Trasquera', '103', NULL, '2023-02-27 18:49:07', 'L336');
INSERT INTO `comuni` VALUES ('103068', 'Trontano', '103', NULL, '2023-02-27 18:49:07', 'L450');
INSERT INTO `comuni` VALUES ('103069', 'Valstrona', '103', NULL, '2023-02-27 18:49:07', 'L651');
INSERT INTO `comuni` VALUES ('103070', 'Vanzone con San Carlo', '103', NULL, '2023-02-27 18:49:07', 'L666');
INSERT INTO `comuni` VALUES ('103071', 'Varzo', '103', NULL, '2023-02-27 18:49:07', 'L691');
INSERT INTO `comuni` VALUES ('103072', 'Verbania', '103', NULL, '2023-02-27 18:49:07', 'L746');
INSERT INTO `comuni` VALUES ('103073', 'Viganella', '103', NULL, '2023-02-27 18:49:07', 'L864');
INSERT INTO `comuni` VALUES ('103074', 'Vignone', '103', NULL, '2023-02-27 18:49:07', 'L889');
INSERT INTO `comuni` VALUES ('103075', 'Villadossola', '103', NULL, '2023-02-27 18:49:07', 'L906');
INSERT INTO `comuni` VALUES ('103076', 'Villette', '103', NULL, '2023-02-27 18:49:07', 'M042');
INSERT INTO `comuni` VALUES ('103077', 'Vogogna', '103', NULL, '2023-02-27 18:49:07', 'M111');
INSERT INTO `comuni` VALUES ('104001', 'Aggius', '104', NULL, '2023-02-27 18:49:07', 'A069');
INSERT INTO `comuni` VALUES ('104002', 'Aglientu', '104', NULL, '2023-02-27 18:49:07', 'H848');
INSERT INTO `comuni` VALUES ('104003', 'Alà dei Sardi', '104', NULL, '2023-02-27 18:49:07', 'A115');
INSERT INTO `comuni` VALUES ('104004', 'Arzachena', '104', NULL, '2023-02-27 18:49:07', 'A453');
INSERT INTO `comuni` VALUES ('104005', 'Badesi', '104', NULL, '2023-02-27 18:49:07', 'M214');
INSERT INTO `comuni` VALUES ('104006', 'Berchidda', '104', NULL, '2023-02-27 18:49:07', 'A789');
INSERT INTO `comuni` VALUES ('104007', 'Bortigiadas', '104', NULL, '2023-02-27 18:49:07', 'B063');
INSERT INTO `comuni` VALUES ('104008', 'Buddusò', '104', NULL, '2023-02-27 18:49:07', 'B246');
INSERT INTO `comuni` VALUES ('104009', 'Budoni', '104', NULL, '2023-02-27 18:49:07', 'B248');
INSERT INTO `comuni` VALUES ('104010', 'Calangianus', '104', NULL, '2023-02-27 18:49:07', 'B378');
INSERT INTO `comuni` VALUES ('104011', 'Golfo Aranci', '104', NULL, '2023-02-27 18:49:07', 'M274');
INSERT INTO `comuni` VALUES ('104012', 'La Maddalena', '104', NULL, '2023-02-27 18:49:07', 'E425');
INSERT INTO `comuni` VALUES ('104013', 'Loiri Porto San Paolo', '104', NULL, '2023-02-27 18:49:07', 'M275');
INSERT INTO `comuni` VALUES ('104014', 'Luogosanto', '104', NULL, '2023-02-27 18:49:07', 'E747');
INSERT INTO `comuni` VALUES ('104015', 'Luras', '104', NULL, '2023-02-27 18:49:07', 'E752');
INSERT INTO `comuni` VALUES ('104016', 'Monti', '104', NULL, '2023-02-27 18:49:07', 'F667');
INSERT INTO `comuni` VALUES ('104017', 'Olbia', '104', NULL, '2023-02-27 18:49:07', 'G015');
INSERT INTO `comuni` VALUES ('104018', 'Oschiri', '104', NULL, '2023-02-27 18:49:07', 'G153');
INSERT INTO `comuni` VALUES ('104019', 'Padru', '104', NULL, '2023-02-27 18:49:07', 'M301');
INSERT INTO `comuni` VALUES ('104020', 'Palau', '104', NULL, '2023-02-27 18:49:07', 'G258');
INSERT INTO `comuni` VALUES ('104021', 'Sant\'Antonio di Gallura', '104', NULL, '2023-02-27 18:49:07', 'M276');
INSERT INTO `comuni` VALUES ('104022', 'Santa Teresa Gallura', '104', NULL, '2023-02-27 18:49:07', 'I312');
INSERT INTO `comuni` VALUES ('104023', 'San Teodoro', '104', NULL, '2023-02-27 18:49:07', 'I329');
INSERT INTO `comuni` VALUES ('104024', 'Telti', '104', NULL, '2023-02-27 18:49:07', 'L088');
INSERT INTO `comuni` VALUES ('104025', 'Tempio Pausania', '104', NULL, '2023-02-27 18:49:07', 'L093');
INSERT INTO `comuni` VALUES ('104026', 'Trinità d\'Agultu e Vignola', '104', NULL, '2023-02-27 18:49:07', 'L428');
INSERT INTO `comuni` VALUES ('105001', 'Arzana', '105', NULL, '2023-02-27 18:49:07', 'A454');
INSERT INTO `comuni` VALUES ('105002', 'Bari Sardo', '105', NULL, '2023-02-27 18:49:07', 'A663');
INSERT INTO `comuni` VALUES ('105003', 'Baunei', '105', NULL, '2023-02-27 18:49:07', 'A722');
INSERT INTO `comuni` VALUES ('105004', 'Cardedu', '105', NULL, '2023-02-27 18:49:07', 'M285');
INSERT INTO `comuni` VALUES ('105005', 'Elini', '105', NULL, '2023-02-27 18:49:07', 'D395');
INSERT INTO `comuni` VALUES ('105006', 'Gairo', '105', NULL, '2023-02-27 18:49:07', 'D859');
INSERT INTO `comuni` VALUES ('105007', 'Girasole', '105', NULL, '2023-02-27 18:49:07', 'E049');
INSERT INTO `comuni` VALUES ('105008', 'Ilbono', '105', NULL, '2023-02-27 18:49:07', 'E283');
INSERT INTO `comuni` VALUES ('105009', 'Jerzu', '105', NULL, '2023-02-27 18:49:07', 'E387');
INSERT INTO `comuni` VALUES ('105010', 'Lanusei', '105', NULL, '2023-02-27 18:49:07', 'E441');
INSERT INTO `comuni` VALUES ('105011', 'Loceri', '105', NULL, '2023-02-27 18:49:07', 'E644');
INSERT INTO `comuni` VALUES ('105012', 'Lotzorai', '105', NULL, '2023-02-27 18:49:07', 'E700');
INSERT INTO `comuni` VALUES ('105013', 'Osini', '105', NULL, '2023-02-27 18:49:07', 'G158');
INSERT INTO `comuni` VALUES ('105014', 'Perdasdefogu', '105', NULL, '2023-02-27 18:49:07', 'G445');
INSERT INTO `comuni` VALUES ('105015', 'Seui', '105', NULL, '2023-02-27 18:49:07', 'I706');
INSERT INTO `comuni` VALUES ('105016', 'Talana', '105', NULL, '2023-02-27 18:49:07', 'L036');
INSERT INTO `comuni` VALUES ('105017', 'Tertenia', '105', NULL, '2023-02-27 18:49:07', 'L140');
INSERT INTO `comuni` VALUES ('105018', 'Tortolì', '105', NULL, '2023-02-27 18:49:07', 'A355');
INSERT INTO `comuni` VALUES ('105019', 'Triei', '105', NULL, '2023-02-27 18:49:07', 'L423');
INSERT INTO `comuni` VALUES ('105020', 'Ulassai', '105', NULL, '2023-02-27 18:49:07', 'L489');
INSERT INTO `comuni` VALUES ('105021', 'Urzulei', '105', NULL, '2023-02-27 18:49:07', 'L506');
INSERT INTO `comuni` VALUES ('105022', 'Ussassai', '105', NULL, '2023-02-27 18:49:07', 'L514');
INSERT INTO `comuni` VALUES ('105023', 'Villagrande Strisaili', '105', NULL, '2023-02-27 18:49:07', 'L953');
INSERT INTO `comuni` VALUES ('106001', 'Arbus', '106', NULL, '2023-02-27 18:49:07', 'A359');
INSERT INTO `comuni` VALUES ('106002', 'Barumini', '106', NULL, '2023-02-27 18:49:07', 'A681');
INSERT INTO `comuni` VALUES ('106003', 'Collinas', '106', NULL, '2023-02-27 18:49:07', 'C882');
INSERT INTO `comuni` VALUES ('106004', 'Furtei', '106', NULL, '2023-02-27 18:49:07', 'D827');
INSERT INTO `comuni` VALUES ('106005', 'Genuri', '106', NULL, '2023-02-27 18:49:07', 'D970');
INSERT INTO `comuni` VALUES ('106006', 'Gesturi', '106', NULL, '2023-02-27 18:49:07', 'D997');
INSERT INTO `comuni` VALUES ('106007', 'Gonnosfanadiga', '106', NULL, '2023-02-27 18:49:07', 'E085');
INSERT INTO `comuni` VALUES ('106008', 'Guspini', '106', NULL, '2023-02-27 18:49:07', 'E270');
INSERT INTO `comuni` VALUES ('106009', 'Las Plassas', '106', NULL, '2023-02-27 18:49:07', 'E464');
INSERT INTO `comuni` VALUES ('106010', 'Lunamatrona', '106', NULL, '2023-02-27 18:49:07', 'E742');
INSERT INTO `comuni` VALUES ('106011', 'Pabillonis', '106', NULL, '2023-02-27 18:49:07', 'G207');
INSERT INTO `comuni` VALUES ('106012', 'Pauli Arbarei', '106', NULL, '2023-02-27 18:49:07', 'G382');
INSERT INTO `comuni` VALUES ('106013', 'Samassi', '106', NULL, '2023-02-27 18:49:07', 'H738');
INSERT INTO `comuni` VALUES ('106014', 'San Gavino Monreale', '106', NULL, '2023-02-27 18:49:07', 'H856');
INSERT INTO `comuni` VALUES ('106015', 'Sanluri', '106', NULL, '2023-02-27 18:49:07', 'H974');
INSERT INTO `comuni` VALUES ('106016', 'Sardara', '106', NULL, '2023-02-27 18:49:07', 'I428');
INSERT INTO `comuni` VALUES ('106017', 'Segariu', '106', NULL, '2023-02-27 18:49:07', 'I570');
INSERT INTO `comuni` VALUES ('106018', 'Serramanna', '106', NULL, '2023-02-27 18:49:07', 'I647');
INSERT INTO `comuni` VALUES ('106019', 'Serrenti', '106', NULL, '2023-02-27 18:49:07', 'I667');
INSERT INTO `comuni` VALUES ('106020', 'Setzu', '106', NULL, '2023-02-27 18:49:07', 'I705');
INSERT INTO `comuni` VALUES ('106021', 'Siddi', '106', NULL, '2023-02-27 18:49:07', 'I724');
INSERT INTO `comuni` VALUES ('106022', 'Tuili', '106', NULL, '2023-02-27 18:49:07', 'L463');
INSERT INTO `comuni` VALUES ('106023', 'Turri', '106', NULL, '2023-02-27 18:49:07', 'L473');
INSERT INTO `comuni` VALUES ('106024', 'Ussaramanna', '106', NULL, '2023-02-27 18:49:07', 'L513');
INSERT INTO `comuni` VALUES ('106025', 'Villacidro', '106', NULL, '2023-02-27 18:49:07', 'L924');
INSERT INTO `comuni` VALUES ('106026', 'Villamar', '106', NULL, '2023-02-27 18:49:07', 'L966');
INSERT INTO `comuni` VALUES ('106027', 'Villanovaforru', '106', NULL, '2023-02-27 18:49:07', 'L986');
INSERT INTO `comuni` VALUES ('106028', 'Villanovafranca', '106', NULL, '2023-02-27 18:49:07', 'L987');
INSERT INTO `comuni` VALUES ('107001', 'Buggerru', '107', NULL, '2023-02-27 18:49:07', 'B250');
INSERT INTO `comuni` VALUES ('107002', 'Calasetta', '107', NULL, '2023-02-27 18:49:07', 'B383');
INSERT INTO `comuni` VALUES ('107003', 'Carbonia', '107', NULL, '2023-02-27 18:49:07', 'B745');
INSERT INTO `comuni` VALUES ('107004', 'Carloforte', '107', NULL, '2023-02-27 18:49:07', 'B789');
INSERT INTO `comuni` VALUES ('107005', 'Domusnovas', '107', NULL, '2023-02-27 18:49:07', 'D334');
INSERT INTO `comuni` VALUES ('107006', 'Fluminimaggiore', '107', NULL, '2023-02-27 18:49:07', 'D639');
INSERT INTO `comuni` VALUES ('107007', 'Giba', '107', NULL, '2023-02-27 18:49:07', 'E022');
INSERT INTO `comuni` VALUES ('107008', 'Gonnesa', '107', NULL, '2023-02-27 18:49:07', 'E086');
INSERT INTO `comuni` VALUES ('107009', 'Iglesias', '107', NULL, '2023-02-27 18:49:07', 'E281');
INSERT INTO `comuni` VALUES ('107010', 'Masainas', '107', NULL, '2023-02-27 18:49:07', 'M270');
INSERT INTO `comuni` VALUES ('107011', 'Musei', '107', NULL, '2023-02-27 18:49:07', 'F822');
INSERT INTO `comuni` VALUES ('107012', 'Narcao', '107', NULL, '2023-02-27 18:49:07', 'F841');
INSERT INTO `comuni` VALUES ('107013', 'Nuxis', '107', NULL, '2023-02-27 18:49:07', 'F991');
INSERT INTO `comuni` VALUES ('107014', 'Perdaxius', '107', NULL, '2023-02-27 18:49:07', 'G446');
INSERT INTO `comuni` VALUES ('107015', 'Piscinas', '107', NULL, '2023-02-27 18:49:07', 'M291');
INSERT INTO `comuni` VALUES ('107016', 'Portoscuso', '107', NULL, '2023-02-27 18:49:07', 'G922');
INSERT INTO `comuni` VALUES ('107017', 'San Giovanni Suergiu', '107', NULL, '2023-02-27 18:49:07', 'G287');
INSERT INTO `comuni` VALUES ('107018', 'Santadi', '107', NULL, '2023-02-27 18:49:07', 'I182');
INSERT INTO `comuni` VALUES ('107019', 'Sant\'Anna Arresi', '107', NULL, '2023-02-27 18:49:07', 'M209');
INSERT INTO `comuni` VALUES ('107020', 'Sant\'Antioco', '107', NULL, '2023-02-27 18:49:07', 'I294');
INSERT INTO `comuni` VALUES ('107021', 'Tratalias', '107', NULL, '2023-02-27 18:49:07', 'L337');
INSERT INTO `comuni` VALUES ('107022', 'Villamassargia', '107', NULL, '2023-02-27 18:49:07', 'L968');
INSERT INTO `comuni` VALUES ('107023', 'Villaperuccio', '107', NULL, '2023-02-27 18:49:07', 'M278');
INSERT INTO `comuni` VALUES ('108001', 'Agrate Brianza', '108', NULL, '2023-02-27 18:49:07', 'A087');
INSERT INTO `comuni` VALUES ('108002', 'Aicurzio', '108', NULL, '2023-02-27 18:49:07', 'A096');
INSERT INTO `comuni` VALUES ('108003', 'Albiate', '108', NULL, '2023-02-27 18:49:07', 'A159');
INSERT INTO `comuni` VALUES ('108004', 'Arcore', '108', NULL, '2023-02-27 18:49:07', 'A376');
INSERT INTO `comuni` VALUES ('108005', 'Barlassina', '108', NULL, '2023-02-27 18:49:07', 'A668');
INSERT INTO `comuni` VALUES ('108006', 'Bellusco', '108', NULL, '2023-02-27 18:49:07', 'A759');
INSERT INTO `comuni` VALUES ('108007', 'Bernareggio', '108', NULL, '2023-02-27 18:49:07', 'A802');
INSERT INTO `comuni` VALUES ('108008', 'Besana in Brianza', '108', NULL, '2023-02-27 18:49:07', 'A818');
INSERT INTO `comuni` VALUES ('108009', 'Biassono', '108', NULL, '2023-02-27 18:49:07', 'A849');
INSERT INTO `comuni` VALUES ('108010', 'Bovisio-Masciago', '108', NULL, '2023-02-27 18:49:07', 'B105');
INSERT INTO `comuni` VALUES ('108011', 'Briosco', '108', NULL, '2023-02-27 18:49:07', 'B187');
INSERT INTO `comuni` VALUES ('108012', 'Brugherio', '108', NULL, '2023-02-27 18:49:07', 'B212');
INSERT INTO `comuni` VALUES ('108013', 'Burago di Molgora', '108', NULL, '2023-02-27 18:49:07', 'B272');
INSERT INTO `comuni` VALUES ('108014', 'Camparada', '108', NULL, '2023-02-27 18:49:07', 'B501');
INSERT INTO `comuni` VALUES ('108015', 'Carate Brianza', '108', NULL, '2023-02-27 18:49:07', 'B729');
INSERT INTO `comuni` VALUES ('108016', 'Carnate', '108', NULL, '2023-02-27 18:49:07', 'B798');
INSERT INTO `comuni` VALUES ('108017', 'Cavenago di Brianza', '108', NULL, '2023-02-27 18:49:07', 'C395');
INSERT INTO `comuni` VALUES ('108018', 'Ceriano Laghetto', '108', NULL, '2023-02-27 18:49:07', 'C512');
INSERT INTO `comuni` VALUES ('108019', 'Cesano Maderno', '108', NULL, '2023-02-27 18:49:07', 'C566');
INSERT INTO `comuni` VALUES ('108020', 'Cogliate', '108', NULL, '2023-02-27 18:49:07', 'C820');
INSERT INTO `comuni` VALUES ('108021', 'Concorezzo', '108', NULL, '2023-02-27 18:49:07', 'C952');
INSERT INTO `comuni` VALUES ('108022', 'Correzzana', '108', NULL, '2023-02-27 18:49:07', 'D038');
INSERT INTO `comuni` VALUES ('108023', 'Desio', '108', NULL, '2023-02-27 18:49:07', 'D286');
INSERT INTO `comuni` VALUES ('108024', 'Giussano', '108', NULL, '2023-02-27 18:49:07', 'E063');
INSERT INTO `comuni` VALUES ('108025', 'Lazzate', '108', NULL, '2023-02-27 18:49:07', 'E504');
INSERT INTO `comuni` VALUES ('108026', 'Lesmo', '108', NULL, '2023-02-27 18:49:07', 'E550');
INSERT INTO `comuni` VALUES ('108027', 'Limbiate', '108', NULL, '2023-02-27 18:49:07', 'E591');
INSERT INTO `comuni` VALUES ('108028', 'Lissone', '108', NULL, '2023-02-27 18:49:07', 'E617');
INSERT INTO `comuni` VALUES ('108029', 'Macherio', '108', NULL, '2023-02-27 18:49:07', 'E786');
INSERT INTO `comuni` VALUES ('108030', 'Meda', '108', NULL, '2023-02-27 18:49:07', 'F078');
INSERT INTO `comuni` VALUES ('108031', 'Mezzago', '108', NULL, '2023-02-27 18:49:07', 'F165');
INSERT INTO `comuni` VALUES ('108032', 'Misinto', '108', NULL, '2023-02-27 18:49:07', 'F247');
INSERT INTO `comuni` VALUES ('108033', 'Monza', '108', NULL, '2023-02-27 18:49:07', 'F704');
INSERT INTO `comuni` VALUES ('108034', 'Muggiò', '108', NULL, '2023-02-27 18:49:07', 'F797');
INSERT INTO `comuni` VALUES ('108035', 'Nova Milanese', '108', NULL, '2023-02-27 18:49:07', 'F944');
INSERT INTO `comuni` VALUES ('108036', 'Ornago', '108', NULL, '2023-02-27 18:49:07', 'G116');
INSERT INTO `comuni` VALUES ('108037', 'Renate', '108', NULL, '2023-02-27 18:49:07', 'H233');
INSERT INTO `comuni` VALUES ('108038', 'Ronco Briantino', '108', NULL, '2023-02-27 18:49:07', 'H537');
INSERT INTO `comuni` VALUES ('108039', 'Seregno', '108', NULL, '2023-02-27 18:49:07', 'I625');
INSERT INTO `comuni` VALUES ('108040', 'Seveso', '108', NULL, '2023-02-27 18:49:07', 'I709');
INSERT INTO `comuni` VALUES ('108041', 'Sovico', '108', NULL, '2023-02-27 18:49:07', 'I878');
INSERT INTO `comuni` VALUES ('108042', 'Sulbiate', '108', NULL, '2023-02-27 18:49:07', 'I998');
INSERT INTO `comuni` VALUES ('108043', 'Triuggio', '108', NULL, '2023-02-27 18:49:07', 'L434');
INSERT INTO `comuni` VALUES ('108044', 'Usmate Velate', '108', NULL, '2023-02-27 18:49:07', 'L511');
INSERT INTO `comuni` VALUES ('108045', 'Varedo', '108', NULL, '2023-02-27 18:49:07', 'L677');
INSERT INTO `comuni` VALUES ('108046', 'Vedano al Lambro', '108', NULL, '2023-02-27 18:49:07', 'L704');
INSERT INTO `comuni` VALUES ('108047', 'Veduggio con Colzano', '108', NULL, '2023-02-27 18:49:07', 'L709');
INSERT INTO `comuni` VALUES ('108048', 'Verano Brianza', '108', NULL, '2023-02-27 18:49:07', 'L744');
INSERT INTO `comuni` VALUES ('108049', 'Villasanta', '108', NULL, '2023-02-27 18:49:07', 'M017');
INSERT INTO `comuni` VALUES ('108050', 'Vimercate', '108', NULL, '2023-02-27 18:49:07', 'M052');
INSERT INTO `comuni` VALUES ('108051', 'Busnago', '108', NULL, '2023-02-27 18:49:07', 'B289');
INSERT INTO `comuni` VALUES ('108052', 'Caponago', '108', NULL, '2023-02-27 18:49:07', 'B671');
INSERT INTO `comuni` VALUES ('108053', 'Cornate d\'Adda', '108', NULL, '2023-02-27 18:49:07', 'D019');
INSERT INTO `comuni` VALUES ('108054', 'Lentate sul Seveso', '108', NULL, '2023-02-27 18:49:07', 'E530');
INSERT INTO `comuni` VALUES ('108055', 'Roncello', '108', NULL, '2023-02-27 18:49:07', 'H529');
INSERT INTO `comuni` VALUES ('109001', 'Altidona', '109', NULL, '2023-02-27 18:49:07', 'A233');
INSERT INTO `comuni` VALUES ('109002', 'Amandola', '109', NULL, '2023-02-27 18:49:07', 'A252');
INSERT INTO `comuni` VALUES ('109003', 'Belmonte Piceno', '109', NULL, '2023-02-27 18:49:07', 'A760');
INSERT INTO `comuni` VALUES ('109004', 'Campofilone', '109', NULL, '2023-02-27 18:49:07', 'B534');
INSERT INTO `comuni` VALUES ('109005', 'Falerone', '109', NULL, '2023-02-27 18:49:07', 'D477');
INSERT INTO `comuni` VALUES ('109006', 'Fermo', '109', NULL, '2023-02-27 18:49:07', 'D542');
INSERT INTO `comuni` VALUES ('109007', 'Francavilla d\'Ete', '109', NULL, '2023-02-27 18:49:07', 'D760');
INSERT INTO `comuni` VALUES ('109008', 'Grottazzolina', '109', NULL, '2023-02-27 18:49:07', 'E208');
INSERT INTO `comuni` VALUES ('109009', 'Lapedona', '109', NULL, '2023-02-27 18:49:07', 'E447');
INSERT INTO `comuni` VALUES ('109010', 'Magliano di Tenna', '109', NULL, '2023-02-27 18:49:07', 'E807');
INSERT INTO `comuni` VALUES ('109011', 'Massa Fermana', '109', NULL, '2023-02-27 18:49:07', 'F021');
INSERT INTO `comuni` VALUES ('109012', 'Monsampietro Morico', '109', NULL, '2023-02-27 18:49:07', 'F379');
INSERT INTO `comuni` VALUES ('109013', 'Montappone', '109', NULL, '2023-02-27 18:49:07', 'F428');
INSERT INTO `comuni` VALUES ('109014', 'Montefalcone Appennino', '109', NULL, '2023-02-27 18:49:07', 'F493');
INSERT INTO `comuni` VALUES ('109015', 'Montefortino', '109', NULL, '2023-02-27 18:49:07', 'F509');
INSERT INTO `comuni` VALUES ('109016', 'Monte Giberto', '109', NULL, '2023-02-27 18:49:07', 'F517');
INSERT INTO `comuni` VALUES ('109017', 'Montegiorgio', '109', NULL, '2023-02-27 18:49:07', 'F520');
INSERT INTO `comuni` VALUES ('109018', 'Montegranaro', '109', NULL, '2023-02-27 18:49:07', 'F522');
INSERT INTO `comuni` VALUES ('109019', 'Monteleone di Fermo', '109', NULL, '2023-02-27 18:49:07', 'F536');
INSERT INTO `comuni` VALUES ('109020', 'Montelparo', '109', NULL, '2023-02-27 18:49:07', 'F549');
INSERT INTO `comuni` VALUES ('109021', 'Monte Rinaldo', '109', NULL, '2023-02-27 18:49:07', 'F599');
INSERT INTO `comuni` VALUES ('109022', 'Monterubbiano', '109', NULL, '2023-02-27 18:49:07', 'F614');
INSERT INTO `comuni` VALUES ('109023', 'Monte San Pietrangeli', '109', NULL, '2023-02-27 18:49:07', 'F626');
INSERT INTO `comuni` VALUES ('109024', 'Monte Urano', '109', NULL, '2023-02-27 18:49:07', 'F653');
INSERT INTO `comuni` VALUES ('109025', 'Monte Vidon Combatte', '109', NULL, '2023-02-27 18:49:07', 'F664');
INSERT INTO `comuni` VALUES ('109026', 'Monte Vidon Corrado', '109', NULL, '2023-02-27 18:49:07', 'F665');
INSERT INTO `comuni` VALUES ('109027', 'Montottone', '109', NULL, '2023-02-27 18:49:07', 'F697');
INSERT INTO `comuni` VALUES ('109028', 'Moresco', '109', NULL, '2023-02-27 18:49:07', 'F722');
INSERT INTO `comuni` VALUES ('109029', 'Ortezzano', '109', NULL, '2023-02-27 18:49:07', 'G137');
INSERT INTO `comuni` VALUES ('109030', 'Pedaso', '109', NULL, '2023-02-27 18:49:07', 'G403');
INSERT INTO `comuni` VALUES ('109031', 'Petritoli', '109', NULL, '2023-02-27 18:49:07', 'G516');
INSERT INTO `comuni` VALUES ('109032', 'Ponzano di Fermo', '109', NULL, '2023-02-27 18:49:07', 'G873');
INSERT INTO `comuni` VALUES ('109033', 'Porto San Giorgio', '109', NULL, '2023-02-27 18:49:07', 'G920');
INSERT INTO `comuni` VALUES ('109034', 'Porto Sant\'Elpidio', '109', NULL, '2023-02-27 18:49:07', 'G921');
INSERT INTO `comuni` VALUES ('109035', 'Rapagnano', '109', NULL, '2023-02-27 18:49:07', 'H182');
INSERT INTO `comuni` VALUES ('109036', 'Santa Vittoria in Matenano', '109', NULL, '2023-02-27 18:49:07', 'I315');
INSERT INTO `comuni` VALUES ('109037', 'Sant\'Elpidio a Mare', '109', NULL, '2023-02-27 18:49:07', 'I324');
INSERT INTO `comuni` VALUES ('109038', 'Servigliano', '109', NULL, '2023-02-27 18:49:07', 'C070');
INSERT INTO `comuni` VALUES ('109039', 'Smerillo', '109', NULL, '2023-02-27 18:49:07', 'I774');
INSERT INTO `comuni` VALUES ('109040', 'Torre San Patrizio', '109', NULL, '2023-02-27 18:49:07', 'L279');
INSERT INTO `comuni` VALUES ('110001', 'Andria', '110', NULL, '2023-02-27 18:49:07', 'A285');
INSERT INTO `comuni` VALUES ('110002', 'Barletta', '110', NULL, '2023-02-27 18:49:07', 'A669');
INSERT INTO `comuni` VALUES ('110003', 'Bisceglie', '110', NULL, '2023-02-27 18:49:07', 'A883');
INSERT INTO `comuni` VALUES ('110004', 'Canosa di Puglia', '110', NULL, '2023-02-27 18:49:07', 'B619');
INSERT INTO `comuni` VALUES ('110005', 'Margherita di Savoia', '110', NULL, '2023-02-27 18:49:07', 'E946');
INSERT INTO `comuni` VALUES ('110006', 'Minervino Murge', '110', NULL, '2023-02-27 18:49:07', 'F220');
INSERT INTO `comuni` VALUES ('110007', 'San Ferdinando di Puglia', '110', NULL, '2023-02-27 18:49:07', 'H839');
INSERT INTO `comuni` VALUES ('110008', 'Spinazzola', '110', NULL, '2023-02-27 18:49:07', 'I907');
INSERT INTO `comuni` VALUES ('110009', 'Trani', '110', NULL, '2023-02-27 18:49:07', 'L328');
INSERT INTO `comuni` VALUES ('110010', 'Trinitapoli', '110', NULL, '2023-02-27 18:49:07', 'B915');
INSERT INTO `comuni` VALUES ('111111', 'U.S.A.', 'ZZZ', NULL, '2023-02-27 18:49:07', NULL);
INSERT INTO `comuni` VALUES ('111112', 'GERMANIA', 'ZZZ', NULL, '2023-02-27 18:49:07', NULL);
INSERT INTO `comuni` VALUES ('111113', 'AUSTRIA', 'ZZZ', NULL, '2023-02-27 18:49:07', NULL);
INSERT INTO `comuni` VALUES ('222222', 'BELGIO', 'ZZZ', NULL, '2023-02-27 18:49:07', NULL);
COMMIT;

-- ----------------------------
-- Table structure for convenzione
-- ----------------------------
DROP TABLE IF EXISTS `convenzione`;
CREATE TABLE `convenzione` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `convCodiceConvalida` varchar(255) CHARACTER SET utf8mb4  DEFAULT NULL,
  `convNome` varchar(255) CHARACTER SET utf8mb4  DEFAULT NULL,
  `convDescrizione` varchar(2000) CHARACTER SET utf8mb4  DEFAULT NULL,
  `convDataInizio` date DEFAULT NULL,
  `convDataFine` date DEFAULT NULL,
  `convReferente` varchar(255) CHARACTER SET utf8mb4  DEFAULT NULL,
  `convTelefono` varchar(255) CHARACTER SET utf8mb4  DEFAULT NULL,
  `convCellulare` varchar(255) CHARACTER SET utf8mb4  DEFAULT NULL,
  `convEMail` varchar(255) CHARACTER SET utf8mb4  DEFAULT NULL,
  `convImportoAziendaPerc` double(8,2) DEFAULT NULL,
  `convCorrispettivoAcquisizione` double(8,2) DEFAULT NULL,
  `convCorrispettivoMantenimento` double(8,2) DEFAULT NULL,
  `convAbi` char(6) CHARACTER SET utf8mb4  DEFAULT NULL,
  `convCab` char(6) CHARACTER SET utf8mb4  DEFAULT NULL,
  `filenameImmagine` varchar(255) CHARACTER SET utf8mb4  DEFAULT NULL,
  `note` varchar(2000) CHARACTER SET utf8mb4  DEFAULT NULL,
  `filenameLogo` varchar(100) CHARACTER SET utf8mb4  DEFAULT NULL,
  `paymentMethod` varchar(100) DEFAULT NULL,
  `abbonamento` varchar(100) DEFAULT NULL,
  `convIdentificativo` char(3) DEFAULT NULL COMMENT 'identificativo flusso',
  `convFondo` int DEFAULT NULL,
  `convFondiCollettive` varchar(200) DEFAULT NULL,
  `convTipologieLiquidazione` varchar(200) DEFAULT NULL,
  `textCosaServeIscriverti` varchar(2000) CHARACTER SET utf8mb4  DEFAULT NULL,
  `definizioneAdesioni` varchar(2000) DEFAULT NULL,
  `definizioneEmail` text,
  `definizioneGenerale` text,
  `data_key` varchar(50) DEFAULT NULL,
  `convFlusso` enum('1','0') NOT NULL DEFAULT '0' COMMENT 'flusso o gestionale',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `convenzione_convcodiceconvalida_unique` (`convCodiceConvalida`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 ;

-- ----------------------------
-- Records of convenzione
-- ----------------------------
BEGIN;
INSERT INTO `convenzione` VALUES (1, '16655159911', 'Convenzione - SOCI', NULL, '2022-10-18', '2032-12-31', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for convenzione_aziende
-- ----------------------------
DROP TABLE IF EXISTS `convenzione_aziende`;
CREATE TABLE `convenzione_aziende` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `convenzioneId` bigint unsigned NOT NULL,
  `aziendeId` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `convenzione_aziende_convenzioneid_foreign` (`convenzioneId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ;

-- ----------------------------
-- Records of convenzione_aziende
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for fondi
-- ----------------------------
DROP TABLE IF EXISTS `fondi`;
CREATE TABLE `fondi` (
  `fonID` int unsigned NOT NULL AUTO_INCREMENT,
  `fonDescrizione` varchar(45) NOT NULL,
  `fonNote` text,
  `fonIBAN` varchar(27) DEFAULT NULL,
  `fonCodiceCreditore` varchar(27) DEFAULT NULL,
  `DTID` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fonSIA` char(5) DEFAULT NULL,
  `fonFileImport` char(10) DEFAULT NULL,
  `fonDecorrenzaQuotaFissa` int unsigned DEFAULT NULL,
  `fonIdentificazioneDocRimb` bit(1) NOT NULL DEFAULT b'0',
  `fonPatronati` bit(1) NOT NULL DEFAULT b'0',
  `fonIBANDiretti` varchar(27) DEFAULT NULL,
  `fonGiorniPrescrizione` int unsigned DEFAULT NULL,
  `fonNomeEnteDirette` varchar(60) DEFAULT NULL,
  `fonIndirizzoEnteDirette` varchar(45) DEFAULT NULL,
  `fonCAPEnteDirette` char(5) DEFAULT NULL,
  `fonLocalitaEnteDirette` varchar(45) DEFAULT NULL,
  `fonProvinciaEnteDirette` char(2) DEFAULT NULL,
  `fonCodiceFiscaleEnteDirette` varchar(16) DEFAULT NULL,
  `fonIBANEnteDirette` varchar(27) DEFAULT NULL,
  `fonInCooperazione` bit(1) NOT NULL DEFAULT b'0',
  `fonImportoUnaTantum` decimal(10,2) DEFAULT NULL,
  `fonImportoUnaTantumPT` decimal(10,2) DEFAULT NULL,
  `fonIDMutua` int unsigned DEFAULT NULL,
  `fonEscludiDaGrp` bit(1) NOT NULL DEFAULT b'0',
  `fonEscludiDaRating` bit(1) NOT NULL DEFAULT b'0',
  `fonCUC` varchar(8) DEFAULT NULL,
  `fonGiorniAttesaDocumenti` int unsigned DEFAULT NULL,
  `fonIDGruppo` int unsigned DEFAULT NULL,
  `fonIBANSdd` varchar(27) DEFAULT NULL,
  `fonCidSdd` varchar(35) DEFAULT NULL,
  `fonProfisParBanca` varchar(25) DEFAULT NULL,
  `fonProfisAnaVoce` varchar(10) DEFAULT NULL,
  `fonProfisAnaVoceRimborsi` varchar(10) DEFAULT NULL,
  `fonWelfare` bit(1) NOT NULL DEFAULT b'0',
  `fonTipologiaFT` int unsigned DEFAULT NULL,
  `fonTipologiaPT` int unsigned DEFAULT NULL,
  `fonIscrFamEntro30gg` bit(1) NOT NULL DEFAULT b'0',
  `fonIscrizioneAnnuale` bit(1) NOT NULL DEFAULT b'0',
  `fonIDAmbito` int unsigned DEFAULT NULL,
  `fonIDMacrogruppo` int unsigned DEFAULT NULL,
  `fonIDTipogestione` int unsigned DEFAULT NULL,
  PRIMARY KEY (`fonID`),
  UNIQUE KEY `fonDescrizione` (`fonDescrizione`),
  KEY `fondi_mutue` (`fonIDMutua`),
  KEY `fondi_gruppi` (`fonIDGruppo`),
  KEY `fondi_coperture_tipologie_FT` (`fonTipologiaFT`),
  KEY `fondi_coperture_tipologie_PT` (`fonTipologiaPT`),
  KEY `fondi_ambiti` (`fonIDAmbito`),
  KEY `fondi_macrogruppi` (`fonIDMacrogruppo`),
  KEY `fondi_tipogestione` (`fonIDTipogestione`)
) ENGINE=InnoDB AUTO_INCREMENT=131 DEFAULT CHARSET=utf8mb4  COMMENT='Anagrafica dei fondi sanitari';

-- ----------------------------
-- Records of fondi
-- ----------------------------
BEGIN;
INSERT INTO `fondi` VALUES (122, 'FONDO VOLONTARIE', NULL, 'IT03W0359901800000000159509', 'T38CST0000096105300220', '2023-06-28 21:52:36', 'B5DDU', 'XLSAF', NULL, b'0', b'0', 'IT03W0359901800000000159509', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, b'0', NULL, NULL, 3, b'0', b'0', '1463439D', NULL, 7, NULL, 'IT38CST0000096105300220', '12', '101010', '201010', b'0', NULL, NULL, b'0', b'0', 1, 1, 1);
COMMIT;

-- ----------------------------
-- Table structure for impostazioni
-- ----------------------------
DROP TABLE IF EXISTS `impostazioni`;
CREATE TABLE `impostazioni` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `impostazione` varchar(100) CHARACTER SET utf8mb4  NOT NULL,
  `impostazioneValore` longtext CHARACTER SET utf8mb4 ,
  `impTitolo` varchar(100) DEFAULT NULL,
  `impDescrizione` varchar(500) DEFAULT NULL,
  `impIsSistema` enum('0','1') NOT NULL DEFAULT '0',
  `impUserUpdate` int DEFAULT NULL,
  `impDateUpdate` datetime DEFAULT NULL,
  `impVersione` int NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 ;

-- ----------------------------
-- Records of impostazioni
-- ----------------------------
BEGIN;
INSERT INTO `impostazioni` VALUES (1, 'annoInteroDalMese', '30/07', NULL, NULL, '1', NULL, NULL, 1, NULL, NULL);
INSERT INTO `impostazioni` VALUES (2, 'testo_dichiaro_che_diretta', '<p>Il Sottoscritto, consapevole delle conseguenze derivanti da dichiarazioni false o mendaci (art. 11, comma 2, DPR n. 403/98), nonché delle sanzioni previste dal codice penale e dalle leggi speciali in materia (art. 76, comma 4, DPR n. 445/2000), dichiara sotto la propria responsabilità:</p><ul><li>che tutto il materiale presentato come riproduzione di documenti originali al fine di beneficiare di rimborsi o altre prestazioni, corrisponde al vero e riproduce esattamente e fedelmente i documenti originali;</li><li>che tutta la documentazione prodotta riguarda esclusivamente prestazioni sanitarie effettuate e beneficiate dal dichiarante o eventuali aventi diritto;</li><li>che il soggetto per il quale viene&nbsp;presentata la documentazione ai fini del rimborso è un componente del proprio Nucleo Familiare secondo la definizione riportata nello Statuto di Cooperazione Salute e richiamata nel piano sanitario a cui aderisce;</li><li>nel caso in cui la richiesta sia riferita ad un figlio maggiorenne fino al compimento del ventiseiesimo anno di età, che il familiare è fiscalmente a carico, come risulta dalla documentazione fiscale fornita;</li><li>nel caso in cui la richiesta sia riferita ad un figlio maggiorenne di ventisei anni e permanentemente inabile al lavoro e non percettore di reddito, che il soggetto è fiscalmente a carico e permanentemente inabile al lavoro, come risulta dalla documentazione fornita;</li><li>di aver preso visione dell’informativa resa da Cooperazione Salute ai sensi della normativa in materia di protezione dei dati personali, e acconsente al trattamento dei propri dati sensibili, ovvero dei dati personali, anche sensibili, del familiare cui si riferisce la prestazione, da parte di Cooperazione Salute, nei limiti indicati dall’informativa;</li><li>di essere consapevole che non fornendo chiarimenti e documenti richiesti entro il termine indicato, la pratica sarà respinta;</li><li>di essere consapevole che Cooperazione Salute comunicherà i dati relativi ai benefici ottenuti dall’utilizzo della copertura sanitaria all’Agenzia delle Entrate al fine della precompilazione della dichiarazione dei redditi;</li><li>di essere consapevole che nel caso in cui la fattura sia oggetto di rimborso da parte di altri Enti, dovrà darne nota/evidenza al momento della richiesta di rimborso. Ciò al fine di favorire una corretta gestione della pratica ed evitare che gli sia riconosciuto per somma un importo superiore a quello della stessa fattura;</li><li>di accettare che Cooperazione Salute possa richiedere la presentazione della documentazione in originale, con garanzia di restituzione, dopo i dovuti controlli.</li></ul>', 'Dichiaro che - Diretta 1', 'Testo de dichiaro que 2', '0', 5, '2023-04-13 00:00:00', 1, '2023-04-04 22:59:32', '2023-04-14 05:15:59');
INSERT INTO `impostazioni` VALUES (3, 'testo_dichiaro_che_indiretta', '<p>Illll Sottoscritto, consapevole delle conseguenze derivanti da dichiarazioni false o mendaci (art. 11, comma 2, DPR n. 403/98), nonché delle sanzioni previste dal codice penale e dalle leggi speciali in materia (art. 76, comma 4, DPR n. 445/2000), dichiara sotto la propria responsabilità:</p><ul><li>che tutto il materiale presentato come riproduzione di documenti originali al fine di beneficiare di rimborsi o altre prestazioni, corrisponde al vero e riproduce esattamente e fedelmente i documenti originali;</li><li>che tutta la documentazione prodotta riguarda esclusivamente prestazioni sanitarie effettuate e beneficiate dal dichiarante o eventuali aventi diritto;</li><li>che il soggetto per il quale viene&nbsp;presentata la documentazione ai fini del rimborso è un componente del proprio Nucleo Familiare secondo la definizione riportata nello Statuto di Cooperazione Salute e richiamata nel piano sanitario a cui aderisce;</li><li>nel caso in cui la richiesta sia riferita ad un figlio maggiorenne fino al compimento del ventiseiesimo anno di età, che il familiare è fiscalmente a carico, come risulta dalla documentazione fiscale fornita;</li><li>nel caso in cui la richiesta sia riferita ad un figlio maggiorenne di ventisei anni e permanentemente inabile al lavoro e non percettore di reddito, che il soggetto è fiscalmente a carico e permanentemente inabile al lavoro, come risulta dalla documentazione fornita;</li><li>di aver preso visione dell’informativa resa da Cooperazione Salute ai sensi della normativa in materia di protezione dei dati personali, e acconsente al trattamento dei propri dati sensibili, ovvero dei dati personali, anche sensibili, del familiare cui si riferisce la prestazione, da parte di Cooperazione Salute, nei limiti indicati dall’informativa;</li><li>di essere consapevole che non fornendo chiarimenti e documenti richiesti entro il termine indicato, la pratica sarà respinta;</li><li>di essere consapevole che Cooperazione Salute comunicherà i dati relativi ai benefici ottenuti dall’utilizzo della copertura sanitaria all’Agenzia delle Entrate al fine della precompilazione della dichiarazione dei redditi;</li></ul><p><br></p>', 'Dichiaro che - Indiretta', 'vamos!', '0', 5, '2023-04-06 00:00:00', 1, '2023-04-05 01:45:03', '2023-04-06 21:40:24');
INSERT INTO `impostazioni` VALUES (4, 'testo_istruzioni_dati_bancari', '<p>A Controlla che il codice IBAN inserito sia corretto e sia quello sul quale desideri far accreditare il rimborso e che il nome riportato nella casella sia riconducibile all\'effettivo intestatario (non necessariamente l\'iscritto). <u>Per eventuale conto corrente postale o libretto</u>, ti invitiamo a verificare con l’ufficio postale che lo stesso sia abilitato alla ricezione di accrediti da parte di terzi.</p>', 'Istruzioni dati bancarie', NULL, '0', 5, '2023-04-06 00:00:00', 1, '2023-04-06 23:26:24', '2023-04-06 23:26:24');
INSERT INTO `impostazioni` VALUES (5, 'giorni_prima_richiedere_pratica_indiretta', '120', 'Giorni prima per richiedere una pratica - Indiretta', NULL, '0', 5, '2023-04-13 00:00:00', 1, '2023-04-14 04:56:19', '2023-04-14 05:17:39');
COMMIT;

-- ----------------------------
-- Table structure for modalita_pagamento
-- ----------------------------
DROP TABLE IF EXISTS `modalita_pagamento`;
CREATE TABLE `modalita_pagamento` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `modalita` varchar(255) CHARACTER SET utf8mb4  DEFAULT NULL,
  `attivo` enum('1','0') CHARACTER SET utf8mb4  NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 ;

-- ----------------------------
-- Records of modalita_pagamento
-- ----------------------------
BEGIN;
INSERT INTO `modalita_pagamento` VALUES (1, 'Carta di credito o carta prepagata', '1', NULL, NULL);
INSERT INTO `modalita_pagamento` VALUES (2, 'Addebito Diretto Sepa (Sdd)', '1', NULL, NULL);
INSERT INTO `modalita_pagamento` VALUES (3, 'Bonifico bancario', '1', NULL, NULL);
INSERT INTO `modalita_pagamento` VALUES (4, 'Bonifico bancario + Addebito Diretto Sepa (Sdd)', '1', NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for prodotti
-- ----------------------------
DROP TABLE IF EXISTS `prodotti`;
CREATE TABLE `prodotti` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `prodConvenzioneId` bigint DEFAULT NULL,
  `prodIdFondo` int DEFAULT NULL,
  `prodNome` varchar(255) CHARACTER SET utf8mb4  DEFAULT NULL,
  `prodNomePubb` varchar(255) CHARACTER SET utf8mb4  DEFAULT NULL,
  `prodNote` varchar(255) CHARACTER SET utf8mb4  DEFAULT NULL,
  `prodDescrizione` text CHARACTER SET utf8mb4 ,
  `filenameProdotto` varchar(100) CHARACTER SET utf8mb4  DEFAULT NULL,
  `prodDataInizio` date DEFAULT NULL,
  `prodDataFine` date DEFAULT NULL,
  `prodCollegatoId` bigint DEFAULT NULL,
  `prodottoPropedId` bigint DEFAULT NULL,
  `prodVersione` double(8,2) DEFAULT NULL,
  `prodBloccatoEdit` enum('1','0') CHARACTER SET utf8mb4  DEFAULT '0',
  `prodBloccatoCollegato` enum('1','0') CHARACTER SET utf8mb4  DEFAULT '0',
  `annoInteroDalMese` varchar(6) CHARACTER SET utf8mb4  DEFAULT NULL,
  `annoInteroPagaDalMese` varchar(6) CHARACTER SET utf8mb4  DEFAULT NULL,
  `data_key` varchar(50) DEFAULT NULL,
  `prodImpostazioni` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 ;

-- ----------------------------
-- Records of prodotti
-- ----------------------------
BEGIN;
INSERT INTO `prodotti` VALUES (8, 1, 122, 'PRODUTO 1', 'PRODUTO 1', NULL, NULL, NULL, '2023-01-01', '2025-12-31', NULL, NULL, 1.00, '0', '0', NULL, NULL, NULL, NULL, '2023-07-10 11:13:06', '2023-07-10 11:13:06', NULL);
INSERT INTO `prodotti` VALUES (9, 1, 122, 'PRODUTO 2 - 2023', 'PRODUTO 2 - 2023', NULL, NULL, NULL, '2023-01-01', '2023-12-31', NULL, NULL, 1.00, '0', '0', NULL, NULL, NULL, NULL, '2023-07-10 11:14:44', '2023-07-10 11:14:44', NULL);
INSERT INTO `prodotti` VALUES (10, 1, 122, 'PRODUTO 3 - 2023 COM PROP', 'PRODUTO 3 - 2023 COM PROP', NULL, NULL, NULL, '2023-01-01', '2023-12-31', NULL, NULL, 1.00, '0', '0', NULL, NULL, NULL, NULL, '2023-07-10 11:16:16', '2023-07-10 11:16:16', NULL);
INSERT INTO `prodotti` VALUES (11, 1, 122, 'PRODUTO 4 - PROP', 'PRODUTO 4 - PROP', NULL, NULL, NULL, '2024-01-01', '2024-12-31', NULL, 10, 1.00, '0', '0', NULL, NULL, NULL, NULL, '2023-07-10 11:17:38', '2023-07-10 11:17:38', NULL);
INSERT INTO `prodotti` VALUES (12, 1, 122, 'PRODUTO 5 - V1', 'PRODUTO 5 - V1', NULL, NULL, NULL, '2023-01-01', '2023-09-20', NULL, NULL, 1.00, '0', '0', NULL, NULL, NULL, NULL, '2023-07-10 11:32:08', '2023-07-10 11:32:08', NULL);
INSERT INTO `prodotti` VALUES (13, 1, 122, 'PRODUTO 5 - V2', 'PRODUTO 5 - V2', NULL, NULL, NULL, '2023-09-21', '2030-12-31', NULL, 12, 2.00, '0', '0', NULL, NULL, NULL, NULL, '2023-07-10 11:33:08', '2023-07-10 11:33:08', NULL);
COMMIT;

-- ----------------------------
-- Table structure for prodotti_documentazioni
-- ----------------------------
DROP TABLE IF EXISTS `prodotti_documentazioni`;
CREATE TABLE `prodotti_documentazioni` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `prodottoId` bigint unsigned DEFAULT NULL,
  `nome` varchar(100) CHARACTER SET utf8mb4  NOT NULL,
  `filename` varchar(100) CHARACTER SET utf8mb4  NOT NULL,
  `addettoModificaId` int NOT NULL,
  `visibileHome` enum('1','0') CHARACTER SET utf8mb4  DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `prodotti_documentazioni_prodottoid_index` (`prodottoId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ;

-- ----------------------------
-- Records of prodotti_documentazioni
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for prodotti_garanzie
-- ----------------------------
DROP TABLE IF EXISTS `prodotti_garanzie`;
CREATE TABLE `prodotti_garanzie` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `prodottoId` bigint unsigned NOT NULL,
  `gruppiMassimaleGaranzieId` bigint DEFAULT NULL,
  `gruppiSubMassimaleGaranzieId` bigint DEFAULT NULL,
  `gruppiMassimaleEventoId` bigint DEFAULT NULL,
  `tipologiaId` bigint DEFAULT NULL,
  `garanzAreaId` int DEFAULT NULL,
  `garanzPrestazione` varchar(255) CHARACTER SET utf8mb4  DEFAULT NULL,
  `garanzMassimale` double(10,2) DEFAULT NULL,
  `garanzCarenza` int DEFAULT NULL,
  `garanzScoperto` double(10,2) DEFAULT NULL,
  `garanzFranchigiaMinima` double(10,2) DEFAULT NULL,
  `garanzFranchigiaMassima` double(10,2) DEFAULT NULL,
  `garanzRimborsoMassimo` int DEFAULT NULL,
  `garanzImpMassRimbSingSinistro` double(10,2) DEFAULT NULL,
  `garanzDescrizione` varchar(2000) CHARACTER SET utf8mb4  DEFAULT NULL,
  `garanzGiorniRimborsoMassimo` int DEFAULT NULL,
  `garanzImpGiorniRimborso` double(10,2) DEFAULT NULL,
  `garanzCollegata` int DEFAULT NULL,
  `garanzSomaMassimale` enum('1','0') CHARACTER SET utf8mb4  DEFAULT NULL,
  `garanzPerEvento` enum('1','0') CHARACTER SET utf8mb4  DEFAULT '0',
  `garanzAttivoGiorniPrima` int DEFAULT NULL,
  `garanzScadutiGiorniDopo` int DEFAULT NULL,
  `garanzNumeroMaxEvtSingolaPrestazione` int DEFAULT NULL,
  `garanzNumeroAnniVerificaStorico` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `garanzie_per_prodotto` (`prodottoId`)
) ENGINE=InnoDB AUTO_INCREMENT=206 DEFAULT CHARSET=utf8mb4 ;

-- ----------------------------
-- Records of prodotti_garanzie
-- ----------------------------
BEGIN;
INSERT INTO `prodotti_garanzie` VALUES (200, 8, NULL, NULL, NULL, 172, NULL, 'PRESTAZIONE A', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'PRESTAZIONE', NULL, NULL, 0, NULL, '0', NULL, NULL, NULL, NULL, '2023-07-10 11:13:06', '2023-07-10 11:13:06', NULL);
INSERT INTO `prodotti_garanzie` VALUES (201, 9, NULL, NULL, NULL, 172, NULL, 'PRESTAZIONE B', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'PRESTAZIONE', NULL, NULL, 0, NULL, '0', NULL, NULL, NULL, NULL, '2023-07-10 11:14:44', '2023-07-10 11:14:44', NULL);
INSERT INTO `prodotti_garanzie` VALUES (202, 10, NULL, NULL, NULL, 172, NULL, 'PRESTAZIONE C', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'PRESTAZIONE', NULL, NULL, 0, NULL, '0', NULL, NULL, NULL, NULL, '2023-07-10 11:16:16', '2023-07-10 11:16:16', NULL);
INSERT INTO `prodotti_garanzie` VALUES (203, 11, NULL, NULL, NULL, 171, NULL, 'PRESTAZIONE B', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'PRESTAZIONE', NULL, NULL, 0, NULL, '0', NULL, NULL, NULL, NULL, '2023-07-10 11:17:38', '2023-07-10 11:17:38', NULL);
INSERT INTO `prodotti_garanzie` VALUES (204, 12, NULL, NULL, NULL, 172, NULL, 'PRESTAZIONE E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'PRESTAZIONE', NULL, NULL, 0, NULL, '0', NULL, NULL, NULL, NULL, '2023-07-10 11:32:08', '2023-07-10 11:32:08', NULL);
INSERT INTO `prodotti_garanzie` VALUES (205, 13, NULL, NULL, NULL, 172, NULL, 'PRESTAZIONE F', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'PRESTAZIONE', NULL, NULL, 0, NULL, '0', NULL, NULL, NULL, NULL, '2023-07-10 11:33:08', '2023-07-10 11:33:08', NULL);
COMMIT;

-- ----------------------------
-- Table structure for prodotti_garanzie_area
-- ----------------------------
DROP TABLE IF EXISTS `prodotti_garanzie_area`;
CREATE TABLE `prodotti_garanzie_area` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `area` varchar(255) CHARACTER SET utf8mb4  NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 ;

-- ----------------------------
-- Records of prodotti_garanzie_area
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for prodotti_garanzie_correlata
-- ----------------------------
DROP TABLE IF EXISTS `prodotti_garanzie_correlata`;
CREATE TABLE `prodotti_garanzie_correlata` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `prodottoId` bigint DEFAULT NULL,
  `garanziaId` bigint unsigned DEFAULT NULL,
  `garanziaCorrelataId` bigint DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `prodotti_garanzie_correlata` (`garanziaId`)
) ENGINE=InnoDB AUTO_INCREMENT=339 DEFAULT CHARSET=utf8mb4 ;

-- ----------------------------
-- Records of prodotti_garanzie_correlata
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for prodotti_garanzie_tree
-- ----------------------------
DROP TABLE IF EXISTS `prodotti_garanzie_tree`;
CREATE TABLE `prodotti_garanzie_tree` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `prodottoId` bigint unsigned DEFAULT NULL,
  `oggettoId` bigint DEFAULT NULL,
  `tipoOggetto` int DEFAULT NULL COMMENT '1=Massimale, 2=Sub-massimale, 3=Garanzie, 4=massimale di evento, 5=Garanzia evento',
  `parenteId` bigint DEFAULT NULL,
  `tipoParente` int DEFAULT NULL COMMENT '1=Massimale, 2=Sub-massimale, 3=Garanzie, 4=massimale di evento, 5=Garanzia evento',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `garanzie_tree_per_prodotto` (`prodottoId`)
) ENGINE=InnoDB AUTO_INCREMENT=257 DEFAULT CHARSET=utf8mb4 ;

-- ----------------------------
-- Records of prodotti_garanzie_tree
-- ----------------------------
BEGIN;
INSERT INTO `prodotti_garanzie_tree` VALUES (251, 8, 200, 3, NULL, NULL, '2023-07-10 11:13:06', '2023-07-10 11:13:06', NULL);
INSERT INTO `prodotti_garanzie_tree` VALUES (252, 9, 201, 3, NULL, NULL, '2023-07-10 11:14:44', '2023-07-10 11:14:44', NULL);
INSERT INTO `prodotti_garanzie_tree` VALUES (253, 10, 202, 3, NULL, NULL, '2023-07-10 11:16:16', '2023-07-10 11:16:16', NULL);
INSERT INTO `prodotti_garanzie_tree` VALUES (254, 11, 203, 3, NULL, NULL, '2023-07-10 11:17:38', '2023-07-10 11:17:38', NULL);
INSERT INTO `prodotti_garanzie_tree` VALUES (255, 12, 204, 3, NULL, NULL, '2023-07-10 11:32:08', '2023-07-10 11:32:08', NULL);
INSERT INTO `prodotti_garanzie_tree` VALUES (256, 13, 205, 3, NULL, NULL, '2023-07-10 11:33:08', '2023-07-10 11:33:08', NULL);
COMMIT;

-- ----------------------------
-- Table structure for prodotti_garanzie_vocistatistiche
-- ----------------------------
DROP TABLE IF EXISTS `prodotti_garanzie_vocistatistiche`;
CREATE TABLE `prodotti_garanzie_vocistatistiche` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `garanziaId` bigint unsigned NOT NULL,
  `gvocDescrizione` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ;

-- ----------------------------
-- Records of prodotti_garanzie_vocistatistiche
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for prodotti_gruppi_massimale_garanzie
-- ----------------------------
DROP TABLE IF EXISTS `prodotti_gruppi_massimale_garanzie`;
CREATE TABLE `prodotti_gruppi_massimale_garanzie` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `prodottoId` bigint unsigned NOT NULL,
  `gruMGNome` varchar(255) CHARACTER SET utf8mb4  DEFAULT NULL,
  `gruMGmassimale` double(10,2) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `gruppi_massimale_per_prodotto` (`prodottoId`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 ;

-- ----------------------------
-- Records of prodotti_gruppi_massimale_garanzie
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for prodotti_gruppi_sub_massimale_garanzie
-- ----------------------------
DROP TABLE IF EXISTS `prodotti_gruppi_sub_massimale_garanzie`;
CREATE TABLE `prodotti_gruppi_sub_massimale_garanzie` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `prodottoId` bigint unsigned NOT NULL,
  `prodtGrupMassimaleId` bigint unsigned NOT NULL,
  `gruMGSNome` varchar(255) CHARACTER SET utf8mb4  DEFAULT NULL,
  `gruMGSmassimale` double(10,2) DEFAULT NULL,
  `gruMGSmassimaleMisto` double(10,2) DEFAULT NULL,
  `gruMGSNumeroMaxPestazioni` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `gruppi_sub_massimale_per_prodotto` (`prodottoId`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 ;

-- ----------------------------
-- Records of prodotti_gruppi_sub_massimale_garanzie
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for prodotti_massimale_garanzie_evento
-- ----------------------------
DROP TABLE IF EXISTS `prodotti_massimale_garanzie_evento`;
CREATE TABLE `prodotti_massimale_garanzie_evento` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `prodottoId` bigint unsigned NOT NULL,
  `gruEventoMNome` varchar(255) CHARACTER SET utf8mb4  DEFAULT NULL,
  `gruEventoMassimale` double(10,2) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `massimale_garanzie_evento_per_prodotto` (`prodottoId`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 ;

-- ----------------------------
-- Records of prodotti_massimale_garanzie_evento
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for prodotti_prezzi
-- ----------------------------
DROP TABLE IF EXISTS `prodotti_prezzi`;
CREATE TABLE `prodotti_prezzi` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `prodottoId` bigint unsigned NOT NULL,
  `dataDecorrenza` date DEFAULT NULL,
  `prezzoSingolo` double(10,2) DEFAULT NULL,
  `prezzoGruppo` double(10,2) DEFAULT NULL,
  `prezzoFamiliariSingolo` double(10,2) DEFAULT NULL,
  `prezzoFamiliariGruppo` double(10,2) DEFAULT NULL,
  `prezzoAziendaGruppo` double(10,2) DEFAULT NULL,
  `prezzoAziendaFamiliariGruppo` double(10,2) DEFAULT NULL,
  `fasciaDiEtaFinoAl` char(3) CHARACTER SET utf8mb4  DEFAULT NULL,
  `fasciaCommissione` float(8,2) DEFAULT NULL,
  `fasciaCommissioneAgenzia` float(8,2) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `prodotti_prezzi_datadecorrenza_fasciadietafinoal_index` (`dataDecorrenza`,`fasciaDiEtaFinoAl`),
  KEY `prezzi_per_prodotto` (`prodottoId`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 ;

-- ----------------------------
-- Records of prodotti_prezzi
-- ----------------------------
BEGIN;
INSERT INTO `prodotti_prezzi` VALUES (14, 8, '2023-07-10', NULL, 20.00, NULL, 40.00, NULL, NULL, '39', NULL, NULL, '2023-07-10 11:13:06', '2023-07-10 11:13:06', NULL);
INSERT INTO `prodotti_prezzi` VALUES (15, 8, '2023-07-10', NULL, 35.00, NULL, 70.00, NULL, NULL, '70', NULL, NULL, '2023-07-10 11:13:06', '2023-07-10 11:13:06', NULL);
INSERT INTO `prodotti_prezzi` VALUES (16, 9, '2023-07-10', NULL, 22.00, NULL, 44.00, NULL, NULL, NULL, NULL, NULL, '2023-07-10 11:14:44', '2023-07-10 11:14:44', NULL);
INSERT INTO `prodotti_prezzi` VALUES (17, 10, '2023-07-10', NULL, 21.00, NULL, 42.00, NULL, NULL, NULL, NULL, NULL, '2023-07-10 11:16:16', '2023-07-10 11:16:16', NULL);
INSERT INTO `prodotti_prezzi` VALUES (18, 11, '2023-07-10', NULL, 30.00, NULL, 60.00, NULL, NULL, NULL, NULL, NULL, '2023-07-10 11:17:38', '2023-07-10 11:17:38', NULL);
INSERT INTO `prodotti_prezzi` VALUES (19, 12, '2023-07-10', NULL, 20.00, NULL, 40.00, NULL, NULL, NULL, NULL, NULL, '2023-07-10 11:32:08', '2023-07-10 11:32:08', NULL);
INSERT INTO `prodotti_prezzi` VALUES (20, 13, '2023-07-10', NULL, 21.50, NULL, 43.00, NULL, NULL, NULL, NULL, NULL, '2023-07-10 11:33:08', '2023-07-10 11:33:08', NULL);
COMMIT;

-- ----------------------------
-- Table structure for prodotti_tipologie_prestazioni
-- ----------------------------
DROP TABLE IF EXISTS `prodotti_tipologie_prestazioni`;
CREATE TABLE `prodotti_tipologie_prestazioni` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `prodottoId` bigint unsigned DEFAULT NULL,
  `tipologiaPrestazioneId` bigint unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ;

-- ----------------------------
-- Records of prodotti_tipologie_prestazioni
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for programmi
-- ----------------------------
DROP TABLE IF EXISTS `programmi`;
CREATE TABLE `programmi` (
  `proID` int unsigned NOT NULL AUTO_INCREMENT,
  `proCodice` varchar(50) NOT NULL,
  `proDescrizione` varchar(100) NOT NULL,
  `proLivelli` varchar(2) NOT NULL,
  `proAmbito` varchar(30) NOT NULL,
  `DTID` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `DTIDInsert` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`proID`),
  UNIQUE KEY `proCodice` (`proCodice`)
) ENGINE=InnoDB AUTO_INCREMENT=191 DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of programmi
-- ----------------------------
BEGIN;
INSERT INTO `programmi` VALUES (63, 'av_anagrafiche_ricerca', 'Ricerca anagrafiche', '1', 'GestionaleWeb', '2023-06-28 21:52:36', '2022-08-25 08:57:04');
INSERT INTO `programmi` VALUES (64, 'av_anagrafiche_nuova', 'Creare una anagrafica', '1', 'GestionaleWeb', '2023-06-28 21:52:36', '2022-08-25 08:57:04');
INSERT INTO `programmi` VALUES (65, 'av_anagrafica_modificare', 'Modificare una anagrafica', '1', 'GestionaleWeb', '2023-06-28 21:52:36', '2022-08-25 08:57:04');
INSERT INTO `programmi` VALUES (66, 'av_aziende', 'Visualizzare il menu Aziende', '1', 'GestionaleWeb', '2023-06-28 21:52:36', '2022-08-25 08:57:04');
INSERT INTO `programmi` VALUES (67, 'av_aziende_ricerca', 'Ricerca Aziende', '1', 'GestionaleWeb', '2023-06-28 21:52:36', '2022-08-25 08:57:04');
INSERT INTO `programmi` VALUES (68, 'av_aziende_nuova', 'Creare una azienda', '1', 'GestionaleWeb', '2023-06-28 21:52:36', '2022-08-25 08:57:04');
INSERT INTO `programmi` VALUES (69, 'av_aziende_modificare', 'Modificare una azienda', '1', 'GestionaleWeb', '2023-06-28 21:52:36', '2022-08-25 08:57:04');
INSERT INTO `programmi` VALUES (70, 'av_aziende_rimuovere', 'Rimuovere una azienda', '1', 'GestionaleWeb', '2023-06-28 21:52:36', '2022-08-25 08:57:04');
INSERT INTO `programmi` VALUES (71, 'av_convenzione', 'Visualizzare il menu Convenzione', '1', 'GestionaleWeb', '2023-06-28 21:52:36', '2022-08-25 08:57:04');
INSERT INTO `programmi` VALUES (72, 'av_convenzione_ricerca', 'Ricerca convenzione', '1', 'GestionaleWeb', '2023-06-28 21:52:36', '2022-08-25 08:57:04');
INSERT INTO `programmi` VALUES (73, 'av_convenzione_nuova', 'Creare una convenzione', '1', 'GestionaleWeb', '2023-06-28 21:52:36', '2022-08-25 08:57:04');
INSERT INTO `programmi` VALUES (74, 'av_convenzione_modificare', 'Modificare una convenzione', '1', 'GestionaleWeb', '2023-06-28 21:52:36', '2022-08-25 08:57:04');
INSERT INTO `programmi` VALUES (75, 'av_convenzione_rimuovere', 'Rimuovere una convenzione', '1', 'GestionaleWeb', '2023-06-28 21:52:36', '2022-08-25 08:57:04');
INSERT INTO `programmi` VALUES (76, 'av_prodotti', 'Visualizzare il menu Prodotti', '1', 'GestionaleWeb', '2023-06-28 21:52:36', '2022-08-25 08:57:04');
INSERT INTO `programmi` VALUES (77, 'av_prodotti_ricerca', 'Ricerca prodotti', '1', 'GestionaleWeb', '2023-06-28 21:52:36', '2022-08-25 08:57:04');
INSERT INTO `programmi` VALUES (78, 'av_prodotti_nuova', 'Creare un prodotto', '1', 'GestionaleWeb', '2023-06-28 21:52:36', '2022-08-25 08:57:04');
INSERT INTO `programmi` VALUES (79, 'av_prodotti_modificare', 'Modificare un prodotto', '1', 'GestionaleWeb', '2023-06-28 21:52:36', '2022-08-25 08:57:04');
INSERT INTO `programmi` VALUES (80, 'av_prodotti_modificare_bloccato', 'Modificare un prodotto bloccato', '1', 'GestionaleWeb', '2023-06-28 21:52:36', '2022-08-25 08:57:04');
INSERT INTO `programmi` VALUES (81, 'av_prodotti_rimuovere', 'Rimuovere una prodotto', '1', 'GestionaleWeb', '2023-06-28 21:52:36', '2022-08-25 08:57:04');
INSERT INTO `programmi` VALUES (82, 'av_adesione', 'Visualizzare il menu Adesione', '1', 'GestionaleWeb', '2023-06-28 21:52:36', '2022-08-25 08:57:04');
INSERT INTO `programmi` VALUES (83, 'av_adesione_ricerca', 'Ricerca adesione', '1', 'GestionaleWeb', '2023-06-28 21:52:36', '2022-08-25 08:57:04');
INSERT INTO `programmi` VALUES (84, 'av_adesione_nuova', 'Creare una adesione', '1', 'GestionaleWeb', '2023-06-28 21:52:36', '2022-08-25 08:57:04');
INSERT INTO `programmi` VALUES (85, 'av_adesione_rimuovere', 'Rimuovere una adesione', '1', 'GestionaleWeb', '2023-06-28 21:52:36', '2022-08-25 08:57:04');
INSERT INTO `programmi` VALUES (86, 'av_adesione_gestione_quote_visualizzare', 'Visualizzare le quote di adesione', '1', 'GestionaleWeb', '2023-06-28 21:52:36', '2022-08-25 08:57:04');
INSERT INTO `programmi` VALUES (87, 'av_adesione_gestione_quote_pagamento', 'Gestire le quote di pagamento', '1', 'GestionaleWeb', '2023-06-28 21:52:36', '2022-08-25 08:57:04');
INSERT INTO `programmi` VALUES (88, 'av_sinistri', 'Visualizzare il menu Sinistri', '1', 'GestionaleWeb', '2023-06-28 21:52:36', '2022-08-25 08:57:04');
INSERT INTO `programmi` VALUES (89, 'av_sinistri_elenco', 'Visualizzare il Elenco di sinistri', '1', 'GestionaleWeb', '2023-06-28 21:52:36', '2022-08-25 08:57:04');
INSERT INTO `programmi` VALUES (90, 'av_sinistri_lavorazione', 'Lavorare su un  sinistro', '1', 'GestionaleWeb', '2023-06-28 21:52:36', '2022-08-25 08:57:04');
INSERT INTO `programmi` VALUES (91, 'av_sinistri_stato_liquidabile', 'Mettere il sinistro in stato di liquidabile', '1', 'GestionaleWeb', '2023-06-28 21:52:36', '2022-08-25 08:57:04');
INSERT INTO `programmi` VALUES (92, 'av_sinistri_stato_respinto', 'Mettere il sinistro in stato di Respinto', '1', 'GestionaleWeb', '2023-06-28 21:52:36', '2022-08-25 08:57:04');
INSERT INTO `programmi` VALUES (93, 'av_sinistri_stato_autorizzato', 'Mettere il sinistro in stato di Autorizzato', '1', 'GestionaleWeb', '2023-06-28 21:52:36', '2022-08-25 08:57:04');
INSERT INTO `programmi` VALUES (94, 'av_sinistri_stato_attesa_documenti', 'Mettere il sinistro in stato di Attesa documenti', '1', 'GestionaleWeb', '2023-06-28 21:52:36', '2022-08-25 08:57:04');
INSERT INTO `programmi` VALUES (95, 'av_sinistri_stato_sospeso', 'Mettere il sinistro in stato di Sospeso', '1', 'GestionaleWeb', '2023-06-28 21:52:36', '2022-08-25 08:57:04');
INSERT INTO `programmi` VALUES (96, 'av_sinistri_stato_liquidato', 'Mettere il sinistro in stato di Liquidato', '1', 'GestionaleWeb', '2023-06-28 21:52:36', '2022-08-25 08:57:04');
INSERT INTO `programmi` VALUES (97, 'av_sinistri_stato_liquidato_acconto', 'Mettere il sinistro in stato di Liquidato acconto', '1', 'GestionaleWeb', '2023-06-28 21:52:36', '2022-08-25 08:57:04');
INSERT INTO `programmi` VALUES (98, 'av_sinistri_stato_validazione_tariffa', 'Mettere il sinistro in stato di Validazione tariffa', '1', 'GestionaleWeb', '2023-06-28 21:52:36', '2022-08-25 08:57:04');
INSERT INTO `programmi` VALUES (99, 'av_sinistri_stato_in_contestazione', 'Mettere il sinistro in stato di In contestazione', '1', 'GestionaleWeb', '2023-06-28 21:52:36', '2022-08-25 08:57:04');
INSERT INTO `programmi` VALUES (100, 'av_sinistri_stato_attesa_integrazione', 'Mettere il sinistro in stato di Attesa integrazione', '1', 'GestionaleWeb', '2023-06-28 21:52:36', '2022-08-25 08:57:04');
INSERT INTO `programmi` VALUES (101, 'av_sinistri_stato_revocato', 'Mettere il sinistro in stato di Revocato', '1', 'GestionaleWeb', '2023-06-28 21:52:36', '2022-08-25 08:57:04');
INSERT INTO `programmi` VALUES (102, 'av_sinistri_protocolli', 'Visualizzare il Elenco di protocolli', '1', 'GestionaleWeb', '2023-06-28 21:52:36', '2022-08-25 08:57:04');
INSERT INTO `programmi` VALUES (103, 'av_sinistri_protocolli_genera', 'Genera la Pre-elaborazione del sinistro', '1', 'GestionaleWeb', '2023-06-28 21:52:36', '2022-08-25 08:57:04');
INSERT INTO `programmi` VALUES (104, 'av_sinistri_ricevuti', 'Visualizzare il Elenco della pratica ricevuti', '1', 'GestionaleWeb', '2023-06-28 21:52:36', '2022-08-25 08:57:04');
INSERT INTO `programmi` VALUES (105, 'av_sinistri_ricevuti_elabora', 'Elaborare le pratiche ricevuti', '1', 'GestionaleWeb', '2023-06-28 21:52:36', '2022-08-25 08:57:04');
INSERT INTO `programmi` VALUES (106, 'av_sinistri_richiesta', 'Creare una Richiesta della pratica', '1', 'GestionaleWeb', '2023-06-28 21:52:36', '2022-08-25 08:57:04');
INSERT INTO `programmi` VALUES (107, 'av_qualita', 'Visualizzare il menu Qualità', '1', 'GestionaleWeb', '2023-06-28 21:52:36', '2022-08-25 08:57:04');
INSERT INTO `programmi` VALUES (108, 'av_qualita_prenotazione', 'Visualizzare il Elenco Qualità - Prenotazione', '1', 'GestionaleWeb', '2023-06-28 21:52:36', '2022-08-25 08:57:04');
INSERT INTO `programmi` VALUES (109, 'av_qualita_lavorazione', 'Visualizzare il Elenco Qualità - Lavorazione', '1', 'GestionaleWeb', '2023-06-28 21:52:36', '2022-08-25 08:57:04');
INSERT INTO `programmi` VALUES (110, 'av_qualita_lavoro', 'Lavorare su un sinistro in qualità', '1', 'GestionaleWeb', '2023-06-28 21:52:36', '2022-08-25 08:57:04');
INSERT INTO `programmi` VALUES (111, 'av_amministrazione', 'Visualizzare il menu Amministrazione', '1', 'GestionaleWeb', '2023-06-28 21:52:36', '2022-08-25 08:57:04');
INSERT INTO `programmi` VALUES (112, 'av_amministrazione_liquidazione', 'Visualizzare il Elenco Amministrazione - Liquidazione', '1', 'GestionaleWeb', '2023-06-28 21:52:36', '2022-08-25 08:57:04');
INSERT INTO `programmi` VALUES (113, 'av_amministrazione_genera_liquidazione', 'In Amministrazione, genera la liquidazione', '1', 'GestionaleWeb', '2023-06-28 21:52:36', '2022-08-25 08:57:04');
INSERT INTO `programmi` VALUES (114, 'av_amministrazione_distinte', 'Visualizzare il Elenco Amministrazione - Distinte', '1', 'GestionaleWeb', '2023-06-28 21:52:36', '2022-08-25 08:57:04');
INSERT INTO `programmi` VALUES (115, 'av_amministrazione_genera_bonifici', 'In Amministrazione, genera il file bonifici SEPA', '1', 'GestionaleWeb', '2023-06-28 21:52:36', '2022-08-25 08:57:04');
INSERT INTO `programmi` VALUES (116, 'av_amministrazione_storicodistinte', 'Visualizzare il Elenco Amministrazione - Storico distinte', '1', 'GestionaleWeb', '2023-06-28 21:52:36', '2022-08-25 08:57:04');
INSERT INTO `programmi` VALUES (117, 'av_amministrazione_storicodistinte_scarica', 'In Amministrazione, scarica il file bonifici SEPA', '1', 'GestionaleWeb', '2023-06-28 21:52:36', '2022-08-25 08:57:04');
INSERT INTO `programmi` VALUES (118, 'av_impostazione', 'Visualizzare il menu Impostazione', '1', 'GestionaleWeb', '2023-06-28 21:52:36', '2022-08-25 08:57:04');
INSERT INTO `programmi` VALUES (119, 'av_addetti', 'Visualizzare il menu Addetti', '1', 'GestionaleWeb', '2023-06-28 21:52:36', '2022-08-25 08:57:04');
INSERT INTO `programmi` VALUES (120, 'av_addetti_nuovo', 'Create un addetto', '1', 'GestionaleWeb', '2023-06-28 21:52:36', '2022-08-25 08:57:04');
INSERT INTO `programmi` VALUES (121, 'av_addetti_ricerca', 'Ricerca il addetti', '1', 'GestionaleWeb', '2023-06-28 21:52:36', '2022-08-25 08:57:04');
INSERT INTO `programmi` VALUES (122, 'av_addetti_abilitazioni', 'Visualizzare il Elenco di Abilitazioni', '1', 'GestionaleWeb', '2023-06-28 21:52:36', '2022-08-25 08:57:04');
INSERT INTO `programmi` VALUES (123, 'av_addetti_abilitazioni_modificare', 'Modificare i Abilitazioni', '1', 'GestionaleWeb', '2023-06-28 21:52:36', '2022-08-25 08:57:04');
INSERT INTO `programmi` VALUES (124, 'av_addetti_modificare', 'Modificare un addetto', '1', 'GestionaleWeb', '2023-06-28 21:52:36', '2022-08-25 20:17:37');
INSERT INTO `programmi` VALUES (125, 'av_addetti_rimuovere', 'Rimuovere un addetto', '1', 'GestionaleWeb', '2023-06-28 21:52:36', '2022-08-25 20:18:21');
INSERT INTO `programmi` VALUES (126, 'av_utenti_partner', 'Visualizzare il menu Utenti partner', '1', 'GestionaleWeb', '2023-06-28 21:52:36', '2022-10-06 17:33:59');
INSERT INTO `programmi` VALUES (127, 'av_utenti_partner_nuovo', 'Create un utenti partner', '1', 'GestionaleWeb', '2023-06-28 21:52:36', '2022-10-06 17:33:59');
INSERT INTO `programmi` VALUES (128, 'av_utenti_partner_ricerca', 'Visualizzare il Elenco di utenti partner', '1', 'GestionaleWeb', '2023-06-28 21:52:36', '2022-10-06 17:33:59');
INSERT INTO `programmi` VALUES (129, 'av_utenti_partner_convenzione', 'Assegna una convenzione all\'utente partner', '1', 'GestionaleWeb', '2023-06-28 21:52:36', '2022-10-07 16:59:53');
INSERT INTO `programmi` VALUES (130, 'av_utenti_partner_modificare', 'Modificare un utente partner', '1', 'GestionaleWeb', '2023-06-28 21:52:36', '2022-10-10 07:57:25');
INSERT INTO `programmi` VALUES (131, 'av_utenti_partner_rimuovere', 'Rimuovere un utente partner', '1', 'GestionaleWeb', '2023-06-28 21:52:36', '2022-10-10 07:57:25');
INSERT INTO `programmi` VALUES (132, 'av_utenti_partner_resetpws', 'Invia nuova password di utente partner', '1', 'GestionaleWeb', '2023-06-28 21:52:36', '2022-10-10 08:02:40');
INSERT INTO `programmi` VALUES (133, 'av_area_iscritti', 'Visualizzare il menu Area iscritti', '1', 'GestionaleWeb', '2023-06-28 21:52:36', '2022-10-11 14:22:22');
INSERT INTO `programmi` VALUES (134, 'av_privacy_identificazione', 'Visualizzare Privacy identificazione', '1', 'GestionaleWeb', '2023-06-28 21:52:36', '2022-10-11 14:22:22');
INSERT INTO `programmi` VALUES (135, 'av_privacy_identificazione_mod', 'Modificare Privacy identificazione', '1', 'GestionaleWeb', '2023-06-28 21:52:36', '2022-10-11 14:22:22');
INSERT INTO `programmi` VALUES (136, 'av_istruzione_diretta', 'Visualizzare Istruzione diretta', '1', 'GestionaleWeb', '2023-06-28 21:52:36', '2022-10-11 14:22:22');
INSERT INTO `programmi` VALUES (137, 'av_istruzione_diretta_mod', 'Modificare Istruzione diretta', '1', 'GestionaleWeb', '2023-06-28 21:52:36', '2022-10-11 14:22:22');
INSERT INTO `programmi` VALUES (138, 'av_istruzione_indiretta', 'Visualizzare Istruzione indiretta', '1', 'GestionaleWeb', '2023-06-28 21:52:36', '2022-10-11 14:22:22');
INSERT INTO `programmi` VALUES (139, 'av_istruzione_indiretta_mod', 'Modificare Istruzione indiretta', '1', 'GestionaleWeb', '2023-06-28 21:52:36', '2022-10-11 14:22:22');
INSERT INTO `programmi` VALUES (140, 'av_immagine_acquisto', 'Visualizzare Immagine acquisto', '1', 'GestionaleWeb', '2023-06-28 21:52:36', '2022-10-11 14:22:22');
INSERT INTO `programmi` VALUES (141, 'av_immagine_acquisto_mod', 'Modificare Immagine acquisto', '1', 'GestionaleWeb', '2023-06-28 21:52:36', '2022-10-11 14:22:22');
INSERT INTO `programmi` VALUES (142, 'av_testo_acquisto', 'Visualizzare Testo acquisto', '1', 'GestionaleWeb', '2023-06-28 21:52:36', '2022-10-11 14:22:22');
INSERT INTO `programmi` VALUES (143, 'av_testo_acquisto_mod', 'Modificare Testo acquisto', '1', 'GestionaleWeb', '2023-06-28 21:52:36', '2022-10-11 14:22:22');
INSERT INTO `programmi` VALUES (144, 'av_privacy_cooperazione_salute', 'Visualizzare Privacy cooperazione salute', '1', 'GestionaleWeb', '2023-06-28 21:52:36', '2022-10-11 14:22:22');
INSERT INTO `programmi` VALUES (145, 'av_privacy_cooperazione_salute_mod', 'Modificare Privacy cooperazione salute', '1', 'GestionaleWeb', '2023-06-28 21:52:36', '2022-10-11 14:22:22');
INSERT INTO `programmi` VALUES (146, 'av_prodotti_documentazioni', 'Visualizzare documentazione del prodotto', '1', 'GestionaleWeb', '2023-06-28 21:52:36', '2022-10-11 14:22:22');
INSERT INTO `programmi` VALUES (147, 'av_prodotti_documentazioni_mod', 'Modificare il documento del prodotto', '1', 'GestionaleWeb', '2023-06-28 21:52:36', '2022-10-11 14:22:22');
INSERT INTO `programmi` VALUES (148, 'av_prodotti_documentazioni_remove', 'Rimuovere un documento del prodotto', '1', 'GestionaleWeb', '2023-06-28 21:52:36', '2022-10-11 14:22:22');
INSERT INTO `programmi` VALUES (150, 'av_amministrazione_quote_pagamenti', 'Visualizzare il menu Adesione quote pagamenti', '1', 'GestionaleWeb', '2023-06-28 21:52:36', '2022-10-31 07:28:07');
INSERT INTO `programmi` VALUES (151, 'av_amministrazione_genera_sepa_quote', 'Generare il file SEPA - SDD ', '1', 'GestionaleWeb', '2023-06-28 21:52:36', '2022-10-31 07:28:07');
INSERT INTO `programmi` VALUES (152, 'av_anagrafiche', 'Visualizzare il menu Anagrafiche', '1', 'GestionaleWeb', '2023-06-28 21:52:36', '2022-11-10 09:05:40');
INSERT INTO `programmi` VALUES (153, 'av_utenti_assistiti', 'Visualizzare il menu Utenti assistiti', '1', 'GestionaleWeb', '2023-06-28 21:52:36', '2022-11-16 11:21:32');
INSERT INTO `programmi` VALUES (154, 'av_utenti_assistiti_nuovo', 'Creare un utente assistito', '1', 'GestionaleWeb', '2023-06-28 21:52:36', '2022-11-16 11:21:32');
INSERT INTO `programmi` VALUES (155, 'av_utenti_assistiti_ricerca', 'Ricerca un utente assistito', '1', 'GestionaleWeb', '2023-06-28 21:52:36', '2022-11-16 11:21:32');
INSERT INTO `programmi` VALUES (156, 'av_utenti_assistiti_modificare', 'Modificare un utente assistito', '1', 'GestionaleWeb', '2023-06-28 21:52:36', '2022-11-16 11:21:32');
INSERT INTO `programmi` VALUES (157, 'av_utenti_assistiti_rimuovere', 'Rimuovere un utente assistito', '1', 'GestionaleWeb', '2023-06-28 21:52:36', '2022-11-16 11:21:32');
INSERT INTO `programmi` VALUES (158, 'av_utenti_assistiti_resetpws', 'Invia nuova password di utente assistito', '1', 'GestionaleWeb', '2023-06-28 21:52:36', '2022-11-16 11:21:32');
INSERT INTO `programmi` VALUES (159, 'av_amministrazione_quote_storico_pagamenti_sdd', 'Visualizzare storico pagamento SDD', '1', 'GestionaleWeb', '2023-06-28 21:52:36', '2022-12-19 10:35:57');
INSERT INTO `programmi` VALUES (160, 'av_anagrafica_upload_doc', 'Caricare i documenti su anagrafica', '1', 'GestionaleWeb', '2023-06-28 21:52:36', '2022-12-23 00:06:27');
INSERT INTO `programmi` VALUES (161, 'av_adesione_upload_doc', 'Caricare i documenti su adesione', '1', 'GestionaleWeb', '2023-06-28 21:52:36', '2022-12-23 00:06:28');
INSERT INTO `programmi` VALUES (162, 'av_utenti_addetti_resetpws', 'Define nuova password di utente addetto', '1', 'GestionaleWeb', '2023-06-28 21:52:36', '2022-12-23 00:06:28');
INSERT INTO `programmi` VALUES (163, 'av_tipologie_prestazioni', 'Visualizzare tipologie prestazioni', '1', 'GestionaleWeb', '2023-06-28 21:52:36', '2023-01-02 16:45:16');
INSERT INTO `programmi` VALUES (164, 'av_tipologie_prestazioni_nuovo', 'Creare una tipologia prestazione', '1', 'GestionaleWeb', '2023-06-28 21:52:36', '2023-01-02 16:45:16');
INSERT INTO `programmi` VALUES (165, 'av_tipologie_prestazioni_modificare', 'Modificare una tipologia prestazione', '1', 'GestionaleWeb', '2023-06-28 21:52:36', '2023-01-02 16:45:16');
INSERT INTO `programmi` VALUES (166, 'av_tipologie_prestazioni_rimuovere', 'Rimuovere una tipologia prestazione', '1', 'GestionaleWeb', '2023-06-28 21:52:36', '2023-01-02 16:45:17');
INSERT INTO `programmi` VALUES (167, 'av_tipologie_prestazioni_Collegare', 'Collegare una tipologia prestazione al prodotto', '1', 'GestionaleWeb', '2023-06-28 21:52:36', '2023-01-02 16:45:17');
INSERT INTO `programmi` VALUES (168, 'av_adesione_nuova_nonconvalidare_eta', 'Creare una adesione senza convalidare l\'età', '1', 'GestionaleWeb', '2023-06-28 21:52:36', '2023-01-04 19:21:22');
INSERT INTO `programmi` VALUES (169, 'av_vocistatistiche', 'Visualizzare il menu Voci statistiche', '1', 'GestionaleWeb', '2023-06-28 21:52:36', '2023-03-01 08:30:44');
INSERT INTO `programmi` VALUES (170, 'av_vocistatistiche_ricerca', 'Ricerca Voci statistiche', '1', 'GestionaleWeb', '2023-06-28 21:52:36', '2023-03-01 08:30:44');
INSERT INTO `programmi` VALUES (171, 'av_vocistatistiche_nuova', 'Creare una Voce statistica', '1', 'GestionaleWeb', '2023-06-28 21:52:36', '2023-03-01 08:30:44');
INSERT INTO `programmi` VALUES (172, 'av_vocistatistiche_prodotti_garanzie', 'Collega una Voce statistica', '1', 'GestionaleWeb', '2023-06-28 21:52:36', '2023-03-01 08:30:44');
INSERT INTO `programmi` VALUES (173, 'av_fornitori', 'Visualizzare il menu fornitori', '1', 'GestionaleWeb', '2023-06-28 21:52:36', '2023-03-31 02:41:08');
INSERT INTO `programmi` VALUES (174, 'av_fornitori_ricerca', 'Ricerca fornitori', '1', 'GestionaleWeb', '2023-06-28 21:52:36', '2023-03-31 02:41:08');
INSERT INTO `programmi` VALUES (175, 'av_fornitori_nuova', 'Creare un fornitore', '1', 'GestionaleWeb', '2023-06-28 21:52:36', '2023-03-31 02:41:08');
INSERT INTO `programmi` VALUES (176, 'av_fornitori_modificare', 'Modificare un fornitore', '1', 'GestionaleWeb', '2023-06-28 21:52:36', '2023-03-31 02:41:08');
INSERT INTO `programmi` VALUES (177, 'av_iscritti_testi', 'Visualizzare il menu Area iscritti - Testi', '1', 'GestionaleWeb', '2023-06-28 21:52:36', '2023-04-05 13:10:45');
INSERT INTO `programmi` VALUES (182, 'av_impostazioni_prodotto', 'Visualizzare il menu Impostazioni prodotto', '1', 'GestionaleWeb', '2023-06-28 21:52:36', '2023-04-11 14:33:44');
INSERT INTO `programmi` VALUES (183, 'av_amministrazione_estrazione_anagrafiche', 'Amministrazione Estrazione anagrafiche', '1', 'GestionaleWeb', '2023-06-28 21:52:36', '2023-05-10 10:05:57');
INSERT INTO `programmi` VALUES (184, 'av_amministrazione_estrazione_quote', 'Amministrazione Estrazione movimentazione quote', '1', 'GestionaleWeb', '2023-06-28 21:52:36', '2023-05-10 10:05:58');
INSERT INTO `programmi` VALUES (185, 'av_amministrazione_estrazione_distinte', 'Amministrazione Estrazione movimentazione distinte', '1', 'GestionaleWeb', '2023-06-28 21:52:36', '2023-05-10 10:05:58');
INSERT INTO `programmi` VALUES (186, 'av_aziende_collettive_ricerca', 'Visualizza elenco aziende collettive', '1', 'GestionaleWeb', '2023-06-28 21:52:36', '2023-06-05 09:14:21');
INSERT INTO `programmi` VALUES (187, 'av_aziende_collettive_nuova', 'Nuova aziende collettive', '1', 'GestionaleWeb', '2023-06-28 21:52:36', '2023-06-05 09:14:21');
INSERT INTO `programmi` VALUES (188, 'av_aziende_collettive_modificare', 'Modificare una aziende collettive', '1', 'GestionaleWeb', '2023-06-28 21:52:36', '2023-06-05 09:14:21');
INSERT INTO `programmi` VALUES (189, 'av_aziende_collettive_approvazione', 'Visualizza elenco aziende collettive per approvazione', '1', 'GestionaleWeb', '2023-06-28 21:52:36', '2023-06-05 09:14:21');
INSERT INTO `programmi` VALUES (190, 'av_amministrazione_riconciliazione_bonifico', 'Riconciliazione bancaria - bonifico', '1', 'GestionaleWeb', '2023-06-30 14:43:48', '2023-06-30 14:43:48');
COMMIT;

-- ----------------------------
-- Table structure for province
-- ----------------------------
DROP TABLE IF EXISTS `province`;
CREATE TABLE `province` (
  `proCodice` char(3) NOT NULL,
  `proDescrizione` varchar(40) NOT NULL,
  `proSigla` char(2) NOT NULL,
  `proCodiceRegione` char(2) NOT NULL,
  `DTID` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`proCodice`),
  KEY `province_regioni` (`proCodiceRegione`),
  CONSTRAINT `province_ibfk_1` FOREIGN KEY (`proCodiceRegione`) REFERENCES `regioni` (`regCodice`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ;

-- ----------------------------
-- Records of province
-- ----------------------------
BEGIN;
INSERT INTO `province` VALUES ('001', 'Torino', 'TO', '01', '2023-02-27 18:51:06');
INSERT INTO `province` VALUES ('002', 'Vercelli', 'VC', '01', '2023-02-27 18:51:06');
INSERT INTO `province` VALUES ('003', 'Novara', 'NO', '01', '2023-02-27 18:51:06');
INSERT INTO `province` VALUES ('004', 'Cuneo', 'CN', '01', '2023-02-27 18:51:06');
INSERT INTO `province` VALUES ('005', 'Asti', 'AT', '01', '2023-02-27 18:51:06');
INSERT INTO `province` VALUES ('006', 'Alessandria', 'AL', '01', '2023-02-27 18:51:06');
INSERT INTO `province` VALUES ('007', 'Valle d\'Aosta', 'AO', '02', '2023-02-27 18:51:06');
INSERT INTO `province` VALUES ('008', 'Imperia', 'IM', '07', '2023-02-27 18:51:06');
INSERT INTO `province` VALUES ('009', 'Savona', 'SV', '07', '2023-02-27 18:51:06');
INSERT INTO `province` VALUES ('010', 'Genova', 'GE', '07', '2023-02-27 18:51:06');
INSERT INTO `province` VALUES ('011', 'La Spezia', 'SP', '07', '2023-02-27 18:51:06');
INSERT INTO `province` VALUES ('012', 'Varese', 'VA', '03', '2023-02-27 18:51:06');
INSERT INTO `province` VALUES ('013', 'Como', 'CO', '03', '2023-02-27 18:51:06');
INSERT INTO `province` VALUES ('014', 'Sondrio', 'SO', '03', '2023-02-27 18:51:06');
INSERT INTO `province` VALUES ('015', 'Milano', 'MI', '03', '2023-02-27 18:51:06');
INSERT INTO `province` VALUES ('016', 'Bergamo', 'BG', '03', '2023-02-27 18:51:06');
INSERT INTO `province` VALUES ('017', 'Brescia', 'BS', '03', '2023-02-27 18:51:06');
INSERT INTO `province` VALUES ('018', 'Pavia', 'PV', '03', '2023-02-27 18:51:06');
INSERT INTO `province` VALUES ('019', 'Cremona', 'CR', '03', '2023-02-27 18:51:06');
INSERT INTO `province` VALUES ('020', 'Mantova', 'MN', '03', '2023-02-27 18:51:06');
INSERT INTO `province` VALUES ('021', 'Bolzano', 'BZ', '04', '2023-02-27 18:51:06');
INSERT INTO `province` VALUES ('022', 'Trento', 'TN', '04', '2023-02-27 18:51:06');
INSERT INTO `province` VALUES ('023', 'Verona', 'VR', '05', '2023-02-27 18:51:06');
INSERT INTO `province` VALUES ('024', 'Vicenza', 'VI', '05', '2023-02-27 18:51:06');
INSERT INTO `province` VALUES ('025', 'Belluno', 'BL', '05', '2023-02-27 18:51:06');
INSERT INTO `province` VALUES ('026', 'Treviso', 'TV', '05', '2023-02-27 18:51:06');
INSERT INTO `province` VALUES ('027', 'Venezia', 'VE', '05', '2023-02-27 18:51:06');
INSERT INTO `province` VALUES ('028', 'Padova', 'PD', '05', '2023-02-27 18:51:06');
INSERT INTO `province` VALUES ('029', 'Rovigo', 'RO', '05', '2023-02-27 18:51:06');
INSERT INTO `province` VALUES ('030', 'Udine', 'UD', '06', '2023-02-27 18:51:06');
INSERT INTO `province` VALUES ('031', 'Gorizia', 'GO', '06', '2023-02-27 18:51:06');
INSERT INTO `province` VALUES ('032', 'Trieste', 'TS', '06', '2023-02-27 18:51:06');
INSERT INTO `province` VALUES ('033', 'Piacenza', 'PC', '08', '2023-02-27 18:51:06');
INSERT INTO `province` VALUES ('034', 'Parma', 'PR', '08', '2023-02-27 18:51:06');
INSERT INTO `province` VALUES ('035', 'Reggio nell\'Emilia', 'RE', '08', '2023-02-27 18:51:06');
INSERT INTO `province` VALUES ('036', 'Modena', 'MO', '08', '2023-02-27 18:51:06');
INSERT INTO `province` VALUES ('037', 'Bologna', 'BO', '08', '2023-02-27 18:51:06');
INSERT INTO `province` VALUES ('038', 'Ferrara', 'FE', '08', '2023-02-27 18:51:06');
INSERT INTO `province` VALUES ('039', 'Ravenna', 'RA', '08', '2023-02-27 18:51:06');
INSERT INTO `province` VALUES ('040', 'Forlì-Cesena', 'FC', '08', '2023-02-27 18:51:06');
INSERT INTO `province` VALUES ('041', 'Pesaro e Urbino', 'PU', '11', '2023-02-27 18:51:06');
INSERT INTO `province` VALUES ('042', 'Ancona', 'AN', '11', '2023-02-27 18:51:06');
INSERT INTO `province` VALUES ('043', 'Macerata', 'MC', '11', '2023-02-27 18:51:06');
INSERT INTO `province` VALUES ('044', 'Ascoli Piceno', 'AP', '11', '2023-02-27 18:51:06');
INSERT INTO `province` VALUES ('045', 'Massa-Carrara', 'MS', '09', '2023-02-27 18:51:06');
INSERT INTO `province` VALUES ('046', 'Lucca', 'LU', '09', '2023-02-27 18:51:06');
INSERT INTO `province` VALUES ('047', 'Pistoia', 'PT', '09', '2023-02-27 18:51:06');
INSERT INTO `province` VALUES ('048', 'Firenze', 'FI', '09', '2023-02-27 18:51:06');
INSERT INTO `province` VALUES ('049', 'Livorno', 'LI', '09', '2023-02-27 18:51:06');
INSERT INTO `province` VALUES ('050', 'Pisa', 'PI', '09', '2023-02-27 18:51:06');
INSERT INTO `province` VALUES ('051', 'Arezzo', 'AR', '09', '2023-02-27 18:51:06');
INSERT INTO `province` VALUES ('052', 'Siena', 'SI', '09', '2023-02-27 18:51:06');
INSERT INTO `province` VALUES ('053', 'Grosseto', 'GR', '09', '2023-02-27 18:51:06');
INSERT INTO `province` VALUES ('054', 'Perugia', 'PG', '10', '2023-02-27 18:51:06');
INSERT INTO `province` VALUES ('055', 'Terni', 'TR', '10', '2023-02-27 18:51:06');
INSERT INTO `province` VALUES ('056', 'Viterbo', 'VT', '12', '2023-02-27 18:51:06');
INSERT INTO `province` VALUES ('057', 'Rieti', 'RI', '12', '2023-02-27 18:51:06');
INSERT INTO `province` VALUES ('058', 'Roma', 'RM', '12', '2023-02-27 18:51:06');
INSERT INTO `province` VALUES ('059', 'Latina', 'LT', '12', '2023-02-27 18:51:06');
INSERT INTO `province` VALUES ('060', 'Frosinone', 'FR', '12', '2023-02-27 18:51:06');
INSERT INTO `province` VALUES ('061', 'Caserta', 'CE', '15', '2023-02-27 18:51:06');
INSERT INTO `province` VALUES ('062', 'Benevento', 'BN', '15', '2023-02-27 18:51:06');
INSERT INTO `province` VALUES ('063', 'Napoli', 'NA', '15', '2023-02-27 18:51:06');
INSERT INTO `province` VALUES ('064', 'Avellino', 'AV', '15', '2023-02-27 18:51:06');
INSERT INTO `province` VALUES ('065', 'Salerno', 'SA', '15', '2023-02-27 18:51:06');
INSERT INTO `province` VALUES ('066', 'L\'Aquila', 'AQ', '13', '2023-02-27 18:51:06');
INSERT INTO `province` VALUES ('067', 'Teramo', 'TE', '13', '2023-02-27 18:51:06');
INSERT INTO `province` VALUES ('068', 'Pescara', 'PE', '13', '2023-02-27 18:51:06');
INSERT INTO `province` VALUES ('069', 'Chieti', 'CH', '13', '2023-02-27 18:51:06');
INSERT INTO `province` VALUES ('070', 'Campobasso', 'CB', '14', '2023-02-27 18:51:06');
INSERT INTO `province` VALUES ('071', 'Foggia', 'FG', '16', '2023-02-27 18:51:06');
INSERT INTO `province` VALUES ('072', 'Bari', 'BA', '16', '2023-02-27 18:51:06');
INSERT INTO `province` VALUES ('073', 'Taranto', 'TA', '16', '2023-02-27 18:51:06');
INSERT INTO `province` VALUES ('074', 'Brindisi', 'BR', '16', '2023-02-27 18:51:06');
INSERT INTO `province` VALUES ('075', 'Lecce', 'LE', '16', '2023-02-27 18:51:06');
INSERT INTO `province` VALUES ('076', 'Potenza', 'PZ', '17', '2023-02-27 18:51:06');
INSERT INTO `province` VALUES ('077', 'Matera', 'MT', '17', '2023-02-27 18:51:06');
INSERT INTO `province` VALUES ('078', 'Cosenza', 'CS', '18', '2023-02-27 18:51:06');
INSERT INTO `province` VALUES ('079', 'Catanzaro', 'CZ', '18', '2023-02-27 18:51:06');
INSERT INTO `province` VALUES ('080', 'Reggio di Calabria', 'RC', '18', '2023-02-27 18:51:06');
INSERT INTO `province` VALUES ('081', 'Trapani', 'TP', '19', '2023-02-27 18:51:06');
INSERT INTO `province` VALUES ('082', 'Palermo', 'PA', '19', '2023-02-27 18:51:06');
INSERT INTO `province` VALUES ('083', 'Messina', 'ME', '19', '2023-02-27 18:51:06');
INSERT INTO `province` VALUES ('084', 'Agrigento', 'AG', '19', '2023-02-27 18:51:06');
INSERT INTO `province` VALUES ('085', 'Caltanissetta', 'CL', '19', '2023-02-27 18:51:06');
INSERT INTO `province` VALUES ('086', 'Enna', 'EN', '19', '2023-02-27 18:51:06');
INSERT INTO `province` VALUES ('087', 'Catania', 'CT', '19', '2023-02-27 18:51:06');
INSERT INTO `province` VALUES ('088', 'Ragusa', 'RG', '19', '2023-02-27 18:51:06');
INSERT INTO `province` VALUES ('089', 'Siracusa', 'SR', '19', '2023-02-27 18:51:06');
INSERT INTO `province` VALUES ('090', 'Sassari', 'SS', '20', '2023-02-27 18:51:06');
INSERT INTO `province` VALUES ('091', 'Nuoro', 'NU', '20', '2023-02-27 18:51:06');
INSERT INTO `province` VALUES ('092', 'Cagliari', 'CA', '20', '2023-02-27 18:51:06');
INSERT INTO `province` VALUES ('093', 'Pordenone', 'PN', '06', '2023-02-27 18:51:06');
INSERT INTO `province` VALUES ('094', 'Isernia', 'IS', '14', '2023-02-27 18:51:06');
INSERT INTO `province` VALUES ('095', 'Oristano', 'OR', '20', '2023-02-27 18:51:06');
INSERT INTO `province` VALUES ('096', 'Biella', 'BI', '01', '2023-02-27 18:51:06');
INSERT INTO `province` VALUES ('097', 'Lecco', 'LC', '03', '2023-02-27 18:51:06');
INSERT INTO `province` VALUES ('098', 'Lodi', 'LO', '03', '2023-02-27 18:51:06');
INSERT INTO `province` VALUES ('099', 'Rimini', 'RN', '08', '2023-02-27 18:51:06');
INSERT INTO `province` VALUES ('100', 'Prato', 'PO', '09', '2023-02-27 18:51:06');
INSERT INTO `province` VALUES ('101', 'Crotone', 'KR', '18', '2023-02-27 18:51:06');
INSERT INTO `province` VALUES ('102', 'Vibo Valentia', 'VV', '18', '2023-02-27 18:51:06');
INSERT INTO `province` VALUES ('103', 'Verbano-Cusio-Ossola', 'VB', '01', '2023-02-27 18:51:06');
INSERT INTO `province` VALUES ('104', 'Olbia-Tempio', 'OT', '20', '2023-02-27 18:51:06');
INSERT INTO `province` VALUES ('105', 'Ogliastra', 'OG', '20', '2023-02-27 18:51:06');
INSERT INTO `province` VALUES ('106', 'Medio Campidano', 'VS', '20', '2023-02-27 18:51:06');
INSERT INTO `province` VALUES ('107', 'Carbonia-Iglesias', 'CI', '20', '2023-02-27 18:51:06');
INSERT INTO `province` VALUES ('108', 'Monza e della Brianza', 'MB', '03', '2023-02-27 18:51:06');
INSERT INTO `province` VALUES ('109', 'Fermo', 'FM', '11', '2023-02-27 18:51:06');
INSERT INTO `province` VALUES ('110', 'Barletta-Andria-Trani', 'BT', '16', '2023-02-27 18:51:06');
INSERT INTO `province` VALUES ('ZZZ', 'Stato estero', 'ZZ', 'ZZ', '2023-02-27 18:51:06');
COMMIT;

-- ----------------------------
-- Table structure for regioni
-- ----------------------------
DROP TABLE IF EXISTS `regioni`;
CREATE TABLE `regioni` (
  `regCodice` char(2) NOT NULL,
  `regDescrizione` varchar(40) NOT NULL,
  `DTID` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`regCodice`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ;

-- ----------------------------
-- Records of regioni
-- ----------------------------
BEGIN;
INSERT INTO `regioni` VALUES ('01', 'Piemonte', '2023-02-27 18:51:06');
INSERT INTO `regioni` VALUES ('02', 'Valle d\'Aosta', '2023-02-27 18:51:06');
INSERT INTO `regioni` VALUES ('03', 'Lombardia', '2023-02-27 18:51:06');
INSERT INTO `regioni` VALUES ('04', 'Trentino Alto Adige', '2023-02-27 18:51:06');
INSERT INTO `regioni` VALUES ('05', 'Veneto', '2023-02-27 18:51:06');
INSERT INTO `regioni` VALUES ('06', 'Friuli Venezia Giulia', '2023-02-27 18:51:06');
INSERT INTO `regioni` VALUES ('07', 'Liguria', '2023-02-27 18:51:06');
INSERT INTO `regioni` VALUES ('08', 'Emilia Romagna', '2023-02-27 18:51:06');
INSERT INTO `regioni` VALUES ('09', 'Toscana', '2023-02-27 18:51:06');
INSERT INTO `regioni` VALUES ('10', 'Umbria', '2023-02-27 18:51:06');
INSERT INTO `regioni` VALUES ('11', 'Marche', '2023-02-27 18:51:06');
INSERT INTO `regioni` VALUES ('12', 'Lazio', '2023-02-27 18:51:06');
INSERT INTO `regioni` VALUES ('13', 'Abruzzo', '2023-02-27 18:51:06');
INSERT INTO `regioni` VALUES ('14', 'Molise', '2023-02-27 18:51:06');
INSERT INTO `regioni` VALUES ('15', 'Campania', '2023-02-27 18:51:06');
INSERT INTO `regioni` VALUES ('16', 'Puglia', '2023-02-27 18:51:06');
INSERT INTO `regioni` VALUES ('17', 'Basilicata', '2023-02-27 18:51:06');
INSERT INTO `regioni` VALUES ('18', 'Calabria', '2023-02-27 18:51:06');
INSERT INTO `regioni` VALUES ('19', 'Sicilia', '2023-02-27 18:51:06');
INSERT INTO `regioni` VALUES ('20', 'Sardegna', '2023-02-27 18:51:06');
INSERT INTO `regioni` VALUES ('ZZ', 'Stato estero', '2023-02-27 18:51:06');
COMMIT;

-- ----------------------------
-- Table structure for relazione_parentela
-- ----------------------------
DROP TABLE IF EXISTS `relazione_parentela`;
CREATE TABLE `relazione_parentela` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `relazDescrizione` varchar(255) CHARACTER SET utf8mb4  DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 ;

-- ----------------------------
-- Records of relazione_parentela
-- ----------------------------
BEGIN;
INSERT INTO `relazione_parentela` VALUES (1, 'Coniuge', NULL, NULL);
INSERT INTO `relazione_parentela` VALUES (2, 'Convivente more uxorio', NULL, NULL);
INSERT INTO `relazione_parentela` VALUES (3, 'Persona unita civilmente', NULL, NULL);
INSERT INTO `relazione_parentela` VALUES (4, 'Figlio/a minorenne', NULL, NULL);
INSERT INTO `relazione_parentela` VALUES (5, 'Figlio/a maggiorenne fiscalmente a carico, fino a 26 anni di età', NULL, NULL);
INSERT INTO `relazione_parentela` VALUES (6, 'Figlio/a maggiorenne permanentemente inabile al lavoro, oltre i 26 anni di età', NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for sessions
-- ----------------------------
DROP TABLE IF EXISTS `sessions`;
CREATE TABLE `sessions` (
  `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `ip_address` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sessions_user_id_index` (`user_id`),
  KEY `sessions_last_activity_index` (`last_activity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of sessions
-- ----------------------------
BEGIN;
INSERT INTO `sessions` VALUES ('LO3lToeW31fjU61JRYGQQ39Y4pEs3P0xrei5X5Fj', 1, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36', 'YTo4OntzOjY6Il90b2tlbiI7czo0MDoiNnRVc1hYVUxabTZXRHVnbHlHaHFOOGRKcTZuNHpXSnBhSXJoaXNYRSI7czozOiJ1cmwiO2E6MDp7fXM6OToiX3ByZXZpb3VzIjthOjE6e3M6MzoidXJsIjtzOjI5OiJodHRwOi8vZmFiaW8ucHJvamVjdC9hZGVzaW9uZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6MTk6ImFkZGV0dGlBYmlsaXRhemlvbmkiO2E6NDp7aTowO3M6MTE6ImF2X3Byb2RvdHRpIjtpOjE7czoxOToiYXZfcHJvZG90dGlfcmljZXJjYSI7aToyO3M6MTE6ImF2X2FkZXNpb25lIjtpOjM7czoxOToiYXZfYWRlc2lvbmVfcmljZXJjYSI7fXM6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjE7czoxNzoicGFzc3dvcmRfaGFzaF93ZWIiO047czoyMToicGFzc3dvcmRfaGFzaF9zYW5jdHVtIjtOO30=', 1689347958);
COMMIT;

-- ----------------------------
-- Table structure for sessions_assistiti
-- ----------------------------
DROP TABLE IF EXISTS `sessions_assistiti`;
CREATE TABLE `sessions_assistiti` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text,
  `payload` text,
  `last_activity` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sessions_user_id_index` (`user_id`),
  KEY `sessions_last_activity_index` (`last_activity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ;

-- ----------------------------
-- Records of sessions_assistiti
-- ----------------------------
BEGIN;
INSERT INTO `sessions_assistiti` VALUES ('kOSbhMIWanrAdzV8mIf5k8dNc8RCNxRFSI7iCe19', 151, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36', 'YTo4OntzOjY6Il90b2tlbiI7czo0MDoiVTYzSXVTZVZDdmJzMlM1WjRQS2hXalNOb2tsNUhMb3J1TFZKZFpVdSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDI6Imh0dHA6Ly9mYWJpb2lzY3JpdHRpLnByb2plY3QvYXJlYXJpc2VydmF0YSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6MTM6InRlbXBfYWRlc2lvbmUiO2E6Mjp7czo1OiJ0b2tlbiI7czo0MDoiMmJQelhFeVFkSWxjeFo0Wm5ld0xBQU1HWExLUlNLb21TVHNwdXBycCI7czo1OiJ2YWxpZCI7YToxOntzOjM6ImV0YSI7YjoxO319czozOiJ1cmwiO2E6MDp7fXM6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjE1MTtzOjE3OiJwYXNzd29yZF9oYXNoX3dlYiI7czo2MDoiJDJ5JDEwJHlKUXJheWZLWk5rTnVsMlNCR2UuWXV4M0JZRy5INVBUQVh1TTJ5SUZmWDZ6V1N2eUVCMy9tIjtzOjIxOiJwYXNzd29yZF9oYXNoX3NhbmN0dW0iO3M6NjA6IiQyeSQxMCR5SlFyYXlmS1pOa051bDJTQkdlLll1eDNCWUcuSDVQVEFYdU0yeUlGZlg2eldTdnlFQjMvbSI7fQ==', 1689409274);
INSERT INTO `sessions_assistiti` VALUES ('NvblthbQ1NS0X3d1pRZgJLpnD1FAaF4jByIegP5b', NULL, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36', 'YTo1OntzOjY6Il90b2tlbiI7czo0MDoiaEg4VlJCU1lRWE5laGZpcEtJYXVKaGd2TTNVUmt1czNmdzdJdnFOayI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDg6Imh0dHA6Ly9mYWJpb2lzY3JpdHRpLnByb2plY3QvcGlhbm8tc2FuaXRhcmlvL2V0YSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6MTM6InRlbXBfYWRlc2lvbmUiO2E6NDp7czo1OiJ0b2tlbiI7czo0MDoiaEg4VlJCU1lRWE5laGZpcEtJYXVKaGd2TTNVUmt1czNmdzdJdnFOayI7czo1OiJ2YWxpZCI7YToxOntzOjM6ImV0YSI7YjoxO31zOjE4OiJjb2RpY2VfY29udmVuemlvbmUiO3M6OToiM2UwYjk5MjY3IjtzOjM6ImV0YSI7czoyOiI0OSI7fXM6MzoidXJsIjthOjE6e3M6ODoiaW50ZW5kZWQiO3M6NDI6Imh0dHA6Ly9mYWJpb2lzY3JpdHRpLnByb2plY3QvYXJlYXJpc2VydmF0YSI7fX0=', 1689340958);
INSERT INTO `sessions_assistiti` VALUES ('uTmvJOnKEed3CfDniIFb2xjijZaeKpKuUauX7vNw', NULL, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiWnRpck1QR04wdHlOdmxZcmVaNXlZSWZQamJiaGo3UzJscm9CcExJRCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDg6Imh0dHA6Ly9mYWJpb2lzY3JpdHRpLnByb2plY3QvcGlhbm8tc2FuaXRhcmlvL2V0YSI7fXM6MTM6InRlbXBfYWRlc2lvbmUiO2E6Mjp7czo1OiJ0b2tlbiI7czo0MDoiWnRpck1QR04wdHlOdmxZcmVaNXlZSWZQamJiaGo3UzJscm9CcExJRCI7czo1OiJ2YWxpZCI7YToxOntzOjM6ImV0YSI7YjoxO319fQ==', 1689348377);
COMMIT;

-- ----------------------------
-- Table structure for sessions_gestionale
-- ----------------------------
DROP TABLE IF EXISTS `sessions_gestionale`;
CREATE TABLE `sessions_gestionale` (
  `id` varchar(255) CHARACTER SET utf8mb4  NOT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `ip_address` varchar(45) CHARACTER SET utf8mb4  DEFAULT NULL,
  `user_agent` text CHARACTER SET utf8mb4 ,
  `payload` text CHARACTER SET utf8mb4  NOT NULL,
  `last_activity` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sessions_user_id_index` (`user_id`),
  KEY `sessions_last_activity_index` (`last_activity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ;

-- ----------------------------
-- Records of sessions_gestionale
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for tb_temp_prodotti
-- ----------------------------
DROP TABLE IF EXISTS `tb_temp_prodotti`;
CREATE TABLE `tb_temp_prodotti` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `prodConvenzioneId` bigint DEFAULT NULL,
  `prodIdFondo` int DEFAULT NULL,
  `prodNome` varchar(255) CHARACTER SET utf8mb4  DEFAULT NULL,
  `prodNomePubb` varchar(255) CHARACTER SET utf8mb4  DEFAULT NULL,
  `prodNote` varchar(255) CHARACTER SET utf8mb4  DEFAULT NULL,
  `prodDescrizione` text CHARACTER SET utf8mb4 ,
  `filenameProdotto` varchar(100) CHARACTER SET utf8mb4  DEFAULT NULL,
  `prodDataInizio` date DEFAULT NULL,
  `prodDataFine` date DEFAULT NULL,
  `prodCollegatoId` bigint DEFAULT NULL,
  `prodottoPropedId` bigint DEFAULT NULL,
  `prodVersioneGaranzie` double(8,2) DEFAULT NULL,
  `prodBloccatoCollegato` enum('1','0') CHARACTER SET utf8mb4  DEFAULT '0',
  `annoInteroDalMese` varchar(6) CHARACTER SET utf8mb4  DEFAULT NULL,
  `annoInteroPagaDalMese` varchar(6) CHARACTER SET utf8mb4  DEFAULT NULL,
  `prodImpostazioni` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 ;

-- ----------------------------
-- Records of tb_temp_prodotti
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for tb_temp_prodotti_garanzie
-- ----------------------------
DROP TABLE IF EXISTS `tb_temp_prodotti_garanzie`;
CREATE TABLE `tb_temp_prodotti_garanzie` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `gruppiMassimaleGaranzieId` bigint DEFAULT NULL,
  `gruppiSubMassimaleGaranzieId` bigint DEFAULT NULL,
  `gruppiMassimaleEventoId` bigint DEFAULT NULL,
  `prodottoId` bigint DEFAULT NULL,
  `tipologiaId` bigint DEFAULT NULL,
  `garanzAreaId` int DEFAULT NULL,
  `garanzPrestazione` varchar(255) CHARACTER SET utf8mb4  DEFAULT NULL,
  `garanzMassimale` double(10,2) DEFAULT NULL,
  `garanzCarenza` int DEFAULT NULL,
  `garanzScoperto` double(10,2) DEFAULT NULL,
  `garanzFranchigiaMinima` double(10,2) DEFAULT NULL,
  `garanzFranchigiaMassima` double(10,2) DEFAULT NULL,
  `garanzRimborsoMassimo` int DEFAULT NULL,
  `garanzImpMassRimbSingSinistro` double(10,2) DEFAULT NULL,
  `garanzDescrizione` varchar(2000) CHARACTER SET utf8mb4  DEFAULT NULL,
  `garanzGiorniRimborsoMassimo` int DEFAULT NULL,
  `garanzImpGiorniRimborso` double(10,2) DEFAULT NULL,
  `garanzCollegata` int DEFAULT NULL,
  `garanzSomaMassimale` enum('1','0') CHARACTER SET utf8mb4  DEFAULT NULL,
  `garanzPerEvento` enum('1','0') CHARACTER SET utf8mb4  DEFAULT '0',
  `garanzAttivoGiorniPrima` int DEFAULT NULL,
  `garanzScadutiGiorniDopo` int DEFAULT NULL,
  `garanzNumeroMaxEvtSingolaPrestazione` int DEFAULT NULL,
  `garanzNumeroAnniVerificaStorico` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 ;

-- ----------------------------
-- Records of tb_temp_prodotti_garanzie
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for tb_temp_prodotti_graranzie_correlata
-- ----------------------------
DROP TABLE IF EXISTS `tb_temp_prodotti_graranzie_correlata`;
CREATE TABLE `tb_temp_prodotti_graranzie_correlata` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `prodottoId` bigint DEFAULT NULL,
  `garanziaId` bigint DEFAULT NULL,
  `garanziaCorrelataId` bigint DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ;

-- ----------------------------
-- Records of tb_temp_prodotti_graranzie_correlata
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for tb_temp_prodotti_graranzie_tree
-- ----------------------------
DROP TABLE IF EXISTS `tb_temp_prodotti_graranzie_tree`;
CREATE TABLE `tb_temp_prodotti_graranzie_tree` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `prodottoId` bigint DEFAULT NULL,
  `oggettoId` bigint DEFAULT NULL,
  `tipoOggetto` int DEFAULT NULL COMMENT '1=Massimale, 2=Sub-massimale, 3=Garanzie, 4=massimale di evento, 5=Garanzia evento',
  `parenteId` bigint DEFAULT NULL,
  `tipoParente` int DEFAULT NULL COMMENT '1=Massimale, 2=Sub-massimale, 3=Garanzie, 4=massimale di evento, 5=Garanzia evento',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 ;

-- ----------------------------
-- Records of tb_temp_prodotti_graranzie_tree
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for tb_temp_prodotti_gruppi_massimale_graranzie
-- ----------------------------
DROP TABLE IF EXISTS `tb_temp_prodotti_gruppi_massimale_graranzie`;
CREATE TABLE `tb_temp_prodotti_gruppi_massimale_graranzie` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `prodottoId` bigint DEFAULT NULL,
  `gruMGNome` varchar(255) CHARACTER SET utf8mb4  DEFAULT NULL,
  `gruMGmassimale` double(10,2) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 ;

-- ----------------------------
-- Records of tb_temp_prodotti_gruppi_massimale_graranzie
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for tb_temp_prodotti_gruppi_sub_massimale_graranzie
-- ----------------------------
DROP TABLE IF EXISTS `tb_temp_prodotti_gruppi_sub_massimale_graranzie`;
CREATE TABLE `tb_temp_prodotti_gruppi_sub_massimale_graranzie` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `prodottoId` bigint DEFAULT NULL,
  `gruMGSNome` varchar(255) CHARACTER SET utf8mb4  DEFAULT NULL,
  `prodtGrupMassimaleId` bigint DEFAULT NULL,
  `gruMGSmassimale` double(10,2) DEFAULT NULL,
  `gruMGSmassimaleMisto` double(10,2) DEFAULT NULL,
  `gruMGSNumeroMaxPestazioni` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ;

-- ----------------------------
-- Records of tb_temp_prodotti_gruppi_sub_massimale_graranzie
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for tb_temp_prodotti_massimale_graranzie_evento
-- ----------------------------
DROP TABLE IF EXISTS `tb_temp_prodotti_massimale_graranzie_evento`;
CREATE TABLE `tb_temp_prodotti_massimale_graranzie_evento` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `prodottoId` bigint DEFAULT NULL,
  `gruEventoMNome` varchar(255) CHARACTER SET utf8mb4  DEFAULT NULL,
  `gruEventoMassimale` double(10,2) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ;

-- ----------------------------
-- Records of tb_temp_prodotti_massimale_graranzie_evento
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for tb_temp_prodotti_prezzi
-- ----------------------------
DROP TABLE IF EXISTS `tb_temp_prodotti_prezzi`;
CREATE TABLE `tb_temp_prodotti_prezzi` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `prodottoId` bigint DEFAULT NULL,
  `dataDecorrenza` date DEFAULT NULL,
  `prezzoSingolo` double(10,2) DEFAULT NULL,
  `prezzoGruppo` double(10,2) DEFAULT NULL,
  `prezzoFamiliariSingolo` double(10,2) DEFAULT NULL,
  `prezzoFamiliariGruppo` double(10,2) DEFAULT NULL,
  `prezzoAziendaGruppo` double(10,2) DEFAULT NULL,
  `prezzoAziendaFamiliariGruppo` double(10,2) DEFAULT NULL,
  `fasciaDiEtaFinoAl` char(3) CHARACTER SET utf8mb4  DEFAULT NULL,
  `fasciaCommissione` float(8,2) DEFAULT NULL,
  `fasciaCommissioneAgenzia` float(8,2) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tb_temp_prodotti_prezzi_datadecorrenza_fasciadietafinoal_index` (`dataDecorrenza`,`fasciaDiEtaFinoAl`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 ;

-- ----------------------------
-- Records of tb_temp_prodotti_prezzi
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for tipologie_abbonamento
-- ----------------------------
DROP TABLE IF EXISTS `tipologie_abbonamento`;
CREATE TABLE `tipologie_abbonamento` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `abbonamento` varchar(255) CHARACTER SET utf8mb4  DEFAULT NULL,
  `rate` int NOT NULL,
  `attivo` enum('1','0') CHARACTER SET utf8mb4  NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 ;

-- ----------------------------
-- Records of tipologie_abbonamento
-- ----------------------------
BEGIN;
INSERT INTO `tipologie_abbonamento` VALUES (1, 'Mensile', 12, '1', NULL, NULL);
INSERT INTO `tipologie_abbonamento` VALUES (2, 'Trimestrale', 4, '1', NULL, NULL);
INSERT INTO `tipologie_abbonamento` VALUES (3, 'Semestrale', 2, '1', NULL, NULL);
INSERT INTO `tipologie_abbonamento` VALUES (4, 'Annuale', 1, '1', NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for tipologie_liquidazione
-- ----------------------------
DROP TABLE IF EXISTS `tipologie_liquidazione`;
CREATE TABLE `tipologie_liquidazione` (
  `tilID` int unsigned NOT NULL AUTO_INCREMENT,
  `tilIDFondo` int unsigned NOT NULL,
  `tilDescrizione` varchar(20) NOT NULL,
  `tilGestione` char(3) NOT NULL,
  `DTID` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `tilPercentuale1` int unsigned NOT NULL DEFAULT '0',
  `tilPercentuale2` int unsigned NOT NULL DEFAULT '0',
  `tilSigla` char(3) NOT NULL,
  `tilMassimaleAccontoAnno` decimal(10,2) DEFAULT NULL,
  `tilRichiediPercentualeSaldo` bit(1) NOT NULL DEFAULT b'0',
  `tilRichiediImportoSaldo` bit(1) NOT NULL DEFAULT b'0',
  `tilModalitaRimborso` varchar(10) NOT NULL DEFAULT 'Indiretta',
  `tilEMailEnteTerzo` varchar(60) DEFAULT NULL,
  `tilModelloComunicazione` varchar(120) DEFAULT NULL,
  `tilDescrizioneAR` varchar(50) DEFAULT NULL,
  `tilInvioAR` bit(1) DEFAULT b'1',
  `tilRichiestaDocumentazione` bit(1) NOT NULL DEFAULT b'0',
  `tilGestioneNetworkCS` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`tilID`),
  KEY `tipologie_liquidazione_fondi` (`tilIDFondo`)
) ENGINE=InnoDB AUTO_INCREMENT=189 DEFAULT CHARSET=utf8mb4 ;

-- ----------------------------
-- Records of tipologie_liquidazione
-- ----------------------------
BEGIN;
INSERT INTO `tipologie_liquidazione` VALUES (171, 122, 'DIRETTA', '1', '2023-06-28 21:52:36', 0, 0, 'DTT', NULL, b'0', b'0', 'Diretta', NULL, NULL, NULL, b'1', b'0', b'0');
INSERT INTO `tipologie_liquidazione` VALUES (172, 122, 'INDIRETTA', '1', '2023-06-28 21:52:36', 0, 0, 'IDT', NULL, b'0', b'0', 'Indiretta', NULL, NULL, NULL, b'1', b'0', b'0');
INSERT INTO `tipologie_liquidazione` VALUES (173, 122, 'INDENNITARIA', '1', '2023-07-04 09:20:40', 0, 0, 'IDD', NULL, b'0', b'0', 'Idennitar', NULL, NULL, NULL, b'1', b'0', b'0');
COMMIT;

-- ----------------------------
-- Table structure for utenti_assistiti
-- ----------------------------
DROP TABLE IF EXISTS `utenti_assistiti`;
CREATE TABLE `utenti_assistiti` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `cognome` varchar(255) CHARACTER SET utf8mb4  NOT NULL,
  `nome` varchar(255) CHARACTER SET utf8mb4  NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4  NOT NULL,
  `cellulare` varchar(20) CHARACTER SET utf8mb4  DEFAULT NULL,
  `codiceFiscale` char(16) CHARACTER SET utf8mb4  NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `otp_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4  NOT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4  DEFAULT NULL,
  `profile_photo_path` varchar(2048) CHARACTER SET utf8mb4  DEFAULT NULL,
  `modoDomanda` varchar(20) CHARACTER SET utf8mb4  DEFAULT NULL,
  `ip_iscrizione` varchar(20) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `utenti_assistiti_email_unique` (`email`),
  UNIQUE KEY `utenti_assistiti_codicefiscale_unique` (`codiceFiscale`)
) ENGINE=InnoDB AUTO_INCREMENT=155 DEFAULT CHARSET=utf8mb4 ;

-- ----------------------------
-- Records of utenti_assistiti
-- ----------------------------
BEGIN;
INSERT INTO `utenti_assistiti` VALUES (151, 'TESTE', 'TSA', 'tsa1@lincemix.com', '+39.1111222333', 'TSTTSA85E01L378Y', '2023-07-14 16:55:12', '2023-07-14 16:55:16', '$2y$10$yJQrayfKZNkNul2SBGe.Yux3BYG.H5PTAXuM2yIFfX6zWSvyEB3/m', NULL, NULL, NULL, '127.0.0.1', '2023-07-14 15:47:00', '2023-07-14 16:46:56', NULL);
INSERT INTO `utenti_assistiti` VALUES (152, 'TESTE', 'TSA2', 'tsa2@lincemix.com', '+39.1111222333', 'TSTTSA80L01L378O', NULL, NULL, '$2y$10$MvVB74bEBynnkKOK80cNIeNydiKOjH1NxMKGGnrGTZwBO3eoxj/LO', NULL, NULL, NULL, '127.0.0.1', '2023-07-14 17:01:41', '2023-07-14 17:04:29', NULL);
INSERT INTO `utenti_assistiti` VALUES (153, 'TESTE', 'TSA3', 'tsa3@lincemix.com', '+39.1111222333', 'TSTTSA80M01L378C', NULL, NULL, '$2y$10$m24ljytzQ366H48LWOjmQ.S5ei1HHXGu7IeA5uBkmbv5HkoK7BOJ2', NULL, NULL, NULL, '127.0.0.1', '2023-07-14 17:12:49', '2023-07-14 17:16:17', NULL);
INSERT INTO `utenti_assistiti` VALUES (154, 'TESTE', 'TSA5', 'TSA5@LINCEMIX.COM', '+39.1111222333', 'TSTTSA90A41L378R', NULL, NULL, '$2y$10$nhqOrJ7Gv7DR74UnzOb2YuKXvRAWI31YgFCur6SYmFHFIhA3TXlty', NULL, NULL, NULL, '127.0.0.1', '2023-07-14 17:22:34', '2023-07-14 17:25:39', NULL);
COMMIT;

-- ----------------------------
-- Table structure for utenti_assistiti_password_resets
-- ----------------------------
DROP TABLE IF EXISTS `utenti_assistiti_password_resets`;
CREATE TABLE `utenti_assistiti_password_resets` (
  `email` varchar(255) CHARACTER SET utf8mb4  NOT NULL,
  `token` varchar(255) CHARACTER SET utf8mb4  NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  KEY `utenti_assistiti_password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ;

-- ----------------------------
-- Records of utenti_assistiti_password_resets
-- ----------------------------
BEGIN;
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;

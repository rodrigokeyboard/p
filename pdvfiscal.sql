/*
 Navicat Premium Data Transfer

 Source Server         : WAMP
 Source Server Type    : MySQL
 Source Server Version : 50736
 Source Host           : localhost:3306
 Source Schema         : pdvfiscal

 Target Server Type    : MySQL
 Target Server Version : 50736
 File Encoding         : 65001

 Date: 13/03/2022 16:15:48
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for sma_adjustments
-- ----------------------------
DROP TABLE IF EXISTS `sma_adjustments`;
CREATE TABLE `sma_adjustments`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
  `product_id` int(11) NOT NULL,
  `option_id` int(11) NULL DEFAULT NULL,
  `quantity` decimal(15, 4) NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  `note` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `created_by` int(11) NULL DEFAULT NULL,
  `updated_by` int(11) NULL DEFAULT NULL,
  `type` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sma_calendar
-- ----------------------------
DROP TABLE IF EXISTS `sma_calendar`;
CREATE TABLE `sma_calendar`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(55) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `start` datetime(0) NOT NULL,
  `end` datetime(0) NULL DEFAULT NULL,
  `color` varchar(7) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sma_captcha
-- ----------------------------
DROP TABLE IF EXISTS `sma_captcha`;
CREATE TABLE `sma_captcha`  (
  `captcha_id` bigint(13) UNSIGNED NOT NULL AUTO_INCREMENT,
  `captcha_time` int(10) UNSIGNED NOT NULL,
  `ip_address` varchar(16) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '0',
  `word` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`captcha_id`) USING BTREE,
  INDEX `word`(`word`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sma_categories
-- ----------------------------
DROP TABLE IF EXISTS `sma_categories`;
CREATE TABLE `sma_categories`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(55) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name` varchar(55) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `image` varchar(55) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `id`(`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sma_categories
-- ----------------------------
INSERT INTO `sma_categories` VALUES (1, '01', 'Alimentaçao', NULL);
INSERT INTO `sma_categories` VALUES (2, '02', 'Bebidas', NULL);
INSERT INTO `sma_categories` VALUES (3, '03', 'Lanches', NULL);
INSERT INTO `sma_categories` VALUES (4, '04', 'Material de Construçao', NULL);

-- ----------------------------
-- Table structure for sma_combo_items
-- ----------------------------
DROP TABLE IF EXISTS `sma_combo_items`;
CREATE TABLE `sma_combo_items`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `item_code` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `quantity` decimal(12, 4) NOT NULL,
  `unit_price` decimal(25, 4) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sma_companies
-- ----------------------------
DROP TABLE IF EXISTS `sma_companies`;
CREATE TABLE `sma_companies`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(10) UNSIGNED NULL DEFAULT NULL,
  `group_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `customer_group_id` int(11) NULL DEFAULT NULL,
  `customer_group_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `name` varchar(55) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `company` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `vat_no` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `city` varchar(55) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `state` varchar(55) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `postal_code` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `country` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `phone` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `email` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `cf1` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `cf2` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `cf3` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `cf4` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `cf5` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `cf6` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `invoice_footer` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `payment_term` int(11) NULL DEFAULT 0,
  `logo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'logo.png',
  `award_points` int(11) NULL DEFAULT 0,
  `deposit_amount` decimal(25, 4) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `group_id`(`group_id`) USING BTREE,
  INDEX `group_id_2`(`group_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sma_companies
-- ----------------------------
INSERT INTO `sma_companies` VALUES (1, 3, 'customer', 1, 'Geral', 'Cliente Teste', 'Jr Next', '092.738.336-59', 'Rua Jose Nenem', 'Ipiranga do Piaui', 'Piaui', '64540000', 'Brasil', '0123456789', 'cliente@hotmail.com', 'MG16252123', '120', 'Casa', 'F', 'Centro', '', NULL, 0, 'logo.png', 0, NULL);
INSERT INTO `sma_companies` VALUES (2, 4, 'supplier', NULL, NULL, 'GF', 'fornecedor Teste LTDA', '', 'Endereço', 'Cidade', 'Pi', '37410-00', 'Brasil', '0123456789', 'fornecedor@gmail.com', '-', '-', '-', '-', '-', '-', NULL, 0, 'logo.png', 0, NULL);
INSERT INTO `sma_companies` VALUES (4, NULL, 'biller', NULL, NULL, 'Vendedor 01', 'Jr Next', '', 'Rua Jose Nenem', 'Ipiranga do Piaui', 'Piaui', '64540000', 'Brasil', '899999999', 'admin@admin.com', '', '', '', '', '', '', '', 0, 'gopos.png', 0, NULL);
INSERT INTO `sma_companies` VALUES (5, 4, 'supplier', NULL, NULL, 'fornecedor teste', 'Jr Next', '', 'Rua Jose Nenem', 'Ipiranga do Piaui', 'Piaui', '64540000', 'Brasil', '48465465', 'fornecedor@admin.com', '', '', '', '', '', 'admin@admin.com', NULL, 0, 'logo.png', 0, NULL);

-- ----------------------------
-- Table structure for sma_costing
-- ----------------------------
DROP TABLE IF EXISTS `sma_costing`;
CREATE TABLE `sma_costing`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `product_id` int(11) NULL DEFAULT NULL,
  `sale_item_id` int(11) NOT NULL,
  `sale_id` int(11) NULL DEFAULT NULL,
  `purchase_item_id` int(11) NULL DEFAULT NULL,
  `quantity` decimal(15, 4) NOT NULL,
  `purchase_net_unit_cost` decimal(25, 4) NULL DEFAULT NULL,
  `purchase_unit_cost` decimal(25, 4) NULL DEFAULT NULL,
  `sale_net_unit_price` decimal(25, 4) NOT NULL,
  `sale_unit_price` decimal(25, 4) NOT NULL,
  `quantity_balance` decimal(15, 4) NULL DEFAULT NULL,
  `inventory` tinyint(1) NULL DEFAULT 0,
  `overselling` tinyint(1) NULL DEFAULT 0,
  `option_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 25 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sma_costing
-- ----------------------------
INSERT INTO `sma_costing` VALUES (14, '2016-07-28', 1, 14, 8, 1, 1.0000, 11.5000, 11.5000, 16.9500, 16.9500, 9.0000, 1, 0, NULL);
INSERT INTO `sma_costing` VALUES (15, '2016-07-28', 1, 15, 8, 1, 5.0000, 11.5000, 11.5000, 16.9500, 16.9500, 5.0000, 1, 0, NULL);
INSERT INTO `sma_costing` VALUES (16, '2016-07-28', 1, 16, 8, 1, 1.0000, 11.5000, 11.5000, 16.9500, 16.9500, 9.0000, 1, 0, NULL);
INSERT INTO `sma_costing` VALUES (17, '2016-07-28', 1, 17, 8, 1, 1.0000, 11.5000, 11.5000, 16.9500, 16.9500, 9.0000, 1, 0, NULL);
INSERT INTO `sma_costing` VALUES (18, '2016-07-28', 1, 18, 8, 1, 1.0000, 11.5000, 11.5000, 16.9500, 16.9500, 9.0000, 1, 0, NULL);
INSERT INTO `sma_costing` VALUES (19, '2016-07-28', 1, 19, 9, 4, 1.0000, 11.5000, 11.5000, 16.9500, 16.9500, 999.0000, 1, 0, NULL);
INSERT INTO `sma_costing` VALUES (20, '2016-07-28', 1, 20, 9, 4, 1.0000, 11.5000, 11.5000, 16.9500, 16.9500, 999.0000, 1, 0, NULL);
INSERT INTO `sma_costing` VALUES (21, '2016-07-28', 1, 21, 9, 4, 1.0000, 11.5000, 11.5000, 16.9500, 16.9500, 999.0000, 1, 0, NULL);
INSERT INTO `sma_costing` VALUES (22, '2016-07-28', 1, 22, 9, 4, 1.0000, 11.5000, 11.5000, 16.9500, 16.9500, 999.0000, 1, 0, NULL);
INSERT INTO `sma_costing` VALUES (23, '2016-07-30', 1, 23, 10, 4, 1.0000, 11.5000, 11.5000, 16.9500, 16.9500, 995.0000, 1, 0, NULL);
INSERT INTO `sma_costing` VALUES (24, '2016-07-30', 1, 24, 10, 4, 1.0000, 11.5000, 11.5000, 16.9500, 16.9500, 995.0000, 1, 0, NULL);

-- ----------------------------
-- Table structure for sma_currencies
-- ----------------------------
DROP TABLE IF EXISTS `sma_currencies`;
CREATE TABLE `sma_currencies`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name` varchar(55) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `rate` decimal(12, 4) NOT NULL,
  `auto_update` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sma_currencies
-- ----------------------------
INSERT INTO `sma_currencies` VALUES (1, 'BRL', 'Real', 1.0000, 0);

-- ----------------------------
-- Table structure for sma_customer_groups
-- ----------------------------
DROP TABLE IF EXISTS `sma_customer_groups`;
CREATE TABLE `sma_customer_groups`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `percent` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sma_customer_groups
-- ----------------------------
INSERT INTO `sma_customer_groups` VALUES (1, 'Geral', 0);
INSERT INTO `sma_customer_groups` VALUES (2, 'Revenda', -5);
INSERT INTO `sma_customer_groups` VALUES (3, 'Distribuidor', -15);
INSERT INTO `sma_customer_groups` VALUES (4, 'Cliente (+10)', 10);

-- ----------------------------
-- Table structure for sma_date_format
-- ----------------------------
DROP TABLE IF EXISTS `sma_date_format`;
CREATE TABLE `sma_date_format`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `js` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `php` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `sql` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sma_date_format
-- ----------------------------
INSERT INTO `sma_date_format` VALUES (1, 'mm-dd-yyyy', 'm-d-Y', '%m-%d-%Y');
INSERT INTO `sma_date_format` VALUES (2, 'mm/dd/yyyy', 'm/d/Y', '%m/%d/%Y');
INSERT INTO `sma_date_format` VALUES (3, 'mm.dd.yyyy', 'm.d.Y', '%m.%d.%Y');
INSERT INTO `sma_date_format` VALUES (4, 'dd-mm-yyyy', 'd-m-Y', '%d-%m-%Y');
INSERT INTO `sma_date_format` VALUES (5, 'dd/mm/yyyy', 'd/m/Y', '%d/%m/%Y');
INSERT INTO `sma_date_format` VALUES (6, 'dd.mm.yyyy', 'd.m.Y', '%d.%m.%Y');

-- ----------------------------
-- Table structure for sma_deliveries
-- ----------------------------
DROP TABLE IF EXISTS `sma_deliveries`;
CREATE TABLE `sma_deliveries`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
  `sale_id` int(11) NOT NULL,
  `do_reference_no` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `sale_reference_no` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `customer` varchar(55) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `address` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `note` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `created_by` int(11) NULL DEFAULT NULL,
  `updated_by` int(11) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sma_deposits
-- ----------------------------
DROP TABLE IF EXISTS `sma_deposits`;
CREATE TABLE `sma_deposits`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
  `company_id` int(11) NOT NULL,
  `amount` decimal(25, 4) NOT NULL,
  `paid_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `note` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) NOT NULL,
  `updated_at` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sma_expense_categories
-- ----------------------------
DROP TABLE IF EXISTS `sma_expense_categories`;
CREATE TABLE `sma_expense_categories`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(55) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name` varchar(55) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `id`(`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sma_expenses
-- ----------------------------
DROP TABLE IF EXISTS `sma_expenses`;
CREATE TABLE `sma_expenses`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
  `reference` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `amount` decimal(25, 4) NOT NULL,
  `note` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `created_by` varchar(55) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `attachment` varchar(55) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `category_id` int(11) NULL DEFAULT NULL,
  `warehouse_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sma_gift_cards
-- ----------------------------
DROP TABLE IF EXISTS `sma_gift_cards`;
CREATE TABLE `sma_gift_cards`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
  `card_no` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `value` decimal(25, 4) NOT NULL,
  `customer_id` int(11) NULL DEFAULT NULL,
  `customer` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `balance` decimal(25, 4) NOT NULL,
  `expiry` date NULL DEFAULT NULL,
  `created_by` varchar(55) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `card_no`(`card_no`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sma_groups
-- ----------------------------
DROP TABLE IF EXISTS `sma_groups`;
CREATE TABLE `sma_groups`  (
  `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `description` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sma_groups
-- ----------------------------
INSERT INTO `sma_groups` VALUES (1, 'owner', 'Proprietário');
INSERT INTO `sma_groups` VALUES (2, 'admin', 'Administração');
INSERT INTO `sma_groups` VALUES (3, 'customer', 'Clientes');
INSERT INTO `sma_groups` VALUES (4, 'supplier', 'Fornecedores');
INSERT INTO `sma_groups` VALUES (5, 'vendas', 'Equipe de Vendas');

-- ----------------------------
-- Table structure for sma_login_attempts
-- ----------------------------
DROP TABLE IF EXISTS `sma_login_attempts`;
CREATE TABLE `sma_login_attempts`  (
  `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT,
  `ip_address` varbinary(16) NOT NULL,
  `login` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `time` int(11) UNSIGNED NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sma_login_attempts
-- ----------------------------
INSERT INTO `sma_login_attempts` VALUES (5, 0x3A3A31, 'adm@adm.com', 1647191419);
INSERT INTO `sma_login_attempts` VALUES (6, 0x3A3A31, 'next@next.com', 1647191560);
INSERT INTO `sma_login_attempts` VALUES (7, 0x3A3A31, 'adm@adm.com', 1647191567);

-- ----------------------------
-- Table structure for sma_migrations
-- ----------------------------
DROP TABLE IF EXISTS `sma_migrations`;
CREATE TABLE `sma_migrations`  (
  `version` bigint(20) NOT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sma_migrations
-- ----------------------------
INSERT INTO `sma_migrations` VALUES (315);

-- ----------------------------
-- Table structure for sma_notifications
-- ----------------------------
DROP TABLE IF EXISTS `sma_notifications`;
CREATE TABLE `sma_notifications`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `comment` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `date` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
  `from_date` datetime(0) NULL DEFAULT NULL,
  `till_date` datetime(0) NULL DEFAULT NULL,
  `scope` tinyint(1) NOT NULL DEFAULT 3,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sma_order_ref
-- ----------------------------
DROP TABLE IF EXISTS `sma_order_ref`;
CREATE TABLE `sma_order_ref`  (
  `ref_id` int(11) NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `so` int(11) NOT NULL DEFAULT 1,
  `qu` int(11) NOT NULL DEFAULT 1,
  `po` int(11) NOT NULL DEFAULT 1,
  `to` int(11) NOT NULL DEFAULT 1,
  `pos` int(11) NOT NULL DEFAULT 1,
  `do` int(11) NOT NULL DEFAULT 1,
  `pay` int(11) NOT NULL DEFAULT 1,
  `re` int(11) NOT NULL DEFAULT 1,
  `rep` int(11) NOT NULL DEFAULT 1,
  `ex` int(11) NOT NULL DEFAULT 1,
  PRIMARY KEY (`ref_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sma_order_ref
-- ----------------------------
INSERT INTO `sma_order_ref` VALUES (1, '2016-07-01', 1, 1, 1, 1, 4, 1, 4, 1, 1, 1);

-- ----------------------------
-- Table structure for sma_payments
-- ----------------------------
DROP TABLE IF EXISTS `sma_payments`;
CREATE TABLE `sma_payments`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0),
  `sale_id` int(11) NULL DEFAULT NULL,
  `return_id` int(11) NULL DEFAULT NULL,
  `purchase_id` int(11) NULL DEFAULT NULL,
  `reference_no` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `transaction_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `paid_by` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `cheque_no` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `cc_no` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `cc_holder` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `cc_month` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `cc_year` varchar(4) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `cc_type` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `amount` decimal(25, 4) NOT NULL,
  `currency` varchar(3) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `attachment` varchar(55) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `type` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `note` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `pos_paid` decimal(25, 4) NULL DEFAULT 0.0000,
  `pos_balance` decimal(25, 4) NULL DEFAULT 0.0000,
  `approval_code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sma_payments
-- ----------------------------
INSERT INTO `sma_payments` VALUES (7, '2016-07-28 18:48:09', 8, NULL, NULL, 'IPAY/2016/07/0001', NULL, 'cash', '', '', '', '', '', '', 152.5500, NULL, 2, NULL, 'received', '', 500.0000, 347.4500, NULL);
INSERT INTO `sma_payments` VALUES (8, '2016-07-28 20:02:00', NULL, NULL, 2, 'IPAY/2016/07/0002', NULL, 'cash', '', '', '', '', '', 'Visa', 11500.0000, NULL, 2, NULL, 'sent', '', 0.0000, 0.0000, NULL);
INSERT INTO `sma_payments` VALUES (9, '2016-07-30 15:09:54', 10, NULL, NULL, 'IPAY/2016/07/0003', NULL, 'cash', '', '', '', '', '', '', 33.9000, NULL, 2, NULL, 'received', '', 50.0000, 16.1000, NULL);

-- ----------------------------
-- Table structure for sma_paypal
-- ----------------------------
DROP TABLE IF EXISTS `sma_paypal`;
CREATE TABLE `sma_paypal`  (
  `id` int(11) NOT NULL,
  `active` tinyint(4) NOT NULL,
  `account_email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `paypal_currency` varchar(3) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'USD',
  `fixed_charges` decimal(25, 4) NOT NULL DEFAULT 2.0000,
  `extra_charges_my` decimal(25, 4) NOT NULL DEFAULT 3.9000,
  `extra_charges_other` decimal(25, 4) NOT NULL DEFAULT 4.4000,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sma_paypal
-- ----------------------------
INSERT INTO `sma_paypal` VALUES (1, 0, 'mypaypal@paypal.com', 'USD', 0.0000, 0.0000, 0.0000);

-- ----------------------------
-- Table structure for sma_permissions
-- ----------------------------
DROP TABLE IF EXISTS `sma_permissions`;
CREATE TABLE `sma_permissions`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `products-index` tinyint(1) NULL DEFAULT 0,
  `products-add` tinyint(1) NULL DEFAULT 0,
  `products-edit` tinyint(1) NULL DEFAULT 0,
  `products-delete` tinyint(1) NULL DEFAULT 0,
  `products-cost` tinyint(1) NULL DEFAULT 0,
  `products-price` tinyint(1) NULL DEFAULT 0,
  `quotes-index` tinyint(1) NULL DEFAULT 0,
  `quotes-add` tinyint(1) NULL DEFAULT 0,
  `quotes-edit` tinyint(1) NULL DEFAULT 0,
  `quotes-pdf` tinyint(1) NULL DEFAULT 0,
  `quotes-email` tinyint(1) NULL DEFAULT 0,
  `quotes-delete` tinyint(1) NULL DEFAULT 0,
  `sales-index` tinyint(1) NULL DEFAULT 0,
  `sales-add` tinyint(1) NULL DEFAULT 0,
  `sales-edit` tinyint(1) NULL DEFAULT 0,
  `sales-pdf` tinyint(1) NULL DEFAULT 0,
  `sales-email` tinyint(1) NULL DEFAULT 0,
  `sales-delete` tinyint(1) NULL DEFAULT 0,
  `purchases-index` tinyint(1) NULL DEFAULT 0,
  `purchases-add` tinyint(1) NULL DEFAULT 0,
  `purchases-edit` tinyint(1) NULL DEFAULT 0,
  `purchases-pdf` tinyint(1) NULL DEFAULT 0,
  `purchases-email` tinyint(1) NULL DEFAULT 0,
  `purchases-delete` tinyint(1) NULL DEFAULT 0,
  `transfers-index` tinyint(1) NULL DEFAULT 0,
  `transfers-add` tinyint(1) NULL DEFAULT 0,
  `transfers-edit` tinyint(1) NULL DEFAULT 0,
  `transfers-pdf` tinyint(1) NULL DEFAULT 0,
  `transfers-email` tinyint(1) NULL DEFAULT 0,
  `transfers-delete` tinyint(1) NULL DEFAULT 0,
  `customers-index` tinyint(1) NULL DEFAULT 0,
  `customers-add` tinyint(1) NULL DEFAULT 0,
  `customers-edit` tinyint(1) NULL DEFAULT 0,
  `customers-delete` tinyint(1) NULL DEFAULT 0,
  `suppliers-index` tinyint(1) NULL DEFAULT 0,
  `suppliers-add` tinyint(1) NULL DEFAULT 0,
  `suppliers-edit` tinyint(1) NULL DEFAULT 0,
  `suppliers-delete` tinyint(1) NULL DEFAULT 0,
  `sales-deliveries` tinyint(1) NULL DEFAULT 0,
  `sales-add_delivery` tinyint(1) NULL DEFAULT 0,
  `sales-edit_delivery` tinyint(1) NULL DEFAULT 0,
  `sales-delete_delivery` tinyint(1) NULL DEFAULT 0,
  `sales-email_delivery` tinyint(1) NULL DEFAULT 0,
  `sales-pdf_delivery` tinyint(1) NULL DEFAULT 0,
  `sales-gift_cards` tinyint(1) NULL DEFAULT 0,
  `sales-add_gift_card` tinyint(1) NULL DEFAULT 0,
  `sales-edit_gift_card` tinyint(1) NULL DEFAULT 0,
  `sales-delete_gift_card` tinyint(1) NULL DEFAULT 0,
  `pos-index` tinyint(1) NULL DEFAULT 0,
  `sales-return_sales` tinyint(1) NULL DEFAULT 0,
  `reports-index` tinyint(1) NULL DEFAULT 0,
  `reports-warehouse_stock` tinyint(1) NULL DEFAULT 0,
  `reports-quantity_alerts` tinyint(1) NULL DEFAULT 0,
  `reports-expiry_alerts` tinyint(1) NULL DEFAULT 0,
  `reports-products` tinyint(1) NULL DEFAULT 0,
  `reports-daily_sales` tinyint(1) NULL DEFAULT 0,
  `reports-monthly_sales` tinyint(1) NULL DEFAULT 0,
  `reports-sales` tinyint(1) NULL DEFAULT 0,
  `reports-payments` tinyint(1) NULL DEFAULT 0,
  `reports-purchases` tinyint(1) NULL DEFAULT 0,
  `reports-profit_loss` tinyint(1) NULL DEFAULT 0,
  `reports-customers` tinyint(1) NULL DEFAULT 0,
  `reports-suppliers` tinyint(1) NULL DEFAULT 0,
  `reports-staff` tinyint(1) NULL DEFAULT 0,
  `reports-register` tinyint(1) NULL DEFAULT 0,
  `sales-payments` tinyint(1) NULL DEFAULT 0,
  `purchases-payments` tinyint(1) NULL DEFAULT 0,
  `purchases-expenses` tinyint(1) NULL DEFAULT 0,
  `products-adjustments` tinyint(1) NOT NULL DEFAULT 0,
  `bulk_actions` tinyint(1) NOT NULL DEFAULT 0,
  `customers-deposits` tinyint(1) NOT NULL DEFAULT 0,
  `customers-delete_deposit` tinyint(1) NOT NULL DEFAULT 0,
  `products-barcode` tinyint(1) NOT NULL DEFAULT 0,
  `purchases-return_purchases` tinyint(1) NOT NULL DEFAULT 0,
  `reports-expenses` tinyint(1) NOT NULL DEFAULT 0,
  `reports-daily_purchases` tinyint(1) NULL DEFAULT 0,
  `reports-monthly_purchases` tinyint(1) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sma_permissions
-- ----------------------------
INSERT INTO `sma_permissions` VALUES (1, 5, 1, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 0, 1, 1, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 1, 1, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);

-- ----------------------------
-- Table structure for sma_pos_register
-- ----------------------------
DROP TABLE IF EXISTS `sma_pos_register`;
CREATE TABLE `sma_pos_register`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
  `user_id` int(11) NOT NULL,
  `cash_in_hand` decimal(25, 4) NOT NULL,
  `status` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `total_cash` decimal(25, 4) NULL DEFAULT NULL,
  `total_cheques` int(11) NULL DEFAULT NULL,
  `total_cc_slips` int(11) NULL DEFAULT NULL,
  `total_cash_submitted` decimal(25, 4) NULL DEFAULT NULL,
  `total_cheques_submitted` int(11) NULL DEFAULT NULL,
  `total_cc_slips_submitted` int(11) NULL DEFAULT NULL,
  `note` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `closed_at` timestamp(0) NULL DEFAULT NULL,
  `transfer_opened_bills` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `closed_by` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sma_pos_register
-- ----------------------------
INSERT INTO `sma_pos_register` VALUES (1, '2016-05-17 19:12:07', 1, 10.0000, 'close', 43.9000, 0, 0, 43.9000, 0, 0, '', '2016-05-19 04:50:47', NULL, 1);
INSERT INTO `sma_pos_register` VALUES (2, '2016-05-20 17:08:54', 1, 10.0000, 'open', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sma_pos_register` VALUES (3, '2016-07-28 18:13:58', 2, 20.0000, 'open', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for sma_pos_settings
-- ----------------------------
DROP TABLE IF EXISTS `sma_pos_settings`;
CREATE TABLE `sma_pos_settings`  (
  `pos_id` int(1) NOT NULL,
  `cat_limit` int(11) NOT NULL,
  `pro_limit` int(11) NOT NULL,
  `default_category` int(11) NOT NULL,
  `default_customer` int(11) NOT NULL,
  `default_biller` int(11) NOT NULL,
  `display_time` varchar(3) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'yes',
  `cf_title1` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `cf_title2` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `cf_value1` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `cf_value2` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `receipt_printer` varchar(55) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `cash_drawer_codes` varchar(55) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `focus_add_item` varchar(55) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `add_manual_product` varchar(55) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `customer_selection` varchar(55) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `add_customer` varchar(55) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `toggle_category_slider` varchar(55) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `toggle_subcategory_slider` varchar(55) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `cancel_sale` varchar(55) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `suspend_sale` varchar(55) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `print_items_list` varchar(55) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `finalize_sale` varchar(55) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `today_sale` varchar(55) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `open_hold_bills` varchar(55) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `close_register` varchar(55) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `keyboard` tinyint(1) NOT NULL,
  `pos_printers` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `java_applet` tinyint(1) NOT NULL,
  `product_button_color` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'default',
  `tooltips` tinyint(1) NULL DEFAULT 1,
  `paypal_pro` tinyint(1) NULL DEFAULT 0,
  `stripe` tinyint(1) NULL DEFAULT 0,
  `rounding` tinyint(1) NULL DEFAULT 0,
  `char_per_line` tinyint(4) NULL DEFAULT 42,
  `pin_code` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `purchase_code` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'purchase_code',
  `envato_username` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'envato_username',
  `version` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '3.0.2.10',
  `after_sale_page` tinyint(1) NULL DEFAULT 0,
  `item_order` tinyint(1) NULL DEFAULT 0,
  `authorize` tinyint(1) NULL DEFAULT 0,
  PRIMARY KEY (`pos_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sma_pos_settings
-- ----------------------------
INSERT INTO `sma_pos_settings` VALUES (1, 22, 50, 1, 1, 4, '1', 'Insc. Est', 'Insc. Mun', '123456789', '987654321', 'BIXOLON SRP-350II', 'x1C', 'Ctrl+F3', 'Ctrl+Shift+M', 'Ctrl+Shift+C', 'Ctrl+Shift+A', 'Ctrl+F11', 'Ctrl+F12', 'F4', 'F7', 'F9', 'F8', 'Ctrl+F1', 'Ctrl+F2', 'Ctrl+F10', 0, 'BIXOLON SRP-350II, BIXOLON SRP-350II', 0, 'default', 1, 0, 0, 0, 42, '1111', 'purchase_code', 'envato_username', '3.0.2.10', 0, 0, 0);

-- ----------------------------
-- Table structure for sma_product_photos
-- ----------------------------
DROP TABLE IF EXISTS `sma_product_photos`;
CREATE TABLE `sma_product_photos`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `photo` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sma_product_variants
-- ----------------------------
DROP TABLE IF EXISTS `sma_product_variants`;
CREATE TABLE `sma_product_variants`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `name` varchar(55) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `cost` decimal(25, 4) NULL DEFAULT NULL,
  `price` decimal(25, 4) NULL DEFAULT NULL,
  `quantity` decimal(15, 4) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sma_products
-- ----------------------------
DROP TABLE IF EXISTS `sma_products`;
CREATE TABLE `sma_products`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name` char(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `unit` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `cost` decimal(25, 4) NULL DEFAULT NULL,
  `price` decimal(25, 4) NOT NULL,
  `alert_quantity` decimal(15, 4) NULL DEFAULT 20.0000,
  `image` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'no_image.png',
  `category_id` int(11) NOT NULL,
  `subcategory_id` int(11) NULL DEFAULT NULL,
  `cf1` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `cf2` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `cf3` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `cf4` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `cf5` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `cf6` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `quantity` decimal(15, 4) NULL DEFAULT 0.0000,
  `tax_rate` int(11) NULL DEFAULT NULL,
  `track_quantity` tinyint(1) NULL DEFAULT 1,
  `details` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `warehouse` int(11) NULL DEFAULT NULL,
  `barcode_symbology` varchar(55) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'code128',
  `file` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `product_details` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `tax_method` tinyint(1) NULL DEFAULT 0,
  `type` varchar(55) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'standard',
  `supplier1` int(11) NULL DEFAULT NULL,
  `supplier1price` decimal(25, 4) NULL DEFAULT NULL,
  `supplier2` int(11) NULL DEFAULT NULL,
  `supplier2price` decimal(25, 4) NULL DEFAULT NULL,
  `supplier3` int(11) NULL DEFAULT NULL,
  `supplier3price` decimal(25, 4) NULL DEFAULT NULL,
  `supplier4` int(11) NULL DEFAULT NULL,
  `supplier4price` decimal(25, 4) NULL DEFAULT NULL,
  `supplier5` int(11) NULL DEFAULT NULL,
  `supplier5price` decimal(25, 4) NULL DEFAULT NULL,
  `promotion` tinyint(1) NULL DEFAULT 0,
  `promo_price` decimal(25, 4) NULL DEFAULT NULL,
  `start_date` date NULL DEFAULT NULL,
  `end_date` date NULL DEFAULT NULL,
  `supplier1_part_no` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `supplier2_part_no` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `supplier3_part_no` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `supplier4_part_no` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `supplier5_part_no` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `code`(`code`) USING BTREE,
  INDEX `category_id`(`category_id`) USING BTREE,
  INDEX `id`(`id`) USING BTREE,
  INDEX `id_2`(`id`) USING BTREE,
  INDEX `category_id_2`(`category_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sma_products
-- ----------------------------
INSERT INTO `sma_products` VALUES (1, '07327550', 'Produto Teste', 'Und', 11.5000, 16.9500, 10.0000, 'b22377192a558149b8740a278490c0a5.jpg', 1, NULL, '', '1', '61119000', '', '', '', 1015.0000, 1, 1, '', NULL, 'ean8', NULL, '<p>Informações do Produro</p>', 0, 'standard', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0001-11-30', '0001-11-30', '', NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for sma_purchase_items
-- ----------------------------
DROP TABLE IF EXISTS `sma_purchase_items`;
CREATE TABLE `sma_purchase_items`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `purchase_id` int(11) NULL DEFAULT NULL,
  `transfer_id` int(11) NULL DEFAULT NULL,
  `product_id` int(11) NOT NULL,
  `product_code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `product_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `option_id` int(11) NULL DEFAULT NULL,
  `net_unit_cost` decimal(25, 4) NOT NULL,
  `quantity` decimal(15, 4) NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  `item_tax` decimal(25, 4) NULL DEFAULT NULL,
  `tax_rate_id` int(11) NULL DEFAULT NULL,
  `tax` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `discount` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `item_discount` decimal(25, 4) NULL DEFAULT NULL,
  `expiry` date NULL DEFAULT NULL,
  `subtotal` decimal(25, 4) NOT NULL,
  `quantity_balance` decimal(15, 4) NULL DEFAULT 0.0000,
  `date` date NOT NULL,
  `status` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `unit_cost` decimal(25, 4) NULL DEFAULT NULL,
  `real_unit_cost` decimal(25, 4) NULL DEFAULT NULL,
  `quantity_received` decimal(15, 4) NULL DEFAULT NULL,
  `supplier_part_no` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `purchase_item_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `purchase_id`(`purchase_id`) USING BTREE,
  INDEX `product_id`(`product_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sma_purchase_items
-- ----------------------------
INSERT INTO `sma_purchase_items` VALUES (1, NULL, NULL, 1, '07327550', 'Produto Teste', NULL, 11.5000, 10.0000, 1, 0.0000, 1, '0.0000', NULL, NULL, NULL, 115.0000, 1.0000, '2016-05-18', 'received', 11.5000, 11.5000, NULL, NULL, NULL);
INSERT INTO `sma_purchase_items` VALUES (2, NULL, NULL, 1, '07327550', 'Produto Teste', NULL, 11.5000, 20.0000, 2, 0.0000, 1, '0.0000', NULL, NULL, NULL, 230.0000, 20.0000, '2016-05-18', 'received', 11.5000, 11.5000, NULL, NULL, NULL);
INSERT INTO `sma_purchase_items` VALUES (4, 2, NULL, 1, '07327550', 'Produto Teste', NULL, 11.5000, 1000.0000, 1, 0.0000, 1, '0.0000', '0', 0.0000, NULL, 11500.0000, 994.0000, '2016-07-28', 'received', 11.5000, 11.5000, 1000.0000, NULL, NULL);

-- ----------------------------
-- Table structure for sma_purchases
-- ----------------------------
DROP TABLE IF EXISTS `sma_purchases`;
CREATE TABLE `sma_purchases`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `reference_no` varchar(55) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `date` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
  `supplier_id` int(11) NOT NULL,
  `supplier` varchar(55) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  `note` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `total` decimal(25, 4) NULL DEFAULT NULL,
  `product_discount` decimal(25, 4) NULL DEFAULT NULL,
  `order_discount_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `order_discount` decimal(25, 4) NULL DEFAULT NULL,
  `total_discount` decimal(25, 4) NULL DEFAULT NULL,
  `product_tax` decimal(25, 4) NULL DEFAULT NULL,
  `order_tax_id` int(11) NULL DEFAULT NULL,
  `order_tax` decimal(25, 4) NULL DEFAULT NULL,
  `total_tax` decimal(25, 4) NULL DEFAULT 0.0000,
  `shipping` decimal(25, 4) NULL DEFAULT 0.0000,
  `grand_total` decimal(25, 4) NOT NULL,
  `paid` decimal(25, 4) NOT NULL DEFAULT 0.0000,
  `status` varchar(55) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `payment_status` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'pending',
  `created_by` int(11) NULL DEFAULT NULL,
  `updated_by` int(11) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  `attachment` varchar(55) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `payment_term` tinyint(4) NULL DEFAULT NULL,
  `due_date` date NULL DEFAULT NULL,
  `return_id` int(11) NULL DEFAULT NULL,
  `surcharge` decimal(25, 4) NOT NULL DEFAULT 0.0000,
  `return_purchase_ref` varchar(55) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `purchase_id` int(11) NULL DEFAULT NULL,
  `return_purchase_total` decimal(25, 4) NOT NULL DEFAULT 0.0000,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `id`(`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sma_purchases
-- ----------------------------
INSERT INTO `sma_purchases` VALUES (2, '01', '2016-07-28 20:01:00', 5, 'Jr Next', 1, '', 11500.0000, 0.0000, NULL, 0.0000, 0.0000, 0.0000, 1, 0.0000, 0.0000, 0.0000, 11500.0000, 11500.0000, 'received', 'paid', 2, NULL, NULL, NULL, 0, NULL, NULL, 0.0000, NULL, NULL, 0.0000);

-- ----------------------------
-- Table structure for sma_quote_items
-- ----------------------------
DROP TABLE IF EXISTS `sma_quote_items`;
CREATE TABLE `sma_quote_items`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `quote_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_code` varchar(55) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `product_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `product_type` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `option_id` int(11) NULL DEFAULT NULL,
  `net_unit_price` decimal(25, 4) NOT NULL,
  `unit_price` decimal(25, 4) NULL DEFAULT NULL,
  `quantity` decimal(15, 4) NOT NULL,
  `warehouse_id` int(11) NULL DEFAULT NULL,
  `item_tax` decimal(25, 4) NULL DEFAULT NULL,
  `tax_rate_id` int(11) NULL DEFAULT NULL,
  `tax` varchar(55) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `discount` varchar(55) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `item_discount` decimal(25, 4) NULL DEFAULT NULL,
  `subtotal` decimal(25, 4) NOT NULL,
  `serial_no` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `real_unit_price` decimal(25, 4) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `quote_id`(`quote_id`) USING BTREE,
  INDEX `product_id`(`product_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sma_quotes
-- ----------------------------
DROP TABLE IF EXISTS `sma_quotes`;
CREATE TABLE `sma_quotes`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
  `reference_no` varchar(55) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `customer_id` int(11) NOT NULL,
  `customer` varchar(55) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `warehouse_id` int(11) NULL DEFAULT NULL,
  `biller_id` int(11) NOT NULL,
  `biller` varchar(55) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `note` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `internal_note` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `total` decimal(25, 4) NOT NULL,
  `product_discount` decimal(25, 4) NULL DEFAULT 0.0000,
  `order_discount` decimal(25, 4) NULL DEFAULT NULL,
  `order_discount_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `total_discount` decimal(25, 4) NULL DEFAULT 0.0000,
  `product_tax` decimal(25, 4) NULL DEFAULT 0.0000,
  `order_tax_id` int(11) NULL DEFAULT NULL,
  `order_tax` decimal(25, 4) NULL DEFAULT NULL,
  `total_tax` decimal(25, 4) NULL DEFAULT NULL,
  `shipping` decimal(25, 4) NULL DEFAULT 0.0000,
  `grand_total` decimal(25, 4) NOT NULL,
  `status` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `created_by` int(11) NULL DEFAULT NULL,
  `updated_by` int(11) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  `attachment` varchar(55) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `supplier_id` int(11) NULL DEFAULT NULL,
  `supplier` varchar(55) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `id`(`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sma_return_items
-- ----------------------------
DROP TABLE IF EXISTS `sma_return_items`;
CREATE TABLE `sma_return_items`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sale_id` int(11) UNSIGNED NOT NULL,
  `return_id` int(11) UNSIGNED NOT NULL,
  `sale_item_id` int(11) NULL DEFAULT NULL,
  `product_id` int(11) UNSIGNED NOT NULL,
  `product_code` varchar(55) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `product_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `product_type` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `option_id` int(11) NULL DEFAULT NULL,
  `net_unit_price` decimal(25, 4) NOT NULL,
  `quantity` decimal(15, 4) NULL DEFAULT 0.0000,
  `warehouse_id` int(11) NULL DEFAULT NULL,
  `item_tax` decimal(25, 4) NULL DEFAULT NULL,
  `tax_rate_id` int(11) NULL DEFAULT NULL,
  `tax` varchar(55) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `discount` varchar(55) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `item_discount` decimal(25, 4) NULL DEFAULT NULL,
  `subtotal` decimal(25, 4) NOT NULL,
  `serial_no` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `real_unit_price` decimal(25, 4) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `sale_id`(`sale_id`) USING BTREE,
  INDEX `product_id`(`product_id`) USING BTREE,
  INDEX `product_id_2`(`product_id`, `sale_id`) USING BTREE,
  INDEX `sale_id_2`(`sale_id`, `product_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sma_return_purchase_items
-- ----------------------------
DROP TABLE IF EXISTS `sma_return_purchase_items`;
CREATE TABLE `sma_return_purchase_items`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `purchase_id` int(11) UNSIGNED NOT NULL,
  `return_id` int(11) UNSIGNED NOT NULL,
  `purchase_item_id` int(11) NULL DEFAULT NULL,
  `product_id` int(11) UNSIGNED NOT NULL,
  `product_code` varchar(55) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `product_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `product_type` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `option_id` int(11) NULL DEFAULT NULL,
  `net_unit_cost` decimal(25, 4) NOT NULL,
  `quantity` decimal(15, 4) NULL DEFAULT 0.0000,
  `warehouse_id` int(11) NULL DEFAULT NULL,
  `item_tax` decimal(25, 4) NULL DEFAULT NULL,
  `tax_rate_id` int(11) NULL DEFAULT NULL,
  `tax` varchar(55) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `discount` varchar(55) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `item_discount` decimal(25, 4) NULL DEFAULT NULL,
  `subtotal` decimal(25, 4) NOT NULL,
  `real_unit_cost` decimal(25, 4) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `purchase_id`(`purchase_id`) USING BTREE,
  INDEX `product_id`(`product_id`) USING BTREE,
  INDEX `product_id_2`(`product_id`, `purchase_id`) USING BTREE,
  INDEX `purchase_id_2`(`purchase_id`, `product_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sma_return_purchases
-- ----------------------------
DROP TABLE IF EXISTS `sma_return_purchases`;
CREATE TABLE `sma_return_purchases`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `purchase_id` int(11) NOT NULL,
  `date` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
  `reference_no` varchar(55) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `supplier_id` int(11) NOT NULL,
  `supplier` varchar(55) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `warehouse_id` int(11) NULL DEFAULT NULL,
  `note` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `total` decimal(25, 4) NOT NULL,
  `product_discount` decimal(25, 4) NULL DEFAULT 0.0000,
  `order_discount_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `total_discount` decimal(25, 4) NULL DEFAULT 0.0000,
  `order_discount` decimal(25, 4) NULL DEFAULT 0.0000,
  `product_tax` decimal(25, 4) NULL DEFAULT 0.0000,
  `order_tax_id` int(11) NULL DEFAULT NULL,
  `order_tax` decimal(25, 4) NULL DEFAULT 0.0000,
  `total_tax` decimal(25, 4) NULL DEFAULT 0.0000,
  `surcharge` decimal(25, 4) NULL DEFAULT 0.0000,
  `grand_total` decimal(25, 4) NOT NULL,
  `created_by` int(11) NULL DEFAULT NULL,
  `updated_by` int(11) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  `attachment` varchar(55) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `id`(`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sma_return_sales
-- ----------------------------
DROP TABLE IF EXISTS `sma_return_sales`;
CREATE TABLE `sma_return_sales`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sale_id` int(11) NOT NULL,
  `date` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
  `reference_no` varchar(55) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `customer_id` int(11) NOT NULL,
  `customer` varchar(55) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `biller_id` int(11) NOT NULL,
  `biller` varchar(55) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `warehouse_id` int(11) NULL DEFAULT NULL,
  `note` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `total` decimal(25, 4) NOT NULL,
  `product_discount` decimal(25, 4) NULL DEFAULT 0.0000,
  `order_discount_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `total_discount` decimal(25, 4) NULL DEFAULT 0.0000,
  `order_discount` decimal(25, 4) NULL DEFAULT 0.0000,
  `product_tax` decimal(25, 4) NULL DEFAULT 0.0000,
  `order_tax_id` int(11) NULL DEFAULT NULL,
  `order_tax` decimal(25, 4) NULL DEFAULT 0.0000,
  `total_tax` decimal(25, 4) NULL DEFAULT 0.0000,
  `surcharge` decimal(25, 4) NULL DEFAULT 0.0000,
  `grand_total` decimal(25, 4) NOT NULL,
  `created_by` int(11) NULL DEFAULT NULL,
  `updated_by` int(11) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  `attachment` varchar(55) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `id`(`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sma_sale_items
-- ----------------------------
DROP TABLE IF EXISTS `sma_sale_items`;
CREATE TABLE `sma_sale_items`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sale_id` int(11) UNSIGNED NOT NULL,
  `product_id` int(11) UNSIGNED NOT NULL,
  `product_code` varchar(55) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `product_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `product_type` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `option_id` int(11) NULL DEFAULT NULL,
  `net_unit_price` decimal(25, 4) NOT NULL,
  `unit_price` decimal(25, 4) NULL DEFAULT NULL,
  `quantity` decimal(15, 4) NOT NULL,
  `warehouse_id` int(11) NULL DEFAULT NULL,
  `item_tax` decimal(25, 4) NULL DEFAULT NULL,
  `tax_rate_id` int(11) NULL DEFAULT NULL,
  `tax` varchar(55) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `discount` varchar(55) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `item_discount` decimal(25, 4) NULL DEFAULT NULL,
  `subtotal` decimal(25, 4) NOT NULL,
  `serial_no` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `real_unit_price` decimal(25, 4) NULL DEFAULT NULL,
  `sale_item_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `sale_id`(`sale_id`) USING BTREE,
  INDEX `product_id`(`product_id`) USING BTREE,
  INDEX `product_id_2`(`product_id`, `sale_id`) USING BTREE,
  INDEX `sale_id_2`(`sale_id`, `product_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 25 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sma_sale_items
-- ----------------------------
INSERT INTO `sma_sale_items` VALUES (14, 8, 1, '07327550', 'Produto Teste', 'standard', 0, 16.9500, 16.9500, 1.0000, 1, 0.0000, 1, '0.0000', '0', 0.0000, 16.9500, '', 16.9500, NULL);
INSERT INTO `sma_sale_items` VALUES (15, 8, 1, '07327550', 'Produto Teste', 'standard', 0, 16.9500, 16.9500, 5.0000, 1, 0.0000, 1, '0.0000', '0', 0.0000, 84.7500, '', 16.9500, NULL);
INSERT INTO `sma_sale_items` VALUES (16, 8, 1, '07327550', 'Produto Teste', 'standard', 0, 16.9500, 16.9500, 1.0000, 1, 0.0000, 1, '0.0000', '0', 0.0000, 16.9500, '', 16.9500, NULL);
INSERT INTO `sma_sale_items` VALUES (17, 8, 1, '07327550', 'Produto Teste', 'standard', 0, 16.9500, 16.9500, 1.0000, 1, 0.0000, 1, '0.0000', '0', 0.0000, 16.9500, '', 16.9500, NULL);
INSERT INTO `sma_sale_items` VALUES (18, 8, 1, '07327550', 'Produto Teste', 'standard', 0, 16.9500, 16.9500, 1.0000, 1, 0.0000, 1, '0.0000', '0', 0.0000, 16.9500, '', 16.9500, NULL);
INSERT INTO `sma_sale_items` VALUES (19, 9, 1, '07327550', 'Produto Teste', 'standard', 0, 16.9500, 16.9500, 1.0000, 1, 0.0000, 1, '0.0000', '0', 0.0000, 16.9500, '', 16.9500, NULL);
INSERT INTO `sma_sale_items` VALUES (20, 9, 1, '07327550', 'Produto Teste', 'standard', 0, 16.9500, 16.9500, 1.0000, 1, 0.0000, 1, '0.0000', '0', 0.0000, 16.9500, '', 16.9500, NULL);
INSERT INTO `sma_sale_items` VALUES (21, 9, 1, '07327550', 'Produto Teste', 'standard', 0, 16.9500, 16.9500, 1.0000, 1, 0.0000, 1, '0.0000', '0', 0.0000, 16.9500, '', 16.9500, NULL);
INSERT INTO `sma_sale_items` VALUES (22, 9, 1, '07327550', 'Produto Teste', 'standard', 0, 16.9500, 16.9500, 1.0000, 1, 0.0000, 1, '0.0000', '0', 0.0000, 16.9500, '', 16.9500, NULL);
INSERT INTO `sma_sale_items` VALUES (23, 10, 1, '07327550', 'Produto Teste', 'standard', 0, 16.9500, 16.9500, 1.0000, 1, 0.0000, 1, '0.0000', '0', 0.0000, 16.9500, '', 16.9500, NULL);
INSERT INTO `sma_sale_items` VALUES (24, 10, 1, '07327550', 'Produto Teste', 'standard', 0, 16.9500, 16.9500, 1.0000, 1, 0.0000, 1, '0.0000', '0', 0.0000, 16.9500, '', 16.9500, NULL);

-- ----------------------------
-- Table structure for sma_sales
-- ----------------------------
DROP TABLE IF EXISTS `sma_sales`;
CREATE TABLE `sma_sales`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
  `reference_no` varchar(55) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `customer_id` int(11) NOT NULL,
  `customer` varchar(55) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `biller_id` int(11) NOT NULL,
  `biller` varchar(55) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `warehouse_id` int(11) NULL DEFAULT NULL,
  `note` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `staff_note` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `total` decimal(25, 4) NOT NULL,
  `product_discount` decimal(25, 4) NULL DEFAULT 0.0000,
  `order_discount_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `total_discount` decimal(25, 4) NULL DEFAULT 0.0000,
  `order_discount` decimal(25, 4) NULL DEFAULT 0.0000,
  `product_tax` decimal(25, 4) NULL DEFAULT 0.0000,
  `order_tax_id` int(11) NULL DEFAULT NULL,
  `order_tax` decimal(25, 4) NULL DEFAULT 0.0000,
  `total_tax` decimal(25, 4) NULL DEFAULT 0.0000,
  `shipping` decimal(25, 4) NULL DEFAULT 0.0000,
  `grand_total` decimal(25, 4) NOT NULL,
  `sale_status` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `payment_status` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `payment_term` tinyint(4) NULL DEFAULT NULL,
  `due_date` date NULL DEFAULT NULL,
  `created_by` int(11) NULL DEFAULT NULL,
  `updated_by` int(11) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  `total_items` tinyint(4) NULL DEFAULT NULL,
  `pos` tinyint(1) NOT NULL DEFAULT 0,
  `paid` decimal(25, 4) NULL DEFAULT 0.0000,
  `return_id` int(11) NULL DEFAULT NULL,
  `surcharge` decimal(25, 4) NOT NULL DEFAULT 0.0000,
  `attachment` varchar(55) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `return_sale_ref` varchar(55) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sale_id` int(11) NULL DEFAULT NULL,
  `return_sale_total` decimal(25, 4) NOT NULL DEFAULT 0.0000,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `id`(`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sma_sales
-- ----------------------------
INSERT INTO `sma_sales` VALUES (8, '2016-07-28 18:48:09', 'VENDA/POS/2016/07/0001', 1, 'Jr Next', 4, 'Jr Next', 1, '', '', 152.5500, 0.0000, NULL, 0.0000, 0.0000, 0.0000, 1, 0.0000, 0.0000, 0.0000, 152.5500, 'completed', 'paid', 0, NULL, 2, NULL, NULL, 9, 1, 152.5500, NULL, 0.0000, NULL, NULL, NULL, 0.0000);
INSERT INTO `sma_sales` VALUES (9, '2016-07-28 20:02:39', 'VENDA/POS/2016/07/0002', 1, 'Jr Next', 4, 'Jr Next', 1, '', '', 67.8000, 0.0000, NULL, 0.0000, 0.0000, 0.0000, 1, 0.0000, 0.0000, 0.0000, 67.8000, 'completed', 'due', 0, NULL, 2, NULL, NULL, 4, 1, 0.0000, NULL, 0.0000, NULL, NULL, NULL, 0.0000);
INSERT INTO `sma_sales` VALUES (10, '2016-07-30 15:09:54', 'VENDA/POS/2016/07/0003', 1, 'Jr Next', 4, 'Jr Next', 1, '', '', 33.9000, 0.0000, NULL, 0.0000, 0.0000, 0.0000, 1, 0.0000, 0.0000, 0.0000, 33.9000, 'completed', 'paid', 0, NULL, 2, NULL, NULL, 2, 1, 33.9000, NULL, 0.0000, NULL, NULL, NULL, 0.0000);

-- ----------------------------
-- Table structure for sma_sessions
-- ----------------------------
DROP TABLE IF EXISTS `sma_sessions`;
CREATE TABLE `sma_sessions`  (
  `id` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ip_address` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `timestamp` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `data` blob NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `ci_sessions_timestamp`(`timestamp`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sma_sessions
-- ----------------------------
INSERT INTO `sma_sessions` VALUES ('0182156bdb78a7c34ff321f23048baf74513fcc0', '177.70.142.40', 1463772699, 0x74317245796C4A586E6D7075326675786C41734659746361695F456E4F592D75756C41724E6942484F4B6E796642585335454A4966474859676F4D66626E4E644C31594B4748616747417A575A3358764A736D4D6359364C697361386E666E33764151794255397043466161455434454F533854356A645843657232326B4339486F687A332D714979346430314D5A6E504D493163584974354E764930754F784C6937486E5052484277504D474A743367546A6443686449483038635375545747466C39743058424F6A5348633357777771364B616A4E42465977497068786577722D6B776353355737674E457665303856734F57454A4F6B59466C62385F42585A637070732D4A496151784A4C785930556E79346F5A6C6654304876575979466F35542D4B7644677753485A62574D304A546135545166656766784B4447494578724878764F6636556A2D334F564D627847666D6B6F3030796F46367631414F4E374765565A4B7A64305F483847747146786B69306656752D31486E354B624A4F326F705F7850384472737534675F4B577A346E346F34354269734338756C6376364A5466656C574A68636A7952514F547445704E71695750747952576230514B59466F452D4D703437767A3332312D3846597470772D4B6F464A576D6D712D414D6F36456E4E4F5A413049764F7A6F657975366C496F4B6B4D332D6D3957524D647874654F63786A577449656B756C414D674C45477754477665336A324A783555336C435965744C794A375562464238535F4F46427734576438674A53344A38354E6B6D47475F3630696859355852564B42466C6C496F6E41374F4856634F776632355F3170316A7A6761537452496F56334E55584D6A4F744C51414670326667626F51347435525476363351345162703465677275743677396A68774A6F624B706C4674676674454270532D4F476F4B527070394A687465516373796E306D37706A704E72774778325F4A686E3844786838512E2E);
INSERT INTO `sma_sessions` VALUES ('01a678d5316f992c36d35569f7e44aef97be61d3', '177.70.142.40', 1463766584, 0x584D7A41615769585943615A684E3868734F7769636478493748726A49484F304F5F5354567832464153496E436370567732746B4E6A74636A53556861414334314978684C766164525251326D43684B4E355750422D6A677841613961636C61312D657A5A614E6C786F5F30514F724B6C516E304C32727666735A6F6F72753331354633676D7134334D4E487058427A7576436D647131634E4A594B674B5F484E41636A316A67574C6A6236376F4A63566B384E4B4A5F4D586B5648425858772D6E7455636378375F6353786E646F777A344434385A73356F4877416A344C347159317372644C57436670474D526F3456766F434B4D53324466574E737172323762326E51366F656A466231643734337875795355736A653561333533766C39306E423532473778744C4243305034667351327557394761644F645A2D437039516E776247476F6B734E704F747642746B35586C355739616F346C346C6A37596338745F432D636C76312D65362D5179346B5565373269684D3058557834703763774A5F547672456F4F736F2D623464396E373462503132754D30736B49736C427A4255615356636D5746333836494E50675653324666715574444B7453684F6C744B5170504B465537383234626539504E6E376E386942453979776348486452632D2D4A6B7563423539636A30513839654C79527667325733326B44512D71366633593858564B65534A374770794E376B374A566D67542D66632D696D616C38386C6A6A2D7A4A654A765F3049317A4C6D62677A4B72697234333564315F6C776A366747434861594A4633687555506B2D66575A4E593262666D39674730664266547142397342634B55396B317367684642387164396453536F35794836654F6F57636E497A4A596A6F68714559544A593938413279726448456E554D496E78595A5F5176616661685757714834664B6330564642646C4D4D52445272314F41755A634B63537234443255725F4545417270646C772E2E);
INSERT INTO `sma_sessions` VALUES ('09fdeb0941dc70790899151e950d726db7705e9e', '168.90.88.70', 1464188515, 0x736C5255584C53626C76353545694453516E58702D3654585F38793351715A7147624F43386A30554F766F48616D735F5A4277742D2D326E3572425F655571664D31706142447538706C426B454D34537467765A4D6A54563846367A6348384344396D77322D7833746E48593976486863334C326A7247412D3841494267385745387563474C7270355870716562325237585F3773677778636C39676F5450364F734534336C58785A52726D4249514B424D6375783949574B69565437323575754576326348524A6761514A7664634F6F77367075524E4B316437425F32624A5A2D2D675875664A413639733455414639594E6B45577245574E4F41686870657534396D3670787349356C48466B4A7467355347624438544E67394863327943483534704132434F727A6B4B37547678474A624E6E62756659347A6A5F76365574426C4E6C79436E67515175694B694A74776A4770546E4E4455434252735F373379364B5F4D356A6263494B3378626862585A4965536A50504830476E6A74396C5977783330494F4571377A56316F776C6278595755357852513070584949797356424347613945697038574C535F4A655F4F6D354D484248376238797943537A456A452D386C4C37666E6D504972384B38464D447974496D677A59777569353637434759664C795F6C4F37356944435752557A576A632D3331585154796344736C3044474D5872352D51564A5474726F57634A523957413835304F77672D4354756B7954595246336C6F71346E4769784C4F31634F764152666E657278327A542D4A4442757644442D5736487246586339734478597946442D31454F57357078396A57717A69434334732E);
INSERT INTO `sma_sessions` VALUES ('174708d12b5824ec35cb16420c4830bae772b1b8', '177.70.142.40', 1463771142, 0x485774662D6F506D37384D7A34376878307374655779795F34355F6A36374D3354526A6A6F776F626E4177565069644A7268424B6236304947442D43394A5A474870534A786B42715741435443516331396735324363596D6332734D6F476A4974587745617453386642342E);
INSERT INTO `sma_sessions` VALUES ('23c8c2b33e9147bb25313baed6138dc5877aa149', '168.90.88.70', 1464188301, 0x4F55597074544F465F6B476D766946315532444E3366636C623436583062385A307A6A53393767486C444E316C634330767558784B717472616A414B6A3073694970686B2D65502D4A6A4B61314A4431565F63554D59306C357235586B634C4745526266586658786253686258426D664B77796B4D616E6972784476316E4F754B78614565394E425531464455484F794B5766344D636D57596D497469444B4E6A362D6A346F317862577267587A78314D5F326E6C73477A395A424E3656645849736B48496B724A67324251456C6E7837434F6861664753384E77466A307431547331594B5F585A384F72516F7A305949513652494D57795570536F424E78624C4F65456E384A574354436E5838617A39334D41346C6E4158434A55626A5F4A4A6C7039593462716276436A754673656D585574684A436B61316D4D5A426B575166306F7961494A7832555A6254727350415467445151456E38433048734A564E6D5567387A4E56714377464F4932765534354A75785A665A6D4A48564A31494E5057466F423342785A55735A617871442D3353415261766B587634776A7634446B617055426F757A7163566774364867694366785033653532517A47765566676C5238314B376B4142596856396331456D4B3571356A4B716F73366E7441785873475F4C674A614A70484D49754459576F3375496B766B36386D6A794A634D596867346E4F6639414749686C634E6A5F632D6A486178695164654E6467504E4A3757766762425F5F3476483938314D78546A64394F454539474F4D3277794539453538563969644D3264306446354D5A4238337367697050474A4E782D4D6E47565F4A42325F5063476A4A30642D7961664B716A2D476646796E7738793246484770793643546F4F61534776732D42795441545F512E2E);
INSERT INTO `sma_sessions` VALUES ('262eed401aa2910963125b5030177de365651224', '::1', 1469730512, 0x5F5F63695F6C6173745F726567656E65726174657C693A313436393733303531323B7265717565737465645F706167657C733A303A22223B);
INSERT INTO `sma_sessions` VALUES ('2c80b3eb6cb7a715663bd269cd43894fd2de873e', '168.90.88.70', 1464184535, 0x4566497062567864483247343633544D4142657171687073715332334F38667552616A66546E74476B37644F673435717A34447A4267375670783838344773726141634F65616C313234645033712D614639504F5979783767366A555955715275665A65445459576D6932346F787A386769446E704A634B367A41693538585A466B4E476C6E6A3566544146786B684554344B544D3954536E4F584357797355684F667564686778705F42756F715048724848424B6658374D794C6E5553632D65437736765777684F757541797A464B5764774F306349346F4872354D4A4A35426155392D792D6C34654D75545A5567496B474A3267345A46574A5865554B463942624350624F70494C6C694A34736C336A697174724C3338464967675478794A474F686C764735395968497777384D476F774A595A7A7A6B7A734864725648667233715146334B6F4B4A4946445738374A786859585166692D496D4E566D67735969495074706C4A4A6C464D6B65624F6E564365376E7A466F6A515675796B325A634B382D36444C3076784E4F444B3150336D7232663374766E384347537A5759474F4E6D624A6439704554715F445775304649416D76484D6C7143354731486A526D4744345756484A6F564632454558555057775639494F57394D49545A64593948345F697735786C57644247496C426D59652D434276645F48477146394E684C4D70314371714A5845586359524E726A6A5F4E77336B7861694D52574941434A56755362636B51495F683049654B724A574B387A6D4C715A4637334B4A344D756F4D51586F4F4F77333868613162374B74613257575F3162577867414837486864713873327A67443955635F64626F5A396375436F3373426155594562554B6877304E63376A625752344662577A354C594D4735473965614D76634B3277675F726730646B676E615135435142633054694B674C4379716B49747477694C3330587A68354E58705A4D64544145466878434A32423875307171616A42356D67752D416D546E6277302E);
INSERT INTO `sma_sessions` VALUES ('2v55jhnbitgn6alhdfs7a1gugh', '::1', 1647191405, 0x5F5F63695F6C6173745F726567656E65726174657C693A313634373139313430353B7265717565737465645F706167657C733A303A22223B);
INSERT INTO `sma_sessions` VALUES ('32ceb392nrrecu85h1lk1n3mgn', '::1', 1647197862, 0x5F5F63695F6C6173745F726567656E65726174657C693A313634373139373836323B);
INSERT INTO `sma_sessions` VALUES ('33503754930fe5e4f5ab7fe19092eeaf8ad11b6a', '177.70.142.40', 1463770033, 0x4761665A546777437176665F385572774B71562D7566317872725942496D7A566C6E6C433569475A5A723435746D6F4F363634464F75313949784D7A706836444154474A7278734A444B7548793675416530773136426137735A514D6651723648784B4F7771622D49352D4575634F4845494D574875774A79666553327373574A567656754D45376F6E662D504F586B7371773169386D486D47427635414B6D634A7A62445A74336E57726972425451664D6B3550676566314F4B363663524636454E62514A39764D73704E68556C6A516C637452755F7447377741436A35704172544B5F764A4D67774764535174504E5642614F67333932354F3171395876306D744A4B5F4E384543354E5950425142796544735439343678397A70466C793163627149443738736D334F43464A6136336B78527833413470686331476238556B53645741384C41576E4337647A73586B51713648764454687552736F744835443750574A37494958486535504738305332476E6A4F4B5A33456C704B465F427052596A4B434E6C6335784431713462452D4331715758657557376B557734624F5362525734333365675F4C5A7957666F4C454777674A59675152696F464E4975495730336749746A5A386F4E686B767A45377A4C6D656C6C334B4E452D5F684C4B6C5F6D4E59645765745F59782D3558534E484A7A7766694D3275504746324E633335624161704B645362727578476B74387230475F4E493470495842386C366956427546767737577061315A4666734B5078694C6163727A654F773264785244646474526B526F484A3465644544564D34734635514A694C555A305F4D74716E37426F386B593636385655317530626579702D384E74747751574C5263756B785759585976636A566B5144723941725A316F2D634F344C3267532D3569383348306E745463455171766C5863624D70634C446367574254634C667A487444384354776E6F4A7638353530442D4F5644396A57672E2E);
INSERT INTO `sma_sessions` VALUES ('33ddbf7c3ec10a2077130dc2e4a377a7f605d54d', '::1', 1469842865, 0x5F5F63695F6C6173745F726567656E65726174657C693A313436393834323836353B6964656E746974797C733A363A226A756E696F72223B757365726E616D657C733A363A226A756E696F72223B656D61696C7C733A31353A2261646D696E4061646D696E2E636F6D223B757365725F69647C733A313A2232223B6F6C645F6C6173745F6C6F67696E7C733A31303A2231343639373335393933223B6C6173745F69707C733A333A223A3A31223B6176617461727C4E3B67656E6465727C733A343A226D616C65223B67726F75705F69647C733A313A2231223B77617265686F7573655F69647C733A313A2230223B766965775F72696768747C733A313A2231223B656469745F72696768747C733A313A2230223B616C6C6F775F646973636F756E747C733A313A2230223B62696C6C65725F69647C733A313A2230223B636F6D70616E795F69647C4E3B73686F775F636F73747C733A313A2230223B73686F775F70726963657C733A313A2230223B);
INSERT INTO `sma_sessions` VALUES ('36a40399dfb597fdea21c4933baaa92f01ce0c6e', '::1', 1469898141, 0x5F5F63695F6C6173745F726567656E65726174657C693A313436393839373936353B6964656E746974797C733A363A226A756E696F72223B757365726E616D657C733A363A226A756E696F72223B656D61696C7C733A31353A2261646D696E4061646D696E2E636F6D223B757365725F69647C733A313A2232223B6F6C645F6C6173745F6C6F67696E7C733A31303A2231343639383338393031223B6C6173745F69707C733A333A223A3A31223B6176617461727C4E3B67656E6465727C733A343A226D616C65223B67726F75705F69647C733A313A2231223B77617265686F7573655F69647C733A313A2230223B766965775F72696768747C733A313A2231223B656469745F72696768747C733A313A2230223B616C6C6F775F646973636F756E747C733A313A2230223B62696C6C65725F69647C733A313A2230223B636F6D70616E795F69647C4E3B73686F775F636F73747C733A313A2230223B73686F775F70726963657C733A313A2230223B6C6173745F61637469766974797C693A313436393839363933363B72656769737465725F69647C733A313A2233223B636173685F696E5F68616E647C733A373A2232302E30303030223B72656769737465725F6F70656E5F74696D657C733A31393A22323031362D30372D32382031353A31333A3538223B);
INSERT INTO `sma_sessions` VALUES ('39ea73b87d005c874b282c8f94fb2a3eb0f13e29', '::1', 1469891255, 0x5F5F63695F6C6173745F726567656E65726174657C693A313436393839313235353B7265717565737465645F706167657C733A303A22223B);
INSERT INTO `sma_sessions` VALUES ('3a9jpsspt3fss2gn0mtttpjqev', '::1', 1647192199, 0x5F5F63695F6C6173745F726567656E65726174657C693A313634373139323139393B);
INSERT INTO `sma_sessions` VALUES ('3bfc0cb527ea93efe2f635f1acb55dc7533ef346', '::1', 1469916084, 0x5F5F63695F6C6173745F726567656E65726174657C693A313436393931363038343B7265717565737465645F706167657C733A303A22223B);
INSERT INTO `sma_sessions` VALUES ('3d52898e9f1337515de46d6eab2fd429805d4800', '168.90.88.70', 1464187765, 0x786D364246524730366B5745646161444D394A3468624E76396D5A6C556D383149777331667650614B3444766643457149336C7079753570644130355A307555732D6C3838586E6E702D7A534E4F573243754C466859586367394B783942637236437965584D6E6344515250546E68653438384949594546486B56524A544550556B6D564E4A7159746577466D3941685730474431376D2D55614D346D73504C7A4D6348364B4F43345962554F56563669677465334B4471424349564B374C68433430326376624737594D4E476E5366546E75614C655147713866627A37414B35794E2D5062566B6B79662D4468353077496C58345567326B74727242737766576A4C48764933674171554F51385579387244697932432D4F434D7A6E336A4F426C6E7256746B42614B794D475A4336477444336C4A436F57725F6C7A30396263744130766673396179434A55456936743961472D6D52547630544B4F4A555A7730515666657242724E6B7A367669792D6144513558466236303457305A416D6C4E7453757430465A45487069655F4E56306C454274346B785241436650317A6656496274726A36714467545451467261744C566C67594A5653384F54306E512D4F32384D4554754C726B30706A574A5A74323346756566546F4332704C70667157454E44554E3838765A6D5A6A722D5A44324B536D3471336B64467372514E456A664F5533675973747647715A574C2D5A395F653152685352383250303455437173376F6B6C354B786967315856736F4A523071337057374F42762D69525F4A7A665630436F397343444739753465305A47756476587373794E76424D7557786D7833783233426F7A554B4D6F306971394F4F75556777725F376D336C4F354C7A6F34354D566E57786641424F336B357443715A5A64516E5051386E484C344746353230523166784E6F4B6E31782D5F39726C396E6261717338642D304A58764557706759354745616476516636766B6E61664E596E417346637448795769676948386D6B56737958302E);
INSERT INTO `sma_sessions` VALUES ('42ca20cac2483d2776e3661ea36acd99dbaac5f0', '::1', 1469729856, 0x5F5F63695F6C6173745F726567656E65726174657C693A313436393732393632363B6964656E746974797C733A363A226A756E696F72223B757365726E616D657C733A363A226A756E696F72223B656D61696C7C733A31353A2261646D696E4061646D696E2E636F6D223B757365725F69647C733A313A2232223B6F6C645F6C6173745F6C6F67696E7C733A31303A2231343639373238393831223B6C6173745F69707C4E3B6176617461727C4E3B67656E6465727C733A343A226D616C65223B67726F75705F69647C733A313A2231223B77617265686F7573655F69647C733A313A2230223B766965775F72696768747C733A313A2231223B656469745F72696768747C733A313A2230223B616C6C6F775F646973636F756E747C733A313A2230223B62696C6C65725F69647C733A313A2230223B636F6D70616E795F69647C4E3B73686F775F636F73747C733A313A2230223B73686F775F70726963657C733A313A2230223B6C6173745F61637469766974797C693A313436393732393835363B72656769737465725F69647C733A313A2233223B636173685F696E5F68616E647C733A373A2232302E30303030223B72656769737465725F6F70656E5F74696D657C733A31393A22323031362D30372D32382031353A31333A3538223B72656D6F76655F706F736C737C693A313B6D6573736167657C733A33373A2256656E64612070656C6F205044562061646963696F6E61646120636F6D207375636573736F223B5F5F63695F766172737C613A313A7B733A373A226D657373616765223B733A333A226F6C64223B7D);
INSERT INTO `sma_sessions` VALUES ('45fe3d770a416fc8b25989b137274188c8fb0f1f', '::1', 1469910555, 0x5F5F63695F6C6173745F726567656E65726174657C693A313436393931303332343B6964656E746974797C733A363A226A756E696F72223B757365726E616D657C733A363A226A756E696F72223B656D61696C7C733A31353A2261646D696E4061646D696E2E636F6D223B757365725F69647C733A313A2232223B6F6C645F6C6173745F6C6F67696E7C733A31303A2231343639383931323638223B6C6173745F69707C733A333A223A3A31223B6176617461727C4E3B67656E6465727C733A343A226D616C65223B67726F75705F69647C733A313A2231223B77617265686F7573655F69647C733A313A2230223B766965775F72696768747C733A313A2231223B656469745F72696768747C733A313A2230223B616C6C6F775F646973636F756E747C733A313A2230223B62696C6C65725F69647C733A313A2230223B636F6D70616E795F69647C4E3B73686F775F636F73747C733A313A2230223B73686F775F70726963657C733A313A2230223B);
INSERT INTO `sma_sessions` VALUES ('4a0ec79115693907ea4879fef4f9580410b392eb', '168.90.88.70', 1464181787, 0x37396D566D48356D716D5141384E536F4D417A73687A71476D336E49374D5968646C48686533565946324A4763797278524C3252474E706772373148526E736A686A69454551536A79654138783978796A66434F3978344E656F7050396C704B43505976635F644765486C7238516A5378437A6A6835515665776E3851484B3657497053736F74794735574E706B4A5F7572414B7670716F384D45364F4E6E386A50744E4F3370316968574E336C6557774E4D7067714E5153544C38346D686C6A3134393866504D6D6F4B666E70685138425349436A316B4935424A4235433844636C63347358446F5F6F624466524D4E65664938765A746C51522D2D7A7A4E586C5F4B4C717748747931614D575444554B76394B674C314161776439666C4D594276594C48326F6A6A667555727A49736778385A34647542694C707A6F534378375F465F7139704A79314C48394C5950586E376370364178316543534F476E66424468457A72625A78646B6B6B334E382D2D2D5A38474E4C66686D466C565872724B533577664165384642686F2D4F793537445A69734873612D4B79333247413264424F63703376497870634A4C4B536A7077356141723875306E354C41704B43735546725159324B4476356E47586438725150654F794942687678787664716B4846596C583979434175334459397744575F6F59625057415553396461506B37556A444C485F534B4766424B764A6337435F336C4D38736A354F3935537847793852504D7A506A6D55614858705A59765952567A444871342D5338533374555754777A4C7A785F66375972513168655858455734724F5636357264456937793845336137306831446B2E);
INSERT INTO `sma_sessions` VALUES ('4q59p8bipmtu60ufe54leu5qi9', '::1', 1647191979, 0x5F5F63695F6C6173745F726567656E65726174657C693A313634373139313937393B);
INSERT INTO `sma_sessions` VALUES ('52a0ccd389c23b63643672f13d07d571ed2d0047', '168.90.88.70', 1464187892, 0x6741365353442D706E536B574D6A315A7A553168386A507943744D32365567395979666152736267654C6F31626C38725A7754363146774A65726353356C4451574E76427A7A6B3649386E7A323430565F633235536137447464696E4950375950333378446C484B7572424F67434D56376F4452514479724B656332373972316833326C7A4E6454564D324F484963594149466D2D776F706B4561433755447237366870526831647A48514B47586179752D5757565870784A534C6E6151507436597264366F4F353161774257776C4D386D7643314D687272514D6E434B6445507756433937736C4F6F36595751304342554B354B6A5F65345672746C7535314161384666387238674C37556D6D4277776C596961724E445F6330663069376A6933455A4374732D736A636C70462D7A67565458633031312D466852786C41565479704D6E316A6C4F4C6F436F6A6A356E57386F4A45783058466843493659694678302D65744C36794F37364C4D74392D5F58695368754B3154585865524967305977527349306657586130616D7331594E797A6958725963674E5131686350676555356A394765545067564B39454A47754A5230707A7A3548455566574A645F4D6E4A4A524B324C587049747243796C4C767A4747794A4A3933736470476C2D325A71366B4F5235367079393271345A424B444B6C3635747779336776547A4D4B316846547841515F415267637557726269522D5F4A4263676178314F516656547730524B3376643532756A33754D455355524D325036554337395F34494B6F59786564374470367030426D4B71526335384C58535A572D5A306661657775415F3476396A56664143672E);
INSERT INTO `sma_sessions` VALUES ('559f81665efe594a8f3d4ec0685811ec8f9e045b', '168.90.88.70', 1464182249, 0x367069506D6F734357464E6D51315A4E6C6B35743771554D796B65585A5949637A5A314F73594C6537306632494F466A7841624332426F51424C633967764F59724C374C536474414E397075545058633536705243743755737839586157686D6C69786E42546C365650546F422D4B4E73703337392D37504E764C706C5536554A6164664344625F495A72305F584C355A754644744C775A68585055707A75375A476261756C30344A3165733674354F5A676F73595F62476D564E42764D692D554E6C4B41584D5F36334D795264364D30705142425650474775506F2D7A364C43374D6B34733045565945656C446E553477595661496146453932765872483678702D524F57534F43566F5A73444E69567155663541725772346869764D57714275484B737230726931374C566C73725650696F382D6B4D594B32444F56616C61544B354962445471596B5969707374344B75377147397A77544C47412D783445415579375065374C336B52664658584C6936497578466C78786A4348354652336D455872655A32365A42706D7466347175532D5134796D633639345F75426D32566B4675463045463649657368376D314C7364316A2D476371502D5A5343594E33334633456F77345A466A696233756C355A74674B6C3765534F3550354B5756347073526C5A464D366C7058556E624C3431302D4244573634754366594D67524457554B6E313932353537306C626253754D30544E532D6E35304131664D6630496366766A4A4C4F4F4C62684A6F56417151747A365A754F446D4B502D656944727A384B3442334D6E506E6E454F796D6959345F4273544C754238584746677651703175386C5A716D382E);
INSERT INTO `sma_sessions` VALUES ('5cc27addd6e1b85189fbbedf510e3968d640efd1', '168.90.88.70', 1464184984, 0x6D61765747776853684D57543832724E553568554131393375785875635F6B65325F36753533664A67764F427345646E4B6E4B373145653874555A474956784D754B4B562D6D36644B467253786C563037376F6B7856654D616E6872622D5277654A75383258516843636671336D4E30495063685F6C614A77546C55336C5F6436306F445148446F307A785553745778486F6A6A3036333144547A4343765630512D665752334F6D544F76556B67416B634455716B426372486E6D575A434E584B4A575F744D4B3557475F454473676678516C594846716863493541773466386E7559474E5266366E45775071775031506D593153355943476F536D336C50466C5457445171346D386330636B4146434362554447414C443876346E327668754D3058416A42486D4F504D324E5A49466D5059414463464A6C4C58794835496E5541646B554F76365062574A76665834487730624F703849726F666C524B4C44337A6F52485A5969424C6C75456F5F2D6669656E5339523850484D5A32594B44486E6330666A574A6B6B495732742D793664576C6B5451594D736234353855655976695539357A6E35454A564B574F7874657256737235634F77416F414D3264685158554B5A69516842467851484B694672674E71496162556F79584A6162716530392D67637363385A6957386C5F73374E676A56424C72614A4137416E4E6D623375595F5862453253716E4E784A33594D62424F53554F754B645568327735513959643574463459307A6F726C42525056396D754C4E566C4A4F4667494F655833795A496351726338694975787376505934683567534D6D31704B45342D4A376378494972534157384F71626C705458356B636B67343530357A4C444E4E63736453564B455849326B72346964484B5A79586C5A5F6C6C77537A4659516C7449676E513950505F5F462D4A50526E756F66564572545A4D71445F3447796676727749734A435A7279714D6735347644454F455730674B6D4F6B333771684C49526C4B594B2D704A7A5F772E);
INSERT INTO `sma_sessions` VALUES ('5fe8dcc03622f9c64b9583ecacb143e6372dfb7e', '::1', 1469728737, 0x5F5F63695F6C6173745F726567656E65726174657C693A313436393732383733363B);
INSERT INTO `sma_sessions` VALUES ('5rlskf249ibg10h9kmfjoelel4', '::1', 1647191433, 0x5F5F63695F6C6173745F726567656E65726174657C693A313634373139313433333B7265717565737465645F706167657C733A373A2277656C636F6D65223B);
INSERT INTO `sma_sessions` VALUES ('63cd6fd7ba20a93e08c3e65e4a921cae21ed46ac', '::1', 1469910324, 0x5F5F63695F6C6173745F726567656E65726174657C693A313436393931303332343B7265717565737465645F706167657C733A303A22223B);
INSERT INTO `sma_sessions` VALUES ('68c8d0fbe393b88eeb386e3e233324a4b0996665', '177.70.142.40', 1463764839, 0x665578574135755F2D44504F3847786D51622D7444435661367463436A347231684F313856673651445A726263687369494950596E794154775F54354754306C5464736F614E7A325A544F5A64775132546638366D6E58556F526D6D6C77324C303669795F5A6E306F6A537931494E6A6578426F7855576848514E6E356D6D6F53456E6E5235796D4778684B717A37372D724C7A6762324373726A6663796D655037303737777339486C475831596B6432704548796C4165546F6E79576F7A2D4137444C627571415A7367637A5741692D384F646E4E6B6D3472576F744272506466736C6F586B346348747351504870716937416466553838477073796E562D4E367332684F597A6E4638336A6F627947736E565839644C52526657545653533554676E6A68506B3969454149656E725155494B5154674178656545675A5F306F417A4A5754452D33784568593243424F6267665379425659517258474A6138544246684F435F6D4A675179594644765F755856573936784333776C6D51535F72397A4C47575369436A514968466D776E2D4F2D4D335F485A6C65334A70517559574B7169535F454B5F446158467733386E504B764F536F3558664D6E65766A42552D47444C4C37752D674556505A4E447745632D4B6B6F6268645530356646324D317633645145397838435239304E76634C6D7341654255713655594E366A343743346F5A744142586863577A6D494B44724162735A6E3863564D466F657A56592D7532664972594D72553046346F743676305830766F434A3432545F5A426669593667545073662D6E59424673766A4F5473465046544F53634F565F73786D625F723652766E4F4B56755175536C51416C4F323761677370394343536570464768355A4B74645A4E326A78624C475664465F416447746E486E554155505836434E686D755263517463314D6A4E4443764B37683575334474615869586A69536A567A6B376274426734424832694F4E5035564A512E2E);
INSERT INTO `sma_sessions` VALUES ('68d2e9ccf422f332065d4d57c32686edeb9373ea', '168.90.88.70', 1464184823, 0x6844506949594635506E6C4C76744663586F396F494559715270327064704A384D4F796A745137496A75766B5F64367055557965557730594A4F67366D6C4E4734705665504844334872536E744337476B674D78734E5A4F5A2D466D6F32493148797838476D4D326353355255554F50726862664E2D2D4450737165635F767364436F685439376A38714A496C636B6649662D5951726A36344C465068576D75765533557A49686B584E4A6B747752374A41554F65506D6F7432367836544D7674656854476162534141327069396C434D74466C7757505875383144685A6C70705A49626372645A47344D6B37797175524D2D437236362D4B4478326F50416D6E673730516C647771566A6D664E41363143566B514D7561662D6648472D486F57704379335F4D634B5A327876644A72504E71484C686C3738786C716176447266636B4A70496F474B4D3932456E504B6A3868446643725F2D2D6E63636D4C7A64505330537A69414259594D4B665042754263454E754F5A5A34753950754A646D55736C5057556B6976636A3961326F786A306A7556586366515934655F7A666F73553432324D794777666E7A444F614356497036364A5643556C754A43612D4B714D785F4748596142585536624D5142766247417754507349545849565541356A4B5645646F4A57496B41387A5F54625A48666730626958525952616976513364535438304A327678587531657037766D302D76526570663746467857523745756E6F6448586233345950412D6830506C34693142547A6B56624D42593864427464785F5248476A457734716D6D5636424633723168515933713150775A6E324C696F4565636836347147504D46647435705A5158494C6231595249717558485835674C66637953656F304C395A7A4958597231504B58574157734A4A65566B426C70767A77645F74476B4B6867636A494A543169486D557242672D3837586A344E68694343454A427248684A746B36795F4C377A45514563396A4947505A34684C67426B53365058412E);
INSERT INTO `sma_sessions` VALUES ('692c5bbe3c0210ecba27f8f1c6836df0df259040', '177.70.142.40', 1463774262, 0x4B4C6650774C6E464E704F576539595455506A62553079563263565475373644614B5437613470424B3461567474484175556D494D57695745677479514A6A6677344A30536A7866484D35755F6649716563696742622D737348626F5065496D55724A784E2D45484C595F634A6B334E5764722D516241335F6D766F555263704345686E67412D64453679376B46665556766D7941526E4971366A586B427242564A32357658664B2D7457484A444A636F4850474659667843476B7A6D5A6E337863534846384E4B794772424C4946516E414442354B5241754454776C794E49617736616A64424A4A666756412D452D44584B764175335F475138364C766F6956655F6162614F796C3557455851736F565651614964593034574968716975347877637A4A416D742D4E666F4E614174744545504E666D30705856592D4F2D6166337855425F394D684F4B494943693154676A654B50362D4563664D4C764F42615173344638677A6D4D795A4A703242733030544D5764415846625845654B746F6A2D74336963635142474F50444B3970584842464F545937676A673230456A58656C6D7033564E6E3668463945686F764F6842465A544F6446383536364C51635062663746546E734938324E646C7A643062516D59424F5F6E5F4A33585935614B32384A633852553742374E4A7A4C7A59336D3533395F5054497A5570386132755068734B73435934707251504B4D7A61727256347736534559444C7A43535F6C32614236376E594939426D45376D6F3370535656393630626B54565774687856337269424576374A7A44416A2D7942326F55566D3048447A62364C437A4B5736454E6C6E545838656A57536D75624A64616B4C504C467937766848432D36366D6B77655F33597A43395F556E4236426B58614E323679434F734D30766574647866637A464235446776443557716838423350666F75784E4B67466B334C5557484E7A72547649396333566A4D7542785163534F672E2E);
INSERT INTO `sma_sessions` VALUES ('6b1f1077cce605bb181bcd8dc1e5e67e11cf467f', '168.90.88.70', 1464188533, 0x616E77452D636A414F4871664D684A47655838586543483467694A664632525656544C6F45544F5443766E634F68714C576F343177544245355447363137693878466571784A72494B7A4331546F5A7832557279444D596B3956714B676C59484E75556B51577446644445745776576F5155796B5A347A5553477053736356382D53503954654B4956463747373368766C48773273515850335169797561346A75564C38326458563732594871713770394F4E5F6957315A587A73714F733464504A59617431564E6B4230696574354D4B7545466B4C534332537644557156396A38434B6B434F6C5759505A366C34356D43704C62324B384B536655307663766F5556706F65353174325A516465396F6C73795241555A4542676E6447624D774D6547445F545467556B7357506F6746444378737331463655356C7A7248483368726F533354333974513261325857767631755F305358494447714B2D6D795533775866446C7868737A79365567522D6168336F67596C567367747141537042376637647A563659757742503635624A79783171385376306576667652703932596E2D32694C335078377131547A6B7266762D6D4B4C524D455F436C4F36656F3168455330594C4D44553468326C7867492D626E446B7169616F3768524869416C3145774A775F713530307A6B6C574679487A77786F4C774A62396D315678756E395F55554554586A527876613838477869517646564853665A4B4A5F32555265545450706E69694B6F5856533959354F6F694D495F5A686F356E3879644975447962704E5457364A6864424E77757367726942596C564C2D6F632D737937577A76466D496B30372D4B62436273652D76564A5256797A6947396E775538785F463057764D465A397552696847756F745645517852672E2E);
INSERT INTO `sma_sessions` VALUES ('6e20800bc23e1013018fabeb305e5935d2e46dd3', '177.70.142.40', 1463780352, 0x6A59414F544F6E6D3134676A7672783370365F515F704170664479526D767A367357584B424879745F7735656164636D4C32717961577A75626D725939376833445A636C476C5A694D70756274485A48534162427936456771454E7569324B4E5561424B6A4F4952424C355163664A4E35544876536B4453455A614D446F79626E454F495F4E7075696E56755F65687838457273327372502D45365265497472767376784D6B5F6533654F623358367842724C6937795F5F46736F387073634F6E66515454692D6248343868347241394C74494D2D6B6D437A536D516D39625275594D6169745971366A6254424236684773343342315174524239382D526C305469695A5A735F4349736168767672374556686F4F4E54766B795856484968504F4A71626C47434C6D69715A756C48467551745F75554D566D35646659383536666361456352312D687A35617963363131385354794832522D6B734C486B4958383548747338544C4A4B4568436C687451696D424838796F4830614B45564C4168543137504D633871457069583372335F42716B57422D4735684245367863433641496A776A3549737A592D6432317454434A6266724D4135455764786C7655666D5F5036594452676E73775335524E4139517856574A75657A5A5A5F644A4A71513441374D72415A3279585361686452306266696864546D7272537A797669325262612D6D65687039336E576477777A6550665F44476C44555553385866363046635938347533686C67516B625F516272637546305137795376525970466A52765737617968476478324451364276525067726D5F4C2D7549475462636C464A6D3873574B377333356751487062756478424D4B666A535770344E7545694D3230427045355A43624C55726D4E5F545F5A584B3836415133794430786F6F6F65642D684F7046785242474232495347594634637062716D634A6547546E7678635951706C74366669495F5435545A3173526E4530512E2E);
INSERT INTO `sma_sessions` VALUES ('732d3b539238328ecff2b78891414cd9d7cac444', '168.90.88.70', 1464188476, 0x79497958396951744C35476E725142424552663730354A663732524F7157564E7047526D76433250576B68666765425F5F32324D386E505F5A4A2D44497178484E7A574966644F336E3950787248574B5954726F3769333142502D6D7053493270767A32566962516466454A6C6B36715F336232615A4E566E565962315F456C494557374C52364335743048783055445444376955587069466E445366323842573956566249647A61394E4F43445F536977544D375F7753616552362D6D635F4B687046544A693845464759437648396D756A6D47554C654D4D3072655F553938753151643664624A5631484145563668756A6A7153765569632D3448736D344D58655A4B35475455706D32314669756C70516375764A6A6E536C4A45394931785F6D3852544A37646E6D6F52374170484247664675526551717161383467753550494E5F6B50757659715F653168744954326D3170486F5639496563522D6B503269754D4F484C375A6A4553425F72626F72487071376873736642556B4F6444656F5550587A316F6170334363346F5278796773556D7777777552633164506143386774726B417A34645572676F5646592D6C774C306C6E67684E4C70533354434B34633042455153414E5264314F4A4E58385561664A4637455F61654758427047743458653774776D5945306C68527833436D316E496273374D554E425F2D796539757A646B6764687132386543636D556C394B6E6943633777796A56616D696A47436D73447664774F70484F76386E6D5774516E68373061694B4379347664696836547A7859514B737362334246476B2D3161355A4A564D4F6A4733473650426B303072695332412E);
INSERT INTO `sma_sessions` VALUES ('74c497f7ac4808d1950987e86b40f24a20364298', '177.70.142.40', 1463774406, 0x4D47717557526B5A4D6F636F4A736A61754F32777549687445577655533479495A61306858332D677363523958714B4948674975567370685534564A32446C57517A73693635446C4C7153356871314246716238493430666C5A754947346F615A57764D326866364931677132314F624A445872423138337570526A554C694F4F62654E6462654679476B7948425439446561536D7638447430777A3932714A4D6334444C7575642D31706A394662586E4E4171526151504A3648796C3868484C7232686E7471347942575F7474487250656B4E4B786247676F377458355348493942383467537A354733412D427331523733376364357766326A7470696C54744A4358504846364450614B37566F307453336C546676647A786F4B6B61466251434E522D463646525F38553877566147676E39537642574F777144546B64483567327362495643424854305258796739674F4B797932526E306636586F4F4F75526D39485F70554A52695A637445517A763375592D4B593847503461394B613253304F3932484B7151585F63614779326838764D354F4C3946736970676A71326C775762674F4946466F4A436579323834394D6D415575494A614A7265516E554F55384A7A69565742686244335878685056634239325A337A484753797370346C734B336E78416B4B375A59522D3152496F6C414344786F4865714C76725370756767576342484F6C5561444E783063355564686777396770312D6D5F794F6D47315156633276634A5865364E6B6B474566704E49474D31314E5965734351733562614347644232574339712D506970686E6A386C6F67466641314A4336577A414E7730656E7432686C6A785A5744694C43753672726C5849615932636861493444786C5752453052472D512D56427A4F3258793154674A355148694D47726E6F356A6A564D36766647752D6C5445316541364F68686B797A57566F684678494C425F75474A4E4B7151635147456C377A75672D772E2E);
INSERT INTO `sma_sessions` VALUES ('788b148809d75ccb08361045f447bb07b4a292cc', '::1', 1469838880, 0x5F5F63695F6C6173745F726567656E65726174657C693A313436393833383838303B7265717565737465645F706167657C733A303A22223B);
INSERT INTO `sma_sessions` VALUES ('7952de808613bfaa8d05579ac4cf150f06dffff5', '168.90.88.70', 1464180118, 0x62764359667158584E48733368375F396446366237573169475568466364653235426A736C6869696744667241436235616E5A4E37355873314F6D45536B576C486F723557646F706C6D613263526B456C51594E574255624A6455524178505A7A596E474F6341657037524D4A6F445A3266365854504E642D70534D786A5A5F673875547075555072785753762D753262617859574469345F744B3741326D6C42514969774A3771616C37537032526A5079614A6B35694C6571587737396F64705A6A746F4155615F4675384767355243526F4C634D4935517048376E3266713349352D30634F515854506F67346C696F78434145527473457369436963302D6F54544A343978754E3842567757735532623031564A4D58356F776D4334665A724144446555443875456B694E377A4372687A524C6F587A71366A756A6C32513863474C4C47426347777A70305157696E736F4B34617854537A6B35664F61485A713969774A39766364544C7A38515758334533327766423536373532716C716B4F624C7174456B55356B694B5877664C353663625F52454A6F71555A755539504E68706845572D4E55325676784E70694F78434C547134566131513950745332354E67613734424F62797976464F4B506E5F4B594955417A583438304A70554137574B44706D645851764F4964716E43724E5759494C6936454B517A54553045624267746A7930715A646E73586B537047346D6E42416C5370546455656E6E5F54694246575730674D684C326E6E746E4B6E484A5F71595F37665A6B486533444F61322D6767314B77795130363836644E4C326C766332746A356B6F346A30755042666C4F346E3761512E);
INSERT INTO `sma_sessions` VALUES ('796161bc0c4f627b5373baf7638f345e3615869c', '::1', 1469729029, 0x5F5F63695F6C6173745F726567656E65726174657C693A313436393732383733373B6964656E746974797C733A32353A226D656761636F6D73697374656D617340676D61696C2E636F6D223B757365726E616D657C733A353A2261646D696E223B656D61696C7C733A32353A226D656761636F6D73697374656D617340676D61696C2E636F6D223B757365725F69647C733A313A2231223B6F6C645F6C6173745F6C6F67696E7C733A31303A2231343634323834343831223B6C6173745F69707C733A31333A223138372E36322E3135392E3636223B6176617461727C4E3B67656E6465727C733A343A226D616C65223B67726F75705F69647C733A313A2231223B77617265686F7573655F69647C4E3B766965775F72696768747C733A313A2230223B656469745F72696768747C733A313A2230223B616C6C6F775F646973636F756E747C733A313A2230223B62696C6C65725F69647C4E3B636F6D70616E795F69647C4E3B73686F775F636F73747C733A313A2230223B73686F775F70726963657C733A313A2230223B6C6173745F61637469766974797C693A313436393732383836313B72656769737465725F69647C733A313A2232223B636173685F696E5F68616E647C733A373A2231302E30303030223B72656769737465725F6F70656E5F74696D657C733A31393A22323031362D30352D32302031343A30383A3534223B);
INSERT INTO `sma_sessions` VALUES ('7b044b016814318d8e0d3159112b07a9158c9742', '::1', 1469732030, 0x5F5F63695F6C6173745F726567656E65726174657C693A313436393733313836353B6964656E746974797C733A363A226A756E696F72223B757365726E616D657C733A363A226A756E696F72223B656D61696C7C733A31353A2261646D696E4061646D696E2E636F6D223B757365725F69647C733A313A2232223B6F6C645F6C6173745F6C6F67696E7C733A31303A2231343639373238393831223B6C6173745F69707C4E3B6176617461727C4E3B67656E6465727C733A343A226D616C65223B67726F75705F69647C733A313A2231223B77617265686F7573655F69647C733A313A2230223B766965775F72696768747C733A313A2231223B656469745F72696768747C733A313A2230223B616C6C6F775F646973636F756E747C733A313A2230223B62696C6C65725F69647C733A313A2230223B636F6D70616E795F69647C4E3B73686F775F636F73747C733A313A2230223B73686F775F70726963657C733A313A2230223B6C6173745F61637469766974797C693A313436393733313937313B72656769737465725F69647C733A313A2233223B636173685F696E5F68616E647C733A373A2232302E30303030223B72656769737465725F6F70656E5F74696D657C733A31393A22323031362D30372D32382031353A31333A3538223B757365725F637372667C733A32303A224D4861665534474576575135526B53646870494A223B);
INSERT INTO `sma_sessions` VALUES ('7kpfllc7vop1hq0pagskrb9g0v', '::1', 1647191993, 0x5F5F63695F6C6173745F726567656E65726174657C693A313634373139313939333B);
INSERT INTO `sma_sessions` VALUES ('8103aa3f900535bdd4dee3cb1fcf4854eaa6e25d', '177.70.142.40', 1463772024, 0x5A65374244504768535F7030446C7458546D6E72416C4D6454796D43566A7163494F7052615A796769595F464674764E50797050314666657476566E4B744A385055364C423933725F337A6432445A3878306668364D51334D392D4A725476464C6C55704974476B6A4A4D6E496557467873676A5342436370532D6A7A7354707837414D394A55364350445A413237706D5F347939464F726D57724F79727345334C33433655584C5951774E3755453073393648665938644C79564E3152366F6135753157466E63584D6C4E666E6B78444D75547477397439594730695835373673564F4867653038314A6F6A65564554746F484C456238644E6171467777396A737838385933393265704654747A564A4631584252333856376B7666566C616570736F646A762D6C316A62336E722D44353776417A56674C4E6A485437544B7472645272413476566A454F345351754E6572564A47424157387749624447457958634C6A424946513846314A4E566F4761744F76715A6B58576944696E556F3430486D4B6E7938747076746B75344539574142376542646C47674C374A6F31376D4C776243387A304242717153754B4F33446D7766494441535A4C72644A3954625578715A78457678456B6867593736557630666F54756E457757447A376379572D457247436A4F723568737648565135676F68476D593976397335706A79462D4C756D454377744F73427964574F486B47516673726651754676316E514439536D704858657A4D5577637230777034505662345452743834475162313034793745645275473647715F5F6B4D6C4A5F7A416E49544E4E2D7170435532324931674C524F727730683737656F7A6757594D6B41616863447353397077526D51437259787A66564C706F6165646455395F38384C7664736F6542787654306451546735773233336D734B62704F666B54485330384C416F72516939474C6A586A756E526C426A5A4F4D736C58794369483146304C5F772E2E);
INSERT INTO `sma_sessions` VALUES ('860f9d11b3f97f0c5654c65de556e9d072dddd48', '177.70.142.40', 1463771772, 0x7638656F396B4432435162433331426F3064434A33476E537561306F552D35664B764D50685378496E3543734146486858563031527947414F326B7174344C7A516F4B626832654A396C466F5837627437665A667A685734766E6C314B617172567735346B37463559396F34497174436E61797A7744496332577739515742395A423056664E7151596775537047624764514B56454C33717052655931776D6334494A594E67314269324366453476306950355366785A715939513949536E5F78436D7A646663784363315955614C37666D4F4C38484D63554B624C47686C676737703479692D584C7332527333582D7434574275625973636F68427A764C7230497A7A57455259576C70366D796737586B4934475A6763354677576C58534B316F517A4C696D324A416A514C59514468726F4E6D41323250475F6F6148736141535865496539766649686A426569376A4E6739724243546A52446E7652696B69694C674A66493866517143454958344F77325A4253726150665267495A6B677A6B346C4B536F32426C6758327A4D66724D6743746D4C71464E7630693242505A76456C6B7956687A2D5A745244736D3142774369534548556C69435F2D486A42336250466E433649335235616F73334374636E6270724F49787577704D346F6943536246583665654137584B523937633232734458744857492D49484F31455A714A37614746335A6F44346F50722D5F76794A4B5F6B644F654A42704F4C574C385A446133624E4468697050483348437238676A6277567A4A6950715847304E6438706838506872494F7253762D4139503673393462344D72525A574C36374A65425F59384B346F666F7045514C67726B77375A364552626472395F54686D5F364D757A54547A5A643244424368644E79455A63745575646768625750624B456C464B674D457265464D766B5A4B54646A674A6F7341784B337A6763644143496F4C6B4E495048705656435A354B48526C592D33672E2E);
INSERT INTO `sma_sessions` VALUES ('86m2miq1ufj9ntmbdu4eaphop0', '::1', 1647191433, 0x5F5F63695F6C6173745F726567656E65726174657C693A313634373139313433333B);
INSERT INTO `sma_sessions` VALUES ('8df88aa345ff45fc8cce99186820f77d94ee022b', '187.62.159.66', 1464284484, 0x61644335686E4D394B62394F5341304E4F6C377058363438773734426C7679765954473256753875616A6D535066594B424A65646659446B4354475F36575A4B6B3370497A6C5937776639787652726856754563535263483233545F484E544366645A42776F7A6879364446746948366D383642737742595F6D42443848614932647377694B385F4B4D4C3755447039555069595F48353541346F3433417833334D7559324A4C3668666555673964724752376B48706F4379774149384F33356A4D6F6B6554582D736D61474D5574644273507947664B464C714F59704D367A793074754D4D55317851646F6D6761425A41397775343934624D4637473637655A4F73444A713367706A5A7331443866455A526F4A6138554943394B75725132554350705F704B4D375A59686D48613337363465794E6664455F6678445A4B4D546F6677546679653878455364765554636A2D3375344F5245634A6E51755A794C4B3030665A7A584F4D4E7673666F557867504D54773359546F47384C774F54757A6637327A5845684451655449504953392D714C6C576D684C4478554F325658504D4365576D377272703677596C676D696A63786F6A51776673416B61415073456E41646442324D5242593959346D35387A43656367444D6C6E2D466D654175322D67563935584464432D4E5531534949566B3448566133746B47654366446D45526D70306E4A63394956664D34666F77596F774B53654E32453645624751306B36344F573137527450574F346E7655785F6D507A4D6141463170534F38466A786B4946536C723950564265377959787A3543434A757A48527657476B4D38593758537655665871534157463131743974364D4F5A306F3043367544714F30517432505F62787962453074366430532D65764C7535566547737A7A45593374666C36656D44534C796A4F74745231444A78547A2D7548484462655A45614D47);
INSERT INTO `sma_sessions` VALUES ('8fa4d9fb59845f4c46fa95ff999bbf15db7139ee', '::1', 1469736099, 0x5F5F63695F6C6173745F726567656E65726174657C693A313436393733353739323B6964656E746974797C733A363A226A756E696F72223B757365726E616D657C733A363A226A756E696F72223B656D61696C7C733A31353A2261646D696E4061646D696E2E636F6D223B757365725F69647C733A313A2232223B6F6C645F6C6173745F6C6F67696E7C733A31303A2231343639373239333236223B6C6173745F69707C733A333A223A3A31223B6176617461727C4E3B67656E6465727C733A343A226D616C65223B67726F75705F69647C733A313A2231223B77617265686F7573655F69647C733A313A2230223B766965775F72696768747C733A313A2231223B656469745F72696768747C733A313A2230223B616C6C6F775F646973636F756E747C733A313A2230223B62696C6C65725F69647C733A313A2230223B636F6D70616E795F69647C4E3B73686F775F636F73747C733A313A2230223B73686F775F70726963657C733A313A2230223B6C6173745F61637469766974797C693A313436393733363032343B72656769737465725F69647C733A313A2233223B636173685F696E5F68616E647C733A373A2232302E30303030223B72656769737465725F6F70656E5F74696D657C733A31393A22323031362D30372D32382031353A31333A3538223B757365725F637372667C733A32303A226F626E4634547A697078633944375042454C6D38223B);
INSERT INTO `sma_sessions` VALUES ('8ktohein92eouo7gu2kjm0rmn3', '::1', 1647191979, 0x5F5F63695F6C6173745F726567656E65726174657C693A313634373139313937393B7265717565737465645F706167657C733A303A22223B);
INSERT INTO `sma_sessions` VALUES ('9016ccca24447dbcf74beb68d43080775792b4fd', '::1', 1469736337, 0x5F5F63695F6C6173745F726567656E65726174657C693A313436393733363132373B6964656E746974797C733A363A226A756E696F72223B757365726E616D657C733A363A226A756E696F72223B656D61696C7C733A31353A2261646D696E4061646D696E2E636F6D223B757365725F69647C733A313A2232223B6F6C645F6C6173745F6C6F67696E7C733A31303A2231343639373239333236223B6C6173745F69707C733A333A223A3A31223B6176617461727C4E3B67656E6465727C733A343A226D616C65223B67726F75705F69647C733A313A2231223B77617265686F7573655F69647C733A313A2230223B766965775F72696768747C733A313A2231223B656469745F72696768747C733A313A2230223B616C6C6F775F646973636F756E747C733A313A2230223B62696C6C65725F69647C733A313A2230223B636F6D70616E795F69647C4E3B73686F775F636F73747C733A313A2230223B73686F775F70726963657C733A313A2230223B6C6173745F61637469766974797C693A313436393733363232313B72656769737465725F69647C733A313A2233223B636173685F696E5F68616E647C733A373A2232302E30303030223B72656769737465725F6F70656E5F74696D657C733A31393A22323031362D30372D32382031353A31333A3538223B757365725F637372667C733A32303A226F626E4634547A697078633944375042454C6D38223B6572726F727C733A31363A226C616E6775616765207820666F756E64223B5F5F63695F766172737C613A313A7B733A353A226572726F72223B733A333A226F6C64223B7D);
INSERT INTO `sma_sessions` VALUES ('914vjpsf1emace98urt1cdmsqg', '::1', 1647191433, 0x5F5F63695F6C6173745F726567656E65726174657C693A313634373139313433323B6964656E746974797C733A363A226A756E696F72223B757365726E616D657C733A363A226A756E696F72223B656D61696C7C733A31353A2261646D696E4061646D696E2E636F6D223B757365725F69647C733A313A2232223B6F6C645F6C6173745F6C6F67696E7C733A31303A2231343639393130333733223B6C6173745F69707C733A333A223A3A31223B6176617461727C4E3B67656E6465727C733A343A226D616C65223B67726F75705F69647C733A313A2231223B77617265686F7573655F69647C733A313A2230223B766965775F72696768747C733A313A2231223B656469745F72696768747C733A313A2230223B616C6C6F775F646973636F756E747C733A313A2230223B62696C6C65725F69647C733A313A2230223B636F6D70616E795F69647C4E3B73686F775F636F73747C733A313A2230223B73686F775F70726963657C733A313A2230223B6D6573736167657C733A33373A223C703E566F63C3AA20736520636F6E6563746F7520636F6D207375636573736F2E3C2F703E223B5F5F63695F766172737C613A313A7B733A373A226D657373616765223B733A333A226E6577223B7D);
INSERT INTO `sma_sessions` VALUES ('922b2f83e0da40dc393650acbb6a6d87d9cd30d0', '177.70.142.40', 1463765148, 0x6E44544B505653765A6B496373576C79766364346A5635514B6E7A503034434B4F44787547775467414B77514E49584B3473664366574F6A456D743233655674526B6D7A344868795A5A3664743461426D65564C7573317165386E7277574169736166656941614C726B332D365338784844706B746B5576683178313452484939745A4568616D6E566B3641766A50744735327A627176335564724A654E6A7056507745596B766C73316B41736E7136304E493775687450526F64455464474C303169394E7A4D55435662725742435A71432D74577A425975344B6A554C3058326D347874334A59484D637A6D493347306F384D5F6A6C446B332D476B6B425A6554325F7335353572757776633277373149333463326A6273784A6C4D39547537774A5349556E6D494B584A5136773744343541754B4F6937676C66516E394264665A624A73676947746C6B4D334D4F3359334C326E73745A6B6E465A5333686B6A3136354D2D33556D445F6B504844484B563433654250646B616F4F756D414F4B48643845547056393366766D593557576379504850676277364C5163526A706A57486D5A654F79456B4138307048504B4D7A69656275704731705179557132762D477034594A624F78584659334871506A4E6E79763762374F375A7953347564515236367230554E6358524A6B584E376B6569774C6169755A7059647A496D37644A3561393869696D63344A7370616D4C4D73524A73696171634B696B575F384654636E59744F494F43733065703131323970343579766C5F5A3764305347446F5230587773557855622D79777037644742596732692D78685A41736C3850494D77384C4159415A323041346F4E696F4E4959597130496C42394350565F5752476C6F61682D61674467593573484B496E48514F6E634D694F423867785362797A4B4172655A736C44664D6F765847526C684A72377563355A4D394635767854714C32544541594D447573445F58445A77574173485F626F45756C6D6B77555564636D6F774359363968785548743339576E43613338537846704538626938766B584843306E495874645A4D7262717838754F506749796B6D6D516530734D53694A54632D454136592E);
INSERT INTO `sma_sessions` VALUES ('998279b5d9ebdbecaa52786fffa7bb53e7fc87ed', '::1', 1469732354, 0x5F5F63695F6C6173745F726567656E65726174657C693A313436393733323335343B6964656E746974797C733A363A226A756E696F72223B757365726E616D657C733A363A226A756E696F72223B656D61696C7C733A31353A2261646D696E4061646D696E2E636F6D223B757365725F69647C733A313A2232223B6F6C645F6C6173745F6C6F67696E7C733A31303A2231343639373238393831223B6C6173745F69707C4E3B6176617461727C4E3B67656E6465727C733A343A226D616C65223B67726F75705F69647C733A313A2231223B77617265686F7573655F69647C733A313A2230223B766965775F72696768747C733A313A2231223B656469745F72696768747C733A313A2230223B616C6C6F775F646973636F756E747C733A313A2230223B62696C6C65725F69647C733A313A2230223B636F6D70616E795F69647C4E3B73686F775F636F73747C733A313A2230223B73686F775F70726963657C733A313A2230223B6C6173745F61637469766974797C693A313436393733313937313B72656769737465725F69647C733A313A2233223B636173685F696E5F68616E647C733A373A2232302E30303030223B72656769737465725F6F70656E5F74696D657C733A31393A22323031362D30372D32382031353A31333A3538223B757365725F637372667C733A32303A224D4861665534474576575135526B53646870494A223B);
INSERT INTO `sma_sessions` VALUES ('99c706a2c212c9af443f579491f7586cdb1f9f45', '168.90.88.70', 1464179591, 0x7264716A6A6B50316F3346626D754A56613079466B425936472D5A466D436170494D4B356E4B51496A557851413431565439316430733850594B2D55724E3664423962503561516C5063667A59366A6D61715557462D59736A7869716A4F54335667335839557035516C6F55664E4B436A4D6A6D647343693370394765573375614C596630377566425A6E4A4269785F684D61746645594A70303671784C3953574C374A4D786477736C5A633048586F67366639326478324F7967316273524C44784551423073757566635971347A74464F7451465A7755472D33766E7669724A4C5176425A6C41376939455063537643477A674862563372503079366A654B3037715F6F6B5066747549576778464363425870655173374C506A6572714D47756164356F636C4A64513378484C75307958366D37774D5170316E53504D663676506446546A68746265723547534F6E425952395A612D582D5349684E734A726F47573565667A6D325F43776E576A44546F772D69567A79343850652D684E59653754526E5636464E37496664506630535A69795A784C7255546354766F445841663770367563376A4F5348763778735A456E6766736C30736462773762613643674E686853476F476E544C772D39355F456E5865567939433476663556617A61792D57374A4E48763476644B766C4862686C2D354C4534634756573046566D50363047417773736C39583039354476434E443130787871726F79616B556558716D5734756F74436873766575784D4B5847524D387030306653333172396361);
INSERT INTO `sma_sessions` VALUES ('9a410a7953ace5b066b807f0000050e92409aa84', '177.70.142.40', 1463764922, 0x71395843467350724A51416A53482D3752744671784B505F49684D3932515964655F4D33587A7437394B53485F6A346131583167434E68425231416A35674270686E4274566C3369646E6B724F42447741784B61784D347A5F4D2D69434C59354C324538342D6C437748344B494357535357334A7A3679696162764972524F484C537370772D336B5F7537333939547868794B556A484B62563872783342394D7970715368715137415945666F666B4F563842444D567738713154727235596432594A2D6364387A58434D4D6674525F7133485A37594C67645F383866627A5A6F4C4B6C395935794B494B4B4659705354424A4E734E3079646172453132446A6F71675A474871742D7443703963316E4148506C6B4A43686C6A4B63703046756E41684E6475624A414E7735626F5554386C3841443241734C4E663563794A4F6B4633414C775F4C4C644A4569786B723330386F6F2D456D796E5733317A76665A594B54614F707A4473356C6B6257644F6C597A546A354C4F45376736517668672D6739676E59426C50394D614B52586D4A6E636E6A745151344D4E426F484A4B736265735A7A6E2D497936335A5438444556364C75456E7A6D484C6B75726C4A6374446D6D6E61307433395668474F73446B4C2D39436A436D734333696B6D3066624E3875795777434B394A30344B5A446E636D53364447336F45343764446A4A51306756434F525237416F2D66377044316757457469444D50565A30794453564F61752D565A713265726F54366937705341445758397642614C3531746F77796A3737725669426C4D366458484942306F4F6C5933772D6E6E596B352D654F78736F6F6E384E5845582D656C51726C5577597953397A4F7848483068414E716857675862626A635261634559436C384B7343647A30494661364F686732455471616E3552335161766A506F4B6D5F69783633755F58523648586E34625F6F54547463565F566A4B7572575A393975356D366154672E2E);
INSERT INTO `sma_sessions` VALUES ('9fa7dbbba0c30003753cca827dad2bbd367cf5c4', '177.70.142.40', 1463765952, 0x576546316B31554C685769464656484138385262623138506B304F6E64505F4D43437557434D42556B475F643037706D35794A6931756C3750627775667176335A4253544155573866314F584F6F566E53356346322D423371306D67634736766D586C386A334D386A5A7850646A6E51727A39684253717A46506279677443455831766E313663785A53345077387A6C4C6743726D49306E69506F6D4E6863466B4E6E5F30764E335F5543324151565237786E6965356E7530674C41754679592D643368595443684C43705562545A697348737351326C56777745593046356744735949615844414B63557332416B634A697179542D576E427976316A6B3174343834335F3138375065383257615750387A4F5635385655766A503673454D76596D535467734734626379686D533151652D6E70724F454B455A41744644685066326B655F746D42586A4E434E7062376355576279306979655A756E6777574879466E366F6156666A41784839653670586F316E2D6867674D46694F6F6176573842355750706651475841774174657A5262785366656772514572375572785851346A6A78534D3936724E6765773766584B7545716E4E7433516273357A365374546E72553739756F765932524A3268796E79627A596B7176756367616F464B556B6F7443573536506D72553348736E4B6D69476F57786B36307A6334775F455664494B2D5231614D6B79593953564A303471316732717941374138544F3166635062662D4D7230626D6E6D3565347476667A337649504E755341506C6A6D67574D7A50574C48694D634C65474F4E4B7964394B386C454D464F796E783435657A394F5A3369597A70305865757935355A5472794675666E307936745A6431393770354C4F6E675464662D61796D524B5472556A57487946467950334F783566536F526A536F676D2D556B3458797A61656C5A73764353666374706679703559453141794D6E536531495852306C3948504D5276794F79684E54746D594E6556487A55444A634273394C5A686D745942366D5164764D2D34365A6948505A2D697A516E4C722D746961626F39554B565F4A4D794D795634335F435F5A47346A49674465783434564C4C31732E);
INSERT INTO `sma_sessions` VALUES ('a2d6d29f79ae47a3059e7125d3c1f82fb9457c91', '168.90.88.70', 1464181850, 0x3875666675476A54346D35776E6676764431425F2D69616475637A522D6274433953456178444F5837523257454558322D71525576364548374D5474483762587357746D4A57556C72745238787A54387241745367746F47765443425347596E3934376F706865326A4475775A2D56586A41616A536B6168333249534A6C53427A74416F5466544B75596D6839755A75367369494C627756684135724D3252715F4F305239417745363148684A5474444F7357616F2D7731325F38304A424B2D57654149467359353059564F5A4670324B4E50554C35666F4239445556387430535662704E732D6F465961305A535377696F3331387875622D42726A544258584B64303669755F5A485A35726538356B5330624375646F62466E45634A6868484D792D6735486A70735871357570377567666D6A774141534D647954464459424A5158756E655562624E464B50613673646B4C51364856682D34435033326E594339336E6F377668426E4B5136766C324A324936316F6730696870533058452D4A4B6B45453853575970565532333361794F546962544771794D6A585A2D64754E393171516C643179616658555363594579547450432D5A3238504A6772654D795A78716C4C4E6D4E704B344A787170386E746A655838687A41452D6E4157766E45374C68515731436B75305A4A377359385838456953693061714530565564457150586536425A573844566631416F5444365F6A6D564B737A5A3664327361617444585563596B6344746D5A3657626D7062423761624B72497039584145696C6D777535634E456647786A69794F563250472D5A696F7271477763665F696E68756E4E763653445261452E);
INSERT INTO `sma_sessions` VALUES ('a48fe8bee908f7bc250c51e8d5b453c6bac7018d', '177.70.142.40', 1463775794, 0x58706551764B61346D666277763678664636326C4665716870546858514467796D6672466B5752705779503237574B4162364956513550326334735F367A61587132786E726F58795A526A636152336656597530652D397562374E396951764B54306B55665355656B65434D7A6B75772D4B30544870347A6C515973453553796C6530695A765A2D653544734F556144494B4E324458796E433432486357666F4D4672444C31736F6F4A554255624E6F6B5948663177366F397A4850487644742D4331414C6A5F46305134327157497647573130657A55354B506B6164453358417576774B456B5070677378597637444142523438774C644751675F464E735263543736356B5637695767425547314346715F7476467134324B65336A506C3362667A454F512D476D5F446E4D32787A493650794337674A4233766D68656B485F7433724B3742674B716B6A2D7831715445654E342D394E4A707A39714A485548444F344D585A4757715A4F72633639636A755A3454375944426978685376374F4E345063323346717138634A485F742D53764E543572345631636239787470637945303666745658476B53327865553674535F57435039704E6C6F65627267416D7152704147496C59642D75784374316D6B79666A6D4F6D446D62503939336C43653665414B4E576D4E67776458644B3043344B473430335461366F61304C494B5847374C314A6D50635443794A34524156644F745249304E326C784D514E734357347845793063467563434E3739446F3865536436354251567A75485A784B6B726A584750356C79725262425377636F457A70362D457A3833724F6542695165365A79307A396F33556C66514E7167754D5646673631494F75726B6D7A38567849516B6C554D5F4573506D61622D39366F7379632D466C504D4B3975796477744A54464C5573744F5F664758664378562D4B616273446D6E5471304D4343325363343856477A444C75474D59796D4873395274772E2E);
INSERT INTO `sma_sessions` VALUES ('a6f94f46aa548aea705b30f7c87fcc450a8a4892', '::1', 1469729591, 0x5F5F63695F6C6173745F726567656E65726174657C693A313436393732393331363B6964656E746974797C733A363A226A756E696F72223B757365726E616D657C733A363A226A756E696F72223B656D61696C7C733A31353A2261646D696E4061646D696E2E636F6D223B757365725F69647C733A313A2232223B6F6C645F6C6173745F6C6F67696E7C733A31303A2231343639373238393831223B6C6173745F69707C4E3B6176617461727C4E3B67656E6465727C733A343A226D616C65223B67726F75705F69647C733A313A2231223B77617265686F7573655F69647C733A313A2230223B766965775F72696768747C733A313A2231223B656469745F72696768747C733A313A2230223B616C6C6F775F646973636F756E747C733A313A2230223B62696C6C65725F69647C733A313A2230223B636F6D70616E795F69647C4E3B73686F775F636F73747C733A313A2230223B73686F775F70726963657C733A313A2230223B6C6173745F61637469766974797C693A313436393732393539313B6572726F727C733A3130393A224F20736575204361697861206EC3A36F20657374C3A12061626572746F2E204469676974652061207175616E7469646164652064652064696E686569726F2071756520766F63C3AA2074656D206E6F206361697861206520636C6971756520656D204162726972204361697861223B5F5F63695F766172737C613A313A7B733A353A226572726F72223B733A333A226F6C64223B7D);
INSERT INTO `sma_sessions` VALUES ('a79ff85a14b54868e8dcb7da7f3ea7e562b39bcf', '168.90.88.70', 1464186932, 0x726A673353425138666350655F6D397061433252735654794F36523955396B374D5F365A5244444B585A7662576C4375777355635533733053764B347661436A4F594346787070476D674C43484B6476656B795770522D4F46534335656D66644D72354951774A3436316A6852384C6945703052546E384F6771786C49502D374C7A6B4D4B643430365F5179425A48435678466136426779624D3858776356556473646950765177764365737532435F53686E4C74446B494345447149674F58);
INSERT INTO `sma_sessions` VALUES ('a7b68b9287a4951e5425ec349d690eed2e875702', '::1', 1469731866, 0x5F5F63695F6C6173745F726567656E65726174657C693A313436393733313534333B6964656E746974797C733A363A226A756E696F72223B757365726E616D657C733A363A226A756E696F72223B656D61696C7C733A31353A2261646D696E4061646D696E2E636F6D223B757365725F69647C733A313A2232223B6F6C645F6C6173745F6C6F67696E7C733A31303A2231343639373238393831223B6C6173745F69707C4E3B6176617461727C4E3B67656E6465727C733A343A226D616C65223B67726F75705F69647C733A313A2231223B77617265686F7573655F69647C733A313A2230223B766965775F72696768747C733A313A2231223B656469745F72696768747C733A313A2230223B616C6C6F775F646973636F756E747C733A313A2230223B62696C6C65725F69647C733A313A2230223B636F6D70616E795F69647C4E3B73686F775F636F73747C733A313A2230223B73686F775F70726963657C733A313A2230223B6C6173745F61637469766974797C693A313436393733313836363B72656769737465725F69647C733A313A2233223B636173685F696E5F68616E647C733A373A2232302E30303030223B72656769737465725F6F70656E5F74696D657C733A31393A22323031362D30372D32382031353A31333A3538223B757365725F637372667C733A32303A224D4861665534474576575135526B53646870494A223B);
INSERT INTO `sma_sessions` VALUES ('a813cd235a15636ea5ddd41b68ebcb122020331d', '177.70.142.40', 1463770516, 0x4A627749645F5A3773425F514341376B5A5131586A32742D4144466754524569723336485259473662524A464C57346D4861735F5050337341634C6D59636C75686176474C4B36654B58594B4A45516871756D33505268774950784571714973454243704B4D71376E784C506550613067796E386E4F366D477964554D796A656A7266697239502D385447757139454C52445742414E32584E794D712D497A513147463641456679525F4F5F45557A5A2D6D4D74382D63343559364A424D4C416D4D55566334525150713075597847447A357777686E536D71537A577A776243726F50747A4F775245647A446C553132384930436364464742543749346D515154763075484F5970396972364A6377775F6B4236336A7930755738327479316C6C4655687971727A36737645706471433656484D7A635377616B583551354E354E46544375465979566A756C6B7136613353626B385F4B65346759436E4948737A6357635031654E78413646514A50746F58337472567A2D59645A693058666471766E53724D4D3468797979635852706B44623272414F4258765A556B484150456A3949415F37525142757674717A5A615F61646334617848466D33763163576F7247484652686B71566E3755656C3646314A4951354A336F506F793144484E645037364277627369645177423041524B755771754530636E465235484D704B4B61516B7649547471533435524757574F587764466F3137734141694F75324339754474524D396E353350315936494A337A2D646D304578756C507979757A57613065786448365333664338696D76616A367333347161345931534A437A6F435444336164767064783039665237554C74764354374A516655646E416F4B394867776F75567444777552436772544F72346E73544A51345750486B70374E412D4E614C4C4758664749784A2D6B7961496D3139366F67637859696D4B47373643366B4B6C41584A4C4C67327146775641534D4C6169672E2E);
INSERT INTO `sma_sessions` VALUES ('ac57b778305c0c920553c6577dec14ae057eab9d', '177.70.142.40', 1463773280, 0x59766A7939476352785A664A306B446F745F354F35475978356D315347544C507076526439543079795555627A796341745971337648346B4253483154734449396C56774A46327645626F36325F416F425546557548477956595277593466715A3567354F35344857644653746D4F65414A4E78764C7048664A7070527442723430436E4C5858554355686A4E656443516D58666F6C75783634754B664D535A6F4B6D36576C696A735033724572515059426646634D516B795734494564486D665152396B39336A384C76776D4B2D644B676E3056492D475845574A5F6D584A484557714F4655463174676C74663944456D42744858596247716C3447376256557A6C4554727251517766625F305947374C667876557670636C4A622D6C64574F5A564263766F5A3061324558366444596F32505A367A37544249366570535F66436D457736444441464C69384933526B6A71386C7A677442695158557832567631454D727844654C385F4E6D514D596F736C5661774C446A696265504A615A75353354457274587350573854664C6376595375784D443952674B69752D42467450716456666D755850705A376A6C6669535543426D58333361706E4F4A416F5F446565777174796A75735677455658503846635168574678766B62313169756E6A6B546B3436534637573443543449664251476D484442574D4A6C6B536937334F304C384F486965734C3742704F4A5675484270424D646B706D58417347426D77714C316332396C3378456B4C51586970345271567669736C51486F3034757175567A635859776E37754B4B44526F7173335F6332494B534A4634756533384C434C564B5847764E5747657938355A4937436A5147484B557359546D665854674A785754304C4666507438373645674F4E457279636D6438595835444C577762334C4F5F2D4D6E6847315F3144495F756D7A6E50485A3747434E524D75352D306A78754B78426F516547543371776F4C583564784A41574E383778724D7A5630445949673457525345545568707150384A6E64454975567767767176507230475F65646A305A7151684F757750314D77316A35796E4A3452626C4B326250466E525A36434C36717A32556B70654C6B706E733555754D4A5271726D6346577A73594D726F694C77714B47622D726C454A776E576953795F3268357A697637384A315633686E6A65514F772E);
INSERT INTO `sma_sessions` VALUES ('acc9cec07004879a5ec966ddbd468041b1f7f9ba', '177.70.142.40', 1463773526, 0x4A4F5534575136596C7948364A5A5076457459684848396C36514F592D752D436F43302D414B46656B362D442D685971426366443139466F705A6D46696557673658587776735F306F58554B52357734444848464B554934346B59612D436D736A77302D675A3537376D786D6D4B6D733568394E4744357753674E6662625435784167504B6466734545667257386D4D4F414E546130474379733573484B48506A4C57434162397A5777596D6E62775A6F6E505F7642336563485767694A513339306245416D3231466E365F617A706E6B78737751485A6C7A6B4B4E2D726B79764D35334F7243574B594B5A3635527478345152684678666364496153583547784E6A356D6252745152464D4C43324974706F5532725431464D704739396837437138564F304F71546472474C685F444F583166757A7772557A7651665F683938586D2D4C72496F464F5A64574C73685032353133454F766B6B493645315F32734D7A6873706C447472374D5650396A7A414D435568416D38576C6445754F546179533464474F714B6D633044425441774670306D556D56334C4A6E6F544B79675561445673424A4B506C4C76736D7667584237453869764C794D72644F2D74635F5849352D7966313755667175645971384B6B334D335574462D4C396B4962596341346947675A454A726F2D5A736C356B662D464D38734C3663664A41316C467864614574325F7343745A51524772496F50386F64595734706E734E49726C725557446D5138713262477544496C66437255424D48696D41674D4944496432746A5472517158686F6739596165524541556A3876764B7A354F385137654D5F694E6536394D4B77346D386B6579674D45727355434C4947724E69517971684362595A393476455966384D68576953724E70646E514F416658354242617A48524B325A714D7752354B5033417332437A3857394D755834514B536365596A3257366D397A66303833753239617663753866733547786256486447576132567574473452723872666F6F53302E);
INSERT INTO `sma_sessions` VALUES ('ae298a28ab6f3247dba24973cca00057c1f93974', '168.90.88.70', 1464187862, 0x5635675733326E3075794448757A7661687654766E633531467547763739444479476C6C6B4E535775474A7A4C2D3257507041556D6657686C535547696E6971477334356470574D576A32363951706348443962442D635A6C3552334E567774417265393638564352325873796E2D5A7A35385F536C4D65356F526C72645868744D34524459766E6C617933787A76474B38366942434D5174325A626D3855445F7565746A4C504A6F6375456C46327031433943415F74443178486959536352426135495465546A6D454F5268656C3666554F6C356D76655A3634595253554F6D315151762D674A6E536D5345637A444141565A6362686459625233434E415272437550544A3534504D5173465A364137596F656234734B6230655476643239346167797155775F315145372D6D7950554750746458363566514351356754794B6351655A46574E737973613367386C41586D726130375776646D57704659436F795A6E6238617831444D385537583342646361764E383078647A5A586D54526F7A4166316F31536634306A6C6B44523375306F5572683964565938536271616F394841635430374E46354D65524B4E644B6E48554A6C6F6F6D4A564E4C38503452414A72613169672D397053475049355A6566765047502D5A596A6B466D485A517362717431777844473872653034513861364931316C513758684A585A6D4661464142326F4C33687172714C643174794B2D717631525071345A6149332D6F6A5A48316852346B62564452797A72376E6A713176585141583958746E545474475A51774E30396964796B7059494646506C583957344E436C4E2D6D6D59625F483276314730614A57632E);
INSERT INTO `sma_sessions` VALUES ('ao0pk7vl7j3bh519133d9q3cu7', '::1', 1647191561, 0x5F5F63695F6C6173745F726567656E65726174657C693A313634373139313536303B6572726F727C733A34363A223C703E4C6F67696E2066616C686F752C20706F72206661766F722074656E7465206E6F76616D656E74653C2F703E223B5F5F63695F766172737C613A313A7B733A353A226572726F72223B733A333A226E6577223B7D);
INSERT INTO `sma_sessions` VALUES ('b13iirtv6317npcglnphskpkcb', '::1', 1647192134, 0x5F5F63695F6C6173745F726567656E65726174657C693A313634373139323133343B);
INSERT INTO `sma_sessions` VALUES ('b21dc9613077a45721af1104d4ed2586f38c4db9', '::1', 1647198571, 0x5F5F63695F6C6173745F726567656E65726174657C693A313634373139383335383B6964656E746974797C733A333A2261646D223B757365726E616D657C733A333A2261646D223B656D61696C7C733A31313A2261646D4061646D2E636F6D223B757365725F69647C733A313A2231223B6F6C645F6C6173745F6C6F67696E7C733A31303A2231363437313938323430223B6C6173745F69707C733A333A223A3A31223B6176617461727C4E3B67656E6465727C733A343A226D616C65223B67726F75705F69647C733A313A2231223B77617265686F7573655F69647C733A313A2230223B766965775F72696768747C733A313A2231223B656469745F72696768747C733A313A2230223B616C6C6F775F646973636F756E747C733A313A2230223B62696C6C65725F69647C733A313A2230223B636F6D70616E795F69647C733A313A2231223B73686F775F636F73747C733A313A2230223B73686F775F70726963657C733A313A2230223B);
INSERT INTO `sma_sessions` VALUES ('b2441e6f3e095e79452c2ca1fb7a4dfaaa1bbca4', '177.70.142.40', 1463764837, 0x33436563363961544852457947534A56564A464B674D6D44497375756D526C4D62765336586E365F685679656A516D3151576A6D7A453465543241696D37335A624C33516F4657675362526B476C754A2D3873424676686476644769764B794F67334D32576E43556271753764436945734F756E2D37617678636F6772713739684B395A61483452464F385A76636E416C5A57724F7658454172426A644C3032654F61644B6378486F363473747641785A47684E5768666B7949335A433352594F576B79634D474E50476C376C56334E5F656153475434636678595279356D316D5F536A662D4E5249366839535F6E5F4B516856504D2D4B7955766E517765724A6C36547230556F5F6C543147793166526641415F716261525743556F72545951334C2D795158486E6362624F484572485165766A484D4F4C723551395F5631426449743667473148466F4D542D434875744B38744957664B50535967335046624F62344557786343516C6555466D7A6A71647A484C4354746C54487539353537394272346F2D4B377253643750392D455A61455F777078514D4C7952346436505F6A5263357A4F744D68634B396E757A346476362D6973435273506B513462614B39306A584673335A774A5A496F667576794754376332345555614A2D436245665A557441586C786C746953644D76677038662D436641724568696C65446B585367434A4B6F4F655955674B586B4A537548306A31743930744A576A37774F4D592D634B374330616330356C6C4153753532503331386F6B354C7A75524948594C446644694D79583344383953323458526C2D77747379786A57424B42387A4D4A786E5551444C595A63776435304B543954764C4952656941434B73474563507434704A5743497944644C626C6538654D57364366684E625F5355524E4C684E36495438677774626E71315A527667566E756E36327175347574766571776841566C633233466D5A324C2D526C597879476F7452512E2E);
INSERT INTO `sma_sessions` VALUES ('b4b575c05dd3cdcfc4bff1242631475b8906fbeb', '::1', 1469728409, 0x5F5F63695F6C6173745F726567656E65726174657C693A313436393732383339373B7265717565737465645F706167657C733A303A22223B);
INSERT INTO `sma_sessions` VALUES ('b758pvjm77nr63cnd6pgf93m1g', '::1', 1647191550, 0x5F5F63695F6C6173745F726567656E65726174657C693A313634373139313535303B7265717565737465645F706167657C733A303A22223B);
INSERT INTO `sma_sessions` VALUES ('b92c5729ab0550098aeb19107bb0b8e22f970c29', '168.90.88.70', 1464182528, 0x7A656B7233634C624A46676C673830496A53464658564A54354E4B35684F42593869554D6C6B713274386A3752766F4C726763784D6D714C2D3047654E6C4D7876414E6B5376584B4A4C775934304F667A7761426D464662393854556F2D527362586148477147683262314159304C7A33594F435F6F7A535145395A4B61426F4D4B57466F3055764E3947374D5A712D6B7A71676A634879747674726F486745464C63664C6D6D56596747464C464859457071523667514172713236646F362D774B5351552D7032566B4838586F715235444A3366396978553371714B6C4344446755414D46546A35486567343858684956447A2D375F7967323263613377316359545343344B6D597132337449306863736669546E336E6156345638385636793444376F6D73544730744C3935673263614C79376D515A7349614B524942457A7A42513557346873696A72794E6566595135756F6C546853366F536A57705857694538584E4E726C504C55537977535356384949654F32524A4D4249456F55754A4B5844593444463831777655504E703556424153547045537A5164393538367A4E645F39575879785A6F686D5A4E33783535713775656E387156716C7A5577356353552D616C2D76563555736F736F523836766A59664344515A5F464E665362755F596B2D67747A6C484B364F62766E334F4A69544B746B476355374C49536977482D6474624E396C313033356B7567455F36654C53613546356231355A3861754F436D4F4F523955717567562D456E4973734E6D3049725F51776D6B69567645556366796149557976706330445F774E6672362D734147646257695754396377726A757675386F512E);
INSERT INTO `sma_sessions` VALUES ('b9mabia0n52o0mmrm3r7nrhm2n', '::1', 1647191551, 0x5F5F63695F6C6173745F726567656E65726174657C693A313634373139313535313B);
INSERT INTO `sma_sessions` VALUES ('bdd02d229b334a7a8b4b63975ae379a5d2c5f3e9', '::1', 1469841949, 0x5F5F63695F6C6173745F726567656E65726174657C693A313436393833383838303B6964656E746974797C733A363A226A756E696F72223B757365726E616D657C733A363A226A756E696F72223B656D61696C7C733A31353A2261646D696E4061646D696E2E636F6D223B757365725F69647C733A313A2232223B6F6C645F6C6173745F6C6F67696E7C733A31303A2231343639373335393933223B6C6173745F69707C733A333A223A3A31223B6176617461727C4E3B67656E6465727C733A343A226D616C65223B67726F75705F69647C733A313A2231223B77617265686F7573655F69647C733A313A2230223B766965775F72696768747C733A313A2231223B656469745F72696768747C733A313A2230223B616C6C6F775F646973636F756E747C733A313A2230223B62696C6C65725F69647C733A313A2230223B636F6D70616E795F69647C4E3B73686F775F636F73747C733A313A2230223B73686F775F70726963657C733A313A2230223B);
INSERT INTO `sma_sessions` VALUES ('bff9b5781e1dbdebca014fe5862937da332f3296', '187.62.159.66', 1464284987, 0x526A656153754157433678316C45724F3865446D4B565757396638794573576F7233714A4678326C53513137424C6F6D6666627039646F363077474D5F756768744E365171324B4450785F7254715453567142766958434C63555562683166484B3753325F7242717157514862447859346F6F4C694D79634F324D573038304A766F6576794676686F4C63576276636A5062393955326B444378495F673547582D665F4E3653615F7A6E324570467339647449396D3359736B65505A6141714F53384A575171424E4757433430394C753335547855614B77326A3766516C616F673976456D79787052444B7733704F78434D6A53354437477270706B6D78694F7854544D533363367A4347335449515472584F30574F385F314336664D62684D525F777652304F7A5A4951696E4A325774396533316D72797674592D6D41324B324E61476A5F55456256586374304173654E654B4E3547664A74375F516D785337426962334D39685A7772714D50363250546634304872386B506456434F73442D694B72464376444E37664E5230784F49504738666C425330734C4C2D786545685354514A7141654570474D304F6D7662794766536E587546544239684D5661466C51666A6A6F324B726E325834534568306F5845376B6C6A646163456B39664E6B796D5F465F764949616E52326353564B71365230394830794A767578642D52736E304B45735A6669437456676A7A4232416E4D6739736B78383671727062532D794A384E46505F7330454E4F3449303357626F5977644579594B59786C734436574C5A62452D4349345741366D454664783055672E2E);
INSERT INTO `sma_sessions` VALUES ('c434d224fe13df8883df7be432828bc56f9668a1', '::1', 1469731446, 0x5F5F63695F6C6173745F726567656E65726174657C693A313436393733313135343B6964656E746974797C733A363A226A756E696F72223B757365726E616D657C733A363A226A756E696F72223B656D61696C7C733A31353A2261646D696E4061646D696E2E636F6D223B757365725F69647C733A313A2232223B6F6C645F6C6173745F6C6F67696E7C733A31303A2231343639373238393831223B6C6173745F69707C4E3B6176617461727C4E3B67656E6465727C733A343A226D616C65223B67726F75705F69647C733A313A2231223B77617265686F7573655F69647C733A313A2230223B766965775F72696768747C733A313A2231223B656469745F72696768747C733A313A2230223B616C6C6F775F646973636F756E747C733A313A2230223B62696C6C65725F69647C733A313A2230223B636F6D70616E795F69647C4E3B73686F775F636F73747C733A313A2230223B73686F775F70726963657C733A313A2230223B6C6173745F61637469766974797C693A313436393733313235333B72656769737465725F69647C733A313A2233223B636173685F696E5F68616E647C733A373A2232302E30303030223B72656769737465725F6F70656E5F74696D657C733A31393A22323031362D30372D32382031353A31333A3538223B757365725F637372667C733A32303A224D4861665534474576575135526B53646870494A223B6572726F727C733A31363A226C616E6775616765207820666F756E64223B5F5F63695F766172737C613A313A7B733A353A226572726F72223B733A333A226F6C64223B7D);
INSERT INTO `sma_sessions` VALUES ('c8c7647338f6a0ed23f4a21495d5f02f997d6aa4', '168.90.88.70', 1464187893, 0x6741365353442D706E536B574D6A315A7A553168386A507943744D32365567395979666152736267654C6F31626C38725A7754363146774A65726353356C4451574E76427A7A6B3649386E7A323430565F633235536137447464696E4950375950333378446C484B7572424F67434D56376F4452514479724B656332373972316833326C7A4E6454564D324F484963594149466D2D776F706B4561433755447237366870526831647A48514B47586179752D5757565870784A534C6E6151507436597264366F4F353161774257776C4D386D7643314D687272514D6E434B6445507756433937736C4F6F36595751304342554B354B6A5F65345672746C7535314161384666387238674C37556D6D4277776C596961724E445F6330663069376A6933455A4374732D736A636C70462D7A67565458633031312D466852786C41565479704D6E316A6C4F4C6F436F6A6A356E57386F4A45783058466843493659694678302D65744C36794F37364C4D74392D5F58695368754B3154585865524967305977527349306657586130616D7331594E797A6958725963674E5131686350676555356A394765545067564B39454A47754A5230707A7A3548455566574A645F4D6E4A4A524B324C587049747243796C4C767A4747794A4A3933736470476C2D325A71366B4F5235367079393271345A424B444B6C3635747779336776547A4D4B316846547841515F415267637557726269522D5F4A4263676178314F516656547730524B3376643532756A33754D455355524D325036554337395F34494B6F59786564374470367030426D4B71526335384C58535A572D5A306661657775415F3476396A56664143672E);
INSERT INTO `sma_sessions` VALUES ('ca885c180a778d4cb0598d70defd80280d669c3f', '189.83.7.91', 1464179397, 0x4256784B355F714C5A55744F634F684C6C3069347A59583662774B4D576F4A4E31526261523972614230665F4B356E67477753544F6F4A64725F697155466F6C586F67496C67464449744732694E316C5261692D54672E2E);
INSERT INTO `sma_sessions` VALUES ('cdvlg3433apl9ma9ogd08l4usm', '::1', 1647197478, 0x5F5F63695F6C6173745F726567656E65726174657C693A313634373139373437383B);
INSERT INTO `sma_sessions` VALUES ('cfe7bcdf0f5013b35a9ae2ac201f8c36a18e3caa', '::1', 1469730841, 0x5F5F63695F6C6173745F726567656E65726174657C693A313436393733303531323B6964656E746974797C733A363A226A756E696F72223B757365726E616D657C733A363A226A756E696F72223B656D61696C7C733A31353A2261646D696E4061646D696E2E636F6D223B757365725F69647C733A313A2232223B6F6C645F6C6173745F6C6F67696E7C733A31303A2231343639373238393831223B6C6173745F69707C4E3B6176617461727C4E3B67656E6465727C733A343A226D616C65223B67726F75705F69647C733A313A2231223B77617265686F7573655F69647C733A313A2230223B766965775F72696768747C733A313A2231223B656469745F72696768747C733A313A2230223B616C6C6F775F646973636F756E747C733A313A2230223B62696C6C65725F69647C733A313A2230223B636F6D70616E795F69647C4E3B73686F775F636F73747C733A313A2230223B73686F775F70726963657C733A313A2230223B6C6173745F61637469766974797C693A313436393733303431353B72656769737465725F69647C733A313A2233223B636173685F696E5F68616E647C733A373A2232302E30303030223B72656769737465725F6F70656E5F74696D657C733A31393A22323031362D30372D32382031353A31333A3538223B);
INSERT INTO `sma_sessions` VALUES ('d319722cc2022b99dbbbeb642419ed958828054c', '::1', 1469916105, 0x5F5F63695F6C6173745F726567656E65726174657C693A313436393931363038343B6964656E746974797C733A363A226A756E696F72223B757365726E616D657C733A363A226A756E696F72223B656D61696C7C733A31353A2261646D696E4061646D696E2E636F6D223B757365725F69647C733A313A2232223B6F6C645F6C6173745F6C6F67696E7C733A31303A2231343639383931323638223B6C6173745F69707C733A333A223A3A31223B6176617461727C4E3B67656E6465727C733A343A226D616C65223B67726F75705F69647C733A313A2231223B77617265686F7573655F69647C733A313A2230223B766965775F72696768747C733A313A2231223B656469745F72696768747C733A313A2230223B616C6C6F775F646973636F756E747C733A313A2230223B62696C6C65725F69647C733A313A2230223B636F6D70616E795F69647C4E3B73686F775F636F73747C733A313A2230223B73686F775F70726963657C733A313A2230223B6572726F727C4E3B);
INSERT INTO `sma_sessions` VALUES ('d38c527f78362dbc0990353e79d64747c5cc7d4b', '168.90.88.70', 1464182781, 0x6E646852504241517155415F6B4F46594D4235786E766B59346C6E747862744E49363950714D4D6A78317A346E6454584B35485863435931715F79794C43654C4E4C6D366D57674C6B6866644A4A596230396B72583049494F343667646D733970456542726252336755416D597473545771707453377961634B453274672D775865554B577A6D45566B58423847616A6C69412D34754A7668766972326157376B382D55396F6F3047766544366F6F6C55786A5F4D356B30744846795A6A5537644757772D6536664C506E586F78755A5A4C6A58516A646A554576596348334E72576F6E626232455A465252614363484947504671627470326C736562764E5642667A595345424D55357966523544713239506D76776D335A316478586E625450343078636B36616D6E3874686376336E6E523654336E6A35786F552D5A734B766A4B476C57355045675A503233754C794137757778344651585A5A48756F6C4867664D5F4F725061746F637A674646766F5362306F346868756D52795846544970584A44416E526B4D5879305A2D42556A4B31394B617275686F35434D585767534359526D524F2D662D4D4C75643379696B4536705236465F547A594B626A315041344F434C6A6876666A503369496148446979686D716D6B444F594E2D333363757A763162683576735F76784849626649587A77792D5278534C31566C4E50534A4235686275336D736B4F335F437649775872725770614A6B77475A534B32584C4E664E34557351666B516B6E595030594730644772704E354F4F44474E6638706E5233485A7270572D72684A444D5854364E39504F5F6771614276746F7A6E5A4459754369554C342E);
INSERT INTO `sma_sessions` VALUES ('d5ed6f93daf8de8992abf499fb3567f6c8404c65', '::1', 1469731137, 0x5F5F63695F6C6173745F726567656E65726174657C693A313436393733303834343B6964656E746974797C733A363A226A756E696F72223B757365726E616D657C733A363A226A756E696F72223B656D61696C7C733A31353A2261646D696E4061646D696E2E636F6D223B757365725F69647C733A313A2232223B6F6C645F6C6173745F6C6F67696E7C733A31303A2231343639373238393831223B6C6173745F69707C4E3B6176617461727C4E3B67656E6465727C733A343A226D616C65223B67726F75705F69647C733A313A2231223B77617265686F7573655F69647C733A313A2230223B766965775F72696768747C733A313A2231223B656469745F72696768747C733A313A2230223B616C6C6F775F646973636F756E747C733A313A2230223B62696C6C65725F69647C733A313A2230223B636F6D70616E795F69647C4E3B73686F775F636F73747C733A313A2230223B73686F775F70726963657C733A313A2230223B6C6173745F61637469766974797C693A313436393733303834343B72656769737465725F69647C733A313A2233223B636173685F696E5F68616E647C733A373A2232302E30303030223B72656769737465725F6F70656E5F74696D657C733A31393A22323031362D30372D32382031353A31333A3538223B);
INSERT INTO `sma_sessions` VALUES ('d77ec8aa47879ed3b358528b31e26f667c7ebbaa', '168.90.88.70', 1464187892, 0x6741365353442D706E536B574D6A315A7A553168386A507943744D32365567395979666152736267654C6F31626C38725A7754363146774A65726353356C4451574E76427A7A6B3649386E7A323430565F633235536137447464696E4950375950333378446C484B7572424F67434D56376F4452514479724B656332373972316833326C7A4E6454564D324F484963594149466D2D776F706B4561433755447237366870526831647A48514B47586179752D5757565870784A534C6E6151507436597264366F4F353161774257776C4D386D7643314D687272514D6E434B6445507756433937736C4F6F36595751304342554B354B6A5F65345672746C7535314161384666387238674C37556D6D4277776C596961724E445F6330663069376A6933455A4374732D736A636C70462D7A67565458633031312D466852786C41565479704D6E316A6C4F4C6F436F6A6A356E57386F4A45783058466843493659694678302D65744C36794F37364C4D74392D5F58695368754B3154585865524967305977527349306657586130616D7331594E797A6958725963674E5131686350676555356A394765545067564B39454A47754A5230707A7A3548455566574A645F4D6E4A4A524B324C587049747243796C4C767A4747794A4A3933736470476C2D325A71366B4F5235367079393271345A424B444B6C3635747779336776547A4D4B316846547841515F415267637557726269522D5F4A4263676178314F516656547730524B3376643532756A33754D455355524D325036554337395F34494B6F59786564374470367030426D4B71526335384C58535A572D5A306661657775415F3476396A56664143672E);
INSERT INTO `sma_sessions` VALUES ('deadbac265a5acc86bb6baaecb603d4208729bb5', '::1', 1647198876, 0x5F5F63695F6C6173745F726567656E65726174657C693A313634373139383837313B);
INSERT INTO `sma_sessions` VALUES ('e372ad153856720106fc8636f8317e31ed5a7380', '189.83.7.91', 1464178123, 0x32775254666F425665504151597548483347753557674A5A766E7A587462623356492D373754455053717952334666426E2D4454616C565057647267717052336B365F596E535F4C5778794A304C435A3844515A43554A334C6A365338484D494443657965446F343972365A656D52577A4D666148626761777A6B7376485A34696F494D4A5A706A72743168514454356F652D7A443768386978374F62366E4844682D61427264586F49374A7665484874613471424D47534D4276474C7431637654786A6B313258337434676A73514C354B71306C3462656B315769366546694F6C6247485A37747635303335705373596D6E4C343234774B3046566D50746138634C6977326D646C7078474B7659357833375A4A3934696C6D352D55576339305A5175305F516F4F464B54303069456B534B526C576A457538704D3244392D46684F5362486C6F4D7153583446743064413253396D77726B52795A2D466F7A4A394155324F6E7A4536555678593542374B332D716146444B416A7A7939426F375743706974726A776D56692D483067755A6E35566E685961457779595359724F5071727455736E55394444454479465A7148467641575A67535A3161445F44446D6366444A626C4B6753733370562D5A7348652D48626D6B7A5A634A7259773036667A456E4A68554C715744567779696C497646766352345F7044625773482D75646B71643133486368414D53454D6D395058474A486475634364546169676642722D696F357237705944744241414E445765543372357A37527A5F6A3658385055707663414F34654F4D684C6E65555833667663527634542D574B4739374B547756654661476D4D48744F346636635F6A6C57374F494252547A635678717736696962475A46564C6354544B324B38496C366A42396A5A65495042665F3436494948625A6A4F5A365441745A65476C4371596358387A6B4E563666755056424F57566F4F356541373175694151514139503543572D4B546F5270356F7830626A414234546F4434384D2E);
INSERT INTO `sma_sessions` VALUES ('e3bb944d6ef842ae93e62ec2f2cacd6f5eec0640', '168.90.88.70', 1464189157, 0x5F4C37526F526C537A47516B6357435431495956494C33783851306D6863482D614F4A6C5235412D6650676C7572634B69387341476B6C2D666564704B554E5048756F773062384E342D347475767469726E396A637734366D6B58326B764638374B37724731315536774A4D6B39476C4A644C3655517752352D7463586666526338315472354351396D425958464A64307863464B454138534568555762546E3032537A4E46726D686B68394E325868514D697943534848746C6149796430686E62673434716D6E3055737750493379754F4D32646C564A5573574268374E56522D43666B71315F6B4555324C4151427639366D5F77566E6F4B36326C39684E483731557A734841596A4C54326169382D4748526D55476F5549504455535542764E4F37346231643534596943666342436F72645262584A516D3767336572795258504C5947546D4E4969737A5A7A4A69375A64324A5A636B524475544530426A394E513557765A6A4E3970384279336833676552684F692D334E566D7935474F3934386273466F54343333536A4F3776627735667755534C7A494F7177654D744C61735847745F36515467714D5F787957536E6C57744D6A41555F4B365966304E4B4263306F63554233466475574133694E70597A4C505A446173333048504E567A79464B736A597A6B623469754E6B466C73514F6354535F61696F37566164735A346B7A32706E5678624E35675F35434162453241446B395877366B6C534158427265393062645563564556316C515475766132746C5F637A64725432434331424D56515F323649474B59415373397130343947516D43482D52714D666A724B484F37504A536B656C6A324474346B4A464C37724E4758674D654371344E6A4E4E59306C2D514B6973386866634D3445636B56772E2E);
INSERT INTO `sma_sessions` VALUES ('e91a1d8c98d9188d1d4053e4fb0bb85840307e52', '::1', 1469896936, 0x5F5F63695F6C6173745F726567656E65726174657C693A313436393839363732383B6964656E746974797C733A363A226A756E696F72223B757365726E616D657C733A363A226A756E696F72223B656D61696C7C733A31353A2261646D696E4061646D696E2E636F6D223B757365725F69647C733A313A2232223B6F6C645F6C6173745F6C6F67696E7C733A31303A2231343639383338393031223B6C6173745F69707C733A333A223A3A31223B6176617461727C4E3B67656E6465727C733A343A226D616C65223B67726F75705F69647C733A313A2231223B77617265686F7573655F69647C733A313A2230223B766965775F72696768747C733A313A2231223B656469745F72696768747C733A313A2230223B616C6C6F775F646973636F756E747C733A313A2230223B62696C6C65725F69647C733A313A2230223B636F6D70616E795F69647C4E3B73686F775F636F73747C733A313A2230223B73686F775F70726963657C733A313A2230223B6C6173745F61637469766974797C693A313436393839363933363B72656769737465725F69647C733A313A2233223B636173685F696E5F68616E647C733A373A2232302E30303030223B72656769737465725F6F70656E5F74696D657C733A31393A22323031362D30372D32382031353A31333A3538223B);
INSERT INTO `sma_sessions` VALUES ('ec184e41665c49985d5558ed4106ff51ce466d48', '177.70.142.40', 1463770730, 0x3165324F4C46686C417574436B67555A63675F664134507232566C745056455A33627449536E58754D61444D6233454C4457423753694E6149446D436E39516B47743557343231585F73416778695F666D52686F6E6D482D3166413234486863424445722D6B3855766B5A427A41427250346479696A69456855524144705A684D696F766B6B423369384E4167766F51545542536761527757655F3133586F56683572586A4675796D77625F61703132695870485255775A365956665A4D312D5466756243577A70585A39303871316C74715F2D626A4B50495A7350677A516D5F697447624C42343476535354727A4F72392D6776767A5749434B706A6456775255334C6C595A6D66595F6C31555F337559304A615362616A6E383563434C484F6A6A7275384C6A7A494B7A746E744E5662346667524C617537313171496C5356467143456E4A49656D4863624C46693269306E744A5658585837756E3866636A366755524C5A6E416434464C567A59774541543246507755433859716D34466351394B497053683972575A436845375A394345336766486B55706A4C4C61704F6366384E71352D714C4F6B773139486557594C6E5A52514843594C6A5F5A494C546C7745546242693458706B774F526557326F2D766F4A7149766D56765A6738584C774A677447454C366F4B4759725A6E396839687A76586B776D65686B44557143546E4656795054725769446D37706F306C4F656F767658554E384F61576F343471564E325545546752303467527275383865496350324B3033336F5932464E4B6A4B7A626A317A50784C637959424B3341317065394D41687268396C42393069687756567A6151644F4B5234334B723632765173415A2D35307A4C2D72596F66654B56616D675F72486D7A7876697763576E586B5A4771616C4E77484139396F6B336C5365597A4E4C4B47475755396434345166387571504F776B32365A304E2D7341766834726F507678546B717A324743672E2E);
INSERT INTO `sma_sessions` VALUES ('ef7bcacf981e6c9f272013c8fce714825714cb3e', '177.70.142.40', 1463770242, 0x686F6755476A787A613934715F4A6D594B6F45425677626B357237465773793174535F61704968456777514E587561657331514A687935577057414E6C5672764335324455676A61487377567A796552437A62596839575663427230577638704C556356334F7759614E73686F4A44616C69574B4269724B6C706A63564161765443694B66513172316330686C525769335A756E76633378766A396F764D4E767031596C63704B6A4E77754969616270755F5A4A66704C316C6974634D73504959563150775571356B346662377532794959524873777675427A55566E56456570446A416B4E63346B5F516C79567678766A6B44694537637156416E67474D36733549676E3631434D5F74475854465A4C4F3739424B69354D67534B7362496A6A7462547975374345486B5F54686E746C566162456F37732D4932636B595958795462367433507862714F576F5A6344514C46665F564B7A6B6C4F57336651523339525A51416236723365743166526431496A7A734377506F62533376384E534B6D466D6D6D5A6F73413633576C6B6D4633396E586F61584973345561717852734D647230676379566F516A3848443950783037596C38786F41594E773432465875445366784575735A4D345757734B765930714178594B5A41505231687A56365A7A7672375F54444B47516C5F4C6F4F684E534D424D567354542D2D666A724E4D4178356673424D6F6A49734837664C7553615730576E774E616F79747933444C737750394B7A67694C566D5464375248797A44646F4D506247346243644735366F6B697459666B4C515261344D53434E44773442676C5755362D4D53795877504E5A38303248535A463779746F4675535463544B5A3933344632644B74426D7431506476666D36476E6562664B6F56496F544973584A73453275546C474D51733335756A77774A4339447A5163385F6B6837446174504E68356938785961614A696E59317A3468652D4B71654C574A77624737672E2E);
INSERT INTO `sma_sessions` VALUES ('f20ac018a65d5065c5ff612a28147f33130e6794', '187.62.159.66', 1464284595, 0x715F5F4358717269725870664669723261697655774D4E64556E5A6D314F585A474148794947796335703559384861763337784A6E466D72684F774D495035335556485234324E4139664763306C422D56627976735A433445625555303432716A2D625A7963754F6A48342E);
INSERT INTO `sma_sessions` VALUES ('f381pqqeqbijoc8udmttal1evn', '::1', 1647191419, 0x5F5F63695F6C6173745F726567656E65726174657C693A313634373139313431383B6572726F727C733A34363A223C703E4C6F67696E2066616C686F752C20706F72206661766F722074656E7465206E6F76616D656E74653C2F703E223B5F5F63695F766172737C613A313A7B733A353A226572726F72223B733A333A226E6577223B7D);
INSERT INTO `sma_sessions` VALUES ('f4b0f4ae92adc55c15c50703c64b5be0f6659fe2', '::1', 1469897359, 0x5F5F63695F6C6173745F726567656E65726174657C693A313436393839373333353B6964656E746974797C733A363A226A756E696F72223B757365726E616D657C733A363A226A756E696F72223B656D61696C7C733A31353A2261646D696E4061646D696E2E636F6D223B757365725F69647C733A313A2232223B6F6C645F6C6173745F6C6F67696E7C733A31303A2231343639383338393031223B6C6173745F69707C733A333A223A3A31223B6176617461727C4E3B67656E6465727C733A343A226D616C65223B67726F75705F69647C733A313A2231223B77617265686F7573655F69647C733A313A2230223B766965775F72696768747C733A313A2231223B656469745F72696768747C733A313A2230223B616C6C6F775F646973636F756E747C733A313A2230223B62696C6C65725F69647C733A313A2230223B636F6D70616E795F69647C4E3B73686F775F636F73747C733A313A2230223B73686F775F70726963657C733A313A2230223B6C6173745F61637469766974797C693A313436393839363933363B72656769737465725F69647C733A313A2233223B636173685F696E5F68616E647C733A373A2232302E30303030223B72656769737465725F6F70656E5F74696D657C733A31393A22323031362D30372D32382031353A31333A3538223B);
INSERT INTO `sma_sessions` VALUES ('f6515ffb9d35f8ea8833d9fd5c7f1de270703068', '::1', 1469730426, 0x5F5F63695F6C6173745F726567656E65726174657C693A313436393733303231313B6964656E746974797C733A363A226A756E696F72223B757365726E616D657C733A363A226A756E696F72223B656D61696C7C733A31353A2261646D696E4061646D696E2E636F6D223B757365725F69647C733A313A2232223B6F6C645F6C6173745F6C6F67696E7C733A31303A2231343639373238393831223B6C6173745F69707C4E3B6176617461727C4E3B67656E6465727C733A343A226D616C65223B67726F75705F69647C733A313A2231223B77617265686F7573655F69647C733A313A2230223B766965775F72696768747C733A313A2231223B656469745F72696768747C733A313A2230223B616C6C6F775F646973636F756E747C733A313A2230223B62696C6C65725F69647C733A313A2230223B636F6D70616E795F69647C4E3B73686F775F636F73747C733A313A2230223B73686F775F70726963657C733A313A2230223B6C6173745F61637469766974797C693A313436393733303431353B72656769737465725F69647C733A313A2233223B636173685F696E5F68616E647C733A373A2232302E30303030223B72656769737465725F6F70656E5F74696D657C733A31393A22323031362D30372D32382031353A31333A3538223B);
INSERT INTO `sma_sessions` VALUES ('f7jh1eflq36llrjnr4i5b057ck', '::1', 1647197478, 0x5F5F63695F6C6173745F726567656E65726174657C693A313634373139373437383B7265717565737465645F706167657C733A373A2277656C636F6D65223B);
INSERT INTO `sma_sessions` VALUES ('f9b957df1c4e36a63c29530b91e33a471ad6cc48', '168.90.88.70', 1464179862, 0x77734A33785166456450476B5875455A4B3879693262575A34714E767255532D304370676D45754D5565566643337354357A61465079335A524679456370733176786A7A5247386C5634615A78316D66422D70577A68556B764650365F4D6E6C464477467156484364637A4B4F57584E565668357535654F724A62514956716331707245506E41307643745755696F65564963492D66432D4A53546231414A434F39524E5864644B387867354A5A4B68693250656A696F515F46764631614D5F71533430736531313751534F5959456A79775F3636583744426B6E4836394954453751366F326A6936577A795F612D6276682D5157342D32766C6A67686967687532464D5179797769736E796933556172384263445F6C44577149574C54672D334357665A543042756D544F534A6C55417051444E6C6263416E593437553469546453684B61637255316B3174595163344C625F7043734751484A734E6A52766B3731596145675A4C54365F6A2D6B6B616C325A7A397153635F36626872346A364D5A64344A676D3053694E63706C4E7658516C43566C3364773571435448663678387A55676453584F386C375A71316D5469634C7230414B51484D647275434F2D5A454B6947763869484234684D534F734C4B31356B7A6F546E6A78396744574C504B75703130694A395A734D5F326A54704E5A5A5A734158396B686B4678313944535534787A6231513539474E55756B73426B506776326A614B4958433777624958763777326D5A6133423171334230686757384D43476D634F6251584E59576145624A53456878495F72796F776E7A704C5543344A69614A5476746F59304269464D797073625A492E);
INSERT INTO `sma_sessions` VALUES ('fdb6f6aae6194305d03d01e7b656e2c463e54df2', '::1', 1469728737, 0x5F5F63695F6C6173745F726567656E65726174657C693A313436393732383733363B7265717565737465645F706167657C733A303A22223B);
INSERT INTO `sma_sessions` VALUES ('fdd9f9daed2cdda03311c958ff4b4b50f259bc60', '::1', 1469891441, 0x5F5F63695F6C6173745F726567656E65726174657C693A313436393839313235353B6964656E746974797C733A363A226A756E696F72223B757365726E616D657C733A363A226A756E696F72223B656D61696C7C733A31353A2261646D696E4061646D696E2E636F6D223B757365725F69647C733A313A2232223B6F6C645F6C6173745F6C6F67696E7C733A31303A2231343639383338393031223B6C6173745F69707C733A333A223A3A31223B6176617461727C4E3B67656E6465727C733A343A226D616C65223B67726F75705F69647C733A313A2231223B77617265686F7573655F69647C733A313A2230223B766965775F72696768747C733A313A2231223B656469745F72696768747C733A313A2230223B616C6C6F775F646973636F756E747C733A313A2230223B62696C6C65725F69647C733A313A2230223B636F6D70616E795F69647C4E3B73686F775F636F73747C733A313A2230223B73686F775F70726963657C733A313A2230223B6C6173745F61637469766974797C693A313436393839313433373B72656769737465725F69647C733A313A2233223B636173685F696E5F68616E647C733A373A2232302E30303030223B72656769737465725F6F70656E5F74696D657C733A31393A22323031362D30372D32382031353A31333A3538223B);
INSERT INTO `sma_sessions` VALUES ('g13ti5cojd1vu9h7fnvo94uh7g', '::1', 1647197849, 0x5F5F63695F6C6173745F726567656E65726174657C693A313634373139373834383B);
INSERT INTO `sma_sessions` VALUES ('gd999f6i2jbcr5tjpvqvdq48dd', '::1', 1647197861, 0x5F5F63695F6C6173745F726567656E65726174657C693A313634373139373836313B7265717565737465645F706167657C733A373A2277656C636F6D65223B);
INSERT INTO `sma_sessions` VALUES ('i5a33l4kqnmnaka1pnb6vnhq17', '::1', 1647191419, 0x5F5F63695F6C6173745F726567656E65726174657C693A313634373139313431393B);
INSERT INTO `sma_sessions` VALUES ('igssd8f8cmfagt9br7v0vjmk49', '::1', 1647192142, 0x5F5F63695F6C6173745F726567656E65726174657C693A313634373139323134323B);
INSERT INTO `sma_sessions` VALUES ('kk4filrm3in72aio1qbem6kd29', '::1', 1647191405, 0x5F5F63695F6C6173745F726567656E65726174657C693A313634373139313430353B);
INSERT INTO `sma_sessions` VALUES ('l33bd813cicv7g5iqqd8jonm5q', '::1', 1647191567, 0x5F5F63695F6C6173745F726567656E65726174657C693A313634373139313536373B6572726F727C733A34363A223C703E4C6F67696E2066616C686F752C20706F72206661766F722074656E7465206E6F76616D656E74653C2F703E223B5F5F63695F766172737C613A313A7B733A353A226572726F72223B733A333A226E6577223B7D);
INSERT INTO `sma_sessions` VALUES ('la3hd4072gakkhs7mbc9erd7d4', '::1', 1647196838, 0x5F5F63695F6C6173745F726567656E65726174657C693A313634373139363833373B);
INSERT INTO `sma_sessions` VALUES ('paa27segs6o6fjviaphst5ani6', '::1', 1647191561, 0x5F5F63695F6C6173745F726567656E65726174657C693A313634373139313536313B);
INSERT INTO `sma_sessions` VALUES ('qmkbo3auadur2riq3oe7bjjh67', '::1', 1647192141, 0x5F5F63695F6C6173745F726567656E65726174657C693A313634373139323134313B7265717565737465645F706167657C733A303A22223B);
INSERT INTO `sma_sessions` VALUES ('rf0lvgfqfd3qaeb6g241q1p6k4', '::1', 1647191568, 0x5F5F63695F6C6173745F726567656E65726174657C693A313634373139313536383B);
INSERT INTO `sma_sessions` VALUES ('so8m1h2se1ah1glmt4esc9r0g5', '::1', 1647197478, 0x5F5F63695F6C6173745F726567656E65726174657C693A313634373139373437373B6964656E746974797C733A363A226A756E696F72223B757365726E616D657C733A363A226A756E696F72223B656D61696C7C733A31313A2261646D4061646D2E636F6D223B757365725F69647C733A313A2231223B6F6C645F6C6173745F6C6F67696E7C733A31303A2231363437313931343332223B6C6173745F69707C733A333A223A3A31223B6176617461727C4E3B67656E6465727C733A343A226D616C65223B67726F75705F69647C733A313A2231223B77617265686F7573655F69647C733A313A2230223B766965775F72696768747C733A313A2231223B656469745F72696768747C733A313A2230223B616C6C6F775F646973636F756E747C733A313A2230223B62696C6C65725F69647C733A313A2230223B636F6D70616E795F69647C4E3B73686F775F636F73747C733A313A2230223B73686F775F70726963657C733A313A2230223B6D6573736167657C733A33373A223C703E566F63C3AA20736520636F6E6563746F7520636F6D207375636573736F2E3C2F703E223B5F5F63695F766172737C613A313A7B733A373A226D657373616765223B733A333A226E6577223B7D);
INSERT INTO `sma_sessions` VALUES ('t4f9hrpeha00jmkatusvcq095v', '::1', 1647197861, 0x5F5F63695F6C6173745F726567656E65726174657C693A313634373139373836313B6964656E746974797C733A333A2261646D223B757365726E616D657C733A333A2261646D223B656D61696C7C733A31313A2261646D4061646D2E636F6D223B757365725F69647C733A313A2231223B6F6C645F6C6173745F6C6F67696E7C733A31303A2231363437313937343738223B6C6173745F69707C733A333A223A3A31223B6176617461727C4E3B67656E6465727C733A343A226D616C65223B67726F75705F69647C733A313A2231223B77617265686F7573655F69647C733A313A2230223B766965775F72696768747C733A313A2231223B656469745F72696768747C733A313A2230223B616C6C6F775F646973636F756E747C733A313A2230223B62696C6C65725F69647C733A313A2230223B636F6D70616E795F69647C733A313A2231223B73686F775F636F73747C733A313A2230223B73686F775F70726963657C733A313A2230223B6D6573736167657C733A33373A223C703E566F63C3AA20736520636F6E6563746F7520636F6D207375636573736F2E3C2F703E223B5F5F63695F766172737C613A313A7B733A373A226D657373616765223B733A333A226E6577223B7D);
INSERT INTO `sma_sessions` VALUES ('uhpujo7jdvphee536e6vj8dv0m', '::1', 1647197452, 0x5F5F63695F6C6173745F726567656E65726174657C693A313634373139373435313B);
INSERT INTO `sma_sessions` VALUES ('v4lchhufdijse3n3gde64phpua', '::1', 1647191993, 0x5F5F63695F6C6173745F726567656E65726174657C693A313634373139313939323B6572726F727C733A35393A223C703E4F20656E64657265C3A76F20646520652D6D61696C206EC3A36F2070657274656E63652061206E656E68756D6120636F6E74612E3C2F703E223B5F5F63695F766172737C613A313A7B733A353A226572726F72223B733A333A226E6577223B7D);

-- ----------------------------
-- Table structure for sma_settings
-- ----------------------------
DROP TABLE IF EXISTS `sma_settings`;
CREATE TABLE `sma_settings`  (
  `setting_id` int(1) NOT NULL,
  `logo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `logo2` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `site_name` varchar(55) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `language` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `default_warehouse` int(2) NOT NULL,
  `accounting_method` tinyint(4) NOT NULL DEFAULT 0,
  `default_currency` varchar(3) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `default_tax_rate` int(2) NOT NULL,
  `rows_per_page` int(2) NOT NULL,
  `version` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '1.0',
  `default_tax_rate2` int(11) NOT NULL DEFAULT 0,
  `dateformat` int(11) NOT NULL,
  `sales_prefix` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `quote_prefix` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `purchase_prefix` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `transfer_prefix` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `delivery_prefix` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `payment_prefix` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `return_prefix` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `returnp_prefix` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `expense_prefix` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `item_addition` tinyint(1) NOT NULL DEFAULT 0,
  `theme` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `product_serial` tinyint(4) NOT NULL,
  `default_discount` int(11) NOT NULL,
  `product_discount` tinyint(1) NOT NULL DEFAULT 0,
  `discount_method` tinyint(4) NOT NULL,
  `tax1` tinyint(4) NOT NULL,
  `tax2` tinyint(4) NOT NULL,
  `overselling` tinyint(1) NOT NULL DEFAULT 0,
  `restrict_user` tinyint(4) NOT NULL DEFAULT 0,
  `restrict_calendar` tinyint(4) NOT NULL DEFAULT 0,
  `timezone` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `iwidth` int(11) NOT NULL DEFAULT 0,
  `iheight` int(11) NOT NULL,
  `twidth` int(11) NOT NULL,
  `theight` int(11) NOT NULL,
  `watermark` tinyint(1) NULL DEFAULT NULL,
  `reg_ver` tinyint(1) NULL DEFAULT NULL,
  `allow_reg` tinyint(1) NULL DEFAULT NULL,
  `reg_notification` tinyint(1) NULL DEFAULT NULL,
  `auto_reg` tinyint(1) NULL DEFAULT NULL,
  `protocol` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'mail',
  `mailpath` varchar(55) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '/usr/sbin/sendmail',
  `smtp_host` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `smtp_user` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `smtp_pass` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `smtp_port` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '25',
  `smtp_crypto` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `corn` datetime(0) NULL DEFAULT NULL,
  `customer_group` int(11) NOT NULL,
  `default_email` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `mmode` tinyint(1) NOT NULL,
  `bc_fix` tinyint(4) NOT NULL DEFAULT 0,
  `auto_detect_barcode` tinyint(1) NOT NULL DEFAULT 0,
  `captcha` tinyint(1) NOT NULL DEFAULT 1,
  `reference_format` tinyint(1) NOT NULL DEFAULT 1,
  `racks` tinyint(1) NULL DEFAULT 0,
  `attributes` tinyint(1) NOT NULL DEFAULT 0,
  `product_expiry` tinyint(1) NOT NULL DEFAULT 0,
  `decimals` tinyint(2) NOT NULL DEFAULT 2,
  `qty_decimals` tinyint(2) NOT NULL DEFAULT 2,
  `decimals_sep` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '.',
  `thousands_sep` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT ',',
  `invoice_view` tinyint(1) NULL DEFAULT 0,
  `default_biller` int(11) NULL DEFAULT NULL,
  `envato_username` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `purchase_code` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `rtl` tinyint(1) NULL DEFAULT 0,
  `each_spent` decimal(15, 4) NULL DEFAULT NULL,
  `ca_point` tinyint(4) NULL DEFAULT NULL,
  `each_sale` decimal(15, 4) NULL DEFAULT NULL,
  `sa_point` tinyint(4) NULL DEFAULT NULL,
  `update` tinyint(1) NULL DEFAULT 0,
  `sac` tinyint(1) NULL DEFAULT 0,
  `display_all_products` tinyint(1) NULL DEFAULT 0,
  `display_symbol` tinyint(1) NULL DEFAULT NULL,
  `symbol` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `remove_expired` tinyint(1) NULL DEFAULT 0,
  `barcode_separator` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '_',
  `set_focus` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`setting_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sma_settings
-- ----------------------------
INSERT INTO `sma_settings` VALUES (1, 'logo2.png', 'logo6.jpg', 'NEXT SYSTEMS', 'portuguese-brazilian', 1, 0, 'USD', 1, 10, '3.0.2.13', 1, 5, 'VENDA', 'ORC', 'PO', 'TR', 'DO', 'IPAY', 'SR', 'PR', NULL, 0, 'default', 1, 1, 1, 1, 1, 1, 0, 1, 0, 'America/Sao_Paulo', 800, 800, 60, 60, 0, 0, 0, 0, NULL, 'mail', '/usr/sbin/sendmail', 'mail.seedcommerce.com.br', 'pdv@seedcommerce.com.br', 'jEFTM4T63AiQ9dsidxhPKt9CIg4HQjCN58n/RW9vmdC/UDXCzRLR469ziZ0jjpFlbOg43LyoSmpJLBkcAHh0Yw==', '25', NULL, NULL, 1, 'megacomsistemas@gmail.com', 0, 4, 1, 0, 2, 1, 1, 0, 2, 2, '.', ',', 0, NULL, 'obviosistemas', '5e5b9b9d-6af2-422f-9f0d-8cb52b3200c6', 0, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, 0, '_', 0);

-- ----------------------------
-- Table structure for sma_skrill
-- ----------------------------
DROP TABLE IF EXISTS `sma_skrill`;
CREATE TABLE `sma_skrill`  (
  `id` int(11) NOT NULL,
  `active` tinyint(4) NOT NULL,
  `account_email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'testaccount2@moneybookers.com',
  `secret_word` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'mbtest',
  `skrill_currency` varchar(3) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'USD',
  `fixed_charges` decimal(25, 4) NOT NULL DEFAULT 0.0000,
  `extra_charges_my` decimal(25, 4) NOT NULL DEFAULT 0.0000,
  `extra_charges_other` decimal(25, 4) NOT NULL DEFAULT 0.0000,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sma_skrill
-- ----------------------------
INSERT INTO `sma_skrill` VALUES (1, 0, 'testaccount2@moneybookers.com', 'mbtest', 'USD', 0.0000, 0.0000, 0.0000);

-- ----------------------------
-- Table structure for sma_subcategories
-- ----------------------------
DROP TABLE IF EXISTS `sma_subcategories`;
CREATE TABLE `sma_subcategories`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` int(11) NOT NULL,
  `code` varchar(55) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name` varchar(55) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `image` varchar(55) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sma_suspended_bills
-- ----------------------------
DROP TABLE IF EXISTS `sma_suspended_bills`;
CREATE TABLE `sma_suspended_bills`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
  `customer_id` int(11) NOT NULL,
  `customer` varchar(55) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `count` int(11) NOT NULL,
  `order_discount_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `order_tax_id` int(11) NULL DEFAULT NULL,
  `total` decimal(25, 4) NOT NULL,
  `biller_id` int(11) NULL DEFAULT NULL,
  `warehouse_id` int(11) NULL DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `suspend_note` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sma_suspended_bills
-- ----------------------------
INSERT INTO `sma_suspended_bills` VALUES (1, '2016-05-20 21:37:27', 1, 'MEGA SISTEMAS', 3, NULL, 1, 50.8500, 3, 1, 1, '01');
INSERT INTO `sma_suspended_bills` VALUES (2, '2016-05-20 21:37:35', 1, 'MEGA SISTEMAS', 1, NULL, 1, 16.9500, 3, 1, 1, '02');
INSERT INTO `sma_suspended_bills` VALUES (3, '2016-07-28 18:46:37', 1, 'Jr Next', 4, NULL, 1, 67.8000, 4, 1, 2, 'teste');
INSERT INTO `sma_suspended_bills` VALUES (4, '2016-07-28 18:47:45', 1, 'Jr Next', 1, NULL, 1, 16.9500, 4, 1, 2, '01');
INSERT INTO `sma_suspended_bills` VALUES (5, '2016-07-30 16:39:08', 1, 'Jr Next', 3, NULL, 1, 50.8500, 4, 1, 2, 'teste 17');

-- ----------------------------
-- Table structure for sma_suspended_items
-- ----------------------------
DROP TABLE IF EXISTS `sma_suspended_items`;
CREATE TABLE `sma_suspended_items`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `suspend_id` int(11) UNSIGNED NOT NULL,
  `product_id` int(11) UNSIGNED NOT NULL,
  `product_code` varchar(55) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `product_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `net_unit_price` decimal(25, 4) NOT NULL,
  `unit_price` decimal(25, 4) NOT NULL,
  `quantity` decimal(15, 4) NULL DEFAULT 0.0000,
  `warehouse_id` int(11) NULL DEFAULT NULL,
  `item_tax` decimal(25, 4) NULL DEFAULT NULL,
  `tax_rate_id` int(11) NULL DEFAULT NULL,
  `tax` varchar(55) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `discount` varchar(55) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `item_discount` decimal(25, 4) NULL DEFAULT NULL,
  `subtotal` decimal(25, 4) NOT NULL,
  `serial_no` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `option_id` int(11) NULL DEFAULT NULL,
  `product_type` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `real_unit_price` decimal(25, 4) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sma_suspended_items
-- ----------------------------
INSERT INTO `sma_suspended_items` VALUES (2, 1, 1, '07327550', 'Produto Teste', 16.9500, 16.9500, 3.0000, 1, 0.0000, 1, '0.0000', '0', 0.0000, 50.8500, '', 0, 'standard', 16.9500);
INSERT INTO `sma_suspended_items` VALUES (3, 2, 1, '07327550', 'Produto Teste', 16.9500, 16.9500, 1.0000, 1, 0.0000, 1, '0.0000', '0', 0.0000, 16.9500, '', 0, 'standard', 16.9500);
INSERT INTO `sma_suspended_items` VALUES (4, 3, 1, '07327550', 'Produto Teste', 16.9500, 16.9500, 1.0000, 1, 0.0000, 1, '0.0000', '0', 0.0000, 16.9500, '', 0, 'standard', 16.9500);
INSERT INTO `sma_suspended_items` VALUES (5, 3, 1, '07327550', 'Produto Teste', 16.9500, 16.9500, 1.0000, 1, 0.0000, 1, '0.0000', '0', 0.0000, 16.9500, '', 0, 'standard', 16.9500);
INSERT INTO `sma_suspended_items` VALUES (6, 3, 1, '07327550', 'Produto Teste', 16.9500, 16.9500, 1.0000, 1, 0.0000, 1, '0.0000', '0', 0.0000, 16.9500, '', 0, 'standard', 16.9500);
INSERT INTO `sma_suspended_items` VALUES (7, 3, 1, '07327550', 'Produto Teste', 16.9500, 16.9500, 1.0000, 1, 0.0000, 1, '0.0000', '0', 0.0000, 16.9500, '', 0, 'standard', 16.9500);
INSERT INTO `sma_suspended_items` VALUES (8, 4, 1, '07327550', 'Produto Teste', 16.9500, 16.9500, 1.0000, 1, 0.0000, 1, '0.0000', '0', 0.0000, 16.9500, '', 0, 'standard', 16.9500);
INSERT INTO `sma_suspended_items` VALUES (9, 5, 1, '07327550', 'Produto Teste', 16.9500, 16.9500, 1.0000, 1, 0.0000, 1, '0.0000', '0', 0.0000, 16.9500, '', 0, 'standard', 16.9500);
INSERT INTO `sma_suspended_items` VALUES (10, 5, 1, '07327550', 'Produto Teste', 16.9500, 16.9500, 1.0000, 1, 0.0000, 1, '0.0000', '0', 0.0000, 16.9500, '', 0, 'standard', 16.9500);
INSERT INTO `sma_suspended_items` VALUES (11, 5, 1, '07327550', 'Produto Teste', 16.9500, 16.9500, 1.0000, 1, 0.0000, 1, '0.0000', '0', 0.0000, 16.9500, '', 0, 'standard', 16.9500);

-- ----------------------------
-- Table structure for sma_tax_rates
-- ----------------------------
DROP TABLE IF EXISTS `sma_tax_rates`;
CREATE TABLE `sma_tax_rates`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(55) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `code` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `rate` decimal(12, 4) NOT NULL,
  `type` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sma_tax_rates
-- ----------------------------
INSERT INTO `sma_tax_rates` VALUES (1, 'No Tax', 'NT', 0.0000, '2');
INSERT INTO `sma_tax_rates` VALUES (2, 'VAT @10%', 'VAT10', 10.0000, '1');
INSERT INTO `sma_tax_rates` VALUES (3, 'GST @6%', 'GST', 6.0000, '1');
INSERT INTO `sma_tax_rates` VALUES (4, 'VAT @20%', 'VT20', 20.0000, '1');
INSERT INTO `sma_tax_rates` VALUES (5, 'ICMS', 'ICMS', 11.0000, '1');

-- ----------------------------
-- Table structure for sma_transfer_items
-- ----------------------------
DROP TABLE IF EXISTS `sma_transfer_items`;
CREATE TABLE `sma_transfer_items`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `transfer_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_code` varchar(55) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `product_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `option_id` int(11) NULL DEFAULT NULL,
  `expiry` date NULL DEFAULT NULL,
  `quantity` decimal(15, 4) NOT NULL,
  `tax_rate_id` int(11) NULL DEFAULT NULL,
  `tax` varchar(55) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `item_tax` decimal(25, 4) NULL DEFAULT NULL,
  `net_unit_cost` decimal(25, 4) NULL DEFAULT NULL,
  `subtotal` decimal(25, 4) NULL DEFAULT NULL,
  `quantity_balance` decimal(15, 4) NOT NULL,
  `unit_cost` decimal(25, 4) NULL DEFAULT NULL,
  `real_unit_cost` decimal(25, 4) NULL DEFAULT NULL,
  `date` date NULL DEFAULT NULL,
  `warehouse_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `transfer_id`(`transfer_id`) USING BTREE,
  INDEX `product_id`(`product_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sma_transfers
-- ----------------------------
DROP TABLE IF EXISTS `sma_transfers`;
CREATE TABLE `sma_transfers`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `transfer_no` varchar(55) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `date` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
  `from_warehouse_id` int(11) NOT NULL,
  `from_warehouse_code` varchar(55) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `from_warehouse_name` varchar(55) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `to_warehouse_id` int(11) NOT NULL,
  `to_warehouse_code` varchar(55) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `to_warehouse_name` varchar(55) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `note` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `total` decimal(25, 4) NULL DEFAULT NULL,
  `total_tax` decimal(25, 4) NULL DEFAULT NULL,
  `grand_total` decimal(25, 4) NULL DEFAULT NULL,
  `created_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `status` varchar(55) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'pending',
  `shipping` decimal(25, 4) NOT NULL DEFAULT 0.0000,
  `attachment` varchar(55) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `id`(`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sma_user_logins
-- ----------------------------
DROP TABLE IF EXISTS `sma_user_logins`;
CREATE TABLE `sma_user_logins`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `company_id` int(11) NULL DEFAULT NULL,
  `ip_address` varbinary(16) NOT NULL,
  `login` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `time` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 26 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sma_user_logins
-- ----------------------------
INSERT INTO `sma_user_logins` VALUES (22, 1, 1, 0x3A3A31, 'adm', '2022-03-13 18:51:18');
INSERT INTO `sma_user_logins` VALUES (23, 1, NULL, 0x3A3A31, 'adm', '2022-03-13 18:57:41');
INSERT INTO `sma_user_logins` VALUES (24, 1, NULL, 0x3A3A31, 'adm', '2022-03-13 19:04:01');
INSERT INTO `sma_user_logins` VALUES (25, 1, NULL, 0x3A3A31, 'adm', '2022-03-13 19:06:09');

-- ----------------------------
-- Table structure for sma_users
-- ----------------------------
DROP TABLE IF EXISTS `sma_users`;
CREATE TABLE `sma_users`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `last_ip_address` varbinary(45) NULL DEFAULT NULL,
  `ip_address` varbinary(45) NOT NULL,
  `username` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `password` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `salt` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `email` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `activation_code` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `forgotten_password_code` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `forgotten_password_time` int(11) UNSIGNED NULL DEFAULT NULL,
  `remember_code` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `created_on` int(11) UNSIGNED NOT NULL,
  `last_login` int(11) UNSIGNED NULL DEFAULT NULL,
  `active` tinyint(1) UNSIGNED NULL DEFAULT NULL,
  `first_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `last_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `company` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `phone` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `avatar` varchar(55) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `gender` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `group_id` int(10) UNSIGNED NOT NULL,
  `warehouse_id` int(10) UNSIGNED NULL DEFAULT NULL,
  `biller_id` int(10) UNSIGNED NULL DEFAULT NULL,
  `company_id` int(11) NULL DEFAULT NULL,
  `show_cost` tinyint(1) NULL DEFAULT 0,
  `show_price` tinyint(1) NULL DEFAULT 0,
  `award_points` int(11) NULL DEFAULT 0,
  `view_right` tinyint(1) NOT NULL DEFAULT 0,
  `edit_right` tinyint(1) NOT NULL DEFAULT 0,
  `allow_discount` tinyint(1) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `group_id`(`group_id`, `warehouse_id`, `biller_id`) USING BTREE,
  INDEX `group_id_2`(`group_id`, `company_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sma_users
-- ----------------------------
INSERT INTO `sma_users` VALUES (1, 0x3A3A31, 0x3A3A31, 'adm', '$2a$09$nPyIF4VfbPFwl7OL8zu7TuOX2kHuhoVExDaFDQB5AaBtNvIEGz4vK', '', 'adm@adm.com', NULL, NULL, NULL, NULL, 1469728981, 1647198369, 1, 'Leandro', 'Correia', 'Jr Next', '3599938521', 'e7f0ba8a1929c775cac6e5620d051e30.png', 'male', 1, 0, 0, 1, 0, 0, 0, 1, 0, 0);

-- ----------------------------
-- Table structure for sma_variants
-- ----------------------------
DROP TABLE IF EXISTS `sma_variants`;
CREATE TABLE `sma_variants`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(55) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sma_warehouses
-- ----------------------------
DROP TABLE IF EXISTS `sma_warehouses`;
CREATE TABLE `sma_warehouses`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `map` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `phone` varchar(55) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `email` varchar(55) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `id`(`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sma_warehouses
-- ----------------------------
INSERT INTO `sma_warehouses` VALUES (1, '01', 'Estoque Empresa 1', '<p>Endereço, Cidade</p>', NULL, '012345678', 'empresa1@jr.com');
INSERT INTO `sma_warehouses` VALUES (2, '02', 'Estoque Empresa 2', '<p>Endereço, Cidade</p>', NULL, '0105292122', 'empresa2@jr.com');

-- ----------------------------
-- Table structure for sma_warehouses_products
-- ----------------------------
DROP TABLE IF EXISTS `sma_warehouses_products`;
CREATE TABLE `sma_warehouses_products`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  `quantity` decimal(15, 4) NOT NULL,
  `rack` varchar(55) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `avg_cost` decimal(25, 4) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `product_id`(`product_id`) USING BTREE,
  INDEX `warehouse_id`(`warehouse_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sma_warehouses_products
-- ----------------------------
INSERT INTO `sma_warehouses_products` VALUES (1, 1, 1, 995.0000, 'AB12', 11.5000);
INSERT INTO `sma_warehouses_products` VALUES (2, 1, 2, 20.0000, 'BC10', 11.5000);

-- ----------------------------
-- Table structure for sma_warehouses_products_variants
-- ----------------------------
DROP TABLE IF EXISTS `sma_warehouses_products_variants`;
CREATE TABLE `sma_warehouses_products_variants`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `option_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  `quantity` decimal(15, 4) NOT NULL,
  `rack` varchar(55) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `option_id`(`option_id`) USING BTREE,
  INDEX `product_id`(`product_id`) USING BTREE,
  INDEX `warehouse_id`(`warehouse_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

SET FOREIGN_KEY_CHECKS = 1;

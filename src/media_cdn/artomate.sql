/*
SQLyog Community v13.1.5  (64 bit)
MySQL - 5.7.26 : Database - artomate_jun13
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`artomate_jun13` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `artomate_jun13`;

/*Table structure for table `act_attachments` */

DROP TABLE IF EXISTS `act_attachments`;

CREATE TABLE `act_attachments` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `act_id` int(10) unsigned NOT NULL,
  `attachment_link` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `act_attachments_act_id_foreign` (`act_id`),
  CONSTRAINT `act_attachments_act_id_foreign` FOREIGN KEY (`act_id`) REFERENCES `acts` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `act_attachments` */

insert  into `act_attachments`(`id`,`act_id`,`attachment_link`,`created_at`,`updated_at`) values 
(1,1,'x4ncCM83wqx6NDYs8mAIBSLrWIlpzlf66vTqtLBD.jpeg','2018-06-19 13:51:27','2018-06-19 13:51:27'),
(2,1,'FvHGhSLWMmpOvy3VtgTJI3Rw2K8YiWczRUYYhFyN.jpeg','2018-06-19 13:51:27','2018-06-19 13:51:27'),
(3,1,'8CUksCejjhjjtrkHjpinaSm7XOmSugOPBuY1oyDN.png','2018-06-19 13:51:27','2018-06-19 13:51:27');

/*Table structure for table `act_extra_services` */

DROP TABLE IF EXISTS `act_extra_services`;

CREATE TABLE `act_extra_services` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `act_id` int(10) unsigned NOT NULL,
  `service_title` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `service_amount` decimal(11,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `act_extra_services_act_id_foreign` (`act_id`),
  CONSTRAINT `act_extra_services_act_id_foreign` FOREIGN KEY (`act_id`) REFERENCES `acts` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `act_extra_services` */

insert  into `act_extra_services`(`id`,`act_id`,`service_title`,`service_amount`,`created_at`,`updated_at`) values 
(1,1,'extra service graphics designing',200.00,'2018-06-13 17:45:06','2018-06-19 13:51:26'),
(2,2,'extra service 1',240.00,'2018-06-13 18:02:00','2018-06-13 18:02:00');

/*Table structure for table `act_skills` */

DROP TABLE IF EXISTS `act_skills`;

CREATE TABLE `act_skills` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Act_id` int(10) unsigned NOT NULL,
  `Skill_id` int(10) unsigned NOT NULL,
  `skill_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `act_skills_act_id_foreign` (`Act_id`),
  KEY `act_skills_skill_id_foreign` (`Skill_id`),
  CONSTRAINT `act_skills_act_id_foreign` FOREIGN KEY (`Act_id`) REFERENCES `acts` (`id`),
  CONSTRAINT `act_skills_skill_id_foreign` FOREIGN KEY (`Skill_id`) REFERENCES `skills` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `act_skills` */

insert  into `act_skills`(`id`,`Act_id`,`Skill_id`,`skill_name`,`created_at`,`updated_at`) values 
(1,1,1,'PHP','2018-06-13 17:45:06','2018-06-13 17:45:06'),
(2,1,2,'MySQL','2018-06-13 17:45:06','2018-06-13 17:45:06'),
(3,2,1,'PHP','2018-06-13 18:02:00','2018-06-13 18:02:00'),
(4,2,2,'MySQL','2018-06-13 18:02:00','2018-06-13 18:02:00');

/*Table structure for table `act_transactions` */

DROP TABLE IF EXISTS `act_transactions`;

CREATE TABLE `act_transactions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `transaction_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `purchase_user_id` int(10) unsigned DEFAULT NULL,
  `act_id` int(10) unsigned DEFAULT NULL,
  `intent` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cart` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_method` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sub_total` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tax` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `total_amount` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `currency` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `item_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `item_price` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `item_currency` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `item_quantity` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `first_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payer_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `recipient_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `line1` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_state` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `postal_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `act_transactions` */

insert  into `act_transactions`(`id`,`transaction_id`,`purchase_user_id`,`act_id`,`intent`,`state`,`cart`,`payment_method`,`status`,`sub_total`,`tax`,`total_amount`,`currency`,`item_name`,`item_price`,`item_currency`,`item_quantity`,`email`,`first_name`,`last_name`,`payer_id`,`recipient_name`,`line1`,`city`,`shipping_state`,`postal_code`,`country_code`,`created_at`,`updated_at`) values 
(1,'PAY-6WF89554K9412492TLMUNI5Q',11,1,'sale','approved','48M54227VS563660P','paypal','VERIFIED','150.00','15.00','165.00','USD','do any designing work','150.00','USD','1','paymentest@gmail.com','Artomate','K','529YGGAH9AUQJ','Artomate K','1 Main St','San Jose','CA','95131','US','2018-06-19 15:34:15','2018-06-19 15:34:15');

/*Table structure for table `acts` */

DROP TABLE IF EXISTS `acts`;

CREATE TABLE `acts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `deadline_days` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `act_amount` decimal(11,2) NOT NULL,
  `currencie_id` int(10) unsigned NOT NULL,
  `categorie_id` int(10) unsigned NOT NULL,
  `sub_categorie_id` int(10) unsigned NOT NULL,
  `criteria_id` int(10) unsigned NOT NULL,
  `service_id` int(10) unsigned NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `requirement` varchar(1600) COLLATE utf8mb4_unicode_ci NOT NULL,
  `purchase_available` int(11) NOT NULL DEFAULT '1',
  `favariote_count` int(11) NOT NULL DEFAULT '0',
  `completed_count` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `acts_user_id_foreign` (`user_id`),
  KEY `acts_currencie_id_foreign` (`currencie_id`),
  KEY `acts_categorie_id_foreign` (`categorie_id`),
  KEY `acts_sub_categorie_id_foreign` (`sub_categorie_id`),
  KEY `acts_criteria_id_foreign` (`criteria_id`),
  KEY `acts_service_id_foreign` (`service_id`),
  CONSTRAINT `acts_categorie_id_foreign` FOREIGN KEY (`categorie_id`) REFERENCES `categories` (`id`),
  CONSTRAINT `acts_criteria_id_foreign` FOREIGN KEY (`criteria_id`) REFERENCES `criterias` (`id`),
  CONSTRAINT `acts_currencie_id_foreign` FOREIGN KEY (`currencie_id`) REFERENCES `currencies` (`id`),
  CONSTRAINT `acts_service_id_foreign` FOREIGN KEY (`service_id`) REFERENCES `services` (`id`),
  CONSTRAINT `acts_sub_categorie_id_foreign` FOREIGN KEY (`sub_categorie_id`) REFERENCES `sub_categories` (`id`),
  CONSTRAINT `acts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `acts` */

insert  into `acts`(`id`,`user_id`,`title`,`deadline_days`,`act_amount`,`currencie_id`,`categorie_id`,`sub_categorie_id`,`criteria_id`,`service_id`,`description`,`requirement`,`purchase_available`,`favariote_count`,`completed_count`,`created_at`,`updated_at`) values 
(1,10,'do any designing work','5',150.00,2,1,1,1,1,'sample description','requirement',1,1,0,'2018-06-13 17:45:06','2018-06-14 16:49:33'),
(2,10,'do some of animation','5',150.00,2,1,1,1,1,'sample descriptino','requiremnets',1,2,0,'2018-06-13 18:02:00','2018-06-14 16:57:12');

/*Table structure for table `admin_overviews` */

DROP TABLE IF EXISTS `admin_overviews`;

CREATE TABLE `admin_overviews` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `refered_by` int(11) NOT NULL DEFAULT '0',
  `refered_to` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `admin_overviews` */

insert  into `admin_overviews`(`id`,`refered_by`,`refered_to`,`created_at`,`updated_at`) values 
(1,3,1,NULL,NULL);

/*Table structure for table `affiliate_banners` */

DROP TABLE IF EXISTS `affiliate_banners`;

CREATE TABLE `affiliate_banners` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `publisher_id` int(10) unsigned NOT NULL,
  `link` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `banner_id` int(10) unsigned NOT NULL,
  `banner_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `affiliate_banners_publisher_id_foreign` (`publisher_id`),
  KEY `affiliate_banners_banner_id_foreign` (`banner_id`),
  CONSTRAINT `affiliate_banners_banner_id_foreign` FOREIGN KEY (`banner_id`) REFERENCES `banners` (`id`),
  CONSTRAINT `affiliate_banners_publisher_id_foreign` FOREIGN KEY (`publisher_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `affiliate_banners` */

/*Table structure for table `affiliate_users` */

DROP TABLE IF EXISTS `affiliate_users`;

CREATE TABLE `affiliate_users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `publisher_id` int(10) unsigned NOT NULL,
  `publisher_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `affiliate_users_publisher_id_foreign` (`publisher_id`),
  KEY `affiliate_users_user_id_foreign` (`user_id`),
  CONSTRAINT `affiliate_users_publisher_id_foreign` FOREIGN KEY (`publisher_id`) REFERENCES `users` (`id`),
  CONSTRAINT `affiliate_users_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `affiliate_users` */

/*Table structure for table `affiliates` */

DROP TABLE IF EXISTS `affiliates`;

CREATE TABLE `affiliates` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `publisher_id` int(10) unsigned NOT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount_earned` decimal(8,2) NOT NULL DEFAULT '0.00',
  `website_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `website_category` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `publisher_url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avg_visitors` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avg_views` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `affiliates_publisher_id_foreign` (`publisher_id`),
  CONSTRAINT `affiliates_publisher_id_foreign` FOREIGN KEY (`publisher_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `affiliates` */

insert  into `affiliates`(`id`,`publisher_id`,`code`,`amount_earned`,`website_name`,`website_category`,`publisher_url`,`avg_visitors`,`avg_views`,`status`,`created_at`,`updated_at`) values 
(1,11,'0e1LYK',0.00,'test sample','Education','http://test.app/affiliate','500 to 5,000','Less than 500',1,'2018-06-14 16:37:32','2018-06-14 16:37:32'),
(2,11,'ZSwbYK',0.00,'test sample','Education','http://test.app/affiliate','500 to 5,000','Less than 500',1,'2018-06-14 16:38:42','2018-06-14 16:38:42'),
(3,10,'R0mUTY',0.00,'sample tesrt','Games & Toys','http://artomate.app','Less than 500','Less than 500',1,'2018-06-14 16:39:45','2018-06-14 16:39:45');

/*Table structure for table `banners` */

DROP TABLE IF EXISTS `banners`;

CREATE TABLE `banners` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `banner_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `path` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `size` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `banners` */

/*Table structure for table `bids` */

DROP TABLE IF EXISTS `bids`;

CREATE TABLE `bids` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `project_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL COMMENT 'This ID Belongs to User who has done the Bid',
  `bid_amount` decimal(11,2) NOT NULL,
  `bid_description` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL,
  `bid_deposite` decimal(11,2) NOT NULL DEFAULT '0.00',
  `wrk_hours` int(11) DEFAULT NULL,
  `bid_seen` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `bids` */

insert  into `bids`(`id`,`project_id`,`user_id`,`bid_amount`,`bid_description`,`bid_deposite`,`wrk_hours`,`bid_seen`,`created_at`,`updated_at`) values 
(1,2,10,60.00,'smple decscj;trpitpiktkjlkgjlkfjg',20.00,30,0,'2018-06-14 12:13:30','2018-06-14 12:13:30'),
(2,2,10,40.00,'general info available',10.00,10,0,'2018-06-19 13:25:01','2018-06-19 13:25:01'),
(3,1,11,30.00,'providingn general information about the project',5.00,15,0,'2018-06-19 13:33:37','2018-06-19 13:33:37');

/*Table structure for table `blogs` */

DROP TABLE IF EXISTS `blogs`;

CREATE TABLE `blogs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `author_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `blog_title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `dev_blog_title` varchar(270) COLLATE utf8mb4_unicode_ci NOT NULL,
  `file_link` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `comment_count` int(11) NOT NULL DEFAULT '0',
  `active` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `blogs_user_id_foreign` (`user_id`),
  CONSTRAINT `blogs_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `blogs` */

insert  into `blogs`(`id`,`user_id`,`author_name`,`blog_title`,`dev_blog_title`,`file_link`,`comment_count`,`active`,`created_at`,`updated_at`) values 
(1,10,'chethan','test titlw','test-titlw','Blog/1',0,0,'2018-06-14 16:42:14','2018-06-14 16:42:14'),
(2,10,'chethan','soment slfgkg','soment-slfgkg','Blog/2',0,0,'2018-06-14 16:43:51','2018-06-14 16:43:51');

/*Table structure for table `budget_types` */

DROP TABLE IF EXISTS `budget_types`;

CREATE TABLE `budget_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `budget_type_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `budget_types` */

insert  into `budget_types`(`id`,`budget_type_name`,`created_at`,`updated_at`) values 
(1,'Hourly','2017-08-03 17:59:15','2017-08-03 17:59:15'),
(2,'Fixed','2017-08-03 17:59:15','2017-08-03 17:59:15');

/*Table structure for table `budgets` */

DROP TABLE IF EXISTS `budgets`;

CREATE TABLE `budgets` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `budget_type_id` int(10) unsigned NOT NULL,
  `currencie_id` int(10) unsigned NOT NULL,
  `min` int(11) NOT NULL,
  `max` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `budgets_budget_type_id_foreign` (`budget_type_id`),
  KEY `budgets_currencie_id_foreign` (`currencie_id`),
  CONSTRAINT `budgets_budget_type_id_foreign` FOREIGN KEY (`budget_type_id`) REFERENCES `budget_types` (`id`),
  CONSTRAINT `budgets_currencie_id_foreign` FOREIGN KEY (`currencie_id`) REFERENCES `currencies` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `budgets` */

insert  into `budgets`(`id`,`budget_type_id`,`currencie_id`,`min`,`max`,`created_at`,`updated_at`) values 
(1,1,1,20,40,'2017-08-03 17:59:15','2017-08-03 17:59:15'),
(2,1,1,40,80,'2017-08-03 17:59:15','2017-08-03 17:59:15'),
(3,1,1,80,150,'2017-08-03 17:59:15','2017-08-03 17:59:15'),
(4,1,2,5,25,'2017-08-03 17:59:15','2017-08-03 17:59:15'),
(5,1,2,25,50,'2017-08-03 17:59:15','2017-08-03 17:59:15'),
(6,1,2,50,80,'2017-08-03 17:59:15','2017-08-03 17:59:15'),
(7,2,1,1000,2000,'2017-08-03 17:59:15','2017-08-03 17:59:15'),
(8,2,1,2000,3500,'2017-08-03 17:59:15','2017-08-03 17:59:15'),
(9,2,1,3500,7000,'2017-08-03 17:59:15','2017-08-03 17:59:15'),
(10,2,2,500,1000,'2017-08-03 17:59:15','2017-08-03 17:59:15'),
(11,2,2,1000,1750,'2017-08-03 17:59:15','2017-08-03 17:59:15'),
(12,2,2,1750,2500,'2017-08-03 17:59:15','2017-08-03 17:59:15');

/*Table structure for table `categories` */

DROP TABLE IF EXISTS `categories`;

CREATE TABLE `categories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `category_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_route` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `categories` */

insert  into `categories`(`id`,`category_name`,`category_route`,`created_at`,`updated_at`) values 
(1,'Graphics and Design','graphics-and-design','2017-08-03 17:59:15','2017-08-03 17:59:15'),
(2,'Digital Marketing and Advertising','digital-marketing-and-advertising','2017-08-03 17:59:15','2017-08-03 17:59:15'),
(3,'Web and Mobile Application','web-and-mobile-application','2017-08-03 17:59:15','2017-08-03 17:59:15'),
(4,'Video and Animation','video-and-animation','2017-08-03 17:59:15','2017-08-03 17:59:15'),
(5,'Music and Voice Over','music-and-voice-over','2017-08-03 17:59:15','2017-08-03 17:59:15'),
(6,'Writing and Translation','writing-and-translation','2017-08-03 17:59:15','2017-08-03 17:59:15'),
(7,'Business and Accounts','business-and-accounts','2017-08-03 17:59:15','2017-08-03 17:59:15');

/*Table structure for table `chats` */

DROP TABLE IF EXISTS `chats`;

CREATE TABLE `chats` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `project_id` int(10) unsigned NOT NULL,
  `full_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `profile_picture` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `selected_user_id` int(10) unsigned NOT NULL,
  `selected_full_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `selected_profile_picture` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `channel_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `chats_user_id_foreign` (`user_id`),
  KEY `chats_selected_user_id_foreign` (`selected_user_id`),
  KEY `chats_project_id_foreign` (`project_id`),
  CONSTRAINT `chats_project_id_foreign` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`),
  CONSTRAINT `chats_selected_user_id_foreign` FOREIGN KEY (`selected_user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `chats_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `chats` */

/*Table structure for table `countries` */

DROP TABLE IF EXISTS `countries`;

CREATE TABLE `countries` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `country_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `country_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `language_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=246 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `countries` */

insert  into `countries`(`id`,`country_code`,`country_name`,`language_code`,`created_at`,`updated_at`) values 
(1,'AF','Afghanistan',NULL,NULL,NULL),
(2,'AL','Albania',NULL,NULL,NULL),
(3,'DZ','Algeria',NULL,NULL,NULL),
(4,'DS','American Samoa',NULL,NULL,NULL),
(5,'AD','Andorra',NULL,NULL,NULL),
(6,'AO','Angola',NULL,NULL,NULL),
(7,'AI','Anguilla',NULL,NULL,NULL),
(8,'AQ','Antarctica',NULL,NULL,NULL),
(9,'AG','Antigua and Barbuda',NULL,NULL,NULL),
(10,'AR','Argentina',NULL,NULL,NULL),
(11,'AM','Armenia',NULL,NULL,NULL),
(12,'AW','Aruba',NULL,NULL,NULL),
(13,'AU','Australia',NULL,NULL,NULL),
(14,'AT','Austria',NULL,NULL,NULL),
(15,'AZ','Azerbaijan',NULL,NULL,NULL),
(16,'BS','Bahamas',NULL,NULL,NULL),
(17,'BH','Bahrain',NULL,NULL,NULL),
(18,'BD','Bangladesh',NULL,NULL,NULL),
(19,'BB','Barbados',NULL,NULL,NULL),
(20,'BY','Belarus',NULL,NULL,NULL),
(21,'BE','Belgium',NULL,NULL,NULL),
(22,'BZ','Belize',NULL,NULL,NULL),
(23,'BJ','Benin',NULL,NULL,NULL),
(24,'BM','Bermuda',NULL,NULL,NULL),
(25,'BT','Bhutan',NULL,NULL,NULL),
(26,'BO','Bolivia',NULL,NULL,NULL),
(27,'BA','Bosnia and Herzegovina',NULL,NULL,NULL),
(28,'BW','Botswana',NULL,NULL,NULL),
(29,'BV','Bouvet Island',NULL,NULL,NULL),
(30,'BR','Brazil',NULL,NULL,NULL),
(31,'IO','British Indian Ocean Territory',NULL,NULL,NULL),
(32,'BN','Brunei Darussalam',NULL,NULL,NULL),
(33,'BG','Bulgaria',NULL,NULL,NULL),
(34,'BF','Burkina Faso',NULL,NULL,NULL),
(35,'BI','Burundi',NULL,NULL,NULL),
(36,'KH','Cambodia',NULL,NULL,NULL),
(37,'CM','Cameroon',NULL,NULL,NULL),
(38,'CA','Canada',NULL,NULL,NULL),
(39,'CV','Cape Verde',NULL,NULL,NULL),
(40,'KY','Cayman Islands',NULL,NULL,NULL),
(41,'CF','Central African Republic',NULL,NULL,NULL),
(42,'TD','Chad',NULL,NULL,NULL),
(43,'CL','Chile',NULL,NULL,NULL),
(44,'CN','China',NULL,NULL,NULL),
(45,'CX','Christmas Island',NULL,NULL,NULL),
(46,'CC','Cocos (Keeling) Islands',NULL,NULL,NULL),
(47,'CO','Colombia',NULL,NULL,NULL),
(48,'KM','Comoros',NULL,NULL,NULL),
(49,'CG','Congo',NULL,NULL,NULL),
(50,'CK','Cook Islands',NULL,NULL,NULL),
(51,'CR','Costa Rica',NULL,NULL,NULL),
(52,'HR','Croatia (Hrvatska)',NULL,NULL,NULL),
(53,'CU','Cuba',NULL,NULL,NULL),
(54,'CY','Cyprus',NULL,NULL,NULL),
(55,'CZ','Czech Republic',NULL,NULL,NULL),
(56,'DK','Denmark',NULL,NULL,NULL),
(57,'DJ','Djibouti',NULL,NULL,NULL),
(58,'DM','Dominica',NULL,NULL,NULL),
(59,'DO','Dominican Republic',NULL,NULL,NULL),
(60,'TP','East Timor',NULL,NULL,NULL),
(61,'EC','Ecuador',NULL,NULL,NULL),
(62,'EG','Egypt',NULL,NULL,NULL),
(63,'SV','El Salvador',NULL,NULL,NULL),
(64,'GQ','Equatorial Guinea',NULL,NULL,NULL),
(65,'ER','Eritrea',NULL,NULL,NULL),
(66,'EE','Estonia',NULL,NULL,NULL),
(67,'ET','Ethiopia',NULL,NULL,NULL),
(68,'FK','Falkland Islands (Malvinas)',NULL,NULL,NULL),
(69,'FO','Faroe Islands',NULL,NULL,NULL),
(70,'FJ','Fiji',NULL,NULL,NULL),
(71,'FI','Finland',NULL,NULL,NULL),
(72,'FR','France',NULL,NULL,NULL),
(73,'FX','France, Metropolitan',NULL,NULL,NULL),
(74,'GF','French Guiana',NULL,NULL,NULL),
(75,'PF','French Polynesia',NULL,NULL,NULL),
(76,'TF','French Southern Territories',NULL,NULL,NULL),
(77,'GA','Gabon',NULL,NULL,NULL),
(78,'GM','Gambia',NULL,NULL,NULL),
(79,'GE','Georgia',NULL,NULL,NULL),
(80,'DE','Germany',NULL,NULL,NULL),
(81,'GH','Ghana',NULL,NULL,NULL),
(82,'GI','Gibraltar',NULL,NULL,NULL),
(83,'GK','Guernsey',NULL,NULL,NULL),
(84,'GR','Greece',NULL,NULL,NULL),
(85,'GL','Greenland',NULL,NULL,NULL),
(86,'GD','Grenada',NULL,NULL,NULL),
(87,'GP','Guadeloupe',NULL,NULL,NULL),
(88,'GU','Guam',NULL,NULL,NULL),
(89,'GT','Guatemala',NULL,NULL,NULL),
(90,'GN','Guinea',NULL,NULL,NULL),
(91,'GW','Guinea-Bissau',NULL,NULL,NULL),
(92,'GY','Guyana',NULL,NULL,NULL),
(93,'HT','Haiti',NULL,NULL,NULL),
(94,'HM','Heard and Mc Donald Islands',NULL,NULL,NULL),
(95,'HN','Honduras',NULL,NULL,NULL),
(96,'HK','Hong Kong',NULL,NULL,NULL),
(97,'HU','Hungary',NULL,NULL,NULL),
(98,'IS','Iceland',NULL,NULL,NULL),
(99,'IN','India',NULL,NULL,NULL),
(100,'IM','Isle of Man',NULL,NULL,NULL),
(101,'ID','Indonesia',NULL,NULL,NULL),
(102,'IR','Iran (Islamic Republic of)',NULL,NULL,NULL),
(103,'IQ','Iraq',NULL,NULL,NULL),
(104,'IE','Ireland',NULL,NULL,NULL),
(105,'IL','Israel',NULL,NULL,NULL),
(106,'IT','Italy',NULL,NULL,NULL),
(107,'CI','Ivory Coast',NULL,NULL,NULL),
(108,'JE','Jersey',NULL,NULL,NULL),
(109,'JM','Jamaica',NULL,NULL,NULL),
(110,'JP','Japan',NULL,NULL,NULL),
(111,'JO','Jordan',NULL,NULL,NULL),
(112,'KZ','Kazakhstan',NULL,NULL,NULL),
(113,'KE','Kenya',NULL,NULL,NULL),
(114,'KI','Kiribati',NULL,NULL,NULL),
(115,'KP','Korea, Democratic People\'s Republic of',NULL,NULL,NULL),
(116,'KR','Korea, Republic of',NULL,NULL,NULL),
(117,'XK','Kosovo',NULL,NULL,NULL),
(118,'KW','Kuwait',NULL,NULL,NULL),
(119,'KG','Kyrgyzstan',NULL,NULL,NULL),
(120,'LA','Lao People\'s Democratic Republic',NULL,NULL,NULL),
(121,'LV','Latvia',NULL,NULL,NULL),
(122,'LB','Lebanon',NULL,NULL,NULL),
(123,'LS','Lesotho',NULL,NULL,NULL),
(124,'LR','Liberia',NULL,NULL,NULL),
(125,'LY','Libyan Arab Jamahiriya',NULL,NULL,NULL),
(126,'LI','Liechtenstein',NULL,NULL,NULL),
(127,'LT','Lithuania',NULL,NULL,NULL),
(128,'LU','Luxembourg',NULL,NULL,NULL),
(129,'MO','Macau',NULL,NULL,NULL),
(130,'MK','Macedonia',NULL,NULL,NULL),
(131,'MG','Madagascar',NULL,NULL,NULL),
(132,'MW','Malawi',NULL,NULL,NULL),
(133,'MY','Malaysia',NULL,NULL,NULL),
(134,'MV','Maldives',NULL,NULL,NULL),
(135,'ML','Mali',NULL,NULL,NULL),
(136,'MT','Malta',NULL,NULL,NULL),
(137,'MH','Marshall Islands',NULL,NULL,NULL),
(138,'MQ','Martinique',NULL,NULL,NULL),
(139,'MR','Mauritania',NULL,NULL,NULL),
(140,'MU','Mauritius',NULL,NULL,NULL),
(141,'TY','Mayotte',NULL,NULL,NULL),
(142,'MX','Mexico',NULL,NULL,NULL),
(143,'FM','Micronesia, Federated States of',NULL,NULL,NULL),
(144,'MD','Moldova, Republic of',NULL,NULL,NULL),
(145,'MC','Monaco',NULL,NULL,NULL),
(146,'MN','Mongolia',NULL,NULL,NULL),
(147,'ME','Montenegro',NULL,NULL,NULL),
(148,'MS','Montserrat',NULL,NULL,NULL),
(149,'MA','Morocco',NULL,NULL,NULL),
(150,'MZ','Mozambique',NULL,NULL,NULL),
(151,'MM','Myanmar',NULL,NULL,NULL),
(152,'NA','Namibia',NULL,NULL,NULL),
(153,'NR','Nauru',NULL,NULL,NULL),
(154,'NP','Nepal',NULL,NULL,NULL),
(155,'NL','Netherlands',NULL,NULL,NULL),
(156,'AN','Netherlands Antilles',NULL,NULL,NULL),
(157,'NC','New Caledonia',NULL,NULL,NULL),
(158,'NZ','New Zealand',NULL,NULL,NULL),
(159,'NI','Nicaragua',NULL,NULL,NULL),
(160,'NE','Niger',NULL,NULL,NULL),
(161,'NG','Nigeria',NULL,NULL,NULL),
(162,'NU','Niue',NULL,NULL,NULL),
(163,'NF','Norfolk Island',NULL,NULL,NULL),
(164,'MP','Northern Mariana Islands',NULL,NULL,NULL),
(165,'NO','Norway',NULL,NULL,NULL),
(166,'OM','Oman',NULL,NULL,NULL),
(167,'PK','Pakistan',NULL,NULL,NULL),
(168,'PW','Palau',NULL,NULL,NULL),
(169,'PS','Palestine',NULL,NULL,NULL),
(170,'PA','Panama',NULL,NULL,NULL),
(171,'PG','Papua New Guinea',NULL,NULL,NULL),
(172,'PY','Paraguay',NULL,NULL,NULL),
(173,'PE','Peru',NULL,NULL,NULL),
(174,'PH','Philippines',NULL,NULL,NULL),
(175,'PN','Pitcairn',NULL,NULL,NULL),
(176,'PL','Poland',NULL,NULL,NULL),
(177,'PT','Portugal',NULL,NULL,NULL),
(178,'PR','Puerto Rico',NULL,NULL,NULL),
(179,'QA','Qatar',NULL,NULL,NULL),
(180,'RE','Reunion',NULL,NULL,NULL),
(181,'RO','Romania',NULL,NULL,NULL),
(182,'RU','Russian Federation',NULL,NULL,NULL),
(183,'RW','Rwanda',NULL,NULL,NULL),
(184,'KN','Saint Kitts and Nevis',NULL,NULL,NULL),
(185,'LC','Saint Lucia',NULL,NULL,NULL),
(186,'VC','Saint Vincent and the Grenadines',NULL,NULL,NULL),
(187,'WS','Samoa',NULL,NULL,NULL),
(188,'SM','San Marino',NULL,NULL,NULL),
(189,'ST','Sao Tome and Principe',NULL,NULL,NULL),
(190,'SA','Saudi Arabia',NULL,NULL,NULL),
(191,'SN','Senegal',NULL,NULL,NULL),
(192,'RS','Serbia',NULL,NULL,NULL),
(193,'SC','Seychelles',NULL,NULL,NULL),
(194,'SL','Sierra Leone',NULL,NULL,NULL),
(195,'SG','Singapore',NULL,NULL,NULL),
(196,'SK','Slovakia',NULL,NULL,NULL),
(197,'SI','Slovenia',NULL,NULL,NULL),
(198,'SB','Solomon Islands',NULL,NULL,NULL),
(199,'SO','Somalia',NULL,NULL,NULL),
(200,'ZA','South Africa',NULL,NULL,NULL),
(201,'GS','South Georgia South Sandwich Islands',NULL,NULL,NULL),
(202,'ES','Spain',NULL,NULL,NULL),
(203,'LK','Sri Lanka',NULL,NULL,NULL),
(204,'SH','St. Helena',NULL,NULL,NULL),
(205,'PM','St. Pierre and Miquelon',NULL,NULL,NULL),
(206,'SD','Sudan',NULL,NULL,NULL),
(207,'SR','Suriname',NULL,NULL,NULL),
(208,'SJ','Svalbard and Jan Mayen Islands',NULL,NULL,NULL),
(209,'SZ','Swaziland',NULL,NULL,NULL),
(210,'SE','Sweden',NULL,NULL,NULL),
(211,'CH','Switzerland',NULL,NULL,NULL),
(212,'SY','Syrian Arab Republic',NULL,NULL,NULL),
(213,'TW','Taiwan',NULL,NULL,NULL),
(214,'TJ','Tajikistan',NULL,NULL,NULL),
(215,'TZ','Tanzania, United Republic of',NULL,NULL,NULL),
(216,'TH','Thailand',NULL,NULL,NULL),
(217,'TG','Togo',NULL,NULL,NULL),
(218,'TK','Tokelau',NULL,NULL,NULL),
(219,'TO','Tonga',NULL,NULL,NULL),
(220,'TT','Trinidad and Tobago',NULL,NULL,NULL),
(221,'TN','Tunisia',NULL,NULL,NULL),
(222,'TR','Turkey',NULL,NULL,NULL),
(223,'TM','Turkmenistan',NULL,NULL,NULL),
(224,'TC','Turks and Caicos Islands',NULL,NULL,NULL),
(225,'TV','Tuvalu',NULL,NULL,NULL),
(226,'UG','Uganda',NULL,NULL,NULL),
(227,'UA','Ukraine',NULL,NULL,NULL),
(228,'AE','United Arab Emirates',NULL,NULL,NULL),
(229,'GB','United Kingdom',NULL,NULL,NULL),
(230,'US','United States',NULL,NULL,NULL),
(231,'UM','United States minor outlying islands',NULL,NULL,NULL),
(232,'UY','Uruguay',NULL,NULL,NULL),
(233,'UZ','Uzbekistan',NULL,NULL,NULL),
(234,'VU','Vanuatu',NULL,NULL,NULL),
(235,'VA','Vatican City State',NULL,NULL,NULL),
(236,'VE','Venezuela',NULL,NULL,NULL),
(237,'VN','Vietnam',NULL,NULL,NULL),
(238,'VG','Virgin Islands (British)',NULL,NULL,NULL),
(239,'VI','Virgin Islands (U.S.)',NULL,NULL,NULL),
(240,'WF','Wallis and Futuna Islands',NULL,NULL,NULL),
(241,'EH','Western Sahara',NULL,NULL,NULL),
(242,'YE','Yemen',NULL,NULL,NULL),
(243,'ZR','Zaire',NULL,NULL,NULL),
(244,'ZM','Zambia',NULL,NULL,NULL),
(245,'ZW','Zimbabwe',NULL,NULL,NULL);

/*Table structure for table `criterias` */

DROP TABLE IF EXISTS `criterias`;

CREATE TABLE `criterias` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sub_categorie_id` int(10) unsigned NOT NULL,
  `criteria_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `criterias_sub_categorie_id_foreign` (`sub_categorie_id`),
  CONSTRAINT `criterias_sub_categorie_id_foreign` FOREIGN KEY (`sub_categorie_id`) REFERENCES `sub_categories` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `criterias` */

insert  into `criterias`(`id`,`sub_categorie_id`,`criteria_name`,`created_at`,`updated_at`) values 
(1,1,'Laravel Something','2017-10-27 13:53:00','2017-10-27 13:53:00'),
(2,1,'Laravel Something','2017-10-27 13:53:00','2017-10-27 13:53:00'),
(3,2,'Codeigintor Something','2017-10-27 13:53:00','2017-10-27 13:53:00'),
(4,3,'Android Something','2017-10-27 13:53:00','2017-10-27 13:53:00'),
(5,3,'Android Something','2017-10-27 13:53:00','2017-10-27 13:53:00'),
(6,4,'IOS Something','2017-10-27 13:53:00','2017-10-27 13:53:00'),
(7,5,'Oracle Something','2017-10-27 13:53:00','2017-10-27 13:53:00');

/*Table structure for table `currencies` */

DROP TABLE IF EXISTS `currencies`;

CREATE TABLE `currencies` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `currency_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `currency_symbol` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `currencies` */

insert  into `currencies`(`id`,`currency_type`,`currency_symbol`,`created_at`,`updated_at`) values 
(1,'INR','₹','2017-10-27 13:20:14','2017-10-27 13:20:14'),
(2,'USD','$','2017-10-27 13:20:14','2017-10-27 13:20:14');

/*Table structure for table `custom_attachments` */

DROP TABLE IF EXISTS `custom_attachments`;

CREATE TABLE `custom_attachments` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `custom_id` int(10) unsigned NOT NULL,
  `attachment_link` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `custom_attachments_custom_id_foreign` (`custom_id`),
  CONSTRAINT `custom_attachments_custom_id_foreign` FOREIGN KEY (`custom_id`) REFERENCES `custom_orders` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `custom_attachments` */

insert  into `custom_attachments`(`id`,`custom_id`,`attachment_link`,`created_at`,`updated_at`) values 
(1,1,'B19Mo0EDGTH4rWDKiNeepfy1AP6sGQEQCAXFIFkn.jpeg','2018-06-14 15:11:05','2018-06-14 15:11:05'),
(2,1,'QGHSYIVcgHtSWMEpPQxCjr9P9IWctzv5VHNC33AR.jpeg','2018-06-14 15:11:05','2018-06-14 15:11:05'),
(3,1,'NvrsIcmQajJUsaVI6ZdzYfRnf4qfIEOun6imqAPN.png','2018-06-14 15:11:05','2018-06-14 15:11:05'),
(4,2,'6uZvbglOlU0vQcsU6u5SZEjWEnlBX1wzT2kAxTpv.png','2018-06-14 15:22:37','2018-06-14 15:22:37'),
(5,2,'6PDUGHbaJu24GHiV9GT0Rc6ODohyRqwiqNFGBJ23.jpeg','2018-06-14 15:22:37','2018-06-14 15:22:37'),
(6,2,'ht2q0VrWSe8FxJSneqXuB7V2OYeSOptXKLj4oqOK.png','2018-06-14 15:22:37','2018-06-14 15:22:37'),
(7,3,'9w0x7eZXt1jipi2ypw08XOylILshhTbNNWZeh6aM.png','2018-06-22 17:34:30','2018-06-22 17:34:30');

/*Table structure for table `custom_order_transactions` */

DROP TABLE IF EXISTS `custom_order_transactions`;

CREATE TABLE `custom_order_transactions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `transaction_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` int(10) unsigned DEFAULT NULL,
  `custom_order_id` int(10) unsigned DEFAULT NULL,
  `intent` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cart` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_method` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sub_total` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tax` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `total_amount` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `currency` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `item_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `item_price` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `item_currency` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `item_quantity` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `first_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payer_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `recipient_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `line1` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_state` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `postal_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `custom_order_transactions` */

/*Table structure for table `custom_orders` */

DROP TABLE IF EXISTS `custom_orders`;

CREATE TABLE `custom_orders` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `deadline` date NOT NULL,
  `categorie_id` int(10) unsigned NOT NULL,
  `sub_categorie_id` int(10) unsigned NOT NULL,
  `budget_type_id` int(10) unsigned DEFAULT NULL,
  `currencie_id` int(10) unsigned DEFAULT NULL,
  `budget_id` int(10) unsigned DEFAULT NULL,
  `min` int(11) DEFAULT NULL,
  `max` int(11) DEFAULT NULL,
  `attachment_id` int(10) unsigned DEFAULT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `freelancer_id` int(10) unsigned DEFAULT NULL,
  `custom_description` text COLLATE utf8mb4_unicode_ci,
  `custom_amount` decimal(11,2) NOT NULL DEFAULT '0.00',
  `status` int(11) DEFAULT NULL,
  `seen` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `custom_orders_categorie_id_foreign` (`categorie_id`),
  KEY `custom_orders_sub_categorie_id_foreign` (`sub_categorie_id`),
  KEY `custom_orders_budget_type_id_foreign` (`budget_type_id`),
  KEY `custom_orders_currencie_id_foreign` (`currencie_id`),
  KEY `custom_orders_budget_id_foreign` (`budget_id`),
  KEY `custom_orders_attachment_id_foreign` (`attachment_id`),
  KEY `custom_orders_user_id_foreign` (`user_id`),
  KEY `custom_orders_freelancer_id_foreign` (`freelancer_id`),
  CONSTRAINT `custom_orders_attachment_id_foreign` FOREIGN KEY (`attachment_id`) REFERENCES `project_attachments` (`id`),
  CONSTRAINT `custom_orders_budget_id_foreign` FOREIGN KEY (`budget_id`) REFERENCES `budgets` (`id`),
  CONSTRAINT `custom_orders_budget_type_id_foreign` FOREIGN KEY (`budget_type_id`) REFERENCES `budget_types` (`id`),
  CONSTRAINT `custom_orders_categorie_id_foreign` FOREIGN KEY (`categorie_id`) REFERENCES `categories` (`id`),
  CONSTRAINT `custom_orders_currencie_id_foreign` FOREIGN KEY (`currencie_id`) REFERENCES `currencies` (`id`),
  CONSTRAINT `custom_orders_freelancer_id_foreign` FOREIGN KEY (`freelancer_id`) REFERENCES `users` (`id`),
  CONSTRAINT `custom_orders_sub_categorie_id_foreign` FOREIGN KEY (`sub_categorie_id`) REFERENCES `sub_categories` (`id`),
  CONSTRAINT `custom_orders_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `custom_orders` */

insert  into `custom_orders`(`id`,`description`,`deadline`,`categorie_id`,`sub_categorie_id`,`budget_type_id`,`currencie_id`,`budget_id`,`min`,`max`,`attachment_id`,`user_id`,`freelancer_id`,`custom_description`,`custom_amount`,`status`,`seen`,`created_at`,`updated_at`) values 
(1,'sample descriptionj kdjfg ure e e hfh dfjjf kjfhgj fkjghfgkj','2018-06-22',1,1,2,2,10,500,1000,NULL,11,10,NULL,0.00,7,0,'2018-06-14 15:11:05','2018-06-14 15:21:19'),
(2,'seplmmsm decriptiononon dkmg dkfgm g','2018-06-16',1,2,2,2,11,1000,1750,NULL,10,11,'sample descriotionon peoeiieiekekxkjh',300.00,2,0,'2018-06-14 15:22:37','2018-06-14 15:37:11'),
(3,'&lt;h1 style=&quot;color: rgb(68, 68, 68); margin-bottom: 0px; font-size: 1.6em;&quot;&gt;&lt;span style=&quot;color: rgb(68, 68, 68); margin-bottom: 0px; font-size: 1.6em;&quot;&gt;please provide your request details below and I&rsquo;ll get back to you.&lt;/span&gt;&lt;/h1&gt;','2018-06-26',1,1,2,2,10,500,1000,NULL,10,11,NULL,0.00,0,0,'2018-06-22 17:34:30','2018-06-22 17:42:40');

/*Table structure for table `education` */

DROP TABLE IF EXISTS `education`;

CREATE TABLE `education` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `institute_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `institute_name` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `from_date` date NOT NULL,
  `to_date` date NOT NULL,
  `country_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `country_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `education_user_id_foreign` (`user_id`),
  CONSTRAINT `education_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `education` */

insert  into `education`(`id`,`user_id`,`institute_type`,`institute_name`,`from_date`,`to_date`,`country_code`,`country_name`,`created_at`,`updated_at`) values 
(1,10,'School','instituut','2018-06-15','2018-06-29','BD','Bangladesh','2018-06-13 17:30:35','2018-06-13 17:30:35');

/*Table structure for table `experiences` */

DROP TABLE IF EXISTS `experiences`;

CREATE TABLE `experiences` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `experience` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `experiences` */

insert  into `experiences`(`id`,`experience`,`created_at`,`updated_at`) values 
(1,'Beginner','2017-10-27 13:53:00','2017-10-27 13:53:00'),
(2,'Intermediate','2017-10-27 13:53:00','2017-10-27 13:53:00'),
(3,'Standard','2017-10-27 13:53:00','2017-10-27 13:53:00'),
(4,'Professional','2017-10-27 13:53:00','2017-10-27 13:53:00'),
(5,'Ultimate','2017-10-27 13:53:00','2017-10-27 13:53:00');

/*Table structure for table `failed_jobs` */

DROP TABLE IF EXISTS `failed_jobs`;

CREATE TABLE `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `failed_jobs` */

/*Table structure for table `favariote_acts` */

DROP TABLE IF EXISTS `favariote_acts`;

CREATE TABLE `favariote_acts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `favariote_act_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `favariote_acts_user_id_foreign` (`user_id`),
  KEY `favariote_acts_favariote_act_id_foreign` (`favariote_act_id`),
  CONSTRAINT `favariote_acts_favariote_act_id_foreign` FOREIGN KEY (`favariote_act_id`) REFERENCES `acts` (`id`),
  CONSTRAINT `favariote_acts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `favariote_acts` */

insert  into `favariote_acts`(`id`,`user_id`,`favariote_act_id`,`created_at`,`updated_at`) values 
(1,11,2,'2018-06-14 16:49:15','2018-06-14 16:49:15'),
(2,11,1,'2018-06-14 16:49:33','2018-06-14 16:49:33'),
(3,10,2,'2018-06-14 16:57:12','2018-06-14 16:57:12');

/*Table structure for table `favariote_users` */

DROP TABLE IF EXISTS `favariote_users`;

CREATE TABLE `favariote_users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `favariote_user_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `favariote_users_user_id_foreign` (`user_id`),
  KEY `favariote_users_favariote_user_id_foreign` (`favariote_user_id`),
  CONSTRAINT `favariote_users_favariote_user_id_foreign` FOREIGN KEY (`favariote_user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `favariote_users_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `favariote_users` */

insert  into `favariote_users`(`id`,`user_id`,`favariote_user_id`,`created_at`,`updated_at`) values 
(1,10,11,'2018-06-14 16:57:35','2018-06-14 16:57:35');

/*Table structure for table `forums` */

DROP TABLE IF EXISTS `forums`;

CREATE TABLE `forums` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `forum_title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Dev_forum_title` varchar(270) COLLATE utf8mb4_unicode_ci NOT NULL,
  `file_link` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `comment_count` int(11) NOT NULL DEFAULT '0',
  `active` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `forums_user_id_foreign` (`user_id`),
  CONSTRAINT `forums_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `forums` */

/*Table structure for table `jobs` */

DROP TABLE IF EXISTS `jobs`;

CREATE TABLE `jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `queue` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint(3) unsigned NOT NULL,
  `reserved_at` int(10) unsigned DEFAULT NULL,
  `available_at` int(10) unsigned NOT NULL,
  `created_at` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_reserved_at_index` (`queue`(191),`reserved_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `jobs` */

/*Table structure for table `languages` */

DROP TABLE IF EXISTS `languages`;

CREATE TABLE `languages` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `language_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `languages` */

insert  into `languages`(`id`,`language_name`,`created_at`,`updated_at`) values 
(1,'English','2017-10-27 13:53:00','2017-10-27 13:53:00'),
(2,'Spainesh','2017-10-27 13:53:00','2017-10-27 13:53:00'),
(3,'French','2017-10-27 13:53:00','2017-10-27 13:53:00'),
(4,'Japinesh','2017-10-27 13:53:00','2017-10-27 13:53:00'),
(5,'Italyian','2017-10-27 13:53:00','2017-10-27 13:53:00');

/*Table structure for table `messages` */

DROP TABLE IF EXISTS `messages`;

CREATE TABLE `messages` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `chat_id` int(10) unsigned NOT NULL,
  `channel_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `m_from` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `m_to` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` varchar(1000) COLLATE utf8mb4_unicode_ci NOT NULL,
  `seen` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `messages_chat_id_foreign` (`chat_id`),
  CONSTRAINT `messages_chat_id_foreign` FOREIGN KEY (`chat_id`) REFERENCES `chats` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `messages` */

/*Table structure for table `migrations` */

DROP TABLE IF EXISTS `migrations`;

CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `migrations` */

insert  into `migrations`(`id`,`migration`,`batch`) values 
(1,'2014_10_12_000000_create_users_table',1),
(2,'2014_10_12_100000_create_password_resets_table',1),
(3,'2017_06_12_065315_create_experiences_table',1),
(4,'2017_06_12_141513_create_categories_table',1),
(5,'2017_06_12_141641_create_sub_categories_table',1),
(6,'2017_06_12_141654_create_skills_table',1),
(7,'2017_06_12_142016_create_budget_types_table',1),
(8,'2017_06_12_142137_create_currencies_table',1),
(9,'2017_06_12_142316_create_budgets_table',1),
(10,'2017_06_13_101851_create_countries_table',1),
(11,'2017_06_14_072103_create_projects_table',1),
(12,'2017_06_15_061936_create_project_skills_table',1),
(13,'2017_06_15_080406_create_project_attachments_table',1),
(14,'2017_06_15_082050_create_user_skills_table',1),
(15,'2017_06_22_031903_create_workdays_table',1),
(16,'2017_06_22_040201_create_criterias_table',1),
(17,'2017_06_22_041256_create_services_table',1),
(18,'2017_06_22_054123_create_acts_table',1),
(19,'2017_06_23_093940_create_act_attachments_table',1),
(20,'2017_06_23_121549_create_languages_table',1),
(21,'2017_06_27_160829_create_bids_table',1),
(22,'2017_06_30_065423_create_work_experiences_table',1),
(23,'2017_06_30_065436_create_education_table',1),
(24,'2017_07_12_101036_create_user_languages_table',1),
(25,'2017_07_12_105510_create_favariote_acts_table',1),
(26,'2017_07_13_073115_create_favariote_users_table',1),
(27,'2017_07_15_095013_create_act_skills_table',1),
(28,'2017_07_17_060437_create_chats_table',1),
(29,'2017_07_17_073202_create_messages_table',1),
(30,'2017_07_20_132918_create_custom_orders_table',1),
(31,'2017_07_21_080406_create_custom_attachments_table',1),
(32,'2017_08_01_115841_create_promo_codes_table',1),
(33,'2017_08_07_073846_create_admin_overviews_table',1),
(34,'2017_08_22_071825_create_forums_table',1),
(35,'2017_09_08_051046_create_blogs_table',1),
(36,'2017_09_25_091232_create_failed_jobs_table',1),
(37,'2017_10_11_091705_create_verifications_table',1),
(38,'2017_10_11_100715_create_act_extra_services_table',1),
(39,'2017_10_16_130138_create_jobs_table',1),
(40,'2017_10_18_071807_create_pending_act_comments_table',1),
(41,'2017_10_31_125107_create_act_transaction_details_table',1),
(42,'2017_11_07_072303_create_project_transaction_table',1),
(43,'2017_11_09_114704_create_custom_order_transaction_table',1),
(44,'2017_11_17_074949_create_ongoing_acts_table',1),
(45,'2017_11_18_112226_create_ongoing_projects_table',1),
(46,'2017_11_21_072517_create_project_ratings_table',1),
(47,'2017_12_19_110633_create_affiliates_table',1),
(48,'2017_12_19_124309_create_banners_table',1),
(49,'2017_12_20_073856_create_affiliate_banners_table',1),
(50,'2017_12_21_053019_create_affiliate_users_table',1);

/*Table structure for table `ongoing_acts` */

DROP TABLE IF EXISTS `ongoing_acts`;

CREATE TABLE `ongoing_acts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `act_id` int(10) unsigned NOT NULL,
  `time` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` int(10) unsigned NOT NULL,
  `customer` int(10) unsigned NOT NULL,
  `total_days` int(11) NOT NULL,
  `transaction_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ongoing_acts_act_id_foreign` (`act_id`),
  KEY `ongoing_acts_owner_foreign` (`owner`),
  KEY `ongoing_acts_customer_foreign` (`customer`),
  CONSTRAINT `ongoing_acts_act_id_foreign` FOREIGN KEY (`act_id`) REFERENCES `acts` (`id`),
  CONSTRAINT `ongoing_acts_customer_foreign` FOREIGN KEY (`customer`) REFERENCES `users` (`id`),
  CONSTRAINT `ongoing_acts_owner_foreign` FOREIGN KEY (`owner`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `ongoing_acts` */

/*Table structure for table `ongoing_projects` */

DROP TABLE IF EXISTS `ongoing_projects`;

CREATE TABLE `ongoing_projects` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `project_id` int(10) unsigned NOT NULL,
  `client` int(10) unsigned NOT NULL,
  `freelancer` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ongoing_projects_project_id_foreign` (`project_id`),
  KEY `ongoing_projects_client_foreign` (`client`),
  KEY `ongoing_projects_freelancer_foreign` (`freelancer`),
  CONSTRAINT `ongoing_projects_client_foreign` FOREIGN KEY (`client`) REFERENCES `users` (`id`),
  CONSTRAINT `ongoing_projects_freelancer_foreign` FOREIGN KEY (`freelancer`) REFERENCES `users` (`id`),
  CONSTRAINT `ongoing_projects_project_id_foreign` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `ongoing_projects` */

/*Table structure for table `password_resets` */

DROP TABLE IF EXISTS `password_resets`;

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`(191))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `password_resets` */

/*Table structure for table `pending_act_comments` */

DROP TABLE IF EXISTS `pending_act_comments`;

CREATE TABLE `pending_act_comments` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `act_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `act_link` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `pending_act_comments` */

insert  into `pending_act_comments`(`id`,`act_id`,`user_id`,`act_link`,`created_at`,`updated_at`) values 
(1,1,11,'Completed_Acts/11/1529402658.json','2018-06-19 15:36:53','2018-06-19 15:36:53');

/*Table structure for table `project_attachments` */

DROP TABLE IF EXISTS `project_attachments`;

CREATE TABLE `project_attachments` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `project_id` int(10) unsigned NOT NULL,
  `attachment_link` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `project_attachments_project_id_foreign` (`project_id`),
  CONSTRAINT `project_attachments_project_id_foreign` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `project_attachments` */

insert  into `project_attachments`(`id`,`project_id`,`attachment_link`,`created_at`,`updated_at`) values 
(1,1,'3IshNOcjPZQhds30imsJxNVAHlDGWRoh8QcRQTBx.jpeg','2018-06-14 11:28:03','2018-06-14 11:28:03'),
(2,2,'Abdw3ya1DXpJGQGgZjfTDpxlQa9eVUEDcfi2Nb62.jpeg','2018-06-14 12:02:31','2018-06-14 12:02:31'),
(3,2,'KpCE7J3YMPGwyO9I5cKAP6vfSIjlGTF4EcGGjxd5.png','2018-06-14 12:02:31','2018-06-14 12:02:31');

/*Table structure for table `project_ratings` */

DROP TABLE IF EXISTS `project_ratings`;

CREATE TABLE `project_ratings` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `from` int(10) unsigned NOT NULL,
  `to` int(10) unsigned NOT NULL,
  `project_link` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `project_ratings_from_foreign` (`from`),
  KEY `project_ratings_to_foreign` (`to`),
  CONSTRAINT `project_ratings_from_foreign` FOREIGN KEY (`from`) REFERENCES `users` (`id`),
  CONSTRAINT `project_ratings_to_foreign` FOREIGN KEY (`to`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `project_ratings` */

/*Table structure for table `project_skills` */

DROP TABLE IF EXISTS `project_skills`;

CREATE TABLE `project_skills` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Project_id` int(10) unsigned NOT NULL,
  `Skill_id` int(10) unsigned NOT NULL,
  `skill_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `project_skills_project_id_foreign` (`Project_id`),
  KEY `project_skills_skill_id_foreign` (`Skill_id`),
  CONSTRAINT `project_skills_project_id_foreign` FOREIGN KEY (`Project_id`) REFERENCES `projects` (`id`),
  CONSTRAINT `project_skills_skill_id_foreign` FOREIGN KEY (`Skill_id`) REFERENCES `skills` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `project_skills` */

insert  into `project_skills`(`id`,`Project_id`,`Skill_id`,`skill_name`,`created_at`,`updated_at`) values 
(1,1,1,'PHP','2018-06-14 11:28:03','2018-06-14 11:28:03'),
(2,1,2,'MySQL','2018-06-14 11:28:03','2018-06-14 11:28:03'),
(3,1,3,'JQuery','2018-06-14 11:28:03','2018-06-14 11:28:03'),
(4,1,4,'Ajax','2018-06-14 11:28:03','2018-06-14 11:28:03'),
(5,2,1,'PHP','2018-06-14 12:02:31','2018-06-14 12:02:31'),
(6,2,7,'HTML & CSS','2018-06-14 12:02:31','2018-06-14 12:02:31'),
(7,2,8,'ASP.NET','2018-06-14 12:02:31','2018-06-14 12:02:31');

/*Table structure for table `project_transactions` */

DROP TABLE IF EXISTS `project_transactions`;

CREATE TABLE `project_transactions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `transaction_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` int(10) unsigned DEFAULT NULL,
  `project_id` int(10) unsigned DEFAULT NULL,
  `custom` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `intent` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cart` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_method` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sub_total` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tax` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `total_amount` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `currency` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `item_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `item_price` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `item_currency` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `item_quantity` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `first_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payer_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `recipient_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `line1` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_state` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `postal_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `project_transactions` */

/*Table structure for table `projects` */

DROP TABLE IF EXISTS `projects`;

CREATE TABLE `projects` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `deadline` date NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `categorie_id` int(10) unsigned NOT NULL,
  `sub_categorie_id` int(10) unsigned NOT NULL,
  `budget_type_id` int(10) unsigned NOT NULL,
  `currencie_id` int(10) unsigned NOT NULL,
  `budget_id` int(10) unsigned DEFAULT NULL,
  `min` int(11) NOT NULL,
  `max` int(11) NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `freelancer_id` int(10) unsigned DEFAULT NULL,
  `amount` decimal(11,2) DEFAULT NULL,
  `deposit` decimal(11,2) NOT NULL DEFAULT '0.00',
  `work_hours` int(11) DEFAULT NULL,
  `level` int(10) unsigned NOT NULL,
  `country_id` int(10) unsigned NOT NULL,
  `likes` int(11) NOT NULL DEFAULT '0',
  `active` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `projects_categorie_id_foreign` (`categorie_id`),
  KEY `projects_sub_categorie_id_foreign` (`sub_categorie_id`),
  KEY `projects_budget_type_id_foreign` (`budget_type_id`),
  KEY `projects_currencie_id_foreign` (`currencie_id`),
  KEY `projects_budget_id_foreign` (`budget_id`),
  KEY `projects_user_id_foreign` (`user_id`),
  KEY `projects_freelancer_id_foreign` (`freelancer_id`),
  KEY `projects_country_id_foreign` (`country_id`),
  KEY `projects_level_foreign` (`level`),
  CONSTRAINT `projects_budget_id_foreign` FOREIGN KEY (`budget_id`) REFERENCES `budgets` (`id`),
  CONSTRAINT `projects_budget_type_id_foreign` FOREIGN KEY (`budget_type_id`) REFERENCES `budget_types` (`id`),
  CONSTRAINT `projects_categorie_id_foreign` FOREIGN KEY (`categorie_id`) REFERENCES `categories` (`id`),
  CONSTRAINT `projects_country_id_foreign` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`),
  CONSTRAINT `projects_currencie_id_foreign` FOREIGN KEY (`currencie_id`) REFERENCES `currencies` (`id`),
  CONSTRAINT `projects_freelancer_id_foreign` FOREIGN KEY (`freelancer_id`) REFERENCES `users` (`id`),
  CONSTRAINT `projects_level_foreign` FOREIGN KEY (`level`) REFERENCES `experiences` (`id`),
  CONSTRAINT `projects_sub_categorie_id_foreign` FOREIGN KEY (`sub_categorie_id`) REFERENCES `sub_categories` (`id`),
  CONSTRAINT `projects_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `projects` */

insert  into `projects`(`id`,`title`,`deadline`,`description`,`categorie_id`,`sub_categorie_id`,`budget_type_id`,`currencie_id`,`budget_id`,`min`,`max`,`user_id`,`freelancer_id`,`amount`,`deposit`,`work_hours`,`level`,`country_id`,`likes`,`active`,`created_at`,`updated_at`) values 
(1,'Test 1','2018-06-16','simple description',1,1,1,2,5,25,50,10,NULL,NULL,0.00,NULL,1,7,0,'1','2018-06-14 11:28:03','2018-06-19 13:21:21'),
(2,'Test 2','2018-06-17','&lt;span style=&quot;color: rgb(0, 0, 0); font-family: Avenir, Helvetica, sans-serif; font-size: 16px; text-align: center; background-color: rgb(234, 234, 234);&quot;&gt;Please confirm that you want to use this as your Artomate email address. Once it\'s done you will be able to start hire and working.&lt;/span&gt;',1,2,1,2,6,50,80,11,NULL,NULL,0.00,NULL,1,25,0,'1','2018-06-14 12:02:31','2018-06-19 13:21:12');

/*Table structure for table `promo_codes` */

DROP TABLE IF EXISTS `promo_codes`;

CREATE TABLE `promo_codes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `country_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `promo_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `bid_count` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `promo_codes` */

/*Table structure for table `services` */

DROP TABLE IF EXISTS `services`;

CREATE TABLE `services` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `criteria_id` int(10) unsigned NOT NULL,
  `service_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `services_criteria_id_foreign` (`criteria_id`),
  CONSTRAINT `services_criteria_id_foreign` FOREIGN KEY (`criteria_id`) REFERENCES `criterias` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `services` */

insert  into `services`(`id`,`criteria_id`,`service_name`,`created_at`,`updated_at`) values 
(1,1,'Service 1','2017-10-27 13:53:00','2017-10-27 13:53:00'),
(2,2,'Service 2','2017-10-27 13:53:00','2017-10-27 13:53:00'),
(3,3,'Service 3','2017-10-27 13:53:00','2017-10-27 13:53:00'),
(4,4,'Service 4','2017-10-27 13:53:00','2017-10-27 13:53:00'),
(5,5,'Service 5','2017-10-27 13:53:00','2017-10-27 13:53:00'),
(6,6,'Service 6','2017-10-27 13:53:00','2017-10-27 13:53:00'),
(7,7,'Service 7','2017-10-27 13:53:00','2017-10-27 13:53:00');

/*Table structure for table `skills` */

DROP TABLE IF EXISTS `skills`;

CREATE TABLE `skills` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `categorie_id` int(10) unsigned NOT NULL,
  `skill_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `skills_categorie_id_foreign` (`categorie_id`),
  CONSTRAINT `skills_categorie_id_foreign` FOREIGN KEY (`categorie_id`) REFERENCES `categories` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `skills` */

insert  into `skills`(`id`,`categorie_id`,`skill_name`,`created_at`,`updated_at`) values 
(1,1,'PHP','2017-08-03 17:59:15','2017-08-03 17:59:15'),
(2,1,'MySQL','2017-08-03 17:59:15','2017-08-03 17:59:15'),
(3,1,'JQuery','2017-08-03 17:59:15','2017-08-03 17:59:15'),
(4,1,'Ajax','2017-08-03 17:59:15','2017-08-03 17:59:15'),
(5,1,'JSon','2017-08-03 17:59:15','2017-08-03 17:59:15'),
(6,1,'Javascript','2017-08-03 17:59:15','2017-08-03 17:59:15'),
(7,1,'HTML & CSS','2017-08-03 17:59:15','2017-08-03 17:59:15'),
(8,1,'ASP.NET','2017-08-03 17:59:15','2017-08-03 17:59:15');

/*Table structure for table `sub_categories` */

DROP TABLE IF EXISTS `sub_categories`;

CREATE TABLE `sub_categories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `categorie_id` int(10) unsigned NOT NULL,
  `subcategorie_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subcategorie_route` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sub_categories_categorie_id_foreign` (`categorie_id`),
  CONSTRAINT `sub_categories_categorie_id_foreign` FOREIGN KEY (`categorie_id`) REFERENCES `categories` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `sub_categories` */

insert  into `sub_categories`(`id`,`categorie_id`,`subcategorie_name`,`subcategorie_route`,`created_at`,`updated_at`) values 
(1,1,'Logo Design and Branding','logo-design-and-branding','2017-08-03 17:59:15','2017-08-03 17:59:15'),
(2,1,'Business Cards and Stationary','business-cards-and-stationary','2017-08-03 17:59:15','2017-08-03 17:59:15'),
(3,1,'Illustrations and Infographics','illustrations-and-infographics','2017-08-03 17:59:15','2017-08-03 17:59:15'),
(4,1,'Flyers and Posters','flyers-and-posters','2017-08-03 17:59:15','2017-08-03 17:59:15'),
(5,1,'Labels and Packaging','labels-and-packaging','2017-08-03 17:59:15','2017-08-03 17:59:15'),
(6,1,'Magazine and Book Covers','magazine-and-book-covers','2017-08-03 17:59:15','2017-08-03 17:59:15'),
(7,1,'Invitations and Album Covers','invitations-and-album-covers','2017-08-03 17:59:15','2017-08-03 17:59:15'),
(8,1,'Cartoons and Caricatures','cartoons-and-caricatures','2017-08-03 17:59:15','2017-08-03 17:59:15'),
(9,1,'Painting and Comics','painting-and-comics','2017-08-03 17:59:15','2017-08-03 17:59:15'),
(10,1,'Buttons and Icons','buttons-and-icons','2017-08-03 17:59:15','2017-08-03 17:59:15'),
(11,1,'GIF and Flash Banners','gif-and-flash-banners','2017-08-03 17:59:15','2017-08-03 17:59:15'),
(12,1,'Social Media Deisgn','social-media-deign','2017-08-03 17:59:15','2017-08-03 17:59:15'),
(13,1,'Web and Mobile Design','web-and-mobile-design','2017-08-03 17:59:15','2017-08-03 17:59:15'),
(14,1,'Stock and Royalty Free Images','stock-and-royalty-free-images','2017-08-03 17:59:15','2017-08-03 17:59:15'),
(15,1,'Photo Editing and Retouching','photo-editing-and-retouching','2017-08-03 17:59:15','2017-08-03 17:59:15'),
(16,1,'Customized T-Shirts and Mugs','customized-tshirts-and-mugs','2017-08-03 17:59:15','2017-08-03 17:59:15'),
(17,1,'2D/3D Models and Mockups','2d-or-3d-models-and-mockups','2017-08-03 17:59:15','2017-08-03 17:59:15'),
(18,1,'Architecture and Interior Design','architecture-and-interior-design','2017-08-03 17:59:15','2017-08-03 17:59:15'),
(19,1,'Presentations and Many Many More','presentations-and-many-many-more','2017-08-03 17:59:15','2017-08-03 17:59:15'),
(20,2,'Social Media Marketing (SMM)','social-media-marketing','2017-08-03 17:59:15','2017-08-03 17:59:15'),
(21,2,'Search Engine Optimization (SEO)','search-engine-optimization','2017-08-03 17:59:15','2017-08-03 17:59:15'),
(22,2,'AdWords and AdSense','adwords-and-adsense','2017-08-03 17:59:15','2017-08-03 17:59:15'),
(23,2,'Website Traffic and Ranking','website-traffic-and-ranking','2017-08-03 17:59:15','2017-08-03 17:59:15'),
(24,2,'Email and Telemarketing','email-and-telemarketing','2017-08-03 17:59:15','2017-08-03 17:59:15'),
(25,2,'Manage Blogs and Accounts','manage-blogs-and-accounts','2017-08-03 17:59:15','2017-08-03 17:59:15'),
(26,2,'Search and Display Advertising','search-and-display-advertising','2017-08-03 17:59:15','2017-08-03 17:59:15'),
(27,2,'Celebrity and Influence Marketing','celebrity-and-influence-marketing','2017-08-03 17:59:15','2017-08-03 17:59:15'),
(28,2,'Link Building and Content Marketing','link-building-and-content-marketing','2017-08-03 17:59:15','2017-08-03 17:59:15'),
(29,2,'Marketing Strategy and Web Analytics','marketing-strategy-and-web-analytics','2017-08-03 17:59:15','2017-08-03 17:59:15'),
(30,2,'Web and Content Curation','web-and-content-curation','2017-08-03 17:59:15','2017-08-03 17:59:15'),
(31,2,'Business Name and Domain Research','business-name-and-domain-research','2017-08-03 17:59:15','2017-08-03 17:59:15'),
(32,2,'Affiliate and Referal Marketing','affiliate-and-referal-marketing','2017-08-03 17:59:15','2017-08-03 17:59:15'),
(33,2,'Music Promotion and Video Marketing','music-promotion-and-video-marketing','2017-08-03 17:59:15','2017-08-03 17:59:15'),
(34,2,'Hold Your Sign and Advertise Your Message','hold-your-sign-and-advertise-your-message','2017-08-03 17:59:15','2017-08-03 17:59:15'),
(35,2,'Lead Generation and Many Many More','lead-generation-and-many-many-more','2017-08-03 17:59:15','2017-08-03 17:59:15'),
(36,3,'Wordpress and Frameworks','wordpress-and-frameworks','2017-08-03 17:59:15','2017-08-03 17:59:15'),
(37,3,'Website Design and Develop','website-design-and-develop','2017-08-03 17:59:15','2017-08-03 17:59:15'),
(38,3,'Themes and Templates','themes-and-templates','2017-08-03 17:59:15','2017-08-03 17:59:15'),
(39,3,'Chatbots and Plugins','chatbots-and-plugins','2017-08-03 17:59:15','2017-08-03 17:59:15'),
(40,3,'Performance and Security','performance-and-security','2017-08-03 17:59:15','2017-08-03 17:59:15'),
(41,3,'Configuration and Customization','configuration-and-customization','2017-08-03 17:59:15','2017-08-03 17:59:15'),
(42,3,'Desktop Application and Programming','desktop-application-and-programming','2017-08-03 17:59:15','2017-08-03 17:59:15'),
(43,3,'Support and IT','support-and-it','2017-08-03 17:59:15','2017-08-03 17:59:15'),
(44,3,'IOS and Android','ios-and-android','2017-08-03 17:59:15','2017-08-03 17:59:15'),
(45,3,'Blackberry and Windows','blackberry-and-windows','2017-08-03 17:59:15','2017-08-03 17:59:15'),
(46,3,'Game Design and Develop','game-design-and-develop','2017-08-03 17:59:15','2017-08-03 17:59:15'),
(47,3,'Database Design and Develop','database-design-develop','2017-08-03 17:59:15','2017-08-03 17:59:15'),
(48,3,'Convert Files and Formats','convert-files-and-formats','2017-08-03 17:59:15','2017-08-03 17:59:15'),
(49,3,'Web Scraping and Data Mining','web-scraping-and-data-mining','2017-08-03 17:59:15','2017-08-03 17:59:15'),
(50,3,'Quality Assurance and User Testing','quality-assurance-and-user-testing','2017-08-03 17:59:15','2017-08-03 17:59:15'),
(51,3,'Web Services and Many Many More','web-services-and-many-many-more','2017-08-03 17:59:15','2017-08-03 17:59:15'),
(52,4,'Whiteboard Animation','whiteboard-animation','2017-08-03 17:59:15','2017-08-03 17:59:15'),
(53,4,'Explainer and Intro Videos','explainer-and-intro-videos','2017-08-03 17:59:15','2017-08-03 17:59:15'),
(54,4,'Spokepersons and Testimonials','spokepersons-and testimonials','2017-08-03 17:59:15','2017-08-03 17:59:15'),
(55,4,'Editing and Post Production','editing-and-post-production','2017-08-03 17:59:15','2017-08-03 17:59:15'),
(56,4,'2D/3D Objects and Animations','2d-3d-objects-and-animations','2017-08-03 17:59:15','2017-08-03 17:59:15'),
(57,4,'2D/3D Characters and Modeling','2d-3d-characters-and-modeling','2017-08-03 17:59:15','2017-08-03 17:59:15'),
(58,4,'Brand and Product Videos','brand-and-product-videos','2017-08-03 17:59:15','2017-08-03 17:59:15'),
(59,4,'Marketing and Promotional Videos','marketing-and-promotional-videos','2017-08-03 17:59:15','2017-08-03 17:59:15'),
(60,4,'VFX and Motion Graphics','vfx-and-motion-graphics','2017-08-03 17:59:15','2017-08-03 17:59:15'),
(61,4,'Greetings and Fun Videos','greetings-and-fun-videos','2017-08-03 17:59:15','2017-08-03 17:59:15'),
(62,4,'Gaming and Lifestyle','gaming-and-lifestyle','2017-08-03 17:59:15','2017-08-03 17:59:15'),
(63,4,'Music Videos and Many Many More','music-videos-and-many-many-more','2017-08-03 17:59:15','2017-08-03 17:59:15'),
(64,5,'Score and Soundtrack','score-and-soundtrack','2017-08-03 17:59:15','2017-08-03 17:59:15'),
(65,5,'Songwriting and Composing','songwriting-and-composing','2017-08-03 17:59:15','2017-08-03 17:59:15'),
(66,5,'Singers and Musicians','singers-and-musicians','2017-08-03 17:59:15','2017-08-03 17:59:15'),
(67,5,'Sound Effect and DJ Mixup','sound-effect-and-dj-mixup','2017-08-03 17:59:15','2017-08-03 17:59:15'),
(68,5,'Editing and Mastering','editing-and-mastering','2017-08-03 17:59:15','2017-08-03 17:59:15'),
(69,5,'Voice Over and Narration','voice-over-and-narration','2017-08-03 17:59:15','2017-08-03 17:59:15'),
(70,5,'Reviews and Promotions','reviews-and-promotions','2017-08-03 17:59:15','2017-08-03 17:59:15'),
(71,5,'Online Lessons and Classes','online-lessons-and-classes','2017-08-03 17:59:15','2017-08-03 17:59:15'),
(72,5,'Lead Sheets and Many Many More','lead-sheets-and-many-many-more','2017-08-03 17:59:15','2017-08-03 17:59:15'),
(73,6,'Content and Copywriting','content-and-copywriting','2017-08-03 17:59:15','2017-08-03 17:59:15'),
(74,6,'Editing and Proofreading','editing-and-proofreading','2017-08-03 17:59:15','2017-08-03 17:59:15'),
(75,6,'Creative and Professional Writing','creative-and-professional-writing','2017-08-03 17:59:15','2017-08-03 17:59:15'),
(76,6,'Resume and Cover Letter','resume-and-cover-letter','2017-08-03 17:59:15','2017-08-03 17:59:15'),
(77,6,'Article and Blog Writing','article-and-blog-writing','2017-08-03 17:59:15','2017-08-03 17:59:15'),
(78,6,'Legal Writing and Contract','legal-writing-and-contract','2017-08-03 17:59:15','2017-08-03 17:59:15'),
(79,6,'Press Releases and Promotions','pres-releases-and-promotions','2017-08-03 17:59:15','2017-08-03 17:59:15'),
(80,6,'Research and Summaries','research-and-summaries','2017-08-03 17:59:15','2017-08-03 17:59:15'),
(81,6,'Business Letter and Proposal','business-letter-and-proposal','2017-08-03 17:59:15','2017-08-03 17:59:15'),
(82,6,'Poetry and Lyric Writing','poetry-and-lyric-writing','2017-08-03 17:59:15','2017-08-03 17:59:15'),
(83,6,'Product Description and Review','product-description-and-review','2017-08-03 17:59:15','2017-08-03 17:59:15'),
(84,6,'Translation and Transcription','translation-and-transcription','2017-08-03 17:59:15','2017-08-03 17:59:15'),
(85,6,'Data Entry and Many Many More','data-entry-and-many-many-more','2017-08-03 17:59:15','2017-08-03 17:59:15'),
(86,7,'Project Management and Operations','project-management-and-operations','2017-08-03 17:59:15','2017-08-03 17:59:15'),
(87,7,'Business Plans and proposals','business-plans-and-proposals','2017-08-03 17:59:15','2017-08-03 17:59:15'),
(88,7,'Business Analysis and Valuation','business-analysis-and-valuation','2017-08-03 17:59:15','2017-08-03 17:59:15'),
(89,7,'Legal and Financial Consulting','legal-and-financial-consulting','2017-08-03 17:59:15','2017-08-03 17:59:15'),
(90,7,'Market Research and Business Tips','market-research-business-tips','2017-08-03 17:59:15','2017-08-03 17:59:15'),
(91,7,'Virtual Assistant and Concierge Service','virtual-assistant-and-concierge-service','2017-08-03 17:59:15','2017-08-03 17:59:15'),
(92,7,'Accounts and Taxation','accounts-and-taxation','2017-08-03 17:59:15','2017-08-03 17:59:15'),
(93,7,'Tax Calculation and Investment Plan','tax-calculation-and-investment-plan','2017-08-03 17:59:15','2017-08-03 17:59:15'),
(94,7,'Career Tips and Advise','career-tips-and-advise','2017-08-03 17:59:15','2017-08-03 17:59:15'),
(95,7,'Business Review and Promotion','business-review-and-promotion','2017-08-03 17:59:15','2017-08-03 17:59:15'),
(96,7,'Contracts and documents','contracts-and-documents','2017-08-03 17:59:15','2017-08-03 17:59:15'),
(97,7,'Excel and Spread Sheet','excel-and-spread-sheet','2017-08-03 17:59:15','2017-08-03 17:59:15'),
(98,7,'Branding and Advertising','branding-and-advertising','2017-08-03 17:59:15','2017-08-03 17:59:15'),
(99,7,'Customer Service and Support','customer-service-and-support','2017-08-03 17:59:15','2017-08-03 17:59:15'),
(100,7,'Business Presentations and Many Many More','business-presentations-and-many-many-more','2017-08-03 17:59:15','2017-08-03 17:59:15');

/*Table structure for table `user_languages` */

DROP TABLE IF EXISTS `user_languages`;

CREATE TABLE `user_languages` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `language_id` int(10) unsigned NOT NULL,
  `language_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_languages_user_id_foreign` (`user_id`),
  KEY `user_languages_language_id_foreign` (`language_id`),
  CONSTRAINT `user_languages_language_id_foreign` FOREIGN KEY (`language_id`) REFERENCES `languages` (`id`),
  CONSTRAINT `user_languages_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `user_languages` */

insert  into `user_languages`(`id`,`user_id`,`language_id`,`language_name`,`created_at`,`updated_at`) values 
(1,10,1,'English','2018-06-13 17:38:28','2018-06-13 17:38:28'),
(2,11,1,'English','2018-06-14 12:05:38','2018-06-14 12:05:38'),
(3,11,3,'French','2018-06-14 12:05:38','2018-06-14 12:05:38'),
(4,11,4,'Japinesh','2018-06-14 12:05:38','2018-06-14 12:05:38');

/*Table structure for table `user_skills` */

DROP TABLE IF EXISTS `user_skills`;

CREATE TABLE `user_skills` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `User_id` int(10) unsigned NOT NULL,
  `Skill_id` int(10) unsigned NOT NULL,
  `skill_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_skills_user_id_foreign` (`User_id`),
  KEY `user_skills_skill_id_foreign` (`Skill_id`),
  CONSTRAINT `user_skills_skill_id_foreign` FOREIGN KEY (`Skill_id`) REFERENCES `skills` (`id`),
  CONSTRAINT `user_skills_user_id_foreign` FOREIGN KEY (`User_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `user_skills` */

insert  into `user_skills`(`id`,`User_id`,`Skill_id`,`skill_name`,`created_at`,`updated_at`) values 
(1,10,1,'PHP','2018-06-13 17:28:59','2018-06-13 17:28:59'),
(2,10,2,'MySQL','2018-06-13 17:28:59','2018-06-13 17:28:59'),
(3,11,1,'PHP','2018-06-14 12:06:02','2018-06-14 12:06:02'),
(4,11,2,'MySQL','2018-06-14 12:06:02','2018-06-14 12:06:02');

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(155) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `full_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `designation` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country_id` int(11) DEFAULT NULL,
  `profile_picture` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'ProfilePicture/default.jpg',
  `confirmation_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `active` int(11) NOT NULL DEFAULT '0',
  `entries` int(11) NOT NULL DEFAULT '25',
  `favariote_count` int(11) NOT NULL DEFAULT '0',
  `user_level` int(11) NOT NULL DEFAULT '1',
  `user_per_hour` int(11) DEFAULT NULL,
  `user_currencie_id` int(11) DEFAULT NULL,
  `about_me` text COLLATE utf8mb4_unicode_ci,
  `last_activity` timestamp NULL DEFAULT NULL,
  `online_status` int(11) NOT NULL DEFAULT '0',
  `jobs_completed` int(11) NOT NULL DEFAULT '0',
  `badge_path` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'assets/badges/Beginner-Badge.png',
  `acts_completed` int(11) NOT NULL DEFAULT '0',
  `email_verify` int(11) NOT NULL DEFAULT '0',
  `phone_verify` int(11) NOT NULL DEFAULT '0',
  `user_verify` int(11) NOT NULL DEFAULT '0',
  `bank_verify` int(11) NOT NULL DEFAULT '0',
  `referal_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `referal_user_id` int(10) unsigned DEFAULT NULL,
  `cover_picture` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'CropProfilePicture/default.jpg',
  `orginial_cover_picture` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'ProfileCover/default.jpg',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`),
  UNIQUE KEY `users_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `users` */

insert  into `users`(`id`,`name`,`email`,`phone`,`password`,`full_name`,`designation`,`country_id`,`profile_picture`,`confirmation_code`,`active`,`entries`,`favariote_count`,`user_level`,`user_per_hour`,`user_currencie_id`,`about_me`,`last_activity`,`online_status`,`jobs_completed`,`badge_path`,`acts_completed`,`email_verify`,`phone_verify`,`user_verify`,`bank_verify`,`referal_code`,`referal_user_id`,`cover_picture`,`orginial_cover_picture`,`remember_token`,`created_at`,`updated_at`) values 
(1,'GrossByte0d885','grossbytehub@gmail.com',NULL,'','Gross Byte',NULL,NULL,'https://lh3.googleusercontent.com/-XdUIqdMkCWA/AAAAAAAAAAI/AAAAAAAAAAA/4252rscbv5M/photo.jpg?sz=50',NULL,1,25,0,1,NULL,NULL,NULL,'2018-05-09 20:02:23',0,0,'assets/badges/Beginner-Badge.png',0,0,0,0,0,'pq0d885',NULL,'CropProfilePicture/default.jpg','ProfileCover/default.jpg','f0SHt2wUGW4b6U6c6u1jo6gm8OXisF21Z2hAXu1Y07nRUMkm99lmnKqZJjI5','2018-05-09 19:53:21','2018-05-09 20:02:23'),
(2,'DoddabasavaHosalliedbb1','basva.hossalli@gmail.com',NULL,'','Doddabasava Hosalli',NULL,NULL,'https://graph.facebook.com/v2.10/1479078625508961/picture?type=normal',NULL,1,25,0,1,NULL,NULL,'I am a web developer','2018-05-10 22:52:07',0,0,'assets/badges/Beginner-Badge.png',0,0,0,0,0,'bcedbb1',NULL,'CropProfilePicture/default.jpg','ProfileCover/default.jpg','ToYKhrkWYJstWJ7RBvxd3u1XCWgMRVfXcE0SRiBCqvIgiJhJH7busQG65OHR','2018-05-10 22:50:54','2018-05-10 22:53:37'),
(10,'chethan','chethan@artomate.studio','8892903535','$2y$10$HTbQ6Hl7cpyNgZtXQZmbU.Jdb9G9t5CR4Weg/EDPEUqYtAUE83SRm','chethan k','Web developer',1,'ProfilePicture/1528891297.jpg',NULL,1,23,0,1,25,1,'sample ddescriptin skdkf','2018-06-22 17:42:15',1,0,'assets/badges/Beginner-Badge.png',0,1,0,0,0,'jkbceea',NULL,'CropProfilePicture/10/iPm5EviY3iUKScxyUyLh8v496RjIOh3acXfXQ06g.jpeg','ProfileCover/10/iPm5EviY3iUKScxyUyLh8v496RjIOh3acXfXQ06g.jpeg','Js2ZvFPS3oaqNn15RafEyDrydNvp24KMpz5Calf6g8Jp4cvdBUEG8xaPIn5k','2018-06-13 16:16:24','2018-06-22 17:42:15'),
(11,'Testperson','person@gmail.com','9931456789','$2y$10$kD21ivVAmiPE2ybtl854reM2n30LtsXEfhs1gljJnuc9GnUHCQSuq','TestPerson','Web developer',14,'ProfilePicture/1528958171.jpg',NULL,1,24,1,1,40,2,NULL,'2018-06-22 17:44:09',1,0,'assets/badges/Beginner-Badge.png',0,1,0,0,0,'cd19a94',NULL,'CropProfilePicture/11/oyij79FNcBrbxB5GiU5QuvvASx5yJd4Ab4C6rbtR.jpeg','ProfileCover/11/oyij79FNcBrbxB5GiU5QuvvASx5yJd4Ab4C6rbtR.jpeg','WsKisZLB29sehGdIRGb4eyjTbkla5tOyitEVgOGYqJxKeIavVFLxfIKxzdB7','2018-06-14 11:59:18','2018-06-22 17:44:09');

/*Table structure for table `verifications` */

DROP TABLE IF EXISTS `verifications`;

CREATE TABLE `verifications` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `attachment_link` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `active` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `verifications_user_id_foreign` (`user_id`),
  CONSTRAINT `verifications_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `verifications` */

insert  into `verifications`(`id`,`user_id`,`attachment_link`,`active`,`created_at`,`updated_at`) values 
(1,10,'EdzOTKjLlkRcNxUraUr3U7ohrC4eJ89F1cRfCXwx.png',0,'2018-06-14 17:47:33','2018-06-14 17:47:34'),
(2,10,'UiMj7ckGeykqpOr703MrTmsbNNeiYVwj9gCgYJdT.png',0,'2018-06-14 17:48:23','2018-06-14 17:48:23'),
(3,10,'mTKqPGtpGCG5EN6qgIBaMEsjs20guCLUxQ31E83c.jpeg',0,'2018-06-14 17:59:16','2018-06-14 17:59:16');

/*Table structure for table `work_experiences` */

DROP TABLE IF EXISTS `work_experiences`;

CREATE TABLE `work_experiences` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `company_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `from_date` date NOT NULL,
  `to_date` date NOT NULL,
  `company_description` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `country_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `country_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `work_experiences_user_id_foreign` (`user_id`),
  CONSTRAINT `work_experiences_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `work_experiences` */

insert  into `work_experiences`(`id`,`user_id`,`company_name`,`from_date`,`to_date`,`company_description`,`country_code`,`country_name`,`created_at`,`updated_at`) values 
(1,10,'web developer','2018-06-15','2018-06-30','experience','BR','Brazil','2018-06-13 17:29:50','2018-06-13 17:29:50');

/*Table structure for table `workdays` */

DROP TABLE IF EXISTS `workdays`;

CREATE TABLE `workdays` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `days` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `workdays` */

insert  into `workdays`(`id`,`days`,`created_at`,`updated_at`) values 
(1,'In 1 Working Day','2017-10-27 13:53:00','2017-10-27 13:53:00'),
(2,'In 2 Working Days','2017-10-27 13:53:00','2017-10-27 13:53:00'),
(3,'In 3 Working Days','2017-10-27 13:53:00','2017-10-27 13:53:00'),
(4,'In 4 Working Days','2017-10-27 13:53:00','2017-10-27 13:53:00'),
(5,'In 5 Working Days','2017-10-27 13:53:00','2017-10-27 13:53:00'),
(6,'In 7 Working Days','2017-10-27 13:53:00','2017-10-27 13:53:00'),
(7,'In 14 Working Days','2017-10-27 13:53:00','2017-10-27 13:53:00'),
(8,'In 21 Working Days','2017-10-27 13:53:00','2017-10-27 13:53:00'),
(9,'In 28 Working Days','2017-10-27 13:53:00','2017-10-27 13:53:00'),
(10,'In 35 Working Days','2017-10-27 13:53:00','2017-10-27 13:53:00'),
(11,'In 42 Working Days','2017-10-27 13:53:00','2017-10-27 13:53:00'),
(12,'In 49 Working Days','2017-10-27 13:53:00','2017-10-27 13:53:00'),
(13,'In 56 Working Days','2017-10-27 13:53:00','2017-10-27 13:53:00'),
(14,'In 63 Working Days','2017-10-27 13:53:00','2017-10-27 13:53:00'),
(15,'In 70 Working Days','2017-10-27 13:53:00','2017-10-27 13:53:00');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

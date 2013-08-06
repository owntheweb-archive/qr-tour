
-- phpMyAdmin SQL Dump
-- version 2.11.11.3
-- http://www.phpmyadmin.net
--
-- Host: 50.63.230.142
-- Generation Time: Aug 06, 2013 at 03:33 PM
-- Server version: 5.0.96
-- PHP Version: 5.1.6

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `qr_tour`
--

-- --------------------------------------------------------

--
-- Table structure for table `actions`
--

CREATE TABLE `actions` (
  `aid` varchar(255) NOT NULL default '0' COMMENT 'Primary Key: Unique actions ID.',
  `type` varchar(32) NOT NULL default '' COMMENT 'The object that that action acts on (node, user, comment, system or custom types.)',
  `callback` varchar(255) NOT NULL default '' COMMENT 'The callback function that executes when the action runs.',
  `parameters` longblob NOT NULL COMMENT 'Parameters to be passed to the callback function.',
  `label` varchar(255) NOT NULL default '0' COMMENT 'Label of the action.',
  PRIMARY KEY  (`aid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores action information.';

--
-- Dumping data for table `actions`
--

INSERT INTO `actions` VALUES('comment_publish_action', 'comment', 'comment_publish_action', '', 'Publish comment');
INSERT INTO `actions` VALUES('comment_save_action', 'comment', 'comment_save_action', '', 'Save comment');
INSERT INTO `actions` VALUES('comment_unpublish_action', 'comment', 'comment_unpublish_action', '', 'Unpublish comment');
INSERT INTO `actions` VALUES('node_make_sticky_action', 'node', 'node_make_sticky_action', '', 'Make content sticky');
INSERT INTO `actions` VALUES('node_make_unsticky_action', 'node', 'node_make_unsticky_action', '', 'Make content unsticky');
INSERT INTO `actions` VALUES('node_promote_action', 'node', 'node_promote_action', '', 'Promote content to front page');
INSERT INTO `actions` VALUES('node_publish_action', 'node', 'node_publish_action', '', 'Publish content');
INSERT INTO `actions` VALUES('node_save_action', 'node', 'node_save_action', '', 'Save content');
INSERT INTO `actions` VALUES('node_unpromote_action', 'node', 'node_unpromote_action', '', 'Remove content from front page');
INSERT INTO `actions` VALUES('node_unpublish_action', 'node', 'node_unpublish_action', '', 'Unpublish content');
INSERT INTO `actions` VALUES('system_block_ip_action', 'user', 'system_block_ip_action', '', 'Ban IP address of current user');
INSERT INTO `actions` VALUES('user_block_user_action', 'user', 'user_block_user_action', '', 'Block current user');

-- --------------------------------------------------------

--
-- Table structure for table `authmap`
--

CREATE TABLE `authmap` (
  `aid` int(10) unsigned NOT NULL auto_increment COMMENT 'Primary Key: Unique authmap ID.',
  `uid` int(11) NOT NULL default '0' COMMENT 'User’s users.uid.',
  `authname` varchar(128) NOT NULL default '' COMMENT 'Unique authentication name.',
  `module` varchar(128) NOT NULL default '' COMMENT 'Module which is controlling the authentication.',
  PRIMARY KEY  (`aid`),
  UNIQUE KEY `authname` (`authname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores distributed authentication mapping.' AUTO_INCREMENT=1 ;

--
-- Dumping data for table `authmap`
--


-- --------------------------------------------------------

--
-- Table structure for table `batch`
--

CREATE TABLE `batch` (
  `bid` int(10) unsigned NOT NULL COMMENT 'Primary Key: Unique batch ID.',
  `token` varchar(64) NOT NULL COMMENT 'A string token generated against the current user’s session id and the batch id, used to ensure that only the user who submitted the batch can effectively access it.',
  `timestamp` int(11) NOT NULL COMMENT 'A Unix timestamp indicating when this batch was submitted for processing. Stale batches are purged at cron time.',
  `batch` longblob COMMENT 'A serialized array containing the processing data for the batch.',
  PRIMARY KEY  (`bid`),
  KEY `token` (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores details about batches (processes that run in...';

--
-- Dumping data for table `batch`
--

INSERT INTO `batch` VALUES(4, 'd1yfaQvc8HMd0PZ2H1VYKtWK4XYHi2ULOMCMxZKePJw', 1375807424, 0x613a31333a7b733a343a2273657473223b613a313a7b693a303b613a31353a7b733a373a2273616e64626f78223b613a303a7b7d733a373a22726573756c7473223b613a313a7b733a383a2270726f6a65637473223b613a313a7b733a383a227365727669636573223b733a36303a22687474703a2f2f6674702e64727570616c2e6f72672f66696c65732f70726f6a656374732f73657276696365732d372e782d332e352e7461722e677a223b7d7d733a373a2273756363657373223b623a313b733a353a227374617274223b643a313337353830373432362e323439353230303633343030323638353534363837353b733a373a22656c6170736564223b693a303b733a353a227469746c65223b733a31393a22446f776e6c6f6164696e672075706461746573223b733a31323a22696e69745f6d657373616765223b733a34393a22507265706172696e6720746f20646f776e6c6f61642073656c656374656420757064617465733c62722f3e266e6273703b223b733a383a2266696e6973686564223b733a33383a227570646174655f6d616e616765725f646f776e6c6f61645f62617463685f66696e6973686564223b733a343a2266696c65223b733a33333a226d6f64756c65732f7570646174652f7570646174652e6d616e616765722e696e63223b733a31363a2270726f67726573735f6d657373616765223b733a32393a22436f6d706c65746564204063757272656e74206f662040746f74616c2e223b733a31333a226572726f725f6d657373616765223b733a32323a22416e206572726f7220686173206f636375727265642e223b733a333a22637373223b613a303a7b7d733a353a22746f74616c223b693a313b733a353a22636f756e74223b693a303b733a353a227175657565223b613a323a7b733a343a226e616d65223b733a31363a2264727570616c5f62617463683a343a30223b733a353a22636c617373223b733a31303a2242617463685175657565223b7d7d7d733a31363a226861735f666f726d5f7375626d697473223b623a303b733a31303a22666f726d5f7374617465223b613a333a7b733a31303a2270726f6772616d6d6564223b623a303b733a373a2272656275696c64223b623a303b733a383a227265646972656374223b4e3b7d733a31313a2270726f6772657373697665223b623a313b733a31313a2263757272656e745f736574223b693a303b733a333a2275726c223b733a353a226261746368223b733a31313a2275726c5f6f7074696f6e73223b613a313a7b733a353a227175657279223b613a313a7b733a363a2272656e646572223b733a373a226f7665726c6179223b7d7d733a31303a22736f757263655f75726c223b733a32383a2261646d696e2f7265706f7274732f757064617465732f757064617465223b733a383a227265646972656374223b4e3b733a353a227468656d65223b733a353a22736576656e223b733a31373a2272656469726563745f63616c6c6261636b223b733a31313a2264727570616c5f676f746f223b733a323a226964223b733a313a2234223b733a31333a226572726f725f6d657373616765223b733a37353a22506c6561736520636f6e74696e756520746f203c6120687265663d222f62617463683f69643d3426616d703b6f703d66696e6973686564223e746865206572726f7220706167653c2f613e223b7d);

-- --------------------------------------------------------

--
-- Table structure for table `block`
--

CREATE TABLE `block` (
  `bid` int(11) NOT NULL auto_increment COMMENT 'Primary Key: Unique block ID.',
  `module` varchar(64) NOT NULL default '' COMMENT 'The module from which the block originates; for example, ’user’ for the Who’s Online block, and ’block’ for any custom blocks.',
  `delta` varchar(32) NOT NULL default '0' COMMENT 'Unique ID for block within a module.',
  `theme` varchar(64) NOT NULL default '' COMMENT 'The theme under which the block settings apply.',
  `status` tinyint(4) NOT NULL default '0' COMMENT 'Block enabled status. (1 = enabled, 0 = disabled)',
  `weight` int(11) NOT NULL default '0' COMMENT 'Block weight within region.',
  `region` varchar(64) NOT NULL default '' COMMENT 'Theme region within which the block is set.',
  `custom` tinyint(4) NOT NULL default '0' COMMENT 'Flag to indicate how users may control visibility of the block. (0 = Users cannot control, 1 = On by default, but can be hidden, 2 = Hidden by default, but can be shown)',
  `visibility` tinyint(4) NOT NULL default '0' COMMENT 'Flag to indicate how to show blocks on pages. (0 = Show on all pages except listed pages, 1 = Show only on listed pages, 2 = Use custom PHP code to determine visibility)',
  `pages` text NOT NULL COMMENT 'Contents of the "Pages" block; contains either a list of paths on which to include/exclude the block or PHP code, depending on "visibility" setting.',
  `title` varchar(64) NOT NULL default '' COMMENT 'Custom title for the block. (Empty string will use block default title, <none> will remove the title, text will cause block to use specified title.)',
  `cache` tinyint(4) NOT NULL default '1' COMMENT 'Binary flag to indicate block cache mode. (-2: Custom cache, -1: Do not cache, 1: Cache per role, 2: Cache per user, 4: Cache per page, 8: Block cache global) See DRUPAL_CACHE_* constants in ../includes/common.inc for more detailed information.',
  PRIMARY KEY  (`bid`),
  UNIQUE KEY `tmd` (`theme`,`module`,`delta`),
  KEY `list` (`theme`,`status`,`region`,`weight`,`module`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Stores block settings, such as region and visibility...' AUTO_INCREMENT=35 ;

--
-- Dumping data for table `block`
--

INSERT INTO `block` VALUES(1, 'system', 'main', 'bartik', 1, -8, 'content', 0, 0, '', '', -1);
INSERT INTO `block` VALUES(2, 'search', 'form', 'bartik', 1, -1, 'sidebar_first', 0, 0, '', '', -1);
INSERT INTO `block` VALUES(3, 'node', 'recent', 'seven', 1, 10, 'dashboard_main', 0, 0, '', '', -1);
INSERT INTO `block` VALUES(4, 'user', 'login', 'bartik', 1, 0, 'sidebar_first', 0, 0, '', '', -1);
INSERT INTO `block` VALUES(5, 'system', 'navigation', 'bartik', 1, 0, 'sidebar_first', 0, 0, '', '', -1);
INSERT INTO `block` VALUES(6, 'system', 'powered-by', 'bartik', 1, -9, 'footer', 0, 0, '', '', -1);
INSERT INTO `block` VALUES(7, 'system', 'help', 'bartik', 1, 0, 'help', 0, 0, '', '', -1);
INSERT INTO `block` VALUES(8, 'system', 'main', 'seven', 1, 0, 'content', 0, 0, '', '', -1);
INSERT INTO `block` VALUES(9, 'system', 'help', 'seven', 1, 0, 'help', 0, 0, '', '', -1);
INSERT INTO `block` VALUES(10, 'user', 'login', 'seven', 1, 10, 'content', 0, 0, '', '', -1);
INSERT INTO `block` VALUES(11, 'user', 'new', 'seven', 1, 0, 'dashboard_sidebar', 0, 0, '', '', -1);
INSERT INTO `block` VALUES(12, 'search', 'form', 'seven', 1, -10, 'dashboard_sidebar', 0, 0, '', '', -1);
INSERT INTO `block` VALUES(13, 'comment', 'recent', 'bartik', 0, -6, '-1', 0, 0, '', '', 1);
INSERT INTO `block` VALUES(14, 'node', 'syndicate', 'bartik', 0, -3, '-1', 0, 0, '', '', -1);
INSERT INTO `block` VALUES(15, 'node', 'recent', 'bartik', 0, -5, '-1', 0, 0, '', '', 1);
INSERT INTO `block` VALUES(16, 'shortcut', 'shortcuts', 'bartik', 0, -4, '-1', 0, 0, '', '', -1);
INSERT INTO `block` VALUES(17, 'system', 'management', 'bartik', 0, -7, '-1', 0, 0, '', '', -1);
INSERT INTO `block` VALUES(18, 'system', 'user-menu', 'bartik', 0, -2, '-1', 0, 0, '', '', -1);
INSERT INTO `block` VALUES(19, 'system', 'main-menu', 'bartik', 0, -8, '-1', 0, 0, '', '', -1);
INSERT INTO `block` VALUES(20, 'user', 'new', 'bartik', 0, -1, '-1', 0, 0, '', '', 1);
INSERT INTO `block` VALUES(21, 'user', 'online', 'bartik', 0, 0, '-1', 0, 0, '', '', -1);
INSERT INTO `block` VALUES(22, 'comment', 'recent', 'seven', 1, 0, 'dashboard_inactive', 0, 0, '', '', 1);
INSERT INTO `block` VALUES(23, 'node', 'syndicate', 'seven', 0, 0, '-1', 0, 0, '', '', -1);
INSERT INTO `block` VALUES(24, 'shortcut', 'shortcuts', 'seven', 0, 0, '-1', 0, 0, '', '', -1);
INSERT INTO `block` VALUES(25, 'system', 'powered-by', 'seven', 0, 10, '-1', 0, 0, '', '', -1);
INSERT INTO `block` VALUES(26, 'system', 'navigation', 'seven', 0, 0, '-1', 0, 0, '', '', -1);
INSERT INTO `block` VALUES(27, 'system', 'management', 'seven', 0, 0, '-1', 0, 0, '', '', -1);
INSERT INTO `block` VALUES(28, 'system', 'user-menu', 'seven', 0, 0, '-1', 0, 0, '', '', -1);
INSERT INTO `block` VALUES(29, 'system', 'main-menu', 'seven', 0, 0, '-1', 0, 0, '', '', -1);
INSERT INTO `block` VALUES(30, 'user', 'online', 'seven', 1, 0, 'dashboard_inactive', 0, 0, '', '', -1);
INSERT INTO `block` VALUES(31, 'google_qr_code', 'qr_code', 'bartik', 1, -9, 'content', 0, 0, '<front>\r\nadmin*\r\nuser*', '', 1);
INSERT INTO `block` VALUES(32, 'google_qr_code', 'qr_code', 'seven', 0, 0, '-1', 0, 0, '<front>\r\nadmin*\r\nuser*', '', 1);
INSERT INTO `block` VALUES(33, 'views', 'qr_content-block', 'bartik', 1, -7, 'content', 0, 1, '<front>', '<none>', -1);
INSERT INTO `block` VALUES(34, 'views', 'qr_content-block', 'seven', 0, 0, '-1', 0, 1, '<front>', '<none>', -1);

-- --------------------------------------------------------

--
-- Table structure for table `blocked_ips`
--

CREATE TABLE `blocked_ips` (
  `iid` int(10) unsigned NOT NULL auto_increment COMMENT 'Primary Key: unique ID for IP addresses.',
  `ip` varchar(40) NOT NULL default '' COMMENT 'IP address',
  PRIMARY KEY  (`iid`),
  KEY `blocked_ip` (`ip`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores blocked IP addresses.' AUTO_INCREMENT=1 ;

--
-- Dumping data for table `blocked_ips`
--


-- --------------------------------------------------------

--
-- Table structure for table `block_custom`
--

CREATE TABLE `block_custom` (
  `bid` int(10) unsigned NOT NULL auto_increment COMMENT 'The block’s block.bid.',
  `body` longtext COMMENT 'Block contents.',
  `info` varchar(128) NOT NULL default '' COMMENT 'Block description.',
  `format` varchar(255) default NULL COMMENT 'The filter_format.format of the block body.',
  PRIMARY KEY  (`bid`),
  UNIQUE KEY `info` (`info`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores contents of custom-made blocks.' AUTO_INCREMENT=1 ;

--
-- Dumping data for table `block_custom`
--


-- --------------------------------------------------------

--
-- Table structure for table `block_node_type`
--

CREATE TABLE `block_node_type` (
  `module` varchar(64) NOT NULL COMMENT 'The block’s origin module, from block.module.',
  `delta` varchar(32) NOT NULL COMMENT 'The block’s unique delta within module, from block.delta.',
  `type` varchar(32) NOT NULL COMMENT 'The machine-readable name of this type from node_type.type.',
  PRIMARY KEY  (`module`,`delta`,`type`),
  KEY `type` (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sets up display criteria for blocks based on content types';

--
-- Dumping data for table `block_node_type`
--


-- --------------------------------------------------------

--
-- Table structure for table `block_role`
--

CREATE TABLE `block_role` (
  `module` varchar(64) NOT NULL COMMENT 'The block’s origin module, from block.module.',
  `delta` varchar(32) NOT NULL COMMENT 'The block’s unique delta within module, from block.delta.',
  `rid` int(10) unsigned NOT NULL COMMENT 'The user’s role ID from users_roles.rid.',
  PRIMARY KEY  (`module`,`delta`,`rid`),
  KEY `rid` (`rid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sets up access permissions for blocks based on user roles';

--
-- Dumping data for table `block_role`
--

INSERT INTO `block_role` VALUES('google_qr_code', 'qr_code', 2);

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `cid` varchar(255) NOT NULL default '' COMMENT 'Primary Key: Unique cache ID.',
  `data` longblob COMMENT 'A collection of data to cache.',
  `expire` int(11) NOT NULL default '0' COMMENT 'A Unix timestamp indicating when the cache entry should expire, or 0 for never.',
  `created` int(11) NOT NULL default '0' COMMENT 'A Unix timestamp indicating when the cache entry was created.',
  `serialized` smallint(6) NOT NULL default '0' COMMENT 'A flag to indicate whether content is serialized (1) or not (0).',
  PRIMARY KEY  (`cid`),
  KEY `expire` (`expire`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Generic cache table for caching things not separated out...';

--
-- Dumping data for table `cache`
--


-- --------------------------------------------------------

--
-- Table structure for table `cache_block`
--

CREATE TABLE `cache_block` (
  `cid` varchar(255) NOT NULL default '' COMMENT 'Primary Key: Unique cache ID.',
  `data` longblob COMMENT 'A collection of data to cache.',
  `expire` int(11) NOT NULL default '0' COMMENT 'A Unix timestamp indicating when the cache entry should expire, or 0 for never.',
  `created` int(11) NOT NULL default '0' COMMENT 'A Unix timestamp indicating when the cache entry was created.',
  `serialized` smallint(6) NOT NULL default '0' COMMENT 'A flag to indicate whether content is serialized (1) or not (0).',
  PRIMARY KEY  (`cid`),
  KEY `expire` (`expire`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Cache table for the Block module to store already built...';

--
-- Dumping data for table `cache_block`
--


-- --------------------------------------------------------

--
-- Table structure for table `cache_bootstrap`
--

CREATE TABLE `cache_bootstrap` (
  `cid` varchar(255) NOT NULL default '' COMMENT 'Primary Key: Unique cache ID.',
  `data` longblob COMMENT 'A collection of data to cache.',
  `expire` int(11) NOT NULL default '0' COMMENT 'A Unix timestamp indicating when the cache entry should expire, or 0 for never.',
  `created` int(11) NOT NULL default '0' COMMENT 'A Unix timestamp indicating when the cache entry was created.',
  `serialized` smallint(6) NOT NULL default '0' COMMENT 'A flag to indicate whether content is serialized (1) or not (0).',
  PRIMARY KEY  (`cid`),
  KEY `expire` (`expire`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Cache table for data required to bootstrap Drupal, may be...';

--
-- Dumping data for table `cache_bootstrap`
--


-- --------------------------------------------------------

--
-- Table structure for table `cache_field`
--

CREATE TABLE `cache_field` (
  `cid` varchar(255) NOT NULL default '' COMMENT 'Primary Key: Unique cache ID.',
  `data` longblob COMMENT 'A collection of data to cache.',
  `expire` int(11) NOT NULL default '0' COMMENT 'A Unix timestamp indicating when the cache entry should expire, or 0 for never.',
  `created` int(11) NOT NULL default '0' COMMENT 'A Unix timestamp indicating when the cache entry was created.',
  `serialized` smallint(6) NOT NULL default '0' COMMENT 'A flag to indicate whether content is serialized (1) or not (0).',
  PRIMARY KEY  (`cid`),
  KEY `expire` (`expire`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Generic cache table for caching things not separated out...';

--
-- Dumping data for table `cache_field`
--


-- --------------------------------------------------------

--
-- Table structure for table `cache_filter`
--

CREATE TABLE `cache_filter` (
  `cid` varchar(255) NOT NULL default '' COMMENT 'Primary Key: Unique cache ID.',
  `data` longblob COMMENT 'A collection of data to cache.',
  `expire` int(11) NOT NULL default '0' COMMENT 'A Unix timestamp indicating when the cache entry should expire, or 0 for never.',
  `created` int(11) NOT NULL default '0' COMMENT 'A Unix timestamp indicating when the cache entry was created.',
  `serialized` smallint(6) NOT NULL default '0' COMMENT 'A flag to indicate whether content is serialized (1) or not (0).',
  PRIMARY KEY  (`cid`),
  KEY `expire` (`expire`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Cache table for the Filter module to store already...';

--
-- Dumping data for table `cache_filter`
--


-- --------------------------------------------------------

--
-- Table structure for table `cache_form`
--

CREATE TABLE `cache_form` (
  `cid` varchar(255) NOT NULL default '' COMMENT 'Primary Key: Unique cache ID.',
  `data` longblob COMMENT 'A collection of data to cache.',
  `expire` int(11) NOT NULL default '0' COMMENT 'A Unix timestamp indicating when the cache entry should expire, or 0 for never.',
  `created` int(11) NOT NULL default '0' COMMENT 'A Unix timestamp indicating when the cache entry was created.',
  `serialized` smallint(6) NOT NULL default '0' COMMENT 'A flag to indicate whether content is serialized (1) or not (0).',
  PRIMARY KEY  (`cid`),
  KEY `expire` (`expire`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Cache table for the form system to store recently built...';

--
-- Dumping data for table `cache_form`
--


-- --------------------------------------------------------

--
-- Table structure for table `cache_image`
--

CREATE TABLE `cache_image` (
  `cid` varchar(255) NOT NULL default '' COMMENT 'Primary Key: Unique cache ID.',
  `data` longblob COMMENT 'A collection of data to cache.',
  `expire` int(11) NOT NULL default '0' COMMENT 'A Unix timestamp indicating when the cache entry should expire, or 0 for never.',
  `created` int(11) NOT NULL default '0' COMMENT 'A Unix timestamp indicating when the cache entry was created.',
  `serialized` smallint(6) NOT NULL default '0' COMMENT 'A flag to indicate whether content is serialized (1) or not (0).',
  PRIMARY KEY  (`cid`),
  KEY `expire` (`expire`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Cache table used to store information about image...';

--
-- Dumping data for table `cache_image`
--


-- --------------------------------------------------------

--
-- Table structure for table `cache_libraries`
--

CREATE TABLE `cache_libraries` (
  `cid` varchar(255) NOT NULL default '' COMMENT 'Primary Key: Unique cache ID.',
  `data` longblob COMMENT 'A collection of data to cache.',
  `expire` int(11) NOT NULL default '0' COMMENT 'A Unix timestamp indicating when the cache entry should expire, or 0 for never.',
  `created` int(11) NOT NULL default '0' COMMENT 'A Unix timestamp indicating when the cache entry was created.',
  `serialized` smallint(6) NOT NULL default '0' COMMENT 'A flag to indicate whether content is serialized (1) or not (0).',
  PRIMARY KEY  (`cid`),
  KEY `expire` (`expire`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Cache table to store library information.';

--
-- Dumping data for table `cache_libraries`
--


-- --------------------------------------------------------

--
-- Table structure for table `cache_menu`
--

CREATE TABLE `cache_menu` (
  `cid` varchar(255) NOT NULL default '' COMMENT 'Primary Key: Unique cache ID.',
  `data` longblob COMMENT 'A collection of data to cache.',
  `expire` int(11) NOT NULL default '0' COMMENT 'A Unix timestamp indicating when the cache entry should expire, or 0 for never.',
  `created` int(11) NOT NULL default '0' COMMENT 'A Unix timestamp indicating when the cache entry was created.',
  `serialized` smallint(6) NOT NULL default '0' COMMENT 'A flag to indicate whether content is serialized (1) or not (0).',
  PRIMARY KEY  (`cid`),
  KEY `expire` (`expire`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Cache table for the menu system to store router...';

--
-- Dumping data for table `cache_menu`
--


-- --------------------------------------------------------

--
-- Table structure for table `cache_page`
--

CREATE TABLE `cache_page` (
  `cid` varchar(255) NOT NULL default '' COMMENT 'Primary Key: Unique cache ID.',
  `data` longblob COMMENT 'A collection of data to cache.',
  `expire` int(11) NOT NULL default '0' COMMENT 'A Unix timestamp indicating when the cache entry should expire, or 0 for never.',
  `created` int(11) NOT NULL default '0' COMMENT 'A Unix timestamp indicating when the cache entry was created.',
  `serialized` smallint(6) NOT NULL default '0' COMMENT 'A flag to indicate whether content is serialized (1) or not (0).',
  PRIMARY KEY  (`cid`),
  KEY `expire` (`expire`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Cache table used to store compressed pages for anonymous...';

--
-- Dumping data for table `cache_page`
--


-- --------------------------------------------------------

--
-- Table structure for table `cache_path`
--

CREATE TABLE `cache_path` (
  `cid` varchar(255) NOT NULL default '' COMMENT 'Primary Key: Unique cache ID.',
  `data` longblob COMMENT 'A collection of data to cache.',
  `expire` int(11) NOT NULL default '0' COMMENT 'A Unix timestamp indicating when the cache entry should expire, or 0 for never.',
  `created` int(11) NOT NULL default '0' COMMENT 'A Unix timestamp indicating when the cache entry was created.',
  `serialized` smallint(6) NOT NULL default '0' COMMENT 'A flag to indicate whether content is serialized (1) or not (0).',
  PRIMARY KEY  (`cid`),
  KEY `expire` (`expire`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Cache table for path alias lookup.';

--
-- Dumping data for table `cache_path`
--


-- --------------------------------------------------------

--
-- Table structure for table `cache_rules`
--

CREATE TABLE `cache_rules` (
  `cid` varchar(255) NOT NULL default '' COMMENT 'Primary Key: Unique cache ID.',
  `data` longblob COMMENT 'A collection of data to cache.',
  `expire` int(11) NOT NULL default '0' COMMENT 'A Unix timestamp indicating when the cache entry should expire, or 0 for never.',
  `created` int(11) NOT NULL default '0' COMMENT 'A Unix timestamp indicating when the cache entry was created.',
  `serialized` smallint(6) NOT NULL default '0' COMMENT 'A flag to indicate whether content is serialized (1) or not (0).',
  PRIMARY KEY  (`cid`),
  KEY `expire` (`expire`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Cache table for the rules engine to store configured items.';

--
-- Dumping data for table `cache_rules`
--


-- --------------------------------------------------------

--
-- Table structure for table `cache_update`
--

CREATE TABLE `cache_update` (
  `cid` varchar(255) NOT NULL default '' COMMENT 'Primary Key: Unique cache ID.',
  `data` longblob COMMENT 'A collection of data to cache.',
  `expire` int(11) NOT NULL default '0' COMMENT 'A Unix timestamp indicating when the cache entry should expire, or 0 for never.',
  `created` int(11) NOT NULL default '0' COMMENT 'A Unix timestamp indicating when the cache entry was created.',
  `serialized` smallint(6) NOT NULL default '0' COMMENT 'A flag to indicate whether content is serialized (1) or not (0).',
  PRIMARY KEY  (`cid`),
  KEY `expire` (`expire`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Cache table for the Update module to store information...';

--
-- Dumping data for table `cache_update`
--


-- --------------------------------------------------------

--
-- Table structure for table `cache_views`
--

CREATE TABLE `cache_views` (
  `cid` varchar(255) NOT NULL default '' COMMENT 'Primary Key: Unique cache ID.',
  `data` longblob COMMENT 'A collection of data to cache.',
  `expire` int(11) NOT NULL default '0' COMMENT 'A Unix timestamp indicating when the cache entry should expire, or 0 for never.',
  `created` int(11) NOT NULL default '0' COMMENT 'A Unix timestamp indicating when the cache entry was created.',
  `serialized` smallint(6) NOT NULL default '0' COMMENT 'A flag to indicate whether content is serialized (1) or not (0).',
  PRIMARY KEY  (`cid`),
  KEY `expire` (`expire`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Generic cache table for caching things not separated out...';

--
-- Dumping data for table `cache_views`
--


-- --------------------------------------------------------

--
-- Table structure for table `cache_views_data`
--

CREATE TABLE `cache_views_data` (
  `cid` varchar(255) NOT NULL default '' COMMENT 'Primary Key: Unique cache ID.',
  `data` longblob COMMENT 'A collection of data to cache.',
  `expire` int(11) NOT NULL default '0' COMMENT 'A Unix timestamp indicating when the cache entry should expire, or 0 for never.',
  `created` int(11) NOT NULL default '0' COMMENT 'A Unix timestamp indicating when the cache entry was created.',
  `serialized` smallint(6) NOT NULL default '1' COMMENT 'A flag to indicate whether content is serialized (1) or not (0).',
  PRIMARY KEY  (`cid`),
  KEY `expire` (`expire`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Cache table for views to store pre-rendered queries,...';

--
-- Dumping data for table `cache_views_data`
--


-- --------------------------------------------------------

--
-- Table structure for table `comment`
--

CREATE TABLE `comment` (
  `cid` int(11) NOT NULL auto_increment COMMENT 'Primary Key: Unique comment ID.',
  `pid` int(11) NOT NULL default '0' COMMENT 'The comment.cid to which this comment is a reply. If set to 0, this comment is not a reply to an existing comment.',
  `nid` int(11) NOT NULL default '0' COMMENT 'The node.nid to which this comment is a reply.',
  `uid` int(11) NOT NULL default '0' COMMENT 'The users.uid who authored the comment. If set to 0, this comment was created by an anonymous user.',
  `subject` varchar(64) NOT NULL default '' COMMENT 'The comment title.',
  `hostname` varchar(128) NOT NULL default '' COMMENT 'The author’s host name.',
  `created` int(11) NOT NULL default '0' COMMENT 'The time that the comment was created, as a Unix timestamp.',
  `changed` int(11) NOT NULL default '0' COMMENT 'The time that the comment was last edited, as a Unix timestamp.',
  `status` tinyint(3) unsigned NOT NULL default '1' COMMENT 'The published status of a comment. (0 = Not Published, 1 = Published)',
  `thread` varchar(255) NOT NULL COMMENT 'The vancode representation of the comment’s place in a thread.',
  `name` varchar(60) default NULL COMMENT 'The comment author’s name. Uses users.name if the user is logged in, otherwise uses the value typed into the comment form.',
  `mail` varchar(64) default NULL COMMENT 'The comment author’s e-mail address from the comment form, if user is anonymous, and the ’Anonymous users may/must leave their contact information’ setting is turned on.',
  `homepage` varchar(255) default NULL COMMENT 'The comment author’s home page address from the comment form, if user is anonymous, and the ’Anonymous users may/must leave their contact information’ setting is turned on.',
  `language` varchar(12) NOT NULL default '' COMMENT 'The languages.language of this comment.',
  PRIMARY KEY  (`cid`),
  KEY `comment_status_pid` (`pid`,`status`),
  KEY `comment_num_new` (`nid`,`status`,`created`,`cid`,`thread`),
  KEY `comment_uid` (`uid`),
  KEY `comment_nid_language` (`nid`,`language`),
  KEY `comment_created` (`created`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores comments and associated data.' AUTO_INCREMENT=1 ;

--
-- Dumping data for table `comment`
--


-- --------------------------------------------------------

--
-- Table structure for table `ctools_css_cache`
--

CREATE TABLE `ctools_css_cache` (
  `cid` varchar(128) NOT NULL COMMENT 'The CSS ID this cache object belongs to.',
  `filename` varchar(255) default NULL COMMENT 'The filename this CSS is stored in.',
  `css` longtext COMMENT 'CSS being stored.',
  `filter` tinyint(4) default NULL COMMENT 'Whether or not this CSS needs to be filtered.',
  PRIMARY KEY  (`cid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='A special cache used to store CSS that must be non-volatile.';

--
-- Dumping data for table `ctools_css_cache`
--


-- --------------------------------------------------------

--
-- Table structure for table `ctools_object_cache`
--

CREATE TABLE `ctools_object_cache` (
  `sid` varchar(64) NOT NULL COMMENT 'The session ID this cache object belongs to.',
  `name` varchar(128) NOT NULL COMMENT 'The name of the object this cache is attached to.',
  `obj` varchar(32) NOT NULL COMMENT 'The type of the object this cache is attached to; this essentially represents the owner so that several sub-systems can use this cache.',
  `updated` int(10) unsigned NOT NULL default '0' COMMENT 'The time this cache was created or updated.',
  `data` longblob COMMENT 'Serialized data being stored.',
  PRIMARY KEY  (`sid`,`obj`,`name`),
  KEY `updated` (`updated`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='A special cache used to store objects that are being...';

--
-- Dumping data for table `ctools_object_cache`
--


-- --------------------------------------------------------

--
-- Table structure for table `date_formats`
--

CREATE TABLE `date_formats` (
  `dfid` int(10) unsigned NOT NULL auto_increment COMMENT 'The date format identifier.',
  `format` varchar(100) character set utf8 collate utf8_bin NOT NULL COMMENT 'The date format string.',
  `type` varchar(64) NOT NULL COMMENT 'The date format type, e.g. medium.',
  `locked` tinyint(4) NOT NULL default '0' COMMENT 'Whether or not this format can be modified.',
  PRIMARY KEY  (`dfid`),
  UNIQUE KEY `formats` (`format`,`type`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Stores configured date formats.' AUTO_INCREMENT=36 ;

--
-- Dumping data for table `date_formats`
--

INSERT INTO `date_formats` VALUES(1, 'Y-m-d H:i', 'short', 1);
INSERT INTO `date_formats` VALUES(2, 'm/d/Y - H:i', 'short', 1);
INSERT INTO `date_formats` VALUES(3, 'd/m/Y - H:i', 'short', 1);
INSERT INTO `date_formats` VALUES(4, 'Y/m/d - H:i', 'short', 1);
INSERT INTO `date_formats` VALUES(5, 'd.m.Y - H:i', 'short', 1);
INSERT INTO `date_formats` VALUES(6, 'm/d/Y - g:ia', 'short', 1);
INSERT INTO `date_formats` VALUES(7, 'd/m/Y - g:ia', 'short', 1);
INSERT INTO `date_formats` VALUES(8, 'Y/m/d - g:ia', 'short', 1);
INSERT INTO `date_formats` VALUES(9, 'M j Y - H:i', 'short', 1);
INSERT INTO `date_formats` VALUES(10, 'j M Y - H:i', 'short', 1);
INSERT INTO `date_formats` VALUES(11, 'Y M j - H:i', 'short', 1);
INSERT INTO `date_formats` VALUES(12, 'M j Y - g:ia', 'short', 1);
INSERT INTO `date_formats` VALUES(13, 'j M Y - g:ia', 'short', 1);
INSERT INTO `date_formats` VALUES(14, 'Y M j - g:ia', 'short', 1);
INSERT INTO `date_formats` VALUES(15, 'D, Y-m-d H:i', 'medium', 1);
INSERT INTO `date_formats` VALUES(16, 'D, m/d/Y - H:i', 'medium', 1);
INSERT INTO `date_formats` VALUES(17, 'D, d/m/Y - H:i', 'medium', 1);
INSERT INTO `date_formats` VALUES(18, 'D, Y/m/d - H:i', 'medium', 1);
INSERT INTO `date_formats` VALUES(19, 'F j, Y - H:i', 'medium', 1);
INSERT INTO `date_formats` VALUES(20, 'j F, Y - H:i', 'medium', 1);
INSERT INTO `date_formats` VALUES(21, 'Y, F j - H:i', 'medium', 1);
INSERT INTO `date_formats` VALUES(22, 'D, m/d/Y - g:ia', 'medium', 1);
INSERT INTO `date_formats` VALUES(23, 'D, d/m/Y - g:ia', 'medium', 1);
INSERT INTO `date_formats` VALUES(24, 'D, Y/m/d - g:ia', 'medium', 1);
INSERT INTO `date_formats` VALUES(25, 'F j, Y - g:ia', 'medium', 1);
INSERT INTO `date_formats` VALUES(26, 'j F Y - g:ia', 'medium', 1);
INSERT INTO `date_formats` VALUES(27, 'Y, F j - g:ia', 'medium', 1);
INSERT INTO `date_formats` VALUES(28, 'j. F Y - G:i', 'medium', 1);
INSERT INTO `date_formats` VALUES(29, 'l, F j, Y - H:i', 'long', 1);
INSERT INTO `date_formats` VALUES(30, 'l, j F, Y - H:i', 'long', 1);
INSERT INTO `date_formats` VALUES(31, 'l, Y,  F j - H:i', 'long', 1);
INSERT INTO `date_formats` VALUES(32, 'l, F j, Y - g:ia', 'long', 1);
INSERT INTO `date_formats` VALUES(33, 'l, j F Y - g:ia', 'long', 1);
INSERT INTO `date_formats` VALUES(34, 'l, Y,  F j - g:ia', 'long', 1);
INSERT INTO `date_formats` VALUES(35, 'l, j. F Y - G:i', 'long', 1);

-- --------------------------------------------------------

--
-- Table structure for table `date_format_locale`
--

CREATE TABLE `date_format_locale` (
  `format` varchar(100) NOT NULL COMMENT 'The date format string.',
  `type` varchar(64) NOT NULL COMMENT 'The date format type, e.g. medium.',
  `language` varchar(12) NOT NULL COMMENT 'A languages.language for this format to be used with.',
  PRIMARY KEY  (`type`,`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores configured date formats for each locale.';

--
-- Dumping data for table `date_format_locale`
--


-- --------------------------------------------------------

--
-- Table structure for table `date_format_type`
--

CREATE TABLE `date_format_type` (
  `type` varchar(64) NOT NULL COMMENT 'The date format type, e.g. medium.',
  `title` varchar(255) NOT NULL COMMENT 'The human readable name of the format type.',
  `locked` tinyint(4) NOT NULL default '0' COMMENT 'Whether or not this is a system provided format.',
  PRIMARY KEY  (`type`),
  KEY `title` (`title`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores configured date format types.';

--
-- Dumping data for table `date_format_type`
--

INSERT INTO `date_format_type` VALUES('long', 'Long', 1);
INSERT INTO `date_format_type` VALUES('medium', 'Medium', 1);
INSERT INTO `date_format_type` VALUES('short', 'Short', 1);

-- --------------------------------------------------------

--
-- Table structure for table `field_config`
--

CREATE TABLE `field_config` (
  `id` int(11) NOT NULL auto_increment COMMENT 'The primary identifier for a field',
  `field_name` varchar(32) NOT NULL COMMENT 'The name of this field. Non-deleted field names are unique, but multiple deleted fields can have the same name.',
  `type` varchar(128) NOT NULL COMMENT 'The type of this field.',
  `module` varchar(128) NOT NULL default '' COMMENT 'The module that implements the field type.',
  `active` tinyint(4) NOT NULL default '0' COMMENT 'Boolean indicating whether the module that implements the field type is enabled.',
  `storage_type` varchar(128) NOT NULL COMMENT 'The storage backend for the field.',
  `storage_module` varchar(128) NOT NULL default '' COMMENT 'The module that implements the storage backend.',
  `storage_active` tinyint(4) NOT NULL default '0' COMMENT 'Boolean indicating whether the module that implements the storage backend is enabled.',
  `locked` tinyint(4) NOT NULL default '0' COMMENT '@TODO',
  `data` longblob NOT NULL COMMENT 'Serialized data containing the field properties that do not warrant a dedicated column.',
  `cardinality` tinyint(4) NOT NULL default '0',
  `translatable` tinyint(4) NOT NULL default '0',
  `deleted` tinyint(4) NOT NULL default '0',
  PRIMARY KEY  (`id`),
  KEY `field_name` (`field_name`),
  KEY `active` (`active`),
  KEY `storage_active` (`storage_active`),
  KEY `deleted` (`deleted`),
  KEY `module` (`module`),
  KEY `storage_module` (`storage_module`),
  KEY `type` (`type`),
  KEY `storage_type` (`storage_type`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=10 ;

--
-- Dumping data for table `field_config`
--

INSERT INTO `field_config` VALUES(1, 'comment_body', 'text_long', 'text', 1, 'field_sql_storage', 'field_sql_storage', 1, 0, 0x613a363a7b733a31323a22656e746974795f7479706573223b613a313a7b693a303b733a373a22636f6d6d656e74223b7d733a31323a227472616e736c617461626c65223b623a303b733a383a2273657474696e6773223b613a303a7b7d733a373a2273746f72616765223b613a343a7b733a343a2274797065223b733a31373a226669656c645f73716c5f73746f72616765223b733a383a2273657474696e6773223b613a303a7b7d733a363a226d6f64756c65223b733a31373a226669656c645f73716c5f73746f72616765223b733a363a22616374697665223b693a313b7d733a31323a22666f726569676e206b657973223b613a313a7b733a363a22666f726d6174223b613a323a7b733a353a227461626c65223b733a31333a2266696c7465725f666f726d6174223b733a373a22636f6c756d6e73223b613a313a7b733a363a22666f726d6174223b733a363a22666f726d6174223b7d7d7d733a373a22696e6465786573223b613a313a7b733a363a22666f726d6174223b613a313a7b693a303b733a363a22666f726d6174223b7d7d7d, 1, 0, 0);
INSERT INTO `field_config` VALUES(2, 'body', 'text_with_summary', 'text', 1, 'field_sql_storage', 'field_sql_storage', 1, 0, 0x613a373a7b733a31323a22656e746974795f7479706573223b613a313a7b693a303b733a343a226e6f6465223b7d733a31323a227472616e736c617461626c65223b733a313a2230223b733a383a2273657474696e6773223b613a303a7b7d733a373a2273746f72616765223b613a353a7b733a343a2274797065223b733a31373a226669656c645f73716c5f73746f72616765223b733a383a2273657474696e6773223b613a303a7b7d733a363a226d6f64756c65223b733a31373a226669656c645f73716c5f73746f72616765223b733a363a22616374697665223b733a313a2231223b733a373a2264657461696c73223b613a313a7b733a333a2273716c223b613a323a7b733a31383a224649454c445f4c4f41445f43555252454e54223b613a313a7b733a31353a226669656c645f646174615f626f6479223b613a333a7b733a353a2276616c7565223b733a31303a22626f64795f76616c7565223b733a373a2273756d6d617279223b733a31323a22626f64795f73756d6d617279223b733a363a22666f726d6174223b733a31313a22626f64795f666f726d6174223b7d7d733a31393a224649454c445f4c4f41445f5245564953494f4e223b613a313a7b733a31393a226669656c645f7265766973696f6e5f626f6479223b613a333a7b733a353a2276616c7565223b733a31303a22626f64795f76616c7565223b733a373a2273756d6d617279223b733a31323a22626f64795f73756d6d617279223b733a363a22666f726d6174223b733a31313a22626f64795f666f726d6174223b7d7d7d7d7d733a31323a22666f726569676e206b657973223b613a313a7b733a363a22666f726d6174223b613a323a7b733a353a227461626c65223b733a31333a2266696c7465725f666f726d6174223b733a373a22636f6c756d6e73223b613a313a7b733a363a22666f726d6174223b733a363a22666f726d6174223b7d7d7d733a373a22696e6465786573223b613a313a7b733a363a22666f726d6174223b613a313a7b693a303b733a363a22666f726d6174223b7d7d733a323a226964223b733a313a2232223b7d, 1, 0, 0);
INSERT INTO `field_config` VALUES(5, 'field_body_images', 'image', 'image', 1, 'field_sql_storage', 'field_sql_storage', 1, 0, 0x613a373a7b733a31323a227472616e736c617461626c65223b733a313a2230223b733a31323a22656e746974795f7479706573223b613a303a7b7d733a383a2273657474696e6773223b613a323a7b733a31303a227572695f736368656d65223b733a363a227075626c6963223b733a31333a2264656661756c745f696d616765223b693a303b7d733a373a2273746f72616765223b613a353a7b733a343a2274797065223b733a31373a226669656c645f73716c5f73746f72616765223b733a383a2273657474696e6773223b613a303a7b7d733a363a226d6f64756c65223b733a31373a226669656c645f73716c5f73746f72616765223b733a363a22616374697665223b733a313a2231223b733a373a2264657461696c73223b613a313a7b733a333a2273716c223b613a323a7b733a31383a224649454c445f4c4f41445f43555252454e54223b613a313a7b733a32383a226669656c645f646174615f6669656c645f626f64795f696d61676573223b613a353a7b733a333a22666964223b733a32313a226669656c645f626f64795f696d616765735f666964223b733a333a22616c74223b733a32313a226669656c645f626f64795f696d616765735f616c74223b733a353a227469746c65223b733a32333a226669656c645f626f64795f696d616765735f7469746c65223b733a353a227769647468223b733a32333a226669656c645f626f64795f696d616765735f7769647468223b733a363a22686569676874223b733a32343a226669656c645f626f64795f696d616765735f686569676874223b7d7d733a31393a224649454c445f4c4f41445f5245564953494f4e223b613a313a7b733a33323a226669656c645f7265766973696f6e5f6669656c645f626f64795f696d61676573223b613a353a7b733a333a22666964223b733a32313a226669656c645f626f64795f696d616765735f666964223b733a333a22616c74223b733a32313a226669656c645f626f64795f696d616765735f616c74223b733a353a227469746c65223b733a32333a226669656c645f626f64795f696d616765735f7469746c65223b733a353a227769647468223b733a32333a226669656c645f626f64795f696d616765735f7769647468223b733a363a22686569676874223b733a32343a226669656c645f626f64795f696d616765735f686569676874223b7d7d7d7d7d733a31323a22666f726569676e206b657973223b613a313a7b733a333a22666964223b613a323a7b733a353a227461626c65223b733a31323a2266696c655f6d616e61676564223b733a373a22636f6c756d6e73223b613a313a7b733a333a22666964223b733a333a22666964223b7d7d7d733a373a22696e6465786573223b613a313a7b733a333a22666964223b613a313a7b693a303b733a333a22666964223b7d7d733a323a226964223b733a313a2235223b7d, 1, 0, 0);
INSERT INTO `field_config` VALUES(6, 'field_mp3_audio', 'file', 'file', 1, 'field_sql_storage', 'field_sql_storage', 1, 0, 0x613a373a7b733a31323a227472616e736c617461626c65223b733a313a2230223b733a31323a22656e746974795f7479706573223b613a303a7b7d733a383a2273657474696e6773223b613a333a7b733a31333a22646973706c61795f6669656c64223b693a303b733a31353a22646973706c61795f64656661756c74223b693a303b733a31303a227572695f736368656d65223b733a363a227075626c6963223b7d733a373a2273746f72616765223b613a353a7b733a343a2274797065223b733a31373a226669656c645f73716c5f73746f72616765223b733a383a2273657474696e6773223b613a303a7b7d733a363a226d6f64756c65223b733a31373a226669656c645f73716c5f73746f72616765223b733a363a22616374697665223b733a313a2231223b733a373a2264657461696c73223b613a313a7b733a333a2273716c223b613a323a7b733a31383a224649454c445f4c4f41445f43555252454e54223b613a313a7b733a32363a226669656c645f646174615f6669656c645f6d70335f617564696f223b613a333a7b733a333a22666964223b733a31393a226669656c645f6d70335f617564696f5f666964223b733a373a22646973706c6179223b733a32333a226669656c645f6d70335f617564696f5f646973706c6179223b733a31313a226465736372697074696f6e223b733a32373a226669656c645f6d70335f617564696f5f6465736372697074696f6e223b7d7d733a31393a224649454c445f4c4f41445f5245564953494f4e223b613a313a7b733a33303a226669656c645f7265766973696f6e5f6669656c645f6d70335f617564696f223b613a333a7b733a333a22666964223b733a31393a226669656c645f6d70335f617564696f5f666964223b733a373a22646973706c6179223b733a32333a226669656c645f6d70335f617564696f5f646973706c6179223b733a31313a226465736372697074696f6e223b733a32373a226669656c645f6d70335f617564696f5f6465736372697074696f6e223b7d7d7d7d7d733a31323a22666f726569676e206b657973223b613a313a7b733a333a22666964223b613a323a7b733a353a227461626c65223b733a31323a2266696c655f6d616e61676564223b733a373a22636f6c756d6e73223b613a313a7b733a333a22666964223b733a333a22666964223b7d7d7d733a373a22696e6465786573223b613a313a7b733a333a22666964223b613a313a7b693a303b733a333a22666964223b7d7d733a323a226964223b733a313a2236223b7d, 1, 0, 0);
INSERT INTO `field_config` VALUES(7, 'field_video_link', 'text', 'text', 1, 'field_sql_storage', 'field_sql_storage', 1, 0, 0x613a373a7b733a31323a227472616e736c617461626c65223b733a313a2230223b733a31323a22656e746974795f7479706573223b613a303a7b7d733a383a2273657474696e6773223b613a313a7b733a31303a226d61785f6c656e677468223b733a333a22323535223b7d733a373a2273746f72616765223b613a353a7b733a343a2274797065223b733a31373a226669656c645f73716c5f73746f72616765223b733a383a2273657474696e6773223b613a303a7b7d733a363a226d6f64756c65223b733a31373a226669656c645f73716c5f73746f72616765223b733a363a22616374697665223b733a313a2231223b733a373a2264657461696c73223b613a313a7b733a333a2273716c223b613a323a7b733a31383a224649454c445f4c4f41445f43555252454e54223b613a313a7b733a32373a226669656c645f646174615f6669656c645f766964656f5f6c696e6b223b613a323a7b733a353a2276616c7565223b733a32323a226669656c645f766964656f5f6c696e6b5f76616c7565223b733a363a22666f726d6174223b733a32333a226669656c645f766964656f5f6c696e6b5f666f726d6174223b7d7d733a31393a224649454c445f4c4f41445f5245564953494f4e223b613a313a7b733a33313a226669656c645f7265766973696f6e5f6669656c645f766964656f5f6c696e6b223b613a323a7b733a353a2276616c7565223b733a32323a226669656c645f766964656f5f6c696e6b5f76616c7565223b733a363a22666f726d6174223b733a32333a226669656c645f766964656f5f6c696e6b5f666f726d6174223b7d7d7d7d7d733a31323a22666f726569676e206b657973223b613a313a7b733a363a22666f726d6174223b613a323a7b733a353a227461626c65223b733a31333a2266696c7465725f666f726d6174223b733a373a22636f6c756d6e73223b613a313a7b733a363a22666f726d6174223b733a363a22666f726d6174223b7d7d7d733a373a22696e6465786573223b613a313a7b733a363a22666f726d6174223b613a313a7b693a303b733a363a22666f726d6174223b7d7d733a323a226964223b733a313a2237223b7d, 1, 0, 0);
INSERT INTO `field_config` VALUES(9, 'field_video_thumbnail', 'file', 'file', 1, 'field_sql_storage', 'field_sql_storage', 1, 0, 0x613a373a7b733a31323a227472616e736c617461626c65223b733a313a2230223b733a31323a22656e746974795f7479706573223b613a303a7b7d733a383a2273657474696e6773223b613a333a7b733a31333a22646973706c61795f6669656c64223b693a303b733a31353a22646973706c61795f64656661756c74223b693a303b733a31303a227572695f736368656d65223b733a363a227075626c6963223b7d733a373a2273746f72616765223b613a353a7b733a343a2274797065223b733a31373a226669656c645f73716c5f73746f72616765223b733a383a2273657474696e6773223b613a303a7b7d733a363a226d6f64756c65223b733a31373a226669656c645f73716c5f73746f72616765223b733a363a22616374697665223b733a313a2231223b733a373a2264657461696c73223b613a313a7b733a333a2273716c223b613a323a7b733a31383a224649454c445f4c4f41445f43555252454e54223b613a313a7b733a33323a226669656c645f646174615f6669656c645f766964656f5f7468756d626e61696c223b613a333a7b733a333a22666964223b733a32353a226669656c645f766964656f5f7468756d626e61696c5f666964223b733a373a22646973706c6179223b733a32393a226669656c645f766964656f5f7468756d626e61696c5f646973706c6179223b733a31313a226465736372697074696f6e223b733a33333a226669656c645f766964656f5f7468756d626e61696c5f6465736372697074696f6e223b7d7d733a31393a224649454c445f4c4f41445f5245564953494f4e223b613a313a7b733a33363a226669656c645f7265766973696f6e5f6669656c645f766964656f5f7468756d626e61696c223b613a333a7b733a333a22666964223b733a32353a226669656c645f766964656f5f7468756d626e61696c5f666964223b733a373a22646973706c6179223b733a32393a226669656c645f766964656f5f7468756d626e61696c5f646973706c6179223b733a31313a226465736372697074696f6e223b733a33333a226669656c645f766964656f5f7468756d626e61696c5f6465736372697074696f6e223b7d7d7d7d7d733a31323a22666f726569676e206b657973223b613a313a7b733a333a22666964223b613a323a7b733a353a227461626c65223b733a31323a2266696c655f6d616e61676564223b733a373a22636f6c756d6e73223b613a313a7b733a333a22666964223b733a333a22666964223b7d7d7d733a373a22696e6465786573223b613a313a7b733a333a22666964223b613a313a7b693a303b733a333a22666964223b7d7d733a323a226964223b733a313a2239223b7d, 1, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `field_config_instance`
--

CREATE TABLE `field_config_instance` (
  `id` int(11) NOT NULL auto_increment COMMENT 'The primary identifier for a field instance',
  `field_id` int(11) NOT NULL COMMENT 'The identifier of the field attached by this instance',
  `field_name` varchar(32) NOT NULL default '',
  `entity_type` varchar(32) NOT NULL default '',
  `bundle` varchar(128) NOT NULL default '',
  `data` longblob NOT NULL,
  `deleted` tinyint(4) NOT NULL default '0',
  PRIMARY KEY  (`id`),
  KEY `field_name_bundle` (`field_name`,`entity_type`,`bundle`),
  KEY `deleted` (`deleted`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=14 ;

--
-- Dumping data for table `field_config_instance`
--

INSERT INTO `field_config_instance` VALUES(1, 1, 'comment_body', 'comment', 'comment_node_page', 0x613a363a7b733a353a226c6162656c223b733a373a22436f6d6d656e74223b733a383a2273657474696e6773223b613a323a7b733a31353a22746578745f70726f63657373696e67223b693a313b733a31383a22757365725f72656769737465725f666f726d223b623a303b7d733a383a227265717569726564223b623a313b733a373a22646973706c6179223b613a313a7b733a373a2264656661756c74223b613a353a7b733a353a226c6162656c223b733a363a2268696464656e223b733a343a2274797065223b733a31323a22746578745f64656661756c74223b733a363a22776569676874223b693a303b733a383a2273657474696e6773223b613a303a7b7d733a363a226d6f64756c65223b733a343a2274657874223b7d7d733a363a22776964676574223b613a343a7b733a343a2274797065223b733a31333a22746578745f7465787461726561223b733a383a2273657474696e6773223b613a313a7b733a343a22726f7773223b693a353b7d733a363a22776569676874223b693a303b733a363a226d6f64756c65223b733a343a2274657874223b7d733a31313a226465736372697074696f6e223b733a303a22223b7d, 0);
INSERT INTO `field_config_instance` VALUES(2, 2, 'body', 'node', 'page', 0x613a363a7b733a353a226c6162656c223b733a343a22426f6479223b733a363a22776964676574223b613a343a7b733a343a2274797065223b733a32363a22746578745f74657874617265615f776974685f73756d6d617279223b733a383a2273657474696e6773223b613a323a7b733a343a22726f7773223b693a32303b733a31323a2273756d6d6172795f726f7773223b693a353b7d733a363a22776569676874223b693a2d343b733a363a226d6f64756c65223b733a343a2274657874223b7d733a383a2273657474696e6773223b613a333a7b733a31353a22646973706c61795f73756d6d617279223b623a313b733a31353a22746578745f70726f63657373696e67223b693a313b733a31383a22757365725f72656769737465725f666f726d223b623a303b7d733a373a22646973706c6179223b613a323a7b733a373a2264656661756c74223b613a353a7b733a353a226c6162656c223b733a363a2268696464656e223b733a343a2274797065223b733a31323a22746578745f64656661756c74223b733a383a2273657474696e6773223b613a303a7b7d733a363a226d6f64756c65223b733a343a2274657874223b733a363a22776569676874223b693a303b7d733a363a22746561736572223b613a353a7b733a353a226c6162656c223b733a363a2268696464656e223b733a343a2274797065223b733a32333a22746578745f73756d6d6172795f6f725f7472696d6d6564223b733a383a2273657474696e6773223b613a313a7b733a31313a227472696d5f6c656e677468223b693a3630303b7d733a363a226d6f64756c65223b733a343a2274657874223b733a363a22776569676874223b693a303b7d7d733a383a227265717569726564223b623a303b733a31313a226465736372697074696f6e223b733a303a22223b7d, 0);
INSERT INTO `field_config_instance` VALUES(7, 1, 'comment_body', 'comment', 'comment_node_qr_content', 0x613a363a7b733a353a226c6162656c223b733a373a22436f6d6d656e74223b733a383a2273657474696e6773223b613a323a7b733a31353a22746578745f70726f63657373696e67223b693a313b733a31383a22757365725f72656769737465725f666f726d223b623a303b7d733a383a227265717569726564223b623a313b733a373a22646973706c6179223b613a313a7b733a373a2264656661756c74223b613a353a7b733a353a226c6162656c223b733a363a2268696464656e223b733a343a2274797065223b733a31323a22746578745f64656661756c74223b733a363a22776569676874223b693a303b733a383a2273657474696e6773223b613a303a7b7d733a363a226d6f64756c65223b733a343a2274657874223b7d7d733a363a22776964676574223b613a343a7b733a343a2274797065223b733a31333a22746578745f7465787461726561223b733a383a2273657474696e6773223b613a313a7b733a343a22726f7773223b693a353b7d733a363a22776569676874223b693a303b733a363a226d6f64756c65223b733a343a2274657874223b7d733a31313a226465736372697074696f6e223b733a303a22223b7d, 0);
INSERT INTO `field_config_instance` VALUES(8, 2, 'body', 'node', 'qr_content', 0x613a373a7b733a353a226c6162656c223b733a31323a22426f647920436f6e74656e74223b733a363a22776964676574223b613a353a7b733a363a22776569676874223b733a313a2232223b733a343a2274797065223b733a32363a22746578745f74657874617265615f776974685f73756d6d617279223b733a363a226d6f64756c65223b733a343a2274657874223b733a363a22616374697665223b693a313b733a383a2273657474696e6773223b613a323a7b733a343a22726f7773223b733a323a223230223b733a31323a2273756d6d6172795f726f7773223b693a353b7d7d733a383a2273657474696e6773223b613a333a7b733a31353a22746578745f70726f63657373696e67223b733a313a2231223b733a31353a22646973706c61795f73756d6d617279223b693a303b733a31383a22757365725f72656769737465725f666f726d223b623a303b7d733a373a22646973706c6179223b613a323a7b733a373a2264656661756c74223b613a353a7b733a353a226c6162656c223b733a363a2268696464656e223b733a343a2274797065223b733a31323a22746578745f64656661756c74223b733a363a22776569676874223b733a313a2230223b733a383a2273657474696e6773223b613a303a7b7d733a363a226d6f64756c65223b733a343a2274657874223b7d733a363a22746561736572223b613a353a7b733a353a226c6162656c223b733a363a2268696464656e223b733a343a2274797065223b733a32333a22746578745f73756d6d6172795f6f725f7472696d6d6564223b733a383a2273657474696e6773223b613a313a7b733a31313a227472696d5f6c656e677468223b693a3630303b7d733a363a226d6f64756c65223b733a343a2274657874223b733a363a22776569676874223b693a303b7d7d733a383a227265717569726564223b693a303b733a31313a226465736372697074696f6e223b733a303a22223b733a31333a2264656661756c745f76616c7565223b4e3b7d, 0);
INSERT INTO `field_config_instance` VALUES(9, 5, 'field_body_images', 'node', 'qr_content', 0x613a363a7b733a353a226c6162656c223b733a31313a22426f647920496d61676573223b733a363a22776964676574223b613a353a7b733a363a22776569676874223b733a313a2233223b733a343a2274797065223b733a31313a22696d6167655f696d616765223b733a363a226d6f64756c65223b733a353a22696d616765223b733a363a22616374697665223b693a313b733a383a2273657474696e6773223b613a383a7b733a31383a2270726f67726573735f696e64696361746f72223b733a383a227468726f62626572223b733a31393a22707265766965775f696d6167655f7374796c65223b733a393a227468756d626e61696c223b733a363a22696e73657274223b693a313b733a31353a22696e736572745f6162736f6c757465223b693a313b733a31333a22696e736572745f7374796c6573223b613a373a7b733a353a22696d616765223b733a353a22696d616765223b733a31313a22696d6167655f6c61726765223b733a31313a22696d6167655f6c61726765223b733a31323a22696d6167655f6d656469756d223b733a31323a22696d6167655f6d656469756d223b733a31353a22696d6167655f7468756d626e61696c223b733a31353a22696d6167655f7468756d626e61696c223b733a343a226175746f223b693a303b733a343a226c696e6b223b693a303b733a393a2269636f6e5f6c696e6b223b693a303b7d733a31343a22696e736572745f64656661756c74223b733a353a22696d616765223b733a31323a22696e736572745f636c617373223b733a303a22223b733a31323a22696e736572745f7769647468223b733a343a2231303030223b7d7d733a383a2273657474696e6773223b613a393a7b733a31343a2266696c655f6469726563746f7279223b733a31313a22626f64792d696d61676573223b733a31353a2266696c655f657874656e73696f6e73223b733a31363a22706e6720676966206a7067206a706567223b733a31323a226d61785f66696c6573697a65223b733a343a2232204d42223b733a31343a226d61785f7265736f6c7574696f6e223b733a393a22313030307831303030223b733a31343a226d696e5f7265736f6c7574696f6e223b733a303a22223b733a393a22616c745f6669656c64223b693a303b733a31313a227469746c655f6669656c64223b693a303b733a31333a2264656661756c745f696d616765223b693a303b733a31383a22757365725f72656769737465725f666f726d223b623a303b7d733a373a22646973706c6179223b613a313a7b733a373a2264656661756c74223b613a343a7b733a353a226c6162656c223b733a353a2261626f7665223b733a343a2274797065223b733a363a2268696464656e223b733a363a22776569676874223b733a313a2235223b733a383a2273657474696e6773223b613a303a7b7d7d7d733a383a227265717569726564223b693a303b733a31313a226465736372697074696f6e223b733a303a22223b7d, 0);
INSERT INTO `field_config_instance` VALUES(10, 6, 'field_mp3_audio', 'node', 'qr_content', 0x613a363a7b733a353a226c6162656c223b733a393a224d503320417564696f223b733a363a22776964676574223b613a353a7b733a363a22776569676874223b733a313a2234223b733a343a2274797065223b733a31323a2266696c655f67656e65726963223b733a363a226d6f64756c65223b733a343a2266696c65223b733a363a22616374697665223b693a313b733a383a2273657474696e6773223b613a373a7b733a31383a2270726f67726573735f696e64696361746f72223b733a383a227468726f62626572223b733a363a22696e73657274223b693a303b733a31353a22696e736572745f6162736f6c757465223b693a303b733a31333a22696e736572745f7374796c6573223b613a373a7b733a343a226175746f223b733a343a226175746f223b733a343a226c696e6b223b693a303b733a393a2269636f6e5f6c696e6b223b693a303b733a353a22696d616765223b693a303b733a31313a22696d6167655f6c61726765223b693a303b733a31323a22696d6167655f6d656469756d223b693a303b733a31353a22696d6167655f7468756d626e61696c223b693a303b7d733a31343a22696e736572745f64656661756c74223b733a343a226175746f223b733a31323a22696e736572745f636c617373223b733a303a22223b733a31323a22696e736572745f7769647468223b733a303a22223b7d7d733a383a2273657474696e6773223b613a353a7b733a31343a2266696c655f6469726563746f7279223b733a333a226d7033223b733a31353a2266696c655f657874656e73696f6e73223b733a333a226d7033223b733a31323a226d61785f66696c6573697a65223b733a353a223230204d42223b733a31373a226465736372697074696f6e5f6669656c64223b693a303b733a31383a22757365725f72656769737465725f666f726d223b623a303b7d733a373a22646973706c6179223b613a313a7b733a373a2264656661756c74223b613a353a7b733a353a226c6162656c223b733a353a2261626f7665223b733a343a2274797065223b733a31323a2266696c655f64656661756c74223b733a363a22776569676874223b733a313a2231223b733a383a2273657474696e6773223b613a303a7b7d733a363a226d6f64756c65223b733a343a2266696c65223b7d7d733a383a227265717569726564223b693a303b733a31313a226465736372697074696f6e223b733a303a22223b7d, 0);
INSERT INTO `field_config_instance` VALUES(11, 7, 'field_video_link', 'node', 'qr_content', 0x613a373a7b733a353a226c6162656c223b733a31303a22566964656f204c696e6b223b733a363a22776964676574223b613a353a7b733a363a22776569676874223b733a313a2237223b733a343a2274797065223b733a31343a22746578745f746578746669656c64223b733a363a226d6f64756c65223b733a343a2274657874223b733a363a22616374697665223b693a313b733a383a2273657474696e6773223b613a313a7b733a343a2273697a65223b733a333a22313230223b7d7d733a383a2273657474696e6773223b613a323a7b733a31353a22746578745f70726f63657373696e67223b733a313a2230223b733a31383a22757365725f72656769737465725f666f726d223b623a303b7d733a373a22646973706c6179223b613a313a7b733a373a2264656661756c74223b613a353a7b733a353a226c6162656c223b733a353a2261626f7665223b733a343a2274797065223b733a31323a22746578745f64656661756c74223b733a363a22776569676874223b733a313a2232223b733a383a2273657474696e6773223b613a303a7b7d733a363a226d6f64756c65223b733a343a2274657874223b7d7d733a383a227265717569726564223b693a303b733a31313a226465736372697074696f6e223b733a303a22223b733a31333a2264656661756c745f76616c7565223b613a313a7b693a303b613a313a7b733a353a2276616c7565223b733a373a22687474703a2f2f223b7d7d7d, 0);
INSERT INTO `field_config_instance` VALUES(13, 9, 'field_video_thumbnail', 'node', 'qr_content', 0x613a363a7b733a353a226c6162656c223b733a31353a22566964656f205468756d626e61696c223b733a363a22776964676574223b613a353a7b733a363a22776569676874223b733a313a2238223b733a343a2274797065223b733a31323a2266696c655f67656e65726963223b733a363a226d6f64756c65223b733a343a2266696c65223b733a363a22616374697665223b693a313b733a383a2273657474696e6773223b613a373a7b733a31383a2270726f67726573735f696e64696361746f72223b733a383a227468726f62626572223b733a363a22696e73657274223b693a303b733a31353a22696e736572745f6162736f6c757465223b693a303b733a31333a22696e736572745f7374796c6573223b613a373a7b733a343a226175746f223b733a343a226175746f223b733a343a226c696e6b223b693a303b733a393a2269636f6e5f6c696e6b223b693a303b733a353a22696d616765223b693a303b733a31313a22696d6167655f6c61726765223b693a303b733a31323a22696d6167655f6d656469756d223b693a303b733a31353a22696d6167655f7468756d626e61696c223b693a303b7d733a31343a22696e736572745f64656661756c74223b733a343a226175746f223b733a31323a22696e736572745f636c617373223b733a303a22223b733a31323a22696e736572745f7769647468223b733a303a22223b7d7d733a383a2273657474696e6773223b613a353a7b733a31343a2266696c655f6469726563746f7279223b733a31353a22766964656f2d7468756d626e61696c223b733a31353a2266696c655f657874656e73696f6e73223b733a373a226a706720706e67223b733a31323a226d61785f66696c6573697a65223b733a343a2231204d42223b733a31373a226465736372697074696f6e5f6669656c64223b693a303b733a31383a22757365725f72656769737465725f666f726d223b623a303b7d733a373a22646973706c6179223b613a313a7b733a373a2264656661756c74223b613a353a7b733a353a226c6162656c223b733a353a2261626f7665223b733a343a2274797065223b733a31323a2266696c655f64656661756c74223b733a363a22776569676874223b733a313a2236223b733a383a2273657474696e6773223b613a303a7b7d733a363a226d6f64756c65223b733a343a2266696c65223b7d7d733a383a227265717569726564223b693a303b733a31313a226465736372697074696f6e223b733a303a22223b7d, 0);

-- --------------------------------------------------------

--
-- Table structure for table `field_data_body`
--

CREATE TABLE `field_data_body` (
  `entity_type` varchar(128) NOT NULL default '' COMMENT 'The entity type this data is attached to',
  `bundle` varchar(128) NOT NULL default '' COMMENT 'The field instance bundle to which this row belongs, used when deleting a field instance',
  `deleted` tinyint(4) NOT NULL default '0' COMMENT 'A boolean indicating whether this data item has been deleted',
  `entity_id` int(10) unsigned NOT NULL COMMENT 'The entity id this data is attached to',
  `revision_id` int(10) unsigned default NULL COMMENT 'The entity revision id this data is attached to, or NULL if the entity type is not versioned',
  `language` varchar(32) NOT NULL default '' COMMENT 'The language for this data item.',
  `delta` int(10) unsigned NOT NULL COMMENT 'The sequence number for this data item, used for multi-value fields',
  `body_value` longtext,
  `body_summary` longtext,
  `body_format` varchar(255) default NULL,
  PRIMARY KEY  (`entity_type`,`entity_id`,`deleted`,`delta`,`language`),
  KEY `entity_type` (`entity_type`),
  KEY `bundle` (`bundle`),
  KEY `deleted` (`deleted`),
  KEY `entity_id` (`entity_id`),
  KEY `revision_id` (`revision_id`),
  KEY `language` (`language`),
  KEY `body_format` (`body_format`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Data storage for field 2 (body)';

--
-- Dumping data for table `field_data_body`
--

INSERT INTO `field_data_body` VALUES('node', 'qr_content', 0, 1, 1, 'und', 0, '<p><img src="http://www.qrtour.info/sites/default/files/body-images/urban.jpg" alt="" width="546" height="400" /></p><p>This is test exhibit content, accessed from a <span style="background-color: #339966; color: #ffffff;">nifty</span> QR code.</p>', '', 'full_html');
INSERT INTO `field_data_body` VALUES('node', 'qr_content', 0, 2, 2, 'und', 0, '<p>Here is an audio sample to play with.</p>', '', 'full_html');
INSERT INTO `field_data_body` VALUES('node', 'page', 0, 4, 4, 'und', 0, '<p>Welcome to the home page. Useful instructions could go here eventually.</p>', '', 'full_html');
INSERT INTO `field_data_body` VALUES('node', 'page', 0, 5, 5, 'und', 0, '<p>[A cool picture of a glowing phone will go here.]</p><p>[Download the QR Exhibit Tour app for awesome fun!]</p>', '', 'full_html');

-- --------------------------------------------------------

--
-- Table structure for table `field_data_comment_body`
--

CREATE TABLE `field_data_comment_body` (
  `entity_type` varchar(128) NOT NULL default '' COMMENT 'The entity type this data is attached to',
  `bundle` varchar(128) NOT NULL default '' COMMENT 'The field instance bundle to which this row belongs, used when deleting a field instance',
  `deleted` tinyint(4) NOT NULL default '0' COMMENT 'A boolean indicating whether this data item has been deleted',
  `entity_id` int(10) unsigned NOT NULL COMMENT 'The entity id this data is attached to',
  `revision_id` int(10) unsigned default NULL COMMENT 'The entity revision id this data is attached to, or NULL if the entity type is not versioned',
  `language` varchar(32) NOT NULL default '' COMMENT 'The language for this data item.',
  `delta` int(10) unsigned NOT NULL COMMENT 'The sequence number for this data item, used for multi-value fields',
  `comment_body_value` longtext,
  `comment_body_format` varchar(255) default NULL,
  PRIMARY KEY  (`entity_type`,`entity_id`,`deleted`,`delta`,`language`),
  KEY `entity_type` (`entity_type`),
  KEY `bundle` (`bundle`),
  KEY `deleted` (`deleted`),
  KEY `entity_id` (`entity_id`),
  KEY `revision_id` (`revision_id`),
  KEY `language` (`language`),
  KEY `comment_body_format` (`comment_body_format`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Data storage for field 1 (comment_body)';

--
-- Dumping data for table `field_data_comment_body`
--


-- --------------------------------------------------------

--
-- Table structure for table `field_data_field_body_images`
--

CREATE TABLE `field_data_field_body_images` (
  `entity_type` varchar(128) NOT NULL default '' COMMENT 'The entity type this data is attached to',
  `bundle` varchar(128) NOT NULL default '' COMMENT 'The field instance bundle to which this row belongs, used when deleting a field instance',
  `deleted` tinyint(4) NOT NULL default '0' COMMENT 'A boolean indicating whether this data item has been deleted',
  `entity_id` int(10) unsigned NOT NULL COMMENT 'The entity id this data is attached to',
  `revision_id` int(10) unsigned default NULL COMMENT 'The entity revision id this data is attached to, or NULL if the entity type is not versioned',
  `language` varchar(32) NOT NULL default '' COMMENT 'The language for this data item.',
  `delta` int(10) unsigned NOT NULL COMMENT 'The sequence number for this data item, used for multi-value fields',
  `field_body_images_fid` int(10) unsigned default NULL COMMENT 'The file_managed.fid being referenced in this field.',
  `field_body_images_alt` varchar(512) default NULL COMMENT 'Alternative image text, for the image’s ’alt’ attribute.',
  `field_body_images_title` varchar(1024) default NULL COMMENT 'Image title text, for the image’s ’title’ attribute.',
  `field_body_images_width` int(10) unsigned default NULL COMMENT 'The width of the image in pixels.',
  `field_body_images_height` int(10) unsigned default NULL COMMENT 'The height of the image in pixels.',
  PRIMARY KEY  (`entity_type`,`entity_id`,`deleted`,`delta`,`language`),
  KEY `entity_type` (`entity_type`),
  KEY `bundle` (`bundle`),
  KEY `deleted` (`deleted`),
  KEY `entity_id` (`entity_id`),
  KEY `revision_id` (`revision_id`),
  KEY `language` (`language`),
  KEY `field_body_images_fid` (`field_body_images_fid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Data storage for field 5 (field_body_images)';

--
-- Dumping data for table `field_data_field_body_images`
--

INSERT INTO `field_data_field_body_images` VALUES('node', 'qr_content', 0, 1, 1, 'und', 0, 6, '', '', 546, 400);

-- --------------------------------------------------------

--
-- Table structure for table `field_data_field_mp3_audio`
--

CREATE TABLE `field_data_field_mp3_audio` (
  `entity_type` varchar(128) NOT NULL default '' COMMENT 'The entity type this data is attached to',
  `bundle` varchar(128) NOT NULL default '' COMMENT 'The field instance bundle to which this row belongs, used when deleting a field instance',
  `deleted` tinyint(4) NOT NULL default '0' COMMENT 'A boolean indicating whether this data item has been deleted',
  `entity_id` int(10) unsigned NOT NULL COMMENT 'The entity id this data is attached to',
  `revision_id` int(10) unsigned default NULL COMMENT 'The entity revision id this data is attached to, or NULL if the entity type is not versioned',
  `language` varchar(32) NOT NULL default '' COMMENT 'The language for this data item.',
  `delta` int(10) unsigned NOT NULL COMMENT 'The sequence number for this data item, used for multi-value fields',
  `field_mp3_audio_fid` int(10) unsigned default NULL COMMENT 'The file_managed.fid being referenced in this field.',
  `field_mp3_audio_display` tinyint(3) unsigned NOT NULL default '1' COMMENT 'Flag to control whether this file should be displayed when viewing content.',
  `field_mp3_audio_description` text COMMENT 'A description of the file.',
  PRIMARY KEY  (`entity_type`,`entity_id`,`deleted`,`delta`,`language`),
  KEY `entity_type` (`entity_type`),
  KEY `bundle` (`bundle`),
  KEY `deleted` (`deleted`),
  KEY `entity_id` (`entity_id`),
  KEY `revision_id` (`revision_id`),
  KEY `language` (`language`),
  KEY `field_mp3_audio_fid` (`field_mp3_audio_fid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Data storage for field 6 (field_mp3_audio)';

--
-- Dumping data for table `field_data_field_mp3_audio`
--

INSERT INTO `field_data_field_mp3_audio` VALUES('node', 'qr_content', 0, 1, 1, 'und', 0, 7, 1, '');
INSERT INTO `field_data_field_mp3_audio` VALUES('node', 'qr_content', 0, 2, 2, 'und', 0, 8, 1, '');
INSERT INTO `field_data_field_mp3_audio` VALUES('node', 'qr_content', 0, 3, 3, 'und', 0, 9, 1, '');

-- --------------------------------------------------------

--
-- Table structure for table `field_data_field_video_link`
--

CREATE TABLE `field_data_field_video_link` (
  `entity_type` varchar(128) NOT NULL default '' COMMENT 'The entity type this data is attached to',
  `bundle` varchar(128) NOT NULL default '' COMMENT 'The field instance bundle to which this row belongs, used when deleting a field instance',
  `deleted` tinyint(4) NOT NULL default '0' COMMENT 'A boolean indicating whether this data item has been deleted',
  `entity_id` int(10) unsigned NOT NULL COMMENT 'The entity id this data is attached to',
  `revision_id` int(10) unsigned default NULL COMMENT 'The entity revision id this data is attached to, or NULL if the entity type is not versioned',
  `language` varchar(32) NOT NULL default '' COMMENT 'The language for this data item.',
  `delta` int(10) unsigned NOT NULL COMMENT 'The sequence number for this data item, used for multi-value fields',
  `field_video_link_value` varchar(255) default NULL,
  `field_video_link_format` varchar(255) default NULL,
  PRIMARY KEY  (`entity_type`,`entity_id`,`deleted`,`delta`,`language`),
  KEY `entity_type` (`entity_type`),
  KEY `bundle` (`bundle`),
  KEY `deleted` (`deleted`),
  KEY `entity_id` (`entity_id`),
  KEY `revision_id` (`revision_id`),
  KEY `language` (`language`),
  KEY `field_video_link_format` (`field_video_link_format`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Data storage for field 7 (field_video_link)';

--
-- Dumping data for table `field_data_field_video_link`
--

INSERT INTO `field_data_field_video_link` VALUES('node', 'qr_content', 0, 1, 1, 'und', 0, 'http://', NULL);
INSERT INTO `field_data_field_video_link` VALUES('node', 'qr_content', 0, 2, 2, 'und', 0, 'http://', NULL);
INSERT INTO `field_data_field_video_link` VALUES('node', 'qr_content', 0, 3, 3, 'und', 0, 'http://www.youtube.com/watch?v=O3cocXxXotA', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `field_data_field_video_thumbnail`
--

CREATE TABLE `field_data_field_video_thumbnail` (
  `entity_type` varchar(128) NOT NULL default '' COMMENT 'The entity type this data is attached to',
  `bundle` varchar(128) NOT NULL default '' COMMENT 'The field instance bundle to which this row belongs, used when deleting a field instance',
  `deleted` tinyint(4) NOT NULL default '0' COMMENT 'A boolean indicating whether this data item has been deleted',
  `entity_id` int(10) unsigned NOT NULL COMMENT 'The entity id this data is attached to',
  `revision_id` int(10) unsigned default NULL COMMENT 'The entity revision id this data is attached to, or NULL if the entity type is not versioned',
  `language` varchar(32) NOT NULL default '' COMMENT 'The language for this data item.',
  `delta` int(10) unsigned NOT NULL COMMENT 'The sequence number for this data item, used for multi-value fields',
  `field_video_thumbnail_fid` int(10) unsigned default NULL COMMENT 'The file_managed.fid being referenced in this field.',
  `field_video_thumbnail_display` tinyint(3) unsigned NOT NULL default '1' COMMENT 'Flag to control whether this file should be displayed when viewing content.',
  `field_video_thumbnail_description` text COMMENT 'A description of the file.',
  PRIMARY KEY  (`entity_type`,`entity_id`,`deleted`,`delta`,`language`),
  KEY `entity_type` (`entity_type`),
  KEY `bundle` (`bundle`),
  KEY `deleted` (`deleted`),
  KEY `entity_id` (`entity_id`),
  KEY `revision_id` (`revision_id`),
  KEY `language` (`language`),
  KEY `field_video_thumbnail_fid` (`field_video_thumbnail_fid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Data storage for field 9 (field_video_thumbnail)';

--
-- Dumping data for table `field_data_field_video_thumbnail`
--

INSERT INTO `field_data_field_video_thumbnail` VALUES('node', 'qr_content', 0, 3, 3, 'und', 0, 5, 1, '');

-- --------------------------------------------------------

--
-- Table structure for table `field_group`
--

CREATE TABLE `field_group` (
  `id` int(11) NOT NULL auto_increment COMMENT 'The primary identifier for a group',
  `identifier` varchar(255) NOT NULL default '' COMMENT 'The unique string identifier for a group.',
  `group_name` varchar(32) NOT NULL default '' COMMENT 'The name of this group.',
  `entity_type` varchar(32) NOT NULL default '',
  `bundle` varchar(128) NOT NULL default '',
  `mode` varchar(128) NOT NULL default '',
  `parent_name` varchar(32) NOT NULL default '' COMMENT 'The parent name for a group',
  `data` longblob NOT NULL COMMENT 'Serialized data containing the group properties that do not warrant a dedicated column.',
  PRIMARY KEY  (`id`),
  UNIQUE KEY `identifier` (`identifier`),
  KEY `group_name` (`group_name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Table that contains field group entries and settings.' AUTO_INCREMENT=4 ;

--
-- Dumping data for table `field_group`
--

INSERT INTO `field_group` VALUES(1, 'group_audio|node|qr_content|form', 'group_audio', 'node', 'qr_content', 'form', '', 0x613a353a7b733a353a226c6162656c223b733a353a22417564696f223b733a363a22776569676874223b733a313a2234223b733a383a226368696c6472656e223b613a313a7b693a303b733a31353a226669656c645f6d70335f617564696f223b7d733a31313a22666f726d61745f74797065223b733a333a22746162223b733a31353a22666f726d61745f73657474696e6773223b613a323a7b733a393a22666f726d6174746572223b733a363a22636c6f736564223b733a31373a22696e7374616e63655f73657474696e6773223b613a333a7b733a31313a226465736372697074696f6e223b733a303a22223b733a373a22636c6173736573223b733a303a22223b733a31353a2272657175697265645f6669656c6473223b693a313b7d7d7d);
INSERT INTO `field_group` VALUES(2, 'group_video|node|qr_content|form', 'group_video', 'node', 'qr_content', 'form', '', 0x613a353a7b733a353a226c6162656c223b733a353a22566964656f223b733a363a22776569676874223b733a313a2235223b733a383a226368696c6472656e223b613a323a7b693a303b733a31363a226669656c645f766964656f5f6c696e6b223b693a313b733a32313a226669656c645f766964656f5f7468756d626e61696c223b7d733a31313a22666f726d61745f74797065223b733a333a22746162223b733a31353a22666f726d61745f73657474696e6773223b613a323a7b733a393a22666f726d6174746572223b733a363a22636c6f736564223b733a31373a22696e7374616e63655f73657474696e6773223b613a333a7b733a31313a226465736372697074696f6e223b733a303a22223b733a373a22636c6173736573223b733a303a22223b733a31353a2272657175697265645f6669656c6473223b693a313b7d7d7d);
INSERT INTO `field_group` VALUES(3, 'group_body|node|qr_content|form', 'group_body', 'node', 'qr_content', 'form', '', 0x613a353a7b733a353a226c6162656c223b733a343a22426f6479223b733a363a22776569676874223b733a313a2231223b733a383a226368696c6472656e223b613a323a7b693a303b733a343a22626f6479223b693a313b733a31373a226669656c645f626f64795f696d61676573223b7d733a31313a22666f726d61745f74797065223b733a333a22746162223b733a31353a22666f726d61745f73657474696e6773223b613a323a7b733a393a22666f726d6174746572223b733a363a22636c6f736564223b733a31373a22696e7374616e63655f73657474696e6773223b613a333a7b733a31313a226465736372697074696f6e223b733a303a22223b733a373a22636c6173736573223b733a303a22223b733a31353a2272657175697265645f6669656c6473223b693a313b7d7d7d);

-- --------------------------------------------------------

--
-- Table structure for table `field_revision_body`
--

CREATE TABLE `field_revision_body` (
  `entity_type` varchar(128) NOT NULL default '' COMMENT 'The entity type this data is attached to',
  `bundle` varchar(128) NOT NULL default '' COMMENT 'The field instance bundle to which this row belongs, used when deleting a field instance',
  `deleted` tinyint(4) NOT NULL default '0' COMMENT 'A boolean indicating whether this data item has been deleted',
  `entity_id` int(10) unsigned NOT NULL COMMENT 'The entity id this data is attached to',
  `revision_id` int(10) unsigned NOT NULL COMMENT 'The entity revision id this data is attached to',
  `language` varchar(32) NOT NULL default '' COMMENT 'The language for this data item.',
  `delta` int(10) unsigned NOT NULL COMMENT 'The sequence number for this data item, used for multi-value fields',
  `body_value` longtext,
  `body_summary` longtext,
  `body_format` varchar(255) default NULL,
  PRIMARY KEY  (`entity_type`,`entity_id`,`revision_id`,`deleted`,`delta`,`language`),
  KEY `entity_type` (`entity_type`),
  KEY `bundle` (`bundle`),
  KEY `deleted` (`deleted`),
  KEY `entity_id` (`entity_id`),
  KEY `revision_id` (`revision_id`),
  KEY `language` (`language`),
  KEY `body_format` (`body_format`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Revision archive storage for field 2 (body)';

--
-- Dumping data for table `field_revision_body`
--

INSERT INTO `field_revision_body` VALUES('node', 'qr_content', 0, 1, 1, 'und', 0, '<p><img src="http://www.qrtour.info/sites/default/files/body-images/urban.jpg" alt="" width="546" height="400" /></p><p>This is test exhibit content, accessed from a <span style="background-color: #339966; color: #ffffff;">nifty</span> QR code.</p>', '', 'full_html');
INSERT INTO `field_revision_body` VALUES('node', 'qr_content', 0, 2, 2, 'und', 0, '<p>Here is an audio sample to play with.</p>', '', 'full_html');
INSERT INTO `field_revision_body` VALUES('node', 'page', 0, 4, 4, 'und', 0, '<p>Welcome to the home page. Useful instructions could go here eventually.</p>', '', 'full_html');
INSERT INTO `field_revision_body` VALUES('node', 'page', 0, 5, 5, 'und', 0, '<p>[A cool picture of a glowing phone will go here.]</p><p>[Download the QR Exhibit Tour app for awesome fun!]</p>', '', 'full_html');

-- --------------------------------------------------------

--
-- Table structure for table `field_revision_comment_body`
--

CREATE TABLE `field_revision_comment_body` (
  `entity_type` varchar(128) NOT NULL default '' COMMENT 'The entity type this data is attached to',
  `bundle` varchar(128) NOT NULL default '' COMMENT 'The field instance bundle to which this row belongs, used when deleting a field instance',
  `deleted` tinyint(4) NOT NULL default '0' COMMENT 'A boolean indicating whether this data item has been deleted',
  `entity_id` int(10) unsigned NOT NULL COMMENT 'The entity id this data is attached to',
  `revision_id` int(10) unsigned NOT NULL COMMENT 'The entity revision id this data is attached to',
  `language` varchar(32) NOT NULL default '' COMMENT 'The language for this data item.',
  `delta` int(10) unsigned NOT NULL COMMENT 'The sequence number for this data item, used for multi-value fields',
  `comment_body_value` longtext,
  `comment_body_format` varchar(255) default NULL,
  PRIMARY KEY  (`entity_type`,`entity_id`,`revision_id`,`deleted`,`delta`,`language`),
  KEY `entity_type` (`entity_type`),
  KEY `bundle` (`bundle`),
  KEY `deleted` (`deleted`),
  KEY `entity_id` (`entity_id`),
  KEY `revision_id` (`revision_id`),
  KEY `language` (`language`),
  KEY `comment_body_format` (`comment_body_format`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Revision archive storage for field 1 (comment_body)';

--
-- Dumping data for table `field_revision_comment_body`
--


-- --------------------------------------------------------

--
-- Table structure for table `field_revision_field_body_images`
--

CREATE TABLE `field_revision_field_body_images` (
  `entity_type` varchar(128) NOT NULL default '' COMMENT 'The entity type this data is attached to',
  `bundle` varchar(128) NOT NULL default '' COMMENT 'The field instance bundle to which this row belongs, used when deleting a field instance',
  `deleted` tinyint(4) NOT NULL default '0' COMMENT 'A boolean indicating whether this data item has been deleted',
  `entity_id` int(10) unsigned NOT NULL COMMENT 'The entity id this data is attached to',
  `revision_id` int(10) unsigned NOT NULL COMMENT 'The entity revision id this data is attached to',
  `language` varchar(32) NOT NULL default '' COMMENT 'The language for this data item.',
  `delta` int(10) unsigned NOT NULL COMMENT 'The sequence number for this data item, used for multi-value fields',
  `field_body_images_fid` int(10) unsigned default NULL COMMENT 'The file_managed.fid being referenced in this field.',
  `field_body_images_alt` varchar(512) default NULL COMMENT 'Alternative image text, for the image’s ’alt’ attribute.',
  `field_body_images_title` varchar(1024) default NULL COMMENT 'Image title text, for the image’s ’title’ attribute.',
  `field_body_images_width` int(10) unsigned default NULL COMMENT 'The width of the image in pixels.',
  `field_body_images_height` int(10) unsigned default NULL COMMENT 'The height of the image in pixels.',
  PRIMARY KEY  (`entity_type`,`entity_id`,`revision_id`,`deleted`,`delta`,`language`),
  KEY `entity_type` (`entity_type`),
  KEY `bundle` (`bundle`),
  KEY `deleted` (`deleted`),
  KEY `entity_id` (`entity_id`),
  KEY `revision_id` (`revision_id`),
  KEY `language` (`language`),
  KEY `field_body_images_fid` (`field_body_images_fid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Revision archive storage for field 5 (field_body_images)';

--
-- Dumping data for table `field_revision_field_body_images`
--

INSERT INTO `field_revision_field_body_images` VALUES('node', 'qr_content', 0, 1, 1, 'und', 0, 6, '', '', 546, 400);

-- --------------------------------------------------------

--
-- Table structure for table `field_revision_field_mp3_audio`
--

CREATE TABLE `field_revision_field_mp3_audio` (
  `entity_type` varchar(128) NOT NULL default '' COMMENT 'The entity type this data is attached to',
  `bundle` varchar(128) NOT NULL default '' COMMENT 'The field instance bundle to which this row belongs, used when deleting a field instance',
  `deleted` tinyint(4) NOT NULL default '0' COMMENT 'A boolean indicating whether this data item has been deleted',
  `entity_id` int(10) unsigned NOT NULL COMMENT 'The entity id this data is attached to',
  `revision_id` int(10) unsigned NOT NULL COMMENT 'The entity revision id this data is attached to',
  `language` varchar(32) NOT NULL default '' COMMENT 'The language for this data item.',
  `delta` int(10) unsigned NOT NULL COMMENT 'The sequence number for this data item, used for multi-value fields',
  `field_mp3_audio_fid` int(10) unsigned default NULL COMMENT 'The file_managed.fid being referenced in this field.',
  `field_mp3_audio_display` tinyint(3) unsigned NOT NULL default '1' COMMENT 'Flag to control whether this file should be displayed when viewing content.',
  `field_mp3_audio_description` text COMMENT 'A description of the file.',
  PRIMARY KEY  (`entity_type`,`entity_id`,`revision_id`,`deleted`,`delta`,`language`),
  KEY `entity_type` (`entity_type`),
  KEY `bundle` (`bundle`),
  KEY `deleted` (`deleted`),
  KEY `entity_id` (`entity_id`),
  KEY `revision_id` (`revision_id`),
  KEY `language` (`language`),
  KEY `field_mp3_audio_fid` (`field_mp3_audio_fid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Revision archive storage for field 6 (field_mp3_audio)';

--
-- Dumping data for table `field_revision_field_mp3_audio`
--

INSERT INTO `field_revision_field_mp3_audio` VALUES('node', 'qr_content', 0, 1, 1, 'und', 0, 7, 1, '');
INSERT INTO `field_revision_field_mp3_audio` VALUES('node', 'qr_content', 0, 2, 2, 'und', 0, 8, 1, '');
INSERT INTO `field_revision_field_mp3_audio` VALUES('node', 'qr_content', 0, 3, 3, 'und', 0, 9, 1, '');

-- --------------------------------------------------------

--
-- Table structure for table `field_revision_field_video_link`
--

CREATE TABLE `field_revision_field_video_link` (
  `entity_type` varchar(128) NOT NULL default '' COMMENT 'The entity type this data is attached to',
  `bundle` varchar(128) NOT NULL default '' COMMENT 'The field instance bundle to which this row belongs, used when deleting a field instance',
  `deleted` tinyint(4) NOT NULL default '0' COMMENT 'A boolean indicating whether this data item has been deleted',
  `entity_id` int(10) unsigned NOT NULL COMMENT 'The entity id this data is attached to',
  `revision_id` int(10) unsigned NOT NULL COMMENT 'The entity revision id this data is attached to',
  `language` varchar(32) NOT NULL default '' COMMENT 'The language for this data item.',
  `delta` int(10) unsigned NOT NULL COMMENT 'The sequence number for this data item, used for multi-value fields',
  `field_video_link_value` varchar(255) default NULL,
  `field_video_link_format` varchar(255) default NULL,
  PRIMARY KEY  (`entity_type`,`entity_id`,`revision_id`,`deleted`,`delta`,`language`),
  KEY `entity_type` (`entity_type`),
  KEY `bundle` (`bundle`),
  KEY `deleted` (`deleted`),
  KEY `entity_id` (`entity_id`),
  KEY `revision_id` (`revision_id`),
  KEY `language` (`language`),
  KEY `field_video_link_format` (`field_video_link_format`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Revision archive storage for field 7 (field_video_link)';

--
-- Dumping data for table `field_revision_field_video_link`
--

INSERT INTO `field_revision_field_video_link` VALUES('node', 'qr_content', 0, 1, 1, 'und', 0, 'http://', NULL);
INSERT INTO `field_revision_field_video_link` VALUES('node', 'qr_content', 0, 2, 2, 'und', 0, 'http://', NULL);
INSERT INTO `field_revision_field_video_link` VALUES('node', 'qr_content', 0, 3, 3, 'und', 0, 'http://www.youtube.com/watch?v=O3cocXxXotA', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `field_revision_field_video_thumbnail`
--

CREATE TABLE `field_revision_field_video_thumbnail` (
  `entity_type` varchar(128) NOT NULL default '' COMMENT 'The entity type this data is attached to',
  `bundle` varchar(128) NOT NULL default '' COMMENT 'The field instance bundle to which this row belongs, used when deleting a field instance',
  `deleted` tinyint(4) NOT NULL default '0' COMMENT 'A boolean indicating whether this data item has been deleted',
  `entity_id` int(10) unsigned NOT NULL COMMENT 'The entity id this data is attached to',
  `revision_id` int(10) unsigned NOT NULL COMMENT 'The entity revision id this data is attached to',
  `language` varchar(32) NOT NULL default '' COMMENT 'The language for this data item.',
  `delta` int(10) unsigned NOT NULL COMMENT 'The sequence number for this data item, used for multi-value fields',
  `field_video_thumbnail_fid` int(10) unsigned default NULL COMMENT 'The file_managed.fid being referenced in this field.',
  `field_video_thumbnail_display` tinyint(3) unsigned NOT NULL default '1' COMMENT 'Flag to control whether this file should be displayed when viewing content.',
  `field_video_thumbnail_description` text COMMENT 'A description of the file.',
  PRIMARY KEY  (`entity_type`,`entity_id`,`revision_id`,`deleted`,`delta`,`language`),
  KEY `entity_type` (`entity_type`),
  KEY `bundle` (`bundle`),
  KEY `deleted` (`deleted`),
  KEY `entity_id` (`entity_id`),
  KEY `revision_id` (`revision_id`),
  KEY `language` (`language`),
  KEY `field_video_thumbnail_fid` (`field_video_thumbnail_fid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Revision archive storage for field 9 (field_video_thumbnail)';

--
-- Dumping data for table `field_revision_field_video_thumbnail`
--

INSERT INTO `field_revision_field_video_thumbnail` VALUES('node', 'qr_content', 0, 3, 3, 'und', 0, 5, 1, '');

-- --------------------------------------------------------

--
-- Table structure for table `file_managed`
--

CREATE TABLE `file_managed` (
  `fid` int(10) unsigned NOT NULL auto_increment COMMENT 'File ID.',
  `uid` int(10) unsigned NOT NULL default '0' COMMENT 'The users.uid of the user who is associated with the file.',
  `filename` varchar(255) NOT NULL default '' COMMENT 'Name of the file with no path components. This may differ from the basename of the URI if the file is renamed to avoid overwriting an existing file.',
  `uri` varchar(255) character set utf8 collate utf8_bin NOT NULL default '' COMMENT 'The URI to access the file (either local or remote).',
  `filemime` varchar(255) NOT NULL default '' COMMENT 'The file’s MIME type.',
  `filesize` int(10) unsigned NOT NULL default '0' COMMENT 'The size of the file in bytes.',
  `status` tinyint(4) NOT NULL default '0' COMMENT 'A field indicating the status of the file. Two status are defined in core: temporary (0) and permanent (1). Temporary files older than DRUPAL_MAXIMUM_TEMP_FILE_AGE will be removed during a cron run.',
  `timestamp` int(10) unsigned NOT NULL default '0' COMMENT 'UNIX timestamp for when the file was added.',
  PRIMARY KEY  (`fid`),
  UNIQUE KEY `uri` (`uri`),
  KEY `uid` (`uid`),
  KEY `status` (`status`),
  KEY `timestamp` (`timestamp`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Stores information for uploaded files.' AUTO_INCREMENT=10 ;

--
-- Dumping data for table `file_managed`
--

INSERT INTO `file_managed` VALUES(5, 1, '3DLogo.jpg', 'public://video-thumbnail/3DLogo.jpg', 'image/jpeg', 8203, 1, 1374522442);
INSERT INTO `file_managed` VALUES(6, 1, 'urban.jpg', 'public://body-images/urban.jpg', 'image/jpeg', 231017, 1, 1374682182);
INSERT INTO `file_managed` VALUES(7, 1, 'a.mp3', 'public://mp3/a.mp3', 'audio/mpeg', 52243, 1, 1375827155);
INSERT INTO `file_managed` VALUES(8, 1, 'b.mp3', 'public://mp3/b.mp3', 'audio/mpeg', 53079, 1, 1375827175);
INSERT INTO `file_managed` VALUES(9, 1, 'c.mp3', 'public://mp3/c.mp3', 'audio/mpeg', 45974, 1, 1375827206);

-- --------------------------------------------------------

--
-- Table structure for table `file_usage`
--

CREATE TABLE `file_usage` (
  `fid` int(10) unsigned NOT NULL COMMENT 'File ID.',
  `module` varchar(255) NOT NULL default '' COMMENT 'The name of the module that is using the file.',
  `type` varchar(64) NOT NULL default '' COMMENT 'The name of the object type in which the file is used.',
  `id` int(10) unsigned NOT NULL default '0' COMMENT 'The primary key of the object using the file.',
  `count` int(10) unsigned NOT NULL default '0' COMMENT 'The number of times this file is used by this object.',
  PRIMARY KEY  (`fid`,`type`,`id`,`module`),
  KEY `type_id` (`type`,`id`),
  KEY `fid_count` (`fid`,`count`),
  KEY `fid_module` (`fid`,`module`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Track where a file is used.';

--
-- Dumping data for table `file_usage`
--

INSERT INTO `file_usage` VALUES(5, 'file', 'node', 3, 1);
INSERT INTO `file_usage` VALUES(6, 'file', 'node', 1, 1);
INSERT INTO `file_usage` VALUES(7, 'file', 'node', 1, 1);
INSERT INTO `file_usage` VALUES(8, 'file', 'node', 2, 1);
INSERT INTO `file_usage` VALUES(9, 'file', 'node', 3, 1);

-- --------------------------------------------------------

--
-- Table structure for table `filter`
--

CREATE TABLE `filter` (
  `format` varchar(255) NOT NULL COMMENT 'Foreign key: The filter_format.format to which this filter is assigned.',
  `module` varchar(64) NOT NULL default '' COMMENT 'The origin module of the filter.',
  `name` varchar(32) NOT NULL default '' COMMENT 'Name of the filter being referenced.',
  `weight` int(11) NOT NULL default '0' COMMENT 'Weight of filter within format.',
  `status` int(11) NOT NULL default '0' COMMENT 'Filter enabled status. (1 = enabled, 0 = disabled)',
  `settings` longblob COMMENT 'A serialized array of name value pairs that store the filter settings for the specific format.',
  PRIMARY KEY  (`format`,`name`),
  KEY `list` (`weight`,`module`,`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Table that maps filters (HTML corrector) to text formats ...';

--
-- Dumping data for table `filter`
--

INSERT INTO `filter` VALUES('filtered_html', 'filter', 'filter_autop', 2, 1, 0x613a303a7b7d);
INSERT INTO `filter` VALUES('filtered_html', 'filter', 'filter_html', 1, 1, 0x613a333a7b733a31323a22616c6c6f7765645f68746d6c223b733a37343a223c613e203c656d3e203c7374726f6e673e203c636974653e203c626c6f636b71756f74653e203c636f64653e203c756c3e203c6f6c3e203c6c693e203c646c3e203c64743e203c64643e223b733a31363a2266696c7465725f68746d6c5f68656c70223b693a313b733a32303a2266696c7465725f68746d6c5f6e6f666f6c6c6f77223b693a303b7d);
INSERT INTO `filter` VALUES('filtered_html', 'filter', 'filter_htmlcorrector', 10, 1, 0x613a303a7b7d);
INSERT INTO `filter` VALUES('filtered_html', 'filter', 'filter_html_escape', -10, 0, 0x613a303a7b7d);
INSERT INTO `filter` VALUES('filtered_html', 'filter', 'filter_url', 0, 1, 0x613a313a7b733a31373a2266696c7465725f75726c5f6c656e677468223b733a323a223732223b7d);
INSERT INTO `filter` VALUES('full_html', 'filter', 'filter_autop', 1, 1, 0x613a303a7b7d);
INSERT INTO `filter` VALUES('full_html', 'filter', 'filter_html', -10, 0, 0x613a333a7b733a31323a22616c6c6f7765645f68746d6c223b733a37343a223c613e203c656d3e203c7374726f6e673e203c636974653e203c626c6f636b71756f74653e203c636f64653e203c756c3e203c6f6c3e203c6c693e203c646c3e203c64743e203c64643e223b733a31363a2266696c7465725f68746d6c5f68656c70223b693a313b733a32303a2266696c7465725f68746d6c5f6e6f666f6c6c6f77223b693a303b7d);
INSERT INTO `filter` VALUES('full_html', 'filter', 'filter_htmlcorrector', 10, 1, 0x613a303a7b7d);
INSERT INTO `filter` VALUES('full_html', 'filter', 'filter_html_escape', -10, 0, 0x613a303a7b7d);
INSERT INTO `filter` VALUES('full_html', 'filter', 'filter_url', 0, 1, 0x613a313a7b733a31373a2266696c7465725f75726c5f6c656e677468223b733a323a223732223b7d);
INSERT INTO `filter` VALUES('plain_text', 'filter', 'filter_autop', 2, 1, 0x613a303a7b7d);
INSERT INTO `filter` VALUES('plain_text', 'filter', 'filter_html', -10, 0, 0x613a333a7b733a31323a22616c6c6f7765645f68746d6c223b733a37343a223c613e203c656d3e203c7374726f6e673e203c636974653e203c626c6f636b71756f74653e203c636f64653e203c756c3e203c6f6c3e203c6c693e203c646c3e203c64743e203c64643e223b733a31363a2266696c7465725f68746d6c5f68656c70223b693a313b733a32303a2266696c7465725f68746d6c5f6e6f666f6c6c6f77223b693a303b7d);
INSERT INTO `filter` VALUES('plain_text', 'filter', 'filter_htmlcorrector', 10, 0, 0x613a303a7b7d);
INSERT INTO `filter` VALUES('plain_text', 'filter', 'filter_html_escape', 0, 1, 0x613a303a7b7d);
INSERT INTO `filter` VALUES('plain_text', 'filter', 'filter_url', 1, 1, 0x613a313a7b733a31373a2266696c7465725f75726c5f6c656e677468223b693a37323b7d);

-- --------------------------------------------------------

--
-- Table structure for table `filter_format`
--

CREATE TABLE `filter_format` (
  `format` varchar(255) NOT NULL COMMENT 'Primary Key: Unique machine name of the format.',
  `name` varchar(255) NOT NULL default '' COMMENT 'Name of the text format (Filtered HTML).',
  `cache` tinyint(4) NOT NULL default '0' COMMENT 'Flag to indicate whether format is cacheable. (1 = cacheable, 0 = not cacheable)',
  `status` tinyint(3) unsigned NOT NULL default '1' COMMENT 'The status of the text format. (1 = enabled, 0 = disabled)',
  `weight` int(11) NOT NULL default '0' COMMENT 'Weight of text format to use when listing.',
  PRIMARY KEY  (`format`),
  UNIQUE KEY `name` (`name`),
  KEY `status_weight` (`status`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores text formats: custom groupings of filters, such as...';

--
-- Dumping data for table `filter_format`
--

INSERT INTO `filter_format` VALUES('filtered_html', 'Filtered HTML', 1, 0, -9);
INSERT INTO `filter_format` VALUES('full_html', 'Full HTML', 1, 1, -10);
INSERT INTO `filter_format` VALUES('plain_text', 'Plain text', 1, 1, -8);

-- --------------------------------------------------------

--
-- Table structure for table `flood`
--

CREATE TABLE `flood` (
  `fid` int(11) NOT NULL auto_increment COMMENT 'Unique flood event ID.',
  `event` varchar(64) NOT NULL default '' COMMENT 'Name of event (e.g. contact).',
  `identifier` varchar(128) NOT NULL default '' COMMENT 'Identifier of the visitor, such as an IP address or hostname.',
  `timestamp` int(11) NOT NULL default '0' COMMENT 'Timestamp of the event.',
  `expiration` int(11) NOT NULL default '0' COMMENT 'Expiration timestamp. Expired events are purged on cron run.',
  PRIMARY KEY  (`fid`),
  KEY `allow` (`event`,`identifier`,`timestamp`),
  KEY `purge` (`expiration`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Flood controls the threshold of events, such as the...' AUTO_INCREMENT=4 ;

--
-- Dumping data for table `flood`
--


-- --------------------------------------------------------

--
-- Table structure for table `history`
--

CREATE TABLE `history` (
  `uid` int(11) NOT NULL default '0' COMMENT 'The users.uid that read the node nid.',
  `nid` int(11) NOT NULL default '0' COMMENT 'The node.nid that was read.',
  `timestamp` int(11) NOT NULL default '0' COMMENT 'The Unix timestamp at which the read occurred.',
  PRIMARY KEY  (`uid`,`nid`),
  KEY `nid` (`nid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='A record of which users have read which nodes.';

--
-- Dumping data for table `history`
--

INSERT INTO `history` VALUES(1, 1, 1375827156);
INSERT INTO `history` VALUES(1, 2, 1375827176);
INSERT INTO `history` VALUES(1, 3, 1375827207);
INSERT INTO `history` VALUES(1, 4, 1375827179);
INSERT INTO `history` VALUES(1, 5, 1374858009);

-- --------------------------------------------------------

--
-- Table structure for table `image_effects`
--

CREATE TABLE `image_effects` (
  `ieid` int(10) unsigned NOT NULL auto_increment COMMENT 'The primary identifier for an image effect.',
  `isid` int(10) unsigned NOT NULL default '0' COMMENT 'The image_styles.isid for an image style.',
  `weight` int(11) NOT NULL default '0' COMMENT 'The weight of the effect in the style.',
  `name` varchar(255) NOT NULL COMMENT 'The unique name of the effect to be executed.',
  `data` longblob NOT NULL COMMENT 'The configuration data for the effect.',
  PRIMARY KEY  (`ieid`),
  KEY `isid` (`isid`),
  KEY `weight` (`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores configuration options for image effects.' AUTO_INCREMENT=1 ;

--
-- Dumping data for table `image_effects`
--


-- --------------------------------------------------------

--
-- Table structure for table `image_styles`
--

CREATE TABLE `image_styles` (
  `isid` int(10) unsigned NOT NULL auto_increment COMMENT 'The primary identifier for an image style.',
  `name` varchar(255) NOT NULL COMMENT 'The style name.',
  PRIMARY KEY  (`isid`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores configuration options for image styles.' AUTO_INCREMENT=1 ;

--
-- Dumping data for table `image_styles`
--


-- --------------------------------------------------------

--
-- Table structure for table `menu_custom`
--

CREATE TABLE `menu_custom` (
  `menu_name` varchar(32) NOT NULL default '' COMMENT 'Primary Key: Unique key for menu. This is used as a block delta so length is 32.',
  `title` varchar(255) NOT NULL default '' COMMENT 'Menu title; displayed at top of block.',
  `description` text COMMENT 'Menu description.',
  PRIMARY KEY  (`menu_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Holds definitions for top-level custom menus (for example...';

--
-- Dumping data for table `menu_custom`
--

INSERT INTO `menu_custom` VALUES('main-menu', 'Main menu', 'The <em>Main</em> menu is used on many sites to show the major sections of the site, often in a top navigation bar.');
INSERT INTO `menu_custom` VALUES('management', 'Management', 'The <em>Management</em> menu contains links for administrative tasks.');
INSERT INTO `menu_custom` VALUES('navigation', 'Navigation', 'The <em>Navigation</em> menu contains links intended for site visitors. Links are added to the <em>Navigation</em> menu automatically by some modules.');
INSERT INTO `menu_custom` VALUES('user-menu', 'User menu', 'The <em>User</em> menu contains links related to the user''s account, as well as the ''Log out'' link.');

-- --------------------------------------------------------

--
-- Table structure for table `menu_links`
--

CREATE TABLE `menu_links` (
  `menu_name` varchar(32) NOT NULL default '' COMMENT 'The menu name. All links with the same menu name (such as ’navigation’) are part of the same menu.',
  `mlid` int(10) unsigned NOT NULL auto_increment COMMENT 'The menu link ID (mlid) is the integer primary key.',
  `plid` int(10) unsigned NOT NULL default '0' COMMENT 'The parent link ID (plid) is the mlid of the link above in the hierarchy, or zero if the link is at the top level in its menu.',
  `link_path` varchar(255) NOT NULL default '' COMMENT 'The Drupal path or external path this link points to.',
  `router_path` varchar(255) NOT NULL default '' COMMENT 'For links corresponding to a Drupal path (external = 0), this connects the link to a menu_router.path for joins.',
  `link_title` varchar(255) NOT NULL default '' COMMENT 'The text displayed for the link, which may be modified by a title callback stored in menu_router.',
  `options` blob COMMENT 'A serialized array of options to be passed to the url() or l() function, such as a query string or HTML attributes.',
  `module` varchar(255) NOT NULL default 'system' COMMENT 'The name of the module that generated this link.',
  `hidden` smallint(6) NOT NULL default '0' COMMENT 'A flag for whether the link should be rendered in menus. (1 = a disabled menu item that may be shown on admin screens, -1 = a menu callback, 0 = a normal, visible link)',
  `external` smallint(6) NOT NULL default '0' COMMENT 'A flag to indicate if the link points to a full URL starting with a protocol, like http:// (1 = external, 0 = internal).',
  `has_children` smallint(6) NOT NULL default '0' COMMENT 'Flag indicating whether any links have this link as a parent (1 = children exist, 0 = no children).',
  `expanded` smallint(6) NOT NULL default '0' COMMENT 'Flag for whether this link should be rendered as expanded in menus - expanded links always have their child links displayed, instead of only when the link is in the active trail (1 = expanded, 0 = not expanded)',
  `weight` int(11) NOT NULL default '0' COMMENT 'Link weight among links in the same menu at the same depth.',
  `depth` smallint(6) NOT NULL default '0' COMMENT 'The depth relative to the top level. A link with plid == 0 will have depth == 1.',
  `customized` smallint(6) NOT NULL default '0' COMMENT 'A flag to indicate that the user has manually created or edited the link (1 = customized, 0 = not customized).',
  `p1` int(10) unsigned NOT NULL default '0' COMMENT 'The first mlid in the materialized path. If N = depth, then pN must equal the mlid. If depth > 1 then p(N-1) must equal the plid. All pX where X > depth must equal zero. The columns p1 .. p9 are also called the parents.',
  `p2` int(10) unsigned NOT NULL default '0' COMMENT 'The second mlid in the materialized path. See p1.',
  `p3` int(10) unsigned NOT NULL default '0' COMMENT 'The third mlid in the materialized path. See p1.',
  `p4` int(10) unsigned NOT NULL default '0' COMMENT 'The fourth mlid in the materialized path. See p1.',
  `p5` int(10) unsigned NOT NULL default '0' COMMENT 'The fifth mlid in the materialized path. See p1.',
  `p6` int(10) unsigned NOT NULL default '0' COMMENT 'The sixth mlid in the materialized path. See p1.',
  `p7` int(10) unsigned NOT NULL default '0' COMMENT 'The seventh mlid in the materialized path. See p1.',
  `p8` int(10) unsigned NOT NULL default '0' COMMENT 'The eighth mlid in the materialized path. See p1.',
  `p9` int(10) unsigned NOT NULL default '0' COMMENT 'The ninth mlid in the materialized path. See p1.',
  `updated` smallint(6) NOT NULL default '0' COMMENT 'Flag that indicates that this link was generated during the update from Drupal 5.',
  PRIMARY KEY  (`mlid`),
  KEY `path_menu` (`link_path`(128),`menu_name`),
  KEY `menu_plid_expand_child` (`menu_name`,`plid`,`expanded`,`has_children`),
  KEY `menu_parents` (`menu_name`,`p1`,`p2`,`p3`,`p4`,`p5`,`p6`,`p7`,`p8`,`p9`),
  KEY `router_path` (`router_path`(128))
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Contains the individual links within a menu.' AUTO_INCREMENT=418 ;

--
-- Dumping data for table `menu_links`
--

INSERT INTO `menu_links` VALUES('management', 1, 0, 'admin', 'admin', 'Administration', 0x613a303a7b7d, 'system', 0, 0, 1, 0, 9, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES('user-menu', 2, 0, 'user', 'user', 'User account', 0x613a313a7b733a353a22616c746572223b623a313b7d, 'system', 0, 0, 0, 0, -10, 1, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES('navigation', 3, 0, 'comment/%', 'comment/%', 'Comment permalink', 0x613a303a7b7d, 'system', 0, 0, 1, 0, 0, 1, 0, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES('navigation', 4, 0, 'filter/tips', 'filter/tips', 'Compose tips', 0x613a303a7b7d, 'system', 1, 0, 0, 0, 0, 1, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES('navigation', 5, 0, 'node/%', 'node/%', '', 0x613a303a7b7d, 'system', 0, 0, 0, 0, 0, 1, 0, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES('navigation', 6, 0, 'node/add', 'node/add', 'Add content', 0x613a303a7b7d, 'system', 0, 0, 1, 0, 0, 1, 0, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES('management', 7, 1, 'admin/appearance', 'admin/appearance', 'Appearance', 0x613a313a7b733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a33333a2253656c65637420616e6420636f6e66696775726520796f7572207468656d65732e223b7d7d, 'system', 0, 0, 0, 0, -6, 2, 0, 1, 7, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES('management', 8, 1, 'admin/config', 'admin/config', 'Configuration', 0x613a313a7b733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a32303a2241646d696e69737465722073657474696e67732e223b7d7d, 'system', 0, 0, 1, 0, 0, 2, 0, 1, 8, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES('management', 9, 1, 'admin/content', 'admin/content', 'Content', 0x613a313a7b733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a33323a2241646d696e697374657220636f6e74656e7420616e6420636f6d6d656e74732e223b7d7d, 'system', 0, 0, 1, 0, -10, 2, 0, 1, 9, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES('user-menu', 10, 2, 'user/register', 'user/register', 'Create new account', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 2, 0, 2, 10, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES('management', 11, 1, 'admin/dashboard', 'admin/dashboard', 'Dashboard', 0x613a313a7b733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a33343a225669657720616e6420637573746f6d697a6520796f75722064617368626f6172642e223b7d7d, 'system', 0, 0, 0, 0, -15, 2, 0, 1, 11, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES('management', 12, 1, 'admin/help', 'admin/help', 'Help', 0x613a313a7b733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a34383a225265666572656e636520666f722075736167652c20636f6e66696775726174696f6e2c20616e64206d6f64756c65732e223b7d7d, 'system', 0, 0, 0, 0, 9, 2, 0, 1, 12, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES('management', 13, 1, 'admin/index', 'admin/index', 'Index', 0x613a303a7b7d, 'system', -1, 0, 0, 0, -18, 2, 0, 1, 13, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES('user-menu', 14, 2, 'user/login', 'user/login', 'Log in', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 2, 0, 2, 14, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES('user-menu', 15, 0, 'user/logout', 'user/logout', 'Log out', 0x613a303a7b7d, 'system', 0, 0, 0, 0, 10, 1, 0, 15, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES('management', 16, 1, 'admin/modules', 'admin/modules', 'Modules', 0x613a313a7b733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a32363a22457874656e6420736974652066756e6374696f6e616c6974792e223b7d7d, 'system', 0, 0, 0, 0, -2, 2, 0, 1, 16, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES('navigation', 17, 0, 'user/%', 'user/%', 'My account', 0x613a303a7b7d, 'system', 0, 0, 1, 0, 0, 1, 0, 17, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES('management', 18, 1, 'admin/people', 'admin/people', 'People', 0x613a313a7b733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a34353a224d616e6167652075736572206163636f756e74732c20726f6c65732c20616e64207065726d697373696f6e732e223b7d7d, 'system', 0, 0, 0, 0, -4, 2, 0, 1, 18, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES('management', 19, 1, 'admin/reports', 'admin/reports', 'Reports', 0x613a313a7b733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a33343a2256696577207265706f7274732c20757064617465732c20616e64206572726f72732e223b7d7d, 'system', 0, 0, 1, 0, 5, 2, 0, 1, 19, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES('user-menu', 20, 2, 'user/password', 'user/password', 'Request new password', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 2, 0, 2, 20, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES('management', 21, 1, 'admin/structure', 'admin/structure', 'Structure', 0x613a313a7b733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a34353a2241646d696e697374657220626c6f636b732c20636f6e74656e742074797065732c206d656e75732c206574632e223b7d7d, 'system', 0, 0, 1, 0, -8, 2, 0, 1, 21, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES('management', 22, 1, 'admin/tasks', 'admin/tasks', 'Tasks', 0x613a303a7b7d, 'system', -1, 0, 0, 0, -20, 2, 0, 1, 22, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES('navigation', 23, 0, 'comment/reply/%', 'comment/reply/%', 'Add new comment', 0x613a303a7b7d, 'system', 0, 0, 0, 0, 0, 1, 0, 23, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES('navigation', 24, 3, 'comment/%/approve', 'comment/%/approve', 'Approve', 0x613a303a7b7d, 'system', 0, 0, 0, 0, 1, 2, 0, 3, 24, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES('navigation', 25, 3, 'comment/%/delete', 'comment/%/delete', 'Delete', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 2, 2, 0, 3, 25, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES('navigation', 26, 3, 'comment/%/edit', 'comment/%/edit', 'Edit', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 2, 0, 3, 26, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES('navigation', 27, 0, 'taxonomy/term/%', 'taxonomy/term/%', 'Taxonomy term', 0x613a303a7b7d, 'system', 0, 0, 0, 0, 0, 1, 0, 27, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES('navigation', 28, 3, 'comment/%/view', 'comment/%/view', 'View comment', 0x613a303a7b7d, 'system', -1, 0, 0, 0, -10, 2, 0, 3, 28, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES('management', 29, 18, 'admin/people/create', 'admin/people/create', 'Add user', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 3, 0, 1, 18, 29, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES('management', 30, 21, 'admin/structure/block', 'admin/structure/block', 'Blocks', 0x613a313a7b733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a37393a22436f6e666967757265207768617420626c6f636b20636f6e74656e74206170706561727320696e20796f75722073697465277320736964656261727320616e64206f7468657220726567696f6e732e223b7d7d, 'system', 0, 0, 1, 0, 0, 3, 0, 1, 21, 30, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES('navigation', 31, 17, 'user/%/cancel', 'user/%/cancel', 'Cancel account', 0x613a303a7b7d, 'system', 0, 0, 1, 0, 0, 2, 0, 17, 31, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES('management', 32, 9, 'admin/content/comment', 'admin/content/comment', 'Comments', 0x613a313a7b733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a35393a224c69737420616e642065646974207369746520636f6d6d656e747320616e642074686520636f6d6d656e7420617070726f76616c2071756575652e223b7d7d, 'system', 0, 0, 0, 0, 0, 3, 0, 1, 9, 32, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES('management', 33, 11, 'admin/dashboard/configure', 'admin/dashboard/configure', 'Configure available dashboard blocks', 0x613a313a7b733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a35333a22436f6e66696775726520776869636820626c6f636b732063616e2062652073686f776e206f6e207468652064617368626f6172642e223b7d7d, 'system', -1, 0, 0, 0, 0, 3, 0, 1, 11, 33, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES('management', 34, 9, 'admin/content/node', 'admin/content/node', 'Content', 0x613a303a7b7d, 'system', -1, 0, 0, 0, -10, 3, 0, 1, 9, 34, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES('management', 35, 8, 'admin/config/content', 'admin/config/content', 'Content authoring', 0x613a313a7b733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a35333a2253657474696e67732072656c6174656420746f20666f726d617474696e6720616e6420617574686f72696e6720636f6e74656e742e223b7d7d, 'system', 0, 0, 1, 0, -15, 3, 0, 1, 8, 35, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES('management', 36, 21, 'admin/structure/types', 'admin/structure/types', 'Content types', 0x613a313a7b733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a39323a224d616e61676520636f6e74656e742074797065732c20696e636c7564696e672064656661756c74207374617475732c2066726f6e7420706167652070726f6d6f74696f6e2c20636f6d6d656e742073657474696e67732c206574632e223b7d7d, 'system', 0, 0, 1, 0, 0, 3, 0, 1, 21, 36, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES('management', 37, 11, 'admin/dashboard/customize', 'admin/dashboard/customize', 'Customize dashboard', 0x613a313a7b733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a32353a22437573746f6d697a6520796f75722064617368626f6172642e223b7d7d, 'system', -1, 0, 0, 0, 0, 3, 0, 1, 11, 37, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES('navigation', 38, 5, 'node/%/delete', 'node/%/delete', 'Delete', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 1, 2, 0, 5, 38, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES('management', 39, 8, 'admin/config/development', 'admin/config/development', 'Development', 0x613a313a7b733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a31383a22446576656c6f706d656e7420746f6f6c732e223b7d7d, 'system', 0, 0, 1, 0, -10, 3, 0, 1, 8, 39, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES('navigation', 40, 17, 'user/%/edit', 'user/%/edit', 'Edit', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 2, 0, 17, 40, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES('navigation', 41, 5, 'node/%/edit', 'node/%/edit', 'Edit', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 2, 0, 5, 41, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES('management', 42, 19, 'admin/reports/fields', 'admin/reports/fields', 'Field list', 0x613a313a7b733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a33393a224f76657276696577206f66206669656c6473206f6e20616c6c20656e746974792074797065732e223b7d7d, 'system', 0, 0, 0, 0, 0, 3, 0, 1, 19, 42, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES('management', 43, 7, 'admin/appearance/list', 'admin/appearance/list', 'List', 0x613a313a7b733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a33313a2253656c65637420616e6420636f6e66696775726520796f7572207468656d65223b7d7d, 'system', -1, 0, 0, 0, -1, 3, 0, 1, 7, 43, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES('management', 44, 16, 'admin/modules/list', 'admin/modules/list', 'List', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 3, 0, 1, 16, 44, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES('management', 45, 18, 'admin/people/people', 'admin/people/people', 'List', 0x613a313a7b733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a35303a2246696e6420616e64206d616e6167652070656f706c6520696e746572616374696e67207769746820796f757220736974652e223b7d7d, 'system', -1, 0, 0, 0, -10, 3, 0, 1, 18, 45, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES('management', 46, 8, 'admin/config/media', 'admin/config/media', 'Media', 0x613a313a7b733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a31323a224d6564696120746f6f6c732e223b7d7d, 'system', 0, 0, 1, 0, -10, 3, 0, 1, 8, 46, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES('management', 47, 21, 'admin/structure/menu', 'admin/structure/menu', 'Menus', 0x613a313a7b733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a38363a22416464206e6577206d656e757320746f20796f757220736974652c2065646974206578697374696e67206d656e75732c20616e642072656e616d6520616e642072656f7267616e697a65206d656e75206c696e6b732e223b7d7d, 'system', 0, 0, 1, 0, 0, 3, 0, 1, 21, 47, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES('management', 48, 8, 'admin/config/people', 'admin/config/people', 'People', 0x613a313a7b733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a32343a22436f6e6669677572652075736572206163636f756e74732e223b7d7d, 'system', 0, 0, 1, 0, -20, 3, 0, 1, 8, 48, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES('management', 49, 18, 'admin/people/permissions', 'admin/people/permissions', 'Permissions', 0x613a313a7b733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a36343a2244657465726d696e652061636365737320746f2066656174757265732062792073656c656374696e67207065726d697373696f6e7320666f7220726f6c65732e223b7d7d, 'system', -1, 0, 0, 0, 0, 3, 0, 1, 18, 49, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES('management', 50, 19, 'admin/reports/dblog', 'admin/reports/dblog', 'Recent log messages', 0x613a313a7b733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a34333a2256696577206576656e74732074686174206861766520726563656e746c79206265656e206c6f676765642e223b7d7d, 'system', 0, 0, 0, 0, -1, 3, 0, 1, 19, 50, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES('management', 51, 8, 'admin/config/regional', 'admin/config/regional', 'Regional and language', 0x613a313a7b733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a34383a22526567696f6e616c2073657474696e67732c206c6f63616c697a6174696f6e20616e64207472616e736c6174696f6e2e223b7d7d, 'system', 0, 0, 1, 0, -5, 3, 0, 1, 8, 51, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES('navigation', 52, 5, 'node/%/revisions', 'node/%/revisions', 'Revisions', 0x613a303a7b7d, 'system', -1, 0, 1, 0, 2, 2, 0, 5, 52, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES('management', 53, 8, 'admin/config/search', 'admin/config/search', 'Search and metadata', 0x613a313a7b733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a33363a224c6f63616c2073697465207365617263682c206d6574616461746120616e642053454f2e223b7d7d, 'system', 0, 0, 1, 0, -10, 3, 0, 1, 8, 53, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES('management', 54, 7, 'admin/appearance/settings', 'admin/appearance/settings', 'Settings', 0x613a313a7b733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a34363a22436f6e6669677572652064656661756c7420616e64207468656d652073706563696669632073657474696e67732e223b7d7d, 'system', -1, 0, 0, 0, 20, 3, 0, 1, 7, 54, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES('management', 55, 19, 'admin/reports/status', 'admin/reports/status', 'Status report', 0x613a313a7b733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a37343a22476574206120737461747573207265706f72742061626f757420796f757220736974652773206f7065726174696f6e20616e6420616e792064657465637465642070726f626c656d732e223b7d7d, 'system', 0, 0, 0, 0, -60, 3, 0, 1, 19, 55, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES('management', 56, 8, 'admin/config/system', 'admin/config/system', 'System', 0x613a313a7b733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a33373a2247656e6572616c2073797374656d2072656c6174656420636f6e66696775726174696f6e2e223b7d7d, 'system', 0, 0, 1, 0, -20, 3, 0, 1, 8, 56, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES('management', 57, 21, 'admin/structure/taxonomy', 'admin/structure/taxonomy', 'Taxonomy', 0x613a313a7b733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a36373a224d616e6167652074616767696e672c2063617465676f72697a6174696f6e2c20616e6420636c617373696669636174696f6e206f6620796f757220636f6e74656e742e223b7d7d, 'system', 0, 0, 1, 0, 0, 3, 0, 1, 21, 57, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES('management', 58, 19, 'admin/reports/access-denied', 'admin/reports/access-denied', 'Top ''access denied'' errors', 0x613a313a7b733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a33353a225669657720276163636573732064656e69656427206572726f7273202834303373292e223b7d7d, 'system', 0, 0, 0, 0, 0, 3, 0, 1, 19, 58, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES('management', 59, 19, 'admin/reports/page-not-found', 'admin/reports/page-not-found', 'Top ''page not found'' errors', 0x613a313a7b733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a33363a2256696577202770616765206e6f7420666f756e6427206572726f7273202834303473292e223b7d7d, 'system', 0, 0, 0, 0, 0, 3, 0, 1, 19, 59, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES('management', 60, 16, 'admin/modules/uninstall', 'admin/modules/uninstall', 'Uninstall', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 20, 3, 0, 1, 16, 60, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES('management', 61, 8, 'admin/config/user-interface', 'admin/config/user-interface', 'User interface', 0x613a313a7b733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a33383a22546f6f6c73207468617420656e68616e636520746865207573657220696e746572666163652e223b7d7d, 'system', 0, 0, 1, 0, -15, 3, 0, 1, 8, 61, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES('navigation', 62, 5, 'node/%/view', 'node/%/view', 'View', 0x613a303a7b7d, 'system', -1, 0, 0, 0, -10, 2, 0, 5, 62, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES('navigation', 63, 17, 'user/%/view', 'user/%/view', 'View', 0x613a303a7b7d, 'system', -1, 0, 0, 0, -10, 2, 0, 17, 63, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES('management', 64, 8, 'admin/config/services', 'admin/config/services', 'Web services', 0x613a313a7b733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a33303a22546f6f6c732072656c6174656420746f207765622073657276696365732e223b7d7d, 'system', 0, 0, 1, 0, 0, 3, 0, 1, 8, 64, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES('management', 65, 8, 'admin/config/workflow', 'admin/config/workflow', 'Workflow', 0x613a313a7b733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a34333a22436f6e74656e7420776f726b666c6f772c20656469746f7269616c20776f726b666c6f7720746f6f6c732e223b7d7d, 'system', 0, 0, 1, 0, 5, 3, 0, 1, 8, 65, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES('management', 66, 12, 'admin/help/block', 'admin/help/block', 'block', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 3, 0, 1, 12, 66, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES('management', 67, 12, 'admin/help/color', 'admin/help/color', 'color', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 3, 0, 1, 12, 67, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES('management', 68, 12, 'admin/help/comment', 'admin/help/comment', 'comment', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 3, 0, 1, 12, 68, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES('management', 69, 12, 'admin/help/contextual', 'admin/help/contextual', 'contextual', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 3, 0, 1, 12, 69, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES('management', 70, 12, 'admin/help/dashboard', 'admin/help/dashboard', 'dashboard', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 3, 0, 1, 12, 70, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES('management', 71, 12, 'admin/help/dblog', 'admin/help/dblog', 'dblog', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 3, 0, 1, 12, 71, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES('management', 72, 12, 'admin/help/field', 'admin/help/field', 'field', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 3, 0, 1, 12, 72, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES('management', 73, 12, 'admin/help/field_sql_storage', 'admin/help/field_sql_storage', 'field_sql_storage', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 3, 0, 1, 12, 73, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES('management', 74, 12, 'admin/help/field_ui', 'admin/help/field_ui', 'field_ui', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 3, 0, 1, 12, 74, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES('management', 75, 12, 'admin/help/file', 'admin/help/file', 'file', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 3, 0, 1, 12, 75, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES('management', 76, 12, 'admin/help/filter', 'admin/help/filter', 'filter', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 3, 0, 1, 12, 76, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES('management', 77, 12, 'admin/help/help', 'admin/help/help', 'help', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 3, 0, 1, 12, 77, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES('management', 78, 12, 'admin/help/image', 'admin/help/image', 'image', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 3, 0, 1, 12, 78, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES('management', 79, 12, 'admin/help/list', 'admin/help/list', 'list', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 3, 0, 1, 12, 79, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES('management', 80, 12, 'admin/help/menu', 'admin/help/menu', 'menu', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 3, 0, 1, 12, 80, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES('management', 81, 12, 'admin/help/node', 'admin/help/node', 'node', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 3, 0, 1, 12, 81, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES('management', 82, 12, 'admin/help/options', 'admin/help/options', 'options', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 3, 0, 1, 12, 82, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES('management', 83, 12, 'admin/help/system', 'admin/help/system', 'system', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 3, 0, 1, 12, 83, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES('management', 84, 12, 'admin/help/taxonomy', 'admin/help/taxonomy', 'taxonomy', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 3, 0, 1, 12, 84, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES('management', 85, 12, 'admin/help/text', 'admin/help/text', 'text', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 3, 0, 1, 12, 85, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES('management', 86, 12, 'admin/help/user', 'admin/help/user', 'user', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 3, 0, 1, 12, 86, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES('navigation', 87, 27, 'taxonomy/term/%/edit', 'taxonomy/term/%/edit', 'Edit', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 10, 2, 0, 27, 87, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES('navigation', 88, 27, 'taxonomy/term/%/view', 'taxonomy/term/%/view', 'View', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 2, 0, 27, 88, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES('management', 89, 57, 'admin/structure/taxonomy/%', 'admin/structure/taxonomy/%', '', 0x613a303a7b7d, 'system', 0, 0, 0, 0, 0, 4, 0, 1, 21, 57, 89, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES('management', 90, 48, 'admin/config/people/accounts', 'admin/config/people/accounts', 'Account settings', 0x613a313a7b733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a3130393a22436f6e6669677572652064656661756c74206265686176696f72206f662075736572732c20696e636c7564696e6720726567697374726174696f6e20726571756972656d656e74732c20652d6d61696c732c206669656c64732c20616e6420757365722070696374757265732e223b7d7d, 'system', 0, 0, 0, 0, -10, 4, 0, 1, 8, 48, 90, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES('management', 91, 56, 'admin/config/system/actions', 'admin/config/system/actions', 'Actions', 0x613a313a7b733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a34313a224d616e6167652074686520616374696f6e7320646566696e656420666f7220796f757220736974652e223b7d7d, 'system', 0, 0, 1, 0, 0, 4, 0, 1, 8, 56, 91, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES('management', 92, 30, 'admin/structure/block/add', 'admin/structure/block/add', 'Add block', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 4, 0, 1, 21, 30, 92, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES('management', 93, 36, 'admin/structure/types/add', 'admin/structure/types/add', 'Add content type', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 4, 0, 1, 21, 36, 93, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES('management', 94, 47, 'admin/structure/menu/add', 'admin/structure/menu/add', 'Add menu', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 4, 0, 1, 21, 47, 94, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES('management', 95, 57, 'admin/structure/taxonomy/add', 'admin/structure/taxonomy/add', 'Add vocabulary', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 4, 0, 1, 21, 57, 95, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES('management', 96, 54, 'admin/appearance/settings/bartik', 'admin/appearance/settings/bartik', 'Bartik', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 4, 0, 1, 7, 54, 96, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES('management', 97, 53, 'admin/config/search/clean-urls', 'admin/config/search/clean-urls', 'Clean URLs', 0x613a313a7b733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a34333a22456e61626c65206f722064697361626c6520636c65616e2055524c7320666f7220796f757220736974652e223b7d7d, 'system', 0, 0, 0, 0, 5, 4, 0, 1, 8, 53, 97, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES('management', 98, 56, 'admin/config/system/cron', 'admin/config/system/cron', 'Cron', 0x613a313a7b733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a34303a224d616e616765206175746f6d617469632073697465206d61696e74656e616e6365207461736b732e223b7d7d, 'system', 0, 0, 0, 0, 20, 4, 0, 1, 8, 56, 98, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES('management', 99, 51, 'admin/config/regional/date-time', 'admin/config/regional/date-time', 'Date and time', 0x613a313a7b733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a34343a22436f6e66696775726520646973706c617920666f726d61747320666f72206461746520616e642074696d652e223b7d7d, 'system', 0, 0, 0, 0, -15, 4, 0, 1, 8, 51, 99, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES('management', 100, 19, 'admin/reports/event/%', 'admin/reports/event/%', 'Details', 0x613a303a7b7d, 'system', 0, 0, 0, 0, 0, 3, 0, 1, 19, 100, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES('management', 101, 46, 'admin/config/media/file-system', 'admin/config/media/file-system', 'File system', 0x613a313a7b733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a36383a2254656c6c2044727570616c20776865726520746f2073746f72652075706c6f616465642066696c657320616e6420686f772074686579206172652061636365737365642e223b7d7d, 'system', 0, 0, 0, 0, -10, 4, 0, 1, 8, 46, 101, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES('management', 102, 54, 'admin/appearance/settings/garland', 'admin/appearance/settings/garland', 'Garland', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 4, 0, 1, 7, 54, 102, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES('management', 103, 54, 'admin/appearance/settings/global', 'admin/appearance/settings/global', 'Global settings', 0x613a303a7b7d, 'system', -1, 0, 0, 0, -1, 4, 0, 1, 7, 54, 103, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES('management', 104, 48, 'admin/config/people/ip-blocking', 'admin/config/people/ip-blocking', 'IP address blocking', 0x613a313a7b733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a32383a224d616e61676520626c6f636b6564204950206164647265737365732e223b7d7d, 'system', 0, 0, 1, 0, 10, 4, 0, 1, 8, 48, 104, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES('management', 105, 46, 'admin/config/media/image-styles', 'admin/config/media/image-styles', 'Image styles', 0x613a313a7b733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a37383a22436f6e666967757265207374796c657320746861742063616e206265207573656420666f7220726573697a696e67206f722061646a757374696e6720696d61676573206f6e20646973706c61792e223b7d7d, 'system', 0, 0, 1, 0, 0, 4, 0, 1, 8, 46, 105, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES('management', 106, 46, 'admin/config/media/image-toolkit', 'admin/config/media/image-toolkit', 'Image toolkit', 0x613a313a7b733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a37343a2243686f6f736520776869636820696d61676520746f6f6c6b697420746f2075736520696620796f75206861766520696e7374616c6c6564206f7074696f6e616c20746f6f6c6b6974732e223b7d7d, 'system', 0, 0, 0, 0, 20, 4, 0, 1, 8, 46, 106, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES('management', 107, 44, 'admin/modules/list/confirm', 'admin/modules/list/confirm', 'List', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 4, 0, 1, 16, 44, 107, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES('management', 108, 36, 'admin/structure/types/list', 'admin/structure/types/list', 'List', 0x613a303a7b7d, 'system', -1, 0, 0, 0, -10, 4, 0, 1, 21, 36, 108, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES('management', 109, 57, 'admin/structure/taxonomy/list', 'admin/structure/taxonomy/list', 'List', 0x613a303a7b7d, 'system', -1, 0, 0, 0, -10, 4, 0, 1, 21, 57, 109, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES('management', 110, 47, 'admin/structure/menu/list', 'admin/structure/menu/list', 'List menus', 0x613a303a7b7d, 'system', -1, 0, 0, 0, -10, 4, 0, 1, 21, 47, 110, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES('management', 111, 39, 'admin/config/development/logging', 'admin/config/development/logging', 'Logging and errors', 0x613a313a7b733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a3135343a2253657474696e677320666f72206c6f6767696e6720616e6420616c65727473206d6f64756c65732e20566172696f7573206d6f64756c65732063616e20726f7574652044727570616c27732073797374656d206576656e747320746f20646966666572656e742064657374696e6174696f6e732c2073756368206173207379736c6f672c2064617461626173652c20656d61696c2c206574632e223b7d7d, 'system', 0, 0, 0, 0, -15, 4, 0, 1, 8, 39, 111, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES('management', 112, 39, 'admin/config/development/maintenance', 'admin/config/development/maintenance', 'Maintenance mode', 0x613a313a7b733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a36323a2254616b65207468652073697465206f66666c696e6520666f72206d61696e74656e616e6365206f72206272696e67206974206261636b206f6e6c696e652e223b7d7d, 'system', 0, 0, 0, 0, -10, 4, 0, 1, 8, 39, 112, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES('management', 113, 39, 'admin/config/development/performance', 'admin/config/development/performance', 'Performance', 0x613a313a7b733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a3130313a22456e61626c65206f722064697361626c6520706167652063616368696e6720666f7220616e6f6e796d6f757320757365727320616e64207365742043535320616e64204a532062616e647769647468206f7074696d697a6174696f6e206f7074696f6e732e223b7d7d, 'system', 0, 0, 0, 0, -20, 4, 0, 1, 8, 39, 113, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES('management', 114, 49, 'admin/people/permissions/list', 'admin/people/permissions/list', 'Permissions', 0x613a313a7b733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a36343a2244657465726d696e652061636365737320746f2066656174757265732062792073656c656374696e67207065726d697373696f6e7320666f7220726f6c65732e223b7d7d, 'system', -1, 0, 0, 0, -8, 4, 0, 1, 18, 49, 114, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES('management', 115, 32, 'admin/content/comment/new', 'admin/content/comment/new', 'Published comments', 0x613a303a7b7d, 'system', -1, 0, 0, 0, -10, 4, 0, 1, 9, 32, 115, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES('management', 116, 64, 'admin/config/services/rss-publishing', 'admin/config/services/rss-publishing', 'RSS publishing', 0x613a313a7b733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a3131343a22436f6e666967757265207468652073697465206465736372697074696f6e2c20746865206e756d626572206f66206974656d7320706572206665656420616e6420776865746865722066656564732073686f756c64206265207469746c65732f746561736572732f66756c6c2d746578742e223b7d7d, 'system', 0, 0, 0, 0, 0, 4, 0, 1, 8, 64, 116, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES('management', 117, 51, 'admin/config/regional/settings', 'admin/config/regional/settings', 'Regional settings', 0x613a313a7b733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a35343a2253657474696e677320666f7220746865207369746527732064656661756c742074696d65207a6f6e6520616e6420636f756e7472792e223b7d7d, 'system', 0, 0, 0, 0, -20, 4, 0, 1, 8, 51, 117, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES('management', 118, 49, 'admin/people/permissions/roles', 'admin/people/permissions/roles', 'Roles', 0x613a313a7b733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a33303a224c6973742c20656469742c206f7220616464207573657220726f6c65732e223b7d7d, 'system', -1, 0, 1, 0, -5, 4, 0, 1, 18, 49, 118, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES('management', 119, 47, 'admin/structure/menu/settings', 'admin/structure/menu/settings', 'Settings', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 5, 4, 0, 1, 21, 47, 119, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES('management', 120, 54, 'admin/appearance/settings/seven', 'admin/appearance/settings/seven', 'Seven', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 4, 0, 1, 7, 54, 120, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES('management', 121, 56, 'admin/config/system/site-information', 'admin/config/system/site-information', 'Site information', 0x613a313a7b733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a3130343a224368616e67652073697465206e616d652c20652d6d61696c20616464726573732c20736c6f67616e2c2064656661756c742066726f6e7420706167652c20616e64206e756d626572206f6620706f7374732070657220706167652c206572726f722070616765732e223b7d7d, 'system', 0, 0, 0, 0, -20, 4, 0, 1, 8, 56, 121, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES('management', 122, 54, 'admin/appearance/settings/stark', 'admin/appearance/settings/stark', 'Stark', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 4, 0, 1, 7, 54, 122, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES('management', 123, 35, 'admin/config/content/formats', 'admin/config/content/formats', 'Text formats', 0x613a313a7b733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a3132373a22436f6e66696775726520686f7720636f6e74656e7420696e7075742062792075736572732069732066696c74657265642c20696e636c7564696e6720616c6c6f7765642048544d4c20746167732e20416c736f20616c6c6f777320656e61626c696e67206f66206d6f64756c652d70726f76696465642066696c746572732e223b7d7d, 'system', 0, 0, 1, 0, 0, 4, 0, 1, 8, 35, 123, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES('management', 124, 32, 'admin/content/comment/approval', 'admin/content/comment/approval', 'Unapproved comments', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 4, 0, 1, 9, 32, 124, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES('management', 125, 60, 'admin/modules/uninstall/confirm', 'admin/modules/uninstall/confirm', 'Uninstall', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 4, 0, 1, 16, 60, 125, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES('navigation', 126, 40, 'user/%/edit/account', 'user/%/edit/account', 'Account', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 3, 0, 17, 40, 126, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES('management', 127, 123, 'admin/config/content/formats/%', 'admin/config/content/formats/%', '', 0x613a303a7b7d, 'system', 0, 0, 1, 0, 0, 5, 0, 1, 8, 35, 123, 127, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES('management', 128, 105, 'admin/config/media/image-styles/add', 'admin/config/media/image-styles/add', 'Add style', 0x613a313a7b733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a32323a224164642061206e657720696d616765207374796c652e223b7d7d, 'system', -1, 0, 0, 0, 2, 5, 0, 1, 8, 46, 105, 128, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES('management', 129, 89, 'admin/structure/taxonomy/%/add', 'admin/structure/taxonomy/%/add', 'Add term', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 5, 0, 1, 21, 57, 89, 129, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES('management', 130, 123, 'admin/config/content/formats/add', 'admin/config/content/formats/add', 'Add text format', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 1, 5, 0, 1, 8, 35, 123, 130, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES('management', 131, 30, 'admin/structure/block/list/bartik', 'admin/structure/block/list/bartik', 'Bartik', 0x613a303a7b7d, 'system', -1, 0, 0, 0, -10, 4, 0, 1, 21, 30, 131, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES('management', 132, 91, 'admin/config/system/actions/configure', 'admin/config/system/actions/configure', 'Configure an advanced action', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 5, 0, 1, 8, 56, 91, 132, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES('management', 133, 47, 'admin/structure/menu/manage/%', 'admin/structure/menu/manage/%', 'Customize menu', 0x613a303a7b7d, 'system', 0, 0, 1, 0, 0, 4, 0, 1, 21, 47, 133, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES('management', 134, 89, 'admin/structure/taxonomy/%/edit', 'admin/structure/taxonomy/%/edit', 'Edit', 0x613a303a7b7d, 'system', -1, 0, 0, 0, -10, 5, 0, 1, 21, 57, 89, 134, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES('management', 135, 36, 'admin/structure/types/manage/%', 'admin/structure/types/manage/%', 'Edit content type', 0x613a303a7b7d, 'system', 0, 0, 1, 0, 0, 4, 0, 1, 21, 36, 135, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES('management', 136, 99, 'admin/config/regional/date-time/formats', 'admin/config/regional/date-time/formats', 'Formats', 0x613a313a7b733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a35313a22436f6e66696775726520646973706c617920666f726d617420737472696e677320666f72206461746520616e642074696d652e223b7d7d, 'system', -1, 0, 1, 0, -9, 5, 0, 1, 8, 51, 99, 136, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES('management', 137, 30, 'admin/structure/block/list/garland', 'admin/structure/block/list/garland', 'Garland', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 4, 0, 1, 21, 30, 137, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES('management', 138, 123, 'admin/config/content/formats/list', 'admin/config/content/formats/list', 'List', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 5, 0, 1, 8, 35, 123, 138, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES('management', 139, 89, 'admin/structure/taxonomy/%/list', 'admin/structure/taxonomy/%/list', 'List', 0x613a303a7b7d, 'system', -1, 0, 0, 0, -20, 5, 0, 1, 21, 57, 89, 139, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES('management', 140, 105, 'admin/config/media/image-styles/list', 'admin/config/media/image-styles/list', 'List', 0x613a313a7b733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a34323a224c697374207468652063757272656e7420696d616765207374796c6573206f6e2074686520736974652e223b7d7d, 'system', -1, 0, 0, 0, 1, 5, 0, 1, 8, 46, 105, 140, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES('management', 141, 91, 'admin/config/system/actions/manage', 'admin/config/system/actions/manage', 'Manage actions', 0x613a313a7b733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a34313a224d616e6167652074686520616374696f6e7320646566696e656420666f7220796f757220736974652e223b7d7d, 'system', -1, 0, 0, 0, -2, 5, 0, 1, 8, 56, 91, 141, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES('management', 142, 90, 'admin/config/people/accounts/settings', 'admin/config/people/accounts/settings', 'Settings', 0x613a303a7b7d, 'system', -1, 0, 0, 0, -10, 5, 0, 1, 8, 48, 90, 142, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES('management', 143, 30, 'admin/structure/block/list/seven', 'admin/structure/block/list/seven', 'Seven', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 4, 0, 1, 21, 30, 143, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES('management', 144, 30, 'admin/structure/block/list/stark', 'admin/structure/block/list/stark', 'Stark', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 4, 0, 1, 21, 30, 144, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES('management', 145, 99, 'admin/config/regional/date-time/types', 'admin/config/regional/date-time/types', 'Types', 0x613a313a7b733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a34343a22436f6e66696775726520646973706c617920666f726d61747320666f72206461746520616e642074696d652e223b7d7d, 'system', -1, 0, 1, 0, -10, 5, 0, 1, 8, 51, 99, 145, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES('navigation', 146, 52, 'node/%/revisions/%/delete', 'node/%/revisions/%/delete', 'Delete earlier revision', 0x613a303a7b7d, 'system', 0, 0, 0, 0, 0, 3, 0, 5, 52, 146, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES('navigation', 147, 52, 'node/%/revisions/%/revert', 'node/%/revisions/%/revert', 'Revert to earlier revision', 0x613a303a7b7d, 'system', 0, 0, 0, 0, 0, 3, 0, 5, 52, 147, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES('navigation', 148, 52, 'node/%/revisions/%/view', 'node/%/revisions/%/view', 'Revisions', 0x613a303a7b7d, 'system', 0, 0, 0, 0, 0, 3, 0, 5, 52, 148, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES('management', 149, 137, 'admin/structure/block/list/garland/add', 'admin/structure/block/list/garland/add', 'Add block', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 5, 0, 1, 21, 30, 137, 149, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES('management', 150, 143, 'admin/structure/block/list/seven/add', 'admin/structure/block/list/seven/add', 'Add block', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 5, 0, 1, 21, 30, 143, 150, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES('management', 151, 144, 'admin/structure/block/list/stark/add', 'admin/structure/block/list/stark/add', 'Add block', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 5, 0, 1, 21, 30, 144, 151, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES('management', 152, 145, 'admin/config/regional/date-time/types/add', 'admin/config/regional/date-time/types/add', 'Add date type', 0x613a313a7b733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a31383a22416464206e6577206461746520747970652e223b7d7d, 'system', -1, 0, 0, 0, -10, 6, 0, 1, 8, 51, 99, 145, 152, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES('management', 153, 136, 'admin/config/regional/date-time/formats/add', 'admin/config/regional/date-time/formats/add', 'Add format', 0x613a313a7b733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a34333a22416c6c6f7720757365727320746f20616464206164646974696f6e616c206461746520666f726d6174732e223b7d7d, 'system', -1, 0, 0, 0, -10, 6, 0, 1, 8, 51, 99, 136, 153, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES('management', 154, 133, 'admin/structure/menu/manage/%/add', 'admin/structure/menu/manage/%/add', 'Add link', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 5, 0, 1, 21, 47, 133, 154, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES('management', 155, 30, 'admin/structure/block/manage/%/%', 'admin/structure/block/manage/%/%', 'Configure block', 0x613a303a7b7d, 'system', 0, 0, 0, 0, 0, 4, 0, 1, 21, 30, 155, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES('navigation', 156, 31, 'user/%/cancel/confirm/%/%', 'user/%/cancel/confirm/%/%', 'Confirm account cancellation', 0x613a303a7b7d, 'system', 0, 0, 0, 0, 0, 3, 0, 17, 31, 156, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES('management', 157, 135, 'admin/structure/types/manage/%/delete', 'admin/structure/types/manage/%/delete', 'Delete', 0x613a303a7b7d, 'system', 0, 0, 0, 0, 0, 5, 0, 1, 21, 36, 135, 157, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES('management', 158, 104, 'admin/config/people/ip-blocking/delete/%', 'admin/config/people/ip-blocking/delete/%', 'Delete IP address', 0x613a303a7b7d, 'system', 0, 0, 0, 0, 0, 5, 0, 1, 8, 48, 104, 158, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES('management', 159, 91, 'admin/config/system/actions/delete/%', 'admin/config/system/actions/delete/%', 'Delete action', 0x613a313a7b733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a31373a2244656c65746520616e20616374696f6e2e223b7d7d, 'system', 0, 0, 0, 0, 0, 5, 0, 1, 8, 56, 91, 159, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES('management', 160, 133, 'admin/structure/menu/manage/%/delete', 'admin/structure/menu/manage/%/delete', 'Delete menu', 0x613a303a7b7d, 'system', 0, 0, 0, 0, 0, 5, 0, 1, 21, 47, 133, 160, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES('management', 161, 47, 'admin/structure/menu/item/%/delete', 'admin/structure/menu/item/%/delete', 'Delete menu link', 0x613a303a7b7d, 'system', 0, 0, 0, 0, 0, 4, 0, 1, 21, 47, 161, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES('management', 162, 118, 'admin/people/permissions/roles/delete/%', 'admin/people/permissions/roles/delete/%', 'Delete role', 0x613a303a7b7d, 'system', 0, 0, 0, 0, 0, 5, 0, 1, 18, 49, 118, 162, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES('management', 163, 127, 'admin/config/content/formats/%/disable', 'admin/config/content/formats/%/disable', 'Disable text format', 0x613a303a7b7d, 'system', 0, 0, 0, 0, 0, 6, 0, 1, 8, 35, 123, 127, 163, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES('management', 164, 135, 'admin/structure/types/manage/%/edit', 'admin/structure/types/manage/%/edit', 'Edit', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 5, 0, 1, 21, 36, 135, 164, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES('management', 165, 133, 'admin/structure/menu/manage/%/edit', 'admin/structure/menu/manage/%/edit', 'Edit menu', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 5, 0, 1, 21, 47, 133, 165, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES('management', 166, 47, 'admin/structure/menu/item/%/edit', 'admin/structure/menu/item/%/edit', 'Edit menu link', 0x613a303a7b7d, 'system', 0, 0, 0, 0, 0, 4, 0, 1, 21, 47, 166, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES('management', 167, 118, 'admin/people/permissions/roles/edit/%', 'admin/people/permissions/roles/edit/%', 'Edit role', 0x613a303a7b7d, 'system', 0, 0, 0, 0, 0, 5, 0, 1, 18, 49, 118, 167, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES('management', 168, 105, 'admin/config/media/image-styles/edit/%', 'admin/config/media/image-styles/edit/%', 'Edit style', 0x613a313a7b733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a32353a22436f6e66696775726520616e20696d616765207374796c652e223b7d7d, 'system', 0, 0, 1, 0, 0, 5, 0, 1, 8, 46, 105, 168, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES('management', 169, 133, 'admin/structure/menu/manage/%/list', 'admin/structure/menu/manage/%/list', 'List links', 0x613a303a7b7d, 'system', -1, 0, 0, 0, -10, 5, 0, 1, 21, 47, 133, 169, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES('management', 170, 47, 'admin/structure/menu/item/%/reset', 'admin/structure/menu/item/%/reset', 'Reset menu link', 0x613a303a7b7d, 'system', 0, 0, 0, 0, 0, 4, 0, 1, 21, 47, 170, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES('management', 171, 105, 'admin/config/media/image-styles/delete/%', 'admin/config/media/image-styles/delete/%', 'Delete style', 0x613a313a7b733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a32323a2244656c65746520616e20696d616765207374796c652e223b7d7d, 'system', 0, 0, 0, 0, 0, 5, 0, 1, 8, 46, 105, 171, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES('management', 172, 105, 'admin/config/media/image-styles/revert/%', 'admin/config/media/image-styles/revert/%', 'Revert style', 0x613a313a7b733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a32323a2252657665727420616e20696d616765207374796c652e223b7d7d, 'system', 0, 0, 0, 0, 0, 5, 0, 1, 8, 46, 105, 172, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES('management', 173, 135, 'admin/structure/types/manage/%/comment/display', 'admin/structure/types/manage/%/comment/display', 'Comment display', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 4, 5, 0, 1, 21, 36, 135, 173, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES('management', 174, 135, 'admin/structure/types/manage/%/comment/fields', 'admin/structure/types/manage/%/comment/fields', 'Comment fields', 0x613a303a7b7d, 'system', -1, 0, 1, 0, 3, 5, 0, 1, 21, 36, 135, 174, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES('management', 175, 155, 'admin/structure/block/manage/%/%/configure', 'admin/structure/block/manage/%/%/configure', 'Configure block', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 5, 0, 1, 21, 30, 155, 175, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES('management', 176, 155, 'admin/structure/block/manage/%/%/delete', 'admin/structure/block/manage/%/%/delete', 'Delete block', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 5, 0, 1, 21, 30, 155, 176, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES('management', 177, 136, 'admin/config/regional/date-time/formats/%/delete', 'admin/config/regional/date-time/formats/%/delete', 'Delete date format', 0x613a313a7b733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a34373a22416c6c6f7720757365727320746f2064656c657465206120636f6e66696775726564206461746520666f726d61742e223b7d7d, 'system', 0, 0, 0, 0, 0, 6, 0, 1, 8, 51, 99, 136, 177, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES('management', 178, 145, 'admin/config/regional/date-time/types/%/delete', 'admin/config/regional/date-time/types/%/delete', 'Delete date type', 0x613a313a7b733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a34353a22416c6c6f7720757365727320746f2064656c657465206120636f6e66696775726564206461746520747970652e223b7d7d, 'system', 0, 0, 0, 0, 0, 6, 0, 1, 8, 51, 99, 145, 178, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES('management', 179, 136, 'admin/config/regional/date-time/formats/%/edit', 'admin/config/regional/date-time/formats/%/edit', 'Edit date format', 0x613a313a7b733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a34353a22416c6c6f7720757365727320746f2065646974206120636f6e66696775726564206461746520666f726d61742e223b7d7d, 'system', 0, 0, 0, 0, 0, 6, 0, 1, 8, 51, 99, 136, 179, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES('management', 180, 168, 'admin/config/media/image-styles/edit/%/add/%', 'admin/config/media/image-styles/edit/%/add/%', 'Add image effect', 0x613a313a7b733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a32383a224164642061206e65772065666665637420746f2061207374796c652e223b7d7d, 'system', 0, 0, 0, 0, 0, 6, 0, 1, 8, 46, 105, 168, 180, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES('management', 181, 168, 'admin/config/media/image-styles/edit/%/effects/%', 'admin/config/media/image-styles/edit/%/effects/%', 'Edit image effect', 0x613a313a7b733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a33393a224564697420616e206578697374696e67206566666563742077697468696e2061207374796c652e223b7d7d, 'system', 0, 0, 1, 0, 0, 6, 0, 1, 8, 46, 105, 168, 181, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES('management', 182, 181, 'admin/config/media/image-styles/edit/%/effects/%/delete', 'admin/config/media/image-styles/edit/%/effects/%/delete', 'Delete image effect', 0x613a313a7b733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a33393a2244656c65746520616e206578697374696e67206566666563742066726f6d2061207374796c652e223b7d7d, 'system', 0, 0, 0, 0, 0, 7, 0, 1, 8, 46, 105, 168, 181, 182, 0, 0, 0);
INSERT INTO `menu_links` VALUES('management', 183, 47, 'admin/structure/menu/manage/main-menu', 'admin/structure/menu/manage/%', 'Main menu', 0x613a303a7b7d, 'menu', 0, 0, 0, 0, 0, 4, 0, 1, 21, 47, 183, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES('management', 184, 47, 'admin/structure/menu/manage/management', 'admin/structure/menu/manage/%', 'Management', 0x613a303a7b7d, 'menu', 0, 0, 0, 0, 0, 4, 0, 1, 21, 47, 184, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES('management', 185, 47, 'admin/structure/menu/manage/navigation', 'admin/structure/menu/manage/%', 'Navigation', 0x613a303a7b7d, 'menu', 0, 0, 0, 0, 0, 4, 0, 1, 21, 47, 185, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES('management', 186, 47, 'admin/structure/menu/manage/user-menu', 'admin/structure/menu/manage/%', 'User menu', 0x613a303a7b7d, 'menu', 0, 0, 0, 0, 0, 4, 0, 1, 21, 47, 186, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES('navigation', 187, 0, 'search', 'search', 'Search', 0x613a303a7b7d, 'system', 1, 0, 0, 0, 0, 1, 0, 187, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES('navigation', 188, 187, 'search/node', 'search/node', 'Content', 0x613a303a7b7d, 'system', -1, 0, 0, 0, -10, 2, 0, 187, 188, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES('navigation', 189, 187, 'search/user', 'search/user', 'Users', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 2, 0, 187, 189, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES('navigation', 190, 188, 'search/node/%', 'search/node/%', 'Content', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 3, 0, 187, 188, 190, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES('navigation', 191, 17, 'user/%/shortcuts', 'user/%/shortcuts', 'Shortcuts', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 2, 0, 17, 191, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES('management', 192, 19, 'admin/reports/search', 'admin/reports/search', 'Top search phrases', 0x613a313a7b733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a33333a2256696577206d6f737420706f70756c61722073656172636820706872617365732e223b7d7d, 'system', 0, 0, 0, 0, 0, 3, 0, 1, 19, 192, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES('navigation', 193, 189, 'search/user/%', 'search/user/%', 'Users', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 3, 0, 187, 189, 193, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES('management', 194, 12, 'admin/help/number', 'admin/help/number', 'number', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 3, 0, 1, 12, 194, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES('management', 195, 12, 'admin/help/overlay', 'admin/help/overlay', 'overlay', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 3, 0, 1, 12, 195, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES('management', 196, 12, 'admin/help/path', 'admin/help/path', 'path', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 3, 0, 1, 12, 196, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES('management', 197, 12, 'admin/help/rdf', 'admin/help/rdf', 'rdf', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 3, 0, 1, 12, 197, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES('management', 198, 12, 'admin/help/search', 'admin/help/search', 'search', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 3, 0, 1, 12, 198, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES('management', 199, 12, 'admin/help/shortcut', 'admin/help/shortcut', 'shortcut', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 3, 0, 1, 12, 199, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES('management', 200, 53, 'admin/config/search/settings', 'admin/config/search/settings', 'Search settings', 0x613a313a7b733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a36373a22436f6e6669677572652072656c6576616e63652073657474696e677320666f722073656172636820616e64206f7468657220696e646578696e67206f7074696f6e732e223b7d7d, 'system', 0, 0, 0, 0, -10, 4, 0, 1, 8, 53, 200, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES('management', 201, 61, 'admin/config/user-interface/shortcut', 'admin/config/user-interface/shortcut', 'Shortcuts', 0x613a313a7b733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a32393a2241646420616e64206d6f646966792073686f727463757420736574732e223b7d7d, 'system', 0, 0, 1, 0, 0, 4, 0, 1, 8, 61, 201, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES('management', 202, 53, 'admin/config/search/path', 'admin/config/search/path', 'URL aliases', 0x613a313a7b733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a34363a224368616e676520796f7572207369746527732055524c20706174687320627920616c696173696e67207468656d2e223b7d7d, 'system', 0, 0, 1, 0, -5, 4, 0, 1, 8, 53, 202, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES('management', 203, 202, 'admin/config/search/path/add', 'admin/config/search/path/add', 'Add alias', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 5, 0, 1, 8, 53, 202, 203, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES('management', 204, 201, 'admin/config/user-interface/shortcut/add-set', 'admin/config/user-interface/shortcut/add-set', 'Add shortcut set', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 5, 0, 1, 8, 61, 201, 204, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES('management', 205, 200, 'admin/config/search/settings/reindex', 'admin/config/search/settings/reindex', 'Clear index', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 5, 0, 1, 8, 53, 200, 205, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES('management', 206, 201, 'admin/config/user-interface/shortcut/%', 'admin/config/user-interface/shortcut/%', 'Edit shortcuts', 0x613a303a7b7d, 'system', 0, 0, 1, 0, 0, 5, 0, 1, 8, 61, 201, 206, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES('management', 207, 202, 'admin/config/search/path/list', 'admin/config/search/path/list', 'List', 0x613a303a7b7d, 'system', -1, 0, 0, 0, -10, 5, 0, 1, 8, 53, 202, 207, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES('management', 208, 206, 'admin/config/user-interface/shortcut/%/add-link', 'admin/config/user-interface/shortcut/%/add-link', 'Add shortcut', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 6, 0, 1, 8, 61, 201, 206, 208, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES('management', 209, 202, 'admin/config/search/path/delete/%', 'admin/config/search/path/delete/%', 'Delete alias', 0x613a303a7b7d, 'system', 0, 0, 0, 0, 0, 5, 0, 1, 8, 53, 202, 209, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES('management', 210, 206, 'admin/config/user-interface/shortcut/%/delete', 'admin/config/user-interface/shortcut/%/delete', 'Delete shortcut set', 0x613a303a7b7d, 'system', 0, 0, 0, 0, 0, 6, 0, 1, 8, 61, 201, 206, 210, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES('management', 211, 202, 'admin/config/search/path/edit/%', 'admin/config/search/path/edit/%', 'Edit alias', 0x613a303a7b7d, 'system', 0, 0, 0, 0, 0, 5, 0, 1, 8, 53, 202, 211, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES('management', 212, 206, 'admin/config/user-interface/shortcut/%/edit', 'admin/config/user-interface/shortcut/%/edit', 'Edit set name', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 10, 6, 0, 1, 8, 61, 201, 206, 212, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES('management', 213, 201, 'admin/config/user-interface/shortcut/link/%', 'admin/config/user-interface/shortcut/link/%', 'Edit shortcut', 0x613a303a7b7d, 'system', 0, 0, 1, 0, 0, 5, 0, 1, 8, 61, 201, 213, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES('management', 214, 206, 'admin/config/user-interface/shortcut/%/links', 'admin/config/user-interface/shortcut/%/links', 'List links', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 6, 0, 1, 8, 61, 201, 206, 214, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES('management', 215, 213, 'admin/config/user-interface/shortcut/link/%/delete', 'admin/config/user-interface/shortcut/link/%/delete', 'Delete shortcut', 0x613a303a7b7d, 'system', 0, 0, 0, 0, 0, 6, 0, 1, 8, 61, 201, 213, 215, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES('shortcut-set-1', 216, 0, 'node/add', 'node/add', 'Add content', 0x613a303a7b7d, 'menu', 0, 0, 0, 0, -20, 1, 0, 216, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES('shortcut-set-1', 217, 0, 'admin/content', 'admin/content', 'Find content', 0x613a303a7b7d, 'menu', 0, 0, 0, 0, -19, 1, 0, 217, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES('main-menu', 218, 0, '<front>', '', 'Home', 0x613a303a7b7d, 'menu', 0, 1, 0, 0, 0, 1, 0, 218, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES('navigation', 220, 6, 'node/add/page', 'node/add/page', 'Basic page', 0x613a313a7b733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a37373a22557365203c656d3e62617369632070616765733c2f656d3e20666f7220796f75722073746174696320636f6e74656e742c207375636820617320616e202741626f75742075732720706167652e223b7d7d, 'system', 0, 0, 0, 0, 0, 2, 0, 6, 220, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES('management', 221, 12, 'admin/help/toolbar', 'admin/help/toolbar', 'toolbar', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 3, 0, 1, 12, 221, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES('management', 260, 19, 'admin/reports/updates', 'admin/reports/updates', 'Available updates', 0x613a313a7b733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a38323a22476574206120737461747573207265706f72742061626f757420617661696c61626c65207570646174657320666f7220796f757220696e7374616c6c6564206d6f64756c657320616e64207468656d65732e223b7d7d, 'system', 0, 0, 0, 0, -50, 3, 0, 1, 19, 260, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES('management', 261, 7, 'admin/appearance/install', 'admin/appearance/install', 'Install new theme', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 25, 3, 0, 1, 7, 261, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES('management', 262, 16, 'admin/modules/update', 'admin/modules/update', 'Update', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 10, 3, 0, 1, 16, 262, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES('management', 263, 16, 'admin/modules/install', 'admin/modules/install', 'Install new module', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 25, 3, 0, 1, 16, 263, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES('management', 264, 7, 'admin/appearance/update', 'admin/appearance/update', 'Update', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 10, 3, 0, 1, 7, 264, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES('management', 265, 12, 'admin/help/update', 'admin/help/update', 'update', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 3, 0, 1, 12, 265, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES('management', 266, 260, 'admin/reports/updates/install', 'admin/reports/updates/install', 'Install new module or theme', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 25, 4, 0, 1, 19, 260, 266, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES('management', 267, 260, 'admin/reports/updates/update', 'admin/reports/updates/update', 'Update', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 10, 4, 0, 1, 19, 260, 267, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES('management', 268, 260, 'admin/reports/updates/list', 'admin/reports/updates/list', 'List', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 4, 0, 1, 19, 260, 268, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES('management', 269, 260, 'admin/reports/updates/settings', 'admin/reports/updates/settings', 'Settings', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 50, 4, 0, 1, 19, 260, 269, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES('management', 308, 21, 'admin/structure/services', 'admin/structure/services', 'Services', 0x613a313a7b733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a31353a224d616e616765205365727669636573223b7d7d, 'system', 0, 0, 0, 0, 0, 3, 0, 1, 21, 308, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES('management', 309, 21, 'admin/structure/views', 'admin/structure/views', 'Views', 0x613a313a7b733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a33353a224d616e61676520637573746f6d697a6564206c69737473206f6620636f6e74656e742e223b7d7d, 'system', 0, 0, 1, 0, 0, 3, 0, 1, 21, 309, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES('management', 310, 19, 'admin/reports/views-plugins', 'admin/reports/views-plugins', 'Views plugins', 0x613a313a7b733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a33383a224f76657276696577206f6620706c7567696e73207573656420696e20616c6c2076696577732e223b7d7d, 'system', 0, 0, 0, 0, 0, 3, 0, 1, 19, 310, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES('management', 311, 12, 'admin/help/services', 'admin/help/services', 'services', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 3, 0, 1, 12, 311, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES('management', 312, 12, 'admin/help/wysiwyg', 'admin/help/wysiwyg', 'wysiwyg', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 3, 0, 1, 12, 312, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES('management', 313, 308, 'admin/structure/services/add', 'admin/structure/services/add', 'Add', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 4, 0, 1, 21, 308, 313, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES('management', 314, 309, 'admin/structure/views/add', 'admin/structure/views/add', 'Add new view', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 4, 0, 1, 21, 309, 314, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES('management', 315, 309, 'admin/structure/views/add-template', 'admin/structure/views/add-template', 'Add view from template', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 4, 0, 1, 21, 309, 315, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES('management', 316, 56, 'admin/config/system/googleqrcode', 'admin/config/system/googleqrcode', 'Google QR Code Generator', 0x613a313a7b733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a34373a22436f6e66696775726174696f6e20666f722074686520476f6f676c6520515220436f64652047656e657261746f722e223b7d7d, 'system', 0, 0, 0, 0, 0, 4, 0, 1, 8, 56, 316, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES('management', 317, 308, 'admin/structure/services/import', 'admin/structure/services/import', 'Import', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 4, 0, 1, 21, 308, 317, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES('management', 318, 309, 'admin/structure/views/import', 'admin/structure/views/import', 'Import', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 4, 0, 1, 21, 309, 318, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES('management', 319, 308, 'admin/structure/services/list', 'admin/structure/services/list', 'List', 0x613a303a7b7d, 'system', -1, 0, 0, 0, -10, 4, 0, 1, 21, 308, 319, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES('management', 320, 309, 'admin/structure/views/list', 'admin/structure/views/list', 'List', 0x613a303a7b7d, 'system', -1, 0, 0, 0, -10, 4, 0, 1, 21, 309, 320, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES('management', 321, 42, 'admin/reports/fields/list', 'admin/reports/fields/list', 'List', 0x613a303a7b7d, 'system', -1, 0, 0, 0, -10, 4, 0, 1, 19, 42, 321, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES('management', 322, 309, 'admin/structure/views/settings', 'admin/structure/views/settings', 'Settings', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 4, 0, 1, 21, 309, 322, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES('management', 323, 42, 'admin/reports/fields/views-fields', 'admin/reports/fields/views-fields', 'Used in views', 0x613a313a7b733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a33373a224f76657276696577206f66206669656c6473207573656420696e20616c6c2076696577732e223b7d7d, 'system', -1, 0, 0, 0, 0, 4, 0, 1, 19, 42, 323, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES('management', 324, 35, 'admin/config/content/wysiwyg', 'admin/config/content/wysiwyg', 'Wysiwyg profiles', 0x613a313a7b733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a33303a22436f6e66696775726520636c69656e742d7369646520656469746f72732e223b7d7d, 'system', 0, 0, 0, 0, 0, 4, 0, 1, 8, 35, 324, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES('management', 325, 322, 'admin/structure/views/settings/advanced', 'admin/structure/views/settings/advanced', 'Advanced', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 1, 5, 0, 1, 21, 309, 322, 325, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES('management', 326, 322, 'admin/structure/views/settings/basic', 'admin/structure/views/settings/basic', 'Basic', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 5, 0, 1, 21, 309, 322, 326, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES('management', 327, 324, 'admin/config/content/wysiwyg/profile', 'admin/config/content/wysiwyg/profile', 'List', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 5, 0, 1, 8, 35, 324, 327, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES('management', 328, 309, 'admin/structure/views/view/%', 'admin/structure/views/view/%', '', 0x613a303a7b7d, 'system', 0, 0, 0, 0, 0, 4, 0, 1, 21, 309, 328, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES('management', 329, 328, 'admin/structure/views/view/%/break-lock', 'admin/structure/views/view/%/break-lock', 'Break lock', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 5, 0, 1, 21, 309, 328, 329, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES('management', 330, 328, 'admin/structure/views/view/%/edit', 'admin/structure/views/view/%/edit', 'Edit view', 0x613a303a7b7d, 'system', -1, 0, 0, 0, -10, 5, 0, 1, 21, 309, 328, 330, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES('management', 331, 319, 'admin/structure/services/list/%/authentication', 'admin/structure/services/list/%/authentication', 'Authentication', 0x613a303a7b7d, 'system', -1, 0, 0, 0, -3, 5, 0, 1, 21, 308, 319, 331, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES('management', 332, 328, 'admin/structure/views/view/%/clone', 'admin/structure/views/view/%/clone', 'Clone', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 5, 0, 1, 21, 309, 328, 332, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES('management', 333, 328, 'admin/structure/views/view/%/delete', 'admin/structure/views/view/%/delete', 'Delete', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 5, 0, 1, 21, 309, 328, 333, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES('management', 334, 319, 'admin/structure/services/list/%/edit', 'admin/structure/services/list/%/edit', 'Edit', 0x613a303a7b7d, 'system', -1, 0, 0, 0, -10, 5, 0, 1, 21, 308, 319, 334, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES('management', 335, 319, 'admin/structure/services/list/%/export', 'admin/structure/services/list/%/export', 'Export', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 5, 0, 1, 21, 308, 319, 335, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES('management', 336, 328, 'admin/structure/views/view/%/export', 'admin/structure/views/view/%/export', 'Export', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 5, 0, 1, 21, 309, 328, 336, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES('management', 337, 319, 'admin/structure/services/list/%/resources', 'admin/structure/services/list/%/resources', 'Resources', 0x613a303a7b7d, 'system', -1, 0, 0, 0, -2, 5, 0, 1, 21, 308, 319, 337, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES('management', 338, 328, 'admin/structure/views/view/%/revert', 'admin/structure/views/view/%/revert', 'Revert', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 5, 0, 1, 21, 309, 328, 338, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES('management', 339, 319, 'admin/structure/services/list/%/server', 'admin/structure/services/list/%/server', 'Server', 0x613a303a7b7d, 'system', -1, 0, 0, 0, -4, 5, 0, 1, 21, 308, 319, 339, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES('management', 340, 327, 'admin/config/content/wysiwyg/profile/%/edit', 'admin/config/content/wysiwyg/profile/%/edit', 'Edit', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 6, 0, 1, 8, 35, 324, 327, 340, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES('management', 341, 327, 'admin/config/content/wysiwyg/profile/%/delete', 'admin/config/content/wysiwyg/profile/%/delete', 'Remove', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 10, 6, 0, 1, 8, 35, 324, 327, 341, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES('management', 342, 328, 'admin/structure/views/view/%/preview/%', 'admin/structure/views/view/%/preview/%', '', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 5, 0, 1, 21, 309, 328, 342, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES('management', 343, 309, 'admin/structure/views/nojs/preview/%/%', 'admin/structure/views/nojs/preview/%/%', '', 0x613a303a7b7d, 'system', 0, 0, 0, 0, 0, 4, 0, 1, 21, 309, 343, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES('management', 344, 309, 'admin/structure/views/ajax/preview/%/%', 'admin/structure/views/ajax/preview/%/%', '', 0x613a303a7b7d, 'system', 0, 0, 0, 0, 0, 4, 0, 1, 21, 309, 344, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES('navigation', 345, 6, 'node/add/qr-content', 'node/add/qr-content', 'QR Content', 0x613a303a7b7d, 'system', 0, 0, 0, 0, 0, 2, 0, 6, 345, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES('management', 346, 12, 'admin/help/rules', 'admin/help/rules', 'rules', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 3, 0, 1, 12, 346, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES('management', 347, 65, 'admin/config/workflow/rules', 'admin/config/workflow/rules', 'Rules', 0x613a313a7b733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a34323a224d616e616765207265616374696f6e2072756c657320616e642072756c6520636f6d706f6e656e74732e223b7d7d, 'system', 0, 0, 0, 0, 0, 4, 0, 1, 8, 65, 347, 0, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES('management', 348, 347, 'admin/config/workflow/rules/components', 'admin/config/workflow/rules/components', 'Components', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 5, 0, 1, 8, 65, 347, 348, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES('management', 349, 347, 'admin/config/workflow/rules/reaction', 'admin/config/workflow/rules/reaction', 'Rules', 0x613a303a7b7d, 'system', -1, 0, 0, 0, -1, 5, 0, 1, 8, 65, 347, 349, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES('management', 350, 347, 'admin/config/workflow/rules/schedule', 'admin/config/workflow/rules/schedule', 'Schedule', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 5, 0, 1, 8, 65, 347, 350, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES('management', 351, 347, 'admin/config/workflow/rules/settings', 'admin/config/workflow/rules/settings', 'Settings', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 1, 5, 0, 1, 8, 65, 347, 351, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES('management', 352, 348, 'admin/config/workflow/rules/components/add', 'admin/config/workflow/rules/components/add', 'Add new component', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 6, 0, 1, 8, 65, 347, 348, 352, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES('management', 353, 349, 'admin/config/workflow/rules/reaction/add', 'admin/config/workflow/rules/reaction/add', 'Add new rule', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 6, 0, 1, 8, 65, 347, 349, 353, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES('management', 354, 351, 'admin/config/workflow/rules/settings/advanced', 'admin/config/workflow/rules/settings/advanced', 'Advanced', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 6, 0, 1, 8, 65, 347, 351, 354, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES('management', 355, 351, 'admin/config/workflow/rules/settings/basic', 'admin/config/workflow/rules/settings/basic', 'Basic', 0x613a303a7b7d, 'system', -1, 0, 0, 0, -10, 6, 0, 1, 8, 65, 347, 351, 355, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES('management', 356, 348, 'admin/config/workflow/rules/components/import', 'admin/config/workflow/rules/components/import', 'Import component', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 6, 0, 1, 8, 65, 347, 348, 356, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES('management', 357, 349, 'admin/config/workflow/rules/reaction/import', 'admin/config/workflow/rules/reaction/import', 'Import rule', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 6, 0, 1, 8, 65, 347, 349, 357, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES('management', 358, 348, 'admin/config/workflow/rules/components/manage/%', 'admin/config/workflow/rules/components/manage/%', '', 0x613a303a7b7d, 'system', -1, 0, 1, 0, 0, 6, 0, 1, 8, 65, 347, 348, 358, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES('management', 359, 349, 'admin/config/workflow/rules/reaction/manage/%', 'admin/config/workflow/rules/reaction/manage/%', '', 0x613a303a7b7d, 'system', -1, 0, 1, 0, 0, 6, 0, 1, 8, 65, 347, 349, 359, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES('management', 360, 358, 'admin/config/workflow/rules/components/manage/%/clone', 'admin/config/workflow/rules/components/manage/%/clone', '', 0x613a303a7b7d, 'system', 0, 0, 0, 0, 0, 7, 0, 1, 8, 65, 347, 348, 358, 360, 0, 0, 0);
INSERT INTO `menu_links` VALUES('management', 361, 359, 'admin/config/workflow/rules/reaction/manage/%/clone', 'admin/config/workflow/rules/reaction/manage/%/clone', '', 0x613a303a7b7d, 'system', 0, 0, 0, 0, 0, 7, 0, 1, 8, 65, 347, 349, 359, 361, 0, 0, 0);
INSERT INTO `menu_links` VALUES('management', 362, 358, 'admin/config/workflow/rules/components/manage/%/execute', 'admin/config/workflow/rules/components/manage/%/execute', '', 0x613a303a7b7d, 'system', 0, 0, 0, 0, 0, 7, 0, 1, 8, 65, 347, 348, 358, 362, 0, 0, 0);
INSERT INTO `menu_links` VALUES('management', 363, 359, 'admin/config/workflow/rules/reaction/manage/%/execute', 'admin/config/workflow/rules/reaction/manage/%/execute', '', 0x613a303a7b7d, 'system', 0, 0, 0, 0, 0, 7, 0, 1, 8, 65, 347, 349, 359, 363, 0, 0, 0);
INSERT INTO `menu_links` VALUES('management', 364, 358, 'admin/config/workflow/rules/components/manage/%/export', 'admin/config/workflow/rules/components/manage/%/export', '', 0x613a303a7b7d, 'system', 0, 0, 0, 0, 0, 7, 0, 1, 8, 65, 347, 348, 358, 364, 0, 0, 0);
INSERT INTO `menu_links` VALUES('management', 365, 359, 'admin/config/workflow/rules/reaction/manage/%/export', 'admin/config/workflow/rules/reaction/manage/%/export', '', 0x613a303a7b7d, 'system', 0, 0, 0, 0, 0, 7, 0, 1, 8, 65, 347, 349, 359, 365, 0, 0, 0);
INSERT INTO `menu_links` VALUES('management', 366, 358, 'admin/config/workflow/rules/components/manage/%/schedule', 'admin/config/workflow/rules/components/manage/%/schedule', '', 0x613a303a7b7d, 'system', 0, 0, 0, 0, 0, 7, 0, 1, 8, 65, 347, 348, 358, 366, 0, 0, 0);
INSERT INTO `menu_links` VALUES('management', 367, 359, 'admin/config/workflow/rules/reaction/manage/%/schedule', 'admin/config/workflow/rules/reaction/manage/%/schedule', '', 0x613a303a7b7d, 'system', 0, 0, 0, 0, 0, 7, 0, 1, 8, 65, 347, 349, 359, 367, 0, 0, 0);
INSERT INTO `menu_links` VALUES('management', 368, 358, 'admin/config/workflow/rules/components/manage/%/%', 'admin/config/workflow/rules/components/manage/%/%', '', 0x613a303a7b7d, 'system', 0, 0, 0, 0, 0, 7, 0, 1, 8, 65, 347, 348, 358, 368, 0, 0, 0);
INSERT INTO `menu_links` VALUES('management', 369, 359, 'admin/config/workflow/rules/reaction/manage/%/%', 'admin/config/workflow/rules/reaction/manage/%/%', '', 0x613a303a7b7d, 'system', 0, 0, 0, 0, 0, 7, 0, 1, 8, 65, 347, 349, 359, 369, 0, 0, 0);
INSERT INTO `menu_links` VALUES('management', 370, 358, 'admin/config/workflow/rules/components/manage/%/delete/event', 'admin/config/workflow/rules/components/manage/%/delete/event', 'Remove event', 0x613a313a7b733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a33373a2252656d6f766520616e206576656e742066726f6d2061207265616374696f6e2072756c652e223b7d7d, 'system', 0, 0, 0, 0, 0, 7, 0, 1, 8, 65, 347, 348, 358, 370, 0, 0, 0);
INSERT INTO `menu_links` VALUES('management', 371, 359, 'admin/config/workflow/rules/reaction/manage/%/delete/event', 'admin/config/workflow/rules/reaction/manage/%/delete/event', 'Remove event', 0x613a313a7b733a31303a2261747472696275746573223b613a313a7b733a353a227469746c65223b733a33373a2252656d6f766520616e206576656e742066726f6d2061207265616374696f6e2072756c652e223b7d7d, 'system', 0, 0, 0, 0, 0, 7, 0, 1, 8, 65, 347, 349, 359, 371, 0, 0, 0);
INSERT INTO `menu_links` VALUES('management', 372, 358, 'admin/config/workflow/rules/components/manage/%/add/event', 'admin/config/workflow/rules/components/manage/%/add/event', '', 0x613a303a7b7d, 'system', 0, 0, 0, 0, 0, 7, 0, 1, 8, 65, 347, 348, 358, 372, 0, 0, 0);
INSERT INTO `menu_links` VALUES('management', 373, 359, 'admin/config/workflow/rules/reaction/manage/%/add/event', 'admin/config/workflow/rules/reaction/manage/%/add/event', '', 0x613a303a7b7d, 'system', 0, 0, 0, 0, 0, 7, 0, 1, 8, 65, 347, 349, 359, 373, 0, 0, 0);
INSERT INTO `menu_links` VALUES('management', 374, 358, 'admin/config/workflow/rules/components/manage/%/delete/%', 'admin/config/workflow/rules/components/manage/%/delete/%', '', 0x613a303a7b7d, 'system', 0, 0, 0, 0, 0, 7, 0, 1, 8, 65, 347, 348, 358, 374, 0, 0, 0);
INSERT INTO `menu_links` VALUES('management', 375, 359, 'admin/config/workflow/rules/reaction/manage/%/delete/%', 'admin/config/workflow/rules/reaction/manage/%/delete/%', '', 0x613a303a7b7d, 'system', 0, 0, 0, 0, 0, 7, 0, 1, 8, 65, 347, 349, 359, 375, 0, 0, 0);
INSERT INTO `menu_links` VALUES('management', 376, 358, 'admin/config/workflow/rules/components/manage/%/edit/%', 'admin/config/workflow/rules/components/manage/%/edit/%', '', 0x613a303a7b7d, 'system', 0, 0, 0, 0, 0, 7, 0, 1, 8, 65, 347, 348, 358, 376, 0, 0, 0);
INSERT INTO `menu_links` VALUES('management', 377, 359, 'admin/config/workflow/rules/reaction/manage/%/edit/%', 'admin/config/workflow/rules/reaction/manage/%/edit/%', '', 0x613a303a7b7d, 'system', 0, 0, 0, 0, 0, 7, 0, 1, 8, 65, 347, 349, 359, 377, 0, 0, 0);
INSERT INTO `menu_links` VALUES('management', 378, 358, 'admin/config/workflow/rules/components/manage/%/add/%', 'admin/config/workflow/rules/components/manage/%/add/%', '', 0x613a303a7b7d, 'system', 0, 0, 0, 0, 0, 7, 0, 1, 8, 65, 347, 348, 358, 378, 0, 0, 0);
INSERT INTO `menu_links` VALUES('management', 379, 359, 'admin/config/workflow/rules/reaction/manage/%/add/%', 'admin/config/workflow/rules/reaction/manage/%/add/%', '', 0x613a303a7b7d, 'system', 0, 0, 0, 0, 0, 7, 0, 1, 8, 65, 347, 349, 359, 379, 0, 0, 0);
INSERT INTO `menu_links` VALUES('management', 380, 89, 'admin/structure/taxonomy/%/display', 'admin/structure/taxonomy/%/display', 'Manage display', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 2, 5, 0, 1, 21, 57, 89, 380, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES('management', 381, 90, 'admin/config/people/accounts/display', 'admin/config/people/accounts/display', 'Manage display', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 2, 5, 0, 1, 8, 48, 90, 381, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES('management', 382, 89, 'admin/structure/taxonomy/%/fields', 'admin/structure/taxonomy/%/fields', 'Manage fields', 0x613a303a7b7d, 'system', -1, 0, 1, 0, 1, 5, 0, 1, 21, 57, 89, 382, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES('management', 383, 90, 'admin/config/people/accounts/fields', 'admin/config/people/accounts/fields', 'Manage fields', 0x613a303a7b7d, 'system', -1, 0, 1, 0, 1, 5, 0, 1, 8, 48, 90, 383, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES('management', 384, 380, 'admin/structure/taxonomy/%/display/default', 'admin/structure/taxonomy/%/display/default', 'Default', 0x613a303a7b7d, 'system', -1, 0, 0, 0, -10, 6, 0, 1, 21, 57, 89, 380, 384, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES('management', 385, 381, 'admin/config/people/accounts/display/default', 'admin/config/people/accounts/display/default', 'Default', 0x613a303a7b7d, 'system', -1, 0, 0, 0, -10, 6, 0, 1, 8, 48, 90, 381, 385, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES('management', 386, 135, 'admin/structure/types/manage/%/display', 'admin/structure/types/manage/%/display', 'Manage display', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 2, 5, 0, 1, 21, 36, 135, 386, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES('management', 387, 135, 'admin/structure/types/manage/%/fields', 'admin/structure/types/manage/%/fields', 'Manage fields', 0x613a303a7b7d, 'system', -1, 0, 1, 0, 1, 5, 0, 1, 21, 36, 135, 387, 0, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES('management', 388, 380, 'admin/structure/taxonomy/%/display/full', 'admin/structure/taxonomy/%/display/full', 'Taxonomy term page', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 6, 0, 1, 21, 57, 89, 380, 388, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES('management', 389, 381, 'admin/config/people/accounts/display/full', 'admin/config/people/accounts/display/full', 'User account', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 6, 0, 1, 8, 48, 90, 381, 389, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES('management', 390, 383, 'admin/config/people/accounts/fields/%', 'admin/config/people/accounts/fields/%', '', 0x613a303a7b7d, 'system', 0, 0, 0, 0, 0, 6, 0, 1, 8, 48, 90, 383, 390, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES('management', 391, 382, 'admin/structure/taxonomy/%/fields/%', 'admin/structure/taxonomy/%/fields/%', '', 0x613a303a7b7d, 'system', 0, 0, 0, 0, 0, 6, 0, 1, 21, 57, 89, 382, 391, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES('management', 392, 386, 'admin/structure/types/manage/%/display/default', 'admin/structure/types/manage/%/display/default', 'Default', 0x613a303a7b7d, 'system', -1, 0, 0, 0, -10, 6, 0, 1, 21, 36, 135, 386, 392, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES('management', 393, 386, 'admin/structure/types/manage/%/display/full', 'admin/structure/types/manage/%/display/full', 'Full content', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 6, 0, 1, 21, 36, 135, 386, 393, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES('management', 394, 386, 'admin/structure/types/manage/%/display/rss', 'admin/structure/types/manage/%/display/rss', 'RSS', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 2, 6, 0, 1, 21, 36, 135, 386, 394, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES('management', 395, 386, 'admin/structure/types/manage/%/display/search_result', 'admin/structure/types/manage/%/display/search_result', 'Search result', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 4, 6, 0, 1, 21, 36, 135, 386, 395, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES('management', 396, 386, 'admin/structure/types/manage/%/display/teaser', 'admin/structure/types/manage/%/display/teaser', 'Teaser', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 1, 6, 0, 1, 21, 36, 135, 386, 396, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES('management', 397, 386, 'admin/structure/types/manage/%/display/search_index', 'admin/structure/types/manage/%/display/search_index', 'Search index', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 3, 6, 0, 1, 21, 36, 135, 386, 397, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES('management', 398, 387, 'admin/structure/types/manage/%/fields/%', 'admin/structure/types/manage/%/fields/%', '', 0x613a303a7b7d, 'system', 0, 0, 0, 0, 0, 6, 0, 1, 21, 36, 135, 387, 398, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES('management', 399, 391, 'admin/structure/taxonomy/%/fields/%/delete', 'admin/structure/taxonomy/%/fields/%/delete', 'Delete', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 10, 7, 0, 1, 21, 57, 89, 382, 391, 399, 0, 0, 0);
INSERT INTO `menu_links` VALUES('management', 400, 391, 'admin/structure/taxonomy/%/fields/%/edit', 'admin/structure/taxonomy/%/fields/%/edit', 'Edit', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 7, 0, 1, 21, 57, 89, 382, 391, 400, 0, 0, 0);
INSERT INTO `menu_links` VALUES('management', 401, 391, 'admin/structure/taxonomy/%/fields/%/field-settings', 'admin/structure/taxonomy/%/fields/%/field-settings', 'Field settings', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 7, 0, 1, 21, 57, 89, 382, 391, 401, 0, 0, 0);
INSERT INTO `menu_links` VALUES('management', 402, 391, 'admin/structure/taxonomy/%/fields/%/widget-type', 'admin/structure/taxonomy/%/fields/%/widget-type', 'Widget type', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 7, 0, 1, 21, 57, 89, 382, 391, 402, 0, 0, 0);
INSERT INTO `menu_links` VALUES('management', 403, 390, 'admin/config/people/accounts/fields/%/delete', 'admin/config/people/accounts/fields/%/delete', 'Delete', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 10, 7, 0, 1, 8, 48, 90, 383, 390, 403, 0, 0, 0);
INSERT INTO `menu_links` VALUES('management', 404, 390, 'admin/config/people/accounts/fields/%/edit', 'admin/config/people/accounts/fields/%/edit', 'Edit', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 7, 0, 1, 8, 48, 90, 383, 390, 404, 0, 0, 0);
INSERT INTO `menu_links` VALUES('management', 405, 390, 'admin/config/people/accounts/fields/%/field-settings', 'admin/config/people/accounts/fields/%/field-settings', 'Field settings', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 7, 0, 1, 8, 48, 90, 383, 390, 405, 0, 0, 0);
INSERT INTO `menu_links` VALUES('management', 406, 390, 'admin/config/people/accounts/fields/%/widget-type', 'admin/config/people/accounts/fields/%/widget-type', 'Widget type', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 7, 0, 1, 8, 48, 90, 383, 390, 406, 0, 0, 0);
INSERT INTO `menu_links` VALUES('management', 407, 173, 'admin/structure/types/manage/%/comment/display/default', 'admin/structure/types/manage/%/comment/display/default', 'Default', 0x613a303a7b7d, 'system', -1, 0, 0, 0, -10, 6, 0, 1, 21, 36, 135, 173, 407, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES('management', 408, 173, 'admin/structure/types/manage/%/comment/display/full', 'admin/structure/types/manage/%/comment/display/full', 'Full comment', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 6, 0, 1, 21, 36, 135, 173, 408, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES('management', 409, 174, 'admin/structure/types/manage/%/comment/fields/%', 'admin/structure/types/manage/%/comment/fields/%', '', 0x613a303a7b7d, 'system', 0, 0, 0, 0, 0, 6, 0, 1, 21, 36, 135, 174, 409, 0, 0, 0, 0);
INSERT INTO `menu_links` VALUES('management', 410, 398, 'admin/structure/types/manage/%/fields/%/delete', 'admin/structure/types/manage/%/fields/%/delete', 'Delete', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 10, 7, 0, 1, 21, 36, 135, 387, 398, 410, 0, 0, 0);
INSERT INTO `menu_links` VALUES('management', 411, 398, 'admin/structure/types/manage/%/fields/%/edit', 'admin/structure/types/manage/%/fields/%/edit', 'Edit', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 7, 0, 1, 21, 36, 135, 387, 398, 411, 0, 0, 0);
INSERT INTO `menu_links` VALUES('management', 412, 398, 'admin/structure/types/manage/%/fields/%/field-settings', 'admin/structure/types/manage/%/fields/%/field-settings', 'Field settings', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 7, 0, 1, 21, 36, 135, 387, 398, 412, 0, 0, 0);
INSERT INTO `menu_links` VALUES('management', 413, 398, 'admin/structure/types/manage/%/fields/%/widget-type', 'admin/structure/types/manage/%/fields/%/widget-type', 'Widget type', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 7, 0, 1, 21, 36, 135, 387, 398, 413, 0, 0, 0);
INSERT INTO `menu_links` VALUES('management', 414, 409, 'admin/structure/types/manage/%/comment/fields/%/delete', 'admin/structure/types/manage/%/comment/fields/%/delete', 'Delete', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 10, 7, 0, 1, 21, 36, 135, 174, 409, 414, 0, 0, 0);
INSERT INTO `menu_links` VALUES('management', 415, 409, 'admin/structure/types/manage/%/comment/fields/%/edit', 'admin/structure/types/manage/%/comment/fields/%/edit', 'Edit', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 7, 0, 1, 21, 36, 135, 174, 409, 415, 0, 0, 0);
INSERT INTO `menu_links` VALUES('management', 416, 409, 'admin/structure/types/manage/%/comment/fields/%/field-settings', 'admin/structure/types/manage/%/comment/fields/%/field-settings', 'Field settings', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 7, 0, 1, 21, 36, 135, 174, 409, 416, 0, 0, 0);
INSERT INTO `menu_links` VALUES('management', 417, 409, 'admin/structure/types/manage/%/comment/fields/%/widget-type', 'admin/structure/types/manage/%/comment/fields/%/widget-type', 'Widget type', 0x613a303a7b7d, 'system', -1, 0, 0, 0, 0, 7, 0, 1, 21, 36, 135, 174, 409, 417, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `menu_router`
--

CREATE TABLE `menu_router` (
  `path` varchar(255) NOT NULL default '' COMMENT 'Primary Key: the Drupal path this entry describes',
  `load_functions` blob NOT NULL COMMENT 'A serialized array of function names (like node_load) to be called to load an object corresponding to a part of the current path.',
  `to_arg_functions` blob NOT NULL COMMENT 'A serialized array of function names (like user_uid_optional_to_arg) to be called to replace a part of the router path with another string.',
  `access_callback` varchar(255) NOT NULL default '' COMMENT 'The callback which determines the access to this router path. Defaults to user_access.',
  `access_arguments` blob COMMENT 'A serialized array of arguments for the access callback.',
  `page_callback` varchar(255) NOT NULL default '' COMMENT 'The name of the function that renders the page.',
  `page_arguments` blob COMMENT 'A serialized array of arguments for the page callback.',
  `delivery_callback` varchar(255) NOT NULL default '' COMMENT 'The name of the function that sends the result of the page_callback function to the browser.',
  `fit` int(11) NOT NULL default '0' COMMENT 'A numeric representation of how specific the path is.',
  `number_parts` smallint(6) NOT NULL default '0' COMMENT 'Number of parts in this router path.',
  `context` int(11) NOT NULL default '0' COMMENT 'Only for local tasks (tabs) - the context of a local task to control its placement.',
  `tab_parent` varchar(255) NOT NULL default '' COMMENT 'Only for local tasks (tabs) - the router path of the parent page (which may also be a local task).',
  `tab_root` varchar(255) NOT NULL default '' COMMENT 'Router path of the closest non-tab parent page. For pages that are not local tasks, this will be the same as the path.',
  `title` varchar(255) NOT NULL default '' COMMENT 'The title for the current page, or the title for the tab if this is a local task.',
  `title_callback` varchar(255) NOT NULL default '' COMMENT 'A function which will alter the title. Defaults to t()',
  `title_arguments` varchar(255) NOT NULL default '' COMMENT 'A serialized array of arguments for the title callback. If empty, the title will be used as the sole argument for the title callback.',
  `theme_callback` varchar(255) NOT NULL default '' COMMENT 'A function which returns the name of the theme that will be used to render this page. If left empty, the default theme will be used.',
  `theme_arguments` varchar(255) NOT NULL default '' COMMENT 'A serialized array of arguments for the theme callback.',
  `type` int(11) NOT NULL default '0' COMMENT 'Numeric representation of the type of the menu item, like MENU_LOCAL_TASK.',
  `description` text NOT NULL COMMENT 'A description of this item.',
  `position` varchar(255) NOT NULL default '' COMMENT 'The position of the block (left or right) on the system administration page for this item.',
  `weight` int(11) NOT NULL default '0' COMMENT 'Weight of the element. Lighter weights are higher up, heavier weights go down.',
  `include_file` mediumtext COMMENT 'The file to include for this element, usually the page callback function lives in this file.',
  PRIMARY KEY  (`path`),
  KEY `fit` (`fit`),
  KEY `tab_parent` (`tab_parent`(64),`weight`,`title`),
  KEY `tab_root_weight_title` (`tab_root`(64),`weight`,`title`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Maps paths to various callbacks (access, page and title)';

--
-- Dumping data for table `menu_router`
--

INSERT INTO `menu_router` VALUES('admin', '', '', 'user_access', 0x613a313a7b693a303b733a32373a226163636573732061646d696e697374726174696f6e207061676573223b7d, 'system_admin_menu_block_page', 0x613a303a7b7d, '', 1, 1, 0, '', 'admin', 'Administration', 't', '', '', 'a:0:{}', 6, '', '', 9, 'modules/system/system.admin.inc');
INSERT INTO `menu_router` VALUES('admin/appearance', '', '', 'user_access', 0x613a313a7b693a303b733a31373a2261646d696e6973746572207468656d6573223b7d, 'system_themes_page', 0x613a303a7b7d, '', 3, 2, 0, '', 'admin/appearance', 'Appearance', 't', '', '', 'a:0:{}', 6, 'Select and configure your themes.', 'left', -6, 'modules/system/system.admin.inc');
INSERT INTO `menu_router` VALUES('admin/appearance/default', '', '', 'user_access', 0x613a313a7b693a303b733a31373a2261646d696e6973746572207468656d6573223b7d, 'system_theme_default', 0x613a303a7b7d, '', 7, 3, 0, '', 'admin/appearance/default', 'Set default theme', 't', '', '', 'a:0:{}', 0, '', '', 0, 'modules/system/system.admin.inc');
INSERT INTO `menu_router` VALUES('admin/appearance/disable', '', '', 'user_access', 0x613a313a7b693a303b733a31373a2261646d696e6973746572207468656d6573223b7d, 'system_theme_disable', 0x613a303a7b7d, '', 7, 3, 0, '', 'admin/appearance/disable', 'Disable theme', 't', '', '', 'a:0:{}', 0, '', '', 0, 'modules/system/system.admin.inc');
INSERT INTO `menu_router` VALUES('admin/appearance/enable', '', '', 'user_access', 0x613a313a7b693a303b733a31373a2261646d696e6973746572207468656d6573223b7d, 'system_theme_enable', 0x613a303a7b7d, '', 7, 3, 0, '', 'admin/appearance/enable', 'Enable theme', 't', '', '', 'a:0:{}', 0, '', '', 0, 'modules/system/system.admin.inc');
INSERT INTO `menu_router` VALUES('admin/appearance/install', '', '', 'update_manager_access', 0x613a303a7b7d, 'drupal_get_form', 0x613a323a7b693a303b733a32373a227570646174655f6d616e616765725f696e7374616c6c5f666f726d223b693a313b733a353a227468656d65223b7d, '', 7, 3, 1, 'admin/appearance', 'admin/appearance', 'Install new theme', 't', '', '', 'a:0:{}', 388, '', '', 25, 'modules/update/update.manager.inc');
INSERT INTO `menu_router` VALUES('admin/appearance/list', '', '', 'user_access', 0x613a313a7b693a303b733a31373a2261646d696e6973746572207468656d6573223b7d, 'system_themes_page', 0x613a303a7b7d, '', 7, 3, 1, 'admin/appearance', 'admin/appearance', 'List', 't', '', '', 'a:0:{}', 140, 'Select and configure your theme', '', -1, 'modules/system/system.admin.inc');
INSERT INTO `menu_router` VALUES('admin/appearance/settings', '', '', 'user_access', 0x613a313a7b693a303b733a31373a2261646d696e6973746572207468656d6573223b7d, 'drupal_get_form', 0x613a313a7b693a303b733a32313a2273797374656d5f7468656d655f73657474696e6773223b7d, '', 7, 3, 1, 'admin/appearance', 'admin/appearance', 'Settings', 't', '', '', 'a:0:{}', 132, 'Configure default and theme specific settings.', '', 20, 'modules/system/system.admin.inc');
INSERT INTO `menu_router` VALUES('admin/appearance/settings/bartik', '', '', '_system_themes_access', 0x613a313a7b693a303b4f3a383a22737464436c617373223a31323a7b733a383a2266696c656e616d65223b733a32353a227468656d65732f62617274696b2f62617274696b2e696e666f223b733a343a226e616d65223b733a363a2262617274696b223b733a343a2274797065223b733a353a227468656d65223b733a353a226f776e6572223b733a34353a227468656d65732f656e67696e65732f70687074656d706c6174652f70687074656d706c6174652e656e67696e65223b733a363a22737461747573223b733a313a2231223b733a393a22626f6f747374726170223b733a313a2230223b733a31343a22736368656d615f76657273696f6e223b733a323a222d31223b733a363a22776569676874223b733a313a2230223b733a343a22696e666f223b613a31383a7b733a343a226e616d65223b733a363a2242617274696b223b733a31313a226465736372697074696f6e223b733a34383a224120666c657869626c652c207265636f6c6f7261626c65207468656d652077697468206d616e7920726567696f6e732e223b733a373a227061636b616765223b733a343a22436f7265223b733a373a2276657273696f6e223b733a343a22372e3232223b733a343a22636f7265223b733a333a22372e78223b733a31313a227374796c65736865657473223b613a323a7b733a333a22616c6c223b613a333a7b733a31343a226373732f6c61796f75742e637373223b733a32383a227468656d65732f62617274696b2f6373732f6c61796f75742e637373223b733a31333a226373732f7374796c652e637373223b733a32373a227468656d65732f62617274696b2f6373732f7374796c652e637373223b733a31343a226373732f636f6c6f72732e637373223b733a32383a227468656d65732f62617274696b2f6373732f636f6c6f72732e637373223b7d733a353a227072696e74223b613a313a7b733a31333a226373732f7072696e742e637373223b733a32373a227468656d65732f62617274696b2f6373732f7072696e742e637373223b7d7d733a373a22726567696f6e73223b613a32303a7b733a363a22686561646572223b733a363a22486561646572223b733a343a2268656c70223b733a343a2248656c70223b733a383a22706167655f746f70223b733a383a225061676520746f70223b733a31313a22706167655f626f74746f6d223b733a31313a225061676520626f74746f6d223b733a31313a22686967686c696768746564223b733a31313a22486967686c696768746564223b733a383a226665617475726564223b733a383a224665617475726564223b733a373a22636f6e74656e74223b733a373a22436f6e74656e74223b733a31333a22736964656261725f6669727374223b733a31333a2253696465626172206669727374223b733a31343a22736964656261725f7365636f6e64223b733a31343a2253696465626172207365636f6e64223b733a31343a2274726970747963685f6669727374223b733a31343a225472697074796368206669727374223b733a31353a2274726970747963685f6d6964646c65223b733a31353a225472697074796368206d6964646c65223b733a31333a2274726970747963685f6c617374223b733a31333a225472697074796368206c617374223b733a31383a22666f6f7465725f6669727374636f6c756d6e223b733a31393a22466f6f74657220666972737420636f6c756d6e223b733a31393a22666f6f7465725f7365636f6e64636f6c756d6e223b733a32303a22466f6f746572207365636f6e6420636f6c756d6e223b733a31383a22666f6f7465725f7468697264636f6c756d6e223b733a31393a22466f6f74657220746869726420636f6c756d6e223b733a31393a22666f6f7465725f666f75727468636f6c756d6e223b733a32303a22466f6f74657220666f7572746820636f6c756d6e223b733a363a22666f6f746572223b733a363a22466f6f746572223b733a31343a2264617368626f6172645f6d61696e223b733a31363a2244617368626f61726420286d61696e29223b733a31373a2264617368626f6172645f73696465626172223b733a31393a2244617368626f61726420287369646562617229223b733a31383a2264617368626f6172645f696e616374697665223b733a32303a2244617368626f6172642028696e61637469766529223b7d733a383a2273657474696e6773223b613a313a7b733a32303a2273686f72746375745f6d6f64756c655f6c696e6b223b733a313a2230223b7d733a373a2270726f6a656374223b733a363a2264727570616c223b733a393a22646174657374616d70223b733a31303a2231333635303237303132223b733a363a22656e67696e65223b733a31313a2270687074656d706c617465223b733a383a226665617475726573223b613a393a7b693a303b733a343a226c6f676f223b693a313b733a373a2266617669636f6e223b693a323b733a343a226e616d65223b693a333b733a363a22736c6f67616e223b693a343b733a31373a226e6f64655f757365725f70696374757265223b693a353b733a32303a22636f6d6d656e745f757365725f70696374757265223b693a363b733a32353a22636f6d6d656e745f757365725f766572696669636174696f6e223b693a373b733a393a226d61696e5f6d656e75223b693a383b733a31343a227365636f6e646172795f6d656e75223b7d733a31303a2273637265656e73686f74223b733a32383a227468656d65732f62617274696b2f73637265656e73686f742e706e67223b733a333a22706870223b733a353a22352e322e34223b733a373a2273637269707473223b613a303a7b7d733a31353a226f7665726c61795f726567696f6e73223b613a353a7b693a303b733a31343a2264617368626f6172645f6d61696e223b693a313b733a31373a2264617368626f6172645f73696465626172223b693a323b733a31383a2264617368626f6172645f696e616374697665223b693a333b733a373a22636f6e74656e74223b693a343b733a343a2268656c70223b7d733a31343a22726567696f6e735f68696464656e223b613a323a7b693a303b733a383a22706167655f746f70223b693a313b733a31313a22706167655f626f74746f6d223b7d733a32383a226f7665726c61795f737570706c656d656e74616c5f726567696f6e73223b613a313a7b693a303b733a383a22706167655f746f70223b7d7d733a363a22707265666978223b733a31313a2270687074656d706c617465223b733a31313a227374796c65736865657473223b613a323a7b733a333a22616c6c223b613a333a7b733a31343a226373732f6c61796f75742e637373223b733a32383a227468656d65732f62617274696b2f6373732f6c61796f75742e637373223b733a31333a226373732f7374796c652e637373223b733a32373a227468656d65732f62617274696b2f6373732f7374796c652e637373223b733a31343a226373732f636f6c6f72732e637373223b733a32383a227468656d65732f62617274696b2f6373732f636f6c6f72732e637373223b7d733a353a227072696e74223b613a313a7b733a31333a226373732f7072696e742e637373223b733a32373a227468656d65732f62617274696b2f6373732f7072696e742e637373223b7d7d733a363a22656e67696e65223b733a31313a2270687074656d706c617465223b7d7d, 'drupal_get_form', 0x613a323a7b693a303b733a32313a2273797374656d5f7468656d655f73657474696e6773223b693a313b733a363a2262617274696b223b7d, '', 15, 4, 1, 'admin/appearance/settings', 'admin/appearance', 'Bartik', 't', '', '', 'a:0:{}', 132, '', '', 0, 'modules/system/system.admin.inc');
INSERT INTO `menu_router` VALUES('admin/appearance/settings/garland', '', '', '_system_themes_access', 0x613a313a7b693a303b4f3a383a22737464436c617373223a31323a7b733a383a2266696c656e616d65223b733a32373a227468656d65732f6761726c616e642f6761726c616e642e696e666f223b733a343a226e616d65223b733a373a226761726c616e64223b733a343a2274797065223b733a353a227468656d65223b733a353a226f776e6572223b733a34353a227468656d65732f656e67696e65732f70687074656d706c6174652f70687074656d706c6174652e656e67696e65223b733a363a22737461747573223b733a313a2230223b733a393a22626f6f747374726170223b733a313a2230223b733a31343a22736368656d615f76657273696f6e223b733a323a222d31223b733a363a22776569676874223b733a313a2230223b733a343a22696e666f223b613a31383a7b733a343a226e616d65223b733a373a224761726c616e64223b733a31313a226465736372697074696f6e223b733a3131313a2241206d756c74692d636f6c756d6e207468656d652077686963682063616e20626520636f6e6669677572656420746f206d6f6469667920636f6c6f727320616e6420737769746368206265747765656e20666978656420616e6420666c756964207769647468206c61796f7574732e223b733a373a227061636b616765223b733a343a22436f7265223b733a373a2276657273696f6e223b733a343a22372e3232223b733a343a22636f7265223b733a333a22372e78223b733a31313a227374796c65736865657473223b613a323a7b733a333a22616c6c223b613a313a7b733a393a227374796c652e637373223b733a32343a227468656d65732f6761726c616e642f7374796c652e637373223b7d733a353a227072696e74223b613a313a7b733a393a227072696e742e637373223b733a32343a227468656d65732f6761726c616e642f7072696e742e637373223b7d7d733a383a2273657474696e6773223b613a313a7b733a31333a226761726c616e645f7769647468223b733a353a22666c756964223b7d733a373a2270726f6a656374223b733a363a2264727570616c223b733a393a22646174657374616d70223b733a31303a2231333635303237303132223b733a363a22656e67696e65223b733a31313a2270687074656d706c617465223b733a373a22726567696f6e73223b613a31323a7b733a31333a22736964656261725f6669727374223b733a31323a224c6566742073696465626172223b733a31343a22736964656261725f7365636f6e64223b733a31333a2252696768742073696465626172223b733a373a22636f6e74656e74223b733a373a22436f6e74656e74223b733a363a22686561646572223b733a363a22486561646572223b733a363a22666f6f746572223b733a363a22466f6f746572223b733a31313a22686967686c696768746564223b733a31313a22486967686c696768746564223b733a343a2268656c70223b733a343a2248656c70223b733a383a22706167655f746f70223b733a383a225061676520746f70223b733a31313a22706167655f626f74746f6d223b733a31313a225061676520626f74746f6d223b733a31343a2264617368626f6172645f6d61696e223b733a31363a2244617368626f61726420286d61696e29223b733a31373a2264617368626f6172645f73696465626172223b733a31393a2244617368626f61726420287369646562617229223b733a31383a2264617368626f6172645f696e616374697665223b733a32303a2244617368626f6172642028696e61637469766529223b7d733a383a226665617475726573223b613a393a7b693a303b733a343a226c6f676f223b693a313b733a373a2266617669636f6e223b693a323b733a343a226e616d65223b693a333b733a363a22736c6f67616e223b693a343b733a31373a226e6f64655f757365725f70696374757265223b693a353b733a32303a22636f6d6d656e745f757365725f70696374757265223b693a363b733a32353a22636f6d6d656e745f757365725f766572696669636174696f6e223b693a373b733a393a226d61696e5f6d656e75223b693a383b733a31343a227365636f6e646172795f6d656e75223b7d733a31303a2273637265656e73686f74223b733a32393a227468656d65732f6761726c616e642f73637265656e73686f742e706e67223b733a333a22706870223b733a353a22352e322e34223b733a373a2273637269707473223b613a303a7b7d733a31353a226f7665726c61795f726567696f6e73223b613a353a7b693a303b733a31343a2264617368626f6172645f6d61696e223b693a313b733a31373a2264617368626f6172645f73696465626172223b693a323b733a31383a2264617368626f6172645f696e616374697665223b693a333b733a373a22636f6e74656e74223b693a343b733a343a2268656c70223b7d733a31343a22726567696f6e735f68696464656e223b613a323a7b693a303b733a383a22706167655f746f70223b693a313b733a31313a22706167655f626f74746f6d223b7d733a32383a226f7665726c61795f737570706c656d656e74616c5f726567696f6e73223b613a313a7b693a303b733a383a22706167655f746f70223b7d7d733a363a22707265666978223b733a31313a2270687074656d706c617465223b733a31313a227374796c65736865657473223b613a323a7b733a333a22616c6c223b613a313a7b733a393a227374796c652e637373223b733a32343a227468656d65732f6761726c616e642f7374796c652e637373223b7d733a353a227072696e74223b613a313a7b733a393a227072696e742e637373223b733a32343a227468656d65732f6761726c616e642f7072696e742e637373223b7d7d733a363a22656e67696e65223b733a31313a2270687074656d706c617465223b7d7d, 'drupal_get_form', 0x613a323a7b693a303b733a32313a2273797374656d5f7468656d655f73657474696e6773223b693a313b733a373a226761726c616e64223b7d, '', 15, 4, 1, 'admin/appearance/settings', 'admin/appearance', 'Garland', 't', '', '', 'a:0:{}', 132, '', '', 0, 'modules/system/system.admin.inc');
INSERT INTO `menu_router` VALUES('admin/appearance/settings/global', '', '', 'user_access', 0x613a313a7b693a303b733a31373a2261646d696e6973746572207468656d6573223b7d, 'drupal_get_form', 0x613a313a7b693a303b733a32313a2273797374656d5f7468656d655f73657474696e6773223b7d, '', 15, 4, 1, 'admin/appearance/settings', 'admin/appearance', 'Global settings', 't', '', '', 'a:0:{}', 140, '', '', -1, 'modules/system/system.admin.inc');
INSERT INTO `menu_router` VALUES('admin/appearance/settings/seven', '', '', '_system_themes_access', 0x613a313a7b693a303b4f3a383a22737464436c617373223a31323a7b733a383a2266696c656e616d65223b733a32333a227468656d65732f736576656e2f736576656e2e696e666f223b733a343a226e616d65223b733a353a22736576656e223b733a343a2274797065223b733a353a227468656d65223b733a353a226f776e6572223b733a34353a227468656d65732f656e67696e65732f70687074656d706c6174652f70687074656d706c6174652e656e67696e65223b733a363a22737461747573223b733a313a2231223b733a393a22626f6f747374726170223b733a313a2230223b733a31343a22736368656d615f76657273696f6e223b733a323a222d31223b733a363a22776569676874223b733a313a2230223b733a343a22696e666f223b613a31383a7b733a343a226e616d65223b733a353a22536576656e223b733a31313a226465736372697074696f6e223b733a36353a22412073696d706c65206f6e652d636f6c756d6e2c207461626c656c6573732c20666c7569642077696474682061646d696e697374726174696f6e207468656d652e223b733a373a227061636b616765223b733a343a22436f7265223b733a373a2276657273696f6e223b733a343a22372e3232223b733a343a22636f7265223b733a333a22372e78223b733a31313a227374796c65736865657473223b613a313a7b733a363a2273637265656e223b613a323a7b733a393a2272657365742e637373223b733a32323a227468656d65732f736576656e2f72657365742e637373223b733a393a227374796c652e637373223b733a32323a227468656d65732f736576656e2f7374796c652e637373223b7d7d733a383a2273657474696e6773223b613a313a7b733a32303a2273686f72746375745f6d6f64756c655f6c696e6b223b733a313a2231223b7d733a373a22726567696f6e73223b613a383a7b733a373a22636f6e74656e74223b733a373a22436f6e74656e74223b733a343a2268656c70223b733a343a2248656c70223b733a383a22706167655f746f70223b733a383a225061676520746f70223b733a31313a22706167655f626f74746f6d223b733a31313a225061676520626f74746f6d223b733a31333a22736964656261725f6669727374223b733a31333a2246697273742073696465626172223b733a31343a2264617368626f6172645f6d61696e223b733a31363a2244617368626f61726420286d61696e29223b733a31373a2264617368626f6172645f73696465626172223b733a31393a2244617368626f61726420287369646562617229223b733a31383a2264617368626f6172645f696e616374697665223b733a32303a2244617368626f6172642028696e61637469766529223b7d733a31343a22726567696f6e735f68696464656e223b613a333a7b693a303b733a31333a22736964656261725f6669727374223b693a313b733a383a22706167655f746f70223b693a323b733a31313a22706167655f626f74746f6d223b7d733a373a2270726f6a656374223b733a363a2264727570616c223b733a393a22646174657374616d70223b733a31303a2231333635303237303132223b733a363a22656e67696e65223b733a31313a2270687074656d706c617465223b733a383a226665617475726573223b613a393a7b693a303b733a343a226c6f676f223b693a313b733a373a2266617669636f6e223b693a323b733a343a226e616d65223b693a333b733a363a22736c6f67616e223b693a343b733a31373a226e6f64655f757365725f70696374757265223b693a353b733a32303a22636f6d6d656e745f757365725f70696374757265223b693a363b733a32353a22636f6d6d656e745f757365725f766572696669636174696f6e223b693a373b733a393a226d61696e5f6d656e75223b693a383b733a31343a227365636f6e646172795f6d656e75223b7d733a31303a2273637265656e73686f74223b733a32373a227468656d65732f736576656e2f73637265656e73686f742e706e67223b733a333a22706870223b733a353a22352e322e34223b733a373a2273637269707473223b613a303a7b7d733a31353a226f7665726c61795f726567696f6e73223b613a353a7b693a303b733a31343a2264617368626f6172645f6d61696e223b693a313b733a31373a2264617368626f6172645f73696465626172223b693a323b733a31383a2264617368626f6172645f696e616374697665223b693a333b733a373a22636f6e74656e74223b693a343b733a343a2268656c70223b7d733a32383a226f7665726c61795f737570706c656d656e74616c5f726567696f6e73223b613a313a7b693a303b733a383a22706167655f746f70223b7d7d733a363a22707265666978223b733a31313a2270687074656d706c617465223b733a31313a227374796c65736865657473223b613a313a7b733a363a2273637265656e223b613a323a7b733a393a2272657365742e637373223b733a32323a227468656d65732f736576656e2f72657365742e637373223b733a393a227374796c652e637373223b733a32323a227468656d65732f736576656e2f7374796c652e637373223b7d7d733a363a22656e67696e65223b733a31313a2270687074656d706c617465223b7d7d, 'drupal_get_form', 0x613a323a7b693a303b733a32313a2273797374656d5f7468656d655f73657474696e6773223b693a313b733a353a22736576656e223b7d, '', 15, 4, 1, 'admin/appearance/settings', 'admin/appearance', 'Seven', 't', '', '', 'a:0:{}', 132, '', '', 0, 'modules/system/system.admin.inc');
INSERT INTO `menu_router` VALUES('admin/appearance/settings/stark', '', '', '_system_themes_access', 0x613a313a7b693a303b4f3a383a22737464436c617373223a31323a7b733a383a2266696c656e616d65223b733a32333a227468656d65732f737461726b2f737461726b2e696e666f223b733a343a226e616d65223b733a353a22737461726b223b733a343a2274797065223b733a353a227468656d65223b733a353a226f776e6572223b733a34353a227468656d65732f656e67696e65732f70687074656d706c6174652f70687074656d706c6174652e656e67696e65223b733a363a22737461747573223b733a313a2230223b733a393a22626f6f747374726170223b733a313a2230223b733a31343a22736368656d615f76657273696f6e223b733a323a222d31223b733a363a22776569676874223b733a313a2230223b733a343a22696e666f223b613a31373a7b733a343a226e616d65223b733a353a22537461726b223b733a31313a226465736372697074696f6e223b733a3230383a2254686973207468656d652064656d6f6e737472617465732044727570616c27732064656661756c742048544d4c206d61726b757020616e6420435353207374796c65732e20546f206c6561726e20686f7720746f206275696c6420796f7572206f776e207468656d6520616e64206f766572726964652044727570616c27732064656661756c7420636f64652c2073656520746865203c6120687265663d22687474703a2f2f64727570616c2e6f72672f7468656d652d6775696465223e5468656d696e672047756964653c2f613e2e223b733a373a227061636b616765223b733a343a22436f7265223b733a373a2276657273696f6e223b733a343a22372e3232223b733a343a22636f7265223b733a333a22372e78223b733a31313a227374796c65736865657473223b613a313a7b733a333a22616c6c223b613a313a7b733a31303a226c61796f75742e637373223b733a32333a227468656d65732f737461726b2f6c61796f75742e637373223b7d7d733a373a2270726f6a656374223b733a363a2264727570616c223b733a393a22646174657374616d70223b733a31303a2231333635303237303132223b733a363a22656e67696e65223b733a31313a2270687074656d706c617465223b733a373a22726567696f6e73223b613a31323a7b733a31333a22736964656261725f6669727374223b733a31323a224c6566742073696465626172223b733a31343a22736964656261725f7365636f6e64223b733a31333a2252696768742073696465626172223b733a373a22636f6e74656e74223b733a373a22436f6e74656e74223b733a363a22686561646572223b733a363a22486561646572223b733a363a22666f6f746572223b733a363a22466f6f746572223b733a31313a22686967686c696768746564223b733a31313a22486967686c696768746564223b733a343a2268656c70223b733a343a2248656c70223b733a383a22706167655f746f70223b733a383a225061676520746f70223b733a31313a22706167655f626f74746f6d223b733a31313a225061676520626f74746f6d223b733a31343a2264617368626f6172645f6d61696e223b733a31363a2244617368626f61726420286d61696e29223b733a31373a2264617368626f6172645f73696465626172223b733a31393a2244617368626f61726420287369646562617229223b733a31383a2264617368626f6172645f696e616374697665223b733a32303a2244617368626f6172642028696e61637469766529223b7d733a383a226665617475726573223b613a393a7b693a303b733a343a226c6f676f223b693a313b733a373a2266617669636f6e223b693a323b733a343a226e616d65223b693a333b733a363a22736c6f67616e223b693a343b733a31373a226e6f64655f757365725f70696374757265223b693a353b733a32303a22636f6d6d656e745f757365725f70696374757265223b693a363b733a32353a22636f6d6d656e745f757365725f766572696669636174696f6e223b693a373b733a393a226d61696e5f6d656e75223b693a383b733a31343a227365636f6e646172795f6d656e75223b7d733a31303a2273637265656e73686f74223b733a32373a227468656d65732f737461726b2f73637265656e73686f742e706e67223b733a333a22706870223b733a353a22352e322e34223b733a373a2273637269707473223b613a303a7b7d733a31353a226f7665726c61795f726567696f6e73223b613a353a7b693a303b733a31343a2264617368626f6172645f6d61696e223b693a313b733a31373a2264617368626f6172645f73696465626172223b693a323b733a31383a2264617368626f6172645f696e616374697665223b693a333b733a373a22636f6e74656e74223b693a343b733a343a2268656c70223b7d733a31343a22726567696f6e735f68696464656e223b613a323a7b693a303b733a383a22706167655f746f70223b693a313b733a31313a22706167655f626f74746f6d223b7d733a32383a226f7665726c61795f737570706c656d656e74616c5f726567696f6e73223b613a313a7b693a303b733a383a22706167655f746f70223b7d7d733a363a22707265666978223b733a31313a2270687074656d706c617465223b733a31313a227374796c65736865657473223b613a313a7b733a333a22616c6c223b613a313a7b733a31303a226c61796f75742e637373223b733a32333a227468656d65732f737461726b2f6c61796f75742e637373223b7d7d733a363a22656e67696e65223b733a31313a2270687074656d706c617465223b7d7d, 'drupal_get_form', 0x613a323a7b693a303b733a32313a2273797374656d5f7468656d655f73657474696e6773223b693a313b733a353a22737461726b223b7d, '', 15, 4, 1, 'admin/appearance/settings', 'admin/appearance', 'Stark', 't', '', '', 'a:0:{}', 132, '', '', 0, 'modules/system/system.admin.inc');
INSERT INTO `menu_router` VALUES('admin/appearance/update', '', '', 'update_manager_access', 0x613a303a7b7d, 'drupal_get_form', 0x613a323a7b693a303b733a32363a227570646174655f6d616e616765725f7570646174655f666f726d223b693a313b733a353a227468656d65223b7d, '', 7, 3, 1, 'admin/appearance', 'admin/appearance', 'Update', 't', '', '', 'a:0:{}', 132, '', '', 10, 'modules/update/update.manager.inc');
INSERT INTO `menu_router` VALUES('admin/compact', '', '', 'user_access', 0x613a313a7b693a303b733a32373a226163636573732061646d696e697374726174696f6e207061676573223b7d, 'system_admin_compact_page', 0x613a303a7b7d, '', 3, 2, 0, '', 'admin/compact', 'Compact mode', 't', '', '', 'a:0:{}', 0, '', '', 0, 'modules/system/system.admin.inc');
INSERT INTO `menu_router` VALUES('admin/config', '', '', 'user_access', 0x613a313a7b693a303b733a32373a226163636573732061646d696e697374726174696f6e207061676573223b7d, 'system_admin_config_page', 0x613a303a7b7d, '', 3, 2, 0, '', 'admin/config', 'Configuration', 't', '', '', 'a:0:{}', 6, 'Administer settings.', '', 0, 'modules/system/system.admin.inc');
INSERT INTO `menu_router` VALUES('admin/config/content', '', '', 'user_access', 0x613a313a7b693a303b733a32373a226163636573732061646d696e697374726174696f6e207061676573223b7d, 'system_admin_menu_block_page', 0x613a303a7b7d, '', 7, 3, 0, '', 'admin/config/content', 'Content authoring', 't', '', '', 'a:0:{}', 6, 'Settings related to formatting and authoring content.', 'left', -15, 'modules/system/system.admin.inc');
INSERT INTO `menu_router` VALUES('admin/config/content/formats', '', '', 'user_access', 0x613a313a7b693a303b733a31383a2261646d696e69737465722066696c74657273223b7d, 'drupal_get_form', 0x613a313a7b693a303b733a32313a2266696c7465725f61646d696e5f6f76657276696577223b7d, '', 15, 4, 0, '', 'admin/config/content/formats', 'Text formats', 't', '', '', 'a:0:{}', 6, 'Configure how content input by users is filtered, including allowed HTML tags. Also allows enabling of module-provided filters.', '', 0, 'modules/filter/filter.admin.inc');
INSERT INTO `menu_router` VALUES('admin/config/content/formats/%', 0x613a313a7b693a343b733a31383a2266696c7465725f666f726d61745f6c6f6164223b7d, '', 'user_access', 0x613a313a7b693a303b733a31383a2261646d696e69737465722066696c74657273223b7d, 'filter_admin_format_page', 0x613a313a7b693a303b693a343b7d, '', 30, 5, 0, '', 'admin/config/content/formats/%', '', 'filter_admin_format_title', 'a:1:{i:0;i:4;}', '', 'a:0:{}', 6, '', '', 0, 'modules/filter/filter.admin.inc');
INSERT INTO `menu_router` VALUES('admin/config/content/formats/%/disable', 0x613a313a7b693a343b733a31383a2266696c7465725f666f726d61745f6c6f6164223b7d, '', '_filter_disable_format_access', 0x613a313a7b693a303b693a343b7d, 'drupal_get_form', 0x613a323a7b693a303b733a32303a2266696c7465725f61646d696e5f64697361626c65223b693a313b693a343b7d, '', 61, 6, 0, '', 'admin/config/content/formats/%/disable', 'Disable text format', 't', '', '', 'a:0:{}', 6, '', '', 0, 'modules/filter/filter.admin.inc');
INSERT INTO `menu_router` VALUES('admin/config/content/formats/add', '', '', 'user_access', 0x613a313a7b693a303b733a31383a2261646d696e69737465722066696c74657273223b7d, 'filter_admin_format_page', 0x613a303a7b7d, '', 31, 5, 1, 'admin/config/content/formats', 'admin/config/content/formats', 'Add text format', 't', '', '', 'a:0:{}', 388, '', '', 1, 'modules/filter/filter.admin.inc');
INSERT INTO `menu_router` VALUES('admin/config/content/formats/list', '', '', 'user_access', 0x613a313a7b693a303b733a31383a2261646d696e69737465722066696c74657273223b7d, 'drupal_get_form', 0x613a313a7b693a303b733a32313a2266696c7465725f61646d696e5f6f76657276696577223b7d, '', 31, 5, 1, 'admin/config/content/formats', 'admin/config/content/formats', 'List', 't', '', '', 'a:0:{}', 140, '', '', 0, 'modules/filter/filter.admin.inc');
INSERT INTO `menu_router` VALUES('admin/config/content/wysiwyg', '', '', 'user_access', 0x613a313a7b693a303b733a31383a2261646d696e69737465722066696c74657273223b7d, 'drupal_get_form', 0x613a313a7b693a303b733a32343a22777973697779675f70726f66696c655f6f76657276696577223b7d, '', 15, 4, 0, '', 'admin/config/content/wysiwyg', 'Wysiwyg profiles', 't', '', '', 'a:0:{}', 6, 'Configure client-side editors.', '', 0, 'sites/all/modules/wysiwyg/wysiwyg.admin.inc');
INSERT INTO `menu_router` VALUES('admin/config/content/wysiwyg/profile', '', '', 'user_access', 0x613a313a7b693a303b733a31383a2261646d696e69737465722066696c74657273223b7d, 'drupal_get_form', 0x613a313a7b693a303b733a32343a22777973697779675f70726f66696c655f6f76657276696577223b7d, '', 31, 5, 1, 'admin/config/content/wysiwyg', 'admin/config/content/wysiwyg', 'List', 't', '', '', 'a:0:{}', 140, '', '', 0, 'sites/all/modules/wysiwyg/wysiwyg.admin.inc');
INSERT INTO `menu_router` VALUES('admin/config/content/wysiwyg/profile/%/delete', 0x613a313a7b693a353b733a32303a22777973697779675f70726f66696c655f6c6f6164223b7d, '', 'user_access', 0x613a313a7b693a303b733a31383a2261646d696e69737465722066696c74657273223b7d, 'drupal_get_form', 0x613a323a7b693a303b733a33303a22777973697779675f70726f66696c655f64656c6574655f636f6e6669726d223b693a313b693a353b7d, '', 125, 7, 1, 'admin/config/content/wysiwyg/profile/%wysiwyg_profile', 'admin/config/content/wysiwyg/profile', 'Remove', 't', '', '', 'a:0:{}', 132, '', '', 10, 'sites/all/modules/wysiwyg/wysiwyg.admin.inc');
INSERT INTO `menu_router` VALUES('admin/config/content/wysiwyg/profile/%/edit', 0x613a313a7b693a353b733a32303a22777973697779675f70726f66696c655f6c6f6164223b7d, '', 'user_access', 0x613a313a7b693a303b733a31383a2261646d696e69737465722066696c74657273223b7d, 'drupal_get_form', 0x613a323a7b693a303b733a32303a22777973697779675f70726f66696c655f666f726d223b693a313b693a353b7d, '', 125, 7, 1, 'admin/config/content/wysiwyg/profile/%wysiwyg_profile', 'admin/config/content/wysiwyg/profile', 'Edit', 't', '', '', 'a:0:{}', 132, '', '', 0, 'sites/all/modules/wysiwyg/wysiwyg.admin.inc');
INSERT INTO `menu_router` VALUES('admin/config/development', '', '', 'user_access', 0x613a313a7b693a303b733a32373a226163636573732061646d696e697374726174696f6e207061676573223b7d, 'system_admin_menu_block_page', 0x613a303a7b7d, '', 7, 3, 0, '', 'admin/config/development', 'Development', 't', '', '', 'a:0:{}', 6, 'Development tools.', 'right', -10, 'modules/system/system.admin.inc');
INSERT INTO `menu_router` VALUES('admin/config/development/logging', '', '', 'user_access', 0x613a313a7b693a303b733a32393a2261646d696e6973746572207369746520636f6e66696775726174696f6e223b7d, 'drupal_get_form', 0x613a313a7b693a303b733a32333a2273797374656d5f6c6f6767696e675f73657474696e6773223b7d, '', 15, 4, 0, '', 'admin/config/development/logging', 'Logging and errors', 't', '', '', 'a:0:{}', 6, 'Settings for logging and alerts modules. Various modules can route Drupal''s system events to different destinations, such as syslog, database, email, etc.', '', -15, 'modules/system/system.admin.inc');
INSERT INTO `menu_router` VALUES('admin/config/development/maintenance', '', '', 'user_access', 0x613a313a7b693a303b733a32393a2261646d696e6973746572207369746520636f6e66696775726174696f6e223b7d, 'drupal_get_form', 0x613a313a7b693a303b733a32383a2273797374656d5f736974655f6d61696e74656e616e63655f6d6f6465223b7d, '', 15, 4, 0, '', 'admin/config/development/maintenance', 'Maintenance mode', 't', '', '', 'a:0:{}', 6, 'Take the site offline for maintenance or bring it back online.', '', -10, 'modules/system/system.admin.inc');
INSERT INTO `menu_router` VALUES('admin/config/development/performance', '', '', 'user_access', 0x613a313a7b693a303b733a32393a2261646d696e6973746572207369746520636f6e66696775726174696f6e223b7d, 'drupal_get_form', 0x613a313a7b693a303b733a32373a2273797374656d5f706572666f726d616e63655f73657474696e6773223b7d, '', 15, 4, 0, '', 'admin/config/development/performance', 'Performance', 't', '', '', 'a:0:{}', 6, 'Enable or disable page caching for anonymous users and set CSS and JS bandwidth optimization options.', '', -20, 'modules/system/system.admin.inc');
INSERT INTO `menu_router` VALUES('admin/config/media', '', '', 'user_access', 0x613a313a7b693a303b733a32373a226163636573732061646d696e697374726174696f6e207061676573223b7d, 'system_admin_menu_block_page', 0x613a303a7b7d, '', 7, 3, 0, '', 'admin/config/media', 'Media', 't', '', '', 'a:0:{}', 6, 'Media tools.', 'left', -10, 'modules/system/system.admin.inc');
INSERT INTO `menu_router` VALUES('admin/config/media/file-system', '', '', 'user_access', 0x613a313a7b693a303b733a32393a2261646d696e6973746572207369746520636f6e66696775726174696f6e223b7d, 'drupal_get_form', 0x613a313a7b693a303b733a32373a2273797374656d5f66696c655f73797374656d5f73657474696e6773223b7d, '', 15, 4, 0, '', 'admin/config/media/file-system', 'File system', 't', '', '', 'a:0:{}', 6, 'Tell Drupal where to store uploaded files and how they are accessed.', '', -10, 'modules/system/system.admin.inc');
INSERT INTO `menu_router` VALUES('admin/config/media/image-styles', '', '', 'user_access', 0x613a313a7b693a303b733a32333a2261646d696e697374657220696d616765207374796c6573223b7d, 'image_style_list', 0x613a303a7b7d, '', 15, 4, 0, '', 'admin/config/media/image-styles', 'Image styles', 't', '', '', 'a:0:{}', 6, 'Configure styles that can be used for resizing or adjusting images on display.', '', 0, 'modules/image/image.admin.inc');
INSERT INTO `menu_router` VALUES('admin/config/media/image-styles/add', '', '', 'user_access', 0x613a313a7b693a303b733a32333a2261646d696e697374657220696d616765207374796c6573223b7d, 'drupal_get_form', 0x613a313a7b693a303b733a32303a22696d6167655f7374796c655f6164645f666f726d223b7d, '', 31, 5, 1, 'admin/config/media/image-styles', 'admin/config/media/image-styles', 'Add style', 't', '', '', 'a:0:{}', 388, 'Add a new image style.', '', 2, 'modules/image/image.admin.inc');
INSERT INTO `menu_router` VALUES('admin/config/media/image-styles/delete/%', 0x613a313a7b693a353b613a313a7b733a31363a22696d6167655f7374796c655f6c6f6164223b613a323a7b693a303b4e3b693a313b733a313a2231223b7d7d7d, '', 'user_access', 0x613a313a7b693a303b733a32333a2261646d696e697374657220696d616765207374796c6573223b7d, 'drupal_get_form', 0x613a323a7b693a303b733a32333a22696d6167655f7374796c655f64656c6574655f666f726d223b693a313b693a353b7d, '', 62, 6, 0, '', 'admin/config/media/image-styles/delete/%', 'Delete style', 't', '', '', 'a:0:{}', 6, 'Delete an image style.', '', 0, 'modules/image/image.admin.inc');
INSERT INTO `menu_router` VALUES('admin/config/media/image-styles/edit/%', 0x613a313a7b693a353b733a31363a22696d6167655f7374796c655f6c6f6164223b7d, '', 'user_access', 0x613a313a7b693a303b733a32333a2261646d696e697374657220696d616765207374796c6573223b7d, 'drupal_get_form', 0x613a323a7b693a303b733a31363a22696d6167655f7374796c655f666f726d223b693a313b693a353b7d, '', 62, 6, 0, '', 'admin/config/media/image-styles/edit/%', 'Edit style', 't', '', '', 'a:0:{}', 6, 'Configure an image style.', '', 0, 'modules/image/image.admin.inc');
INSERT INTO `menu_router` VALUES('admin/config/media/image-styles/edit/%/add/%', 0x613a323a7b693a353b613a313a7b733a31363a22696d6167655f7374796c655f6c6f6164223b613a313a7b693a303b693a353b7d7d693a373b613a313a7b733a32383a22696d6167655f6566666563745f646566696e6974696f6e5f6c6f6164223b613a313a7b693a303b693a353b7d7d7d, '', 'user_access', 0x613a313a7b693a303b733a32333a2261646d696e697374657220696d616765207374796c6573223b7d, 'drupal_get_form', 0x613a333a7b693a303b733a31373a22696d6167655f6566666563745f666f726d223b693a313b693a353b693a323b693a373b7d, '', 250, 8, 0, '', 'admin/config/media/image-styles/edit/%/add/%', 'Add image effect', 't', '', '', 'a:0:{}', 6, 'Add a new effect to a style.', '', 0, 'modules/image/image.admin.inc');
INSERT INTO `menu_router` VALUES('admin/config/media/image-styles/edit/%/effects/%', 0x613a323a7b693a353b613a313a7b733a31363a22696d6167655f7374796c655f6c6f6164223b613a323a7b693a303b693a353b693a313b733a313a2233223b7d7d693a373b613a313a7b733a31373a22696d6167655f6566666563745f6c6f6164223b613a323a7b693a303b693a353b693a313b733a313a2233223b7d7d7d, '', 'user_access', 0x613a313a7b693a303b733a32333a2261646d696e697374657220696d616765207374796c6573223b7d, 'drupal_get_form', 0x613a333a7b693a303b733a31373a22696d6167655f6566666563745f666f726d223b693a313b693a353b693a323b693a373b7d, '', 250, 8, 0, '', 'admin/config/media/image-styles/edit/%/effects/%', 'Edit image effect', 't', '', '', 'a:0:{}', 6, 'Edit an existing effect within a style.', '', 0, 'modules/image/image.admin.inc');
INSERT INTO `menu_router` VALUES('admin/config/media/image-styles/edit/%/effects/%/delete', 0x613a323a7b693a353b613a313a7b733a31363a22696d6167655f7374796c655f6c6f6164223b613a323a7b693a303b693a353b693a313b733a313a2233223b7d7d693a373b613a313a7b733a31373a22696d6167655f6566666563745f6c6f6164223b613a323a7b693a303b693a353b693a313b733a313a2233223b7d7d7d, '', 'user_access', 0x613a313a7b693a303b733a32333a2261646d696e697374657220696d616765207374796c6573223b7d, 'drupal_get_form', 0x613a333a7b693a303b733a32343a22696d6167655f6566666563745f64656c6574655f666f726d223b693a313b693a353b693a323b693a373b7d, '', 501, 9, 0, '', 'admin/config/media/image-styles/edit/%/effects/%/delete', 'Delete image effect', 't', '', '', 'a:0:{}', 6, 'Delete an existing effect from a style.', '', 0, 'modules/image/image.admin.inc');
INSERT INTO `menu_router` VALUES('admin/config/media/image-styles/list', '', '', 'user_access', 0x613a313a7b693a303b733a32333a2261646d696e697374657220696d616765207374796c6573223b7d, 'image_style_list', 0x613a303a7b7d, '', 31, 5, 1, 'admin/config/media/image-styles', 'admin/config/media/image-styles', 'List', 't', '', '', 'a:0:{}', 140, 'List the current image styles on the site.', '', 1, 'modules/image/image.admin.inc');
INSERT INTO `menu_router` VALUES('admin/config/media/image-styles/revert/%', 0x613a313a7b693a353b613a313a7b733a31363a22696d6167655f7374796c655f6c6f6164223b613a323a7b693a303b4e3b693a313b733a313a2232223b7d7d7d, '', 'user_access', 0x613a313a7b693a303b733a32333a2261646d696e697374657220696d616765207374796c6573223b7d, 'drupal_get_form', 0x613a323a7b693a303b733a32333a22696d6167655f7374796c655f7265766572745f666f726d223b693a313b693a353b7d, '', 62, 6, 0, '', 'admin/config/media/image-styles/revert/%', 'Revert style', 't', '', '', 'a:0:{}', 6, 'Revert an image style.', '', 0, 'modules/image/image.admin.inc');
INSERT INTO `menu_router` VALUES('admin/config/media/image-toolkit', '', '', 'user_access', 0x613a313a7b693a303b733a32393a2261646d696e6973746572207369746520636f6e66696775726174696f6e223b7d, 'drupal_get_form', 0x613a313a7b693a303b733a32393a2273797374656d5f696d6167655f746f6f6c6b69745f73657474696e6773223b7d, '', 15, 4, 0, '', 'admin/config/media/image-toolkit', 'Image toolkit', 't', '', '', 'a:0:{}', 6, 'Choose which image toolkit to use if you have installed optional toolkits.', '', 20, 'modules/system/system.admin.inc');
INSERT INTO `menu_router` VALUES('admin/config/people', '', '', 'user_access', 0x613a313a7b693a303b733a32373a226163636573732061646d696e697374726174696f6e207061676573223b7d, 'system_admin_menu_block_page', 0x613a303a7b7d, '', 7, 3, 0, '', 'admin/config/people', 'People', 't', '', '', 'a:0:{}', 6, 'Configure user accounts.', 'left', -20, 'modules/system/system.admin.inc');
INSERT INTO `menu_router` VALUES('admin/config/people/accounts', '', '', 'user_access', 0x613a313a7b693a303b733a31363a2261646d696e6973746572207573657273223b7d, 'drupal_get_form', 0x613a313a7b693a303b733a31393a22757365725f61646d696e5f73657474696e6773223b7d, '', 15, 4, 0, '', 'admin/config/people/accounts', 'Account settings', 't', '', '', 'a:0:{}', 6, 'Configure default behavior of users, including registration requirements, e-mails, fields, and user pictures.', '', -10, 'modules/user/user.admin.inc');
INSERT INTO `menu_router` VALUES('admin/config/people/accounts/display', '', '', 'user_access', 0x613a313a7b693a303b733a31363a2261646d696e6973746572207573657273223b7d, 'drupal_get_form', 0x613a343a7b693a303b733a33303a226669656c645f75695f646973706c61795f6f766572766965775f666f726d223b693a313b733a343a2275736572223b693a323b733a343a2275736572223b693a333b733a373a2264656661756c74223b7d, '', 31, 5, 1, 'admin/config/people/accounts', 'admin/config/people/accounts', 'Manage display', 't', '', '', 'a:0:{}', 132, '', '', 2, 'modules/field_ui/field_ui.admin.inc');
INSERT INTO `menu_router` VALUES('admin/config/people/accounts/display/default', '', '', '_field_ui_view_mode_menu_access', 0x613a353a7b693a303b733a343a2275736572223b693a313b733a343a2275736572223b693a323b733a373a2264656661756c74223b693a333b733a31313a22757365725f616363657373223b693a343b733a31363a2261646d696e6973746572207573657273223b7d, 'drupal_get_form', 0x613a343a7b693a303b733a33303a226669656c645f75695f646973706c61795f6f766572766965775f666f726d223b693a313b733a343a2275736572223b693a323b733a343a2275736572223b693a333b733a373a2264656661756c74223b7d, '', 63, 6, 1, 'admin/config/people/accounts/display', 'admin/config/people/accounts', 'Default', 't', '', '', 'a:0:{}', 140, '', '', -10, 'modules/field_ui/field_ui.admin.inc');
INSERT INTO `menu_router` VALUES('admin/config/people/accounts/display/full', '', '', '_field_ui_view_mode_menu_access', 0x613a353a7b693a303b733a343a2275736572223b693a313b733a343a2275736572223b693a323b733a343a2266756c6c223b693a333b733a31313a22757365725f616363657373223b693a343b733a31363a2261646d696e6973746572207573657273223b7d, 'drupal_get_form', 0x613a343a7b693a303b733a33303a226669656c645f75695f646973706c61795f6f766572766965775f666f726d223b693a313b733a343a2275736572223b693a323b733a343a2275736572223b693a333b733a343a2266756c6c223b7d, '', 63, 6, 1, 'admin/config/people/accounts/display', 'admin/config/people/accounts', 'User account', 't', '', '', 'a:0:{}', 132, '', '', 0, 'modules/field_ui/field_ui.admin.inc');
INSERT INTO `menu_router` VALUES('admin/config/people/accounts/fields', '', '', 'user_access', 0x613a313a7b693a303b733a31363a2261646d696e6973746572207573657273223b7d, 'drupal_get_form', 0x613a333a7b693a303b733a32383a226669656c645f75695f6669656c645f6f766572766965775f666f726d223b693a313b733a343a2275736572223b693a323b733a343a2275736572223b7d, '', 31, 5, 1, 'admin/config/people/accounts', 'admin/config/people/accounts', 'Manage fields', 't', '', '', 'a:0:{}', 132, '', '', 1, 'modules/field_ui/field_ui.admin.inc');
INSERT INTO `menu_router` VALUES('admin/config/people/accounts/fields/%', 0x613a313a7b693a353b613a313a7b733a31383a226669656c645f75695f6d656e755f6c6f6164223b613a343a7b693a303b733a343a2275736572223b693a313b733a343a2275736572223b693a323b733a313a2230223b693a333b733a343a22256d6170223b7d7d7d, '', 'user_access', 0x613a313a7b693a303b733a31363a2261646d696e6973746572207573657273223b7d, 'drupal_get_form', 0x613a323a7b693a303b733a32343a226669656c645f75695f6669656c645f656469745f666f726d223b693a313b693a353b7d, '', 62, 6, 0, '', 'admin/config/people/accounts/fields/%', '', 'field_ui_menu_title', 'a:1:{i:0;i:5;}', '', 'a:0:{}', 6, '', '', 0, 'modules/field_ui/field_ui.admin.inc');
INSERT INTO `menu_router` VALUES('admin/config/people/accounts/fields/%/delete', 0x613a313a7b693a353b613a313a7b733a31383a226669656c645f75695f6d656e755f6c6f6164223b613a343a7b693a303b733a343a2275736572223b693a313b733a343a2275736572223b693a323b733a313a2230223b693a333b733a343a22256d6170223b7d7d7d, '', 'user_access', 0x613a313a7b693a303b733a31363a2261646d696e6973746572207573657273223b7d, 'drupal_get_form', 0x613a323a7b693a303b733a32363a226669656c645f75695f6669656c645f64656c6574655f666f726d223b693a313b693a353b7d, '', 125, 7, 1, 'admin/config/people/accounts/fields/%', 'admin/config/people/accounts/fields/%', 'Delete', 't', '', '', 'a:0:{}', 132, '', '', 10, 'modules/field_ui/field_ui.admin.inc');
INSERT INTO `menu_router` VALUES('admin/config/people/accounts/fields/%/edit', 0x613a313a7b693a353b613a313a7b733a31383a226669656c645f75695f6d656e755f6c6f6164223b613a343a7b693a303b733a343a2275736572223b693a313b733a343a2275736572223b693a323b733a313a2230223b693a333b733a343a22256d6170223b7d7d7d, '', 'user_access', 0x613a313a7b693a303b733a31363a2261646d696e6973746572207573657273223b7d, 'drupal_get_form', 0x613a323a7b693a303b733a32343a226669656c645f75695f6669656c645f656469745f666f726d223b693a313b693a353b7d, '', 125, 7, 1, 'admin/config/people/accounts/fields/%', 'admin/config/people/accounts/fields/%', 'Edit', 't', '', '', 'a:0:{}', 140, '', '', 0, 'modules/field_ui/field_ui.admin.inc');
INSERT INTO `menu_router` VALUES('admin/config/people/accounts/fields/%/field-settings', 0x613a313a7b693a353b613a313a7b733a31383a226669656c645f75695f6d656e755f6c6f6164223b613a343a7b693a303b733a343a2275736572223b693a313b733a343a2275736572223b693a323b733a313a2230223b693a333b733a343a22256d6170223b7d7d7d, '', 'user_access', 0x613a313a7b693a303b733a31363a2261646d696e6973746572207573657273223b7d, 'drupal_get_form', 0x613a323a7b693a303b733a32383a226669656c645f75695f6669656c645f73657474696e67735f666f726d223b693a313b693a353b7d, '', 125, 7, 1, 'admin/config/people/accounts/fields/%', 'admin/config/people/accounts/fields/%', 'Field settings', 't', '', '', 'a:0:{}', 132, '', '', 0, 'modules/field_ui/field_ui.admin.inc');
INSERT INTO `menu_router` VALUES('admin/config/people/accounts/fields/%/widget-type', 0x613a313a7b693a353b613a313a7b733a31383a226669656c645f75695f6d656e755f6c6f6164223b613a343a7b693a303b733a343a2275736572223b693a313b733a343a2275736572223b693a323b733a313a2230223b693a333b733a343a22256d6170223b7d7d7d, '', 'user_access', 0x613a313a7b693a303b733a31363a2261646d696e6973746572207573657273223b7d, 'drupal_get_form', 0x613a323a7b693a303b733a32353a226669656c645f75695f7769646765745f747970655f666f726d223b693a313b693a353b7d, '', 125, 7, 1, 'admin/config/people/accounts/fields/%', 'admin/config/people/accounts/fields/%', 'Widget type', 't', '', '', 'a:0:{}', 132, '', '', 0, 'modules/field_ui/field_ui.admin.inc');
INSERT INTO `menu_router` VALUES('admin/config/people/accounts/groups/%/delete', 0x613a313a7b693a353b613a313a7b733a32313a226669656c645f67726f75705f6d656e755f6c6f6164223b613a343a7b693a303b733a343a2275736572223b693a313b733a343a2275736572223b693a323b733a313a2230223b693a333b733a343a22256d6170223b7d7d7d, '', 'user_access', 0x613a313a7b693a303b733a31363a2261646d696e6973746572207573657273223b7d, 'drupal_get_form', 0x613a323a7b693a303b733a32333a226669656c645f67726f75705f64656c6574655f666f726d223b693a313b693a353b7d, '', 125, 7, 0, '', 'admin/config/people/accounts/groups/%/delete', 'Delete', 't', '', '', 'a:0:{}', 0, '', '', 0, 'sites/all/modules/field_group/field_group.field_ui.inc');
INSERT INTO `menu_router` VALUES('admin/config/people/accounts/settings', '', '', 'user_access', 0x613a313a7b693a303b733a31363a2261646d696e6973746572207573657273223b7d, 'drupal_get_form', 0x613a313a7b693a303b733a31393a22757365725f61646d696e5f73657474696e6773223b7d, '', 31, 5, 1, 'admin/config/people/accounts', 'admin/config/people/accounts', 'Settings', 't', '', '', 'a:0:{}', 140, '', '', -10, 'modules/user/user.admin.inc');
INSERT INTO `menu_router` VALUES('admin/config/people/ip-blocking', '', '', 'user_access', 0x613a313a7b693a303b733a31383a22626c6f636b20495020616464726573736573223b7d, 'system_ip_blocking', 0x613a303a7b7d, '', 15, 4, 0, '', 'admin/config/people/ip-blocking', 'IP address blocking', 't', '', '', 'a:0:{}', 6, 'Manage blocked IP addresses.', '', 10, 'modules/system/system.admin.inc');
INSERT INTO `menu_router` VALUES('admin/config/people/ip-blocking/delete/%', 0x613a313a7b693a353b733a31353a22626c6f636b65645f69705f6c6f6164223b7d, '', 'user_access', 0x613a313a7b693a303b733a31383a22626c6f636b20495020616464726573736573223b7d, 'drupal_get_form', 0x613a323a7b693a303b733a32353a2273797374656d5f69705f626c6f636b696e675f64656c657465223b693a313b693a353b7d, '', 62, 6, 0, '', 'admin/config/people/ip-blocking/delete/%', 'Delete IP address', 't', '', '', 'a:0:{}', 6, '', '', 0, 'modules/system/system.admin.inc');
INSERT INTO `menu_router` VALUES('admin/config/regional', '', '', 'user_access', 0x613a313a7b693a303b733a32373a226163636573732061646d696e697374726174696f6e207061676573223b7d, 'system_admin_menu_block_page', 0x613a303a7b7d, '', 7, 3, 0, '', 'admin/config/regional', 'Regional and language', 't', '', '', 'a:0:{}', 6, 'Regional settings, localization and translation.', 'left', -5, 'modules/system/system.admin.inc');
INSERT INTO `menu_router` VALUES('admin/config/regional/date-time', '', '', 'user_access', 0x613a313a7b693a303b733a32393a2261646d696e6973746572207369746520636f6e66696775726174696f6e223b7d, 'drupal_get_form', 0x613a313a7b693a303b733a32353a2273797374656d5f646174655f74696d655f73657474696e6773223b7d, '', 15, 4, 0, '', 'admin/config/regional/date-time', 'Date and time', 't', '', '', 'a:0:{}', 6, 'Configure display formats for date and time.', '', -15, 'modules/system/system.admin.inc');
INSERT INTO `menu_router` VALUES('admin/config/regional/date-time/formats', '', '', 'user_access', 0x613a313a7b693a303b733a32393a2261646d696e6973746572207369746520636f6e66696775726174696f6e223b7d, 'system_date_time_formats', 0x613a303a7b7d, '', 31, 5, 1, 'admin/config/regional/date-time', 'admin/config/regional/date-time', 'Formats', 't', '', '', 'a:0:{}', 132, 'Configure display format strings for date and time.', '', -9, 'modules/system/system.admin.inc');
INSERT INTO `menu_router` VALUES('admin/config/regional/date-time/formats/%/delete', 0x613a313a7b693a353b4e3b7d, '', 'user_access', 0x613a313a7b693a303b733a32393a2261646d696e6973746572207369746520636f6e66696775726174696f6e223b7d, 'drupal_get_form', 0x613a323a7b693a303b733a33303a2273797374656d5f646174655f64656c6574655f666f726d61745f666f726d223b693a313b693a353b7d, '', 125, 7, 0, '', 'admin/config/regional/date-time/formats/%/delete', 'Delete date format', 't', '', '', 'a:0:{}', 6, 'Allow users to delete a configured date format.', '', 0, 'modules/system/system.admin.inc');
INSERT INTO `menu_router` VALUES('admin/config/regional/date-time/formats/%/edit', 0x613a313a7b693a353b4e3b7d, '', 'user_access', 0x613a313a7b693a303b733a32393a2261646d696e6973746572207369746520636f6e66696775726174696f6e223b7d, 'drupal_get_form', 0x613a323a7b693a303b733a33343a2273797374656d5f636f6e6669677572655f646174655f666f726d6174735f666f726d223b693a313b693a353b7d, '', 125, 7, 0, '', 'admin/config/regional/date-time/formats/%/edit', 'Edit date format', 't', '', '', 'a:0:{}', 6, 'Allow users to edit a configured date format.', '', 0, 'modules/system/system.admin.inc');
INSERT INTO `menu_router` VALUES('admin/config/regional/date-time/formats/add', '', '', 'user_access', 0x613a313a7b693a303b733a32393a2261646d696e6973746572207369746520636f6e66696775726174696f6e223b7d, 'drupal_get_form', 0x613a313a7b693a303b733a33343a2273797374656d5f636f6e6669677572655f646174655f666f726d6174735f666f726d223b7d, '', 63, 6, 1, 'admin/config/regional/date-time/formats', 'admin/config/regional/date-time', 'Add format', 't', '', '', 'a:0:{}', 388, 'Allow users to add additional date formats.', '', -10, 'modules/system/system.admin.inc');
INSERT INTO `menu_router` VALUES('admin/config/regional/date-time/formats/lookup', '', '', 'user_access', 0x613a313a7b693a303b733a32393a2261646d696e6973746572207369746520636f6e66696775726174696f6e223b7d, 'system_date_time_lookup', 0x613a303a7b7d, '', 63, 6, 0, '', 'admin/config/regional/date-time/formats/lookup', 'Date and time lookup', 't', '', '', 'a:0:{}', 0, '', '', 0, 'modules/system/system.admin.inc');
INSERT INTO `menu_router` VALUES('admin/config/regional/date-time/types', '', '', 'user_access', 0x613a313a7b693a303b733a32393a2261646d696e6973746572207369746520636f6e66696775726174696f6e223b7d, 'drupal_get_form', 0x613a313a7b693a303b733a32353a2273797374656d5f646174655f74696d655f73657474696e6773223b7d, '', 31, 5, 1, 'admin/config/regional/date-time', 'admin/config/regional/date-time', 'Types', 't', '', '', 'a:0:{}', 140, 'Configure display formats for date and time.', '', -10, 'modules/system/system.admin.inc');
INSERT INTO `menu_router` VALUES('admin/config/regional/date-time/types/%/delete', 0x613a313a7b693a353b4e3b7d, '', 'user_access', 0x613a313a7b693a303b733a32393a2261646d696e6973746572207369746520636f6e66696775726174696f6e223b7d, 'drupal_get_form', 0x613a323a7b693a303b733a33353a2273797374656d5f64656c6574655f646174655f666f726d61745f747970655f666f726d223b693a313b693a353b7d, '', 125, 7, 0, '', 'admin/config/regional/date-time/types/%/delete', 'Delete date type', 't', '', '', 'a:0:{}', 6, 'Allow users to delete a configured date type.', '', 0, 'modules/system/system.admin.inc');
INSERT INTO `menu_router` VALUES('admin/config/regional/date-time/types/add', '', '', 'user_access', 0x613a313a7b693a303b733a32393a2261646d696e6973746572207369746520636f6e66696775726174696f6e223b7d, 'drupal_get_form', 0x613a313a7b693a303b733a33323a2273797374656d5f6164645f646174655f666f726d61745f747970655f666f726d223b7d, '', 63, 6, 1, 'admin/config/regional/date-time/types', 'admin/config/regional/date-time', 'Add date type', 't', '', '', 'a:0:{}', 388, 'Add new date type.', '', -10, 'modules/system/system.admin.inc');
INSERT INTO `menu_router` VALUES('admin/config/regional/settings', '', '', 'user_access', 0x613a313a7b693a303b733a32393a2261646d696e6973746572207369746520636f6e66696775726174696f6e223b7d, 'drupal_get_form', 0x613a313a7b693a303b733a32343a2273797374656d5f726567696f6e616c5f73657474696e6773223b7d, '', 15, 4, 0, '', 'admin/config/regional/settings', 'Regional settings', 't', '', '', 'a:0:{}', 6, 'Settings for the site''s default time zone and country.', '', -20, 'modules/system/system.admin.inc');
INSERT INTO `menu_router` VALUES('admin/config/search', '', '', 'user_access', 0x613a313a7b693a303b733a32373a226163636573732061646d696e697374726174696f6e207061676573223b7d, 'system_admin_menu_block_page', 0x613a303a7b7d, '', 7, 3, 0, '', 'admin/config/search', 'Search and metadata', 't', '', '', 'a:0:{}', 6, 'Local site search, metadata and SEO.', 'left', -10, 'modules/system/system.admin.inc');
INSERT INTO `menu_router` VALUES('admin/config/search/clean-urls', '', '', 'user_access', 0x613a313a7b693a303b733a32393a2261646d696e6973746572207369746520636f6e66696775726174696f6e223b7d, 'drupal_get_form', 0x613a313a7b693a303b733a32353a2273797374656d5f636c65616e5f75726c5f73657474696e6773223b7d, '', 15, 4, 0, '', 'admin/config/search/clean-urls', 'Clean URLs', 't', '', '', 'a:0:{}', 6, 'Enable or disable clean URLs for your site.', '', 5, 'modules/system/system.admin.inc');
INSERT INTO `menu_router` VALUES('admin/config/search/clean-urls/check', '', '', '1', 0x613a303a7b7d, 'drupal_json_output', 0x613a313a7b693a303b613a313a7b733a363a22737461747573223b623a313b7d7d, '', 31, 5, 0, '', 'admin/config/search/clean-urls/check', 'Clean URL check', 't', '', '', 'a:0:{}', 0, '', '', 0, 'modules/system/system.admin.inc');
INSERT INTO `menu_router` VALUES('admin/config/search/path', '', '', 'user_access', 0x613a313a7b693a303b733a32323a2261646d696e69737465722075726c20616c6961736573223b7d, 'path_admin_overview', 0x613a303a7b7d, '', 15, 4, 0, '', 'admin/config/search/path', 'URL aliases', 't', '', '', 'a:0:{}', 6, 'Change your site''s URL paths by aliasing them.', '', -5, 'modules/path/path.admin.inc');
INSERT INTO `menu_router` VALUES('admin/config/search/path/add', '', '', 'user_access', 0x613a313a7b693a303b733a32323a2261646d696e69737465722075726c20616c6961736573223b7d, 'path_admin_edit', 0x613a303a7b7d, '', 31, 5, 1, 'admin/config/search/path', 'admin/config/search/path', 'Add alias', 't', '', '', 'a:0:{}', 388, '', '', 0, 'modules/path/path.admin.inc');
INSERT INTO `menu_router` VALUES('admin/config/search/path/delete/%', 0x613a313a7b693a353b733a393a22706174685f6c6f6164223b7d, '', 'user_access', 0x613a313a7b693a303b733a32323a2261646d696e69737465722075726c20616c6961736573223b7d, 'drupal_get_form', 0x613a323a7b693a303b733a32353a22706174685f61646d696e5f64656c6574655f636f6e6669726d223b693a313b693a353b7d, '', 62, 6, 0, '', 'admin/config/search/path/delete/%', 'Delete alias', 't', '', '', 'a:0:{}', 6, '', '', 0, 'modules/path/path.admin.inc');
INSERT INTO `menu_router` VALUES('admin/config/search/path/edit/%', 0x613a313a7b693a353b733a393a22706174685f6c6f6164223b7d, '', 'user_access', 0x613a313a7b693a303b733a32323a2261646d696e69737465722075726c20616c6961736573223b7d, 'path_admin_edit', 0x613a313a7b693a303b693a353b7d, '', 62, 6, 0, '', 'admin/config/search/path/edit/%', 'Edit alias', 't', '', '', 'a:0:{}', 6, '', '', 0, 'modules/path/path.admin.inc');
INSERT INTO `menu_router` VALUES('admin/config/search/path/list', '', '', 'user_access', 0x613a313a7b693a303b733a32323a2261646d696e69737465722075726c20616c6961736573223b7d, 'path_admin_overview', 0x613a303a7b7d, '', 31, 5, 1, 'admin/config/search/path', 'admin/config/search/path', 'List', 't', '', '', 'a:0:{}', 140, '', '', -10, 'modules/path/path.admin.inc');
INSERT INTO `menu_router` VALUES('admin/config/search/settings', '', '', 'user_access', 0x613a313a7b693a303b733a31373a2261646d696e697374657220736561726368223b7d, 'drupal_get_form', 0x613a313a7b693a303b733a32313a227365617263685f61646d696e5f73657474696e6773223b7d, '', 15, 4, 0, '', 'admin/config/search/settings', 'Search settings', 't', '', '', 'a:0:{}', 6, 'Configure relevance settings for search and other indexing options.', '', -10, 'modules/search/search.admin.inc');
INSERT INTO `menu_router` VALUES('admin/config/search/settings/reindex', '', '', 'user_access', 0x613a313a7b693a303b733a31373a2261646d696e697374657220736561726368223b7d, 'drupal_get_form', 0x613a313a7b693a303b733a32323a227365617263685f7265696e6465785f636f6e6669726d223b7d, '', 31, 5, 0, '', 'admin/config/search/settings/reindex', 'Clear index', 't', '', '', 'a:0:{}', 4, '', '', 0, 'modules/search/search.admin.inc');
INSERT INTO `menu_router` VALUES('admin/config/services', '', '', 'user_access', 0x613a313a7b693a303b733a32373a226163636573732061646d696e697374726174696f6e207061676573223b7d, 'system_admin_menu_block_page', 0x613a303a7b7d, '', 7, 3, 0, '', 'admin/config/services', 'Web services', 't', '', '', 'a:0:{}', 6, 'Tools related to web services.', 'right', 0, 'modules/system/system.admin.inc');
INSERT INTO `menu_router` VALUES('admin/config/services/rss-publishing', '', '', 'user_access', 0x613a313a7b693a303b733a32393a2261646d696e6973746572207369746520636f6e66696775726174696f6e223b7d, 'drupal_get_form', 0x613a313a7b693a303b733a32353a2273797374656d5f7273735f66656564735f73657474696e6773223b7d, '', 15, 4, 0, '', 'admin/config/services/rss-publishing', 'RSS publishing', 't', '', '', 'a:0:{}', 6, 'Configure the site description, the number of items per feed and whether feeds should be titles/teasers/full-text.', '', 0, 'modules/system/system.admin.inc');
INSERT INTO `menu_router` VALUES('admin/config/system', '', '', 'user_access', 0x613a313a7b693a303b733a32373a226163636573732061646d696e697374726174696f6e207061676573223b7d, 'system_admin_menu_block_page', 0x613a303a7b7d, '', 7, 3, 0, '', 'admin/config/system', 'System', 't', '', '', 'a:0:{}', 6, 'General system related configuration.', 'right', -20, 'modules/system/system.admin.inc');
INSERT INTO `menu_router` VALUES('admin/config/system/actions', '', '', 'user_access', 0x613a313a7b693a303b733a31383a2261646d696e697374657220616374696f6e73223b7d, 'system_actions_manage', 0x613a303a7b7d, '', 15, 4, 0, '', 'admin/config/system/actions', 'Actions', 't', '', '', 'a:0:{}', 6, 'Manage the actions defined for your site.', '', 0, 'modules/system/system.admin.inc');
INSERT INTO `menu_router` VALUES('admin/config/system/actions/configure', '', '', 'user_access', 0x613a313a7b693a303b733a31383a2261646d696e697374657220616374696f6e73223b7d, 'drupal_get_form', 0x613a313a7b693a303b733a32343a2273797374656d5f616374696f6e735f636f6e666967757265223b7d, '', 31, 5, 0, '', 'admin/config/system/actions/configure', 'Configure an advanced action', 't', '', '', 'a:0:{}', 4, '', '', 0, 'modules/system/system.admin.inc');
INSERT INTO `menu_router` VALUES('admin/config/system/actions/delete/%', 0x613a313a7b693a353b733a31323a22616374696f6e735f6c6f6164223b7d, '', 'user_access', 0x613a313a7b693a303b733a31383a2261646d696e697374657220616374696f6e73223b7d, 'drupal_get_form', 0x613a323a7b693a303b733a32363a2273797374656d5f616374696f6e735f64656c6574655f666f726d223b693a313b693a353b7d, '', 62, 6, 0, '', 'admin/config/system/actions/delete/%', 'Delete action', 't', '', '', 'a:0:{}', 6, 'Delete an action.', '', 0, 'modules/system/system.admin.inc');
INSERT INTO `menu_router` VALUES('admin/config/system/actions/manage', '', '', 'user_access', 0x613a313a7b693a303b733a31383a2261646d696e697374657220616374696f6e73223b7d, 'system_actions_manage', 0x613a303a7b7d, '', 31, 5, 1, 'admin/config/system/actions', 'admin/config/system/actions', 'Manage actions', 't', '', '', 'a:0:{}', 140, 'Manage the actions defined for your site.', '', -2, 'modules/system/system.admin.inc');
INSERT INTO `menu_router` VALUES('admin/config/system/actions/orphan', '', '', 'user_access', 0x613a313a7b693a303b733a31383a2261646d696e697374657220616374696f6e73223b7d, 'system_actions_remove_orphans', 0x613a303a7b7d, '', 31, 5, 0, '', 'admin/config/system/actions/orphan', 'Remove orphans', 't', '', '', 'a:0:{}', 0, '', '', 0, 'modules/system/system.admin.inc');
INSERT INTO `menu_router` VALUES('admin/config/system/cron', '', '', 'user_access', 0x613a313a7b693a303b733a32393a2261646d696e6973746572207369746520636f6e66696775726174696f6e223b7d, 'drupal_get_form', 0x613a313a7b693a303b733a32303a2273797374656d5f63726f6e5f73657474696e6773223b7d, '', 15, 4, 0, '', 'admin/config/system/cron', 'Cron', 't', '', '', 'a:0:{}', 6, 'Manage automatic site maintenance tasks.', '', 20, 'modules/system/system.admin.inc');
INSERT INTO `menu_router` VALUES('admin/config/system/googleqrcode', '', '', 'user_access', 0x613a313a7b693a303b733a32393a2261646d696e6973746572207369746520636f6e66696775726174696f6e223b7d, 'drupal_get_form', 0x613a313a7b693a303b733a33343a22676f6f676c655f71725f636f64655f61646d696e5f73657474696e67735f666f726d223b7d, '', 15, 4, 0, '', 'admin/config/system/googleqrcode', 'Google QR Code Generator', 't', '', '', 'a:0:{}', 6, 'Configuration for the Google QR Code Generator.', '', 0, '');
INSERT INTO `menu_router` VALUES('admin/config/system/site-information', '', '', 'user_access', 0x613a313a7b693a303b733a32393a2261646d696e6973746572207369746520636f6e66696775726174696f6e223b7d, 'drupal_get_form', 0x613a313a7b693a303b733a33323a2273797374656d5f736974655f696e666f726d6174696f6e5f73657474696e6773223b7d, '', 15, 4, 0, '', 'admin/config/system/site-information', 'Site information', 't', '', '', 'a:0:{}', 6, 'Change site name, e-mail address, slogan, default front page, and number of posts per page, error pages.', '', -20, 'modules/system/system.admin.inc');
INSERT INTO `menu_router` VALUES('admin/config/user-interface', '', '', 'user_access', 0x613a313a7b693a303b733a32373a226163636573732061646d696e697374726174696f6e207061676573223b7d, 'system_admin_menu_block_page', 0x613a303a7b7d, '', 7, 3, 0, '', 'admin/config/user-interface', 'User interface', 't', '', '', 'a:0:{}', 6, 'Tools that enhance the user interface.', 'right', -15, 'modules/system/system.admin.inc');
INSERT INTO `menu_router` VALUES('admin/config/user-interface/shortcut', '', '', 'user_access', 0x613a313a7b693a303b733a32303a2261646d696e69737465722073686f727463757473223b7d, 'shortcut_set_admin', 0x613a303a7b7d, '', 15, 4, 0, '', 'admin/config/user-interface/shortcut', 'Shortcuts', 't', '', '', 'a:0:{}', 6, 'Add and modify shortcut sets.', '', 0, 'modules/shortcut/shortcut.admin.inc');
INSERT INTO `menu_router` VALUES('admin/config/user-interface/shortcut/%', 0x613a313a7b693a343b733a31373a2273686f72746375745f7365745f6c6f6164223b7d, '', 'shortcut_set_edit_access', 0x613a313a7b693a303b693a343b7d, 'drupal_get_form', 0x613a323a7b693a303b733a32323a2273686f72746375745f7365745f637573746f6d697a65223b693a313b693a343b7d, '', 30, 5, 0, '', 'admin/config/user-interface/shortcut/%', 'Edit shortcuts', 'shortcut_set_title_callback', 'a:1:{i:0;i:4;}', '', 'a:0:{}', 6, '', '', 0, 'modules/shortcut/shortcut.admin.inc');
INSERT INTO `menu_router` VALUES('admin/config/user-interface/shortcut/%/add-link', 0x613a313a7b693a343b733a31373a2273686f72746375745f7365745f6c6f6164223b7d, '', 'shortcut_set_edit_access', 0x613a313a7b693a303b693a343b7d, 'drupal_get_form', 0x613a323a7b693a303b733a31373a2273686f72746375745f6c696e6b5f616464223b693a313b693a343b7d, '', 61, 6, 1, 'admin/config/user-interface/shortcut/%', 'admin/config/user-interface/shortcut/%', 'Add shortcut', 't', '', '', 'a:0:{}', 388, '', '', 0, 'modules/shortcut/shortcut.admin.inc');
INSERT INTO `menu_router` VALUES('admin/config/user-interface/shortcut/%/add-link-inline', 0x613a313a7b693a343b733a31373a2273686f72746375745f7365745f6c6f6164223b7d, '', 'shortcut_set_edit_access', 0x613a313a7b693a303b693a343b7d, 'shortcut_link_add_inline', 0x613a313a7b693a303b693a343b7d, '', 61, 6, 0, '', 'admin/config/user-interface/shortcut/%/add-link-inline', 'Add shortcut', 't', '', '', 'a:0:{}', 0, '', '', 0, 'modules/shortcut/shortcut.admin.inc');
INSERT INTO `menu_router` VALUES('admin/config/user-interface/shortcut/%/delete', 0x613a313a7b693a343b733a31373a2273686f72746375745f7365745f6c6f6164223b7d, '', 'shortcut_set_delete_access', 0x613a313a7b693a303b693a343b7d, 'drupal_get_form', 0x613a323a7b693a303b733a32343a2273686f72746375745f7365745f64656c6574655f666f726d223b693a313b693a343b7d, '', 61, 6, 0, '', 'admin/config/user-interface/shortcut/%/delete', 'Delete shortcut set', 't', '', '', 'a:0:{}', 6, '', '', 0, 'modules/shortcut/shortcut.admin.inc');
INSERT INTO `menu_router` VALUES('admin/config/user-interface/shortcut/%/edit', 0x613a313a7b693a343b733a31373a2273686f72746375745f7365745f6c6f6164223b7d, '', 'shortcut_set_edit_access', 0x613a313a7b693a303b693a343b7d, 'drupal_get_form', 0x613a323a7b693a303b733a32323a2273686f72746375745f7365745f656469745f666f726d223b693a313b693a343b7d, '', 61, 6, 1, 'admin/config/user-interface/shortcut/%', 'admin/config/user-interface/shortcut/%', 'Edit set name', 't', '', '', 'a:0:{}', 132, '', '', 10, 'modules/shortcut/shortcut.admin.inc');
INSERT INTO `menu_router` VALUES('admin/config/user-interface/shortcut/%/links', 0x613a313a7b693a343b733a31373a2273686f72746375745f7365745f6c6f6164223b7d, '', 'shortcut_set_edit_access', 0x613a313a7b693a303b693a343b7d, 'drupal_get_form', 0x613a323a7b693a303b733a32323a2273686f72746375745f7365745f637573746f6d697a65223b693a313b693a343b7d, '', 61, 6, 1, 'admin/config/user-interface/shortcut/%', 'admin/config/user-interface/shortcut/%', 'List links', 't', '', '', 'a:0:{}', 140, '', '', 0, 'modules/shortcut/shortcut.admin.inc');
INSERT INTO `menu_router` VALUES('admin/config/user-interface/shortcut/add-set', '', '', 'user_access', 0x613a313a7b693a303b733a32303a2261646d696e69737465722073686f727463757473223b7d, 'drupal_get_form', 0x613a313a7b693a303b733a32313a2273686f72746375745f7365745f6164645f666f726d223b7d, '', 31, 5, 1, 'admin/config/user-interface/shortcut', 'admin/config/user-interface/shortcut', 'Add shortcut set', 't', '', '', 'a:0:{}', 388, '', '', 0, 'modules/shortcut/shortcut.admin.inc');
INSERT INTO `menu_router` VALUES('admin/config/user-interface/shortcut/link/%', 0x613a313a7b693a353b733a31343a226d656e755f6c696e6b5f6c6f6164223b7d, '', 'shortcut_link_access', 0x613a313a7b693a303b693a353b7d, 'drupal_get_form', 0x613a323a7b693a303b733a31383a2273686f72746375745f6c696e6b5f65646974223b693a313b693a353b7d, '', 62, 6, 0, '', 'admin/config/user-interface/shortcut/link/%', 'Edit shortcut', 't', '', '', 'a:0:{}', 6, '', '', 0, 'modules/shortcut/shortcut.admin.inc');
INSERT INTO `menu_router` VALUES('admin/config/user-interface/shortcut/link/%/delete', 0x613a313a7b693a353b733a31343a226d656e755f6c696e6b5f6c6f6164223b7d, '', 'shortcut_link_access', 0x613a313a7b693a303b693a353b7d, 'drupal_get_form', 0x613a323a7b693a303b733a32303a2273686f72746375745f6c696e6b5f64656c657465223b693a313b693a353b7d, '', 125, 7, 0, '', 'admin/config/user-interface/shortcut/link/%/delete', 'Delete shortcut', 't', '', '', 'a:0:{}', 6, '', '', 0, 'modules/shortcut/shortcut.admin.inc');
INSERT INTO `menu_router` VALUES('admin/config/workflow', '', '', 'user_access', 0x613a313a7b693a303b733a32373a226163636573732061646d696e697374726174696f6e207061676573223b7d, 'system_admin_menu_block_page', 0x613a303a7b7d, '', 7, 3, 0, '', 'admin/config/workflow', 'Workflow', 't', '', '', 'a:0:{}', 6, 'Content workflow, editorial workflow tools.', 'right', 5, 'modules/system/system.admin.inc');
INSERT INTO `menu_router` VALUES('admin/config/workflow/rules', '', '', 'user_access', 0x613a313a7b693a303b733a31363a2261646d696e69737465722072756c6573223b7d, 'drupal_get_form', 0x613a323a7b693a303b733a32393a2272756c65735f61646d696e5f7265616374696f6e5f6f76657276696577223b693a313b733a33363a2261646d696e2f636f6e6669672f776f726b666c6f772f72756c65732f7265616374696f6e223b7d, '', 15, 4, 0, '', 'admin/config/workflow/rules', 'Rules', 't', '', '', 'a:0:{}', 6, 'Manage reaction rules and rule components.', 'right', 0, 'sites/all/modules/rules/rules_admin/rules_admin.inc');
INSERT INTO `menu_router` VALUES('admin/config/workflow/rules/autocomplete_tags', '', '', 'user_access', 0x613a313a7b693a303b733a31363a2261646d696e69737465722072756c6573223b7d, 'rules_autocomplete_tags', 0x613a313a7b693a303b693a353b7d, '', 31, 5, 0, '', 'admin/config/workflow/rules/autocomplete_tags', 'Rules tags autocomplete', 't', '', '', 'a:0:{}', 0, '', '', 0, 'sites/all/modules/rules/ui/ui.forms.inc');
INSERT INTO `menu_router` VALUES('admin/config/workflow/rules/components', '', '', 'user_access', 0x613a313a7b693a303b733a31363a2261646d696e69737465722072756c6573223b7d, 'drupal_get_form', 0x613a323a7b693a303b733a33313a2272756c65735f61646d696e5f636f6d706f6e656e74735f6f76657276696577223b693a313b733a33383a2261646d696e2f636f6e6669672f776f726b666c6f772f72756c65732f636f6d706f6e656e7473223b7d, '', 31, 5, 1, 'admin/config/workflow/rules', 'admin/config/workflow/rules', 'Components', 't', '', '', 'a:0:{}', 132, '', '', 0, 'sites/all/modules/rules/rules_admin/rules_admin.inc');
INSERT INTO `menu_router` VALUES('admin/config/workflow/rules/components/add', '', '', 'user_access', 0x613a313a7b693a303b733a31363a2261646d696e69737465722072756c6573223b7d, 'drupal_get_form', 0x613a323a7b693a303b733a32353a2272756c65735f61646d696e5f6164645f636f6d706f6e656e74223b693a313b733a33383a2261646d696e2f636f6e6669672f776f726b666c6f772f72756c65732f636f6d706f6e656e7473223b7d, '', 63, 6, 1, 'admin/config/workflow/rules/components', 'admin/config/workflow/rules', 'Add new component', 't', '', '', 'a:0:{}', 388, '', '', 0, 'sites/all/modules/rules/rules_admin/rules_admin.inc');
INSERT INTO `menu_router` VALUES('admin/config/workflow/rules/components/import', '', '', 'user_access', 0x613a313a7b693a303b733a31363a2261646d696e69737465722072756c6573223b7d, 'drupal_get_form', 0x613a323a7b693a303b733a32303a2272756c65735f75695f696d706f72745f666f726d223b693a313b733a33383a2261646d696e2f636f6e6669672f776f726b666c6f772f72756c65732f636f6d706f6e656e7473223b7d, '', 63, 6, 1, 'admin/config/workflow/rules/components', 'admin/config/workflow/rules', 'Import component', 't', '', '', 'a:0:{}', 388, '', '', 0, 'sites/all/modules/rules/ui/ui.forms.inc');
INSERT INTO `menu_router` VALUES('admin/config/workflow/rules/components/manage/%', 0x613a313a7b693a363b733a31373a2272756c65735f636f6e6669675f6c6f6164223b7d, '', 'rules_config_access', 0x613a323a7b693a303b733a363a22757064617465223b693a313b693a363b7d, 'drupal_get_form', 0x613a333a7b693a303b733a33313a2272756c65735f75695f666f726d5f656469745f72756c65735f636f6e666967223b693a313b693a363b693a323b733a33383a2261646d696e2f636f6e6669672f776f726b666c6f772f72756c65732f636f6d706f6e656e7473223b7d, '', 126, 7, 0, '', 'admin/config/workflow/rules/components/manage/%', '', 'rules_get_title', 'a:2:{i:0;s:24:"Editing !plugin "!label"";i:1;i:6;}', '', 'a:0:{}', 4, '', '', 0, 'sites/all/modules/rules/ui/ui.forms.inc');
INSERT INTO `menu_router` VALUES('admin/config/workflow/rules/components/manage/%/%', 0x613a323a7b693a363b733a31373a2272756c65735f636f6e6669675f6c6f6164223b693a373b4e3b7d, '', 'rules_config_access', 0x613a323a7b693a303b733a363a22757064617465223b693a313b693a363b7d, 'drupal_get_form', 0x613a343a7b693a303b733a33373a2272756c65735f75695f666f726d5f72756c65735f636f6e6669675f636f6e6669726d5f6f70223b693a313b693a363b693a323b693a373b693a333b733a33383a2261646d696e2f636f6e6669672f776f726b666c6f772f72756c65732f636f6d706f6e656e7473223b7d, '', 252, 8, 0, '', 'admin/config/workflow/rules/components/manage/%/%', '', 't', '', '', 'a:0:{}', 6, '', '', 0, 'sites/all/modules/rules/ui/ui.forms.inc');
INSERT INTO `menu_router` VALUES('admin/config/workflow/rules/components/manage/%/add/%', 0x613a323a7b693a363b613a313a7b733a31373a2272756c65735f636f6e6669675f6c6f6164223b613a313a7b693a303b693a363b7d7d693a383b613a313a7b733a31383a2272756c65735f656c656d656e745f6c6f6164223b613a313a7b693a303b693a363b7d7d7d, '', 'rules_config_access', 0x613a323a7b693a303b733a363a22757064617465223b693a313b693a363b7d, 'drupal_get_form', 0x613a353a7b693a303b733a32303a2272756c65735f75695f6164645f656c656d656e74223b693a313b693a363b693a323b693a393b693a333b693a383b693a343b733a33383a2261646d696e2f636f6e6669672f776f726b666c6f772f72756c65732f636f6d706f6e656e7473223b7d, '', 506, 9, 0, '', 'admin/config/workflow/rules/components/manage/%/add/%', '', 'rules_menu_add_element_title', 'a:1:{i:0;a:1:{i:0;i:9;}}', '', 'a:0:{}', 6, '', '', 0, 'sites/all/modules/rules/ui/ui.forms.inc');
INSERT INTO `menu_router` VALUES('admin/config/workflow/rules/components/manage/%/add/event', 0x613a313a7b693a363b613a313a7b733a31373a2272756c65735f636f6e6669675f6c6f6164223b613a313a7b693a303b693a363b7d7d7d, '', 'rules_config_access', 0x613a323a7b693a303b733a363a22757064617465223b693a313b693a363b7d, 'drupal_get_form', 0x613a333a7b693a303b733a31383a2272756c65735f75695f6164645f6576656e74223b693a313b693a363b693a323b733a33383a2261646d696e2f636f6e6669672f776f726b666c6f772f72756c65732f636f6d706f6e656e7473223b7d, '', 507, 9, 0, '', 'admin/config/workflow/rules/components/manage/%/add/event', '', 'rules_get_title', 'a:2:{i:0;s:32:"Adding event to !plugin "!label"";i:1;i:6;}', '', 'a:0:{}', 6, '', '', 0, 'sites/all/modules/rules/ui/ui.forms.inc');
INSERT INTO `menu_router` VALUES('admin/config/workflow/rules/components/manage/%/autocomplete', 0x613a313a7b693a363b733a31373a2272756c65735f636f6e6669675f6c6f6164223b7d, '', 'rules_config_access', 0x613a323a7b693a303b733a363a22757064617465223b693a313b693a363b7d, 'rules_ui_form_data_selection_auto_completion', 0x613a333a7b693a303b693a383b693a313b693a393b693a323b693a31303b7d, '', 253, 8, 0, '', 'admin/config/workflow/rules/components/manage/%/autocomplete', '', 't', '', '', 'a:0:{}', 0, '', '', 0, 'sites/all/modules/rules/ui/ui.forms.inc');
INSERT INTO `menu_router` VALUES('admin/config/workflow/rules/components/manage/%/clone', 0x613a313a7b693a363b733a31373a2272756c65735f636f6e6669675f6c6f6164223b7d, '', 'rules_config_access', 0x613a323a7b693a303b733a363a22757064617465223b693a313b693a363b7d, 'drupal_get_form', 0x613a333a7b693a303b733a33323a2272756c65735f75695f666f726d5f636c6f6e655f72756c65735f636f6e666967223b693a313b693a363b693a323b733a33383a2261646d696e2f636f6e6669672f776f726b666c6f772f72756c65732f636f6d706f6e656e7473223b7d, '', 253, 8, 0, '', 'admin/config/workflow/rules/components/manage/%/clone', '', 'rules_get_title', 'a:2:{i:0;s:24:"Cloning !plugin "!label"";i:1;i:6;}', '', 'a:0:{}', 6, '', '', 0, 'sites/all/modules/rules/ui/ui.forms.inc');
INSERT INTO `menu_router` VALUES('admin/config/workflow/rules/components/manage/%/delete/%', 0x613a323a7b693a363b613a313a7b733a31373a2272756c65735f636f6e6669675f6c6f6164223b613a313a7b693a303b693a363b7d7d693a383b613a313a7b733a31383a2272756c65735f656c656d656e745f6c6f6164223b613a313a7b693a303b693a363b7d7d7d, '', 'rules_config_access', 0x613a323a7b693a303b733a363a22757064617465223b693a313b693a363b7d, 'drupal_get_form', 0x613a343a7b693a303b733a32333a2272756c65735f75695f64656c6574655f656c656d656e74223b693a313b693a363b693a323b693a383b693a333b733a33383a2261646d696e2f636f6e6669672f776f726b666c6f772f72756c65732f636f6d706f6e656e7473223b7d, '', 506, 9, 0, '', 'admin/config/workflow/rules/components/manage/%/delete/%', '', 'rules_get_title', 'a:2:{i:0;s:24:"Editing !plugin "!label"";i:1;i:8;}', '', 'a:0:{}', 6, '', '', 0, 'sites/all/modules/rules/ui/ui.forms.inc');
INSERT INTO `menu_router` VALUES('admin/config/workflow/rules/components/manage/%/delete/event', 0x613a313a7b693a363b733a31373a2272756c65735f636f6e6669675f6c6f6164223b7d, '', 'rules_config_access', 0x613a323a7b693a303b733a363a22757064617465223b693a313b693a363b7d, 'drupal_get_form', 0x613a343a7b693a303b733a32313a2272756c65735f75695f72656d6f76655f6576656e74223b693a313b693a363b693a323b693a393b693a333b733a33383a2261646d696e2f636f6e6669672f776f726b666c6f772f72756c65732f636f6d706f6e656e7473223b7d, '', 507, 9, 0, '', 'admin/config/workflow/rules/components/manage/%/delete/event', 'Remove event', 't', '', '', 'a:0:{}', 6, 'Remove an event from a reaction rule.', '', 0, 'sites/all/modules/rules/ui/ui.forms.inc');
INSERT INTO `menu_router` VALUES('admin/config/workflow/rules/components/manage/%/edit/%', 0x613a323a7b693a363b613a313a7b733a31373a2272756c65735f636f6e6669675f6c6f6164223b613a313a7b693a303b693a363b7d7d693a383b613a313a7b733a31383a2272756c65735f656c656d656e745f6c6f6164223b613a313a7b693a303b693a363b7d7d7d, '', 'rules_config_access', 0x613a323a7b693a303b733a363a22757064617465223b693a313b693a363b7d, 'drupal_get_form', 0x613a343a7b693a303b733a32313a2272756c65735f75695f656469745f656c656d656e74223b693a313b693a363b693a323b693a383b693a333b733a33383a2261646d696e2f636f6e6669672f776f726b666c6f772f72756c65732f636f6d706f6e656e7473223b7d, '', 506, 9, 0, '', 'admin/config/workflow/rules/components/manage/%/edit/%', '', 'rules_get_title', 'a:2:{i:0;s:24:"Editing !plugin "!label"";i:1;i:8;}', '', 'a:0:{}', 6, '', '', 0, 'sites/all/modules/rules/ui/ui.forms.inc');
INSERT INTO `menu_router` VALUES('admin/config/workflow/rules/components/manage/%/execute', 0x613a313a7b693a363b733a31373a2272756c65735f636f6e6669675f6c6f6164223b7d, '', 'rules_config_access', 0x613a323a7b693a303b733a363a22757064617465223b693a313b693a363b7d, 'drupal_get_form', 0x613a333a7b693a303b733a33343a2272756c65735f75695f666f726d5f657865637574655f72756c65735f636f6e666967223b693a313b693a363b693a323b733a33383a2261646d696e2f636f6e6669672f776f726b666c6f772f72756c65732f636f6d706f6e656e7473223b7d, '', 253, 8, 0, '', 'admin/config/workflow/rules/components/manage/%/execute', '', 'rules_get_title', 'a:2:{i:0;s:26:"Executing !plugin "!label"";i:1;i:6;}', '', 'a:0:{}', 6, '', '', 0, 'sites/all/modules/rules/ui/ui.forms.inc');
INSERT INTO `menu_router` VALUES('admin/config/workflow/rules/components/manage/%/export', 0x613a313a7b693a363b733a31373a2272756c65735f636f6e6669675f6c6f6164223b7d, '', 'rules_config_access', 0x613a323a7b693a303b733a343a2276696577223b693a313b693a363b7d, 'drupal_get_form', 0x613a333a7b693a303b733a33333a2272756c65735f75695f666f726d5f6578706f72745f72756c65735f636f6e666967223b693a313b693a363b693a323b733a33383a2261646d696e2f636f6e6669672f776f726b666c6f772f72756c65732f636f6d706f6e656e7473223b7d, '', 253, 8, 0, '', 'admin/config/workflow/rules/components/manage/%/export', '', 'rules_get_title', 'a:2:{i:0;s:26:"Export of !plugin "!label"";i:1;i:6;}', '', 'a:0:{}', 6, '', '', 0, 'sites/all/modules/rules/ui/ui.forms.inc');
INSERT INTO `menu_router` VALUES('admin/config/workflow/rules/components/manage/%/schedule', 0x613a313a7b693a363b733a31373a2272756c65735f636f6e6669675f6c6f6164223b7d, '', 'rules_config_access', 0x613a323a7b693a303b733a363a22757064617465223b693a313b693a363b7d, 'drupal_get_form', 0x613a333a7b693a303b733a32393a2272756c65735f7363686564756c65725f7363686564756c655f666f726d223b693a313b693a363b693a323b733a33383a2261646d696e2f636f6e6669672f776f726b666c6f772f72756c65732f636f6d706f6e656e7473223b7d, '', 253, 8, 0, '', 'admin/config/workflow/rules/components/manage/%/schedule', '', 'rules_get_title', 'a:2:{i:0;s:25:"Schedule !plugin "!label"";i:1;i:6;}', '', 'a:0:{}', 6, '', '', 0, 'sites/all/modules/rules/rules_scheduler/rules_scheduler.admin.inc');
INSERT INTO `menu_router` VALUES('admin/config/workflow/rules/reaction', '', '', 'user_access', 0x613a313a7b693a303b733a31363a2261646d696e69737465722072756c6573223b7d, 'drupal_get_form', 0x613a323a7b693a303b733a32393a2272756c65735f61646d696e5f7265616374696f6e5f6f76657276696577223b693a313b733a33363a2261646d696e2f636f6e6669672f776f726b666c6f772f72756c65732f7265616374696f6e223b7d, '', 31, 5, 1, 'admin/config/workflow/rules', 'admin/config/workflow/rules', 'Rules', 't', '', '', 'a:0:{}', 140, '', '', -1, 'sites/all/modules/rules/rules_admin/rules_admin.inc');
INSERT INTO `menu_router` VALUES('admin/config/workflow/rules/reaction/add', '', '', 'user_access', 0x613a313a7b693a303b733a31363a2261646d696e69737465722072756c6573223b7d, 'drupal_get_form', 0x613a323a7b693a303b733a32393a2272756c65735f61646d696e5f6164645f7265616374696f6e5f72756c65223b693a313b733a33363a2261646d696e2f636f6e6669672f776f726b666c6f772f72756c65732f7265616374696f6e223b7d, '', 63, 6, 1, 'admin/config/workflow/rules/reaction', 'admin/config/workflow/rules', 'Add new rule', 't', '', '', 'a:0:{}', 388, '', '', 0, 'sites/all/modules/rules/rules_admin/rules_admin.inc');
INSERT INTO `menu_router` VALUES('admin/config/workflow/rules/reaction/import', '', '', 'user_access', 0x613a313a7b693a303b733a31363a2261646d696e69737465722072756c6573223b7d, 'drupal_get_form', 0x613a323a7b693a303b733a32303a2272756c65735f75695f696d706f72745f666f726d223b693a313b733a33363a2261646d696e2f636f6e6669672f776f726b666c6f772f72756c65732f7265616374696f6e223b7d, '', 63, 6, 1, 'admin/config/workflow/rules/reaction', 'admin/config/workflow/rules', 'Import rule', 't', '', '', 'a:0:{}', 388, '', '', 0, 'sites/all/modules/rules/ui/ui.forms.inc');
INSERT INTO `menu_router` VALUES('admin/config/workflow/rules/reaction/manage/%', 0x613a313a7b693a363b733a31373a2272756c65735f636f6e6669675f6c6f6164223b7d, '', 'rules_config_access', 0x613a323a7b693a303b733a363a22757064617465223b693a313b693a363b7d, 'drupal_get_form', 0x613a333a7b693a303b733a33313a2272756c65735f75695f666f726d5f656469745f72756c65735f636f6e666967223b693a313b693a363b693a323b733a33363a2261646d696e2f636f6e6669672f776f726b666c6f772f72756c65732f7265616374696f6e223b7d, '', 126, 7, 0, '', 'admin/config/workflow/rules/reaction/manage/%', '', 'rules_get_title', 'a:2:{i:0;s:24:"Editing !plugin "!label"";i:1;i:6;}', '', 'a:0:{}', 4, '', '', 0, 'sites/all/modules/rules/ui/ui.forms.inc');
INSERT INTO `menu_router` VALUES('admin/config/workflow/rules/reaction/manage/%/%', 0x613a323a7b693a363b733a31373a2272756c65735f636f6e6669675f6c6f6164223b693a373b4e3b7d, '', 'rules_config_access', 0x613a323a7b693a303b733a363a22757064617465223b693a313b693a363b7d, 'drupal_get_form', 0x613a343a7b693a303b733a33373a2272756c65735f75695f666f726d5f72756c65735f636f6e6669675f636f6e6669726d5f6f70223b693a313b693a363b693a323b693a373b693a333b733a33363a2261646d696e2f636f6e6669672f776f726b666c6f772f72756c65732f7265616374696f6e223b7d, '', 252, 8, 0, '', 'admin/config/workflow/rules/reaction/manage/%/%', '', 't', '', '', 'a:0:{}', 6, '', '', 0, 'sites/all/modules/rules/ui/ui.forms.inc');
INSERT INTO `menu_router` VALUES('admin/config/workflow/rules/reaction/manage/%/add/%', 0x613a323a7b693a363b613a313a7b733a31373a2272756c65735f636f6e6669675f6c6f6164223b613a313a7b693a303b693a363b7d7d693a383b613a313a7b733a31383a2272756c65735f656c656d656e745f6c6f6164223b613a313a7b693a303b693a363b7d7d7d, '', 'rules_config_access', 0x613a323a7b693a303b733a363a22757064617465223b693a313b693a363b7d, 'drupal_get_form', 0x613a353a7b693a303b733a32303a2272756c65735f75695f6164645f656c656d656e74223b693a313b693a363b693a323b693a393b693a333b693a383b693a343b733a33363a2261646d696e2f636f6e6669672f776f726b666c6f772f72756c65732f7265616374696f6e223b7d, '', 506, 9, 0, '', 'admin/config/workflow/rules/reaction/manage/%/add/%', '', 'rules_menu_add_element_title', 'a:1:{i:0;a:1:{i:0;i:9;}}', '', 'a:0:{}', 6, '', '', 0, 'sites/all/modules/rules/ui/ui.forms.inc');
INSERT INTO `menu_router` VALUES('admin/config/workflow/rules/reaction/manage/%/add/event', 0x613a313a7b693a363b613a313a7b733a31373a2272756c65735f636f6e6669675f6c6f6164223b613a313a7b693a303b693a363b7d7d7d, '', 'rules_config_access', 0x613a323a7b693a303b733a363a22757064617465223b693a313b693a363b7d, 'drupal_get_form', 0x613a333a7b693a303b733a31383a2272756c65735f75695f6164645f6576656e74223b693a313b693a363b693a323b733a33363a2261646d696e2f636f6e6669672f776f726b666c6f772f72756c65732f7265616374696f6e223b7d, '', 507, 9, 0, '', 'admin/config/workflow/rules/reaction/manage/%/add/event', '', 'rules_get_title', 'a:2:{i:0;s:32:"Adding event to !plugin "!label"";i:1;i:6;}', '', 'a:0:{}', 6, '', '', 0, 'sites/all/modules/rules/ui/ui.forms.inc');
INSERT INTO `menu_router` VALUES('admin/config/workflow/rules/reaction/manage/%/autocomplete', 0x613a313a7b693a363b733a31373a2272756c65735f636f6e6669675f6c6f6164223b7d, '', 'rules_config_access', 0x613a323a7b693a303b733a363a22757064617465223b693a313b693a363b7d, 'rules_ui_form_data_selection_auto_completion', 0x613a333a7b693a303b693a383b693a313b693a393b693a323b693a31303b7d, '', 253, 8, 0, '', 'admin/config/workflow/rules/reaction/manage/%/autocomplete', '', 't', '', '', 'a:0:{}', 0, '', '', 0, 'sites/all/modules/rules/ui/ui.forms.inc');
INSERT INTO `menu_router` VALUES('admin/config/workflow/rules/reaction/manage/%/clone', 0x613a313a7b693a363b733a31373a2272756c65735f636f6e6669675f6c6f6164223b7d, '', 'rules_config_access', 0x613a323a7b693a303b733a363a22757064617465223b693a313b693a363b7d, 'drupal_get_form', 0x613a333a7b693a303b733a33323a2272756c65735f75695f666f726d5f636c6f6e655f72756c65735f636f6e666967223b693a313b693a363b693a323b733a33363a2261646d696e2f636f6e6669672f776f726b666c6f772f72756c65732f7265616374696f6e223b7d, '', 253, 8, 0, '', 'admin/config/workflow/rules/reaction/manage/%/clone', '', 'rules_get_title', 'a:2:{i:0;s:24:"Cloning !plugin "!label"";i:1;i:6;}', '', 'a:0:{}', 6, '', '', 0, 'sites/all/modules/rules/ui/ui.forms.inc');
INSERT INTO `menu_router` VALUES('admin/config/workflow/rules/reaction/manage/%/delete/%', 0x613a323a7b693a363b613a313a7b733a31373a2272756c65735f636f6e6669675f6c6f6164223b613a313a7b693a303b693a363b7d7d693a383b613a313a7b733a31383a2272756c65735f656c656d656e745f6c6f6164223b613a313a7b693a303b693a363b7d7d7d, '', 'rules_config_access', 0x613a323a7b693a303b733a363a22757064617465223b693a313b693a363b7d, 'drupal_get_form', 0x613a343a7b693a303b733a32333a2272756c65735f75695f64656c6574655f656c656d656e74223b693a313b693a363b693a323b693a383b693a333b733a33363a2261646d696e2f636f6e6669672f776f726b666c6f772f72756c65732f7265616374696f6e223b7d, '', 506, 9, 0, '', 'admin/config/workflow/rules/reaction/manage/%/delete/%', '', 'rules_get_title', 'a:2:{i:0;s:24:"Editing !plugin "!label"";i:1;i:8;}', '', 'a:0:{}', 6, '', '', 0, 'sites/all/modules/rules/ui/ui.forms.inc');
INSERT INTO `menu_router` VALUES('admin/config/workflow/rules/reaction/manage/%/delete/event', 0x613a313a7b693a363b733a31373a2272756c65735f636f6e6669675f6c6f6164223b7d, '', 'rules_config_access', 0x613a323a7b693a303b733a363a22757064617465223b693a313b693a363b7d, 'drupal_get_form', 0x613a343a7b693a303b733a32313a2272756c65735f75695f72656d6f76655f6576656e74223b693a313b693a363b693a323b693a393b693a333b733a33363a2261646d696e2f636f6e6669672f776f726b666c6f772f72756c65732f7265616374696f6e223b7d, '', 507, 9, 0, '', 'admin/config/workflow/rules/reaction/manage/%/delete/event', 'Remove event', 't', '', '', 'a:0:{}', 6, 'Remove an event from a reaction rule.', '', 0, 'sites/all/modules/rules/ui/ui.forms.inc');
INSERT INTO `menu_router` VALUES('admin/config/workflow/rules/reaction/manage/%/edit/%', 0x613a323a7b693a363b613a313a7b733a31373a2272756c65735f636f6e6669675f6c6f6164223b613a313a7b693a303b693a363b7d7d693a383b613a313a7b733a31383a2272756c65735f656c656d656e745f6c6f6164223b613a313a7b693a303b693a363b7d7d7d, '', 'rules_config_access', 0x613a323a7b693a303b733a363a22757064617465223b693a313b693a363b7d, 'drupal_get_form', 0x613a343a7b693a303b733a32313a2272756c65735f75695f656469745f656c656d656e74223b693a313b693a363b693a323b693a383b693a333b733a33363a2261646d696e2f636f6e6669672f776f726b666c6f772f72756c65732f7265616374696f6e223b7d, '', 506, 9, 0, '', 'admin/config/workflow/rules/reaction/manage/%/edit/%', '', 'rules_get_title', 'a:2:{i:0;s:24:"Editing !plugin "!label"";i:1;i:8;}', '', 'a:0:{}', 6, '', '', 0, 'sites/all/modules/rules/ui/ui.forms.inc');
INSERT INTO `menu_router` VALUES('admin/config/workflow/rules/reaction/manage/%/execute', 0x613a313a7b693a363b733a31373a2272756c65735f636f6e6669675f6c6f6164223b7d, '', 'rules_config_access', 0x613a323a7b693a303b733a363a22757064617465223b693a313b693a363b7d, 'drupal_get_form', 0x613a333a7b693a303b733a33343a2272756c65735f75695f666f726d5f657865637574655f72756c65735f636f6e666967223b693a313b693a363b693a323b733a33363a2261646d696e2f636f6e6669672f776f726b666c6f772f72756c65732f7265616374696f6e223b7d, '', 253, 8, 0, '', 'admin/config/workflow/rules/reaction/manage/%/execute', '', 'rules_get_title', 'a:2:{i:0;s:26:"Executing !plugin "!label"";i:1;i:6;}', '', 'a:0:{}', 6, '', '', 0, 'sites/all/modules/rules/ui/ui.forms.inc');
INSERT INTO `menu_router` VALUES('admin/config/workflow/rules/reaction/manage/%/export', 0x613a313a7b693a363b733a31373a2272756c65735f636f6e6669675f6c6f6164223b7d, '', 'rules_config_access', 0x613a323a7b693a303b733a343a2276696577223b693a313b693a363b7d, 'drupal_get_form', 0x613a333a7b693a303b733a33333a2272756c65735f75695f666f726d5f6578706f72745f72756c65735f636f6e666967223b693a313b693a363b693a323b733a33363a2261646d696e2f636f6e6669672f776f726b666c6f772f72756c65732f7265616374696f6e223b7d, '', 253, 8, 0, '', 'admin/config/workflow/rules/reaction/manage/%/export', '', 'rules_get_title', 'a:2:{i:0;s:26:"Export of !plugin "!label"";i:1;i:6;}', '', 'a:0:{}', 6, '', '', 0, 'sites/all/modules/rules/ui/ui.forms.inc');
INSERT INTO `menu_router` VALUES('admin/config/workflow/rules/reaction/manage/%/schedule', 0x613a313a7b693a363b733a31373a2272756c65735f636f6e6669675f6c6f6164223b7d, '', 'rules_config_access', 0x613a323a7b693a303b733a363a22757064617465223b693a313b693a363b7d, 'drupal_get_form', 0x613a333a7b693a303b733a32393a2272756c65735f7363686564756c65725f7363686564756c655f666f726d223b693a313b693a363b693a323b733a33363a2261646d696e2f636f6e6669672f776f726b666c6f772f72756c65732f7265616374696f6e223b7d, '', 253, 8, 0, '', 'admin/config/workflow/rules/reaction/manage/%/schedule', '', 'rules_get_title', 'a:2:{i:0;s:25:"Schedule !plugin "!label"";i:1;i:6;}', '', 'a:0:{}', 6, '', '', 0, 'sites/all/modules/rules/rules_scheduler/rules_scheduler.admin.inc');
INSERT INTO `menu_router` VALUES('admin/config/workflow/rules/schedule', '', '', 'user_access', 0x613a313a7b693a303b733a31363a2261646d696e69737465722072756c6573223b7d, 'rules_scheduler_schedule_page', 0x613a303a7b7d, '', 31, 5, 1, 'admin/config/workflow/rules', 'admin/config/workflow/rules', 'Schedule', 't', '', '', 'a:0:{}', 132, '', '', 0, 'sites/all/modules/rules/rules_scheduler/rules_scheduler.admin.inc');
INSERT INTO `menu_router` VALUES('admin/config/workflow/rules/schedule/%/delete', 0x613a313a7b693a353b733a32353a2272756c65735f7363686564756c65725f7461736b5f6c6f6164223b7d, '', 'user_access', 0x613a313a7b693a303b733a31363a2261646d696e69737465722072756c6573223b7d, 'drupal_get_form', 0x613a323a7b693a303b733a32373a2272756c65735f7363686564756c65725f64656c6574655f7461736b223b693a313b693a353b7d, '', 125, 7, 0, '', 'admin/config/workflow/rules/schedule/%/delete', 'Delete a scheduled task', 't', '', '', 'a:0:{}', 0, '', '', 0, 'sites/all/modules/rules/rules_scheduler/rules_scheduler.admin.inc');
INSERT INTO `menu_router` VALUES('admin/config/workflow/rules/settings', '', '', 'user_access', 0x613a313a7b693a303b733a31363a2261646d696e69737465722072756c6573223b7d, 'drupal_get_form', 0x613a313a7b693a303b733a32303a2272756c65735f61646d696e5f73657474696e6773223b7d, '', 31, 5, 1, 'admin/config/workflow/rules', 'admin/config/workflow/rules', 'Settings', 't', '', '', 'a:0:{}', 132, '', '', 1, 'sites/all/modules/rules/rules_admin/rules_admin.inc');
INSERT INTO `menu_router` VALUES('admin/config/workflow/rules/settings/advanced', '', '', 'user_access', 0x613a313a7b693a303b733a31363a2261646d696e69737465722072756c6573223b7d, 'drupal_get_form', 0x613a313a7b693a303b733a32393a2272756c65735f61646d696e5f73657474696e67735f616476616e636564223b7d, '', 63, 6, 1, 'admin/config/workflow/rules/settings', 'admin/config/workflow/rules', 'Advanced', 't', '', '', 'a:0:{}', 132, '', '', 0, 'sites/all/modules/rules/rules_admin/rules_admin.inc');
INSERT INTO `menu_router` VALUES('admin/config/workflow/rules/settings/basic', '', '', 'user_access', 0x613a313a7b693a303b733a31363a2261646d696e69737465722072756c6573223b7d, 'drupal_get_form', 0x613a313a7b693a303b733a32303a2272756c65735f61646d696e5f73657474696e6773223b7d, '', 63, 6, 1, 'admin/config/workflow/rules/settings', 'admin/config/workflow/rules', 'Basic', 't', '', '', 'a:0:{}', 140, '', '', -10, 'sites/all/modules/rules/rules_admin/rules_admin.inc');
INSERT INTO `menu_router` VALUES('admin/config/workflow/rules/upgrade', '', '', 'user_access', 0x613a313a7b693a303b733a31363a2261646d696e69737465722072756c6573223b7d, 'drupal_get_form', 0x613a313a7b693a303b733a31383a2272756c65735f757067726164655f666f726d223b7d, '', 31, 5, 0, '', 'admin/config/workflow/rules/upgrade', 'Upgrade', 't', '', '', 'a:0:{}', 0, '', '', 0, 'sites/all/modules/rules/includes/rules.upgrade.inc');
INSERT INTO `menu_router` VALUES('admin/config/workflow/rules/upgrade/clear', '', '', 'user_access', 0x613a313a7b693a303b733a31363a2261646d696e69737465722072756c6573223b7d, 'drupal_get_form', 0x613a313a7b693a303b733a33323a2272756c65735f757067726164655f636f6e6669726d5f636c6561725f666f726d223b7d, '', 63, 6, 0, '', 'admin/config/workflow/rules/upgrade/clear', 'Clear', 't', '', '', 'a:0:{}', 0, '', '', 0, 'sites/all/modules/rules/includes/rules.upgrade.inc');
INSERT INTO `menu_router` VALUES('admin/content', '', '', 'user_access', 0x613a313a7b693a303b733a32333a2261636365737320636f6e74656e74206f76657276696577223b7d, 'drupal_get_form', 0x613a313a7b693a303b733a31383a226e6f64655f61646d696e5f636f6e74656e74223b7d, '', 3, 2, 0, '', 'admin/content', 'Content', 't', '', '', 'a:0:{}', 6, 'Administer content and comments.', '', -10, 'modules/node/node.admin.inc');
INSERT INTO `menu_router` VALUES('admin/content/comment', '', '', 'user_access', 0x613a313a7b693a303b733a31393a2261646d696e697374657220636f6d6d656e7473223b7d, 'comment_admin', 0x613a303a7b7d, '', 7, 3, 1, 'admin/content', 'admin/content', 'Comments', 't', '', '', 'a:0:{}', 134, 'List and edit site comments and the comment approval queue.', '', 0, 'modules/comment/comment.admin.inc');
INSERT INTO `menu_router` VALUES('admin/content/comment/approval', '', '', 'user_access', 0x613a313a7b693a303b733a31393a2261646d696e697374657220636f6d6d656e7473223b7d, 'comment_admin', 0x613a313a7b693a303b733a383a22617070726f76616c223b7d, '', 15, 4, 1, 'admin/content/comment', 'admin/content', 'Unapproved comments', 'comment_count_unpublished', '', '', 'a:0:{}', 132, '', '', 0, 'modules/comment/comment.admin.inc');
INSERT INTO `menu_router` VALUES('admin/content/comment/new', '', '', 'user_access', 0x613a313a7b693a303b733a31393a2261646d696e697374657220636f6d6d656e7473223b7d, 'comment_admin', 0x613a303a7b7d, '', 15, 4, 1, 'admin/content/comment', 'admin/content', 'Published comments', 't', '', '', 'a:0:{}', 140, '', '', -10, 'modules/comment/comment.admin.inc');
INSERT INTO `menu_router` VALUES('admin/content/node', '', '', 'user_access', 0x613a313a7b693a303b733a32333a2261636365737320636f6e74656e74206f76657276696577223b7d, 'drupal_get_form', 0x613a313a7b693a303b733a31383a226e6f64655f61646d696e5f636f6e74656e74223b7d, '', 7, 3, 1, 'admin/content', 'admin/content', 'Content', 't', '', '', 'a:0:{}', 140, '', '', -10, 'modules/node/node.admin.inc');
INSERT INTO `menu_router` VALUES('admin/dashboard', '', '', 'user_access', 0x613a313a7b693a303b733a31363a226163636573732064617368626f617264223b7d, 'dashboard_admin', 0x613a303a7b7d, '', 3, 2, 0, '', 'admin/dashboard', 'Dashboard', 't', '', '', 'a:0:{}', 6, 'View and customize your dashboard.', '', -15, '');
INSERT INTO `menu_router` VALUES('admin/dashboard/block-content/%/%', 0x613a323a7b693a333b4e3b693a343b4e3b7d, '', 'user_access', 0x613a313a7b693a303b733a31373a2261646d696e697374657220626c6f636b73223b7d, 'dashboard_show_block_content', 0x613a323a7b693a303b693a333b693a313b693a343b7d, '', 28, 5, 0, '', 'admin/dashboard/block-content/%/%', '', 't', '', '', 'a:0:{}', 0, '', '', 0, '');
INSERT INTO `menu_router` VALUES('admin/dashboard/configure', '', '', 'user_access', 0x613a313a7b693a303b733a31373a2261646d696e697374657220626c6f636b73223b7d, 'dashboard_admin_blocks', 0x613a303a7b7d, '', 7, 3, 0, '', 'admin/dashboard/configure', 'Configure available dashboard blocks', 't', '', '', 'a:0:{}', 4, 'Configure which blocks can be shown on the dashboard.', '', 0, '');
INSERT INTO `menu_router` VALUES('admin/dashboard/customize', '', '', 'user_access', 0x613a313a7b693a303b733a31363a226163636573732064617368626f617264223b7d, 'dashboard_admin', 0x613a313a7b693a303b623a313b7d, '', 7, 3, 0, '', 'admin/dashboard/customize', 'Customize dashboard', 't', '', '', 'a:0:{}', 4, 'Customize your dashboard.', '', 0, '');
INSERT INTO `menu_router` VALUES('admin/dashboard/drawer', '', '', 'user_access', 0x613a313a7b693a303b733a31373a2261646d696e697374657220626c6f636b73223b7d, 'dashboard_show_disabled', 0x613a303a7b7d, '', 7, 3, 0, '', 'admin/dashboard/drawer', '', 't', '', '', 'a:0:{}', 0, '', '', 0, '');
INSERT INTO `menu_router` VALUES('admin/dashboard/update', '', '', 'user_access', 0x613a313a7b693a303b733a31373a2261646d696e697374657220626c6f636b73223b7d, 'dashboard_update', 0x613a303a7b7d, '', 7, 3, 0, '', 'admin/dashboard/update', '', 't', '', '', 'a:0:{}', 0, '', '', 0, '');
INSERT INTO `menu_router` VALUES('admin/help', '', '', 'user_access', 0x613a313a7b693a303b733a32373a226163636573732061646d696e697374726174696f6e207061676573223b7d, 'help_main', 0x613a303a7b7d, '', 3, 2, 0, '', 'admin/help', 'Help', 't', '', '', 'a:0:{}', 6, 'Reference for usage, configuration, and modules.', '', 9, 'modules/help/help.admin.inc');
INSERT INTO `menu_router` VALUES('admin/help/block', '', '', 'user_access', 0x613a313a7b693a303b733a32373a226163636573732061646d696e697374726174696f6e207061676573223b7d, 'help_page', 0x613a313a7b693a303b693a323b7d, '', 7, 3, 0, '', 'admin/help/block', 'block', 't', '', '', 'a:0:{}', 4, '', '', 0, 'modules/help/help.admin.inc');
INSERT INTO `menu_router` VALUES('admin/help/color', '', '', 'user_access', 0x613a313a7b693a303b733a32373a226163636573732061646d696e697374726174696f6e207061676573223b7d, 'help_page', 0x613a313a7b693a303b693a323b7d, '', 7, 3, 0, '', 'admin/help/color', 'color', 't', '', '', 'a:0:{}', 4, '', '', 0, 'modules/help/help.admin.inc');
INSERT INTO `menu_router` VALUES('admin/help/comment', '', '', 'user_access', 0x613a313a7b693a303b733a32373a226163636573732061646d696e697374726174696f6e207061676573223b7d, 'help_page', 0x613a313a7b693a303b693a323b7d, '', 7, 3, 0, '', 'admin/help/comment', 'comment', 't', '', '', 'a:0:{}', 4, '', '', 0, 'modules/help/help.admin.inc');
INSERT INTO `menu_router` VALUES('admin/help/contextual', '', '', 'user_access', 0x613a313a7b693a303b733a32373a226163636573732061646d696e697374726174696f6e207061676573223b7d, 'help_page', 0x613a313a7b693a303b693a323b7d, '', 7, 3, 0, '', 'admin/help/contextual', 'contextual', 't', '', '', 'a:0:{}', 4, '', '', 0, 'modules/help/help.admin.inc');
INSERT INTO `menu_router` VALUES('admin/help/dashboard', '', '', 'user_access', 0x613a313a7b693a303b733a32373a226163636573732061646d696e697374726174696f6e207061676573223b7d, 'help_page', 0x613a313a7b693a303b693a323b7d, '', 7, 3, 0, '', 'admin/help/dashboard', 'dashboard', 't', '', '', 'a:0:{}', 4, '', '', 0, 'modules/help/help.admin.inc');
INSERT INTO `menu_router` VALUES('admin/help/dblog', '', '', 'user_access', 0x613a313a7b693a303b733a32373a226163636573732061646d696e697374726174696f6e207061676573223b7d, 'help_page', 0x613a313a7b693a303b693a323b7d, '', 7, 3, 0, '', 'admin/help/dblog', 'dblog', 't', '', '', 'a:0:{}', 4, '', '', 0, 'modules/help/help.admin.inc');
INSERT INTO `menu_router` VALUES('admin/help/field', '', '', 'user_access', 0x613a313a7b693a303b733a32373a226163636573732061646d696e697374726174696f6e207061676573223b7d, 'help_page', 0x613a313a7b693a303b693a323b7d, '', 7, 3, 0, '', 'admin/help/field', 'field', 't', '', '', 'a:0:{}', 4, '', '', 0, 'modules/help/help.admin.inc');
INSERT INTO `menu_router` VALUES('admin/help/field_sql_storage', '', '', 'user_access', 0x613a313a7b693a303b733a32373a226163636573732061646d696e697374726174696f6e207061676573223b7d, 'help_page', 0x613a313a7b693a303b693a323b7d, '', 7, 3, 0, '', 'admin/help/field_sql_storage', 'field_sql_storage', 't', '', '', 'a:0:{}', 4, '', '', 0, 'modules/help/help.admin.inc');
INSERT INTO `menu_router` VALUES('admin/help/field_ui', '', '', 'user_access', 0x613a313a7b693a303b733a32373a226163636573732061646d696e697374726174696f6e207061676573223b7d, 'help_page', 0x613a313a7b693a303b693a323b7d, '', 7, 3, 0, '', 'admin/help/field_ui', 'field_ui', 't', '', '', 'a:0:{}', 4, '', '', 0, 'modules/help/help.admin.inc');
INSERT INTO `menu_router` VALUES('admin/help/file', '', '', 'user_access', 0x613a313a7b693a303b733a32373a226163636573732061646d696e697374726174696f6e207061676573223b7d, 'help_page', 0x613a313a7b693a303b693a323b7d, '', 7, 3, 0, '', 'admin/help/file', 'file', 't', '', '', 'a:0:{}', 4, '', '', 0, 'modules/help/help.admin.inc');
INSERT INTO `menu_router` VALUES('admin/help/filter', '', '', 'user_access', 0x613a313a7b693a303b733a32373a226163636573732061646d696e697374726174696f6e207061676573223b7d, 'help_page', 0x613a313a7b693a303b693a323b7d, '', 7, 3, 0, '', 'admin/help/filter', 'filter', 't', '', '', 'a:0:{}', 4, '', '', 0, 'modules/help/help.admin.inc');
INSERT INTO `menu_router` VALUES('admin/help/help', '', '', 'user_access', 0x613a313a7b693a303b733a32373a226163636573732061646d696e697374726174696f6e207061676573223b7d, 'help_page', 0x613a313a7b693a303b693a323b7d, '', 7, 3, 0, '', 'admin/help/help', 'help', 't', '', '', 'a:0:{}', 4, '', '', 0, 'modules/help/help.admin.inc');
INSERT INTO `menu_router` VALUES('admin/help/image', '', '', 'user_access', 0x613a313a7b693a303b733a32373a226163636573732061646d696e697374726174696f6e207061676573223b7d, 'help_page', 0x613a313a7b693a303b693a323b7d, '', 7, 3, 0, '', 'admin/help/image', 'image', 't', '', '', 'a:0:{}', 4, '', '', 0, 'modules/help/help.admin.inc');
INSERT INTO `menu_router` VALUES('admin/help/list', '', '', 'user_access', 0x613a313a7b693a303b733a32373a226163636573732061646d696e697374726174696f6e207061676573223b7d, 'help_page', 0x613a313a7b693a303b693a323b7d, '', 7, 3, 0, '', 'admin/help/list', 'list', 't', '', '', 'a:0:{}', 4, '', '', 0, 'modules/help/help.admin.inc');
INSERT INTO `menu_router` VALUES('admin/help/menu', '', '', 'user_access', 0x613a313a7b693a303b733a32373a226163636573732061646d696e697374726174696f6e207061676573223b7d, 'help_page', 0x613a313a7b693a303b693a323b7d, '', 7, 3, 0, '', 'admin/help/menu', 'menu', 't', '', '', 'a:0:{}', 4, '', '', 0, 'modules/help/help.admin.inc');
INSERT INTO `menu_router` VALUES('admin/help/node', '', '', 'user_access', 0x613a313a7b693a303b733a32373a226163636573732061646d696e697374726174696f6e207061676573223b7d, 'help_page', 0x613a313a7b693a303b693a323b7d, '', 7, 3, 0, '', 'admin/help/node', 'node', 't', '', '', 'a:0:{}', 4, '', '', 0, 'modules/help/help.admin.inc');
INSERT INTO `menu_router` VALUES('admin/help/number', '', '', 'user_access', 0x613a313a7b693a303b733a32373a226163636573732061646d696e697374726174696f6e207061676573223b7d, 'help_page', 0x613a313a7b693a303b693a323b7d, '', 7, 3, 0, '', 'admin/help/number', 'number', 't', '', '', 'a:0:{}', 4, '', '', 0, 'modules/help/help.admin.inc');
INSERT INTO `menu_router` VALUES('admin/help/options', '', '', 'user_access', 0x613a313a7b693a303b733a32373a226163636573732061646d696e697374726174696f6e207061676573223b7d, 'help_page', 0x613a313a7b693a303b693a323b7d, '', 7, 3, 0, '', 'admin/help/options', 'options', 't', '', '', 'a:0:{}', 4, '', '', 0, 'modules/help/help.admin.inc');
INSERT INTO `menu_router` VALUES('admin/help/overlay', '', '', 'user_access', 0x613a313a7b693a303b733a32373a226163636573732061646d696e697374726174696f6e207061676573223b7d, 'help_page', 0x613a313a7b693a303b693a323b7d, '', 7, 3, 0, '', 'admin/help/overlay', 'overlay', 't', '', '', 'a:0:{}', 4, '', '', 0, 'modules/help/help.admin.inc');
INSERT INTO `menu_router` VALUES('admin/help/path', '', '', 'user_access', 0x613a313a7b693a303b733a32373a226163636573732061646d696e697374726174696f6e207061676573223b7d, 'help_page', 0x613a313a7b693a303b693a323b7d, '', 7, 3, 0, '', 'admin/help/path', 'path', 't', '', '', 'a:0:{}', 4, '', '', 0, 'modules/help/help.admin.inc');
INSERT INTO `menu_router` VALUES('admin/help/rdf', '', '', 'user_access', 0x613a313a7b693a303b733a32373a226163636573732061646d696e697374726174696f6e207061676573223b7d, 'help_page', 0x613a313a7b693a303b693a323b7d, '', 7, 3, 0, '', 'admin/help/rdf', 'rdf', 't', '', '', 'a:0:{}', 4, '', '', 0, 'modules/help/help.admin.inc');
INSERT INTO `menu_router` VALUES('admin/help/rules', '', '', 'user_access', 0x613a313a7b693a303b733a32373a226163636573732061646d696e697374726174696f6e207061676573223b7d, 'help_page', 0x613a313a7b693a303b693a323b7d, '', 7, 3, 0, '', 'admin/help/rules', 'rules', 't', '', '', 'a:0:{}', 4, '', '', 0, 'modules/help/help.admin.inc');
INSERT INTO `menu_router` VALUES('admin/help/search', '', '', 'user_access', 0x613a313a7b693a303b733a32373a226163636573732061646d696e697374726174696f6e207061676573223b7d, 'help_page', 0x613a313a7b693a303b693a323b7d, '', 7, 3, 0, '', 'admin/help/search', 'search', 't', '', '', 'a:0:{}', 4, '', '', 0, 'modules/help/help.admin.inc');
INSERT INTO `menu_router` VALUES('admin/help/services', '', '', 'user_access', 0x613a313a7b693a303b733a32373a226163636573732061646d696e697374726174696f6e207061676573223b7d, 'help_page', 0x613a313a7b693a303b693a323b7d, '', 7, 3, 0, '', 'admin/help/services', 'services', 't', '', '', 'a:0:{}', 4, '', '', 0, 'modules/help/help.admin.inc');
INSERT INTO `menu_router` VALUES('admin/help/shortcut', '', '', 'user_access', 0x613a313a7b693a303b733a32373a226163636573732061646d696e697374726174696f6e207061676573223b7d, 'help_page', 0x613a313a7b693a303b693a323b7d, '', 7, 3, 0, '', 'admin/help/shortcut', 'shortcut', 't', '', '', 'a:0:{}', 4, '', '', 0, 'modules/help/help.admin.inc');
INSERT INTO `menu_router` VALUES('admin/help/system', '', '', 'user_access', 0x613a313a7b693a303b733a32373a226163636573732061646d696e697374726174696f6e207061676573223b7d, 'help_page', 0x613a313a7b693a303b693a323b7d, '', 7, 3, 0, '', 'admin/help/system', 'system', 't', '', '', 'a:0:{}', 4, '', '', 0, 'modules/help/help.admin.inc');
INSERT INTO `menu_router` VALUES('admin/help/taxonomy', '', '', 'user_access', 0x613a313a7b693a303b733a32373a226163636573732061646d696e697374726174696f6e207061676573223b7d, 'help_page', 0x613a313a7b693a303b693a323b7d, '', 7, 3, 0, '', 'admin/help/taxonomy', 'taxonomy', 't', '', '', 'a:0:{}', 4, '', '', 0, 'modules/help/help.admin.inc');
INSERT INTO `menu_router` VALUES('admin/help/text', '', '', 'user_access', 0x613a313a7b693a303b733a32373a226163636573732061646d696e697374726174696f6e207061676573223b7d, 'help_page', 0x613a313a7b693a303b693a323b7d, '', 7, 3, 0, '', 'admin/help/text', 'text', 't', '', '', 'a:0:{}', 4, '', '', 0, 'modules/help/help.admin.inc');
INSERT INTO `menu_router` VALUES('admin/help/toolbar', '', '', 'user_access', 0x613a313a7b693a303b733a32373a226163636573732061646d696e697374726174696f6e207061676573223b7d, 'help_page', 0x613a313a7b693a303b693a323b7d, '', 7, 3, 0, '', 'admin/help/toolbar', 'toolbar', 't', '', '', 'a:0:{}', 4, '', '', 0, 'modules/help/help.admin.inc');
INSERT INTO `menu_router` VALUES('admin/help/update', '', '', 'user_access', 0x613a313a7b693a303b733a32373a226163636573732061646d696e697374726174696f6e207061676573223b7d, 'help_page', 0x613a313a7b693a303b693a323b7d, '', 7, 3, 0, '', 'admin/help/update', 'update', 't', '', '', 'a:0:{}', 4, '', '', 0, 'modules/help/help.admin.inc');
INSERT INTO `menu_router` VALUES('admin/help/user', '', '', 'user_access', 0x613a313a7b693a303b733a32373a226163636573732061646d696e697374726174696f6e207061676573223b7d, 'help_page', 0x613a313a7b693a303b693a323b7d, '', 7, 3, 0, '', 'admin/help/user', 'user', 't', '', '', 'a:0:{}', 4, '', '', 0, 'modules/help/help.admin.inc');
INSERT INTO `menu_router` VALUES('admin/help/wysiwyg', '', '', 'user_access', 0x613a313a7b693a303b733a32373a226163636573732061646d696e697374726174696f6e207061676573223b7d, 'help_page', 0x613a313a7b693a303b693a323b7d, '', 7, 3, 0, '', 'admin/help/wysiwyg', 'wysiwyg', 't', '', '', 'a:0:{}', 4, '', '', 0, 'modules/help/help.admin.inc');
INSERT INTO `menu_router` VALUES('admin/index', '', '', 'user_access', 0x613a313a7b693a303b733a32373a226163636573732061646d696e697374726174696f6e207061676573223b7d, 'system_admin_index', 0x613a303a7b7d, '', 3, 2, 1, 'admin', 'admin', 'Index', 't', '', '', 'a:0:{}', 132, '', '', -18, 'modules/system/system.admin.inc');
INSERT INTO `menu_router` VALUES('admin/modules', '', '', 'user_access', 0x613a313a7b693a303b733a31383a2261646d696e6973746572206d6f64756c6573223b7d, 'drupal_get_form', 0x613a313a7b693a303b733a31343a2273797374656d5f6d6f64756c6573223b7d, '', 3, 2, 0, '', 'admin/modules', 'Modules', 't', '', '', 'a:0:{}', 6, 'Extend site functionality.', '', -2, 'modules/system/system.admin.inc');
INSERT INTO `menu_router` VALUES('admin/modules/install', '', '', 'update_manager_access', 0x613a303a7b7d, 'drupal_get_form', 0x613a323a7b693a303b733a32373a227570646174655f6d616e616765725f696e7374616c6c5f666f726d223b693a313b733a363a226d6f64756c65223b7d, '', 7, 3, 1, 'admin/modules', 'admin/modules', 'Install new module', 't', '', '', 'a:0:{}', 388, '', '', 25, 'modules/update/update.manager.inc');
INSERT INTO `menu_router` VALUES('admin/modules/list', '', '', 'user_access', 0x613a313a7b693a303b733a31383a2261646d696e6973746572206d6f64756c6573223b7d, 'drupal_get_form', 0x613a313a7b693a303b733a31343a2273797374656d5f6d6f64756c6573223b7d, '', 7, 3, 1, 'admin/modules', 'admin/modules', 'List', 't', '', '', 'a:0:{}', 140, '', '', 0, 'modules/system/system.admin.inc');
INSERT INTO `menu_router` VALUES('admin/modules/list/confirm', '', '', 'user_access', 0x613a313a7b693a303b733a31383a2261646d696e6973746572206d6f64756c6573223b7d, 'drupal_get_form', 0x613a313a7b693a303b733a31343a2273797374656d5f6d6f64756c6573223b7d, '', 15, 4, 0, '', 'admin/modules/list/confirm', 'List', 't', '', '', 'a:0:{}', 4, '', '', 0, 'modules/system/system.admin.inc');
INSERT INTO `menu_router` VALUES('admin/modules/uninstall', '', '', 'user_access', 0x613a313a7b693a303b733a31383a2261646d696e6973746572206d6f64756c6573223b7d, 'drupal_get_form', 0x613a313a7b693a303b733a32343a2273797374656d5f6d6f64756c65735f756e696e7374616c6c223b7d, '', 7, 3, 1, 'admin/modules', 'admin/modules', 'Uninstall', 't', '', '', 'a:0:{}', 132, '', '', 20, 'modules/system/system.admin.inc');
INSERT INTO `menu_router` VALUES('admin/modules/uninstall/confirm', '', '', 'user_access', 0x613a313a7b693a303b733a31383a2261646d696e6973746572206d6f64756c6573223b7d, 'drupal_get_form', 0x613a313a7b693a303b733a32343a2273797374656d5f6d6f64756c65735f756e696e7374616c6c223b7d, '', 15, 4, 0, '', 'admin/modules/uninstall/confirm', 'Uninstall', 't', '', '', 'a:0:{}', 4, '', '', 0, 'modules/system/system.admin.inc');
INSERT INTO `menu_router` VALUES('admin/modules/update', '', '', 'update_manager_access', 0x613a303a7b7d, 'drupal_get_form', 0x613a323a7b693a303b733a32363a227570646174655f6d616e616765725f7570646174655f666f726d223b693a313b733a363a226d6f64756c65223b7d, '', 7, 3, 1, 'admin/modules', 'admin/modules', 'Update', 't', '', '', 'a:0:{}', 132, '', '', 10, 'modules/update/update.manager.inc');
INSERT INTO `menu_router` VALUES('admin/people', '', '', 'user_access', 0x613a313a7b693a303b733a31363a2261646d696e6973746572207573657273223b7d, 'user_admin', 0x613a313a7b693a303b733a343a226c697374223b7d, '', 3, 2, 0, '', 'admin/people', 'People', 't', '', '', 'a:0:{}', 6, 'Manage user accounts, roles, and permissions.', 'left', -4, 'modules/user/user.admin.inc');
INSERT INTO `menu_router` VALUES('admin/people/create', '', '', 'user_access', 0x613a313a7b693a303b733a31363a2261646d696e6973746572207573657273223b7d, 'user_admin', 0x613a313a7b693a303b733a363a22637265617465223b7d, '', 7, 3, 1, 'admin/people', 'admin/people', 'Add user', 't', '', '', 'a:0:{}', 388, '', '', 0, 'modules/user/user.admin.inc');
INSERT INTO `menu_router` VALUES('admin/people/people', '', '', 'user_access', 0x613a313a7b693a303b733a31363a2261646d696e6973746572207573657273223b7d, 'user_admin', 0x613a313a7b693a303b733a343a226c697374223b7d, '', 7, 3, 1, 'admin/people', 'admin/people', 'List', 't', '', '', 'a:0:{}', 140, 'Find and manage people interacting with your site.', '', -10, 'modules/user/user.admin.inc');
INSERT INTO `menu_router` VALUES('admin/people/permissions', '', '', 'user_access', 0x613a313a7b693a303b733a32323a2261646d696e6973746572207065726d697373696f6e73223b7d, 'drupal_get_form', 0x613a313a7b693a303b733a32323a22757365725f61646d696e5f7065726d697373696f6e73223b7d, '', 7, 3, 1, 'admin/people', 'admin/people', 'Permissions', 't', '', '', 'a:0:{}', 132, 'Determine access to features by selecting permissions for roles.', '', 0, 'modules/user/user.admin.inc');
INSERT INTO `menu_router` VALUES('admin/people/permissions/list', '', '', 'user_access', 0x613a313a7b693a303b733a32323a2261646d696e6973746572207065726d697373696f6e73223b7d, 'drupal_get_form', 0x613a313a7b693a303b733a32323a22757365725f61646d696e5f7065726d697373696f6e73223b7d, '', 15, 4, 1, 'admin/people/permissions', 'admin/people', 'Permissions', 't', '', '', 'a:0:{}', 140, 'Determine access to features by selecting permissions for roles.', '', -8, 'modules/user/user.admin.inc');
INSERT INTO `menu_router` VALUES('admin/people/permissions/roles', '', '', 'user_access', 0x613a313a7b693a303b733a32323a2261646d696e6973746572207065726d697373696f6e73223b7d, 'drupal_get_form', 0x613a313a7b693a303b733a31363a22757365725f61646d696e5f726f6c6573223b7d, '', 15, 4, 1, 'admin/people/permissions', 'admin/people', 'Roles', 't', '', '', 'a:0:{}', 132, 'List, edit, or add user roles.', '', -5, 'modules/user/user.admin.inc');
INSERT INTO `menu_router` VALUES('admin/people/permissions/roles/delete/%', 0x613a313a7b693a353b733a31343a22757365725f726f6c655f6c6f6164223b7d, '', 'user_role_edit_access', 0x613a313a7b693a303b693a353b7d, 'drupal_get_form', 0x613a323a7b693a303b733a33303a22757365725f61646d696e5f726f6c655f64656c6574655f636f6e6669726d223b693a313b693a353b7d, '', 62, 6, 0, '', 'admin/people/permissions/roles/delete/%', 'Delete role', 't', '', '', 'a:0:{}', 6, '', '', 0, 'modules/user/user.admin.inc');
INSERT INTO `menu_router` VALUES('admin/people/permissions/roles/edit/%', 0x613a313a7b693a353b733a31343a22757365725f726f6c655f6c6f6164223b7d, '', 'user_role_edit_access', 0x613a313a7b693a303b693a353b7d, 'drupal_get_form', 0x613a323a7b693a303b733a31353a22757365725f61646d696e5f726f6c65223b693a313b693a353b7d, '', 62, 6, 0, '', 'admin/people/permissions/roles/edit/%', 'Edit role', 't', '', '', 'a:0:{}', 6, '', '', 0, 'modules/user/user.admin.inc');
INSERT INTO `menu_router` VALUES('admin/reports', '', '', 'user_access', 0x613a313a7b693a303b733a31393a226163636573732073697465207265706f727473223b7d, 'system_admin_menu_block_page', 0x613a303a7b7d, '', 3, 2, 0, '', 'admin/reports', 'Reports', 't', '', '', 'a:0:{}', 6, 'View reports, updates, and errors.', 'left', 5, 'modules/system/system.admin.inc');
INSERT INTO `menu_router` VALUES('admin/reports/access-denied', '', '', 'user_access', 0x613a313a7b693a303b733a31393a226163636573732073697465207265706f727473223b7d, 'dblog_top', 0x613a313a7b693a303b733a31333a226163636573732064656e696564223b7d, '', 7, 3, 0, '', 'admin/reports/access-denied', 'Top ''access denied'' errors', 't', '', '', 'a:0:{}', 6, 'View ''access denied'' errors (403s).', '', 0, 'modules/dblog/dblog.admin.inc');
INSERT INTO `menu_router` VALUES('admin/reports/dblog', '', '', 'user_access', 0x613a313a7b693a303b733a31393a226163636573732073697465207265706f727473223b7d, 'dblog_overview', 0x613a303a7b7d, '', 7, 3, 0, '', 'admin/reports/dblog', 'Recent log messages', 't', '', '', 'a:0:{}', 6, 'View events that have recently been logged.', '', -1, 'modules/dblog/dblog.admin.inc');
INSERT INTO `menu_router` VALUES('admin/reports/event/%', 0x613a313a7b693a333b4e3b7d, '', 'user_access', 0x613a313a7b693a303b733a31393a226163636573732073697465207265706f727473223b7d, 'dblog_event', 0x613a313a7b693a303b693a333b7d, '', 14, 4, 0, '', 'admin/reports/event/%', 'Details', 't', '', '', 'a:0:{}', 6, '', '', 0, 'modules/dblog/dblog.admin.inc');
INSERT INTO `menu_router` VALUES('admin/reports/fields', '', '', 'user_access', 0x613a313a7b693a303b733a32343a2261646d696e697374657220636f6e74656e74207479706573223b7d, 'field_ui_fields_list', 0x613a303a7b7d, '', 7, 3, 0, '', 'admin/reports/fields', 'Field list', 't', '', '', 'a:0:{}', 6, 'Overview of fields on all entity types.', '', 0, 'modules/field_ui/field_ui.admin.inc');
INSERT INTO `menu_router` VALUES('admin/reports/fields/list', '', '', 'user_access', 0x613a313a7b693a303b733a32343a2261646d696e697374657220636f6e74656e74207479706573223b7d, 'field_ui_fields_list', 0x613a303a7b7d, '', 15, 4, 1, 'admin/reports/fields', 'admin/reports/fields', 'List', 't', '', '', 'a:0:{}', 140, '', '', -10, 'modules/field_ui/field_ui.admin.inc');
INSERT INTO `menu_router` VALUES('admin/reports/fields/views-fields', '', '', 'user_access', 0x613a313a7b693a303b733a31363a2261646d696e6973746572207669657773223b7d, 'views_ui_field_list', 0x613a303a7b7d, '', 15, 4, 1, 'admin/reports/fields', 'admin/reports/fields', 'Used in views', 't', '', '', 'a:0:{}', 132, 'Overview of fields used in all views.', '', 0, 'sites/all/modules/views/includes/admin.inc');
INSERT INTO `menu_router` VALUES('admin/reports/page-not-found', '', '', 'user_access', 0x613a313a7b693a303b733a31393a226163636573732073697465207265706f727473223b7d, 'dblog_top', 0x613a313a7b693a303b733a31343a2270616765206e6f7420666f756e64223b7d, '', 7, 3, 0, '', 'admin/reports/page-not-found', 'Top ''page not found'' errors', 't', '', '', 'a:0:{}', 6, 'View ''page not found'' errors (404s).', '', 0, 'modules/dblog/dblog.admin.inc');
INSERT INTO `menu_router` VALUES('admin/reports/search', '', '', 'user_access', 0x613a313a7b693a303b733a31393a226163636573732073697465207265706f727473223b7d, 'dblog_top', 0x613a313a7b693a303b733a363a22736561726368223b7d, '', 7, 3, 0, '', 'admin/reports/search', 'Top search phrases', 't', '', '', 'a:0:{}', 6, 'View most popular search phrases.', '', 0, 'modules/dblog/dblog.admin.inc');
INSERT INTO `menu_router` VALUES('admin/reports/status', '', '', 'user_access', 0x613a313a7b693a303b733a32393a2261646d696e6973746572207369746520636f6e66696775726174696f6e223b7d, 'system_status', 0x613a303a7b7d, '', 7, 3, 0, '', 'admin/reports/status', 'Status report', 't', '', '', 'a:0:{}', 6, 'Get a status report about your site''s operation and any detected problems.', '', -60, 'modules/system/system.admin.inc');
INSERT INTO `menu_router` VALUES('admin/reports/status/php', '', '', 'user_access', 0x613a313a7b693a303b733a32393a2261646d696e6973746572207369746520636f6e66696775726174696f6e223b7d, 'system_php', 0x613a303a7b7d, '', 15, 4, 0, '', 'admin/reports/status/php', 'PHP', 't', '', '', 'a:0:{}', 0, '', '', 0, 'modules/system/system.admin.inc');
INSERT INTO `menu_router` VALUES('admin/reports/status/rebuild', '', '', 'user_access', 0x613a313a7b693a303b733a32373a226163636573732061646d696e697374726174696f6e207061676573223b7d, 'drupal_get_form', 0x613a313a7b693a303b733a33303a226e6f64655f636f6e6669677572655f72656275696c645f636f6e6669726d223b7d, '', 15, 4, 0, '', 'admin/reports/status/rebuild', 'Rebuild permissions', 't', '', '', 'a:0:{}', 0, '', '', 0, 'modules/node/node.admin.inc');
INSERT INTO `menu_router` VALUES('admin/reports/status/run-cron', '', '', 'user_access', 0x613a313a7b693a303b733a32393a2261646d696e6973746572207369746520636f6e66696775726174696f6e223b7d, 'system_run_cron', 0x613a303a7b7d, '', 15, 4, 0, '', 'admin/reports/status/run-cron', 'Run cron', 't', '', '', 'a:0:{}', 0, '', '', 0, 'modules/system/system.admin.inc');
INSERT INTO `menu_router` VALUES('admin/reports/updates', '', '', 'user_access', 0x613a313a7b693a303b733a32393a2261646d696e6973746572207369746520636f6e66696775726174696f6e223b7d, 'update_status', 0x613a303a7b7d, '', 7, 3, 0, '', 'admin/reports/updates', 'Available updates', 't', '', '', 'a:0:{}', 6, 'Get a status report about available updates for your installed modules and themes.', '', -50, 'modules/update/update.report.inc');
INSERT INTO `menu_router` VALUES('admin/reports/updates/check', '', '', 'user_access', 0x613a313a7b693a303b733a32393a2261646d696e6973746572207369746520636f6e66696775726174696f6e223b7d, 'update_manual_status', 0x613a303a7b7d, '', 15, 4, 0, '', 'admin/reports/updates/check', 'Manual update check', 't', '', '', 'a:0:{}', 0, '', '', 0, 'modules/update/update.fetch.inc');
INSERT INTO `menu_router` VALUES('admin/reports/updates/install', '', '', 'update_manager_access', 0x613a303a7b7d, 'drupal_get_form', 0x613a323a7b693a303b733a32373a227570646174655f6d616e616765725f696e7374616c6c5f666f726d223b693a313b733a363a227265706f7274223b7d, '', 15, 4, 1, 'admin/reports/updates', 'admin/reports/updates', 'Install new module or theme', 't', '', '', 'a:0:{}', 388, '', '', 25, 'modules/update/update.manager.inc');
INSERT INTO `menu_router` VALUES('admin/reports/updates/list', '', '', 'user_access', 0x613a313a7b693a303b733a32393a2261646d696e6973746572207369746520636f6e66696775726174696f6e223b7d, 'update_status', 0x613a303a7b7d, '', 15, 4, 1, 'admin/reports/updates', 'admin/reports/updates', 'List', 't', '', '', 'a:0:{}', 140, '', '', 0, 'modules/update/update.report.inc');
INSERT INTO `menu_router` VALUES('admin/reports/updates/settings', '', '', 'user_access', 0x613a313a7b693a303b733a32393a2261646d696e6973746572207369746520636f6e66696775726174696f6e223b7d, 'drupal_get_form', 0x613a313a7b693a303b733a31353a227570646174655f73657474696e6773223b7d, '', 15, 4, 1, 'admin/reports/updates', 'admin/reports/updates', 'Settings', 't', '', '', 'a:0:{}', 132, '', '', 50, 'modules/update/update.settings.inc');
INSERT INTO `menu_router` VALUES('admin/reports/updates/update', '', '', 'update_manager_access', 0x613a303a7b7d, 'drupal_get_form', 0x613a323a7b693a303b733a32363a227570646174655f6d616e616765725f7570646174655f666f726d223b693a313b733a363a227265706f7274223b7d, '', 15, 4, 1, 'admin/reports/updates', 'admin/reports/updates', 'Update', 't', '', '', 'a:0:{}', 132, '', '', 10, 'modules/update/update.manager.inc');
INSERT INTO `menu_router` VALUES('admin/reports/views-plugins', '', '', 'user_access', 0x613a313a7b693a303b733a31363a2261646d696e6973746572207669657773223b7d, 'views_ui_plugin_list', 0x613a303a7b7d, '', 7, 3, 0, '', 'admin/reports/views-plugins', 'Views plugins', 't', '', '', 'a:0:{}', 6, 'Overview of plugins used in all views.', '', 0, 'sites/all/modules/views/includes/admin.inc');
INSERT INTO `menu_router` VALUES('admin/structure', '', '', 'user_access', 0x613a313a7b693a303b733a32373a226163636573732061646d696e697374726174696f6e207061676573223b7d, 'system_admin_menu_block_page', 0x613a303a7b7d, '', 3, 2, 0, '', 'admin/structure', 'Structure', 't', '', '', 'a:0:{}', 6, 'Administer blocks, content types, menus, etc.', 'right', -8, 'modules/system/system.admin.inc');
INSERT INTO `menu_router` VALUES('admin/structure/block', '', '', 'user_access', 0x613a313a7b693a303b733a31373a2261646d696e697374657220626c6f636b73223b7d, 'block_admin_display', 0x613a313a7b693a303b733a363a2262617274696b223b7d, '', 7, 3, 0, '', 'admin/structure/block', 'Blocks', 't', '', '', 'a:0:{}', 6, 'Configure what block content appears in your site''s sidebars and other regions.', '', 0, 'modules/block/block.admin.inc');
INSERT INTO `menu_router` VALUES('admin/structure/block/add', '', '', 'user_access', 0x613a313a7b693a303b733a31373a2261646d696e697374657220626c6f636b73223b7d, 'drupal_get_form', 0x613a313a7b693a303b733a32303a22626c6f636b5f6164645f626c6f636b5f666f726d223b7d, '', 15, 4, 1, 'admin/structure/block', 'admin/structure/block', 'Add block', 't', '', '', 'a:0:{}', 388, '', '', 0, 'modules/block/block.admin.inc');
INSERT INTO `menu_router` VALUES('admin/structure/block/demo/bartik', '', '', '_block_themes_access', 0x613a313a7b693a303b4f3a383a22737464436c617373223a31323a7b733a383a2266696c656e616d65223b733a32353a227468656d65732f62617274696b2f62617274696b2e696e666f223b733a343a226e616d65223b733a363a2262617274696b223b733a343a2274797065223b733a353a227468656d65223b733a353a226f776e6572223b733a34353a227468656d65732f656e67696e65732f70687074656d706c6174652f70687074656d706c6174652e656e67696e65223b733a363a22737461747573223b733a313a2231223b733a393a22626f6f747374726170223b733a313a2230223b733a31343a22736368656d615f76657273696f6e223b733a323a222d31223b733a363a22776569676874223b733a313a2230223b733a343a22696e666f223b613a31383a7b733a343a226e616d65223b733a363a2242617274696b223b733a31313a226465736372697074696f6e223b733a34383a224120666c657869626c652c207265636f6c6f7261626c65207468656d652077697468206d616e7920726567696f6e732e223b733a373a227061636b616765223b733a343a22436f7265223b733a373a2276657273696f6e223b733a343a22372e3232223b733a343a22636f7265223b733a333a22372e78223b733a31313a227374796c65736865657473223b613a323a7b733a333a22616c6c223b613a333a7b733a31343a226373732f6c61796f75742e637373223b733a32383a227468656d65732f62617274696b2f6373732f6c61796f75742e637373223b733a31333a226373732f7374796c652e637373223b733a32373a227468656d65732f62617274696b2f6373732f7374796c652e637373223b733a31343a226373732f636f6c6f72732e637373223b733a32383a227468656d65732f62617274696b2f6373732f636f6c6f72732e637373223b7d733a353a227072696e74223b613a313a7b733a31333a226373732f7072696e742e637373223b733a32373a227468656d65732f62617274696b2f6373732f7072696e742e637373223b7d7d733a373a22726567696f6e73223b613a32303a7b733a363a22686561646572223b733a363a22486561646572223b733a343a2268656c70223b733a343a2248656c70223b733a383a22706167655f746f70223b733a383a225061676520746f70223b733a31313a22706167655f626f74746f6d223b733a31313a225061676520626f74746f6d223b733a31313a22686967686c696768746564223b733a31313a22486967686c696768746564223b733a383a226665617475726564223b733a383a224665617475726564223b733a373a22636f6e74656e74223b733a373a22436f6e74656e74223b733a31333a22736964656261725f6669727374223b733a31333a2253696465626172206669727374223b733a31343a22736964656261725f7365636f6e64223b733a31343a2253696465626172207365636f6e64223b733a31343a2274726970747963685f6669727374223b733a31343a225472697074796368206669727374223b733a31353a2274726970747963685f6d6964646c65223b733a31353a225472697074796368206d6964646c65223b733a31333a2274726970747963685f6c617374223b733a31333a225472697074796368206c617374223b733a31383a22666f6f7465725f6669727374636f6c756d6e223b733a31393a22466f6f74657220666972737420636f6c756d6e223b733a31393a22666f6f7465725f7365636f6e64636f6c756d6e223b733a32303a22466f6f746572207365636f6e6420636f6c756d6e223b733a31383a22666f6f7465725f7468697264636f6c756d6e223b733a31393a22466f6f74657220746869726420636f6c756d6e223b733a31393a22666f6f7465725f666f75727468636f6c756d6e223b733a32303a22466f6f74657220666f7572746820636f6c756d6e223b733a363a22666f6f746572223b733a363a22466f6f746572223b733a31343a2264617368626f6172645f6d61696e223b733a31363a2244617368626f61726420286d61696e29223b733a31373a2264617368626f6172645f73696465626172223b733a31393a2244617368626f61726420287369646562617229223b733a31383a2264617368626f6172645f696e616374697665223b733a32303a2244617368626f6172642028696e61637469766529223b7d733a383a2273657474696e6773223b613a313a7b733a32303a2273686f72746375745f6d6f64756c655f6c696e6b223b733a313a2230223b7d733a373a2270726f6a656374223b733a363a2264727570616c223b733a393a22646174657374616d70223b733a31303a2231333635303237303132223b733a363a22656e67696e65223b733a31313a2270687074656d706c617465223b733a383a226665617475726573223b613a393a7b693a303b733a343a226c6f676f223b693a313b733a373a2266617669636f6e223b693a323b733a343a226e616d65223b693a333b733a363a22736c6f67616e223b693a343b733a31373a226e6f64655f757365725f70696374757265223b693a353b733a32303a22636f6d6d656e745f757365725f70696374757265223b693a363b733a32353a22636f6d6d656e745f757365725f766572696669636174696f6e223b693a373b733a393a226d61696e5f6d656e75223b693a383b733a31343a227365636f6e646172795f6d656e75223b7d733a31303a2273637265656e73686f74223b733a32383a227468656d65732f62617274696b2f73637265656e73686f742e706e67223b733a333a22706870223b733a353a22352e322e34223b733a373a2273637269707473223b613a303a7b7d733a31353a226f7665726c61795f726567696f6e73223b613a353a7b693a303b733a31343a2264617368626f6172645f6d61696e223b693a313b733a31373a2264617368626f6172645f73696465626172223b693a323b733a31383a2264617368626f6172645f696e616374697665223b693a333b733a373a22636f6e74656e74223b693a343b733a343a2268656c70223b7d733a31343a22726567696f6e735f68696464656e223b613a323a7b693a303b733a383a22706167655f746f70223b693a313b733a31313a22706167655f626f74746f6d223b7d733a32383a226f7665726c61795f737570706c656d656e74616c5f726567696f6e73223b613a313a7b693a303b733a383a22706167655f746f70223b7d7d733a363a22707265666978223b733a31313a2270687074656d706c617465223b733a31313a227374796c65736865657473223b613a323a7b733a333a22616c6c223b613a333a7b733a31343a226373732f6c61796f75742e637373223b733a32383a227468656d65732f62617274696b2f6373732f6c61796f75742e637373223b733a31333a226373732f7374796c652e637373223b733a32373a227468656d65732f62617274696b2f6373732f7374796c652e637373223b733a31343a226373732f636f6c6f72732e637373223b733a32383a227468656d65732f62617274696b2f6373732f636f6c6f72732e637373223b7d733a353a227072696e74223b613a313a7b733a31333a226373732f7072696e742e637373223b733a32373a227468656d65732f62617274696b2f6373732f7072696e742e637373223b7d7d733a363a22656e67696e65223b733a31313a2270687074656d706c617465223b7d7d, 'block_admin_demo', 0x613a313a7b693a303b733a363a2262617274696b223b7d, '', 31, 5, 0, '', 'admin/structure/block/demo/bartik', 'Bartik', 't', '', '_block_custom_theme', 'a:1:{i:0;s:6:"bartik";}', 0, '', '', 0, 'modules/block/block.admin.inc');
INSERT INTO `menu_router` VALUES('admin/structure/block/demo/garland', '', '', '_block_themes_access', 0x613a313a7b693a303b4f3a383a22737464436c617373223a31323a7b733a383a2266696c656e616d65223b733a32373a227468656d65732f6761726c616e642f6761726c616e642e696e666f223b733a343a226e616d65223b733a373a226761726c616e64223b733a343a2274797065223b733a353a227468656d65223b733a353a226f776e6572223b733a34353a227468656d65732f656e67696e65732f70687074656d706c6174652f70687074656d706c6174652e656e67696e65223b733a363a22737461747573223b733a313a2230223b733a393a22626f6f747374726170223b733a313a2230223b733a31343a22736368656d615f76657273696f6e223b733a323a222d31223b733a363a22776569676874223b733a313a2230223b733a343a22696e666f223b613a31383a7b733a343a226e616d65223b733a373a224761726c616e64223b733a31313a226465736372697074696f6e223b733a3131313a2241206d756c74692d636f6c756d6e207468656d652077686963682063616e20626520636f6e6669677572656420746f206d6f6469667920636f6c6f727320616e6420737769746368206265747765656e20666978656420616e6420666c756964207769647468206c61796f7574732e223b733a373a227061636b616765223b733a343a22436f7265223b733a373a2276657273696f6e223b733a343a22372e3232223b733a343a22636f7265223b733a333a22372e78223b733a31313a227374796c65736865657473223b613a323a7b733a333a22616c6c223b613a313a7b733a393a227374796c652e637373223b733a32343a227468656d65732f6761726c616e642f7374796c652e637373223b7d733a353a227072696e74223b613a313a7b733a393a227072696e742e637373223b733a32343a227468656d65732f6761726c616e642f7072696e742e637373223b7d7d733a383a2273657474696e6773223b613a313a7b733a31333a226761726c616e645f7769647468223b733a353a22666c756964223b7d733a373a2270726f6a656374223b733a363a2264727570616c223b733a393a22646174657374616d70223b733a31303a2231333635303237303132223b733a363a22656e67696e65223b733a31313a2270687074656d706c617465223b733a373a22726567696f6e73223b613a31323a7b733a31333a22736964656261725f6669727374223b733a31323a224c6566742073696465626172223b733a31343a22736964656261725f7365636f6e64223b733a31333a2252696768742073696465626172223b733a373a22636f6e74656e74223b733a373a22436f6e74656e74223b733a363a22686561646572223b733a363a22486561646572223b733a363a22666f6f746572223b733a363a22466f6f746572223b733a31313a22686967686c696768746564223b733a31313a22486967686c696768746564223b733a343a2268656c70223b733a343a2248656c70223b733a383a22706167655f746f70223b733a383a225061676520746f70223b733a31313a22706167655f626f74746f6d223b733a31313a225061676520626f74746f6d223b733a31343a2264617368626f6172645f6d61696e223b733a31363a2244617368626f61726420286d61696e29223b733a31373a2264617368626f6172645f73696465626172223b733a31393a2244617368626f61726420287369646562617229223b733a31383a2264617368626f6172645f696e616374697665223b733a32303a2244617368626f6172642028696e61637469766529223b7d733a383a226665617475726573223b613a393a7b693a303b733a343a226c6f676f223b693a313b733a373a2266617669636f6e223b693a323b733a343a226e616d65223b693a333b733a363a22736c6f67616e223b693a343b733a31373a226e6f64655f757365725f70696374757265223b693a353b733a32303a22636f6d6d656e745f757365725f70696374757265223b693a363b733a32353a22636f6d6d656e745f757365725f766572696669636174696f6e223b693a373b733a393a226d61696e5f6d656e75223b693a383b733a31343a227365636f6e646172795f6d656e75223b7d733a31303a2273637265656e73686f74223b733a32393a227468656d65732f6761726c616e642f73637265656e73686f742e706e67223b733a333a22706870223b733a353a22352e322e34223b733a373a2273637269707473223b613a303a7b7d733a31353a226f7665726c61795f726567696f6e73223b613a353a7b693a303b733a31343a2264617368626f6172645f6d61696e223b693a313b733a31373a2264617368626f6172645f73696465626172223b693a323b733a31383a2264617368626f6172645f696e616374697665223b693a333b733a373a22636f6e74656e74223b693a343b733a343a2268656c70223b7d733a31343a22726567696f6e735f68696464656e223b613a323a7b693a303b733a383a22706167655f746f70223b693a313b733a31313a22706167655f626f74746f6d223b7d733a32383a226f7665726c61795f737570706c656d656e74616c5f726567696f6e73223b613a313a7b693a303b733a383a22706167655f746f70223b7d7d733a363a22707265666978223b733a31313a2270687074656d706c617465223b733a31313a227374796c65736865657473223b613a323a7b733a333a22616c6c223b613a313a7b733a393a227374796c652e637373223b733a32343a227468656d65732f6761726c616e642f7374796c652e637373223b7d733a353a227072696e74223b613a313a7b733a393a227072696e742e637373223b733a32343a227468656d65732f6761726c616e642f7072696e742e637373223b7d7d733a363a22656e67696e65223b733a31313a2270687074656d706c617465223b7d7d, 'block_admin_demo', 0x613a313a7b693a303b733a373a226761726c616e64223b7d, '', 31, 5, 0, '', 'admin/structure/block/demo/garland', 'Garland', 't', '', '_block_custom_theme', 'a:1:{i:0;s:7:"garland";}', 0, '', '', 0, 'modules/block/block.admin.inc');
INSERT INTO `menu_router` VALUES('admin/structure/block/demo/seven', '', '', '_block_themes_access', 0x613a313a7b693a303b4f3a383a22737464436c617373223a31323a7b733a383a2266696c656e616d65223b733a32333a227468656d65732f736576656e2f736576656e2e696e666f223b733a343a226e616d65223b733a353a22736576656e223b733a343a2274797065223b733a353a227468656d65223b733a353a226f776e6572223b733a34353a227468656d65732f656e67696e65732f70687074656d706c6174652f70687074656d706c6174652e656e67696e65223b733a363a22737461747573223b733a313a2231223b733a393a22626f6f747374726170223b733a313a2230223b733a31343a22736368656d615f76657273696f6e223b733a323a222d31223b733a363a22776569676874223b733a313a2230223b733a343a22696e666f223b613a31383a7b733a343a226e616d65223b733a353a22536576656e223b733a31313a226465736372697074696f6e223b733a36353a22412073696d706c65206f6e652d636f6c756d6e2c207461626c656c6573732c20666c7569642077696474682061646d696e697374726174696f6e207468656d652e223b733a373a227061636b616765223b733a343a22436f7265223b733a373a2276657273696f6e223b733a343a22372e3232223b733a343a22636f7265223b733a333a22372e78223b733a31313a227374796c65736865657473223b613a313a7b733a363a2273637265656e223b613a323a7b733a393a2272657365742e637373223b733a32323a227468656d65732f736576656e2f72657365742e637373223b733a393a227374796c652e637373223b733a32323a227468656d65732f736576656e2f7374796c652e637373223b7d7d733a383a2273657474696e6773223b613a313a7b733a32303a2273686f72746375745f6d6f64756c655f6c696e6b223b733a313a2231223b7d733a373a22726567696f6e73223b613a383a7b733a373a22636f6e74656e74223b733a373a22436f6e74656e74223b733a343a2268656c70223b733a343a2248656c70223b733a383a22706167655f746f70223b733a383a225061676520746f70223b733a31313a22706167655f626f74746f6d223b733a31313a225061676520626f74746f6d223b733a31333a22736964656261725f6669727374223b733a31333a2246697273742073696465626172223b733a31343a2264617368626f6172645f6d61696e223b733a31363a2244617368626f61726420286d61696e29223b733a31373a2264617368626f6172645f73696465626172223b733a31393a2244617368626f61726420287369646562617229223b733a31383a2264617368626f6172645f696e616374697665223b733a32303a2244617368626f6172642028696e61637469766529223b7d733a31343a22726567696f6e735f68696464656e223b613a333a7b693a303b733a31333a22736964656261725f6669727374223b693a313b733a383a22706167655f746f70223b693a323b733a31313a22706167655f626f74746f6d223b7d733a373a2270726f6a656374223b733a363a2264727570616c223b733a393a22646174657374616d70223b733a31303a2231333635303237303132223b733a363a22656e67696e65223b733a31313a2270687074656d706c617465223b733a383a226665617475726573223b613a393a7b693a303b733a343a226c6f676f223b693a313b733a373a2266617669636f6e223b693a323b733a343a226e616d65223b693a333b733a363a22736c6f67616e223b693a343b733a31373a226e6f64655f757365725f70696374757265223b693a353b733a32303a22636f6d6d656e745f757365725f70696374757265223b693a363b733a32353a22636f6d6d656e745f757365725f766572696669636174696f6e223b693a373b733a393a226d61696e5f6d656e75223b693a383b733a31343a227365636f6e646172795f6d656e75223b7d733a31303a2273637265656e73686f74223b733a32373a227468656d65732f736576656e2f73637265656e73686f742e706e67223b733a333a22706870223b733a353a22352e322e34223b733a373a2273637269707473223b613a303a7b7d733a31353a226f7665726c61795f726567696f6e73223b613a353a7b693a303b733a31343a2264617368626f6172645f6d61696e223b693a313b733a31373a2264617368626f6172645f73696465626172223b693a323b733a31383a2264617368626f6172645f696e616374697665223b693a333b733a373a22636f6e74656e74223b693a343b733a343a2268656c70223b7d733a32383a226f7665726c61795f737570706c656d656e74616c5f726567696f6e73223b613a313a7b693a303b733a383a22706167655f746f70223b7d7d733a363a22707265666978223b733a31313a2270687074656d706c617465223b733a31313a227374796c65736865657473223b613a313a7b733a363a2273637265656e223b613a323a7b733a393a2272657365742e637373223b733a32323a227468656d65732f736576656e2f72657365742e637373223b733a393a227374796c652e637373223b733a32323a227468656d65732f736576656e2f7374796c652e637373223b7d7d733a363a22656e67696e65223b733a31313a2270687074656d706c617465223b7d7d, 'block_admin_demo', 0x613a313a7b693a303b733a353a22736576656e223b7d, '', 31, 5, 0, '', 'admin/structure/block/demo/seven', 'Seven', 't', '', '_block_custom_theme', 'a:1:{i:0;s:5:"seven";}', 0, '', '', 0, 'modules/block/block.admin.inc');
INSERT INTO `menu_router` VALUES('admin/structure/block/demo/stark', '', '', '_block_themes_access', 0x613a313a7b693a303b4f3a383a22737464436c617373223a31323a7b733a383a2266696c656e616d65223b733a32333a227468656d65732f737461726b2f737461726b2e696e666f223b733a343a226e616d65223b733a353a22737461726b223b733a343a2274797065223b733a353a227468656d65223b733a353a226f776e6572223b733a34353a227468656d65732f656e67696e65732f70687074656d706c6174652f70687074656d706c6174652e656e67696e65223b733a363a22737461747573223b733a313a2230223b733a393a22626f6f747374726170223b733a313a2230223b733a31343a22736368656d615f76657273696f6e223b733a323a222d31223b733a363a22776569676874223b733a313a2230223b733a343a22696e666f223b613a31373a7b733a343a226e616d65223b733a353a22537461726b223b733a31313a226465736372697074696f6e223b733a3230383a2254686973207468656d652064656d6f6e737472617465732044727570616c27732064656661756c742048544d4c206d61726b757020616e6420435353207374796c65732e20546f206c6561726e20686f7720746f206275696c6420796f7572206f776e207468656d6520616e64206f766572726964652044727570616c27732064656661756c7420636f64652c2073656520746865203c6120687265663d22687474703a2f2f64727570616c2e6f72672f7468656d652d6775696465223e5468656d696e672047756964653c2f613e2e223b733a373a227061636b616765223b733a343a22436f7265223b733a373a2276657273696f6e223b733a343a22372e3232223b733a343a22636f7265223b733a333a22372e78223b733a31313a227374796c65736865657473223b613a313a7b733a333a22616c6c223b613a313a7b733a31303a226c61796f75742e637373223b733a32333a227468656d65732f737461726b2f6c61796f75742e637373223b7d7d733a373a2270726f6a656374223b733a363a2264727570616c223b733a393a22646174657374616d70223b733a31303a2231333635303237303132223b733a363a22656e67696e65223b733a31313a2270687074656d706c617465223b733a373a22726567696f6e73223b613a31323a7b733a31333a22736964656261725f6669727374223b733a31323a224c6566742073696465626172223b733a31343a22736964656261725f7365636f6e64223b733a31333a2252696768742073696465626172223b733a373a22636f6e74656e74223b733a373a22436f6e74656e74223b733a363a22686561646572223b733a363a22486561646572223b733a363a22666f6f746572223b733a363a22466f6f746572223b733a31313a22686967686c696768746564223b733a31313a22486967686c696768746564223b733a343a2268656c70223b733a343a2248656c70223b733a383a22706167655f746f70223b733a383a225061676520746f70223b733a31313a22706167655f626f74746f6d223b733a31313a225061676520626f74746f6d223b733a31343a2264617368626f6172645f6d61696e223b733a31363a2244617368626f61726420286d61696e29223b733a31373a2264617368626f6172645f73696465626172223b733a31393a2244617368626f61726420287369646562617229223b733a31383a2264617368626f6172645f696e616374697665223b733a32303a2244617368626f6172642028696e61637469766529223b7d733a383a226665617475726573223b613a393a7b693a303b733a343a226c6f676f223b693a313b733a373a2266617669636f6e223b693a323b733a343a226e616d65223b693a333b733a363a22736c6f67616e223b693a343b733a31373a226e6f64655f757365725f70696374757265223b693a353b733a32303a22636f6d6d656e745f757365725f70696374757265223b693a363b733a32353a22636f6d6d656e745f757365725f766572696669636174696f6e223b693a373b733a393a226d61696e5f6d656e75223b693a383b733a31343a227365636f6e646172795f6d656e75223b7d733a31303a2273637265656e73686f74223b733a32373a227468656d65732f737461726b2f73637265656e73686f742e706e67223b733a333a22706870223b733a353a22352e322e34223b733a373a2273637269707473223b613a303a7b7d733a31353a226f7665726c61795f726567696f6e73223b613a353a7b693a303b733a31343a2264617368626f6172645f6d61696e223b693a313b733a31373a2264617368626f6172645f73696465626172223b693a323b733a31383a2264617368626f6172645f696e616374697665223b693a333b733a373a22636f6e74656e74223b693a343b733a343a2268656c70223b7d733a31343a22726567696f6e735f68696464656e223b613a323a7b693a303b733a383a22706167655f746f70223b693a313b733a31313a22706167655f626f74746f6d223b7d733a32383a226f7665726c61795f737570706c656d656e74616c5f726567696f6e73223b613a313a7b693a303b733a383a22706167655f746f70223b7d7d733a363a22707265666978223b733a31313a2270687074656d706c617465223b733a31313a227374796c65736865657473223b613a313a7b733a333a22616c6c223b613a313a7b733a31303a226c61796f75742e637373223b733a32333a227468656d65732f737461726b2f6c61796f75742e637373223b7d7d733a363a22656e67696e65223b733a31313a2270687074656d706c617465223b7d7d, 'block_admin_demo', 0x613a313a7b693a303b733a353a22737461726b223b7d, '', 31, 5, 0, '', 'admin/structure/block/demo/stark', 'Stark', 't', '', '_block_custom_theme', 'a:1:{i:0;s:5:"stark";}', 0, '', '', 0, 'modules/block/block.admin.inc');
INSERT INTO `menu_router` VALUES('admin/structure/block/list/bartik', '', '', '_block_themes_access', 0x613a313a7b693a303b4f3a383a22737464436c617373223a31323a7b733a383a2266696c656e616d65223b733a32353a227468656d65732f62617274696b2f62617274696b2e696e666f223b733a343a226e616d65223b733a363a2262617274696b223b733a343a2274797065223b733a353a227468656d65223b733a353a226f776e6572223b733a34353a227468656d65732f656e67696e65732f70687074656d706c6174652f70687074656d706c6174652e656e67696e65223b733a363a22737461747573223b733a313a2231223b733a393a22626f6f747374726170223b733a313a2230223b733a31343a22736368656d615f76657273696f6e223b733a323a222d31223b733a363a22776569676874223b733a313a2230223b733a343a22696e666f223b613a31383a7b733a343a226e616d65223b733a363a2242617274696b223b733a31313a226465736372697074696f6e223b733a34383a224120666c657869626c652c207265636f6c6f7261626c65207468656d652077697468206d616e7920726567696f6e732e223b733a373a227061636b616765223b733a343a22436f7265223b733a373a2276657273696f6e223b733a343a22372e3232223b733a343a22636f7265223b733a333a22372e78223b733a31313a227374796c65736865657473223b613a323a7b733a333a22616c6c223b613a333a7b733a31343a226373732f6c61796f75742e637373223b733a32383a227468656d65732f62617274696b2f6373732f6c61796f75742e637373223b733a31333a226373732f7374796c652e637373223b733a32373a227468656d65732f62617274696b2f6373732f7374796c652e637373223b733a31343a226373732f636f6c6f72732e637373223b733a32383a227468656d65732f62617274696b2f6373732f636f6c6f72732e637373223b7d733a353a227072696e74223b613a313a7b733a31333a226373732f7072696e742e637373223b733a32373a227468656d65732f62617274696b2f6373732f7072696e742e637373223b7d7d733a373a22726567696f6e73223b613a32303a7b733a363a22686561646572223b733a363a22486561646572223b733a343a2268656c70223b733a343a2248656c70223b733a383a22706167655f746f70223b733a383a225061676520746f70223b733a31313a22706167655f626f74746f6d223b733a31313a225061676520626f74746f6d223b733a31313a22686967686c696768746564223b733a31313a22486967686c696768746564223b733a383a226665617475726564223b733a383a224665617475726564223b733a373a22636f6e74656e74223b733a373a22436f6e74656e74223b733a31333a22736964656261725f6669727374223b733a31333a2253696465626172206669727374223b733a31343a22736964656261725f7365636f6e64223b733a31343a2253696465626172207365636f6e64223b733a31343a2274726970747963685f6669727374223b733a31343a225472697074796368206669727374223b733a31353a2274726970747963685f6d6964646c65223b733a31353a225472697074796368206d6964646c65223b733a31333a2274726970747963685f6c617374223b733a31333a225472697074796368206c617374223b733a31383a22666f6f7465725f6669727374636f6c756d6e223b733a31393a22466f6f74657220666972737420636f6c756d6e223b733a31393a22666f6f7465725f7365636f6e64636f6c756d6e223b733a32303a22466f6f746572207365636f6e6420636f6c756d6e223b733a31383a22666f6f7465725f7468697264636f6c756d6e223b733a31393a22466f6f74657220746869726420636f6c756d6e223b733a31393a22666f6f7465725f666f75727468636f6c756d6e223b733a32303a22466f6f74657220666f7572746820636f6c756d6e223b733a363a22666f6f746572223b733a363a22466f6f746572223b733a31343a2264617368626f6172645f6d61696e223b733a31363a2244617368626f61726420286d61696e29223b733a31373a2264617368626f6172645f73696465626172223b733a31393a2244617368626f61726420287369646562617229223b733a31383a2264617368626f6172645f696e616374697665223b733a32303a2244617368626f6172642028696e61637469766529223b7d733a383a2273657474696e6773223b613a313a7b733a32303a2273686f72746375745f6d6f64756c655f6c696e6b223b733a313a2230223b7d733a373a2270726f6a656374223b733a363a2264727570616c223b733a393a22646174657374616d70223b733a31303a2231333635303237303132223b733a363a22656e67696e65223b733a31313a2270687074656d706c617465223b733a383a226665617475726573223b613a393a7b693a303b733a343a226c6f676f223b693a313b733a373a2266617669636f6e223b693a323b733a343a226e616d65223b693a333b733a363a22736c6f67616e223b693a343b733a31373a226e6f64655f757365725f70696374757265223b693a353b733a32303a22636f6d6d656e745f757365725f70696374757265223b693a363b733a32353a22636f6d6d656e745f757365725f766572696669636174696f6e223b693a373b733a393a226d61696e5f6d656e75223b693a383b733a31343a227365636f6e646172795f6d656e75223b7d733a31303a2273637265656e73686f74223b733a32383a227468656d65732f62617274696b2f73637265656e73686f742e706e67223b733a333a22706870223b733a353a22352e322e34223b733a373a2273637269707473223b613a303a7b7d733a31353a226f7665726c61795f726567696f6e73223b613a353a7b693a303b733a31343a2264617368626f6172645f6d61696e223b693a313b733a31373a2264617368626f6172645f73696465626172223b693a323b733a31383a2264617368626f6172645f696e616374697665223b693a333b733a373a22636f6e74656e74223b693a343b733a343a2268656c70223b7d733a31343a22726567696f6e735f68696464656e223b613a323a7b693a303b733a383a22706167655f746f70223b693a313b733a31313a22706167655f626f74746f6d223b7d733a32383a226f7665726c61795f737570706c656d656e74616c5f726567696f6e73223b613a313a7b693a303b733a383a22706167655f746f70223b7d7d733a363a22707265666978223b733a31313a2270687074656d706c617465223b733a31313a227374796c65736865657473223b613a323a7b733a333a22616c6c223b613a333a7b733a31343a226373732f6c61796f75742e637373223b733a32383a227468656d65732f62617274696b2f6373732f6c61796f75742e637373223b733a31333a226373732f7374796c652e637373223b733a32373a227468656d65732f62617274696b2f6373732f7374796c652e637373223b733a31343a226373732f636f6c6f72732e637373223b733a32383a227468656d65732f62617274696b2f6373732f636f6c6f72732e637373223b7d733a353a227072696e74223b613a313a7b733a31333a226373732f7072696e742e637373223b733a32373a227468656d65732f62617274696b2f6373732f7072696e742e637373223b7d7d733a363a22656e67696e65223b733a31313a2270687074656d706c617465223b7d7d, 'block_admin_display', 0x613a313a7b693a303b733a363a2262617274696b223b7d, '', 31, 5, 1, 'admin/structure/block', 'admin/structure/block', 'Bartik', 't', '', '', 'a:0:{}', 140, '', '', -10, 'modules/block/block.admin.inc');
INSERT INTO `menu_router` VALUES('admin/structure/block/list/garland', '', '', '_block_themes_access', 0x613a313a7b693a303b4f3a383a22737464436c617373223a31323a7b733a383a2266696c656e616d65223b733a32373a227468656d65732f6761726c616e642f6761726c616e642e696e666f223b733a343a226e616d65223b733a373a226761726c616e64223b733a343a2274797065223b733a353a227468656d65223b733a353a226f776e6572223b733a34353a227468656d65732f656e67696e65732f70687074656d706c6174652f70687074656d706c6174652e656e67696e65223b733a363a22737461747573223b733a313a2230223b733a393a22626f6f747374726170223b733a313a2230223b733a31343a22736368656d615f76657273696f6e223b733a323a222d31223b733a363a22776569676874223b733a313a2230223b733a343a22696e666f223b613a31383a7b733a343a226e616d65223b733a373a224761726c616e64223b733a31313a226465736372697074696f6e223b733a3131313a2241206d756c74692d636f6c756d6e207468656d652077686963682063616e20626520636f6e6669677572656420746f206d6f6469667920636f6c6f727320616e6420737769746368206265747765656e20666978656420616e6420666c756964207769647468206c61796f7574732e223b733a373a227061636b616765223b733a343a22436f7265223b733a373a2276657273696f6e223b733a343a22372e3232223b733a343a22636f7265223b733a333a22372e78223b733a31313a227374796c65736865657473223b613a323a7b733a333a22616c6c223b613a313a7b733a393a227374796c652e637373223b733a32343a227468656d65732f6761726c616e642f7374796c652e637373223b7d733a353a227072696e74223b613a313a7b733a393a227072696e742e637373223b733a32343a227468656d65732f6761726c616e642f7072696e742e637373223b7d7d733a383a2273657474696e6773223b613a313a7b733a31333a226761726c616e645f7769647468223b733a353a22666c756964223b7d733a373a2270726f6a656374223b733a363a2264727570616c223b733a393a22646174657374616d70223b733a31303a2231333635303237303132223b733a363a22656e67696e65223b733a31313a2270687074656d706c617465223b733a373a22726567696f6e73223b613a31323a7b733a31333a22736964656261725f6669727374223b733a31323a224c6566742073696465626172223b733a31343a22736964656261725f7365636f6e64223b733a31333a2252696768742073696465626172223b733a373a22636f6e74656e74223b733a373a22436f6e74656e74223b733a363a22686561646572223b733a363a22486561646572223b733a363a22666f6f746572223b733a363a22466f6f746572223b733a31313a22686967686c696768746564223b733a31313a22486967686c696768746564223b733a343a2268656c70223b733a343a2248656c70223b733a383a22706167655f746f70223b733a383a225061676520746f70223b733a31313a22706167655f626f74746f6d223b733a31313a225061676520626f74746f6d223b733a31343a2264617368626f6172645f6d61696e223b733a31363a2244617368626f61726420286d61696e29223b733a31373a2264617368626f6172645f73696465626172223b733a31393a2244617368626f61726420287369646562617229223b733a31383a2264617368626f6172645f696e616374697665223b733a32303a2244617368626f6172642028696e61637469766529223b7d733a383a226665617475726573223b613a393a7b693a303b733a343a226c6f676f223b693a313b733a373a2266617669636f6e223b693a323b733a343a226e616d65223b693a333b733a363a22736c6f67616e223b693a343b733a31373a226e6f64655f757365725f70696374757265223b693a353b733a32303a22636f6d6d656e745f757365725f70696374757265223b693a363b733a32353a22636f6d6d656e745f757365725f766572696669636174696f6e223b693a373b733a393a226d61696e5f6d656e75223b693a383b733a31343a227365636f6e646172795f6d656e75223b7d733a31303a2273637265656e73686f74223b733a32393a227468656d65732f6761726c616e642f73637265656e73686f742e706e67223b733a333a22706870223b733a353a22352e322e34223b733a373a2273637269707473223b613a303a7b7d733a31353a226f7665726c61795f726567696f6e73223b613a353a7b693a303b733a31343a2264617368626f6172645f6d61696e223b693a313b733a31373a2264617368626f6172645f73696465626172223b693a323b733a31383a2264617368626f6172645f696e616374697665223b693a333b733a373a22636f6e74656e74223b693a343b733a343a2268656c70223b7d733a31343a22726567696f6e735f68696464656e223b613a323a7b693a303b733a383a22706167655f746f70223b693a313b733a31313a22706167655f626f74746f6d223b7d733a32383a226f7665726c61795f737570706c656d656e74616c5f726567696f6e73223b613a313a7b693a303b733a383a22706167655f746f70223b7d7d733a363a22707265666978223b733a31313a2270687074656d706c617465223b733a31313a227374796c65736865657473223b613a323a7b733a333a22616c6c223b613a313a7b733a393a227374796c652e637373223b733a32343a227468656d65732f6761726c616e642f7374796c652e637373223b7d733a353a227072696e74223b613a313a7b733a393a227072696e742e637373223b733a32343a227468656d65732f6761726c616e642f7072696e742e637373223b7d7d733a363a22656e67696e65223b733a31313a2270687074656d706c617465223b7d7d, 'block_admin_display', 0x613a313a7b693a303b733a373a226761726c616e64223b7d, '', 31, 5, 1, 'admin/structure/block', 'admin/structure/block', 'Garland', 't', '', '', 'a:0:{}', 132, '', '', 0, 'modules/block/block.admin.inc');
INSERT INTO `menu_router` VALUES('admin/structure/block/list/garland/add', '', '', 'user_access', 0x613a313a7b693a303b733a31373a2261646d696e697374657220626c6f636b73223b7d, 'drupal_get_form', 0x613a313a7b693a303b733a32303a22626c6f636b5f6164645f626c6f636b5f666f726d223b7d, '', 63, 6, 1, 'admin/structure/block/list/garland', 'admin/structure/block', 'Add block', 't', '', '', 'a:0:{}', 388, '', '', 0, 'modules/block/block.admin.inc');
INSERT INTO `menu_router` VALUES('admin/structure/block/list/seven', '', '', '_block_themes_access', 0x613a313a7b693a303b4f3a383a22737464436c617373223a31323a7b733a383a2266696c656e616d65223b733a32333a227468656d65732f736576656e2f736576656e2e696e666f223b733a343a226e616d65223b733a353a22736576656e223b733a343a2274797065223b733a353a227468656d65223b733a353a226f776e6572223b733a34353a227468656d65732f656e67696e65732f70687074656d706c6174652f70687074656d706c6174652e656e67696e65223b733a363a22737461747573223b733a313a2231223b733a393a22626f6f747374726170223b733a313a2230223b733a31343a22736368656d615f76657273696f6e223b733a323a222d31223b733a363a22776569676874223b733a313a2230223b733a343a22696e666f223b613a31383a7b733a343a226e616d65223b733a353a22536576656e223b733a31313a226465736372697074696f6e223b733a36353a22412073696d706c65206f6e652d636f6c756d6e2c207461626c656c6573732c20666c7569642077696474682061646d696e697374726174696f6e207468656d652e223b733a373a227061636b616765223b733a343a22436f7265223b733a373a2276657273696f6e223b733a343a22372e3232223b733a343a22636f7265223b733a333a22372e78223b733a31313a227374796c65736865657473223b613a313a7b733a363a2273637265656e223b613a323a7b733a393a2272657365742e637373223b733a32323a227468656d65732f736576656e2f72657365742e637373223b733a393a227374796c652e637373223b733a32323a227468656d65732f736576656e2f7374796c652e637373223b7d7d733a383a2273657474696e6773223b613a313a7b733a32303a2273686f72746375745f6d6f64756c655f6c696e6b223b733a313a2231223b7d733a373a22726567696f6e73223b613a383a7b733a373a22636f6e74656e74223b733a373a22436f6e74656e74223b733a343a2268656c70223b733a343a2248656c70223b733a383a22706167655f746f70223b733a383a225061676520746f70223b733a31313a22706167655f626f74746f6d223b733a31313a225061676520626f74746f6d223b733a31333a22736964656261725f6669727374223b733a31333a2246697273742073696465626172223b733a31343a2264617368626f6172645f6d61696e223b733a31363a2244617368626f61726420286d61696e29223b733a31373a2264617368626f6172645f73696465626172223b733a31393a2244617368626f61726420287369646562617229223b733a31383a2264617368626f6172645f696e616374697665223b733a32303a2244617368626f6172642028696e61637469766529223b7d733a31343a22726567696f6e735f68696464656e223b613a333a7b693a303b733a31333a22736964656261725f6669727374223b693a313b733a383a22706167655f746f70223b693a323b733a31313a22706167655f626f74746f6d223b7d733a373a2270726f6a656374223b733a363a2264727570616c223b733a393a22646174657374616d70223b733a31303a2231333635303237303132223b733a363a22656e67696e65223b733a31313a2270687074656d706c617465223b733a383a226665617475726573223b613a393a7b693a303b733a343a226c6f676f223b693a313b733a373a2266617669636f6e223b693a323b733a343a226e616d65223b693a333b733a363a22736c6f67616e223b693a343b733a31373a226e6f64655f757365725f70696374757265223b693a353b733a32303a22636f6d6d656e745f757365725f70696374757265223b693a363b733a32353a22636f6d6d656e745f757365725f766572696669636174696f6e223b693a373b733a393a226d61696e5f6d656e75223b693a383b733a31343a227365636f6e646172795f6d656e75223b7d733a31303a2273637265656e73686f74223b733a32373a227468656d65732f736576656e2f73637265656e73686f742e706e67223b733a333a22706870223b733a353a22352e322e34223b733a373a2273637269707473223b613a303a7b7d733a31353a226f7665726c61795f726567696f6e73223b613a353a7b693a303b733a31343a2264617368626f6172645f6d61696e223b693a313b733a31373a2264617368626f6172645f73696465626172223b693a323b733a31383a2264617368626f6172645f696e616374697665223b693a333b733a373a22636f6e74656e74223b693a343b733a343a2268656c70223b7d733a32383a226f7665726c61795f737570706c656d656e74616c5f726567696f6e73223b613a313a7b693a303b733a383a22706167655f746f70223b7d7d733a363a22707265666978223b733a31313a2270687074656d706c617465223b733a31313a227374796c65736865657473223b613a313a7b733a363a2273637265656e223b613a323a7b733a393a2272657365742e637373223b733a32323a227468656d65732f736576656e2f72657365742e637373223b733a393a227374796c652e637373223b733a32323a227468656d65732f736576656e2f7374796c652e637373223b7d7d733a363a22656e67696e65223b733a31313a2270687074656d706c617465223b7d7d, 'block_admin_display', 0x613a313a7b693a303b733a353a22736576656e223b7d, '', 31, 5, 1, 'admin/structure/block', 'admin/structure/block', 'Seven', 't', '', '', 'a:0:{}', 132, '', '', 0, 'modules/block/block.admin.inc');
INSERT INTO `menu_router` VALUES('admin/structure/block/list/seven/add', '', '', 'user_access', 0x613a313a7b693a303b733a31373a2261646d696e697374657220626c6f636b73223b7d, 'drupal_get_form', 0x613a313a7b693a303b733a32303a22626c6f636b5f6164645f626c6f636b5f666f726d223b7d, '', 63, 6, 1, 'admin/structure/block/list/seven', 'admin/structure/block', 'Add block', 't', '', '', 'a:0:{}', 388, '', '', 0, 'modules/block/block.admin.inc');
INSERT INTO `menu_router` VALUES('admin/structure/block/list/stark', '', '', '_block_themes_access', 0x613a313a7b693a303b4f3a383a22737464436c617373223a31323a7b733a383a2266696c656e616d65223b733a32333a227468656d65732f737461726b2f737461726b2e696e666f223b733a343a226e616d65223b733a353a22737461726b223b733a343a2274797065223b733a353a227468656d65223b733a353a226f776e6572223b733a34353a227468656d65732f656e67696e65732f70687074656d706c6174652f70687074656d706c6174652e656e67696e65223b733a363a22737461747573223b733a313a2230223b733a393a22626f6f747374726170223b733a313a2230223b733a31343a22736368656d615f76657273696f6e223b733a323a222d31223b733a363a22776569676874223b733a313a2230223b733a343a22696e666f223b613a31373a7b733a343a226e616d65223b733a353a22537461726b223b733a31313a226465736372697074696f6e223b733a3230383a2254686973207468656d652064656d6f6e737472617465732044727570616c27732064656661756c742048544d4c206d61726b757020616e6420435353207374796c65732e20546f206c6561726e20686f7720746f206275696c6420796f7572206f776e207468656d6520616e64206f766572726964652044727570616c27732064656661756c7420636f64652c2073656520746865203c6120687265663d22687474703a2f2f64727570616c2e6f72672f7468656d652d6775696465223e5468656d696e672047756964653c2f613e2e223b733a373a227061636b616765223b733a343a22436f7265223b733a373a2276657273696f6e223b733a343a22372e3232223b733a343a22636f7265223b733a333a22372e78223b733a31313a227374796c65736865657473223b613a313a7b733a333a22616c6c223b613a313a7b733a31303a226c61796f75742e637373223b733a32333a227468656d65732f737461726b2f6c61796f75742e637373223b7d7d733a373a2270726f6a656374223b733a363a2264727570616c223b733a393a22646174657374616d70223b733a31303a2231333635303237303132223b733a363a22656e67696e65223b733a31313a2270687074656d706c617465223b733a373a22726567696f6e73223b613a31323a7b733a31333a22736964656261725f6669727374223b733a31323a224c6566742073696465626172223b733a31343a22736964656261725f7365636f6e64223b733a31333a2252696768742073696465626172223b733a373a22636f6e74656e74223b733a373a22436f6e74656e74223b733a363a22686561646572223b733a363a22486561646572223b733a363a22666f6f746572223b733a363a22466f6f746572223b733a31313a22686967686c696768746564223b733a31313a22486967686c696768746564223b733a343a2268656c70223b733a343a2248656c70223b733a383a22706167655f746f70223b733a383a225061676520746f70223b733a31313a22706167655f626f74746f6d223b733a31313a225061676520626f74746f6d223b733a31343a2264617368626f6172645f6d61696e223b733a31363a2244617368626f61726420286d61696e29223b733a31373a2264617368626f6172645f73696465626172223b733a31393a2244617368626f61726420287369646562617229223b733a31383a2264617368626f6172645f696e616374697665223b733a32303a2244617368626f6172642028696e61637469766529223b7d733a383a226665617475726573223b613a393a7b693a303b733a343a226c6f676f223b693a313b733a373a2266617669636f6e223b693a323b733a343a226e616d65223b693a333b733a363a22736c6f67616e223b693a343b733a31373a226e6f64655f757365725f70696374757265223b693a353b733a32303a22636f6d6d656e745f757365725f70696374757265223b693a363b733a32353a22636f6d6d656e745f757365725f766572696669636174696f6e223b693a373b733a393a226d61696e5f6d656e75223b693a383b733a31343a227365636f6e646172795f6d656e75223b7d733a31303a2273637265656e73686f74223b733a32373a227468656d65732f737461726b2f73637265656e73686f742e706e67223b733a333a22706870223b733a353a22352e322e34223b733a373a2273637269707473223b613a303a7b7d733a31353a226f7665726c61795f726567696f6e73223b613a353a7b693a303b733a31343a2264617368626f6172645f6d61696e223b693a313b733a31373a2264617368626f6172645f73696465626172223b693a323b733a31383a2264617368626f6172645f696e616374697665223b693a333b733a373a22636f6e74656e74223b693a343b733a343a2268656c70223b7d733a31343a22726567696f6e735f68696464656e223b613a323a7b693a303b733a383a22706167655f746f70223b693a313b733a31313a22706167655f626f74746f6d223b7d733a32383a226f7665726c61795f737570706c656d656e74616c5f726567696f6e73223b613a313a7b693a303b733a383a22706167655f746f70223b7d7d733a363a22707265666978223b733a31313a2270687074656d706c617465223b733a31313a227374796c65736865657473223b613a313a7b733a333a22616c6c223b613a313a7b733a31303a226c61796f75742e637373223b733a32333a227468656d65732f737461726b2f6c61796f75742e637373223b7d7d733a363a22656e67696e65223b733a31313a2270687074656d706c617465223b7d7d, 'block_admin_display', 0x613a313a7b693a303b733a353a22737461726b223b7d, '', 31, 5, 1, 'admin/structure/block', 'admin/structure/block', 'Stark', 't', '', '', 'a:0:{}', 132, '', '', 0, 'modules/block/block.admin.inc');
INSERT INTO `menu_router` VALUES('admin/structure/block/list/stark/add', '', '', 'user_access', 0x613a313a7b693a303b733a31373a2261646d696e697374657220626c6f636b73223b7d, 'drupal_get_form', 0x613a313a7b693a303b733a32303a22626c6f636b5f6164645f626c6f636b5f666f726d223b7d, '', 63, 6, 1, 'admin/structure/block/list/stark', 'admin/structure/block', 'Add block', 't', '', '', 'a:0:{}', 388, '', '', 0, 'modules/block/block.admin.inc');
INSERT INTO `menu_router` VALUES('admin/structure/block/manage/%/%', 0x613a323a7b693a343b4e3b693a353b4e3b7d, '', 'user_access', 0x613a313a7b693a303b733a31373a2261646d696e697374657220626c6f636b73223b7d, 'drupal_get_form', 0x613a333a7b693a303b733a32313a22626c6f636b5f61646d696e5f636f6e666967757265223b693a313b693a343b693a323b693a353b7d, '', 60, 6, 0, '', 'admin/structure/block/manage/%/%', 'Configure block', 't', '', '', 'a:0:{}', 6, '', '', 0, 'modules/block/block.admin.inc');
INSERT INTO `menu_router` VALUES('admin/structure/block/manage/%/%/configure', 0x613a323a7b693a343b4e3b693a353b4e3b7d, '', 'user_access', 0x613a313a7b693a303b733a31373a2261646d696e697374657220626c6f636b73223b7d, 'drupal_get_form', 0x613a333a7b693a303b733a32313a22626c6f636b5f61646d696e5f636f6e666967757265223b693a313b693a343b693a323b693a353b7d, '', 121, 7, 2, 'admin/structure/block/manage/%/%', 'admin/structure/block/manage/%/%', 'Configure block', 't', '', '', 'a:0:{}', 140, '', '', 0, 'modules/block/block.admin.inc');
INSERT INTO `menu_router` VALUES('admin/structure/block/manage/%/%/delete', 0x613a323a7b693a343b4e3b693a353b4e3b7d, '', 'user_access', 0x613a313a7b693a303b733a31373a2261646d696e697374657220626c6f636b73223b7d, 'drupal_get_form', 0x613a333a7b693a303b733a32353a22626c6f636b5f637573746f6d5f626c6f636b5f64656c657465223b693a313b693a343b693a323b693a353b7d, '', 121, 7, 0, 'admin/structure/block/manage/%/%', 'admin/structure/block/manage/%/%', 'Delete block', 't', '', '', 'a:0:{}', 132, '', '', 0, 'modules/block/block.admin.inc');
INSERT INTO `menu_router` VALUES('admin/structure/menu', '', '', 'user_access', 0x613a313a7b693a303b733a31353a2261646d696e6973746572206d656e75223b7d, 'menu_overview_page', 0x613a303a7b7d, '', 7, 3, 0, '', 'admin/structure/menu', 'Menus', 't', '', '', 'a:0:{}', 6, 'Add new menus to your site, edit existing menus, and rename and reorganize menu links.', '', 0, 'modules/menu/menu.admin.inc');
INSERT INTO `menu_router` VALUES('admin/structure/menu/add', '', '', 'user_access', 0x613a313a7b693a303b733a31353a2261646d696e6973746572206d656e75223b7d, 'drupal_get_form', 0x613a323a7b693a303b733a31343a226d656e755f656469745f6d656e75223b693a313b733a333a22616464223b7d, '', 15, 4, 1, 'admin/structure/menu', 'admin/structure/menu', 'Add menu', 't', '', '', 'a:0:{}', 388, '', '', 0, 'modules/menu/menu.admin.inc');
INSERT INTO `menu_router` VALUES('admin/structure/menu/item/%/delete', 0x613a313a7b693a343b733a31343a226d656e755f6c696e6b5f6c6f6164223b7d, '', 'user_access', 0x613a313a7b693a303b733a31353a2261646d696e6973746572206d656e75223b7d, 'menu_item_delete_page', 0x613a313a7b693a303b693a343b7d, '', 61, 6, 0, '', 'admin/structure/menu/item/%/delete', 'Delete menu link', 't', '', '', 'a:0:{}', 6, '', '', 0, 'modules/menu/menu.admin.inc');
INSERT INTO `menu_router` VALUES('admin/structure/menu/item/%/edit', 0x613a313a7b693a343b733a31343a226d656e755f6c696e6b5f6c6f6164223b7d, '', 'user_access', 0x613a313a7b693a303b733a31353a2261646d696e6973746572206d656e75223b7d, 'drupal_get_form', 0x613a343a7b693a303b733a31343a226d656e755f656469745f6974656d223b693a313b733a343a2265646974223b693a323b693a343b693a333b4e3b7d, '', 61, 6, 0, '', 'admin/structure/menu/item/%/edit', 'Edit menu link', 't', '', '', 'a:0:{}', 6, '', '', 0, 'modules/menu/menu.admin.inc');
INSERT INTO `menu_router` VALUES('admin/structure/menu/item/%/reset', 0x613a313a7b693a343b733a31343a226d656e755f6c696e6b5f6c6f6164223b7d, '', 'user_access', 0x613a313a7b693a303b733a31353a2261646d696e6973746572206d656e75223b7d, 'drupal_get_form', 0x613a323a7b693a303b733a32333a226d656e755f72657365745f6974656d5f636f6e6669726d223b693a313b693a343b7d, '', 61, 6, 0, '', 'admin/structure/menu/item/%/reset', 'Reset menu link', 't', '', '', 'a:0:{}', 6, '', '', 0, 'modules/menu/menu.admin.inc');
INSERT INTO `menu_router` VALUES('admin/structure/menu/list', '', '', 'user_access', 0x613a313a7b693a303b733a31353a2261646d696e6973746572206d656e75223b7d, 'menu_overview_page', 0x613a303a7b7d, '', 15, 4, 1, 'admin/structure/menu', 'admin/structure/menu', 'List menus', 't', '', '', 'a:0:{}', 140, '', '', -10, 'modules/menu/menu.admin.inc');
INSERT INTO `menu_router` VALUES('admin/structure/menu/manage/%', 0x613a313a7b693a343b733a393a226d656e755f6c6f6164223b7d, '', 'user_access', 0x613a313a7b693a303b733a31353a2261646d696e6973746572206d656e75223b7d, 'drupal_get_form', 0x613a323a7b693a303b733a31383a226d656e755f6f766572766965775f666f726d223b693a313b693a343b7d, '', 30, 5, 0, '', 'admin/structure/menu/manage/%', 'Customize menu', 'menu_overview_title', 'a:1:{i:0;i:4;}', '', 'a:0:{}', 6, '', '', 0, 'modules/menu/menu.admin.inc');
INSERT INTO `menu_router` VALUES('admin/structure/menu/manage/%/add', 0x613a313a7b693a343b733a393a226d656e755f6c6f6164223b7d, '', 'user_access', 0x613a313a7b693a303b733a31353a2261646d696e6973746572206d656e75223b7d, 'drupal_get_form', 0x613a343a7b693a303b733a31343a226d656e755f656469745f6974656d223b693a313b733a333a22616464223b693a323b4e3b693a333b693a343b7d, '', 61, 6, 1, 'admin/structure/menu/manage/%', 'admin/structure/menu/manage/%', 'Add link', 't', '', '', 'a:0:{}', 388, '', '', 0, 'modules/menu/menu.admin.inc');
INSERT INTO `menu_router` VALUES('admin/structure/menu/manage/%/delete', 0x613a313a7b693a343b733a393a226d656e755f6c6f6164223b7d, '', 'user_access', 0x613a313a7b693a303b733a31353a2261646d696e6973746572206d656e75223b7d, 'menu_delete_menu_page', 0x613a313a7b693a303b693a343b7d, '', 61, 6, 0, '', 'admin/structure/menu/manage/%/delete', 'Delete menu', 't', '', '', 'a:0:{}', 6, '', '', 0, 'modules/menu/menu.admin.inc');
INSERT INTO `menu_router` VALUES('admin/structure/menu/manage/%/edit', 0x613a313a7b693a343b733a393a226d656e755f6c6f6164223b7d, '', 'user_access', 0x613a313a7b693a303b733a31353a2261646d696e6973746572206d656e75223b7d, 'drupal_get_form', 0x613a333a7b693a303b733a31343a226d656e755f656469745f6d656e75223b693a313b733a343a2265646974223b693a323b693a343b7d, '', 61, 6, 3, 'admin/structure/menu/manage/%', 'admin/structure/menu/manage/%', 'Edit menu', 't', '', '', 'a:0:{}', 132, '', '', 0, 'modules/menu/menu.admin.inc');
INSERT INTO `menu_router` VALUES('admin/structure/menu/manage/%/list', 0x613a313a7b693a343b733a393a226d656e755f6c6f6164223b7d, '', 'user_access', 0x613a313a7b693a303b733a31353a2261646d696e6973746572206d656e75223b7d, 'drupal_get_form', 0x613a323a7b693a303b733a31383a226d656e755f6f766572766965775f666f726d223b693a313b693a343b7d, '', 61, 6, 3, 'admin/structure/menu/manage/%', 'admin/structure/menu/manage/%', 'List links', 't', '', '', 'a:0:{}', 140, '', '', -10, 'modules/menu/menu.admin.inc');
INSERT INTO `menu_router` VALUES('admin/structure/menu/parents', '', '', 'user_access', 0x613a313a7b693a303b623a313b7d, 'menu_parent_options_js', 0x613a303a7b7d, '', 15, 4, 0, '', 'admin/structure/menu/parents', 'Parent menu items', 't', '', '', 'a:0:{}', 0, '', '', 0, '');
INSERT INTO `menu_router` VALUES('admin/structure/menu/settings', '', '', 'user_access', 0x613a313a7b693a303b733a31353a2261646d696e6973746572206d656e75223b7d, 'drupal_get_form', 0x613a313a7b693a303b733a31343a226d656e755f636f6e666967757265223b7d, '', 15, 4, 1, 'admin/structure/menu', 'admin/structure/menu', 'Settings', 't', '', '', 'a:0:{}', 132, '', '', 5, 'modules/menu/menu.admin.inc');
INSERT INTO `menu_router` VALUES('admin/structure/services', '', '', 'ctools_export_ui_task_access', 0x613a323a7b693a303b733a32353a2273657276696365735f63746f6f6c735f6578706f72745f7569223b693a313b733a343a226c697374223b7d, 'ctools_export_ui_switcher_page', 0x613a323a7b693a303b733a32353a2273657276696365735f63746f6f6c735f6578706f72745f7569223b693a313b733a343a226c697374223b7d, '', 7, 3, 0, '', 'admin/structure/services', 'Services', 't', '', '', 'a:0:{}', 6, 'Manage Services', '', 0, 'sites/all/modules/ctools/includes/export-ui.inc');
INSERT INTO `menu_router` VALUES('admin/structure/services/add', '', '', 'ctools_export_ui_task_access', 0x613a323a7b693a303b733a32353a2273657276696365735f63746f6f6c735f6578706f72745f7569223b693a313b733a333a22616464223b7d, 'ctools_export_ui_switcher_page', 0x613a323a7b693a303b733a32353a2273657276696365735f63746f6f6c735f6578706f72745f7569223b693a313b733a333a22616464223b7d, '', 15, 4, 1, 'admin/structure/services', 'admin/structure/services', 'Add', 't', '', '', 'a:0:{}', 388, '', '', 0, 'sites/all/modules/ctools/includes/export-ui.inc');
INSERT INTO `menu_router` VALUES('admin/structure/services/import', '', '', 'ctools_export_ui_task_access', 0x613a323a7b693a303b733a32353a2273657276696365735f63746f6f6c735f6578706f72745f7569223b693a313b733a363a22696d706f7274223b7d, 'ctools_export_ui_switcher_page', 0x613a323a7b693a303b733a32353a2273657276696365735f63746f6f6c735f6578706f72745f7569223b693a313b733a363a22696d706f7274223b7d, '', 15, 4, 1, 'admin/structure/services', 'admin/structure/services', 'Import', 't', '', '', 'a:0:{}', 388, '', '', 0, 'sites/all/modules/ctools/includes/export-ui.inc');
INSERT INTO `menu_router` VALUES('admin/structure/services/list', '', '', 'ctools_export_ui_task_access', 0x613a323a7b693a303b733a32353a2273657276696365735f63746f6f6c735f6578706f72745f7569223b693a313b733a343a226c697374223b7d, 'ctools_export_ui_switcher_page', 0x613a323a7b693a303b733a32353a2273657276696365735f63746f6f6c735f6578706f72745f7569223b693a313b733a343a226c697374223b7d, '', 15, 4, 1, 'admin/structure/services', 'admin/structure/services', 'List', 't', '', '', 'a:0:{}', 140, '', '', -10, 'sites/all/modules/ctools/includes/export-ui.inc');
INSERT INTO `menu_router` VALUES('admin/structure/services/list/%', 0x613a313a7b693a343b613a313a7b733a32313a2263746f6f6c735f6578706f72745f75695f6c6f6164223b613a313a7b693a303b733a32353a2273657276696365735f63746f6f6c735f6578706f72745f7569223b7d7d7d, '', 'ctools_export_ui_task_access', 0x613a333a7b693a303b733a32353a2273657276696365735f63746f6f6c735f6578706f72745f7569223b693a313b733a343a2265646974223b693a323b693a343b7d, 'ctools_export_ui_switcher_page', 0x613a333a7b693a303b733a32353a2273657276696365735f63746f6f6c735f6578706f72745f7569223b693a313b733a343a2265646974223b693a323b693a343b7d, '', 30, 5, 0, '', 'admin/structure/services/list/%', '', 't', '', '', 'a:0:{}', 0, '', '', 0, 'sites/all/modules/ctools/includes/export-ui.inc');
INSERT INTO `menu_router` VALUES('admin/structure/services/list/%/authentication', 0x613a313a7b693a343b613a313a7b733a32313a2263746f6f6c735f6578706f72745f75695f6c6f6164223b613a313a7b693a303b733a32353a2273657276696365735f63746f6f6c735f6578706f72745f7569223b7d7d7d, '', 'user_access', 0x613a313a7b693a303b733a31393a2261646d696e6973746572207365727669636573223b7d, 'ctools_export_ui_switcher_page', 0x613a333a7b693a303b733a32353a2273657276696365735f63746f6f6c735f6578706f72745f7569223b693a313b733a31343a2261757468656e7469636174696f6e223b693a323b693a343b7d, '', 61, 6, 1, 'admin/structure/services/list/%', 'admin/structure/services/list/%', 'Authentication', 't', '', '', 'a:0:{}', 132, '', '', -3, 'sites/all/modules/ctools/includes/export-ui.inc');
INSERT INTO `menu_router` VALUES('admin/structure/services/list/%/clone', 0x613a313a7b693a343b613a313a7b733a32313a2263746f6f6c735f6578706f72745f75695f6c6f6164223b613a313a7b693a303b733a32353a2273657276696365735f63746f6f6c735f6578706f72745f7569223b7d7d7d, '', 'ctools_export_ui_task_access', 0x613a333a7b693a303b733a32353a2273657276696365735f63746f6f6c735f6578706f72745f7569223b693a313b733a353a22636c6f6e65223b693a323b693a343b7d, 'ctools_export_ui_switcher_page', 0x613a333a7b693a303b733a32353a2273657276696365735f63746f6f6c735f6578706f72745f7569223b693a313b733a353a22636c6f6e65223b693a323b693a343b7d, '', 61, 6, 0, '', 'admin/structure/services/list/%/clone', 'Clone', 't', '', '', 'a:0:{}', 0, '', '', 0, 'sites/all/modules/ctools/includes/export-ui.inc');
INSERT INTO `menu_router` VALUES('admin/structure/services/list/%/delete', 0x613a313a7b693a343b613a313a7b733a32313a2263746f6f6c735f6578706f72745f75695f6c6f6164223b613a313a7b693a303b733a32353a2273657276696365735f63746f6f6c735f6578706f72745f7569223b7d7d7d, '', 'ctools_export_ui_task_access', 0x613a333a7b693a303b733a32353a2273657276696365735f63746f6f6c735f6578706f72745f7569223b693a313b733a363a2264656c657465223b693a323b693a343b7d, 'ctools_export_ui_switcher_page', 0x613a333a7b693a303b733a32353a2273657276696365735f63746f6f6c735f6578706f72745f7569223b693a313b733a363a2264656c657465223b693a323b693a343b7d, '', 61, 6, 0, '', 'admin/structure/services/list/%/delete', 'Delete', 't', '', '', 'a:0:{}', 0, '', '', 0, 'sites/all/modules/ctools/includes/export-ui.inc');
INSERT INTO `menu_router` VALUES('admin/structure/services/list/%/disable', 0x613a313a7b693a343b613a313a7b733a32313a2263746f6f6c735f6578706f72745f75695f6c6f6164223b613a313a7b693a303b733a32353a2273657276696365735f63746f6f6c735f6578706f72745f7569223b7d7d7d, '', 'ctools_export_ui_task_access', 0x613a333a7b693a303b733a32353a2273657276696365735f63746f6f6c735f6578706f72745f7569223b693a313b733a373a2264697361626c65223b693a323b693a343b7d, 'ctools_export_ui_switcher_page', 0x613a333a7b693a303b733a32353a2273657276696365735f63746f6f6c735f6578706f72745f7569223b693a313b733a373a2264697361626c65223b693a323b693a343b7d, '', 61, 6, 0, '', 'admin/structure/services/list/%/disable', 'Disable', 't', '', '', 'a:0:{}', 0, '', '', 0, 'sites/all/modules/ctools/includes/export-ui.inc');
INSERT INTO `menu_router` VALUES('admin/structure/services/list/%/edit', 0x613a313a7b693a343b613a313a7b733a32313a2263746f6f6c735f6578706f72745f75695f6c6f6164223b613a313a7b693a303b733a32353a2273657276696365735f63746f6f6c735f6578706f72745f7569223b7d7d7d, '', 'ctools_export_ui_task_access', 0x613a333a7b693a303b733a32353a2273657276696365735f63746f6f6c735f6578706f72745f7569223b693a313b733a343a2265646974223b693a323b693a343b7d, 'ctools_export_ui_switcher_page', 0x613a333a7b693a303b733a32353a2273657276696365735f63746f6f6c735f6578706f72745f7569223b693a313b733a343a2265646974223b693a323b693a343b7d, '', 61, 6, 1, 'admin/structure/services/list/%', 'admin/structure/services/list/%', 'Edit', 't', '', '', 'a:0:{}', 140, '', '', -10, 'sites/all/modules/ctools/includes/export-ui.inc');
INSERT INTO `menu_router` VALUES('admin/structure/services/list/%/enable', 0x613a313a7b693a343b613a313a7b733a32313a2263746f6f6c735f6578706f72745f75695f6c6f6164223b613a313a7b693a303b733a32353a2273657276696365735f63746f6f6c735f6578706f72745f7569223b7d7d7d, '', 'ctools_export_ui_task_access', 0x613a333a7b693a303b733a32353a2273657276696365735f63746f6f6c735f6578706f72745f7569223b693a313b733a363a22656e61626c65223b693a323b693a343b7d, 'ctools_export_ui_switcher_page', 0x613a333a7b693a303b733a32353a2273657276696365735f63746f6f6c735f6578706f72745f7569223b693a313b733a363a22656e61626c65223b693a323b693a343b7d, '', 61, 6, 0, '', 'admin/structure/services/list/%/enable', 'Enable', 't', '', '', 'a:0:{}', 0, '', '', 0, 'sites/all/modules/ctools/includes/export-ui.inc');
INSERT INTO `menu_router` VALUES('admin/structure/services/list/%/export', 0x613a313a7b693a343b613a313a7b733a32313a2263746f6f6c735f6578706f72745f75695f6c6f6164223b613a313a7b693a303b733a32353a2273657276696365735f63746f6f6c735f6578706f72745f7569223b7d7d7d, '', 'ctools_export_ui_task_access', 0x613a333a7b693a303b733a32353a2273657276696365735f63746f6f6c735f6578706f72745f7569223b693a313b733a363a226578706f7274223b693a323b693a343b7d, 'ctools_export_ui_switcher_page', 0x613a333a7b693a303b733a32353a2273657276696365735f63746f6f6c735f6578706f72745f7569223b693a313b733a363a226578706f7274223b693a323b693a343b7d, '', 61, 6, 1, 'admin/structure/services/list/%', 'admin/structure/services/list/%', 'Export', 't', '', '', 'a:0:{}', 132, '', '', 0, 'sites/all/modules/ctools/includes/export-ui.inc');
INSERT INTO `menu_router` VALUES('admin/structure/services/list/%/resources', 0x613a313a7b693a343b613a313a7b733a32313a2263746f6f6c735f6578706f72745f75695f6c6f6164223b613a313a7b693a303b733a32353a2273657276696365735f63746f6f6c735f6578706f72745f7569223b7d7d7d, '', 'user_access', 0x613a313a7b693a303b733a31393a2261646d696e6973746572207365727669636573223b7d, 'ctools_export_ui_switcher_page', 0x613a333a7b693a303b733a32353a2273657276696365735f63746f6f6c735f6578706f72745f7569223b693a313b733a393a227265736f7572636573223b693a323b693a343b7d, '', 61, 6, 1, 'admin/structure/services/list/%', 'admin/structure/services/list/%', 'Resources', 't', '', '', 'a:0:{}', 132, '', '', -2, 'sites/all/modules/ctools/includes/export-ui.inc');
INSERT INTO `menu_router` VALUES('admin/structure/services/list/%/revert', 0x613a313a7b693a343b613a313a7b733a32313a2263746f6f6c735f6578706f72745f75695f6c6f6164223b613a313a7b693a303b733a32353a2273657276696365735f63746f6f6c735f6578706f72745f7569223b7d7d7d, '', 'ctools_export_ui_task_access', 0x613a333a7b693a303b733a32353a2273657276696365735f63746f6f6c735f6578706f72745f7569223b693a313b733a363a22726576657274223b693a323b693a343b7d, 'ctools_export_ui_switcher_page', 0x613a333a7b693a303b733a32353a2273657276696365735f63746f6f6c735f6578706f72745f7569223b693a313b733a363a2264656c657465223b693a323b693a343b7d, '', 61, 6, 0, '', 'admin/structure/services/list/%/revert', 'Revert', 't', '', '', 'a:0:{}', 0, '', '', 0, 'sites/all/modules/ctools/includes/export-ui.inc');
INSERT INTO `menu_router` VALUES('admin/structure/services/list/%/server', 0x613a313a7b693a343b613a313a7b733a32313a2263746f6f6c735f6578706f72745f75695f6c6f6164223b613a313a7b693a303b733a32353a2273657276696365735f63746f6f6c735f6578706f72745f7569223b7d7d7d, '', 'user_access', 0x613a313a7b693a303b733a31393a2261646d696e6973746572207365727669636573223b7d, 'ctools_export_ui_switcher_page', 0x613a333a7b693a303b733a32353a2273657276696365735f63746f6f6c735f6578706f72745f7569223b693a313b733a363a22736572766572223b693a323b693a343b7d, '', 61, 6, 1, 'admin/structure/services/list/%', 'admin/structure/services/list/%', 'Server', 't', '', '', 'a:0:{}', 132, '', '', -4, 'sites/all/modules/ctools/includes/export-ui.inc');
INSERT INTO `menu_router` VALUES('admin/structure/taxonomy', '', '', 'user_access', 0x613a313a7b693a303b733a31393a2261646d696e6973746572207461786f6e6f6d79223b7d, 'drupal_get_form', 0x613a313a7b693a303b733a33303a227461786f6e6f6d795f6f766572766965775f766f636162756c6172696573223b7d, '', 7, 3, 0, '', 'admin/structure/taxonomy', 'Taxonomy', 't', '', '', 'a:0:{}', 6, 'Manage tagging, categorization, and classification of your content.', '', 0, 'modules/taxonomy/taxonomy.admin.inc');
INSERT INTO `menu_router` VALUES('admin/structure/taxonomy/%', 0x613a313a7b693a333b733a33373a227461786f6e6f6d795f766f636162756c6172795f6d616368696e655f6e616d655f6c6f6164223b7d, '', 'user_access', 0x613a313a7b693a303b733a31393a2261646d696e6973746572207461786f6e6f6d79223b7d, 'drupal_get_form', 0x613a323a7b693a303b733a32333a227461786f6e6f6d795f6f766572766965775f7465726d73223b693a313b693a333b7d, '', 14, 4, 0, '', 'admin/structure/taxonomy/%', '', 'entity_label', 'a:2:{i:0;s:19:"taxonomy_vocabulary";i:1;i:3;}', '', 'a:0:{}', 6, '', '', 0, 'modules/taxonomy/taxonomy.admin.inc');
INSERT INTO `menu_router` VALUES('admin/structure/taxonomy/%/add', 0x613a313a7b693a333b733a33373a227461786f6e6f6d795f766f636162756c6172795f6d616368696e655f6e616d655f6c6f6164223b7d, '', 'user_access', 0x613a313a7b693a303b733a31393a2261646d696e6973746572207461786f6e6f6d79223b7d, 'drupal_get_form', 0x613a333a7b693a303b733a31383a227461786f6e6f6d795f666f726d5f7465726d223b693a313b613a303a7b7d693a323b693a333b7d, '', 29, 5, 1, 'admin/structure/taxonomy/%', 'admin/structure/taxonomy/%', 'Add term', 't', '', '', 'a:0:{}', 388, '', '', 0, 'modules/taxonomy/taxonomy.admin.inc');
INSERT INTO `menu_router` VALUES('admin/structure/taxonomy/%/display', 0x613a313a7b693a333b733a33373a227461786f6e6f6d795f766f636162756c6172795f6d616368696e655f6e616d655f6c6f6164223b7d, '', 'user_access', 0x613a313a7b693a303b733a31393a2261646d696e6973746572207461786f6e6f6d79223b7d, 'drupal_get_form', 0x613a343a7b693a303b733a33303a226669656c645f75695f646973706c61795f6f766572766965775f666f726d223b693a313b733a31333a227461786f6e6f6d795f7465726d223b693a323b693a333b693a333b733a373a2264656661756c74223b7d, '', 29, 5, 1, 'admin/structure/taxonomy/%', 'admin/structure/taxonomy/%', 'Manage display', 't', '', '', 'a:0:{}', 132, '', '', 2, 'modules/field_ui/field_ui.admin.inc');
INSERT INTO `menu_router` VALUES('admin/structure/taxonomy/%/display/default', 0x613a313a7b693a333b733a33373a227461786f6e6f6d795f766f636162756c6172795f6d616368696e655f6e616d655f6c6f6164223b7d, '', '_field_ui_view_mode_menu_access', 0x613a353a7b693a303b733a31333a227461786f6e6f6d795f7465726d223b693a313b693a333b693a323b733a373a2264656661756c74223b693a333b733a31313a22757365725f616363657373223b693a343b733a31393a2261646d696e6973746572207461786f6e6f6d79223b7d, 'drupal_get_form', 0x613a343a7b693a303b733a33303a226669656c645f75695f646973706c61795f6f766572766965775f666f726d223b693a313b733a31333a227461786f6e6f6d795f7465726d223b693a323b693a333b693a333b733a373a2264656661756c74223b7d, '', 59, 6, 1, 'admin/structure/taxonomy/%/display', 'admin/structure/taxonomy/%', 'Default', 't', '', '', 'a:0:{}', 140, '', '', -10, 'modules/field_ui/field_ui.admin.inc');
INSERT INTO `menu_router` VALUES('admin/structure/taxonomy/%/display/full', 0x613a313a7b693a333b733a33373a227461786f6e6f6d795f766f636162756c6172795f6d616368696e655f6e616d655f6c6f6164223b7d, '', '_field_ui_view_mode_menu_access', 0x613a353a7b693a303b733a31333a227461786f6e6f6d795f7465726d223b693a313b693a333b693a323b733a343a2266756c6c223b693a333b733a31313a22757365725f616363657373223b693a343b733a31393a2261646d696e6973746572207461786f6e6f6d79223b7d, 'drupal_get_form', 0x613a343a7b693a303b733a33303a226669656c645f75695f646973706c61795f6f766572766965775f666f726d223b693a313b733a31333a227461786f6e6f6d795f7465726d223b693a323b693a333b693a333b733a343a2266756c6c223b7d, '', 59, 6, 1, 'admin/structure/taxonomy/%/display', 'admin/structure/taxonomy/%', 'Taxonomy term page', 't', '', '', 'a:0:{}', 132, '', '', 0, 'modules/field_ui/field_ui.admin.inc');
INSERT INTO `menu_router` VALUES('admin/structure/taxonomy/%/edit', 0x613a313a7b693a333b733a33373a227461786f6e6f6d795f766f636162756c6172795f6d616368696e655f6e616d655f6c6f6164223b7d, '', 'user_access', 0x613a313a7b693a303b733a31393a2261646d696e6973746572207461786f6e6f6d79223b7d, 'drupal_get_form', 0x613a323a7b693a303b733a32343a227461786f6e6f6d795f666f726d5f766f636162756c617279223b693a313b693a333b7d, '', 29, 5, 1, 'admin/structure/taxonomy/%', 'admin/structure/taxonomy/%', 'Edit', 't', '', '', 'a:0:{}', 132, '', '', -10, 'modules/taxonomy/taxonomy.admin.inc');
INSERT INTO `menu_router` VALUES('admin/structure/taxonomy/%/fields', 0x613a313a7b693a333b733a33373a227461786f6e6f6d795f766f636162756c6172795f6d616368696e655f6e616d655f6c6f6164223b7d, '', 'user_access', 0x613a313a7b693a303b733a31393a2261646d696e6973746572207461786f6e6f6d79223b7d, 'drupal_get_form', 0x613a333a7b693a303b733a32383a226669656c645f75695f6669656c645f6f766572766965775f666f726d223b693a313b733a31333a227461786f6e6f6d795f7465726d223b693a323b693a333b7d, '', 29, 5, 1, 'admin/structure/taxonomy/%', 'admin/structure/taxonomy/%', 'Manage fields', 't', '', '', 'a:0:{}', 132, '', '', 1, 'modules/field_ui/field_ui.admin.inc');
INSERT INTO `menu_router` VALUES('admin/structure/taxonomy/%/fields/%', 0x613a323a7b693a333b613a313a7b733a33373a227461786f6e6f6d795f766f636162756c6172795f6d616368696e655f6e616d655f6c6f6164223b613a343a7b693a303b733a31333a227461786f6e6f6d795f7465726d223b693a313b693a333b693a323b733a313a2233223b693a333b733a343a22256d6170223b7d7d693a353b613a313a7b733a31383a226669656c645f75695f6d656e755f6c6f6164223b613a343a7b693a303b733a31333a227461786f6e6f6d795f7465726d223b693a313b693a333b693a323b733a313a2233223b693a333b733a343a22256d6170223b7d7d7d, '', 'user_access', 0x613a313a7b693a303b733a31393a2261646d696e6973746572207461786f6e6f6d79223b7d, 'drupal_get_form', 0x613a323a7b693a303b733a32343a226669656c645f75695f6669656c645f656469745f666f726d223b693a313b693a353b7d, '', 58, 6, 0, '', 'admin/structure/taxonomy/%/fields/%', '', 'field_ui_menu_title', 'a:1:{i:0;i:5;}', '', 'a:0:{}', 6, '', '', 0, 'modules/field_ui/field_ui.admin.inc');
INSERT INTO `menu_router` VALUES('admin/structure/taxonomy/%/fields/%/delete', 0x613a323a7b693a333b613a313a7b733a33373a227461786f6e6f6d795f766f636162756c6172795f6d616368696e655f6e616d655f6c6f6164223b613a343a7b693a303b733a31333a227461786f6e6f6d795f7465726d223b693a313b693a333b693a323b733a313a2233223b693a333b733a343a22256d6170223b7d7d693a353b613a313a7b733a31383a226669656c645f75695f6d656e755f6c6f6164223b613a343a7b693a303b733a31333a227461786f6e6f6d795f7465726d223b693a313b693a333b693a323b733a313a2233223b693a333b733a343a22256d6170223b7d7d7d, '', 'user_access', 0x613a313a7b693a303b733a31393a2261646d696e6973746572207461786f6e6f6d79223b7d, 'drupal_get_form', 0x613a323a7b693a303b733a32363a226669656c645f75695f6669656c645f64656c6574655f666f726d223b693a313b693a353b7d, '', 117, 7, 1, 'admin/structure/taxonomy/%/fields/%', 'admin/structure/taxonomy/%/fields/%', 'Delete', 't', '', '', 'a:0:{}', 132, '', '', 10, 'modules/field_ui/field_ui.admin.inc');
INSERT INTO `menu_router` VALUES('admin/structure/taxonomy/%/fields/%/edit', 0x613a323a7b693a333b613a313a7b733a33373a227461786f6e6f6d795f766f636162756c6172795f6d616368696e655f6e616d655f6c6f6164223b613a343a7b693a303b733a31333a227461786f6e6f6d795f7465726d223b693a313b693a333b693a323b733a313a2233223b693a333b733a343a22256d6170223b7d7d693a353b613a313a7b733a31383a226669656c645f75695f6d656e755f6c6f6164223b613a343a7b693a303b733a31333a227461786f6e6f6d795f7465726d223b693a313b693a333b693a323b733a313a2233223b693a333b733a343a22256d6170223b7d7d7d, '', 'user_access', 0x613a313a7b693a303b733a31393a2261646d696e6973746572207461786f6e6f6d79223b7d, 'drupal_get_form', 0x613a323a7b693a303b733a32343a226669656c645f75695f6669656c645f656469745f666f726d223b693a313b693a353b7d, '', 117, 7, 1, 'admin/structure/taxonomy/%/fields/%', 'admin/structure/taxonomy/%/fields/%', 'Edit', 't', '', '', 'a:0:{}', 140, '', '', 0, 'modules/field_ui/field_ui.admin.inc');
INSERT INTO `menu_router` VALUES('admin/structure/taxonomy/%/fields/%/field-settings', 0x613a323a7b693a333b613a313a7b733a33373a227461786f6e6f6d795f766f636162756c6172795f6d616368696e655f6e616d655f6c6f6164223b613a343a7b693a303b733a31333a227461786f6e6f6d795f7465726d223b693a313b693a333b693a323b733a313a2233223b693a333b733a343a22256d6170223b7d7d693a353b613a313a7b733a31383a226669656c645f75695f6d656e755f6c6f6164223b613a343a7b693a303b733a31333a227461786f6e6f6d795f7465726d223b693a313b693a333b693a323b733a313a2233223b693a333b733a343a22256d6170223b7d7d7d, '', 'user_access', 0x613a313a7b693a303b733a31393a2261646d696e6973746572207461786f6e6f6d79223b7d, 'drupal_get_form', 0x613a323a7b693a303b733a32383a226669656c645f75695f6669656c645f73657474696e67735f666f726d223b693a313b693a353b7d, '', 117, 7, 1, 'admin/structure/taxonomy/%/fields/%', 'admin/structure/taxonomy/%/fields/%', 'Field settings', 't', '', '', 'a:0:{}', 132, '', '', 0, 'modules/field_ui/field_ui.admin.inc');
INSERT INTO `menu_router` VALUES('admin/structure/taxonomy/%/fields/%/widget-type', 0x613a323a7b693a333b613a313a7b733a33373a227461786f6e6f6d795f766f636162756c6172795f6d616368696e655f6e616d655f6c6f6164223b613a343a7b693a303b733a31333a227461786f6e6f6d795f7465726d223b693a313b693a333b693a323b733a313a2233223b693a333b733a343a22256d6170223b7d7d693a353b613a313a7b733a31383a226669656c645f75695f6d656e755f6c6f6164223b613a343a7b693a303b733a31333a227461786f6e6f6d795f7465726d223b693a313b693a333b693a323b733a313a2233223b693a333b733a343a22256d6170223b7d7d7d, '', 'user_access', 0x613a313a7b693a303b733a31393a2261646d696e6973746572207461786f6e6f6d79223b7d, 'drupal_get_form', 0x613a323a7b693a303b733a32353a226669656c645f75695f7769646765745f747970655f666f726d223b693a313b693a353b7d, '', 117, 7, 1, 'admin/structure/taxonomy/%/fields/%', 'admin/structure/taxonomy/%/fields/%', 'Widget type', 't', '', '', 'a:0:{}', 132, '', '', 0, 'modules/field_ui/field_ui.admin.inc');
INSERT INTO `menu_router` VALUES('admin/structure/taxonomy/%/groups/%/delete', 0x613a323a7b693a333b613a313a7b733a33373a227461786f6e6f6d795f766f636162756c6172795f6d616368696e655f6e616d655f6c6f6164223b613a343a7b693a303b733a31333a227461786f6e6f6d795f7465726d223b693a313b693a333b693a323b733a313a2233223b693a333b733a343a22256d6170223b7d7d693a353b613a313a7b733a32313a226669656c645f67726f75705f6d656e755f6c6f6164223b613a343a7b693a303b733a31333a227461786f6e6f6d795f7465726d223b693a313b693a333b693a323b733a313a2233223b693a333b733a343a22256d6170223b7d7d7d, '', 'user_access', 0x613a313a7b693a303b733a31393a2261646d696e6973746572207461786f6e6f6d79223b7d, 'drupal_get_form', 0x613a323a7b693a303b733a32333a226669656c645f67726f75705f64656c6574655f666f726d223b693a313b693a353b7d, '', 117, 7, 0, '', 'admin/structure/taxonomy/%/groups/%/delete', 'Delete', 't', '', '', 'a:0:{}', 0, '', '', 0, 'sites/all/modules/field_group/field_group.field_ui.inc');
INSERT INTO `menu_router` VALUES('admin/structure/taxonomy/%/list', 0x613a313a7b693a333b733a33373a227461786f6e6f6d795f766f636162756c6172795f6d616368696e655f6e616d655f6c6f6164223b7d, '', 'user_access', 0x613a313a7b693a303b733a31393a2261646d696e6973746572207461786f6e6f6d79223b7d, 'drupal_get_form', 0x613a323a7b693a303b733a32333a227461786f6e6f6d795f6f766572766965775f7465726d73223b693a313b693a333b7d, '', 29, 5, 1, 'admin/structure/taxonomy/%', 'admin/structure/taxonomy/%', 'List', 't', '', '', 'a:0:{}', 140, '', '', -20, 'modules/taxonomy/taxonomy.admin.inc');
INSERT INTO `menu_router` VALUES('admin/structure/taxonomy/add', '', '', 'user_access', 0x613a313a7b693a303b733a31393a2261646d696e6973746572207461786f6e6f6d79223b7d, 'drupal_get_form', 0x613a313a7b693a303b733a32343a227461786f6e6f6d795f666f726d5f766f636162756c617279223b7d, '', 15, 4, 1, 'admin/structure/taxonomy', 'admin/structure/taxonomy', 'Add vocabulary', 't', '', '', 'a:0:{}', 388, '', '', 0, 'modules/taxonomy/taxonomy.admin.inc');
INSERT INTO `menu_router` VALUES('admin/structure/taxonomy/list', '', '', 'user_access', 0x613a313a7b693a303b733a31393a2261646d696e6973746572207461786f6e6f6d79223b7d, 'drupal_get_form', 0x613a313a7b693a303b733a33303a227461786f6e6f6d795f6f766572766965775f766f636162756c6172696573223b7d, '', 15, 4, 1, 'admin/structure/taxonomy', 'admin/structure/taxonomy', 'List', 't', '', '', 'a:0:{}', 140, '', '', -10, 'modules/taxonomy/taxonomy.admin.inc');
INSERT INTO `menu_router` VALUES('admin/structure/types', '', '', 'user_access', 0x613a313a7b693a303b733a32343a2261646d696e697374657220636f6e74656e74207479706573223b7d, 'node_overview_types', 0x613a303a7b7d, '', 7, 3, 0, '', 'admin/structure/types', 'Content types', 't', '', '', 'a:0:{}', 6, 'Manage content types, including default status, front page promotion, comment settings, etc.', '', 0, 'modules/node/content_types.inc');
INSERT INTO `menu_router` VALUES('admin/structure/types/add', '', '', 'user_access', 0x613a313a7b693a303b733a32343a2261646d696e697374657220636f6e74656e74207479706573223b7d, 'drupal_get_form', 0x613a313a7b693a303b733a31343a226e6f64655f747970655f666f726d223b7d, '', 15, 4, 1, 'admin/structure/types', 'admin/structure/types', 'Add content type', 't', '', '', 'a:0:{}', 388, '', '', 0, 'modules/node/content_types.inc');
INSERT INTO `menu_router` VALUES('admin/structure/types/list', '', '', 'user_access', 0x613a313a7b693a303b733a32343a2261646d696e697374657220636f6e74656e74207479706573223b7d, 'node_overview_types', 0x613a303a7b7d, '', 15, 4, 1, 'admin/structure/types', 'admin/structure/types', 'List', 't', '', '', 'a:0:{}', 140, '', '', -10, 'modules/node/content_types.inc');
INSERT INTO `menu_router` VALUES('admin/structure/types/manage/%', 0x613a313a7b693a343b733a31343a226e6f64655f747970655f6c6f6164223b7d, '', 'user_access', 0x613a313a7b693a303b733a32343a2261646d696e697374657220636f6e74656e74207479706573223b7d, 'drupal_get_form', 0x613a323a7b693a303b733a31343a226e6f64655f747970655f666f726d223b693a313b693a343b7d, '', 30, 5, 0, '', 'admin/structure/types/manage/%', 'Edit content type', 'node_type_page_title', 'a:1:{i:0;i:4;}', '', 'a:0:{}', 6, '', '', 0, 'modules/node/content_types.inc');
INSERT INTO `menu_router` VALUES('admin/structure/types/manage/%/comment/display', 0x613a313a7b693a343b733a32323a22636f6d6d656e745f6e6f64655f747970655f6c6f6164223b7d, '', 'user_access', 0x613a313a7b693a303b733a32343a2261646d696e697374657220636f6e74656e74207479706573223b7d, 'drupal_get_form', 0x613a343a7b693a303b733a33303a226669656c645f75695f646973706c61795f6f766572766965775f666f726d223b693a313b733a373a22636f6d6d656e74223b693a323b693a343b693a333b733a373a2264656661756c74223b7d, '', 123, 7, 1, 'admin/structure/types/manage/%', 'admin/structure/types/manage/%', 'Comment display', 't', '', '', 'a:0:{}', 132, '', '', 4, 'modules/field_ui/field_ui.admin.inc');
INSERT INTO `menu_router` VALUES('admin/structure/types/manage/%/comment/display/default', 0x613a313a7b693a343b733a32323a22636f6d6d656e745f6e6f64655f747970655f6c6f6164223b7d, '', '_field_ui_view_mode_menu_access', 0x613a353a7b693a303b733a373a22636f6d6d656e74223b693a313b693a343b693a323b733a373a2264656661756c74223b693a333b733a31313a22757365725f616363657373223b693a343b733a32343a2261646d696e697374657220636f6e74656e74207479706573223b7d, 'drupal_get_form', 0x613a343a7b693a303b733a33303a226669656c645f75695f646973706c61795f6f766572766965775f666f726d223b693a313b733a373a22636f6d6d656e74223b693a323b693a343b693a333b733a373a2264656661756c74223b7d, '', 247, 8, 1, 'admin/structure/types/manage/%/comment/display', 'admin/structure/types/manage/%', 'Default', 't', '', '', 'a:0:{}', 140, '', '', -10, 'modules/field_ui/field_ui.admin.inc');
INSERT INTO `menu_router` VALUES('admin/structure/types/manage/%/comment/display/full', 0x613a313a7b693a343b733a32323a22636f6d6d656e745f6e6f64655f747970655f6c6f6164223b7d, '', '_field_ui_view_mode_menu_access', 0x613a353a7b693a303b733a373a22636f6d6d656e74223b693a313b693a343b693a323b733a343a2266756c6c223b693a333b733a31313a22757365725f616363657373223b693a343b733a32343a2261646d696e697374657220636f6e74656e74207479706573223b7d, 'drupal_get_form', 0x613a343a7b693a303b733a33303a226669656c645f75695f646973706c61795f6f766572766965775f666f726d223b693a313b733a373a22636f6d6d656e74223b693a323b693a343b693a333b733a343a2266756c6c223b7d, '', 247, 8, 1, 'admin/structure/types/manage/%/comment/display', 'admin/structure/types/manage/%', 'Full comment', 't', '', '', 'a:0:{}', 132, '', '', 0, 'modules/field_ui/field_ui.admin.inc');
INSERT INTO `menu_router` VALUES('admin/structure/types/manage/%/comment/fields', 0x613a313a7b693a343b733a32323a22636f6d6d656e745f6e6f64655f747970655f6c6f6164223b7d, '', 'user_access', 0x613a313a7b693a303b733a32343a2261646d696e697374657220636f6e74656e74207479706573223b7d, 'drupal_get_form', 0x613a333a7b693a303b733a32383a226669656c645f75695f6669656c645f6f766572766965775f666f726d223b693a313b733a373a22636f6d6d656e74223b693a323b693a343b7d, '', 123, 7, 1, 'admin/structure/types/manage/%', 'admin/structure/types/manage/%', 'Comment fields', 't', '', '', 'a:0:{}', 132, '', '', 3, 'modules/field_ui/field_ui.admin.inc');
INSERT INTO `menu_router` VALUES('admin/structure/types/manage/%/comment/fields/%', 0x613a323a7b693a343b613a313a7b733a32323a22636f6d6d656e745f6e6f64655f747970655f6c6f6164223b613a343a7b693a303b733a373a22636f6d6d656e74223b693a313b693a343b693a323b733a313a2234223b693a333b733a343a22256d6170223b7d7d693a373b613a313a7b733a31383a226669656c645f75695f6d656e755f6c6f6164223b613a343a7b693a303b733a373a22636f6d6d656e74223b693a313b693a343b693a323b733a313a2234223b693a333b733a343a22256d6170223b7d7d7d, '', 'user_access', 0x613a313a7b693a303b733a32343a2261646d696e697374657220636f6e74656e74207479706573223b7d, 'drupal_get_form', 0x613a323a7b693a303b733a32343a226669656c645f75695f6669656c645f656469745f666f726d223b693a313b693a373b7d, '', 246, 8, 0, '', 'admin/structure/types/manage/%/comment/fields/%', '', 'field_ui_menu_title', 'a:1:{i:0;i:7;}', '', 'a:0:{}', 6, '', '', 0, 'modules/field_ui/field_ui.admin.inc');
INSERT INTO `menu_router` VALUES('admin/structure/types/manage/%/comment/fields/%/delete', 0x613a323a7b693a343b613a313a7b733a32323a22636f6d6d656e745f6e6f64655f747970655f6c6f6164223b613a343a7b693a303b733a373a22636f6d6d656e74223b693a313b693a343b693a323b733a313a2234223b693a333b733a343a22256d6170223b7d7d693a373b613a313a7b733a31383a226669656c645f75695f6d656e755f6c6f6164223b613a343a7b693a303b733a373a22636f6d6d656e74223b693a313b693a343b693a323b733a313a2234223b693a333b733a343a22256d6170223b7d7d7d, '', 'user_access', 0x613a313a7b693a303b733a32343a2261646d696e697374657220636f6e74656e74207479706573223b7d, 'drupal_get_form', 0x613a323a7b693a303b733a32363a226669656c645f75695f6669656c645f64656c6574655f666f726d223b693a313b693a373b7d, '', 493, 9, 1, 'admin/structure/types/manage/%/comment/fields/%', 'admin/structure/types/manage/%/comment/fields/%', 'Delete', 't', '', '', 'a:0:{}', 132, '', '', 10, 'modules/field_ui/field_ui.admin.inc');
INSERT INTO `menu_router` VALUES('admin/structure/types/manage/%/comment/fields/%/edit', 0x613a323a7b693a343b613a313a7b733a32323a22636f6d6d656e745f6e6f64655f747970655f6c6f6164223b613a343a7b693a303b733a373a22636f6d6d656e74223b693a313b693a343b693a323b733a313a2234223b693a333b733a343a22256d6170223b7d7d693a373b613a313a7b733a31383a226669656c645f75695f6d656e755f6c6f6164223b613a343a7b693a303b733a373a22636f6d6d656e74223b693a313b693a343b693a323b733a313a2234223b693a333b733a343a22256d6170223b7d7d7d, '', 'user_access', 0x613a313a7b693a303b733a32343a2261646d696e697374657220636f6e74656e74207479706573223b7d, 'drupal_get_form', 0x613a323a7b693a303b733a32343a226669656c645f75695f6669656c645f656469745f666f726d223b693a313b693a373b7d, '', 493, 9, 1, 'admin/structure/types/manage/%/comment/fields/%', 'admin/structure/types/manage/%/comment/fields/%', 'Edit', 't', '', '', 'a:0:{}', 140, '', '', 0, 'modules/field_ui/field_ui.admin.inc');
INSERT INTO `menu_router` VALUES('admin/structure/types/manage/%/comment/fields/%/field-settings', 0x613a323a7b693a343b613a313a7b733a32323a22636f6d6d656e745f6e6f64655f747970655f6c6f6164223b613a343a7b693a303b733a373a22636f6d6d656e74223b693a313b693a343b693a323b733a313a2234223b693a333b733a343a22256d6170223b7d7d693a373b613a313a7b733a31383a226669656c645f75695f6d656e755f6c6f6164223b613a343a7b693a303b733a373a22636f6d6d656e74223b693a313b693a343b693a323b733a313a2234223b693a333b733a343a22256d6170223b7d7d7d, '', 'user_access', 0x613a313a7b693a303b733a32343a2261646d696e697374657220636f6e74656e74207479706573223b7d, 'drupal_get_form', 0x613a323a7b693a303b733a32383a226669656c645f75695f6669656c645f73657474696e67735f666f726d223b693a313b693a373b7d, '', 493, 9, 1, 'admin/structure/types/manage/%/comment/fields/%', 'admin/structure/types/manage/%/comment/fields/%', 'Field settings', 't', '', '', 'a:0:{}', 132, '', '', 0, 'modules/field_ui/field_ui.admin.inc');
INSERT INTO `menu_router` VALUES('admin/structure/types/manage/%/comment/fields/%/widget-type', 0x613a323a7b693a343b613a313a7b733a32323a22636f6d6d656e745f6e6f64655f747970655f6c6f6164223b613a343a7b693a303b733a373a22636f6d6d656e74223b693a313b693a343b693a323b733a313a2234223b693a333b733a343a22256d6170223b7d7d693a373b613a313a7b733a31383a226669656c645f75695f6d656e755f6c6f6164223b613a343a7b693a303b733a373a22636f6d6d656e74223b693a313b693a343b693a323b733a313a2234223b693a333b733a343a22256d6170223b7d7d7d, '', 'user_access', 0x613a313a7b693a303b733a32343a2261646d696e697374657220636f6e74656e74207479706573223b7d, 'drupal_get_form', 0x613a323a7b693a303b733a32353a226669656c645f75695f7769646765745f747970655f666f726d223b693a313b693a373b7d, '', 493, 9, 1, 'admin/structure/types/manage/%/comment/fields/%', 'admin/structure/types/manage/%/comment/fields/%', 'Widget type', 't', '', '', 'a:0:{}', 132, '', '', 0, 'modules/field_ui/field_ui.admin.inc');
INSERT INTO `menu_router` VALUES('admin/structure/types/manage/%/comment/groups/%/delete', 0x613a323a7b693a343b613a313a7b733a32323a22636f6d6d656e745f6e6f64655f747970655f6c6f6164223b613a343a7b693a303b733a373a22636f6d6d656e74223b693a313b693a343b693a323b733a313a2234223b693a333b733a343a22256d6170223b7d7d693a373b613a313a7b733a32313a226669656c645f67726f75705f6d656e755f6c6f6164223b613a343a7b693a303b733a373a22636f6d6d656e74223b693a313b693a343b693a323b733a313a2234223b693a333b733a343a22256d6170223b7d7d7d, '', 'user_access', 0x613a313a7b693a303b733a32343a2261646d696e697374657220636f6e74656e74207479706573223b7d, 'drupal_get_form', 0x613a323a7b693a303b733a32333a226669656c645f67726f75705f64656c6574655f666f726d223b693a313b693a373b7d, '', 493, 9, 0, '', 'admin/structure/types/manage/%/comment/groups/%/delete', 'Delete', 't', '', '', 'a:0:{}', 0, '', '', 0, 'sites/all/modules/field_group/field_group.field_ui.inc');
INSERT INTO `menu_router` VALUES('admin/structure/types/manage/%/delete', 0x613a313a7b693a343b733a31343a226e6f64655f747970655f6c6f6164223b7d, '', 'user_access', 0x613a313a7b693a303b733a32343a2261646d696e697374657220636f6e74656e74207479706573223b7d, 'drupal_get_form', 0x613a323a7b693a303b733a32343a226e6f64655f747970655f64656c6574655f636f6e6669726d223b693a313b693a343b7d, '', 61, 6, 0, '', 'admin/structure/types/manage/%/delete', 'Delete', 't', '', '', 'a:0:{}', 6, '', '', 0, 'modules/node/content_types.inc');
INSERT INTO `menu_router` VALUES('admin/structure/types/manage/%/display', 0x613a313a7b693a343b733a31343a226e6f64655f747970655f6c6f6164223b7d, '', 'user_access', 0x613a313a7b693a303b733a32343a2261646d696e697374657220636f6e74656e74207479706573223b7d, 'drupal_get_form', 0x613a343a7b693a303b733a33303a226669656c645f75695f646973706c61795f6f766572766965775f666f726d223b693a313b733a343a226e6f6465223b693a323b693a343b693a333b733a373a2264656661756c74223b7d, '', 61, 6, 1, 'admin/structure/types/manage/%', 'admin/structure/types/manage/%', 'Manage display', 't', '', '', 'a:0:{}', 132, '', '', 2, 'modules/field_ui/field_ui.admin.inc');
INSERT INTO `menu_router` VALUES('admin/structure/types/manage/%/display/default', 0x613a313a7b693a343b733a31343a226e6f64655f747970655f6c6f6164223b7d, '', '_field_ui_view_mode_menu_access', 0x613a353a7b693a303b733a343a226e6f6465223b693a313b693a343b693a323b733a373a2264656661756c74223b693a333b733a31313a22757365725f616363657373223b693a343b733a32343a2261646d696e697374657220636f6e74656e74207479706573223b7d, 'drupal_get_form', 0x613a343a7b693a303b733a33303a226669656c645f75695f646973706c61795f6f766572766965775f666f726d223b693a313b733a343a226e6f6465223b693a323b693a343b693a333b733a373a2264656661756c74223b7d, '', 123, 7, 1, 'admin/structure/types/manage/%/display', 'admin/structure/types/manage/%', 'Default', 't', '', '', 'a:0:{}', 140, '', '', -10, 'modules/field_ui/field_ui.admin.inc');
INSERT INTO `menu_router` VALUES('admin/structure/types/manage/%/display/full', 0x613a313a7b693a343b733a31343a226e6f64655f747970655f6c6f6164223b7d, '', '_field_ui_view_mode_menu_access', 0x613a353a7b693a303b733a343a226e6f6465223b693a313b693a343b693a323b733a343a2266756c6c223b693a333b733a31313a22757365725f616363657373223b693a343b733a32343a2261646d696e697374657220636f6e74656e74207479706573223b7d, 'drupal_get_form', 0x613a343a7b693a303b733a33303a226669656c645f75695f646973706c61795f6f766572766965775f666f726d223b693a313b733a343a226e6f6465223b693a323b693a343b693a333b733a343a2266756c6c223b7d, '', 123, 7, 1, 'admin/structure/types/manage/%/display', 'admin/structure/types/manage/%', 'Full content', 't', '', '', 'a:0:{}', 132, '', '', 0, 'modules/field_ui/field_ui.admin.inc');
INSERT INTO `menu_router` VALUES('admin/structure/types/manage/%/display/rss', 0x613a313a7b693a343b733a31343a226e6f64655f747970655f6c6f6164223b7d, '', '_field_ui_view_mode_menu_access', 0x613a353a7b693a303b733a343a226e6f6465223b693a313b693a343b693a323b733a333a22727373223b693a333b733a31313a22757365725f616363657373223b693a343b733a32343a2261646d696e697374657220636f6e74656e74207479706573223b7d, 'drupal_get_form', 0x613a343a7b693a303b733a33303a226669656c645f75695f646973706c61795f6f766572766965775f666f726d223b693a313b733a343a226e6f6465223b693a323b693a343b693a333b733a333a22727373223b7d, '', 123, 7, 1, 'admin/structure/types/manage/%/display', 'admin/structure/types/manage/%', 'RSS', 't', '', '', 'a:0:{}', 132, '', '', 2, 'modules/field_ui/field_ui.admin.inc');
INSERT INTO `menu_router` VALUES('admin/structure/types/manage/%/display/search_index', 0x613a313a7b693a343b733a31343a226e6f64655f747970655f6c6f6164223b7d, '', '_field_ui_view_mode_menu_access', 0x613a353a7b693a303b733a343a226e6f6465223b693a313b693a343b693a323b733a31323a227365617263685f696e646578223b693a333b733a31313a22757365725f616363657373223b693a343b733a32343a2261646d696e697374657220636f6e74656e74207479706573223b7d, 'drupal_get_form', 0x613a343a7b693a303b733a33303a226669656c645f75695f646973706c61795f6f766572766965775f666f726d223b693a313b733a343a226e6f6465223b693a323b693a343b693a333b733a31323a227365617263685f696e646578223b7d, '', 123, 7, 1, 'admin/structure/types/manage/%/display', 'admin/structure/types/manage/%', 'Search index', 't', '', '', 'a:0:{}', 132, '', '', 3, 'modules/field_ui/field_ui.admin.inc');
INSERT INTO `menu_router` VALUES('admin/structure/types/manage/%/display/search_result', 0x613a313a7b693a343b733a31343a226e6f64655f747970655f6c6f6164223b7d, '', '_field_ui_view_mode_menu_access', 0x613a353a7b693a303b733a343a226e6f6465223b693a313b693a343b693a323b733a31333a227365617263685f726573756c74223b693a333b733a31313a22757365725f616363657373223b693a343b733a32343a2261646d696e697374657220636f6e74656e74207479706573223b7d, 'drupal_get_form', 0x613a343a7b693a303b733a33303a226669656c645f75695f646973706c61795f6f766572766965775f666f726d223b693a313b733a343a226e6f6465223b693a323b693a343b693a333b733a31333a227365617263685f726573756c74223b7d, '', 123, 7, 1, 'admin/structure/types/manage/%/display', 'admin/structure/types/manage/%', 'Search result', 't', '', '', 'a:0:{}', 132, '', '', 4, 'modules/field_ui/field_ui.admin.inc');
INSERT INTO `menu_router` VALUES('admin/structure/types/manage/%/display/teaser', 0x613a313a7b693a343b733a31343a226e6f64655f747970655f6c6f6164223b7d, '', '_field_ui_view_mode_menu_access', 0x613a353a7b693a303b733a343a226e6f6465223b693a313b693a343b693a323b733a363a22746561736572223b693a333b733a31313a22757365725f616363657373223b693a343b733a32343a2261646d696e697374657220636f6e74656e74207479706573223b7d, 'drupal_get_form', 0x613a343a7b693a303b733a33303a226669656c645f75695f646973706c61795f6f766572766965775f666f726d223b693a313b733a343a226e6f6465223b693a323b693a343b693a333b733a363a22746561736572223b7d, '', 123, 7, 1, 'admin/structure/types/manage/%/display', 'admin/structure/types/manage/%', 'Teaser', 't', '', '', 'a:0:{}', 132, '', '', 1, 'modules/field_ui/field_ui.admin.inc');
INSERT INTO `menu_router` VALUES('admin/structure/types/manage/%/edit', 0x613a313a7b693a343b733a31343a226e6f64655f747970655f6c6f6164223b7d, '', 'user_access', 0x613a313a7b693a303b733a32343a2261646d696e697374657220636f6e74656e74207479706573223b7d, 'drupal_get_form', 0x613a323a7b693a303b733a31343a226e6f64655f747970655f666f726d223b693a313b693a343b7d, '', 61, 6, 1, 'admin/structure/types/manage/%', 'admin/structure/types/manage/%', 'Edit', 't', '', '', 'a:0:{}', 140, '', '', 0, 'modules/node/content_types.inc');
INSERT INTO `menu_router` VALUES('admin/structure/types/manage/%/fields', 0x613a313a7b693a343b733a31343a226e6f64655f747970655f6c6f6164223b7d, '', 'user_access', 0x613a313a7b693a303b733a32343a2261646d696e697374657220636f6e74656e74207479706573223b7d, 'drupal_get_form', 0x613a333a7b693a303b733a32383a226669656c645f75695f6669656c645f6f766572766965775f666f726d223b693a313b733a343a226e6f6465223b693a323b693a343b7d, '', 61, 6, 1, 'admin/structure/types/manage/%', 'admin/structure/types/manage/%', 'Manage fields', 't', '', '', 'a:0:{}', 132, '', '', 1, 'modules/field_ui/field_ui.admin.inc');
INSERT INTO `menu_router` VALUES('admin/structure/types/manage/%/fields/%', 0x613a323a7b693a343b613a313a7b733a31343a226e6f64655f747970655f6c6f6164223b613a343a7b693a303b733a343a226e6f6465223b693a313b693a343b693a323b733a313a2234223b693a333b733a343a22256d6170223b7d7d693a363b613a313a7b733a31383a226669656c645f75695f6d656e755f6c6f6164223b613a343a7b693a303b733a343a226e6f6465223b693a313b693a343b693a323b733a313a2234223b693a333b733a343a22256d6170223b7d7d7d, '', 'user_access', 0x613a313a7b693a303b733a32343a2261646d696e697374657220636f6e74656e74207479706573223b7d, 'drupal_get_form', 0x613a323a7b693a303b733a32343a226669656c645f75695f6669656c645f656469745f666f726d223b693a313b693a363b7d, '', 122, 7, 0, '', 'admin/structure/types/manage/%/fields/%', '', 'field_ui_menu_title', 'a:1:{i:0;i:6;}', '', 'a:0:{}', 6, '', '', 0, 'modules/field_ui/field_ui.admin.inc');
INSERT INTO `menu_router` VALUES('admin/structure/types/manage/%/fields/%/delete', 0x613a323a7b693a343b613a313a7b733a31343a226e6f64655f747970655f6c6f6164223b613a343a7b693a303b733a343a226e6f6465223b693a313b693a343b693a323b733a313a2234223b693a333b733a343a22256d6170223b7d7d693a363b613a313a7b733a31383a226669656c645f75695f6d656e755f6c6f6164223b613a343a7b693a303b733a343a226e6f6465223b693a313b693a343b693a323b733a313a2234223b693a333b733a343a22256d6170223b7d7d7d, '', 'user_access', 0x613a313a7b693a303b733a32343a2261646d696e697374657220636f6e74656e74207479706573223b7d, 'drupal_get_form', 0x613a323a7b693a303b733a32363a226669656c645f75695f6669656c645f64656c6574655f666f726d223b693a313b693a363b7d, '', 245, 8, 1, 'admin/structure/types/manage/%/fields/%', 'admin/structure/types/manage/%/fields/%', 'Delete', 't', '', '', 'a:0:{}', 132, '', '', 10, 'modules/field_ui/field_ui.admin.inc');
INSERT INTO `menu_router` VALUES('admin/structure/types/manage/%/fields/%/edit', 0x613a323a7b693a343b613a313a7b733a31343a226e6f64655f747970655f6c6f6164223b613a343a7b693a303b733a343a226e6f6465223b693a313b693a343b693a323b733a313a2234223b693a333b733a343a22256d6170223b7d7d693a363b613a313a7b733a31383a226669656c645f75695f6d656e755f6c6f6164223b613a343a7b693a303b733a343a226e6f6465223b693a313b693a343b693a323b733a313a2234223b693a333b733a343a22256d6170223b7d7d7d, '', 'user_access', 0x613a313a7b693a303b733a32343a2261646d696e697374657220636f6e74656e74207479706573223b7d, 'drupal_get_form', 0x613a323a7b693a303b733a32343a226669656c645f75695f6669656c645f656469745f666f726d223b693a313b693a363b7d, '', 245, 8, 1, 'admin/structure/types/manage/%/fields/%', 'admin/structure/types/manage/%/fields/%', 'Edit', 't', '', '', 'a:0:{}', 140, '', '', 0, 'modules/field_ui/field_ui.admin.inc');
INSERT INTO `menu_router` VALUES('admin/structure/types/manage/%/fields/%/field-settings', 0x613a323a7b693a343b613a313a7b733a31343a226e6f64655f747970655f6c6f6164223b613a343a7b693a303b733a343a226e6f6465223b693a313b693a343b693a323b733a313a2234223b693a333b733a343a22256d6170223b7d7d693a363b613a313a7b733a31383a226669656c645f75695f6d656e755f6c6f6164223b613a343a7b693a303b733a343a226e6f6465223b693a313b693a343b693a323b733a313a2234223b693a333b733a343a22256d6170223b7d7d7d, '', 'user_access', 0x613a313a7b693a303b733a32343a2261646d696e697374657220636f6e74656e74207479706573223b7d, 'drupal_get_form', 0x613a323a7b693a303b733a32383a226669656c645f75695f6669656c645f73657474696e67735f666f726d223b693a313b693a363b7d, '', 245, 8, 1, 'admin/structure/types/manage/%/fields/%', 'admin/structure/types/manage/%/fields/%', 'Field settings', 't', '', '', 'a:0:{}', 132, '', '', 0, 'modules/field_ui/field_ui.admin.inc');
INSERT INTO `menu_router` VALUES('admin/structure/types/manage/%/fields/%/widget-type', 0x613a323a7b693a343b613a313a7b733a31343a226e6f64655f747970655f6c6f6164223b613a343a7b693a303b733a343a226e6f6465223b693a313b693a343b693a323b733a313a2234223b693a333b733a343a22256d6170223b7d7d693a363b613a313a7b733a31383a226669656c645f75695f6d656e755f6c6f6164223b613a343a7b693a303b733a343a226e6f6465223b693a313b693a343b693a323b733a313a2234223b693a333b733a343a22256d6170223b7d7d7d, '', 'user_access', 0x613a313a7b693a303b733a32343a2261646d696e697374657220636f6e74656e74207479706573223b7d, 'drupal_get_form', 0x613a323a7b693a303b733a32353a226669656c645f75695f7769646765745f747970655f666f726d223b693a313b693a363b7d, '', 245, 8, 1, 'admin/structure/types/manage/%/fields/%', 'admin/structure/types/manage/%/fields/%', 'Widget type', 't', '', '', 'a:0:{}', 132, '', '', 0, 'modules/field_ui/field_ui.admin.inc');
INSERT INTO `menu_router` VALUES('admin/structure/types/manage/%/groups/%/delete', 0x613a323a7b693a343b613a313a7b733a31343a226e6f64655f747970655f6c6f6164223b613a343a7b693a303b733a343a226e6f6465223b693a313b693a343b693a323b733a313a2234223b693a333b733a343a22256d6170223b7d7d693a363b613a313a7b733a32313a226669656c645f67726f75705f6d656e755f6c6f6164223b613a343a7b693a303b733a343a226e6f6465223b693a313b693a343b693a323b733a313a2234223b693a333b733a343a22256d6170223b7d7d7d, '', 'user_access', 0x613a313a7b693a303b733a32343a2261646d696e697374657220636f6e74656e74207479706573223b7d, 'drupal_get_form', 0x613a323a7b693a303b733a32333a226669656c645f67726f75705f64656c6574655f666f726d223b693a313b693a363b7d, '', 245, 8, 0, '', 'admin/structure/types/manage/%/groups/%/delete', 'Delete', 't', '', '', 'a:0:{}', 0, '', '', 0, 'sites/all/modules/field_group/field_group.field_ui.inc');
INSERT INTO `menu_router` VALUES('admin/structure/views', '', '', 'ctools_export_ui_task_access', 0x613a323a7b693a303b733a383a2276696577735f7569223b693a313b733a343a226c697374223b7d, 'ctools_export_ui_switcher_page', 0x613a323a7b693a303b733a383a2276696577735f7569223b693a313b733a343a226c697374223b7d, '', 7, 3, 0, '', 'admin/structure/views', 'Views', 't', '', '', 'a:0:{}', 6, 'Manage customized lists of content.', '', 0, 'sites/all/modules/ctools/includes/export-ui.inc');
INSERT INTO `menu_router` VALUES('admin/structure/views/add', '', '', 'user_access', 0x613a313a7b693a303b733a31363a2261646d696e6973746572207669657773223b7d, 'views_ui_add_page', 0x613a303a7b7d, '', 15, 4, 1, 'admin/structure/views', 'admin/structure/views', 'Add new view', 't', '', '', 'a:0:{}', 388, '', '', 0, 'sites/all/modules/views/includes/admin.inc');
INSERT INTO `menu_router` VALUES('admin/structure/views/add-template', '', '', 'user_access', 0x613a313a7b693a303b733a31363a2261646d696e6973746572207669657773223b7d, 'views_ui_add_template_page', 0x613a303a7b7d, '', 15, 4, 1, 'admin/structure/views', 'admin/structure/views', 'Add view from template', 't', '', '', 'a:0:{}', 388, '', '', 0, 'sites/all/modules/views/includes/admin.inc');
INSERT INTO `menu_router` VALUES('admin/structure/views/ajax/%/%', 0x613a323a7b693a343b4e3b693a353b733a31393a2276696577735f75695f63616368655f6c6f6164223b7d, '', 'user_access', 0x613a313a7b693a303b733a31363a2261646d696e6973746572207669657773223b7d, 'views_ui_ajax_form', 0x613a333a7b693a303b623a313b693a313b693a343b693a323b693a353b7d, 'ajax_deliver', 60, 6, 0, '', 'admin/structure/views/ajax/%/%', '', 't', '', '', 'a:0:{}', 0, '', '', 0, 'sites/all/modules/views/includes/admin.inc');
INSERT INTO `menu_router` VALUES('admin/structure/views/ajax/preview/%/%', 0x613a323a7b693a353b733a31393a2276696577735f75695f63616368655f6c6f6164223b693a363b4e3b7d, '', 'user_access', 0x613a313a7b693a303b733a31363a2261646d696e6973746572207669657773223b7d, 'views_ui_preview', 0x613a323a7b693a303b693a353b693a313b693a363b7d, 'ajax_deliver', 124, 7, 0, '', 'admin/structure/views/ajax/preview/%/%', '', 't', '', '', 'a:0:{}', 6, '', '', 0, 'sites/all/modules/views/includes/admin.inc');
INSERT INTO `menu_router` VALUES('admin/structure/views/import', '', '', 'views_import_access', 0x613a313a7b693a303b733a31363a2261646d696e6973746572207669657773223b7d, 'drupal_get_form', 0x613a313a7b693a303b733a32303a2276696577735f75695f696d706f72745f70616765223b7d, '', 15, 4, 1, 'admin/structure/views', 'admin/structure/views', 'Import', 't', '', '', 'a:0:{}', 388, '', '', 0, 'sites/all/modules/views/includes/admin.inc');
INSERT INTO `menu_router` VALUES('admin/structure/views/list', '', '', 'ctools_export_ui_task_access', 0x613a323a7b693a303b733a383a2276696577735f7569223b693a313b733a343a226c697374223b7d, 'ctools_export_ui_switcher_page', 0x613a323a7b693a303b733a383a2276696577735f7569223b693a313b733a343a226c697374223b7d, '', 15, 4, 1, 'admin/structure/views', 'admin/structure/views', 'List', 't', '', '', 'a:0:{}', 140, '', '', -10, 'sites/all/modules/ctools/includes/export-ui.inc');
INSERT INTO `menu_router` VALUES('admin/structure/views/nojs/%/%', 0x613a323a7b693a343b4e3b693a353b733a31393a2276696577735f75695f63616368655f6c6f6164223b7d, '', 'user_access', 0x613a313a7b693a303b733a31363a2261646d696e6973746572207669657773223b7d, 'views_ui_ajax_form', 0x613a333a7b693a303b623a303b693a313b693a343b693a323b693a353b7d, '', 60, 6, 0, '', 'admin/structure/views/nojs/%/%', '', 't', '', '', 'a:0:{}', 0, '', '', 0, 'sites/all/modules/views/includes/admin.inc');
INSERT INTO `menu_router` VALUES('admin/structure/views/nojs/preview/%/%', 0x613a323a7b693a353b733a31393a2276696577735f75695f63616368655f6c6f6164223b693a363b4e3b7d, '', 'user_access', 0x613a313a7b693a303b733a31363a2261646d696e6973746572207669657773223b7d, 'views_ui_preview', 0x613a323a7b693a303b693a353b693a313b693a363b7d, '', 124, 7, 0, '', 'admin/structure/views/nojs/preview/%/%', '', 't', '', '', 'a:0:{}', 6, '', '', 0, 'sites/all/modules/views/includes/admin.inc');
INSERT INTO `menu_router` VALUES('admin/structure/views/settings', '', '', 'user_access', 0x613a313a7b693a303b733a31363a2261646d696e6973746572207669657773223b7d, 'drupal_get_form', 0x613a313a7b693a303b733a32393a2276696577735f75695f61646d696e5f73657474696e67735f6261736963223b7d, '', 15, 4, 1, 'admin/structure/views', 'admin/structure/views', 'Settings', 't', '', '', 'a:0:{}', 132, '', '', 0, 'sites/all/modules/views/includes/admin.inc');
INSERT INTO `menu_router` VALUES('admin/structure/views/settings/advanced', '', '', 'user_access', 0x613a313a7b693a303b733a31363a2261646d696e6973746572207669657773223b7d, 'drupal_get_form', 0x613a313a7b693a303b733a33323a2276696577735f75695f61646d696e5f73657474696e67735f616476616e636564223b7d, '', 31, 5, 1, 'admin/structure/views/settings', 'admin/structure/views', 'Advanced', 't', '', '', 'a:0:{}', 132, '', '', 1, 'sites/all/modules/views/includes/admin.inc');
INSERT INTO `menu_router` VALUES('admin/structure/views/settings/basic', '', '', 'user_access', 0x613a313a7b693a303b733a31363a2261646d696e6973746572207669657773223b7d, 'drupal_get_form', 0x613a313a7b693a303b733a32393a2276696577735f75695f61646d696e5f73657474696e67735f6261736963223b7d, '', 31, 5, 1, 'admin/structure/views/settings', 'admin/structure/views', 'Basic', 't', '', '', 'a:0:{}', 140, '', '', 0, 'sites/all/modules/views/includes/admin.inc');
INSERT INTO `menu_router` VALUES('admin/structure/views/template/%/add', 0x613a313a7b693a343b4e3b7d, '', 'ctools_export_ui_task_access', 0x613a333a7b693a303b733a383a2276696577735f7569223b693a313b733a31323a226164645f74656d706c617465223b693a323b693a343b7d, 'ctools_export_ui_switcher_page', 0x613a333a7b693a303b733a383a2276696577735f7569223b693a313b733a31323a226164645f74656d706c617465223b693a323b693a343b7d, '', 61, 6, 0, '', 'admin/structure/views/template/%/add', 'Add from template', 't', '', '', 'a:0:{}', 0, '', '', 0, 'sites/all/modules/ctools/includes/export-ui.inc');
INSERT INTO `menu_router` VALUES('admin/structure/views/view/%', 0x613a313a7b693a343b733a31393a2276696577735f75695f63616368655f6c6f6164223b7d, '', 'user_access', 0x613a313a7b693a303b733a31363a2261646d696e6973746572207669657773223b7d, 'views_ui_edit_page', 0x613a313a7b693a303b693a343b7d, '', 30, 5, 0, '', 'admin/structure/views/view/%', '', 'views_ui_edit_page_title', 'a:1:{i:0;i:4;}', '', 'a:0:{}', 6, '', '', 0, 'sites/all/modules/views/includes/admin.inc');
INSERT INTO `menu_router` VALUES('admin/structure/views/view/%/break-lock', 0x613a313a7b693a343b733a31393a2276696577735f75695f63616368655f6c6f6164223b7d, '', 'user_access', 0x613a313a7b693a303b733a31363a2261646d696e6973746572207669657773223b7d, 'drupal_get_form', 0x613a323a7b693a303b733a32373a2276696577735f75695f627265616b5f6c6f636b5f636f6e6669726d223b693a313b693a343b7d, '', 61, 6, 0, '', 'admin/structure/views/view/%/break-lock', 'Break lock', 't', '', '', 'a:0:{}', 4, '', '', 0, 'sites/all/modules/views/includes/admin.inc');
INSERT INTO `menu_router` VALUES('admin/structure/views/view/%/clone', 0x613a313a7b693a343b613a313a7b733a32313a2263746f6f6c735f6578706f72745f75695f6c6f6164223b613a313a7b693a303b733a383a2276696577735f7569223b7d7d7d, '', 'ctools_export_ui_task_access', 0x613a333a7b693a303b733a383a2276696577735f7569223b693a313b733a353a22636c6f6e65223b693a323b693a343b7d, 'ctools_export_ui_switcher_page', 0x613a333a7b693a303b733a383a2276696577735f7569223b693a313b733a353a22636c6f6e65223b693a323b693a343b7d, '', 61, 6, 0, '', 'admin/structure/views/view/%/clone', 'Clone', 't', '', '', 'a:0:{}', 4, '', '', 0, 'sites/all/modules/ctools/includes/export-ui.inc');
INSERT INTO `menu_router` VALUES('admin/structure/views/view/%/delete', 0x613a313a7b693a343b613a313a7b733a32313a2263746f6f6c735f6578706f72745f75695f6c6f6164223b613a313a7b693a303b733a383a2276696577735f7569223b7d7d7d, '', 'ctools_export_ui_task_access', 0x613a333a7b693a303b733a383a2276696577735f7569223b693a313b733a363a2264656c657465223b693a323b693a343b7d, 'ctools_export_ui_switcher_page', 0x613a333a7b693a303b733a383a2276696577735f7569223b693a313b733a363a2264656c657465223b693a323b693a343b7d, '', 61, 6, 0, '', 'admin/structure/views/view/%/delete', 'Delete', 't', '', '', 'a:0:{}', 4, '', '', 0, 'sites/all/modules/ctools/includes/export-ui.inc');
INSERT INTO `menu_router` VALUES('admin/structure/views/view/%/disable', 0x613a313a7b693a343b613a313a7b733a32313a2263746f6f6c735f6578706f72745f75695f6c6f6164223b613a313a7b693a303b733a383a2276696577735f7569223b7d7d7d, '', 'ctools_export_ui_task_access', 0x613a333a7b693a303b733a383a2276696577735f7569223b693a313b733a373a2264697361626c65223b693a323b693a343b7d, 'ctools_export_ui_switcher_page', 0x613a333a7b693a303b733a383a2276696577735f7569223b693a313b733a373a2264697361626c65223b693a323b693a343b7d, '', 61, 6, 0, '', 'admin/structure/views/view/%/disable', 'Disable', 't', '', '', 'a:0:{}', 0, '', '', 0, 'sites/all/modules/ctools/includes/export-ui.inc');
INSERT INTO `menu_router` VALUES('admin/structure/views/view/%/edit', 0x613a313a7b693a343b733a31393a2276696577735f75695f63616368655f6c6f6164223b7d, '', 'user_access', 0x613a313a7b693a303b733a31363a2261646d696e6973746572207669657773223b7d, 'views_ui_edit_page', 0x613a313a7b693a303b693a343b7d, '', 61, 6, 3, 'admin/structure/views/view/%', 'admin/structure/views/view/%', 'Edit view', 't', '', 'ajax_base_page_theme', 'a:0:{}', 140, '', '', -10, 'sites/all/modules/views/includes/admin.inc');
INSERT INTO `menu_router` VALUES('admin/structure/views/view/%/edit/%/ajax', 0x613a323a7b693a343b733a31393a2276696577735f75695f63616368655f6c6f6164223b693a363b4e3b7d, '', 'user_access', 0x613a313a7b693a303b733a31363a2261646d696e6973746572207669657773223b7d, 'views_ui_ajax_get_form', 0x613a333a7b693a303b733a31383a2276696577735f75695f656469745f666f726d223b693a313b693a343b693a323b693a363b7d, 'ajax_deliver', 245, 8, 0, '', 'admin/structure/views/view/%/edit/%/ajax', '', 't', '', 'ajax_base_page_theme', 'a:0:{}', 0, '', '', 0, 'sites/all/modules/views/includes/admin.inc');
INSERT INTO `menu_router` VALUES('admin/structure/views/view/%/enable', 0x613a313a7b693a343b613a313a7b733a32313a2263746f6f6c735f6578706f72745f75695f6c6f6164223b613a313a7b693a303b733a383a2276696577735f7569223b7d7d7d, '', 'ctools_export_ui_task_access', 0x613a333a7b693a303b733a383a2276696577735f7569223b693a313b733a363a22656e61626c65223b693a323b693a343b7d, 'ctools_export_ui_switcher_page', 0x613a333a7b693a303b733a383a2276696577735f7569223b693a313b733a363a22656e61626c65223b693a323b693a343b7d, '', 61, 6, 0, '', 'admin/structure/views/view/%/enable', 'Enable', 't', '', '', 'a:0:{}', 0, '', '', 0, 'sites/all/modules/ctools/includes/export-ui.inc');
INSERT INTO `menu_router` VALUES('admin/structure/views/view/%/export', 0x613a313a7b693a343b613a313a7b733a32313a2263746f6f6c735f6578706f72745f75695f6c6f6164223b613a313a7b693a303b733a383a2276696577735f7569223b7d7d7d, '', 'ctools_export_ui_task_access', 0x613a333a7b693a303b733a383a2276696577735f7569223b693a313b733a363a226578706f7274223b693a323b693a343b7d, 'ctools_export_ui_switcher_page', 0x613a333a7b693a303b733a383a2276696577735f7569223b693a313b733a363a226578706f7274223b693a323b693a343b7d, '', 61, 6, 0, '', 'admin/structure/views/view/%/export', 'Export', 't', '', '', 'a:0:{}', 4, '', '', 0, 'sites/all/modules/ctools/includes/export-ui.inc');
INSERT INTO `menu_router` VALUES('admin/structure/views/view/%/preview/%', 0x613a323a7b693a343b733a31393a2276696577735f75695f63616368655f6c6f6164223b693a363b4e3b7d, '', 'user_access', 0x613a313a7b693a303b733a31363a2261646d696e6973746572207669657773223b7d, 'views_ui_build_preview', 0x613a323a7b693a303b693a343b693a313b693a363b7d, '', 122, 7, 3, '', 'admin/structure/views/view/%/preview/%', '', 't', '', '', 'a:0:{}', 4, '', '', 0, 'sites/all/modules/views/includes/admin.inc');
INSERT INTO `menu_router` VALUES('admin/structure/views/view/%/preview/%/ajax', 0x613a323a7b693a343b733a31393a2276696577735f75695f63616368655f6c6f6164223b693a363b4e3b7d, '', 'user_access', 0x613a313a7b693a303b733a31363a2261646d696e6973746572207669657773223b7d, 'views_ui_build_preview', 0x613a323a7b693a303b693a343b693a313b693a363b7d, 'ajax_deliver', 245, 8, 0, '', 'admin/structure/views/view/%/preview/%/ajax', '', 't', '', 'ajax_base_page_theme', 'a:0:{}', 0, '', '', 0, 'sites/all/modules/views/includes/admin.inc');
INSERT INTO `menu_router` VALUES('admin/structure/views/view/%/revert', 0x613a313a7b693a343b613a313a7b733a32313a2263746f6f6c735f6578706f72745f75695f6c6f6164223b613a313a7b693a303b733a383a2276696577735f7569223b7d7d7d, '', 'ctools_export_ui_task_access', 0x613a333a7b693a303b733a383a2276696577735f7569223b693a313b733a363a22726576657274223b693a323b693a343b7d, 'ctools_export_ui_switcher_page', 0x613a333a7b693a303b733a383a2276696577735f7569223b693a313b733a363a2264656c657465223b693a323b693a343b7d, '', 61, 6, 0, '', 'admin/structure/views/view/%/revert', 'Revert', 't', '', '', 'a:0:{}', 4, '', '', 0, 'sites/all/modules/ctools/includes/export-ui.inc');
INSERT INTO `menu_router` VALUES('admin/tasks', '', '', 'user_access', 0x613a313a7b693a303b733a32373a226163636573732061646d696e697374726174696f6e207061676573223b7d, 'system_admin_menu_block_page', 0x613a303a7b7d, '', 3, 2, 1, 'admin', 'admin', 'Tasks', 't', '', '', 'a:0:{}', 140, '', '', -20, 'modules/system/system.admin.inc');
INSERT INTO `menu_router` VALUES('admin/update/ready', '', '', 'update_manager_access', 0x613a303a7b7d, 'drupal_get_form', 0x613a313a7b693a303b733a33323a227570646174655f6d616e616765725f7570646174655f72656164795f666f726d223b7d, '', 7, 3, 0, '', 'admin/update/ready', 'Ready to update', 't', '', '', 'a:0:{}', 0, '', '', 0, 'modules/update/update.manager.inc');
INSERT INTO `menu_router` VALUES('admin/views/ajax/autocomplete/tag', '', '', 'user_access', 0x613a313a7b693a303b733a31363a2261646d696e6973746572207669657773223b7d, 'views_ui_autocomplete_tag', 0x613a303a7b7d, '', 31, 5, 0, '', 'admin/views/ajax/autocomplete/tag', '', 't', '', '', 'a:0:{}', 0, '', '', 0, 'sites/all/modules/views/includes/admin.inc');
INSERT INTO `menu_router` VALUES('admin/views/ajax/autocomplete/taxonomy', '', '', 'user_access', 0x613a313a7b693a303b733a31343a2261636365737320636f6e74656e74223b7d, 'views_ajax_autocomplete_taxonomy', 0x613a303a7b7d, '', 31, 5, 0, '', 'admin/views/ajax/autocomplete/taxonomy', '', 't', '', 'ajax_base_page_theme', 'a:0:{}', 0, '', '', 0, 'sites/all/modules/views/includes/ajax.inc');
INSERT INTO `menu_router` VALUES('admin/views/ajax/autocomplete/user', '', '', 'user_access', 0x613a313a7b693a303b733a32303a2261636365737320757365722070726f66696c6573223b7d, 'views_ajax_autocomplete_user', 0x613a303a7b7d, '', 31, 5, 0, '', 'admin/views/ajax/autocomplete/user', '', 't', '', 'ajax_base_page_theme', 'a:0:{}', 0, '', '', 0, 'sites/all/modules/views/includes/ajax.inc');
INSERT INTO `menu_router` VALUES('batch', '', '', '1', 0x613a303a7b7d, 'system_batch_page', 0x613a303a7b7d, '', 1, 1, 0, '', 'batch', '', 't', '', '_system_batch_theme', 'a:0:{}', 0, '', '', 0, 'modules/system/system.admin.inc');
INSERT INTO `menu_router` VALUES('comment/%', 0x613a313a7b693a313b4e3b7d, '', 'user_access', 0x613a313a7b693a303b733a31353a2261636365737320636f6d6d656e7473223b7d, 'comment_permalink', 0x613a313a7b693a303b693a313b7d, '', 2, 2, 0, '', 'comment/%', 'Comment permalink', 't', '', '', 'a:0:{}', 6, '', '', 0, '');
INSERT INTO `menu_router` VALUES('comment/%/approve', 0x613a313a7b693a313b4e3b7d, '', 'user_access', 0x613a313a7b693a303b733a31393a2261646d696e697374657220636f6d6d656e7473223b7d, 'comment_approve', 0x613a313a7b693a303b693a313b7d, '', 5, 3, 0, '', 'comment/%/approve', 'Approve', 't', '', '', 'a:0:{}', 6, '', '', 1, 'modules/comment/comment.pages.inc');
INSERT INTO `menu_router` VALUES('comment/%/delete', 0x613a313a7b693a313b4e3b7d, '', 'user_access', 0x613a313a7b693a303b733a31393a2261646d696e697374657220636f6d6d656e7473223b7d, 'comment_confirm_delete_page', 0x613a313a7b693a303b693a313b7d, '', 5, 3, 1, 'comment/%', 'comment/%', 'Delete', 't', '', '', 'a:0:{}', 132, '', '', 2, 'modules/comment/comment.admin.inc');
INSERT INTO `menu_router` VALUES('comment/%/edit', 0x613a313a7b693a313b733a31323a22636f6d6d656e745f6c6f6164223b7d, '', 'comment_access', 0x613a323a7b693a303b733a343a2265646974223b693a313b693a313b7d, 'comment_edit_page', 0x613a313a7b693a303b693a313b7d, '', 5, 3, 1, 'comment/%', 'comment/%', 'Edit', 't', '', '', 'a:0:{}', 132, '', '', 0, '');
INSERT INTO `menu_router` VALUES('comment/%/view', 0x613a313a7b693a313b4e3b7d, '', 'user_access', 0x613a313a7b693a303b733a31353a2261636365737320636f6d6d656e7473223b7d, 'comment_permalink', 0x613a313a7b693a303b693a313b7d, '', 5, 3, 1, 'comment/%', 'comment/%', 'View comment', 't', '', '', 'a:0:{}', 140, '', '', -10, '');
INSERT INTO `menu_router` VALUES('comment/reply/%', 0x613a313a7b693a323b733a393a226e6f64655f6c6f6164223b7d, '', 'node_access', 0x613a323a7b693a303b733a343a2276696577223b693a313b693a323b7d, 'comment_reply', 0x613a313a7b693a303b693a323b7d, '', 6, 3, 0, '', 'comment/reply/%', 'Add new comment', 't', '', '', 'a:0:{}', 6, '', '', 0, 'modules/comment/comment.pages.inc');
INSERT INTO `menu_router` VALUES('ctools/autocomplete/%', 0x613a313a7b693a323b4e3b7d, '', 'user_access', 0x613a313a7b693a303b733a31343a2261636365737320636f6e74656e74223b7d, 'ctools_content_autocomplete_entity', 0x613a313a7b693a303b693a323b7d, '', 6, 3, 0, '', 'ctools/autocomplete/%', '', 't', '', '', 'a:0:{}', 0, '', '', 0, 'sites/all/modules/ctools/includes/content.menu.inc');
INSERT INTO `menu_router` VALUES('ctools/context/ajax/access/add', '', '', 'user_access', 0x613a313a7b693a303b733a31343a2261636365737320636f6e74656e74223b7d, 'ctools_access_ajax_add', 0x613a303a7b7d, '', 31, 5, 0, '', 'ctools/context/ajax/access/add', '', 't', '', 'ajax_base_page_theme', 'a:0:{}', 0, '', '', 0, 'sites/all/modules/ctools/includes/context-access-admin.inc');
INSERT INTO `menu_router` VALUES('ctools/context/ajax/access/configure', '', '', 'user_access', 0x613a313a7b693a303b733a31343a2261636365737320636f6e74656e74223b7d, 'ctools_access_ajax_edit', 0x613a303a7b7d, '', 31, 5, 0, '', 'ctools/context/ajax/access/configure', '', 't', '', 'ajax_base_page_theme', 'a:0:{}', 0, '', '', 0, 'sites/all/modules/ctools/includes/context-access-admin.inc');
INSERT INTO `menu_router` VALUES('ctools/context/ajax/access/delete', '', '', 'user_access', 0x613a313a7b693a303b733a31343a2261636365737320636f6e74656e74223b7d, 'ctools_access_ajax_delete', 0x613a303a7b7d, '', 31, 5, 0, '', 'ctools/context/ajax/access/delete', '', 't', '', 'ajax_base_page_theme', 'a:0:{}', 0, '', '', 0, 'sites/all/modules/ctools/includes/context-access-admin.inc');
INSERT INTO `menu_router` VALUES('ctools/context/ajax/add', '', '', 'user_access', 0x613a313a7b693a303b733a31343a2261636365737320636f6e74656e74223b7d, 'ctools_context_ajax_item_add', 0x613a303a7b7d, '', 15, 4, 0, '', 'ctools/context/ajax/add', '', 't', '', 'ajax_base_page_theme', 'a:0:{}', 0, '', '', 0, 'sites/all/modules/ctools/includes/context-admin.inc');
INSERT INTO `menu_router` VALUES('ctools/context/ajax/configure', '', '', 'user_access', 0x613a313a7b693a303b733a31343a2261636365737320636f6e74656e74223b7d, 'ctools_context_ajax_item_edit', 0x613a303a7b7d, '', 15, 4, 0, '', 'ctools/context/ajax/configure', '', 't', '', 'ajax_base_page_theme', 'a:0:{}', 0, '', '', 0, 'sites/all/modules/ctools/includes/context-admin.inc');
INSERT INTO `menu_router` VALUES('ctools/context/ajax/delete', '', '', 'user_access', 0x613a313a7b693a303b733a31343a2261636365737320636f6e74656e74223b7d, 'ctools_context_ajax_item_delete', 0x613a303a7b7d, '', 15, 4, 0, '', 'ctools/context/ajax/delete', '', 't', '', 'ajax_base_page_theme', 'a:0:{}', 0, '', '', 0, 'sites/all/modules/ctools/includes/context-admin.inc');
INSERT INTO `menu_router` VALUES('data', '', '', 'services_access_menu', 0x613a303a7b7d, 'services_endpoint_callback', 0x613a313a7b693a303b733a31303a2271725f636f6e74656e74223b7d, '', 1, 1, 0, '', 'data', 'Services endpoint', 't', '', '', 'a:0:{}', 0, '', '', 0, '');
INSERT INTO `menu_router` VALUES('file/ajax', '', '', 'user_access', 0x613a313a7b693a303b733a31343a2261636365737320636f6e74656e74223b7d, 'file_ajax_upload', 0x613a303a7b7d, 'ajax_deliver', 3, 2, 0, '', 'file/ajax', '', 't', '', 'ajax_base_page_theme', 'a:0:{}', 0, '', '', 0, '');
INSERT INTO `menu_router` VALUES('file/progress', '', '', 'user_access', 0x613a313a7b693a303b733a31343a2261636365737320636f6e74656e74223b7d, 'file_ajax_progress', 0x613a303a7b7d, '', 3, 2, 0, '', 'file/progress', '', 't', '', 'ajax_base_page_theme', 'a:0:{}', 0, '', '', 0, '');
INSERT INTO `menu_router` VALUES('filter/tips', '', '', '1', 0x613a303a7b7d, 'filter_tips_long', 0x613a303a7b7d, '', 3, 2, 0, '', 'filter/tips', 'Compose tips', 't', '', '', 'a:0:{}', 20, '', '', 0, 'modules/filter/filter.pages.inc');
INSERT INTO `menu_router` VALUES('node', '', '', 'user_access', 0x613a313a7b693a303b733a31343a2261636365737320636f6e74656e74223b7d, 'node_page_default', 0x613a303a7b7d, '', 1, 1, 0, '', 'node', '', 't', '', '', 'a:0:{}', 0, '', '', 0, '');
INSERT INTO `menu_router` VALUES('node/%', 0x613a313a7b693a313b733a393a226e6f64655f6c6f6164223b7d, '', 'node_access', 0x613a323a7b693a303b733a343a2276696577223b693a313b693a313b7d, 'node_page_view', 0x613a313a7b693a303b693a313b7d, '', 2, 2, 0, '', 'node/%', '', 'node_page_title', 'a:1:{i:0;i:1;}', '', 'a:0:{}', 6, '', '', 0, '');
INSERT INTO `menu_router` VALUES('node/%/delete', 0x613a313a7b693a313b733a393a226e6f64655f6c6f6164223b7d, '', 'node_access', 0x613a323a7b693a303b733a363a2264656c657465223b693a313b693a313b7d, 'drupal_get_form', 0x613a323a7b693a303b733a31393a226e6f64655f64656c6574655f636f6e6669726d223b693a313b693a313b7d, '', 5, 3, 2, 'node/%', 'node/%', 'Delete', 't', '', '', 'a:0:{}', 132, '', '', 1, 'modules/node/node.pages.inc');
INSERT INTO `menu_router` VALUES('node/%/edit', 0x613a313a7b693a313b733a393a226e6f64655f6c6f6164223b7d, '', 'node_access', 0x613a323a7b693a303b733a363a22757064617465223b693a313b693a313b7d, 'node_page_edit', 0x613a313a7b693a303b693a313b7d, '', 5, 3, 3, 'node/%', 'node/%', 'Edit', 't', '', '', 'a:0:{}', 132, '', '', 0, 'modules/node/node.pages.inc');
INSERT INTO `menu_router` VALUES('node/%/revisions', 0x613a313a7b693a313b733a393a226e6f64655f6c6f6164223b7d, '', '_node_revision_access', 0x613a313a7b693a303b693a313b7d, 'node_revision_overview', 0x613a313a7b693a303b693a313b7d, '', 5, 3, 1, 'node/%', 'node/%', 'Revisions', 't', '', '', 'a:0:{}', 132, '', '', 2, 'modules/node/node.pages.inc');
INSERT INTO `menu_router` VALUES('node/%/revisions/%/delete', 0x613a323a7b693a313b613a313a7b733a393a226e6f64655f6c6f6164223b613a313a7b693a303b693a333b7d7d693a333b4e3b7d, '', '_node_revision_access', 0x613a323a7b693a303b693a313b693a313b733a363a2264656c657465223b7d, 'drupal_get_form', 0x613a323a7b693a303b733a32383a226e6f64655f7265766973696f6e5f64656c6574655f636f6e6669726d223b693a313b693a313b7d, '', 21, 5, 0, '', 'node/%/revisions/%/delete', 'Delete earlier revision', 't', '', '', 'a:0:{}', 6, '', '', 0, 'modules/node/node.pages.inc');
INSERT INTO `menu_router` VALUES('node/%/revisions/%/revert', 0x613a323a7b693a313b613a313a7b733a393a226e6f64655f6c6f6164223b613a313a7b693a303b693a333b7d7d693a333b4e3b7d, '', '_node_revision_access', 0x613a323a7b693a303b693a313b693a313b733a363a22757064617465223b7d, 'drupal_get_form', 0x613a323a7b693a303b733a32383a226e6f64655f7265766973696f6e5f7265766572745f636f6e6669726d223b693a313b693a313b7d, '', 21, 5, 0, '', 'node/%/revisions/%/revert', 'Revert to earlier revision', 't', '', '', 'a:0:{}', 6, '', '', 0, 'modules/node/node.pages.inc');
INSERT INTO `menu_router` VALUES('node/%/revisions/%/view', 0x613a323a7b693a313b613a313a7b733a393a226e6f64655f6c6f6164223b613a313a7b693a303b693a333b7d7d693a333b4e3b7d, '', '_node_revision_access', 0x613a313a7b693a303b693a313b7d, 'node_show', 0x613a323a7b693a303b693a313b693a313b623a313b7d, '', 21, 5, 0, '', 'node/%/revisions/%/view', 'Revisions', 't', '', '', 'a:0:{}', 6, '', '', 0, '');
INSERT INTO `menu_router` VALUES('node/%/view', 0x613a313a7b693a313b733a393a226e6f64655f6c6f6164223b7d, '', 'node_access', 0x613a323a7b693a303b733a343a2276696577223b693a313b693a313b7d, 'node_page_view', 0x613a313a7b693a303b693a313b7d, '', 5, 3, 1, 'node/%', 'node/%', 'View', 't', '', '', 'a:0:{}', 140, '', '', -10, '');
INSERT INTO `menu_router` VALUES('node/add', '', '', '_node_add_access', 0x613a303a7b7d, 'node_add_page', 0x613a303a7b7d, '', 3, 2, 0, '', 'node/add', 'Add content', 't', '', '', 'a:0:{}', 6, '', '', 0, 'modules/node/node.pages.inc');
INSERT INTO `menu_router` VALUES('node/add/page', '', '', 'node_access', 0x613a323a7b693a303b733a363a22637265617465223b693a313b733a343a2270616765223b7d, 'node_add', 0x613a313a7b693a303b733a343a2270616765223b7d, '', 7, 3, 0, '', 'node/add/page', 'Basic page', 'check_plain', '', '', 'a:0:{}', 6, 'Use <em>basic pages</em> for your static content, such as an ''About us'' page.', '', 0, 'modules/node/node.pages.inc');
INSERT INTO `menu_router` VALUES('node/add/qr-content', '', '', 'node_access', 0x613a323a7b693a303b733a363a22637265617465223b693a313b733a31303a2271725f636f6e74656e74223b7d, 'node_add', 0x613a313a7b693a303b733a31303a2271725f636f6e74656e74223b7d, '', 7, 3, 0, '', 'node/add/qr-content', 'QR Content', 'check_plain', '', '', 'a:0:{}', 6, '', '', 0, 'modules/node/node.pages.inc');
INSERT INTO `menu_router` VALUES('overlay-ajax/%', 0x613a313a7b693a313b4e3b7d, '', 'user_access', 0x613a313a7b693a303b733a31343a22616363657373206f7665726c6179223b7d, 'overlay_ajax_render_region', 0x613a313a7b693a303b693a313b7d, '', 2, 2, 0, '', 'overlay-ajax/%', '', 't', '', '', 'a:0:{}', 0, '', '', 0, '');
INSERT INTO `menu_router` VALUES('overlay/dismiss-message', '', '', 'user_access', 0x613a313a7b693a303b733a31343a22616363657373206f7665726c6179223b7d, 'overlay_user_dismiss_message', 0x613a303a7b7d, '', 3, 2, 0, '', 'overlay/dismiss-message', '', 't', '', '', 'a:0:{}', 0, '', '', 0, '');
INSERT INTO `menu_router` VALUES('rss.xml', '', '', 'user_access', 0x613a313a7b693a303b733a31343a2261636365737320636f6e74656e74223b7d, 'node_feed', 0x613a323a7b693a303b623a303b693a313b613a303a7b7d7d, '', 1, 1, 0, '', 'rss.xml', 'RSS feed', 't', '', '', 'a:0:{}', 0, '', '', 0, '');
INSERT INTO `menu_router` VALUES('search', '', '', 'search_is_active', 0x613a303a7b7d, 'search_view', 0x613a303a7b7d, '', 1, 1, 0, '', 'search', 'Search', 't', '', '', 'a:0:{}', 20, '', '', 0, 'modules/search/search.pages.inc');
INSERT INTO `menu_router` VALUES('search/node', '', '', '_search_menu_access', 0x613a313a7b693a303b733a343a226e6f6465223b7d, 'search_view', 0x613a323a7b693a303b733a343a226e6f6465223b693a313b733a303a22223b7d, '', 3, 2, 1, 'search', 'search', 'Content', 't', '', '', 'a:0:{}', 132, '', '', -10, 'modules/search/search.pages.inc');
INSERT INTO `menu_router` VALUES('search/node/%', 0x613a313a7b693a323b613a313a7b733a31343a226d656e755f7461696c5f6c6f6164223b613a323a7b693a303b733a343a22256d6170223b693a313b733a363a2225696e646578223b7d7d7d, 0x613a313a7b693a323b733a31363a226d656e755f7461696c5f746f5f617267223b7d, '_search_menu_access', 0x613a313a7b693a303b733a343a226e6f6465223b7d, 'search_view', 0x613a323a7b693a303b733a343a226e6f6465223b693a313b693a323b7d, '', 6, 3, 1, 'search/node', 'search/node/%', 'Content', 't', '', '', 'a:0:{}', 132, '', '', 0, 'modules/search/search.pages.inc');
INSERT INTO `menu_router` VALUES('search/user', '', '', '_search_menu_access', 0x613a313a7b693a303b733a343a2275736572223b7d, 'search_view', 0x613a323a7b693a303b733a343a2275736572223b693a313b733a303a22223b7d, '', 3, 2, 1, 'search', 'search', 'Users', 't', '', '', 'a:0:{}', 132, '', '', 0, 'modules/search/search.pages.inc');
INSERT INTO `menu_router` VALUES('search/user/%', 0x613a313a7b693a323b613a313a7b733a31343a226d656e755f7461696c5f6c6f6164223b613a323a7b693a303b733a343a22256d6170223b693a313b733a363a2225696e646578223b7d7d7d, 0x613a313a7b693a323b733a31363a226d656e755f7461696c5f746f5f617267223b7d, '_search_menu_access', 0x613a313a7b693a303b733a343a2275736572223b7d, 'search_view', 0x613a323a7b693a303b733a343a2275736572223b693a313b693a323b7d, '', 6, 3, 1, 'search/node', 'search/node/%', 'Users', 't', '', '', 'a:0:{}', 132, '', '', 0, 'modules/search/search.pages.inc');
INSERT INTO `menu_router` VALUES('services/session/token', '', '', '1', 0x613a303a7b7d, '_services_session_token', 0x613a303a7b7d, '', 7, 3, 0, '', 'services/session/token', '', 't', '', '', 'a:0:{}', 0, '', '', 0, '');
INSERT INTO `menu_router` VALUES('sites/default/files/styles/%', 0x613a313a7b693a343b733a31363a22696d6167655f7374796c655f6c6f6164223b7d, '', '1', 0x613a303a7b7d, 'image_style_deliver', 0x613a313a7b693a303b693a343b7d, '', 30, 5, 0, '', 'sites/default/files/styles/%', 'Generate image style', 't', '', '', 'a:0:{}', 0, '', '', 0, '');
INSERT INTO `menu_router` VALUES('system/ajax', '', '', '1', 0x613a303a7b7d, 'ajax_form_callback', 0x613a303a7b7d, 'ajax_deliver', 3, 2, 0, '', 'system/ajax', 'AHAH callback', 't', '', 'ajax_base_page_theme', 'a:0:{}', 0, '', '', 0, 'includes/form.inc');
INSERT INTO `menu_router` VALUES('system/files', '', '', '1', 0x613a303a7b7d, 'file_download', 0x613a313a7b693a303b733a373a2270726976617465223b7d, '', 3, 2, 0, '', 'system/files', 'File download', 't', '', '', 'a:0:{}', 0, '', '', 0, '');
INSERT INTO `menu_router` VALUES('system/files/styles/%', 0x613a313a7b693a333b733a31363a22696d6167655f7374796c655f6c6f6164223b7d, '', '1', 0x613a303a7b7d, 'image_style_deliver', 0x613a313a7b693a303b693a333b7d, '', 14, 4, 0, '', 'system/files/styles/%', 'Generate image style', 't', '', '', 'a:0:{}', 0, '', '', 0, '');
INSERT INTO `menu_router` VALUES('system/temporary', '', '', '1', 0x613a303a7b7d, 'file_download', 0x613a313a7b693a303b733a393a2274656d706f72617279223b7d, '', 3, 2, 0, '', 'system/temporary', 'Temporary files', 't', '', '', 'a:0:{}', 0, '', '', 0, '');
INSERT INTO `menu_router` VALUES('system/timezone', '', '', '1', 0x613a303a7b7d, 'system_timezone', 0x613a303a7b7d, '', 3, 2, 0, '', 'system/timezone', 'Time zone', 't', '', '', 'a:0:{}', 0, '', '', 0, 'modules/system/system.admin.inc');
INSERT INTO `menu_router` VALUES('taxonomy/autocomplete', '', '', 'user_access', 0x613a313a7b693a303b733a31343a2261636365737320636f6e74656e74223b7d, 'taxonomy_autocomplete', 0x613a303a7b7d, '', 3, 2, 0, '', 'taxonomy/autocomplete', 'Autocomplete taxonomy', 't', '', '', 'a:0:{}', 0, '', '', 0, 'modules/taxonomy/taxonomy.pages.inc');
INSERT INTO `menu_router` VALUES('taxonomy/term/%', 0x613a313a7b693a323b733a31383a227461786f6e6f6d795f7465726d5f6c6f6164223b7d, '', 'user_access', 0x613a313a7b693a303b733a31343a2261636365737320636f6e74656e74223b7d, 'taxonomy_term_page', 0x613a313a7b693a303b693a323b7d, '', 6, 3, 0, '', 'taxonomy/term/%', 'Taxonomy term', 'taxonomy_term_title', 'a:1:{i:0;i:2;}', '', 'a:0:{}', 6, '', '', 0, 'modules/taxonomy/taxonomy.pages.inc');
INSERT INTO `menu_router` VALUES('taxonomy/term/%/edit', 0x613a313a7b693a323b733a31383a227461786f6e6f6d795f7465726d5f6c6f6164223b7d, '', 'taxonomy_term_edit_access', 0x613a313a7b693a303b693a323b7d, 'drupal_get_form', 0x613a333a7b693a303b733a31383a227461786f6e6f6d795f666f726d5f7465726d223b693a313b693a323b693a323b4e3b7d, '', 13, 4, 1, 'taxonomy/term/%', 'taxonomy/term/%', 'Edit', 't', '', '', 'a:0:{}', 132, '', '', 10, 'modules/taxonomy/taxonomy.admin.inc');
INSERT INTO `menu_router` VALUES('taxonomy/term/%/feed', 0x613a313a7b693a323b733a31383a227461786f6e6f6d795f7465726d5f6c6f6164223b7d, '', 'user_access', 0x613a313a7b693a303b733a31343a2261636365737320636f6e74656e74223b7d, 'taxonomy_term_feed', 0x613a313a7b693a303b693a323b7d, '', 13, 4, 0, '', 'taxonomy/term/%/feed', 'Taxonomy term', 'taxonomy_term_title', 'a:1:{i:0;i:2;}', '', 'a:0:{}', 0, '', '', 0, 'modules/taxonomy/taxonomy.pages.inc');
INSERT INTO `menu_router` VALUES('taxonomy/term/%/view', 0x613a313a7b693a323b733a31383a227461786f6e6f6d795f7465726d5f6c6f6164223b7d, '', 'user_access', 0x613a313a7b693a303b733a31343a2261636365737320636f6e74656e74223b7d, 'taxonomy_term_page', 0x613a313a7b693a303b693a323b7d, '', 13, 4, 1, 'taxonomy/term/%', 'taxonomy/term/%', 'View', 't', '', '', 'a:0:{}', 140, '', '', 0, 'modules/taxonomy/taxonomy.pages.inc');
INSERT INTO `menu_router` VALUES('toolbar/toggle', '', '', 'user_access', 0x613a313a7b693a303b733a31343a2261636365737320746f6f6c626172223b7d, 'toolbar_toggle_page', 0x613a303a7b7d, '', 3, 2, 0, '', 'toolbar/toggle', 'Toggle drawer visibility', 't', '', '', 'a:0:{}', 0, '', '', 0, '');
INSERT INTO `menu_router` VALUES('user', '', '', '1', 0x613a303a7b7d, 'user_page', 0x613a303a7b7d, '', 1, 1, 0, '', 'user', 'User account', 'user_menu_title', '', '', 'a:0:{}', 6, '', '', -10, 'modules/user/user.pages.inc');
INSERT INTO `menu_router` VALUES('user/%', 0x613a313a7b693a313b733a393a22757365725f6c6f6164223b7d, '', 'user_view_access', 0x613a313a7b693a303b693a313b7d, 'user_view_page', 0x613a313a7b693a303b693a313b7d, '', 2, 2, 0, '', 'user/%', 'My account', 'user_page_title', 'a:1:{i:0;i:1;}', '', 'a:0:{}', 6, '', '', 0, '');
INSERT INTO `menu_router` VALUES('user/%/cancel', 0x613a313a7b693a313b733a393a22757365725f6c6f6164223b7d, '', 'user_cancel_access', 0x613a313a7b693a303b693a313b7d, 'drupal_get_form', 0x613a323a7b693a303b733a32343a22757365725f63616e63656c5f636f6e6669726d5f666f726d223b693a313b693a313b7d, '', 5, 3, 0, '', 'user/%/cancel', 'Cancel account', 't', '', '', 'a:0:{}', 6, '', '', 0, 'modules/user/user.pages.inc');
INSERT INTO `menu_router` VALUES('user/%/cancel/confirm/%/%', 0x613a333a7b693a313b733a393a22757365725f6c6f6164223b693a343b4e3b693a353b4e3b7d, '', 'user_cancel_access', 0x613a313a7b693a303b693a313b7d, 'user_cancel_confirm', 0x613a333a7b693a303b693a313b693a313b693a343b693a323b693a353b7d, '', 44, 6, 0, '', 'user/%/cancel/confirm/%/%', 'Confirm account cancellation', 't', '', '', 'a:0:{}', 6, '', '', 0, 'modules/user/user.pages.inc');
INSERT INTO `menu_router` VALUES('user/%/edit', 0x613a313a7b693a313b733a393a22757365725f6c6f6164223b7d, '', 'user_edit_access', 0x613a313a7b693a303b693a313b7d, 'drupal_get_form', 0x613a323a7b693a303b733a31373a22757365725f70726f66696c655f666f726d223b693a313b693a313b7d, '', 5, 3, 1, 'user/%', 'user/%', 'Edit', 't', '', '', 'a:0:{}', 132, '', '', 0, 'modules/user/user.pages.inc');
INSERT INTO `menu_router` VALUES('user/%/edit/account', 0x613a313a7b693a313b613a313a7b733a31383a22757365725f63617465676f72795f6c6f6164223b613a323a7b693a303b733a343a22256d6170223b693a313b733a363a2225696e646578223b7d7d7d, '', 'user_edit_access', 0x613a313a7b693a303b693a313b7d, 'drupal_get_form', 0x613a323a7b693a303b733a31373a22757365725f70726f66696c655f666f726d223b693a313b693a313b7d, '', 11, 4, 1, 'user/%/edit', 'user/%', 'Account', 't', '', '', 'a:0:{}', 140, '', '', 0, 'modules/user/user.pages.inc');
INSERT INTO `menu_router` VALUES('user/%/shortcuts', 0x613a313a7b693a313b733a393a22757365725f6c6f6164223b7d, '', 'shortcut_set_switch_access', 0x613a313a7b693a303b693a313b7d, 'drupal_get_form', 0x613a323a7b693a303b733a31393a2273686f72746375745f7365745f737769746368223b693a313b693a313b7d, '', 5, 3, 1, 'user/%', 'user/%', 'Shortcuts', 't', '', '', 'a:0:{}', 132, '', '', 0, 'modules/shortcut/shortcut.admin.inc');
INSERT INTO `menu_router` VALUES('user/%/view', 0x613a313a7b693a313b733a393a22757365725f6c6f6164223b7d, '', 'user_view_access', 0x613a313a7b693a303b693a313b7d, 'user_view_page', 0x613a313a7b693a303b693a313b7d, '', 5, 3, 1, 'user/%', 'user/%', 'View', 't', '', '', 'a:0:{}', 140, '', '', -10, '');
INSERT INTO `menu_router` VALUES('user/autocomplete', '', '', 'user_access', 0x613a313a7b693a303b733a32303a2261636365737320757365722070726f66696c6573223b7d, 'user_autocomplete', 0x613a303a7b7d, '', 3, 2, 0, '', 'user/autocomplete', 'User autocomplete', 't', '', '', 'a:0:{}', 0, '', '', 0, 'modules/user/user.pages.inc');
INSERT INTO `menu_router` VALUES('user/login', '', '', 'user_is_anonymous', 0x613a303a7b7d, 'user_page', 0x613a303a7b7d, '', 3, 2, 1, 'user', 'user', 'Log in', 't', '', '', 'a:0:{}', 140, '', '', 0, 'modules/user/user.pages.inc');
INSERT INTO `menu_router` VALUES('user/logout', '', '', 'user_is_logged_in', 0x613a303a7b7d, 'user_logout', 0x613a303a7b7d, '', 3, 2, 0, '', 'user/logout', 'Log out', 't', '', '', 'a:0:{}', 6, '', '', 10, 'modules/user/user.pages.inc');
INSERT INTO `menu_router` VALUES('user/password', '', '', '1', 0x613a303a7b7d, 'drupal_get_form', 0x613a313a7b693a303b733a393a22757365725f70617373223b7d, '', 3, 2, 1, 'user', 'user', 'Request new password', 't', '', '', 'a:0:{}', 132, '', '', 0, 'modules/user/user.pages.inc');
INSERT INTO `menu_router` VALUES('user/register', '', '', 'user_register_access', 0x613a303a7b7d, 'drupal_get_form', 0x613a313a7b693a303b733a31383a22757365725f72656769737465725f666f726d223b7d, '', 3, 2, 1, 'user', 'user', 'Create new account', 't', '', '', 'a:0:{}', 132, '', '', 0, '');
INSERT INTO `menu_router` VALUES('user/reset/%/%/%', 0x613a333a7b693a323b4e3b693a333b4e3b693a343b4e3b7d, '', '1', 0x613a303a7b7d, 'drupal_get_form', 0x613a343a7b693a303b733a31353a22757365725f706173735f7265736574223b693a313b693a323b693a323b693a333b693a333b693a343b7d, '', 24, 5, 0, '', 'user/reset/%/%/%', 'Reset password', 't', '', '', 'a:0:{}', 0, '', '', 0, 'modules/user/user.pages.inc');
INSERT INTO `menu_router` VALUES('views/ajax', '', '', '1', 0x613a303a7b7d, 'views_ajax', 0x613a303a7b7d, 'ajax_deliver', 3, 2, 0, '', 'views/ajax', 'Views', 't', '', 'ajax_base_page_theme', 'a:0:{}', 0, 'Ajax callback for view loading.', '', 0, 'sites/all/modules/views/includes/ajax.inc');
INSERT INTO `menu_router` VALUES('wysiwyg/%', 0x613a313a7b693a313b4e3b7d, '', 'user_access', 0x613a313a7b693a303b733a31343a2261636365737320636f6e74656e74223b7d, 'wysiwyg_dialog', 0x613a313a7b693a303b693a313b7d, 'wysiwyg_deliver_dialog_page', 2, 2, 0, '', 'wysiwyg/%', '', 't', '', '', 'a:0:{}', 0, '', '', 0, 'sites/all/modules/wysiwyg/wysiwyg.dialog.inc');

-- --------------------------------------------------------

--
-- Table structure for table `node`
--

CREATE TABLE `node` (
  `nid` int(10) unsigned NOT NULL auto_increment COMMENT 'The primary identifier for a node.',
  `vid` int(10) unsigned default NULL COMMENT 'The current node_revision.vid version identifier.',
  `type` varchar(32) NOT NULL default '' COMMENT 'The node_type.type of this node.',
  `language` varchar(12) NOT NULL default '' COMMENT 'The languages.language of this node.',
  `title` varchar(255) NOT NULL default '' COMMENT 'The title of this node, always treated as non-markup plain text.',
  `uid` int(11) NOT NULL default '0' COMMENT 'The users.uid that owns this node; initially, this is the user that created it.',
  `status` int(11) NOT NULL default '1' COMMENT 'Boolean indicating whether the node is published (visible to non-administrators).',
  `created` int(11) NOT NULL default '0' COMMENT 'The Unix timestamp when the node was created.',
  `changed` int(11) NOT NULL default '0' COMMENT 'The Unix timestamp when the node was most recently saved.',
  `comment` int(11) NOT NULL default '0' COMMENT 'Whether comments are allowed on this node: 0 = no, 1 = closed (read only), 2 = open (read/write).',
  `promote` int(11) NOT NULL default '0' COMMENT 'Boolean indicating whether the node should be displayed on the front page.',
  `sticky` int(11) NOT NULL default '0' COMMENT 'Boolean indicating whether the node should be displayed at the top of lists in which it appears.',
  `tnid` int(10) unsigned NOT NULL default '0' COMMENT 'The translation set id for this node, which equals the node id of the source post in each set.',
  `translate` int(11) NOT NULL default '0' COMMENT 'A boolean indicating whether this translation page needs to be updated.',
  PRIMARY KEY  (`nid`),
  UNIQUE KEY `vid` (`vid`),
  KEY `node_changed` (`changed`),
  KEY `node_created` (`created`),
  KEY `node_frontpage` (`promote`,`status`,`sticky`,`created`),
  KEY `node_status_type` (`status`,`type`,`nid`),
  KEY `node_title_type` (`title`,`type`(4)),
  KEY `node_type` (`type`(4)),
  KEY `uid` (`uid`),
  KEY `tnid` (`tnid`),
  KEY `translate` (`translate`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='The base table for nodes.' AUTO_INCREMENT=6 ;

--
-- Dumping data for table `node`
--

INSERT INTO `node` VALUES(1, 1, 'qr_content', 'und', 'Exhibit A: HTML with Images', 1, 1, 1374502085, 1375827155, 1, 0, 0, 0, 0);
INSERT INTO `node` VALUES(2, 2, 'qr_content', 'und', 'Exhibit B: Audio', 1, 1, 1374502608, 1375827175, 1, 0, 0, 0, 0);
INSERT INTO `node` VALUES(3, 3, 'qr_content', 'und', 'Exhibit C: Video Link', 1, 1, 1374502733, 1375827206, 1, 0, 0, 0, 0);
INSERT INTO `node` VALUES(4, 4, 'page', 'und', 'Home', 1, 1, 1374522508, 1374522508, 1, 0, 0, 0, 0);
INSERT INTO `node` VALUES(5, 5, 'page', 'und', 'Download the QR Exhibit Tour App!', 1, 1, 1374856935, 1374856935, 1, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `node_access`
--

CREATE TABLE `node_access` (
  `nid` int(10) unsigned NOT NULL default '0' COMMENT 'The node.nid this record affects.',
  `gid` int(10) unsigned NOT NULL default '0' COMMENT 'The grant ID a user must possess in the specified realm to gain this row’s privileges on the node.',
  `realm` varchar(255) NOT NULL default '' COMMENT 'The realm in which the user must possess the grant ID. Each node access node can define one or more realms.',
  `grant_view` tinyint(3) unsigned NOT NULL default '0' COMMENT 'Boolean indicating whether a user with the realm/grant pair can view this node.',
  `grant_update` tinyint(3) unsigned NOT NULL default '0' COMMENT 'Boolean indicating whether a user with the realm/grant pair can edit this node.',
  `grant_delete` tinyint(3) unsigned NOT NULL default '0' COMMENT 'Boolean indicating whether a user with the realm/grant pair can delete this node.',
  PRIMARY KEY  (`nid`,`gid`,`realm`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Identifies which realm/grant pairs a user must possess in...';

--
-- Dumping data for table `node_access`
--

INSERT INTO `node_access` VALUES(0, 0, 'all', 1, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `node_comment_statistics`
--

CREATE TABLE `node_comment_statistics` (
  `nid` int(10) unsigned NOT NULL default '0' COMMENT 'The node.nid for which the statistics are compiled.',
  `cid` int(11) NOT NULL default '0' COMMENT 'The comment.cid of the last comment.',
  `last_comment_timestamp` int(11) NOT NULL default '0' COMMENT 'The Unix timestamp of the last comment that was posted within this node, from comment.changed.',
  `last_comment_name` varchar(60) default NULL COMMENT 'The name of the latest author to post a comment on this node, from comment.name.',
  `last_comment_uid` int(11) NOT NULL default '0' COMMENT 'The user ID of the latest author to post a comment on this node, from comment.uid.',
  `comment_count` int(10) unsigned NOT NULL default '0' COMMENT 'The total number of comments on this node.',
  PRIMARY KEY  (`nid`),
  KEY `node_comment_timestamp` (`last_comment_timestamp`),
  KEY `comment_count` (`comment_count`),
  KEY `last_comment_uid` (`last_comment_uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Maintains statistics of node and comments posts to show ...';

--
-- Dumping data for table `node_comment_statistics`
--

INSERT INTO `node_comment_statistics` VALUES(1, 0, 1374502085, NULL, 1, 0);
INSERT INTO `node_comment_statistics` VALUES(2, 0, 1374502608, NULL, 1, 0);
INSERT INTO `node_comment_statistics` VALUES(3, 0, 1374502733, NULL, 1, 0);
INSERT INTO `node_comment_statistics` VALUES(4, 0, 1374522508, NULL, 1, 0);
INSERT INTO `node_comment_statistics` VALUES(5, 0, 1374856935, NULL, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `node_revision`
--

CREATE TABLE `node_revision` (
  `nid` int(10) unsigned NOT NULL default '0' COMMENT 'The node this version belongs to.',
  `vid` int(10) unsigned NOT NULL auto_increment COMMENT 'The primary identifier for this version.',
  `uid` int(11) NOT NULL default '0' COMMENT 'The users.uid that created this version.',
  `title` varchar(255) NOT NULL default '' COMMENT 'The title of this version.',
  `log` longtext NOT NULL COMMENT 'The log entry explaining the changes in this version.',
  `timestamp` int(11) NOT NULL default '0' COMMENT 'A Unix timestamp indicating when this version was created.',
  `status` int(11) NOT NULL default '1' COMMENT 'Boolean indicating whether the node (at the time of this revision) is published (visible to non-administrators).',
  `comment` int(11) NOT NULL default '0' COMMENT 'Whether comments are allowed on this node (at the time of this revision): 0 = no, 1 = closed (read only), 2 = open (read/write).',
  `promote` int(11) NOT NULL default '0' COMMENT 'Boolean indicating whether the node (at the time of this revision) should be displayed on the front page.',
  `sticky` int(11) NOT NULL default '0' COMMENT 'Boolean indicating whether the node (at the time of this revision) should be displayed at the top of lists in which it appears.',
  PRIMARY KEY  (`vid`),
  KEY `nid` (`nid`),
  KEY `uid` (`uid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Stores information about each saved version of a node.' AUTO_INCREMENT=6 ;

--
-- Dumping data for table `node_revision`
--

INSERT INTO `node_revision` VALUES(1, 1, 1, 'Exhibit A: HTML with Images', '', 1375827155, 1, 1, 0, 0);
INSERT INTO `node_revision` VALUES(2, 2, 1, 'Exhibit B: Audio', '', 1375827175, 1, 1, 0, 0);
INSERT INTO `node_revision` VALUES(3, 3, 1, 'Exhibit C: Video Link', '', 1375827206, 1, 1, 0, 0);
INSERT INTO `node_revision` VALUES(4, 4, 1, 'Home', '', 1374522508, 1, 1, 0, 0);
INSERT INTO `node_revision` VALUES(5, 5, 1, 'Download the QR Exhibit Tour App!', '', 1374856935, 1, 1, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `node_type`
--

CREATE TABLE `node_type` (
  `type` varchar(32) NOT NULL COMMENT 'The machine-readable name of this type.',
  `name` varchar(255) NOT NULL default '' COMMENT 'The human-readable name of this type.',
  `base` varchar(255) NOT NULL COMMENT 'The base string used to construct callbacks corresponding to this node type.',
  `module` varchar(255) NOT NULL COMMENT 'The module defining this node type.',
  `description` mediumtext NOT NULL COMMENT 'A brief description of this type.',
  `help` mediumtext NOT NULL COMMENT 'Help information shown to the user when creating a node of this type.',
  `has_title` tinyint(3) unsigned NOT NULL COMMENT 'Boolean indicating whether this type uses the node.title field.',
  `title_label` varchar(255) NOT NULL default '' COMMENT 'The label displayed for the title field on the edit form.',
  `custom` tinyint(4) NOT NULL default '0' COMMENT 'A boolean indicating whether this type is defined by a module (FALSE) or by a user via Add content type (TRUE).',
  `modified` tinyint(4) NOT NULL default '0' COMMENT 'A boolean indicating whether this type has been modified by an administrator; currently not used in any way.',
  `locked` tinyint(4) NOT NULL default '0' COMMENT 'A boolean indicating whether the administrator can change the machine name of this type.',
  `disabled` tinyint(4) NOT NULL default '0' COMMENT 'A boolean indicating whether the node type is disabled.',
  `orig_type` varchar(255) NOT NULL default '' COMMENT 'The original machine-readable name of this node type. This may be different from the current type name if the locked field is 0.',
  PRIMARY KEY  (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores information about all defined node types.';

--
-- Dumping data for table `node_type`
--

INSERT INTO `node_type` VALUES('page', 'Basic page', 'node_content', 'node', 'Use <em>basic pages</em> for your static content, such as an ''About us'' page.', '', 1, 'Title', 1, 1, 0, 0, 'page');
INSERT INTO `node_type` VALUES('qr_content', 'QR Content', 'node_content', 'node', '', '', 1, 'Title', 1, 1, 0, 0, 'qr_content');

-- --------------------------------------------------------

--
-- Table structure for table `queue`
--

CREATE TABLE `queue` (
  `item_id` int(10) unsigned NOT NULL auto_increment COMMENT 'Primary Key: Unique item ID.',
  `name` varchar(255) NOT NULL default '' COMMENT 'The queue name.',
  `data` longblob COMMENT 'The arbitrary data for the item.',
  `expire` int(11) NOT NULL default '0' COMMENT 'Timestamp when the claim lease expires on the item.',
  `created` int(11) NOT NULL default '0' COMMENT 'Timestamp when the item was created.',
  PRIMARY KEY  (`item_id`),
  KEY `name_created` (`name`,`created`),
  KEY `expire` (`expire`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Stores items in queues.' AUTO_INCREMENT=71 ;

--
-- Dumping data for table `queue`
--


-- --------------------------------------------------------

--
-- Table structure for table `rdf_mapping`
--

CREATE TABLE `rdf_mapping` (
  `type` varchar(128) NOT NULL COMMENT 'The name of the entity type a mapping applies to (node, user, comment, etc.).',
  `bundle` varchar(128) NOT NULL COMMENT 'The name of the bundle a mapping applies to.',
  `mapping` longblob COMMENT 'The serialized mapping of the bundle type and fields to RDF terms.',
  PRIMARY KEY  (`type`,`bundle`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores custom RDF mappings for user defined content types...';

--
-- Dumping data for table `rdf_mapping`
--

INSERT INTO `rdf_mapping` VALUES('node', 'article', 0x613a31313a7b733a31313a226669656c645f696d616765223b613a323a7b733a31303a2270726564696361746573223b613a323a7b693a303b733a383a226f673a696d616765223b693a313b733a31323a22726466733a736565416c736f223b7d733a343a2274797065223b733a333a2272656c223b7d733a31303a226669656c645f74616773223b613a323a7b733a31303a2270726564696361746573223b613a313a7b693a303b733a31303a2264633a7375626a656374223b7d733a343a2274797065223b733a333a2272656c223b7d733a373a2272646674797065223b613a323a7b693a303b733a393a2273696f633a4974656d223b693a313b733a31333a22666f61663a446f63756d656e74223b7d733a353a227469746c65223b613a313a7b733a31303a2270726564696361746573223b613a313a7b693a303b733a383a2264633a7469746c65223b7d7d733a373a2263726561746564223b613a333a7b733a31303a2270726564696361746573223b613a323a7b693a303b733a373a2264633a64617465223b693a313b733a31303a2264633a63726561746564223b7d733a383a226461746174797065223b733a31323a227873643a6461746554696d65223b733a383a2263616c6c6261636b223b733a31323a22646174655f69736f38363031223b7d733a373a226368616e676564223b613a333a7b733a31303a2270726564696361746573223b613a313a7b693a303b733a31313a2264633a6d6f646966696564223b7d733a383a226461746174797065223b733a31323a227873643a6461746554696d65223b733a383a2263616c6c6261636b223b733a31323a22646174655f69736f38363031223b7d733a343a22626f6479223b613a313a7b733a31303a2270726564696361746573223b613a313a7b693a303b733a31353a22636f6e74656e743a656e636f646564223b7d7d733a333a22756964223b613a323a7b733a31303a2270726564696361746573223b613a313a7b693a303b733a31363a2273696f633a6861735f63726561746f72223b7d733a343a2274797065223b733a333a2272656c223b7d733a343a226e616d65223b613a313a7b733a31303a2270726564696361746573223b613a313a7b693a303b733a393a22666f61663a6e616d65223b7d7d733a31333a22636f6d6d656e745f636f756e74223b613a323a7b733a31303a2270726564696361746573223b613a313a7b693a303b733a31363a2273696f633a6e756d5f7265706c696573223b7d733a383a226461746174797065223b733a31313a227873643a696e7465676572223b7d733a31333a226c6173745f6163746976697479223b613a333a7b733a31303a2270726564696361746573223b613a313a7b693a303b733a32333a2273696f633a6c6173745f61637469766974795f64617465223b7d733a383a226461746174797065223b733a31323a227873643a6461746554696d65223b733a383a2263616c6c6261636b223b733a31323a22646174655f69736f38363031223b7d7d);
INSERT INTO `rdf_mapping` VALUES('node', 'page', 0x613a393a7b733a373a2272646674797065223b613a313a7b693a303b733a31333a22666f61663a446f63756d656e74223b7d733a353a227469746c65223b613a313a7b733a31303a2270726564696361746573223b613a313a7b693a303b733a383a2264633a7469746c65223b7d7d733a373a2263726561746564223b613a333a7b733a31303a2270726564696361746573223b613a323a7b693a303b733a373a2264633a64617465223b693a313b733a31303a2264633a63726561746564223b7d733a383a226461746174797065223b733a31323a227873643a6461746554696d65223b733a383a2263616c6c6261636b223b733a31323a22646174655f69736f38363031223b7d733a373a226368616e676564223b613a333a7b733a31303a2270726564696361746573223b613a313a7b693a303b733a31313a2264633a6d6f646966696564223b7d733a383a226461746174797065223b733a31323a227873643a6461746554696d65223b733a383a2263616c6c6261636b223b733a31323a22646174655f69736f38363031223b7d733a343a22626f6479223b613a313a7b733a31303a2270726564696361746573223b613a313a7b693a303b733a31353a22636f6e74656e743a656e636f646564223b7d7d733a333a22756964223b613a323a7b733a31303a2270726564696361746573223b613a313a7b693a303b733a31363a2273696f633a6861735f63726561746f72223b7d733a343a2274797065223b733a333a2272656c223b7d733a343a226e616d65223b613a313a7b733a31303a2270726564696361746573223b613a313a7b693a303b733a393a22666f61663a6e616d65223b7d7d733a31333a22636f6d6d656e745f636f756e74223b613a323a7b733a31303a2270726564696361746573223b613a313a7b693a303b733a31363a2273696f633a6e756d5f7265706c696573223b7d733a383a226461746174797065223b733a31313a227873643a696e7465676572223b7d733a31333a226c6173745f6163746976697479223b613a333a7b733a31303a2270726564696361746573223b613a313a7b693a303b733a32333a2273696f633a6c6173745f61637469766974795f64617465223b7d733a383a226461746174797065223b733a31323a227873643a6461746554696d65223b733a383a2263616c6c6261636b223b733a31323a22646174655f69736f38363031223b7d7d);

-- --------------------------------------------------------

--
-- Table structure for table `registry`
--

CREATE TABLE `registry` (
  `name` varchar(255) NOT NULL default '' COMMENT 'The name of the function, class, or interface.',
  `type` varchar(9) NOT NULL default '' COMMENT 'Either function or class or interface.',
  `filename` varchar(255) NOT NULL COMMENT 'Name of the file.',
  `module` varchar(255) NOT NULL default '' COMMENT 'Name of the module the file belongs to.',
  `weight` int(11) NOT NULL default '0' COMMENT 'The order in which this module’s hooks should be invoked relative to other modules. Equal-weighted modules are ordered by name.',
  PRIMARY KEY  (`name`,`type`),
  KEY `hook` (`type`,`weight`,`module`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Each record is a function, class, or interface name and...';

--
-- Dumping data for table `registry`
--

INSERT INTO `registry` VALUES('AccessDeniedTestCase', 'class', 'modules/system/system.test', 'system', 0);
INSERT INTO `registry` VALUES('AdminMetaTagTestCase', 'class', 'modules/system/system.test', 'system', 0);
INSERT INTO `registry` VALUES('ArchiverInterface', 'interface', 'includes/archiver.inc', '', 0);
INSERT INTO `registry` VALUES('ArchiverTar', 'class', 'modules/system/system.archiver.inc', 'system', 0);
INSERT INTO `registry` VALUES('ArchiverZip', 'class', 'modules/system/system.archiver.inc', 'system', 0);
INSERT INTO `registry` VALUES('Archive_Tar', 'class', 'modules/system/system.tar.inc', 'system', 0);
INSERT INTO `registry` VALUES('BatchMemoryQueue', 'class', 'includes/batch.queue.inc', '', 0);
INSERT INTO `registry` VALUES('BatchQueue', 'class', 'includes/batch.queue.inc', '', 0);
INSERT INTO `registry` VALUES('BlockAdminThemeTestCase', 'class', 'modules/block/block.test', 'block', 0);
INSERT INTO `registry` VALUES('BlockCacheTestCase', 'class', 'modules/block/block.test', 'block', 0);
INSERT INTO `registry` VALUES('BlockHiddenRegionTestCase', 'class', 'modules/block/block.test', 'block', 0);
INSERT INTO `registry` VALUES('BlockHTMLIdTestCase', 'class', 'modules/block/block.test', 'block', 0);
INSERT INTO `registry` VALUES('BlockInvalidRegionTestCase', 'class', 'modules/block/block.test', 'block', 0);
INSERT INTO `registry` VALUES('BlockTemplateSuggestionsUnitTest', 'class', 'modules/block/block.test', 'block', 0);
INSERT INTO `registry` VALUES('BlockTestCase', 'class', 'modules/block/block.test', 'block', 0);
INSERT INTO `registry` VALUES('ColorTestCase', 'class', 'modules/color/color.test', 'color', 0);
INSERT INTO `registry` VALUES('CommentActionsTestCase', 'class', 'modules/comment/comment.test', 'comment', 0);
INSERT INTO `registry` VALUES('CommentAnonymous', 'class', 'modules/comment/comment.test', 'comment', 0);
INSERT INTO `registry` VALUES('CommentApprovalTest', 'class', 'modules/comment/comment.test', 'comment', 0);
INSERT INTO `registry` VALUES('CommentBlockFunctionalTest', 'class', 'modules/comment/comment.test', 'comment', 0);
INSERT INTO `registry` VALUES('CommentContentRebuild', 'class', 'modules/comment/comment.test', 'comment', 0);
INSERT INTO `registry` VALUES('CommentController', 'class', 'modules/comment/comment.module', 'comment', 0);
INSERT INTO `registry` VALUES('CommentFieldsTest', 'class', 'modules/comment/comment.test', 'comment', 0);
INSERT INTO `registry` VALUES('CommentHelperCase', 'class', 'modules/comment/comment.test', 'comment', 0);
INSERT INTO `registry` VALUES('CommentInterfaceTest', 'class', 'modules/comment/comment.test', 'comment', 0);
INSERT INTO `registry` VALUES('CommentNodeAccessTest', 'class', 'modules/comment/comment.test', 'comment', 0);
INSERT INTO `registry` VALUES('CommentNodeChangesTestCase', 'class', 'modules/comment/comment.test', 'comment', 0);
INSERT INTO `registry` VALUES('CommentPagerTest', 'class', 'modules/comment/comment.test', 'comment', 0);
INSERT INTO `registry` VALUES('CommentPreviewTest', 'class', 'modules/comment/comment.test', 'comment', 0);
INSERT INTO `registry` VALUES('CommentRSSUnitTest', 'class', 'modules/comment/comment.test', 'comment', 0);
INSERT INTO `registry` VALUES('CommentThreadingTestCase', 'class', 'modules/comment/comment.test', 'comment', 0);
INSERT INTO `registry` VALUES('CommentTokenReplaceTestCase', 'class', 'modules/comment/comment.test', 'comment', 0);
INSERT INTO `registry` VALUES('ContextualDynamicContextTestCase', 'class', 'modules/contextual/contextual.test', 'contextual', 0);
INSERT INTO `registry` VALUES('CronRunTestCase', 'class', 'modules/system/system.test', 'system', 0);
INSERT INTO `registry` VALUES('ctools_context', 'class', 'sites/all/modules/ctools/includes/context.inc', 'ctools', 0);
INSERT INTO `registry` VALUES('ctools_context_optional', 'class', 'sites/all/modules/ctools/includes/context.inc', 'ctools', 0);
INSERT INTO `registry` VALUES('ctools_context_required', 'class', 'sites/all/modules/ctools/includes/context.inc', 'ctools', 0);
INSERT INTO `registry` VALUES('ctools_export_ui', 'class', 'sites/all/modules/ctools/plugins/export_ui/ctools_export_ui.class.php', 'ctools', 0);
INSERT INTO `registry` VALUES('ctools_math_expr', 'class', 'sites/all/modules/ctools/includes/math-expr.inc', 'ctools', 0);
INSERT INTO `registry` VALUES('ctools_math_expr_stack', 'class', 'sites/all/modules/ctools/includes/math-expr.inc', 'ctools', 0);
INSERT INTO `registry` VALUES('ctools_stylizer_image_processor', 'class', 'sites/all/modules/ctools/includes/stylizer.inc', 'ctools', 0);
INSERT INTO `registry` VALUES('DashboardBlocksTestCase', 'class', 'modules/dashboard/dashboard.test', 'dashboard', 0);
INSERT INTO `registry` VALUES('Database', 'class', 'includes/database/database.inc', '', 0);
INSERT INTO `registry` VALUES('DatabaseCondition', 'class', 'includes/database/query.inc', '', 0);
INSERT INTO `registry` VALUES('DatabaseConnection', 'class', 'includes/database/database.inc', '', 0);
INSERT INTO `registry` VALUES('DatabaseConnectionNotDefinedException', 'class', 'includes/database/database.inc', '', 0);
INSERT INTO `registry` VALUES('DatabaseConnection_mysql', 'class', 'includes/database/mysql/database.inc', '', 0);
INSERT INTO `registry` VALUES('DatabaseConnection_pgsql', 'class', 'includes/database/pgsql/database.inc', '', 0);
INSERT INTO `registry` VALUES('DatabaseConnection_sqlite', 'class', 'includes/database/sqlite/database.inc', '', 0);
INSERT INTO `registry` VALUES('DatabaseDriverNotSpecifiedException', 'class', 'includes/database/database.inc', '', 0);
INSERT INTO `registry` VALUES('DatabaseLog', 'class', 'includes/database/log.inc', '', 0);
INSERT INTO `registry` VALUES('DatabaseSchema', 'class', 'includes/database/schema.inc', '', 0);
INSERT INTO `registry` VALUES('DatabaseSchemaObjectDoesNotExistException', 'class', 'includes/database/schema.inc', '', 0);
INSERT INTO `registry` VALUES('DatabaseSchemaObjectExistsException', 'class', 'includes/database/schema.inc', '', 0);
INSERT INTO `registry` VALUES('DatabaseSchema_mysql', 'class', 'includes/database/mysql/schema.inc', '', 0);
INSERT INTO `registry` VALUES('DatabaseSchema_pgsql', 'class', 'includes/database/pgsql/schema.inc', '', 0);
INSERT INTO `registry` VALUES('DatabaseSchema_sqlite', 'class', 'includes/database/sqlite/schema.inc', '', 0);
INSERT INTO `registry` VALUES('DatabaseStatementBase', 'class', 'includes/database/database.inc', '', 0);
INSERT INTO `registry` VALUES('DatabaseStatementEmpty', 'class', 'includes/database/database.inc', '', 0);
INSERT INTO `registry` VALUES('DatabaseStatementInterface', 'interface', 'includes/database/database.inc', '', 0);
INSERT INTO `registry` VALUES('DatabaseStatementPrefetch', 'class', 'includes/database/prefetch.inc', '', 0);
INSERT INTO `registry` VALUES('DatabaseStatement_sqlite', 'class', 'includes/database/sqlite/database.inc', '', 0);
INSERT INTO `registry` VALUES('DatabaseTaskException', 'class', 'includes/install.inc', '', 0);
INSERT INTO `registry` VALUES('DatabaseTasks', 'class', 'includes/install.inc', '', 0);
INSERT INTO `registry` VALUES('DatabaseTasks_mysql', 'class', 'includes/database/mysql/install.inc', '', 0);
INSERT INTO `registry` VALUES('DatabaseTasks_pgsql', 'class', 'includes/database/pgsql/install.inc', '', 0);
INSERT INTO `registry` VALUES('DatabaseTasks_sqlite', 'class', 'includes/database/sqlite/install.inc', '', 0);
INSERT INTO `registry` VALUES('DatabaseTransaction', 'class', 'includes/database/database.inc', '', 0);
INSERT INTO `registry` VALUES('DatabaseTransactionCommitFailedException', 'class', 'includes/database/database.inc', '', 0);
INSERT INTO `registry` VALUES('DatabaseTransactionExplicitCommitNotAllowedException', 'class', 'includes/database/database.inc', '', 0);
INSERT INTO `registry` VALUES('DatabaseTransactionNameNonUniqueException', 'class', 'includes/database/database.inc', '', 0);
INSERT INTO `registry` VALUES('DatabaseTransactionNoActiveException', 'class', 'includes/database/database.inc', '', 0);
INSERT INTO `registry` VALUES('DatabaseTransactionOutOfOrderException', 'class', 'includes/database/database.inc', '', 0);
INSERT INTO `registry` VALUES('DateTimeFunctionalTest', 'class', 'modules/system/system.test', 'system', 0);
INSERT INTO `registry` VALUES('DBLogTestCase', 'class', 'modules/dblog/dblog.test', 'dblog', 0);
INSERT INTO `registry` VALUES('DefaultMailSystem', 'class', 'modules/system/system.mail.inc', 'system', 0);
INSERT INTO `registry` VALUES('DeleteQuery', 'class', 'includes/database/query.inc', '', 0);
INSERT INTO `registry` VALUES('DeleteQuery_sqlite', 'class', 'includes/database/sqlite/query.inc', '', 0);
INSERT INTO `registry` VALUES('DrupalCacheArray', 'class', 'includes/bootstrap.inc', '', 0);
INSERT INTO `registry` VALUES('DrupalCacheInterface', 'interface', 'includes/cache.inc', '', 0);
INSERT INTO `registry` VALUES('DrupalDatabaseCache', 'class', 'includes/cache.inc', '', 0);
INSERT INTO `registry` VALUES('DrupalDefaultEntityController', 'class', 'includes/entity.inc', '', 0);
INSERT INTO `registry` VALUES('DrupalEntityControllerInterface', 'interface', 'includes/entity.inc', '', 0);
INSERT INTO `registry` VALUES('DrupalFakeCache', 'class', 'includes/cache-install.inc', '', 0);
INSERT INTO `registry` VALUES('DrupalLocalStreamWrapper', 'class', 'includes/stream_wrappers.inc', '', 0);
INSERT INTO `registry` VALUES('DrupalPrivateStreamWrapper', 'class', 'includes/stream_wrappers.inc', '', 0);
INSERT INTO `registry` VALUES('DrupalPublicStreamWrapper', 'class', 'includes/stream_wrappers.inc', '', 0);
INSERT INTO `registry` VALUES('DrupalQueue', 'class', 'modules/system/system.queue.inc', 'system', 0);
INSERT INTO `registry` VALUES('DrupalQueueInterface', 'interface', 'modules/system/system.queue.inc', 'system', 0);
INSERT INTO `registry` VALUES('DrupalReliableQueueInterface', 'interface', 'modules/system/system.queue.inc', 'system', 0);
INSERT INTO `registry` VALUES('DrupalStreamWrapperInterface', 'interface', 'includes/stream_wrappers.inc', '', 0);
INSERT INTO `registry` VALUES('DrupalTemporaryStreamWrapper', 'class', 'includes/stream_wrappers.inc', '', 0);
INSERT INTO `registry` VALUES('DrupalUpdateException', 'class', 'includes/update.inc', '', 0);
INSERT INTO `registry` VALUES('DrupalUpdaterInterface', 'interface', 'includes/updater.inc', '', 0);
INSERT INTO `registry` VALUES('EnableDisableTestCase', 'class', 'modules/system/system.test', 'system', 0);
INSERT INTO `registry` VALUES('Entity', 'class', 'sites/all/modules/entity/includes/entity.inc', 'entity', 0);
INSERT INTO `registry` VALUES('EntityAPIController', 'class', 'sites/all/modules/entity/includes/entity.controller.inc', 'entity', 0);
INSERT INTO `registry` VALUES('EntityAPIControllerExportable', 'class', 'sites/all/modules/entity/includes/entity.controller.inc', 'entity', 0);
INSERT INTO `registry` VALUES('EntityAPIControllerInterface', 'interface', 'sites/all/modules/entity/includes/entity.controller.inc', 'entity', 0);
INSERT INTO `registry` VALUES('EntityAPIControllerRevisionableInterface', 'interface', 'sites/all/modules/entity/includes/entity.controller.inc', 'entity', 0);
INSERT INTO `registry` VALUES('EntityAPIi18nItegrationTestCase', 'class', 'sites/all/modules/entity/entity.test', 'entity', 0);
INSERT INTO `registry` VALUES('EntityAPIRulesIntegrationTestCase', 'class', 'sites/all/modules/entity/entity.test', 'entity', 0);
INSERT INTO `registry` VALUES('EntityAPITestCase', 'class', 'sites/all/modules/entity/entity.test', 'entity', 0);
INSERT INTO `registry` VALUES('EntityDB', 'class', 'sites/all/modules/entity/includes/entity.inc', 'entity', 0);
INSERT INTO `registry` VALUES('EntityDBExtendable', 'class', 'sites/all/modules/entity/includes/entity.inc', 'entity', 0);
INSERT INTO `registry` VALUES('EntityDefaultFeaturesController', 'class', 'sites/all/modules/entity/entity.features.inc', 'entity', 0);
INSERT INTO `registry` VALUES('EntityDefaultI18nStringController', 'class', 'sites/all/modules/entity/entity.i18n.inc', 'entity', 0);
INSERT INTO `registry` VALUES('EntityDefaultMetadataController', 'class', 'sites/all/modules/entity/entity.info.inc', 'entity', 0);
INSERT INTO `registry` VALUES('EntityDefaultRulesController', 'class', 'sites/all/modules/entity/entity.rules.inc', 'entity', 0);
INSERT INTO `registry` VALUES('EntityDefaultUIController', 'class', 'sites/all/modules/entity/includes/entity.ui.inc', 'entity', 0);
INSERT INTO `registry` VALUES('EntityDefaultViewsController', 'class', 'sites/all/modules/entity/views/entity.views.inc', 'entity', 0);
INSERT INTO `registry` VALUES('EntityDrupalWrapper', 'class', 'sites/all/modules/entity/includes/entity.wrapper.inc', 'entity', 0);
INSERT INTO `registry` VALUES('EntityExtendable', 'class', 'sites/all/modules/entity/includes/entity.inc', 'entity', 0);
INSERT INTO `registry` VALUES('EntityFieldHandlerHelper', 'class', 'sites/all/modules/entity/views/handlers/entity_views_field_handler_helper.inc', 'entity', 0);
INSERT INTO `registry` VALUES('EntityFieldQuery', 'class', 'includes/entity.inc', '', 0);
INSERT INTO `registry` VALUES('EntityFieldQueryException', 'class', 'includes/entity.inc', '', 0);
INSERT INTO `registry` VALUES('EntityListWrapper', 'class', 'sites/all/modules/entity/includes/entity.wrapper.inc', 'entity', 0);
INSERT INTO `registry` VALUES('EntityMalformedException', 'class', 'includes/entity.inc', '', 0);
INSERT INTO `registry` VALUES('EntityMetadataArrayObject', 'class', 'sites/all/modules/entity/includes/entity.wrapper.inc', 'entity', 0);
INSERT INTO `registry` VALUES('EntityMetadataIntegrationTestCase', 'class', 'sites/all/modules/entity/entity.test', 'entity', 0);
INSERT INTO `registry` VALUES('EntityMetadataTestCase', 'class', 'sites/all/modules/entity/entity.test', 'entity', 0);
INSERT INTO `registry` VALUES('EntityMetadataWrapper', 'class', 'sites/all/modules/entity/includes/entity.wrapper.inc', 'entity', 0);
INSERT INTO `registry` VALUES('EntityMetadataWrapperException', 'class', 'sites/all/modules/entity/includes/entity.wrapper.inc', 'entity', 0);
INSERT INTO `registry` VALUES('EntityMetadataWrapperIterator', 'class', 'sites/all/modules/entity/includes/entity.wrapper.inc', 'entity', 0);
INSERT INTO `registry` VALUES('EntityPropertiesTestCase', 'class', 'modules/field/tests/field.test', 'field', 0);
INSERT INTO `registry` VALUES('EntityStructureWrapper', 'class', 'sites/all/modules/entity/includes/entity.wrapper.inc', 'entity', 0);
INSERT INTO `registry` VALUES('EntityTokenTestCase', 'class', 'sites/all/modules/entity/entity.test', 'entity', 0);
INSERT INTO `registry` VALUES('EntityValueWrapper', 'class', 'sites/all/modules/entity/includes/entity.wrapper.inc', 'entity', 0);
INSERT INTO `registry` VALUES('EntityWebTestCase', 'class', 'sites/all/modules/entity/entity.test', 'entity', 0);
INSERT INTO `registry` VALUES('entity_views_handler_area_entity', 'class', 'sites/all/modules/entity/views/handlers/entity_views_handler_area_entity.inc', 'entity', 0);
INSERT INTO `registry` VALUES('entity_views_handler_field_boolean', 'class', 'sites/all/modules/entity/views/handlers/entity_views_handler_field_boolean.inc', 'entity', 0);
INSERT INTO `registry` VALUES('entity_views_handler_field_date', 'class', 'sites/all/modules/entity/views/handlers/entity_views_handler_field_date.inc', 'entity', 0);
INSERT INTO `registry` VALUES('entity_views_handler_field_duration', 'class', 'sites/all/modules/entity/views/handlers/entity_views_handler_field_duration.inc', 'entity', 0);
INSERT INTO `registry` VALUES('entity_views_handler_field_entity', 'class', 'sites/all/modules/entity/views/handlers/entity_views_handler_field_entity.inc', 'entity', 0);
INSERT INTO `registry` VALUES('entity_views_handler_field_field', 'class', 'sites/all/modules/entity/views/handlers/entity_views_handler_field_field.inc', 'entity', 0);
INSERT INTO `registry` VALUES('entity_views_handler_field_numeric', 'class', 'sites/all/modules/entity/views/handlers/entity_views_handler_field_numeric.inc', 'entity', 0);
INSERT INTO `registry` VALUES('entity_views_handler_field_options', 'class', 'sites/all/modules/entity/views/handlers/entity_views_handler_field_options.inc', 'entity', 0);
INSERT INTO `registry` VALUES('entity_views_handler_field_text', 'class', 'sites/all/modules/entity/views/handlers/entity_views_handler_field_text.inc', 'entity', 0);
INSERT INTO `registry` VALUES('entity_views_handler_field_uri', 'class', 'sites/all/modules/entity/views/handlers/entity_views_handler_field_uri.inc', 'entity', 0);
INSERT INTO `registry` VALUES('entity_views_handler_relationship', 'class', 'sites/all/modules/entity/views/handlers/entity_views_handler_relationship.inc', 'entity', 0);
INSERT INTO `registry` VALUES('entity_views_handler_relationship_by_bundle', 'class', 'sites/all/modules/entity/views/handlers/entity_views_handler_relationship_by_bundle.inc', 'entity', 0);
INSERT INTO `registry` VALUES('entity_views_plugin_row_entity_view', 'class', 'sites/all/modules/entity/views/plugins/entity_views_plugin_row_entity_view.inc', 'entity', 0);
INSERT INTO `registry` VALUES('FacesExtendable', 'class', 'sites/all/modules/rules/includes/faces.inc', 'rules', 0);
INSERT INTO `registry` VALUES('FacesExtendableException', 'class', 'sites/all/modules/rules/includes/faces.inc', 'rules', 0);
INSERT INTO `registry` VALUES('FacesExtender', 'class', 'sites/all/modules/rules/includes/faces.inc', 'rules', 0);
INSERT INTO `registry` VALUES('FacesExtenderInterface', 'interface', 'sites/all/modules/rules/includes/faces.inc', 'rules', 0);
INSERT INTO `registry` VALUES('FieldAttachOtherTestCase', 'class', 'modules/field/tests/field.test', 'field', 0);
INSERT INTO `registry` VALUES('FieldAttachStorageTestCase', 'class', 'modules/field/tests/field.test', 'field', 0);
INSERT INTO `registry` VALUES('FieldAttachTestCase', 'class', 'modules/field/tests/field.test', 'field', 0);
INSERT INTO `registry` VALUES('FieldBulkDeleteTestCase', 'class', 'modules/field/tests/field.test', 'field', 0);
INSERT INTO `registry` VALUES('FieldCrudTestCase', 'class', 'modules/field/tests/field.test', 'field', 0);
INSERT INTO `registry` VALUES('FieldDisplayAPITestCase', 'class', 'modules/field/tests/field.test', 'field', 0);
INSERT INTO `registry` VALUES('FieldException', 'class', 'modules/field/field.module', 'field', 0);
INSERT INTO `registry` VALUES('FieldFormTestCase', 'class', 'modules/field/tests/field.test', 'field', 0);
INSERT INTO `registry` VALUES('FieldInfo', 'class', 'modules/field/field.info.class.inc', 'field', 0);
INSERT INTO `registry` VALUES('FieldInfoTestCase', 'class', 'modules/field/tests/field.test', 'field', 0);
INSERT INTO `registry` VALUES('FieldInstanceCrudTestCase', 'class', 'modules/field/tests/field.test', 'field', 0);
INSERT INTO `registry` VALUES('FieldsOverlapException', 'class', 'includes/database/database.inc', '', 0);
INSERT INTO `registry` VALUES('FieldSqlStorageTestCase', 'class', 'modules/field/modules/field_sql_storage/field_sql_storage.test', 'field_sql_storage', 0);
INSERT INTO `registry` VALUES('FieldTestCase', 'class', 'modules/field/tests/field.test', 'field', 0);
INSERT INTO `registry` VALUES('FieldTranslationsTestCase', 'class', 'modules/field/tests/field.test', 'field', 0);
INSERT INTO `registry` VALUES('FieldUIAlterTestCase', 'class', 'modules/field_ui/field_ui.test', 'field_ui', 0);
INSERT INTO `registry` VALUES('FieldUIManageDisplayTestCase', 'class', 'modules/field_ui/field_ui.test', 'field_ui', 0);
INSERT INTO `registry` VALUES('FieldUIManageFieldsTestCase', 'class', 'modules/field_ui/field_ui.test', 'field_ui', 0);
INSERT INTO `registry` VALUES('FieldUITestCase', 'class', 'modules/field_ui/field_ui.test', 'field_ui', 0);
INSERT INTO `registry` VALUES('FieldUpdateForbiddenException', 'class', 'modules/field/field.module', 'field', 0);
INSERT INTO `registry` VALUES('FieldValidationException', 'class', 'modules/field/field.attach.inc', 'field', 0);
INSERT INTO `registry` VALUES('FileFieldDisplayTestCase', 'class', 'modules/file/tests/file.test', 'file', 0);
INSERT INTO `registry` VALUES('FileFieldPathTestCase', 'class', 'modules/file/tests/file.test', 'file', 0);
INSERT INTO `registry` VALUES('FileFieldRevisionTestCase', 'class', 'modules/file/tests/file.test', 'file', 0);
INSERT INTO `registry` VALUES('FileFieldTestCase', 'class', 'modules/file/tests/file.test', 'file', 0);
INSERT INTO `registry` VALUES('FileFieldValidateTestCase', 'class', 'modules/file/tests/file.test', 'file', 0);
INSERT INTO `registry` VALUES('FileFieldWidgetTestCase', 'class', 'modules/file/tests/file.test', 'file', 0);
INSERT INTO `registry` VALUES('FileManagedFileElementTestCase', 'class', 'modules/file/tests/file.test', 'file', 0);
INSERT INTO `registry` VALUES('FilePrivateTestCase', 'class', 'modules/file/tests/file.test', 'file', 0);
INSERT INTO `registry` VALUES('FileTokenReplaceTestCase', 'class', 'modules/file/tests/file.test', 'file', 0);
INSERT INTO `registry` VALUES('FileTransfer', 'class', 'includes/filetransfer/filetransfer.inc', '', 0);
INSERT INTO `registry` VALUES('FileTransferChmodInterface', 'interface', 'includes/filetransfer/filetransfer.inc', '', 0);
INSERT INTO `registry` VALUES('FileTransferException', 'class', 'includes/filetransfer/filetransfer.inc', '', 0);
INSERT INTO `registry` VALUES('FileTransferFTP', 'class', 'includes/filetransfer/ftp.inc', '', 0);
INSERT INTO `registry` VALUES('FileTransferFTPExtension', 'class', 'includes/filetransfer/ftp.inc', '', 0);
INSERT INTO `registry` VALUES('FileTransferLocal', 'class', 'includes/filetransfer/local.inc', '', 0);
INSERT INTO `registry` VALUES('FileTransferSSH', 'class', 'includes/filetransfer/ssh.inc', '', 0);
INSERT INTO `registry` VALUES('FilterAdminTestCase', 'class', 'modules/filter/filter.test', 'filter', 0);
INSERT INTO `registry` VALUES('FilterCRUDTestCase', 'class', 'modules/filter/filter.test', 'filter', 0);
INSERT INTO `registry` VALUES('FilterDefaultFormatTestCase', 'class', 'modules/filter/filter.test', 'filter', 0);
INSERT INTO `registry` VALUES('FilterFormatAccessTestCase', 'class', 'modules/filter/filter.test', 'filter', 0);
INSERT INTO `registry` VALUES('FilterHooksTestCase', 'class', 'modules/filter/filter.test', 'filter', 0);
INSERT INTO `registry` VALUES('FilterNoFormatTestCase', 'class', 'modules/filter/filter.test', 'filter', 0);
INSERT INTO `registry` VALUES('FilterSecurityTestCase', 'class', 'modules/filter/filter.test', 'filter', 0);
INSERT INTO `registry` VALUES('FilterSettingsTestCase', 'class', 'modules/filter/filter.test', 'filter', 0);
INSERT INTO `registry` VALUES('FilterUnitTestCase', 'class', 'modules/filter/filter.test', 'filter', 0);
INSERT INTO `registry` VALUES('FloodFunctionalTest', 'class', 'modules/system/system.test', 'system', 0);
INSERT INTO `registry` VALUES('FrontPageTestCase', 'class', 'modules/system/system.test', 'system', 0);
INSERT INTO `registry` VALUES('GroupUITestCase', 'class', 'sites/all/modules/field_group/field_group.test', 'field_group', 0);
INSERT INTO `registry` VALUES('HelpTestCase', 'class', 'modules/help/help.test', 'help', 0);
INSERT INTO `registry` VALUES('HookRequirementsTestCase', 'class', 'modules/system/system.test', 'system', 0);
INSERT INTO `registry` VALUES('ImageAdminStylesUnitTest', 'class', 'modules/image/image.test', 'image', 0);
INSERT INTO `registry` VALUES('ImageDimensionsScaleTestCase', 'class', 'modules/image/image.test', 'image', 0);
INSERT INTO `registry` VALUES('ImageDimensionsTestCase', 'class', 'modules/image/image.test', 'image', 0);
INSERT INTO `registry` VALUES('ImageEffectsUnitTest', 'class', 'modules/image/image.test', 'image', 0);
INSERT INTO `registry` VALUES('ImageFieldDefaultImagesTestCase', 'class', 'modules/image/image.test', 'image', 0);
INSERT INTO `registry` VALUES('ImageFieldDisplayTestCase', 'class', 'modules/image/image.test', 'image', 0);
INSERT INTO `registry` VALUES('ImageFieldTestCase', 'class', 'modules/image/image.test', 'image', 0);
INSERT INTO `registry` VALUES('ImageFieldValidateTestCase', 'class', 'modules/image/image.test', 'image', 0);
INSERT INTO `registry` VALUES('ImageStylesPathAndUrlTestCase', 'class', 'modules/image/image.test', 'image', 0);
INSERT INTO `registry` VALUES('ImageThemeFunctionWebTestCase', 'class', 'modules/image/image.test', 'image', 0);
INSERT INTO `registry` VALUES('InfoFileParserTestCase', 'class', 'modules/system/system.test', 'system', 0);
INSERT INTO `registry` VALUES('InsertQuery', 'class', 'includes/database/query.inc', '', 0);
INSERT INTO `registry` VALUES('InsertQuery_mysql', 'class', 'includes/database/mysql/query.inc', '', 0);
INSERT INTO `registry` VALUES('InsertQuery_pgsql', 'class', 'includes/database/pgsql/query.inc', '', 0);
INSERT INTO `registry` VALUES('InsertQuery_sqlite', 'class', 'includes/database/sqlite/query.inc', '', 0);
INSERT INTO `registry` VALUES('InvalidMergeQueryException', 'class', 'includes/database/database.inc', '', 0);
INSERT INTO `registry` VALUES('IPAddressBlockingTestCase', 'class', 'modules/system/system.test', 'system', 0);
INSERT INTO `registry` VALUES('LibrariesTestCase', 'class', 'sites/all/modules/libraries/tests/libraries.test', 'libraries', 0);
INSERT INTO `registry` VALUES('LibrariesUnitTestCase', 'class', 'sites/all/modules/libraries/tests/libraries.test', 'libraries', 0);
INSERT INTO `registry` VALUES('ListDynamicValuesTestCase', 'class', 'modules/field/modules/list/tests/list.test', 'list', 0);
INSERT INTO `registry` VALUES('ListDynamicValuesValidationTestCase', 'class', 'modules/field/modules/list/tests/list.test', 'list', 0);
INSERT INTO `registry` VALUES('ListFieldTestCase', 'class', 'modules/field/modules/list/tests/list.test', 'list', 0);
INSERT INTO `registry` VALUES('ListFieldUITestCase', 'class', 'modules/field/modules/list/tests/list.test', 'list', 0);
INSERT INTO `registry` VALUES('MailSystemInterface', 'interface', 'includes/mail.inc', '', 0);
INSERT INTO `registry` VALUES('MemoryQueue', 'class', 'modules/system/system.queue.inc', 'system', 0);
INSERT INTO `registry` VALUES('MenuNodeTestCase', 'class', 'modules/menu/menu.test', 'menu', 0);
INSERT INTO `registry` VALUES('MenuTestCase', 'class', 'modules/menu/menu.test', 'menu', 0);
INSERT INTO `registry` VALUES('MergeQuery', 'class', 'includes/database/query.inc', '', 0);
INSERT INTO `registry` VALUES('Mimeparse', 'class', 'sites/all/modules/services/servers/rest_server/lib/mimeparse.php', 'rest_server', 0);
INSERT INTO `registry` VALUES('MockRESTServer', 'class', 'sites/all/modules/services/servers/rest_server/tests/rest_server_mock_classes.inc', 'rest_server', 0);
INSERT INTO `registry` VALUES('MockServicesContext', 'class', 'sites/all/modules/services/servers/rest_server/tests/rest_server_mock_classes.inc', 'rest_server', 0);
INSERT INTO `registry` VALUES('MockServicesRESTServerFactory', 'class', 'sites/all/modules/services/servers/rest_server/tests/rest_server_mock_classes.inc', 'rest_server', 0);
INSERT INTO `registry` VALUES('ModuleDependencyTestCase', 'class', 'modules/system/system.test', 'system', 0);
INSERT INTO `registry` VALUES('ModuleRequiredTestCase', 'class', 'modules/system/system.test', 'system', 0);
INSERT INTO `registry` VALUES('ModuleTestCase', 'class', 'modules/system/system.test', 'system', 0);
INSERT INTO `registry` VALUES('ModuleUpdater', 'class', 'modules/system/system.updater.inc', 'system', 0);
INSERT INTO `registry` VALUES('ModuleVersionTestCase', 'class', 'modules/system/system.test', 'system', 0);
INSERT INTO `registry` VALUES('MultiStepNodeFormBasicOptionsTest', 'class', 'modules/node/node.test', 'node', 0);
INSERT INTO `registry` VALUES('NewDefaultThemeBlocks', 'class', 'modules/block/block.test', 'block', 0);
INSERT INTO `registry` VALUES('NoAuthEndpointTestRunner', 'class', 'sites/all/modules/services/tests/functional/NoAuthEndpointTestRunner.test', 'services', 0);
INSERT INTO `registry` VALUES('NodeAccessBaseTableTestCase', 'class', 'modules/node/node.test', 'node', 0);
INSERT INTO `registry` VALUES('NodeAccessFieldTestCase', 'class', 'modules/node/node.test', 'node', 0);
INSERT INTO `registry` VALUES('NodeAccessPagerTestCase', 'class', 'modules/node/node.test', 'node', 0);
INSERT INTO `registry` VALUES('NodeAccessRebuildTestCase', 'class', 'modules/node/node.test', 'node', 0);
INSERT INTO `registry` VALUES('NodeAccessRecordsTestCase', 'class', 'modules/node/node.test', 'node', 0);
INSERT INTO `registry` VALUES('NodeAccessTestCase', 'class', 'modules/node/node.test', 'node', 0);
INSERT INTO `registry` VALUES('NodeAdminTestCase', 'class', 'modules/node/node.test', 'node', 0);
INSERT INTO `registry` VALUES('NodeBlockFunctionalTest', 'class', 'modules/node/node.test', 'node', 0);
INSERT INTO `registry` VALUES('NodeBlockTestCase', 'class', 'modules/node/node.test', 'node', 0);
INSERT INTO `registry` VALUES('NodeBuildContent', 'class', 'modules/node/node.test', 'node', 0);
INSERT INTO `registry` VALUES('NodeController', 'class', 'modules/node/node.module', 'node', 0);
INSERT INTO `registry` VALUES('NodeCreationTestCase', 'class', 'modules/node/node.test', 'node', 0);
INSERT INTO `registry` VALUES('NodeEntityFieldQueryAlter', 'class', 'modules/node/node.test', 'node', 0);
INSERT INTO `registry` VALUES('NodeEntityViewModeAlterTest', 'class', 'modules/node/node.test', 'node', 0);
INSERT INTO `registry` VALUES('NodeFeedTestCase', 'class', 'modules/node/node.test', 'node', 0);
INSERT INTO `registry` VALUES('NodeLoadHooksTestCase', 'class', 'modules/node/node.test', 'node', 0);
INSERT INTO `registry` VALUES('NodeLoadMultipleTestCase', 'class', 'modules/node/node.test', 'node', 0);
INSERT INTO `registry` VALUES('NodePostSettingsTestCase', 'class', 'modules/node/node.test', 'node', 0);
INSERT INTO `registry` VALUES('NodeQueryAlter', 'class', 'modules/node/node.test', 'node', 0);
INSERT INTO `registry` VALUES('NodeRevisionPermissionsTestCase', 'class', 'modules/node/node.test', 'node', 0);
INSERT INTO `registry` VALUES('NodeRevisionsTestCase', 'class', 'modules/node/node.test', 'node', 0);
INSERT INTO `registry` VALUES('NodeRSSContentTestCase', 'class', 'modules/node/node.test', 'node', 0);
INSERT INTO `registry` VALUES('NodeSaveTestCase', 'class', 'modules/node/node.test', 'node', 0);
INSERT INTO `registry` VALUES('NodeTitleTestCase', 'class', 'modules/node/node.test', 'node', 0);
INSERT INTO `registry` VALUES('NodeTitleXSSTestCase', 'class', 'modules/node/node.test', 'node', 0);
INSERT INTO `registry` VALUES('NodeTokenReplaceTestCase', 'class', 'modules/node/node.test', 'node', 0);
INSERT INTO `registry` VALUES('NodeTypePersistenceTestCase', 'class', 'modules/node/node.test', 'node', 0);
INSERT INTO `registry` VALUES('NodeTypeTestCase', 'class', 'modules/node/node.test', 'node', 0);
INSERT INTO `registry` VALUES('NodeWebTestCase', 'class', 'modules/node/node.test', 'node', 0);
INSERT INTO `registry` VALUES('NoFieldsException', 'class', 'includes/database/database.inc', '', 0);
INSERT INTO `registry` VALUES('NoHelpTestCase', 'class', 'modules/help/help.test', 'help', 0);
INSERT INTO `registry` VALUES('NonDefaultBlockAdmin', 'class', 'modules/block/block.test', 'block', 0);
INSERT INTO `registry` VALUES('NumberFieldTestCase', 'class', 'modules/field/modules/number/number.test', 'number', 0);
INSERT INTO `registry` VALUES('OptionsSelectDynamicValuesTestCase', 'class', 'modules/field/modules/options/options.test', 'options', 0);
INSERT INTO `registry` VALUES('OptionsWidgetsTestCase', 'class', 'modules/field/modules/options/options.test', 'options', 0);
INSERT INTO `registry` VALUES('PageEditTestCase', 'class', 'modules/node/node.test', 'node', 0);
INSERT INTO `registry` VALUES('PageNotFoundTestCase', 'class', 'modules/system/system.test', 'system', 0);
INSERT INTO `registry` VALUES('PagePreviewTestCase', 'class', 'modules/node/node.test', 'node', 0);
INSERT INTO `registry` VALUES('PagerDefault', 'class', 'includes/pager.inc', '', 0);
INSERT INTO `registry` VALUES('PageTitleFiltering', 'class', 'modules/system/system.test', 'system', 0);
INSERT INTO `registry` VALUES('PageViewTestCase', 'class', 'modules/node/node.test', 'node', 0);
INSERT INTO `registry` VALUES('PathLanguageTestCase', 'class', 'modules/path/path.test', 'path', 0);
INSERT INTO `registry` VALUES('PathLanguageUITestCase', 'class', 'modules/path/path.test', 'path', 0);
INSERT INTO `registry` VALUES('PathMonolingualTestCase', 'class', 'modules/path/path.test', 'path', 0);
INSERT INTO `registry` VALUES('PathTaxonomyTermTestCase', 'class', 'modules/path/path.test', 'path', 0);
INSERT INTO `registry` VALUES('PathTestCase', 'class', 'modules/path/path.test', 'path', 0);
INSERT INTO `registry` VALUES('Query', 'class', 'includes/database/query.inc', '', 0);
INSERT INTO `registry` VALUES('QueryAlterableInterface', 'interface', 'includes/database/query.inc', '', 0);
INSERT INTO `registry` VALUES('QueryConditionInterface', 'interface', 'includes/database/query.inc', '', 0);
INSERT INTO `registry` VALUES('QueryExtendableInterface', 'interface', 'includes/database/select.inc', '', 0);
INSERT INTO `registry` VALUES('QueryPlaceholderInterface', 'interface', 'includes/database/query.inc', '', 0);
INSERT INTO `registry` VALUES('QueueTestCase', 'class', 'modules/system/system.test', 'system', 0);
INSERT INTO `registry` VALUES('RdfCommentAttributesTestCase', 'class', 'modules/rdf/rdf.test', 'rdf', 0);
INSERT INTO `registry` VALUES('RdfCrudTestCase', 'class', 'modules/rdf/rdf.test', 'rdf', 0);
INSERT INTO `registry` VALUES('RdfGetRdfNamespacesTestCase', 'class', 'modules/rdf/rdf.test', 'rdf', 0);
INSERT INTO `registry` VALUES('RdfMappingDefinitionTestCase', 'class', 'modules/rdf/rdf.test', 'rdf', 0);
INSERT INTO `registry` VALUES('RdfMappingHookTestCase', 'class', 'modules/rdf/rdf.test', 'rdf', 0);
INSERT INTO `registry` VALUES('RdfRdfaMarkupTestCase', 'class', 'modules/rdf/rdf.test', 'rdf', 0);
INSERT INTO `registry` VALUES('RdfTrackerAttributesTestCase', 'class', 'modules/rdf/rdf.test', 'rdf', 0);
INSERT INTO `registry` VALUES('RESTServer', 'class', 'sites/all/modules/services/servers/rest_server/includes/RESTServer.inc', 'rest_server', 0);
INSERT INTO `registry` VALUES('RetrieveFileTestCase', 'class', 'modules/system/system.test', 'system', 0);
INSERT INTO `registry` VALUES('Rule', 'class', 'sites/all/modules/rules/includes/rules.plugins.inc', 'rules', 0);
INSERT INTO `registry` VALUES('RulesAbstractPlugin', 'class', 'sites/all/modules/rules/includes/rules.core.inc', 'rules', 0);
INSERT INTO `registry` VALUES('RulesAbstractPluginDefaults', 'class', 'sites/all/modules/rules/includes/rules.core.inc', 'rules', 0);
INSERT INTO `registry` VALUES('RulesAbstractPluginUI', 'class', 'sites/all/modules/rules/ui/ui.core.inc', 'rules', 0);
INSERT INTO `registry` VALUES('RulesAction', 'class', 'sites/all/modules/rules/includes/rules.plugins.inc', 'rules', 0);
INSERT INTO `registry` VALUES('RulesActionContainer', 'class', 'sites/all/modules/rules/includes/rules.core.inc', 'rules', 0);
INSERT INTO `registry` VALUES('RulesActionContainerUI', 'class', 'sites/all/modules/rules/ui/ui.core.inc', 'rules', 0);
INSERT INTO `registry` VALUES('RulesActionInterface', 'interface', 'sites/all/modules/rules/includes/rules.core.inc', 'rules', 0);
INSERT INTO `registry` VALUES('RulesActionSet', 'class', 'sites/all/modules/rules/includes/rules.plugins.inc', 'rules', 0);
INSERT INTO `registry` VALUES('RulesAnd', 'class', 'sites/all/modules/rules/includes/rules.plugins.inc', 'rules', 0);
INSERT INTO `registry` VALUES('RulesCondition', 'class', 'sites/all/modules/rules/includes/rules.plugins.inc', 'rules', 0);
INSERT INTO `registry` VALUES('RulesConditionContainer', 'class', 'sites/all/modules/rules/includes/rules.core.inc', 'rules', 0);
INSERT INTO `registry` VALUES('RulesConditionContainerUI', 'class', 'sites/all/modules/rules/ui/ui.core.inc', 'rules', 0);
INSERT INTO `registry` VALUES('RulesConditionInterface', 'interface', 'sites/all/modules/rules/includes/rules.core.inc', 'rules', 0);
INSERT INTO `registry` VALUES('RulesContainerPlugin', 'class', 'sites/all/modules/rules/includes/rules.core.inc', 'rules', 0);
INSERT INTO `registry` VALUES('RulesContainerPluginUI', 'class', 'sites/all/modules/rules/ui/ui.core.inc', 'rules', 0);
INSERT INTO `registry` VALUES('RulesData', 'class', 'sites/all/modules/rules/includes/rules.state.inc', 'rules', 0);
INSERT INTO `registry` VALUES('RulesDataDirectInputFormInterface', 'interface', 'sites/all/modules/rules/ui/ui.data.inc', 'rules', 0);
INSERT INTO `registry` VALUES('RulesDataInputEvaluator', 'class', 'sites/all/modules/rules/includes/rules.processor.inc', 'rules', 0);
INSERT INTO `registry` VALUES('RulesDataProcessor', 'class', 'sites/all/modules/rules/includes/rules.processor.inc', 'rules', 0);
INSERT INTO `registry` VALUES('RulesDataUI', 'class', 'sites/all/modules/rules/ui/ui.data.inc', 'rules', 0);
INSERT INTO `registry` VALUES('RulesDataUIBoolean', 'class', 'sites/all/modules/rules/ui/ui.data.inc', 'rules', 0);
INSERT INTO `registry` VALUES('RulesDataUIDate', 'class', 'sites/all/modules/rules/ui/ui.data.inc', 'rules', 0);
INSERT INTO `registry` VALUES('RulesDataUIDecimal', 'class', 'sites/all/modules/rules/ui/ui.data.inc', 'rules', 0);
INSERT INTO `registry` VALUES('RulesDataUIDuration', 'class', 'sites/all/modules/rules/ui/ui.data.inc', 'rules', 0);
INSERT INTO `registry` VALUES('RulesDataUIEntity', 'class', 'sites/all/modules/rules/ui/ui.data.inc', 'rules', 0);
INSERT INTO `registry` VALUES('RulesDataUIEntityExportable', 'class', 'sites/all/modules/rules/ui/ui.data.inc', 'rules', 0);
INSERT INTO `registry` VALUES('RulesDataUIInteger', 'class', 'sites/all/modules/rules/ui/ui.data.inc', 'rules', 0);
INSERT INTO `registry` VALUES('RulesDataUIListEntity', 'class', 'sites/all/modules/rules/ui/ui.data.inc', 'rules', 0);
INSERT INTO `registry` VALUES('RulesDataUIListInteger', 'class', 'sites/all/modules/rules/ui/ui.data.inc', 'rules', 0);
INSERT INTO `registry` VALUES('RulesDataUIListText', 'class', 'sites/all/modules/rules/ui/ui.data.inc', 'rules', 0);
INSERT INTO `registry` VALUES('RulesDataUIListToken', 'class', 'sites/all/modules/rules/ui/ui.data.inc', 'rules', 0);
INSERT INTO `registry` VALUES('RulesDataUITaxonomyVocabulary', 'class', 'sites/all/modules/rules/ui/ui.data.inc', 'rules', 0);
INSERT INTO `registry` VALUES('RulesDataUIText', 'class', 'sites/all/modules/rules/ui/ui.data.inc', 'rules', 0);
INSERT INTO `registry` VALUES('RulesDataUITextFormatted', 'class', 'sites/all/modules/rules/ui/ui.data.inc', 'rules', 0);
INSERT INTO `registry` VALUES('RulesDataUITextToken', 'class', 'sites/all/modules/rules/ui/ui.data.inc', 'rules', 0);
INSERT INTO `registry` VALUES('RulesDataUIURI', 'class', 'sites/all/modules/rules/ui/ui.data.inc', 'rules', 0);
INSERT INTO `registry` VALUES('RulesDataWrapperSavableInterface', 'interface', 'sites/all/modules/rules/includes/rules.state.inc', 'rules', 0);
INSERT INTO `registry` VALUES('RulesDateInputEvaluator', 'class', 'sites/all/modules/rules/modules/rules_core.eval.inc', 'rules', 0);
INSERT INTO `registry` VALUES('RulesDateOffsetProcessor', 'class', 'sites/all/modules/rules/modules/rules_core.eval.inc', 'rules', 0);
INSERT INTO `registry` VALUES('RulesDependencyException', 'class', 'sites/all/modules/rules/includes/rules.core.inc', 'rules', 0);
INSERT INTO `registry` VALUES('RulesElementMap', 'class', 'sites/all/modules/rules/ui/ui.core.inc', 'rules', 0);
INSERT INTO `registry` VALUES('RulesEntityController', 'class', 'sites/all/modules/rules/includes/rules.core.inc', 'rules', 0);
INSERT INTO `registry` VALUES('RulesEvaluationException', 'class', 'sites/all/modules/rules/includes/rules.core.inc', 'rules', 0);
INSERT INTO `registry` VALUES('RulesEventSet', 'class', 'sites/all/modules/rules/includes/rules.plugins.inc', 'rules', 0);
INSERT INTO `registry` VALUES('RulesException', 'class', 'sites/all/modules/rules/includes/rules.core.inc', 'rules', 0);
INSERT INTO `registry` VALUES('RulesExtendable', 'class', 'sites/all/modules/rules/includes/rules.core.inc', 'rules', 0);
INSERT INTO `registry` VALUES('RulesFeaturesController', 'class', 'sites/all/modules/rules/rules.features.inc', 'rules', 0);
INSERT INTO `registry` VALUES('RulesIdentifiableDataWrapper', 'class', 'sites/all/modules/rules/includes/rules.state.inc', 'rules', 0);
INSERT INTO `registry` VALUES('RulesIntegrationTestCase', 'class', 'sites/all/modules/rules/tests/rules.test', 'rules', 0);
INSERT INTO `registry` VALUES('RulesIntegrityException', 'class', 'sites/all/modules/rules/includes/rules.core.inc', 'rules', 0);
INSERT INTO `registry` VALUES('RulesLog', 'class', 'sites/all/modules/rules/includes/rules.core.inc', 'rules', 0);
INSERT INTO `registry` VALUES('RulesLoop', 'class', 'sites/all/modules/rules/includes/rules.plugins.inc', 'rules', 0);
INSERT INTO `registry` VALUES('RulesLoopUI', 'class', 'sites/all/modules/rules/ui/ui.plugins.inc', 'rules', 0);
INSERT INTO `registry` VALUES('RulesNumericOffsetProcessor', 'class', 'sites/all/modules/rules/modules/rules_core.eval.inc', 'rules', 0);
INSERT INTO `registry` VALUES('RulesOptimizationInterface', 'interface', 'sites/all/modules/rules/includes/rules.core.inc', 'rules', 0);
INSERT INTO `registry` VALUES('RulesOr', 'class', 'sites/all/modules/rules/includes/rules.plugins.inc', 'rules', 0);
INSERT INTO `registry` VALUES('RulesPHPDataProcessor', 'class', 'sites/all/modules/rules/modules/php.eval.inc', 'rules', 0);
INSERT INTO `registry` VALUES('RulesPHPEvaluator', 'class', 'sites/all/modules/rules/modules/php.eval.inc', 'rules', 0);
INSERT INTO `registry` VALUES('RulesPlugin', 'class', 'sites/all/modules/rules/includes/rules.core.inc', 'rules', 0);
INSERT INTO `registry` VALUES('RulesPluginFeaturesIntegrationInterace', 'interface', 'sites/all/modules/rules/rules.features.inc', 'rules', 0);
INSERT INTO `registry` VALUES('RulesPluginImplInterface', 'interface', 'sites/all/modules/rules/includes/rules.core.inc', 'rules', 0);
INSERT INTO `registry` VALUES('RulesPluginUI', 'class', 'sites/all/modules/rules/ui/ui.core.inc', 'rules', 0);
INSERT INTO `registry` VALUES('RulesPluginUIInterface', 'interface', 'sites/all/modules/rules/ui/ui.core.inc', 'rules', 0);
INSERT INTO `registry` VALUES('RulesReactionRule', 'class', 'sites/all/modules/rules/includes/rules.plugins.inc', 'rules', 0);
INSERT INTO `registry` VALUES('RulesReactionRuleUI', 'class', 'sites/all/modules/rules/ui/ui.plugins.inc', 'rules', 0);
INSERT INTO `registry` VALUES('RulesRecursiveElementIterator', 'class', 'sites/all/modules/rules/includes/rules.core.inc', 'rules', 0);
INSERT INTO `registry` VALUES('RulesRuleSet', 'class', 'sites/all/modules/rules/includes/rules.plugins.inc', 'rules', 0);
INSERT INTO `registry` VALUES('RulesRuleSetUI', 'class', 'sites/all/modules/rules/ui/ui.plugins.inc', 'rules', 0);
INSERT INTO `registry` VALUES('RulesRuleUI', 'class', 'sites/all/modules/rules/ui/ui.plugins.inc', 'rules', 0);
INSERT INTO `registry` VALUES('RulesSchedulerTestCase', 'class', 'sites/all/modules/rules/rules_scheduler/rules_scheduler.test', 'rules_scheduler', 0);
INSERT INTO `registry` VALUES('RulesState', 'class', 'sites/all/modules/rules/includes/rules.state.inc', 'rules', 0);
INSERT INTO `registry` VALUES('RulesTaxonomyVocabularyWrapper', 'class', 'sites/all/modules/rules/modules/rules_core.eval.inc', 'rules', 0);
INSERT INTO `registry` VALUES('RulesTestCase', 'class', 'sites/all/modules/rules/tests/rules.test', 'rules', 0);
INSERT INTO `registry` VALUES('RulesTestDataCase', 'class', 'sites/all/modules/rules/tests/rules.test', 'rules', 0);
INSERT INTO `registry` VALUES('RulesTokenEvaluator', 'class', 'sites/all/modules/rules/modules/system.eval.inc', 'rules', 0);
INSERT INTO `registry` VALUES('RulesTriggerableInterface', 'interface', 'sites/all/modules/rules/includes/rules.core.inc', 'rules', 0);
INSERT INTO `registry` VALUES('RulesTriggerTestCase', 'class', 'sites/all/modules/rules/tests/rules.test', 'rules', 0);
INSERT INTO `registry` VALUES('RulesUIController', 'class', 'sites/all/modules/rules/ui/ui.controller.inc', 'rules', 0);
INSERT INTO `registry` VALUES('RulesURIInputEvaluator', 'class', 'sites/all/modules/rules/modules/rules_core.eval.inc', 'rules', 0);
INSERT INTO `registry` VALUES('rules_scheduler_views_filter', 'class', 'sites/all/modules/rules/rules_scheduler/includes/rules_scheduler_views_filter.inc', 'rules_scheduler', 0);
INSERT INTO `registry` VALUES('SchemaCache', 'class', 'includes/bootstrap.inc', '', 0);
INSERT INTO `registry` VALUES('SearchAdvancedSearchForm', 'class', 'modules/search/search.test', 'search', 0);
INSERT INTO `registry` VALUES('SearchBlockTestCase', 'class', 'modules/search/search.test', 'search', 0);
INSERT INTO `registry` VALUES('SearchCommentCountToggleTestCase', 'class', 'modules/search/search.test', 'search', 0);
INSERT INTO `registry` VALUES('SearchCommentTestCase', 'class', 'modules/search/search.test', 'search', 0);
INSERT INTO `registry` VALUES('SearchConfigSettingsForm', 'class', 'modules/search/search.test', 'search', 0);
INSERT INTO `registry` VALUES('SearchEmbedForm', 'class', 'modules/search/search.test', 'search', 0);
INSERT INTO `registry` VALUES('SearchExactTestCase', 'class', 'modules/search/search.test', 'search', 0);
INSERT INTO `registry` VALUES('SearchExcerptTestCase', 'class', 'modules/search/search.test', 'search', 0);
INSERT INTO `registry` VALUES('SearchExpressionInsertExtractTestCase', 'class', 'modules/search/search.test', 'search', 0);
INSERT INTO `registry` VALUES('SearchKeywordsConditions', 'class', 'modules/search/search.test', 'search', 0);
INSERT INTO `registry` VALUES('SearchLanguageTestCase', 'class', 'modules/search/search.test', 'search', 0);
INSERT INTO `registry` VALUES('SearchMatchTestCase', 'class', 'modules/search/search.test', 'search', 0);
INSERT INTO `registry` VALUES('SearchNodeAccessTest', 'class', 'modules/search/search.test', 'search', 0);
INSERT INTO `registry` VALUES('SearchNumberMatchingTestCase', 'class', 'modules/search/search.test', 'search', 0);
INSERT INTO `registry` VALUES('SearchNumbersTestCase', 'class', 'modules/search/search.test', 'search', 0);
INSERT INTO `registry` VALUES('SearchPageOverride', 'class', 'modules/search/search.test', 'search', 0);
INSERT INTO `registry` VALUES('SearchPageText', 'class', 'modules/search/search.test', 'search', 0);
INSERT INTO `registry` VALUES('SearchQuery', 'class', 'modules/search/search.extender.inc', 'search', 0);
INSERT INTO `registry` VALUES('SearchRankingTestCase', 'class', 'modules/search/search.test', 'search', 0);
INSERT INTO `registry` VALUES('SearchSimplifyTestCase', 'class', 'modules/search/search.test', 'search', 0);
INSERT INTO `registry` VALUES('SearchTokenizerTestCase', 'class', 'modules/search/search.test', 'search', 0);
INSERT INTO `registry` VALUES('SelectQuery', 'class', 'includes/database/select.inc', '', 0);
INSERT INTO `registry` VALUES('SelectQueryExtender', 'class', 'includes/database/select.inc', '', 0);
INSERT INTO `registry` VALUES('SelectQueryInterface', 'interface', 'includes/database/select.inc', '', 0);
INSERT INTO `registry` VALUES('SelectQuery_pgsql', 'class', 'includes/database/pgsql/select.inc', '', 0);
INSERT INTO `registry` VALUES('SelectQuery_sqlite', 'class', 'includes/database/sqlite/select.inc', '', 0);
INSERT INTO `registry` VALUES('ServicesAliasTests', 'class', 'sites/all/modules/services/tests/functional/ServicesAliasTests.test', 'services', 0);
INSERT INTO `registry` VALUES('ServicesArgumentException', 'class', 'sites/all/modules/services/includes/services.runtime.inc', 'services', 0);
INSERT INTO `registry` VALUES('ServicesArgumentsTestCase', 'class', 'sites/all/modules/services/tests/functional/ServicesArgumentsTests.test', 'services', 0);
INSERT INTO `registry` VALUES('ServicesBencodeFormatter', 'class', 'sites/all/modules/services/servers/rest_server/includes/ServicesFormatter.inc', 'rest_server', 0);
INSERT INTO `registry` VALUES('ServicesContentTypeNegotiator', 'class', 'sites/all/modules/services/servers/rest_server/includes/ServicesContentTypeNegotiator.inc', 'rest_server', 0);
INSERT INTO `registry` VALUES('ServicesContentTypeNegotiatorInterface', 'interface', 'sites/all/modules/services/servers/rest_server/includes/ServicesContentTypeNegotiator.inc', 'rest_server', 0);
INSERT INTO `registry` VALUES('ServicesContext', 'class', 'sites/all/modules/services/servers/rest_server/includes/ServicesContext.inc', 'rest_server', 0);
INSERT INTO `registry` VALUES('ServicesContextInterface', 'interface', 'sites/all/modules/services/servers/rest_server/includes/ServicesContext.inc', 'rest_server', 0);
INSERT INTO `registry` VALUES('ServicesEndpointTests', 'class', 'sites/all/modules/services/tests/functional/ServicesEndpointTests.test', 'services', 0);
INSERT INTO `registry` VALUES('ServicesException', 'class', 'sites/all/modules/services/includes/services.runtime.inc', 'services', 0);
INSERT INTO `registry` VALUES('ServicesFormatterInterface', 'interface', 'sites/all/modules/services/servers/rest_server/includes/ServicesFormatter.inc', 'rest_server', 0);
INSERT INTO `registry` VALUES('ServicesJSONFormatter', 'class', 'sites/all/modules/services/servers/rest_server/includes/ServicesFormatter.inc', 'rest_server', 0);
INSERT INTO `registry` VALUES('ServicesJSONPFormatter', 'class', 'sites/all/modules/services/servers/rest_server/includes/ServicesFormatter.inc', 'rest_server', 0);
INSERT INTO `registry` VALUES('ServicesParserFile', 'class', 'sites/all/modules/services/servers/rest_server/includes/ServicesParser.inc', 'rest_server', 0);
INSERT INTO `registry` VALUES('ServicesParserInterface', 'interface', 'sites/all/modules/services/servers/rest_server/includes/ServicesParser.inc', 'rest_server', 0);
INSERT INTO `registry` VALUES('ServicesParserJSON', 'class', 'sites/all/modules/services/servers/rest_server/includes/ServicesParser.inc', 'rest_server', 0);
INSERT INTO `registry` VALUES('ServicesParserMultipart', 'class', 'sites/all/modules/services/servers/rest_server/includes/ServicesParser.inc', 'rest_server', 0);
INSERT INTO `registry` VALUES('ServicesParserPHP', 'class', 'sites/all/modules/services/servers/rest_server/includes/ServicesParser.inc', 'rest_server', 0);
INSERT INTO `registry` VALUES('ServicesParserTests', 'class', 'sites/all/modules/services/tests/functional/ServicesParserTests.test', 'services', 0);
INSERT INTO `registry` VALUES('ServicesParserURLEncoded', 'class', 'sites/all/modules/services/servers/rest_server/includes/ServicesParser.inc', 'rest_server', 0);
INSERT INTO `registry` VALUES('ServicesParserXML', 'class', 'sites/all/modules/services/servers/rest_server/includes/ServicesParser.inc', 'rest_server', 0);
INSERT INTO `registry` VALUES('ServicesParserYAML', 'class', 'sites/all/modules/services/servers/rest_server/includes/ServicesParser.inc', 'rest_server', 0);
INSERT INTO `registry` VALUES('ServicesPHPFormatter', 'class', 'sites/all/modules/services/servers/rest_server/includes/ServicesFormatter.inc', 'rest_server', 0);
INSERT INTO `registry` VALUES('ServicesResourceCommentTests', 'class', 'sites/all/modules/services/tests/functional/ServicesResourceCommentTests.test', 'services', 0);
INSERT INTO `registry` VALUES('ServicesResourceDisabledTest', 'class', 'sites/all/modules/services/tests/functional/ServicesResourceDisabledTests.test', 'services', 0);
INSERT INTO `registry` VALUES('ServicesResourceFileTests', 'class', 'sites/all/modules/services/tests/functional/ServicesResourceFileTests.test', 'services', 0);
INSERT INTO `registry` VALUES('ServicesResourceNodeTaxonomytests', 'class', 'sites/all/modules/services/tests/functional/ServicesResourceNodeTests.test', 'services', 0);
INSERT INTO `registry` VALUES('ServicesResourceNodetests', 'class', 'sites/all/modules/services/tests/functional/ServicesResourceNodeTests.test', 'services', 0);
INSERT INTO `registry` VALUES('ServicesResourceSystemTests', 'class', 'sites/all/modules/services/tests/functional/ServicesResourceSystemTests.test', 'services', 0);
INSERT INTO `registry` VALUES('ServicesResourceTaxonomyTests', 'class', 'sites/all/modules/services/tests/functional/ServicesResourceTaxonomyTests.test', 'services', 0);
INSERT INTO `registry` VALUES('ServicesResourceUsertests', 'class', 'sites/all/modules/services/tests/functional/ServicesResourceUserTests.test', 'services', 0);
INSERT INTO `registry` VALUES('ServicesRESTServerFactory', 'class', 'sites/all/modules/services/servers/rest_server/includes/ServicesRESTServerFactory.inc', 'rest_server', 0);
INSERT INTO `registry` VALUES('ServicesRESTServerTests', 'class', 'sites/all/modules/services/servers/rest_server/tests/ServicesRESTServerTests.test', 'rest_server', 0);
INSERT INTO `registry` VALUES('ServicesSecurityTests', 'class', 'sites/all/modules/services/tests/functional/ServicesSecurityTests.test', 'services', 0);
INSERT INTO `registry` VALUES('ServicesSpycLibraryTests', 'class', 'sites/all/modules/services/tests/unit/ServicesSpycLibraryTests.test', 'services', 0);
INSERT INTO `registry` VALUES('ServicesUITest', 'class', 'sites/all/modules/services/tests/ui/ServicesUITests.test', 'services', 0);
INSERT INTO `registry` VALUES('ServicesVersionTests', 'class', 'sites/all/modules/services/tests/functional/ServicesVersionTests.test', 'services', 0);
INSERT INTO `registry` VALUES('ServicesWebTestCase', 'class', 'sites/all/modules/services/tests/services.test', 'services', 0);
INSERT INTO `registry` VALUES('ServicesXMLFormatter', 'class', 'sites/all/modules/services/servers/rest_server/includes/ServicesFormatter.inc', 'rest_server', 0);
INSERT INTO `registry` VALUES('ServicesXMLRPCTestCase', 'class', 'sites/all/modules/services/tests/functional/ServicesXMLRPCTests.test', 'services', 0);
INSERT INTO `registry` VALUES('ServicesYAMLFormatter', 'class', 'sites/all/modules/services/servers/rest_server/includes/ServicesFormatter.inc', 'rest_server', 0);
INSERT INTO `registry` VALUES('services_ctools_export_ui', 'class', 'sites/all/modules/services/plugins/export_ui/services_ctools_export_ui.class.php', 'services', 0);
INSERT INTO `registry` VALUES('ShortcutLinksTestCase', 'class', 'modules/shortcut/shortcut.test', 'shortcut', 0);
INSERT INTO `registry` VALUES('ShortcutSetsTestCase', 'class', 'modules/shortcut/shortcut.test', 'shortcut', 0);
INSERT INTO `registry` VALUES('ShortcutTestCase', 'class', 'modules/shortcut/shortcut.test', 'shortcut', 0);
INSERT INTO `registry` VALUES('ShutdownFunctionsTest', 'class', 'modules/system/system.test', 'system', 0);
INSERT INTO `registry` VALUES('SiteMaintenanceTestCase', 'class', 'modules/system/system.test', 'system', 0);
INSERT INTO `registry` VALUES('SkipDotsRecursiveDirectoryIterator', 'class', 'includes/filetransfer/filetransfer.inc', '', 0);
INSERT INTO `registry` VALUES('StreamWrapperInterface', 'interface', 'includes/stream_wrappers.inc', '', 0);
INSERT INTO `registry` VALUES('SummaryLengthTestCase', 'class', 'modules/node/node.test', 'node', 0);
INSERT INTO `registry` VALUES('SystemAdminTestCase', 'class', 'modules/system/system.test', 'system', 0);
INSERT INTO `registry` VALUES('SystemAuthorizeCase', 'class', 'modules/system/system.test', 'system', 0);
INSERT INTO `registry` VALUES('SystemBlockTestCase', 'class', 'modules/system/system.test', 'system', 0);
INSERT INTO `registry` VALUES('SystemIndexPhpTest', 'class', 'modules/system/system.test', 'system', 0);
INSERT INTO `registry` VALUES('SystemInfoAlterTestCase', 'class', 'modules/system/system.test', 'system', 0);
INSERT INTO `registry` VALUES('SystemMainContentFallback', 'class', 'modules/system/system.test', 'system', 0);
INSERT INTO `registry` VALUES('SystemQueue', 'class', 'modules/system/system.queue.inc', 'system', 0);
INSERT INTO `registry` VALUES('SystemThemeFunctionalTest', 'class', 'modules/system/system.test', 'system', 0);
INSERT INTO `registry` VALUES('TableSort', 'class', 'includes/tablesort.inc', '', 0);
INSERT INTO `registry` VALUES('TaxonomyEFQTestCase', 'class', 'modules/taxonomy/taxonomy.test', 'taxonomy', 0);
INSERT INTO `registry` VALUES('TaxonomyHooksTestCase', 'class', 'modules/taxonomy/taxonomy.test', 'taxonomy', 0);
INSERT INTO `registry` VALUES('TaxonomyLegacyTestCase', 'class', 'modules/taxonomy/taxonomy.test', 'taxonomy', 0);
INSERT INTO `registry` VALUES('TaxonomyLoadMultipleTestCase', 'class', 'modules/taxonomy/taxonomy.test', 'taxonomy', 0);
INSERT INTO `registry` VALUES('TaxonomyRSSTestCase', 'class', 'modules/taxonomy/taxonomy.test', 'taxonomy', 0);
INSERT INTO `registry` VALUES('TaxonomyTermController', 'class', 'modules/taxonomy/taxonomy.module', 'taxonomy', 0);
INSERT INTO `registry` VALUES('TaxonomyTermFieldMultipleVocabularyTestCase', 'class', 'modules/taxonomy/taxonomy.test', 'taxonomy', 0);
INSERT INTO `registry` VALUES('TaxonomyTermFieldTestCase', 'class', 'modules/taxonomy/taxonomy.test', 'taxonomy', 0);
INSERT INTO `registry` VALUES('TaxonomyTermFunctionTestCase', 'class', 'modules/taxonomy/taxonomy.test', 'taxonomy', 0);
INSERT INTO `registry` VALUES('TaxonomyTermIndexTestCase', 'class', 'modules/taxonomy/taxonomy.test', 'taxonomy', 0);
INSERT INTO `registry` VALUES('TaxonomyTermTestCase', 'class', 'modules/taxonomy/taxonomy.test', 'taxonomy', 0);
INSERT INTO `registry` VALUES('TaxonomyThemeTestCase', 'class', 'modules/taxonomy/taxonomy.test', 'taxonomy', 0);
INSERT INTO `registry` VALUES('TaxonomyTokenReplaceTestCase', 'class', 'modules/taxonomy/taxonomy.test', 'taxonomy', 0);
INSERT INTO `registry` VALUES('TaxonomyVocabularyController', 'class', 'modules/taxonomy/taxonomy.module', 'taxonomy', 0);
INSERT INTO `registry` VALUES('TaxonomyVocabularyFunctionalTest', 'class', 'modules/taxonomy/taxonomy.test', 'taxonomy', 0);
INSERT INTO `registry` VALUES('TaxonomyVocabularyTestCase', 'class', 'modules/taxonomy/taxonomy.test', 'taxonomy', 0);
INSERT INTO `registry` VALUES('TaxonomyWebTestCase', 'class', 'modules/taxonomy/taxonomy.test', 'taxonomy', 0);
INSERT INTO `registry` VALUES('TestingMailSystem', 'class', 'modules/system/system.mail.inc', 'system', 0);
INSERT INTO `registry` VALUES('TextFieldTestCase', 'class', 'modules/field/modules/text/text.test', 'text', 0);
INSERT INTO `registry` VALUES('TextSummaryTestCase', 'class', 'modules/field/modules/text/text.test', 'text', 0);
INSERT INTO `registry` VALUES('TextTranslationTestCase', 'class', 'modules/field/modules/text/text.test', 'text', 0);
INSERT INTO `registry` VALUES('ThemeRegistry', 'class', 'includes/theme.inc', '', 0);
INSERT INTO `registry` VALUES('ThemeUpdater', 'class', 'modules/system/system.updater.inc', 'system', 0);
INSERT INTO `registry` VALUES('TokenReplaceTestCase', 'class', 'modules/system/system.test', 'system', 0);
INSERT INTO `registry` VALUES('TokenScanTest', 'class', 'modules/system/system.test', 'system', 0);
INSERT INTO `registry` VALUES('TruncateQuery', 'class', 'includes/database/query.inc', '', 0);
INSERT INTO `registry` VALUES('TruncateQuery_mysql', 'class', 'includes/database/mysql/query.inc', '', 0);
INSERT INTO `registry` VALUES('TruncateQuery_sqlite', 'class', 'includes/database/sqlite/query.inc', '', 0);
INSERT INTO `registry` VALUES('UpdateCoreTestCase', 'class', 'modules/update/update.test', 'update', 0);
INSERT INTO `registry` VALUES('UpdateCoreUnitTestCase', 'class', 'modules/update/update.test', 'update', 0);
INSERT INTO `registry` VALUES('UpdateQuery', 'class', 'includes/database/query.inc', '', 0);
INSERT INTO `registry` VALUES('UpdateQuery_pgsql', 'class', 'includes/database/pgsql/query.inc', '', 0);
INSERT INTO `registry` VALUES('UpdateQuery_sqlite', 'class', 'includes/database/sqlite/query.inc', '', 0);
INSERT INTO `registry` VALUES('Updater', 'class', 'includes/updater.inc', '', 0);
INSERT INTO `registry` VALUES('UpdaterException', 'class', 'includes/updater.inc', '', 0);
INSERT INTO `registry` VALUES('UpdaterFileTransferException', 'class', 'includes/updater.inc', '', 0);
INSERT INTO `registry` VALUES('UpdateScriptFunctionalTest', 'class', 'modules/system/system.test', 'system', 0);
INSERT INTO `registry` VALUES('UpdateTestContribCase', 'class', 'modules/update/update.test', 'update', 0);
INSERT INTO `registry` VALUES('UpdateTestHelper', 'class', 'modules/update/update.test', 'update', 0);
INSERT INTO `registry` VALUES('UpdateTestUploadCase', 'class', 'modules/update/update.test', 'update', 0);
INSERT INTO `registry` VALUES('UserAccountLinksUnitTests', 'class', 'modules/user/user.test', 'user', 0);
INSERT INTO `registry` VALUES('UserAdminTestCase', 'class', 'modules/user/user.test', 'user', 0);
INSERT INTO `registry` VALUES('UserAuthmapAssignmentTestCase', 'class', 'modules/user/user.test', 'user', 0);
INSERT INTO `registry` VALUES('UserAutocompleteTestCase', 'class', 'modules/user/user.test', 'user', 0);
INSERT INTO `registry` VALUES('UserBlocksUnitTests', 'class', 'modules/user/user.test', 'user', 0);
INSERT INTO `registry` VALUES('UserCancelTestCase', 'class', 'modules/user/user.test', 'user', 0);
INSERT INTO `registry` VALUES('UserController', 'class', 'modules/user/user.module', 'user', 0);
INSERT INTO `registry` VALUES('UserCreateTestCase', 'class', 'modules/user/user.test', 'user', 0);
INSERT INTO `registry` VALUES('UserEditedOwnAccountTestCase', 'class', 'modules/user/user.test', 'user', 0);
INSERT INTO `registry` VALUES('UserEditTestCase', 'class', 'modules/user/user.test', 'user', 0);
INSERT INTO `registry` VALUES('UserLoginTestCase', 'class', 'modules/user/user.test', 'user', 0);
INSERT INTO `registry` VALUES('UserPasswordResetTestCase', 'class', 'modules/user/user.test', 'user', 0);
INSERT INTO `registry` VALUES('UserPermissionsTestCase', 'class', 'modules/user/user.test', 'user', 0);
INSERT INTO `registry` VALUES('UserPictureTestCase', 'class', 'modules/user/user.test', 'user', 0);
INSERT INTO `registry` VALUES('UserRegistrationTestCase', 'class', 'modules/user/user.test', 'user', 0);
INSERT INTO `registry` VALUES('UserRoleAdminTestCase', 'class', 'modules/user/user.test', 'user', 0);
INSERT INTO `registry` VALUES('UserRolesAssignmentTestCase', 'class', 'modules/user/user.test', 'user', 0);
INSERT INTO `registry` VALUES('UserSaveTestCase', 'class', 'modules/user/user.test', 'user', 0);
INSERT INTO `registry` VALUES('UserSignatureTestCase', 'class', 'modules/user/user.test', 'user', 0);
INSERT INTO `registry` VALUES('UserTimeZoneFunctionalTest', 'class', 'modules/user/user.test', 'user', 0);
INSERT INTO `registry` VALUES('UserTokenReplaceTestCase', 'class', 'modules/user/user.test', 'user', 0);
INSERT INTO `registry` VALUES('UserUserSearchTestCase', 'class', 'modules/user/user.test', 'user', 0);
INSERT INTO `registry` VALUES('UserValidateCurrentPassCustomForm', 'class', 'modules/user/user.test', 'user', 0);
INSERT INTO `registry` VALUES('UserValidationTestCase', 'class', 'modules/user/user.test', 'user', 0);
INSERT INTO `registry` VALUES('view', 'class', 'sites/all/modules/views/includes/view.inc', 'views', 0);
INSERT INTO `registry` VALUES('ViewsAccessTest', 'class', 'sites/all/modules/views/tests/views_access.test', 'views', 0);
INSERT INTO `registry` VALUES('ViewsAnalyzeTest', 'class', 'sites/all/modules/views/tests/views_analyze.test', 'views', 0);
INSERT INTO `registry` VALUES('ViewsArgumentDefaultTest', 'class', 'sites/all/modules/views/tests/views_argument_default.test', 'views', 0);
INSERT INTO `registry` VALUES('ViewsArgumentValidatorTest', 'class', 'sites/all/modules/views/tests/views_argument_validator.test', 'views', 0);
INSERT INTO `registry` VALUES('ViewsBasicTest', 'class', 'sites/all/modules/views/tests/views_basic.test', 'views', 0);
INSERT INTO `registry` VALUES('ViewsCacheTest', 'class', 'sites/all/modules/views/tests/views_cache.test', 'views', 0);
INSERT INTO `registry` VALUES('ViewsExposedFormTest', 'class', 'sites/all/modules/views/tests/views_exposed_form.test', 'views', 0);
INSERT INTO `registry` VALUES('viewsFieldApiDataTest', 'class', 'sites/all/modules/views/tests/field/views_fieldapi.test', 'views', 0);
INSERT INTO `registry` VALUES('ViewsFieldApiTestHelper', 'class', 'sites/all/modules/views/tests/field/views_fieldapi.test', 'views', 0);
INSERT INTO `registry` VALUES('ViewsGlossaryTestCase', 'class', 'sites/all/modules/views/tests/views_glossary.test', 'views', 0);
INSERT INTO `registry` VALUES('ViewsHandlerAreaTextTest', 'class', 'sites/all/modules/views/tests/handlers/views_handler_area_text.test', 'views', 0);
INSERT INTO `registry` VALUES('viewsHandlerArgumentCommentUserUidTest', 'class', 'sites/all/modules/views/tests/comment/views_handler_argument_comment_user_uid.test', 'views', 0);
INSERT INTO `registry` VALUES('ViewsHandlerArgumentNullTest', 'class', 'sites/all/modules/views/tests/handlers/views_handler_argument_null.test', 'views', 0);
INSERT INTO `registry` VALUES('ViewsHandlerArgumentStringTest', 'class', 'sites/all/modules/views/tests/handlers/views_handler_argument_string.test', 'views', 0);
INSERT INTO `registry` VALUES('ViewsHandlerFieldBooleanTest', 'class', 'sites/all/modules/views/tests/handlers/views_handler_field_boolean.test', 'views', 0);
INSERT INTO `registry` VALUES('ViewsHandlerFieldCustomTest', 'class', 'sites/all/modules/views/tests/handlers/views_handler_field_custom.test', 'views', 0);
INSERT INTO `registry` VALUES('ViewsHandlerFieldDateTest', 'class', 'sites/all/modules/views/tests/handlers/views_handler_field_date.test', 'views', 0);
INSERT INTO `registry` VALUES('viewsHandlerFieldFieldTest', 'class', 'sites/all/modules/views/tests/field/views_fieldapi.test', 'views', 0);
INSERT INTO `registry` VALUES('ViewsHandlerFieldMath', 'class', 'sites/all/modules/views/tests/handlers/views_handler_field_math.test', 'views', 0);
INSERT INTO `registry` VALUES('ViewsHandlerFieldTest', 'class', 'sites/all/modules/views/tests/handlers/views_handler_field.test', 'views', 0);
INSERT INTO `registry` VALUES('ViewsHandlerFieldUrlTest', 'class', 'sites/all/modules/views/tests/handlers/views_handler_field_url.test', 'views', 0);
INSERT INTO `registry` VALUES('viewsHandlerFieldUserNameTest', 'class', 'sites/all/modules/views/tests/user/views_handler_field_user_name.test', 'views', 0);
INSERT INTO `registry` VALUES('ViewsHandlerFilterCombineTest', 'class', 'sites/all/modules/views/tests/handlers/views_handler_filter_combine.test', 'views', 0);
INSERT INTO `registry` VALUES('viewsHandlerFilterCommentUserUidTest', 'class', 'sites/all/modules/views/tests/comment/views_handler_filter_comment_user_uid.test', 'views', 0);
INSERT INTO `registry` VALUES('ViewsHandlerFilterCounterTest', 'class', 'sites/all/modules/views/tests/handlers/views_handler_field_counter.test', 'views', 0);
INSERT INTO `registry` VALUES('ViewsHandlerFilterDateTest', 'class', 'sites/all/modules/views/tests/handlers/views_handler_filter_date.test', 'views', 0);
INSERT INTO `registry` VALUES('ViewsHandlerFilterEqualityTest', 'class', 'sites/all/modules/views/tests/handlers/views_handler_filter_equality.test', 'views', 0);
INSERT INTO `registry` VALUES('ViewsHandlerFilterInOperator', 'class', 'sites/all/modules/views/tests/handlers/views_handler_filter_in_operator.test', 'views', 0);
INSERT INTO `registry` VALUES('ViewsHandlerFilterNumericTest', 'class', 'sites/all/modules/views/tests/handlers/views_handler_filter_numeric.test', 'views', 0);
INSERT INTO `registry` VALUES('ViewsHandlerFilterStringTest', 'class', 'sites/all/modules/views/tests/handlers/views_handler_filter_string.test', 'views', 0);
INSERT INTO `registry` VALUES('ViewsHandlerRelationshipNodeTermDataTest', 'class', 'sites/all/modules/views/tests/taxonomy/views_handler_relationship_node_term_data.test', 'views', 0);
INSERT INTO `registry` VALUES('ViewsHandlerSortDateTest', 'class', 'sites/all/modules/views/tests/handlers/views_handler_sort_date.test', 'views', 0);
INSERT INTO `registry` VALUES('ViewsHandlerSortRandomTest', 'class', 'sites/all/modules/views/tests/handlers/views_handler_sort_random.test', 'views', 0);
INSERT INTO `registry` VALUES('ViewsHandlerSortTest', 'class', 'sites/all/modules/views/tests/handlers/views_handler_sort.test', 'views', 0);
INSERT INTO `registry` VALUES('ViewsHandlersTest', 'class', 'sites/all/modules/views/tests/views_handlers.test', 'views', 0);
INSERT INTO `registry` VALUES('ViewsHandlerTestFileSize', 'class', 'sites/all/modules/views/tests/handlers/views_handler_field_file_size.test', 'views', 0);
INSERT INTO `registry` VALUES('ViewsHandlerTestXss', 'class', 'sites/all/modules/views/tests/handlers/views_handler_field_xss.test', 'views', 0);
INSERT INTO `registry` VALUES('ViewsModuleTest', 'class', 'sites/all/modules/views/tests/views_module.test', 'views', 0);
INSERT INTO `registry` VALUES('ViewsNodeRevisionRelationsTestCase', 'class', 'sites/all/modules/views/tests/node/views_node_revision_relations.test', 'views', 0);
INSERT INTO `registry` VALUES('ViewsPagerTest', 'class', 'sites/all/modules/views/tests/views_pager.test', 'views', 0);
INSERT INTO `registry` VALUES('ViewsPluginDisplayTestCase', 'class', 'sites/all/modules/views/tests/plugins/views_plugin_display.test', 'views', 0);
INSERT INTO `registry` VALUES('viewsPluginStyleJumpMenuTest', 'class', 'sites/all/modules/views/tests/styles/views_plugin_style_jump_menu.test', 'views', 0);
INSERT INTO `registry` VALUES('ViewsPluginStyleMappingTest', 'class', 'sites/all/modules/views/tests/styles/views_plugin_style_mapping.test', 'views', 0);
INSERT INTO `registry` VALUES('ViewsPluginStyleTestBase', 'class', 'sites/all/modules/views/tests/styles/views_plugin_style_base.test', 'views', 0);
INSERT INTO `registry` VALUES('ViewsPluginStyleTestCase', 'class', 'sites/all/modules/views/tests/styles/views_plugin_style.test', 'views', 0);
INSERT INTO `registry` VALUES('ViewsPluginStyleUnformattedTestCase', 'class', 'sites/all/modules/views/tests/styles/views_plugin_style_unformatted.test', 'views', 0);
INSERT INTO `registry` VALUES('ViewsQueryGroupByTest', 'class', 'sites/all/modules/views/tests/views_groupby.test', 'views', 0);
INSERT INTO `registry` VALUES('viewsSearchQuery', 'class', 'sites/all/modules/views/modules/search/views_handler_filter_search.inc', 'views', 0);
INSERT INTO `registry` VALUES('ViewsSqlTest', 'class', 'sites/all/modules/views/tests/views_query.test', 'views', 0);
INSERT INTO `registry` VALUES('ViewsTestCase', 'class', 'sites/all/modules/views/tests/views_query.test', 'views', 0);
INSERT INTO `registry` VALUES('ViewsTranslatableTest', 'class', 'sites/all/modules/views/tests/views_translatable.test', 'views', 0);
INSERT INTO `registry` VALUES('ViewsUiBaseViewsWizard', 'class', 'sites/all/modules/views/plugins/views_wizard/views_ui_base_views_wizard.class.php', 'views_ui', 0);
INSERT INTO `registry` VALUES('ViewsUiCommentViewsWizard', 'class', 'sites/all/modules/views/plugins/views_wizard/views_ui_comment_views_wizard.class.php', 'views_ui', 0);
INSERT INTO `registry` VALUES('ViewsUiFileManagedViewsWizard', 'class', 'sites/all/modules/views/plugins/views_wizard/views_ui_file_managed_views_wizard.class.php', 'views_ui', 0);
INSERT INTO `registry` VALUES('viewsUiGroupbyTestCase', 'class', 'sites/all/modules/views/tests/views_groupby.test', 'views', 0);
INSERT INTO `registry` VALUES('ViewsUiNodeRevisionViewsWizard', 'class', 'sites/all/modules/views/plugins/views_wizard/views_ui_node_revision_views_wizard.class.php', 'views_ui', 0);
INSERT INTO `registry` VALUES('ViewsUiNodeViewsWizard', 'class', 'sites/all/modules/views/plugins/views_wizard/views_ui_node_views_wizard.class.php', 'views_ui', 0);
INSERT INTO `registry` VALUES('ViewsUiTaxonomyTermViewsWizard', 'class', 'sites/all/modules/views/plugins/views_wizard/views_ui_taxonomy_term_views_wizard.class.php', 'views_ui', 0);
INSERT INTO `registry` VALUES('ViewsUiUsersViewsWizard', 'class', 'sites/all/modules/views/plugins/views_wizard/views_ui_users_views_wizard.class.php', 'views_ui', 0);
INSERT INTO `registry` VALUES('ViewsUIWizardBasicTestCase', 'class', 'sites/all/modules/views/tests/views_ui.test', 'views', 0);
INSERT INTO `registry` VALUES('ViewsUIWizardDefaultViewsTestCase', 'class', 'sites/all/modules/views/tests/views_ui.test', 'views', 0);
INSERT INTO `registry` VALUES('ViewsUIWizardHelper', 'class', 'sites/all/modules/views/tests/views_ui.test', 'views', 0);
INSERT INTO `registry` VALUES('ViewsUIWizardItemsPerPageTestCase', 'class', 'sites/all/modules/views/tests/views_ui.test', 'views', 0);
INSERT INTO `registry` VALUES('ViewsUIWizardJumpMenuTestCase', 'class', 'sites/all/modules/views/tests/views_ui.test', 'views', 0);
INSERT INTO `registry` VALUES('ViewsUIWizardMenuTestCase', 'class', 'sites/all/modules/views/tests/views_ui.test', 'views', 0);
INSERT INTO `registry` VALUES('ViewsUIWizardOverrideDisplaysTestCase', 'class', 'sites/all/modules/views/tests/views_ui.test', 'views', 0);
INSERT INTO `registry` VALUES('ViewsUIWizardSortingTestCase', 'class', 'sites/all/modules/views/tests/views_ui.test', 'views', 0);
INSERT INTO `registry` VALUES('ViewsUIWizardTaggedWithTestCase', 'class', 'sites/all/modules/views/tests/views_ui.test', 'views', 0);
INSERT INTO `registry` VALUES('ViewsUpgradeTestCase', 'class', 'sites/all/modules/views/tests/views_upgrade.test', 'views', 0);
INSERT INTO `registry` VALUES('ViewsUserArgumentDefault', 'class', 'sites/all/modules/views/tests/user/views_user_argument_default.test', 'views', 0);
INSERT INTO `registry` VALUES('ViewsUserArgumentValidate', 'class', 'sites/all/modules/views/tests/user/views_user_argument_validate.test', 'views', 0);
INSERT INTO `registry` VALUES('ViewsUserTestCase', 'class', 'sites/all/modules/views/tests/user/views_user.test', 'views', 0);
INSERT INTO `registry` VALUES('ViewsViewTest', 'class', 'sites/all/modules/views/tests/views_view.test', 'views', 0);
INSERT INTO `registry` VALUES('ViewsWizardException', 'class', 'sites/all/modules/views/plugins/views_wizard/views_ui_base_views_wizard.class.php', 'views_ui', 0);
INSERT INTO `registry` VALUES('ViewsWizardInterface', 'interface', 'sites/all/modules/views/plugins/views_wizard/views_ui_base_views_wizard.class.php', 'views_ui', 0);
INSERT INTO `registry` VALUES('views_db_object', 'class', 'sites/all/modules/views/includes/view.inc', 'views', 0);
INSERT INTO `registry` VALUES('views_display', 'class', 'sites/all/modules/views/includes/view.inc', 'views', 0);
INSERT INTO `registry` VALUES('views_handler', 'class', 'sites/all/modules/views/includes/handlers.inc', 'views', 0);
INSERT INTO `registry` VALUES('views_handler_area', 'class', 'sites/all/modules/views/handlers/views_handler_area.inc', 'views', 0);
INSERT INTO `registry` VALUES('views_handler_area_broken', 'class', 'sites/all/modules/views/handlers/views_handler_area.inc', 'views', 0);
INSERT INTO `registry` VALUES('views_handler_area_result', 'class', 'sites/all/modules/views/handlers/views_handler_area_result.inc', 'views', 0);
INSERT INTO `registry` VALUES('views_handler_area_text', 'class', 'sites/all/modules/views/handlers/views_handler_area_text.inc', 'views', 0);
INSERT INTO `registry` VALUES('views_handler_area_text_custom', 'class', 'sites/all/modules/views/handlers/views_handler_area_text_custom.inc', 'views', 0);
INSERT INTO `registry` VALUES('views_handler_area_view', 'class', 'sites/all/modules/views/handlers/views_handler_area_view.inc', 'views', 0);
INSERT INTO `registry` VALUES('views_handler_argument', 'class', 'sites/all/modules/views/handlers/views_handler_argument.inc', 'views', 0);
INSERT INTO `registry` VALUES('views_handler_argument_aggregator_category_cid', 'class', 'sites/all/modules/views/modules/aggregator/views_handler_argument_aggregator_category_cid.inc', 'views', 0);
INSERT INTO `registry` VALUES('views_handler_argument_aggregator_fid', 'class', 'sites/all/modules/views/modules/aggregator/views_handler_argument_aggregator_fid.inc', 'views', 0);
INSERT INTO `registry` VALUES('views_handler_argument_aggregator_iid', 'class', 'sites/all/modules/views/modules/aggregator/views_handler_argument_aggregator_iid.inc', 'views', 0);
INSERT INTO `registry` VALUES('views_handler_argument_broken', 'class', 'sites/all/modules/views/handlers/views_handler_argument.inc', 'views', 0);
INSERT INTO `registry` VALUES('views_handler_argument_comment_user_uid', 'class', 'sites/all/modules/views/modules/comment/views_handler_argument_comment_user_uid.inc', 'views', 0);
INSERT INTO `registry` VALUES('views_handler_argument_date', 'class', 'sites/all/modules/views/handlers/views_handler_argument_date.inc', 'views', 0);
INSERT INTO `registry` VALUES('views_handler_argument_field_list', 'class', 'sites/all/modules/views/modules/field/views_handler_argument_field_list.inc', 'views', 0);
INSERT INTO `registry` VALUES('views_handler_argument_field_list_string', 'class', 'sites/all/modules/views/modules/field/views_handler_argument_field_list_string.inc', 'views', 0);
INSERT INTO `registry` VALUES('views_handler_argument_file_fid', 'class', 'sites/all/modules/views/modules/system/views_handler_argument_file_fid.inc', 'views', 0);
INSERT INTO `registry` VALUES('views_handler_argument_formula', 'class', 'sites/all/modules/views/handlers/views_handler_argument_formula.inc', 'views', 0);
INSERT INTO `registry` VALUES('views_handler_argument_group_by_numeric', 'class', 'sites/all/modules/views/handlers/views_handler_argument_group_by_numeric.inc', 'views', 0);
INSERT INTO `registry` VALUES('views_handler_argument_locale_group', 'class', 'sites/all/modules/views/modules/locale/views_handler_argument_locale_group.inc', 'views', 0);
INSERT INTO `registry` VALUES('views_handler_argument_locale_language', 'class', 'sites/all/modules/views/modules/locale/views_handler_argument_locale_language.inc', 'views', 0);
INSERT INTO `registry` VALUES('views_handler_argument_many_to_one', 'class', 'sites/all/modules/views/handlers/views_handler_argument_many_to_one.inc', 'views', 0);
INSERT INTO `registry` VALUES('views_handler_argument_node_created_day', 'class', 'sites/all/modules/views/modules/node/views_handler_argument_dates_various.inc', 'views', 0);
INSERT INTO `registry` VALUES('views_handler_argument_node_created_fulldate', 'class', 'sites/all/modules/views/modules/node/views_handler_argument_dates_various.inc', 'views', 0);
INSERT INTO `registry` VALUES('views_handler_argument_node_created_month', 'class', 'sites/all/modules/views/modules/node/views_handler_argument_dates_various.inc', 'views', 0);
INSERT INTO `registry` VALUES('views_handler_argument_node_created_week', 'class', 'sites/all/modules/views/modules/node/views_handler_argument_dates_various.inc', 'views', 0);
INSERT INTO `registry` VALUES('views_handler_argument_node_created_year', 'class', 'sites/all/modules/views/modules/node/views_handler_argument_dates_various.inc', 'views', 0);
INSERT INTO `registry` VALUES('views_handler_argument_node_created_year_month', 'class', 'sites/all/modules/views/modules/node/views_handler_argument_dates_various.inc', 'views', 0);
INSERT INTO `registry` VALUES('views_handler_argument_node_language', 'class', 'sites/all/modules/views/modules/node/views_handler_argument_node_language.inc', 'views', 0);
INSERT INTO `registry` VALUES('views_handler_argument_node_nid', 'class', 'sites/all/modules/views/modules/node/views_handler_argument_node_nid.inc', 'views', 0);
INSERT INTO `registry` VALUES('views_handler_argument_node_tnid', 'class', 'sites/all/modules/views/modules/translation/views_handler_argument_node_tnid.inc', 'views', 0);
INSERT INTO `registry` VALUES('views_handler_argument_node_type', 'class', 'sites/all/modules/views/modules/node/views_handler_argument_node_type.inc', 'views', 0);
INSERT INTO `registry` VALUES('views_handler_argument_node_uid_revision', 'class', 'sites/all/modules/views/modules/node/views_handler_argument_node_uid_revision.inc', 'views', 0);
INSERT INTO `registry` VALUES('views_handler_argument_node_vid', 'class', 'sites/all/modules/views/modules/node/views_handler_argument_node_vid.inc', 'views', 0);
INSERT INTO `registry` VALUES('views_handler_argument_null', 'class', 'sites/all/modules/views/handlers/views_handler_argument_null.inc', 'views', 0);
INSERT INTO `registry` VALUES('views_handler_argument_numeric', 'class', 'sites/all/modules/views/handlers/views_handler_argument_numeric.inc', 'views', 0);
INSERT INTO `registry` VALUES('views_handler_argument_search', 'class', 'sites/all/modules/views/modules/search/views_handler_argument_search.inc', 'views', 0);
INSERT INTO `registry` VALUES('views_handler_argument_string', 'class', 'sites/all/modules/views/handlers/views_handler_argument_string.inc', 'views', 0);
INSERT INTO `registry` VALUES('views_handler_argument_taxonomy', 'class', 'sites/all/modules/views/modules/taxonomy/views_handler_argument_taxonomy.inc', 'views', 0);
INSERT INTO `registry` VALUES('views_handler_argument_term_node_tid', 'class', 'sites/all/modules/views/modules/taxonomy/views_handler_argument_term_node_tid.inc', 'views', 0);
INSERT INTO `registry` VALUES('views_handler_argument_term_node_tid_depth', 'class', 'sites/all/modules/views/modules/taxonomy/views_handler_argument_term_node_tid_depth.inc', 'views', 0);
INSERT INTO `registry` VALUES('views_handler_argument_term_node_tid_depth_modifier', 'class', 'sites/all/modules/views/modules/taxonomy/views_handler_argument_term_node_tid_depth_modifier.inc', 'views', 0);
INSERT INTO `registry` VALUES('views_handler_argument_tracker_comment_user_uid', 'class', 'sites/all/modules/views/modules/tracker/views_handler_argument_tracker_comment_user_uid.inc', 'views', 0);
INSERT INTO `registry` VALUES('views_handler_argument_users_roles_rid', 'class', 'sites/all/modules/views/modules/user/views_handler_argument_users_roles_rid.inc', 'views', 0);
INSERT INTO `registry` VALUES('views_handler_argument_user_uid', 'class', 'sites/all/modules/views/modules/user/views_handler_argument_user_uid.inc', 'views', 0);
INSERT INTO `registry` VALUES('views_handler_argument_vocabulary_machine_name', 'class', 'sites/all/modules/views/modules/taxonomy/views_handler_argument_vocabulary_machine_name.inc', 'views', 0);
INSERT INTO `registry` VALUES('views_handler_argument_vocabulary_vid', 'class', 'sites/all/modules/views/modules/taxonomy/views_handler_argument_vocabulary_vid.inc', 'views', 0);
INSERT INTO `registry` VALUES('views_handler_field', 'class', 'sites/all/modules/views/handlers/views_handler_field.inc', 'views', 0);
INSERT INTO `registry` VALUES('views_handler_field_accesslog_path', 'class', 'sites/all/modules/views/modules/statistics/views_handler_field_accesslog_path.inc', 'views', 0);
INSERT INTO `registry` VALUES('views_handler_field_aggregator_category', 'class', 'sites/all/modules/views/modules/aggregator/views_handler_field_aggregator_category.inc', 'views', 0);
INSERT INTO `registry` VALUES('views_handler_field_aggregator_title_link', 'class', 'sites/all/modules/views/modules/aggregator/views_handler_field_aggregator_title_link.inc', 'views', 0);
INSERT INTO `registry` VALUES('views_handler_field_aggregator_xss', 'class', 'sites/all/modules/views/modules/aggregator/views_handler_field_aggregator_xss.inc', 'views', 0);
INSERT INTO `registry` VALUES('views_handler_field_boolean', 'class', 'sites/all/modules/views/handlers/views_handler_field_boolean.inc', 'views', 0);
INSERT INTO `registry` VALUES('views_handler_field_broken', 'class', 'sites/all/modules/views/handlers/views_handler_field.inc', 'views', 0);
INSERT INTO `registry` VALUES('views_handler_field_comment', 'class', 'sites/all/modules/views/modules/comment/views_handler_field_comment.inc', 'views', 0);
INSERT INTO `registry` VALUES('views_handler_field_comment_depth', 'class', 'sites/all/modules/views/modules/comment/views_handler_field_comment_depth.inc', 'views', 0);
INSERT INTO `registry` VALUES('views_handler_field_comment_link', 'class', 'sites/all/modules/views/modules/comment/views_handler_field_comment_link.inc', 'views', 0);
INSERT INTO `registry` VALUES('views_handler_field_comment_link_approve', 'class', 'sites/all/modules/views/modules/comment/views_handler_field_comment_link_approve.inc', 'views', 0);
INSERT INTO `registry` VALUES('views_handler_field_comment_link_delete', 'class', 'sites/all/modules/views/modules/comment/views_handler_field_comment_link_delete.inc', 'views', 0);
INSERT INTO `registry` VALUES('views_handler_field_comment_link_edit', 'class', 'sites/all/modules/views/modules/comment/views_handler_field_comment_link_edit.inc', 'views', 0);
INSERT INTO `registry` VALUES('views_handler_field_comment_link_reply', 'class', 'sites/all/modules/views/modules/comment/views_handler_field_comment_link_reply.inc', 'views', 0);
INSERT INTO `registry` VALUES('views_handler_field_comment_node_link', 'class', 'sites/all/modules/views/modules/comment/views_handler_field_comment_node_link.inc', 'views', 0);
INSERT INTO `registry` VALUES('views_handler_field_comment_username', 'class', 'sites/all/modules/views/modules/comment/views_handler_field_comment_username.inc', 'views', 0);
INSERT INTO `registry` VALUES('views_handler_field_contact_link', 'class', 'sites/all/modules/views/modules/contact/views_handler_field_contact_link.inc', 'views', 0);
INSERT INTO `registry` VALUES('views_handler_field_contextual_links', 'class', 'sites/all/modules/views/handlers/views_handler_field_contextual_links.inc', 'views', 0);
INSERT INTO `registry` VALUES('views_handler_field_counter', 'class', 'sites/all/modules/views/handlers/views_handler_field_counter.inc', 'views', 0);
INSERT INTO `registry` VALUES('views_handler_field_custom', 'class', 'sites/all/modules/views/handlers/views_handler_field_custom.inc', 'views', 0);
INSERT INTO `registry` VALUES('views_handler_field_date', 'class', 'sites/all/modules/views/handlers/views_handler_field_date.inc', 'views', 0);
INSERT INTO `registry` VALUES('views_handler_field_entity', 'class', 'sites/all/modules/views/handlers/views_handler_field_entity.inc', 'views', 0);
INSERT INTO `registry` VALUES('views_handler_field_field', 'class', 'sites/all/modules/views/modules/field/views_handler_field_field.inc', 'views', 0);
INSERT INTO `registry` VALUES('views_handler_field_file', 'class', 'sites/all/modules/views/modules/system/views_handler_field_file.inc', 'views', 0);
INSERT INTO `registry` VALUES('views_handler_field_file_extension', 'class', 'sites/all/modules/views/modules/system/views_handler_field_file_extension.inc', 'views', 0);
INSERT INTO `registry` VALUES('views_handler_field_file_filemime', 'class', 'sites/all/modules/views/modules/system/views_handler_field_file_filemime.inc', 'views', 0);
INSERT INTO `registry` VALUES('views_handler_field_file_size', 'class', 'sites/all/modules/views/handlers/views_handler_field.inc', 'views', 0);
INSERT INTO `registry` VALUES('views_handler_field_file_status', 'class', 'sites/all/modules/views/modules/system/views_handler_field_file_status.inc', 'views', 0);
INSERT INTO `registry` VALUES('views_handler_field_file_uri', 'class', 'sites/all/modules/views/modules/system/views_handler_field_file_uri.inc', 'views', 0);
INSERT INTO `registry` VALUES('views_handler_field_filter_format_name', 'class', 'sites/all/modules/views/modules/filter/views_handler_field_filter_format_name.inc', 'views', 0);
INSERT INTO `registry` VALUES('views_handler_field_history_user_timestamp', 'class', 'sites/all/modules/views/modules/node/views_handler_field_history_user_timestamp.inc', 'views', 0);
INSERT INTO `registry` VALUES('views_handler_field_last_comment_timestamp', 'class', 'sites/all/modules/views/modules/comment/views_handler_field_last_comment_timestamp.inc', 'views', 0);
INSERT INTO `registry` VALUES('views_handler_field_locale_group', 'class', 'sites/all/modules/views/modules/locale/views_handler_field_locale_group.inc', 'views', 0);
INSERT INTO `registry` VALUES('views_handler_field_locale_language', 'class', 'sites/all/modules/views/modules/locale/views_handler_field_locale_language.inc', 'views', 0);
INSERT INTO `registry` VALUES('views_handler_field_locale_link_edit', 'class', 'sites/all/modules/views/modules/locale/views_handler_field_locale_link_edit.inc', 'views', 0);
INSERT INTO `registry` VALUES('views_handler_field_machine_name', 'class', 'sites/all/modules/views/handlers/views_handler_field_machine_name.inc', 'views', 0);
INSERT INTO `registry` VALUES('views_handler_field_markup', 'class', 'sites/all/modules/views/handlers/views_handler_field_markup.inc', 'views', 0);
INSERT INTO `registry` VALUES('views_handler_field_math', 'class', 'sites/all/modules/views/handlers/views_handler_field_math.inc', 'views', 0);
INSERT INTO `registry` VALUES('views_handler_field_ncs_last_comment_name', 'class', 'sites/all/modules/views/modules/comment/views_handler_field_ncs_last_comment_name.inc', 'views', 0);
INSERT INTO `registry` VALUES('views_handler_field_ncs_last_updated', 'class', 'sites/all/modules/views/modules/comment/views_handler_field_ncs_last_updated.inc', 'views', 0);
INSERT INTO `registry` VALUES('views_handler_field_node', 'class', 'sites/all/modules/views/modules/node/views_handler_field_node.inc', 'views', 0);
INSERT INTO `registry` VALUES('views_handler_field_node_comment', 'class', 'sites/all/modules/views/modules/comment/views_handler_field_node_comment.inc', 'views', 0);
INSERT INTO `registry` VALUES('views_handler_field_node_language', 'class', 'sites/all/modules/views/modules/locale/views_handler_field_node_language.inc', 'views', 0);
INSERT INTO `registry` VALUES('views_handler_field_node_link', 'class', 'sites/all/modules/views/modules/node/views_handler_field_node_link.inc', 'views', 0);
INSERT INTO `registry` VALUES('views_handler_field_node_link_delete', 'class', 'sites/all/modules/views/modules/node/views_handler_field_node_link_delete.inc', 'views', 0);
INSERT INTO `registry` VALUES('views_handler_field_node_link_edit', 'class', 'sites/all/modules/views/modules/node/views_handler_field_node_link_edit.inc', 'views', 0);
INSERT INTO `registry` VALUES('views_handler_field_node_link_translate', 'class', 'sites/all/modules/views/modules/translation/views_handler_field_node_link_translate.inc', 'views', 0);
INSERT INTO `registry` VALUES('views_handler_field_node_new_comments', 'class', 'sites/all/modules/views/modules/comment/views_handler_field_node_new_comments.inc', 'views', 0);
INSERT INTO `registry` VALUES('views_handler_field_node_path', 'class', 'sites/all/modules/views/modules/node/views_handler_field_node_path.inc', 'views', 0);
INSERT INTO `registry` VALUES('views_handler_field_node_revision', 'class', 'sites/all/modules/views/modules/node/views_handler_field_node_revision.inc', 'views', 0);
INSERT INTO `registry` VALUES('views_handler_field_node_revision_link', 'class', 'sites/all/modules/views/modules/node/views_handler_field_node_revision_link.inc', 'views', 0);
INSERT INTO `registry` VALUES('views_handler_field_node_revision_link_delete', 'class', 'sites/all/modules/views/modules/node/views_handler_field_node_revision_link_delete.inc', 'views', 0);
INSERT INTO `registry` VALUES('views_handler_field_node_revision_link_revert', 'class', 'sites/all/modules/views/modules/node/views_handler_field_node_revision_link_revert.inc', 'views', 0);
INSERT INTO `registry` VALUES('views_handler_field_node_translation_link', 'class', 'sites/all/modules/views/modules/translation/views_handler_field_node_translation_link.inc', 'views', 0);
INSERT INTO `registry` VALUES('views_handler_field_node_type', 'class', 'sites/all/modules/views/modules/node/views_handler_field_node_type.inc', 'views', 0);
INSERT INTO `registry` VALUES('views_handler_field_numeric', 'class', 'sites/all/modules/views/handlers/views_handler_field_numeric.inc', 'views', 0);
INSERT INTO `registry` VALUES('views_handler_field_prerender_list', 'class', 'sites/all/modules/views/handlers/views_handler_field_prerender_list.inc', 'views', 0);
INSERT INTO `registry` VALUES('views_handler_field_profile_date', 'class', 'sites/all/modules/views/modules/profile/views_handler_field_profile_date.inc', 'views', 0);
INSERT INTO `registry` VALUES('views_handler_field_profile_list', 'class', 'sites/all/modules/views/modules/profile/views_handler_field_profile_list.inc', 'views', 0);
INSERT INTO `registry` VALUES('views_handler_field_search_score', 'class', 'sites/all/modules/views/modules/search/views_handler_field_search_score.inc', 'views', 0);
INSERT INTO `registry` VALUES('views_handler_field_serialized', 'class', 'sites/all/modules/views/handlers/views_handler_field_serialized.inc', 'views', 0);
INSERT INTO `registry` VALUES('views_handler_field_taxonomy', 'class', 'sites/all/modules/views/modules/taxonomy/views_handler_field_taxonomy.inc', 'views', 0);
INSERT INTO `registry` VALUES('views_handler_field_term_link_edit', 'class', 'sites/all/modules/views/modules/taxonomy/views_handler_field_term_link_edit.inc', 'views', 0);
INSERT INTO `registry` VALUES('views_handler_field_term_node_tid', 'class', 'sites/all/modules/views/modules/taxonomy/views_handler_field_term_node_tid.inc', 'views', 0);
INSERT INTO `registry` VALUES('views_handler_field_time_interval', 'class', 'sites/all/modules/views/handlers/views_handler_field_time_interval.inc', 'views', 0);
INSERT INTO `registry` VALUES('views_handler_field_url', 'class', 'sites/all/modules/views/handlers/views_handler_field_url.inc', 'views', 0);
INSERT INTO `registry` VALUES('views_handler_field_user', 'class', 'sites/all/modules/views/modules/user/views_handler_field_user.inc', 'views', 0);
INSERT INTO `registry` VALUES('views_handler_field_user_language', 'class', 'sites/all/modules/views/modules/user/views_handler_field_user_language.inc', 'views', 0);
INSERT INTO `registry` VALUES('views_handler_field_user_link', 'class', 'sites/all/modules/views/modules/user/views_handler_field_user_link.inc', 'views', 0);
INSERT INTO `registry` VALUES('views_handler_field_user_link_cancel', 'class', 'sites/all/modules/views/modules/user/views_handler_field_user_link_cancel.inc', 'views', 0);
INSERT INTO `registry` VALUES('views_handler_field_user_link_edit', 'class', 'sites/all/modules/views/modules/user/views_handler_field_user_link_edit.inc', 'views', 0);
INSERT INTO `registry` VALUES('views_handler_field_user_mail', 'class', 'sites/all/modules/views/modules/user/views_handler_field_user_mail.inc', 'views', 0);
INSERT INTO `registry` VALUES('views_handler_field_user_name', 'class', 'sites/all/modules/views/modules/user/views_handler_field_user_name.inc', 'views', 0);
INSERT INTO `registry` VALUES('views_handler_field_user_permissions', 'class', 'sites/all/modules/views/modules/user/views_handler_field_user_permissions.inc', 'views', 0);
INSERT INTO `registry` VALUES('views_handler_field_user_picture', 'class', 'sites/all/modules/views/modules/user/views_handler_field_user_picture.inc', 'views', 0);
INSERT INTO `registry` VALUES('views_handler_field_user_roles', 'class', 'sites/all/modules/views/modules/user/views_handler_field_user_roles.inc', 'views', 0);
INSERT INTO `registry` VALUES('views_handler_field_xss', 'class', 'sites/all/modules/views/handlers/views_handler_field.inc', 'views', 0);
INSERT INTO `registry` VALUES('views_handler_filter', 'class', 'sites/all/modules/views/handlers/views_handler_filter.inc', 'views', 0);
INSERT INTO `registry` VALUES('views_handler_filter_aggregator_category_cid', 'class', 'sites/all/modules/views/modules/aggregator/views_handler_filter_aggregator_category_cid.inc', 'views', 0);
INSERT INTO `registry` VALUES('views_handler_filter_boolean_operator', 'class', 'sites/all/modules/views/handlers/views_handler_filter_boolean_operator.inc', 'views', 0);
INSERT INTO `registry` VALUES('views_handler_filter_boolean_operator_string', 'class', 'sites/all/modules/views/handlers/views_handler_filter_boolean_operator_string.inc', 'views', 0);
INSERT INTO `registry` VALUES('views_handler_filter_broken', 'class', 'sites/all/modules/views/handlers/views_handler_filter.inc', 'views', 0);
INSERT INTO `registry` VALUES('views_handler_filter_combine', 'class', 'sites/all/modules/views/handlers/views_handler_filter_combine.inc', 'views', 0);
INSERT INTO `registry` VALUES('views_handler_filter_comment_user_uid', 'class', 'sites/all/modules/views/modules/comment/views_handler_filter_comment_user_uid.inc', 'views', 0);
INSERT INTO `registry` VALUES('views_handler_filter_date', 'class', 'sites/all/modules/views/handlers/views_handler_filter_date.inc', 'views', 0);
INSERT INTO `registry` VALUES('views_handler_filter_entity_bundle', 'class', 'sites/all/modules/views/handlers/views_handler_filter_entity_bundle.inc', 'views', 0);
INSERT INTO `registry` VALUES('views_handler_filter_equality', 'class', 'sites/all/modules/views/handlers/views_handler_filter_equality.inc', 'views', 0);
INSERT INTO `registry` VALUES('views_handler_filter_field_list', 'class', 'sites/all/modules/views/modules/field/views_handler_filter_field_list.inc', 'views', 0);
INSERT INTO `registry` VALUES('views_handler_filter_file_status', 'class', 'sites/all/modules/views/modules/system/views_handler_filter_file_status.inc', 'views', 0);
INSERT INTO `registry` VALUES('views_handler_filter_group_by_numeric', 'class', 'sites/all/modules/views/handlers/views_handler_filter_group_by_numeric.inc', 'views', 0);
INSERT INTO `registry` VALUES('views_handler_filter_history_user_timestamp', 'class', 'sites/all/modules/views/modules/node/views_handler_filter_history_user_timestamp.inc', 'views', 0);
INSERT INTO `registry` VALUES('views_handler_filter_in_operator', 'class', 'sites/all/modules/views/handlers/views_handler_filter_in_operator.inc', 'views', 0);
INSERT INTO `registry` VALUES('views_handler_filter_locale_group', 'class', 'sites/all/modules/views/modules/locale/views_handler_filter_locale_group.inc', 'views', 0);
INSERT INTO `registry` VALUES('views_handler_filter_locale_language', 'class', 'sites/all/modules/views/modules/locale/views_handler_filter_locale_language.inc', 'views', 0);
INSERT INTO `registry` VALUES('views_handler_filter_locale_version', 'class', 'sites/all/modules/views/modules/locale/views_handler_filter_locale_version.inc', 'views', 0);
INSERT INTO `registry` VALUES('views_handler_filter_many_to_one', 'class', 'sites/all/modules/views/handlers/views_handler_filter_many_to_one.inc', 'views', 0);
INSERT INTO `registry` VALUES('views_handler_filter_ncs_last_updated', 'class', 'sites/all/modules/views/modules/comment/views_handler_filter_ncs_last_updated.inc', 'views', 0);
INSERT INTO `registry` VALUES('views_handler_filter_node_access', 'class', 'sites/all/modules/views/modules/node/views_handler_filter_node_access.inc', 'views', 0);
INSERT INTO `registry` VALUES('views_handler_filter_node_comment', 'class', 'sites/all/modules/views/modules/comment/views_handler_filter_node_comment.inc', 'views', 0);
INSERT INTO `registry` VALUES('views_handler_filter_node_language', 'class', 'sites/all/modules/views/modules/locale/views_handler_filter_node_language.inc', 'views', 0);
INSERT INTO `registry` VALUES('views_handler_filter_node_status', 'class', 'sites/all/modules/views/modules/node/views_handler_filter_node_status.inc', 'views', 0);
INSERT INTO `registry` VALUES('views_handler_filter_node_tnid', 'class', 'sites/all/modules/views/modules/translation/views_handler_filter_node_tnid.inc', 'views', 0);
INSERT INTO `registry` VALUES('views_handler_filter_node_tnid_child', 'class', 'sites/all/modules/views/modules/translation/views_handler_filter_node_tnid_child.inc', 'views', 0);
INSERT INTO `registry` VALUES('views_handler_filter_node_type', 'class', 'sites/all/modules/views/modules/node/views_handler_filter_node_type.inc', 'views', 0);
INSERT INTO `registry` VALUES('views_handler_filter_node_uid_revision', 'class', 'sites/all/modules/views/modules/node/views_handler_filter_node_uid_revision.inc', 'views', 0);
INSERT INTO `registry` VALUES('views_handler_filter_numeric', 'class', 'sites/all/modules/views/handlers/views_handler_filter_numeric.inc', 'views', 0);
INSERT INTO `registry` VALUES('views_handler_filter_profile_selection', 'class', 'sites/all/modules/views/modules/profile/views_handler_filter_profile_selection.inc', 'views', 0);
INSERT INTO `registry` VALUES('views_handler_filter_search', 'class', 'sites/all/modules/views/modules/search/views_handler_filter_search.inc', 'views', 0);
INSERT INTO `registry` VALUES('views_handler_filter_string', 'class', 'sites/all/modules/views/handlers/views_handler_filter_string.inc', 'views', 0);
INSERT INTO `registry` VALUES('views_handler_filter_system_type', 'class', 'sites/all/modules/views/modules/system/views_handler_filter_system_type.inc', 'views', 0);
INSERT INTO `registry` VALUES('views_handler_filter_term_node_tid', 'class', 'sites/all/modules/views/modules/taxonomy/views_handler_filter_term_node_tid.inc', 'views', 0);
INSERT INTO `registry` VALUES('views_handler_filter_term_node_tid_depth', 'class', 'sites/all/modules/views/modules/taxonomy/views_handler_filter_term_node_tid_depth.inc', 'views', 0);
INSERT INTO `registry` VALUES('views_handler_filter_tracker_boolean_operator', 'class', 'sites/all/modules/views/modules/tracker/views_handler_filter_tracker_boolean_operator.inc', 'views', 0);
INSERT INTO `registry` VALUES('views_handler_filter_tracker_comment_user_uid', 'class', 'sites/all/modules/views/modules/tracker/views_handler_filter_tracker_comment_user_uid.inc', 'views', 0);
INSERT INTO `registry` VALUES('views_handler_filter_user_current', 'class', 'sites/all/modules/views/modules/user/views_handler_filter_user_current.inc', 'views', 0);
INSERT INTO `registry` VALUES('views_handler_filter_user_name', 'class', 'sites/all/modules/views/modules/user/views_handler_filter_user_name.inc', 'views', 0);
INSERT INTO `registry` VALUES('views_handler_filter_user_permissions', 'class', 'sites/all/modules/views/modules/user/views_handler_filter_user_permissions.inc', 'views', 0);
INSERT INTO `registry` VALUES('views_handler_filter_user_roles', 'class', 'sites/all/modules/views/modules/user/views_handler_filter_user_roles.inc', 'views', 0);
INSERT INTO `registry` VALUES('views_handler_filter_vocabulary_machine_name', 'class', 'sites/all/modules/views/modules/taxonomy/views_handler_filter_vocabulary_machine_name.inc', 'views', 0);
INSERT INTO `registry` VALUES('views_handler_filter_vocabulary_vid', 'class', 'sites/all/modules/views/modules/taxonomy/views_handler_filter_vocabulary_vid.inc', 'views', 0);
INSERT INTO `registry` VALUES('views_handler_relationship', 'class', 'sites/all/modules/views/handlers/views_handler_relationship.inc', 'views', 0);
INSERT INTO `registry` VALUES('views_handler_relationship_broken', 'class', 'sites/all/modules/views/handlers/views_handler_relationship.inc', 'views', 0);
INSERT INTO `registry` VALUES('views_handler_relationship_entity_reverse', 'class', 'sites/all/modules/views/modules/field/views_handler_relationship_entity_reverse.inc', 'views', 0);
INSERT INTO `registry` VALUES('views_handler_relationship_groupwise_max', 'class', 'sites/all/modules/views/handlers/views_handler_relationship_groupwise_max.inc', 'views', 0);
INSERT INTO `registry` VALUES('views_handler_relationship_node_term_data', 'class', 'sites/all/modules/views/modules/taxonomy/views_handler_relationship_node_term_data.inc', 'views', 0);
INSERT INTO `registry` VALUES('views_handler_relationship_translation', 'class', 'sites/all/modules/views/modules/translation/views_handler_relationship_translation.inc', 'views', 0);
INSERT INTO `registry` VALUES('views_handler_sort', 'class', 'sites/all/modules/views/handlers/views_handler_sort.inc', 'views', 0);
INSERT INTO `registry` VALUES('views_handler_sort_broken', 'class', 'sites/all/modules/views/handlers/views_handler_sort.inc', 'views', 0);
INSERT INTO `registry` VALUES('views_handler_sort_comment_thread', 'class', 'sites/all/modules/views/modules/comment/views_handler_sort_comment_thread.inc', 'views', 0);
INSERT INTO `registry` VALUES('views_handler_sort_date', 'class', 'sites/all/modules/views/handlers/views_handler_sort_date.inc', 'views', 0);
INSERT INTO `registry` VALUES('views_handler_sort_group_by_numeric', 'class', 'sites/all/modules/views/handlers/views_handler_sort_group_by_numeric.inc', 'views', 0);
INSERT INTO `registry` VALUES('views_handler_sort_menu_hierarchy', 'class', 'sites/all/modules/views/handlers/views_handler_sort_menu_hierarchy.inc', 'views', 0);
INSERT INTO `registry` VALUES('views_handler_sort_ncs_last_comment_name', 'class', 'sites/all/modules/views/modules/comment/views_handler_sort_ncs_last_comment_name.inc', 'views', 0);
INSERT INTO `registry` VALUES('views_handler_sort_ncs_last_updated', 'class', 'sites/all/modules/views/modules/comment/views_handler_sort_ncs_last_updated.inc', 'views', 0);
INSERT INTO `registry` VALUES('views_handler_sort_random', 'class', 'sites/all/modules/views/handlers/views_handler_sort_random.inc', 'views', 0);
INSERT INTO `registry` VALUES('views_handler_sort_search_score', 'class', 'sites/all/modules/views/modules/search/views_handler_sort_search_score.inc', 'views', 0);
INSERT INTO `registry` VALUES('views_join', 'class', 'sites/all/modules/views/includes/handlers.inc', 'views', 0);
INSERT INTO `registry` VALUES('views_join_subquery', 'class', 'sites/all/modules/views/includes/handlers.inc', 'views', 0);
INSERT INTO `registry` VALUES('views_many_to_one_helper', 'class', 'sites/all/modules/views/includes/handlers.inc', 'views', 0);
INSERT INTO `registry` VALUES('views_object', 'class', 'sites/all/modules/views/includes/base.inc', 'views', 0);
INSERT INTO `registry` VALUES('views_plugin', 'class', 'sites/all/modules/views/includes/plugins.inc', 'views', 0);
INSERT INTO `registry` VALUES('views_plugin_access', 'class', 'sites/all/modules/views/plugins/views_plugin_access.inc', 'views', 0);
INSERT INTO `registry` VALUES('views_plugin_access_none', 'class', 'sites/all/modules/views/plugins/views_plugin_access_none.inc', 'views', 0);
INSERT INTO `registry` VALUES('views_plugin_access_perm', 'class', 'sites/all/modules/views/plugins/views_plugin_access_perm.inc', 'views', 0);
INSERT INTO `registry` VALUES('views_plugin_access_role', 'class', 'sites/all/modules/views/plugins/views_plugin_access_role.inc', 'views', 0);
INSERT INTO `registry` VALUES('views_plugin_argument_default', 'class', 'sites/all/modules/views/plugins/views_plugin_argument_default.inc', 'views', 0);
INSERT INTO `registry` VALUES('views_plugin_argument_default_book_root', 'class', 'sites/all/modules/views/modules/book/views_plugin_argument_default_book_root.inc', 'views', 0);
INSERT INTO `registry` VALUES('views_plugin_argument_default_current_user', 'class', 'sites/all/modules/views/modules/user/views_plugin_argument_default_current_user.inc', 'views', 0);
INSERT INTO `registry` VALUES('views_plugin_argument_default_fixed', 'class', 'sites/all/modules/views/plugins/views_plugin_argument_default_fixed.inc', 'views', 0);
INSERT INTO `registry` VALUES('views_plugin_argument_default_node', 'class', 'sites/all/modules/views/modules/node/views_plugin_argument_default_node.inc', 'views', 0);
INSERT INTO `registry` VALUES('views_plugin_argument_default_php', 'class', 'sites/all/modules/views/plugins/views_plugin_argument_default_php.inc', 'views', 0);
INSERT INTO `registry` VALUES('views_plugin_argument_default_raw', 'class', 'sites/all/modules/views/plugins/views_plugin_argument_default_raw.inc', 'views', 0);
INSERT INTO `registry` VALUES('views_plugin_argument_default_taxonomy_tid', 'class', 'sites/all/modules/views/modules/taxonomy/views_plugin_argument_default_taxonomy_tid.inc', 'views', 0);
INSERT INTO `registry` VALUES('views_plugin_argument_default_user', 'class', 'sites/all/modules/views/modules/user/views_plugin_argument_default_user.inc', 'views', 0);
INSERT INTO `registry` VALUES('views_plugin_argument_validate', 'class', 'sites/all/modules/views/plugins/views_plugin_argument_validate.inc', 'views', 0);
INSERT INTO `registry` VALUES('views_plugin_argument_validate_node', 'class', 'sites/all/modules/views/modules/node/views_plugin_argument_validate_node.inc', 'views', 0);
INSERT INTO `registry` VALUES('views_plugin_argument_validate_numeric', 'class', 'sites/all/modules/views/plugins/views_plugin_argument_validate_numeric.inc', 'views', 0);
INSERT INTO `registry` VALUES('views_plugin_argument_validate_php', 'class', 'sites/all/modules/views/plugins/views_plugin_argument_validate_php.inc', 'views', 0);
INSERT INTO `registry` VALUES('views_plugin_argument_validate_taxonomy_term', 'class', 'sites/all/modules/views/modules/taxonomy/views_plugin_argument_validate_taxonomy_term.inc', 'views', 0);
INSERT INTO `registry` VALUES('views_plugin_argument_validate_user', 'class', 'sites/all/modules/views/modules/user/views_plugin_argument_validate_user.inc', 'views', 0);
INSERT INTO `registry` VALUES('views_plugin_cache', 'class', 'sites/all/modules/views/plugins/views_plugin_cache.inc', 'views', 0);
INSERT INTO `registry` VALUES('views_plugin_cache_none', 'class', 'sites/all/modules/views/plugins/views_plugin_cache_none.inc', 'views', 0);
INSERT INTO `registry` VALUES('views_plugin_cache_time', 'class', 'sites/all/modules/views/plugins/views_plugin_cache_time.inc', 'views', 0);
INSERT INTO `registry` VALUES('views_plugin_display', 'class', 'sites/all/modules/views/plugins/views_plugin_display.inc', 'views', 0);
INSERT INTO `registry` VALUES('views_plugin_display_attachment', 'class', 'sites/all/modules/views/plugins/views_plugin_display_attachment.inc', 'views', 0);
INSERT INTO `registry` VALUES('views_plugin_display_block', 'class', 'sites/all/modules/views/plugins/views_plugin_display_block.inc', 'views', 0);
INSERT INTO `registry` VALUES('views_plugin_display_default', 'class', 'sites/all/modules/views/plugins/views_plugin_display_default.inc', 'views', 0);
INSERT INTO `registry` VALUES('views_plugin_display_embed', 'class', 'sites/all/modules/views/plugins/views_plugin_display_embed.inc', 'views', 0);
INSERT INTO `registry` VALUES('views_plugin_display_extender', 'class', 'sites/all/modules/views/plugins/views_plugin_display_extender.inc', 'views', 0);
INSERT INTO `registry` VALUES('views_plugin_display_feed', 'class', 'sites/all/modules/views/plugins/views_plugin_display_feed.inc', 'views', 0);
INSERT INTO `registry` VALUES('views_plugin_display_page', 'class', 'sites/all/modules/views/plugins/views_plugin_display_page.inc', 'views', 0);
INSERT INTO `registry` VALUES('views_plugin_display_services', 'class', 'sites/all/modules/services_views/includes/views/views_plugin_display_services.inc', 'services_views', 0);
INSERT INTO `registry` VALUES('views_plugin_exposed_form', 'class', 'sites/all/modules/views/plugins/views_plugin_exposed_form.inc', 'views', 0);
INSERT INTO `registry` VALUES('views_plugin_exposed_form_basic', 'class', 'sites/all/modules/views/plugins/views_plugin_exposed_form_basic.inc', 'views', 0);
INSERT INTO `registry` VALUES('views_plugin_exposed_form_input_required', 'class', 'sites/all/modules/views/plugins/views_plugin_exposed_form_input_required.inc', 'views', 0);
INSERT INTO `registry` VALUES('views_plugin_localization', 'class', 'sites/all/modules/views/plugins/views_plugin_localization.inc', 'views', 0);
INSERT INTO `registry` VALUES('views_plugin_localization_core', 'class', 'sites/all/modules/views/plugins/views_plugin_localization_core.inc', 'views', 0);
INSERT INTO `registry` VALUES('views_plugin_localization_none', 'class', 'sites/all/modules/views/plugins/views_plugin_localization_none.inc', 'views', 0);
INSERT INTO `registry` VALUES('views_plugin_localization_test', 'class', 'sites/all/modules/views/tests/views_plugin_localization_test.inc', 'views', 0);
INSERT INTO `registry` VALUES('views_plugin_pager', 'class', 'sites/all/modules/views/plugins/views_plugin_pager.inc', 'views', 0);
INSERT INTO `registry` VALUES('views_plugin_pager_full', 'class', 'sites/all/modules/views/plugins/views_plugin_pager_full.inc', 'views', 0);
INSERT INTO `registry` VALUES('views_plugin_pager_mini', 'class', 'sites/all/modules/views/plugins/views_plugin_pager_mini.inc', 'views', 0);
INSERT INTO `registry` VALUES('views_plugin_pager_none', 'class', 'sites/all/modules/views/plugins/views_plugin_pager_none.inc', 'views', 0);
INSERT INTO `registry` VALUES('views_plugin_pager_some', 'class', 'sites/all/modules/views/plugins/views_plugin_pager_some.inc', 'views', 0);
INSERT INTO `registry` VALUES('views_plugin_query', 'class', 'sites/all/modules/views/plugins/views_plugin_query.inc', 'views', 0);
INSERT INTO `registry` VALUES('views_plugin_query_default', 'class', 'sites/all/modules/views/plugins/views_plugin_query_default.inc', 'views', 0);
INSERT INTO `registry` VALUES('views_plugin_row', 'class', 'sites/all/modules/views/plugins/views_plugin_row.inc', 'views', 0);
INSERT INTO `registry` VALUES('views_plugin_row_aggregator_rss', 'class', 'sites/all/modules/views/modules/aggregator/views_plugin_row_aggregator_rss.inc', 'views', 0);
INSERT INTO `registry` VALUES('views_plugin_row_comment_rss', 'class', 'sites/all/modules/views/modules/comment/views_plugin_row_comment_rss.inc', 'views', 0);
INSERT INTO `registry` VALUES('views_plugin_row_comment_view', 'class', 'sites/all/modules/views/modules/comment/views_plugin_row_comment_view.inc', 'views', 0);
INSERT INTO `registry` VALUES('views_plugin_row_fields', 'class', 'sites/all/modules/views/plugins/views_plugin_row_fields.inc', 'views', 0);
INSERT INTO `registry` VALUES('views_plugin_row_node_rss', 'class', 'sites/all/modules/views/modules/node/views_plugin_row_node_rss.inc', 'views', 0);
INSERT INTO `registry` VALUES('views_plugin_row_node_view', 'class', 'sites/all/modules/views/modules/node/views_plugin_row_node_view.inc', 'views', 0);
INSERT INTO `registry` VALUES('views_plugin_row_rss_fields', 'class', 'sites/all/modules/views/plugins/views_plugin_row_rss_fields.inc', 'views', 0);
INSERT INTO `registry` VALUES('views_plugin_row_search_view', 'class', 'sites/all/modules/views/modules/search/views_plugin_row_search_view.inc', 'views', 0);
INSERT INTO `registry` VALUES('views_plugin_row_user_view', 'class', 'sites/all/modules/views/modules/user/views_plugin_row_user_view.inc', 'views', 0);
INSERT INTO `registry` VALUES('views_plugin_style', 'class', 'sites/all/modules/views/plugins/views_plugin_style.inc', 'views', 0);
INSERT INTO `registry` VALUES('views_plugin_style_default', 'class', 'sites/all/modules/views/plugins/views_plugin_style_default.inc', 'views', 0);
INSERT INTO `registry` VALUES('views_plugin_style_grid', 'class', 'sites/all/modules/views/plugins/views_plugin_style_grid.inc', 'views', 0);
INSERT INTO `registry` VALUES('views_plugin_style_jump_menu', 'class', 'sites/all/modules/views/plugins/views_plugin_style_jump_menu.inc', 'views', 0);
INSERT INTO `registry` VALUES('views_plugin_style_list', 'class', 'sites/all/modules/views/plugins/views_plugin_style_list.inc', 'views', 0);
INSERT INTO `registry` VALUES('views_plugin_style_mapping', 'class', 'sites/all/modules/views/plugins/views_plugin_style_mapping.inc', 'views', 0);
INSERT INTO `registry` VALUES('views_plugin_style_rss', 'class', 'sites/all/modules/views/plugins/views_plugin_style_rss.inc', 'views', 0);
INSERT INTO `registry` VALUES('views_plugin_style_summary', 'class', 'sites/all/modules/views/plugins/views_plugin_style_summary.inc', 'views', 0);
INSERT INTO `registry` VALUES('views_plugin_style_summary_jump_menu', 'class', 'sites/all/modules/views/plugins/views_plugin_style_summary_jump_menu.inc', 'views', 0);
INSERT INTO `registry` VALUES('views_plugin_style_summary_unformatted', 'class', 'sites/all/modules/views/plugins/views_plugin_style_summary_unformatted.inc', 'views', 0);
INSERT INTO `registry` VALUES('views_plugin_style_table', 'class', 'sites/all/modules/views/plugins/views_plugin_style_table.inc', 'views', 0);
INSERT INTO `registry` VALUES('views_test_plugin_access_test_dynamic', 'class', 'sites/all/modules/views/tests/test_plugins/views_test_plugin_access_test_dynamic.inc', 'views', 0);
INSERT INTO `registry` VALUES('views_test_plugin_access_test_static', 'class', 'sites/all/modules/views/tests/test_plugins/views_test_plugin_access_test_static.inc', 'views', 0);
INSERT INTO `registry` VALUES('views_test_plugin_style_test_mapping', 'class', 'sites/all/modules/views/tests/test_plugins/views_test_plugin_style_test_mapping.inc', 'views', 0);
INSERT INTO `registry` VALUES('views_ui', 'class', 'sites/all/modules/views/plugins/export_ui/views_ui.class.php', 'views_ui', 0);
INSERT INTO `registry` VALUES('WysiwygProfileController', 'class', 'sites/all/modules/wysiwyg/wysiwyg.module', 'wysiwyg', 0);

-- --------------------------------------------------------

--
-- Table structure for table `registry_file`
--

CREATE TABLE `registry_file` (
  `filename` varchar(255) NOT NULL COMMENT 'Path to the file.',
  `hash` varchar(64) NOT NULL COMMENT 'sha-256 hash of the file’s contents when last parsed.',
  PRIMARY KEY  (`filename`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Files parsed to build the registry.';

--
-- Dumping data for table `registry_file`
--

INSERT INTO `registry_file` VALUES('includes/actions.inc', 'f36b066681463c7dfe189e0430cb1a89bf66f7e228cbb53cdfcd93987193f759');
INSERT INTO `registry_file` VALUES('includes/ajax.inc', '8328ec7441a0c101c1b39ba8d415c1d951b400887d8b29d2831210ae207f86eb');
INSERT INTO `registry_file` VALUES('includes/archiver.inc', 'bdbb21b712a62f6b913590b609fd17cd9f3c3b77c0d21f68e71a78427ed2e3e9');
INSERT INTO `registry_file` VALUES('includes/authorize.inc', '6d64d8c21aa01eb12fc29918732e4df6b871ed06e5d41373cb95c197ed661d13');
INSERT INTO `registry_file` VALUES('includes/batch.inc', '059da9e36e1f3717f27840aae73f10dea7d6c8daf16f6520401cc1ca3b4c0388');
INSERT INTO `registry_file` VALUES('includes/batch.queue.inc', '554b2e92e1dad0f7fd5a19cb8dff7e109f10fbe2441a5692d076338ec908de0f');
INSERT INTO `registry_file` VALUES('includes/bootstrap.inc', '08aa17d5148732c6294ad95c3ff1ecf223199cde61439ec5fdb1ca778e971c96');
INSERT INTO `registry_file` VALUES('includes/cache-install.inc', 'e7ed123c5805703c84ad2cce9c1ca46b3ce8caeeea0d8ef39a3024a4ab95fa0e');
INSERT INTO `registry_file` VALUES('includes/cache.inc', 'c9d3df7ff9807bb4421d66b4579c2ef5ca4d74954a8184bd04881d179f22ccb2');
INSERT INTO `registry_file` VALUES('includes/common.inc', 'db5346629b64f46f3a89738fd688d6a8e9ba847edfbd14319a4d63c4bcdb7130');
INSERT INTO `registry_file` VALUES('includes/database/database.inc', '1597142a1fbd6fcff24f2bb92805a1c98b7bc36520cc68007bc7383effcaf890');
INSERT INTO `registry_file` VALUES('includes/database/log.inc', '9feb5a17ae2fabcf26a96d2a634ba73da501f7bcfc3599a693d916a6971d00d1');
INSERT INTO `registry_file` VALUES('includes/database/mysql/database.inc', '8d3a784845064385ccdce8a66860f3177d52207df83d9735c0d72c9703dd258e');
INSERT INTO `registry_file` VALUES('includes/database/mysql/install.inc', '6ae316941f771732fbbabed7e1d6b4cbb41b1f429dd097d04b3345aa15e461a0');
INSERT INTO `registry_file` VALUES('includes/database/mysql/query.inc', '7d9ea18a7ff04b7aab6210abbd0313cb53325c19a47ff8ed6c0e591c6e7149c2');
INSERT INTO `registry_file` VALUES('includes/database/mysql/schema.inc', 'd8d3904ea9c23a526c2f2a7acc8ba870b31c378aac2eb53e2e41a73c6209c5bd');
INSERT INTO `registry_file` VALUES('includes/database/pgsql/database.inc', '56726100fd44f461a04886c590c9c472cc2b2a1b92eb26c7674bf3821a76bb64');
INSERT INTO `registry_file` VALUES('includes/database/pgsql/install.inc', '585b80c5bbd6f134bff60d06397f15154657a577d4da8d1b181858905f09dea5');
INSERT INTO `registry_file` VALUES('includes/database/pgsql/query.inc', 'cb4c84f8f1ffc73098ed71137248dcd078a505a7530e60d979d74b3a3cdaa658');
INSERT INTO `registry_file` VALUES('includes/database/pgsql/schema.inc', '8fd647e4557522283caef63e528c6e403fc0751a46e94aac867a281af85eac27');
INSERT INTO `registry_file` VALUES('includes/database/pgsql/select.inc', 'fd4bba7887c1dc6abc8f080fc3a76c01d92ea085434e355dc1ecb50d8743c22d');
INSERT INTO `registry_file` VALUES('includes/database/prefetch.inc', 'b5b207a66a69ecb52ee4f4459af16a7b5eabedc87254245f37cc33bebb61c0fb');
INSERT INTO `registry_file` VALUES('includes/database/query.inc', 'dad26c5d42eda178f8a858194a912fe5df2b7091bd038b23af26aee249166c76');
INSERT INTO `registry_file` VALUES('includes/database/schema.inc', '7eb7251f331109757173353263d1031493c1198ae17a165a6f5a03d3f14f93e7');
INSERT INTO `registry_file` VALUES('includes/database/select.inc', '1c74fa55c7721a704f5ef3389032604bf7a60fced15c40d844aee3e1cead7dc6');
INSERT INTO `registry_file` VALUES('includes/database/sqlite/database.inc', 'ed2b9981794239cdad2cd04cf4bcdc896ad4d6b66179a4fa487b0d1ec2150a10');
INSERT INTO `registry_file` VALUES('includes/database/sqlite/install.inc', '381f3db8c59837d961978ba3097bb6443534ed1659fd713aa563963fa0c42cc5');
INSERT INTO `registry_file` VALUES('includes/database/sqlite/query.inc', 'cd726af682495d8fe20283ddbc4d877536cad2df4a2df8afc2dc21be71a4eba8');
INSERT INTO `registry_file` VALUES('includes/database/sqlite/schema.inc', '238414785aa96dd27f10f48c961783f4d1091392beee8d0e7ca8ae774e917da2');
INSERT INTO `registry_file` VALUES('includes/database/sqlite/select.inc', '8d1c426dbd337733c206cce9f59a172546c6ed856d8ef3f1c7bef05a16f7bf68');
INSERT INTO `registry_file` VALUES('includes/date.inc', '18c047be64f201e16d189f1cc47ed9dcf0a145151b1ee187e90511b24e5d2b36');
INSERT INTO `registry_file` VALUES('includes/entity.inc', '93ed9b3f29fb2a75852af3b4cf03ce0edf3e9eddf19e4b82eeba8659d3d5bc78');
INSERT INTO `registry_file` VALUES('includes/errors.inc', '0923cf3303e0e976756d159c80c86bbe039109bd90a35a9aca18027c68abd0aa');
INSERT INTO `registry_file` VALUES('includes/file.inc', '4eeef6f486c843ff91e5eaa5ee435e66d89dd516c76b980c79d3c6595fe6bf2d');
INSERT INTO `registry_file` VALUES('includes/file.mimetypes.inc', 'f88c967550576694b7a1ce2afd0f2f1bbc1a91d21cc2c20f86c44d39ff353867');
INSERT INTO `registry_file` VALUES('includes/filetransfer/filetransfer.inc', 'fdea8ae48345ec91885ac48a9bc53daf87616271472bb7c29b7e3ce219b22034');
INSERT INTO `registry_file` VALUES('includes/filetransfer/ftp.inc', '589ebf4b8bd4a2973aa56a156ac1fa83b6c73e703391361fb573167670e0d832');
INSERT INTO `registry_file` VALUES('includes/filetransfer/local.inc', '7cbfdb46abbdf539640db27e66fb30e5265128f31002bd0dfc3af16ae01a9492');
INSERT INTO `registry_file` VALUES('includes/filetransfer/ssh.inc', '002e24a24cac133d12728bd3843868ce378681237d7fad420761af84e6efe5ad');
INSERT INTO `registry_file` VALUES('includes/form.inc', '5ab6ebd03a6852acd532fb3e06ce4d90c983246ba1f9506437fa19566729893d');
INSERT INTO `registry_file` VALUES('includes/graph.inc', '8e0e313a8bb33488f371df11fc1b58d7cf80099b886cd1003871e2c896d1b536');
INSERT INTO `registry_file` VALUES('includes/image.inc', 'bcdc7e1599c02227502b9d0fe36eeb2b529b130a392bc709eb737647bd361826');
INSERT INTO `registry_file` VALUES('includes/install.core.inc', '2a036b695c555d7339115099e0b7b06bf7fbafbaad6d7cc143e49969ff96c394');
INSERT INTO `registry_file` VALUES('includes/install.inc', 'f4e81c6b55769e0b5cc66565ade31d1f805faf11f73ca605bd3506a78ec1b7ee');
INSERT INTO `registry_file` VALUES('includes/iso.inc', '27730e6175b79c3b5d494582a124f6210289faa03bef099e16347bb914464c66');
INSERT INTO `registry_file` VALUES('includes/json-encode.inc', '02a822a652d00151f79db9aa9e171c310b69b93a12f549bc2ce00533a8efa14e');
INSERT INTO `registry_file` VALUES('includes/language.inc', '77ef0c210a8f01d4ad24b13b147db3db0dcef801dbae8b644124cedd562a8a57');
INSERT INTO `registry_file` VALUES('includes/locale.inc', '8cc571c114587f2b30e4e24db17e97e51e81f9cc395fa01f348aba12cee8523e');
INSERT INTO `registry_file` VALUES('includes/lock.inc', 'daa62e95528f6b986b85680b600a896452bf2ce6f38921242857dcc5a3460a1b');
INSERT INTO `registry_file` VALUES('includes/mail.inc', '8b37b30d82941010eacf8f435abbf9cb5b6cfc2710c3446a5037192ae14d68bf');
INSERT INTO `registry_file` VALUES('includes/menu.inc', '1b6ad3883f405b887032d8b2e58e6e3870a37f6963854275e0c0d9e1b12a624c');
INSERT INTO `registry_file` VALUES('includes/module.inc', '09dd0e483fd1c5569183ff0663543163d5262ec5eb9c4551c2214fd7599f386b');
INSERT INTO `registry_file` VALUES('includes/pager.inc', '6f9494b85c07a2cc3be4e54aff2d2757485238c476a7da084d25bde1d88be6d8');
INSERT INTO `registry_file` VALUES('includes/password.inc', '7550ac434a929562a3380e82c546afbf9163598b22f2351f0e7d3f19567fb6c9');
INSERT INTO `registry_file` VALUES('includes/path.inc', 'd20d3efabcb752fcafafc887fc0f09704d87000742302f95cf58e62333d05279');
INSERT INTO `registry_file` VALUES('includes/registry.inc', '4ffb8c9c8c179c1417ff01790f339edf50b5f7cc0c8bb976eef6858cc71e9bc8');
INSERT INTO `registry_file` VALUES('includes/session.inc', '65764101f3746e25210e8a91a9c058218c83c7bf444051ba339c412a2d2bff63');
INSERT INTO `registry_file` VALUES('includes/stream_wrappers.inc', 'b04e31585a9a397b0edf7b3586050cbd4b1f631e283296e1c93f4356662faeb9');
INSERT INTO `registry_file` VALUES('includes/tablesort.inc', '4cb2a5a2d41b2a204a13f59085096e3f64237d32639ea5d30752905099bc7540');
INSERT INTO `registry_file` VALUES('includes/theme.inc', 'f1a3045e917b454f23842e048f8753c7dc1e97bf8999bb8eeb4f72cee3cc7553');
INSERT INTO `registry_file` VALUES('includes/theme.maintenance.inc', '39f068b3eee4d10a90d6aa3c86db587b6d25844c2919d418d34d133cfe330f5a');
INSERT INTO `registry_file` VALUES('includes/token.inc', '5e7898cd78689e2c291ed3cd8f41c032075656896f1db57e49217aac19ae0428');
INSERT INTO `registry_file` VALUES('includes/unicode.entities.inc', '2b858138596d961fbaa4c6e3986e409921df7f76b6ee1b109c4af5970f1e0f54');
INSERT INTO `registry_file` VALUES('includes/unicode.inc', '518ad21bd4f43814277d67f76ff8eb2b99bd1be4caa5e02b6e5f06cf65d84eb0');
INSERT INTO `registry_file` VALUES('includes/update.inc', '177ce24362efc7f28b384c90a09c3e485396bbd18c3721d4b21e57dd1733bd92');
INSERT INTO `registry_file` VALUES('includes/updater.inc', 'd2da0e74ed86e93c209f16069f3d32e1a134ceb6c06a0044f78e841a1b54e380');
INSERT INTO `registry_file` VALUES('includes/utility.inc', '3458fd2b55ab004dd0cc529b8e58af12916e8bd36653b072bdd820b26b907ed5');
INSERT INTO `registry_file` VALUES('includes/xmlrpc.inc', 'c5b6ea78adeb135373d11aeaaea057d9fa8995faa4e8c0fec9b7c647f15cc4e0');
INSERT INTO `registry_file` VALUES('includes/xmlrpcs.inc', '79dc6e9882f4c506123d7dd8e228a61e22c46979c3aab21a5b1afa315ef6639c');
INSERT INTO `registry_file` VALUES('modules/block/block.test', '7aefd627d62b44f9c1e9ee3aa9da6c6e2a7cfce01c6613e8bd24c0b9c464dd73');
INSERT INTO `registry_file` VALUES('modules/color/color.test', '013806279bd47ceb2f82ca854b57f880ba21058f7a2592c422afae881a7f5d15');
INSERT INTO `registry_file` VALUES('modules/comment/comment.module', 'f7d4b93359bf3d6381204a0f63e6574ece4f45656d53d126f04067891d1d64b1');
INSERT INTO `registry_file` VALUES('modules/comment/comment.test', '5404277c15b1306a1ad5eca6703f7d2003567fea6085ffd2b1c3d65896acdf21');
INSERT INTO `registry_file` VALUES('modules/contextual/contextual.test', '023dafa199bd325ecc55a17b2a3db46ac0a31e23059f701f789f3bc42427ba0b');
INSERT INTO `registry_file` VALUES('modules/dashboard/dashboard.test', '270378b5c8ed0e7d0e00fbc62e617813c6dec1d79396229786942bf9fb738e16');
INSERT INTO `registry_file` VALUES('modules/dblog/dblog.test', '6f5da69432a186df5086f9a588c9c18ad85bb3034bccc3860423d9e854c0d864');
INSERT INTO `registry_file` VALUES('modules/field/field.attach.inc', '25d05fb8ab30ba559051ca2034ea7e61bd1326cacb12dfeb865e90e2ffd147e6');
INSERT INTO `registry_file` VALUES('modules/field/field.info.class.inc', 'c2e4bc67ef51e4956c913be772914b1b2625aa5066ab67c74baf6404ed538174');
INSERT INTO `registry_file` VALUES('modules/field/field.module', 'd2d9b9b324c256ca11e117f84afd9722c5271887a57497e2dd1f339adae7c12d');
INSERT INTO `registry_file` VALUES('modules/field/modules/field_sql_storage/field_sql_storage.test', '8ede9843d771e307dfd3d7e7562976b07e0e0a9310a5cf409413581f199c897f');
INSERT INTO `registry_file` VALUES('modules/field/modules/list/tests/list.test', '9f366469763beb3fe0571d66318bac6df293fd15f4eb5cfe4850b9fb9a509f38');
INSERT INTO `registry_file` VALUES('modules/field/modules/number/number.test', 'cb55fbc3a1ceed154af673af727b4c5ee6ac2e7dc9d4e1cbc33f3f8e2269146c');
INSERT INTO `registry_file` VALUES('modules/field/modules/options/options.test', '8c6dd464fdb5cca90b0260bcfa5f56941b4b28edd879b23a795f0442f5368d4c');
INSERT INTO `registry_file` VALUES('modules/field/modules/text/text.test', '9d74c6d039f55dd7d6447a59186da8d48bf20617bfe58424612798f649797586');
INSERT INTO `registry_file` VALUES('modules/field/tests/field.test', 'f07f370dee1b3bf645c548a4542007b4653bf6a40f28888e180cbc408e62c569');
INSERT INTO `registry_file` VALUES('modules/field_ui/field_ui.test', '2c344c7ccd9d41156f3e4a16f1cad06d2c3f4d702b47452bf6f5260efe2abbeb');
INSERT INTO `registry_file` VALUES('modules/file/tests/file.test', '802532f0032f1740592379d7bd9c93f8c453f68b93f11bf0143bd5de648659c8');
INSERT INTO `registry_file` VALUES('modules/filter/filter.test', '50f74d9c07663cbf610559f7123709488c36dab18e4320635ca4bcf9a9891640');
INSERT INTO `registry_file` VALUES('modules/help/help.test', 'c6f03ece30548a6a345afcfac920d85afc418596a19dc4cf43f994391c5050d9');
INSERT INTO `registry_file` VALUES('modules/image/image.test', '03ab83fcfd3c0f8397ea2273847a13bb5661efd4fc68af55f85bb32e41f37dc3');
INSERT INTO `registry_file` VALUES('modules/menu/menu.test', 'b93a1f408a1b51563c4c761475366573fc481d4ace3496fce226a73bdf468e8c');
INSERT INTO `registry_file` VALUES('modules/node/node.module', '72f72261cac4ca7880f4384791d7aee1e40491a0c1978946c3fa4d3bb64a9433');
INSERT INTO `registry_file` VALUES('modules/node/node.test', '4757ff01c1209a86393a2370234f0af3fc708d50b5a012e7eb9763336bc747bf');
INSERT INTO `registry_file` VALUES('modules/path/path.test', 'c05b26db575e93a73f2e4c8eaa6091b4fe8fc805f59620c2f7e1276cc206ba9d');
INSERT INTO `registry_file` VALUES('modules/rdf/rdf.test', 'd586b165925f65c98adcc0ad1eb24b05e2803ea92f1acca351b3ce2dc8932f43');
INSERT INTO `registry_file` VALUES('modules/search/search.extender.inc', 'fea036745113dca3fea52ba956af605c4789f4acfa2ab1650a5843c6e173d7fe');
INSERT INTO `registry_file` VALUES('modules/search/search.test', '1fe9dfc982953f42f67d7eee9a855e7248373067ba55cfff001d8a750b83e695');
INSERT INTO `registry_file` VALUES('modules/shortcut/shortcut.test', '9d0f81602c9a58b60ad3ae4b996e5a431016014151540769e9594711232575e4');
INSERT INTO `registry_file` VALUES('modules/system/system.archiver.inc', 'faa849f3e646a910ab82fd6c8bbf0a4e6b8c60725d7ba81ec0556bd716616cd1');
INSERT INTO `registry_file` VALUES('modules/system/system.mail.inc', '3c2c06b55bded609e72add89db41af3bb405d42b9553793acba5fe51be8861d8');
INSERT INTO `registry_file` VALUES('modules/system/system.queue.inc', 'caf4feda51bdf7ad62cf782bc23274d367154e51897f2732f07bd06982d85ab1');
INSERT INTO `registry_file` VALUES('modules/system/system.tar.inc', '8a31d91f7b3cd7eac25b3fa46e1ed9a8527c39718ba76c3f8c0bbbeaa3aa4086');
INSERT INTO `registry_file` VALUES('modules/system/system.test', '1577ba238919ba208902f807cd35ef667616a064ecf2b611b0ccb39cba105450');
INSERT INTO `registry_file` VALUES('modules/system/system.updater.inc', '338cf14cb691ba16ee551b3b9e0fa4f579a2f25c964130658236726d17563b6a');
INSERT INTO `registry_file` VALUES('modules/taxonomy/taxonomy.module', '389f4e8e040e99c02b4795983e7b44ffb00e766d2a4b3fa06aca98621073f6b2');
INSERT INTO `registry_file` VALUES('modules/taxonomy/taxonomy.test', '2b1599532f0b6bd0e324b55b687fe9eac9c6465376fd8317652e7540ee0a3677');
INSERT INTO `registry_file` VALUES('modules/update/update.test', 'f0c11dfc51716e9dd5980428a416cdead4246435e1dceaff75ce52c5f381d617');
INSERT INTO `registry_file` VALUES('modules/user/user.module', '40a0d8e89d4de14cee5283a21eb541c0143ab86170a093cfc6ecf15c9fe534ea');
INSERT INTO `registry_file` VALUES('modules/user/user.test', '0cdf12305cce4a65da5be1155925ba2a83b6f5363d6c192f0cfec2985e835e20');
INSERT INTO `registry_file` VALUES('sites/all/modules/ctools/includes/context.inc', 'b7b5b38b6d85ab438327fc6127e2f21654c45ffa6b55d7b01b3b65bf19918a7e');
INSERT INTO `registry_file` VALUES('sites/all/modules/ctools/includes/math-expr.inc', '3386323b01da62e02c9f3607cd7f0a0d46f1af90a107a07aed726b1fa8c28235');
INSERT INTO `registry_file` VALUES('sites/all/modules/ctools/includes/stylizer.inc', 'e18f5a1b8af526751d7175354162c06c2013c96f62d9baa399564d8c45a1c90e');
INSERT INTO `registry_file` VALUES('sites/all/modules/ctools/plugins/export_ui/ctools_export_ui.class.php', '3d6d5df2fd5657b59023c8cb7f2d8f96a3f282f28307e5803cc9159297d6a2ab');
INSERT INTO `registry_file` VALUES('sites/all/modules/entity/entity.features.inc', 'b77e91ea988218fd939a4e5f283b2c745d53e39159af5ab770eda6b66fcb33cb');
INSERT INTO `registry_file` VALUES('sites/all/modules/entity/entity.i18n.inc', '41e0e62af7e2774f62b162d597bb3244551c280296b692b29d039a2c243d7059');
INSERT INTO `registry_file` VALUES('sites/all/modules/entity/entity.info.inc', '962cf92c630a2954c4e430164e1d04b8125eb1103dbefb7b954182b4382d072d');
INSERT INTO `registry_file` VALUES('sites/all/modules/entity/entity.rules.inc', '774199059d1b3ebe6d3fe7a49dbb1550df489055a3d066b5de54edda8dd7ba84');
INSERT INTO `registry_file` VALUES('sites/all/modules/entity/entity.test', 'edc8b5e132f0a935ad76f64c68fe7e7c4ce7556c7da3cd287c8b6478282e29c5');
INSERT INTO `registry_file` VALUES('sites/all/modules/entity/entity_token.module', '0c1ad6fb6f8c430e47a81be6d08180883c5a1ee728ce8b5dd0775713b34fb862');
INSERT INTO `registry_file` VALUES('sites/all/modules/entity/entity_token.tokens.inc', 'd9246ed9a7d4cfdf16370d3c68f991fb103838b6e2c9682c385d2144629504ee');
INSERT INTO `registry_file` VALUES('sites/all/modules/entity/includes/entity.controller.inc', 'bf7185b9553361a8a71ed943756dee86146cff4d8ef0872071b94fa7c001c08b');
INSERT INTO `registry_file` VALUES('sites/all/modules/entity/includes/entity.inc', '0e8ab676f94b98031514d5b887b44f2b0e6387a610085156a14fb174676cbe11');
INSERT INTO `registry_file` VALUES('sites/all/modules/entity/includes/entity.ui.inc', 'b2bdd28eb3af34cb7c2ff1e58e0cf679d26cfd68cd9414dc3abfbd297443874d');
INSERT INTO `registry_file` VALUES('sites/all/modules/entity/includes/entity.wrapper.inc', '046b5ba9fb72b699ae169776a72ba1f8f36dd14f8652f66ebe13567184848630');
INSERT INTO `registry_file` VALUES('sites/all/modules/entity/views/entity.views.inc', 'd07e9f0bdd6e300fc237c966693aa5b09a57a507a4d40be4c8d03bd9f6535e28');
INSERT INTO `registry_file` VALUES('sites/all/modules/entity/views/handlers/entity_views_field_handler_helper.inc', '69d5ac25d8686ee43be607d682795b2cae0278500392f5f7970ac9f45913ee84');
INSERT INTO `registry_file` VALUES('sites/all/modules/entity/views/handlers/entity_views_handler_area_entity.inc', 'e86aceccf21cbbca4bef7d2c049dc93a8f5a01c6bc73e7b2f92f5659a9eedd03');
INSERT INTO `registry_file` VALUES('sites/all/modules/entity/views/handlers/entity_views_handler_field_boolean.inc', 'b28b8eee8761ba7a6af35d97ab7aaee28406e6c227271f9769818560626c5791');
INSERT INTO `registry_file` VALUES('sites/all/modules/entity/views/handlers/entity_views_handler_field_date.inc', 'b0f5be5b399de94934b24e84c8cf6053a043f6b00c60dcffa752daeafdd38778');
INSERT INTO `registry_file` VALUES('sites/all/modules/entity/views/handlers/entity_views_handler_field_duration.inc', '6a7f83e4ce141428d3d782db0c71f3cf4b141eff4f551b826fef7e52ac728e01');
INSERT INTO `registry_file` VALUES('sites/all/modules/entity/views/handlers/entity_views_handler_field_entity.inc', '54f9b1ba705953ec4fffbb877268cc0a537e3e83e6624c1dc7da778e4d30c824');
INSERT INTO `registry_file` VALUES('sites/all/modules/entity/views/handlers/entity_views_handler_field_field.inc', '893121efbce2a7181e31147bade260c9cc657cbd33b0d254cb28b2650e57566d');
INSERT INTO `registry_file` VALUES('sites/all/modules/entity/views/handlers/entity_views_handler_field_numeric.inc', 'f14e2b063930e8820af381b4f5e83c7278440e7804ab88cfde865b6c94e7c0f6');
INSERT INTO `registry_file` VALUES('sites/all/modules/entity/views/handlers/entity_views_handler_field_options.inc', '16317359cf59afb290d78eb61228f93dda408081e8c2f88db2f90a60d68d31d6');
INSERT INTO `registry_file` VALUES('sites/all/modules/entity/views/handlers/entity_views_handler_field_text.inc', 'ae26b8a9a86c36a166644a1f5a9bae0676f535345c092d882df0177ded305bdd');
INSERT INTO `registry_file` VALUES('sites/all/modules/entity/views/handlers/entity_views_handler_field_uri.inc', '79ecaa3eb17dfdd0ca077351b75a2c0adf411ebc04720e7cc0e2397674225f24');
INSERT INTO `registry_file` VALUES('sites/all/modules/entity/views/handlers/entity_views_handler_relationship.inc', 'b69bc538d1e1e0f91f8485ca54c3b6e2be025caa47619734c467377cf89041b9');
INSERT INTO `registry_file` VALUES('sites/all/modules/entity/views/handlers/entity_views_handler_relationship_by_bundle.inc', '25aebf66cd2437bd5867fef8f0e0e25d4308b9ce491cc79801e9d3cbed68bcba');
INSERT INTO `registry_file` VALUES('sites/all/modules/entity/views/plugins/entity_views_plugin_row_entity_view.inc', 'ba557790215f2658146424d933e0d17787a0b15180c5815f23428448ccf056a0');
INSERT INTO `registry_file` VALUES('sites/all/modules/field_group/field_group.features.inc', 'c8fb1d29fddfd9c1b82806b55979b3b5ec34d4a94f8f2307ae2838cb3b21c966');
INSERT INTO `registry_file` VALUES('sites/all/modules/field_group/field_group.field_ui.inc', '72dccb0bd7668b403134b9ff0aa77bff107eea07cb9d96d1f2c660058712496b');
INSERT INTO `registry_file` VALUES('sites/all/modules/field_group/field_group.install', '156bd483f3a88d8931b7f439cd1e38141ab567cfbb7dcb9bc93823f07002cd36');
INSERT INTO `registry_file` VALUES('sites/all/modules/field_group/field_group.module', '67a27fb444148872dfbb2627370dd22de67893567b08f7e76c3ea30de15a1cf8');
INSERT INTO `registry_file` VALUES('sites/all/modules/field_group/field_group.test', '3d26d8d1408bcf661c07db962ce287bdd5cc513329a8af4d357e7a66fa068244');
INSERT INTO `registry_file` VALUES('sites/all/modules/libraries/tests/libraries.test', '6dccb7969e83afd82de3c83af5e0b06c1f27e35ab1069f5f669640eed6d5d4af');
INSERT INTO `registry_file` VALUES('sites/all/modules/rules/includes/faces.inc', '72352c57a12e740b80e235ee5fe245b91c5bca9938f4751670acc8e719626bcb');
INSERT INTO `registry_file` VALUES('sites/all/modules/rules/includes/rules.core.inc', 'c5493c262bdd5cc8f27450acf798a5aff55aeed4be475352763a639d84e30a76');
INSERT INTO `registry_file` VALUES('sites/all/modules/rules/includes/rules.plugins.inc', 'a092c4f9b7c2914372306292f8447561bd0fa442efca57d557cfd1a3a24b1bde');
INSERT INTO `registry_file` VALUES('sites/all/modules/rules/includes/rules.processor.inc', '902d554987e019cfe9c8818a83a96db7e02c556efb4c63961ee9d091ee98c988');
INSERT INTO `registry_file` VALUES('sites/all/modules/rules/includes/rules.state.inc', 'ba968f8fd908a8c19915426670084ecfcdb902a012f056e221ab955292f0f361');
INSERT INTO `registry_file` VALUES('sites/all/modules/rules/modules/php.eval.inc', '4d579f9d83912a1ff4e3e35b20a7792fb7e282d8d07c706e944ffbb6b20c42f6');
INSERT INTO `registry_file` VALUES('sites/all/modules/rules/modules/rules_core.eval.inc', 'edf268c4e9a24d700ef08ca5cf8addc93a437d30cb0129aeb7aa93e76f8f855e');
INSERT INTO `registry_file` VALUES('sites/all/modules/rules/modules/system.eval.inc', '350c5ed5e3c4a5bb656f34fc8fd5d5a9fc5c8ef5a24b77396d31879668ad2be7');
INSERT INTO `registry_file` VALUES('sites/all/modules/rules/rules.features.inc', 'dc219fc6df253743cfe775503edffd6ba8b76fe9d8b549294242b0691cad0302');
INSERT INTO `registry_file` VALUES('sites/all/modules/rules/rules_admin/rules_admin.inc', 'c41d8491b6e19849c99726f4e127e081dac4e92b9052b3446aafac1802e26e71');
INSERT INTO `registry_file` VALUES('sites/all/modules/rules/rules_admin/rules_admin.module', '38cd2e74c2d951d4a4d6025191cf4aa87be9ece9b2bf5b248ce0bfdfc62aa9cb');
INSERT INTO `registry_file` VALUES('sites/all/modules/rules/rules_scheduler/includes/rules_scheduler.views.inc', '2044c3ba44b79a667e4485ba67e017a6b637affd0b357f0d81332d260b0f68ff');
INSERT INTO `registry_file` VALUES('sites/all/modules/rules/rules_scheduler/includes/rules_scheduler.views_default.inc', '555f7bf0f5ac33491241f5f54879c928e98d284b9aa988fb4aba8ce022a76b81');
INSERT INTO `registry_file` VALUES('sites/all/modules/rules/rules_scheduler/includes/rules_scheduler_views_filter.inc', '7d453cca6d8d0c98410fe533d9a3bf0da3bf3f46b8177a327c483a433466f216');
INSERT INTO `registry_file` VALUES('sites/all/modules/rules/rules_scheduler/rules_scheduler.admin.inc', '1ba6dd44fc4d1317e195df1f3d87ff627e886560cd8ea5d06851281b18a13dbb');
INSERT INTO `registry_file` VALUES('sites/all/modules/rules/rules_scheduler/rules_scheduler.install', '041c90dc096f4332963eac147f216f7fc08b980ad7efbde7ca65fdf5f0530aed');
INSERT INTO `registry_file` VALUES('sites/all/modules/rules/rules_scheduler/rules_scheduler.module', 'da66586e4667e3659138612537f27fb6b9d1283b6ae28c6b591370e3081a11c6');
INSERT INTO `registry_file` VALUES('sites/all/modules/rules/rules_scheduler/rules_scheduler.rules.inc', '7438c7e31ffe8827afd23d33fe8f221cc79b45535ef05e61a562c6a25404f97a');
INSERT INTO `registry_file` VALUES('sites/all/modules/rules/rules_scheduler/rules_scheduler.test', '80068b7d59724d3caa1c28a510f731251264674ea363108270fbfce223c0ed23');
INSERT INTO `registry_file` VALUES('sites/all/modules/rules/tests/rules.test', 'a6d9e36a43926798c4e85479add3b53c89eda1b6e312e0f770744a996fe5b68b');
INSERT INTO `registry_file` VALUES('sites/all/modules/rules/ui/ui.controller.inc', '519db56ba4e8c753642fa8bf34706f74f9fc86323aad3286aa6dc7807d47d971');
INSERT INTO `registry_file` VALUES('sites/all/modules/rules/ui/ui.core.inc', 'b6cf0923a552e7020b4ceddf5994f6462cc5d3668c91c95bfdcccf423b96dc0f');
INSERT INTO `registry_file` VALUES('sites/all/modules/rules/ui/ui.data.inc', '90d8bd7bb7fcfaf0ba8766152c37f89cd5c32f6e23b2072cf87a43f698706c1b');
INSERT INTO `registry_file` VALUES('sites/all/modules/rules/ui/ui.plugins.inc', '62815f3d11555a9682b088bdacb3c4ece1350d5e8ca2c9a9330a07929dddba36');
INSERT INTO `registry_file` VALUES('sites/all/modules/services/includes/services.runtime.inc', 'f4e506a5f60810310f30ecbfbad68d3a8d0ab9b2759306bf4d244a0078344bcc');
INSERT INTO `registry_file` VALUES('sites/all/modules/services/plugins/export_ui/services_ctools_export_ui.class.php', '1c760a28ef0ebfa338f87edb7a3a6b17df2dace77de616059d1969aade7d5451');
INSERT INTO `registry_file` VALUES('sites/all/modules/services/servers/rest_server/includes/RESTServer.inc', '20dd8e35f3af75b6de058923f56b902beafc02b928924b8d880d62846bfbfc91');
INSERT INTO `registry_file` VALUES('sites/all/modules/services/servers/rest_server/includes/ServicesContentTypeNegotiator.inc', 'fae9e0a68a0724334f1980862fcc363e705b408b57f6683a330d8d55e3cbed25');
INSERT INTO `registry_file` VALUES('sites/all/modules/services/servers/rest_server/includes/ServicesContext.inc', '6a367e668802b8b4072155e8309fdaee2b46af76be8afd79185369994b605d73');
INSERT INTO `registry_file` VALUES('sites/all/modules/services/servers/rest_server/includes/ServicesFormatter.inc', '4f98be6e03fedd35ba50f39cb9ede24be7487191176c8e3f77addb2652da772b');
INSERT INTO `registry_file` VALUES('sites/all/modules/services/servers/rest_server/includes/ServicesParser.inc', 'd61e93614d32ea58f846c6e62533b646274bc191aee551afe170d5a83f4b3b93');
INSERT INTO `registry_file` VALUES('sites/all/modules/services/servers/rest_server/includes/ServicesRESTServerFactory.inc', 'ca0e739f0c87833b57df967d2f6d654f0d4502c61941f05b6f5e84f00ec34662');
INSERT INTO `registry_file` VALUES('sites/all/modules/services/servers/rest_server/lib/bencode.php', '245078c15cb1494586a4c064cc707b08d02f51fd7b86ba673ac2685295c65c38');
INSERT INTO `registry_file` VALUES('sites/all/modules/services/servers/rest_server/lib/mimeparse.php', 'ce8683bca08e790154ee990f6b2a1228200085a2065365d94a60541d90c9a228');
INSERT INTO `registry_file` VALUES('sites/all/modules/services/servers/rest_server/rest_server.module', '4e82799d08428b26ed0a4a26f783e8a798750b3cf2142bd8f36c5d0c40060561');
INSERT INTO `registry_file` VALUES('sites/all/modules/services/servers/rest_server/tests/rest_server_mock_classes.inc', 'e86d621cd373f7038077a521cce882a543b3948443f11020f36f839bc36d8100');
INSERT INTO `registry_file` VALUES('sites/all/modules/services/servers/rest_server/tests/ServicesRESTServerTests.test', '3bbef5971279ef1e52214d8cff146f980a227f5635bd93279cd3c87adf9159df');
INSERT INTO `registry_file` VALUES('sites/all/modules/services/tests/functional/NoAuthEndpointTestRunner.test', 'c2563cd96d0345f6678683489e39a596ea4c63809b64c1c0e75110622ec0b6ab');
INSERT INTO `registry_file` VALUES('sites/all/modules/services/tests/functional/ServicesAliasTests.test', 'eff7b6361a6224a2658cda51cb5f72d8b99876a18135aaeedcbfb58610c2ca2e');
INSERT INTO `registry_file` VALUES('sites/all/modules/services/tests/functional/ServicesArgumentsTests.test', '3af203abf99fdc077908d0fcc5d9e8f0c44fd01bb2b7dca8423b46ad31abbf91');
INSERT INTO `registry_file` VALUES('sites/all/modules/services/tests/functional/ServicesEndpointTests.test', '7e11aaa489828373a3070976b8afe306beb6e9dcb39794f1eda3ee81077a165a');
INSERT INTO `registry_file` VALUES('sites/all/modules/services/tests/functional/ServicesParserTests.test', 'bb254e6faf33bfd644f3c878c338cbcafe12bc4edea4f225cf2a683a3020cf21');
INSERT INTO `registry_file` VALUES('sites/all/modules/services/tests/functional/ServicesResourceCommentTests.test', '36fe272884e8c286dd726cffba5066423700308fd00e6d175792d5369e339277');
INSERT INTO `registry_file` VALUES('sites/all/modules/services/tests/functional/ServicesResourceDisabledTests.test', '2624c05b293b7b2c17d81afa1356269d31d51a53ae24e539ba34be905bb1c480');
INSERT INTO `registry_file` VALUES('sites/all/modules/services/tests/functional/ServicesResourceFileTests.test', '332ff471ad6011b52068aa4fc5aee98629c7759292ddbd4a92fe452e366df172');
INSERT INTO `registry_file` VALUES('sites/all/modules/services/tests/functional/ServicesResourceNodeTests.test', 'c58936b4045f035a77a2e6b93917eb9562837c35e68fcbc81662da48e5c30704');
INSERT INTO `registry_file` VALUES('sites/all/modules/services/tests/functional/ServicesResourceSystemTests.test', 'd00b87d4f5b5bc13102ad8136b1541eae6290b9c3a8e87f7adc4e75daeb0ac8d');
INSERT INTO `registry_file` VALUES('sites/all/modules/services/tests/functional/ServicesResourceTaxonomyTests.test', '92a80579996a565d3977d4c4aaa4fd2157a160cc84ceadde8723a09eef11b389');
INSERT INTO `registry_file` VALUES('sites/all/modules/services/tests/functional/ServicesResourceUserTests.test', 'c3b8fb1bac072844429d4325fde5d2e9b422a8b6054c05d488093a27445ffa21');
INSERT INTO `registry_file` VALUES('sites/all/modules/services/tests/functional/ServicesSecurityTests.test', '50745143189cbc269b3603356d36915c059b013589b1045edea242e8a20ad56c');
INSERT INTO `registry_file` VALUES('sites/all/modules/services/tests/functional/ServicesVersionTests.test', '770435935f246afdf534b47453be986b07d1b51622dce9b57d47750db008cbf1');
INSERT INTO `registry_file` VALUES('sites/all/modules/services/tests/functional/ServicesXMLRPCTests.test', '86c2a78c8be5be82639ebea7951ce025f7ae0e1499afe8f407923dee3a934e24');
INSERT INTO `registry_file` VALUES('sites/all/modules/services/tests/services.test', '1c8db56d66c97dc1125c4ad54f442d5ab60c4d787de79daf99324367297a325f');
INSERT INTO `registry_file` VALUES('sites/all/modules/services/tests/ui/ServicesUITests.test', '6ed160c052ed656c20851c9cb62b9144ff798362afac2546ed0c7fedf945c543');
INSERT INTO `registry_file` VALUES('sites/all/modules/services/tests/unit/ServicesSpycLibraryTests.test', '5fae62cde7e0960f7c290753c0cf1dfd4300ae8bcdc82ac98be987b1ac173be5');
INSERT INTO `registry_file` VALUES('sites/all/modules/services_views/includes/views/views_plugin_display_services.inc', 'f693f42f9a25721f27aac6bc68fdcdcd3417b607dbfc72e4532a9608cf46744b');
INSERT INTO `registry_file` VALUES('sites/all/modules/views/handlers/views_handler_area.inc', '95d4374c805c057c9855304ded14ce316cdee8aca0744120a74400e2a8173fae');
INSERT INTO `registry_file` VALUES('sites/all/modules/views/handlers/views_handler_area_result.inc', '836747c024cc153ec4516737da0c42a864eb708e0b77d2f8ba606411c57356a2');
INSERT INTO `registry_file` VALUES('sites/all/modules/views/handlers/views_handler_area_text.inc', '531d0ac3b64206970593762df0abac60524f607253c3af876dd66ba747786dce');
INSERT INTO `registry_file` VALUES('sites/all/modules/views/handlers/views_handler_area_text_custom.inc', '35b702060c192b0adf6601ed437d0a02effd3accb71c07d6156013c8be9d5a15');
INSERT INTO `registry_file` VALUES('sites/all/modules/views/handlers/views_handler_area_view.inc', 'a6a4a618c96a5657eaa881aa0836663600629529ebfd943c91303a11171974d5');
INSERT INTO `registry_file` VALUES('sites/all/modules/views/handlers/views_handler_argument.inc', '5858d2d1ad3ea0321532da0f66c4d2ef2b2a208e941789b37341b76c783c2d42');
INSERT INTO `registry_file` VALUES('sites/all/modules/views/handlers/views_handler_argument_date.inc', '1b423d5a437bbd8ed97d0bfb69c635d36f15114699a7bc0056568cc87937477d');
INSERT INTO `registry_file` VALUES('sites/all/modules/views/handlers/views_handler_argument_formula.inc', '5a29748494a7e1c37606224de0c3cac45566efe057e4748b6676a898ac224a61');
INSERT INTO `registry_file` VALUES('sites/all/modules/views/handlers/views_handler_argument_group_by_numeric.inc', 'b8d29f27592448b63f15138510128203d726590daef56cf153a09407c90ec481');
INSERT INTO `registry_file` VALUES('sites/all/modules/views/handlers/views_handler_argument_many_to_one.inc', 'b2de259c2d00fe7ed04eb5d45eb5107ce60535dd0275823883cc29b04d1a3974');
INSERT INTO `registry_file` VALUES('sites/all/modules/views/handlers/views_handler_argument_null.inc', '26699660fd0915ec078d7eb35a93ef39fd53e3a2a4841c0ac5dbf0bb02207bee');
INSERT INTO `registry_file` VALUES('sites/all/modules/views/handlers/views_handler_argument_numeric.inc', 'ae23d847fa0f1e92baec32665a8894e26660999e338bebffb49ee42daac5a063');
INSERT INTO `registry_file` VALUES('sites/all/modules/views/handlers/views_handler_argument_string.inc', 'f8fe4daf0a636cc93d520a0d5ff212840d8bdaa704ddc3c59a24667f341ed3a1');
INSERT INTO `registry_file` VALUES('sites/all/modules/views/handlers/views_handler_field.inc', '3d059d737e738436a15651f9ac8374f460a71eb569619ba0a8a14a55a3efc87e');
INSERT INTO `registry_file` VALUES('sites/all/modules/views/handlers/views_handler_field_boolean.inc', 'dc00b916a223935e05f51d94a2dffbaf430b162517072f7c2122332af41e8fc2');
INSERT INTO `registry_file` VALUES('sites/all/modules/views/handlers/views_handler_field_contextual_links.inc', '9752231bd248bcbc5c7282361098350f080706e3886d20753c5b2059adb10c00');
INSERT INTO `registry_file` VALUES('sites/all/modules/views/handlers/views_handler_field_counter.inc', 'fcfd07c8a20b91819af375c5e1edc33ec7e5b6ee48f419f6183f3401abf9af42');
INSERT INTO `registry_file` VALUES('sites/all/modules/views/handlers/views_handler_field_custom.inc', 'a3d25fc20401ae0a1af4b7d6e83376a5b7dc18ab0aed17a3c6d81e2314cf19f8');
INSERT INTO `registry_file` VALUES('sites/all/modules/views/handlers/views_handler_field_date.inc', 'ea37efb7819df9a4c2b6f688ec101964474dc7df13e92824913f783314d80740');
INSERT INTO `registry_file` VALUES('sites/all/modules/views/handlers/views_handler_field_entity.inc', '909ab36aff896ad8fa4306d95a052172ec27e471ab385a035fcadef8d019e0f9');
INSERT INTO `registry_file` VALUES('sites/all/modules/views/handlers/views_handler_field_machine_name.inc', 'df2fe47cf9c6d2e7de8627c08da809fb60883c38697340966f303c223e22aee4');
INSERT INTO `registry_file` VALUES('sites/all/modules/views/handlers/views_handler_field_markup.inc', 'a0c652fdf47f7efe35bbf2371f00e230409fe90ea0038eb101bf0c93ae0718e9');
INSERT INTO `registry_file` VALUES('sites/all/modules/views/handlers/views_handler_field_math.inc', 'c0f1cd82305ecc2378a7346ed0e4e5503c031b155d53cbfee2c46f82e7996ce4');
INSERT INTO `registry_file` VALUES('sites/all/modules/views/handlers/views_handler_field_numeric.inc', '51311e98172a3f2b9f8d406e4c64f2bc9d1243ab8003e1d421bf6ffa5f0100df');
INSERT INTO `registry_file` VALUES('sites/all/modules/views/handlers/views_handler_field_prerender_list.inc', '0fe605bf457886fbca5f041a422fc51c6a1927654dcd06cbfc619496fe57de0e');
INSERT INTO `registry_file` VALUES('sites/all/modules/views/handlers/views_handler_field_serialized.inc', 'ad3d82a9f37ae4c71a875526c353839da2ff529351efc7861f8b7c9d4b5a47db');
INSERT INTO `registry_file` VALUES('sites/all/modules/views/handlers/views_handler_field_time_interval.inc', '280d569784312d19dabfb7aeb94639442ae37e16cba02659a8251de08a4f1de2');
INSERT INTO `registry_file` VALUES('sites/all/modules/views/handlers/views_handler_field_url.inc', '7ca57a8dcc42a3d1e7e7ec5defa64a689cb678073e15153ff6a7cafe54c90249');
INSERT INTO `registry_file` VALUES('sites/all/modules/views/handlers/views_handler_filter.inc', '70c93c35ffd8829e9e1bb0d8be80ff1641a868abecb41924c3cb2fc513f521ab');
INSERT INTO `registry_file` VALUES('sites/all/modules/views/handlers/views_handler_filter_boolean_operator.inc', 'f4ca59e4e1f91f219a1b33690a4ad412269946804fe7cacf24f2574b2c6d8599');
INSERT INTO `registry_file` VALUES('sites/all/modules/views/handlers/views_handler_filter_boolean_operator_string.inc', '306ce393a7a4f565fa3eaa4ede1bc7fb4b7f91c65c65f759cab864532bc9d182');
INSERT INTO `registry_file` VALUES('sites/all/modules/views/handlers/views_handler_filter_combine.inc', '804377cf5e931fa619c2a40425843b24b0bd6008ccb6e79064e0994d9fd696c2');
INSERT INTO `registry_file` VALUES('sites/all/modules/views/handlers/views_handler_filter_date.inc', 'e8f6b4181f3661155fd3b94355b2707441e87b2a151af669610a26eb0fba6674');
INSERT INTO `registry_file` VALUES('sites/all/modules/views/handlers/views_handler_filter_entity_bundle.inc', '02db977a67a09f70bdc8e2bbc46a05fff8a6d8bd6423308c95418476e84714a3');
INSERT INTO `registry_file` VALUES('sites/all/modules/views/handlers/views_handler_filter_equality.inc', '2100cdd7f5232348adae494c5122ba41ff051eee0a8cc14aeaf6a66202cb7ed1');
INSERT INTO `registry_file` VALUES('sites/all/modules/views/handlers/views_handler_filter_group_by_numeric.inc', '9401c4c0fe0d678898e5288ef8152784a12e0743df21dec15457353eb2cdb01d');
INSERT INTO `registry_file` VALUES('sites/all/modules/views/handlers/views_handler_filter_in_operator.inc', '8fd7f075468bddde5c4208b1c3a6105f8fea0ac0c214452a37c00fc2f3453a7d');
INSERT INTO `registry_file` VALUES('sites/all/modules/views/handlers/views_handler_filter_many_to_one.inc', 'b4a415c2824195d3d7d0e37ada9d69ebec0b9cd833ebcac2439efc20aac15595');
INSERT INTO `registry_file` VALUES('sites/all/modules/views/handlers/views_handler_filter_numeric.inc', '8a999227d17674a70381ab8b45fbdc91269a83a45e5f7514607ed8b4a5bf6a9f');
INSERT INTO `registry_file` VALUES('sites/all/modules/views/handlers/views_handler_filter_string.inc', '140006335ac5b19b6253b431afde624db70385b9d22390b8c275296ae469cc7b');
INSERT INTO `registry_file` VALUES('sites/all/modules/views/handlers/views_handler_relationship.inc', '4fefdb6c9c48b72dcfe86484123b97eb5f5b90b6a440d8026d71f74dccbd1cd6');
INSERT INTO `registry_file` VALUES('sites/all/modules/views/handlers/views_handler_relationship_groupwise_max.inc', '47dcfe351159b10153697c17b3a92607edb34a258ba3b44087c947b9cc88e86f');
INSERT INTO `registry_file` VALUES('sites/all/modules/views/handlers/views_handler_sort.inc', '06aab8d75f3dce81eb032128b8f755bfff752dcefc2e5d494b137bca161fdefa');
INSERT INTO `registry_file` VALUES('sites/all/modules/views/handlers/views_handler_sort_date.inc', 'd7e771abf74585bd09cc8e666747a093f40848b451de8ba67c8158317946f1b2');
INSERT INTO `registry_file` VALUES('sites/all/modules/views/handlers/views_handler_sort_group_by_numeric.inc', '4ba1c38c9af32789a951b8f9377e13631ae26bf1dac3371b31a37ead25b32eb8');
INSERT INTO `registry_file` VALUES('sites/all/modules/views/handlers/views_handler_sort_menu_hierarchy.inc', 'ccd65ea3b3270366b7175e2cd7cc9167a09c27e1486949e4a05495ff5c7be5c1');
INSERT INTO `registry_file` VALUES('sites/all/modules/views/handlers/views_handler_sort_random.inc', '05a00c3bf76c3278ae0ce39a206a6224089faf5ac4a00dd5b8a558f06fab8e46');
INSERT INTO `registry_file` VALUES('sites/all/modules/views/includes/base.inc', '8389f49a2bc00819c00eae88fc30630151a3487c54a17472956adc4b2c596d04');
INSERT INTO `registry_file` VALUES('sites/all/modules/views/includes/handlers.inc', '1ed338807e8fcdeab6432f374649b6adb03f9e3011ad019f408a6206605a01ea');
INSERT INTO `registry_file` VALUES('sites/all/modules/views/includes/plugins.inc', 'bb12703a4a4e8bbc42ecc8ce27bf98546d9ea024324f4d03ba77348ec18b328c');
INSERT INTO `registry_file` VALUES('sites/all/modules/views/includes/view.inc', '1c4773c34303378c10325d5bb8fd55a3c88b7f80c307d7daf7c3d2dfe80ead33');
INSERT INTO `registry_file` VALUES('sites/all/modules/views/modules/aggregator/views_handler_argument_aggregator_category_cid.inc', '97acf41d6694fd4451909c18b118f482db9f39aa4b8c5cfa75d044d410c46012');
INSERT INTO `registry_file` VALUES('sites/all/modules/views/modules/aggregator/views_handler_argument_aggregator_fid.inc', 'c37def91d635b01db36809141d147d263cc910895e11c05e73d703e86b39fd43');
INSERT INTO `registry_file` VALUES('sites/all/modules/views/modules/aggregator/views_handler_argument_aggregator_iid.inc', '344f2806344d9c6356f2e19d297522f53bab7a4cebdf23c76d04c85c9e0a0d8e');
INSERT INTO `registry_file` VALUES('sites/all/modules/views/modules/aggregator/views_handler_field_aggregator_category.inc', '252b30b832d8c0097d6878f5d56beecfc8cc1fc7cc8b5a4670d8d95a80b4f17d');
INSERT INTO `registry_file` VALUES('sites/all/modules/views/modules/aggregator/views_handler_field_aggregator_title_link.inc', '1bb18967b11f2f4de62075d27e483f175b5e3431622c2e5e8292afcd000beadf');
INSERT INTO `registry_file` VALUES('sites/all/modules/views/modules/aggregator/views_handler_field_aggregator_xss.inc', '2db2e1f0500e0a252c7367e6a92906870b3247f9d424f999c381368ee2c76597');
INSERT INTO `registry_file` VALUES('sites/all/modules/views/modules/aggregator/views_handler_filter_aggregator_category_cid.inc', '7c7c0690c836ac1b75bca3433aca587b79aec3e7d072ce97dc9b33a35780ad4f');
INSERT INTO `registry_file` VALUES('sites/all/modules/views/modules/aggregator/views_plugin_row_aggregator_rss.inc', '591e5bb7272e389fe5fc2b563f8887dbc3674811ffbb41333d36a7a9a1859e56');
INSERT INTO `registry_file` VALUES('sites/all/modules/views/modules/book/views_plugin_argument_default_book_root.inc', 'bd3bd9496bf519b1688cf39396f3afa495a29c8190a3e173c0740f4d20606a53');
INSERT INTO `registry_file` VALUES('sites/all/modules/views/modules/comment/views_handler_argument_comment_user_uid.inc', '5e29f7523010a074bda7c619b24c5d31e0c060cdbe47136b8b16b2f198ed4b4a');
INSERT INTO `registry_file` VALUES('sites/all/modules/views/modules/comment/views_handler_field_comment.inc', 'a126d690cc5bf8491cb4bee4cc8237b90e86768bebbbecb8a9409a3c1e00fa9e');
INSERT INTO `registry_file` VALUES('sites/all/modules/views/modules/comment/views_handler_field_comment_depth.inc', '1dc353a31d3c71c67d0b3e6854d9e767e421010fbbf6a8b04a14035e5f7c097f');
INSERT INTO `registry_file` VALUES('sites/all/modules/views/modules/comment/views_handler_field_comment_link.inc', '1f7382f7cb05c65a7cba44e4cd58022bbc6ce5597b96228d1891d7720510bf0e');
INSERT INTO `registry_file` VALUES('sites/all/modules/views/modules/comment/views_handler_field_comment_link_approve.inc', 'f6db8a0b4dd9fffba9d8ecb7b7363ba99d3b2dc7176436a0a6dd7a93195a5789');
INSERT INTO `registry_file` VALUES('sites/all/modules/views/modules/comment/views_handler_field_comment_link_delete.inc', '905a4cb1f91a4b40ee1ca1d1ded9958ae18e82286589fec100adb676769b1fe9');
INSERT INTO `registry_file` VALUES('sites/all/modules/views/modules/comment/views_handler_field_comment_link_edit.inc', '8139c932cde20f366a3019111c054b1ed00dbc0c40634b91239b400243b7723a');
INSERT INTO `registry_file` VALUES('sites/all/modules/views/modules/comment/views_handler_field_comment_link_reply.inc', '8807884efb840407696c909b9d5d07f60bde9d7f385a59eca214178ce5369558');
INSERT INTO `registry_file` VALUES('sites/all/modules/views/modules/comment/views_handler_field_comment_node_link.inc', '64746ff2b80a5f8e83b996a325c3d5c8393934c331510b93d5815ea11c1db162');
INSERT INTO `registry_file` VALUES('sites/all/modules/views/modules/comment/views_handler_field_comment_username.inc', '1ce3fa61b3933a3e15466760e4c5d4a85407ba4c8753422b766fc04395fa4d02');
INSERT INTO `registry_file` VALUES('sites/all/modules/views/modules/comment/views_handler_field_last_comment_timestamp.inc', '30c55ec6d55bf4928b757f2a236aab56d34a8e6955944a1471e9d7b7aed057c0');
INSERT INTO `registry_file` VALUES('sites/all/modules/views/modules/comment/views_handler_field_ncs_last_comment_name.inc', '82025f3ad22b63abc57172d358b3f975006109802f4a5ecac93ce3785c505cae');
INSERT INTO `registry_file` VALUES('sites/all/modules/views/modules/comment/views_handler_field_ncs_last_updated.inc', 'facfbc5defd843f4dfb60e645f09a784234d87876628c8de98d2dfa6bb98a895');
INSERT INTO `registry_file` VALUES('sites/all/modules/views/modules/comment/views_handler_field_node_comment.inc', '0cf9e8fb416dca35c3b9df3125eb3a8585f798c6a8f8d0e1034b1fccb5cec38b');
INSERT INTO `registry_file` VALUES('sites/all/modules/views/modules/comment/views_handler_field_node_new_comments.inc', 'e0830d1f70dea473e46ab2b86e380ef741b2907f033777889f812f46989f2ff7');
INSERT INTO `registry_file` VALUES('sites/all/modules/views/modules/comment/views_handler_filter_comment_user_uid.inc', 'f526c2c4153b28d7b144054828261ba7b26566169350477cd4fb3f5b5f280719');
INSERT INTO `registry_file` VALUES('sites/all/modules/views/modules/comment/views_handler_filter_ncs_last_updated.inc', '9369675dfee24891fe19bddf85a847c275b8127949c55112ae5cb4d422977d24');
INSERT INTO `registry_file` VALUES('sites/all/modules/views/modules/comment/views_handler_filter_node_comment.inc', '70706c47bad9180c2426005da6c178ed8d27b75b28cb797ca2a1925a96dcef09');
INSERT INTO `registry_file` VALUES('sites/all/modules/views/modules/comment/views_handler_sort_comment_thread.inc', 'a64bc780cba372bd408f08a5ea9289cdf3d40562bdf2f7320657be9a9f6c7882');
INSERT INTO `registry_file` VALUES('sites/all/modules/views/modules/comment/views_handler_sort_ncs_last_comment_name.inc', '9f039e8b8a046c058fda620804e3503be7b3e7e3e4119f0b015ccbae0922635b');
INSERT INTO `registry_file` VALUES('sites/all/modules/views/modules/comment/views_handler_sort_ncs_last_updated.inc', 'fa8b9c3614ad5838aa40194940d9dc6935175a16e141ac919f40e74a7428c4e3');
INSERT INTO `registry_file` VALUES('sites/all/modules/views/modules/comment/views_plugin_row_comment_rss.inc', 'ab97ac0ed4e6d7f2d44dc4ae9c5a84fe5658b739e1b609e5a877df528c3aa970');
INSERT INTO `registry_file` VALUES('sites/all/modules/views/modules/comment/views_plugin_row_comment_view.inc', '82d7296fa3109ca170f66f6f3b5e1209af98a9519bb5e4a2c42d9fc0e95d7078');
INSERT INTO `registry_file` VALUES('sites/all/modules/views/modules/contact/views_handler_field_contact_link.inc', 'ec783b215a06c89c0933107a580c144051118305dd0129ac28a7fea5f95a8fd5');
INSERT INTO `registry_file` VALUES('sites/all/modules/views/modules/field/views_handler_argument_field_list.inc', 'eff5152a2c120425a2a75fe7dbcb49ed86e5d48392b0f45b49c2e7abee9fa72b');
INSERT INTO `registry_file` VALUES('sites/all/modules/views/modules/field/views_handler_argument_field_list_string.inc', '534af91d92da7a622580ab8b262f9ef76241671a5185f30ba81898806c7b7f15');
INSERT INTO `registry_file` VALUES('sites/all/modules/views/modules/field/views_handler_field_field.inc', 'da78d77eff6f6292ebcacc61aef1d92dcae59ccedb6ab111a44fb28253d9d116');
INSERT INTO `registry_file` VALUES('sites/all/modules/views/modules/field/views_handler_filter_field_list.inc', '3b55cd0a14453c95ebd534507ab842a8505496d0b7e4c7fcd61c186034c7322d');
INSERT INTO `registry_file` VALUES('sites/all/modules/views/modules/field/views_handler_relationship_entity_reverse.inc', '060035c5430c81671e4541bcf7de833c8a1eb3fa3f3a9db94dd3cebfa4299ef1');
INSERT INTO `registry_file` VALUES('sites/all/modules/views/modules/filter/views_handler_field_filter_format_name.inc', 'fc3f074ffb39822182783a8d5cf2b89ffcc097ccbb2ed15818a72a99e3a18468');
INSERT INTO `registry_file` VALUES('sites/all/modules/views/modules/locale/views_handler_argument_locale_group.inc', 'c8545411096da40f48eef8ec59391f4729c884079482e3e5b3cdd5578a1f9ad7');
INSERT INTO `registry_file` VALUES('sites/all/modules/views/modules/locale/views_handler_argument_locale_language.inc', 'a1b6505bb26e4b3abce543b9097cd0a7b8cddf00bf1e49fbba86febebb0f4486');
INSERT INTO `registry_file` VALUES('sites/all/modules/views/modules/locale/views_handler_field_locale_group.inc', '5b62afe18f92ee4a5fb49eb0995e65b4744bbe3b9c24ffe8f6c21f3191c04afc');
INSERT INTO `registry_file` VALUES('sites/all/modules/views/modules/locale/views_handler_field_locale_language.inc', '0cc08bd2d42e07f26e7acc92642b36f0ac62bf23ee9ba3fd21e6cab9a80e9f72');
INSERT INTO `registry_file` VALUES('sites/all/modules/views/modules/locale/views_handler_field_locale_link_edit.inc', '836ceb1883047011ac1b3dca2254861b8caa1ea67405b3cdbe0fa6f3fbbd5a96');
INSERT INTO `registry_file` VALUES('sites/all/modules/views/modules/locale/views_handler_field_node_language.inc', 'a6ccdb6c1c4df3b4fd31b714f5aa4ac99771ffce63439d6c5de6c0ae2f09a2c1');
INSERT INTO `registry_file` VALUES('sites/all/modules/views/modules/locale/views_handler_filter_locale_group.inc', '40fbc041bab64f336f59d1e0593f184b879b2a0c9e2a6050709bdc54cceb2716');
INSERT INTO `registry_file` VALUES('sites/all/modules/views/modules/locale/views_handler_filter_locale_language.inc', '3433893d988aad36b918dd6214f5258b701506bc9c0c6a72fd854a036b635e20');
INSERT INTO `registry_file` VALUES('sites/all/modules/views/modules/locale/views_handler_filter_locale_version.inc', '9337ea5216784ffc67a0aa45c946e65ad11fc40849189cc70911a81366b78620');
INSERT INTO `registry_file` VALUES('sites/all/modules/views/modules/locale/views_handler_filter_node_language.inc', 'd7edea3f35891cc76aa3bb185b9c1404378623ea7fd214c2a1f0d824df12779a');
INSERT INTO `registry_file` VALUES('sites/all/modules/views/modules/node/views_handler_argument_dates_various.inc', 'd2c17e6ec3d221bdd0d1c060da4b0c85274c8ac5a0b624b1469b162694a8d0f5');
INSERT INTO `registry_file` VALUES('sites/all/modules/views/modules/node/views_handler_argument_node_language.inc', '7ee3ba02bddaa6aeef9961cdf6af7bb386fc2b12529f095b28520bb98af51775');
INSERT INTO `registry_file` VALUES('sites/all/modules/views/modules/node/views_handler_argument_node_nid.inc', '11c5b62413ffd1b2c66d4b60a2fe21cf6eb839ae40d4ef81c7a938c5be3e30de');
INSERT INTO `registry_file` VALUES('sites/all/modules/views/modules/node/views_handler_argument_node_type.inc', '9e21b4cc4ae861f58c804ea7e2c17fbc5dd2a7938b9abfeb54437b531fc95e6e');
INSERT INTO `registry_file` VALUES('sites/all/modules/views/modules/node/views_handler_argument_node_uid_revision.inc', '675c99f8da9748ac507e202f546914bee3ed4065f6ce83a23a2aaafdaefd084e');
INSERT INTO `registry_file` VALUES('sites/all/modules/views/modules/node/views_handler_argument_node_vid.inc', '7e5da5594a336c1d0f4cf080ab3fcd690e0de1ee6b5e1830b5fb76a46bced19c');
INSERT INTO `registry_file` VALUES('sites/all/modules/views/modules/node/views_handler_field_history_user_timestamp.inc', '7d6d9c8273d317ab908d4873a32086dbd5f78a2b2d07b7ed79975841a2cadea6');
INSERT INTO `registry_file` VALUES('sites/all/modules/views/modules/node/views_handler_field_node.inc', '99a0ef52b68e8913eb3563d5c47097c09e46c6493fcb006f383c6f6798edb7fc');
INSERT INTO `registry_file` VALUES('sites/all/modules/views/modules/node/views_handler_field_node_link.inc', '26d8309a3a9140682d7d90e4d16ff664a3d7ce662af6ccbf75dc4c493515d7d9');
INSERT INTO `registry_file` VALUES('sites/all/modules/views/modules/node/views_handler_field_node_link_delete.inc', '3eeed8c9ffc088ee28b8ffaa5e2b084db24284acc4d1b2e69f90c96cc889016d');
INSERT INTO `registry_file` VALUES('sites/all/modules/views/modules/node/views_handler_field_node_link_edit.inc', '28f8c3b7d3d60c31fec3cdf81c84cfbb20f492220457694a0e150c3ddee030c0');
INSERT INTO `registry_file` VALUES('sites/all/modules/views/modules/node/views_handler_field_node_path.inc', 'f392fde21e434fd40fc672546ef684780179d91827350ba9c348bb1cc5924727');
INSERT INTO `registry_file` VALUES('sites/all/modules/views/modules/node/views_handler_field_node_revision.inc', '3f510d58acaa8f844292b86c388cb1e78eac8c732bb5e7c9e92439c425710240');
INSERT INTO `registry_file` VALUES('sites/all/modules/views/modules/node/views_handler_field_node_revision_link.inc', 'ace72f296cf4a4da4b7dd7b303532aebf93b6b1c18a5d30b51b65738475e3889');
INSERT INTO `registry_file` VALUES('sites/all/modules/views/modules/node/views_handler_field_node_revision_link_delete.inc', '0a36602f080c4ef2bb5cb7dbddc5533deab7743c2fbf3bd88b9e478432cac7fb');
INSERT INTO `registry_file` VALUES('sites/all/modules/views/modules/node/views_handler_field_node_revision_link_revert.inc', '80ddc7f0c001fde9af491bb22d6044b85324fe90bea611fc3822408fd60008fa');
INSERT INTO `registry_file` VALUES('sites/all/modules/views/modules/node/views_handler_field_node_type.inc', 'f8f39c6f238f837270d1b2e42e67bf9ab400a37fe24246c8b86dfcfacc1c4fd9');
INSERT INTO `registry_file` VALUES('sites/all/modules/views/modules/node/views_handler_filter_history_user_timestamp.inc', '2970f270e071cad079880e9598d9f7b71d4dd2a2a42a31cd4489029a3cafe158');
INSERT INTO `registry_file` VALUES('sites/all/modules/views/modules/node/views_handler_filter_node_access.inc', 'ca625167c8928f1c5b354c27c120ed9b19c1df665dc3b02ed6d96b58194d6243');
INSERT INTO `registry_file` VALUES('sites/all/modules/views/modules/node/views_handler_filter_node_status.inc', 'f7099a59d3f237f2870ecb6b0b5e49dd9d785b1085e94baf55687251e7f3231b');
INSERT INTO `registry_file` VALUES('sites/all/modules/views/modules/node/views_handler_filter_node_type.inc', '6842082e7b6e131d6e002e627e6b4490b93ca6ffe7fc0b158d31843217c8c929');
INSERT INTO `registry_file` VALUES('sites/all/modules/views/modules/node/views_handler_filter_node_uid_revision.inc', 'b221785bc9a736ef67e4f03e6b26235333115b5b9ce571095de5c5286dd8d744');
INSERT INTO `registry_file` VALUES('sites/all/modules/views/modules/node/views_plugin_argument_default_node.inc', '7fb79c8f4adb9bcef7c7da4bf4046fe3490e16c244f6ab96fdca97a8567315ff');
INSERT INTO `registry_file` VALUES('sites/all/modules/views/modules/node/views_plugin_argument_validate_node.inc', 'f10d3f4081eed5ca32c41b67e9a0e6f35b2f8ba2cd7897230cb5a680b410a6de');
INSERT INTO `registry_file` VALUES('sites/all/modules/views/modules/node/views_plugin_row_node_rss.inc', 'd170c2aab84b73c862bfa79b7aa3f83f2a6d4668235970a1a797ce6d57501308');
INSERT INTO `registry_file` VALUES('sites/all/modules/views/modules/node/views_plugin_row_node_view.inc', '713e1c83702ac2d0d7fe76374110cdfd657598a8f3b086ec2352f2de38101504');
INSERT INTO `registry_file` VALUES('sites/all/modules/views/modules/profile/views_handler_field_profile_date.inc', '4f357b26c60afe2b812c995be69ebce6c6f4ea13075613baad7ec0aef1960d18');
INSERT INTO `registry_file` VALUES('sites/all/modules/views/modules/profile/views_handler_field_profile_list.inc', 'da5fa527ab4bb6a1ff44cc2f9cec91cf3b094670f9e6e3884e1fedce714afe6f');
INSERT INTO `registry_file` VALUES('sites/all/modules/views/modules/profile/views_handler_filter_profile_selection.inc', '758dea53760a1b655986c33d21345ac396ad41d10ddf39dd16bc7d8c68e72da7');
INSERT INTO `registry_file` VALUES('sites/all/modules/views/modules/search/views_handler_argument_search.inc', '3c20f1234af341ea2229419980d8405b7eca5005c1e0ee387c8d5cd7a58c5c60');
INSERT INTO `registry_file` VALUES('sites/all/modules/views/modules/search/views_handler_field_search_score.inc', '711af637c864b775672d9f6203fc2da0902ed17404181d1117b400012aac366f');
INSERT INTO `registry_file` VALUES('sites/all/modules/views/modules/search/views_handler_filter_search.inc', '15d63289e4821f329f44eb40dc121375e024e61fc2f1158f71b3d6c77fe6c4f1');
INSERT INTO `registry_file` VALUES('sites/all/modules/views/modules/search/views_handler_sort_search_score.inc', '9d23dd6c464d486266749106caec1d10cec2da1cc3ae5f907f39056c46badbdf');
INSERT INTO `registry_file` VALUES('sites/all/modules/views/modules/search/views_plugin_row_search_view.inc', 'bc25864154d4df0a58bc1ac1148581c76df36267a1d18f8caee2e3e1233c8286');
INSERT INTO `registry_file` VALUES('sites/all/modules/views/modules/statistics/views_handler_field_accesslog_path.inc', '7843e5f4b35f4322d673b5646e840c274f7d747f2c60c4d4e9c47e282e6db37d');
INSERT INTO `registry_file` VALUES('sites/all/modules/views/modules/system/views_handler_argument_file_fid.inc', 'e9bf1fdf12f210f0a77774381b670c77ee88e7789971ce732b254f6be5a0e451');
INSERT INTO `registry_file` VALUES('sites/all/modules/views/modules/system/views_handler_field_file.inc', '0fff4adb471c0c164a78f507b035a68d41f404ab10535f06f6c11206f39a7681');
INSERT INTO `registry_file` VALUES('sites/all/modules/views/modules/system/views_handler_field_file_extension.inc', 'f833f6ccd098994d91032d40c0eaf5817559917d860f8f2dd8b82768ca616c91');
INSERT INTO `registry_file` VALUES('sites/all/modules/views/modules/system/views_handler_field_file_filemime.inc', 'bdd7f1255f3000f7f2900341d4c4ca378244b96390ef52a30db2962d017b61a4');
INSERT INTO `registry_file` VALUES('sites/all/modules/views/modules/system/views_handler_field_file_status.inc', 'bfb0b9d796a4dbf95c4bb7a3deef7724bcda9e0d9067939b74ec787da934f2b0');
INSERT INTO `registry_file` VALUES('sites/all/modules/views/modules/system/views_handler_field_file_uri.inc', '350d7dde27ee97cb4279360374eb8633ce7fee115a109346bea85c2c4e3a68c2');
INSERT INTO `registry_file` VALUES('sites/all/modules/views/modules/system/views_handler_filter_file_status.inc', '9210a34795f9db36974525e718c91c03c28554da1199932791925d7c4a2f3b11');
INSERT INTO `registry_file` VALUES('sites/all/modules/views/modules/system/views_handler_filter_system_type.inc', 'd27513703a75c4d8af79b489266cf4102a36e350c3d90404dab24403ab637205');
INSERT INTO `registry_file` VALUES('sites/all/modules/views/modules/taxonomy/views_handler_argument_taxonomy.inc', '8962fa76f1e03316932468b0fd805817af94726beb82bf9f4786e0c709264662');
INSERT INTO `registry_file` VALUES('sites/all/modules/views/modules/taxonomy/views_handler_argument_term_node_tid.inc', '79a80284231b3bc5aab36833e8200853686784f880dc6b104552d61fc602f27c');
INSERT INTO `registry_file` VALUES('sites/all/modules/views/modules/taxonomy/views_handler_argument_term_node_tid_depth.inc', '5b2806fbad4a6cc104e733a3a0faf6eb1c19975930c67c4149fb3267976e0b7d');
INSERT INTO `registry_file` VALUES('sites/all/modules/views/modules/taxonomy/views_handler_argument_term_node_tid_depth_modifier.inc', 'd85ebe68290239b25fc240451655b825325854e9707cf742fbd75de81e0f1aa7');
INSERT INTO `registry_file` VALUES('sites/all/modules/views/modules/taxonomy/views_handler_argument_vocabulary_machine_name.inc', '888647527bec3444b2d0a571a77900396d7c5e884bca04a2a3667a61f6377b5e');
INSERT INTO `registry_file` VALUES('sites/all/modules/views/modules/taxonomy/views_handler_argument_vocabulary_vid.inc', 'bf4be783ef6899f004f4dbd06c1bf2cd6dbc322678c825eec36bee81d667e81f');
INSERT INTO `registry_file` VALUES('sites/all/modules/views/modules/taxonomy/views_handler_field_taxonomy.inc', 'b0dd5cfa87c44b95aefd819444e4985c1773350bcf9fe073a2ef5c82b680b833');
INSERT INTO `registry_file` VALUES('sites/all/modules/views/modules/taxonomy/views_handler_field_term_link_edit.inc', '3da63f6feb1fa3312853b54585d761d037dac8841b4c06e01e35463c9098064a');
INSERT INTO `registry_file` VALUES('sites/all/modules/views/modules/taxonomy/views_handler_field_term_node_tid.inc', '29c5132ac98a2959405e44f9a83096b0dcfa30ed7fb4688453ca7e1fc779684b');
INSERT INTO `registry_file` VALUES('sites/all/modules/views/modules/taxonomy/views_handler_filter_term_node_tid.inc', '0fd0384ec873d6db244da736e6f5f811ece9a8a5673aeca609a2a3f17f61fc45');
INSERT INTO `registry_file` VALUES('sites/all/modules/views/modules/taxonomy/views_handler_filter_term_node_tid_depth.inc', '0b05ec052dcc03081e20338808dda17beb0bdf869b0cfc1375ca96cfb758c22a');
INSERT INTO `registry_file` VALUES('sites/all/modules/views/modules/taxonomy/views_handler_filter_vocabulary_machine_name.inc', 'f1787b436b914cfe5ca6f2575d4c0595f4f496795711d6e8a116a39986728b0a');
INSERT INTO `registry_file` VALUES('sites/all/modules/views/modules/taxonomy/views_handler_filter_vocabulary_vid.inc', '2a4d7dfbb6b795d217e2617595238f552bbea04b80217c933f1ee9978ceb7a0e');
INSERT INTO `registry_file` VALUES('sites/all/modules/views/modules/taxonomy/views_handler_relationship_node_term_data.inc', '995345469938c7796ed77cb010984cb01c0d712386ae4a5f447e843620248570');
INSERT INTO `registry_file` VALUES('sites/all/modules/views/modules/taxonomy/views_plugin_argument_default_taxonomy_tid.inc', 'fc4c3ace525162fc922de581af0710c7d92dc355e9630040a29a5c3a6ab7f9af');
INSERT INTO `registry_file` VALUES('sites/all/modules/views/modules/taxonomy/views_plugin_argument_validate_taxonomy_term.inc', 'd1a7aa7ebd9c698afcdcf75b2f0affa981124064ff787ebc716bfac3ee0f60af');
INSERT INTO `registry_file` VALUES('sites/all/modules/views/modules/tracker/views_handler_argument_tracker_comment_user_uid.inc', '91f5b7e9537942eee7a1798906f772cb9806eebfdc201c54fcdecf027cd71d0f');
INSERT INTO `registry_file` VALUES('sites/all/modules/views/modules/tracker/views_handler_filter_tracker_boolean_operator.inc', '5efea908902052d68141017b6f29f17381e7bb8ebb6d88245471926f0a552207');
INSERT INTO `registry_file` VALUES('sites/all/modules/views/modules/tracker/views_handler_filter_tracker_comment_user_uid.inc', '05e07f74d1e3978afd4c80a9b4bd72444872b84a44949a512f1d3040ce28421c');
INSERT INTO `registry_file` VALUES('sites/all/modules/views/modules/translation/views_handler_argument_node_tnid.inc', 'b0e3c87d3790cfa2e265f3d9700f2b3c2857932aa4b6e003e5d0114fc1b4d499');
INSERT INTO `registry_file` VALUES('sites/all/modules/views/modules/translation/views_handler_field_node_link_translate.inc', '27a1ac81b50d4807d9a1eff4c5dc8929e4472f9d363f70f5391a794db73424a2');
INSERT INTO `registry_file` VALUES('sites/all/modules/views/modules/translation/views_handler_field_node_translation_link.inc', '641ff25cd317bb803de2ace4bd23e8c5f5af5ba4ac38aab7be2fdc58fbb9e86a');
INSERT INTO `registry_file` VALUES('sites/all/modules/views/modules/translation/views_handler_filter_node_tnid.inc', '0942fd793740e3aec032a1abb7132f53788a9cdeaeb3d931cac908ac30b73950');
INSERT INTO `registry_file` VALUES('sites/all/modules/views/modules/translation/views_handler_filter_node_tnid_child.inc', '2a7a96d6caa4a99996549be0457bf40fa619731543a636d4573e55c190c64c7a');
INSERT INTO `registry_file` VALUES('sites/all/modules/views/modules/translation/views_handler_relationship_translation.inc', '9137c85f5ca309d4ee0d3243c470563a5853f5926b8cbd3e843438d4308c9516');
INSERT INTO `registry_file` VALUES('sites/all/modules/views/modules/user/views_handler_argument_users_roles_rid.inc', '72da80e7f3c6980da024d86f37ba3721021cc1ead2cfcc1ab9b27897b7b5077a');
INSERT INTO `registry_file` VALUES('sites/all/modules/views/modules/user/views_handler_argument_user_uid.inc', 'a4af1bdc1ec5e40587c22c14e839980050baaa346c9d5934ef3f01794932cdc5');
INSERT INTO `registry_file` VALUES('sites/all/modules/views/modules/user/views_handler_field_user.inc', '1a2141524e43d86b52c7828fe6df61dd603ad433743c1139cfc5cc28ccb5ce74');
INSERT INTO `registry_file` VALUES('sites/all/modules/views/modules/user/views_handler_field_user_language.inc', '5a3da9e08ebeebbcb5abc6a9b16e0d380c5bb5c57b608afb540a3ca6dc1b2959');
INSERT INTO `registry_file` VALUES('sites/all/modules/views/modules/user/views_handler_field_user_link.inc', '5a0f35d5305a29816658385ecbd804bf43c92d4b3629fbe4bd9b8d0e9574b6ff');
INSERT INTO `registry_file` VALUES('sites/all/modules/views/modules/user/views_handler_field_user_link_cancel.inc', 'bcc690f03eca154ad02d1de3ebca7d99129455e8c8602c0642382ae66a6d2872');
INSERT INTO `registry_file` VALUES('sites/all/modules/views/modules/user/views_handler_field_user_link_edit.inc', '5d7c1155d9eccbd6b07c7446fe2b6a8848d6a500f508ac3779f16df56816f92b');
INSERT INTO `registry_file` VALUES('sites/all/modules/views/modules/user/views_handler_field_user_mail.inc', 'b7355b704f19322afb4876cea27744367e20098d4ed973e480bf2baf1ddd111c');
INSERT INTO `registry_file` VALUES('sites/all/modules/views/modules/user/views_handler_field_user_name.inc', '5fd9a4d7843fee83cf529384a52d7ae69e40a9c8846e7f285e94f4bbbf8c7e29');
INSERT INTO `registry_file` VALUES('sites/all/modules/views/modules/user/views_handler_field_user_permissions.inc', 'ec37373524bf23ae107adda6b825570c550e6654c0f0956409fc58df2c860903');
INSERT INTO `registry_file` VALUES('sites/all/modules/views/modules/user/views_handler_field_user_picture.inc', '0103d136a91fb219fd981801301b7df00adf90617900ded08efbf6d7df04959b');
INSERT INTO `registry_file` VALUES('sites/all/modules/views/modules/user/views_handler_field_user_roles.inc', 'ab5068c4f01a05c6511f7d4b973a77650d5b5c481d4a73f63b7a9b1ef9c0d138');
INSERT INTO `registry_file` VALUES('sites/all/modules/views/modules/user/views_handler_filter_user_current.inc', '7f70b7e3b3c10e75d95f54afc9c2fe2f1af9b7a9eab2308d2961b2588dc05845');
INSERT INTO `registry_file` VALUES('sites/all/modules/views/modules/user/views_handler_filter_user_name.inc', '5225e5d89051313e0e49ea833709bb4dc44369afeee970b0cfaf1818ababa22c');
INSERT INTO `registry_file` VALUES('sites/all/modules/views/modules/user/views_handler_filter_user_permissions.inc', 'a72e8d02c1075cebfee33e5b046460eef9193b2a7c1d47ff130457e4485b6fe5');
INSERT INTO `registry_file` VALUES('sites/all/modules/views/modules/user/views_handler_filter_user_roles.inc', '3bb69fbc4e352ce8e4840ec78bdd0f1f29e8709097ce6b29cc2fedd2c74c023e');
INSERT INTO `registry_file` VALUES('sites/all/modules/views/modules/user/views_plugin_argument_default_current_user.inc', '11e729115350deffe46ebfe3a55281fa169a90e38a76c3a9d98f26c87900a22b');
INSERT INTO `registry_file` VALUES('sites/all/modules/views/modules/user/views_plugin_argument_default_user.inc', 'fe567f009a8e20f402f104b157fd44c04d6bd886a39b2f3355104f644f905419');
INSERT INTO `registry_file` VALUES('sites/all/modules/views/modules/user/views_plugin_argument_validate_user.inc', '40d623b0a678fa7c292da92582f06449d0396341ab161069f0fe8d1086ab95da');
INSERT INTO `registry_file` VALUES('sites/all/modules/views/modules/user/views_plugin_row_user_view.inc', '52548cca3f18d25b06cfce15ee00acea530b85bd22a10944d984b5a798c5969f');
INSERT INTO `registry_file` VALUES('sites/all/modules/views/plugins/export_ui/views_ui.class.php', '8548322a602b99e4343948255a8c89b034e005a29d71e499cea7c60a4d8a6d87');
INSERT INTO `registry_file` VALUES('sites/all/modules/views/plugins/views_plugin_access.inc', 'cc16bf7dc4c10eab382e948cfd91902ac1055514b627e3c50932376d3e3f1b91');
INSERT INTO `registry_file` VALUES('sites/all/modules/views/plugins/views_plugin_access_none.inc', '8e0a6b706c60abf63ab84d8624567ca12a5b80ad293e4334790065fbe6fa14d4');
INSERT INTO `registry_file` VALUES('sites/all/modules/views/plugins/views_plugin_access_perm.inc', '1807a9c91485a5abd3fb2f6590ed4bc185fdabe308db37b169be8abdfc30cab2');
INSERT INTO `registry_file` VALUES('sites/all/modules/views/plugins/views_plugin_access_role.inc', '8784836ea87ec6b0974125ed95ed6bbf6fdf91624f496f22c28e9229c695068d');
INSERT INTO `registry_file` VALUES('sites/all/modules/views/plugins/views_plugin_argument_default.inc', '43e593760f0e8f031f2e7b861385caa5e39f37de400fe4595925288c78f52f23');
INSERT INTO `registry_file` VALUES('sites/all/modules/views/plugins/views_plugin_argument_default_fixed.inc', 'daaa3b59b54cbb11e411e010303f67a51348bb97a4e06997b475f4c41e91c4e0');
INSERT INTO `registry_file` VALUES('sites/all/modules/views/plugins/views_plugin_argument_default_php.inc', '7a133b603294bfe498bfdeb50fade0b6e3cf8862270376067d86f69e7dc50eb8');
INSERT INTO `registry_file` VALUES('sites/all/modules/views/plugins/views_plugin_argument_default_raw.inc', '4318e0dfa56f167183453cf8cd913f3b7ee539b77a096507905e36db12ded97e');
INSERT INTO `registry_file` VALUES('sites/all/modules/views/plugins/views_plugin_argument_validate.inc', 'c71e2b54623cc62530ebb717dec1406c76200a59270d9c60b3be290694c9fdd8');
INSERT INTO `registry_file` VALUES('sites/all/modules/views/plugins/views_plugin_argument_validate_numeric.inc', 'c050d3b5723dbfdca9ad312c7fa198e509c626057b95eed326820ce733dd9730');
INSERT INTO `registry_file` VALUES('sites/all/modules/views/plugins/views_plugin_argument_validate_php.inc', '56a09922081a5e368d5796907727e35cbf43b0d634e53f947990c8a42d5b5f3e');
INSERT INTO `registry_file` VALUES('sites/all/modules/views/plugins/views_plugin_cache.inc', '5a8d4d584ab973b512ca674b45a1e2a4d43d18d420b333cf8179f1ce79d23d85');
INSERT INTO `registry_file` VALUES('sites/all/modules/views/plugins/views_plugin_cache_none.inc', 'a0d0ba252e1e2b65350c7ce648b97364726fa8ded5a366bfcce30c62daee4450');
INSERT INTO `registry_file` VALUES('sites/all/modules/views/plugins/views_plugin_cache_time.inc', '10db3dd52b06478b7be9b858f3a053ae2c2f6377abe488ad912f8ca786200a1d');
INSERT INTO `registry_file` VALUES('sites/all/modules/views/plugins/views_plugin_display.inc', 'e795572a7578eadf9af19ef503f31ef2cfb482d3b5c92f2ded7178fc5b55371b');
INSERT INTO `registry_file` VALUES('sites/all/modules/views/plugins/views_plugin_display_attachment.inc', '712f4b78334d8b9abe275ef309541f69ae920117c82930cba1ddbb163cb078f5');
INSERT INTO `registry_file` VALUES('sites/all/modules/views/plugins/views_plugin_display_block.inc', 'be9e3c4a9e28270147bb21de8056712d58e47eeddf6e002fdb9425996d5d5ead');
INSERT INTO `registry_file` VALUES('sites/all/modules/views/plugins/views_plugin_display_default.inc', '91c6554d8f41f848bf30093d44d076051c54e998f6b50bdc2a922bfeeef9c54d');
INSERT INTO `registry_file` VALUES('sites/all/modules/views/plugins/views_plugin_display_embed.inc', '5424f2ea9e031faade7a562b8013aea193db5b0bc1be92b97bd7967de0d7bfff');
INSERT INTO `registry_file` VALUES('sites/all/modules/views/plugins/views_plugin_display_extender.inc', '75fb9f80e7f153715b911690c7140f251df588e6a541fab5881fbfafc0bbf778');
INSERT INTO `registry_file` VALUES('sites/all/modules/views/plugins/views_plugin_display_feed.inc', 'fbff8bf3f2d9fcd6403ca31d6f351dea54c83a644a613f78d34267b504bc84fc');
INSERT INTO `registry_file` VALUES('sites/all/modules/views/plugins/views_plugin_display_page.inc', '7f38f2009e09400ddee42777fab356b0ed430653ca2f53b71061c3f2cb946cbc');
INSERT INTO `registry_file` VALUES('sites/all/modules/views/plugins/views_plugin_exposed_form.inc', '31c3e76560512e25200e64e17e7a9716482535cd6f1fac7c610e48343484e107');
INSERT INTO `registry_file` VALUES('sites/all/modules/views/plugins/views_plugin_exposed_form_basic.inc', 'c736e1862b393e15ecc80deb58663405a1d68c2db07eb620d8e640406876cd17');
INSERT INTO `registry_file` VALUES('sites/all/modules/views/plugins/views_plugin_exposed_form_input_required.inc', '46566e6bf33f1b3d4640526372af94c03334318fe4267e9f5e2e8cb74f4ddc81');
INSERT INTO `registry_file` VALUES('sites/all/modules/views/plugins/views_plugin_localization.inc', 'd7239cc693994dcd069c1f1e7847a7902c5bd29b8d64a93cdf37c602576661fb');
INSERT INTO `registry_file` VALUES('sites/all/modules/views/plugins/views_plugin_localization_core.inc', 'f0900c0640e7c779e9b876223ea395f613c8fe8449f6c8eb5d060e2d54a6afcc');
INSERT INTO `registry_file` VALUES('sites/all/modules/views/plugins/views_plugin_localization_none.inc', '4930c3a13ddc0df3065f4920a836ffdc933b037e1337764e6687d7311f49dd8a');
INSERT INTO `registry_file` VALUES('sites/all/modules/views/plugins/views_plugin_pager.inc', '1cbe6ca33f3a177726e4435b82d05e465deb38f9d32d45a20738f47e7c2b0877');
INSERT INTO `registry_file` VALUES('sites/all/modules/views/plugins/views_plugin_pager_full.inc', '1b6e5e1fd8837d6a5f458079a2dc87161a7814c6d8c181c1dee6958a37096c9a');
INSERT INTO `registry_file` VALUES('sites/all/modules/views/plugins/views_plugin_pager_mini.inc', '47ecac80489f13ebf16a7d2f3458c291bc06ba12e0aeb601d89cac8f6e32b6c0');
INSERT INTO `registry_file` VALUES('sites/all/modules/views/plugins/views_plugin_pager_none.inc', '822cab1ada25f4902a0505f13db86886061d2ced655438b33b197d031ccceddd');
INSERT INTO `registry_file` VALUES('sites/all/modules/views/plugins/views_plugin_pager_some.inc', 'bc6aa7cbf1bc09374eced33334195c8897e4078336b8306d02d71c7aaaa22c99');
INSERT INTO `registry_file` VALUES('sites/all/modules/views/plugins/views_plugin_query.inc', '0594d1fd0c34b86c6b81741e134da2d385d6be47b667af6660dd1d268fb7fa95');
INSERT INTO `registry_file` VALUES('sites/all/modules/views/plugins/views_plugin_query_default.inc', 'a35fff884bddaa3e45a2143ba96ac595af7dc380457d96b2cc9f4e35c2742617');
INSERT INTO `registry_file` VALUES('sites/all/modules/views/plugins/views_plugin_row.inc', '3ca81529526b930cfb0dda202757f203649236b90441e3c035bb79cd419ee2a6');
INSERT INTO `registry_file` VALUES('sites/all/modules/views/plugins/views_plugin_row_fields.inc', '875fb2868cdbcc5f7af03098cbe55b9bb91ef512e5e52ccde89f7a02a0c5fbe2');
INSERT INTO `registry_file` VALUES('sites/all/modules/views/plugins/views_plugin_row_rss_fields.inc', '62f4a0ceef14aec9958ee8b98d352303f10818ddc66031814cc8b9d21752ade9');
INSERT INTO `registry_file` VALUES('sites/all/modules/views/plugins/views_plugin_style.inc', '60243c95aa09e6b09de8418a6dc2b67eabf1e83289cfbf4658c519d6206227be');
INSERT INTO `registry_file` VALUES('sites/all/modules/views/plugins/views_plugin_style_default.inc', 'bf411e635d2fd9e09eb245b43581a0a7b670359180ccb042d42a5e579bbe9c30');
INSERT INTO `registry_file` VALUES('sites/all/modules/views/plugins/views_plugin_style_grid.inc', '35094b7f644b7e0692c9026b6b6b4c4c864c37fcdedef04b359dd2bdba496a47');
INSERT INTO `registry_file` VALUES('sites/all/modules/views/plugins/views_plugin_style_jump_menu.inc', '66170c5b4a8e779f20cf7cf064c65eeba9753b8f4cdf156b108f30d4a22007a2');
INSERT INTO `registry_file` VALUES('sites/all/modules/views/plugins/views_plugin_style_list.inc', '407b928d2c74a91903b681088bccce926d2268d0a9a6a34c185a4849dc0d7e31');
INSERT INTO `registry_file` VALUES('sites/all/modules/views/plugins/views_plugin_style_mapping.inc', 'af4b75dd08f1597280a8deb6086259be4f10af50acace43ce2013170655f752c');
INSERT INTO `registry_file` VALUES('sites/all/modules/views/plugins/views_plugin_style_rss.inc', '77fcd2a962022159e89a773c49823306ef69a0dd1b54e6b344d1e2e45590d3d1');
INSERT INTO `registry_file` VALUES('sites/all/modules/views/plugins/views_plugin_style_summary.inc', '872df59f8f389eaf9b019e82d859dd198d31166e26a9102132e3932c7f1f2916');
INSERT INTO `registry_file` VALUES('sites/all/modules/views/plugins/views_plugin_style_summary_jump_menu.inc', '2ec0d225824ee65b6bb61317979e1dabe2be524a66ab19da924c6949dd31af3b');
INSERT INTO `registry_file` VALUES('sites/all/modules/views/plugins/views_plugin_style_summary_unformatted.inc', 'c1e6f9dd1d75e29fee271171440d2182e633a1dbbc996cb186f637ff7ad93ed9');
INSERT INTO `registry_file` VALUES('sites/all/modules/views/plugins/views_plugin_style_table.inc', '0cbcc5d256a13953fbd3e5966a33d2426d5c3bd8c228ef370daebf2f428e693c');
INSERT INTO `registry_file` VALUES('sites/all/modules/views/plugins/views_wizard/views_ui_base_views_wizard.class.php', 'd8325414c8ddde5c955a5cfb053b77478bb4d73cb2f7d75b857b082bc5a1e12d');
INSERT INTO `registry_file` VALUES('sites/all/modules/views/plugins/views_wizard/views_ui_comment_views_wizard.class.php', '208d02d7185ccc89c6767d31be2f5417c7877a6846457194eb103bd648aa7577');
INSERT INTO `registry_file` VALUES('sites/all/modules/views/plugins/views_wizard/views_ui_file_managed_views_wizard.class.php', '5734fb564ba9e2485cfa5d4a49f0c76f65a9be357b78e769ee4af92c4ef9e22a');
INSERT INTO `registry_file` VALUES('sites/all/modules/views/plugins/views_wizard/views_ui_node_revision_views_wizard.class.php', '6faf9ef92501a4f1aeaf86bcff9edaeb47bd7526ba50d06b841c9366149e7725');
INSERT INTO `registry_file` VALUES('sites/all/modules/views/plugins/views_wizard/views_ui_node_views_wizard.class.php', '2862cfdcef52cdd42f3b0e0113148bd0da8a93b6cd200f94d51df34e5428fcd2');
INSERT INTO `registry_file` VALUES('sites/all/modules/views/plugins/views_wizard/views_ui_taxonomy_term_views_wizard.class.php', 'a8713b5a925ce8619f4f7b2ce74fbf9f7bb570f8ed084c8a7a5865fb40032eab');
INSERT INTO `registry_file` VALUES('sites/all/modules/views/plugins/views_wizard/views_ui_users_views_wizard.class.php', 'f9fe2fb1ee87a1871e6ad32bad61b2457313f24da1bd5423977ced12de542919');
INSERT INTO `registry_file` VALUES('sites/all/modules/views/tests/comment/views_handler_argument_comment_user_uid.test', 'b8b417ef0e05806a88bd7d5e2f7dcb41339fbf5b66f39311defc9fb65476d561');
INSERT INTO `registry_file` VALUES('sites/all/modules/views/tests/comment/views_handler_filter_comment_user_uid.test', '347c6ffd4383706dbde844235aaf31cff44a22e95d2e6d8ef4da34a41b70edd1');
INSERT INTO `registry_file` VALUES('sites/all/modules/views/tests/field/views_fieldapi.test', '53e6d57c2d1d6cd0cd92e15ca4077ba532214daf41e9c7c0f940c7c8dbd86a66');
INSERT INTO `registry_file` VALUES('sites/all/modules/views/tests/handlers/views_handler_area_text.test', 'af74a74a3357567b844606add76d7ca1271317778dd7bd245a216cf963c738b4');
INSERT INTO `registry_file` VALUES('sites/all/modules/views/tests/handlers/views_handler_argument_null.test', '1d174e1f467b905d67217bd755100d78ffeca4aa4ada5c4be40270cd6d30b721');
INSERT INTO `registry_file` VALUES('sites/all/modules/views/tests/handlers/views_handler_argument_string.test', '3d0213af0041146abb61dcdc750869ed773d0ac80cfa74ffbadfdd03b1f11c52');
INSERT INTO `registry_file` VALUES('sites/all/modules/views/tests/handlers/views_handler_field.test', 'af552bf825ab77486b3d0d156779b7c4806ce5a983c6116ad68b633daf9bb927');
INSERT INTO `registry_file` VALUES('sites/all/modules/views/tests/handlers/views_handler_field_boolean.test', 'd334b12a850f36b41fe89ab30a9d758fd3ce434286bd136404344b7b288460ae');
INSERT INTO `registry_file` VALUES('sites/all/modules/views/tests/handlers/views_handler_field_counter.test', '75b31942adf06b107f5ffd3c97545fde8cd1040b1d00f682e3c7c1320026e26c');
INSERT INTO `registry_file` VALUES('sites/all/modules/views/tests/handlers/views_handler_field_custom.test', '1446bc3d5a6b1180a79edfa46a5268dbf7f089836aa3bc45df00ddaff9dd0ce1');
INSERT INTO `registry_file` VALUES('sites/all/modules/views/tests/handlers/views_handler_field_date.test', '6f45326d7f74127956d9d8e4d7ad96a4beb0f66175fa40daf1d618d1a5fa996d');
INSERT INTO `registry_file` VALUES('sites/all/modules/views/tests/handlers/views_handler_field_file_size.test', '49184db68af398a54e81c8a76261acd861da8fd7846b9d51dcf476d61396bfb9');
INSERT INTO `registry_file` VALUES('sites/all/modules/views/tests/handlers/views_handler_field_math.test', '6e39e4f782e6b36151ceafb41a5509f7c661be79b393b24f6f5496d724535887');
INSERT INTO `registry_file` VALUES('sites/all/modules/views/tests/handlers/views_handler_field_url.test', 'b41f762a71594b438a2e60a79c8260ba54e6305635725b0747e29f0d3ffe08c9');
INSERT INTO `registry_file` VALUES('sites/all/modules/views/tests/handlers/views_handler_field_xss.test', 'f129ee16c03f84673e33990cbb2da5aa88c362f46e9ba1620b2a842ffd1c9cd2');
INSERT INTO `registry_file` VALUES('sites/all/modules/views/tests/handlers/views_handler_filter_combine.test', '05842d83a11822afe7d566835f5db9f0f94fdb27ddfc388d38138767bdf36f8b');
INSERT INTO `registry_file` VALUES('sites/all/modules/views/tests/handlers/views_handler_filter_date.test', '045cc449b68bbd5526071bf38c505b6d44f6c91868273c3120705c3bad250aee');
INSERT INTO `registry_file` VALUES('sites/all/modules/views/tests/handlers/views_handler_filter_equality.test', 'c88f21c9cbf1aae83393b26616908f8020c18fe378d76256c7ba192df2ec17af');
INSERT INTO `registry_file` VALUES('sites/all/modules/views/tests/handlers/views_handler_filter_in_operator.test', '89420a4071677232e0eb82b184b37b818a82bdb2ff90a8b21293f9ecb21808bf');
INSERT INTO `registry_file` VALUES('sites/all/modules/views/tests/handlers/views_handler_filter_numeric.test', '35ac7a34e696b979e86ef7209b6697098d9abe218e30a02cc4fe39fb11f2a852');
INSERT INTO `registry_file` VALUES('sites/all/modules/views/tests/handlers/views_handler_filter_string.test', 'b7d090780748faad478e619fd55673d746d4a0cf343d9e40ea96881324c34cbd');
INSERT INTO `registry_file` VALUES('sites/all/modules/views/tests/handlers/views_handler_sort.test', 'f4ff79e6bc54e83c4eb2777811f33702b7e9fe7416ef70ae00d100fa54d44fec');
INSERT INTO `registry_file` VALUES('sites/all/modules/views/tests/handlers/views_handler_sort_date.test', 'f548584d7c6a71cabd3ce07e04053a38df3f3e1685210ce8114238fd05344c10');
INSERT INTO `registry_file` VALUES('sites/all/modules/views/tests/handlers/views_handler_sort_random.test', '4fdba9bf05a26720ffa97e7a37da65ddc9044bd2832f8c89007b82feb062f182');
INSERT INTO `registry_file` VALUES('sites/all/modules/views/tests/node/views_node_revision_relations.test', '9467497a6d693615b48c8f57611a850002317bcb091b926d2efbbe56a4e61480');
INSERT INTO `registry_file` VALUES('sites/all/modules/views/tests/plugins/views_plugin_display.test', '4a6b136543a60999604c54125fa9d4f5aa61a5dcc71e2133d89325d81bc0fc2d');
INSERT INTO `registry_file` VALUES('sites/all/modules/views/tests/styles/views_plugin_style.test', 'fb6c3279645fbcc1126acb3e1c908189e5240c647f81dcfd9b0761570c99d269');
INSERT INTO `registry_file` VALUES('sites/all/modules/views/tests/styles/views_plugin_style_base.test', '54fb7816d18416d8b0db67e9f55aa2aa50ac204eb9311be14b6700b7d7a95ae7');
INSERT INTO `registry_file` VALUES('sites/all/modules/views/tests/styles/views_plugin_style_jump_menu.test', 'b88baa8aebe183943a6e4cf2df314fef13ac41b5844cd5fa4aa91557dd624895');
INSERT INTO `registry_file` VALUES('sites/all/modules/views/tests/styles/views_plugin_style_mapping.test', 'a4e68bc8cfbeff4a1d9b8085fd115bfe7a8c4b84c049573fa0409b0dc8c2f053');
INSERT INTO `registry_file` VALUES('sites/all/modules/views/tests/styles/views_plugin_style_unformatted.test', '033ca29d41af47cd7bd12d50fea6c956dde247202ebda9df7f637111481bb51d');
INSERT INTO `registry_file` VALUES('sites/all/modules/views/tests/taxonomy/views_handler_relationship_node_term_data.test', '6074f5c7ae63225ea0cd26626ace6c017740e226f4d3c234e39869c31308223d');
INSERT INTO `registry_file` VALUES('sites/all/modules/views/tests/test_plugins/views_test_plugin_access_test_dynamic.inc', '6a3ce8c256b84734b6b67a893ab24465a5f62d7bdf9ab5d22082a31849346b7d');
INSERT INTO `registry_file` VALUES('sites/all/modules/views/tests/test_plugins/views_test_plugin_access_test_static.inc', 'e345e42d443cfa73db0ed2be61291117ebd57b86196cdb77c6f440e93443def3');
INSERT INTO `registry_file` VALUES('sites/all/modules/views/tests/test_plugins/views_test_plugin_style_test_mapping.inc', '0b2c68626105bd5f6b9074022a37c3d09d3a6bd70b811bb26d5eacad6d74546f');
INSERT INTO `registry_file` VALUES('sites/all/modules/views/tests/user/views_handler_field_user_name.test', '69641b6da26d8daee9a2ceb2d0df56668bf09b86db1d4071c275b6e8d0885f9e');
INSERT INTO `registry_file` VALUES('sites/all/modules/views/tests/user/views_user.test', 'fbb63b42a0b7051bd4d33cf36841f39d7cc13a63b0554eca431b2a08c19facae');
INSERT INTO `registry_file` VALUES('sites/all/modules/views/tests/user/views_user_argument_default.test', '6423f2db7673763991b1fd0c452a7d84413c7dd888ca6c95545fadc531cfaaf4');
INSERT INTO `registry_file` VALUES('sites/all/modules/views/tests/user/views_user_argument_validate.test', 'c88c9e5d162958f8924849758486a0d83822ada06088f5cf71bfbe76932d8d84');
INSERT INTO `registry_file` VALUES('sites/all/modules/views/tests/views_access.test', 'f8b9d04b43c09a67ec722290a30408c1df8c163cf6e5863b41468bb4e381ee6f');
INSERT INTO `registry_file` VALUES('sites/all/modules/views/tests/views_analyze.test', '5548e36c99bb626209d63e5cddbc31f49ad83865c983d2662c6826b328d24ffb');
INSERT INTO `registry_file` VALUES('sites/all/modules/views/tests/views_argument_default.test', '5950937aae4608bba5b86f366ef3a56cc6518bbccfeaeacda79fa13246d220e4');
INSERT INTO `registry_file` VALUES('sites/all/modules/views/tests/views_argument_validator.test', '31f8f49946c8aa3b03d6d9a2281bdfb11c54071b28e83fb3e827ca6ff5e38c88');
INSERT INTO `registry_file` VALUES('sites/all/modules/views/tests/views_basic.test', '655bd33983f84bbea68a3f24bfab545d2c02f36a478566edf35a98a58ff0c6cf');
INSERT INTO `registry_file` VALUES('sites/all/modules/views/tests/views_cache.test', '76316e1f026c2ab81ef91450b9d6d5985cbfab087f839ea0edd112209bf84fd9');
INSERT INTO `registry_file` VALUES('sites/all/modules/views/tests/views_exposed_form.test', '2b2b16373af8ecade91d7c77bd8c2da8286a33bde554874f5d81399d201c3228');
INSERT INTO `registry_file` VALUES('sites/all/modules/views/tests/views_glossary.test', '118d50177a68a6f88e3727e10f8bcc6f95176282cc42fbd604458eeb932a36e8');
INSERT INTO `registry_file` VALUES('sites/all/modules/views/tests/views_groupby.test', 'ac6ca55f084f4884c06437815ccfa5c4d10bfef808c3f6f17a4f69537794a992');
INSERT INTO `registry_file` VALUES('sites/all/modules/views/tests/views_handlers.test', 'a696e3d6b1748da03a04ac532f403700d07c920b9c405c628a6c94ea6764f501');
INSERT INTO `registry_file` VALUES('sites/all/modules/views/tests/views_module.test', '3939798f2f679308903d4845f5625dd60df6110aec2615e33ab81e854d0b7e73');
INSERT INTO `registry_file` VALUES('sites/all/modules/views/tests/views_pager.test', '6f448c8c13c5177afb35103119d6281958a2d6dbdfb96ae5f4ee77cb3b44adc5');
INSERT INTO `registry_file` VALUES('sites/all/modules/views/tests/views_plugin_localization_test.inc', 'baedcf6c7381f9c5d3a5062f7d256f96808d06e04b6e73eff8e791e5f5293f45');
INSERT INTO `registry_file` VALUES('sites/all/modules/views/tests/views_query.test', '1ab587994dc43b1315e9a534d005798aecaa14182ba23a2b445e56516b9528cb');
INSERT INTO `registry_file` VALUES('sites/all/modules/views/tests/views_test.views_default.inc', '9664b95577fe2664410921bb751e1d99109e79b734f2c8c142d4083449282bd0');
INSERT INTO `registry_file` VALUES('sites/all/modules/views/tests/views_translatable.test', '6899c7b09ab72c262480cf78d200ecddfb683e8f2495438a55b35ae0e103a1b3');
INSERT INTO `registry_file` VALUES('sites/all/modules/views/tests/views_ui.test', 'f9687a363d7cc2828739583e3eedeb68c99acd505ff4e3036c806a42b93a2688');
INSERT INTO `registry_file` VALUES('sites/all/modules/views/tests/views_upgrade.test', 'c48bd74b85809dd78d963e525e38f3b6dd7e12aa249f73bd6a20247a40d6713a');
INSERT INTO `registry_file` VALUES('sites/all/modules/views/tests/views_view.test', 'a52e010d27cc2eb29804a3acd30f574adf11fad1f5860e431178b61cddbdbb69');
INSERT INTO `registry_file` VALUES('sites/all/modules/views/views_ui.module', '2451d4e3df513afe85c7e24acc90b89ed24f5a615e8b4002e9d3d6cd1ca8b32e');
INSERT INTO `registry_file` VALUES('sites/all/modules/wysiwyg/tests/wysiwyg.test', '351bd7ed3eb279052b92cd900ceaedb3baa97ab502eed61a390efed83d8cefd8');
INSERT INTO `registry_file` VALUES('sites/all/modules/wysiwyg/wysiwyg.module', '23bbe445f32ba4e8d58c555b11e3275bf954380fea6c4e2a02bbc46fcc41daf8');

-- --------------------------------------------------------

--
-- Table structure for table `role`
--

CREATE TABLE `role` (
  `rid` int(10) unsigned NOT NULL auto_increment COMMENT 'Primary Key: Unique role ID.',
  `name` varchar(64) NOT NULL default '' COMMENT 'Unique role name.',
  `weight` int(11) NOT NULL default '0' COMMENT 'The weight of this role in listings and the user interface.',
  PRIMARY KEY  (`rid`),
  UNIQUE KEY `name` (`name`),
  KEY `name_weight` (`name`,`weight`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Stores user roles.' AUTO_INCREMENT=5 ;

--
-- Dumping data for table `role`
--

INSERT INTO `role` VALUES(3, 'administrator', 2);
INSERT INTO `role` VALUES(1, 'anonymous user', 0);
INSERT INTO `role` VALUES(2, 'authenticated user', 1);
INSERT INTO `role` VALUES(4, 'editor', 3);

-- --------------------------------------------------------

--
-- Table structure for table `role_permission`
--

CREATE TABLE `role_permission` (
  `rid` int(10) unsigned NOT NULL COMMENT 'Foreign Key: role.rid.',
  `permission` varchar(128) NOT NULL default '' COMMENT 'A single permission granted to the role identified by rid.',
  `module` varchar(255) NOT NULL default '' COMMENT 'The module declaring the permission.',
  PRIMARY KEY  (`rid`,`permission`),
  KEY `permission` (`permission`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores the permissions assigned to user roles.';

--
-- Dumping data for table `role_permission`
--

INSERT INTO `role_permission` VALUES(1, 'access comments', 'comment');
INSERT INTO `role_permission` VALUES(1, 'access content', 'node');
INSERT INTO `role_permission` VALUES(2, 'access comments', 'comment');
INSERT INTO `role_permission` VALUES(2, 'access content', 'node');
INSERT INTO `role_permission` VALUES(2, 'post comments', 'comment');
INSERT INTO `role_permission` VALUES(2, 'skip comment approval', 'comment');
INSERT INTO `role_permission` VALUES(3, 'access administration pages', 'system');
INSERT INTO `role_permission` VALUES(3, 'access all views', 'views');
INSERT INTO `role_permission` VALUES(3, 'access comments', 'comment');
INSERT INTO `role_permission` VALUES(3, 'access content', 'node');
INSERT INTO `role_permission` VALUES(3, 'access content overview', 'node');
INSERT INTO `role_permission` VALUES(3, 'access contextual links', 'contextual');
INSERT INTO `role_permission` VALUES(3, 'access dashboard', 'dashboard');
INSERT INTO `role_permission` VALUES(3, 'access overlay', 'overlay');
INSERT INTO `role_permission` VALUES(3, 'access rules debug', 'rules');
INSERT INTO `role_permission` VALUES(3, 'access site in maintenance mode', 'system');
INSERT INTO `role_permission` VALUES(3, 'access site reports', 'system');
INSERT INTO `role_permission` VALUES(3, 'access toolbar', 'toolbar');
INSERT INTO `role_permission` VALUES(3, 'access user profiles', 'user');
INSERT INTO `role_permission` VALUES(3, 'administer actions', 'system');
INSERT INTO `role_permission` VALUES(3, 'administer blocks', 'block');
INSERT INTO `role_permission` VALUES(3, 'administer comments', 'comment');
INSERT INTO `role_permission` VALUES(3, 'administer content types', 'node');
INSERT INTO `role_permission` VALUES(3, 'administer fieldgroups', 'field_group');
INSERT INTO `role_permission` VALUES(3, 'administer filters', 'filter');
INSERT INTO `role_permission` VALUES(3, 'administer image styles', 'image');
INSERT INTO `role_permission` VALUES(3, 'administer menu', 'menu');
INSERT INTO `role_permission` VALUES(3, 'administer modules', 'system');
INSERT INTO `role_permission` VALUES(3, 'administer nodes', 'node');
INSERT INTO `role_permission` VALUES(3, 'administer permissions', 'user');
INSERT INTO `role_permission` VALUES(3, 'administer rules', 'rules');
INSERT INTO `role_permission` VALUES(3, 'administer search', 'search');
INSERT INTO `role_permission` VALUES(3, 'administer services', 'services');
INSERT INTO `role_permission` VALUES(3, 'administer shortcuts', 'shortcut');
INSERT INTO `role_permission` VALUES(3, 'administer site configuration', 'system');
INSERT INTO `role_permission` VALUES(3, 'administer software updates', 'system');
INSERT INTO `role_permission` VALUES(3, 'administer taxonomy', 'taxonomy');
INSERT INTO `role_permission` VALUES(3, 'administer themes', 'system');
INSERT INTO `role_permission` VALUES(3, 'administer url aliases', 'path');
INSERT INTO `role_permission` VALUES(3, 'administer users', 'user');
INSERT INTO `role_permission` VALUES(3, 'administer views', 'views');
INSERT INTO `role_permission` VALUES(3, 'block IP addresses', 'system');
INSERT INTO `role_permission` VALUES(3, 'bypass node access', 'node');
INSERT INTO `role_permission` VALUES(3, 'bypass rules access', 'rules');
INSERT INTO `role_permission` VALUES(3, 'cancel account', 'user');
INSERT INTO `role_permission` VALUES(3, 'change own username', 'user');
INSERT INTO `role_permission` VALUES(3, 'create article content', 'node');
INSERT INTO `role_permission` VALUES(3, 'create page content', 'node');
INSERT INTO `role_permission` VALUES(3, 'create url aliases', 'path');
INSERT INTO `role_permission` VALUES(3, 'customize shortcut links', 'shortcut');
INSERT INTO `role_permission` VALUES(3, 'delete any article content', 'node');
INSERT INTO `role_permission` VALUES(3, 'delete any page content', 'node');
INSERT INTO `role_permission` VALUES(3, 'delete own article content', 'node');
INSERT INTO `role_permission` VALUES(3, 'delete own page content', 'node');
INSERT INTO `role_permission` VALUES(3, 'delete revisions', 'node');
INSERT INTO `role_permission` VALUES(3, 'delete terms in 1', 'taxonomy');
INSERT INTO `role_permission` VALUES(3, 'edit any article content', 'node');
INSERT INTO `role_permission` VALUES(3, 'edit any page content', 'node');
INSERT INTO `role_permission` VALUES(3, 'edit own article content', 'node');
INSERT INTO `role_permission` VALUES(3, 'edit own comments', 'comment');
INSERT INTO `role_permission` VALUES(3, 'edit own page content', 'node');
INSERT INTO `role_permission` VALUES(3, 'edit terms in 1', 'taxonomy');
INSERT INTO `role_permission` VALUES(3, 'get a system variable', 'services');
INSERT INTO `role_permission` VALUES(3, 'get any binary files', 'services');
INSERT INTO `role_permission` VALUES(3, 'get own binary files', 'services');
INSERT INTO `role_permission` VALUES(3, 'perform unlimited index queries', 'services');
INSERT INTO `role_permission` VALUES(3, 'post comments', 'comment');
INSERT INTO `role_permission` VALUES(3, 'revert revisions', 'node');
INSERT INTO `role_permission` VALUES(3, 'save file information', 'services');
INSERT INTO `role_permission` VALUES(3, 'search content', 'search');
INSERT INTO `role_permission` VALUES(3, 'select account cancellation method', 'user');
INSERT INTO `role_permission` VALUES(3, 'set a system variable', 'services');
INSERT INTO `role_permission` VALUES(3, 'skip comment approval', 'comment');
INSERT INTO `role_permission` VALUES(3, 'switch shortcut sets', 'shortcut');
INSERT INTO `role_permission` VALUES(3, 'use advanced search', 'search');
INSERT INTO `role_permission` VALUES(3, 'use text format filtered_html', 'filter');
INSERT INTO `role_permission` VALUES(3, 'use text format full_html', 'filter');
INSERT INTO `role_permission` VALUES(3, 'view own unpublished content', 'node');
INSERT INTO `role_permission` VALUES(3, 'view revisions', 'node');
INSERT INTO `role_permission` VALUES(3, 'view the administration theme', 'system');
INSERT INTO `role_permission` VALUES(4, 'use text format full_html', 'filter');

-- --------------------------------------------------------

--
-- Table structure for table `rules_config`
--

CREATE TABLE `rules_config` (
  `id` int(11) NOT NULL auto_increment COMMENT 'The internal identifier for any configuration.',
  `name` varchar(64) NOT NULL COMMENT 'The name of the configuration.',
  `label` varchar(255) NOT NULL default 'unlabeled' COMMENT 'The label of the configuration.',
  `plugin` varchar(127) NOT NULL COMMENT 'The name of the plugin of this configuration.',
  `active` int(11) NOT NULL default '1' COMMENT 'Boolean indicating whether the configuration is active. Usage depends on how the using module makes use of it.',
  `weight` tinyint(4) NOT NULL default '0' COMMENT 'Weight of the configuration. Usage depends on how the using module makes use of it.',
  `status` tinyint(4) NOT NULL default '1' COMMENT 'The exportable status of the entity.',
  `dirty` tinyint(4) NOT NULL default '0' COMMENT 'Dirty configurations fail the integrity check, e.g. due to missing dependencies.',
  `module` varchar(255) default NULL COMMENT 'The name of the providing module if the entity has been defined in code.',
  `access_exposed` tinyint(4) NOT NULL default '0' COMMENT 'Whether to use a permission to control access for using components.',
  `data` longblob COMMENT 'Everything else, serialized.',
  PRIMARY KEY  (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `plugin` (`plugin`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `rules_config`
--

INSERT INTO `rules_config` VALUES(1, 'rules_redirect_anonymous_users_to_app_download', 'redirect anonymous users to app download', 'reaction rule', 1, 0, 1, 0, 'rules', 0, 0x4f3a31373a2252756c65735265616374696f6e52756c65223a31343a7b733a393a22002a00706172656e74223b4e3b733a323a226964223b733a313a2231223b733a31323a22002a00656c656d656e744964223b693a313b733a363a22776569676874223b733a313a2230223b733a383a2273657474696e6773223b613a303a7b7d733a343a226e616d65223b733a34363a2272756c65735f72656469726563745f616e6f6e796d6f75735f75736572735f746f5f6170705f646f776e6c6f6164223b733a363a226d6f64756c65223b733a353a2272756c6573223b733a363a22737461747573223b733a313a2231223b733a353a226c6162656c223b733a34303a22726564697265637420616e6f6e796d6f757320757365727320746f2061707020646f776e6c6f6164223b733a343a2274616773223b613a313a7b693a303b733a343a2275736572223b7d733a31313a22002a006368696c6472656e223b613a313a7b693a303b4f3a31313a2252756c6573416374696f6e223a363a7b733a393a22002a00706172656e74223b723a313b733a323a226964223b4e3b733a31323a22002a00656c656d656e744964223b693a353b733a363a22776569676874223b693a303b733a383a2273657474696e6773223b613a343a7b733a333a2275726c223b733a363a226e6f64652f35223b733a353a22666f726365223b693a313b733a31313a2264657374696e6174696f6e223b693a303b733a31313a2275726c3a70726f63657373223b4f3a32323a2252756c6573555249496e7075744576616c7561746f72223a323a7b733a31303a22002a0073657474696e67223b623a313b733a31323a22002a0070726f636573736f72223b4e3b7d7d733a31343a22002a00656c656d656e744e616d65223b733a383a227265646972656374223b7d7d733a373a22002a00696e666f223b613a303a7b7d733a31333a22002a00636f6e646974696f6e73223b4f3a383a2252756c6573416e64223a383a7b733a393a22002a00706172656e74223b723a313b733a323a226964223b4e3b733a31323a22002a00656c656d656e744964223b693a323b733a363a22776569676874223b693a303b733a383a2273657474696e6773223b613a303a7b7d733a31313a22002a006368696c6472656e223b613a313a7b693a303b4f3a383a2252756c6573416e64223a383a7b733a393a22002a00706172656e74223b723a32383b733a323a226964223b4e3b733a31323a22002a00656c656d656e744964223b693a363b733a363a22776569676874223b693a303b733a383a2273657474696e6773223b613a303a7b7d733a31313a22002a006368696c6472656e223b613a323a7b693a303b4f3a31343a2252756c6573436f6e646974696f6e223a373a7b733a393a22002a00706172656e74223b723a33353b733a323a226964223b4e3b733a31323a22002a00656c656d656e744964223b693a333b733a363a22776569676874223b693a303b733a383a2273657474696e6773223b613a333a7b733a31343a226163636f756e743a73656c656374223b733a31373a22736974653a63757272656e742d75736572223b733a353a22726f6c6573223b613a313a7b693a313b733a313a2231223b7d733a393a226f7065726174696f6e223b733a333a22414e44223b7d733a31343a22002a00656c656d656e744e616d65223b733a31333a22757365725f6861735f726f6c65223b733a393a22002a006e6567617465223b623a303b7d693a313b4f3a31343a2252756c6573436f6e646974696f6e223a373a7b733a393a22002a00706172656e74223b723a33353b733a323a226964223b4e3b733a31323a22002a00656c656d656e744964223b693a373b733a363a22776569676874223b693a323b733a383a2273657474696e6773223b613a333a7b733a31313a22646174613a73656c656374223b733a383a226e6f64653a6e6964223b733a323a226f70223b733a323a223d3d223b733a353a2276616c7565223b733a313a2235223b7d733a31343a22002a00656c656d656e744e616d65223b733a373a22646174615f6973223b733a393a22002a006e6567617465223b623a313b7d7d733a373a22002a00696e666f223b613a303a7b7d733a393a22002a006e6567617465223b623a303b7d7d733a373a22002a00696e666f223b613a303a7b7d733a393a22002a006e6567617465223b623a303b7d733a393a22002a006576656e7473223b613a313a7b693a303b733a393a226e6f64655f76696577223b7d7d);
INSERT INTO `rules_config` VALUES(2, 'rules_user_logs_in_redirect_to_home_page', 'user logs in, redirect to home page', 'reaction rule', 1, 0, 1, 0, 'rules', 0, 0x4f3a31373a2252756c65735265616374696f6e52756c65223a31343a7b733a393a22002a00706172656e74223b4e3b733a323a226964223b733a313a2232223b733a31323a22002a00656c656d656e744964223b693a313b733a363a22776569676874223b733a313a2230223b733a383a2273657474696e6773223b613a303a7b7d733a343a226e616d65223b733a34303a2272756c65735f757365725f6c6f67735f696e5f72656469726563745f746f5f686f6d655f70616765223b733a363a226d6f64756c65223b733a353a2272756c6573223b733a363a22737461747573223b733a313a2231223b733a353a226c6162656c223b733a33353a2275736572206c6f677320696e2c20726564697265637420746f20686f6d652070616765223b733a343a2274616773223b613a313a7b693a303b733a343a2275736572223b7d733a31313a22002a006368696c6472656e223b613a313a7b693a303b4f3a31313a2252756c6573416374696f6e223a363a7b733a393a22002a00706172656e74223b723a313b733a323a226964223b4e3b733a31323a22002a00656c656d656e744964223b4e3b733a363a22776569676874223b693a303b733a383a2273657474696e6773223b613a343a7b733a333a2275726c223b733a373a223c66726f6e743e223b733a353a22666f726365223b693a313b733a31313a2264657374696e6174696f6e223b693a303b733a31313a2275726c3a70726f63657373223b4f3a32323a2252756c6573555249496e7075744576616c7561746f72223a323a7b733a31303a22002a0073657474696e67223b623a313b733a31323a22002a0070726f636573736f72223b4e3b7d7d733a31343a22002a00656c656d656e744e616d65223b733a383a227265646972656374223b7d7d733a373a22002a00696e666f223b613a303a7b7d733a31333a22002a00636f6e646974696f6e73223b4f3a383a2252756c6573416e64223a383a7b733a393a22002a00706172656e74223b723a313b733a323a226964223b4e3b733a31323a22002a00656c656d656e744964223b693a323b733a363a22776569676874223b693a303b733a383a2273657474696e6773223b613a303a7b7d733a31313a22002a006368696c6472656e223b613a303a7b7d733a373a22002a00696e666f223b613a303a7b7d733a393a22002a006e6567617465223b623a303b7d733a393a22002a006576656e7473223b613a313a7b693a303b733a31303a22757365725f6c6f67696e223b7d7d);

-- --------------------------------------------------------

--
-- Table structure for table `rules_dependencies`
--

CREATE TABLE `rules_dependencies` (
  `id` int(10) unsigned NOT NULL COMMENT 'The primary identifier of the configuration.',
  `module` varchar(255) NOT NULL COMMENT 'The name of the module that is required for the configuration.',
  PRIMARY KEY  (`id`,`module`),
  KEY `module` (`module`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `rules_dependencies`
--

INSERT INTO `rules_dependencies` VALUES(1, 'rules');
INSERT INTO `rules_dependencies` VALUES(2, 'rules');

-- --------------------------------------------------------

--
-- Table structure for table `rules_scheduler`
--

CREATE TABLE `rules_scheduler` (
  `tid` int(10) unsigned NOT NULL auto_increment COMMENT 'The scheduled task’s id.',
  `config` varchar(64) NOT NULL default '' COMMENT 'The scheduled configuration’s name.',
  `date` int(11) NOT NULL COMMENT 'The Unix timestamp of when the task is to be scheduled.',
  `state` text COMMENT 'The whole, serialized evaluation state.',
  `identifier` varchar(255) default '' COMMENT 'The user defined string identifying this task.',
  PRIMARY KEY  (`tid`),
  KEY `date` (`date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores scheduled tasks.' AUTO_INCREMENT=1 ;

--
-- Dumping data for table `rules_scheduler`
--


-- --------------------------------------------------------

--
-- Table structure for table `rules_tags`
--

CREATE TABLE `rules_tags` (
  `id` int(10) unsigned NOT NULL COMMENT 'The primary identifier of the configuration.',
  `tag` varchar(255) NOT NULL COMMENT 'The tag string associated with this configuration',
  PRIMARY KEY  (`id`,`tag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `rules_tags`
--

INSERT INTO `rules_tags` VALUES(1, 'user');
INSERT INTO `rules_tags` VALUES(2, 'user');

-- --------------------------------------------------------

--
-- Table structure for table `rules_trigger`
--

CREATE TABLE `rules_trigger` (
  `id` int(10) unsigned NOT NULL COMMENT 'The primary identifier of the configuration.',
  `event` varchar(127) NOT NULL default '' COMMENT 'The name of the event on which the configuration should be triggered.',
  PRIMARY KEY  (`id`,`event`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `rules_trigger`
--

INSERT INTO `rules_trigger` VALUES(1, 'node_view');
INSERT INTO `rules_trigger` VALUES(2, 'user_login');

-- --------------------------------------------------------

--
-- Table structure for table `search_dataset`
--

CREATE TABLE `search_dataset` (
  `sid` int(10) unsigned NOT NULL default '0' COMMENT 'Search item ID, e.g. node ID for nodes.',
  `type` varchar(16) NOT NULL COMMENT 'Type of item, e.g. node.',
  `data` longtext NOT NULL COMMENT 'List of space-separated words from the item.',
  `reindex` int(10) unsigned NOT NULL default '0' COMMENT 'Set to force node reindexing.',
  PRIMARY KEY  (`sid`,`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores items that will be searched.';

--
-- Dumping data for table `search_dataset`
--

INSERT INTO `search_dataset` VALUES(1, 'node', ' exhibit a html with images this is test exhibit content accessed from a nifty qr code http  ', 1375827155);
INSERT INTO `search_dataset` VALUES(2, 'node', ' exhibit b audio here is an audio sample to play with scienceonthespheremp3 http  ', 1375827175);
INSERT INTO `search_dataset` VALUES(3, 'node', ' exhibit c video link http wwwyoutubecom watch v o3cocxxxota 3dlogojpg ', 1375827206);
INSERT INTO `search_dataset` VALUES(4, 'node', ' home welcome to the home page useful instructions could go here eventually  ', 0);
INSERT INTO `search_dataset` VALUES(5, 'node', ' download the qr exhibit tour app   a cool picture of a glowing phone will go here download the qr exhibit tour app for awesome fun  ', 0);

-- --------------------------------------------------------

--
-- Table structure for table `search_index`
--

CREATE TABLE `search_index` (
  `word` varchar(50) NOT NULL default '' COMMENT 'The search_total.word that is associated with the search item.',
  `sid` int(10) unsigned NOT NULL default '0' COMMENT 'The search_dataset.sid of the searchable item to which the word belongs.',
  `type` varchar(16) NOT NULL COMMENT 'The search_dataset.type of the searchable item to which the word belongs.',
  `score` float default NULL COMMENT 'The numeric score of the word, higher being more important.',
  PRIMARY KEY  (`word`,`sid`,`type`),
  KEY `sid_type` (`sid`,`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores the search index, associating words, items and...';

--
-- Dumping data for table `search_index`
--

INSERT INTO `search_index` VALUES('3dlogojpg', 3, 'node', 11);
INSERT INTO `search_index` VALUES('accessed', 1, 'node', 1);
INSERT INTO `search_index` VALUES('app', 5, 'node', 27);
INSERT INTO `search_index` VALUES('audio', 2, 'node', 27);
INSERT INTO `search_index` VALUES('awesome', 5, 'node', 1);
INSERT INTO `search_index` VALUES('code', 1, 'node', 1);
INSERT INTO `search_index` VALUES('content', 1, 'node', 1);
INSERT INTO `search_index` VALUES('cool', 5, 'node', 1);
INSERT INTO `search_index` VALUES('could', 4, 'node', 1);
INSERT INTO `search_index` VALUES('download', 5, 'node', 27);
INSERT INTO `search_index` VALUES('eventually', 4, 'node', 1);
INSERT INTO `search_index` VALUES('exhibit', 1, 'node', 27);
INSERT INTO `search_index` VALUES('exhibit', 2, 'node', 26);
INSERT INTO `search_index` VALUES('exhibit', 3, 'node', 26);
INSERT INTO `search_index` VALUES('exhibit', 5, 'node', 27);
INSERT INTO `search_index` VALUES('for', 5, 'node', 1);
INSERT INTO `search_index` VALUES('from', 1, 'node', 1);
INSERT INTO `search_index` VALUES('fun', 5, 'node', 1);
INSERT INTO `search_index` VALUES('glowing', 5, 'node', 1);
INSERT INTO `search_index` VALUES('here', 2, 'node', 1);
INSERT INTO `search_index` VALUES('here', 4, 'node', 1);
INSERT INTO `search_index` VALUES('here', 5, 'node', 1);
INSERT INTO `search_index` VALUES('home', 4, 'node', 27);
INSERT INTO `search_index` VALUES('html', 1, 'node', 26);
INSERT INTO `search_index` VALUES('http', 1, 'node', 1);
INSERT INTO `search_index` VALUES('http', 2, 'node', 1);
INSERT INTO `search_index` VALUES('http', 3, 'node', 1);
INSERT INTO `search_index` VALUES('images', 1, 'node', 26);
INSERT INTO `search_index` VALUES('instructions', 4, 'node', 1);
INSERT INTO `search_index` VALUES('link', 3, 'node', 26);
INSERT INTO `search_index` VALUES('nifty', 1, 'node', 1);
INSERT INTO `search_index` VALUES('o3cocxxxota', 3, 'node', 1);
INSERT INTO `search_index` VALUES('page', 4, 'node', 1);
INSERT INTO `search_index` VALUES('phone', 5, 'node', 1);
INSERT INTO `search_index` VALUES('picture', 5, 'node', 1);
INSERT INTO `search_index` VALUES('play', 2, 'node', 1);
INSERT INTO `search_index` VALUES('sample', 2, 'node', 1);
INSERT INTO `search_index` VALUES('scienceonthespheremp3', 2, 'node', 11);
INSERT INTO `search_index` VALUES('test', 1, 'node', 1);
INSERT INTO `search_index` VALUES('the', 4, 'node', 1);
INSERT INTO `search_index` VALUES('the', 5, 'node', 27);
INSERT INTO `search_index` VALUES('this', 1, 'node', 1);
INSERT INTO `search_index` VALUES('tour', 5, 'node', 27);
INSERT INTO `search_index` VALUES('useful', 4, 'node', 1);
INSERT INTO `search_index` VALUES('video', 3, 'node', 26);
INSERT INTO `search_index` VALUES('watch', 3, 'node', 1);
INSERT INTO `search_index` VALUES('welcome', 4, 'node', 1);
INSERT INTO `search_index` VALUES('will', 5, 'node', 1);
INSERT INTO `search_index` VALUES('with', 1, 'node', 26);
INSERT INTO `search_index` VALUES('with', 2, 'node', 1);
INSERT INTO `search_index` VALUES('wwwyoutubecom', 3, 'node', 1);

-- --------------------------------------------------------

--
-- Table structure for table `search_node_links`
--

CREATE TABLE `search_node_links` (
  `sid` int(10) unsigned NOT NULL default '0' COMMENT 'The search_dataset.sid of the searchable item containing the link to the node.',
  `type` varchar(16) NOT NULL default '' COMMENT 'The search_dataset.type of the searchable item containing the link to the node.',
  `nid` int(10) unsigned NOT NULL default '0' COMMENT 'The node.nid that this item links to.',
  `caption` longtext COMMENT 'The text used to link to the node.nid.',
  PRIMARY KEY  (`sid`,`type`,`nid`),
  KEY `nid` (`nid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores items (like nodes) that link to other nodes, used...';

--
-- Dumping data for table `search_node_links`
--


-- --------------------------------------------------------

--
-- Table structure for table `search_total`
--

CREATE TABLE `search_total` (
  `word` varchar(50) NOT NULL default '' COMMENT 'Primary Key: Unique word in the search index.',
  `count` float default NULL COMMENT 'The count of the word in the index using Zipf’s law to equalize the probability distribution.',
  PRIMARY KEY  (`word`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores search totals for words.';

--
-- Dumping data for table `search_total`
--

INSERT INTO `search_total` VALUES('3dlogojpg', 0.0377886);
INSERT INTO `search_total` VALUES('accessed', 0.30103);
INSERT INTO `search_total` VALUES('app', 0.0157943);
INSERT INTO `search_total` VALUES('audio', 0.0157943);
INSERT INTO `search_total` VALUES('awesome', 0.30103);
INSERT INTO `search_total` VALUES('code', 0.30103);
INSERT INTO `search_total` VALUES('content', 0.30103);
INSERT INTO `search_total` VALUES('cool', 0.30103);
INSERT INTO `search_total` VALUES('could', 0.30103);
INSERT INTO `search_total` VALUES('download', 0.0157943);
INSERT INTO `search_total` VALUES('eventually', 0.30103);
INSERT INTO `search_total` VALUES('exhibit', 0.00407791);
INSERT INTO `search_total` VALUES('for', 0.30103);
INSERT INTO `search_total` VALUES('from', 0.30103);
INSERT INTO `search_total` VALUES('fun', 0.30103);
INSERT INTO `search_total` VALUES('glowing', 0.30103);
INSERT INTO `search_total` VALUES('here', 0.124939);
INSERT INTO `search_total` VALUES('home', 0.0157943);
INSERT INTO `search_total` VALUES('html', 0.0163904);
INSERT INTO `search_total` VALUES('http', 0.124939);
INSERT INTO `search_total` VALUES('images', 0.0163904);
INSERT INTO `search_total` VALUES('instructions', 0.30103);
INSERT INTO `search_total` VALUES('link', 0.0163904);
INSERT INTO `search_total` VALUES('nifty', 0.30103);
INSERT INTO `search_total` VALUES('o3cocxxxota', 0.30103);
INSERT INTO `search_total` VALUES('page', 0.30103);
INSERT INTO `search_total` VALUES('phone', 0.30103);
INSERT INTO `search_total` VALUES('picture', 0.30103);
INSERT INTO `search_total` VALUES('play', 0.30103);
INSERT INTO `search_total` VALUES('sample', 0.30103);
INSERT INTO `search_total` VALUES('scienceonthespheremp3', 0.0377886);
INSERT INTO `search_total` VALUES('test', 0.30103);
INSERT INTO `search_total` VALUES('the', 0.01524);
INSERT INTO `search_total` VALUES('this', 0.30103);
INSERT INTO `search_total` VALUES('tour', 0.0157943);
INSERT INTO `search_total` VALUES('useful', 0.30103);
INSERT INTO `search_total` VALUES('video', 0.0163904);
INSERT INTO `search_total` VALUES('watch', 0.30103);
INSERT INTO `search_total` VALUES('welcome', 0.30103);
INSERT INTO `search_total` VALUES('will', 0.30103);
INSERT INTO `search_total` VALUES('with', 0.0157943);
INSERT INTO `search_total` VALUES('wwwyoutubecom', 0.30103);

-- --------------------------------------------------------

--
-- Table structure for table `semaphore`
--

CREATE TABLE `semaphore` (
  `name` varchar(255) NOT NULL default '' COMMENT 'Primary Key: Unique name.',
  `value` varchar(255) NOT NULL default '' COMMENT 'A value for the semaphore.',
  `expire` double NOT NULL COMMENT 'A Unix timestamp with microseconds indicating when the semaphore should expire.',
  PRIMARY KEY  (`name`),
  KEY `value` (`value`),
  KEY `expire` (`expire`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Table for holding semaphores, locks, flags, etc. that...';

--
-- Dumping data for table `semaphore`
--


-- --------------------------------------------------------

--
-- Table structure for table `sequences`
--

CREATE TABLE `sequences` (
  `value` int(10) unsigned NOT NULL auto_increment COMMENT 'The value of the sequence.',
  PRIMARY KEY  (`value`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Stores IDs.' AUTO_INCREMENT=6 ;

--
-- Dumping data for table `sequences`
--

INSERT INTO `sequences` VALUES(5);

-- --------------------------------------------------------

--
-- Table structure for table `services_endpoint`
--

CREATE TABLE `services_endpoint` (
  `eid` int(10) unsigned NOT NULL auto_increment COMMENT 'Primary ID field for the table. Not used for anything except internal lookups.',
  `name` varchar(255) NOT NULL COMMENT 'The name of the endpoint.',
  `server` varchar(32) NOT NULL COMMENT 'The name of the server used in this endpoint.',
  `path` varchar(255) NOT NULL COMMENT 'The path to the endpoint for this server.',
  `authentication` longtext NOT NULL COMMENT 'The authentication settings for the endpoint.',
  `server_settings` longblob NOT NULL COMMENT 'The server settings for the endpoint.',
  `resources` longtext NOT NULL COMMENT 'Information about the resources exposed in this endpoint.',
  `debug` int(11) NOT NULL default '0' COMMENT 'Set the endpoint in debug mode.',
  PRIMARY KEY  (`eid`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Stores endpoint information for services' AUTO_INCREMENT=2 ;

--
-- Dumping data for table `services_endpoint`
--

INSERT INTO `services_endpoint` VALUES(1, 'qr_content', 'rest_server', 'data', 'a:0:{}', 0x613a323a7b733a31303a22666f726d617474657273223b613a353a7b733a343a226a736f6e223b623a313b733a373a2262656e636f6465223b623a303b733a353a226a736f6e70223b623a303b733a333a22706870223b623a303b733a333a22786d6c223b623a303b7d733a373a2270617273657273223b613a363a7b733a31363a226170706c69636174696f6e2f6a736f6e223b623a313b733a33303a226170706c69636174696f6e2f766e642e7068702e73657269616c697a6564223b623a303b733a33333a226170706c69636174696f6e2f782d7777772d666f726d2d75726c656e636f646564223b623a303b733a31353a226170706c69636174696f6e2f786d6c223b623a303b733a31393a226d756c7469706172742f666f726d2d64617461223b623a303b733a383a22746578742f786d6c223b623a303b7d7d, 'a:2:{s:5:"views";a:1:{s:5:"alias";s:5:"views";}s:13:"content-feed2";a:2:{s:5:"alias";s:2:"qr";s:10:"operations";a:1:{s:5:"index";a:1:{s:7:"enabled";s:1:"1";}}}}', 0);

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `uid` int(10) unsigned NOT NULL COMMENT 'The users.uid corresponding to a session, or 0 for anonymous user.',
  `sid` varchar(128) NOT NULL COMMENT 'A session ID. The value is generated by Drupal’s session handlers.',
  `ssid` varchar(128) NOT NULL default '' COMMENT 'Secure session ID. The value is generated by Drupal’s session handlers.',
  `hostname` varchar(128) NOT NULL default '' COMMENT 'The IP address that last used this session ID (sid).',
  `timestamp` int(11) NOT NULL default '0' COMMENT 'The Unix timestamp when this session last requested a page. Old records are purged by PHP automatically.',
  `cache` int(11) NOT NULL default '0' COMMENT 'The time of this user’s last post. This is used when the site has specified a minimum_cache_lifetime. See cache_get().',
  `session` longblob COMMENT 'The serialized contents of $_SESSION, an array of name/value pairs that persists across page requests by this session ID. Drupal loads $_SESSION from here at the start of each request and saves it at the end.',
  PRIMARY KEY  (`sid`,`ssid`),
  KEY `timestamp` (`timestamp`),
  KEY `uid` (`uid`),
  KEY `ssid` (`ssid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Drupal’s session handlers read and write into the...';

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` VALUES(1, '5AKCLRplVRVEKocfuIoI5LFrFaQKsAuB1c3WXO2Rnc4', '', '208.186.96.36', 1375807447, 0, 0x626174636865737c613a323a7b693a343b623a313b693a353b623a313b7d);
INSERT INTO `sessions` VALUES(1, 'ptn0fUeeBthdoZh2WYe3YiXNOTGlvTmBg8i-q1HBuvs', '', '76.25.187.29', 1375827207, 0, '');

-- --------------------------------------------------------

--
-- Table structure for table `shortcut_set`
--

CREATE TABLE `shortcut_set` (
  `set_name` varchar(32) NOT NULL default '' COMMENT 'Primary Key: The menu_links.menu_name under which the set’s links are stored.',
  `title` varchar(255) NOT NULL default '' COMMENT 'The title of the set.',
  PRIMARY KEY  (`set_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores information about sets of shortcuts links.';

--
-- Dumping data for table `shortcut_set`
--

INSERT INTO `shortcut_set` VALUES('shortcut-set-1', 'Default');

-- --------------------------------------------------------

--
-- Table structure for table `shortcut_set_users`
--

CREATE TABLE `shortcut_set_users` (
  `uid` int(10) unsigned NOT NULL default '0' COMMENT 'The users.uid for this set.',
  `set_name` varchar(32) NOT NULL default '' COMMENT 'The shortcut_set.set_name that will be displayed for this user.',
  PRIMARY KEY  (`uid`),
  KEY `set_name` (`set_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Maps users to shortcut sets.';

--
-- Dumping data for table `shortcut_set_users`
--


-- --------------------------------------------------------

--
-- Table structure for table `system`
--

CREATE TABLE `system` (
  `filename` varchar(255) NOT NULL default '' COMMENT 'The path of the primary file for this item, relative to the Drupal root; e.g. modules/node/node.module.',
  `name` varchar(255) NOT NULL default '' COMMENT 'The name of the item; e.g. node.',
  `type` varchar(12) NOT NULL default '' COMMENT 'The type of the item, either module, theme, or theme_engine.',
  `owner` varchar(255) NOT NULL default '' COMMENT 'A theme’s ’parent’ . Can be either a theme or an engine.',
  `status` int(11) NOT NULL default '0' COMMENT 'Boolean indicating whether or not this item is enabled.',
  `bootstrap` int(11) NOT NULL default '0' COMMENT 'Boolean indicating whether this module is loaded during Drupal’s early bootstrapping phase (e.g. even before the page cache is consulted).',
  `schema_version` smallint(6) NOT NULL default '-1' COMMENT 'The module’s database schema version number. -1 if the module is not installed (its tables do not exist); 0 or the largest N of the module’s hook_update_N() function that has either been run or existed when the module was first installed.',
  `weight` int(11) NOT NULL default '0' COMMENT 'The order in which this module’s hooks should be invoked relative to other modules. Equal-weighted modules are ordered by name.',
  `info` blob COMMENT 'A serialized array containing information from the module’s .info file; keys can include name, description, package, version, core, dependencies, and php.',
  PRIMARY KEY  (`filename`),
  KEY `system_list` (`status`,`bootstrap`,`type`,`weight`,`name`),
  KEY `type_name` (`type`,`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='A list of all modules, themes, and theme engines that are...';

--
-- Dumping data for table `system`
--

INSERT INTO `system` VALUES('modules/aggregator/aggregator.module', 'aggregator', 'module', '', 0, 0, -1, 0, 0x613a31333a7b733a343a226e616d65223b733a31303a2241676772656761746f72223b733a31313a226465736372697074696f6e223b733a35373a22416767726567617465732073796e6469636174656420636f6e74656e7420285253532c205244462c20616e642041746f6d206665656473292e223b733a373a227061636b616765223b733a343a22436f7265223b733a373a2276657273696f6e223b733a343a22372e3232223b733a343a22636f7265223b733a333a22372e78223b733a353a2266696c6573223b613a313a7b693a303b733a31353a2261676772656761746f722e74657374223b7d733a393a22636f6e666967757265223b733a34313a2261646d696e2f636f6e6669672f73657276696365732f61676772656761746f722f73657474696e6773223b733a31313a227374796c65736865657473223b613a313a7b733a333a22616c6c223b613a313a7b733a31343a2261676772656761746f722e637373223b733a33333a226d6f64756c65732f61676772656761746f722f61676772656761746f722e637373223b7d7d733a373a2270726f6a656374223b733a363a2264727570616c223b733a393a22646174657374616d70223b733a31303a2231333635303237303132223b733a31323a22646570656e64656e63696573223b613a303a7b7d733a333a22706870223b733a353a22352e322e34223b733a393a22626f6f747374726170223b693a303b7d);
INSERT INTO `system` VALUES('modules/aggregator/tests/aggregator_test.module', 'aggregator_test', 'module', '', 0, 0, -1, 0, 0x613a31323a7b733a343a226e616d65223b733a32333a2241676772656761746f72206d6f64756c65207465737473223b733a31313a226465736372697074696f6e223b733a34363a22537570706f7274206d6f64756c6520666f722061676772656761746f722072656c617465642074657374696e672e223b733a373a227061636b616765223b733a373a2254657374696e67223b733a373a2276657273696f6e223b733a343a22372e3232223b733a343a22636f7265223b733a333a22372e78223b733a363a2268696464656e223b623a313b733a373a2270726f6a656374223b733a363a2264727570616c223b733a393a22646174657374616d70223b733a31303a2231333635303237303132223b733a31323a22646570656e64656e63696573223b613a303a7b7d733a333a22706870223b733a353a22352e322e34223b733a353a2266696c6573223b613a303a7b7d733a393a22626f6f747374726170223b693a303b7d);
INSERT INTO `system` VALUES('modules/block/block.module', 'block', 'module', '', 1, 0, 7008, -5, 0x613a31323a7b733a343a226e616d65223b733a353a22426c6f636b223b733a31313a226465736372697074696f6e223b733a3134303a22436f6e74726f6c73207468652076697375616c206275696c64696e6720626c6f636b732061207061676520697320636f6e737472756374656420776974682e20426c6f636b732061726520626f786573206f6620636f6e74656e742072656e646572656420696e746f20616e20617265612c206f7220726567696f6e2c206f6620612077656220706167652e223b733a373a227061636b616765223b733a343a22436f7265223b733a373a2276657273696f6e223b733a343a22372e3232223b733a343a22636f7265223b733a333a22372e78223b733a353a2266696c6573223b613a313a7b693a303b733a31303a22626c6f636b2e74657374223b7d733a393a22636f6e666967757265223b733a32313a2261646d696e2f7374727563747572652f626c6f636b223b733a373a2270726f6a656374223b733a363a2264727570616c223b733a393a22646174657374616d70223b733a31303a2231333635303237303132223b733a31323a22646570656e64656e63696573223b613a303a7b7d733a333a22706870223b733a353a22352e322e34223b733a393a22626f6f747374726170223b693a303b7d);
INSERT INTO `system` VALUES('modules/block/tests/block_test.module', 'block_test', 'module', '', 0, 0, -1, 0, 0x613a31323a7b733a343a226e616d65223b733a31303a22426c6f636b2074657374223b733a31313a226465736372697074696f6e223b733a32313a2250726f7669646573207465737420626c6f636b732e223b733a373a227061636b616765223b733a373a2254657374696e67223b733a373a2276657273696f6e223b733a343a22372e3232223b733a343a22636f7265223b733a333a22372e78223b733a363a2268696464656e223b623a313b733a373a2270726f6a656374223b733a363a2264727570616c223b733a393a22646174657374616d70223b733a31303a2231333635303237303132223b733a31323a22646570656e64656e63696573223b613a303a7b7d733a333a22706870223b733a353a22352e322e34223b733a353a2266696c6573223b613a303a7b7d733a393a22626f6f747374726170223b693a303b7d);
INSERT INTO `system` VALUES('modules/blog/blog.module', 'blog', 'module', '', 0, 0, -1, 0, 0x613a31313a7b733a343a226e616d65223b733a343a22426c6f67223b733a31313a226465736372697074696f6e223b733a32353a22456e61626c6573206d756c74692d7573657220626c6f67732e223b733a373a227061636b616765223b733a343a22436f7265223b733a373a2276657273696f6e223b733a343a22372e3232223b733a343a22636f7265223b733a333a22372e78223b733a353a2266696c6573223b613a313a7b693a303b733a393a22626c6f672e74657374223b7d733a373a2270726f6a656374223b733a363a2264727570616c223b733a393a22646174657374616d70223b733a31303a2231333635303237303132223b733a31323a22646570656e64656e63696573223b613a303a7b7d733a333a22706870223b733a353a22352e322e34223b733a393a22626f6f747374726170223b693a303b7d);
INSERT INTO `system` VALUES('modules/book/book.module', 'book', 'module', '', 0, 0, -1, 0, 0x613a31333a7b733a343a226e616d65223b733a343a22426f6f6b223b733a31313a226465736372697074696f6e223b733a36363a22416c6c6f777320757365727320746f2063726561746520616e64206f7267616e697a652072656c6174656420636f6e74656e7420696e20616e206f75746c696e652e223b733a373a227061636b616765223b733a343a22436f7265223b733a373a2276657273696f6e223b733a343a22372e3232223b733a343a22636f7265223b733a333a22372e78223b733a353a2266696c6573223b613a313a7b693a303b733a393a22626f6f6b2e74657374223b7d733a393a22636f6e666967757265223b733a32373a2261646d696e2f636f6e74656e742f626f6f6b2f73657474696e6773223b733a31313a227374796c65736865657473223b613a313a7b733a333a22616c6c223b613a313a7b733a383a22626f6f6b2e637373223b733a32313a226d6f64756c65732f626f6f6b2f626f6f6b2e637373223b7d7d733a373a2270726f6a656374223b733a363a2264727570616c223b733a393a22646174657374616d70223b733a31303a2231333635303237303132223b733a31323a22646570656e64656e63696573223b613a303a7b7d733a333a22706870223b733a353a22352e322e34223b733a393a22626f6f747374726170223b693a303b7d);
INSERT INTO `system` VALUES('modules/color/color.module', 'color', 'module', '', 1, 0, 7001, 0, 0x613a31313a7b733a343a226e616d65223b733a353a22436f6c6f72223b733a31313a226465736372697074696f6e223b733a37303a22416c6c6f77732061646d696e6973747261746f727320746f206368616e67652074686520636f6c6f7220736368656d65206f6620636f6d70617469626c65207468656d65732e223b733a373a227061636b616765223b733a343a22436f7265223b733a373a2276657273696f6e223b733a343a22372e3232223b733a343a22636f7265223b733a333a22372e78223b733a353a2266696c6573223b613a313a7b693a303b733a31303a22636f6c6f722e74657374223b7d733a373a2270726f6a656374223b733a363a2264727570616c223b733a393a22646174657374616d70223b733a31303a2231333635303237303132223b733a31323a22646570656e64656e63696573223b613a303a7b7d733a333a22706870223b733a353a22352e322e34223b733a393a22626f6f747374726170223b693a303b7d);
INSERT INTO `system` VALUES('modules/comment/comment.module', 'comment', 'module', '', 1, 0, 7009, 0, 0x613a31333a7b733a343a226e616d65223b733a373a22436f6d6d656e74223b733a31313a226465736372697074696f6e223b733a35373a22416c6c6f777320757365727320746f20636f6d6d656e74206f6e20616e642064697363757373207075626c697368656420636f6e74656e742e223b733a373a227061636b616765223b733a343a22436f7265223b733a373a2276657273696f6e223b733a343a22372e3232223b733a343a22636f7265223b733a333a22372e78223b733a31323a22646570656e64656e63696573223b613a313a7b693a303b733a343a2274657874223b7d733a353a2266696c6573223b613a323a7b693a303b733a31343a22636f6d6d656e742e6d6f64756c65223b693a313b733a31323a22636f6d6d656e742e74657374223b7d733a393a22636f6e666967757265223b733a32313a2261646d696e2f636f6e74656e742f636f6d6d656e74223b733a31313a227374796c65736865657473223b613a313a7b733a333a22616c6c223b613a313a7b733a31313a22636f6d6d656e742e637373223b733a32373a226d6f64756c65732f636f6d6d656e742f636f6d6d656e742e637373223b7d7d733a373a2270726f6a656374223b733a363a2264727570616c223b733a393a22646174657374616d70223b733a31303a2231333635303237303132223b733a333a22706870223b733a353a22352e322e34223b733a393a22626f6f747374726170223b693a303b7d);
INSERT INTO `system` VALUES('modules/contact/contact.module', 'contact', 'module', '', 0, 0, -1, 0, 0x613a31323a7b733a343a226e616d65223b733a373a22436f6e74616374223b733a31313a226465736372697074696f6e223b733a36313a22456e61626c65732074686520757365206f6620626f746820706572736f6e616c20616e6420736974652d7769646520636f6e7461637420666f726d732e223b733a373a227061636b616765223b733a343a22436f7265223b733a373a2276657273696f6e223b733a343a22372e3232223b733a343a22636f7265223b733a333a22372e78223b733a353a2266696c6573223b613a313a7b693a303b733a31323a22636f6e746163742e74657374223b7d733a393a22636f6e666967757265223b733a32333a2261646d696e2f7374727563747572652f636f6e74616374223b733a373a2270726f6a656374223b733a363a2264727570616c223b733a393a22646174657374616d70223b733a31303a2231333635303237303132223b733a31323a22646570656e64656e63696573223b613a303a7b7d733a333a22706870223b733a353a22352e322e34223b733a393a22626f6f747374726170223b693a303b7d);
INSERT INTO `system` VALUES('modules/contextual/contextual.module', 'contextual', 'module', '', 1, 0, 0, 0, 0x613a31313a7b733a343a226e616d65223b733a31363a22436f6e7465787475616c206c696e6b73223b733a31313a226465736372697074696f6e223b733a37353a2250726f766964657320636f6e7465787475616c206c696e6b7320746f20706572666f726d20616374696f6e732072656c6174656420746f20656c656d656e7473206f6e206120706167652e223b733a373a227061636b616765223b733a343a22436f7265223b733a373a2276657273696f6e223b733a343a22372e3232223b733a343a22636f7265223b733a333a22372e78223b733a353a2266696c6573223b613a313a7b693a303b733a31353a22636f6e7465787475616c2e74657374223b7d733a373a2270726f6a656374223b733a363a2264727570616c223b733a393a22646174657374616d70223b733a31303a2231333635303237303132223b733a31323a22646570656e64656e63696573223b613a303a7b7d733a333a22706870223b733a353a22352e322e34223b733a393a22626f6f747374726170223b693a303b7d);
INSERT INTO `system` VALUES('modules/dashboard/dashboard.module', 'dashboard', 'module', '', 1, 0, 0, 0, 0x613a31323a7b733a343a226e616d65223b733a393a2244617368626f617264223b733a31313a226465736372697074696f6e223b733a3133363a2250726f766964657320612064617368626f617264207061676520696e207468652061646d696e69737472617469766520696e7465726661636520666f72206f7267616e697a696e672061646d696e697374726174697665207461736b7320616e6420747261636b696e6720696e666f726d6174696f6e2077697468696e20796f757220736974652e223b733a343a22636f7265223b733a333a22372e78223b733a373a227061636b616765223b733a343a22436f7265223b733a373a2276657273696f6e223b733a343a22372e3232223b733a353a2266696c6573223b613a313a7b693a303b733a31343a2264617368626f6172642e74657374223b7d733a31323a22646570656e64656e63696573223b613a313a7b693a303b733a353a22626c6f636b223b7d733a393a22636f6e666967757265223b733a32353a2261646d696e2f64617368626f6172642f637573746f6d697a65223b733a373a2270726f6a656374223b733a363a2264727570616c223b733a393a22646174657374616d70223b733a31303a2231333635303237303132223b733a333a22706870223b733a353a22352e322e34223b733a393a22626f6f747374726170223b693a303b7d);
INSERT INTO `system` VALUES('modules/dblog/dblog.module', 'dblog', 'module', '', 1, 1, 7002, 0, 0x613a31313a7b733a343a226e616d65223b733a31363a224461746162617365206c6f6767696e67223b733a31313a226465736372697074696f6e223b733a34373a224c6f677320616e64207265636f7264732073797374656d206576656e747320746f207468652064617461626173652e223b733a373a227061636b616765223b733a343a22436f7265223b733a373a2276657273696f6e223b733a343a22372e3232223b733a343a22636f7265223b733a333a22372e78223b733a353a2266696c6573223b613a313a7b693a303b733a31303a2264626c6f672e74657374223b7d733a373a2270726f6a656374223b733a363a2264727570616c223b733a393a22646174657374616d70223b733a31303a2231333635303237303132223b733a31323a22646570656e64656e63696573223b613a303a7b7d733a333a22706870223b733a353a22352e322e34223b733a393a22626f6f747374726170223b693a303b7d);
INSERT INTO `system` VALUES('modules/field/field.module', 'field', 'module', '', 1, 0, 7003, 0, 0x613a31333a7b733a343a226e616d65223b733a353a224669656c64223b733a31313a226465736372697074696f6e223b733a35373a224669656c642041504920746f20616464206669656c647320746f20656e746974696573206c696b65206e6f64657320616e642075736572732e223b733a373a227061636b616765223b733a343a22436f7265223b733a373a2276657273696f6e223b733a343a22372e3232223b733a343a22636f7265223b733a333a22372e78223b733a353a2266696c6573223b613a343a7b693a303b733a31323a226669656c642e6d6f64756c65223b693a313b733a31363a226669656c642e6174746163682e696e63223b693a323b733a32303a226669656c642e696e666f2e636c6173732e696e63223b693a333b733a31363a2274657374732f6669656c642e74657374223b7d733a31323a22646570656e64656e63696573223b613a313a7b693a303b733a31373a226669656c645f73716c5f73746f72616765223b7d733a383a227265717569726564223b623a313b733a31313a227374796c65736865657473223b613a313a7b733a333a22616c6c223b613a313a7b733a31353a227468656d652f6669656c642e637373223b733a32393a226d6f64756c65732f6669656c642f7468656d652f6669656c642e637373223b7d7d733a373a2270726f6a656374223b733a363a2264727570616c223b733a393a22646174657374616d70223b733a31303a2231333635303237303132223b733a333a22706870223b733a353a22352e322e34223b733a393a22626f6f747374726170223b693a303b7d);
INSERT INTO `system` VALUES('modules/field/modules/field_sql_storage/field_sql_storage.module', 'field_sql_storage', 'module', '', 1, 0, 7002, 0, 0x613a31323a7b733a343a226e616d65223b733a31373a224669656c642053514c2073746f72616765223b733a31313a226465736372697074696f6e223b733a33373a2253746f726573206669656c64206461746120696e20616e2053514c2064617461626173652e223b733a373a227061636b616765223b733a343a22436f7265223b733a373a2276657273696f6e223b733a343a22372e3232223b733a343a22636f7265223b733a333a22372e78223b733a31323a22646570656e64656e63696573223b613a313a7b693a303b733a353a226669656c64223b7d733a353a2266696c6573223b613a313a7b693a303b733a32323a226669656c645f73716c5f73746f726167652e74657374223b7d733a383a227265717569726564223b623a313b733a373a2270726f6a656374223b733a363a2264727570616c223b733a393a22646174657374616d70223b733a31303a2231333635303237303132223b733a333a22706870223b733a353a22352e322e34223b733a393a22626f6f747374726170223b693a303b7d);
INSERT INTO `system` VALUES('modules/field/modules/list/list.module', 'list', 'module', '', 1, 0, 7002, 0, 0x613a31313a7b733a343a226e616d65223b733a343a224c697374223b733a31313a226465736372697074696f6e223b733a36393a22446566696e6573206c697374206669656c642074797065732e205573652077697468204f7074696f6e7320746f206372656174652073656c656374696f6e206c697374732e223b733a373a227061636b616765223b733a343a22436f7265223b733a373a2276657273696f6e223b733a343a22372e3232223b733a343a22636f7265223b733a333a22372e78223b733a31323a22646570656e64656e63696573223b613a323a7b693a303b733a353a226669656c64223b693a313b733a373a226f7074696f6e73223b7d733a353a2266696c6573223b613a313a7b693a303b733a31353a2274657374732f6c6973742e74657374223b7d733a373a2270726f6a656374223b733a363a2264727570616c223b733a393a22646174657374616d70223b733a31303a2231333635303237303132223b733a333a22706870223b733a353a22352e322e34223b733a393a22626f6f747374726170223b693a303b7d);
INSERT INTO `system` VALUES('modules/field/modules/list/tests/list_test.module', 'list_test', 'module', '', 0, 0, -1, 0, 0x613a31323a7b733a343a226e616d65223b733a393a224c6973742074657374223b733a31313a226465736372697074696f6e223b733a34313a22537570706f7274206d6f64756c6520666f7220746865204c697374206d6f64756c652074657374732e223b733a343a22636f7265223b733a333a22372e78223b733a373a227061636b616765223b733a373a2254657374696e67223b733a373a2276657273696f6e223b733a343a22372e3232223b733a363a2268696464656e223b623a313b733a373a2270726f6a656374223b733a363a2264727570616c223b733a393a22646174657374616d70223b733a31303a2231333635303237303132223b733a31323a22646570656e64656e63696573223b613a303a7b7d733a333a22706870223b733a353a22352e322e34223b733a353a2266696c6573223b613a303a7b7d733a393a22626f6f747374726170223b693a303b7d);
INSERT INTO `system` VALUES('modules/field/modules/number/number.module', 'number', 'module', '', 1, 0, 0, 0, 0x613a31313a7b733a343a226e616d65223b733a363a224e756d626572223b733a31313a226465736372697074696f6e223b733a32383a22446566696e6573206e756d65726963206669656c642074797065732e223b733a373a227061636b616765223b733a343a22436f7265223b733a373a2276657273696f6e223b733a343a22372e3232223b733a343a22636f7265223b733a333a22372e78223b733a31323a22646570656e64656e63696573223b613a313a7b693a303b733a353a226669656c64223b7d733a353a2266696c6573223b613a313a7b693a303b733a31313a226e756d6265722e74657374223b7d733a373a2270726f6a656374223b733a363a2264727570616c223b733a393a22646174657374616d70223b733a31303a2231333635303237303132223b733a333a22706870223b733a353a22352e322e34223b733a393a22626f6f747374726170223b693a303b7d);
INSERT INTO `system` VALUES('modules/field/modules/options/options.module', 'options', 'module', '', 1, 0, 0, 0, 0x613a31313a7b733a343a226e616d65223b733a373a224f7074696f6e73223b733a31313a226465736372697074696f6e223b733a38323a22446566696e65732073656c656374696f6e2c20636865636b20626f7820616e6420726164696f20627574746f6e207769646765747320666f72207465787420616e64206e756d65726963206669656c64732e223b733a373a227061636b616765223b733a343a22436f7265223b733a373a2276657273696f6e223b733a343a22372e3232223b733a343a22636f7265223b733a333a22372e78223b733a31323a22646570656e64656e63696573223b613a313a7b693a303b733a353a226669656c64223b7d733a353a2266696c6573223b613a313a7b693a303b733a31323a226f7074696f6e732e74657374223b7d733a373a2270726f6a656374223b733a363a2264727570616c223b733a393a22646174657374616d70223b733a31303a2231333635303237303132223b733a333a22706870223b733a353a22352e322e34223b733a393a22626f6f747374726170223b693a303b7d);
INSERT INTO `system` VALUES('modules/field/modules/text/text.module', 'text', 'module', '', 1, 0, 7000, 0, 0x613a31333a7b733a343a226e616d65223b733a343a2254657874223b733a31313a226465736372697074696f6e223b733a33323a22446566696e65732073696d706c652074657874206669656c642074797065732e223b733a373a227061636b616765223b733a343a22436f7265223b733a373a2276657273696f6e223b733a343a22372e3232223b733a343a22636f7265223b733a333a22372e78223b733a31323a22646570656e64656e63696573223b613a313a7b693a303b733a353a226669656c64223b7d733a353a2266696c6573223b613a313a7b693a303b733a393a22746578742e74657374223b7d733a383a227265717569726564223b623a313b733a373a2270726f6a656374223b733a363a2264727570616c223b733a393a22646174657374616d70223b733a31303a2231333635303237303132223b733a333a22706870223b733a353a22352e322e34223b733a393a22626f6f747374726170223b693a303b733a31313a226578706c616e6174696f6e223b733a37333a224669656c64207479706528732920696e20757365202d20736565203c6120687265663d222f61646d696e2f7265706f7274732f6669656c6473223e4669656c64206c6973743c2f613e223b7d);
INSERT INTO `system` VALUES('modules/field/tests/field_test.module', 'field_test', 'module', '', 0, 0, -1, 0, 0x613a31323a7b733a343a226e616d65223b733a31343a224669656c64204150492054657374223b733a31313a226465736372697074696f6e223b733a33393a22537570706f7274206d6f64756c6520666f7220746865204669656c64204150492074657374732e223b733a343a22636f7265223b733a333a22372e78223b733a373a227061636b616765223b733a373a2254657374696e67223b733a353a2266696c6573223b613a313a7b693a303b733a32313a226669656c645f746573742e656e746974792e696e63223b7d733a373a2276657273696f6e223b733a343a22372e3232223b733a363a2268696464656e223b623a313b733a373a2270726f6a656374223b733a363a2264727570616c223b733a393a22646174657374616d70223b733a31303a2231333635303237303132223b733a31323a22646570656e64656e63696573223b613a303a7b7d733a333a22706870223b733a353a22352e322e34223b733a393a22626f6f747374726170223b693a303b7d);
INSERT INTO `system` VALUES('modules/field_ui/field_ui.module', 'field_ui', 'module', '', 1, 0, 0, 0, 0x613a31313a7b733a343a226e616d65223b733a383a224669656c64205549223b733a31313a226465736372697074696f6e223b733a33333a225573657220696e7465726661636520666f7220746865204669656c64204150492e223b733a373a227061636b616765223b733a343a22436f7265223b733a373a2276657273696f6e223b733a343a22372e3232223b733a343a22636f7265223b733a333a22372e78223b733a31323a22646570656e64656e63696573223b613a313a7b693a303b733a353a226669656c64223b7d733a353a2266696c6573223b613a313a7b693a303b733a31333a226669656c645f75692e74657374223b7d733a373a2270726f6a656374223b733a363a2264727570616c223b733a393a22646174657374616d70223b733a31303a2231333635303237303132223b733a333a22706870223b733a353a22352e322e34223b733a393a22626f6f747374726170223b693a303b7d);
INSERT INTO `system` VALUES('modules/file/file.module', 'file', 'module', '', 1, 0, 0, 0, 0x613a31333a7b733a343a226e616d65223b733a343a2246696c65223b733a31313a226465736372697074696f6e223b733a32363a22446566696e657320612066696c65206669656c6420747970652e223b733a373a227061636b616765223b733a343a22436f7265223b733a373a2276657273696f6e223b733a343a22372e3232223b733a343a22636f7265223b733a333a22372e78223b733a31323a22646570656e64656e63696573223b613a313a7b693a303b733a353a226669656c64223b7d733a353a2266696c6573223b613a313a7b693a303b733a31353a2274657374732f66696c652e74657374223b7d733a373a2270726f6a656374223b733a363a2264727570616c223b733a393a22646174657374616d70223b733a31303a2231333635303237303132223b733a333a22706870223b733a353a22352e322e34223b733a393a22626f6f747374726170223b693a303b733a383a227265717569726564223b623a313b733a31313a226578706c616e6174696f6e223b733a37333a224669656c64207479706528732920696e20757365202d20736565203c6120687265663d222f61646d696e2f7265706f7274732f6669656c6473223e4669656c64206c6973743c2f613e223b7d);
INSERT INTO `system` VALUES('modules/file/tests/file_module_test.module', 'file_module_test', 'module', '', 0, 0, -1, 0, 0x613a31323a7b733a343a226e616d65223b733a393a2246696c652074657374223b733a31313a226465736372697074696f6e223b733a35333a2250726f766964657320686f6f6b7320666f722074657374696e672046696c65206d6f64756c652066756e6374696f6e616c6974792e223b733a373a227061636b616765223b733a343a22436f7265223b733a373a2276657273696f6e223b733a343a22372e3232223b733a343a22636f7265223b733a333a22372e78223b733a363a2268696464656e223b623a313b733a373a2270726f6a656374223b733a363a2264727570616c223b733a393a22646174657374616d70223b733a31303a2231333635303237303132223b733a31323a22646570656e64656e63696573223b613a303a7b7d733a333a22706870223b733a353a22352e322e34223b733a353a2266696c6573223b613a303a7b7d733a393a22626f6f747374726170223b693a303b7d);
INSERT INTO `system` VALUES('modules/filter/filter.module', 'filter', 'module', '', 1, 0, 7010, 0, 0x613a31333a7b733a343a226e616d65223b733a363a2246696c746572223b733a31313a226465736372697074696f6e223b733a34333a2246696c7465727320636f6e74656e7420696e207072657061726174696f6e20666f7220646973706c61792e223b733a373a227061636b616765223b733a343a22436f7265223b733a373a2276657273696f6e223b733a343a22372e3232223b733a343a22636f7265223b733a333a22372e78223b733a353a2266696c6573223b613a313a7b693a303b733a31313a2266696c7465722e74657374223b7d733a383a227265717569726564223b623a313b733a393a22636f6e666967757265223b733a32383a2261646d696e2f636f6e6669672f636f6e74656e742f666f726d617473223b733a373a2270726f6a656374223b733a363a2264727570616c223b733a393a22646174657374616d70223b733a31303a2231333635303237303132223b733a31323a22646570656e64656e63696573223b613a303a7b7d733a333a22706870223b733a353a22352e322e34223b733a393a22626f6f747374726170223b693a303b7d);
INSERT INTO `system` VALUES('modules/forum/forum.module', 'forum', 'module', '', 0, 0, -1, 0, 0x613a31333a7b733a343a226e616d65223b733a353a22466f72756d223b733a31313a226465736372697074696f6e223b733a32373a2250726f76696465732064697363757373696f6e20666f72756d732e223b733a31323a22646570656e64656e63696573223b613a323a7b693a303b733a383a227461786f6e6f6d79223b693a313b733a373a22636f6d6d656e74223b7d733a373a227061636b616765223b733a343a22436f7265223b733a373a2276657273696f6e223b733a343a22372e3232223b733a343a22636f7265223b733a333a22372e78223b733a353a2266696c6573223b613a313a7b693a303b733a31303a22666f72756d2e74657374223b7d733a393a22636f6e666967757265223b733a32313a2261646d696e2f7374727563747572652f666f72756d223b733a31313a227374796c65736865657473223b613a313a7b733a333a22616c6c223b613a313a7b733a393a22666f72756d2e637373223b733a32333a226d6f64756c65732f666f72756d2f666f72756d2e637373223b7d7d733a373a2270726f6a656374223b733a363a2264727570616c223b733a393a22646174657374616d70223b733a31303a2231333635303237303132223b733a333a22706870223b733a353a22352e322e34223b733a393a22626f6f747374726170223b693a303b7d);
INSERT INTO `system` VALUES('modules/help/help.module', 'help', 'module', '', 1, 0, 0, 0, 0x613a31313a7b733a343a226e616d65223b733a343a2248656c70223b733a31313a226465736372697074696f6e223b733a33353a224d616e616765732074686520646973706c6179206f66206f6e6c696e652068656c702e223b733a373a227061636b616765223b733a343a22436f7265223b733a373a2276657273696f6e223b733a343a22372e3232223b733a343a22636f7265223b733a333a22372e78223b733a353a2266696c6573223b613a313a7b693a303b733a393a2268656c702e74657374223b7d733a373a2270726f6a656374223b733a363a2264727570616c223b733a393a22646174657374616d70223b733a31303a2231333635303237303132223b733a31323a22646570656e64656e63696573223b613a303a7b7d733a333a22706870223b733a353a22352e322e34223b733a393a22626f6f747374726170223b693a303b7d);
INSERT INTO `system` VALUES('modules/image/image.module', 'image', 'module', '', 1, 0, 7004, 0, 0x613a31343a7b733a343a226e616d65223b733a353a22496d616765223b733a31313a226465736372697074696f6e223b733a33343a2250726f766964657320696d616765206d616e6970756c6174696f6e20746f6f6c732e223b733a373a227061636b616765223b733a343a22436f7265223b733a373a2276657273696f6e223b733a343a22372e3232223b733a343a22636f7265223b733a333a22372e78223b733a31323a22646570656e64656e63696573223b613a313a7b693a303b733a343a2266696c65223b7d733a353a2266696c6573223b613a313a7b693a303b733a31303a22696d6167652e74657374223b7d733a393a22636f6e666967757265223b733a33313a2261646d696e2f636f6e6669672f6d656469612f696d6167652d7374796c6573223b733a373a2270726f6a656374223b733a363a2264727570616c223b733a393a22646174657374616d70223b733a31303a2231333635303237303132223b733a333a22706870223b733a353a22352e322e34223b733a393a22626f6f747374726170223b693a303b733a383a227265717569726564223b623a313b733a31313a226578706c616e6174696f6e223b733a37333a224669656c64207479706528732920696e20757365202d20736565203c6120687265663d222f61646d696e2f7265706f7274732f6669656c6473223e4669656c64206c6973743c2f613e223b7d);
INSERT INTO `system` VALUES('modules/image/tests/image_module_test.module', 'image_module_test', 'module', '', 0, 0, -1, 0, 0x613a31323a7b733a343a226e616d65223b733a31303a22496d6167652074657374223b733a31313a226465736372697074696f6e223b733a36393a2250726f766964657320686f6f6b20696d706c656d656e746174696f6e7320666f722074657374696e6720496d616765206d6f64756c652066756e6374696f6e616c6974792e223b733a373a227061636b616765223b733a343a22436f7265223b733a373a2276657273696f6e223b733a343a22372e3232223b733a343a22636f7265223b733a333a22372e78223b733a353a2266696c6573223b613a313a7b693a303b733a32343a22696d6167655f6d6f64756c655f746573742e6d6f64756c65223b7d733a363a2268696464656e223b623a313b733a373a2270726f6a656374223b733a363a2264727570616c223b733a393a22646174657374616d70223b733a31303a2231333635303237303132223b733a31323a22646570656e64656e63696573223b613a303a7b7d733a333a22706870223b733a353a22352e322e34223b733a393a22626f6f747374726170223b693a303b7d);
INSERT INTO `system` VALUES('modules/locale/locale.module', 'locale', 'module', '', 0, 0, -1, 0, 0x613a31323a7b733a343a226e616d65223b733a363a224c6f63616c65223b733a31313a226465736372697074696f6e223b733a3131393a2241646473206c616e67756167652068616e646c696e672066756e6374696f6e616c69747920616e6420656e61626c657320746865207472616e736c6174696f6e206f6620746865207573657220696e7465726661636520746f206c616e677561676573206f74686572207468616e20456e676c6973682e223b733a373a227061636b616765223b733a343a22436f7265223b733a373a2276657273696f6e223b733a343a22372e3232223b733a343a22636f7265223b733a333a22372e78223b733a353a2266696c6573223b613a313a7b693a303b733a31313a226c6f63616c652e74657374223b7d733a393a22636f6e666967757265223b733a33303a2261646d696e2f636f6e6669672f726567696f6e616c2f6c616e6775616765223b733a373a2270726f6a656374223b733a363a2264727570616c223b733a393a22646174657374616d70223b733a31303a2231333635303237303132223b733a31323a22646570656e64656e63696573223b613a303a7b7d733a333a22706870223b733a353a22352e322e34223b733a393a22626f6f747374726170223b693a303b7d);
INSERT INTO `system` VALUES('modules/locale/tests/locale_test.module', 'locale_test', 'module', '', 0, 0, -1, 0, 0x613a31323a7b733a343a226e616d65223b733a31313a224c6f63616c652054657374223b733a31313a226465736372697074696f6e223b733a34323a22537570706f7274206d6f64756c6520666f7220746865206c6f63616c65206c617965722074657374732e223b733a343a22636f7265223b733a333a22372e78223b733a373a227061636b616765223b733a373a2254657374696e67223b733a373a2276657273696f6e223b733a343a22372e3232223b733a363a2268696464656e223b623a313b733a373a2270726f6a656374223b733a363a2264727570616c223b733a393a22646174657374616d70223b733a31303a2231333635303237303132223b733a31323a22646570656e64656e63696573223b613a303a7b7d733a333a22706870223b733a353a22352e322e34223b733a353a2266696c6573223b613a303a7b7d733a393a22626f6f747374726170223b693a303b7d);
INSERT INTO `system` VALUES('modules/menu/menu.module', 'menu', 'module', '', 1, 0, 7003, 0, 0x613a31323a7b733a343a226e616d65223b733a343a224d656e75223b733a31313a226465736372697074696f6e223b733a36303a22416c6c6f77732061646d696e6973747261746f727320746f20637573746f6d697a65207468652073697465206e617669676174696f6e206d656e752e223b733a373a227061636b616765223b733a343a22436f7265223b733a373a2276657273696f6e223b733a343a22372e3232223b733a343a22636f7265223b733a333a22372e78223b733a353a2266696c6573223b613a313a7b693a303b733a393a226d656e752e74657374223b7d733a393a22636f6e666967757265223b733a32303a2261646d696e2f7374727563747572652f6d656e75223b733a373a2270726f6a656374223b733a363a2264727570616c223b733a393a22646174657374616d70223b733a31303a2231333635303237303132223b733a31323a22646570656e64656e63696573223b613a303a7b7d733a333a22706870223b733a353a22352e322e34223b733a393a22626f6f747374726170223b693a303b7d);
INSERT INTO `system` VALUES('modules/node/node.module', 'node', 'module', '', 1, 0, 7013, 0, 0x613a31343a7b733a343a226e616d65223b733a343a224e6f6465223b733a31313a226465736372697074696f6e223b733a36363a22416c6c6f777320636f6e74656e7420746f206265207375626d697474656420746f20746865207369746520616e6420646973706c61796564206f6e2070616765732e223b733a373a227061636b616765223b733a343a22436f7265223b733a373a2276657273696f6e223b733a343a22372e3232223b733a343a22636f7265223b733a333a22372e78223b733a353a2266696c6573223b613a323a7b693a303b733a31313a226e6f64652e6d6f64756c65223b693a313b733a393a226e6f64652e74657374223b7d733a383a227265717569726564223b623a313b733a393a22636f6e666967757265223b733a32313a2261646d696e2f7374727563747572652f7479706573223b733a31313a227374796c65736865657473223b613a313a7b733a333a22616c6c223b613a313a7b733a383a226e6f64652e637373223b733a32313a226d6f64756c65732f6e6f64652f6e6f64652e637373223b7d7d733a373a2270726f6a656374223b733a363a2264727570616c223b733a393a22646174657374616d70223b733a31303a2231333635303237303132223b733a31323a22646570656e64656e63696573223b613a303a7b7d733a333a22706870223b733a353a22352e322e34223b733a393a22626f6f747374726170223b693a303b7d);
INSERT INTO `system` VALUES('modules/node/tests/node_access_test.module', 'node_access_test', 'module', '', 0, 0, -1, 0, 0x613a31323a7b733a343a226e616d65223b733a32343a224e6f6465206d6f64756c6520616363657373207465737473223b733a31313a226465736372697074696f6e223b733a34333a22537570706f7274206d6f64756c6520666f72206e6f6465207065726d697373696f6e2074657374696e672e223b733a373a227061636b616765223b733a373a2254657374696e67223b733a373a2276657273696f6e223b733a343a22372e3232223b733a343a22636f7265223b733a333a22372e78223b733a363a2268696464656e223b623a313b733a373a2270726f6a656374223b733a363a2264727570616c223b733a393a22646174657374616d70223b733a31303a2231333635303237303132223b733a31323a22646570656e64656e63696573223b613a303a7b7d733a333a22706870223b733a353a22352e322e34223b733a353a2266696c6573223b613a303a7b7d733a393a22626f6f747374726170223b693a303b7d);
INSERT INTO `system` VALUES('modules/node/tests/node_test.module', 'node_test', 'module', '', 0, 0, -1, 0, 0x613a31323a7b733a343a226e616d65223b733a31373a224e6f6465206d6f64756c65207465737473223b733a31313a226465736372697074696f6e223b733a34303a22537570706f7274206d6f64756c6520666f72206e6f64652072656c617465642074657374696e672e223b733a373a227061636b616765223b733a373a2254657374696e67223b733a373a2276657273696f6e223b733a343a22372e3232223b733a343a22636f7265223b733a333a22372e78223b733a363a2268696464656e223b623a313b733a373a2270726f6a656374223b733a363a2264727570616c223b733a393a22646174657374616d70223b733a31303a2231333635303237303132223b733a31323a22646570656e64656e63696573223b613a303a7b7d733a333a22706870223b733a353a22352e322e34223b733a353a2266696c6573223b613a303a7b7d733a393a22626f6f747374726170223b693a303b7d);
INSERT INTO `system` VALUES('modules/node/tests/node_test_exception.module', 'node_test_exception', 'module', '', 0, 0, -1, 0, 0x613a31323a7b733a343a226e616d65223b733a32373a224e6f6465206d6f64756c6520657863657074696f6e207465737473223b733a31313a226465736372697074696f6e223b733a35303a22537570706f7274206d6f64756c6520666f72206e6f64652072656c6174656420657863657074696f6e2074657374696e672e223b733a373a227061636b616765223b733a373a2254657374696e67223b733a373a2276657273696f6e223b733a343a22372e3232223b733a343a22636f7265223b733a333a22372e78223b733a363a2268696464656e223b623a313b733a373a2270726f6a656374223b733a363a2264727570616c223b733a393a22646174657374616d70223b733a31303a2231333635303237303132223b733a31323a22646570656e64656e63696573223b613a303a7b7d733a333a22706870223b733a353a22352e322e34223b733a353a2266696c6573223b613a303a7b7d733a393a22626f6f747374726170223b693a303b7d);
INSERT INTO `system` VALUES('modules/openid/openid.module', 'openid', 'module', '', 0, 0, -1, 0, 0x613a31313a7b733a343a226e616d65223b733a363a224f70656e4944223b733a31313a226465736372697074696f6e223b733a34383a22416c6c6f777320757365727320746f206c6f6720696e746f20796f75722073697465207573696e67204f70656e49442e223b733a373a2276657273696f6e223b733a343a22372e3232223b733a373a227061636b616765223b733a343a22436f7265223b733a343a22636f7265223b733a333a22372e78223b733a353a2266696c6573223b613a313a7b693a303b733a31313a226f70656e69642e74657374223b7d733a373a2270726f6a656374223b733a363a2264727570616c223b733a393a22646174657374616d70223b733a31303a2231333635303237303132223b733a31323a22646570656e64656e63696573223b613a303a7b7d733a333a22706870223b733a353a22352e322e34223b733a393a22626f6f747374726170223b693a303b7d);
INSERT INTO `system` VALUES('modules/openid/tests/openid_test.module', 'openid_test', 'module', '', 0, 0, -1, 0, 0x613a31323a7b733a343a226e616d65223b733a32313a224f70656e49442064756d6d792070726f7669646572223b733a31313a226465736372697074696f6e223b733a33333a224f70656e49442070726f7669646572207573656420666f722074657374696e672e223b733a373a227061636b616765223b733a373a2254657374696e67223b733a373a2276657273696f6e223b733a343a22372e3232223b733a343a22636f7265223b733a333a22372e78223b733a31323a22646570656e64656e63696573223b613a313a7b693a303b733a363a226f70656e6964223b7d733a363a2268696464656e223b623a313b733a373a2270726f6a656374223b733a363a2264727570616c223b733a393a22646174657374616d70223b733a31303a2231333635303237303132223b733a333a22706870223b733a353a22352e322e34223b733a353a2266696c6573223b613a303a7b7d733a393a22626f6f747374726170223b693a303b7d);
INSERT INTO `system` VALUES('modules/overlay/overlay.module', 'overlay', 'module', '', 1, 1, 0, 0, 0x613a31313a7b733a343a226e616d65223b733a373a224f7665726c6179223b733a31313a226465736372697074696f6e223b733a35393a22446973706c617973207468652044727570616c2061646d696e697374726174696f6e20696e7465726661636520696e20616e206f7665726c61792e223b733a373a227061636b616765223b733a343a22436f7265223b733a373a2276657273696f6e223b733a343a22372e3232223b733a343a22636f7265223b733a333a22372e78223b733a373a2270726f6a656374223b733a363a2264727570616c223b733a393a22646174657374616d70223b733a31303a2231333635303237303132223b733a31323a22646570656e64656e63696573223b613a303a7b7d733a333a22706870223b733a353a22352e322e34223b733a353a2266696c6573223b613a303a7b7d733a393a22626f6f747374726170223b693a303b7d);
INSERT INTO `system` VALUES('modules/path/path.module', 'path', 'module', '', 1, 0, 0, 0, 0x613a31323a7b733a343a226e616d65223b733a343a2250617468223b733a31313a226465736372697074696f6e223b733a32383a22416c6c6f777320757365727320746f2072656e616d652055524c732e223b733a373a227061636b616765223b733a343a22436f7265223b733a373a2276657273696f6e223b733a343a22372e3232223b733a343a22636f7265223b733a333a22372e78223b733a353a2266696c6573223b613a313a7b693a303b733a393a22706174682e74657374223b7d733a393a22636f6e666967757265223b733a32343a2261646d696e2f636f6e6669672f7365617263682f70617468223b733a373a2270726f6a656374223b733a363a2264727570616c223b733a393a22646174657374616d70223b733a31303a2231333635303237303132223b733a31323a22646570656e64656e63696573223b613a303a7b7d733a333a22706870223b733a353a22352e322e34223b733a393a22626f6f747374726170223b693a303b7d);
INSERT INTO `system` VALUES('modules/php/php.module', 'php', 'module', '', 0, 0, -1, 0, 0x613a31313a7b733a343a226e616d65223b733a31303a225048502066696c746572223b733a31313a226465736372697074696f6e223b733a35303a22416c6c6f777320656d6265646465642050485020636f64652f736e69707065747320746f206265206576616c75617465642e223b733a373a227061636b616765223b733a343a22436f7265223b733a373a2276657273696f6e223b733a343a22372e3232223b733a343a22636f7265223b733a333a22372e78223b733a353a2266696c6573223b613a313a7b693a303b733a383a227068702e74657374223b7d733a373a2270726f6a656374223b733a363a2264727570616c223b733a393a22646174657374616d70223b733a31303a2231333635303237303132223b733a31323a22646570656e64656e63696573223b613a303a7b7d733a333a22706870223b733a353a22352e322e34223b733a393a22626f6f747374726170223b693a303b7d);
INSERT INTO `system` VALUES('modules/poll/poll.module', 'poll', 'module', '', 0, 0, -1, 0, 0x613a31323a7b733a343a226e616d65223b733a343a22506f6c6c223b733a31313a226465736372697074696f6e223b733a39353a22416c6c6f777320796f7572207369746520746f206361707475726520766f746573206f6e20646966666572656e7420746f7069637320696e2074686520666f726d206f66206d756c7469706c652063686f696365207175657374696f6e732e223b733a373a227061636b616765223b733a343a22436f7265223b733a373a2276657273696f6e223b733a343a22372e3232223b733a343a22636f7265223b733a333a22372e78223b733a353a2266696c6573223b613a313a7b693a303b733a393a22706f6c6c2e74657374223b7d733a31313a227374796c65736865657473223b613a313a7b733a333a22616c6c223b613a313a7b733a383a22706f6c6c2e637373223b733a32313a226d6f64756c65732f706f6c6c2f706f6c6c2e637373223b7d7d733a373a2270726f6a656374223b733a363a2264727570616c223b733a393a22646174657374616d70223b733a31303a2231333635303237303132223b733a31323a22646570656e64656e63696573223b613a303a7b7d733a333a22706870223b733a353a22352e322e34223b733a393a22626f6f747374726170223b693a303b7d);
INSERT INTO `system` VALUES('modules/profile/profile.module', 'profile', 'module', '', 0, 0, -1, 0, 0x613a31333a7b733a343a226e616d65223b733a373a2250726f66696c65223b733a31313a226465736372697074696f6e223b733a33363a22537570706f72747320636f6e666967757261626c6520757365722070726f66696c65732e223b733a373a227061636b616765223b733a343a22436f7265223b733a373a2276657273696f6e223b733a343a22372e3232223b733a343a22636f7265223b733a333a22372e78223b733a353a2266696c6573223b613a313a7b693a303b733a31323a2270726f66696c652e74657374223b7d733a393a22636f6e666967757265223b733a32373a2261646d696e2f636f6e6669672f70656f706c652f70726f66696c65223b733a363a2268696464656e223b623a313b733a373a2270726f6a656374223b733a363a2264727570616c223b733a393a22646174657374616d70223b733a31303a2231333635303237303132223b733a31323a22646570656e64656e63696573223b613a303a7b7d733a333a22706870223b733a353a22352e322e34223b733a393a22626f6f747374726170223b693a303b7d);
INSERT INTO `system` VALUES('modules/rdf/rdf.module', 'rdf', 'module', '', 1, 0, 0, 0, 0x613a31313a7b733a343a226e616d65223b733a333a22524446223b733a31313a226465736372697074696f6e223b733a3134383a22456e72696368657320796f757220636f6e74656e742077697468206d6574616461746120746f206c6574206f74686572206170706c69636174696f6e732028652e672e2073656172636820656e67696e65732c2061676772656761746f7273292062657474657220756e6465727374616e64206974732072656c6174696f6e736869707320616e6420617474726962757465732e223b733a373a227061636b616765223b733a343a22436f7265223b733a373a2276657273696f6e223b733a343a22372e3232223b733a343a22636f7265223b733a333a22372e78223b733a353a2266696c6573223b613a313a7b693a303b733a383a227264662e74657374223b7d733a373a2270726f6a656374223b733a363a2264727570616c223b733a393a22646174657374616d70223b733a31303a2231333635303237303132223b733a31323a22646570656e64656e63696573223b613a303a7b7d733a333a22706870223b733a353a22352e322e34223b733a393a22626f6f747374726170223b693a303b7d);
INSERT INTO `system` VALUES('modules/rdf/tests/rdf_test.module', 'rdf_test', 'module', '', 0, 0, -1, 0, 0x613a31323a7b733a343a226e616d65223b733a31363a22524446206d6f64756c65207465737473223b733a31313a226465736372697074696f6e223b733a33383a22537570706f7274206d6f64756c6520666f7220524446206d6f64756c652074657374696e672e223b733a373a227061636b616765223b733a373a2254657374696e67223b733a373a2276657273696f6e223b733a343a22372e3232223b733a343a22636f7265223b733a333a22372e78223b733a363a2268696464656e223b623a313b733a373a2270726f6a656374223b733a363a2264727570616c223b733a393a22646174657374616d70223b733a31303a2231333635303237303132223b733a31323a22646570656e64656e63696573223b613a303a7b7d733a333a22706870223b733a353a22352e322e34223b733a353a2266696c6573223b613a303a7b7d733a393a22626f6f747374726170223b693a303b7d);
INSERT INTO `system` VALUES('modules/search/search.module', 'search', 'module', '', 1, 0, 7000, 0, 0x613a31333a7b733a343a226e616d65223b733a363a22536561726368223b733a31313a226465736372697074696f6e223b733a33363a22456e61626c657320736974652d77696465206b6579776f726420736561726368696e672e223b733a373a227061636b616765223b733a343a22436f7265223b733a373a2276657273696f6e223b733a343a22372e3232223b733a343a22636f7265223b733a333a22372e78223b733a353a2266696c6573223b613a323a7b693a303b733a31393a227365617263682e657874656e6465722e696e63223b693a313b733a31313a227365617263682e74657374223b7d733a393a22636f6e666967757265223b733a32383a2261646d696e2f636f6e6669672f7365617263682f73657474696e6773223b733a31313a227374796c65736865657473223b613a313a7b733a333a22616c6c223b613a313a7b733a31303a227365617263682e637373223b733a32353a226d6f64756c65732f7365617263682f7365617263682e637373223b7d7d733a373a2270726f6a656374223b733a363a2264727570616c223b733a393a22646174657374616d70223b733a31303a2231333635303237303132223b733a31323a22646570656e64656e63696573223b613a303a7b7d733a333a22706870223b733a353a22352e322e34223b733a393a22626f6f747374726170223b693a303b7d);
INSERT INTO `system` VALUES('modules/search/tests/search_embedded_form.module', 'search_embedded_form', 'module', '', 0, 0, -1, 0, 0x613a31323a7b733a343a226e616d65223b733a32303a2253656172636820656d62656464656420666f726d223b733a31313a226465736372697074696f6e223b733a35393a22537570706f7274206d6f64756c6520666f7220736561726368206d6f64756c652074657374696e67206f6620656d62656464656420666f726d732e223b733a373a227061636b616765223b733a373a2254657374696e67223b733a373a2276657273696f6e223b733a343a22372e3232223b733a343a22636f7265223b733a333a22372e78223b733a363a2268696464656e223b623a313b733a373a2270726f6a656374223b733a363a2264727570616c223b733a393a22646174657374616d70223b733a31303a2231333635303237303132223b733a31323a22646570656e64656e63696573223b613a303a7b7d733a333a22706870223b733a353a22352e322e34223b733a353a2266696c6573223b613a303a7b7d733a393a22626f6f747374726170223b693a303b7d);
INSERT INTO `system` VALUES('modules/search/tests/search_extra_type.module', 'search_extra_type', 'module', '', 0, 0, -1, 0, 0x613a31323a7b733a343a226e616d65223b733a31363a2254657374207365617263682074797065223b733a31313a226465736372697074696f6e223b733a34313a22537570706f7274206d6f64756c6520666f7220736561726368206d6f64756c652074657374696e672e223b733a373a227061636b616765223b733a373a2254657374696e67223b733a373a2276657273696f6e223b733a343a22372e3232223b733a343a22636f7265223b733a333a22372e78223b733a363a2268696464656e223b623a313b733a373a2270726f6a656374223b733a363a2264727570616c223b733a393a22646174657374616d70223b733a31303a2231333635303237303132223b733a31323a22646570656e64656e63696573223b613a303a7b7d733a333a22706870223b733a353a22352e322e34223b733a353a2266696c6573223b613a303a7b7d733a393a22626f6f747374726170223b693a303b7d);
INSERT INTO `system` VALUES('modules/shortcut/shortcut.module', 'shortcut', 'module', '', 1, 0, 0, 0, 0x613a31323a7b733a343a226e616d65223b733a383a2253686f7274637574223b733a31313a226465736372697074696f6e223b733a36303a22416c6c6f777320757365727320746f206d616e61676520637573746f6d697a61626c65206c69737473206f662073686f7274637574206c696e6b732e223b733a373a227061636b616765223b733a343a22436f7265223b733a373a2276657273696f6e223b733a343a22372e3232223b733a343a22636f7265223b733a333a22372e78223b733a353a2266696c6573223b613a313a7b693a303b733a31333a2273686f72746375742e74657374223b7d733a393a22636f6e666967757265223b733a33363a2261646d696e2f636f6e6669672f757365722d696e746572666163652f73686f7274637574223b733a373a2270726f6a656374223b733a363a2264727570616c223b733a393a22646174657374616d70223b733a31303a2231333635303237303132223b733a31323a22646570656e64656e63696573223b613a303a7b7d733a333a22706870223b733a353a22352e322e34223b733a393a22626f6f747374726170223b693a303b7d);
INSERT INTO `system` VALUES('modules/simpletest/simpletest.module', 'simpletest', 'module', '', 0, 0, -1, 0, 0x613a31323a7b733a343a226e616d65223b733a373a2254657374696e67223b733a31313a226465736372697074696f6e223b733a35333a2250726f76696465732061206672616d65776f726b20666f7220756e697420616e642066756e6374696f6e616c2074657374696e672e223b733a373a227061636b616765223b733a343a22436f7265223b733a373a2276657273696f6e223b733a343a22372e3232223b733a343a22636f7265223b733a333a22372e78223b733a353a2266696c6573223b613a34383a7b693a303b733a31353a2273696d706c65746573742e74657374223b693a313b733a32343a2264727570616c5f7765625f746573745f636173652e706870223b693a323b733a31383a2274657374732f616374696f6e732e74657374223b693a333b733a31353a2274657374732f616a61782e74657374223b693a343b733a31363a2274657374732f62617463682e74657374223b693a353b733a32303a2274657374732f626f6f7473747261702e74657374223b693a363b733a31363a2274657374732f63616368652e74657374223b693a373b733a31373a2274657374732f636f6d6d6f6e2e74657374223b693a383b733a32343a2274657374732f64617461626173655f746573742e74657374223b693a393b733a33323a2274657374732f656e746974795f637275645f686f6f6b5f746573742e74657374223b693a31303b733a32333a2274657374732f656e746974795f71756572792e74657374223b693a31313b733a31363a2274657374732f6572726f722e74657374223b693a31323b733a31353a2274657374732f66696c652e74657374223b693a31333b733a32333a2274657374732f66696c657472616e736665722e74657374223b693a31343b733a31353a2274657374732f666f726d2e74657374223b693a31353b733a31363a2274657374732f67726170682e74657374223b693a31363b733a31363a2274657374732f696d6167652e74657374223b693a31373b733a31353a2274657374732f6c6f636b2e74657374223b693a31383b733a31353a2274657374732f6d61696c2e74657374223b693a31393b733a31353a2274657374732f6d656e752e74657374223b693a32303b733a31373a2274657374732f6d6f64756c652e74657374223b693a32313b733a31363a2274657374732f70616765722e74657374223b693a32323b733a31393a2274657374732f70617373776f72642e74657374223b693a32333b733a31353a2274657374732f706174682e74657374223b693a32343b733a31393a2274657374732f72656769737472792e74657374223b693a32353b733a31373a2274657374732f736368656d612e74657374223b693a32363b733a31383a2274657374732f73657373696f6e2e74657374223b693a32373b733a32303a2274657374732f7461626c65736f72742e74657374223b693a32383b733a31363a2274657374732f7468656d652e74657374223b693a32393b733a31383a2274657374732f756e69636f64652e74657374223b693a33303b733a31373a2274657374732f7570646174652e74657374223b693a33313b733a31373a2274657374732f786d6c7270632e74657374223b693a33323b733a32363a2274657374732f757067726164652f757067726164652e74657374223b693a33333b733a33343a2274657374732f757067726164652f757067726164652e636f6d6d656e742e74657374223b693a33343b733a33333a2274657374732f757067726164652f757067726164652e66696c7465722e74657374223b693a33353b733a33323a2274657374732f757067726164652f757067726164652e666f72756d2e74657374223b693a33363b733a33333a2274657374732f757067726164652f757067726164652e6c6f63616c652e74657374223b693a33373b733a33313a2274657374732f757067726164652f757067726164652e6d656e752e74657374223b693a33383b733a33313a2274657374732f757067726164652f757067726164652e6e6f64652e74657374223b693a33393b733a33353a2274657374732f757067726164652f757067726164652e7461786f6e6f6d792e74657374223b693a34303b733a33343a2274657374732f757067726164652f757067726164652e747269676765722e74657374223b693a34313b733a33393a2274657374732f757067726164652f757067726164652e7472616e736c617461626c652e74657374223b693a34323b733a33333a2274657374732f757067726164652f757067726164652e75706c6f61642e74657374223b693a34333b733a33313a2274657374732f757067726164652f757067726164652e757365722e74657374223b693a34343b733a33363a2274657374732f757067726164652f7570646174652e61676772656761746f722e74657374223b693a34353b733a33333a2274657374732f757067726164652f7570646174652e747269676765722e74657374223b693a34363b733a33313a2274657374732f757067726164652f7570646174652e6669656c642e74657374223b693a34373b733a33303a2274657374732f757067726164652f7570646174652e757365722e74657374223b7d733a393a22636f6e666967757265223b733a34313a2261646d696e2f636f6e6669672f646576656c6f706d656e742f74657374696e672f73657474696e6773223b733a373a2270726f6a656374223b733a363a2264727570616c223b733a393a22646174657374616d70223b733a31303a2231333635303237303132223b733a31323a22646570656e64656e63696573223b613a303a7b7d733a333a22706870223b733a353a22352e322e34223b733a393a22626f6f747374726170223b693a303b7d);
INSERT INTO `system` VALUES('modules/simpletest/tests/actions_loop_test.module', 'actions_loop_test', 'module', '', 0, 0, -1, 0, 0x613a31323a7b733a343a226e616d65223b733a31373a22416374696f6e73206c6f6f702074657374223b733a31313a226465736372697074696f6e223b733a33393a22537570706f7274206d6f64756c6520666f7220616374696f6e206c6f6f702074657374696e672e223b733a373a227061636b616765223b733a373a2254657374696e67223b733a373a2276657273696f6e223b733a343a22372e3232223b733a343a22636f7265223b733a333a22372e78223b733a363a2268696464656e223b623a313b733a373a2270726f6a656374223b733a363a2264727570616c223b733a393a22646174657374616d70223b733a31303a2231333635303237303132223b733a31323a22646570656e64656e63696573223b613a303a7b7d733a333a22706870223b733a353a22352e322e34223b733a353a2266696c6573223b613a303a7b7d733a393a22626f6f747374726170223b693a303b7d);
INSERT INTO `system` VALUES('modules/simpletest/tests/ajax_forms_test.module', 'ajax_forms_test', 'module', '', 0, 0, -1, 0, 0x613a31323a7b733a343a226e616d65223b733a32363a22414a415820666f726d2074657374206d6f636b206d6f64756c65223b733a31313a226465736372697074696f6e223b733a32353a225465737420666f7220414a415820666f726d2063616c6c732e223b733a343a22636f7265223b733a333a22372e78223b733a373a227061636b616765223b733a373a2254657374696e67223b733a373a2276657273696f6e223b733a343a22372e3232223b733a363a2268696464656e223b623a313b733a373a2270726f6a656374223b733a363a2264727570616c223b733a393a22646174657374616d70223b733a31303a2231333635303237303132223b733a31323a22646570656e64656e63696573223b613a303a7b7d733a333a22706870223b733a353a22352e322e34223b733a353a2266696c6573223b613a303a7b7d733a393a22626f6f747374726170223b693a303b7d);
INSERT INTO `system` VALUES('modules/simpletest/tests/ajax_test.module', 'ajax_test', 'module', '', 0, 0, -1, 0, 0x613a31323a7b733a343a226e616d65223b733a393a22414a41582054657374223b733a31313a226465736372697074696f6e223b733a34303a22537570706f7274206d6f64756c6520666f7220414a4158206672616d65776f726b2074657374732e223b733a373a227061636b616765223b733a373a2254657374696e67223b733a373a2276657273696f6e223b733a343a22372e3232223b733a343a22636f7265223b733a333a22372e78223b733a363a2268696464656e223b623a313b733a373a2270726f6a656374223b733a363a2264727570616c223b733a393a22646174657374616d70223b733a31303a2231333635303237303132223b733a31323a22646570656e64656e63696573223b613a303a7b7d733a333a22706870223b733a353a22352e322e34223b733a353a2266696c6573223b613a303a7b7d733a393a22626f6f747374726170223b693a303b7d);
INSERT INTO `system` VALUES('modules/simpletest/tests/batch_test.module', 'batch_test', 'module', '', 0, 0, -1, 0, 0x613a31323a7b733a343a226e616d65223b733a31343a224261746368204150492074657374223b733a31313a226465736372697074696f6e223b733a33353a22537570706f7274206d6f64756c6520666f72204261746368204150492074657374732e223b733a373a227061636b616765223b733a373a2254657374696e67223b733a373a2276657273696f6e223b733a343a22372e3232223b733a343a22636f7265223b733a333a22372e78223b733a363a2268696464656e223b623a313b733a373a2270726f6a656374223b733a363a2264727570616c223b733a393a22646174657374616d70223b733a31303a2231333635303237303132223b733a31323a22646570656e64656e63696573223b613a303a7b7d733a333a22706870223b733a353a22352e322e34223b733a353a2266696c6573223b613a303a7b7d733a393a22626f6f747374726170223b693a303b7d);
INSERT INTO `system` VALUES('modules/simpletest/tests/common_test.module', 'common_test', 'module', '', 0, 0, -1, 0, 0x613a31333a7b733a343a226e616d65223b733a31313a22436f6d6d6f6e2054657374223b733a31313a226465736372697074696f6e223b733a33323a22537570706f7274206d6f64756c6520666f7220436f6d6d6f6e2074657374732e223b733a373a227061636b616765223b733a373a2254657374696e67223b733a373a2276657273696f6e223b733a343a22372e3232223b733a343a22636f7265223b733a333a22372e78223b733a31313a227374796c65736865657473223b613a323a7b733a333a22616c6c223b613a313a7b733a31353a22636f6d6d6f6e5f746573742e637373223b733a34303a226d6f64756c65732f73696d706c65746573742f74657374732f636f6d6d6f6e5f746573742e637373223b7d733a353a227072696e74223b613a313a7b733a32313a22636f6d6d6f6e5f746573742e7072696e742e637373223b733a34363a226d6f64756c65732f73696d706c65746573742f74657374732f636f6d6d6f6e5f746573742e7072696e742e637373223b7d7d733a363a2268696464656e223b623a313b733a373a2270726f6a656374223b733a363a2264727570616c223b733a393a22646174657374616d70223b733a31303a2231333635303237303132223b733a31323a22646570656e64656e63696573223b613a303a7b7d733a333a22706870223b733a353a22352e322e34223b733a353a2266696c6573223b613a303a7b7d733a393a22626f6f747374726170223b693a303b7d);
INSERT INTO `system` VALUES('modules/simpletest/tests/common_test_cron_helper.module', 'common_test_cron_helper', 'module', '', 0, 0, -1, 0, 0x613a31323a7b733a343a226e616d65223b733a32333a22436f6d6d6f6e20546573742043726f6e2048656c706572223b733a31313a226465736372697074696f6e223b733a35363a2248656c706572206d6f64756c6520666f722043726f6e52756e54657374436173653a3a7465737443726f6e457863657074696f6e7328292e223b733a373a227061636b616765223b733a373a2254657374696e67223b733a373a2276657273696f6e223b733a343a22372e3232223b733a343a22636f7265223b733a333a22372e78223b733a363a2268696464656e223b623a313b733a373a2270726f6a656374223b733a363a2264727570616c223b733a393a22646174657374616d70223b733a31303a2231333635303237303132223b733a31323a22646570656e64656e63696573223b613a303a7b7d733a333a22706870223b733a353a22352e322e34223b733a353a2266696c6573223b613a303a7b7d733a393a22626f6f747374726170223b693a303b7d);
INSERT INTO `system` VALUES('modules/simpletest/tests/database_test.module', 'database_test', 'module', '', 0, 0, -1, 0, 0x613a31323a7b733a343a226e616d65223b733a31333a2244617461626173652054657374223b733a31313a226465736372697074696f6e223b733a34303a22537570706f7274206d6f64756c6520666f72204461746162617365206c617965722074657374732e223b733a343a22636f7265223b733a333a22372e78223b733a373a227061636b616765223b733a373a2254657374696e67223b733a373a2276657273696f6e223b733a343a22372e3232223b733a363a2268696464656e223b623a313b733a373a2270726f6a656374223b733a363a2264727570616c223b733a393a22646174657374616d70223b733a31303a2231333635303237303132223b733a31323a22646570656e64656e63696573223b613a303a7b7d733a333a22706870223b733a353a22352e322e34223b733a353a2266696c6573223b613a303a7b7d733a393a22626f6f747374726170223b693a303b7d);
INSERT INTO `system` VALUES('modules/simpletest/tests/drupal_system_listing_compatible_test/drupal_system_listing_compatible_test.module', 'drupal_system_listing_compatible_test', 'module', '', 0, 0, -1, 0, 0x613a31323a7b733a343a226e616d65223b733a33373a2244727570616c2073797374656d206c697374696e6720636f6d70617469626c652074657374223b733a31313a226465736372697074696f6e223b733a36323a22537570706f7274206d6f64756c6520666f722074657374696e67207468652064727570616c5f73797374656d5f6c697374696e672066756e6374696f6e2e223b733a373a227061636b616765223b733a373a2254657374696e67223b733a373a2276657273696f6e223b733a343a22372e3232223b733a343a22636f7265223b733a333a22372e78223b733a363a2268696464656e223b623a313b733a373a2270726f6a656374223b733a363a2264727570616c223b733a393a22646174657374616d70223b733a31303a2231333635303237303132223b733a31323a22646570656e64656e63696573223b613a303a7b7d733a333a22706870223b733a353a22352e322e34223b733a353a2266696c6573223b613a303a7b7d733a393a22626f6f747374726170223b693a303b7d);
INSERT INTO `system` VALUES('modules/simpletest/tests/drupal_system_listing_incompatible_test/drupal_system_listing_incompatible_test.module', 'drupal_system_listing_incompatible_test', 'module', '', 0, 0, -1, 0, 0x613a31323a7b733a343a226e616d65223b733a33393a2244727570616c2073797374656d206c697374696e6720696e636f6d70617469626c652074657374223b733a31313a226465736372697074696f6e223b733a36323a22537570706f7274206d6f64756c6520666f722074657374696e67207468652064727570616c5f73797374656d5f6c697374696e672066756e6374696f6e2e223b733a373a227061636b616765223b733a373a2254657374696e67223b733a373a2276657273696f6e223b733a343a22372e3232223b733a343a22636f7265223b733a333a22372e78223b733a363a2268696464656e223b623a313b733a373a2270726f6a656374223b733a363a2264727570616c223b733a393a22646174657374616d70223b733a31303a2231333635303237303132223b733a31323a22646570656e64656e63696573223b613a303a7b7d733a333a22706870223b733a353a22352e322e34223b733a353a2266696c6573223b613a303a7b7d733a393a22626f6f747374726170223b693a303b7d);
INSERT INTO `system` VALUES('modules/simpletest/tests/entity_cache_test.module', 'entity_cache_test', 'module', '', 0, 0, -1, 0, 0x613a31323a7b733a343a226e616d65223b733a31373a22456e746974792063616368652074657374223b733a31313a226465736372697074696f6e223b733a34303a22537570706f7274206d6f64756c6520666f722074657374696e6720656e746974792063616368652e223b733a373a227061636b616765223b733a373a2254657374696e67223b733a373a2276657273696f6e223b733a343a22372e3232223b733a343a22636f7265223b733a333a22372e78223b733a31323a22646570656e64656e63696573223b613a313a7b693a303b733a32383a22656e746974795f63616368655f746573745f646570656e64656e6379223b7d733a363a2268696464656e223b623a313b733a373a2270726f6a656374223b733a363a2264727570616c223b733a393a22646174657374616d70223b733a31303a2231333635303237303132223b733a333a22706870223b733a353a22352e322e34223b733a353a2266696c6573223b613a303a7b7d733a393a22626f6f747374726170223b693a303b7d);
INSERT INTO `system` VALUES('modules/simpletest/tests/entity_cache_test_dependency.module', 'entity_cache_test_dependency', 'module', '', 0, 0, -1, 0, 0x613a31323a7b733a343a226e616d65223b733a32383a22456e74697479206361636865207465737420646570656e64656e6379223b733a31313a226465736372697074696f6e223b733a35313a22537570706f727420646570656e64656e6379206d6f64756c6520666f722074657374696e6720656e746974792063616368652e223b733a373a227061636b616765223b733a373a2254657374696e67223b733a373a2276657273696f6e223b733a343a22372e3232223b733a343a22636f7265223b733a333a22372e78223b733a363a2268696464656e223b623a313b733a373a2270726f6a656374223b733a363a2264727570616c223b733a393a22646174657374616d70223b733a31303a2231333635303237303132223b733a31323a22646570656e64656e63696573223b613a303a7b7d733a333a22706870223b733a353a22352e322e34223b733a353a2266696c6573223b613a303a7b7d733a393a22626f6f747374726170223b693a303b7d);
INSERT INTO `system` VALUES('modules/simpletest/tests/entity_crud_hook_test.module', 'entity_crud_hook_test', 'module', '', 0, 0, -1, 0, 0x613a31323a7b733a343a226e616d65223b733a32323a22456e74697479204352554420486f6f6b732054657374223b733a31313a226465736372697074696f6e223b733a33353a22537570706f7274206d6f64756c6520666f72204352554420686f6f6b2074657374732e223b733a343a22636f7265223b733a333a22372e78223b733a373a227061636b616765223b733a373a2254657374696e67223b733a373a2276657273696f6e223b733a343a22372e3232223b733a363a2268696464656e223b623a313b733a373a2270726f6a656374223b733a363a2264727570616c223b733a393a22646174657374616d70223b733a31303a2231333635303237303132223b733a31323a22646570656e64656e63696573223b613a303a7b7d733a333a22706870223b733a353a22352e322e34223b733a353a2266696c6573223b613a303a7b7d733a393a22626f6f747374726170223b693a303b7d);
INSERT INTO `system` VALUES('modules/simpletest/tests/entity_query_access_test.module', 'entity_query_access_test', 'module', '', 0, 0, -1, 0, 0x613a31323a7b733a343a226e616d65223b733a32343a22456e74697479207175657279206163636573732074657374223b733a31313a226465736372697074696f6e223b733a34393a22537570706f7274206d6f64756c6520666f7220636865636b696e6720656e7469747920717565727920726573756c74732e223b733a373a227061636b616765223b733a373a2254657374696e67223b733a373a2276657273696f6e223b733a343a22372e3232223b733a343a22636f7265223b733a333a22372e78223b733a363a2268696464656e223b623a313b733a373a2270726f6a656374223b733a363a2264727570616c223b733a393a22646174657374616d70223b733a31303a2231333635303237303132223b733a31323a22646570656e64656e63696573223b613a303a7b7d733a333a22706870223b733a353a22352e322e34223b733a353a2266696c6573223b613a303a7b7d733a393a22626f6f747374726170223b693a303b7d);
INSERT INTO `system` VALUES('modules/simpletest/tests/error_test.module', 'error_test', 'module', '', 0, 0, -1, 0, 0x613a31323a7b733a343a226e616d65223b733a31303a224572726f722074657374223b733a31313a226465736372697074696f6e223b733a34373a22537570706f7274206d6f64756c6520666f72206572726f7220616e6420657863657074696f6e2074657374696e672e223b733a373a227061636b616765223b733a373a2254657374696e67223b733a373a2276657273696f6e223b733a343a22372e3232223b733a343a22636f7265223b733a333a22372e78223b733a363a2268696464656e223b623a313b733a373a2270726f6a656374223b733a363a2264727570616c223b733a393a22646174657374616d70223b733a31303a2231333635303237303132223b733a31323a22646570656e64656e63696573223b613a303a7b7d733a333a22706870223b733a353a22352e322e34223b733a353a2266696c6573223b613a303a7b7d733a393a22626f6f747374726170223b693a303b7d);
INSERT INTO `system` VALUES('modules/simpletest/tests/file_test.module', 'file_test', 'module', '', 0, 0, -1, 0, 0x613a31323a7b733a343a226e616d65223b733a393a2246696c652074657374223b733a31313a226465736372697074696f6e223b733a33393a22537570706f7274206d6f64756c6520666f722066696c652068616e646c696e672074657374732e223b733a373a227061636b616765223b733a373a2254657374696e67223b733a373a2276657273696f6e223b733a343a22372e3232223b733a343a22636f7265223b733a333a22372e78223b733a353a2266696c6573223b613a313a7b693a303b733a31363a2266696c655f746573742e6d6f64756c65223b7d733a363a2268696464656e223b623a313b733a373a2270726f6a656374223b733a363a2264727570616c223b733a393a22646174657374616d70223b733a31303a2231333635303237303132223b733a31323a22646570656e64656e63696573223b613a303a7b7d733a333a22706870223b733a353a22352e322e34223b733a393a22626f6f747374726170223b693a303b7d);
INSERT INTO `system` VALUES('modules/simpletest/tests/filter_test.module', 'filter_test', 'module', '', 0, 0, -1, 0, 0x613a31323a7b733a343a226e616d65223b733a31383a2246696c7465722074657374206d6f64756c65223b733a31313a226465736372697074696f6e223b733a33333a2254657374732066696c74657220686f6f6b7320616e642066756e6374696f6e732e223b733a373a227061636b616765223b733a373a2254657374696e67223b733a373a2276657273696f6e223b733a343a22372e3232223b733a343a22636f7265223b733a333a22372e78223b733a363a2268696464656e223b623a313b733a373a2270726f6a656374223b733a363a2264727570616c223b733a393a22646174657374616d70223b733a31303a2231333635303237303132223b733a31323a22646570656e64656e63696573223b613a303a7b7d733a333a22706870223b733a353a22352e322e34223b733a353a2266696c6573223b613a303a7b7d733a393a22626f6f747374726170223b693a303b7d);
INSERT INTO `system` VALUES('modules/simpletest/tests/form_test.module', 'form_test', 'module', '', 0, 0, -1, 0, 0x613a31323a7b733a343a226e616d65223b733a31323a22466f726d4150492054657374223b733a31313a226465736372697074696f6e223b733a33343a22537570706f7274206d6f64756c6520666f7220466f726d204150492074657374732e223b733a373a227061636b616765223b733a373a2254657374696e67223b733a373a2276657273696f6e223b733a343a22372e3232223b733a343a22636f7265223b733a333a22372e78223b733a363a2268696464656e223b623a313b733a373a2270726f6a656374223b733a363a2264727570616c223b733a393a22646174657374616d70223b733a31303a2231333635303237303132223b733a31323a22646570656e64656e63696573223b613a303a7b7d733a333a22706870223b733a353a22352e322e34223b733a353a2266696c6573223b613a303a7b7d733a393a22626f6f747374726170223b693a303b7d);
INSERT INTO `system` VALUES('modules/simpletest/tests/image_test.module', 'image_test', 'module', '', 0, 0, -1, 0, 0x613a31323a7b733a343a226e616d65223b733a31303a22496d6167652074657374223b733a31313a226465736372697074696f6e223b733a33393a22537570706f7274206d6f64756c6520666f7220696d61676520746f6f6c6b69742074657374732e223b733a373a227061636b616765223b733a373a2254657374696e67223b733a373a2276657273696f6e223b733a343a22372e3232223b733a343a22636f7265223b733a333a22372e78223b733a363a2268696464656e223b623a313b733a373a2270726f6a656374223b733a363a2264727570616c223b733a393a22646174657374616d70223b733a31303a2231333635303237303132223b733a31323a22646570656e64656e63696573223b613a303a7b7d733a333a22706870223b733a353a22352e322e34223b733a353a2266696c6573223b613a303a7b7d733a393a22626f6f747374726170223b693a303b7d);
INSERT INTO `system` VALUES('modules/simpletest/tests/menu_test.module', 'menu_test', 'module', '', 0, 0, -1, 0, 0x613a31323a7b733a343a226e616d65223b733a31353a22486f6f6b206d656e75207465737473223b733a31313a226465736372697074696f6e223b733a33373a22537570706f7274206d6f64756c6520666f72206d656e7520686f6f6b2074657374696e672e223b733a373a227061636b616765223b733a373a2254657374696e67223b733a373a2276657273696f6e223b733a343a22372e3232223b733a343a22636f7265223b733a333a22372e78223b733a363a2268696464656e223b623a313b733a373a2270726f6a656374223b733a363a2264727570616c223b733a393a22646174657374616d70223b733a31303a2231333635303237303132223b733a31323a22646570656e64656e63696573223b613a303a7b7d733a333a22706870223b733a353a22352e322e34223b733a353a2266696c6573223b613a303a7b7d733a393a22626f6f747374726170223b693a303b7d);
INSERT INTO `system` VALUES('modules/simpletest/tests/module_test.module', 'module_test', 'module', '', 0, 0, -1, 0, 0x613a31323a7b733a343a226e616d65223b733a31313a224d6f64756c652074657374223b733a31313a226465736372697074696f6e223b733a34313a22537570706f7274206d6f64756c6520666f72206d6f64756c652073797374656d2074657374696e672e223b733a373a227061636b616765223b733a373a2254657374696e67223b733a373a2276657273696f6e223b733a343a22372e3232223b733a343a22636f7265223b733a333a22372e78223b733a363a2268696464656e223b623a313b733a373a2270726f6a656374223b733a363a2264727570616c223b733a393a22646174657374616d70223b733a31303a2231333635303237303132223b733a31323a22646570656e64656e63696573223b613a303a7b7d733a333a22706870223b733a353a22352e322e34223b733a353a2266696c6573223b613a303a7b7d733a393a22626f6f747374726170223b693a303b7d);
INSERT INTO `system` VALUES('modules/simpletest/tests/path_test.module', 'path_test', 'module', '', 0, 0, -1, 0, 0x613a31323a7b733a343a226e616d65223b733a31353a22486f6f6b2070617468207465737473223b733a31313a226465736372697074696f6e223b733a33373a22537570706f7274206d6f64756c6520666f72207061746820686f6f6b2074657374696e672e223b733a373a227061636b616765223b733a373a2254657374696e67223b733a373a2276657273696f6e223b733a343a22372e3232223b733a343a22636f7265223b733a333a22372e78223b733a363a2268696464656e223b623a313b733a373a2270726f6a656374223b733a363a2264727570616c223b733a393a22646174657374616d70223b733a31303a2231333635303237303132223b733a31323a22646570656e64656e63696573223b613a303a7b7d733a333a22706870223b733a353a22352e322e34223b733a353a2266696c6573223b613a303a7b7d733a393a22626f6f747374726170223b693a303b7d);
INSERT INTO `system` VALUES('modules/simpletest/tests/psr_0_test/psr_0_test.module', 'psr_0_test', 'module', '', 0, 0, -1, 0, 0x613a31323a7b733a343a226e616d65223b733a31363a225053522d302054657374206361736573223b733a31313a226465736372697074696f6e223b733a34343a225465737420636c617373657320746f20626520646973636f76657265642062792073696d706c65746573742e223b733a343a22636f7265223b733a333a22372e78223b733a363a2268696464656e223b623a313b733a373a227061636b616765223b733a373a2254657374696e67223b733a373a2276657273696f6e223b733a343a22372e3232223b733a373a2270726f6a656374223b733a363a2264727570616c223b733a393a22646174657374616d70223b733a31303a2231333635303237303132223b733a31323a22646570656e64656e63696573223b613a303a7b7d733a333a22706870223b733a353a22352e322e34223b733a353a2266696c6573223b613a303a7b7d733a393a22626f6f747374726170223b693a303b7d);
INSERT INTO `system` VALUES('modules/simpletest/tests/requirements1_test.module', 'requirements1_test', 'module', '', 0, 0, -1, 0, 0x613a31323a7b733a343a226e616d65223b733a31393a22526571756972656d656e747320312054657374223b733a31313a226465736372697074696f6e223b733a38303a22546573747320746861742061206d6f64756c65206973206e6f7420696e7374616c6c6564207768656e206974206661696c7320686f6f6b5f726571756972656d656e74732827696e7374616c6c27292e223b733a373a227061636b616765223b733a373a2254657374696e67223b733a373a2276657273696f6e223b733a343a22372e3232223b733a343a22636f7265223b733a333a22372e78223b733a363a2268696464656e223b623a313b733a373a2270726f6a656374223b733a363a2264727570616c223b733a393a22646174657374616d70223b733a31303a2231333635303237303132223b733a31323a22646570656e64656e63696573223b613a303a7b7d733a333a22706870223b733a353a22352e322e34223b733a353a2266696c6573223b613a303a7b7d733a393a22626f6f747374726170223b693a303b7d);
INSERT INTO `system` VALUES('modules/simpletest/tests/requirements2_test.module', 'requirements2_test', 'module', '', 0, 0, -1, 0, 0x613a31323a7b733a343a226e616d65223b733a31393a22526571756972656d656e747320322054657374223b733a31313a226465736372697074696f6e223b733a39383a22546573747320746861742061206d6f64756c65206973206e6f7420696e7374616c6c6564207768656e20746865206f6e6520697420646570656e6473206f6e206661696c7320686f6f6b5f726571756972656d656e74732827696e7374616c6c292e223b733a31323a22646570656e64656e63696573223b613a323a7b693a303b733a31383a22726571756972656d656e7473315f74657374223b693a313b733a373a22636f6d6d656e74223b7d733a373a227061636b616765223b733a373a2254657374696e67223b733a373a2276657273696f6e223b733a343a22372e3232223b733a343a22636f7265223b733a333a22372e78223b733a363a2268696464656e223b623a313b733a373a2270726f6a656374223b733a363a2264727570616c223b733a393a22646174657374616d70223b733a31303a2231333635303237303132223b733a333a22706870223b733a353a22352e322e34223b733a353a2266696c6573223b613a303a7b7d733a393a22626f6f747374726170223b693a303b7d);
INSERT INTO `system` VALUES('modules/simpletest/tests/session_test.module', 'session_test', 'module', '', 0, 0, -1, 0, 0x613a31323a7b733a343a226e616d65223b733a31323a2253657373696f6e2074657374223b733a31313a226465736372697074696f6e223b733a34303a22537570706f7274206d6f64756c6520666f722073657373696f6e20646174612074657374696e672e223b733a373a227061636b616765223b733a373a2254657374696e67223b733a373a2276657273696f6e223b733a343a22372e3232223b733a343a22636f7265223b733a333a22372e78223b733a363a2268696464656e223b623a313b733a373a2270726f6a656374223b733a363a2264727570616c223b733a393a22646174657374616d70223b733a31303a2231333635303237303132223b733a31323a22646570656e64656e63696573223b613a303a7b7d733a333a22706870223b733a353a22352e322e34223b733a353a2266696c6573223b613a303a7b7d733a393a22626f6f747374726170223b693a303b7d);
INSERT INTO `system` VALUES('modules/simpletest/tests/system_dependencies_test.module', 'system_dependencies_test', 'module', '', 0, 0, -1, 0, 0x613a31323a7b733a343a226e616d65223b733a32323a2253797374656d20646570656e64656e63792074657374223b733a31313a226465736372697074696f6e223b733a34373a22537570706f7274206d6f64756c6520666f722074657374696e672073797374656d20646570656e64656e636965732e223b733a373a227061636b616765223b733a373a2254657374696e67223b733a373a2276657273696f6e223b733a343a22372e3232223b733a343a22636f7265223b733a333a22372e78223b733a363a2268696464656e223b623a313b733a31323a22646570656e64656e63696573223b613a313a7b693a303b733a31393a225f6d697373696e675f646570656e64656e6379223b7d733a373a2270726f6a656374223b733a363a2264727570616c223b733a393a22646174657374616d70223b733a31303a2231333635303237303132223b733a333a22706870223b733a353a22352e322e34223b733a353a2266696c6573223b613a303a7b7d733a393a22626f6f747374726170223b693a303b7d);
INSERT INTO `system` VALUES('modules/simpletest/tests/system_incompatible_core_version_dependencies_test.module', 'system_incompatible_core_version_dependencies_test', 'module', '', 0, 0, -1, 0, 0x613a31323a7b733a343a226e616d65223b733a35303a2253797374656d20696e636f6d70617469626c6520636f72652076657273696f6e20646570656e64656e636965732074657374223b733a31313a226465736372697074696f6e223b733a34373a22537570706f7274206d6f64756c6520666f722074657374696e672073797374656d20646570656e64656e636965732e223b733a373a227061636b616765223b733a373a2254657374696e67223b733a373a2276657273696f6e223b733a343a22372e3232223b733a343a22636f7265223b733a333a22372e78223b733a363a2268696464656e223b623a313b733a31323a22646570656e64656e63696573223b613a313a7b693a303b733a33373a2273797374656d5f696e636f6d70617469626c655f636f72655f76657273696f6e5f74657374223b7d733a373a2270726f6a656374223b733a363a2264727570616c223b733a393a22646174657374616d70223b733a31303a2231333635303237303132223b733a333a22706870223b733a353a22352e322e34223b733a353a2266696c6573223b613a303a7b7d733a393a22626f6f747374726170223b693a303b7d);
INSERT INTO `system` VALUES('modules/simpletest/tests/system_incompatible_core_version_test.module', 'system_incompatible_core_version_test', 'module', '', 0, 0, -1, 0, 0x613a31323a7b733a343a226e616d65223b733a33373a2253797374656d20696e636f6d70617469626c6520636f72652076657273696f6e2074657374223b733a31313a226465736372697074696f6e223b733a34373a22537570706f7274206d6f64756c6520666f722074657374696e672073797374656d20646570656e64656e636965732e223b733a373a227061636b616765223b733a373a2254657374696e67223b733a373a2276657273696f6e223b733a343a22372e3232223b733a343a22636f7265223b733a333a22352e78223b733a363a2268696464656e223b623a313b733a373a2270726f6a656374223b733a363a2264727570616c223b733a393a22646174657374616d70223b733a31303a2231333635303237303132223b733a31323a22646570656e64656e63696573223b613a303a7b7d733a333a22706870223b733a353a22352e322e34223b733a353a2266696c6573223b613a303a7b7d733a393a22626f6f747374726170223b693a303b7d);
INSERT INTO `system` VALUES('modules/simpletest/tests/system_incompatible_module_version_dependencies_test.module', 'system_incompatible_module_version_dependencies_test', 'module', '', 0, 0, -1, 0, 0x613a31323a7b733a343a226e616d65223b733a35323a2253797374656d20696e636f6d70617469626c65206d6f64756c652076657273696f6e20646570656e64656e636965732074657374223b733a31313a226465736372697074696f6e223b733a34373a22537570706f7274206d6f64756c6520666f722074657374696e672073797374656d20646570656e64656e636965732e223b733a373a227061636b616765223b733a373a2254657374696e67223b733a373a2276657273696f6e223b733a343a22372e3232223b733a343a22636f7265223b733a333a22372e78223b733a363a2268696464656e223b623a313b733a31323a22646570656e64656e63696573223b613a313a7b693a303b733a34363a2273797374656d5f696e636f6d70617469626c655f6d6f64756c655f76657273696f6e5f7465737420283e322e3029223b7d733a373a2270726f6a656374223b733a363a2264727570616c223b733a393a22646174657374616d70223b733a31303a2231333635303237303132223b733a333a22706870223b733a353a22352e322e34223b733a353a2266696c6573223b613a303a7b7d733a393a22626f6f747374726170223b693a303b7d);
INSERT INTO `system` VALUES('modules/simpletest/tests/system_incompatible_module_version_test.module', 'system_incompatible_module_version_test', 'module', '', 0, 0, -1, 0, 0x613a31323a7b733a343a226e616d65223b733a33393a2253797374656d20696e636f6d70617469626c65206d6f64756c652076657273696f6e2074657374223b733a31313a226465736372697074696f6e223b733a34373a22537570706f7274206d6f64756c6520666f722074657374696e672073797374656d20646570656e64656e636965732e223b733a373a227061636b616765223b733a373a2254657374696e67223b733a373a2276657273696f6e223b733a343a22372e3232223b733a343a22636f7265223b733a333a22372e78223b733a363a2268696464656e223b623a313b733a373a2270726f6a656374223b733a363a2264727570616c223b733a393a22646174657374616d70223b733a31303a2231333635303237303132223b733a31323a22646570656e64656e63696573223b613a303a7b7d733a333a22706870223b733a353a22352e322e34223b733a353a2266696c6573223b613a303a7b7d733a393a22626f6f747374726170223b693a303b7d);
INSERT INTO `system` VALUES('modules/simpletest/tests/system_test.module', 'system_test', 'module', '', 0, 0, -1, 0, 0x613a31323a7b733a343a226e616d65223b733a31313a2253797374656d2074657374223b733a31313a226465736372697074696f6e223b733a33343a22537570706f7274206d6f64756c6520666f722073797374656d2074657374696e672e223b733a373a227061636b616765223b733a373a2254657374696e67223b733a373a2276657273696f6e223b733a343a22372e3232223b733a343a22636f7265223b733a333a22372e78223b733a353a2266696c6573223b613a313a7b693a303b733a31383a2273797374656d5f746573742e6d6f64756c65223b7d733a363a2268696464656e223b623a313b733a373a2270726f6a656374223b733a363a2264727570616c223b733a393a22646174657374616d70223b733a31303a2231333635303237303132223b733a31323a22646570656e64656e63696573223b613a303a7b7d733a333a22706870223b733a353a22352e322e34223b733a393a22626f6f747374726170223b693a303b7d);
INSERT INTO `system` VALUES('modules/simpletest/tests/taxonomy_test.module', 'taxonomy_test', 'module', '', 0, 0, -1, 0, 0x613a31323a7b733a343a226e616d65223b733a32303a225461786f6e6f6d792074657374206d6f64756c65223b733a31313a226465736372697074696f6e223b733a34353a222254657374732066756e6374696f6e7320616e6420686f6f6b73206e6f74207573656420696e20636f7265222e223b733a373a227061636b616765223b733a373a2254657374696e67223b733a373a2276657273696f6e223b733a343a22372e3232223b733a343a22636f7265223b733a333a22372e78223b733a363a2268696464656e223b623a313b733a31323a22646570656e64656e63696573223b613a313a7b693a303b733a383a227461786f6e6f6d79223b7d733a373a2270726f6a656374223b733a363a2264727570616c223b733a393a22646174657374616d70223b733a31303a2231333635303237303132223b733a333a22706870223b733a353a22352e322e34223b733a353a2266696c6573223b613a303a7b7d733a393a22626f6f747374726170223b693a303b7d);
INSERT INTO `system` VALUES('modules/simpletest/tests/theme_test.module', 'theme_test', 'module', '', 0, 0, -1, 0, 0x613a31323a7b733a343a226e616d65223b733a31303a225468656d652074657374223b733a31313a226465736372697074696f6e223b733a34303a22537570706f7274206d6f64756c6520666f72207468656d652073797374656d2074657374696e672e223b733a373a227061636b616765223b733a373a2254657374696e67223b733a373a2276657273696f6e223b733a343a22372e3232223b733a343a22636f7265223b733a333a22372e78223b733a363a2268696464656e223b623a313b733a373a2270726f6a656374223b733a363a2264727570616c223b733a393a22646174657374616d70223b733a31303a2231333635303237303132223b733a31323a22646570656e64656e63696573223b613a303a7b7d733a333a22706870223b733a353a22352e322e34223b733a353a2266696c6573223b613a303a7b7d733a393a22626f6f747374726170223b693a303b7d);
INSERT INTO `system` VALUES('modules/simpletest/tests/update_script_test.module', 'update_script_test', 'module', '', 0, 0, -1, 0, 0x613a31323a7b733a343a226e616d65223b733a31383a22557064617465207363726970742074657374223b733a31313a226465736372697074696f6e223b733a34313a22537570706f7274206d6f64756c6520666f7220757064617465207363726970742074657374696e672e223b733a373a227061636b616765223b733a373a2254657374696e67223b733a373a2276657273696f6e223b733a343a22372e3232223b733a343a22636f7265223b733a333a22372e78223b733a363a2268696464656e223b623a313b733a373a2270726f6a656374223b733a363a2264727570616c223b733a393a22646174657374616d70223b733a31303a2231333635303237303132223b733a31323a22646570656e64656e63696573223b613a303a7b7d733a333a22706870223b733a353a22352e322e34223b733a353a2266696c6573223b613a303a7b7d733a393a22626f6f747374726170223b693a303b7d);
INSERT INTO `system` VALUES('modules/simpletest/tests/update_test_1.module', 'update_test_1', 'module', '', 0, 0, -1, 0, 0x613a31323a7b733a343a226e616d65223b733a31313a225570646174652074657374223b733a31313a226465736372697074696f6e223b733a33343a22537570706f7274206d6f64756c6520666f72207570646174652074657374696e672e223b733a373a227061636b616765223b733a373a2254657374696e67223b733a373a2276657273696f6e223b733a343a22372e3232223b733a343a22636f7265223b733a333a22372e78223b733a363a2268696464656e223b623a313b733a373a2270726f6a656374223b733a363a2264727570616c223b733a393a22646174657374616d70223b733a31303a2231333635303237303132223b733a31323a22646570656e64656e63696573223b613a303a7b7d733a333a22706870223b733a353a22352e322e34223b733a353a2266696c6573223b613a303a7b7d733a393a22626f6f747374726170223b693a303b7d);
INSERT INTO `system` VALUES('modules/simpletest/tests/update_test_2.module', 'update_test_2', 'module', '', 0, 0, -1, 0, 0x613a31323a7b733a343a226e616d65223b733a31313a225570646174652074657374223b733a31313a226465736372697074696f6e223b733a33343a22537570706f7274206d6f64756c6520666f72207570646174652074657374696e672e223b733a373a227061636b616765223b733a373a2254657374696e67223b733a373a2276657273696f6e223b733a343a22372e3232223b733a343a22636f7265223b733a333a22372e78223b733a363a2268696464656e223b623a313b733a373a2270726f6a656374223b733a363a2264727570616c223b733a393a22646174657374616d70223b733a31303a2231333635303237303132223b733a31323a22646570656e64656e63696573223b613a303a7b7d733a333a22706870223b733a353a22352e322e34223b733a353a2266696c6573223b613a303a7b7d733a393a22626f6f747374726170223b693a303b7d);
INSERT INTO `system` VALUES('modules/simpletest/tests/update_test_3.module', 'update_test_3', 'module', '', 0, 0, -1, 0, 0x613a31323a7b733a343a226e616d65223b733a31313a225570646174652074657374223b733a31313a226465736372697074696f6e223b733a33343a22537570706f7274206d6f64756c6520666f72207570646174652074657374696e672e223b733a373a227061636b616765223b733a373a2254657374696e67223b733a373a2276657273696f6e223b733a343a22372e3232223b733a343a22636f7265223b733a333a22372e78223b733a363a2268696464656e223b623a313b733a373a2270726f6a656374223b733a363a2264727570616c223b733a393a22646174657374616d70223b733a31303a2231333635303237303132223b733a31323a22646570656e64656e63696573223b613a303a7b7d733a333a22706870223b733a353a22352e322e34223b733a353a2266696c6573223b613a303a7b7d733a393a22626f6f747374726170223b693a303b7d);
INSERT INTO `system` VALUES('modules/simpletest/tests/url_alter_test.module', 'url_alter_test', 'module', '', 0, 0, -1, 0, 0x613a31323a7b733a343a226e616d65223b733a31353a2255726c5f616c746572207465737473223b733a31313a226465736372697074696f6e223b733a34353a224120737570706f7274206d6f64756c657320666f722075726c5f616c74657220686f6f6b2074657374696e672e223b733a343a22636f7265223b733a333a22372e78223b733a373a227061636b616765223b733a373a2254657374696e67223b733a373a2276657273696f6e223b733a343a22372e3232223b733a363a2268696464656e223b623a313b733a373a2270726f6a656374223b733a363a2264727570616c223b733a393a22646174657374616d70223b733a31303a2231333635303237303132223b733a31323a22646570656e64656e63696573223b613a303a7b7d733a333a22706870223b733a353a22352e322e34223b733a353a2266696c6573223b613a303a7b7d733a393a22626f6f747374726170223b693a303b7d);
INSERT INTO `system` VALUES('modules/simpletest/tests/xmlrpc_test.module', 'xmlrpc_test', 'module', '', 0, 0, -1, 0, 0x613a31323a7b733a343a226e616d65223b733a31323a22584d4c2d5250432054657374223b733a31313a226465736372697074696f6e223b733a37353a22537570706f7274206d6f64756c6520666f7220584d4c2d525043207465737473206163636f7264696e6720746f207468652076616c696461746f72312073706563696669636174696f6e2e223b733a373a227061636b616765223b733a373a2254657374696e67223b733a373a2276657273696f6e223b733a343a22372e3232223b733a343a22636f7265223b733a333a22372e78223b733a363a2268696464656e223b623a313b733a373a2270726f6a656374223b733a363a2264727570616c223b733a393a22646174657374616d70223b733a31303a2231333635303237303132223b733a31323a22646570656e64656e63696573223b613a303a7b7d733a333a22706870223b733a353a22352e322e34223b733a353a2266696c6573223b613a303a7b7d733a393a22626f6f747374726170223b693a303b7d);
INSERT INTO `system` VALUES('modules/statistics/statistics.module', 'statistics', 'module', '', 0, 0, -1, 0, 0x613a31323a7b733a343a226e616d65223b733a31303a2253746174697374696373223b733a31313a226465736372697074696f6e223b733a33373a224c6f677320616363657373207374617469737469637320666f7220796f757220736974652e223b733a373a227061636b616765223b733a343a22436f7265223b733a373a2276657273696f6e223b733a343a22372e3232223b733a343a22636f7265223b733a333a22372e78223b733a353a2266696c6573223b613a313a7b693a303b733a31353a22737461746973746963732e74657374223b7d733a393a22636f6e666967757265223b733a33303a2261646d696e2f636f6e6669672f73797374656d2f73746174697374696373223b733a373a2270726f6a656374223b733a363a2264727570616c223b733a393a22646174657374616d70223b733a31303a2231333635303237303132223b733a31323a22646570656e64656e63696573223b613a303a7b7d733a333a22706870223b733a353a22352e322e34223b733a393a22626f6f747374726170223b693a303b7d);
INSERT INTO `system` VALUES('modules/syslog/syslog.module', 'syslog', 'module', '', 0, 0, -1, 0, 0x613a31313a7b733a343a226e616d65223b733a363a225379736c6f67223b733a31313a226465736372697074696f6e223b733a34313a224c6f677320616e64207265636f7264732073797374656d206576656e747320746f207379736c6f672e223b733a373a227061636b616765223b733a343a22436f7265223b733a373a2276657273696f6e223b733a343a22372e3232223b733a343a22636f7265223b733a333a22372e78223b733a353a2266696c6573223b613a313a7b693a303b733a31313a227379736c6f672e74657374223b7d733a373a2270726f6a656374223b733a363a2264727570616c223b733a393a22646174657374616d70223b733a31303a2231333635303237303132223b733a31323a22646570656e64656e63696573223b613a303a7b7d733a333a22706870223b733a353a22352e322e34223b733a393a22626f6f747374726170223b693a303b7d);
INSERT INTO `system` VALUES('modules/system/system.module', 'system', 'module', '', 1, 0, 7078, 0, 0x613a31333a7b733a343a226e616d65223b733a363a2253797374656d223b733a31313a226465736372697074696f6e223b733a35343a2248616e646c65732067656e6572616c207369746520636f6e66696775726174696f6e20666f722061646d696e6973747261746f72732e223b733a373a227061636b616765223b733a343a22436f7265223b733a373a2276657273696f6e223b733a343a22372e3232223b733a343a22636f7265223b733a333a22372e78223b733a353a2266696c6573223b613a363a7b693a303b733a31393a2273797374656d2e61726368697665722e696e63223b693a313b733a31353a2273797374656d2e6d61696c2e696e63223b693a323b733a31363a2273797374656d2e71756575652e696e63223b693a333b733a31343a2273797374656d2e7461722e696e63223b693a343b733a31383a2273797374656d2e757064617465722e696e63223b693a353b733a31313a2273797374656d2e74657374223b7d733a383a227265717569726564223b623a313b733a393a22636f6e666967757265223b733a31393a2261646d696e2f636f6e6669672f73797374656d223b733a373a2270726f6a656374223b733a363a2264727570616c223b733a393a22646174657374616d70223b733a31303a2231333635303237303132223b733a31323a22646570656e64656e63696573223b613a303a7b7d733a333a22706870223b733a353a22352e322e34223b733a393a22626f6f747374726170223b693a303b7d);
INSERT INTO `system` VALUES('modules/taxonomy/taxonomy.module', 'taxonomy', 'module', '', 1, 0, 7010, 0, 0x613a31323a7b733a343a226e616d65223b733a383a225461786f6e6f6d79223b733a31313a226465736372697074696f6e223b733a33383a22456e61626c6573207468652063617465676f72697a6174696f6e206f6620636f6e74656e742e223b733a373a227061636b616765223b733a343a22436f7265223b733a373a2276657273696f6e223b733a343a22372e3232223b733a343a22636f7265223b733a333a22372e78223b733a31323a22646570656e64656e63696573223b613a313a7b693a303b733a373a226f7074696f6e73223b7d733a353a2266696c6573223b613a323a7b693a303b733a31353a227461786f6e6f6d792e6d6f64756c65223b693a313b733a31333a227461786f6e6f6d792e74657374223b7d733a393a22636f6e666967757265223b733a32343a2261646d696e2f7374727563747572652f7461786f6e6f6d79223b733a373a2270726f6a656374223b733a363a2264727570616c223b733a393a22646174657374616d70223b733a31303a2231333635303237303132223b733a333a22706870223b733a353a22352e322e34223b733a393a22626f6f747374726170223b693a303b7d);
INSERT INTO `system` VALUES('modules/toolbar/toolbar.module', 'toolbar', 'module', '', 1, 0, 0, 0, 0x613a31313a7b733a343a226e616d65223b733a373a22546f6f6c626172223b733a31313a226465736372697074696f6e223b733a39393a2250726f7669646573206120746f6f6c62617220746861742073686f77732074686520746f702d6c6576656c2061646d696e697374726174696f6e206d656e75206974656d7320616e64206c696e6b732066726f6d206f74686572206d6f64756c65732e223b733a343a22636f7265223b733a333a22372e78223b733a373a227061636b616765223b733a343a22436f7265223b733a373a2276657273696f6e223b733a343a22372e3232223b733a373a2270726f6a656374223b733a363a2264727570616c223b733a393a22646174657374616d70223b733a31303a2231333635303237303132223b733a31323a22646570656e64656e63696573223b613a303a7b7d733a333a22706870223b733a353a22352e322e34223b733a353a2266696c6573223b613a303a7b7d733a393a22626f6f747374726170223b693a303b7d);
INSERT INTO `system` VALUES('modules/tracker/tracker.module', 'tracker', 'module', '', 0, 0, -1, 0, 0x613a31313a7b733a343a226e616d65223b733a373a22547261636b6572223b733a31313a226465736372697074696f6e223b733a34353a22456e61626c657320747261636b696e67206f6620726563656e7420636f6e74656e7420666f722075736572732e223b733a31323a22646570656e64656e63696573223b613a313a7b693a303b733a373a22636f6d6d656e74223b7d733a373a227061636b616765223b733a343a22436f7265223b733a373a2276657273696f6e223b733a343a22372e3232223b733a343a22636f7265223b733a333a22372e78223b733a353a2266696c6573223b613a313a7b693a303b733a31323a22747261636b65722e74657374223b7d733a373a2270726f6a656374223b733a363a2264727570616c223b733a393a22646174657374616d70223b733a31303a2231333635303237303132223b733a333a22706870223b733a353a22352e322e34223b733a393a22626f6f747374726170223b693a303b7d);
INSERT INTO `system` VALUES('modules/translation/tests/translation_test.module', 'translation_test', 'module', '', 0, 0, -1, 0, 0x613a31323a7b733a343a226e616d65223b733a32343a22436f6e74656e74205472616e736c6174696f6e2054657374223b733a31313a226465736372697074696f6e223b733a34393a22537570706f7274206d6f64756c6520666f722074686520636f6e74656e74207472616e736c6174696f6e2074657374732e223b733a343a22636f7265223b733a333a22372e78223b733a373a227061636b616765223b733a373a2254657374696e67223b733a373a2276657273696f6e223b733a343a22372e3232223b733a363a2268696464656e223b623a313b733a373a2270726f6a656374223b733a363a2264727570616c223b733a393a22646174657374616d70223b733a31303a2231333635303237303132223b733a31323a22646570656e64656e63696573223b613a303a7b7d733a333a22706870223b733a353a22352e322e34223b733a353a2266696c6573223b613a303a7b7d733a393a22626f6f747374726170223b693a303b7d);
INSERT INTO `system` VALUES('modules/translation/translation.module', 'translation', 'module', '', 0, 0, -1, 0, 0x613a31313a7b733a343a226e616d65223b733a31393a22436f6e74656e74207472616e736c6174696f6e223b733a31313a226465736372697074696f6e223b733a35373a22416c6c6f777320636f6e74656e7420746f206265207472616e736c6174656420696e746f20646966666572656e74206c616e6775616765732e223b733a31323a22646570656e64656e63696573223b613a313a7b693a303b733a363a226c6f63616c65223b7d733a373a227061636b616765223b733a343a22436f7265223b733a373a2276657273696f6e223b733a343a22372e3232223b733a343a22636f7265223b733a333a22372e78223b733a353a2266696c6573223b613a313a7b693a303b733a31363a227472616e736c6174696f6e2e74657374223b7d733a373a2270726f6a656374223b733a363a2264727570616c223b733a393a22646174657374616d70223b733a31303a2231333635303237303132223b733a333a22706870223b733a353a22352e322e34223b733a393a22626f6f747374726170223b693a303b7d);
INSERT INTO `system` VALUES('modules/trigger/tests/trigger_test.module', 'trigger_test', 'module', '', 0, 0, -1, 0, 0x613a31323a7b733a343a226e616d65223b733a31323a22547269676765722054657374223b733a31313a226465736372697074696f6e223b733a33333a22537570706f7274206d6f64756c6520666f7220547269676765722074657374732e223b733a373a227061636b616765223b733a373a2254657374696e67223b733a343a22636f7265223b733a333a22372e78223b733a363a2268696464656e223b623a313b733a373a2276657273696f6e223b733a343a22372e3232223b733a373a2270726f6a656374223b733a363a2264727570616c223b733a393a22646174657374616d70223b733a31303a2231333635303237303132223b733a31323a22646570656e64656e63696573223b613a303a7b7d733a333a22706870223b733a353a22352e322e34223b733a353a2266696c6573223b613a303a7b7d733a393a22626f6f747374726170223b693a303b7d);
INSERT INTO `system` VALUES('modules/trigger/trigger.module', 'trigger', 'module', '', 0, 0, -1, 0, 0x613a31323a7b733a343a226e616d65223b733a373a2254726967676572223b733a31313a226465736372697074696f6e223b733a39303a22456e61626c657320616374696f6e7320746f206265206669726564206f6e206365727461696e2073797374656d206576656e74732c2073756368206173207768656e206e657720636f6e74656e7420697320637265617465642e223b733a373a227061636b616765223b733a343a22436f7265223b733a373a2276657273696f6e223b733a343a22372e3232223b733a343a22636f7265223b733a333a22372e78223b733a353a2266696c6573223b613a313a7b693a303b733a31323a22747269676765722e74657374223b7d733a393a22636f6e666967757265223b733a32333a2261646d696e2f7374727563747572652f74726967676572223b733a373a2270726f6a656374223b733a363a2264727570616c223b733a393a22646174657374616d70223b733a31303a2231333635303237303132223b733a31323a22646570656e64656e63696573223b613a303a7b7d733a333a22706870223b733a353a22352e322e34223b733a393a22626f6f747374726170223b693a303b7d);
INSERT INTO `system` VALUES('modules/update/tests/aaa_update_test.module', 'aaa_update_test', 'module', '', 0, 0, -1, 0, 0x613a31323a7b733a343a226e616d65223b733a31353a22414141205570646174652074657374223b733a31313a226465736372697074696f6e223b733a34313a22537570706f7274206d6f64756c6520666f7220757064617465206d6f64756c652074657374696e672e223b733a373a227061636b616765223b733a373a2254657374696e67223b733a343a22636f7265223b733a333a22372e78223b733a363a2268696464656e223b623a313b733a373a2276657273696f6e223b733a343a22372e3232223b733a373a2270726f6a656374223b733a363a2264727570616c223b733a393a22646174657374616d70223b733a31303a2231333635303237303132223b733a31323a22646570656e64656e63696573223b613a303a7b7d733a333a22706870223b733a353a22352e322e34223b733a353a2266696c6573223b613a303a7b7d733a393a22626f6f747374726170223b693a303b7d);
INSERT INTO `system` VALUES('modules/update/tests/bbb_update_test.module', 'bbb_update_test', 'module', '', 0, 0, -1, 0, 0x613a31323a7b733a343a226e616d65223b733a31353a22424242205570646174652074657374223b733a31313a226465736372697074696f6e223b733a34313a22537570706f7274206d6f64756c6520666f7220757064617465206d6f64756c652074657374696e672e223b733a373a227061636b616765223b733a373a2254657374696e67223b733a343a22636f7265223b733a333a22372e78223b733a363a2268696464656e223b623a313b733a373a2276657273696f6e223b733a343a22372e3232223b733a373a2270726f6a656374223b733a363a2264727570616c223b733a393a22646174657374616d70223b733a31303a2231333635303237303132223b733a31323a22646570656e64656e63696573223b613a303a7b7d733a333a22706870223b733a353a22352e322e34223b733a353a2266696c6573223b613a303a7b7d733a393a22626f6f747374726170223b693a303b7d);
INSERT INTO `system` VALUES('modules/update/tests/ccc_update_test.module', 'ccc_update_test', 'module', '', 0, 0, -1, 0, 0x613a31323a7b733a343a226e616d65223b733a31353a22434343205570646174652074657374223b733a31313a226465736372697074696f6e223b733a34313a22537570706f7274206d6f64756c6520666f7220757064617465206d6f64756c652074657374696e672e223b733a373a227061636b616765223b733a373a2254657374696e67223b733a343a22636f7265223b733a333a22372e78223b733a363a2268696464656e223b623a313b733a373a2276657273696f6e223b733a343a22372e3232223b733a373a2270726f6a656374223b733a363a2264727570616c223b733a393a22646174657374616d70223b733a31303a2231333635303237303132223b733a31323a22646570656e64656e63696573223b613a303a7b7d733a333a22706870223b733a353a22352e322e34223b733a353a2266696c6573223b613a303a7b7d733a393a22626f6f747374726170223b693a303b7d);
INSERT INTO `system` VALUES('modules/update/tests/update_test.module', 'update_test', 'module', '', 0, 0, -1, 0, 0x613a31323a7b733a343a226e616d65223b733a31313a225570646174652074657374223b733a31313a226465736372697074696f6e223b733a34313a22537570706f7274206d6f64756c6520666f7220757064617465206d6f64756c652074657374696e672e223b733a373a227061636b616765223b733a373a2254657374696e67223b733a373a2276657273696f6e223b733a343a22372e3232223b733a343a22636f7265223b733a333a22372e78223b733a363a2268696464656e223b623a313b733a373a2270726f6a656374223b733a363a2264727570616c223b733a393a22646174657374616d70223b733a31303a2231333635303237303132223b733a31323a22646570656e64656e63696573223b613a303a7b7d733a333a22706870223b733a353a22352e322e34223b733a353a2266696c6573223b613a303a7b7d733a393a22626f6f747374726170223b693a303b7d);
INSERT INTO `system` VALUES('modules/update/update.module', 'update', 'module', '', 1, 0, 7001, 0, 0x613a31323a7b733a343a226e616d65223b733a31343a22557064617465206d616e61676572223b733a31313a226465736372697074696f6e223b733a3130343a22436865636b7320666f7220617661696c61626c6520757064617465732c20616e642063616e207365637572656c7920696e7374616c6c206f7220757064617465206d6f64756c657320616e64207468656d65732076696120612077656220696e746572666163652e223b733a373a2276657273696f6e223b733a343a22372e3232223b733a373a227061636b616765223b733a343a22436f7265223b733a343a22636f7265223b733a333a22372e78223b733a353a2266696c6573223b613a313a7b693a303b733a31313a227570646174652e74657374223b7d733a393a22636f6e666967757265223b733a33303a2261646d696e2f7265706f7274732f757064617465732f73657474696e6773223b733a373a2270726f6a656374223b733a363a2264727570616c223b733a393a22646174657374616d70223b733a31303a2231333635303237303132223b733a31323a22646570656e64656e63696573223b613a303a7b7d733a333a22706870223b733a353a22352e322e34223b733a393a22626f6f747374726170223b693a303b7d);
INSERT INTO `system` VALUES('modules/user/tests/user_form_test.module', 'user_form_test', 'module', '', 0, 0, -1, 0, 0x613a31323a7b733a343a226e616d65223b733a32323a2255736572206d6f64756c6520666f726d207465737473223b733a31313a226465736372697074696f6e223b733a33373a22537570706f7274206d6f64756c6520666f72207573657220666f726d2074657374696e672e223b733a373a227061636b616765223b733a373a2254657374696e67223b733a373a2276657273696f6e223b733a343a22372e3232223b733a343a22636f7265223b733a333a22372e78223b733a363a2268696464656e223b623a313b733a373a2270726f6a656374223b733a363a2264727570616c223b733a393a22646174657374616d70223b733a31303a2231333635303237303132223b733a31323a22646570656e64656e63696573223b613a303a7b7d733a333a22706870223b733a353a22352e322e34223b733a353a2266696c6573223b613a303a7b7d733a393a22626f6f747374726170223b693a303b7d);
INSERT INTO `system` VALUES('modules/user/user.module', 'user', 'module', '', 1, 0, 7018, 0, 0x613a31343a7b733a343a226e616d65223b733a343a2255736572223b733a31313a226465736372697074696f6e223b733a34373a224d616e6167657320746865207573657220726567697374726174696f6e20616e64206c6f67696e2073797374656d2e223b733a373a227061636b616765223b733a343a22436f7265223b733a373a2276657273696f6e223b733a343a22372e3232223b733a343a22636f7265223b733a333a22372e78223b733a353a2266696c6573223b613a323a7b693a303b733a31313a22757365722e6d6f64756c65223b693a313b733a393a22757365722e74657374223b7d733a383a227265717569726564223b623a313b733a393a22636f6e666967757265223b733a31393a2261646d696e2f636f6e6669672f70656f706c65223b733a31313a227374796c65736865657473223b613a313a7b733a333a22616c6c223b613a313a7b733a383a22757365722e637373223b733a32313a226d6f64756c65732f757365722f757365722e637373223b7d7d733a373a2270726f6a656374223b733a363a2264727570616c223b733a393a22646174657374616d70223b733a31303a2231333635303237303132223b733a31323a22646570656e64656e63696573223b613a303a7b7d733a333a22706870223b733a353a22352e322e34223b733a393a22626f6f747374726170223b693a303b7d);
INSERT INTO `system` VALUES('profiles/standard/standard.profile', 'standard', 'module', '', 1, 0, 0, 1000, 0x613a31343a7b733a343a226e616d65223b733a383a225374616e64617264223b733a31313a226465736372697074696f6e223b733a35313a22496e7374616c6c207769746820636f6d6d6f6e6c792075736564206665617475726573207072652d636f6e666967757265642e223b733a373a2276657273696f6e223b733a343a22372e3232223b733a343a22636f7265223b733a333a22372e78223b733a31323a22646570656e64656e63696573223b613a32313a7b693a303b733a353a22626c6f636b223b693a313b733a353a22636f6c6f72223b693a323b733a373a22636f6d6d656e74223b693a333b733a31303a22636f6e7465787475616c223b693a343b733a393a2264617368626f617264223b693a353b733a343a2268656c70223b693a363b733a353a22696d616765223b693a373b733a343a226c697374223b693a383b733a343a226d656e75223b693a393b733a363a226e756d626572223b693a31303b733a373a226f7074696f6e73223b693a31313b733a343a2270617468223b693a31323b733a383a227461786f6e6f6d79223b693a31333b733a353a2264626c6f67223b693a31343b733a363a22736561726368223b693a31353b733a383a2273686f7274637574223b693a31363b733a373a22746f6f6c626172223b693a31373b733a373a226f7665726c6179223b693a31383b733a383a226669656c645f7569223b693a31393b733a343a2266696c65223b693a32303b733a333a22726466223b7d733a373a2270726f6a656374223b733a363a2264727570616c223b733a393a22646174657374616d70223b733a31303a2231333635303237303132223b733a373a227061636b616765223b733a353a224f74686572223b733a333a22706870223b733a353a22352e322e34223b733a353a2266696c6573223b613a303a7b7d733a393a22626f6f747374726170223b693a303b733a363a2268696464656e223b623a313b733a383a227265717569726564223b623a313b733a31373a22646973747269627574696f6e5f6e616d65223b733a363a2244727570616c223b7d);
INSERT INTO `system` VALUES('sites/all/modules/ctools/bulk_export/bulk_export.module', 'bulk_export', 'module', '', 0, 0, -1, 0, 0x613a31313a7b733a343a226e616d65223b733a31313a2242756c6b204578706f7274223b733a31313a226465736372697074696f6e223b733a36373a22506572666f726d732062756c6b206578706f7274696e67206f662064617461206f626a65637473206b6e6f776e2061626f7574206279204368616f7320746f6f6c732e223b733a343a22636f7265223b733a333a22372e78223b733a31323a22646570656e64656e63696573223b613a313a7b693a303b733a363a2263746f6f6c73223b7d733a373a227061636b616765223b733a31363a224368616f7320746f6f6c207375697465223b733a373a2276657273696f6e223b733a373a22372e782d312e33223b733a373a2270726f6a656374223b733a363a2263746f6f6c73223b733a393a22646174657374616d70223b733a31303a2231333635303133353132223b733a333a22706870223b733a353a22352e322e34223b733a353a2266696c6573223b613a303a7b7d733a393a22626f6f747374726170223b693a303b7d);
INSERT INTO `system` VALUES('sites/all/modules/ctools/ctools.module', 'ctools', 'module', '', 1, 0, 6008, 0, 0x613a31313a7b733a343a226e616d65223b733a31313a224368616f7320746f6f6c73223b733a31313a226465736372697074696f6e223b733a34363a2241206c696272617279206f662068656c7066756c20746f6f6c73206279204d65726c696e206f66204368616f732e223b733a343a22636f7265223b733a333a22372e78223b733a373a227061636b616765223b733a31363a224368616f7320746f6f6c207375697465223b733a353a2266696c6573223b613a333a7b693a303b733a32303a22696e636c756465732f636f6e746578742e696e63223b693a313b733a32323a22696e636c756465732f6d6174682d657870722e696e63223b693a323b733a32313a22696e636c756465732f7374796c697a65722e696e63223b7d733a373a2276657273696f6e223b733a373a22372e782d312e33223b733a373a2270726f6a656374223b733a363a2263746f6f6c73223b733a393a22646174657374616d70223b733a31303a2231333635303133353132223b733a31323a22646570656e64656e63696573223b613a303a7b7d733a333a22706870223b733a353a22352e322e34223b733a393a22626f6f747374726170223b693a303b7d);
INSERT INTO `system` VALUES('sites/all/modules/ctools/ctools_access_ruleset/ctools_access_ruleset.module', 'ctools_access_ruleset', 'module', '', 0, 0, -1, 0, 0x613a31313a7b733a343a226e616d65223b733a31353a22437573746f6d2072756c6573657473223b733a31313a226465736372697074696f6e223b733a38313a2243726561746520637573746f6d2c206578706f727461626c652c207265757361626c65206163636573732072756c657365747320666f72206170706c69636174696f6e73206c696b652050616e656c732e223b733a343a22636f7265223b733a333a22372e78223b733a373a227061636b616765223b733a31363a224368616f7320746f6f6c207375697465223b733a31323a22646570656e64656e63696573223b613a313a7b693a303b733a363a2263746f6f6c73223b7d733a373a2276657273696f6e223b733a373a22372e782d312e33223b733a373a2270726f6a656374223b733a363a2263746f6f6c73223b733a393a22646174657374616d70223b733a31303a2231333635303133353132223b733a333a22706870223b733a353a22352e322e34223b733a353a2266696c6573223b613a303a7b7d733a393a22626f6f747374726170223b693a303b7d);
INSERT INTO `system` VALUES('sites/all/modules/ctools/ctools_ajax_sample/ctools_ajax_sample.module', 'ctools_ajax_sample', 'module', '', 0, 0, -1, 0, 0x613a31313a7b733a343a226e616d65223b733a33333a224368616f7320546f6f6c73202843546f6f6c732920414a4158204578616d706c65223b733a31313a226465736372697074696f6e223b733a34313a2253686f777320686f7720746f207573652074686520706f776572206f66204368616f7320414a41582e223b733a373a227061636b616765223b733a31363a224368616f7320746f6f6c207375697465223b733a31323a22646570656e64656e63696573223b613a313a7b693a303b733a363a2263746f6f6c73223b7d733a343a22636f7265223b733a333a22372e78223b733a373a2276657273696f6e223b733a373a22372e782d312e33223b733a373a2270726f6a656374223b733a363a2263746f6f6c73223b733a393a22646174657374616d70223b733a31303a2231333635303133353132223b733a333a22706870223b733a353a22352e322e34223b733a353a2266696c6573223b613a303a7b7d733a393a22626f6f747374726170223b693a303b7d);
INSERT INTO `system` VALUES('sites/all/modules/ctools/ctools_custom_content/ctools_custom_content.module', 'ctools_custom_content', 'module', '', 0, 0, -1, 0, 0x613a31313a7b733a343a226e616d65223b733a32303a22437573746f6d20636f6e74656e742070616e6573223b733a31313a226465736372697074696f6e223b733a37393a2243726561746520637573746f6d2c206578706f727461626c652c207265757361626c6520636f6e74656e742070616e657320666f72206170706c69636174696f6e73206c696b652050616e656c732e223b733a343a22636f7265223b733a333a22372e78223b733a373a227061636b616765223b733a31363a224368616f7320746f6f6c207375697465223b733a31323a22646570656e64656e63696573223b613a313a7b693a303b733a363a2263746f6f6c73223b7d733a373a2276657273696f6e223b733a373a22372e782d312e33223b733a373a2270726f6a656374223b733a363a2263746f6f6c73223b733a393a22646174657374616d70223b733a31303a2231333635303133353132223b733a333a22706870223b733a353a22352e322e34223b733a353a2266696c6573223b613a303a7b7d733a393a22626f6f747374726170223b693a303b7d);
INSERT INTO `system` VALUES('sites/all/modules/ctools/ctools_plugin_example/ctools_plugin_example.module', 'ctools_plugin_example', 'module', '', 0, 0, -1, 0, 0x613a31313a7b733a343a226e616d65223b733a33353a224368616f7320546f6f6c73202843546f6f6c732920506c7567696e204578616d706c65223b733a31313a226465736372697074696f6e223b733a37353a2253686f777320686f7720616e2065787465726e616c206d6f64756c652063616e2070726f766964652063746f6f6c7320706c7567696e732028666f722050616e656c732c206574632e292e223b733a373a227061636b616765223b733a31363a224368616f7320746f6f6c207375697465223b733a31323a22646570656e64656e63696573223b613a343a7b693a303b733a363a2263746f6f6c73223b693a313b733a363a2270616e656c73223b693a323b733a31323a22706167655f6d616e61676572223b693a333b733a31333a22616476616e6365645f68656c70223b7d733a343a22636f7265223b733a333a22372e78223b733a373a2276657273696f6e223b733a373a22372e782d312e33223b733a373a2270726f6a656374223b733a363a2263746f6f6c73223b733a393a22646174657374616d70223b733a31303a2231333635303133353132223b733a333a22706870223b733a353a22352e322e34223b733a353a2266696c6573223b613a303a7b7d733a393a22626f6f747374726170223b693a303b7d);
INSERT INTO `system` VALUES('sites/all/modules/ctools/page_manager/page_manager.module', 'page_manager', 'module', '', 0, 0, -1, 0, 0x613a31313a7b733a343a226e616d65223b733a31323a2250616765206d616e61676572223b733a31313a226465736372697074696f6e223b733a35343a2250726f7669646573206120554920616e642041504920746f206d616e6167652070616765732077697468696e2074686520736974652e223b733a343a22636f7265223b733a333a22372e78223b733a31323a22646570656e64656e63696573223b613a313a7b693a303b733a363a2263746f6f6c73223b7d733a373a227061636b616765223b733a31363a224368616f7320746f6f6c207375697465223b733a373a2276657273696f6e223b733a373a22372e782d312e33223b733a373a2270726f6a656374223b733a363a2263746f6f6c73223b733a393a22646174657374616d70223b733a31303a2231333635303133353132223b733a333a22706870223b733a353a22352e322e34223b733a353a2266696c6573223b613a303a7b7d733a393a22626f6f747374726170223b693a303b7d);
INSERT INTO `system` VALUES('sites/all/modules/ctools/stylizer/stylizer.module', 'stylizer', 'module', '', 0, 0, -1, 0, 0x613a31313a7b733a343a226e616d65223b733a383a225374796c697a6572223b733a31313a226465736372697074696f6e223b733a35333a2243726561746520637573746f6d207374796c657320666f72206170706c69636174696f6e7320737563682061732050616e656c732e223b733a343a22636f7265223b733a333a22372e78223b733a373a227061636b616765223b733a31363a224368616f7320746f6f6c207375697465223b733a31323a22646570656e64656e63696573223b613a323a7b693a303b733a363a2263746f6f6c73223b693a313b733a353a22636f6c6f72223b7d733a373a2276657273696f6e223b733a373a22372e782d312e33223b733a373a2270726f6a656374223b733a363a2263746f6f6c73223b733a393a22646174657374616d70223b733a31303a2231333635303133353132223b733a333a22706870223b733a353a22352e322e34223b733a353a2266696c6573223b613a303a7b7d733a393a22626f6f747374726170223b693a303b7d);
INSERT INTO `system` VALUES('sites/all/modules/ctools/tests/ctools_export_test/ctools_export_test.module', 'ctools_export_test', 'module', '', 0, 0, -1, 0, 0x613a31323a7b733a343a226e616d65223b733a31383a2243546f6f6c73206578706f72742074657374223b733a31313a226465736372697074696f6e223b733a32353a2243546f6f6c73206578706f72742074657374206d6f64756c65223b733a343a22636f7265223b733a333a22372e78223b733a373a227061636b616765223b733a31363a224368616f7320746f6f6c207375697465223b733a31323a22646570656e64656e63696573223b613a313a7b693a303b733a363a2263746f6f6c73223b7d733a363a2268696464656e223b623a313b733a353a2266696c6573223b613a313a7b693a303b733a31383a2263746f6f6c735f6578706f72742e74657374223b7d733a373a2276657273696f6e223b733a373a22372e782d312e33223b733a373a2270726f6a656374223b733a363a2263746f6f6c73223b733a393a22646174657374616d70223b733a31303a2231333635303133353132223b733a333a22706870223b733a353a22352e322e34223b733a393a22626f6f747374726170223b693a303b7d);
INSERT INTO `system` VALUES('sites/all/modules/ctools/tests/ctools_plugin_test.module', 'ctools_plugin_test', 'module', '', 0, 0, -1, 0, 0x613a31323a7b733a343a226e616d65223b733a32343a224368616f7320746f6f6c7320706c7567696e732074657374223b733a31313a226465736372697074696f6e223b733a34323a2250726f766964657320686f6f6b7320666f722074657374696e672063746f6f6c7320706c7567696e732e223b733a373a227061636b616765223b733a31363a224368616f7320746f6f6c207375697465223b733a343a22636f7265223b733a333a22372e78223b733a31323a22646570656e64656e63696573223b613a313a7b693a303b733a363a2263746f6f6c73223b7d733a353a2266696c6573223b613a363a7b693a303b733a31393a2263746f6f6c732e706c7567696e732e74657374223b693a313b733a31373a226f626a6563745f63616368652e74657374223b693a323b733a383a226373732e74657374223b693a333b733a31323a22636f6e746578742e74657374223b693a343b733a32303a226d6174685f65787072657373696f6e2e74657374223b693a353b733a32363a226d6174685f65787072657373696f6e5f737461636b2e74657374223b7d733a363a2268696464656e223b623a313b733a373a2276657273696f6e223b733a373a22372e782d312e33223b733a373a2270726f6a656374223b733a363a2263746f6f6c73223b733a393a22646174657374616d70223b733a31303a2231333635303133353132223b733a333a22706870223b733a353a22352e322e34223b733a393a22626f6f747374726170223b693a303b7d);
INSERT INTO `system` VALUES('sites/all/modules/ctools/views_content/views_content.module', 'views_content', 'module', '', 0, 0, -1, 0, 0x613a31313a7b733a343a226e616d65223b733a31393a22566965777320636f6e74656e742070616e6573223b733a31313a226465736372697074696f6e223b733a3130343a22416c6c6f777320566965777320636f6e74656e7420746f206265207573656420696e2050616e656c732c2044617368626f61726420616e64206f74686572206d6f64756c657320776869636820757365207468652043546f6f6c7320436f6e74656e74204150492e223b733a373a227061636b616765223b733a31363a224368616f7320746f6f6c207375697465223b733a31323a22646570656e64656e63696573223b613a323a7b693a303b733a363a2263746f6f6c73223b693a313b733a353a227669657773223b7d733a343a22636f7265223b733a333a22372e78223b733a353a2266696c6573223b613a333a7b693a303b733a36313a22706c7567696e732f76696577732f76696577735f636f6e74656e745f706c7567696e5f646973706c61795f63746f6f6c735f636f6e746578742e696e63223b693a313b733a35373a22706c7567696e732f76696577732f76696577735f636f6e74656e745f706c7567696e5f646973706c61795f70616e656c5f70616e652e696e63223b693a323b733a35393a22706c7567696e732f76696577732f76696577735f636f6e74656e745f706c7567696e5f7374796c655f63746f6f6c735f636f6e746578742e696e63223b7d733a373a2276657273696f6e223b733a373a22372e782d312e33223b733a373a2270726f6a656374223b733a363a2263746f6f6c73223b733a393a22646174657374616d70223b733a31303a2231333635303133353132223b733a333a22706870223b733a353a22352e322e34223b733a393a22626f6f747374726170223b693a303b7d);
INSERT INTO `system` VALUES('sites/all/modules/entity/entity.module', 'entity', 'module', '', 1, 0, 7002, 0, 0x613a31313a7b733a343a226e616d65223b733a31303a22456e7469747920415049223b733a31313a226465736372697074696f6e223b733a36393a22456e61626c6573206d6f64756c657320746f20776f726b207769746820616e7920656e74697479207479706520616e6420746f2070726f7669646520656e7469746965732e223b733a343a22636f7265223b733a333a22372e78223b733a353a2266696c6573223b613a32343a7b693a303b733a31393a22656e746974792e66656174757265732e696e63223b693a313b733a31353a22656e746974792e6931386e2e696e63223b693a323b733a31353a22656e746974792e696e666f2e696e63223b693a333b733a31363a22656e746974792e72756c65732e696e63223b693a343b733a31313a22656e746974792e74657374223b693a353b733a31393a22696e636c756465732f656e746974792e696e63223b693a363b733a33303a22696e636c756465732f656e746974792e636f6e74726f6c6c65722e696e63223b693a373b733a32323a22696e636c756465732f656e746974792e75692e696e63223b693a383b733a32373a22696e636c756465732f656e746974792e777261707065722e696e63223b693a393b733a32323a2276696577732f656e746974792e76696577732e696e63223b693a31303b733a35323a2276696577732f68616e646c6572732f656e746974795f76696577735f6669656c645f68616e646c65725f68656c7065722e696e63223b693a31313b733a35313a2276696577732f68616e646c6572732f656e746974795f76696577735f68616e646c65725f617265615f656e746974792e696e63223b693a31323b733a35333a2276696577732f68616e646c6572732f656e746974795f76696577735f68616e646c65725f6669656c645f626f6f6c65616e2e696e63223b693a31333b733a35303a2276696577732f68616e646c6572732f656e746974795f76696577735f68616e646c65725f6669656c645f646174652e696e63223b693a31343b733a35343a2276696577732f68616e646c6572732f656e746974795f76696577735f68616e646c65725f6669656c645f6475726174696f6e2e696e63223b693a31353b733a35323a2276696577732f68616e646c6572732f656e746974795f76696577735f68616e646c65725f6669656c645f656e746974792e696e63223b693a31363b733a35313a2276696577732f68616e646c6572732f656e746974795f76696577735f68616e646c65725f6669656c645f6669656c642e696e63223b693a31373b733a35333a2276696577732f68616e646c6572732f656e746974795f76696577735f68616e646c65725f6669656c645f6e756d657269632e696e63223b693a31383b733a35333a2276696577732f68616e646c6572732f656e746974795f76696577735f68616e646c65725f6669656c645f6f7074696f6e732e696e63223b693a31393b733a35303a2276696577732f68616e646c6572732f656e746974795f76696577735f68616e646c65725f6669656c645f746578742e696e63223b693a32303b733a34393a2276696577732f68616e646c6572732f656e746974795f76696577735f68616e646c65725f6669656c645f7572692e696e63223b693a32313b733a36323a2276696577732f68616e646c6572732f656e746974795f76696577735f68616e646c65725f72656c6174696f6e736869705f62795f62756e646c652e696e63223b693a32323b733a35323a2276696577732f68616e646c6572732f656e746974795f76696577735f68616e646c65725f72656c6174696f6e736869702e696e63223b693a32333b733a35333a2276696577732f706c7567696e732f656e746974795f76696577735f706c7567696e5f726f775f656e746974795f766965772e696e63223b7d733a373a2276657273696f6e223b733a373a22372e782d312e31223b733a373a2270726f6a656374223b733a363a22656e74697479223b733a393a22646174657374616d70223b733a31303a2231333637333338323136223b733a31323a22646570656e64656e63696573223b613a303a7b7d733a373a227061636b616765223b733a353a224f74686572223b733a333a22706870223b733a353a22352e322e34223b733a393a22626f6f747374726170223b693a303b7d);
INSERT INTO `system` VALUES('sites/all/modules/entity/entity_token.module', 'entity_token', 'module', '', 1, 0, 0, 0, 0x613a31313a7b733a343a226e616d65223b733a31333a22456e7469747920746f6b656e73223b733a31313a226465736372697074696f6e223b733a39393a2250726f766964657320746f6b656e207265706c6163656d656e747320666f7220616c6c2070726f7065727469657320746861742068617665206e6f20746f6b656e7320616e6420617265206b6e6f776e20746f2074686520656e74697479204150492e223b733a343a22636f7265223b733a333a22372e78223b733a353a2266696c6573223b613a323a7b693a303b733a32333a22656e746974795f746f6b656e2e746f6b656e732e696e63223b693a313b733a31393a22656e746974795f746f6b656e2e6d6f64756c65223b7d733a31323a22646570656e64656e63696573223b613a313a7b693a303b733a363a22656e74697479223b7d733a373a2276657273696f6e223b733a373a22372e782d312e31223b733a373a2270726f6a656374223b733a363a22656e74697479223b733a393a22646174657374616d70223b733a31303a2231333637333338323136223b733a373a227061636b616765223b733a353a224f74686572223b733a333a22706870223b733a353a22352e322e34223b733a393a22626f6f747374726170223b693a303b7d);
INSERT INTO `system` VALUES('sites/all/modules/entity/tests/entity_feature.module', 'entity_feature', 'module', '', 0, 0, -1, 0, 0x613a31323a7b733a343a226e616d65223b733a32313a22456e746974792066656174757265206d6f64756c65223b733a31313a226465736372697074696f6e223b733a33313a2250726f766964657320736f6d6520656e74697469657320696e20636f64652e223b733a373a2276657273696f6e223b733a373a22372e782d312e31223b733a343a22636f7265223b733a333a22372e78223b733a353a2266696c6573223b613a313a7b693a303b733a32313a22656e746974795f666561747572652e6d6f64756c65223b7d733a31323a22646570656e64656e63696573223b613a313a7b693a303b733a31313a22656e746974795f74657374223b7d733a363a2268696464656e223b623a313b733a373a2270726f6a656374223b733a363a22656e74697479223b733a393a22646174657374616d70223b733a31303a2231333637333338323136223b733a373a227061636b616765223b733a353a224f74686572223b733a333a22706870223b733a353a22352e322e34223b733a393a22626f6f747374726170223b693a303b7d);
INSERT INTO `system` VALUES('sites/all/modules/entity/tests/entity_test.module', 'entity_test', 'module', '', 0, 0, -1, 0, 0x613a31323a7b733a343a226e616d65223b733a32333a22456e7469747920435255442074657374206d6f64756c65223b733a31313a226465736372697074696f6e223b733a34363a2250726f766964657320656e746974792074797065732062617365642075706f6e207468652043525544204150492e223b733a373a2276657273696f6e223b733a373a22372e782d312e31223b733a343a22636f7265223b733a333a22372e78223b733a353a2266696c6573223b613a323a7b693a303b733a31383a22656e746974795f746573742e6d6f64756c65223b693a313b733a31393a22656e746974795f746573742e696e7374616c6c223b7d733a31323a22646570656e64656e63696573223b613a313a7b693a303b733a363a22656e74697479223b7d733a363a2268696464656e223b623a313b733a373a2270726f6a656374223b733a363a22656e74697479223b733a393a22646174657374616d70223b733a31303a2231333637333338323136223b733a373a227061636b616765223b733a353a224f74686572223b733a333a22706870223b733a353a22352e322e34223b733a393a22626f6f747374726170223b693a303b7d);
INSERT INTO `system` VALUES('sites/all/modules/entity/tests/entity_test_i18n.module', 'entity_test_i18n', 'module', '', 0, 0, -1, 0, 0x613a31323a7b733a343a226e616d65223b733a32383a22456e746974792d746573742074797065207472616e736c6174696f6e223b733a31313a226465736372697074696f6e223b733a33373a22416c6c6f7773207472616e736c6174696e6720656e746974792d746573742074797065732e223b733a31323a22646570656e64656e63696573223b613a323a7b693a303b733a31313a22656e746974795f74657374223b693a313b733a31313a226931386e5f737472696e67223b7d733a373a227061636b616765223b733a33353a224d756c74696c696e6775616c202d20496e7465726e6174696f6e616c697a6174696f6e223b733a343a22636f7265223b733a333a22372e78223b733a363a2268696464656e223b623a313b733a373a2276657273696f6e223b733a373a22372e782d312e31223b733a373a2270726f6a656374223b733a363a22656e74697479223b733a393a22646174657374616d70223b733a31303a2231333637333338323136223b733a333a22706870223b733a353a22352e322e34223b733a353a2266696c6573223b613a303a7b7d733a393a22626f6f747374726170223b693a303b7d);
INSERT INTO `system` VALUES('sites/all/modules/field_group/field_group.module', 'field_group', 'module', '', 1, 0, 7003, 1, 0x613a31313a7b733a343a226e616d65223b733a31303a224669656c6467726f7570223b733a31313a226465736372697074696f6e223b733a31303a224669656c6467726f7570223b733a373a227061636b616765223b733a363a224669656c6473223b733a31323a22646570656e64656e63696573223b613a323a7b693a303b733a353a226669656c64223b693a313b733a363a2263746f6f6c73223b7d733a343a22636f7265223b733a333a22372e78223b733a353a2266696c6573223b613a363a7b693a303b733a31393a226669656c645f67726f75702e696e7374616c6c223b693a313b733a31383a226669656c645f67726f75702e6d6f64756c65223b693a323b733a32343a226669656c645f67726f75702e6669656c645f75692e696e63223b693a333b733a32303a226669656c645f67726f75702e666f726d2e696e63223b693a343b733a32343a226669656c645f67726f75702e66656174757265732e696e63223b693a353b733a31363a226669656c645f67726f75702e74657374223b7d733a373a2276657273696f6e223b733a373a22372e782d312e31223b733a373a2270726f6a656374223b733a31313a226669656c645f67726f7570223b733a393a22646174657374616d70223b733a31303a2231333139303531313333223b733a333a22706870223b733a353a22352e322e34223b733a393a22626f6f747374726170223b693a303b7d);
INSERT INTO `system` VALUES('sites/all/modules/google_qr_code/google_qr_code.module', 'google_qr_code', 'module', '', 1, 0, 0, 0, 0x613a31323a7b733a343a226e616d65223b733a32343a22476f6f676c6520515220436f64652047656e657261746f72223b733a31313a226465736372697074696f6e223b733a34333a2247656e6572617465206120515220636f6465207573696e6720476f6f676c6520515220436f646520415049223b733a343a22636f7265223b733a333a22372e78223b733a373a227061636b616765223b733a353a224f74686572223b733a393a22636f6e666967757265223b733a33323a2261646d696e2f636f6e6669672f73797374656d2f676f6f676c657172636f6465223b733a373a2276657273696f6e223b733a373a22372e782d312e30223b733a373a2270726f6a656374223b733a31343a22676f6f676c655f71725f636f6465223b733a393a22646174657374616d70223b733a31303a2231333539343238313632223b733a31323a22646570656e64656e63696573223b613a303a7b7d733a333a22706870223b733a353a22352e322e34223b733a353a2266696c6573223b613a303a7b7d733a393a22626f6f747374726170223b693a303b7d);
INSERT INTO `system` VALUES('sites/all/modules/insert/insert.module', 'insert', 'module', '', 1, 0, 0, 15, 0x613a31313a7b733a343a226e616d65223b733a363a22496e73657274223b733a31313a226465736372697074696f6e223b733a39313a224173736973747320696e20696e73657274696e672066696c65732c20696d616765732c206f72206f74686572206d6564696120696e746f2074686520626f6479206669656c64206f72206f7468657220746578742061726561732e223b733a343a22636f7265223b733a333a22372e78223b733a373a2276657273696f6e223b733a373a22372e782d312e33223b733a373a2270726f6a656374223b733a363a22696e73657274223b733a393a22646174657374616d70223b733a31303a2231333631363631383338223b733a31323a22646570656e64656e63696573223b613a303a7b7d733a373a227061636b616765223b733a353a224f74686572223b733a333a22706870223b733a353a22352e322e34223b733a353a2266696c6573223b613a303a7b7d733a393a22626f6f747374726170223b693a303b7d);
INSERT INTO `system` VALUES('sites/all/modules/libraries/libraries.module', 'libraries', 'module', '', 1, 0, 7200, 0, 0x613a31313a7b733a343a226e616d65223b733a393a224c6962726172696573223b733a31313a226465736372697074696f6e223b733a36343a22416c6c6f77732076657273696f6e2d646570656e64656e7420616e6420736861726564207573616765206f662065787465726e616c206c69627261726965732e223b733a343a22636f7265223b733a333a22372e78223b733a353a2266696c6573223b613a313a7b693a303b733a32303a2274657374732f6c69627261726965732e74657374223b7d733a373a2276657273696f6e223b733a373a22372e782d322e31223b733a373a2270726f6a656374223b733a393a226c6962726172696573223b733a393a22646174657374616d70223b733a31303a2231333632383438343132223b733a31323a22646570656e64656e63696573223b613a303a7b7d733a373a227061636b616765223b733a353a224f74686572223b733a333a22706870223b733a353a22352e322e34223b733a393a22626f6f747374726170223b693a303b7d);
INSERT INTO `system` VALUES('sites/all/modules/libraries/tests/libraries_test.module', 'libraries_test', 'module', '', 0, 0, -1, 0, 0x613a31323a7b733a343a226e616d65223b733a32313a224c69627261726965732074657374206d6f64756c65223b733a31313a226465736372697074696f6e223b733a33363a225465737473206c69627261727920646574656374696f6e20616e64206c6f6164696e672e223b733a343a22636f7265223b733a333a22372e78223b733a31323a22646570656e64656e63696573223b613a313a7b693a303b733a393a226c6962726172696573223b7d733a363a2268696464656e223b623a313b733a373a2276657273696f6e223b733a373a22372e782d322e31223b733a373a2270726f6a656374223b733a393a226c6962726172696573223b733a393a22646174657374616d70223b733a31303a2231333632383438343132223b733a373a227061636b616765223b733a353a224f74686572223b733a333a22706870223b733a353a22352e322e34223b733a353a2266696c6573223b613a303a7b7d733a393a22626f6f747374726170223b693a303b7d);
INSERT INTO `system` VALUES('sites/all/modules/rules/rules.module', 'rules', 'module', '', 1, 1, 7209, 20, 0x613a31323a7b733a343a226e616d65223b733a353a2252756c6573223b733a31313a226465736372697074696f6e223b733a35313a225265616374206f6e206576656e747320616e6420636f6e646974696f6e616c6c79206576616c7561746520616374696f6e732e223b733a373a227061636b616765223b733a353a2252756c6573223b733a343a22636f7265223b733a333a22372e78223b733a353a2266696c6573223b613a31343a7b693a303b733a31383a2272756c65732e66656174757265732e696e63223b693a313b733a31363a2274657374732f72756c65732e74657374223b693a323b733a31383a22696e636c756465732f66616365732e696e63223b693a333b733a32333a22696e636c756465732f72756c65732e636f72652e696e63223b693a343b733a32383a22696e636c756465732f72756c65732e70726f636573736f722e696e63223b693a353b733a32363a22696e636c756465732f72756c65732e706c7567696e732e696e63223b693a363b733a32343a22696e636c756465732f72756c65732e73746174652e696e63223b693a373b733a32303a226d6f64756c65732f7068702e6576616c2e696e63223b693a383b733a32373a226d6f64756c65732f72756c65735f636f72652e6576616c2e696e63223b693a393b733a32333a226d6f64756c65732f73797374656d2e6576616c2e696e63223b693a31303b733a32303a2275692f75692e636f6e74726f6c6c65722e696e63223b693a31313b733a31343a2275692f75692e636f72652e696e63223b693a31323b733a31343a2275692f75692e646174612e696e63223b693a31333b733a31373a2275692f75692e706c7567696e732e696e63223b7d733a31323a22646570656e64656e63696573223b613a323a7b693a303b733a31323a22656e746974795f746f6b656e223b693a313b733a363a22656e74697479223b7d733a373a2276657273696f6e223b733a373a22372e782d322e33223b733a373a2270726f6a656374223b733a353a2272756c6573223b733a393a22646174657374616d70223b733a31303a2231333634343031383138223b733a333a22706870223b733a353a22352e322e34223b733a393a22626f6f747374726170223b693a303b733a393a22636f6e666967757265223b733a32373a2261646d696e2f636f6e6669672f776f726b666c6f772f72756c6573223b7d);
INSERT INTO `system` VALUES('sites/all/modules/rules/rules_admin/rules_admin.module', 'rules_admin', 'module', '', 1, 0, 0, 0, 0x613a31313a7b733a343a226e616d65223b733a383a2252756c6573205549223b733a31313a226465736372697074696f6e223b733a34343a2241646d696e69737472617469766520696e7465726661636520666f72206d616e6167696e672072756c65732e223b733a373a227061636b616765223b733a353a2252756c6573223b733a343a22636f7265223b733a333a22372e78223b733a353a2266696c6573223b613a323a7b693a303b733a31383a2272756c65735f61646d696e2e6d6f64756c65223b693a313b733a31353a2272756c65735f61646d696e2e696e63223b7d733a31323a22646570656e64656e63696573223b613a313a7b693a303b733a353a2272756c6573223b7d733a373a2276657273696f6e223b733a373a22372e782d322e33223b733a373a2270726f6a656374223b733a353a2272756c6573223b733a393a22646174657374616d70223b733a31303a2231333634343031383138223b733a333a22706870223b733a353a22352e322e34223b733a393a22626f6f747374726170223b693a303b7d);
INSERT INTO `system` VALUES('sites/all/modules/rules/rules_i18n/rules_i18n.module', 'rules_i18n', 'module', '', 0, 0, -1, 0, 0x613a31313a7b733a343a226e616d65223b733a31373a2252756c6573207472616e736c6174696f6e223b733a31313a226465736372697074696f6e223b733a32353a22416c6c6f7773207472616e736c6174696e672072756c65732e223b733a31323a22646570656e64656e63696573223b613a323a7b693a303b733a353a2272756c6573223b693a313b733a31313a226931386e5f737472696e67223b7d733a373a227061636b616765223b733a33353a224d756c74696c696e6775616c202d20496e7465726e6174696f6e616c697a6174696f6e223b733a343a22636f7265223b733a333a22372e78223b733a353a2266696c6573223b613a333a7b693a303b733a31393a2272756c65735f6931386e2e6931386e2e696e63223b693a313b733a32303a2272756c65735f6931386e2e72756c65732e696e63223b693a323b733a31353a2272756c65735f6931386e2e74657374223b7d733a373a2276657273696f6e223b733a373a22372e782d322e33223b733a373a2270726f6a656374223b733a353a2272756c6573223b733a393a22646174657374616d70223b733a31303a2231333634343031383138223b733a333a22706870223b733a353a22352e322e34223b733a393a22626f6f747374726170223b693a303b7d);
INSERT INTO `system` VALUES('sites/all/modules/rules/rules_scheduler/rules_scheduler.module', 'rules_scheduler', 'module', '', 1, 0, 7202, 0, 0x613a31323a7b733a343a226e616d65223b733a31353a2252756c6573205363686564756c6572223b733a31313a226465736372697074696f6e223b733a35373a225363686564756c652074686520657865637574696f6e206f662052756c657320636f6d706f6e656e7473207573696e6720616374696f6e732e223b733a31323a22646570656e64656e63696573223b613a313a7b693a303b733a353a2272756c6573223b7d733a373a227061636b616765223b733a353a2252756c6573223b733a343a22636f7265223b733a333a22372e78223b733a353a2266696c6573223b613a383a7b693a303b733a32353a2272756c65735f7363686564756c65722e61646d696e2e696e63223b693a313b733a32323a2272756c65735f7363686564756c65722e6d6f64756c65223b693a323b733a32333a2272756c65735f7363686564756c65722e696e7374616c6c223b693a333b733a32353a2272756c65735f7363686564756c65722e72756c65732e696e63223b693a343b733a32303a2272756c65735f7363686564756c65722e74657374223b693a353b733a34323a22696e636c756465732f72756c65735f7363686564756c65722e76696577735f64656661756c742e696e63223b693a363b733a33343a22696e636c756465732f72756c65735f7363686564756c65722e76696577732e696e63223b693a373b733a34313a22696e636c756465732f72756c65735f7363686564756c65725f76696577735f66696c7465722e696e63223b7d733a373a2276657273696f6e223b733a373a22372e782d322e33223b733a373a2270726f6a656374223b733a353a2272756c6573223b733a393a22646174657374616d70223b733a31303a2231333634343031383138223b733a333a22706870223b733a353a22352e322e34223b733a393a22626f6f747374726170223b693a303b733a393a22636f6e666967757265223b733a33363a2261646d696e2f636f6e6669672f776f726b666c6f772f72756c65732f7363686564756c65223b7d);
INSERT INTO `system` VALUES('sites/all/modules/rules/tests/rules_test.module', 'rules_test', 'module', '', 0, 0, -1, 0, 0x613a31323a7b733a343a226e616d65223b733a31313a2252756c6573205465737473223b733a31313a226465736372697074696f6e223b733a33353a22537570706f7274206d6f64756c6520666f72207468652052756c65732074657374732e223b733a373a227061636b616765223b733a373a2254657374696e67223b733a343a22636f7265223b733a333a22372e78223b733a353a2266696c6573223b613a323a7b693a303b733a32303a2272756c65735f746573742e72756c65732e696e63223b693a313b733a32393a2272756c65735f746573742e72756c65735f64656661756c74732e696e63223b7d733a363a2268696464656e223b623a313b733a373a2276657273696f6e223b733a373a22372e782d322e33223b733a373a2270726f6a656374223b733a353a2272756c6573223b733a393a22646174657374616d70223b733a31303a2231333634343031383138223b733a31323a22646570656e64656e63696573223b613a303a7b7d733a333a22706870223b733a353a22352e322e34223b733a393a22626f6f747374726170223b693a303b7d);
INSERT INTO `system` VALUES('sites/all/modules/services/auth/services_oauth/services_oauth.module', 'services_oauth', 'module', '', 0, 0, -1, 0, 0x613a31313a7b733a343a226e616d65223b733a32303a224f417574682041757468656e7469636174696f6e223b733a31313a226465736372697074696f6e223b733a35333a2250726f7669646573204f417574682061757468656e7469636174696f6e20666f7220746865207365727669636573206d6f64756c65223b733a373a227061636b616765223b733a32353a225365727669636573202d2061757468656e7469636174696f6e223b733a31323a22646570656e64656e63696573223b613a323a7b693a303b733a383a227365727669636573223b693a313b733a31323a226f617574685f636f6d6d6f6e223b7d733a343a22636f7265223b733a333a22372e78223b733a333a22706870223b733a333a22352e32223b733a373a2276657273696f6e223b733a373a22372e782d332e35223b733a373a2270726f6a656374223b733a383a227365727669636573223b733a393a22646174657374616d70223b733a31303a2231333735323338363130223b733a353a2266696c6573223b613a303a7b7d733a393a22626f6f747374726170223b693a303b7d);
INSERT INTO `system` VALUES('sites/all/modules/services/servers/rest_server/rest_server.module', 'rest_server', 'module', '', 1, 0, 0, 0, 0x613a31313a7b733a343a226e616d65223b733a31313a225245535420536572766572223b733a31313a226465736372697074696f6e223b733a32343a2250726f766964657320616e2052455354207365727665722e223b733a373a227061636b616765223b733a31383a225365727669636573202d2073657276657273223b733a353a2266696c6573223b613a31313a7b693a303b733a31383a22726573745f7365727665722e6d6f64756c65223b693a313b733a32333a22696e636c756465732f524553545365727665722e696e63223b693a323b733a34323a22696e636c756465732f5365727669636573436f6e74656e74547970654e65676f746961746f722e696e63223b693a333b733a33383a22696e636c756465732f536572766963657352455354536572766572466163746f72792e696e63223b693a343b733a32383a22696e636c756465732f5365727669636573436f6e746578742e696e63223b693a353b733a32373a22696e636c756465732f53657276696365735061727365722e696e63223b693a363b733a33303a22696e636c756465732f5365727669636573466f726d61747465722e696e63223b693a373b733a33343a2274657374732f53657276696365735245535453657276657254657374732e74657374223b693a383b733a33343a2274657374732f726573745f7365727665725f6d6f636b5f636c61737365732e696e63223b693a393b733a31353a226c69622f62656e636f64652e706870223b693a31303b733a31373a226c69622f6d696d6570617273652e706870223b7d733a31323a22646570656e64656e63696573223b613a323a7b693a303b733a383a227365727669636573223b693a313b733a31373a226c696272617269657320283e3d322e7829223b7d733a343a22636f7265223b733a333a22372e78223b733a373a2276657273696f6e223b733a373a22372e782d332e35223b733a373a2270726f6a656374223b733a383a227365727669636573223b733a393a22646174657374616d70223b733a31303a2231333735323338363130223b733a333a22706870223b733a353a22352e322e34223b733a393a22626f6f747374726170223b693a303b7d);
INSERT INTO `system` VALUES('sites/all/modules/services/servers/xmlrpc_server/xmlrpc_server.module', 'xmlrpc_server', 'module', '', 0, 0, 0, 0, 0x613a31313a7b733a343a226e616d65223b733a31333a22584d4c52504320536572766572223b733a31313a226465736372697074696f6e223b733a32353a2250726f7669646573206120584d4c525043207365727665722e223b733a373a227061636b616765223b733a31383a225365727669636573202d2073657276657273223b733a353a2266696c6573223b613a313a7b693a303b733a32303a22786d6c7270635f7365727665722e6d6f64756c65223b7d733a31323a22646570656e64656e63696573223b613a313a7b693a303b733a383a227365727669636573223b7d733a343a22636f7265223b733a333a22372e78223b733a373a2276657273696f6e223b733a373a22372e782d332e35223b733a373a2270726f6a656374223b733a383a227365727669636573223b733a393a22646174657374616d70223b733a31303a2231333735323338363130223b733a333a22706870223b733a353a22352e322e34223b733a393a22626f6f747374726170223b693a303b7d);
INSERT INTO `system` VALUES('sites/all/modules/services/services.module', 'services', 'module', '', 1, 0, 7400, 0, 0x613a31323a7b733a343a226e616d65223b733a383a225365727669636573223b733a31313a226465736372697074696f6e223b733a34313a2250726f7669646520616e2041504920666f72206372656174696e67207765622073657276696365732e223b733a373a227061636b616765223b733a383a225365727669636573223b733a343a22636f7265223b733a333a22372e78223b733a333a22706870223b733a333a22352e78223b733a393a22636f6e666967757265223b733a32343a2261646d696e2f7374727563747572652f7365727669636573223b733a353a2266696c6573223b613a31393a7b693a303b733a32393a22696e636c756465732f73657276696365732e72756e74696d652e696e63223b693a313b733a34363a2274657374732f66756e6374696f6e616c2f4e6f41757468456e64706f696e745465737452756e6e65722e74657374223b693a323b733a34373a2274657374732f66756e6374696f6e616c2f53657276696365735265736f757263654e6f646554657374732e74657374223b693a333b733a34373a2274657374732f66756e6374696f6e616c2f53657276696365735265736f757263655573657254657374732e74657374223b693a343b733a34393a2274657374732f66756e6374696f6e616c2f53657276696365735265736f7572636553797374656d54657374732e74657374223b693a353b733a35303a2274657374732f66756e6374696f6e616c2f53657276696365735265736f75726365436f6d6d656e7454657374732e74657374223b693a363b733a35313a2274657374732f66756e6374696f6e616c2f53657276696365735265736f757263655461786f6e6f6d7954657374732e74657374223b693a373b733a34373a2274657374732f66756e6374696f6e616c2f53657276696365735265736f7572636546696c6554657374732e74657374223b693a383b733a35313a2274657374732f66756e6374696f6e616c2f53657276696365735265736f7572636544697361626c656454657374732e74657374223b693a393b733a34333a2274657374732f66756e6374696f6e616c2f5365727669636573456e64706f696e7454657374732e74657374223b693a31303b733a34313a2274657374732f66756e6374696f6e616c2f536572766963657350617273657254657374732e74657374223b693a31313b733a34303a2274657374732f66756e6374696f6e616c2f5365727669636573416c69617354657374732e74657374223b693a31323b733a34313a2274657374732f66756e6374696f6e616c2f5365727669636573584d4c52504354657374732e74657374223b693a31333b733a34323a2274657374732f66756e6374696f6e616c2f536572766963657356657273696f6e54657374732e74657374223b693a31343b733a34343a2274657374732f66756e6374696f6e616c2f5365727669636573417267756d656e747354657374732e74657374223b693a31353b733a34333a2274657374732f66756e6374696f6e616c2f5365727669636573536563757269747954657374732e74657374223b693a31363b733a34303a2274657374732f756e69742f5365727669636573537079634c69627261727954657374732e74657374223b693a31373b733a32393a2274657374732f75692f5365727669636573554954657374732e74657374223b693a31383b733a31393a2274657374732f73657276696365732e74657374223b7d733a31323a22646570656e64656e63696573223b613a313a7b693a303b733a363a2263746f6f6c73223b7d733a373a2276657273696f6e223b733a373a22372e782d332e35223b733a373a2270726f6a656374223b733a383a227365727669636573223b733a393a22646174657374616d70223b733a31303a2231333735323338363130223b733a393a22626f6f747374726170223b693a303b7d);
INSERT INTO `system` VALUES('sites/all/modules/services/tests/services_test_resource/services_test_resource.module', 'services_test_resource', 'module', '', 0, 0, -1, 0, 0x613a31323a7b733a343a226e616d65223b733a32323a2253657276696365732054657374205265736f75726365223b733a31313a226465736372697074696f6e223b733a35313a2250726f766964652074657374206d6574686f647320746f20636865636b20646966666572656e7420736974756174696f6e732e223b733a373a227061636b616765223b733a383a225365727669636573223b733a343a22636f7265223b733a333a22372e78223b733a333a22706870223b733a333a22352e78223b733a363a2268696464656e223b623a313b733a31323a22646570656e64656e63696573223b613a313a7b693a303b733a383a227365727669636573223b7d733a373a2276657273696f6e223b733a373a22372e782d332e35223b733a373a2270726f6a656374223b733a383a227365727669636573223b733a393a22646174657374616d70223b733a31303a2231333735323338363130223b733a353a2266696c6573223b613a303a7b7d733a393a22626f6f747374726170223b693a303b7d);
INSERT INTO `system` VALUES('sites/all/modules/services_views/services_views.module', 'services_views', 'module', '', 1, 0, 0, 0, 0x613a31313a7b733a343a226e616d65223b733a31343a225365727669636573205669657773223b733a31313a226465736372697074696f6e223b733a33353a224275696c64207365727669636520656e64706f696e747320776974682056696577732e223b733a373a227061636b616765223b733a383a225365727669636573223b733a343a22636f7265223b733a333a22372e78223b733a31323a22646570656e64656e63696573223b613a323a7b693a303b733a383a227365727669636573223b693a313b733a353a227669657773223b7d733a353a2266696c6573223b613a313a7b693a303b733a34383a22696e636c756465732f76696577732f76696577735f706c7567696e5f646973706c61795f73657276696365732e696e63223b7d733a373a2276657273696f6e223b733a31333a22372e782d312e302d6265746132223b733a373a2270726f6a656374223b733a31343a2273657276696365735f7669657773223b733a393a22646174657374616d70223b733a31303a2231333339353633343135223b733a333a22706870223b733a353a22352e322e34223b733a393a22626f6f747374726170223b693a303b7d);
INSERT INTO `system` VALUES('sites/all/modules/views/tests/views_test.module', 'views_test', 'module', '', 0, 0, -1, 0, 0x613a31323a7b733a343a226e616d65223b733a31303a2256696577732054657374223b733a31313a226465736372697074696f6e223b733a32323a2254657374206d6f64756c6520666f722056696577732e223b733a373a227061636b616765223b733a353a225669657773223b733a343a22636f7265223b733a333a22372e78223b733a31323a22646570656e64656e63696573223b613a313a7b693a303b733a353a227669657773223b7d733a363a2268696464656e223b623a313b733a373a2276657273696f6e223b733a373a22372e782d332e37223b733a373a2270726f6a656374223b733a353a227669657773223b733a393a22646174657374616d70223b733a31303a2231333635343939323336223b733a333a22706870223b733a353a22352e322e34223b733a353a2266696c6573223b613a303a7b7d733a393a22626f6f747374726170223b693a303b7d);
INSERT INTO `system` VALUES('sites/all/modules/views/views.module', 'views', 'module', '', 1, 0, 7301, 10, 0x613a31323a7b733a343a226e616d65223b733a353a225669657773223b733a31313a226465736372697074696f6e223b733a35353a2243726561746520637573746f6d697a6564206c6973747320616e6420717565726965732066726f6d20796f75722064617461626173652e223b733a373a227061636b616765223b733a353a225669657773223b733a343a22636f7265223b733a333a22372e78223b733a333a22706870223b733a333a22352e32223b733a31313a227374796c65736865657473223b613a313a7b733a333a22616c6c223b613a313a7b733a31333a226373732f76696577732e637373223b733a33373a2273697465732f616c6c2f6d6f64756c65732f76696577732f6373732f76696577732e637373223b7d7d733a31323a22646570656e64656e63696573223b613a313a7b693a303b733a363a2263746f6f6c73223b7d733a353a2266696c6573223b613a3239373a7b693a303b733a33313a2268616e646c6572732f76696577735f68616e646c65725f617265612e696e63223b693a313b733a33383a2268616e646c6572732f76696577735f68616e646c65725f617265615f726573756c742e696e63223b693a323b733a33363a2268616e646c6572732f76696577735f68616e646c65725f617265615f746578742e696e63223b693a333b733a34333a2268616e646c6572732f76696577735f68616e646c65725f617265615f746578745f637573746f6d2e696e63223b693a343b733a33363a2268616e646c6572732f76696577735f68616e646c65725f617265615f766965772e696e63223b693a353b733a33353a2268616e646c6572732f76696577735f68616e646c65725f617267756d656e742e696e63223b693a363b733a34303a2268616e646c6572732f76696577735f68616e646c65725f617267756d656e745f646174652e696e63223b693a373b733a34333a2268616e646c6572732f76696577735f68616e646c65725f617267756d656e745f666f726d756c612e696e63223b693a383b733a34373a2268616e646c6572732f76696577735f68616e646c65725f617267756d656e745f6d616e795f746f5f6f6e652e696e63223b693a393b733a34303a2268616e646c6572732f76696577735f68616e646c65725f617267756d656e745f6e756c6c2e696e63223b693a31303b733a34333a2268616e646c6572732f76696577735f68616e646c65725f617267756d656e745f6e756d657269632e696e63223b693a31313b733a34323a2268616e646c6572732f76696577735f68616e646c65725f617267756d656e745f737472696e672e696e63223b693a31323b733a35323a2268616e646c6572732f76696577735f68616e646c65725f617267756d656e745f67726f75705f62795f6e756d657269632e696e63223b693a31333b733a33323a2268616e646c6572732f76696577735f68616e646c65725f6669656c642e696e63223b693a31343b733a34303a2268616e646c6572732f76696577735f68616e646c65725f6669656c645f636f756e7465722e696e63223b693a31353b733a34303a2268616e646c6572732f76696577735f68616e646c65725f6669656c645f626f6f6c65616e2e696e63223b693a31363b733a34393a2268616e646c6572732f76696577735f68616e646c65725f6669656c645f636f6e7465787475616c5f6c696e6b732e696e63223b693a31373b733a33393a2268616e646c6572732f76696577735f68616e646c65725f6669656c645f637573746f6d2e696e63223b693a31383b733a33373a2268616e646c6572732f76696577735f68616e646c65725f6669656c645f646174652e696e63223b693a31393b733a33393a2268616e646c6572732f76696577735f68616e646c65725f6669656c645f656e746974792e696e63223b693a32303b733a33393a2268616e646c6572732f76696577735f68616e646c65725f6669656c645f6d61726b75702e696e63223b693a32313b733a33373a2268616e646c6572732f76696577735f68616e646c65725f6669656c645f6d6174682e696e63223b693a32323b733a34303a2268616e646c6572732f76696577735f68616e646c65725f6669656c645f6e756d657269632e696e63223b693a32333b733a34373a2268616e646c6572732f76696577735f68616e646c65725f6669656c645f70726572656e6465725f6c6973742e696e63223b693a32343b733a34363a2268616e646c6572732f76696577735f68616e646c65725f6669656c645f74696d655f696e74657276616c2e696e63223b693a32353b733a34333a2268616e646c6572732f76696577735f68616e646c65725f6669656c645f73657269616c697a65642e696e63223b693a32363b733a34353a2268616e646c6572732f76696577735f68616e646c65725f6669656c645f6d616368696e655f6e616d652e696e63223b693a32373b733a33363a2268616e646c6572732f76696577735f68616e646c65725f6669656c645f75726c2e696e63223b693a32383b733a33333a2268616e646c6572732f76696577735f68616e646c65725f66696c7465722e696e63223b693a32393b733a35303a2268616e646c6572732f76696577735f68616e646c65725f66696c7465725f626f6f6c65616e5f6f70657261746f722e696e63223b693a33303b733a35373a2268616e646c6572732f76696577735f68616e646c65725f66696c7465725f626f6f6c65616e5f6f70657261746f725f737472696e672e696e63223b693a33313b733a34313a2268616e646c6572732f76696577735f68616e646c65725f66696c7465725f636f6d62696e652e696e63223b693a33323b733a33383a2268616e646c6572732f76696577735f68616e646c65725f66696c7465725f646174652e696e63223b693a33333b733a34323a2268616e646c6572732f76696577735f68616e646c65725f66696c7465725f657175616c6974792e696e63223b693a33343b733a34373a2268616e646c6572732f76696577735f68616e646c65725f66696c7465725f656e746974795f62756e646c652e696e63223b693a33353b733a35303a2268616e646c6572732f76696577735f68616e646c65725f66696c7465725f67726f75705f62795f6e756d657269632e696e63223b693a33363b733a34353a2268616e646c6572732f76696577735f68616e646c65725f66696c7465725f696e5f6f70657261746f722e696e63223b693a33373b733a34353a2268616e646c6572732f76696577735f68616e646c65725f66696c7465725f6d616e795f746f5f6f6e652e696e63223b693a33383b733a34313a2268616e646c6572732f76696577735f68616e646c65725f66696c7465725f6e756d657269632e696e63223b693a33393b733a34303a2268616e646c6572732f76696577735f68616e646c65725f66696c7465725f737472696e672e696e63223b693a34303b733a33393a2268616e646c6572732f76696577735f68616e646c65725f72656c6174696f6e736869702e696e63223b693a34313b733a35333a2268616e646c6572732f76696577735f68616e646c65725f72656c6174696f6e736869705f67726f7570776973655f6d61782e696e63223b693a34323b733a33313a2268616e646c6572732f76696577735f68616e646c65725f736f72742e696e63223b693a34333b733a33363a2268616e646c6572732f76696577735f68616e646c65725f736f72745f646174652e696e63223b693a34343b733a33393a2268616e646c6572732f76696577735f68616e646c65725f736f72745f666f726d756c612e696e63223b693a34353b733a34383a2268616e646c6572732f76696577735f68616e646c65725f736f72745f67726f75705f62795f6e756d657269632e696e63223b693a34363b733a34363a2268616e646c6572732f76696577735f68616e646c65725f736f72745f6d656e755f6869657261726368792e696e63223b693a34373b733a33383a2268616e646c6572732f76696577735f68616e646c65725f736f72745f72616e646f6d2e696e63223b693a34383b733a31373a22696e636c756465732f626173652e696e63223b693a34393b733a32313a22696e636c756465732f68616e646c6572732e696e63223b693a35303b733a32303a22696e636c756465732f706c7567696e732e696e63223b693a35313b733a31373a22696e636c756465732f766965772e696e63223b693a35323b733a36303a226d6f64756c65732f61676772656761746f722f76696577735f68616e646c65725f617267756d656e745f61676772656761746f725f6669642e696e63223b693a35333b733a36303a226d6f64756c65732f61676772656761746f722f76696577735f68616e646c65725f617267756d656e745f61676772656761746f725f6969642e696e63223b693a35343b733a36393a226d6f64756c65732f61676772656761746f722f76696577735f68616e646c65725f617267756d656e745f61676772656761746f725f63617465676f72795f6369642e696e63223b693a35353b733a36343a226d6f64756c65732f61676772656761746f722f76696577735f68616e646c65725f6669656c645f61676772656761746f725f7469746c655f6c696e6b2e696e63223b693a35363b733a36323a226d6f64756c65732f61676772656761746f722f76696577735f68616e646c65725f6669656c645f61676772656761746f725f63617465676f72792e696e63223b693a35373b733a37303a226d6f64756c65732f61676772656761746f722f76696577735f68616e646c65725f6669656c645f61676772656761746f725f6974656d5f6465736372697074696f6e2e696e63223b693a35383b733a35373a226d6f64756c65732f61676772656761746f722f76696577735f68616e646c65725f6669656c645f61676772656761746f725f7873732e696e63223b693a35393b733a36373a226d6f64756c65732f61676772656761746f722f76696577735f68616e646c65725f66696c7465725f61676772656761746f725f63617465676f72795f6369642e696e63223b693a36303b733a35343a226d6f64756c65732f61676772656761746f722f76696577735f706c7567696e5f726f775f61676772656761746f725f7273732e696e63223b693a36313b733a35363a226d6f64756c65732f626f6f6b2f76696577735f706c7567696e5f617267756d656e745f64656661756c745f626f6f6b5f726f6f742e696e63223b693a36323b733a35393a226d6f64756c65732f636f6d6d656e742f76696577735f68616e646c65725f617267756d656e745f636f6d6d656e745f757365725f7569642e696e63223b693a36333b733a34373a226d6f64756c65732f636f6d6d656e742f76696577735f68616e646c65725f6669656c645f636f6d6d656e742e696e63223b693a36343b733a35333a226d6f64756c65732f636f6d6d656e742f76696577735f68616e646c65725f6669656c645f636f6d6d656e745f64657074682e696e63223b693a36353b733a35323a226d6f64756c65732f636f6d6d656e742f76696577735f68616e646c65725f6669656c645f636f6d6d656e745f6c696e6b2e696e63223b693a36363b733a36303a226d6f64756c65732f636f6d6d656e742f76696577735f68616e646c65725f6669656c645f636f6d6d656e745f6c696e6b5f617070726f76652e696e63223b693a36373b733a35393a226d6f64756c65732f636f6d6d656e742f76696577735f68616e646c65725f6669656c645f636f6d6d656e745f6c696e6b5f64656c6574652e696e63223b693a36383b733a35373a226d6f64756c65732f636f6d6d656e742f76696577735f68616e646c65725f6669656c645f636f6d6d656e745f6c696e6b5f656469742e696e63223b693a36393b733a35383a226d6f64756c65732f636f6d6d656e742f76696577735f68616e646c65725f6669656c645f636f6d6d656e745f6c696e6b5f7265706c792e696e63223b693a37303b733a35373a226d6f64756c65732f636f6d6d656e742f76696577735f68616e646c65725f6669656c645f636f6d6d656e745f6e6f64655f6c696e6b2e696e63223b693a37313b733a35363a226d6f64756c65732f636f6d6d656e742f76696577735f68616e646c65725f6669656c645f636f6d6d656e745f757365726e616d652e696e63223b693a37323b733a36313a226d6f64756c65732f636f6d6d656e742f76696577735f68616e646c65725f6669656c645f6e63735f6c6173745f636f6d6d656e745f6e616d652e696e63223b693a37333b733a35363a226d6f64756c65732f636f6d6d656e742f76696577735f68616e646c65725f6669656c645f6e63735f6c6173745f757064617465642e696e63223b693a37343b733a35323a226d6f64756c65732f636f6d6d656e742f76696577735f68616e646c65725f6669656c645f6e6f64655f636f6d6d656e742e696e63223b693a37353b733a35373a226d6f64756c65732f636f6d6d656e742f76696577735f68616e646c65725f6669656c645f6e6f64655f6e65775f636f6d6d656e74732e696e63223b693a37363b733a36323a226d6f64756c65732f636f6d6d656e742f76696577735f68616e646c65725f6669656c645f6c6173745f636f6d6d656e745f74696d657374616d702e696e63223b693a37373b733a35373a226d6f64756c65732f636f6d6d656e742f76696577735f68616e646c65725f66696c7465725f636f6d6d656e745f757365725f7569642e696e63223b693a37383b733a35373a226d6f64756c65732f636f6d6d656e742f76696577735f68616e646c65725f66696c7465725f6e63735f6c6173745f757064617465642e696e63223b693a37393b733a35333a226d6f64756c65732f636f6d6d656e742f76696577735f68616e646c65725f66696c7465725f6e6f64655f636f6d6d656e742e696e63223b693a38303b733a35333a226d6f64756c65732f636f6d6d656e742f76696577735f68616e646c65725f736f72745f636f6d6d656e745f7468726561642e696e63223b693a38313b733a36303a226d6f64756c65732f636f6d6d656e742f76696577735f68616e646c65725f736f72745f6e63735f6c6173745f636f6d6d656e745f6e616d652e696e63223b693a38323b733a35353a226d6f64756c65732f636f6d6d656e742f76696577735f68616e646c65725f736f72745f6e63735f6c6173745f757064617465642e696e63223b693a38333b733a34383a226d6f64756c65732f636f6d6d656e742f76696577735f706c7567696e5f726f775f636f6d6d656e745f7273732e696e63223b693a38343b733a34393a226d6f64756c65732f636f6d6d656e742f76696577735f706c7567696e5f726f775f636f6d6d656e745f766965772e696e63223b693a38353b733a35323a226d6f64756c65732f636f6e746163742f76696577735f68616e646c65725f6669656c645f636f6e746163745f6c696e6b2e696e63223b693a38363b733a34333a226d6f64756c65732f6669656c642f76696577735f68616e646c65725f6669656c645f6669656c642e696e63223b693a38373b733a35393a226d6f64756c65732f6669656c642f76696577735f68616e646c65725f72656c6174696f6e736869705f656e746974795f726576657273652e696e63223b693a38383b733a35313a226d6f64756c65732f6669656c642f76696577735f68616e646c65725f617267756d656e745f6669656c645f6c6973742e696e63223b693a38393b733a35383a226d6f64756c65732f6669656c642f76696577735f68616e646c65725f617267756d656e745f6669656c645f6c6973745f737472696e672e696e63223b693a39303b733a34393a226d6f64756c65732f6669656c642f76696577735f68616e646c65725f66696c7465725f6669656c645f6c6973742e696e63223b693a39313b733a35373a226d6f64756c65732f66696c7465722f76696577735f68616e646c65725f6669656c645f66696c7465725f666f726d61745f6e616d652e696e63223b693a39323b733a35323a226d6f64756c65732f6c6f63616c652f76696577735f68616e646c65725f6669656c645f6e6f64655f6c616e67756167652e696e63223b693a39333b733a35333a226d6f64756c65732f6c6f63616c652f76696577735f68616e646c65725f66696c7465725f6e6f64655f6c616e67756167652e696e63223b693a39343b733a35343a226d6f64756c65732f6c6f63616c652f76696577735f68616e646c65725f617267756d656e745f6c6f63616c655f67726f75702e696e63223b693a39353b733a35373a226d6f64756c65732f6c6f63616c652f76696577735f68616e646c65725f617267756d656e745f6c6f63616c655f6c616e67756167652e696e63223b693a39363b733a35313a226d6f64756c65732f6c6f63616c652f76696577735f68616e646c65725f6669656c645f6c6f63616c655f67726f75702e696e63223b693a39373b733a35343a226d6f64756c65732f6c6f63616c652f76696577735f68616e646c65725f6669656c645f6c6f63616c655f6c616e67756167652e696e63223b693a39383b733a35353a226d6f64756c65732f6c6f63616c652f76696577735f68616e646c65725f6669656c645f6c6f63616c655f6c696e6b5f656469742e696e63223b693a39393b733a35323a226d6f64756c65732f6c6f63616c652f76696577735f68616e646c65725f66696c7465725f6c6f63616c655f67726f75702e696e63223b693a3130303b733a35353a226d6f64756c65732f6c6f63616c652f76696577735f68616e646c65725f66696c7465725f6c6f63616c655f6c616e67756167652e696e63223b693a3130313b733a35343a226d6f64756c65732f6c6f63616c652f76696577735f68616e646c65725f66696c7465725f6c6f63616c655f76657273696f6e2e696e63223b693a3130323b733a35333a226d6f64756c65732f6e6f64652f76696577735f68616e646c65725f617267756d656e745f64617465735f766172696f75732e696e63223b693a3130333b733a35333a226d6f64756c65732f6e6f64652f76696577735f68616e646c65725f617267756d656e745f6e6f64655f6c616e67756167652e696e63223b693a3130343b733a34383a226d6f64756c65732f6e6f64652f76696577735f68616e646c65725f617267756d656e745f6e6f64655f6e69642e696e63223b693a3130353b733a34393a226d6f64756c65732f6e6f64652f76696577735f68616e646c65725f617267756d656e745f6e6f64655f747970652e696e63223b693a3130363b733a34383a226d6f64756c65732f6e6f64652f76696577735f68616e646c65725f617267756d656e745f6e6f64655f7669642e696e63223b693a3130373b733a35373a226d6f64756c65732f6e6f64652f76696577735f68616e646c65725f617267756d656e745f6e6f64655f7569645f7265766973696f6e2e696e63223b693a3130383b733a35393a226d6f64756c65732f6e6f64652f76696577735f68616e646c65725f6669656c645f686973746f72795f757365725f74696d657374616d702e696e63223b693a3130393b733a34313a226d6f64756c65732f6e6f64652f76696577735f68616e646c65725f6669656c645f6e6f64652e696e63223b693a3131303b733a34363a226d6f64756c65732f6e6f64652f76696577735f68616e646c65725f6669656c645f6e6f64655f6c696e6b2e696e63223b693a3131313b733a35333a226d6f64756c65732f6e6f64652f76696577735f68616e646c65725f6669656c645f6e6f64655f6c696e6b5f64656c6574652e696e63223b693a3131323b733a35313a226d6f64756c65732f6e6f64652f76696577735f68616e646c65725f6669656c645f6e6f64655f6c696e6b5f656469742e696e63223b693a3131333b733a35303a226d6f64756c65732f6e6f64652f76696577735f68616e646c65725f6669656c645f6e6f64655f7265766973696f6e2e696e63223b693a3131343b733a35353a226d6f64756c65732f6e6f64652f76696577735f68616e646c65725f6669656c645f6e6f64655f7265766973696f6e5f6c696e6b2e696e63223b693a3131353b733a36323a226d6f64756c65732f6e6f64652f76696577735f68616e646c65725f6669656c645f6e6f64655f7265766973696f6e5f6c696e6b5f64656c6574652e696e63223b693a3131363b733a36323a226d6f64756c65732f6e6f64652f76696577735f68616e646c65725f6669656c645f6e6f64655f7265766973696f6e5f6c696e6b5f7265766572742e696e63223b693a3131373b733a34363a226d6f64756c65732f6e6f64652f76696577735f68616e646c65725f6669656c645f6e6f64655f706174682e696e63223b693a3131383b733a34363a226d6f64756c65732f6e6f64652f76696577735f68616e646c65725f6669656c645f6e6f64655f747970652e696e63223b693a3131393b733a36303a226d6f64756c65732f6e6f64652f76696577735f68616e646c65725f66696c7465725f686973746f72795f757365725f74696d657374616d702e696e63223b693a3132303b733a34393a226d6f64756c65732f6e6f64652f76696577735f68616e646c65725f66696c7465725f6e6f64655f6163636573732e696e63223b693a3132313b733a34393a226d6f64756c65732f6e6f64652f76696577735f68616e646c65725f66696c7465725f6e6f64655f7374617475732e696e63223b693a3132323b733a34373a226d6f64756c65732f6e6f64652f76696577735f68616e646c65725f66696c7465725f6e6f64655f747970652e696e63223b693a3132333b733a35353a226d6f64756c65732f6e6f64652f76696577735f68616e646c65725f66696c7465725f6e6f64655f7569645f7265766973696f6e2e696e63223b693a3132343b733a35313a226d6f64756c65732f6e6f64652f76696577735f706c7567696e5f617267756d656e745f64656661756c745f6e6f64652e696e63223b693a3132353b733a35323a226d6f64756c65732f6e6f64652f76696577735f706c7567696e5f617267756d656e745f76616c69646174655f6e6f64652e696e63223b693a3132363b733a34323a226d6f64756c65732f6e6f64652f76696577735f706c7567696e5f726f775f6e6f64655f7273732e696e63223b693a3132373b733a34333a226d6f64756c65732f6e6f64652f76696577735f706c7567696e5f726f775f6e6f64655f766965772e696e63223b693a3132383b733a35323a226d6f64756c65732f70726f66696c652f76696577735f68616e646c65725f6669656c645f70726f66696c655f646174652e696e63223b693a3132393b733a35323a226d6f64756c65732f70726f66696c652f76696577735f68616e646c65725f6669656c645f70726f66696c655f6c6973742e696e63223b693a3133303b733a35383a226d6f64756c65732f70726f66696c652f76696577735f68616e646c65725f66696c7465725f70726f66696c655f73656c656374696f6e2e696e63223b693a3133313b733a34383a226d6f64756c65732f7365617263682f76696577735f68616e646c65725f617267756d656e745f7365617263682e696e63223b693a3133323b733a35313a226d6f64756c65732f7365617263682f76696577735f68616e646c65725f6669656c645f7365617263685f73636f72652e696e63223b693a3133333b733a34363a226d6f64756c65732f7365617263682f76696577735f68616e646c65725f66696c7465725f7365617263682e696e63223b693a3133343b733a35303a226d6f64756c65732f7365617263682f76696577735f68616e646c65725f736f72745f7365617263685f73636f72652e696e63223b693a3133353b733a34373a226d6f64756c65732f7365617263682f76696577735f706c7567696e5f726f775f7365617263685f766965772e696e63223b693a3133363b733a35373a226d6f64756c65732f737461746973746963732f76696577735f68616e646c65725f6669656c645f6163636573736c6f675f706174682e696e63223b693a3133373b733a35303a226d6f64756c65732f73797374656d2f76696577735f68616e646c65725f617267756d656e745f66696c655f6669642e696e63223b693a3133383b733a34333a226d6f64756c65732f73797374656d2f76696577735f68616e646c65725f6669656c645f66696c652e696e63223b693a3133393b733a35333a226d6f64756c65732f73797374656d2f76696577735f68616e646c65725f6669656c645f66696c655f657874656e73696f6e2e696e63223b693a3134303b733a35323a226d6f64756c65732f73797374656d2f76696577735f68616e646c65725f6669656c645f66696c655f66696c656d696d652e696e63223b693a3134313b733a34373a226d6f64756c65732f73797374656d2f76696577735f68616e646c65725f6669656c645f66696c655f7572692e696e63223b693a3134323b733a35303a226d6f64756c65732f73797374656d2f76696577735f68616e646c65725f6669656c645f66696c655f7374617475732e696e63223b693a3134333b733a35313a226d6f64756c65732f73797374656d2f76696577735f68616e646c65725f66696c7465725f66696c655f7374617475732e696e63223b693a3134343b733a35323a226d6f64756c65732f7461786f6e6f6d792f76696577735f68616e646c65725f617267756d656e745f7461786f6e6f6d792e696e63223b693a3134353b733a35373a226d6f64756c65732f7461786f6e6f6d792f76696577735f68616e646c65725f617267756d656e745f7465726d5f6e6f64655f7469642e696e63223b693a3134363b733a36333a226d6f64756c65732f7461786f6e6f6d792f76696577735f68616e646c65725f617267756d656e745f7465726d5f6e6f64655f7469645f64657074682e696e63223b693a3134373b733a37323a226d6f64756c65732f7461786f6e6f6d792f76696577735f68616e646c65725f617267756d656e745f7465726d5f6e6f64655f7469645f64657074685f6d6f6469666965722e696e63223b693a3134383b733a35383a226d6f64756c65732f7461786f6e6f6d792f76696577735f68616e646c65725f617267756d656e745f766f636162756c6172795f7669642e696e63223b693a3134393b733a36373a226d6f64756c65732f7461786f6e6f6d792f76696577735f68616e646c65725f617267756d656e745f766f636162756c6172795f6d616368696e655f6e616d652e696e63223b693a3135303b733a34393a226d6f64756c65732f7461786f6e6f6d792f76696577735f68616e646c65725f6669656c645f7461786f6e6f6d792e696e63223b693a3135313b733a35343a226d6f64756c65732f7461786f6e6f6d792f76696577735f68616e646c65725f6669656c645f7465726d5f6e6f64655f7469642e696e63223b693a3135323b733a35353a226d6f64756c65732f7461786f6e6f6d792f76696577735f68616e646c65725f6669656c645f7465726d5f6c696e6b5f656469742e696e63223b693a3135333b733a35353a226d6f64756c65732f7461786f6e6f6d792f76696577735f68616e646c65725f66696c7465725f7465726d5f6e6f64655f7469642e696e63223b693a3135343b733a36313a226d6f64756c65732f7461786f6e6f6d792f76696577735f68616e646c65725f66696c7465725f7465726d5f6e6f64655f7469645f64657074682e696e63223b693a3135353b733a35363a226d6f64756c65732f7461786f6e6f6d792f76696577735f68616e646c65725f66696c7465725f766f636162756c6172795f7669642e696e63223b693a3135363b733a36353a226d6f64756c65732f7461786f6e6f6d792f76696577735f68616e646c65725f66696c7465725f766f636162756c6172795f6d616368696e655f6e616d652e696e63223b693a3135373b733a36323a226d6f64756c65732f7461786f6e6f6d792f76696577735f68616e646c65725f72656c6174696f6e736869705f6e6f64655f7465726d5f646174612e696e63223b693a3135383b733a36353a226d6f64756c65732f7461786f6e6f6d792f76696577735f706c7567696e5f617267756d656e745f76616c69646174655f7461786f6e6f6d795f7465726d2e696e63223b693a3135393b733a36333a226d6f64756c65732f7461786f6e6f6d792f76696577735f706c7567696e5f617267756d656e745f64656661756c745f7461786f6e6f6d795f7469642e696e63223b693a3136303b733a36373a226d6f64756c65732f747261636b65722f76696577735f68616e646c65725f617267756d656e745f747261636b65725f636f6d6d656e745f757365725f7569642e696e63223b693a3136313b733a36353a226d6f64756c65732f747261636b65722f76696577735f68616e646c65725f66696c7465725f747261636b65725f636f6d6d656e745f757365725f7569642e696e63223b693a3136323b733a36353a226d6f64756c65732f747261636b65722f76696577735f68616e646c65725f66696c7465725f747261636b65725f626f6f6c65616e5f6f70657261746f722e696e63223b693a3136333b733a35313a226d6f64756c65732f73797374656d2f76696577735f68616e646c65725f66696c7465725f73797374656d5f747970652e696e63223b693a3136343b733a35363a226d6f64756c65732f7472616e736c6174696f6e2f76696577735f68616e646c65725f617267756d656e745f6e6f64655f746e69642e696e63223b693a3136353b733a36333a226d6f64756c65732f7472616e736c6174696f6e2f76696577735f68616e646c65725f6669656c645f6e6f64655f6c696e6b5f7472616e736c6174652e696e63223b693a3136363b733a36353a226d6f64756c65732f7472616e736c6174696f6e2f76696577735f68616e646c65725f6669656c645f6e6f64655f7472616e736c6174696f6e5f6c696e6b2e696e63223b693a3136373b733a35343a226d6f64756c65732f7472616e736c6174696f6e2f76696577735f68616e646c65725f66696c7465725f6e6f64655f746e69642e696e63223b693a3136383b733a36303a226d6f64756c65732f7472616e736c6174696f6e2f76696577735f68616e646c65725f66696c7465725f6e6f64655f746e69645f6368696c642e696e63223b693a3136393b733a36323a226d6f64756c65732f7472616e736c6174696f6e2f76696577735f68616e646c65725f72656c6174696f6e736869705f7472616e736c6174696f6e2e696e63223b693a3137303b733a34383a226d6f64756c65732f757365722f76696577735f68616e646c65725f617267756d656e745f757365725f7569642e696e63223b693a3137313b733a35353a226d6f64756c65732f757365722f76696577735f68616e646c65725f617267756d656e745f75736572735f726f6c65735f7269642e696e63223b693a3137323b733a34313a226d6f64756c65732f757365722f76696577735f68616e646c65725f6669656c645f757365722e696e63223b693a3137333b733a35303a226d6f64756c65732f757365722f76696577735f68616e646c65725f6669656c645f757365725f6c616e67756167652e696e63223b693a3137343b733a34363a226d6f64756c65732f757365722f76696577735f68616e646c65725f6669656c645f757365725f6c696e6b2e696e63223b693a3137353b733a35333a226d6f64756c65732f757365722f76696577735f68616e646c65725f6669656c645f757365725f6c696e6b5f63616e63656c2e696e63223b693a3137363b733a35313a226d6f64756c65732f757365722f76696577735f68616e646c65725f6669656c645f757365725f6c696e6b5f656469742e696e63223b693a3137373b733a34363a226d6f64756c65732f757365722f76696577735f68616e646c65725f6669656c645f757365725f6d61696c2e696e63223b693a3137383b733a34363a226d6f64756c65732f757365722f76696577735f68616e646c65725f6669656c645f757365725f6e616d652e696e63223b693a3137393b733a35333a226d6f64756c65732f757365722f76696577735f68616e646c65725f6669656c645f757365725f7065726d697373696f6e732e696e63223b693a3138303b733a34393a226d6f64756c65732f757365722f76696577735f68616e646c65725f6669656c645f757365725f706963747572652e696e63223b693a3138313b733a34373a226d6f64756c65732f757365722f76696577735f68616e646c65725f6669656c645f757365725f726f6c65732e696e63223b693a3138323b733a35303a226d6f64756c65732f757365722f76696577735f68616e646c65725f66696c7465725f757365725f63757272656e742e696e63223b693a3138333b733a34373a226d6f64756c65732f757365722f76696577735f68616e646c65725f66696c7465725f757365725f6e616d652e696e63223b693a3138343b733a35343a226d6f64756c65732f757365722f76696577735f68616e646c65725f66696c7465725f757365725f7065726d697373696f6e732e696e63223b693a3138353b733a34383a226d6f64756c65732f757365722f76696577735f68616e646c65725f66696c7465725f757365725f726f6c65732e696e63223b693a3138363b733a35393a226d6f64756c65732f757365722f76696577735f706c7567696e5f617267756d656e745f64656661756c745f63757272656e745f757365722e696e63223b693a3138373b733a35313a226d6f64756c65732f757365722f76696577735f706c7567696e5f617267756d656e745f64656661756c745f757365722e696e63223b693a3138383b733a35323a226d6f64756c65732f757365722f76696577735f706c7567696e5f617267756d656e745f76616c69646174655f757365722e696e63223b693a3138393b733a34333a226d6f64756c65732f757365722f76696577735f706c7567696e5f726f775f757365725f766965772e696e63223b693a3139303b733a33313a22706c7567696e732f76696577735f706c7567696e5f6163636573732e696e63223b693a3139313b733a33363a22706c7567696e732f76696577735f706c7567696e5f6163636573735f6e6f6e652e696e63223b693a3139323b733a33363a22706c7567696e732f76696577735f706c7567696e5f6163636573735f7065726d2e696e63223b693a3139333b733a33363a22706c7567696e732f76696577735f706c7567696e5f6163636573735f726f6c652e696e63223b693a3139343b733a34313a22706c7567696e732f76696577735f706c7567696e5f617267756d656e745f64656661756c742e696e63223b693a3139353b733a34353a22706c7567696e732f76696577735f706c7567696e5f617267756d656e745f64656661756c745f7068702e696e63223b693a3139363b733a34373a22706c7567696e732f76696577735f706c7567696e5f617267756d656e745f64656661756c745f66697865642e696e63223b693a3139373b733a34353a22706c7567696e732f76696577735f706c7567696e5f617267756d656e745f64656661756c745f7261772e696e63223b693a3139383b733a34323a22706c7567696e732f76696577735f706c7567696e5f617267756d656e745f76616c69646174652e696e63223b693a3139393b733a35303a22706c7567696e732f76696577735f706c7567696e5f617267756d656e745f76616c69646174655f6e756d657269632e696e63223b693a3230303b733a34363a22706c7567696e732f76696577735f706c7567696e5f617267756d656e745f76616c69646174655f7068702e696e63223b693a3230313b733a33303a22706c7567696e732f76696577735f706c7567696e5f63616368652e696e63223b693a3230323b733a33353a22706c7567696e732f76696577735f706c7567696e5f63616368655f6e6f6e652e696e63223b693a3230333b733a33353a22706c7567696e732f76696577735f706c7567696e5f63616368655f74696d652e696e63223b693a3230343b733a33323a22706c7567696e732f76696577735f706c7567696e5f646973706c61792e696e63223b693a3230353b733a34333a22706c7567696e732f76696577735f706c7567696e5f646973706c61795f6174746163686d656e742e696e63223b693a3230363b733a33383a22706c7567696e732f76696577735f706c7567696e5f646973706c61795f626c6f636b2e696e63223b693a3230373b733a34303a22706c7567696e732f76696577735f706c7567696e5f646973706c61795f64656661756c742e696e63223b693a3230383b733a33383a22706c7567696e732f76696577735f706c7567696e5f646973706c61795f656d6265642e696e63223b693a3230393b733a34313a22706c7567696e732f76696577735f706c7567696e5f646973706c61795f657874656e6465722e696e63223b693a3231303b733a33373a22706c7567696e732f76696577735f706c7567696e5f646973706c61795f666565642e696e63223b693a3231313b733a33373a22706c7567696e732f76696577735f706c7567696e5f646973706c61795f706167652e696e63223b693a3231323b733a34333a22706c7567696e732f76696577735f706c7567696e5f6578706f7365645f666f726d5f62617369632e696e63223b693a3231333b733a33373a22706c7567696e732f76696577735f706c7567696e5f6578706f7365645f666f726d2e696e63223b693a3231343b733a35323a22706c7567696e732f76696577735f706c7567696e5f6578706f7365645f666f726d5f696e7075745f72657175697265642e696e63223b693a3231353b733a34323a22706c7567696e732f76696577735f706c7567696e5f6c6f63616c697a6174696f6e5f636f72652e696e63223b693a3231363b733a33373a22706c7567696e732f76696577735f706c7567696e5f6c6f63616c697a6174696f6e2e696e63223b693a3231373b733a34323a22706c7567696e732f76696577735f706c7567696e5f6c6f63616c697a6174696f6e5f6e6f6e652e696e63223b693a3231383b733a33303a22706c7567696e732f76696577735f706c7567696e5f70616765722e696e63223b693a3231393b733a33353a22706c7567696e732f76696577735f706c7567696e5f70616765725f66756c6c2e696e63223b693a3232303b733a33353a22706c7567696e732f76696577735f706c7567696e5f70616765725f6d696e692e696e63223b693a3232313b733a33353a22706c7567696e732f76696577735f706c7567696e5f70616765725f6e6f6e652e696e63223b693a3232323b733a33353a22706c7567696e732f76696577735f706c7567696e5f70616765725f736f6d652e696e63223b693a3232333b733a33303a22706c7567696e732f76696577735f706c7567696e5f71756572792e696e63223b693a3232343b733a33383a22706c7567696e732f76696577735f706c7567696e5f71756572795f64656661756c742e696e63223b693a3232353b733a32383a22706c7567696e732f76696577735f706c7567696e5f726f772e696e63223b693a3232363b733a33353a22706c7567696e732f76696577735f706c7567696e5f726f775f6669656c64732e696e63223b693a3232373b733a33393a22706c7567696e732f76696577735f706c7567696e5f726f775f7273735f6669656c64732e696e63223b693a3232383b733a33303a22706c7567696e732f76696577735f706c7567696e5f7374796c652e696e63223b693a3232393b733a33383a22706c7567696e732f76696577735f706c7567696e5f7374796c655f64656661756c742e696e63223b693a3233303b733a33353a22706c7567696e732f76696577735f706c7567696e5f7374796c655f677269642e696e63223b693a3233313b733a33353a22706c7567696e732f76696577735f706c7567696e5f7374796c655f6c6973742e696e63223b693a3233323b733a34303a22706c7567696e732f76696577735f706c7567696e5f7374796c655f6a756d705f6d656e752e696e63223b693a3233333b733a33383a22706c7567696e732f76696577735f706c7567696e5f7374796c655f6d617070696e672e696e63223b693a3233343b733a33343a22706c7567696e732f76696577735f706c7567696e5f7374796c655f7273732e696e63223b693a3233353b733a33383a22706c7567696e732f76696577735f706c7567696e5f7374796c655f73756d6d6172792e696e63223b693a3233363b733a34383a22706c7567696e732f76696577735f706c7567696e5f7374796c655f73756d6d6172795f6a756d705f6d656e752e696e63223b693a3233373b733a35303a22706c7567696e732f76696577735f706c7567696e5f7374796c655f73756d6d6172795f756e666f726d61747465642e696e63223b693a3233383b733a33363a22706c7567696e732f76696577735f706c7567696e5f7374796c655f7461626c652e696e63223b693a3233393b733a34333a2274657374732f68616e646c6572732f76696577735f68616e646c65725f617265615f746578742e74657374223b693a3234303b733a34373a2274657374732f68616e646c6572732f76696577735f68616e646c65725f617267756d656e745f6e756c6c2e74657374223b693a3234313b733a34393a2274657374732f68616e646c6572732f76696577735f68616e646c65725f617267756d656e745f737472696e672e74657374223b693a3234323b733a33393a2274657374732f68616e646c6572732f76696577735f68616e646c65725f6669656c642e74657374223b693a3234333b733a34373a2274657374732f68616e646c6572732f76696577735f68616e646c65725f6669656c645f626f6f6c65616e2e74657374223b693a3234343b733a34363a2274657374732f68616e646c6572732f76696577735f68616e646c65725f6669656c645f637573746f6d2e74657374223b693a3234353b733a34373a2274657374732f68616e646c6572732f76696577735f68616e646c65725f6669656c645f636f756e7465722e74657374223b693a3234363b733a34343a2274657374732f68616e646c6572732f76696577735f68616e646c65725f6669656c645f646174652e74657374223b693a3234373b733a34393a2274657374732f68616e646c6572732f76696577735f68616e646c65725f6669656c645f66696c655f73697a652e74657374223b693a3234383b733a34343a2274657374732f68616e646c6572732f76696577735f68616e646c65725f6669656c645f6d6174682e74657374223b693a3234393b733a34333a2274657374732f68616e646c6572732f76696577735f68616e646c65725f6669656c645f75726c2e74657374223b693a3235303b733a34333a2274657374732f68616e646c6572732f76696577735f68616e646c65725f6669656c645f7873732e74657374223b693a3235313b733a34383a2274657374732f68616e646c6572732f76696577735f68616e646c65725f66696c7465725f636f6d62696e652e74657374223b693a3235323b733a34353a2274657374732f68616e646c6572732f76696577735f68616e646c65725f66696c7465725f646174652e74657374223b693a3235333b733a34393a2274657374732f68616e646c6572732f76696577735f68616e646c65725f66696c7465725f657175616c6974792e74657374223b693a3235343b733a35323a2274657374732f68616e646c6572732f76696577735f68616e646c65725f66696c7465725f696e5f6f70657261746f722e74657374223b693a3235353b733a34383a2274657374732f68616e646c6572732f76696577735f68616e646c65725f66696c7465725f6e756d657269632e74657374223b693a3235363b733a34373a2274657374732f68616e646c6572732f76696577735f68616e646c65725f66696c7465725f737472696e672e74657374223b693a3235373b733a34353a2274657374732f68616e646c6572732f76696577735f68616e646c65725f736f72745f72616e646f6d2e74657374223b693a3235383b733a34333a2274657374732f68616e646c6572732f76696577735f68616e646c65725f736f72745f646174652e74657374223b693a3235393b733a33383a2274657374732f68616e646c6572732f76696577735f68616e646c65725f736f72742e74657374223b693a3236303b733a36303a2274657374732f746573745f706c7567696e732f76696577735f746573745f706c7567696e5f6163636573735f746573745f64796e616d69632e696e63223b693a3236313b733a35393a2274657374732f746573745f706c7567696e732f76696577735f746573745f706c7567696e5f6163636573735f746573745f7374617469632e696e63223b693a3236323b733a35393a2274657374732f746573745f706c7567696e732f76696577735f746573745f706c7567696e5f7374796c655f746573745f6d617070696e672e696e63223b693a3236333b733a33393a2274657374732f706c7567696e732f76696577735f706c7567696e5f646973706c61792e74657374223b693a3236343b733a34363a2274657374732f7374796c65732f76696577735f706c7567696e5f7374796c655f6a756d705f6d656e752e74657374223b693a3236353b733a33363a2274657374732f7374796c65732f76696577735f706c7567696e5f7374796c652e74657374223b693a3236363b733a34313a2274657374732f7374796c65732f76696577735f706c7567696e5f7374796c655f626173652e74657374223b693a3236373b733a34343a2274657374732f7374796c65732f76696577735f706c7567696e5f7374796c655f6d617070696e672e74657374223b693a3236383b733a34383a2274657374732f7374796c65732f76696577735f706c7567696e5f7374796c655f756e666f726d61747465642e74657374223b693a3236393b733a32333a2274657374732f76696577735f6163636573732e74657374223b693a3237303b733a32343a2274657374732f76696577735f616e616c797a652e74657374223b693a3237313b733a32323a2274657374732f76696577735f62617369632e74657374223b693a3237323b733a33333a2274657374732f76696577735f617267756d656e745f64656661756c742e74657374223b693a3237333b733a33353a2274657374732f76696577735f617267756d656e745f76616c696461746f722e74657374223b693a3237343b733a32393a2274657374732f76696577735f6578706f7365645f666f726d2e74657374223b693a3237353b733a33313a2274657374732f6669656c642f76696577735f6669656c646170692e74657374223b693a3237363b733a32353a2274657374732f76696577735f676c6f73736172792e74657374223b693a3237373b733a32343a2274657374732f76696577735f67726f757062792e74657374223b693a3237383b733a32353a2274657374732f76696577735f68616e646c6572732e74657374223b693a3237393b733a32333a2274657374732f76696577735f6d6f64756c652e74657374223b693a3238303b733a32323a2274657374732f76696577735f70616765722e74657374223b693a3238313b733a34303a2274657374732f76696577735f706c7567696e5f6c6f63616c697a6174696f6e5f746573742e696e63223b693a3238323b733a32393a2274657374732f76696577735f7472616e736c617461626c652e74657374223b693a3238333b733a32323a2274657374732f76696577735f71756572792e74657374223b693a3238343b733a32343a2274657374732f76696577735f757067726164652e74657374223b693a3238353b733a33343a2274657374732f76696577735f746573742e76696577735f64656661756c742e696e63223b693a3238363b733a35383a2274657374732f636f6d6d656e742f76696577735f68616e646c65725f617267756d656e745f636f6d6d656e745f757365725f7569642e74657374223b693a3238373b733a35363a2274657374732f636f6d6d656e742f76696577735f68616e646c65725f66696c7465725f636f6d6d656e745f757365725f7569642e74657374223b693a3238383b733a34353a2274657374732f6e6f64652f76696577735f6e6f64655f7265766973696f6e5f72656c6174696f6e732e74657374223b693a3238393b733a36313a2274657374732f7461786f6e6f6d792f76696577735f68616e646c65725f72656c6174696f6e736869705f6e6f64655f7465726d5f646174612e74657374223b693a3239303b733a34353a2274657374732f757365722f76696577735f68616e646c65725f6669656c645f757365725f6e616d652e74657374223b693a3239313b733a34333a2274657374732f757365722f76696577735f757365725f617267756d656e745f64656661756c742e74657374223b693a3239323b733a34343a2274657374732f757365722f76696577735f757365725f617267756d656e745f76616c69646174652e74657374223b693a3239333b733a32363a2274657374732f757365722f76696577735f757365722e74657374223b693a3239343b733a32323a2274657374732f76696577735f63616368652e74657374223b693a3239353b733a32313a2274657374732f76696577735f766965772e74657374223b693a3239363b733a31393a2274657374732f76696577735f75692e74657374223b7d733a373a2276657273696f6e223b733a373a22372e782d332e37223b733a373a2270726f6a656374223b733a353a227669657773223b733a393a22646174657374616d70223b733a31303a2231333635343939323336223b733a393a22626f6f747374726170223b693a303b7d);
INSERT INTO `system` VALUES('sites/all/modules/views/views_ui.module', 'views_ui', 'module', '', 1, 0, 0, 0, 0x613a31323a7b733a343a226e616d65223b733a383a225669657773205549223b733a31313a226465736372697074696f6e223b733a39333a2241646d696e69737472617469766520696e7465726661636520746f2076696577732e20576974686f75742074686973206d6f64756c652c20796f752063616e6e6f7420637265617465206f72206564697420796f75722076696577732e223b733a373a227061636b616765223b733a353a225669657773223b733a343a22636f7265223b733a333a22372e78223b733a393a22636f6e666967757265223b733a32313a2261646d696e2f7374727563747572652f7669657773223b733a31323a22646570656e64656e63696573223b613a313a7b693a303b733a353a227669657773223b7d733a353a2266696c6573223b613a323a7b693a303b733a31353a2276696577735f75692e6d6f64756c65223b693a313b733a35373a22706c7567696e732f76696577735f77697a6172642f76696577735f75695f626173655f76696577735f77697a6172642e636c6173732e706870223b7d733a373a2276657273696f6e223b733a373a22372e782d332e37223b733a373a2270726f6a656374223b733a353a227669657773223b733a393a22646174657374616d70223b733a31303a2231333635343939323336223b733a333a22706870223b733a353a22352e322e34223b733a393a22626f6f747374726170223b693a303b7d);
INSERT INTO `system` VALUES('sites/all/modules/wysiwyg/tests/wysiwyg_test.module', 'wysiwyg_test', 'module', '', 0, 0, -1, 0, 0x613a31323a7b733a343a226e616d65223b733a31353a22577973697779672074657374696e67223b733a31313a226465736372697074696f6e223b733a35303a2254657374732057797369777967206d6f64756c652066756e6374696f6e616c6974792e20446f206e6f7420656e61626c652e223b733a343a22636f7265223b733a333a22372e78223b733a373a227061636b616765223b733a373a2254657374696e67223b733a363a2268696464656e223b623a313b733a31323a22646570656e64656e63696573223b613a313a7b693a303b733a373a2277797369777967223b7d733a353a2266696c6573223b613a313a7b693a303b733a31393a22777973697779675f746573742e6d6f64756c65223b7d733a373a2276657273696f6e223b733a373a22372e782d322e32223b733a373a2270726f6a656374223b733a373a2277797369777967223b733a393a22646174657374616d70223b733a31303a2231333439323133373736223b733a333a22706870223b733a353a22352e322e34223b733a393a22626f6f747374726170223b693a303b7d);
INSERT INTO `system` VALUES('sites/all/modules/wysiwyg/wysiwyg.module', 'wysiwyg', 'module', '', 1, 0, 7200, 0, 0x613a31323a7b733a343a226e616d65223b733a373a2257797369777967223b733a31313a226465736372697074696f6e223b733a34383a22416c6c6f777320746f206564697420636f6e74656e74207769746820636c69656e742d7369646520656469746f72732e223b733a373a227061636b616765223b733a31343a225573657220696e74657266616365223b733a343a22636f7265223b733a333a22372e78223b733a393a22636f6e666967757265223b733a32383a2261646d696e2f636f6e6669672f636f6e74656e742f77797369777967223b733a353a2266696c6573223b613a323a7b693a303b733a31343a22777973697779672e6d6f64756c65223b693a313b733a31383a2274657374732f777973697779672e74657374223b7d733a373a2276657273696f6e223b733a373a22372e782d322e32223b733a373a2270726f6a656374223b733a373a2277797369777967223b733a393a22646174657374616d70223b733a31303a2231333439323133373736223b733a31323a22646570656e64656e63696573223b613a303a7b7d733a333a22706870223b733a353a22352e322e34223b733a393a22626f6f747374726170223b693a303b7d);
INSERT INTO `system` VALUES('themes/bartik/bartik.info', 'bartik', 'theme', 'themes/engines/phptemplate/phptemplate.engine', 1, 0, -1, 0, 0x613a31383a7b733a343a226e616d65223b733a363a2242617274696b223b733a31313a226465736372697074696f6e223b733a34383a224120666c657869626c652c207265636f6c6f7261626c65207468656d652077697468206d616e7920726567696f6e732e223b733a373a227061636b616765223b733a343a22436f7265223b733a373a2276657273696f6e223b733a343a22372e3232223b733a343a22636f7265223b733a333a22372e78223b733a31313a227374796c65736865657473223b613a323a7b733a333a22616c6c223b613a333a7b733a31343a226373732f6c61796f75742e637373223b733a32383a227468656d65732f62617274696b2f6373732f6c61796f75742e637373223b733a31333a226373732f7374796c652e637373223b733a32373a227468656d65732f62617274696b2f6373732f7374796c652e637373223b733a31343a226373732f636f6c6f72732e637373223b733a32383a227468656d65732f62617274696b2f6373732f636f6c6f72732e637373223b7d733a353a227072696e74223b613a313a7b733a31333a226373732f7072696e742e637373223b733a32373a227468656d65732f62617274696b2f6373732f7072696e742e637373223b7d7d733a373a22726567696f6e73223b613a32303a7b733a363a22686561646572223b733a363a22486561646572223b733a343a2268656c70223b733a343a2248656c70223b733a383a22706167655f746f70223b733a383a225061676520746f70223b733a31313a22706167655f626f74746f6d223b733a31313a225061676520626f74746f6d223b733a31313a22686967686c696768746564223b733a31313a22486967686c696768746564223b733a383a226665617475726564223b733a383a224665617475726564223b733a373a22636f6e74656e74223b733a373a22436f6e74656e74223b733a31333a22736964656261725f6669727374223b733a31333a2253696465626172206669727374223b733a31343a22736964656261725f7365636f6e64223b733a31343a2253696465626172207365636f6e64223b733a31343a2274726970747963685f6669727374223b733a31343a225472697074796368206669727374223b733a31353a2274726970747963685f6d6964646c65223b733a31353a225472697074796368206d6964646c65223b733a31333a2274726970747963685f6c617374223b733a31333a225472697074796368206c617374223b733a31383a22666f6f7465725f6669727374636f6c756d6e223b733a31393a22466f6f74657220666972737420636f6c756d6e223b733a31393a22666f6f7465725f7365636f6e64636f6c756d6e223b733a32303a22466f6f746572207365636f6e6420636f6c756d6e223b733a31383a22666f6f7465725f7468697264636f6c756d6e223b733a31393a22466f6f74657220746869726420636f6c756d6e223b733a31393a22666f6f7465725f666f75727468636f6c756d6e223b733a32303a22466f6f74657220666f7572746820636f6c756d6e223b733a363a22666f6f746572223b733a363a22466f6f746572223b733a31343a2264617368626f6172645f6d61696e223b733a31363a2244617368626f61726420286d61696e29223b733a31373a2264617368626f6172645f73696465626172223b733a31393a2244617368626f61726420287369646562617229223b733a31383a2264617368626f6172645f696e616374697665223b733a32303a2244617368626f6172642028696e61637469766529223b7d733a383a2273657474696e6773223b613a313a7b733a32303a2273686f72746375745f6d6f64756c655f6c696e6b223b733a313a2230223b7d733a373a2270726f6a656374223b733a363a2264727570616c223b733a393a22646174657374616d70223b733a31303a2231333635303237303132223b733a363a22656e67696e65223b733a31313a2270687074656d706c617465223b733a383a226665617475726573223b613a393a7b693a303b733a343a226c6f676f223b693a313b733a373a2266617669636f6e223b693a323b733a343a226e616d65223b693a333b733a363a22736c6f67616e223b693a343b733a31373a226e6f64655f757365725f70696374757265223b693a353b733a32303a22636f6d6d656e745f757365725f70696374757265223b693a363b733a32353a22636f6d6d656e745f757365725f766572696669636174696f6e223b693a373b733a393a226d61696e5f6d656e75223b693a383b733a31343a227365636f6e646172795f6d656e75223b7d733a31303a2273637265656e73686f74223b733a32383a227468656d65732f62617274696b2f73637265656e73686f742e706e67223b733a333a22706870223b733a353a22352e322e34223b733a373a2273637269707473223b613a303a7b7d733a31353a226f7665726c61795f726567696f6e73223b613a353a7b693a303b733a31343a2264617368626f6172645f6d61696e223b693a313b733a31373a2264617368626f6172645f73696465626172223b693a323b733a31383a2264617368626f6172645f696e616374697665223b693a333b733a373a22636f6e74656e74223b693a343b733a343a2268656c70223b7d733a31343a22726567696f6e735f68696464656e223b613a323a7b693a303b733a383a22706167655f746f70223b693a313b733a31313a22706167655f626f74746f6d223b7d733a32383a226f7665726c61795f737570706c656d656e74616c5f726567696f6e73223b613a313a7b693a303b733a383a22706167655f746f70223b7d7d);
INSERT INTO `system` VALUES('themes/garland/garland.info', 'garland', 'theme', 'themes/engines/phptemplate/phptemplate.engine', 0, 0, -1, 0, 0x613a31383a7b733a343a226e616d65223b733a373a224761726c616e64223b733a31313a226465736372697074696f6e223b733a3131313a2241206d756c74692d636f6c756d6e207468656d652077686963682063616e20626520636f6e6669677572656420746f206d6f6469667920636f6c6f727320616e6420737769746368206265747765656e20666978656420616e6420666c756964207769647468206c61796f7574732e223b733a373a227061636b616765223b733a343a22436f7265223b733a373a2276657273696f6e223b733a343a22372e3232223b733a343a22636f7265223b733a333a22372e78223b733a31313a227374796c65736865657473223b613a323a7b733a333a22616c6c223b613a313a7b733a393a227374796c652e637373223b733a32343a227468656d65732f6761726c616e642f7374796c652e637373223b7d733a353a227072696e74223b613a313a7b733a393a227072696e742e637373223b733a32343a227468656d65732f6761726c616e642f7072696e742e637373223b7d7d733a383a2273657474696e6773223b613a313a7b733a31333a226761726c616e645f7769647468223b733a353a22666c756964223b7d733a373a2270726f6a656374223b733a363a2264727570616c223b733a393a22646174657374616d70223b733a31303a2231333635303237303132223b733a363a22656e67696e65223b733a31313a2270687074656d706c617465223b733a373a22726567696f6e73223b613a31323a7b733a31333a22736964656261725f6669727374223b733a31323a224c6566742073696465626172223b733a31343a22736964656261725f7365636f6e64223b733a31333a2252696768742073696465626172223b733a373a22636f6e74656e74223b733a373a22436f6e74656e74223b733a363a22686561646572223b733a363a22486561646572223b733a363a22666f6f746572223b733a363a22466f6f746572223b733a31313a22686967686c696768746564223b733a31313a22486967686c696768746564223b733a343a2268656c70223b733a343a2248656c70223b733a383a22706167655f746f70223b733a383a225061676520746f70223b733a31313a22706167655f626f74746f6d223b733a31313a225061676520626f74746f6d223b733a31343a2264617368626f6172645f6d61696e223b733a31363a2244617368626f61726420286d61696e29223b733a31373a2264617368626f6172645f73696465626172223b733a31393a2244617368626f61726420287369646562617229223b733a31383a2264617368626f6172645f696e616374697665223b733a32303a2244617368626f6172642028696e61637469766529223b7d733a383a226665617475726573223b613a393a7b693a303b733a343a226c6f676f223b693a313b733a373a2266617669636f6e223b693a323b733a343a226e616d65223b693a333b733a363a22736c6f67616e223b693a343b733a31373a226e6f64655f757365725f70696374757265223b693a353b733a32303a22636f6d6d656e745f757365725f70696374757265223b693a363b733a32353a22636f6d6d656e745f757365725f766572696669636174696f6e223b693a373b733a393a226d61696e5f6d656e75223b693a383b733a31343a227365636f6e646172795f6d656e75223b7d733a31303a2273637265656e73686f74223b733a32393a227468656d65732f6761726c616e642f73637265656e73686f742e706e67223b733a333a22706870223b733a353a22352e322e34223b733a373a2273637269707473223b613a303a7b7d733a31353a226f7665726c61795f726567696f6e73223b613a353a7b693a303b733a31343a2264617368626f6172645f6d61696e223b693a313b733a31373a2264617368626f6172645f73696465626172223b693a323b733a31383a2264617368626f6172645f696e616374697665223b693a333b733a373a22636f6e74656e74223b693a343b733a343a2268656c70223b7d733a31343a22726567696f6e735f68696464656e223b613a323a7b693a303b733a383a22706167655f746f70223b693a313b733a31313a22706167655f626f74746f6d223b7d733a32383a226f7665726c61795f737570706c656d656e74616c5f726567696f6e73223b613a313a7b693a303b733a383a22706167655f746f70223b7d7d);
INSERT INTO `system` VALUES('themes/seven/seven.info', 'seven', 'theme', 'themes/engines/phptemplate/phptemplate.engine', 1, 0, -1, 0, 0x613a31383a7b733a343a226e616d65223b733a353a22536576656e223b733a31313a226465736372697074696f6e223b733a36353a22412073696d706c65206f6e652d636f6c756d6e2c207461626c656c6573732c20666c7569642077696474682061646d696e697374726174696f6e207468656d652e223b733a373a227061636b616765223b733a343a22436f7265223b733a373a2276657273696f6e223b733a343a22372e3232223b733a343a22636f7265223b733a333a22372e78223b733a31313a227374796c65736865657473223b613a313a7b733a363a2273637265656e223b613a323a7b733a393a2272657365742e637373223b733a32323a227468656d65732f736576656e2f72657365742e637373223b733a393a227374796c652e637373223b733a32323a227468656d65732f736576656e2f7374796c652e637373223b7d7d733a383a2273657474696e6773223b613a313a7b733a32303a2273686f72746375745f6d6f64756c655f6c696e6b223b733a313a2231223b7d733a373a22726567696f6e73223b613a383a7b733a373a22636f6e74656e74223b733a373a22436f6e74656e74223b733a343a2268656c70223b733a343a2248656c70223b733a383a22706167655f746f70223b733a383a225061676520746f70223b733a31313a22706167655f626f74746f6d223b733a31313a225061676520626f74746f6d223b733a31333a22736964656261725f6669727374223b733a31333a2246697273742073696465626172223b733a31343a2264617368626f6172645f6d61696e223b733a31363a2244617368626f61726420286d61696e29223b733a31373a2264617368626f6172645f73696465626172223b733a31393a2244617368626f61726420287369646562617229223b733a31383a2264617368626f6172645f696e616374697665223b733a32303a2244617368626f6172642028696e61637469766529223b7d733a31343a22726567696f6e735f68696464656e223b613a333a7b693a303b733a31333a22736964656261725f6669727374223b693a313b733a383a22706167655f746f70223b693a323b733a31313a22706167655f626f74746f6d223b7d733a373a2270726f6a656374223b733a363a2264727570616c223b733a393a22646174657374616d70223b733a31303a2231333635303237303132223b733a363a22656e67696e65223b733a31313a2270687074656d706c617465223b733a383a226665617475726573223b613a393a7b693a303b733a343a226c6f676f223b693a313b733a373a2266617669636f6e223b693a323b733a343a226e616d65223b693a333b733a363a22736c6f67616e223b693a343b733a31373a226e6f64655f757365725f70696374757265223b693a353b733a32303a22636f6d6d656e745f757365725f70696374757265223b693a363b733a32353a22636f6d6d656e745f757365725f766572696669636174696f6e223b693a373b733a393a226d61696e5f6d656e75223b693a383b733a31343a227365636f6e646172795f6d656e75223b7d733a31303a2273637265656e73686f74223b733a32373a227468656d65732f736576656e2f73637265656e73686f742e706e67223b733a333a22706870223b733a353a22352e322e34223b733a373a2273637269707473223b613a303a7b7d733a31353a226f7665726c61795f726567696f6e73223b613a353a7b693a303b733a31343a2264617368626f6172645f6d61696e223b693a313b733a31373a2264617368626f6172645f73696465626172223b693a323b733a31383a2264617368626f6172645f696e616374697665223b693a333b733a373a22636f6e74656e74223b693a343b733a343a2268656c70223b7d733a32383a226f7665726c61795f737570706c656d656e74616c5f726567696f6e73223b613a313a7b693a303b733a383a22706167655f746f70223b7d7d);
INSERT INTO `system` VALUES('themes/stark/stark.info', 'stark', 'theme', 'themes/engines/phptemplate/phptemplate.engine', 0, 0, -1, 0, 0x613a31373a7b733a343a226e616d65223b733a353a22537461726b223b733a31313a226465736372697074696f6e223b733a3230383a2254686973207468656d652064656d6f6e737472617465732044727570616c27732064656661756c742048544d4c206d61726b757020616e6420435353207374796c65732e20546f206c6561726e20686f7720746f206275696c6420796f7572206f776e207468656d6520616e64206f766572726964652044727570616c27732064656661756c7420636f64652c2073656520746865203c6120687265663d22687474703a2f2f64727570616c2e6f72672f7468656d652d6775696465223e5468656d696e672047756964653c2f613e2e223b733a373a227061636b616765223b733a343a22436f7265223b733a373a2276657273696f6e223b733a343a22372e3232223b733a343a22636f7265223b733a333a22372e78223b733a31313a227374796c65736865657473223b613a313a7b733a333a22616c6c223b613a313a7b733a31303a226c61796f75742e637373223b733a32333a227468656d65732f737461726b2f6c61796f75742e637373223b7d7d733a373a2270726f6a656374223b733a363a2264727570616c223b733a393a22646174657374616d70223b733a31303a2231333635303237303132223b733a363a22656e67696e65223b733a31313a2270687074656d706c617465223b733a373a22726567696f6e73223b613a31323a7b733a31333a22736964656261725f6669727374223b733a31323a224c6566742073696465626172223b733a31343a22736964656261725f7365636f6e64223b733a31333a2252696768742073696465626172223b733a373a22636f6e74656e74223b733a373a22436f6e74656e74223b733a363a22686561646572223b733a363a22486561646572223b733a363a22666f6f746572223b733a363a22466f6f746572223b733a31313a22686967686c696768746564223b733a31313a22486967686c696768746564223b733a343a2268656c70223b733a343a2248656c70223b733a383a22706167655f746f70223b733a383a225061676520746f70223b733a31313a22706167655f626f74746f6d223b733a31313a225061676520626f74746f6d223b733a31343a2264617368626f6172645f6d61696e223b733a31363a2244617368626f61726420286d61696e29223b733a31373a2264617368626f6172645f73696465626172223b733a31393a2244617368626f61726420287369646562617229223b733a31383a2264617368626f6172645f696e616374697665223b733a32303a2244617368626f6172642028696e61637469766529223b7d733a383a226665617475726573223b613a393a7b693a303b733a343a226c6f676f223b693a313b733a373a2266617669636f6e223b693a323b733a343a226e616d65223b693a333b733a363a22736c6f67616e223b693a343b733a31373a226e6f64655f757365725f70696374757265223b693a353b733a32303a22636f6d6d656e745f757365725f70696374757265223b693a363b733a32353a22636f6d6d656e745f757365725f766572696669636174696f6e223b693a373b733a393a226d61696e5f6d656e75223b693a383b733a31343a227365636f6e646172795f6d656e75223b7d733a31303a2273637265656e73686f74223b733a32373a227468656d65732f737461726b2f73637265656e73686f742e706e67223b733a333a22706870223b733a353a22352e322e34223b733a373a2273637269707473223b613a303a7b7d733a31353a226f7665726c61795f726567696f6e73223b613a353a7b693a303b733a31343a2264617368626f6172645f6d61696e223b693a313b733a31373a2264617368626f6172645f73696465626172223b693a323b733a31383a2264617368626f6172645f696e616374697665223b693a333b733a373a22636f6e74656e74223b693a343b733a343a2268656c70223b7d733a31343a22726567696f6e735f68696464656e223b613a323a7b693a303b733a383a22706167655f746f70223b693a313b733a31313a22706167655f626f74746f6d223b7d733a32383a226f7665726c61795f737570706c656d656e74616c5f726567696f6e73223b613a313a7b693a303b733a383a22706167655f746f70223b7d7d);

-- --------------------------------------------------------

--
-- Table structure for table `taxonomy_index`
--

CREATE TABLE `taxonomy_index` (
  `nid` int(10) unsigned NOT NULL default '0' COMMENT 'The node.nid this record tracks.',
  `tid` int(10) unsigned NOT NULL default '0' COMMENT 'The term ID.',
  `sticky` tinyint(4) default '0' COMMENT 'Boolean indicating whether the node is sticky.',
  `created` int(11) NOT NULL default '0' COMMENT 'The Unix timestamp when the node was created.',
  KEY `term_node` (`tid`,`sticky`,`created`),
  KEY `nid` (`nid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Maintains denormalized information about node/term...';

--
-- Dumping data for table `taxonomy_index`
--


-- --------------------------------------------------------

--
-- Table structure for table `taxonomy_term_data`
--

CREATE TABLE `taxonomy_term_data` (
  `tid` int(10) unsigned NOT NULL auto_increment COMMENT 'Primary Key: Unique term ID.',
  `vid` int(10) unsigned NOT NULL default '0' COMMENT 'The taxonomy_vocabulary.vid of the vocabulary to which the term is assigned.',
  `name` varchar(255) NOT NULL default '' COMMENT 'The term name.',
  `description` longtext COMMENT 'A description of the term.',
  `format` varchar(255) default NULL COMMENT 'The filter_format.format of the description.',
  `weight` int(11) NOT NULL default '0' COMMENT 'The weight of this term in relation to other terms.',
  PRIMARY KEY  (`tid`),
  KEY `taxonomy_tree` (`vid`,`weight`,`name`),
  KEY `vid_name` (`vid`,`name`),
  KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores term information.' AUTO_INCREMENT=1 ;

--
-- Dumping data for table `taxonomy_term_data`
--


-- --------------------------------------------------------

--
-- Table structure for table `taxonomy_term_hierarchy`
--

CREATE TABLE `taxonomy_term_hierarchy` (
  `tid` int(10) unsigned NOT NULL default '0' COMMENT 'Primary Key: The taxonomy_term_data.tid of the term.',
  `parent` int(10) unsigned NOT NULL default '0' COMMENT 'Primary Key: The taxonomy_term_data.tid of the term’s parent. 0 indicates no parent.',
  PRIMARY KEY  (`tid`,`parent`),
  KEY `parent` (`parent`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores the hierarchical relationship between terms.';

--
-- Dumping data for table `taxonomy_term_hierarchy`
--


-- --------------------------------------------------------

--
-- Table structure for table `taxonomy_vocabulary`
--

CREATE TABLE `taxonomy_vocabulary` (
  `vid` int(10) unsigned NOT NULL auto_increment COMMENT 'Primary Key: Unique vocabulary ID.',
  `name` varchar(255) NOT NULL default '' COMMENT 'Name of the vocabulary.',
  `machine_name` varchar(255) NOT NULL default '' COMMENT 'The vocabulary machine name.',
  `description` longtext COMMENT 'Description of the vocabulary.',
  `hierarchy` tinyint(3) unsigned NOT NULL default '0' COMMENT 'The type of hierarchy allowed within the vocabulary. (0 = disabled, 1 = single, 2 = multiple)',
  `module` varchar(255) NOT NULL default '' COMMENT 'The module which created the vocabulary.',
  `weight` int(11) NOT NULL default '0' COMMENT 'The weight of this vocabulary in relation to other vocabularies.',
  PRIMARY KEY  (`vid`),
  UNIQUE KEY `machine_name` (`machine_name`),
  KEY `list` (`weight`,`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Stores vocabulary information.' AUTO_INCREMENT=2 ;

--
-- Dumping data for table `taxonomy_vocabulary`
--

INSERT INTO `taxonomy_vocabulary` VALUES(1, 'Tags', 'tags', 'Use tags to group articles on similar topics into categories.', 0, 'taxonomy', 0);

-- --------------------------------------------------------

--
-- Table structure for table `url_alias`
--

CREATE TABLE `url_alias` (
  `pid` int(10) unsigned NOT NULL auto_increment COMMENT 'A unique path alias identifier.',
  `source` varchar(255) NOT NULL default '' COMMENT 'The Drupal path this alias is for; e.g. node/12.',
  `alias` varchar(255) NOT NULL default '' COMMENT 'The alias for this path; e.g. title-of-the-story.',
  `language` varchar(12) NOT NULL default '' COMMENT 'The language this alias is for; if ’und’, the alias will be used for unknown languages. Each Drupal path can have an alias for each supported language.',
  PRIMARY KEY  (`pid`),
  KEY `alias_language_pid` (`alias`,`language`,`pid`),
  KEY `source_language_pid` (`source`,`language`,`pid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='A list of URL aliases for Drupal paths; a user may visit...' AUTO_INCREMENT=1 ;

--
-- Dumping data for table `url_alias`
--


-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `uid` int(10) unsigned NOT NULL default '0' COMMENT 'Primary Key: Unique user ID.',
  `name` varchar(60) NOT NULL default '' COMMENT 'Unique user name.',
  `pass` varchar(128) NOT NULL default '' COMMENT 'User’s password (hashed).',
  `mail` varchar(254) default '' COMMENT 'User’s e-mail address.',
  `theme` varchar(255) NOT NULL default '' COMMENT 'User’s default theme.',
  `signature` varchar(255) NOT NULL default '' COMMENT 'User’s signature.',
  `signature_format` varchar(255) default NULL COMMENT 'The filter_format.format of the signature.',
  `created` int(11) NOT NULL default '0' COMMENT 'Timestamp for when user was created.',
  `access` int(11) NOT NULL default '0' COMMENT 'Timestamp for previous time user accessed the site.',
  `login` int(11) NOT NULL default '0' COMMENT 'Timestamp for user’s last login.',
  `status` tinyint(4) NOT NULL default '0' COMMENT 'Whether the user is active(1) or blocked(0).',
  `timezone` varchar(32) default NULL COMMENT 'User’s time zone.',
  `language` varchar(12) NOT NULL default '' COMMENT 'User’s default language.',
  `picture` int(11) NOT NULL default '0' COMMENT 'Foreign key: file_managed.fid of user’s picture.',
  `init` varchar(254) default '' COMMENT 'E-mail address used for initial account creation.',
  `data` longblob COMMENT 'A serialized array of name value pairs that are related to the user. Any form values posted during user edit are stored and are loaded into the $user object during user_load(). Use of this field is discouraged and it will likely disappear in a future...',
  PRIMARY KEY  (`uid`),
  UNIQUE KEY `name` (`name`),
  KEY `access` (`access`),
  KEY `created` (`created`),
  KEY `mail` (`mail`),
  KEY `picture` (`picture`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores user data.';

--
-- Dumping data for table `users`
--

INSERT INTO `users` VALUES(0, '', '', '', '', '', NULL, 0, 0, 0, 0, NULL, '', 0, '', NULL);
INSERT INTO `users` VALUES(1, 'owntheweb', '$S$DdE.V69bZf20kMo1kA.MVC1r5Dd6DdNqYVN0KHnCvsIblgknxo3U', 'owntheweb@gmail.com', '', '', NULL, 1374493088, 1375827084, 1375827084, 1, 'America/Denver', '', 0, 'owntheweb@gmail.com', 0x623a303b);

-- --------------------------------------------------------

--
-- Table structure for table `users_roles`
--

CREATE TABLE `users_roles` (
  `uid` int(10) unsigned NOT NULL default '0' COMMENT 'Primary Key: users.uid for user.',
  `rid` int(10) unsigned NOT NULL default '0' COMMENT 'Primary Key: role.rid for role.',
  PRIMARY KEY  (`uid`,`rid`),
  KEY `rid` (`rid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Maps users to roles.';

--
-- Dumping data for table `users_roles`
--

INSERT INTO `users_roles` VALUES(1, 3);

-- --------------------------------------------------------

--
-- Table structure for table `variable`
--

CREATE TABLE `variable` (
  `name` varchar(128) NOT NULL default '' COMMENT 'The name of the variable.',
  `value` longblob NOT NULL COMMENT 'The value of the variable.',
  PRIMARY KEY  (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Named variable/value pairs created by Drupal core or any...';

--
-- Dumping data for table `variable`
--

INSERT INTO `variable` VALUES('additional_settings__active_tab_qr_content', 0x733a393a22656469742d6d656e75223b);
INSERT INTO `variable` VALUES('admin_theme', 0x733a353a22736576656e223b);
INSERT INTO `variable` VALUES('clean_url', 0x733a313a2231223b);
INSERT INTO `variable` VALUES('comment_anonymous_qr_content', 0x693a303b);
INSERT INTO `variable` VALUES('comment_default_mode_qr_content', 0x693a313b);
INSERT INTO `variable` VALUES('comment_default_per_page_qr_content', 0x733a323a223530223b);
INSERT INTO `variable` VALUES('comment_form_location_qr_content', 0x693a313b);
INSERT INTO `variable` VALUES('comment_page', 0x693a303b);
INSERT INTO `variable` VALUES('comment_preview_qr_content', 0x733a313a2231223b);
INSERT INTO `variable` VALUES('comment_qr_content', 0x733a313a2230223b);
INSERT INTO `variable` VALUES('comment_subject_field_qr_content', 0x693a313b);
INSERT INTO `variable` VALUES('cron_key', 0x733a34333a22576862474232504d774662354d535a52494d506c693762783577736e4d5a577946546c654a6d6a6a547030223b);
INSERT INTO `variable` VALUES('cron_last', 0x693a313337353832323432303b);
INSERT INTO `variable` VALUES('css_js_query_string', 0x733a363a226d7234627472223b);
INSERT INTO `variable` VALUES('ctools_last_cron', 0x693a313337353830373239323b);
INSERT INTO `variable` VALUES('date_default_timezone', 0x733a31343a22416d65726963612f44656e766572223b);
INSERT INTO `variable` VALUES('default_field_group', 0x613a333a7b733a33323a2267726f75705f617564696f7c6e6f64657c71725f636f6e74656e747c666f726d223b623a303b733a33323a2267726f75705f766964656f7c6e6f64657c71725f636f6e74656e747c666f726d223b623a303b733a33313a2267726f75705f626f64797c6e6f64657c71725f636f6e74656e747c666f726d223b623a303b7d);
INSERT INTO `variable` VALUES('default_nodes_main', 0x733a323a223130223b);
INSERT INTO `variable` VALUES('drupal_http_request_fails', 0x623a303b);
INSERT INTO `variable` VALUES('drupal_private_key', 0x733a34333a2251493259594469325a303772794d63754145493853514944475257343863346147446831497933656c2d34223b);
INSERT INTO `variable` VALUES('field_bundle_settings_node__qr_content', 0x613a323a7b733a31303a22766965775f6d6f646573223b613a353a7b733a363a22746561736572223b613a313a7b733a31353a22637573746f6d5f73657474696e6773223b623a313b7d733a343a2266756c6c223b613a313a7b733a31353a22637573746f6d5f73657474696e6773223b623a303b7d733a333a22727373223b613a313a7b733a31353a22637573746f6d5f73657474696e6773223b623a303b7d733a31323a227365617263685f696e646578223b613a313a7b733a31353a22637573746f6d5f73657474696e6773223b623a303b7d733a31333a227365617263685f726573756c74223b613a313a7b733a31353a22637573746f6d5f73657474696e6773223b623a303b7d7d733a31323a2265787472615f6669656c6473223b613a323a7b733a343a22666f726d223b613a313a7b733a353a227469746c65223b613a313a7b733a363a22776569676874223b733a313a2230223b7d7d733a373a22646973706c6179223b613a303a7b7d7d7d);
INSERT INTO `variable` VALUES('file_default_scheme', 0x733a363a227075626c6963223b);
INSERT INTO `variable` VALUES('file_private_path', 0x733a303a22223b);
INSERT INTO `variable` VALUES('file_public_path', 0x733a31393a2273697465732f64656661756c742f66696c6573223b);
INSERT INTO `variable` VALUES('file_temporary_path', 0x733a32333a2273697465732f64656661756c742f66696c65732f746d70223b);
INSERT INTO `variable` VALUES('filter_fallback_format', 0x733a31303a22706c61696e5f74657874223b);
INSERT INTO `variable` VALUES('google_qr_code_height', 0x733a333a22333030223b);
INSERT INTO `variable` VALUES('google_qr_code_when_show', 0x733a383a226f6e5f636c69636b223b);
INSERT INTO `variable` VALUES('google_qr_code_width', 0x733a333a22333030223b);
INSERT INTO `variable` VALUES('install_profile', 0x733a383a227374616e64617264223b);
INSERT INTO `variable` VALUES('install_task', 0x733a343a22646f6e65223b);
INSERT INTO `variable` VALUES('install_time', 0x693a313337343439333135353b);
INSERT INTO `variable` VALUES('maintenance_mode', 0x623a303b);
INSERT INTO `variable` VALUES('menu_expanded', 0x613a303a7b7d);
INSERT INTO `variable` VALUES('menu_masks', 0x613a34303a7b693a303b693a3530373b693a313b693a3530363b693a323b693a3530313b693a333b693a3439333b693a343b693a3235333b693a353b693a3235323b693a363b693a3235303b693a373b693a3234373b693a383b693a3234363b693a393b693a3234353b693a31303b693a3132363b693a31313b693a3132353b693a31323b693a3132343b693a31333b693a3132333b693a31343b693a3132323b693a31353b693a3132313b693a31363b693a3131373b693a31373b693a36333b693a31383b693a36323b693a31393b693a36313b693a32303b693a36303b693a32313b693a35393b693a32323b693a35383b693a32333b693a34343b693a32343b693a33313b693a32353b693a33303b693a32363b693a32393b693a32373b693a32383b693a32383b693a32343b693a32393b693a32313b693a33303b693a31353b693a33313b693a31343b693a33323b693a31333b693a33333b693a31313b693a33343b693a373b693a33353b693a363b693a33363b693a353b693a33373b693a333b693a33383b693a323b693a33393b693a313b7d);
INSERT INTO `variable` VALUES('menu_options_qr_content', 0x613a303a7b7d);
INSERT INTO `variable` VALUES('menu_parent_qr_content', 0x733a31313a226d61696e2d6d656e753a30223b);
INSERT INTO `variable` VALUES('node_admin_theme', 0x733a313a2231223b);
INSERT INTO `variable` VALUES('node_cron_last', 0x733a31303a2231333734383536393335223b);
INSERT INTO `variable` VALUES('node_options_page', 0x613a313a7b693a303b733a363a22737461747573223b7d);
INSERT INTO `variable` VALUES('node_options_qr_content', 0x613a313a7b693a303b733a363a22737461747573223b7d);
INSERT INTO `variable` VALUES('node_preview_qr_content', 0x733a313a2231223b);
INSERT INTO `variable` VALUES('node_submitted_page', 0x623a303b);
INSERT INTO `variable` VALUES('node_submitted_qr_content', 0x693a303b);
INSERT INTO `variable` VALUES('path_alias_whitelist', 0x613a303a7b7d);
INSERT INTO `variable` VALUES('rules_empty_sets', 0x613a32363a7b733a31313a226e6f64655f696e73657274223b693a303b733a31313a226e6f64655f757064617465223b693a313b733a31323a226e6f64655f70726573617665223b693a323b733a31313a226e6f64655f64656c657465223b693a333b733a343a22696e6974223b693a343b733a343a2263726f6e223b693a353b733a383a227761746368646f67223b693a363b733a31313a22757365725f696e73657274223b693a373b733a31313a22757365725f757064617465223b693a383b733a31323a22757365725f70726573617665223b693a393b733a393a22757365725f76696577223b693a31303b733a31313a22757365725f64656c657465223b693a31313b733a31313a22757365725f6c6f676f7574223b693a31323b733a31343a22636f6d6d656e745f696e73657274223b693a31333b733a31343a22636f6d6d656e745f757064617465223b693a31343b733a31353a22636f6d6d656e745f70726573617665223b693a31353b733a31323a22636f6d6d656e745f76696577223b693a31363b733a31343a22636f6d6d656e745f64656c657465223b693a31373b733a32303a227461786f6e6f6d795f7465726d5f696e73657274223b693a31383b733a32303a227461786f6e6f6d795f7465726d5f757064617465223b693a31393b733a32313a227461786f6e6f6d795f7465726d5f70726573617665223b693a32303b733a32303a227461786f6e6f6d795f7465726d5f64656c657465223b693a32313b733a32363a227461786f6e6f6d795f766f636162756c6172795f696e73657274223b693a32323b733a32363a227461786f6e6f6d795f766f636162756c6172795f757064617465223b693a32333b733a32373a227461786f6e6f6d795f766f636162756c6172795f70726573617665223b693a32343b733a32363a227461786f6e6f6d795f766f636162756c6172795f64656c657465223b693a32353b7d);
INSERT INTO `variable` VALUES('save_continue_qr_content', 0x733a31393a225361766520616e6420616464206669656c6473223b);
INSERT INTO `variable` VALUES('site_403', 0x733a303a22223b);
INSERT INTO `variable` VALUES('site_404', 0x733a303a22223b);
INSERT INTO `variable` VALUES('site_default_country', 0x733a323a225553223b);
INSERT INTO `variable` VALUES('site_frontpage', 0x733a363a226e6f64652f34223b);
INSERT INTO `variable` VALUES('site_mail', 0x733a31393a226f776e74686577656240676d61696c2e636f6d223b);
INSERT INTO `variable` VALUES('site_name', 0x733a31353a225152204578686962697420546f7572223b);
INSERT INTO `variable` VALUES('site_slogan', 0x733a303a22223b);
INSERT INTO `variable` VALUES('theme_bartik_settings', 0x613a31393a7b733a31313a22746f67676c655f6c6f676f223b693a313b733a31313a22746f67676c655f6e616d65223b693a313b733a31333a22746f67676c655f736c6f67616e223b693a313b733a32343a22746f67676c655f6e6f64655f757365725f70696374757265223b693a313b733a32373a22746f67676c655f636f6d6d656e745f757365725f70696374757265223b693a313b733a33323a22746f67676c655f636f6d6d656e745f757365725f766572696669636174696f6e223b693a313b733a31343a22746f67676c655f66617669636f6e223b693a313b733a31363a22746f67676c655f6d61696e5f6d656e75223b693a313b733a32313a22746f67676c655f7365636f6e646172795f6d656e75223b693a313b733a31323a2264656661756c745f6c6f676f223b693a313b733a393a226c6f676f5f70617468223b733a303a22223b733a31313a226c6f676f5f75706c6f6164223b733a303a22223b733a31353a2264656661756c745f66617669636f6e223b693a313b733a31323a2266617669636f6e5f70617468223b733a303a22223b733a31343a2266617669636f6e5f75706c6f6164223b733a303a22223b733a363a22736368656d65223b733a373a2264656661756c74223b733a373a2270616c65747465223b613a393a7b733a333a22746f70223b733a373a2223303737396266223b733a363a22626f74746f6d223b733a373a2223343861396534223b733a323a226267223b733a373a2223666666666666223b733a373a2273696465626172223b733a373a2223663666366632223b733a31343a2273696465626172626f7264657273223b733a373a2223663966396639223b733a363a22666f6f746572223b733a373a2223323932393239223b733a31313a227469746c65736c6f67616e223b733a373a2223666666656666223b733a343a2274657874223b733a373a2223336233623362223b733a343a226c696e6b223b733a373a2223303037314233223b7d733a353a227468656d65223b733a363a2262617274696b223b733a343a22696e666f223b613a31323a7b733a363a226669656c6473223b613a393a7b733a333a22746f70223b733a31303a2248656164657220746f70223b733a363a22626f74746f6d223b733a31333a2248656164657220626f74746f6d223b733a323a226267223b733a31353a224d61696e206261636b67726f756e64223b733a373a2273696465626172223b733a31383a2253696465626172206261636b67726f756e64223b733a31343a2273696465626172626f7264657273223b733a31353a225369646562617220626f7264657273223b733a363a22666f6f746572223b733a31373a22466f6f746572206261636b67726f756e64223b733a31313a227469746c65736c6f67616e223b733a31363a225469746c6520616e6420736c6f67616e223b733a343a2274657874223b733a31303a225465787420636f6c6f72223b733a343a226c696e6b223b733a31303a224c696e6b20636f6c6f72223b7d733a373a22736368656d6573223b613a363a7b733a373a2264656661756c74223b613a323a7b733a353a227469746c65223b733a32313a22426c7565204c61676f6f6e202864656661756c7429223b733a363a22636f6c6f7273223b613a393a7b733a333a22746f70223b733a373a2223303737396266223b733a363a22626f74746f6d223b733a373a2223343861396534223b733a323a226267223b733a373a2223666666666666223b733a373a2273696465626172223b733a373a2223663666366632223b733a31343a2273696465626172626f7264657273223b733a373a2223663966396639223b733a363a22666f6f746572223b733a373a2223323932393239223b733a31313a227469746c65736c6f67616e223b733a373a2223666666656666223b733a343a2274657874223b733a373a2223336233623362223b733a343a226c696e6b223b733a373a2223303037314233223b7d7d733a393a2266697265686f757365223b613a323a7b733a353a227469746c65223b733a393a2246697265686f757365223b733a363a22636f6c6f7273223b613a393a7b733a333a22746f70223b733a373a2223636432643264223b733a363a22626f74746f6d223b733a373a2223636633353335223b733a323a226267223b733a373a2223666666666666223b733a373a2273696465626172223b733a373a2223663166346630223b733a31343a2273696465626172626f7264657273223b733a373a2223656465646564223b733a363a22666f6f746572223b733a373a2223316631643163223b733a31313a227469746c65736c6f67616e223b733a373a2223666666656666223b733a343a2274657874223b733a373a2223336233623362223b733a343a226c696e6b223b733a373a2223643631323166223b7d7d733a333a22696365223b613a323a7b733a353a227469746c65223b733a333a22496365223b733a363a22636f6c6f7273223b613a393a7b733a333a22746f70223b733a373a2223643064306430223b733a363a22626f74746f6d223b733a373a2223633263346335223b733a323a226267223b733a373a2223666666666666223b733a373a2273696465626172223b733a373a2223666666666666223b733a31343a2273696465626172626f7264657273223b733a373a2223636363636363223b733a363a22666f6f746572223b733a373a2223323432373263223b733a31313a227469746c65736c6f67616e223b733a373a2223303030303030223b733a343a2274657874223b733a373a2223346134613461223b733a343a226c696e6b223b733a373a2223303139646266223b7d7d733a343a22706c756d223b613a323a7b733a353a227469746c65223b733a343a22506c756d223b733a363a22636f6c6f7273223b613a393a7b733a333a22746f70223b733a373a2223346331633538223b733a363a22626f74746f6d223b733a373a2223353933363632223b733a323a226267223b733a373a2223666666646637223b733a373a2273696465626172223b733a373a2223656465646537223b733a31343a2273696465626172626f7264657273223b733a373a2223653765376537223b733a363a22666f6f746572223b733a373a2223326332633238223b733a31313a227469746c65736c6f67616e223b733a373a2223666666666666223b733a343a2274657874223b733a373a2223333031333133223b733a343a226c696e6b223b733a373a2223396434303864223b7d7d733a353a22736c617465223b613a323a7b733a353a227469746c65223b733a353a22536c617465223b733a363a22636f6c6f7273223b613a393a7b733a333a22746f70223b733a373a2223346134613461223b733a363a22626f74746f6d223b733a373a2223346534653465223b733a323a226267223b733a373a2223666666666666223b733a373a2273696465626172223b733a373a2223666666666666223b733a31343a2273696465626172626f7264657273223b733a373a2223643064306430223b733a363a22666f6f746572223b733a373a2223313631363137223b733a31313a227469746c65736c6f67616e223b733a373a2223666666666666223b733a343a2274657874223b733a373a2223336233623362223b733a343a226c696e6b223b733a373a2223303037336236223b7d7d733a303a22223b613a323a7b733a353a227469746c65223b733a363a22437573746f6d223b733a363a22636f6c6f7273223b613a303a7b7d7d7d733a333a22637373223b613a313a7b693a303b733a31343a226373732f636f6c6f72732e637373223b7d733a343a22636f7079223b613a313a7b693a303b733a383a226c6f676f2e706e67223b7d733a393a226772616469656e7473223b613a313a7b693a303b613a333a7b733a393a2264696d656e73696f6e223b613a343a7b693a303b693a303b693a313b693a303b693a323b693a303b693a333b693a303b7d733a393a22646972656374696f6e223b733a383a22766572746963616c223b733a363a22636f6c6f7273223b613a323a7b693a303b733a333a22746f70223b693a313b733a363a22626f74746f6d223b7d7d7d733a343a2266696c6c223b613a303a7b7d733a363a22736c69636573223b613a303a7b7d733a31323a22626c656e645f746172676574223b733a373a2223666666666666223b733a31313a22707265766965775f637373223b733a31373a22636f6c6f722f707265766965772e637373223b733a31303a22707265766965775f6a73223b733a31363a22636f6c6f722f707265766965772e6a73223b733a31323a22707265766965775f68746d6c223b733a31383a22636f6c6f722f707265766965772e68746d6c223b733a31303a22626173655f696d616765223b733a31343a22636f6c6f722f626173652e706e67223b7d7d);
INSERT INTO `variable` VALUES('theme_default', 0x733a363a2262617274696b223b);
INSERT INTO `variable` VALUES('update_last_check', 0x693a313337353832323433303b);
INSERT INTO `variable` VALUES('update_last_email_notification', 0x693a313337353830373239313b);
INSERT INTO `variable` VALUES('update_notify_emails', 0x613a313a7b693a303b733a31393a226f776e74686577656240676d61696c2e636f6d223b7d);
INSERT INTO `variable` VALUES('user_admin_role', 0x733a313a2233223b);
INSERT INTO `variable` VALUES('user_pictures', 0x733a313a2231223b);
INSERT INTO `variable` VALUES('user_picture_dimensions', 0x733a393a22313032347831303234223b);
INSERT INTO `variable` VALUES('user_picture_file_size', 0x733a333a22383030223b);
INSERT INTO `variable` VALUES('user_picture_style', 0x733a393a227468756d626e61696c223b);
INSERT INTO `variable` VALUES('user_register', 0x693a323b);

-- --------------------------------------------------------

--
-- Table structure for table `views_display`
--

CREATE TABLE `views_display` (
  `vid` int(10) unsigned NOT NULL default '0' COMMENT 'The view this display is attached to.',
  `id` varchar(64) NOT NULL default '' COMMENT 'An identifier for this display; usually generated from the display_plugin, so should be something like page or page_1 or block_2, etc.',
  `display_title` varchar(64) NOT NULL default '' COMMENT 'The title of the display, viewable by the administrator.',
  `display_plugin` varchar(64) NOT NULL default '' COMMENT 'The type of the display. Usually page, block or embed, but is pluggable so may be other things.',
  `position` int(11) default '0' COMMENT 'The order in which this display is loaded.',
  `display_options` longtext COMMENT 'A serialized array of options for this display; it contains options that are generally only pertinent to that display plugin type.',
  PRIMARY KEY  (`vid`,`id`),
  KEY `vid` (`vid`,`position`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores information about each display attached to a view.';

--
-- Dumping data for table `views_display`
--

INSERT INTO `views_display` VALUES(1, 'block', 'Content List', 'block', 2, 'a:2:{s:5:"query";a:2:{s:4:"type";s:11:"views_query";s:7:"options";a:0:{}}s:19:"display_description";s:0:"";}');
INSERT INTO `views_display` VALUES(1, 'default', 'Master', 'default', 1, 'a:12:{s:5:"query";a:2:{s:4:"type";s:11:"views_query";s:7:"options";a:0:{}}s:6:"access";a:1:{s:4:"type";s:4:"perm";}s:5:"cache";a:1:{s:4:"type";s:4:"none";}s:12:"exposed_form";a:1:{s:4:"type";s:5:"basic";}s:5:"pager";a:2:{s:4:"type";s:4:"none";s:7:"options";a:1:{s:14:"items_per_page";s:1:"0";}}s:12:"style_plugin";s:5:"table";s:10:"row_plugin";s:6:"fields";s:6:"fields";a:2:{s:5:"title";a:22:{s:2:"id";s:5:"title";s:5:"table";s:4:"node";s:5:"field";s:5:"title";s:12:"relationship";s:4:"none";s:10:"group_type";s:5:"group";s:7:"ui_name";s:0:"";s:5:"label";s:5:"Title";s:7:"exclude";i:0;s:5:"alter";a:26:{s:10:"alter_text";i:0;s:4:"text";s:0:"";s:9:"make_link";i:0;s:4:"path";s:0:"";s:8:"absolute";i:0;s:8:"external";i:0;s:14:"replace_spaces";i:0;s:9:"path_case";s:4:"none";s:15:"trim_whitespace";i:0;s:3:"alt";s:0:"";s:3:"rel";s:0:"";s:10:"link_class";s:0:"";s:6:"prefix";s:0:"";s:6:"suffix";s:0:"";s:6:"target";s:0:"";s:5:"nl2br";i:0;s:10:"max_length";s:0:"";s:13:"word_boundary";i:0;s:8:"ellipsis";i:0;s:9:"more_link";i:0;s:14:"more_link_text";s:0:"";s:14:"more_link_path";s:0:"";s:10:"strip_tags";i:0;s:4:"trim";i:0;s:13:"preserve_tags";s:0:"";s:4:"html";i:0;}s:12:"element_type";s:0:"";s:13:"element_class";s:0:"";s:18:"element_label_type";s:0:"";s:19:"element_label_class";s:0:"";s:19:"element_label_colon";i:1;s:20:"element_wrapper_type";s:0:"";s:21:"element_wrapper_class";s:0:"";s:23:"element_default_classes";i:1;s:5:"empty";s:0:"";s:10:"hide_empty";i:0;s:10:"empty_zero";i:0;s:16:"hide_alter_empty";i:1;s:12:"link_to_node";i:1;}s:7:"changed";a:24:{s:2:"id";s:7:"changed";s:5:"table";s:4:"node";s:5:"field";s:7:"changed";s:12:"relationship";s:4:"none";s:10:"group_type";s:5:"group";s:7:"ui_name";s:0:"";s:5:"label";s:12:"Updated Date";s:7:"exclude";i:0;s:5:"alter";a:26:{s:10:"alter_text";i:0;s:4:"text";s:0:"";s:9:"make_link";i:0;s:4:"path";s:0:"";s:8:"absolute";i:0;s:8:"external";i:0;s:14:"replace_spaces";i:0;s:9:"path_case";s:4:"none";s:15:"trim_whitespace";i:0;s:3:"alt";s:0:"";s:3:"rel";s:0:"";s:10:"link_class";s:0:"";s:6:"prefix";s:0:"";s:6:"suffix";s:0:"";s:6:"target";s:0:"";s:5:"nl2br";i:0;s:10:"max_length";s:0:"";s:13:"word_boundary";i:1;s:8:"ellipsis";i:1;s:9:"more_link";i:0;s:14:"more_link_text";s:0:"";s:14:"more_link_path";s:0:"";s:10:"strip_tags";i:0;s:4:"trim";i:0;s:13:"preserve_tags";s:0:"";s:4:"html";i:0;}s:12:"element_type";s:0:"";s:13:"element_class";s:0:"";s:18:"element_label_type";s:0:"";s:19:"element_label_class";s:0:"";s:19:"element_label_colon";i:1;s:20:"element_wrapper_type";s:0:"";s:21:"element_wrapper_class";s:0:"";s:23:"element_default_classes";i:1;s:5:"empty";s:0:"";s:10:"hide_empty";i:0;s:10:"empty_zero";i:0;s:16:"hide_alter_empty";i:1;s:11:"date_format";s:4:"long";s:18:"custom_date_format";s:0:"";s:8:"timezone";s:0:"";}}s:7:"filters";a:2:{s:6:"status";a:6:{s:5:"value";i:1;s:5:"table";s:4:"node";s:5:"field";s:6:"status";s:2:"id";s:6:"status";s:6:"expose";a:1:{s:8:"operator";b:0;}s:5:"group";i:1;}s:4:"type";a:13:{s:2:"id";s:4:"type";s:5:"table";s:4:"node";s:5:"field";s:4:"type";s:12:"relationship";s:4:"none";s:10:"group_type";s:5:"group";s:7:"ui_name";s:0:"";s:8:"operator";s:2:"in";s:5:"value";a:1:{s:10:"qr_content";s:10:"qr_content";}s:5:"group";s:1:"1";s:7:"exposed";b:0;s:6:"expose";a:11:{s:11:"operator_id";b:0;s:5:"label";s:0:"";s:11:"description";s:0:"";s:12:"use_operator";b:0;s:8:"operator";s:0:"";s:10:"identifier";s:0:"";s:8:"required";b:0;s:8:"remember";b:0;s:8:"multiple";b:0;s:14:"remember_roles";a:1:{i:2;i:2;}s:6:"reduce";b:0;}s:10:"is_grouped";b:0;s:10:"group_info";a:10:{s:5:"label";s:0:"";s:11:"description";s:0:"";s:10:"identifier";s:0:"";s:8:"optional";b:1;s:6:"widget";s:6:"select";s:8:"multiple";b:0;s:8:"remember";i:0;s:13:"default_group";s:3:"All";s:22:"default_group_multiple";a:0:{}s:11:"group_items";a:0:{}}}}s:5:"sorts";a:2:{s:5:"title";a:9:{s:2:"id";s:5:"title";s:5:"table";s:4:"node";s:5:"field";s:5:"title";s:12:"relationship";s:4:"none";s:10:"group_type";s:5:"group";s:7:"ui_name";s:0:"";s:5:"order";s:3:"ASC";s:7:"exposed";b:1;s:6:"expose";a:2:{s:5:"label";s:5:"Title";s:5:"order";s:3:"ASC";}}s:7:"created";a:10:{s:2:"id";s:7:"created";s:5:"table";s:4:"node";s:5:"field";s:7:"created";s:12:"relationship";s:4:"none";s:10:"group_type";s:5:"group";s:7:"ui_name";s:0:"";s:5:"order";s:4:"DESC";s:7:"exposed";b:1;s:6:"expose";a:2:{s:5:"label";s:9:"Post date";s:5:"order";s:4:"DESC";}s:11:"granularity";s:6:"second";}}s:5:"title";s:10:"QR Content";s:13:"style_options";a:0:{}}');
INSERT INTO `views_display` VALUES(1, 'services_1', 'Services', 'services', 3, 'a:8:{s:5:"query";a:2:{s:4:"type";s:11:"views_query";s:7:"options";a:0:{}}s:4:"path";s:13:"content-feed2";s:6:"fields";a:6:{s:5:"title";a:22:{s:2:"id";s:5:"title";s:5:"table";s:4:"node";s:5:"field";s:5:"title";s:12:"relationship";s:4:"none";s:10:"group_type";s:5:"group";s:7:"ui_name";s:0:"";s:5:"label";s:5:"Title";s:7:"exclude";i:0;s:5:"alter";a:26:{s:10:"alter_text";i:0;s:4:"text";s:0:"";s:9:"make_link";i:0;s:4:"path";s:0:"";s:8:"absolute";i:0;s:8:"external";i:0;s:14:"replace_spaces";i:0;s:9:"path_case";s:4:"none";s:15:"trim_whitespace";i:0;s:3:"alt";s:0:"";s:3:"rel";s:0:"";s:10:"link_class";s:0:"";s:6:"prefix";s:0:"";s:6:"suffix";s:0:"";s:6:"target";s:0:"";s:5:"nl2br";i:0;s:10:"max_length";s:0:"";s:13:"word_boundary";i:0;s:8:"ellipsis";i:0;s:9:"more_link";i:0;s:14:"more_link_text";s:0:"";s:14:"more_link_path";s:0:"";s:10:"strip_tags";i:0;s:4:"trim";i:0;s:13:"preserve_tags";s:0:"";s:4:"html";i:0;}s:12:"element_type";s:0:"";s:13:"element_class";s:0:"";s:18:"element_label_type";s:0:"";s:19:"element_label_class";s:0:"";s:19:"element_label_colon";i:1;s:20:"element_wrapper_type";s:0:"";s:21:"element_wrapper_class";s:0:"";s:23:"element_default_classes";i:1;s:5:"empty";s:0:"";s:10:"hide_empty";i:0;s:10:"empty_zero";i:0;s:16:"hide_alter_empty";i:1;s:12:"link_to_node";i:1;}s:7:"changed";a:24:{s:2:"id";s:7:"changed";s:5:"table";s:4:"node";s:5:"field";s:7:"changed";s:12:"relationship";s:4:"none";s:10:"group_type";s:5:"group";s:7:"ui_name";s:0:"";s:5:"label";s:12:"Updated Date";s:7:"exclude";i:0;s:5:"alter";a:26:{s:10:"alter_text";i:0;s:4:"text";s:0:"";s:9:"make_link";i:0;s:4:"path";s:0:"";s:8:"absolute";i:0;s:8:"external";i:0;s:14:"replace_spaces";i:0;s:9:"path_case";s:4:"none";s:15:"trim_whitespace";i:0;s:3:"alt";s:0:"";s:3:"rel";s:0:"";s:10:"link_class";s:0:"";s:6:"prefix";s:0:"";s:6:"suffix";s:0:"";s:6:"target";s:0:"";s:5:"nl2br";i:0;s:10:"max_length";s:0:"";s:13:"word_boundary";i:1;s:8:"ellipsis";i:1;s:9:"more_link";i:0;s:14:"more_link_text";s:0:"";s:14:"more_link_path";s:0:"";s:10:"strip_tags";i:0;s:4:"trim";i:0;s:13:"preserve_tags";s:0:"";s:4:"html";i:0;}s:12:"element_type";s:0:"";s:13:"element_class";s:0:"";s:18:"element_label_type";s:0:"";s:19:"element_label_class";s:0:"";s:19:"element_label_colon";i:1;s:20:"element_wrapper_type";s:0:"";s:21:"element_wrapper_class";s:0:"";s:23:"element_default_classes";i:1;s:5:"empty";s:0:"";s:10:"hide_empty";i:0;s:10:"empty_zero";i:0;s:16:"hide_alter_empty";i:1;s:11:"date_format";s:4:"long";s:18:"custom_date_format";s:0:"";s:8:"timezone";s:0:"";}s:4:"body";a:34:{s:2:"id";s:4:"body";s:5:"table";s:15:"field_data_body";s:5:"field";s:4:"body";s:12:"relationship";s:4:"none";s:10:"group_type";s:5:"group";s:7:"ui_name";s:0:"";s:5:"label";s:12:"Body Content";s:7:"exclude";i:0;s:5:"alter";a:26:{s:10:"alter_text";i:0;s:4:"text";s:0:"";s:9:"make_link";i:0;s:4:"path";s:0:"";s:8:"absolute";i:0;s:8:"external";i:0;s:14:"replace_spaces";i:0;s:9:"path_case";s:4:"none";s:15:"trim_whitespace";i:0;s:3:"alt";s:0:"";s:3:"rel";s:0:"";s:10:"link_class";s:0:"";s:6:"prefix";s:0:"";s:6:"suffix";s:0:"";s:6:"target";s:0:"";s:5:"nl2br";i:0;s:10:"max_length";s:0:"";s:13:"word_boundary";i:1;s:8:"ellipsis";i:1;s:9:"more_link";i:0;s:14:"more_link_text";s:0:"";s:14:"more_link_path";s:0:"";s:10:"strip_tags";i:0;s:4:"trim";i:0;s:13:"preserve_tags";s:0:"";s:4:"html";i:0;}s:12:"element_type";s:0:"";s:13:"element_class";s:0:"";s:18:"element_label_type";s:0:"";s:19:"element_label_class";s:0:"";s:19:"element_label_colon";i:1;s:20:"element_wrapper_type";s:0:"";s:21:"element_wrapper_class";s:0:"";s:23:"element_default_classes";i:1;s:5:"empty";s:0:"";s:10:"hide_empty";i:0;s:10:"empty_zero";i:0;s:16:"hide_alter_empty";i:1;s:17:"click_sort_column";s:5:"value";s:4:"type";s:8:"services";s:8:"settings";a:2:{s:9:"skip_safe";i:0;s:17:"skip_empty_values";i:0;}s:12:"group_column";s:5:"value";s:13:"group_columns";a:0:{}s:10:"group_rows";b:1;s:11:"delta_limit";s:3:"all";s:12:"delta_offset";i:0;s:14:"delta_reversed";b:0;s:16:"delta_first_last";b:0;s:10:"multi_type";s:9:"separator";s:9:"separator";s:2:", ";s:17:"field_api_classes";i:0;}s:15:"field_mp3_audio";a:34:{s:2:"id";s:15:"field_mp3_audio";s:5:"table";s:26:"field_data_field_mp3_audio";s:5:"field";s:15:"field_mp3_audio";s:12:"relationship";s:4:"none";s:10:"group_type";s:5:"group";s:7:"ui_name";s:0:"";s:5:"label";s:9:"MP3 Audio";s:7:"exclude";i:0;s:5:"alter";a:26:{s:10:"alter_text";i:0;s:4:"text";s:0:"";s:9:"make_link";i:0;s:4:"path";s:0:"";s:8:"absolute";i:0;s:8:"external";i:1;s:14:"replace_spaces";i:0;s:9:"path_case";s:4:"none";s:15:"trim_whitespace";i:0;s:3:"alt";s:0:"";s:3:"rel";s:0:"";s:10:"link_class";s:0:"";s:6:"prefix";s:0:"";s:6:"suffix";s:0:"";s:6:"target";s:0:"";s:5:"nl2br";i:0;s:10:"max_length";s:0:"";s:13:"word_boundary";i:1;s:8:"ellipsis";i:1;s:9:"more_link";i:0;s:14:"more_link_text";s:0:"";s:14:"more_link_path";s:0:"";s:10:"strip_tags";i:0;s:4:"trim";i:0;s:13:"preserve_tags";s:0:"";s:4:"html";i:0;}s:12:"element_type";s:0:"";s:13:"element_class";s:0:"";s:18:"element_label_type";s:0:"";s:19:"element_label_class";s:0:"";s:19:"element_label_colon";i:1;s:20:"element_wrapper_type";s:0:"";s:21:"element_wrapper_class";s:0:"";s:23:"element_default_classes";i:1;s:5:"empty";s:0:"";s:10:"hide_empty";i:0;s:10:"empty_zero";i:0;s:16:"hide_alter_empty";i:1;s:17:"click_sort_column";s:3:"fid";s:4:"type";s:14:"file_url_plain";s:8:"settings";a:0:{}s:12:"group_column";s:0:"";s:13:"group_columns";a:0:{}s:10:"group_rows";b:1;s:11:"delta_limit";s:3:"all";s:12:"delta_offset";i:0;s:14:"delta_reversed";b:0;s:16:"delta_first_last";b:0;s:10:"multi_type";s:9:"separator";s:9:"separator";s:2:", ";s:17:"field_api_classes";i:0;}s:16:"field_video_link";a:34:{s:2:"id";s:16:"field_video_link";s:5:"table";s:27:"field_data_field_video_link";s:5:"field";s:16:"field_video_link";s:12:"relationship";s:4:"none";s:10:"group_type";s:5:"group";s:7:"ui_name";s:0:"";s:5:"label";s:10:"Video Link";s:7:"exclude";i:0;s:5:"alter";a:26:{s:10:"alter_text";i:0;s:4:"text";s:0:"";s:9:"make_link";i:0;s:4:"path";s:0:"";s:8:"absolute";i:0;s:8:"external";i:0;s:14:"replace_spaces";i:0;s:9:"path_case";s:4:"none";s:15:"trim_whitespace";i:0;s:3:"alt";s:0:"";s:3:"rel";s:0:"";s:10:"link_class";s:0:"";s:6:"prefix";s:0:"";s:6:"suffix";s:0:"";s:6:"target";s:0:"";s:5:"nl2br";i:0;s:10:"max_length";s:0:"";s:13:"word_boundary";i:1;s:8:"ellipsis";i:1;s:9:"more_link";i:0;s:14:"more_link_text";s:0:"";s:14:"more_link_path";s:0:"";s:10:"strip_tags";i:0;s:4:"trim";i:0;s:13:"preserve_tags";s:0:"";s:4:"html";i:0;}s:12:"element_type";s:0:"";s:13:"element_class";s:0:"";s:18:"element_label_type";s:0:"";s:19:"element_label_class";s:0:"";s:19:"element_label_colon";i:1;s:20:"element_wrapper_type";s:0:"";s:21:"element_wrapper_class";s:0:"";s:23:"element_default_classes";i:1;s:5:"empty";s:0:"";s:10:"hide_empty";i:0;s:10:"empty_zero";i:0;s:16:"hide_alter_empty";i:1;s:17:"click_sort_column";s:5:"value";s:4:"type";s:10:"text_plain";s:8:"settings";a:2:{s:9:"skip_safe";i:0;s:17:"skip_empty_values";i:0;}s:12:"group_column";s:5:"value";s:13:"group_columns";a:0:{}s:10:"group_rows";b:1;s:11:"delta_limit";s:3:"all";s:12:"delta_offset";i:0;s:14:"delta_reversed";b:0;s:16:"delta_first_last";b:0;s:10:"multi_type";s:9:"separator";s:9:"separator";s:2:", ";s:17:"field_api_classes";i:0;}s:21:"field_video_thumbnail";a:34:{s:2:"id";s:21:"field_video_thumbnail";s:5:"table";s:32:"field_data_field_video_thumbnail";s:5:"field";s:21:"field_video_thumbnail";s:12:"relationship";s:4:"none";s:10:"group_type";s:5:"group";s:7:"ui_name";s:0:"";s:5:"label";s:15:"Video Thumbnail";s:7:"exclude";i:0;s:5:"alter";a:26:{s:10:"alter_text";i:0;s:4:"text";s:0:"";s:9:"make_link";i:0;s:4:"path";s:0:"";s:8:"absolute";i:0;s:8:"external";i:0;s:14:"replace_spaces";i:0;s:9:"path_case";s:4:"none";s:15:"trim_whitespace";i:0;s:3:"alt";s:0:"";s:3:"rel";s:0:"";s:10:"link_class";s:0:"";s:6:"prefix";s:0:"";s:6:"suffix";s:0:"";s:6:"target";s:0:"";s:5:"nl2br";i:0;s:10:"max_length";s:0:"";s:13:"word_boundary";i:1;s:8:"ellipsis";i:1;s:9:"more_link";i:0;s:14:"more_link_text";s:0:"";s:14:"more_link_path";s:0:"";s:10:"strip_tags";i:0;s:4:"trim";i:0;s:13:"preserve_tags";s:0:"";s:4:"html";i:0;}s:12:"element_type";s:0:"";s:13:"element_class";s:0:"";s:18:"element_label_type";s:0:"";s:19:"element_label_class";s:0:"";s:19:"element_label_colon";i:1;s:20:"element_wrapper_type";s:0:"";s:21:"element_wrapper_class";s:0:"";s:23:"element_default_classes";i:1;s:5:"empty";s:0:"";s:10:"hide_empty";i:0;s:10:"empty_zero";i:0;s:16:"hide_alter_empty";i:1;s:17:"click_sort_column";s:3:"fid";s:4:"type";s:14:"file_url_plain";s:8:"settings";a:0:{}s:12:"group_column";s:0:"";s:13:"group_columns";a:0:{}s:10:"group_rows";b:1;s:11:"delta_limit";s:3:"all";s:12:"delta_offset";i:0;s:14:"delta_reversed";b:0;s:16:"delta_first_last";b:0;s:10:"multi_type";s:9:"separator";s:9:"separator";s:2:", ";s:17:"field_api_classes";i:0;}}s:8:"defaults";a:5:{s:6:"fields";b:0;s:12:"style_plugin";b:0;s:13:"style_options";b:0;s:10:"row_plugin";b:0;s:11:"row_options";b:0;}s:12:"style_plugin";s:7:"default";s:13:"style_options";a:4:{s:8:"grouping";a:0:{}s:9:"row_class";s:0:"";s:17:"default_row_class";i:1;s:17:"row_class_special";i:1;}s:10:"row_plugin";s:6:"fields";s:11:"row_options";a:0:{}}');

-- --------------------------------------------------------

--
-- Table structure for table `views_view`
--

CREATE TABLE `views_view` (
  `vid` int(10) unsigned NOT NULL auto_increment COMMENT 'The view ID of the field, defined by the database.',
  `name` varchar(128) NOT NULL default '' COMMENT 'The unique name of the view. This is the primary field views are loaded from, and is used so that views may be internal and not necessarily in the database. May only be alphanumeric characters plus underscores.',
  `description` varchar(255) default '' COMMENT 'A description of the view for the admin interface.',
  `tag` varchar(255) default '' COMMENT 'A tag used to group/sort views in the admin interface',
  `base_table` varchar(64) NOT NULL default '' COMMENT 'What table this view is based on, such as node, user, comment, or term.',
  `human_name` varchar(255) default '' COMMENT 'A human readable name used to be displayed in the admin interface',
  `core` int(11) default '0' COMMENT 'Stores the drupal core version of the view.',
  PRIMARY KEY  (`vid`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Stores the general data for a view.' AUTO_INCREMENT=2 ;

--
-- Dumping data for table `views_view`
--

INSERT INTO `views_view` VALUES(1, 'qr_content', '', 'default', 'node', 'QR Content', 7);

-- --------------------------------------------------------

--
-- Table structure for table `watchdog`
--

CREATE TABLE `watchdog` (
  `wid` int(11) NOT NULL auto_increment COMMENT 'Primary Key: Unique watchdog event ID.',
  `uid` int(11) NOT NULL default '0' COMMENT 'The users.uid of the user who triggered the event.',
  `type` varchar(64) NOT NULL default '' COMMENT 'Type of log message, for example "user" or "page not found."',
  `message` longtext NOT NULL COMMENT 'Text of log message to be passed into the t() function.',
  `variables` longblob NOT NULL COMMENT 'Serialized array of variables that match the message string and that is passed into the t() function.',
  `severity` tinyint(3) unsigned NOT NULL default '0' COMMENT 'The severity level of the event; ranges from 0 (Emergency) to 7 (Debug)',
  `link` varchar(255) default '' COMMENT 'Link to view the result of the event.',
  `location` text NOT NULL COMMENT 'URL of the origin of the event.',
  `referer` text COMMENT 'URL of referring page.',
  `hostname` varchar(128) NOT NULL default '' COMMENT 'Hostname of the user who triggered the event.',
  `timestamp` int(11) NOT NULL default '0' COMMENT 'Unix timestamp of when event occurred.',
  PRIMARY KEY  (`wid`),
  KEY `type` (`type`),
  KEY `uid` (`uid`),
  KEY `severity` (`severity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Table that contains logs of all system events.' AUTO_INCREMENT=1 ;

--
-- Dumping data for table `watchdog`
--


-- --------------------------------------------------------

--
-- Table structure for table `wysiwyg`
--

CREATE TABLE `wysiwyg` (
  `format` varchar(255) NOT NULL COMMENT 'The filter_format.format of the text format.',
  `editor` varchar(128) NOT NULL default '' COMMENT 'Internal name of the editor attached to the text format.',
  `settings` text COMMENT 'Configuration settings for the editor.',
  PRIMARY KEY  (`format`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores Wysiwyg profiles.';

--
-- Dumping data for table `wysiwyg`
--

INSERT INTO `wysiwyg` VALUES('filtered_html', 'tinymce', NULL);
INSERT INTO `wysiwyg` VALUES('full_html', 'tinymce', 'a:20:{s:7:"default";i:1;s:11:"user_choose";i:0;s:11:"show_toggle";i:1;s:5:"theme";s:8:"advanced";s:8:"language";s:2:"en";s:7:"buttons";a:4:{s:7:"default";a:16:{s:4:"bold";i:1;s:6:"italic";i:1;s:9:"underline";i:1;s:13:"strikethrough";i:1;s:7:"bullist";i:1;s:7:"numlist";i:1;s:4:"link";i:1;s:6:"unlink";i:1;s:6:"anchor";i:1;s:5:"image";i:1;s:7:"cleanup";i:1;s:12:"formatselect";i:1;s:11:"styleselect";i:1;s:9:"forecolor";i:1;s:9:"backcolor";i:1;s:12:"removeformat";i:1;}s:8:"advimage";a:1:{s:8:"advimage";i:1;}s:5:"paste";a:1:{s:9:"pasteword";i:1;}s:9:"wordcount";a:1:{s:9:"wordcount";i:1;}}s:11:"toolbar_loc";s:3:"top";s:13:"toolbar_align";s:4:"left";s:8:"path_loc";s:6:"bottom";s:8:"resizing";i:1;s:11:"verify_html";i:1;s:12:"preformatted";i:0;s:22:"convert_fonts_to_spans";i:1;s:17:"remove_linebreaks";i:1;s:23:"apply_source_formatting";i:0;s:27:"paste_auto_cleanup_on_paste";i:1;s:13:"block_formats";s:32:"p,address,pre,h2,h3,h4,h5,h6,div";s:11:"css_setting";s:5:"theme";s:8:"css_path";s:0:"";s:11:"css_classes";s:0:"";}');
INSERT INTO `wysiwyg` VALUES('plain_text', '', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `wysiwyg_user`
--

CREATE TABLE `wysiwyg_user` (
  `uid` int(10) unsigned NOT NULL default '0' COMMENT 'The users.uid of the user.',
  `format` varchar(255) default NULL COMMENT 'The filter_format.format of the text format.',
  `status` tinyint(3) unsigned NOT NULL default '0' COMMENT 'Boolean indicating whether the format is enabled by default.',
  KEY `uid` (`uid`),
  KEY `format` (`format`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores user preferences for wysiwyg profiles.';

--
-- Dumping data for table `wysiwyg_user`
--


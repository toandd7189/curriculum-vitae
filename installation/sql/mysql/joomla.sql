
DROP TABLE IF EXISTS `#__assets`;
CREATE TABLE `#__assets` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Primary Key',
  `parent_id` int(11) NOT NULL DEFAULT 0 COMMENT 'Nested set parent.',
  `lft` int(11) NOT NULL DEFAULT 0 COMMENT 'Nested set lft.',
  `rgt` int(11) NOT NULL DEFAULT 0 COMMENT 'Nested set rgt.',
  `level` int(10) unsigned NOT NULL COMMENT 'The cached level in the nested tree.',
  `name` varchar(50) NOT NULL COMMENT 'The unique name for the asset.\n',
  `title` varchar(100) NOT NULL COMMENT 'The descriptive title for the asset.',
  `rules` varchar(5120) NOT NULL COMMENT 'JSON encoded access control.',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_asset_name` (`name`),
  KEY `idx_lft_rgt` (`lft`,`rgt`),
  KEY `idx_parent_id` (`parent_id`)
) ENGINE=InnoDB AUTO_INCREMENT=499 DEFAULT CHARSET=utf8;

INSERT INTO `#__assets` (`id`, `parent_id`, `lft`, `rgt`, `level`, `name`, `title`, `rules`) VALUES
(1, 0, 0, 761, 0, 'root.1', 'Root Asset', '{"core.login.site":{"6":1,"2":1},"core.login.admin":{"6":1},"core.login.offline":{"6":1},"core.admin":{"8":1},"core.manage":{"7":1},"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(2, 1, 1, 2, 1, 'com_admin', 'com_admin', '{}'),
(3, 1, 3, 6, 1, 'com_banners', 'com_banners', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(4, 1, 7, 8, 1, 'com_cache', 'com_cache', '{"core.admin":{"7":1},"core.manage":{"7":1}}'),
(5, 1, 9, 10, 1, 'com_checkin', 'com_checkin', '{"core.admin":{"7":1},"core.manage":{"7":1}}'),
(6, 1, 11, 12, 1, 'com_config', 'com_config', '{}'),
(7, 1, 13, 16, 1, 'com_contact', 'com_contact', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[],"core.edit.own":[]}'),
(8, 1, 17, 520, 1, 'com_content', 'com_content', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":{"3":1},"core.delete":[],"core.edit":{"4":1},"core.edit.state":{"5":1},"core.edit.own":[]}'),
(9, 1, 521, 522, 1, 'com_cpanel', 'com_cpanel', '{}'),
(10, 1, 523, 524, 1, 'com_installer', 'com_installer', '{"core.admin":[],"core.manage":{"7":0},"core.delete":{"7":0},"core.edit.state":{"7":0}}'),
(11, 1, 525, 526, 1, 'com_languages', 'com_languages', '{"core.admin":{"7":1},"core.manage":[],"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(12, 1, 527, 528, 1, 'com_login', 'com_login', '{}'),
(13, 1, 529, 530, 1, 'com_mailto', 'com_mailto', '{}'),
(14, 1, 531, 532, 1, 'com_massmail', 'com_massmail', '{}'),
(15, 1, 533, 534, 1, 'com_media', 'com_media', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":{"3":1},"core.delete":{"5":1}}'),
(16, 1, 535, 536, 1, 'com_menus', 'com_menus', '{"core.admin":{"7":1},"core.manage":[],"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(17, 1, 537, 538, 1, 'com_messages', 'com_messages', '{"core.admin":{"7":1},"core.manage":{"7":1}}'),
(18, 1, 539, 702, 1, 'com_modules', 'com_modules', '{"core.admin":{"7":1},"core.manage":[],"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(19, 1, 703, 706, 1, 'com_newsfeeds', 'com_newsfeeds', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[],"core.edit.own":[]}'),
(20, 1, 707, 708, 1, 'com_plugins', 'com_plugins', '{"core.admin":{"7":1},"core.manage":[],"core.edit":[],"core.edit.state":[]}'),
(21, 1, 709, 710, 1, 'com_redirect', 'com_redirect', '{"core.admin":{"7":1},"core.manage":[]}'),
(22, 1, 711, 712, 1, 'com_search', 'com_search', '{"core.admin":{"7":1},"core.manage":{"6":1}}'),
(23, 1, 713, 714, 1, 'com_templates', 'com_templates', '{"core.admin":{"7":1},"core.manage":[],"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(24, 1, 715, 718, 1, 'com_users', 'com_users', '{"core.admin":{"7":1},"core.manage":[],"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(26, 1, 719, 720, 1, 'com_wrapper', 'com_wrapper', '{}'),
(27, 8, 18, 27, 2, 'com_content.category.2', 'Uncategorised', '{"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[],"core.edit.own":[]}'),
(28, 3, 4, 5, 2, 'com_banners.category.3', 'Uncategorised', '{"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(29, 7, 14, 15, 2, 'com_contact.category.4', 'Uncategorised', '{"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[],"core.edit.own":[]}'),
(30, 19, 704, 705, 2, 'com_newsfeeds.category.5', 'Uncategorised', '{"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[],"core.edit.own":[]}'),
(32, 24, 716, 717, 1, 'com_users.category.7', 'Uncategorised', '{"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(33, 1, 721, 722, 1, 'com_finder', 'com_finder', '{"core.admin":{"7":1},"core.manage":{"6":1}}'),
(34, 1, 723, 724, 1, 'com_joomlaupdate', 'com_joomlaupdate', '{"core.admin":[],"core.manage":[],"core.delete":[],"core.edit.state":[]}'),
(35, 1, 725, 726, 1, 'com_tags', 'com_tags', '{"core.admin":[],"core.manage":[],"core.manage":[],"core.delete":[],"core.edit.state":[]}'),
(36, 1, 727, 728, 1, 'com_contenthistory', 'com_contenthistory', '{}'),
(37, 1, 729, 730, 1, 'com_ajax', 'com_ajax', '{}'),
(38, 1, 731, 732, 1, 'com_postinstall', 'com_postinstall', '{}'),
(40, 18, 540, 541, 2, 'com_modules.module.2', 'Login', '{"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(41, 18, 542, 543, 2, 'com_modules.module.3', 'Popular Articles', '{"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(42, 18, 544, 545, 2, 'com_modules.module.4', 'Recently Added Articles', '{"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(43, 18, 546, 547, 2, 'com_modules.module.8', 'Toolbar', '{"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(44, 18, 548, 549, 2, 'com_modules.module.9', 'Quick Icons', '{"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(45, 18, 550, 551, 2, 'com_modules.module.10', 'Logged-in Users', '{"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(46, 18, 552, 553, 2, 'com_modules.module.12', 'Admin Menu', '{"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(47, 18, 554, 555, 2, 'com_modules.module.13', 'Admin Submenu', '{"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(48, 18, 556, 557, 2, 'com_modules.module.14', 'User Status', '{"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(49, 18, 558, 559, 2, 'com_modules.module.15', 'Title', '{"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(52, 18, 560, 561, 2, 'com_modules.module.79', 'Multilanguage status', '{"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(53, 18, 562, 563, 2, 'com_modules.module.86', 'Joomla Version', '{"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(54, 18, 564, 565, 2, 'com_modules.module.87', 'Introduction', '{"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"module.edit.frontend":[]}'),
(56, 18, 566, 567, 2, 'com_modules.module.89', 'Send Me a Message', '{"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"module.edit.frontend":[]}'),
(57, 18, 568, 569, 2, 'com_modules.module.90', 'About Me', '{"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"module.edit.frontend":[]}'),
(58, 18, 570, 571, 2, 'com_modules.module.91', 'Timeline', '{"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"module.edit.frontend":[]}'),
(59, 18, 572, 573, 2, 'com_modules.module.92', 'Gallery', '{"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"module.edit.frontend":[]}'),
(60, 18, 574, 575, 2, 'com_modules.module.93', '[Photographer] My Skills', '{"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"module.edit.frontend":[]}'),
(61, 18, 576, 577, 2, 'com_modules.module.94', '[Photographer] My Skill 1', '{"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"module.edit.frontend":[]}'),
(62, 18, 578, 579, 2, 'com_modules.module.95', '[Photographer] My Skill 2', '{"core.delete":[],"core.edit":[],"core.edit.state":[],"module.edit.frontend":[]}'),
(63, 18, 580, 581, 2, 'com_modules.module.96', 'Testimonial', '{"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"module.edit.frontend":[]}'),
(65, 18, 582, 583, 2, 'com_modules.module.98', 'Contact', '{"core.delete":[],"core.edit":[],"core.edit.state":[],"module.edit.frontend":[]}'),
(66, 18, 584, 585, 2, 'com_modules.module.99', 'Contact', '{"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"module.edit.frontend":[]}'),
(67, 18, 586, 587, 2, 'com_modules.module.100', 'Clients', '{"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"module.edit.frontend":[]}'),
(68, 8, 28, 73, 2, 'com_content.category.8', 'Blog', '{}'),
(69, 68, 29, 72, 3, 'com_content.category.9', 'Photographer', '{}'),
(70, 69, 30, 31, 4, 'com_content.article.1', 'Growing the client services team', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":{"3":1},"core.delete":[],"core.edit":{"4":1},"core.edit.state":{"5":1},"core.edit.own":[]}'),
(71, 69, 32, 33, 4, 'com_content.article.2', 'Articulating Your Business Model and Questions to Consider', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":{"3":1},"core.delete":[],"core.edit":{"4":1},"core.edit.state":{"5":1},"core.edit.own":[]}'),
(72, 69, 34, 35, 4, 'com_content.article.3', 'Collecting coats and food for those in crisis this winter', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":{"3":1},"core.delete":[],"core.edit":{"4":1},"core.edit.state":{"5":1},"core.edit.own":[]}'),
(73, 69, 36, 37, 4, 'com_content.article.4', 'Advice from the standard setters', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":{"3":1},"core.delete":[],"core.edit":{"4":1},"core.edit.state":{"5":1},"core.edit.own":[]}'),
(74, 69, 38, 39, 4, 'com_content.article.5', 'Corporate social media', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":{"3":1},"core.delete":[],"core.edit":{"4":1},"core.edit.state":{"5":1},"core.edit.own":[]}'),
(75, 69, 40, 41, 4, 'com_content.article.6', 'Design Portfolio welcomes new Creative Director ', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":{"3":1},"core.delete":[],"core.edit":{"4":1},"core.edit.state":{"5":1},"core.edit.own":[]}'),
(76, 69, 42, 43, 4, 'com_content.article.7', 'Best practice governance reporting', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":{"3":1},"core.delete":[],"core.edit":{"4":1},"core.edit.state":{"5":1},"core.edit.own":[]}'),
(77, 69, 44, 45, 4, 'com_content.article.8', 'Championing effective communications for smaller companies', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":{"3":1},"core.delete":[],"core.edit":{"4":1},"core.edit.state":{"5":1},"core.edit.own":[]}'),
(78, 69, 46, 47, 4, 'com_content.article.9', 'Growing the digital team', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":{"3":1},"core.delete":[],"core.edit":{"4":1},"core.edit.state":{"5":1},"core.edit.own":[]}'),
(106, 18, 588, 589, 2, 'com_modules.module.127', 'Other Menu', '{"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"module.edit.frontend":[]}'),
(107, 18, 590, 591, 2, 'com_modules.module.128', 'Main Menu', '{"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"module.edit.frontend":[]}'),
(108, 8, 74, 483, 2, 'com_content.category.10', 'Social Feed', '{}'),
(109, 108, 75, 108, 3, 'com_content.category.11', 'Facebook', '{}'),
(110, 108, 109, 110, 3, 'com_content.category.12', 'Twitter', '{}'),
(111, 108, 111, 114, 3, 'com_content.category.13', 'Instagram', '{}'),
(112, 108, 115, 398, 3, 'com_content.category.14', 'Vimeo', '{}'),
(113, 108, 399, 440, 3, 'com_content.category.15', 'Flickr', '{}'),
(114, 108, 441, 482, 3, 'com_content.category.16', 'Pinterest', '{}'),
(196, 113, 400, 401, 4, 'com_content.article.91', 'Linuxworld Expo San Francisco 2006', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":{"3":1},"core.delete":[],"core.edit":{"4":1},"core.edit.state":{"5":1},"core.edit.own":[]}'),
(197, 113, 402, 403, 4, 'com_content.article.92', 'Linuxworld Expo San Francisco 2006', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":{"3":1},"core.delete":[],"core.edit":{"4":1},"core.edit.state":{"5":1},"core.edit.own":[]}'),
(198, 113, 404, 405, 4, 'com_content.article.93', 'Linuxworld Expo San Francisco 2006', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":{"3":1},"core.delete":[],"core.edit":{"4":1},"core.edit.state":{"5":1},"core.edit.own":[]}'),
(199, 113, 406, 407, 4, 'com_content.article.94', 'Linuxworld Expo San Francisco 2006', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":{"3":1},"core.delete":[],"core.edit":{"4":1},"core.edit.state":{"5":1},"core.edit.own":[]}'),
(200, 113, 408, 409, 4, 'com_content.article.95', 'Linuxworld Expo San Francisco 2006', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":{"3":1},"core.delete":[],"core.edit":{"4":1},"core.edit.state":{"5":1},"core.edit.own":[]}'),
(201, 113, 410, 411, 4, 'com_content.article.96', 'Linuxworld Expo San Francisco 2006', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":{"3":1},"core.delete":[],"core.edit":{"4":1},"core.edit.state":{"5":1},"core.edit.own":[]}'),
(202, 113, 412, 413, 4, 'com_content.article.97', 'Linuxworld Expo San Francisco 2006', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":{"3":1},"core.delete":[],"core.edit":{"4":1},"core.edit.state":{"5":1},"core.edit.own":[]}'),
(203, 113, 414, 415, 4, 'com_content.article.98', 'Linuxworld Expo San Francisco 2006', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":{"3":1},"core.delete":[],"core.edit":{"4":1},"core.edit.state":{"5":1},"core.edit.own":[]}'),
(204, 113, 416, 417, 4, 'com_content.article.99', 'Linuxworld Expo San Francisco 2006', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":{"3":1},"core.delete":[],"core.edit":{"4":1},"core.edit.state":{"5":1},"core.edit.own":[]}'),
(205, 113, 418, 419, 4, 'com_content.article.100', 'Linuxworld Expo San Francisco 2006', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":{"3":1},"core.delete":[],"core.edit":{"4":1},"core.edit.state":{"5":1},"core.edit.own":[]}'),
(206, 113, 420, 421, 4, 'com_content.article.101', 'Linuxworld Expo San Francisco 2006', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":{"3":1},"core.delete":[],"core.edit":{"4":1},"core.edit.state":{"5":1},"core.edit.own":[]}'),
(207, 113, 422, 423, 4, 'com_content.article.102', 'Linuxworld Expo San Francisco 2006', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":{"3":1},"core.delete":[],"core.edit":{"4":1},"core.edit.state":{"5":1},"core.edit.own":[]}'),
(208, 113, 424, 425, 4, 'com_content.article.103', 'Linuxworld Expo San Francisco 2006', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":{"3":1},"core.delete":[],"core.edit":{"4":1},"core.edit.state":{"5":1},"core.edit.own":[]}'),
(209, 113, 426, 427, 4, 'com_content.article.104', 'Linuxworld Expo San Francisco 2006', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":{"3":1},"core.delete":[],"core.edit":{"4":1},"core.edit.state":{"5":1},"core.edit.own":[]}'),
(210, 113, 428, 429, 4, 'com_content.article.105', 'Linuxworld Expo San Francisco 2006', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":{"3":1},"core.delete":[],"core.edit":{"4":1},"core.edit.state":{"5":1},"core.edit.own":[]}'),
(211, 113, 430, 431, 4, 'com_content.article.106', 'Linuxworld Expo San Francisco 2006', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":{"3":1},"core.delete":[],"core.edit":{"4":1},"core.edit.state":{"5":1},"core.edit.own":[]}'),
(212, 113, 432, 433, 4, 'com_content.article.107', 'Linuxworld Expo San Francisco 2006', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":{"3":1},"core.delete":[],"core.edit":{"4":1},"core.edit.state":{"5":1},"core.edit.own":[]}'),
(213, 113, 434, 435, 4, 'com_content.article.108', 'LinuxWorldExpo London 2006', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":{"3":1},"core.delete":[],"core.edit":{"4":1},"core.edit.state":{"5":1},"core.edit.own":[]}'),
(214, 113, 436, 437, 4, 'com_content.article.109', 'LinuxWorldExpo London 2006', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":{"3":1},"core.delete":[],"core.edit":{"4":1},"core.edit.state":{"5":1},"core.edit.own":[]}'),
(215, 113, 438, 439, 4, 'com_content.article.110', 'LinuxWorldExpo London 2006', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":{"3":1},"core.delete":[],"core.edit":{"4":1},"core.edit.state":{"5":1},"core.edit.own":[]}'),
(216, 114, 442, 443, 4, 'com_content.article.111', 'JA Platon - Responsi', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":{"3":1},"core.delete":[],"core.edit":{"4":1},"core.edit.state":{"5":1},"core.edit.own":[]}'),
(217, 114, 444, 445, 4, 'com_content.article.112', 'Uber - Best Responsi', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":{"3":1},"core.delete":[],"core.edit":{"4":1},"core.edit.state":{"5":1},"core.edit.own":[]}'),
(218, 114, 446, 447, 4, 'com_content.article.113', 'The App page respons', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":{"3":1},"core.delete":[],"core.edit":{"4":1},"core.edit.state":{"5":1},"core.edit.own":[]}'),
(219, 114, 448, 449, 4, 'com_content.article.114', 'JA Playmag is a vers', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":{"3":1},"core.delete":[],"core.edit":{"4":1},"core.edit.state":{"5":1},"core.edit.own":[]}'),
(220, 114, 450, 451, 4, 'com_content.article.115', 'Responsive Joomla te', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":{"3":1},"core.delete":[],"core.edit":{"4":1},"core.edit.state":{"5":1},"core.edit.own":[]}'),
(221, 114, 452, 453, 4, 'com_content.article.116', 'Responsive Joomla te', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":{"3":1},"core.delete":[],"core.edit":{"4":1},"core.edit.state":{"5":1},"core.edit.own":[]}'),
(222, 114, 454, 455, 4, 'com_content.article.117', 'JA Decor - Responsiv', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":{"3":1},"core.delete":[],"core.edit":{"4":1},"core.edit.state":{"5":1},"core.edit.own":[]}'),
(223, 114, 456, 457, 4, 'com_content.article.118', 'JA Biz - Responsive ', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":{"3":1},"core.delete":[],"core.edit":{"4":1},"core.edit.state":{"5":1},"core.edit.own":[]}'),
(224, 114, 458, 459, 4, 'com_content.article.119', 'JA Purity III - the ', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":{"3":1},"core.delete":[],"core.edit":{"4":1},"core.edit.state":{"5":1},"core.edit.own":[]}'),
(225, 114, 460, 461, 4, 'com_content.article.120', 'JA Bookshop - Respon', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":{"3":1},"core.delete":[],"core.edit":{"4":1},"core.edit.state":{"5":1},"core.edit.own":[]}'),
(226, 114, 462, 463, 4, 'com_content.article.121', 'JA Appolio - Respons', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":{"3":1},"core.delete":[],"core.edit":{"4":1},"core.edit.state":{"5":1},"core.edit.own":[]}'),
(227, 114, 464, 465, 4, 'com_content.article.122', 'JA Obelisk - Respons', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":{"3":1},"core.delete":[],"core.edit":{"4":1},"core.edit.state":{"5":1},"core.edit.own":[]}'),
(228, 114, 466, 467, 4, 'com_content.article.123', 'JA Magz - New Respon', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":{"3":1},"core.delete":[],"core.edit":{"4":1},"core.edit.state":{"5":1},"core.edit.own":[]}'),
(229, 114, 468, 469, 4, 'com_content.article.124', 'Responsive Joomla te', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":{"3":1},"core.delete":[],"core.edit":{"4":1},"core.edit.state":{"5":1},"core.edit.own":[]}'),
(230, 114, 470, 471, 4, 'com_content.article.125', 'JA Beranis - July 20', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":{"3":1},"core.delete":[],"core.edit":{"4":1},"core.edit.state":{"5":1},"core.edit.own":[]}'),
(231, 114, 472, 473, 4, 'com_content.article.126', 'A Smashboard - June ', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":{"3":1},"core.delete":[],"core.edit":{"4":1},"core.edit.state":{"5":1},"core.edit.own":[]}'),
(232, 114, 474, 475, 4, 'com_content.article.127', 'JA Hawkstore is May ', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":{"3":1},"core.delete":[],"core.edit":{"4":1},"core.edit.state":{"5":1},"core.edit.own":[]}'),
(233, 114, 476, 477, 4, 'com_content.article.128', 'JA Fubix - April 201', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":{"3":1},"core.delete":[],"core.edit":{"4":1},"core.edit.state":{"5":1},"core.edit.own":[]}'),
(234, 114, 478, 479, 4, 'com_content.article.129', 'JA University - Joom', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":{"3":1},"core.delete":[],"core.edit":{"4":1},"core.edit.state":{"5":1},"core.edit.own":[]}'),
(235, 114, 480, 481, 4, 'com_content.article.130', 'JA Zite - Amazing Re', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":{"3":1},"core.delete":[],"core.edit":{"4":1},"core.edit.state":{"5":1},"core.edit.own":[]}'),
(236, 112, 116, 117, 4, 'com_content.article.131', 'Vortex 250 Pro - Römerkeller Teil II', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":{"3":1},"core.delete":[],"core.edit":{"4":1},"core.edit.state":{"5":1},"core.edit.own":[]}'),
(237, 112, 118, 119, 4, 'com_content.article.132', '#shitjokefriday 22/04/16', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":{"3":1},"core.delete":[],"core.edit":{"4":1},"core.edit.state":{"5":1},"core.edit.own":[]}'),
(238, 112, 120, 121, 4, 'com_content.article.133', 'Tierra Virgen - Trailer', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":{"3":1},"core.delete":[],"core.edit":{"4":1},"core.edit.state":{"5":1},"core.edit.own":[]}'),
(239, 111, 112, 113, 4, 'com_content.article.134', 'Test', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":{"3":1},"core.delete":[],"core.edit":{"4":1},"core.edit.state":{"5":1},"core.edit.own":[]}'),
(240, 112, 122, 123, 4, 'com_content.article.135', 'Pretty Things', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":{"3":1},"core.delete":[],"core.edit":{"4":1},"core.edit.state":{"5":1},"core.edit.own":[]}'),
(241, 109, 76, 77, 4, 'com_content.article.136', 'JoomlArt', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":{"3":1},"core.delete":[],"core.edit":{"4":1},"core.edit.state":{"5":1},"core.edit.own":[]}'),
(242, 109, 78, 79, 4, 'com_content.article.137', 'JoomlArt', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":{"3":1},"core.delete":[],"core.edit":{"4":1},"core.edit.state":{"5":1},"core.edit.own":[]}'),
(243, 109, 80, 81, 4, 'com_content.article.138', 'JoomlArt', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":{"3":1},"core.delete":[],"core.edit":{"4":1},"core.edit.state":{"5":1},"core.edit.own":[]}'),
(244, 109, 82, 83, 4, 'com_content.article.139', 'JoomlArt', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":{"3":1},"core.delete":[],"core.edit":{"4":1},"core.edit.state":{"5":1},"core.edit.own":[]}'),
(245, 109, 84, 85, 4, 'com_content.article.140', 'JoomlArt', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":{"3":1},"core.delete":[],"core.edit":{"4":1},"core.edit.state":{"5":1},"core.edit.own":[]}'),
(246, 109, 86, 87, 4, 'com_content.article.141', 'JoomlArt', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":{"3":1},"core.delete":[],"core.edit":{"4":1},"core.edit.state":{"5":1},"core.edit.own":[]}'),
(247, 109, 88, 89, 4, 'com_content.article.142', 'JoomlArt', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":{"3":1},"core.delete":[],"core.edit":{"4":1},"core.edit.state":{"5":1},"core.edit.own":[]}'),
(248, 109, 90, 91, 4, 'com_content.article.143', 'JoomlArt', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":{"3":1},"core.delete":[],"core.edit":{"4":1},"core.edit.state":{"5":1},"core.edit.own":[]}'),
(249, 109, 92, 93, 4, 'com_content.article.144', 'JoomlArt', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":{"3":1},"core.delete":[],"core.edit":{"4":1},"core.edit.state":{"5":1},"core.edit.own":[]}'),
(250, 109, 94, 95, 4, 'com_content.article.145', 'JoomlArt', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":{"3":1},"core.delete":[],"core.edit":{"4":1},"core.edit.state":{"5":1},"core.edit.own":[]}'),
(251, 109, 96, 97, 4, 'com_content.article.146', 'JoomlArt', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":{"3":1},"core.delete":[],"core.edit":{"4":1},"core.edit.state":{"5":1},"core.edit.own":[]}'),
(252, 109, 98, 99, 4, 'com_content.article.147', 'JoomlArt', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":{"3":1},"core.delete":[],"core.edit":{"4":1},"core.edit.state":{"5":1},"core.edit.own":[]}'),
(253, 109, 100, 101, 4, 'com_content.article.148', 'JoomlArt', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":{"3":1},"core.delete":[],"core.edit":{"4":1},"core.edit.state":{"5":1},"core.edit.own":[]}'),
(254, 109, 102, 103, 4, 'com_content.article.149', 'JoomlArt', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":{"3":1},"core.delete":[],"core.edit":{"4":1},"core.edit.state":{"5":1},"core.edit.own":[]}'),
(255, 109, 104, 105, 4, 'com_content.article.150', 'JoomlArt', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":{"3":1},"core.delete":[],"core.edit":{"4":1},"core.edit.state":{"5":1},"core.edit.own":[]}'),
(256, 112, 124, 125, 4, 'com_content.article.151', 'Petita Animació', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":{"3":1},"core.delete":[],"core.edit":{"4":1},"core.edit.state":{"5":1},"core.edit.own":[]}'),
(257, 112, 126, 127, 4, 'com_content.article.152', 'Captain of this ship', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":{"3":1},"core.delete":[],"core.edit":{"4":1},"core.edit.state":{"5":1},"core.edit.own":[]}'),
(258, 112, 128, 129, 4, 'com_content.article.153', 'Iconos', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":{"3":1},"core.delete":[],"core.edit":{"4":1},"core.edit.state":{"5":1},"core.edit.own":[]}'),
(259, 112, 130, 131, 4, 'com_content.article.154', 'The lady is a tramp', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":{"3":1},"core.delete":[],"core.edit":{"4":1},"core.edit.state":{"5":1},"core.edit.own":[]}'),
(260, 112, 132, 133, 4, 'com_content.article.155', 'E.T.E.R.N.I.T. - Teaser', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":{"3":1},"core.delete":[],"core.edit":{"4":1},"core.edit.state":{"5":1},"core.edit.own":[]}'),
(261, 112, 134, 135, 4, 'com_content.article.156', 'The Lord\'s Prayer  Jeff Ayres Trumpet Solo', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":{"3":1},"core.delete":[],"core.edit":{"4":1},"core.edit.state":{"5":1},"core.edit.own":[]}'),
(262, 112, 136, 137, 4, 'com_content.article.157', 'Director\'s Reel 2016', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":{"3":1},"core.delete":[],"core.edit":{"4":1},"core.edit.state":{"5":1},"core.edit.own":[]}'),
(263, 112, 138, 139, 4, 'com_content.article.158', 'KAMMENOS - Trailer', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":{"3":1},"core.delete":[],"core.edit":{"4":1},"core.edit.state":{"5":1},"core.edit.own":[]}'),
(264, 112, 140, 141, 4, 'com_content.article.159', 'shanghai mono', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":{"3":1},"core.delete":[],"core.edit":{"4":1},"core.edit.state":{"5":1},"core.edit.own":[]}'),
(265, 27, 19, 20, 3, 'com_content.article.160', '404 page', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":{"3":1},"core.delete":[],"core.edit":{"4":1},"core.edit.state":{"5":1},"core.edit.own":[]}'),
(266, 27, 21, 22, 3, 'com_content.article.161', 'Offline Page', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":{"3":1},"core.delete":[],"core.edit":{"4":1},"core.edit.state":{"5":1},"core.edit.own":[]}'),
(267, 27, 23, 24, 3, 'com_content.article.162', 'Typography', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":{"3":1},"core.delete":[],"core.edit":{"4":1},"core.edit.state":{"5":1},"core.edit.own":[]}'),
(268, 8, 484, 519, 2, 'com_content.category.17', 'Resume Demo', '{}'),
(269, 268, 485, 496, 3, 'com_content.category.18', 'Photography', '{}'),
(270, 268, 497, 508, 3, 'com_content.category.19', 'Designer', '{}'),
(271, 268, 509, 518, 3, 'com_content.category.20', 'Entertainment', '{}'),
(272, 18, 592, 593, 2, 'com_modules.module.129', 'Login', '{"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"module.edit.frontend":[]}'),
(273, 112, 142, 143, 4, 'com_content.article.163', 'FIRE TO THE STARS - Made of Fire', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":{"3":1},"core.delete":[],"core.edit":{"4":1},"core.edit.state":{"5":1},"core.edit.own":[]}'),
(274, 112, 144, 145, 4, 'com_content.article.164', 'Shear Marks 長不高的孩子', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":{"3":1},"core.delete":[],"core.edit":{"4":1},"core.edit.state":{"5":1},"core.edit.own":[]}'),
(275, 18, 594, 595, 2, 'com_modules.module.130', 'Blog Categories', '{"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"module.edit.frontend":[]}'),
(276, 18, 596, 597, 2, 'com_modules.module.131', 'EasyBlog Archive', '{"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"module.edit.frontend":[]}'),
(277, 18, 598, 599, 2, 'com_modules.module.132', 'Recent Comments', '{"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"module.edit.frontend":[]}'),
(278, 269, 486, 487, 4, 'com_content.article.165', 'Investopedia Makes You Smarter', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":{"3":1},"core.delete":[],"core.edit":{"4":1},"core.edit.state":{"5":1},"core.edit.own":[]}'),
(279, 1, 735, 736, 1, '#__ucm_content.1', '#__ucm_content.1', '[]'),
(280, 269, 488, 489, 4, 'com_content.article.166', 'Universe Of Securities', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":{"3":1},"core.delete":[],"core.edit":{"4":1},"core.edit.state":{"5":1},"core.edit.own":[]}'),
(281, 1, 737, 738, 1, '#__ucm_content.2', '#__ucm_content.2', '[]'),
(282, 269, 490, 491, 4, 'com_content.article.167', 'Direct Investment', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":{"3":1},"core.delete":[],"core.edit":{"4":1},"core.edit.state":{"5":1},"core.edit.own":[]}'),
(283, 269, 492, 493, 4, 'com_content.article.168', '10 Tips for the Successful Long-Term Investor', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":{"3":1},"core.delete":[],"core.edit":{"4":1},"core.edit.state":{"5":1},"core.edit.own":[]}'),
(284, 269, 494, 495, 4, 'com_content.article.169', 'Top 5 Positions in John Griffin\'s Portfolio', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":{"3":1},"core.delete":[],"core.edit":{"4":1},"core.edit.state":{"5":1},"core.edit.own":[]}'),
(285, 1, 739, 740, 1, '#__ucm_content.3', '#__ucm_content.3', '[]'),
(287, 270, 498, 499, 4, 'com_content.article.170', 'Asset Allocation', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":{"3":1},"core.delete":[],"core.edit":{"4":1},"core.edit.state":{"5":1},"core.edit.own":[]}'),
(288, 1, 741, 742, 1, '#__ucm_content.4', '#__ucm_content.4', '[]'),
(289, 270, 500, 501, 4, 'com_content.article.171', 'What is the difference between risk and opportunity cost?', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":{"3":1},"core.delete":[],"core.edit":{"4":1},"core.edit.state":{"5":1},"core.edit.own":[]}'),
(290, 1, 743, 744, 1, '#__ucm_content.5', '#__ucm_content.5', '[]'),
(291, 270, 502, 503, 4, 'com_content.article.172', 'How can I get started?', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":{"3":1},"core.delete":[],"core.edit":{"4":1},"core.edit.state":{"5":1},"core.edit.own":[]}'),
(292, 1, 745, 746, 1, '#__ucm_content.6', '#__ucm_content.6', '[]'),
(293, 270, 504, 505, 4, 'com_content.article.173', 'One Market Where Oil Doesn’t Really Matter Much', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":{"3":1},"core.delete":[],"core.edit":{"4":1},"core.edit.state":{"5":1},"core.edit.own":[]}'),
(294, 1, 747, 748, 1, '#__ucm_content.7', '#__ucm_content.7', '[]'),
(295, 270, 506, 507, 4, 'com_content.article.174', 'How Are Collectibles Taxed?', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":{"3":1},"core.delete":[],"core.edit":{"4":1},"core.edit.state":{"5":1},"core.edit.own":[]}'),
(296, 271, 510, 511, 4, 'com_content.article.175', 'Showcases Furniture-Building', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":{"3":1},"core.delete":[],"core.edit":{"4":1},"core.edit.state":{"5":1},"core.edit.own":[]}'),
(297, 1, 749, 750, 1, '#__ucm_content.8', '#__ucm_content.8', '[]'),
(298, 271, 512, 513, 4, 'com_content.article.176', 'Specializes in Motion Design', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":{"3":1},"core.delete":[],"core.edit":{"4":1},"core.edit.state":{"5":1},"core.edit.own":[]}'),
(299, 1, 751, 752, 1, '#__ucm_content.9', '#__ucm_content.9', '[]'),
(300, 271, 514, 515, 4, 'com_content.article.177', 'Studio Schurk', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":{"3":1},"core.delete":[],"core.edit":{"4":1},"core.edit.state":{"5":1},"core.edit.own":[]}'),
(301, 271, 516, 517, 4, 'com_content.article.178', 'Top 40 Minimal Portfolio Websites', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":{"3":1},"core.delete":[],"core.edit":{"4":1},"core.edit.state":{"5":1},"core.edit.own":[]}'),
(302, 1, 753, 754, 1, '#__ucm_content.10', '#__ucm_content.10', '[]'),
(303, 112, 146, 147, 4, 'com_content.article.179', 'Gone with the time', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":{"3":1},"core.delete":[],"core.edit":{"4":1},"core.edit.state":{"5":1},"core.edit.own":[]}'),
(304, 112, 148, 149, 4, 'com_content.article.180', '(030) - THIS IS NOT A LOOKBOOK', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":{"3":1},"core.delete":[],"core.edit":{"4":1},"core.edit.state":{"5":1},"core.edit.own":[]}'),
(305, 112, 150, 151, 4, 'com_content.article.181', 'Loilita Summer Ballet - Behind the Scenes', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":{"3":1},"core.delete":[],"core.edit":{"4":1},"core.edit.state":{"5":1},"core.edit.own":[]}'),
(306, 112, 152, 153, 4, 'com_content.article.182', 'Wasteland, Another Roadside Attraction', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":{"3":1},"core.delete":[],"core.edit":{"4":1},"core.edit.state":{"5":1},"core.edit.own":[]}'),
(307, 112, 154, 155, 4, 'com_content.article.183', 'Let Them Eat Cake- an animated short film', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":{"3":1},"core.delete":[],"core.edit":{"4":1},"core.edit.state":{"5":1},"core.edit.own":[]}'),
(308, 112, 156, 157, 4, 'com_content.article.184', '"Lethe" trailer/teaser - Director\'s Fortnight - 2016', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":{"3":1},"core.delete":[],"core.edit":{"4":1},"core.edit.state":{"5":1},"core.edit.own":[]}'),
(309, 18, 600, 601, 2, 'com_modules.module.134', 'Footer', '{"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"module.edit.frontend":[]}'),
(311, 18, 602, 603, 2, 'com_modules.module.136', 'Sample Sites', '{"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"module.edit.frontend":[]}'),
(312, 18, 604, 605, 2, 'com_modules.module.137', 'Introduction', '{"core.delete":[],"core.edit":[],"core.edit.state":[],"module.edit.frontend":[]}'),
(313, 112, 158, 159, 4, 'com_content.article.185', 'Penetralia: Mapping Introgression in "Let The Right One In"', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":{"3":1},"core.delete":[],"core.edit":{"4":1},"core.edit.state":{"5":1},"core.edit.own":[]}'),
(314, 18, 606, 607, 2, 'com_modules.module.138', 'My Skill', '{"core.delete":[],"core.edit":[],"core.edit.state":[],"module.edit.frontend":[]}'),
(315, 18, 608, 609, 2, 'com_modules.module.139', '[FrontEnd Developer] My Skill 1', '{"core.delete":[],"core.edit":[],"core.edit.state":[],"module.edit.frontend":[]}'),
(316, 18, 610, 611, 2, 'com_modules.module.140', '[FrontEnd Developer] My Skill 2', '{"core.delete":[],"core.edit":[],"core.edit.state":[],"module.edit.frontend":[]}'),
(317, 18, 612, 613, 2, 'com_modules.module.141', 'Porfolio', '{"core.delete":[],"core.edit":[],"core.edit.state":[],"module.edit.frontend":[]}'),
(318, 18, 614, 615, 2, 'com_modules.module.142', 'Chart', '{"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"module.edit.frontend":[]}'),
(319, 112, 160, 161, 4, 'com_content.article.186', 'IndieGOGO - Final Four (Working Title) Campaign Video', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":{"3":1},"core.delete":[],"core.edit":{"4":1},"core.edit.state":{"5":1},"core.edit.own":[]}'),
(320, 18, 616, 617, 2, 'com_modules.module.143', 'About Me', '{"core.delete":[],"core.edit":[],"core.edit.state":[],"module.edit.frontend":[]}'),
(321, 112, 162, 163, 4, 'com_content.article.187', 'One-Line Wonders Presents: Rickey Da Seal', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":{"3":1},"core.delete":[],"core.edit":{"4":1},"core.edit.state":{"5":1},"core.edit.own":[]}'),
(322, 112, 164, 165, 4, 'com_content.article.188', 'Biffa Awards 2013 - Flitton Moor', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":{"3":1},"core.delete":[],"core.edit":{"4":1},"core.edit.state":{"5":1},"core.edit.own":[]}'),
(323, 69, 48, 49, 4, 'com_content.article.189', 'How To Make It Worth Your Time', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":{"3":1},"core.delete":[],"core.edit":{"4":1},"core.edit.state":{"5":1},"core.edit.own":[]}'),
(324, 69, 50, 51, 4, 'com_content.article.190', 'The Reasons Why Blogging Is So Important For Photographers', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":{"3":1},"core.delete":[],"core.edit":{"4":1},"core.edit.state":{"5":1},"core.edit.own":[]}'),
(325, 69, 52, 53, 4, 'com_content.article.191', 'Blog Services', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":{"3":1},"core.delete":[],"core.edit":{"4":1},"core.edit.state":{"5":1},"core.edit.own":[]}'),
(326, 69, 54, 55, 4, 'com_content.article.192', '9 Good Habits For Better Photos', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":{"3":1},"core.delete":[],"core.edit":{"4":1},"core.edit.state":{"5":1},"core.edit.own":[]}'),
(327, 69, 56, 57, 4, 'com_content.article.193', 'The Secret Way To Learn', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":{"3":1},"core.delete":[],"core.edit":{"4":1},"core.edit.state":{"5":1},"core.edit.own":[]}'),
(328, 69, 58, 59, 4, 'com_content.article.194', 'The Dangerous Myths of Talent + Gear', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":{"3":1},"core.delete":[],"core.edit":{"4":1},"core.edit.state":{"5":1},"core.edit.own":[]}'),
(329, 69, 60, 61, 4, 'com_content.article.195', 'Shooting Nervous', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":{"3":1},"core.delete":[],"core.edit":{"4":1},"core.edit.state":{"5":1},"core.edit.own":[]}'),
(330, 69, 62, 63, 4, 'com_content.article.196', 'Typewriter from Peru', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":{"3":1},"core.delete":[],"core.edit":{"4":1},"core.edit.state":{"5":1},"core.edit.own":[]}'),
(331, 69, 64, 65, 4, 'com_content.article.197', 'The Most Powerful Feature of Google Photos', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":{"3":1},"core.delete":[],"core.edit":{"4":1},"core.edit.state":{"5":1},"core.edit.own":[]}'),
(332, 69, 66, 67, 4, 'com_content.article.198', 'The Problems With Apple Live', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":{"3":1},"core.delete":[],"core.edit":{"4":1},"core.edit.state":{"5":1},"core.edit.own":[]}'),
(333, 69, 68, 69, 4, 'com_content.article.199', 'Supermoon Lunar Eclipse Photo', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":{"3":1},"core.delete":[],"core.edit":{"4":1},"core.edit.state":{"5":1},"core.edit.own":[]}'),
(334, 69, 70, 71, 4, 'com_content.article.200', 'Don’t Worry. It Gets Easier', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":{"3":1},"core.delete":[],"core.edit":{"4":1},"core.edit.state":{"5":1},"core.edit.own":[]}'),
(335, 18, 618, 619, 2, 'com_modules.module.144', 'Introduction', '{"core.delete":[],"core.edit":[],"core.edit.state":[],"module.edit.frontend":[]}'),
(336, 18, 620, 621, 2, 'com_modules.module.145', 'About Me', '{"core.delete":[],"core.edit":[],"core.edit.state":[],"module.edit.frontend":[]}'),
(337, 18, 622, 623, 2, 'com_modules.module.146', 'Tags Popular', '{"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"module.edit.frontend":[]}'),
(338, 18, 624, 625, 2, 'com_modules.module.147', 'Articles Category', '{"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"module.edit.frontend":[]}'),
(339, 18, 626, 627, 2, 'com_modules.module.148', 'Latest Articles', '{"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"module.edit.frontend":[]}'),
(340, 18, 628, 629, 2, 'com_modules.module.149', 'Yoga Gallery', '{"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"module.edit.frontend":[]}'),
(341, 18, 630, 631, 2, 'com_modules.module.150', 'Teaching Experience', '{"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"module.edit.frontend":[]}'),
(342, 18, 632, 633, 2, 'com_modules.module.151', 'My Classes', '{"core.delete":[],"core.edit":[],"core.edit.state":[],"module.edit.frontend":[]}'),
(343, 18, 634, 635, 2, 'com_modules.module.152', 'My Classes', '{"core.delete":[],"core.edit":[],"core.edit.state":[],"module.edit.frontend":[]}'),
(344, 18, 636, 637, 2, 'com_modules.module.153', 'Testimonial', '{"core.delete":[],"core.edit":[],"core.edit.state":[],"module.edit.frontend":[]}'),
(345, 1, 755, 756, 1, 'com_jaextmanager', 'com_jaextmanager', '{}'),
(346, 18, 638, 639, 2, 'com_modules.module.154', 'Tab Cloud', '{"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"module.edit.frontend":[]}'),
(347, 18, 640, 641, 2, 'com_modules.module.155', 'Most Popular ', '{"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"module.edit.frontend":[]}'),
(348, 18, 642, 643, 2, 'com_modules.module.156', 'Top Blogs', '{"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"module.edit.frontend":[]}'),
(349, 112, 166, 167, 4, 'com_content.article.201', 'ISOLATION: The Series // OPENING CREDITS', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":{"3":1},"core.delete":[],"core.edit":{"4":1},"core.edit.state":{"5":1},"core.edit.own":[]}'),
(350, 112, 168, 169, 4, 'com_content.article.202', 'the untold & unseen', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":{"3":1},"core.delete":[],"core.edit":{"4":1},"core.edit.state":{"5":1},"core.edit.own":[]}'),
(351, 112, 170, 171, 4, 'com_content.article.203', '모던한 코리안라운지파티 Aftermovie', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":{"3":1},"core.delete":[],"core.edit":{"4":1},"core.edit.state":{"5":1},"core.edit.own":[]}'),
(352, 109, 106, 107, 4, 'com_content.article.204', 'JoomlArt', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":{"3":1},"core.delete":[],"core.edit":{"4":1},"core.edit.state":{"5":1},"core.edit.own":[]}'),
(353, 112, 172, 173, 4, 'com_content.article.205', 'emune - Calibrate [OFFICIAL MUSIC VIDEO]', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":{"3":1},"core.delete":[],"core.edit":{"4":1},"core.edit.state":{"5":1},"core.edit.own":[]}'),
(354, 18, 644, 645, 2, 'com_modules.module.157', 'Introduction', '{"core.delete":[],"core.edit":[],"core.edit.state":[],"module.edit.frontend":[]}'),
(355, 18, 646, 647, 2, 'com_modules.module.158', 'About Me', '{"core.delete":[],"core.edit":[],"core.edit.state":[],"module.edit.frontend":[]}'),
(356, 18, 648, 649, 2, 'com_modules.module.159', 'Timeline', '{"core.delete":[],"core.edit":[],"core.edit.state":[],"module.edit.frontend":[]}'),
(357, 112, 174, 175, 4, 'com_content.article.206', 'Nothing to Say #1', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":{"3":1},"core.delete":[],"core.edit":{"4":1},"core.edit.state":{"5":1},"core.edit.own":[]}'),
(358, 112, 176, 177, 4, 'com_content.article.207', 'Zane Berry Editing and Software Reel', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":{"3":1},"core.delete":[],"core.edit":{"4":1},"core.edit.state":{"5":1},"core.edit.own":[]}'),
(359, 112, 178, 179, 4, 'com_content.article.208', '#shitjokefriday 29/04/16', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":{"3":1},"core.delete":[],"core.edit":{"4":1},"core.edit.state":{"5":1},"core.edit.own":[]}'),
(360, 18, 650, 651, 2, 'com_modules.module.160', 'Contact', '{"core.delete":[],"core.edit":[],"core.edit.state":[],"module.edit.frontend":[]}'),
(362, 112, 180, 181, 4, 'com_content.article.209', 'Terra Verde', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":{"3":1},"core.delete":[],"core.edit":{"4":1},"core.edit.state":{"5":1},"core.edit.own":[]}'),
(363, 18, 652, 653, 2, 'com_modules.module.162', 'Albums', '{"core.delete":[],"core.edit":[],"core.edit.state":[],"module.edit.frontend":[]}'),
(364, 112, 182, 183, 4, 'com_content.article.210', 'My friend from Rio. A story about a professional helicopter pilot my friend.', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":{"3":1},"core.delete":[],"core.edit":{"4":1},"core.edit.state":{"5":1},"core.edit.own":[]}'),
(365, 112, 184, 185, 4, 'com_content.article.211', 'Fahrenheit 4.33', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":{"3":1},"core.delete":[],"core.edit":{"4":1},"core.edit.state":{"5":1},"core.edit.own":[]}'),
(366, 112, 186, 187, 4, 'com_content.article.212', 'Oscar Beckmann DP Reel - Long Version', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":{"3":1},"core.delete":[],"core.edit":{"4":1},"core.edit.state":{"5":1},"core.edit.own":[]}'),
(367, 112, 188, 189, 4, 'com_content.article.213', 'Backroads: Hensley Settlement', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":{"3":1},"core.delete":[],"core.edit":{"4":1},"core.edit.state":{"5":1},"core.edit.own":[]}'),
(368, 112, 190, 191, 4, 'com_content.article.214', 'STREET BEATS', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":{"3":1},"core.delete":[],"core.edit":{"4":1},"core.edit.state":{"5":1},"core.edit.own":[]}'),
(369, 18, 654, 655, 2, 'com_modules.module.163', 'About Me', '{"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"module.edit.frontend":[]}'),
(370, 112, 192, 193, 4, 'com_content.article.215', 'Crown Prince Banquet | North York | Wedding Video | Grace + Kevin', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":{"3":1},"core.delete":[],"core.edit":{"4":1},"core.edit.state":{"5":1},"core.edit.own":[]}'),
(371, 112, 194, 195, 4, 'com_content.article.216', 'Hopeland in Rwanda', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":{"3":1},"core.delete":[],"core.edit":{"4":1},"core.edit.state":{"5":1},"core.edit.own":[]}'),
(372, 18, 656, 657, 2, 'com_modules.module.164', 'Introduction', '{"core.delete":[],"core.edit":[],"core.edit.state":[],"module.edit.frontend":[]}'),
(373, 112, 196, 197, 4, 'com_content.article.217', 'The Preying Mantis Trailer', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":{"3":1},"core.delete":[],"core.edit":{"4":1},"core.edit.state":{"5":1},"core.edit.own":[]}'),
(374, 112, 198, 199, 4, 'com_content.article.218', 'PandoMoto-Monimoto', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":{"3":1},"core.delete":[],"core.edit":{"4":1},"core.edit.state":{"5":1},"core.edit.own":[]}'),
(375, 112, 200, 201, 4, 'com_content.article.219', 'From PS Week 13', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":{"3":1},"core.delete":[],"core.edit":{"4":1},"core.edit.state":{"5":1},"core.edit.own":[]}'),
(376, 18, 658, 659, 2, 'com_modules.module.165', 'About Me', '{"core.delete":[],"core.edit":[],"core.edit.state":[],"module.edit.frontend":[]}'),
(377, 18, 660, 661, 2, 'com_modules.module.166', 'Timeline', '{"core.delete":[],"core.edit":[],"core.edit.state":[],"module.edit.frontend":[]}'),
(378, 112, 202, 203, 4, 'com_content.article.220', 'Frequency', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":{"3":1},"core.delete":[],"core.edit":{"4":1},"core.edit.state":{"5":1},"core.edit.own":[]}'),
(379, 112, 204, 205, 4, 'com_content.article.221', 'OBSESJA', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":{"3":1},"core.delete":[],"core.edit":{"4":1},"core.edit.state":{"5":1},"core.edit.own":[]}'),
(380, 18, 662, 663, 2, 'com_modules.module.167', 'Model Gallery', '{"core.delete":[],"core.edit":[],"core.edit.state":[],"module.edit.frontend":[]}'),
(381, 18, 664, 665, 2, 'com_modules.module.168', 'Introduction (copy)', '{"core.delete":[],"core.edit":[],"core.edit.state":[],"module.edit.frontend":[]}'),
(382, 18, 666, 667, 2, 'com_modules.module.169', 'Introduction', '{"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"module.edit.frontend":[]}'),
(383, 18, 668, 669, 2, 'com_modules.module.170', 'About Me', '{"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"module.edit.frontend":[]}'),
(384, 18, 670, 671, 2, 'com_modules.module.171', 'Destinations', '{"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"module.edit.frontend":[]}'),
(385, 18, 672, 673, 2, 'com_modules.module.172', 'Photo Stories', '{"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"module.edit.frontend":[]}'),
(386, 18, 674, 675, 2, 'com_modules.module.173', 'Testimonial', '{"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"module.edit.frontend":[]}'),
(387, 18, 676, 677, 2, 'com_modules.module.174', 'Contact', '{"core.delete":[],"core.edit":[],"core.edit.state":[],"module.edit.frontend":[]}'),
(388, 112, 206, 207, 4, 'com_content.article.222', 'Genka/Paul Oja feat. Suur Papa, Metsakutsu, Beebilõust, Reket, Ines "Kõik"', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":{"3":1},"core.delete":[],"core.edit":{"4":1},"core.edit.state":{"5":1},"core.edit.own":[]}'),
(389, 112, 208, 209, 4, 'com_content.article.223', 'Movie try-out', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":{"3":1},"core.delete":[],"core.edit":{"4":1},"core.edit.state":{"5":1},"core.edit.own":[]}'),
(390, 112, 210, 211, 4, 'com_content.article.224', 'Greek Seas 2015', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":{"3":1},"core.delete":[],"core.edit":{"4":1},"core.edit.state":{"5":1},"core.edit.own":[]}');
INSERT INTO `#__assets` (`id`, `parent_id`, `lft`, `rgt`, `level`, `name`, `title`, `rules`) VALUES
(391, 18, 678, 679, 2, 'com_modules.module.175', 'Testimonial', '{"core.delete":[],"core.edit":[],"core.edit.state":[],"module.edit.frontend":[]}'),
(392, 112, 212, 213, 4, 'com_content.article.225', 'The Lonely American', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":{"3":1},"core.delete":[],"core.edit":{"4":1},"core.edit.state":{"5":1},"core.edit.own":[]}'),
(393, 112, 214, 215, 4, 'com_content.article.226', 'Close your eyes', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":{"3":1},"core.delete":[],"core.edit":{"4":1},"core.edit.state":{"5":1},"core.edit.own":[]}'),
(394, 112, 216, 217, 4, 'com_content.article.227', 'Free at Last?', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":{"3":1},"core.delete":[],"core.edit":{"4":1},"core.edit.state":{"5":1},"core.edit.own":[]}'),
(395, 18, 680, 681, 2, 'com_modules.module.176', 'More Info', '{"core.delete":[],"core.edit":[],"core.edit.state":[],"module.edit.frontend":[]}'),
(396, 112, 218, 219, 4, 'com_content.article.228', 'celluloid stories', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":{"3":1},"core.delete":[],"core.edit":{"4":1},"core.edit.state":{"5":1},"core.edit.own":[]}'),
(397, 112, 220, 221, 4, 'com_content.article.229', 'Sponsied', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":{"3":1},"core.delete":[],"core.edit":{"4":1},"core.edit.state":{"5":1},"core.edit.own":[]}'),
(398, 18, 682, 683, 2, 'com_modules.module.177', 'Main Menu', '{"core.delete":[],"core.edit":[],"core.edit.state":[],"module.edit.frontend":[]}'),
(399, 18, 684, 685, 2, 'com_modules.module.178', 'Main Menu', '{"core.delete":[],"core.edit":[],"core.edit.state":[],"module.edit.frontend":[]}'),
(400, 18, 686, 687, 2, 'com_modules.module.179', 'Main Menu', '{"core.delete":[],"core.edit":[],"core.edit.state":[],"module.edit.frontend":[]}'),
(401, 18, 688, 689, 2, 'com_modules.module.180', 'Main Menu', '{"core.delete":[],"core.edit":[],"core.edit.state":[],"module.edit.frontend":[]}'),
(402, 18, 690, 691, 2, 'com_modules.module.181', 'Main Menu', '{"core.delete":[],"core.edit":[],"core.edit.state":[],"module.edit.frontend":[]}'),
(403, 112, 222, 223, 4, 'com_content.article.230', 'Repulsion', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":{"3":1},"core.delete":[],"core.edit":{"4":1},"core.edit.state":{"5":1},"core.edit.own":[]}'),
(404, 112, 224, 225, 4, 'com_content.article.231', 'by the desert sand', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":{"3":1},"core.delete":[],"core.edit":{"4":1},"core.edit.state":{"5":1},"core.edit.own":[]}'),
(405, 112, 226, 227, 4, 'com_content.article.232', '30 Seconds In Switzerland', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":{"3":1},"core.delete":[],"core.edit":{"4":1},"core.edit.state":{"5":1},"core.edit.own":[]}'),
(406, 112, 228, 229, 4, 'com_content.article.233', 'Attraction', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":{"3":1},"core.delete":[],"core.edit":{"4":1},"core.edit.state":{"5":1},"core.edit.own":[]}'),
(407, 112, 230, 231, 4, 'com_content.article.234', 'Skin and Bolts', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":{"3":1},"core.delete":[],"core.edit":{"4":1},"core.edit.state":{"5":1},"core.edit.own":[]}'),
(408, 112, 232, 233, 4, 'com_content.article.235', 'Reel Words Episode 2', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":{"3":1},"core.delete":[],"core.edit":{"4":1},"core.edit.state":{"5":1},"core.edit.own":[]}'),
(409, 112, 234, 235, 4, 'com_content.article.236', 'Owl_Walf (bring life to draw series )', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":{"3":1},"core.delete":[],"core.edit":{"4":1},"core.edit.state":{"5":1},"core.edit.own":[]}'),
(410, 112, 236, 237, 4, 'com_content.article.237', 'A Manhattan Beach Memoir: 1945-2015', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":{"3":1},"core.delete":[],"core.edit":{"4":1},"core.edit.state":{"5":1},"core.edit.own":[]}'),
(411, 112, 238, 239, 4, 'com_content.article.238', 'Art of Fire', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":{"3":1},"core.delete":[],"core.edit":{"4":1},"core.edit.state":{"5":1},"core.edit.own":[]}'),
(412, 18, 692, 693, 2, 'com_modules.module.182', 'Chart', '{"core.delete":[],"core.edit":[],"core.edit.state":[],"module.edit.frontend":[]}'),
(413, 18, 694, 695, 2, 'com_modules.module.183', 'Join My Classes', '{"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"module.edit.frontend":[]}'),
(414, 112, 240, 241, 4, 'com_content.article.239', 'Grant Reinero - Reel 2016', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":{"3":1},"core.delete":[],"core.edit":{"4":1},"core.edit.state":{"5":1},"core.edit.own":[]}'),
(415, 18, 696, 697, 2, 'com_modules.module.184', 'Social Feed Categories', '{"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"module.edit.frontend":[]}'),
(416, 112, 242, 243, 4, 'com_content.article.240', 'My Mother\'s Letter', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":{"3":1},"core.delete":[],"core.edit":{"4":1},"core.edit.state":{"5":1},"core.edit.own":[]}'),
(417, 112, 244, 245, 4, 'com_content.article.241', 'Life As it is Trailer', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":{"3":1},"core.delete":[],"core.edit":{"4":1},"core.edit.state":{"5":1},"core.edit.own":[]}'),
(418, 112, 246, 247, 4, 'com_content.article.242', 'Missy Jubilee. Luv Remixxx', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":{"3":1},"core.delete":[],"core.edit":{"4":1},"core.edit.state":{"5":1},"core.edit.own":[]}'),
(419, 27, 25, 26, 3, 'com_content.article.243', 'Easyblog', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":{"3":1},"core.delete":[],"core.edit":{"4":1},"core.edit.state":{"5":1},"core.edit.own":[]}'),
(420, 112, 248, 249, 4, 'com_content.article.244', '- WILD BUCKS -', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":{"3":1},"core.delete":[],"core.edit":{"4":1},"core.edit.state":{"5":1},"core.edit.own":[]}'),
(421, 112, 250, 251, 4, 'com_content.article.245', 'blessé. (wounded cinema compilation)', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":{"3":1},"core.delete":[],"core.edit":{"4":1},"core.edit.state":{"5":1},"core.edit.own":[]}'),
(422, 112, 252, 253, 4, 'com_content.article.246', 'Don\'t Walk', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":{"3":1},"core.delete":[],"core.edit":{"4":1},"core.edit.state":{"5":1},"core.edit.own":[]}'),
(423, 112, 254, 255, 4, 'com_content.article.247', 'Ivan Raña - Libre', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":{"3":1},"core.delete":[],"core.edit":{"4":1},"core.edit.state":{"5":1},"core.edit.own":[]}'),
(424, 112, 256, 257, 4, 'com_content.article.248', 'Hanami', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":{"3":1},"core.delete":[],"core.edit":{"4":1},"core.edit.state":{"5":1},"core.edit.own":[]}'),
(425, 112, 258, 259, 4, 'com_content.article.249', 'dead animals', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":{"3":1},"core.delete":[],"core.edit":{"4":1},"core.edit.state":{"5":1},"core.edit.own":[]}'),
(426, 112, 260, 261, 4, 'com_content.article.250', 'PSA on Greyhound Abuse', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":{"3":1},"core.delete":[],"core.edit":{"4":1},"core.edit.state":{"5":1},"core.edit.own":[]}'),
(427, 112, 262, 263, 4, 'com_content.article.251', 'Black Flamingo', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":{"3":1},"core.delete":[],"core.edit":{"4":1},"core.edit.state":{"5":1},"core.edit.own":[]}'),
(428, 112, 264, 265, 4, 'com_content.article.252', 'Kites, Boards & Buggies', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":{"3":1},"core.delete":[],"core.edit":{"4":1},"core.edit.state":{"5":1},"core.edit.own":[]}'),
(429, 18, 698, 699, 2, 'com_modules.module.185', 'Chart', '{"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"module.edit.frontend":[]}'),
(430, 112, 266, 267, 4, 'com_content.article.253', '#shitjokefriday 06/05/16', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":{"3":1},"core.delete":[],"core.edit":{"4":1},"core.edit.state":{"5":1},"core.edit.own":[]}'),
(431, 18, 700, 701, 2, 'com_modules.module.186', ' My Popular Products', '{"core.delete":[],"core.edit":[],"core.edit.state":[],"module.edit.frontend":[]}'),
(432, 112, 268, 269, 4, 'com_content.article.254', 'SYNTH Trailer (2016) // SOPHIA + ROBERT', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":{"3":1},"core.delete":[],"core.edit":{"4":1},"core.edit.state":{"5":1},"core.edit.own":[]}'),
(433, 112, 270, 271, 4, 'com_content.article.255', 'Northern Lights - Adventure Series V', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":{"3":1},"core.delete":[],"core.edit":{"4":1},"core.edit.state":{"5":1},"core.edit.own":[]}'),
(434, 112, 272, 273, 4, 'com_content.article.256', 'Zahirah & Andrew', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":{"3":1},"core.delete":[],"core.edit":{"4":1},"core.edit.state":{"5":1},"core.edit.own":[]}'),
(435, 112, 274, 275, 4, 'com_content.article.257', 'LoveStory_Passenger', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":{"3":1},"core.delete":[],"core.edit":{"4":1},"core.edit.state":{"5":1},"core.edit.own":[]}'),
(436, 112, 276, 277, 4, 'com_content.article.258', 'The Dark Side ( A Short story )', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":{"3":1},"core.delete":[],"core.edit":{"4":1},"core.edit.state":{"5":1},"core.edit.own":[]}'),
(437, 112, 278, 279, 4, 'com_content.article.259', 'The Garden', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":{"3":1},"core.delete":[],"core.edit":{"4":1},"core.edit.state":{"5":1},"core.edit.own":[]}'),
(438, 112, 280, 281, 4, 'com_content.article.260', 'Joomla Intranet Template - JA Intranet released. Supports DocMan, EasyBlog, EasySocial & EasyDiscuss', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":{"3":1},"core.delete":[],"core.edit":{"4":1},"core.edit.state":{"5":1},"core.edit.own":[]}'),
(439, 112, 282, 283, 4, 'com_content.article.261', 'JA Admin - Live Demo available now & Beta 2 released', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":{"3":1},"core.delete":[],"core.edit":{"4":1},"core.edit.state":{"5":1},"core.edit.own":[]}'),
(440, 112, 284, 285, 4, 'com_content.article.262', 'Admin Joomla template - JA Admin Beta released', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":{"3":1},"core.delete":[],"core.edit":{"4":1},"core.edit.state":{"5":1},"core.edit.own":[]}'),
(441, 112, 286, 287, 4, 'com_content.article.263', 'JA Admin - Joomla Admin Template - Alpha version released', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":{"3":1},"core.delete":[],"core.edit":{"4":1},"core.edit.state":{"5":1},"core.edit.own":[]}'),
(442, 112, 288, 289, 4, 'com_content.article.264', '[PREVIEW] JA Admin - Admin template for Joomla 3', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":{"3":1},"core.delete":[],"core.edit":{"4":1},"core.edit.state":{"5":1},"core.edit.own":[]}'),
(443, 112, 290, 291, 4, 'com_content.article.265', 'JA Social Feed Plugin - Support RSS feed and bug fix release', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":{"3":1},"core.delete":[],"core.edit":{"4":1},"core.edit.state":{"5":1},"core.edit.own":[]}'),
(444, 112, 292, 293, 4, 'com_content.article.266', 'Updates - JA Simpli, Appolio, BookShop updated & 25% OFF JA Developer', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":{"3":1},"core.delete":[],"core.edit":{"4":1},"core.edit.state":{"5":1},"core.edit.own":[]}'),
(445, 112, 294, 295, 4, 'com_content.article.267', 'JA Simpli RC released with new feature and 30+ bug fixes', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":{"3":1},"core.delete":[],"core.edit":{"4":1},"core.edit.state":{"5":1},"core.edit.own":[]}'),
(446, 112, 296, 297, 4, 'com_content.article.268', 'Review - JA Resume Responsive Joomla Template for Resume & Portfolio', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":{"3":1},"core.delete":[],"core.edit":{"4":1},"core.edit.state":{"5":1},"core.edit.own":[]}'),
(447, 112, 298, 299, 4, 'com_content.article.269', 'Free Joomla Template - JA Simpli beta now available', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":{"3":1},"core.delete":[],"core.edit":{"4":1},"core.edit.state":{"5":1},"core.edit.own":[]}'),
(448, 112, 300, 301, 4, 'com_content.article.270', '4 More Joomla Templates updated for Joomla 3.5.1& bug fixes', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":{"3":1},"core.delete":[],"core.edit":{"4":1},"core.edit.state":{"5":1},"core.edit.own":[]}'),
(449, 112, 302, 303, 4, 'com_content.article.271', 'Sneak Peak JA Simpli - The template missing from Joomla 3', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":{"3":1},"core.delete":[],"core.edit":{"4":1},"core.edit.state":{"5":1},"core.edit.own":[]}'),
(450, 112, 304, 305, 4, 'com_content.article.272', '10 More Joomla Templates updated for Joomla 3.5.1& bug fixes', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":{"3":1},"core.delete":[],"core.edit":{"4":1},"core.edit.state":{"5":1},"core.edit.own":[]}'),
(451, 112, 306, 307, 4, 'com_content.article.273', '12 Joomla Templates updated for Joomla 3.5.1& bug fixes', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":{"3":1},"core.delete":[],"core.edit":{"4":1},"core.edit.state":{"5":1},"core.edit.own":[]}'),
(452, 112, 308, 309, 4, 'com_content.article.274', 'Review - Healthcare Joomla template - JA Healthcare', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":{"3":1},"core.delete":[],"core.edit":{"4":1},"core.edit.state":{"5":1},"core.edit.own":[]}'),
(453, 112, 310, 311, 4, 'com_content.article.275', 'April 2016 delivery plan, Free Joomla Template & updates', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":{"3":1},"core.delete":[],"core.edit":{"4":1},"core.edit.state":{"5":1},"core.edit.own":[]}'),
(454, 112, 312, 313, 4, 'com_content.article.276', 'Review: Responsive Movies Joomla template - JA Moviemax', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":{"3":1},"core.delete":[],"core.edit":{"4":1},"core.edit.state":{"5":1},"core.edit.own":[]}'),
(455, 112, 314, 315, 4, 'com_content.article.277', 'Get 25% OFF all JoomlArt and Techjoomla products', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":{"3":1},"core.delete":[],"core.edit":{"4":1},"core.edit.state":{"5":1},"core.edit.own":[]}'),
(456, 112, 316, 317, 4, 'com_content.article.278', 'Top 10 Joomla business Templates from JoomlArt', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":{"3":1},"core.delete":[],"core.edit":{"4":1},"core.edit.state":{"5":1},"core.edit.own":[]}'),
(457, 112, 318, 319, 4, 'com_content.article.279', 'Happy Lunar New Year with 25% OFF on JoomlArt products, StackIdeas bundles', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":{"3":1},"core.delete":[],"core.edit":{"4":1},"core.edit.state":{"5":1},"core.edit.own":[]}'),
(458, 112, 320, 321, 4, 'com_content.article.280', 'Build a Social or RSS Feed Site with Joomla in easy steps', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":{"3":1},"core.delete":[],"core.edit":{"4":1},"core.edit.state":{"5":1},"core.edit.own":[]}'),
(459, 112, 322, 323, 4, 'com_content.article.281', 'JA Admin Beta 3 and 5 Joomla templates updated to Joomla 3.6.0', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":{"3":1},"core.delete":[],"core.edit":{"4":1},"core.edit.state":{"5":1},"core.edit.own":[]}'),
(460, 112, 324, 325, 4, 'com_content.article.282', 'T3 Framework & 9 Joomla templates updated for Joomla 3.6.0', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":{"3":1},"core.delete":[],"core.edit":{"4":1},"core.edit.state":{"5":1},"core.edit.own":[]}'),
(461, 112, 326, 327, 4, 'com_content.article.283', '[PREVIEW] JA Users module & JA Google Analytics modules for JA Admin template', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":{"3":1},"core.delete":[],"core.edit":{"4":1},"core.edit.state":{"5":1},"core.edit.own":[]}'),
(462, 112, 328, 329, 4, 'com_content.article.284', 'Recap of what JoomlArt has been doing lately & what\'s coming', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":{"3":1},"core.delete":[],"core.edit":{"4":1},"core.edit.state":{"5":1},"core.edit.own":[]}'),
(463, 112, 330, 331, 4, 'com_content.article.285', 'Updates: 9 more Joomla templates updated to Joomla 3.6.2', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":{"3":1},"core.delete":[],"core.edit":{"4":1},"core.edit.state":{"5":1},"core.edit.own":[]}'),
(464, 112, 332, 333, 4, 'com_content.article.286', 'Real-Time Dashboard added - JA Google Analytics Reports module for Joomla', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":{"3":1},"core.delete":[],"core.edit":{"4":1},"core.edit.state":{"5":1},"core.edit.own":[]}'),
(465, 112, 334, 335, 4, 'com_content.article.287', 'New feature release : JA K2 to Com_content migration joomla extension released', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":{"3":1},"core.delete":[],"core.edit":{"4":1},"core.edit.state":{"5":1},"core.edit.own":[]}'),
(466, 112, 336, 337, 4, 'com_content.article.288', 'New features release : JA K2 filter and search component for Joomla', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":{"3":1},"core.delete":[],"core.edit":{"4":1},"core.edit.state":{"5":1},"core.edit.own":[]}'),
(467, 112, 338, 339, 4, 'com_content.article.289', 'Joomla Admin template - JA Admin stable version released', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":{"3":1},"core.delete":[],"core.edit":{"4":1},"core.edit.state":{"5":1},"core.edit.own":[]}'),
(468, 112, 340, 341, 4, 'com_content.article.290', 'Introducing the best restaurant Joomla template - JA Restaurant', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":{"3":1},"core.delete":[],"core.edit":{"4":1},"core.edit.state":{"5":1},"core.edit.own":[]}'),
(469, 112, 342, 343, 4, 'com_content.article.291', 'Updates: JA Promo bar module released with new features and improvement', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":{"3":1},"core.delete":[],"core.edit":{"4":1},"core.edit.state":{"5":1},"core.edit.own":[]}'),
(470, 112, 344, 345, 4, 'com_content.article.292', 'Updates : Revamped JA Quick Contact module with multiple layouts & 3 more templates bug fix release', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":{"3":1},"core.delete":[],"core.edit":{"4":1},"core.edit.state":{"5":1},"core.edit.own":[]}'),
(471, 112, 346, 347, 4, 'com_content.article.293', 'JA Image hotspot module version 1.1.0 now supports 4 content types', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":{"3":1},"core.delete":[],"core.edit":{"4":1},"core.edit.state":{"5":1},"core.edit.own":[]}'),
(472, 112, 348, 349, 4, 'com_content.article.294', 'Updates: 6 more Joomla templates updated for Joomla 3.6.2', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":{"3":1},"core.delete":[],"core.edit":{"4":1},"core.edit.state":{"5":1},"core.edit.own":[]}'),
(473, 112, 350, 351, 4, 'com_content.article.295', 'Google Analytics Dashboards for Joomla with JA Google Analytics Module', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":{"3":1},"core.delete":[],"core.edit":{"4":1},"core.edit.state":{"5":1},"core.edit.own":[]}'),
(474, 112, 352, 353, 4, 'com_content.article.296', '18 Joomla templates package updated & JA K2 Filter v 1.2.3 released', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":{"3":1},"core.delete":[],"core.edit":{"4":1},"core.edit.state":{"5":1},"core.edit.own":[]}'),
(475, 112, 354, 355, 4, 'com_content.article.297', 'JA Joomla site builder : 5 new features added this week.', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":{"3":1},"core.delete":[],"core.edit":{"4":1},"core.edit.state":{"5":1},"core.edit.own":[]}'),
(476, 112, 356, 357, 4, 'com_content.article.298', 'Thanks - JA Joomla Site Builder Alpha 2000+ downloads in 2 days. New version released today', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":{"3":1},"core.delete":[],"core.edit":{"4":1},"core.edit.state":{"5":1},"core.edit.own":[]}'),
(477, 112, 358, 359, 4, 'com_content.article.299', 'Review | Features : Corporate and Business Joomla template - JA Company', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":{"3":1},"core.delete":[],"core.edit":{"4":1},"core.edit.state":{"5":1},"core.edit.own":[]}'),
(478, 112, 360, 361, 4, 'com_content.article.300', 'Joomla custom field filter added in JA MegaFilter - Demo', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":{"3":1},"core.delete":[],"core.edit":{"4":1},"core.edit.state":{"5":1},"core.edit.own":[]}'),
(479, 112, 362, 363, 4, 'com_content.article.301', 'Review | Features : Alumni and University Joomla template - JA Alumni', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":{"3":1},"core.delete":[],"core.edit":{"4":1},"core.edit.state":{"5":1},"core.edit.own":[]}'),
(480, 112, 364, 365, 4, 'com_content.article.302', 'Review | Features : Joomla News Magazine Template JA Oslo', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":{"3":1},"core.delete":[],"core.edit":{"4":1},"core.edit.state":{"5":1},"core.edit.own":[]}'),
(481, 112, 366, 367, 4, 'com_content.article.303', 'JA Joomla Page Builder now with undo redo, export import & more', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":{"3":1},"core.delete":[],"core.edit":{"4":1},"core.edit.state":{"5":1},"core.edit.own":[]}'),
(482, 112, 368, 369, 4, 'com_content.article.304', 'Joomla Page Builder - Create stunning landing page in 5 minutes', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":{"3":1},"core.delete":[],"core.edit":{"4":1},"core.edit.state":{"5":1},"core.edit.own":[]}'),
(483, 112, 370, 371, 4, 'com_content.article.305', 'Advanced Joomla Filter extension released - JA Megafilter', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":{"3":1},"core.delete":[],"core.edit":{"4":1},"core.edit.state":{"5":1},"core.edit.own":[]}'),
(484, 112, 372, 373, 4, 'com_content.article.306', 'Joomla Page Builder - Illustrated examples of using custom styles', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":{"3":1},"core.delete":[],"core.edit":{"4":1},"core.edit.state":{"5":1},"core.edit.own":[]}'),
(485, 112, 374, 375, 4, 'com_content.article.307', 'Thanks - JA Joomla Site Builder Alpha 2000+ downloads in 2 days. New version released today', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":{"3":1},"core.delete":[],"core.edit":{"4":1},"core.edit.state":{"5":1},"core.edit.own":[]}'),
(486, 112, 376, 377, 4, 'com_content.article.308', 'JA Joomla site builder : 5 new features added this week.', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":{"3":1},"core.delete":[],"core.edit":{"4":1},"core.edit.state":{"5":1},"core.edit.own":[]}'),
(487, 112, 378, 379, 4, 'com_content.article.309', 'Recap of what JoomlArt has been doing lately & what\'s coming', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":{"3":1},"core.delete":[],"core.edit":{"4":1},"core.edit.state":{"5":1},"core.edit.own":[]}'),
(488, 112, 380, 381, 4, 'com_content.article.310', 'Updates: 9 more Joomla templates updated to Joomla 3.6.2', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":{"3":1},"core.delete":[],"core.edit":{"4":1},"core.edit.state":{"5":1},"core.edit.own":[]}'),
(489, 112, 382, 383, 4, 'com_content.article.311', 'Real-Time Dashboard added - JA Google Analytics Reports module for Joomla', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":{"3":1},"core.delete":[],"core.edit":{"4":1},"core.edit.state":{"5":1},"core.edit.own":[]}'),
(490, 112, 384, 385, 4, 'com_content.article.312', 'New feature release : JA K2 to Com_content migration joomla extension released', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":{"3":1},"core.delete":[],"core.edit":{"4":1},"core.edit.state":{"5":1},"core.edit.own":[]}'),
(491, 112, 386, 387, 4, 'com_content.article.313', 'New features release : JA K2 filter and search component for Joomla', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":{"3":1},"core.delete":[],"core.edit":{"4":1},"core.edit.state":{"5":1},"core.edit.own":[]}'),
(492, 112, 388, 389, 4, 'com_content.article.314', 'Joomla Admin template - JA Admin stable version released', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":{"3":1},"core.delete":[],"core.edit":{"4":1},"core.edit.state":{"5":1},"core.edit.own":[]}'),
(493, 112, 390, 391, 4, 'com_content.article.315', 'Introducing the best restaurant Joomla template - JA Restaurant', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":{"3":1},"core.delete":[],"core.edit":{"4":1},"core.edit.state":{"5":1},"core.edit.own":[]}'),
(494, 112, 392, 393, 4, 'com_content.article.316', 'Updates: JA Promo bar module released with new features and improvement', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":{"3":1},"core.delete":[],"core.edit":{"4":1},"core.edit.state":{"5":1},"core.edit.own":[]}'),
(495, 112, 394, 395, 4, 'com_content.article.317', 'Updates : Revamped JA Quick Contact module with multiple layouts & 3 more templates bug fix release', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":{"3":1},"core.delete":[],"core.edit":{"4":1},"core.edit.state":{"5":1},"core.edit.own":[]}'),
(496, 112, 396, 397, 4, 'com_content.article.318', 'JA Image hotspot module version 1.1.0 now supports 4 content types', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":{"3":1},"core.delete":[],"core.edit":{"4":1},"core.edit.state":{"5":1},"core.edit.own":[]}'),
(497, 1, 757, 758, 1, 'com_fields', 'com_fields', '{}'),
(498, 1, 759, 760, 1, 'com_associations', 'com_associations', '{}');

DROP TABLE IF EXISTS `#__associations`;
CREATE TABLE `#__associations` (
  `id` int(11) NOT NULL COMMENT 'A reference to the associated item.',
  `context` varchar(50) NOT NULL COMMENT 'The context of the associated item.',
  `key` char(32) NOT NULL COMMENT 'The key for the association computed from an md5 on associated ids.',
  PRIMARY KEY (`context`,`id`),
  KEY `idx_key` (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `#__banner_clients`;
CREATE TABLE `#__banner_clients` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `contact` varchar(255) NOT NULL DEFAULT '',
  `email` varchar(255) NOT NULL DEFAULT '',
  `extrainfo` text NOT NULL,
  `state` tinyint(3) NOT NULL DEFAULT 0,
  `checked_out` int(10) unsigned NOT NULL DEFAULT 0,
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `metakey` text NOT NULL,
  `own_prefix` tinyint(4) NOT NULL DEFAULT 0,
  `metakey_prefix` varchar(400) NOT NULL DEFAULT '',
  `purchase_type` tinyint(4) NOT NULL DEFAULT -1,
  `track_clicks` tinyint(4) NOT NULL DEFAULT -1,
  `track_impressions` tinyint(4) NOT NULL DEFAULT -1,
  PRIMARY KEY (`id`),
  KEY `idx_own_prefix` (`own_prefix`),
  KEY `idx_metakey_prefix` (`metakey_prefix`(100))
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `#__banner_tracks`;
CREATE TABLE `#__banner_tracks` (
  `track_date` datetime NOT NULL,
  `track_type` int(10) unsigned NOT NULL,
  `banner_id` int(10) unsigned NOT NULL,
  `count` int(10) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`track_date`,`track_type`,`banner_id`),
  KEY `idx_track_date` (`track_date`),
  KEY `idx_track_type` (`track_type`),
  KEY `idx_banner_id` (`banner_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `#__banners`;
CREATE TABLE `#__banners` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cid` int(11) NOT NULL DEFAULT 0,
  `type` int(11) NOT NULL DEFAULT 0,
  `name` varchar(255) NOT NULL DEFAULT '',
  `alias` varchar(400) binary NOT NULL DEFAULT '',
  `imptotal` int(11) NOT NULL DEFAULT 0,
  `impmade` int(11) NOT NULL DEFAULT 0,
  `clicks` int(11) NOT NULL DEFAULT 0,
  `clickurl` varchar(200) NOT NULL DEFAULT '',
  `state` tinyint(3) NOT NULL DEFAULT 0,
  `catid` int(10) unsigned NOT NULL DEFAULT 0,
  `description` text NOT NULL,
  `custombannercode` varchar(2048) NOT NULL,
  `sticky` tinyint(1) unsigned NOT NULL DEFAULT 0,
  `ordering` int(11) NOT NULL DEFAULT 0,
  `metakey` text NOT NULL,
  `params` text NOT NULL,
  `own_prefix` tinyint(1) NOT NULL DEFAULT 0,
  `metakey_prefix` varchar(400) NOT NULL DEFAULT '',
  `purchase_type` tinyint(4) NOT NULL DEFAULT -1,
  `track_clicks` tinyint(4) NOT NULL DEFAULT -1,
  `track_impressions` tinyint(4) NOT NULL DEFAULT -1,
  `checked_out` int(10) unsigned NOT NULL DEFAULT 0,
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_up` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `reset` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `language` char(7) NOT NULL DEFAULT '',
  `created_by` int(10) unsigned NOT NULL DEFAULT 0,
  `created_by_alias` varchar(255) NOT NULL DEFAULT '',
  `modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(10) unsigned NOT NULL DEFAULT 0,
  `version` int(10) unsigned NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`),
  KEY `idx_state` (`state`),
  KEY `idx_own_prefix` (`own_prefix`),
  KEY `idx_metakey_prefix` (`metakey_prefix`(100)),
  KEY `idx_banner_catid` (`catid`),
  KEY `idx_language` (`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `#__categories`;
CREATE TABLE `#__categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `asset_id` int(10) unsigned NOT NULL DEFAULT 0 COMMENT 'FK to the #__assets table.',
  `parent_id` int(10) unsigned NOT NULL DEFAULT 0,
  `lft` int(11) NOT NULL DEFAULT 0,
  `rgt` int(11) NOT NULL DEFAULT 0,
  `level` int(10) unsigned NOT NULL DEFAULT 0,
  `path` varchar(400) NOT NULL DEFAULT '',
  `extension` varchar(50) NOT NULL DEFAULT '',
  `title` varchar(255) NOT NULL DEFAULT '',
  `alias` varchar(400) binary NOT NULL DEFAULT '',
  `note` varchar(255) NOT NULL DEFAULT '',
  `description` mediumtext NOT NULL,
  `published` tinyint(1) NOT NULL DEFAULT 0,
  `checked_out` int(11) unsigned NOT NULL DEFAULT 0,
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `access` int(10) unsigned NOT NULL DEFAULT 0,
  `params` text NOT NULL,
  `metadesc` varchar(1024) NOT NULL DEFAULT '' COMMENT 'The meta description for the page.',
  `metakey` varchar(1024) NOT NULL DEFAULT '' COMMENT 'The meta keywords for the page.',
  `metadata` varchar(2048) NOT NULL DEFAULT '' COMMENT 'JSON encoded metadata properties.',
  `created_user_id` int(10) unsigned NOT NULL DEFAULT 0,
  `created_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_user_id` int(10) unsigned NOT NULL DEFAULT 0,
  `modified_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `hits` int(10) unsigned NOT NULL DEFAULT 0,
  `language` char(7) NOT NULL DEFAULT '',
  `version` int(10) unsigned NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`),
  KEY `cat_idx` (`extension`,`published`,`access`),
  KEY `idx_access` (`access`),
  KEY `idx_checkout` (`checked_out`),
  KEY `idx_path` (`path`(100)),
  KEY `idx_left_right` (`lft`,`rgt`),
  KEY `idx_alias` (`alias`(100)),
  KEY `idx_language` (`language`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

INSERT INTO `#__categories` (`id`, `asset_id`, `parent_id`, `lft`, `rgt`, `level`, `path`, `extension`, `title`, `alias`, `note`, `description`, `published`, `checked_out`, `checked_out_time`, `access`, `params`, `metadesc`, `metakey`, `metadata`, `created_user_id`, `created_time`, `modified_user_id`, `modified_time`, `hits`, `language`, `version`) VALUES
(1, 0, 0, 0, 37, 0, '', 'system', 'ROOT', 'root', '', '', 1, 0, '0000-00-00 00:00:00', 1, '{}', '', '', '{}', 42, '2017-07-10 10:08:09', 0, '0000-00-00 00:00:00', 0, '*', 1),
(2, 27, 1, 1, 2, 1, 'uncategorised', 'com_content', 'Uncategorised', 'uncategorised', '', '', 1, 0, '0000-00-00 00:00:00', 1, '{"category_layout":"","image":""}', '', '', '{"author":"","robots":""}', 42, '2017-07-10 10:08:09', 0, '0000-00-00 00:00:00', 0, '*', 1),
(3, 28, 1, 3, 4, 1, 'uncategorised', 'com_banners', 'Uncategorised', 'uncategorised', '', '', 1, 0, '0000-00-00 00:00:00', 1, '{"category_layout":"","image":""}', '', '', '{"author":"","robots":""}', 42, '2017-07-10 10:08:09', 0, '0000-00-00 00:00:00', 0, '*', 1),
(4, 29, 1, 5, 6, 1, 'uncategorised', 'com_contact', 'Uncategorised', 'uncategorised', '', '', 1, 0, '0000-00-00 00:00:00', 1, '{"category_layout":"","image":""}', '', '', '{"author":"","robots":""}', 42, '2017-07-10 10:08:09', 0, '0000-00-00 00:00:00', 0, '*', 1),
(5, 30, 1, 7, 8, 1, 'uncategorised', 'com_newsfeeds', 'Uncategorised', 'uncategorised', '', '', 1, 0, '0000-00-00 00:00:00', 1, '{"category_layout":"","image":""}', '', '', '{"author":"","robots":""}', 42, '2017-07-10 10:08:09', 0, '0000-00-00 00:00:00', 0, '*', 1),
(7, 32, 1, 9, 10, 1, 'uncategorised', 'com_users', 'Uncategorised', 'uncategorised', '', '', 1, 0, '0000-00-00 00:00:00', 1, '{"category_layout":"","image":""}', '', '', '{"author":"","robots":""}', 42, '2017-07-10 10:08:09', 0, '0000-00-00 00:00:00', 0, '*', 1);

DROP TABLE IF EXISTS `#__contact_details`;
CREATE TABLE `#__contact_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `alias` varchar(400) binary NOT NULL,
  `con_position` varchar(255) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `suburb` varchar(100) DEFAULT NULL,
  `state` varchar(100) DEFAULT NULL,
  `country` varchar(100) DEFAULT NULL,
  `postcode` varchar(100) DEFAULT NULL,
  `telephone` varchar(255) DEFAULT NULL,
  `fax` varchar(255) DEFAULT NULL,
  `misc` mediumtext DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `email_to` varchar(255) DEFAULT NULL,
  `default_con` tinyint(1) unsigned NOT NULL DEFAULT 0,
  `published` tinyint(1) NOT NULL DEFAULT 0,
  `checked_out` int(10) unsigned NOT NULL DEFAULT 0,
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ordering` int(11) NOT NULL DEFAULT 0,
  `params` text NOT NULL,
  `user_id` int(11) NOT NULL DEFAULT 0,
  `catid` int(11) NOT NULL DEFAULT 0,
  `access` int(10) unsigned NOT NULL DEFAULT 0,
  `mobile` varchar(255) NOT NULL DEFAULT '',
  `webpage` varchar(255) NOT NULL DEFAULT '',
  `sortname1` varchar(255) NOT NULL DEFAULT '',
  `sortname2` varchar(255) NOT NULL DEFAULT '',
  `sortname3` varchar(255) NOT NULL DEFAULT '',
  `language` varchar(7) NOT NULL,
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(10) unsigned NOT NULL DEFAULT 0,
  `created_by_alias` varchar(255) NOT NULL DEFAULT '',
  `modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(10) unsigned NOT NULL DEFAULT 0,
  `metakey` text NOT NULL,
  `metadesc` text NOT NULL,
  `metadata` text NOT NULL,
  `featured` tinyint(3) unsigned NOT NULL DEFAULT 0 COMMENT 'Set if article is featured.',
  `xreference` varchar(50) NOT NULL DEFAULT '' COMMENT 'A reference to enable linkages to external data sets.',
  `publish_up` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `version` int(10) unsigned NOT NULL DEFAULT 1,
  `hits` int(10) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `idx_access` (`access`),
  KEY `idx_checkout` (`checked_out`),
  KEY `idx_state` (`published`),
  KEY `idx_catid` (`catid`),
  KEY `idx_createdby` (`created_by`),
  KEY `idx_featured_catid` (`featured`,`catid`),
  KEY `idx_language` (`language`),
  KEY `idx_xreference` (`xreference`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `#__content`;
CREATE TABLE `#__content` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `asset_id` int(10) unsigned NOT NULL DEFAULT 0 COMMENT 'FK to the #__assets table.',
  `title` varchar(255) NOT NULL DEFAULT '',
  `alias` varchar(400) binary NOT NULL DEFAULT '',
  `introtext` mediumtext NOT NULL,
  `fulltext` mediumtext NOT NULL,
  `state` tinyint(3) NOT NULL DEFAULT 0,
  `catid` int(10) unsigned NOT NULL DEFAULT 0,
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(10) unsigned NOT NULL DEFAULT 0,
  `created_by_alias` varchar(255) NOT NULL DEFAULT '',
  `modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(10) unsigned NOT NULL DEFAULT 0,
  `checked_out` int(10) unsigned NOT NULL DEFAULT 0,
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_up` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `images` text NOT NULL,
  `urls` text NOT NULL,
  `attribs` varchar(5120) NOT NULL,
  `version` int(10) unsigned NOT NULL DEFAULT 1,
  `ordering` int(11) NOT NULL DEFAULT 0,
  `metakey` text NOT NULL,
  `metadesc` text NOT NULL,
  `access` int(10) unsigned NOT NULL DEFAULT 0,
  `hits` int(10) unsigned NOT NULL DEFAULT 0,
  `metadata` text NOT NULL,
  `featured` tinyint(3) unsigned NOT NULL DEFAULT 0 COMMENT 'Set if article is featured.',
  `language` char(7) NOT NULL COMMENT 'The language code for the article.',
  `xreference` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `idx_access` (`access`),
  KEY `idx_checkout` (`checked_out`),
  KEY `idx_state` (`state`),
  KEY `idx_catid` (`catid`),
  KEY `idx_createdby` (`created_by`),
  KEY `idx_featured_catid` (`featured`,`catid`),
  KEY `idx_language` (`language`),
  KEY `idx_xreference` (`xreference`)
) ENGINE=InnoDB AUTO_INCREMENT=319 DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `#__content_frontpage`;
CREATE TABLE `#__content_frontpage` (
  `content_id` int(11) NOT NULL DEFAULT 0,
  `ordering` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`content_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `#__content_rating`;
CREATE TABLE `#__content_rating` (
  `content_id` int(11) NOT NULL DEFAULT 0,
  `rating_sum` int(10) unsigned NOT NULL DEFAULT 0,
  `rating_count` int(10) unsigned NOT NULL DEFAULT 0,
  `lastip` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`content_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `#__content_types`;
CREATE TABLE `#__content_types` (
  `type_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type_title` varchar(255) NOT NULL DEFAULT '',
  `type_alias` varchar(400) NOT NULL DEFAULT '',
  `table` varchar(255) NOT NULL DEFAULT '',
  `rules` text NOT NULL,
  `field_mappings` text NOT NULL,
  `router` varchar(255) NOT NULL DEFAULT '',
  `content_history_options` varchar(5120) DEFAULT NULL COMMENT 'JSON string for com_contenthistory options',
  PRIMARY KEY (`type_id`),
  KEY `idx_alias` (`type_alias`(100))
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `#__contentitem_tag_map`;
CREATE TABLE `#__contentitem_tag_map` (
  `type_alias` varchar(255) NOT NULL DEFAULT '',
  `core_content_id` int(10) unsigned NOT NULL COMMENT 'PK from the core content table',
  `content_item_id` int(11) NOT NULL COMMENT 'PK from the content type table',
  `tag_id` int(10) unsigned NOT NULL COMMENT 'PK from the tag table',
  `tag_date` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Date of most recent save for this tag-item',
  `type_id` mediumint(8) NOT NULL COMMENT 'PK from the content_type table',
  UNIQUE KEY `uc_ItemnameTagid` (`type_id`,`content_item_id`,`tag_id`),
  KEY `idx_tag_type` (`tag_id`,`type_id`),
  KEY `idx_date_id` (`tag_date`,`tag_id`),
  KEY `idx_core_content_id` (`core_content_id`)
) ENGINE=InnoDB COMMENT='Maps items from content tables to tags' DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `#__core_log_searches`;
CREATE TABLE `#__core_log_searches` (
  `search_term` varchar(128) NOT NULL DEFAULT '',
  `hits` int(10) unsigned NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `#__easyblog_associations`;
CREATE TABLE `#__easyblog_associations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `post_id` int(11) NOT NULL,
  `key` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_postid` (`post_id`),
  KEY `idx_key` (`key`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `#__easyblog_category_fields_groups`;
CREATE TABLE `#__easyblog_category_fields_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `category_id` (`category_id`,`group_id`),
  KEY `cat_id` (`category_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `#__easyblog_composer_blocks`;
CREATE TABLE `#__easyblog_composer_blocks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group` varchar(255) NOT NULL,
  `element` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `keywords` text NOT NULL,
  `published` tinyint(3) NOT NULL,
  `created` datetime DEFAULT NULL,
  `ordering` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_published` (`published`),
  KEY `idx_ordering` (`ordering`)
) ENGINE=MyISAM AUTO_INCREMENT=41 DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `#__easyblog_fields`;
CREATE TABLE `#__easyblog_fields` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `title` text NOT NULL,
  `help` text NOT NULL,
  `state` tinyint(3) NOT NULL,
  `required` tinyint(3) NOT NULL,
  `type` varchar(255) NOT NULL,
  `params` text NOT NULL,
  `created` datetime DEFAULT NULL,
  `options` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `group_id` (`group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `#__easyblog_fields_groups`;
CREATE TABLE `#__easyblog_fields_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `created` datetime DEFAULT NULL,
  `state` tinyint(3) NOT NULL,
  `read` text NOT NULL,
  `write` text NOT NULL,
  `params` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `state` (`state`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `#__easyblog_fields_values`;
CREATE TABLE `#__easyblog_fields_values` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `field_id` int(11) NOT NULL,
  `post_id` int(11) NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `field_id` (`field_id`),
  KEY `post_id` (`post_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `#__easyblog_languages`;
CREATE TABLE `#__easyblog_languages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `locale` varchar(255) NOT NULL,
  `updated` datetime NOT NULL,
  `state` tinyint(3) NOT NULL,
  `translator` varchar(255) NOT NULL,
  `progress` int(11) NOT NULL,
  `params` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `#__easyblog_post_assets`;
CREATE TABLE `#__easyblog_post_assets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `post_id` int(11) NOT NULL,
  `key` varchar(255) NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `blog_id` (`post_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `#__easyblog_post_category`;
CREATE TABLE `#__easyblog_post_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `post_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `primary` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `eb_post_category_postid` (`post_id`),
  KEY `eb_post_category_catid` (`category_id`),
  KEY `eb_post_category_post_cat` (`post_id`,`category_id`),
  KEY `eb_post_category_cat_post` (`category_id`,`post_id`)
) ENGINE=MyISAM AUTO_INCREMENT=86 DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `#__easyblog_post_templates`;
CREATE TABLE `#__easyblog_post_templates` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `data` text NOT NULL,
  `created` datetime NOT NULL,
  `system` tinyint(1) NOT NULL,
  `core` tinyint(1) DEFAULT 0,
  `screenshot` text NOT NULL,
  `published` tinyint(3) DEFAULT 1,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `#__easyblog_reports`;
CREATE TABLE `#__easyblog_reports` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `obj_id` bigint(20) NOT NULL,
  `obj_type` varchar(255) NOT NULL,
  `reason` text NOT NULL,
  `created_by` int(11) NOT NULL,
  `created` datetime NOT NULL,
  `ip` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `obj_id` (`obj_id`,`created_by`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `#__easyblog_revisions`;
CREATE TABLE `#__easyblog_revisions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `post_id` bigint(20) NOT NULL,
  `title` varchar(255) NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `created_by` bigint(20) unsigned NOT NULL,
  `content` longtext NOT NULL,
  `state` tinyint(4) NOT NULL DEFAULT 0,
  `ordering` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_postid` (`post_id`),
  KEY `idx_ordering` (`post_id`,`ordering`),
  KEY `idx_revision_state` (`post_id`,`state`),
  KEY `idx_state` (`state`)
) ENGINE=MyISAM AUTO_INCREMENT=72 DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `#__easyblog_subscriptions`;
CREATE TABLE `#__easyblog_subscriptions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uid` bigint(20) unsigned NOT NULL,
  `utype` varchar(64) NOT NULL,
  `user_id` bigint(20) unsigned DEFAULT 0,
  `fullname` varchar(255) DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `easyblog_subscriptions_types` (`uid`,`utype`),
  KEY `easyblog_subscriptions_types_userid` (`uid`,`utype`,`user_id`),
  KEY `easyblog_subscriptions_types_email` (`uid`,`utype`,`email`),
  KEY `easyblog_subscriptions_userid` (`user_id`),
  KEY `easyblog_subscriptions_email` (`email`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `#__easyblog_uploader_tmp`;
CREATE TABLE `#__easyblog_uploader_tmp` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `type` varchar(255) NOT NULL,
  `path` text NOT NULL,
  `uri` text NOT NULL,
  `raw` text NOT NULL,
  `created` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`,`type`),
  KEY `idx_uploader_created` (`created`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `#__extensions`;
CREATE TABLE `#__extensions` (
  `extension_id` int(11) NOT NULL AUTO_INCREMENT,
  `package_id` int(11) NOT NULL DEFAULT 0 COMMENT 'Parent package ID for extensions installed as a package.',
  `name` varchar(100) NOT NULL,
  `type` varchar(20) NOT NULL,
  `element` varchar(100) NOT NULL,
  `folder` varchar(100) NOT NULL,
  `client_id` tinyint(3) NOT NULL,
  `enabled` tinyint(3) NOT NULL DEFAULT 0,
  `access` int(10) unsigned NOT NULL DEFAULT 1,
  `protected` tinyint(3) NOT NULL DEFAULT 0,
  `manifest_cache` text NOT NULL,
  `params` text NOT NULL,
  `custom_data` text NOT NULL,
  `system_data` text NOT NULL,
  `checked_out` int(10) unsigned NOT NULL DEFAULT 0,
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ordering` int(11) DEFAULT 0,
  `state` int(11) DEFAULT 0,
  PRIMARY KEY (`extension_id`),
  KEY `element_clientid` (`element`,`client_id`),
  KEY `element_folder_clientid` (`element`,`folder`,`client_id`),
  KEY `extension` (`type`,`element`,`folder`,`client_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10043 DEFAULT CHARSET=utf8;

INSERT INTO `#__extensions` (`extension_id`, `package_id`, `name`, `type`, `element`, `folder`, `client_id`, `enabled`, `access`, `protected`, `manifest_cache`, `params`, `custom_data`, `system_data`, `checked_out`, `checked_out_time`, `ordering`, `state`) VALUES
(1, 0, 'com_mailto', 'component', 'com_mailto', '', 0, 1, 1, 1, '{"name":"com_mailto","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2017 Open Source Matters. All rights reserved.\\t","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"COM_MAILTO_XML_DESCRIPTION","group":"","filename":"mailto"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(2, 0, 'com_wrapper', 'component', 'com_wrapper', '', 0, 1, 1, 1, '{"name":"com_wrapper","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2017 Open Source Matters. All rights reserved.\\n\\t","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"COM_WRAPPER_XML_DESCRIPTION","group":"","filename":"wrapper"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(3, 0, 'com_admin', 'component', 'com_admin', '', 1, 1, 1, 1, '{"name":"com_admin","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2017 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"COM_ADMIN_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(4, 0, 'com_banners', 'component', 'com_banners', '', 1, 1, 1, 0, '{"name":"com_banners","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2017 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"COM_BANNERS_XML_DESCRIPTION","group":"","filename":"banners"}', '{"purchase_type":"3","track_impressions":"0","track_clicks":"0","metakey_prefix":"","save_history":"1","history_limit":10}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(5, 0, 'com_cache', 'component', 'com_cache', '', 1, 1, 1, 1, '{"name":"com_cache","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2017 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"COM_CACHE_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(6, 0, 'com_categories', 'component', 'com_categories', '', 1, 1, 1, 1, '{"name":"com_categories","type":"component","creationDate":"December 2007","author":"Joomla! Project","copyright":"(C) 2005 - 2017 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"COM_CATEGORIES_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(7, 0, 'com_checkin', 'component', 'com_checkin', '', 1, 1, 1, 1, '{"name":"com_checkin","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2017 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"COM_CHECKIN_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(8, 0, 'com_contact', 'component', 'com_contact', '', 1, 1, 1, 0, '{"name":"com_contact","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2017 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"COM_CONTACT_XML_DESCRIPTION","group":"","filename":"contact"}', '{"show_contact_category":"hide","save_history":"1","history_limit":10,"show_contact_list":"0","presentation_style":"sliders","show_name":"1","show_position":"1","show_email":"0","show_street_address":"1","show_suburb":"1","show_state":"1","show_postcode":"1","show_country":"1","show_telephone":"1","show_mobile":"1","show_fax":"1","show_webpage":"1","show_misc":"1","show_image":"1","image":"","allow_vcard":"0","show_articles":"0","show_profile":"0","show_links":"0","linka_name":"","linkb_name":"","linkc_name":"","linkd_name":"","linke_name":"","contact_icons":"0","icon_address":"","icon_email":"","icon_telephone":"","icon_mobile":"","icon_fax":"","icon_misc":"","show_headings":"1","show_position_headings":"1","show_email_headings":"0","show_telephone_headings":"1","show_mobile_headings":"0","show_fax_headings":"0","allow_vcard_headings":"0","show_suburb_headings":"1","show_state_headings":"1","show_country_headings":"1","show_email_form":"1","show_email_copy":"1","banned_email":"","banned_subject":"","banned_text":"","validate_session":"1","custom_reply":"0","redirect":"","show_category_crumb":"0","metakey":"","metadesc":"","robots":"","author":"","rights":"","xreference":""}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(9, 0, 'com_cpanel', 'component', 'com_cpanel', '', 1, 1, 1, 1, '{"name":"com_cpanel","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2017 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"COM_CPANEL_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10, 0, 'com_installer', 'component', 'com_installer', '', 1, 1, 1, 1, '{"name":"com_installer","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2017 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"COM_INSTALLER_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(11, 0, 'com_languages', 'component', 'com_languages', '', 1, 1, 1, 1, '{"name":"com_languages","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2017 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"COM_LANGUAGES_XML_DESCRIPTION","group":""}', '{"administrator":"en-GB","site":"en-GB"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(12, 0, 'com_login', 'component', 'com_login', '', 1, 1, 1, 1, '{"name":"com_login","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2017 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"COM_LOGIN_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(13, 0, 'com_media', 'component', 'com_media', '', 1, 1, 0, 1, '{"name":"com_media","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2017 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"COM_MEDIA_XML_DESCRIPTION","group":"","filename":"media"}', '{"upload_extensions":"bmp,csv,doc,gif,ico,jpg,jpeg,odg,odp,ods,odt,pdf,png,ppt,swf,txt,xcf,xls,BMP,CSV,DOC,GIF,ICO,JPG,JPEG,ODG,ODP,ODS,ODT,PDF,PNG,PPT,SWF,TXT,XCF,XLS","upload_maxsize":"10","file_path":"images","image_path":"images","restrict_uploads":"1","allowed_media_usergroup":"3","check_mime":"1","image_extensions":"bmp,gif,jpg,png","ignore_extensions":"","upload_mime":"image\\/jpeg,image\\/gif,image\\/png,image\\/bmp,application\\/x-shockwave-flash,application\\/msword,application\\/excel,application\\/pdf,application\\/powerpoint,text\\/plain,application\\/x-zip","upload_mime_illegal":"text\\/html"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(14, 0, 'com_menus', 'component', 'com_menus', '', 1, 1, 1, 1, '{"name":"com_menus","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2017 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"COM_MENUS_XML_DESCRIPTION","group":""}', '{"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":""}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(15, 0, 'com_messages', 'component', 'com_messages', '', 1, 1, 1, 1, '{"name":"com_messages","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2017 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"COM_MESSAGES_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(16, 0, 'com_modules', 'component', 'com_modules', '', 1, 1, 1, 1, '{"name":"com_modules","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2017 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"COM_MODULES_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(17, 0, 'com_newsfeeds', 'component', 'com_newsfeeds', '', 1, 1, 1, 0, '{"name":"com_newsfeeds","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2017 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"COM_NEWSFEEDS_XML_DESCRIPTION","group":"","filename":"newsfeeds"}', '{"newsfeed_layout":"_:default","save_history":"1","history_limit":5,"show_feed_image":"1","show_feed_description":"1","show_item_description":"1","feed_character_count":"0","feed_display_order":"des","float_first":"right","float_second":"right","show_tags":"1","category_layout":"_:default","show_category_title":"1","show_description":"1","show_description_image":"1","maxLevel":"-1","show_empty_categories":"0","show_subcat_desc":"1","show_cat_items":"1","show_cat_tags":"1","show_base_description":"1","maxLevelcat":"-1","show_empty_categories_cat":"0","show_subcat_desc_cat":"1","show_cat_items_cat":"1","filter_field":"1","show_pagination_limit":"1","show_headings":"1","show_articles":"0","show_link":"1","show_pagination":"1","show_pagination_results":"1"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(18, 0, 'com_plugins', 'component', 'com_plugins', '', 1, 1, 1, 1, '{"name":"com_plugins","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2017 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"COM_PLUGINS_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(19, 0, 'com_search', 'component', 'com_search', '', 1, 1, 1, 0, '{"name":"com_search","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2017 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"COM_SEARCH_XML_DESCRIPTION","group":"","filename":"search"}', '{"enabled":"0","show_date":"1"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(20, 0, 'com_templates', 'component', 'com_templates', '', 1, 1, 1, 1, '{"name":"com_templates","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2017 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"COM_TEMPLATES_XML_DESCRIPTION","group":""}', '{"template_positions_display":"1","upload_limit":"2","image_formats":"gif,bmp,jpg,jpeg,png","source_formats":"txt,less,ini,xml,js,php,css","font_formats":"woff,ttf,otf","compressed_formats":"zip"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(22, 0, 'com_content', 'component', 'com_content', '', 1, 1, 0, 1, '{"name":"com_content","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2017 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"COM_CONTENT_XML_DESCRIPTION","group":"","filename":"content"}', '{"article_layout":"_:default","show_title":"1","link_titles":"1","show_intro":"1","info_block_position":"0","show_category":"1","link_category":"1","show_parent_category":"0","link_parent_category":"0","show_author":"1","link_author":"1","show_create_date":"0","show_modify_date":"0","show_publish_date":"1","show_item_navigation":"0","show_vote":"0","show_readmore":"1","show_readmore_title":"0","readmore_limit":"100","show_tags":"1","show_icons":"1","show_print_icon":"1","show_email_icon":"1","show_hits":"0","show_noauth":"0","urls_position":"0","show_publishing_options":"1","show_article_options":"1","save_history":"1","history_limit":10,"show_urls_images_frontend":"1","show_urls_images_backend":"1","targeta":0,"targetb":0,"targetc":0,"float_intro":"none","float_fulltext":"none","category_layout":"_:blog","show_category_heading_title_text":"1","show_category_title":"0","show_description":"0","show_description_image":"0","maxLevel":"1","show_empty_categories":"0","show_no_articles":"1","show_subcat_desc":"1","show_cat_num_articles":"0","show_cat_tags":"1","show_base_description":"1","maxLevelcat":"-1","show_empty_categories_cat":"0","show_subcat_desc_cat":"1","show_cat_num_articles_cat":"1","num_leading_articles":"1","num_intro_articles":"4","num_columns":"1","num_links":"0","multi_column_order":"0","show_subcategory_content":"0","show_pagination_limit":"1","filter_field":"hide","show_headings":"1","list_show_date":"0","date_format":"","list_show_hits":"1","list_show_author":"1","orderby_pri":"order","orderby_sec":"rdate","order_date":"published","show_pagination":"2","show_pagination_results":"1","show_featured":"show","show_feed_link":"1","feed_summary":"0","feed_show_readmore":"0"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(23, 0, 'com_config', 'component', 'com_config', '', 1, 1, 0, 1, '{"name":"com_config","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2017 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"COM_CONFIG_XML_DESCRIPTION","group":""}', '{"filters":{"1":{"filter_type":"NH","filter_tags":"","filter_attributes":""},"9":{"filter_type":"BL","filter_tags":"","filter_attributes":""},"6":{"filter_type":"BL","filter_tags":"","filter_attributes":""},"7":{"filter_type":"NONE","filter_tags":"","filter_attributes":""},"2":{"filter_type":"NH","filter_tags":"","filter_attributes":""},"3":{"filter_type":"BL","filter_tags":"","filter_attributes":""},"4":{"filter_type":"BL","filter_tags":"","filter_attributes":""},"5":{"filter_type":"BL","filter_tags":"","filter_attributes":""},"8":{"filter_type":"NONE","filter_tags":"","filter_attributes":""}}}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(24, 0, 'com_redirect', 'component', 'com_redirect', '', 1, 1, 0, 1, '{"name":"com_redirect","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2017 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"COM_REDIRECT_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(25, 0, 'com_users', 'component', 'com_users', '', 1, 1, 0, 1, '{"name":"com_users","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2017 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"COM_USERS_XML_DESCRIPTION","group":"","filename":"users"}', '{"allowUserRegistration":"1","new_usertype":"2","guest_usergroup":"9","sendpassword":"1","useractivation":"1","mail_to_admin":"0","captcha":"","frontend_userparams":"1","site_language":"0","change_login_name":"0","reset_count":"10","reset_time":"1","minimum_length":"4","minimum_integers":"0","minimum_symbols":"0","minimum_uppercase":"0","save_history":"1","history_limit":5,"mailSubjectPrefix":"","mailBodySuffix":""}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(27, 0, 'com_finder', 'component', 'com_finder', '', 1, 1, 0, 0, '{"name":"com_finder","type":"component","creationDate":"August 2011","author":"Joomla! Project","copyright":"(C) 2005 - 2017 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"COM_FINDER_XML_DESCRIPTION","group":"","filename":"finder"}', '{"show_description":"1","description_length":255,"allow_empty_query":"0","show_url":"1","show_advanced":"1","expand_advanced":"0","show_date_filters":"0","highlight_terms":"1","opensearch_name":"","opensearch_description":"","batch_size":"50","memory_table_limit":30000,"title_multiplier":"1.7","text_multiplier":"0.7","meta_multiplier":"1.2","path_multiplier":"2.0","misc_multiplier":"0.3","stemmer":"snowball"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(28, 0, 'com_joomlaupdate', 'component', 'com_joomlaupdate', '', 1, 1, 0, 1, '{"name":"com_joomlaupdate","type":"component","creationDate":"February 2012","author":"Joomla! Project","copyright":"(C) 2005 - 2017 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.6.2","description":"COM_JOOMLAUPDATE_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(29, 0, 'com_tags', 'component', 'com_tags', '', 1, 1, 1, 1, '{"name":"com_tags","type":"component","creationDate":"December 2013","author":"Joomla! Project","copyright":"(C) 2005 - 2017 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.1.0","description":"COM_TAGS_XML_DESCRIPTION","group":"","filename":"tags"}', '{"tag_layout":"_:default","save_history":"1","history_limit":5,"show_tag_title":"0","tag_list_show_tag_image":"0","tag_list_show_tag_description":"0","tag_list_image":"","show_tag_num_items":"0","tag_list_orderby":"title","tag_list_orderby_direction":"ASC","show_headings":"0","tag_list_show_date":"0","tag_list_show_item_image":"0","tag_list_show_item_description":"0","tag_list_item_maximum_characters":0,"return_any_or_all":"1","include_children":"0","maximum":200,"tag_list_language_filter":"all","tags_layout":"_:default","all_tags_orderby":"title","all_tags_orderby_direction":"ASC","all_tags_show_tag_image":"0","all_tags_show_tag_descripion":"0","all_tags_tag_maximum_characters":20,"all_tags_show_tag_hits":"0","filter_field":"1","show_pagination_limit":"1","show_pagination":"2","show_pagination_results":"1","tag_field_ajax_mode":"1","show_feed_link":"1"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(30, 0, 'com_contenthistory', 'component', 'com_contenthistory', '', 1, 1, 1, 0, '{"name":"com_contenthistory","type":"component","creationDate":"May 2013","author":"Joomla! Project","copyright":"(C) 2005 - 2017 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.2.0","description":"COM_CONTENTHISTORY_XML_DESCRIPTION","group":"","filename":"contenthistory"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(31, 0, 'com_ajax', 'component', 'com_ajax', '', 1, 1, 1, 1, '{"name":"com_ajax","type":"component","creationDate":"August 2013","author":"Joomla! Project","copyright":"(C) 2005 - 2017 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.2.0","description":"COM_AJAX_XML_DESCRIPTION","group":"","filename":"ajax"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(32, 0, 'com_postinstall', 'component', 'com_postinstall', '', 1, 1, 1, 1, '{"name":"com_postinstall","type":"component","creationDate":"September 2013","author":"Joomla! Project","copyright":"(C) 2005 - 2017 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.2.0","description":"COM_POSTINSTALL_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(33, 0, 'com_fields', 'component', 'com_fields', '', 1, 1, 1, 0, '{"name":"com_fields","type":"component","creationDate":"March 2016","author":"Joomla! Project","copyright":"(C) 2005 - 2017 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.7.0","description":"COM_FIELDS_XML_DESCRIPTION","group":"","filename":"fields"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(34, 0, 'com_associations', 'component', 'com_associations', '', 1, 1, 1, 0, '{"name":"com_associations","type":"component","creationDate":"Januar 2017","author":"Joomla! Project","copyright":"(C) 2005 - 2017 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.7.0","description":"COM_ASSOCIATIONS_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(102, 0, 'LIB_PHPUTF8', 'library', 'phputf8', '', 0, 1, 1, 1, '{"name":"LIB_PHPUTF8","type":"library","creationDate":"2006","author":"Harry Fuecks","copyright":"Copyright various authors","authorEmail":"hfuecks@gmail.com","authorUrl":"http:\\/\\/sourceforge.net\\/projects\\/phputf8","version":"0.5","description":"LIB_PHPUTF8_XML_DESCRIPTION","group":"","filename":"phputf8"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(103, 0, 'LIB_JOOMLA', 'library', 'joomla', '', 0, 1, 1, 1, '{"name":"LIB_JOOMLA","type":"library","creationDate":"2008","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2017 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"https:\\/\\/www.joomla.org","version":"13.1","description":"LIB_JOOMLA_XML_DESCRIPTION","group":"","filename":"joomla"}', '{"mediaversion":"da251b3623a424e5eebdbc7424e730ad"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(104, 0, 'LIB_IDNA', 'library', 'idna_convert', '', 0, 1, 1, 1, '{"name":"LIB_IDNA","type":"library","creationDate":"2004","author":"phlyLabs","copyright":"2004-2011 phlyLabs Berlin, http:\\/\\/phlylabs.de","authorEmail":"phlymail@phlylabs.de","authorUrl":"http:\\/\\/phlylabs.de","version":"0.8.0","description":"LIB_IDNA_XML_DESCRIPTION","group":"","filename":"idna_convert"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(105, 0, 'FOF', 'library', 'fof', '', 0, 1, 1, 1, '{"name":"FOF","type":"library","creationDate":"2015-04-22 13:15:32","author":"Nicholas K. Dionysopoulos \\/ Akeeba Ltd","copyright":"(C)2011-2015 Nicholas K. Dionysopoulos","authorEmail":"nicholas@akeebabackup.com","authorUrl":"https:\\/\\/www.akeebabackup.com","version":"2.4.3","description":"LIB_FOF_XML_DESCRIPTION","group":"","filename":"fof"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(106, 0, 'LIB_PHPASS', 'library', 'phpass', '', 0, 1, 1, 1, '{"name":"LIB_PHPASS","type":"library","creationDate":"2004-2006","author":"Solar Designer","copyright":"","authorEmail":"solar@openwall.com","authorUrl":"http:\\/\\/www.openwall.com\\/phpass\\/","version":"0.3","description":"LIB_PHPASS_XML_DESCRIPTION","group":"","filename":"phpass"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(200, 0, 'mod_articles_archive', 'module', 'mod_articles_archive', '', 0, 1, 1, 0, '{"name":"mod_articles_archive","type":"module","creationDate":"July 2006","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2017 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_ARTICLES_ARCHIVE_XML_DESCRIPTION","group":"","filename":"mod_articles_archive"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(201, 0, 'mod_articles_latest', 'module', 'mod_articles_latest', '', 0, 1, 1, 0, '{"name":"mod_articles_latest","type":"module","creationDate":"July 2004","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2017 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_LATEST_NEWS_XML_DESCRIPTION","group":"","filename":"mod_articles_latest"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(202, 0, 'mod_articles_popular', 'module', 'mod_articles_popular', '', 0, 1, 1, 0, '{"name":"mod_articles_popular","type":"module","creationDate":"July 2006","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2017 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_POPULAR_XML_DESCRIPTION","group":"","filename":"mod_articles_popular"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(203, 0, 'mod_banners', 'module', 'mod_banners', '', 0, 1, 1, 0, '{"name":"mod_banners","type":"module","creationDate":"July 2006","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2017 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_BANNERS_XML_DESCRIPTION","group":"","filename":"mod_banners"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(204, 0, 'mod_breadcrumbs', 'module', 'mod_breadcrumbs', '', 0, 1, 1, 1, '{"name":"mod_breadcrumbs","type":"module","creationDate":"July 2006","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2017 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_BREADCRUMBS_XML_DESCRIPTION","group":"","filename":"mod_breadcrumbs"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(205, 0, 'mod_custom', 'module', 'mod_custom', '', 0, 1, 1, 1, '{"name":"mod_custom","type":"module","creationDate":"July 2004","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2017 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_CUSTOM_XML_DESCRIPTION","group":"","filename":"mod_custom"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(206, 0, 'mod_feed', 'module', 'mod_feed', '', 0, 1, 1, 0, '{"name":"mod_feed","type":"module","creationDate":"July 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2017 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_FEED_XML_DESCRIPTION","group":"","filename":"mod_feed"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(207, 0, 'mod_footer', 'module', 'mod_footer', '', 0, 1, 1, 0, '{"name":"mod_footer","type":"module","creationDate":"July 2006","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2017 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_FOOTER_XML_DESCRIPTION","group":"","filename":"mod_footer"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(208, 0, 'mod_login', 'module', 'mod_login', '', 0, 1, 1, 1, '{"name":"mod_login","type":"module","creationDate":"July 2006","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2017 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_LOGIN_XML_DESCRIPTION","group":"","filename":"mod_login"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(209, 0, 'mod_menu', 'module', 'mod_menu', '', 0, 1, 1, 1, '{"name":"mod_menu","type":"module","creationDate":"July 2004","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2017 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_MENU_XML_DESCRIPTION","group":"","filename":"mod_menu"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(210, 0, 'mod_articles_news', 'module', 'mod_articles_news', '', 0, 1, 1, 0, '{"name":"mod_articles_news","type":"module","creationDate":"July 2006","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2017 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_ARTICLES_NEWS_XML_DESCRIPTION","group":"","filename":"mod_articles_news"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(211, 0, 'mod_random_image', 'module', 'mod_random_image', '', 0, 1, 1, 0, '{"name":"mod_random_image","type":"module","creationDate":"July 2006","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2017 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_RANDOM_IMAGE_XML_DESCRIPTION","group":"","filename":"mod_random_image"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(212, 0, 'mod_related_items', 'module', 'mod_related_items', '', 0, 1, 1, 0, '{"name":"mod_related_items","type":"module","creationDate":"July 2004","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2017 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_RELATED_XML_DESCRIPTION","group":"","filename":"mod_related_items"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(213, 0, 'mod_search', 'module', 'mod_search', '', 0, 1, 1, 0, '{"name":"mod_search","type":"module","creationDate":"July 2004","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2017 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_SEARCH_XML_DESCRIPTION","group":"","filename":"mod_search"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(214, 0, 'mod_stats', 'module', 'mod_stats', '', 0, 1, 1, 0, '{"name":"mod_stats","type":"module","creationDate":"July 2004","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2017 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_STATS_XML_DESCRIPTION","group":"","filename":"mod_stats"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(215, 0, 'mod_syndicate', 'module', 'mod_syndicate', '', 0, 1, 1, 1, '{"name":"mod_syndicate","type":"module","creationDate":"May 2006","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2017 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_SYNDICATE_XML_DESCRIPTION","group":"","filename":"mod_syndicate"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(216, 0, 'mod_users_latest', 'module', 'mod_users_latest', '', 0, 1, 1, 0, '{"name":"mod_users_latest","type":"module","creationDate":"December 2009","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2017 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_USERS_LATEST_XML_DESCRIPTION","group":"","filename":"mod_users_latest"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(218, 0, 'mod_whosonline', 'module', 'mod_whosonline', '', 0, 1, 1, 0, '{"name":"mod_whosonline","type":"module","creationDate":"July 2004","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2017 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_WHOSONLINE_XML_DESCRIPTION","group":"","filename":"mod_whosonline"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(219, 0, 'mod_wrapper', 'module', 'mod_wrapper', '', 0, 1, 1, 0, '{"name":"mod_wrapper","type":"module","creationDate":"October 2004","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2017 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_WRAPPER_XML_DESCRIPTION","group":"","filename":"mod_wrapper"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(220, 0, 'mod_articles_category', 'module', 'mod_articles_category', '', 0, 1, 1, 0, '{"name":"mod_articles_category","type":"module","creationDate":"February 2010","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2017 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_ARTICLES_CATEGORY_XML_DESCRIPTION","group":"","filename":"mod_articles_category"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(221, 0, 'mod_articles_categories', 'module', 'mod_articles_categories', '', 0, 1, 1, 0, '{"name":"mod_articles_categories","type":"module","creationDate":"February 2010","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2017 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_ARTICLES_CATEGORIES_XML_DESCRIPTION","group":"","filename":"mod_articles_categories"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(222, 0, 'mod_languages', 'module', 'mod_languages', '', 0, 1, 1, 1, '{"name":"mod_languages","type":"module","creationDate":"February 2010","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2017 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.5.0","description":"MOD_LANGUAGES_XML_DESCRIPTION","group":"","filename":"mod_languages"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(223, 0, 'mod_finder', 'module', 'mod_finder', '', 0, 1, 0, 0, '{"name":"mod_finder","type":"module","creationDate":"August 2011","author":"Joomla! Project","copyright":"(C) 2005 - 2016 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_FINDER_XML_DESCRIPTION","group":"","filename":"mod_finder"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(300, 0, 'mod_custom', 'module', 'mod_custom', '', 1, 1, 1, 1, '{"name":"mod_custom","type":"module","creationDate":"July 2004","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2017 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_CUSTOM_XML_DESCRIPTION","group":"","filename":"mod_custom"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(301, 0, 'mod_feed', 'module', 'mod_feed', '', 1, 1, 1, 0, '{"name":"mod_feed","type":"module","creationDate":"July 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2017 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_FEED_XML_DESCRIPTION","group":"","filename":"mod_feed"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(302, 0, 'mod_latest', 'module', 'mod_latest', '', 1, 1, 1, 0, '{"name":"mod_latest","type":"module","creationDate":"July 2004","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2017 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_LATEST_XML_DESCRIPTION","group":"","filename":"mod_latest"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(303, 0, 'mod_logged', 'module', 'mod_logged', '', 1, 1, 1, 0, '{"name":"mod_logged","type":"module","creationDate":"January 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2017 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_LOGGED_XML_DESCRIPTION","group":"","filename":"mod_logged"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(304, 0, 'mod_login', 'module', 'mod_login', '', 1, 1, 1, 1, '{"name":"mod_login","type":"module","creationDate":"March 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2017 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_LOGIN_XML_DESCRIPTION","group":"","filename":"mod_login"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(305, 0, 'mod_menu', 'module', 'mod_menu', '', 1, 1, 1, 0, '{"name":"mod_menu","type":"module","creationDate":"March 2006","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2017 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_MENU_XML_DESCRIPTION","group":"","filename":"mod_menu"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(307, 0, 'mod_popular', 'module', 'mod_popular', '', 1, 1, 1, 0, '{"name":"mod_popular","type":"module","creationDate":"July 2004","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2017 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_POPULAR_XML_DESCRIPTION","group":"","filename":"mod_popular"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(308, 0, 'mod_quickicon', 'module', 'mod_quickicon', '', 1, 1, 1, 1, '{"name":"mod_quickicon","type":"module","creationDate":"Nov 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2017 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_QUICKICON_XML_DESCRIPTION","group":"","filename":"mod_quickicon"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(309, 0, 'mod_status', 'module', 'mod_status', '', 1, 1, 1, 0, '{"name":"mod_status","type":"module","creationDate":"Feb 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2017 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_STATUS_XML_DESCRIPTION","group":"","filename":"mod_status"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(310, 0, 'mod_submenu', 'module', 'mod_submenu', '', 1, 1, 1, 0, '{"name":"mod_submenu","type":"module","creationDate":"Feb 2006","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2017 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_SUBMENU_XML_DESCRIPTION","group":"","filename":"mod_submenu"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(311, 0, 'mod_title', 'module', 'mod_title', '', 1, 1, 1, 0, '{"name":"mod_title","type":"module","creationDate":"Nov 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2017 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_TITLE_XML_DESCRIPTION","group":"","filename":"mod_title"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(312, 0, 'mod_toolbar', 'module', 'mod_toolbar', '', 1, 1, 1, 1, '{"name":"mod_toolbar","type":"module","creationDate":"Nov 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2017 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_TOOLBAR_XML_DESCRIPTION","group":"","filename":"mod_toolbar"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(313, 0, 'mod_multilangstatus', 'module', 'mod_multilangstatus', '', 1, 1, 1, 0, '{"name":"mod_multilangstatus","type":"module","creationDate":"September 2011","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2017 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_MULTILANGSTATUS_XML_DESCRIPTION","group":"","filename":"mod_multilangstatus"}', '{"cache":"0"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(314, 0, 'mod_version', 'module', 'mod_version', '', 1, 1, 1, 0, '{"name":"mod_version","type":"module","creationDate":"January 2012","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_VERSION_XML_DESCRIPTION","group":"","filename":"mod_version"}', '{"format":"short","product":"1","cache":"0"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(315, 0, 'mod_stats_admin', 'module', 'mod_stats_admin', '', 1, 1, 1, 0, '{"name":"mod_stats_admin","type":"module","creationDate":"July 2004","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2017 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_STATS_XML_DESCRIPTION","group":"","filename":"mod_stats_admin"}', '{"serverinfo":"0","siteinfo":"0","counter":"0","increase":"0","cache":"1","cache_time":"900","cachemode":"static"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(316, 0, 'mod_tags_popular', 'module', 'mod_tags_popular', '', 0, 1, 1, 0, '{"name":"mod_tags_popular","type":"module","creationDate":"January 2013","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2017 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.1.0","description":"MOD_TAGS_POPULAR_XML_DESCRIPTION","group":"","filename":"mod_tags_popular"}', '{"maximum":"5","timeframe":"alltime","owncache":"1"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(317, 0, 'mod_tags_similar', 'module', 'mod_tags_similar', '', 0, 1, 1, 0, '{"name":"mod_tags_similar","type":"module","creationDate":"January 2013","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2017 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.1.0","description":"MOD_TAGS_SIMILAR_XML_DESCRIPTION","group":"","filename":"mod_tags_similar"}', '{"maximum":"5","matchtype":"any","owncache":"1"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(400, 0, 'plg_authentication_gmail', 'plugin', 'gmail', 'authentication', 0, 0, 1, 0, '{"name":"plg_authentication_gmail","type":"plugin","creationDate":"February 2006","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2017 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_GMAIL_XML_DESCRIPTION","group":"","filename":"gmail"}', '{"applysuffix":"0","suffix":"","verifypeer":"1","user_blacklist":""}', '', '', 0, '0000-00-00 00:00:00', 1, 0),
(401, 0, 'plg_authentication_joomla', 'plugin', 'joomla', 'authentication', 0, 1, 1, 1, '{"name":"plg_authentication_joomla","type":"plugin","creationDate":"November 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2017 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_AUTH_JOOMLA_XML_DESCRIPTION","group":"","filename":"joomla"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(402, 0, 'plg_authentication_ldap', 'plugin', 'ldap', 'authentication', 0, 0, 1, 0, '{"name":"plg_authentication_ldap","type":"plugin","creationDate":"November 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2017 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_LDAP_XML_DESCRIPTION","group":"","filename":"ldap"}', '{"host":"","port":"389","use_ldapV3":"0","negotiate_tls":"0","no_referrals":"0","auth_method":"bind","base_dn":"","search_string":"","users_dn":"","username":"admin","password":"bobby7","ldap_fullname":"fullName","ldap_email":"mail","ldap_uid":"uid"}', '', '', 0, '0000-00-00 00:00:00', 3, 0),
(403, 0, 'plg_content_contact', 'plugin', 'contact', 'content', 0, 1, 1, 0, '{"name":"plg_content_contact","type":"plugin","creationDate":"January 2014","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2017 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.2.2","description":"PLG_CONTENT_CONTACT_XML_DESCRIPTION","group":"","filename":"contact"}', '', '', '', 0, '0000-00-00 00:00:00', 1, 0),
(404, 0, 'plg_content_emailcloak', 'plugin', 'emailcloak', 'content', 0, 1, 1, 0, '{"name":"plg_content_emailcloak","type":"plugin","creationDate":"November 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2017 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_CONTENT_EMAILCLOAK_XML_DESCRIPTION","group":"","filename":"emailcloak"}', '{"mode":"1"}', '', '', 0, '0000-00-00 00:00:00', 1, 0),
(406, 0, 'plg_content_loadmodule', 'plugin', 'loadmodule', 'content', 0, 1, 1, 0, '{"name":"plg_content_loadmodule","type":"plugin","creationDate":"November 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2017 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_LOADMODULE_XML_DESCRIPTION","group":"","filename":"loadmodule"}', '{"style":"xhtml"}', '', '', 0, '2011-09-18 15:22:50', 0, 0),
(407, 0, 'plg_content_pagebreak', 'plugin', 'pagebreak', 'content', 0, 1, 1, 0, '{"name":"plg_content_pagebreak","type":"plugin","creationDate":"November 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2017 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_CONTENT_PAGEBREAK_XML_DESCRIPTION","group":"","filename":"pagebreak"}', '{"title":"1","multipage_toc":"1","showall":"1"}', '', '', 0, '0000-00-00 00:00:00', 4, 0),
(408, 0, 'plg_content_pagenavigation', 'plugin', 'pagenavigation', 'content', 0, 1, 1, 0, '{"name":"plg_content_pagenavigation","type":"plugin","creationDate":"January 2006","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2017 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_PAGENAVIGATION_XML_DESCRIPTION","group":"","filename":"pagenavigation"}', '{"position":"1"}', '', '', 0, '0000-00-00 00:00:00', 5, 0),
(409, 0, 'plg_content_vote', 'plugin', 'vote', 'content', 0, 1, 1, 0, '{"name":"plg_content_vote","type":"plugin","creationDate":"November 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2017 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_VOTE_XML_DESCRIPTION","group":"","filename":"vote"}', '', '', '', 0, '0000-00-00 00:00:00', 6, 0),
(410, 0, 'plg_editors_codemirror', 'plugin', 'codemirror', 'editors', 0, 1, 1, 1, '{"name":"plg_editors_codemirror","type":"plugin","creationDate":"28 March 2011","author":"Marijn Haverbeke","copyright":"Copyright (C) 2014 - 2017 by Marijn Haverbeke <marijnh@gmail.com> and others","authorEmail":"marijnh@gmail.com","authorUrl":"http:\\/\\/codemirror.net\\/","version":"5.25.2","description":"PLG_CODEMIRROR_XML_DESCRIPTION","group":"","filename":"codemirror"}', '{"lineNumbers":"1","lineWrapping":"1","matchTags":"1","matchBrackets":"1","marker-gutter":"1","autoCloseTags":"1","autoCloseBrackets":"1","autoFocus":"1","theme":"default","tabmode":"indent"}', '', '', 0, '0000-00-00 00:00:00', 1, 0),
(411, 0, 'plg_editors_none', 'plugin', 'none', 'editors', 0, 1, 1, 1, '{"name":"plg_editors_none","type":"plugin","creationDate":"September 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2017 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_NONE_XML_DESCRIPTION","group":"","filename":"none"}', '', '', '', 0, '0000-00-00 00:00:00', 2, 0);
INSERT INTO `#__extensions` (`extension_id`, `package_id`, `name`, `type`, `element`, `folder`, `client_id`, `enabled`, `access`, `protected`, `manifest_cache`, `params`, `custom_data`, `system_data`, `checked_out`, `checked_out_time`, `ordering`, `state`) VALUES
(412, 0, 'plg_editors_tinymce', 'plugin', 'tinymce', 'editors', 0, 1, 1, 0, '{"name":"plg_editors_tinymce","type":"plugin","creationDate":"2005-2017","author":"Ephox Corporation","copyright":"Ephox Corporation","authorEmail":"N\\/A","authorUrl":"http:\\/\\/www.tinymce.com","version":"4.5.7","description":"PLG_TINY_XML_DESCRIPTION","group":"","filename":"tinymce"}', '{"configuration":{"toolbars":{"2":{"toolbar1":["bold","underline","strikethrough","|","undo","redo","|","bullist","numlist","|","pastetext"]},"1":{"menu":["edit","insert","view","format","table","tools"],"toolbar1":["bold","italic","underline","strikethrough","|","alignleft","aligncenter","alignright","alignjustify","|","formatselect","|","bullist","numlist","|","outdent","indent","|","undo","redo","|","link","unlink","anchor","code","|","hr","table","|","subscript","superscript","|","charmap","pastetext","preview"]},"0":{"menu":["edit","insert","view","format","table","tools"],"toolbar1":["bold","italic","underline","strikethrough","|","alignleft","aligncenter","alignright","alignjustify","|","styleselect","|","formatselect","fontselect","fontsizeselect","|","searchreplace","|","bullist","numlist","|","outdent","indent","|","undo","redo","|","link","unlink","anchor","image","|","code","|","forecolor","backcolor","|","fullscreen","|","table","|","subscript","superscript","|","charmap","emoticons","media","hr","ltr","rtl","|","cut","copy","paste","pastetext","|","visualchars","visualblocks","nonbreaking","blockquote","template","|","print","preview","codesample","insertdatetime","removeformat"]}},"setoptions":{"2":{"access":["1"],"skin":"0","skin_admin":"0","mobile":"0","drag_drop":"1","path":"","entity_encoding":"raw","lang_mode":"1","text_direction":"ltr","content_css":"1","content_css_custom":"","relative_urls":"1","newlines":"0","use_config_textfilters":"0","invalid_elements":"script,applet,iframe","valid_elements":"","extended_elements":"","resizing":"1","resize_horizontal":"1","element_path":"1","wordcount":"1","image_advtab":"1","advlist":"1","autosave":"1","contextmenu":"1","custom_plugin":"","custom_button":""},"1":{"access":["6","2"],"skin":"0","skin_admin":"0","mobile":"0","drag_drop":"1","path":"","entity_encoding":"raw","lang_mode":"1","text_direction":"ltr","content_css":"1","content_css_custom":"","relative_urls":"1","newlines":"0","use_config_textfilters":"0","invalid_elements":"script,applet,iframe","valid_elements":"","extended_elements":"","resizing":"1","resize_horizontal":"1","element_path":"1","wordcount":"1","image_advtab":"1","advlist":"1","autosave":"1","contextmenu":"1","custom_plugin":"","custom_button":""},"0":{"access":["7","4","8"],"skin":"0","skin_admin":"0","mobile":"0","drag_drop":"1","path":"","entity_encoding":"raw","lang_mode":"1","text_direction":"ltr","content_css":"1","content_css_custom":"","relative_urls":"1","newlines":"0","use_config_textfilters":"0","invalid_elements":"script,applet,iframe","valid_elements":"","extended_elements":"","resizing":"1","resize_horizontal":"1","element_path":"1","wordcount":"1","image_advtab":"1","advlist":"1","autosave":"1","contextmenu":"1","custom_plugin":"","custom_button":""}}},"sets_amount":3,"html_height":"550","html_width":"750"}', '', '', 0, '0000-00-00 00:00:00', 3, 0),
(413, 0, 'plg_editors-xtd_article', 'plugin', 'article', 'editors-xtd', 0, 1, 1, 0, '{"name":"plg_editors-xtd_article","type":"plugin","creationDate":"October 2009","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2017 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_ARTICLE_XML_DESCRIPTION","group":"","filename":"article"}', '', '', '', 0, '0000-00-00 00:00:00', 1, 0),
(414, 0, 'plg_editors-xtd_image', 'plugin', 'image', 'editors-xtd', 0, 1, 1, 0, '{"name":"plg_editors-xtd_image","type":"plugin","creationDate":"August 2004","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2017 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_IMAGE_XML_DESCRIPTION","group":"","filename":"image"}', '', '', '', 0, '0000-00-00 00:00:00', 2, 0),
(415, 0, 'plg_editors-xtd_pagebreak', 'plugin', 'pagebreak', 'editors-xtd', 0, 1, 1, 0, '{"name":"plg_editors-xtd_pagebreak","type":"plugin","creationDate":"August 2004","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2017 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_EDITORSXTD_PAGEBREAK_XML_DESCRIPTION","group":"","filename":"pagebreak"}', '', '', '', 0, '0000-00-00 00:00:00', 3, 0),
(416, 0, 'plg_editors-xtd_readmore', 'plugin', 'readmore', 'editors-xtd', 0, 1, 1, 0, '{"name":"plg_editors-xtd_readmore","type":"plugin","creationDate":"March 2006","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2017 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_READMORE_XML_DESCRIPTION","group":"","filename":"readmore"}', '', '', '', 0, '0000-00-00 00:00:00', 4, 0),
(417, 0, 'plg_search_categories', 'plugin', 'categories', 'search', 0, 1, 1, 0, '{"name":"plg_search_categories","type":"plugin","creationDate":"November 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2017 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_SEARCH_CATEGORIES_XML_DESCRIPTION","group":"","filename":"categories"}', '{"search_limit":"50","search_content":"1","search_archived":"1"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(418, 0, 'plg_search_contacts', 'plugin', 'contacts', 'search', 0, 1, 1, 0, '{"name":"plg_search_contacts","type":"plugin","creationDate":"November 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2017 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_SEARCH_CONTACTS_XML_DESCRIPTION","group":"","filename":"contacts"}', '{"search_limit":"50","search_content":"1","search_archived":"1"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(419, 0, 'plg_search_content', 'plugin', 'content', 'search', 0, 1, 1, 0, '{"name":"plg_search_content","type":"plugin","creationDate":"November 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2017 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_SEARCH_CONTENT_XML_DESCRIPTION","group":"","filename":"content"}', '{"search_limit":"50","search_content":"1","search_archived":"1"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(420, 0, 'plg_search_newsfeeds', 'plugin', 'newsfeeds', 'search', 0, 1, 1, 0, '{"name":"plg_search_newsfeeds","type":"plugin","creationDate":"November 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2017 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_SEARCH_NEWSFEEDS_XML_DESCRIPTION","group":"","filename":"newsfeeds"}', '{"search_limit":"50","search_content":"1","search_archived":"1"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(422, 0, 'plg_system_languagefilter', 'plugin', 'languagefilter', 'system', 0, 0, 1, 1, '{"name":"plg_system_languagefilter","type":"plugin","creationDate":"July 2010","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2017 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_SYSTEM_LANGUAGEFILTER_XML_DESCRIPTION","group":"","filename":"languagefilter"}', '', '', '', 0, '0000-00-00 00:00:00', 1, 0),
(423, 0, 'plg_system_p3p', 'plugin', 'p3p', 'system', 0, 0, 1, 0, '{"name":"plg_system_p3p","type":"plugin","creationDate":"September 2010","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2017 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_P3P_XML_DESCRIPTION","group":"","filename":"p3p"}', '{"headers":"NOI ADM DEV PSAi COM NAV OUR OTRo STP IND DEM"}', '', '', 0, '0000-00-00 00:00:00', 2, 0),
(424, 0, 'plg_system_cache', 'plugin', 'cache', 'system', 0, 1, 1, 1, '{"name":"plg_system_cache","type":"plugin","creationDate":"February 2007","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2017 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_CACHE_XML_DESCRIPTION","group":"","filename":"cache"}', '{"browsercache":"0","cachetime":"15"}', '', '', 0, '0000-00-00 00:00:00', 9, 0),
(425, 0, 'plg_system_debug', 'plugin', 'debug', 'system', 0, 1, 1, 0, '{"name":"plg_system_debug","type":"plugin","creationDate":"December 2006","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2017 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_DEBUG_XML_DESCRIPTION","group":"","filename":"debug"}', '{"profile":"1","queries":"1","memory":"1","language_files":"1","language_strings":"1","strip-first":"1","strip-prefix":"","strip-suffix":""}', '', '', 0, '0000-00-00 00:00:00', 4, 0),
(426, 0, 'plg_system_log', 'plugin', 'log', 'system', 0, 1, 1, 1, '{"name":"plg_system_log","type":"plugin","creationDate":"April 2007","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2017 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_LOG_XML_DESCRIPTION","group":"","filename":"log"}', '', '', '', 0, '0000-00-00 00:00:00', 5, 0),
(427, 0, 'plg_system_redirect', 'plugin', 'redirect', 'system', 0, 0, 1, 1, '{"name":"plg_system_redirect","type":"plugin","creationDate":"April 2009","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2017 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_SYSTEM_REDIRECT_XML_DESCRIPTION","group":"","filename":"redirect"}', '', '', '', 0, '0000-00-00 00:00:00', 6, 0),
(428, 0, 'plg_system_remember', 'plugin', 'remember', 'system', 0, 1, 1, 1, '{"name":"plg_system_remember","type":"plugin","creationDate":"April 2007","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2017 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_REMEMBER_XML_DESCRIPTION","group":"","filename":"remember"}', '', '', '', 0, '0000-00-00 00:00:00', 7, 0),
(429, 0, 'plg_system_sef', 'plugin', 'sef', 'system', 0, 1, 1, 0, '{"name":"plg_system_sef","type":"plugin","creationDate":"December 2007","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2017 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_SEF_XML_DESCRIPTION","group":"","filename":"sef"}', '', '', '', 0, '0000-00-00 00:00:00', 8, 0),
(430, 0, 'plg_system_logout', 'plugin', 'logout', 'system', 0, 1, 1, 1, '{"name":"plg_system_logout","type":"plugin","creationDate":"April 2009","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2017 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_SYSTEM_LOGOUT_XML_DESCRIPTION","group":"","filename":"logout"}', '', '', '', 0, '0000-00-00 00:00:00', 3, 0),
(431, 0, 'plg_user_contactcreator', 'plugin', 'contactcreator', 'user', 0, 0, 1, 0, '{"name":"plg_user_contactcreator","type":"plugin","creationDate":"August 2009","author":"Joomla! Project","copyright":"(C) 2005 - 2017 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_CONTACTCREATOR_XML_DESCRIPTION","group":"","filename":"contactcreator"}', '{"autowebpage":"","category":"34","autopublish":"0"}', '', '', 0, '0000-00-00 00:00:00', 1, 0),
(432, 0, 'plg_user_joomla', 'plugin', 'joomla', 'user', 0, 1, 1, 0, '{"name":"plg_user_joomla","type":"plugin","creationDate":"December 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2017 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_USER_JOOMLA_XML_DESCRIPTION","group":"","filename":"joomla"}', '{"autoregister":"1","mail_to_user":"1","forceLogout":"1"}', '', '', 0, '0000-00-00 00:00:00', 2, 0),
(433, 0, 'plg_user_profile', 'plugin', 'profile', 'user', 0, 0, 1, 0, '{"name":"plg_user_profile","type":"plugin","creationDate":"January 2008","author":"Joomla! Project","copyright":"(C) 2005 - 2017 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_USER_PROFILE_XML_DESCRIPTION","group":"","filename":"profile"}', '{"register-require_address1":"1","register-require_address2":"1","register-require_city":"1","register-require_region":"1","register-require_country":"1","register-require_postal_code":"1","register-require_phone":"1","register-require_website":"1","register-require_favoritebook":"1","register-require_aboutme":"1","register-require_tos":"1","register-require_dob":"1","profile-require_address1":"1","profile-require_address2":"1","profile-require_city":"1","profile-require_region":"1","profile-require_country":"1","profile-require_postal_code":"1","profile-require_phone":"1","profile-require_website":"1","profile-require_favoritebook":"1","profile-require_aboutme":"1","profile-require_tos":"1","profile-require_dob":"1"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(434, 0, 'plg_extension_joomla', 'plugin', 'joomla', 'extension', 0, 1, 1, 1, '{"name":"plg_extension_joomla","type":"plugin","creationDate":"May 2010","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2017 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_EXTENSION_JOOMLA_XML_DESCRIPTION","group":"","filename":"joomla"}', '', '', '', 0, '0000-00-00 00:00:00', 1, 0),
(435, 0, 'plg_content_joomla', 'plugin', 'joomla', 'content', 0, 1, 1, 0, '{"name":"plg_content_joomla","type":"plugin","creationDate":"November 2010","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2017 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_CONTENT_JOOMLA_XML_DESCRIPTION","group":"","filename":"joomla"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(436, 0, 'plg_system_languagecode', 'plugin', 'languagecode', 'system', 0, 0, 1, 0, '{"name":"plg_system_languagecode","type":"plugin","creationDate":"November 2011","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2017 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_SYSTEM_LANGUAGECODE_XML_DESCRIPTION","group":"","filename":"languagecode"}', '', '', '', 0, '0000-00-00 00:00:00', 10, 0),
(437, 0, 'plg_quickicon_joomlaupdate', 'plugin', 'joomlaupdate', 'quickicon', 0, 1, 1, 1, '{"name":"plg_quickicon_joomlaupdate","type":"plugin","creationDate":"August 2011","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2017 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_QUICKICON_JOOMLAUPDATE_XML_DESCRIPTION","group":"","filename":"joomlaupdate"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(438, 0, 'plg_quickicon_extensionupdate', 'plugin', 'extensionupdate', 'quickicon', 0, 1, 1, 1, '{"name":"plg_quickicon_extensionupdate","type":"plugin","creationDate":"August 2011","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2017 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_QUICKICON_EXTENSIONUPDATE_XML_DESCRIPTION","group":"","filename":"extensionupdate"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(439, 0, 'plg_captcha_recaptcha', 'plugin', 'recaptcha', 'captcha', 0, 1, 1, 0, '{"name":"plg_captcha_recaptcha","type":"plugin","creationDate":"December 2011","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2017 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.4.0","description":"PLG_CAPTCHA_RECAPTCHA_XML_DESCRIPTION","group":"","filename":"recaptcha"}', '{"version":"2.0","public_key":"6LfOvwITAAAAAK24rzNMsrwo6m-nAVVf4Rdqr-FH","private_key":"6LfOvwITAAAAADQj3vVK4uhW1CFVIsHnpRSZ1QnF","theme":"clean","theme2":"light","size":"normal"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(440, 0, 'plg_system_highlight', 'plugin', 'highlight', 'system', 0, 1, 1, 0, '{"name":"plg_system_highlight","type":"plugin","creationDate":"August 2011","author":"Joomla! Project","copyright":"(C) 2005 - 2016 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_SYSTEM_HIGHLIGHT_XML_DESCRIPTION","group":"","filename":"highlight"}', '', '', '', 0, '0000-00-00 00:00:00', 7, 0),
(441, 0, 'plg_content_finder', 'plugin', 'finder', 'content', 0, 0, 1, 0, '{"name":"plg_content_finder","type":"plugin","creationDate":"December 2011","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_CONTENT_FINDER_XML_DESCRIPTION","group":"","filename":"finder"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(442, 0, 'plg_finder_categories', 'plugin', 'categories', 'finder', 0, 1, 1, 0, '{"name":"plg_finder_categories","type":"plugin","creationDate":"August 2011","author":"Joomla! Project","copyright":"(C) 2005 - 2017 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_FINDER_CATEGORIES_XML_DESCRIPTION","group":"","filename":"categories"}', '', '', '', 0, '0000-00-00 00:00:00', 1, 0),
(443, 0, 'plg_finder_contacts', 'plugin', 'contacts', 'finder', 0, 1, 1, 0, '{"name":"plg_finder_contacts","type":"plugin","creationDate":"August 2011","author":"Joomla! Project","copyright":"(C) 2005 - 2017 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_FINDER_CONTACTS_XML_DESCRIPTION","group":"","filename":"contacts"}', '', '', '', 0, '0000-00-00 00:00:00', 2, 0),
(444, 0, 'plg_finder_content', 'plugin', 'content', 'finder', 0, 1, 1, 0, '{"name":"plg_finder_content","type":"plugin","creationDate":"August 2011","author":"Joomla! Project","copyright":"(C) 2005 - 2017 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_FINDER_CONTENT_XML_DESCRIPTION","group":"","filename":"content"}', '', '', '', 0, '0000-00-00 00:00:00', 3, 0),
(445, 0, 'plg_finder_newsfeeds', 'plugin', 'newsfeeds', 'finder', 0, 1, 1, 0, '{"name":"plg_finder_newsfeeds","type":"plugin","creationDate":"August 2011","author":"Joomla! Project","copyright":"(C) 2005 - 2017 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_FINDER_NEWSFEEDS_XML_DESCRIPTION","group":"","filename":"newsfeeds"}', '', '', '', 0, '0000-00-00 00:00:00', 4, 0),
(447, 0, 'plg_finder_tags', 'plugin', 'tags', 'finder', 0, 1, 1, 0, '{"name":"plg_finder_tags","type":"plugin","creationDate":"February 2013","author":"Joomla! Project","copyright":"(C) 2005 - 2017 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_FINDER_TAGS_XML_DESCRIPTION","group":"","filename":"tags"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(448, 0, 'plg_twofactorauth_totp', 'plugin', 'totp', 'twofactorauth', 0, 1, 1, 0, '{"name":"plg_twofactorauth_totp","type":"plugin","creationDate":"August 2013","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2017 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.2.0","description":"PLG_TWOFACTORAUTH_TOTP_XML_DESCRIPTION","group":"","filename":"totp"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(449, 0, 'plg_authentication_cookie', 'plugin', 'cookie', 'authentication', 0, 1, 1, 0, '{"name":"plg_authentication_cookie","type":"plugin","creationDate":"July 2013","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_AUTH_COOKIE_XML_DESCRIPTION","group":"","filename":"cookie"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(450, 0, 'plg_twofactorauth_yubikey', 'plugin', 'yubikey', 'twofactorauth', 0, 1, 1, 0, '{"name":"plg_twofactorauth_yubikey","type":"plugin","creationDate":"September 2013","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2017 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.2.0","description":"PLG_TWOFACTORAUTH_YUBIKEY_XML_DESCRIPTION","group":"","filename":"yubikey"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(451, 0, 'plg_search_tags', 'plugin', 'tags', 'search', 0, 1, 1, 0, '{"name":"plg_search_tags","type":"plugin","creationDate":"March 2014","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2017 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_SEARCH_TAGS_XML_DESCRIPTION","group":"","filename":"tags"}', '{"search_limit":"50","show_tagged_items":"1"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(455, 0, 'plg_installer_packageinstaller', 'plugin', 'packageinstaller', 'installer', 0, 1, 1, 1, '{"name":"plg_installer_packageinstaller","type":"plugin","creationDate":"May 2016","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2017 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.6.0","description":"PLG_INSTALLER_PACKAGEINSTALLER_PLUGIN_XML_DESCRIPTION","group":"","filename":"packageinstaller"}', '', '', '', 0, '0000-00-00 00:00:00', 1, 0),
(456, 0, 'PLG_INSTALLER_FOLDERINSTALLER', 'plugin', 'folderinstaller', 'installer', 0, 1, 1, 1, '{"name":"PLG_INSTALLER_FOLDERINSTALLER","type":"plugin","creationDate":"May 2016","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2017 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.6.0","description":"PLG_INSTALLER_FOLDERINSTALLER_PLUGIN_XML_DESCRIPTION","group":"","filename":"folderinstaller"}', '', '', '', 0, '0000-00-00 00:00:00', 2, 0),
(457, 0, 'PLG_INSTALLER_URLINSTALLER', 'plugin', 'urlinstaller', 'installer', 0, 1, 1, 1, '{"name":"PLG_INSTALLER_URLINSTALLER","type":"plugin","creationDate":"May 2016","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2017 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.6.0","description":"PLG_INSTALLER_URLINSTALLER_PLUGIN_XML_DESCRIPTION","group":"","filename":"urlinstaller"}', '', '', '', 0, '0000-00-00 00:00:00', 3, 0),
(458, 0, 'plg_quickicon_phpversioncheck', 'plugin', 'phpversioncheck', 'quickicon', 0, 1, 1, 1, '{"name":"plg_quickicon_phpversioncheck","type":"plugin","creationDate":"August 2016","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2017 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.7.0","description":"PLG_QUICKICON_PHPVERSIONCHECK_XML_DESCRIPTION","group":"","filename":"phpversioncheck"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(459, 0, 'plg_editors-xtd_menu', 'plugin', 'menu', 'editors-xtd', 0, 1, 1, 0, '{"name":"plg_editors-xtd_menu","type":"plugin","creationDate":"August 2016","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2017 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.7.0","description":"PLG_EDITORS-XTD_MENU_XML_DESCRIPTION","group":"","filename":"menu"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(460, 0, 'plg_editors-xtd_contact', 'plugin', 'contact', 'editors-xtd', 0, 1, 1, 0, '{"name":"plg_editors-xtd_contact","type":"plugin","creationDate":"October 2016","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2017 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.7.0","description":"PLG_EDITORS-XTD_CONTACT_XML_DESCRIPTION","group":"","filename":"contact"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(461, 0, 'plg_system_fields', 'plugin', 'fields', 'system', 0, 1, 1, 0, '{"name":"plg_system_fields","type":"plugin","creationDate":"March 2016","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2017 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.7.0","description":"PLG_SYSTEM_FIELDS_XML_DESCRIPTION","group":"","filename":"fields"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(462, 0, 'plg_fields_calendar', 'plugin', 'calendar', 'fields', 0, 1, 1, 0, '{"name":"plg_fields_calendar","type":"plugin","creationDate":"March 2016","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2017 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.7.0","description":"PLG_FIELDS_CALENDAR_XML_DESCRIPTION","group":"","filename":"calendar"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(463, 0, 'plg_fields_checkboxes', 'plugin', 'checkboxes', 'fields', 0, 1, 1, 0, '{"name":"plg_fields_checkboxes","type":"plugin","creationDate":"March 2016","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2017 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.7.0","description":"PLG_FIELDS_CHECKBOXES_XML_DESCRIPTION","group":"","filename":"checkboxes"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(464, 0, 'plg_fields_color', 'plugin', 'color', 'fields', 0, 1, 1, 0, '{"name":"plg_fields_color","type":"plugin","creationDate":"March 2016","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2017 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.7.0","description":"PLG_FIELDS_COLOR_XML_DESCRIPTION","group":"","filename":"color"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(465, 0, 'plg_fields_editor', 'plugin', 'editor', 'fields', 0, 1, 1, 0, '{"name":"plg_fields_editor","type":"plugin","creationDate":"March 2016","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2017 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.7.0","description":"PLG_FIELDS_EDITOR_XML_DESCRIPTION","group":"","filename":"editor"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(466, 0, 'plg_fields_imagelist', 'plugin', 'imagelist', 'fields', 0, 1, 1, 0, '{"name":"plg_fields_imagelist","type":"plugin","creationDate":"March 2016","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2017 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.7.0","description":"PLG_FIELDS_IMAGELIST_XML_DESCRIPTION","group":"","filename":"imagelist"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(467, 0, 'plg_fields_integer', 'plugin', 'integer', 'fields', 0, 1, 1, 0, '{"name":"plg_fields_integer","type":"plugin","creationDate":"March 2016","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2017 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.7.0","description":"PLG_FIELDS_INTEGER_XML_DESCRIPTION","group":"","filename":"integer"}', '{"multiple":"0","first":"1","last":"100","step":"1"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(468, 0, 'plg_fields_list', 'plugin', 'list', 'fields', 0, 1, 1, 0, '{"name":"plg_fields_list","type":"plugin","creationDate":"March 2016","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2017 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.7.0","description":"PLG_FIELDS_LIST_XML_DESCRIPTION","group":"","filename":"list"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(469, 0, 'plg_fields_media', 'plugin', 'media', 'fields', 0, 1, 1, 0, '{"name":"plg_fields_media","type":"plugin","creationDate":"March 2016","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2017 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.7.0","description":"PLG_FIELDS_MEDIA_XML_DESCRIPTION","group":"","filename":"media"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(470, 0, 'plg_fields_radio', 'plugin', 'radio', 'fields', 0, 1, 1, 0, '{"name":"plg_fields_radio","type":"plugin","creationDate":"March 2016","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2017 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.7.0","description":"PLG_FIELDS_RADIO_XML_DESCRIPTION","group":"","filename":"radio"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(471, 0, 'plg_fields_sql', 'plugin', 'sql', 'fields', 0, 1, 1, 0, '{"name":"plg_fields_sql","type":"plugin","creationDate":"March 2016","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2017 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.7.0","description":"PLG_FIELDS_SQL_XML_DESCRIPTION","group":"","filename":"sql"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(472, 0, 'plg_fields_text', 'plugin', 'text', 'fields', 0, 1, 1, 0, '{"name":"plg_fields_text","type":"plugin","creationDate":"March 2016","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2017 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.7.0","description":"PLG_FIELDS_TEXT_XML_DESCRIPTION","group":"","filename":"text"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(473, 0, 'plg_fields_textarea', 'plugin', 'textarea', 'fields', 0, 1, 1, 0, '{"name":"plg_fields_textarea","type":"plugin","creationDate":"March 2016","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2017 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.7.0","description":"PLG_FIELDS_TEXTAREA_XML_DESCRIPTION","group":"","filename":"textarea"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(474, 0, 'plg_fields_url', 'plugin', 'url', 'fields', 0, 1, 1, 0, '{"name":"plg_fields_url","type":"plugin","creationDate":"March 2016","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2017 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.7.0","description":"PLG_FIELDS_URL_XML_DESCRIPTION","group":"","filename":"url"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(475, 0, 'plg_fields_user', 'plugin', 'user', 'fields', 0, 1, 1, 0, '{"name":"plg_fields_user","type":"plugin","creationDate":"March 2016","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2017 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.7.0","description":"PLG_FIELDS_USER_XML_DESCRIPTION","group":"","filename":"user"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(476, 0, 'plg_fields_usergrouplist', 'plugin', 'usergrouplist', 'fields', 0, 1, 1, 0, '{"name":"plg_fields_usergrouplist","type":"plugin","creationDate":"March 2016","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2017 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.7.0","description":"PLG_FIELDS_USERGROUPLIST_XML_DESCRIPTION","group":"","filename":"usergrouplist"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(477, 0, 'plg_content_fields', 'plugin', 'fields', 'content', 0, 1, 1, 0, '{"name":"plg_content_fields","type":"plugin","creationDate":"February 2017","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2017 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.7.0","description":"PLG_CONTENT_FIELDS_XML_DESCRIPTION","group":"","filename":"fields"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(478, 0, 'plg_editors-xtd_fields', 'plugin', 'fields', 'editors-xtd', 0, 1, 1, 0, '{"name":"plg_editors-xtd_fields","type":"plugin","creationDate":"February 2017","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2017 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.7.0","description":"PLG_EDITORS-XTD_FIELDS_XML_DESCRIPTION","group":"","filename":"fields"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(503, 0, 'beez3', 'template', 'beez3', '', 0, 1, 1, 0, '{"name":"beez3","type":"template","creationDate":"25 November 2009","author":"Angie Radtke","copyright":"Copyright (C) 2005 - 2017 Open Source Matters, Inc. All rights reserved.","authorEmail":"a.radtke@derauftritt.de","authorUrl":"http:\\/\\/www.der-auftritt.de","version":"3.1.0","description":"TPL_BEEZ3_XML_DESCRIPTION","group":"","filename":"templateDetails"}', '{"wrapperSmall":"53","wrapperLarge":"72","sitetitle":"","sitedescription":"","navposition":"center","templatecolor":"nature"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(504, 0, 'hathor', 'template', 'hathor', '', 1, 1, 1, 0, '{"name":"hathor","type":"template","creationDate":"May 2010","author":"Andrea Tarr","copyright":"Copyright (C) 2005 - 2017 Open Source Matters, Inc. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"","version":"3.0.0","description":"TPL_HATHOR_XML_DESCRIPTION","group":"","filename":"templateDetails"}', '{"showSiteName":"0","colourChoice":"0","boldText":"0"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(506, 0, 'protostar', 'template', 'protostar', '', 0, 1, 1, 0, '{"name":"protostar","type":"template","creationDate":"4\\/30\\/2012","author":"Kyle Ledbetter","copyright":"Copyright (C) 2005 - 2017 Open Source Matters, Inc. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"","version":"1.0","description":"TPL_PROTOSTAR_XML_DESCRIPTION","group":"","filename":"templateDetails"}', '{"templateColor":"","logoFile":"","googleFont":"1","googleFontName":"Open+Sans","fluidContainer":"0"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(507, 0, 'isis', 'template', 'isis', '', 1, 1, 1, 0, '{"name":"isis","type":"template","creationDate":"3\\/30\\/2012","author":"Kyle Ledbetter","copyright":"Copyright (C) 2005 - 2017 Open Source Matters, Inc. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"","version":"1.0","description":"TPL_ISIS_XML_DESCRIPTION","group":"","filename":"templateDetails"}', '{"templateColor":"","logoFile":""}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(600, 802, 'English (en-GB)', 'language', 'en-GB', '', 0, 1, 1, 1, '{"name":"English (en-GB)","type":"language","creationDate":"July 2017","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2017 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.7.3","description":"en-GB site language","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(601, 802, 'English (en-GB)', 'language', 'en-GB', '', 1, 1, 1, 1, '{"name":"English (en-GB)","type":"language","creationDate":"July 2017","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2017 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.7.3","description":"en-GB administrator language","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(700, 0, 'files_joomla', 'file', 'joomla', '', 0, 1, 1, 1, '{"name":"files_joomla","type":"file","creationDate":"July 2017","author":"Joomla! Project","copyright":"(C) 2005 - 2017 Open Source Matters. All rights reserved","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.7.3","description":"FILES_JOOMLA_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(802, 0, 'English (en-GB) Language Pack', 'package', 'pkg_en-GB', '', 0, 1, 1, 1, '{"name":"English (en-GB) Language Pack","type":"package","creationDate":"July 2017","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2017 Open Source Matters, Inc. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.7.3.1","description":"en-GB language pack","group":"","filename":"pkg_en-GB"}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10000, 0, 'T3 Framework', 'plugin', 't3', 'system', 0, 1, 1, 0, '{"name":"T3 Framework","type":"plugin","creationDate":"April 08, 2016","author":"JoomlArt.com","copyright":"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.","authorEmail":"info@joomlart.com","authorUrl":"http:\\/\\/www.t3-framework.org","version":"2.5.5","description":"\\n\\t\\n\\t<div align=\\"center\\">\\n\\t\\t<div class=\\"alert alert-success\\" style=\\"background-color:#DFF0D8;border-color:#D6E9C6;color: #468847;padding: 1px 0;\\">\\n\\t\\t\\t\\t<a href=\\"http:\\/\\/t3-framework.org\\/\\"><img src=\\"http:\\/\\/joomlart.s3.amazonaws.com\\/images\\/jat3v3-documents\\/message-installation\\/logo.png\\" alt=\\"some_text\\" width=\\"300\\" height=\\"99\\"><\\/a>\\n\\t\\t\\t\\t<h4><a href=\\"http:\\/\\/t3-framework.org\\/\\" title=\\"\\">Home<\\/a> | <a href=\\"http:\\/\\/demo.t3-framework.org\\/\\" title=\\"\\">Demo<\\/a> | <a href=\\"http:\\/\\/t3-framework.org\\/documentation\\" title=\\"\\">Document<\\/a> | <a href=\\"https:\\/\\/github.com\\/t3framework\\/t3\\/blob\\/master\\/CHANGELOG.md\\" title=\\"\\">Changelog<\\/a><\\/h4>\\n\\t\\t<p> <\\/p>\\n\\t\\t<p>Copyright 2004 - 2016 <a href=\'http:\\/\\/www.joomlart.com\\/\' title=\'Visit Joomlart.com!\'>JoomlArt.com<\\/a>.<\\/p>\\n\\t\\t<\\/div>\\n     <style>table.adminform{width: 100%;}<\\/style>\\n\\t <\\/div>\\n\\t\\t\\n\\t","group":"","filename":"t3"}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10001, 0, 'MOD_JA_ACM', 'module', 'mod_ja_acm', '', 0, 1, 1, 0, '{"name":"MOD_JA_ACM","type":"module","creationDate":"06 April 2016","author":"JoomlArt","copyright":"Copyright \\u00a9 2005 - 2015 JoomlArt.com. All Rights Reserved.","authorEmail":"info@joomlart.com","authorUrl":"www.joomlart.com","version":"2.1.1","description":"\\n\\t\\t\\n\\t\\t<div align=\\"left\\">\\t\\t\\n\\t\\t\\t<div style=\\"background:url(\'http:\\/\\/joomlart.s3.amazonaws.com\\/images\\/userguide\\/ja_templates\\/uber\\/acm-logo.png\') no-repeat top left;padding-left:100px;\\">\\n\\t\\t\\t\\t<h1>JA ACM Module for Joomla 2.5 & 3.5<\\/h1>\\n\\t\\t\\t\\t<div style=\'font-weight: normal\'>\\n\\t\\t\\t\\t\\t<p>JA ACM module (JoomlArt Advanced Custom module) is to help you build content blocks for your Joomla site easily based on pre-made layouts and styles. The content blocks together will build a landing page or a complete site for you. <\\/p>\\n\\t\\t\\t\\t<\\/div>\\n\\t\\t\\t<\\/div>\\n\\t\\t\\t<br \\/>\\n\\t\\t\\t<p>Highlighted features:<\\/p>\\n\\t\\t\\t<div style=\'font-weight: normal\'>\\n\\t\\t\\t\\t<ul>\\n\\t\\t\\t\\t\\t<li style=\\"background:url(\'http:\\/\\/www.joomlart.com\\/templates\\/ja-v4\\/images\\/joomlart\\/icon-checklist.png\') no-repeat left center;padding:10px 0px 10px 20px;\\">12+ block types: At this phase, we round up typical blocks that Uber has to offer. Each block type comes with multiple styles.<\\/li>\\n\\t\\t\\t\\t\\t<li style=\\"background:url(\'http:\\/\\/www.joomlart.com\\/templates\\/ja-v4\\/images\\/joomlart\\/icon-checklist.png\') no-repeat left center;padding:10px 0px 10px 20px;\\">Easy editing & defining your page-specific field sets within each block. Each block has its own LESS file, so you have full control to define your own class and style.<\\/li>\\n\\t\\t\\t\\t\\t<li style=\\"background:url(\'http:\\/\\/www.joomlart.com\\/templates\\/ja-v4\\/images\\/joomlart\\/icon-checklist.png\') no-repeat left center;padding:10px 0px 10px 20px;\\">Content-creator-friendly: completely separate content & design. No longer mixing HTML syntax embedded inside article.<\\/li>\\n\\t\\t\\t\\t\\t<li style=\\"background:url(\'http:\\/\\/www.joomlart.com\\/templates\\/ja-v4\\/images\\/joomlart\\/icon-checklist.png\') no-repeat left center;padding:10px 0px 10px 20px;\\">Allow us to dig deeper into the modular block approach which eases our page management effort.<\\/li>\\n\\t\\t\\t\\t<\\/ul>\\n\\t\\t\\t<\\/div>\\n\\t\\t\\t<br \\/>\\n\\t\\t\\t\\n\\t\\t<\\/div>\\n\\t\\t\\n\\t","group":"","filename":"mod_ja_acm"}', '{"jatools-config":"1","cache":"1","cache_time":"900","cachemode":"itemid"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10003, 0, 'ja_resume', 'template', 'ja_resume', '', 0, 1, 1, 0, '{"name":"ja_resume","type":"template","creationDate":"25 Mar 2015","author":"JoomlArt.com","copyright":"Copyright (C), J.O.O.M Solutions Co., Ltd. All Rights Reserved.","authorEmail":"webmaster@joomlart.com","authorUrl":"http:\\/\\/www.t3-framework.org","version":"2.1.9","description":"\\n\\t\\t\\n\\t\\t<div align=\\"center\\">\\n\\t\\t\\t<div class=\\"alert alert-success\\" style=\\"background-color:#DFF0D8;border-color:#D6E9C6;color: #468847;padding: 1px 0;\\">\\n\\t\\t\\t\\t<a href=\\"http:\\/\\/t3-framework.org\\/\\"><img src=\\"http:\\/\\/joomlart.s3.amazonaws.com\\/images\\/jat3v3-documents\\/message-installation\\/logo.png\\" alt=\\"some_text\\" width=\\"300\\" height=\\"99\\"><\\/a>\\n\\t\\t\\t\\t<h4><a href=\\"http:\\/\\/t3-framework.org\\/\\" title=\\"\\">Home<\\/a> | <a href=\\"http:\\/\\/demo.t3-framework.org\\/\\" title=\\"\\">Demo<\\/a> | <a href=\\"http:\\/\\/t3-framework.org\\/documentation\\" title=\\"\\">Document<\\/a> | <a href=\\"https:\\/\\/github.com\\/t3framework\\/t3\\/blob\\/master\\/CHANGELOG.md\\" title=\\"\\">Changelog<\\/a><\\/h4>\\n\\t\\t\\t\\t<p> <\\/p>\\n\\t\\t\\t\\t<span style=\\"color:#FF0000\\">Note: T3 blank requires T3 plugin to be installed and enabled.<\\/span><p><\\/p>\\n\\t\\t\\t\\t<p>Copyright 2004 - 2014 <a href=\'http:\\/\\/www.joomlart.com\\/\' title=\'Visit Joomlart.com!\'>JoomlArt.com<\\/a>.<\\/p>\\n\\t\\t\\t<\\/div>\\n\\t\\t\\t<style>table.adminform{width: 100%;}<\\/style>\\n\\t\\t<\\/div>\\n\\t\\t\\n\\t","group":"","filename":"templateDetails"}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10005, 0, 'JA Quick Contact', 'module', 'mod_jaquickcontact', '', 0, 1, 1, 0, '{"name":"JA Quick Contact","type":"module","creationDate":"February 2012","author":"JoomlArt.com","copyright":"Copyright (C), J.O.O.M Solutions Co., Ltd. All Rights Reserved.","authorEmail":"webmaster@joomlart.com","authorUrl":"www.joomlart.com","version":"2.5.0","description":"\\n\\t\\n\\t\\t<h1>Introduce<\\/h1>\\n\\t\\t<div style=\'font-weight:normal\'>\\n\\t\\t<p>JA Quick Contact module adds a quick contact form right on your home page.<\\/p>\\n\\t\\t\\n\\t\\t<p><span style=\'color: #ff6600;\'><strong>Features:<\\/strong><\\/span><\\/p><img border=\'0\' alt=\'JA Highslide plugin\' src=\'http:\\/\\/asset.joomlart.com\\/images\\/stories\\/extensions\\/joomla\\/jaec_ja_quickcontact_mod.png?javer=1109270933\' style=\'float: left\'>\\n\\t\\t<p>Add a quick contact form right on your home page. It is compact and sleek. Worried of spams? Don\'t be, install Multiple Captcha Engine (free) and say bye to spammers.<\\/p>\\n\\t\\t<p><strong><span style=\'color: #ff0000;\'>Important Instructions:<\\/span><\\/strong><\\/p>\\n\\t\\t<p>\\n\\t\\tSupport ajax method<p><strong><span style=\'color: #ff0000;\'>Usage Instructions:<\\/span><br \\/><\\/strong><\\/p>Use simple and it is a compact and sleek<\\/p>\\n\\t\\t<p><strong><span style=\'color: #ff0000;\'>Upgrade Methods:<\\/span><br \\/><\\/strong><\\/p>\\n\\t\\t<ol><li>Standard joomla uninstall \\/ reinstall method. Module supports upgrade method. <\\/li><li>You can install new version directly over this version. Uninstallation is not required. <\\/li><li>Backup any customized file before upgrading, your settings would be saved though.<\\/li><\\/ol>\\n\\t\\t<br\\/>\\n\\t\\t<p><span style=\'color: #008000;\'><strong>Links:<\\/strong><\\/span><\\/p><ul><li><a target=\'_blank\' href=\'http:\\/\\/update.joomlart.com\\/#products.list\\/component\\/JA%20Quick%20contact%20module%20for%20joomla%201.5\\/\'>Updates &amp; Versions<\\/a><\\/li><\\/ul><p>Copyright 2004 - 2011 <a href=\'http:\\/\\/www.joomlart.com\\/\' title=\'Visit Joomlart.com!\'>JoomlArt.com<\\/a>.<\\/p>\\n\\t\\t<\\/div>\\n\\t\\n\\t","group":"","filename":"mod_jaquickcontact"}', '{"sender_label":"Username","email_label":"Email","subject_label":"Subject","message_label":"Message","recipient":"","subject":"","thank_msg":"Thank you!","intro_text":"Contact us","show_email_copy":"0","max_chars":"1000","redirect_url":"index.php","use_ajax":"0","class_suffix":"","cache":"1","cache_time":"900"}', '', '', 0, '0000-00-00 00:00:00', 0, 0);
INSERT INTO `#__extensions` (`extension_id`, `package_id`, `name`, `type`, `element`, `folder`, `client_id`, `enabled`, `access`, `protected`, `manifest_cache`, `params`, `custom_data`, `system_data`, `checked_out`, `checked_out_time`, `ordering`, `state`) VALUES
(10038, 0, 'JA System Social Feed plugin', 'plugin', 'jasocial_feed', 'system', 0, 1, 1, 0, '{"name":"JA System Social Feed plugin","type":"plugin","creationDate":"July 2015","author":"JoomlArt","copyright":"Copyright (C), J.O.O.M Solutions Co., Ltd. All Rights Reserved.","authorEmail":"webmaster@joomlart.com","authorUrl":"http:\\/\\/www.joomlart.com","version":"1.2.5","description":"\\n\\t \\n\\t\\t<div style=\'text-align: left;\'>\\n\\t\\t\\t<span style=\\"color: #008000;\\"><strong>JA Social Feed Plug-in for Joomla 2.5 and Joomla 3.x<\\/strong><\\/span><br \\/>\\n\\t\\t\\t<p><img alt=\\"JA Social Feed plugin\\" src=\\"http:\\/\\/www.joomlart.com\\/images\\/stories\\/extensions\\/joomla\\/ja_social.png\\" \\/><\\/p>\\n\\t\\t\\t<div style=\'font-weight:normal\'>\\n\\t\\t\\t<p style=\\"border:1px solid #F29A3C; padding: 10px 15px; background:#F7E6D4;\\">\\n\\t\\t\\t<strong><span style=\'color: #ff0000;\'>NOTE: update OAuth information to get new version worked!<\\/span><\\/strong><br \\/><br \\/>\\n\\t\\t\\tSince 2013-06-11, Twitter has stopped supporting API v1 and fully moved to API v1.1<br \\/>In API v1.1, Twitter deny non-Authorized request, that means you need to provide the information below to authorize your request.<br \\/>\\n\\t\\t\\t<a target=\\"_blank\\" href=\\"http:\\/\\/www.joomlart.com\\/forums\\/showthread.php?50154-Joomla-1.6-JA-Twitter-Module-Installation-Guide\\">Check how to get OAuth information now<\\/a>\\n\\t\\t\\t<\\/p>\\n\\t\\t\\t<p>The JA Social Feed Plug-in imports content automatically from popular Social media sites (Facebook, Twitter and Youtube) and adds to the Joomla or K2 category as articles.\\n\\t\\t\\t<p>The Plug-in has been developed for JA Wall Bundle. Please read the Tooltips for each function to understand the usages.<\\/p>\\n\\t\\t\\t<p style=\\"clear:both\\"><span style=\\"color: #ff6600;\\"><strong>Features:<\\/strong><\\/span><\\/p>\\n\\t\\t\\t<ol><li>Imports content automatically from Facebook, Twitter, Youtube<\\/li>\\n\\t\\t\\t<li>Support multiple profiles for each social feed.<\\/li>\\n\\t\\t\\t<li>Store the imported items as Joomla or K2 articles.<\\/li><\\/ol>\\n\\t\\t\\t\\n\\t\\t\\t<p><strong><span style=\\"color: #ff0000;\\">Upgrade Methods:<\\/span><br \\/><\\/strong><\\/p>\\n\\t\\t\\t<ol><li>You can install the new version directly over this version. Uninstallation is not required. Backup any customized files before upgrading. OR<\\/li>\\n\\t\\t\\t<li>Use <strong><a href=\\"http:\\/\\/extensions.joomla.org\\/extensions\\/core-enhancements\\/installers\\/12077\\" target=\\"_blank\\">JA Extensions Manager<\\/a><\\/strong> Component for easy upgrades and rollbacks. <strong><a href=\\"http:\\/\\/www.youtube.com\\/user\\/JoomlArt#p\\/c\\/BC9B0C0BFE98657E\\/2\\/mNAuJRmifG8\\" target=\\"_blank\\">Watch Video..<\\/a><\\/strong><\\/li><\\/ol>\\n\\t\\t\\t<p>Copyright 2004 - 2014 <a href=\\"http:\\/\\/www.joomlart.com\\/\\" title=\\"Visit Joomlart.com!\\">JoomlArt.com<\\/a>.<\\/p>\\n\\t\\t\\t<\\/div>\\n\\t\\t<\\/div>\\n\\t \\n\\t","group":"","filename":"jasocial_feed"}', '{"get_url_service":"untiny.com","cache_time":"3600","enable_facebook":"1","enable_twitter":"0","enable_youtube":"1","enable_vimeo":"1","enable_instagram":"1","enable_flickr":"1","enable_pinterest":"1","intro_text":"1","intro_text_limit":"100","fb_app_id":"492651290901312","fb_app_secret":"a8606180c0f6215893f2b8aeadb3d6b1","consumer_key":"e4Ut8yKKsS5n9SSPiIh0vmSBG","consumer_secret":"qjk7arSnRyXFBI6UILd1THOyDc5HkBj846gQMu9TvtqXL0hQrV","oauth_access_token":"23945995-WVs2xAH9UFP3msfWSFgqkwmzzcGyB9V2y0sHLqpfv","oauth_access_token_secret":"g7xF95WbE8eJwmN0IMKHBbPWOpZSS1K2TYK0dxWMgZ7m2","api_key":"AIzaSyAH8KFxmeeBlMgSewYKtPBPXwrfVpe3QJM","facebook_status":"1","facebook_account":"123144964369587","facebook_created_by":"42","facebook_target":"joomla","facebook_joomla_catid":"11","facebook_k2_catid":["0"],"facebook_title_type":"author","facebook_title_length":"50","facebook_title_txt":"Facebook","facebook_sourcetxt":"(Source Facebook)","facebook_update_article":"1","facebook_getimg":"0","facebook_valid_img_width":"360","facebook_valid_img_height":"180","facebook_save_image":"0","facebook_limit_post":"20","twitter_status":"0","twitter_account":"from:joomlart","twitter_created_by":"42","twitter_target":"joomla","twitter_joomla_catid":"12","twitter_k2_catid":["0"],"twitter_fetch_retweet":"0","twitter_title_type":"author","twitter_title_txt":"Twitter","twitter_title_length":"50","twitter_sourcetxt":"(Source Twitter)","twitter_update_article":"1","twitter_getimg":"0","twitter_valid_img_width":"360","twitter_valid_img_height":"180","twitter_save_image":"0","twitter_limit_post":"20","youtube_status":"0","youtube_account_option_select":"username","youtube_account":"joomlart","youtube_account_favorite":"0","youtube_created_by":"42","youtube_target":"joomla","youtube_article_state":"0","youtube_joomla_catid":"2","youtube_k2_catid":["0"],"youtube_sourcetxt":"(Source Youtube)","youtube_video_width":"480","youtube_video_height":"360","youtube_show_suggested":"1","youtube_use_https":"0","youtube_privacy_enhanced_mode":"0","youtube_content_embed":"1","youtube_use_old_code":"0","youtube_update_article":"1","youtube_getimg":"0","youtube_save_image":"0","youtube_limit_post":"3","vimeo_status":"1","vimeo_account_type":"group","vimeo_account":"shortfilms","vimeo_created_by":"42","vimeo_target":"joomla","vimeo_article_state":"1","vimeo_joomla_catid":"14","vimeo_k2_catid":["24"],"vimeo_sourcetxt":"(Source Vimeo)","vimeo_video_width":"500","vimeo_video_height":"281","vimeo_autoplay":"0","vimeo_loop":"0","vimeo_content_embed":"1","vimeo_use_old_code":"0","vimeo_update_article":"1","vimeo_getimg":"0","vimeo_save_image":"0","vimeo_limit_post":"3","instagram_status":"1","instagram_account":"@joomlart","instagram_created_by":"42","instagram_target":"joomla","instagram_joomla_catid":"13","instagram_k2_catid":["4"],"instagram_sourcetxt":"(Source Instagram)","instagram_update_article":"1","instagram_save_image":"0","instagram_limit_post":"20","flickr_status":"1","flickr_account_type":"id","flickr_account":"58736703@N00","flickr_account_id_album":"","flickr_created_by":"42","flickr_target":"joomla","flickr_joomla_catid":"15","flickr_k2_catid":["0"],"flickr_sourcetxt":"(Source Flickr)","flickr_update_article":"1","flickr_save_image":"0","flickr_limit_post":"20","pinterest_status":"1","pinterest_account":"joomlart","pinterest_board":"joomla-30-responsive-templates","pinterest_created_by":"42","pinterest_target":"joomla","pinterest_joomla_catid":"16","pinterest_k2_catid":["0"],"pinterest_sourcetxt":"(Source Pinterest)","pinterest_update_article":"1","pinterest_save_image":"0","pinterest_limit_post":"20"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10040, 0, 'JA Google Chart 2', 'module', 'mod_jagooglechart_2', '', 0, 1, 1, 0, '{"name":"JA Google Chart 2","type":"module","creationDate":"Feb 2016","author":"JoomlArt_com","copyright":"Copyright (C), J.O.O.M Solutions Co., Ltd. All Rights Reserved_","authorEmail":"webmaster@joomlart_com","authorUrl":"www.joomlart.com","version":"1.0.2","description":"\\n\\t\\n\\t\\t<div style=\'text-align: left;\'>\\n\\t \\t<p><strong>JA Google Chart<\\/strong> is a free responsive joomla module, compatible with Joomla 2.5 &amp; Joomla 3 used to display your data in google charts: bar chart, pie chart, column chart, line chart, geo chart, area chart. You can customize the display of each chart.<\\/p>\\n\\t\\t<p style=\\"clear:both\\"><span style=\\"color: #ff6600;\\"><strong>Key Features:<\\/strong><\\/span><\\/p>\\n\\t\\t <ul>\\n\\t\\t   \\t<li>Native with Joomla 2.5 and Joomla 3<\\/li>\\n\\t\\t\\t<li>Fully responsive<\\/li>\\n            <li>Support 6 chart types<\\/li>\\n            <li>3 ways to upload data: manual, import and Google Speadsheet CSV url<\\/li>\\n            <li>Configurable Axis: horizontal and vertical<\\/li>\\n            <li>3D view for Pie chart<\\/li>\\n            <li>3 Display modes for GEO Chart<\\/li>\\t\\n\\t\\t <\\/ul>\\t\\n\\t\\t<p><strong><span style=\\"color: #ff0000;\\">Upgrade Method:<\\/span><br \\/><\\/strong><\\/p>\\n\\t\\t<ul>\\n\\t\\t\\t<li>You can install the new version directly over this version. Uninstallation is not required. Backup any customized files before upgrading. OR<\\/li>\\n\\t\\t\\t<li>Use <strong><a href=\\"http:\\/\\/extensions.joomla.org\\/extensions\\/core-enhancements\\/installers\\/12077\\" target=\\"_blank\\">JA Extensions Manager<\\/a><\\/strong> Component for easy upgrades and rollbacks. <strong><a href=\\"http:\\/\\/www.youtube.com\\/user\\/JoomlArt#p\\/c\\/BC9B0C0BFE98657E\\/2\\/mNAuJRmifG8\\" target=\\"_blank\\">Watch Video..<\\/a><\\/strong><\\/li>\\n\\t\\t<\\/ul>\\n\\t\\t<p><span style=\\"color: #008000;\\"><strong>References:<\\/strong><\\/span><\\/p>\\n\\t\\t<ul>\\n\\t\\t\\t<li><a target=\\"_blank\\" href=\\"http:\\/\\/www.joomlart.com\\/documentation\\/joomla-module\\/ja-google-chart\\">Documentation<\\/a><\\/li>\\n\\t\\t\\t<li><a target=\\"_blank\\" href=\\"http:\\/\\/www.joomlart.com\\/forums\\/forumdisplay.php?538-JA-Google-Charts-Module\\">Forum<\\/a><\\/li>\\n\\t\\t\\t<li><a target=\\"_blank\\" href=\\"http:\\/\\/update.joomlart.com\\/\\">Updates &amp; Versions<\\/a><\\/li>\\n\\t\\t<\\/ul>\\n\\t\\t<p>Copyright 2004 - 2014 <a href=\\"http:\\/\\/www.joomlart.com\\/\\" title=\\"Visit Joomlart.com!\\">JoomlArt.com<\\/a>.<\\/p>\\n\\t\\t<\\/div>\\n\\t \\n\\t","group":"","filename":"mod_jagooglechart_2"}', '{"tplhelper":"1","chartType":"AreaChart","chartData":"csv","data_input":"","data_input_url":"","option_series_targetLine":"","chart_colors":"","option_pieHole":"","pie_explode":"0","pie_slices_explode":"","option_is3D":"0","option_reverseCategories":"0","option_pieSliceBorderColor":"#FFFFFF","option_pieSliceText":"percentage","option_pieSliceTextStyle_fontName":"","option_pieSliceTextStyle_fontSize":"9","option_pieSliceTextStyle_color":"#000000","option_width":"100%","option_height":"600","option_chartArea_left":"50","option_chartArea_top":"50","option_chartArea_width":"750","option_chartArea_height":"500","option_backgroundColor_fill":"#ffffff","option_backgroundColor_stroke":"#666666","option_backgroundColor_strokeWidth":"0","option_fontName":"arial","option_lineWidth":"2","option_pointSize":"0","option_hAxis_title":"","option_hAxis_ticks":"","hAxis_titleTextStyle_fontName":"","hAxis_titletextSize_fontSize":"11","option_hAxis_titleTextStyle_color":"#000000","option_hAxis_textPosition":"out","option_hAxis_textStyle_fontName":"","option_hAxis_textStyle_fontSize":"9","hAxis_textStyle_color":"#000000","option_hAxis_direction":"1","option_vAxis_title":"","option_vAxis_ticks":"","option_vAxis_titleTextStyle_fontName":"","option_vAxis_titleTextStyle_fontSize":"11","option_vAxis_titleTextStyle_color":"#000000","option_vAxis_textPosition":"out","option_vAxis_textStyle_fontName":"","option_vAxis_textStyle_size":"9","option_vAxis_textStyle_color":"#000000","option_vAxis_direction":"1","option_title":"","option_titleTextStyle_fontName":"","option_titleTextStyle_fontSize":"9","option_titleTextStyle_color":"#000000","option_legend_position":"right","option_legend_textStyle_fontName":"","option_legend_textStyle_fontSize":"9","option_legend_textStyle_color":"#000000","tooltip_enabled":"1","option_tooltip_textStyle_fontName":"","option_tooltip_textStyle_textSize":"9","option_tooltip_textStyle_color":"#000000","cache":"1","cache_time":"900","cachemode":"static"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10041, 0, 'com_jaextmanager', 'component', 'com_jaextmanager', '', 1, 1, 0, 0, '{"name":"com_jaextmanager","type":"component","creationDate":"Feb 2015","author":"JoomlArt","copyright":"Copyright (C), J.O.O.M Solutions Co., Ltd. All Rights Reserved.","authorEmail":"webmaster@joomlart.com","authorUrl":"http:\\/\\/www.joomlart.com","version":"2.6.0","description":"JA Extension Manager Component","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10042, 0, 'Content - CAPTCHA', 'plugin', 'captcha', 'content', 0, 0, 1, 0, '{"name":"Content - CAPTCHA","type":"plugin","creationDate":"20 Dec 2012","author":"Douglas Machado","copyright":"(C) 2009 ideal.fok.com.br - Brazil","authorEmail":"","authorUrl":"","version":"2.5.3","description":"Provides CAPTCHA support for any component","group":"","filename":"captcha"}', '{"captcha_systems":"mathguard","captcha_systems-recaptcha-PubKey":"","captcha_systems-recaptcha-PriKey":"","captcha_systems-recaptcha-Theme":"red","captcha_systems-recaptcha-Lang":"en","captcha_systems-securImage2-width":"140","captcha_systems-securImage2-height":"60","captcha_systems-securImage2-length":"4","captcha_systems-securImage2-perturbation":"0.7","captcha_systems-securImage2-text_angle_minimum":"0","captcha_systems-securImage2-text_angle_maximum":"0","captcha_systems-securImage2-text_color":"3D3D3D","captcha_systems-securImage2-number_lines":"8","captcha_systems-securImage2-line_color":"7C7C7C","captcha_systems-securImage2-image_signature":"","captcha_systems-securImage2-signature_color":"FFFFFF","captcha_systems-securImage2-bg_color":"FFFFFF"}', '', '', 0, '0000-00-00 00:00:00', 0, 0);

DROP TABLE IF EXISTS `#__fields`;
CREATE TABLE `#__fields` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `asset_id` int(10) unsigned NOT NULL DEFAULT 0,
  `context` varchar(255) NOT NULL DEFAULT '',
  `group_id` int(10) unsigned NOT NULL DEFAULT 0,
  `title` varchar(255) NOT NULL DEFAULT '',
  `name` varchar(255) NOT NULL DEFAULT '',
  `label` varchar(255) NOT NULL DEFAULT '',
  `default_value` text NOT NULL,
  `type` varchar(255) NOT NULL DEFAULT 'text',
  `note` varchar(255) NOT NULL DEFAULT '',
  `description` text NOT NULL,
  `state` tinyint(1) NOT NULL DEFAULT 0,
  `required` tinyint(1) NOT NULL DEFAULT 0,
  `checked_out` int(11) NOT NULL DEFAULT 0,
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ordering` int(11) NOT NULL DEFAULT 0,
  `params` text NOT NULL,
  `fieldparams` text NOT NULL,
  `language` char(7) NOT NULL DEFAULT '',
  `created_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_user_id` int(10) unsigned NOT NULL DEFAULT 0,
  `modified_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(10) unsigned NOT NULL DEFAULT 0,
  `access` int(11) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`),
  KEY `idx_checkout` (`checked_out`),
  KEY `idx_state` (`state`),
  KEY `idx_created_user_id` (`created_user_id`),
  KEY `idx_access` (`access`),
  KEY `idx_context` (`context`(191)),
  KEY `idx_language` (`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `#__fields_categories`;
CREATE TABLE `#__fields_categories` (
  `field_id` int(11) NOT NULL DEFAULT 0,
  `category_id` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`field_id`,`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `#__fields_groups`;
CREATE TABLE `#__fields_groups` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `asset_id` int(10) unsigned NOT NULL DEFAULT 0,
  `context` varchar(255) NOT NULL DEFAULT '',
  `title` varchar(255) NOT NULL DEFAULT '',
  `note` varchar(255) NOT NULL DEFAULT '',
  `description` text NOT NULL,
  `state` tinyint(1) NOT NULL DEFAULT 0,
  `checked_out` int(11) NOT NULL DEFAULT 0,
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ordering` int(11) NOT NULL DEFAULT 0,
  `language` char(7) NOT NULL DEFAULT '',
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(10) unsigned NOT NULL DEFAULT 0,
  `modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(10) unsigned NOT NULL DEFAULT 0,
  `access` int(11) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`),
  KEY `idx_checkout` (`checked_out`),
  KEY `idx_state` (`state`),
  KEY `idx_created_by` (`created_by`),
  KEY `idx_access` (`access`),
  KEY `idx_context` (`context`(191)),
  KEY `idx_language` (`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `#__fields_values`;
CREATE TABLE `#__fields_values` (
  `field_id` int(10) unsigned NOT NULL,
  `item_id` varchar(255) NOT NULL COMMENT 'Allow references to items which have strings as ids, eg. none db systems.',
  `value` text NOT NULL,
  KEY `idx_field_id` (`field_id`),
  KEY `idx_item_id` (`item_id`(191))
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `#__finder_filters`;
CREATE TABLE `#__finder_filters` (
  `filter_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `alias` varchar(255) NOT NULL,
  `state` tinyint(1) NOT NULL DEFAULT 1,
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(10) unsigned NOT NULL,
  `created_by_alias` varchar(255) NOT NULL,
  `modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(10) unsigned NOT NULL DEFAULT 0,
  `checked_out` int(10) unsigned NOT NULL DEFAULT 0,
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `map_count` int(10) unsigned NOT NULL DEFAULT 0,
  `data` text NOT NULL,
  `params` mediumtext DEFAULT NULL,
  PRIMARY KEY (`filter_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `#__finder_links`;
CREATE TABLE `#__finder_links` (
  `link_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `url` varchar(255) NOT NULL,
  `route` varchar(255) NOT NULL,
  `title` varchar(400) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `indexdate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `md5sum` varchar(32) DEFAULT NULL,
  `published` tinyint(1) NOT NULL DEFAULT 1,
  `state` int(5) DEFAULT 1,
  `access` int(5) DEFAULT 0,
  `language` varchar(8) NOT NULL,
  `publish_start_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_end_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `start_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `end_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `list_price` double unsigned NOT NULL DEFAULT 0,
  `sale_price` double unsigned NOT NULL DEFAULT 0,
  `type_id` int(11) NOT NULL,
  `object` mediumblob NOT NULL,
  PRIMARY KEY (`link_id`),
  KEY `idx_type` (`type_id`),
  KEY `idx_title` (`title`(100)),
  KEY `idx_md5` (`md5sum`),
  KEY `idx_url` (`url`(75)),
  KEY `idx_published_list` (`published`,`state`,`access`,`publish_start_date`,`publish_end_date`,`list_price`),
  KEY `idx_published_sale` (`published`,`state`,`access`,`publish_start_date`,`publish_end_date`,`sale_price`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `#__finder_links_terms0`;
CREATE TABLE `#__finder_links_terms0` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `#__finder_links_terms1`;
CREATE TABLE `#__finder_links_terms1` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `#__finder_links_terms2`;
CREATE TABLE `#__finder_links_terms2` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `#__finder_links_terms3`;
CREATE TABLE `#__finder_links_terms3` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `#__finder_links_terms4`;
CREATE TABLE `#__finder_links_terms4` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `#__finder_links_terms5`;
CREATE TABLE `#__finder_links_terms5` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `#__finder_links_terms6`;
CREATE TABLE `#__finder_links_terms6` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `#__finder_links_terms7`;
CREATE TABLE `#__finder_links_terms7` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `#__finder_links_terms8`;
CREATE TABLE `#__finder_links_terms8` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `#__finder_links_terms9`;
CREATE TABLE `#__finder_links_terms9` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `#__finder_links_termsa`;
CREATE TABLE `#__finder_links_termsa` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `#__finder_links_termsb`;
CREATE TABLE `#__finder_links_termsb` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `#__finder_links_termsc`;
CREATE TABLE `#__finder_links_termsc` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `#__finder_links_termsd`;
CREATE TABLE `#__finder_links_termsd` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `#__finder_links_termse`;
CREATE TABLE `#__finder_links_termse` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `#__finder_links_termsf`;
CREATE TABLE `#__finder_links_termsf` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `#__finder_taxonomy`;
CREATE TABLE `#__finder_taxonomy` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(10) unsigned NOT NULL DEFAULT 0,
  `title` varchar(255) NOT NULL,
  `state` tinyint(1) unsigned NOT NULL DEFAULT 1,
  `access` tinyint(1) unsigned NOT NULL DEFAULT 0,
  `ordering` tinyint(1) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `parent_id` (`parent_id`),
  KEY `state` (`state`),
  KEY `ordering` (`ordering`),
  KEY `access` (`access`),
  KEY `idx_parent_published` (`parent_id`,`state`,`access`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `#__finder_taxonomy_map`;
CREATE TABLE `#__finder_taxonomy_map` (
  `link_id` int(10) unsigned NOT NULL,
  `node_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`node_id`),
  KEY `link_id` (`link_id`),
  KEY `node_id` (`node_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `#__finder_terms`;
CREATE TABLE `#__finder_terms` (
  `term_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `term` varchar(75) NOT NULL,
  `stem` varchar(75) NOT NULL,
  `common` tinyint(1) unsigned NOT NULL DEFAULT 0,
  `phrase` tinyint(1) unsigned NOT NULL DEFAULT 0,
  `weight` float unsigned NOT NULL DEFAULT 0,
  `soundex` varchar(75) NOT NULL,
  `links` int(10) NOT NULL DEFAULT 0,
  `language` char(3) NOT NULL DEFAULT '',
  PRIMARY KEY (`term_id`),
  UNIQUE KEY `idx_term` (`term`),
  KEY `idx_term_phrase` (`term`,`phrase`),
  KEY `idx_stem_phrase` (`stem`,`phrase`),
  KEY `idx_soundex_phrase` (`soundex`,`phrase`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `#__finder_terms_common`;
CREATE TABLE `#__finder_terms_common` (
  `term` varchar(75) NOT NULL,
  `language` varchar(3) NOT NULL,
  KEY `idx_word_lang` (`term`,`language`),
  KEY `idx_lang` (`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `#__finder_tokens`;
CREATE TABLE `#__finder_tokens` (
  `term` varchar(75) NOT NULL,
  `stem` varchar(75) NOT NULL,
  `common` tinyint(1) unsigned NOT NULL DEFAULT 0,
  `phrase` tinyint(1) unsigned NOT NULL DEFAULT 0,
  `weight` float unsigned NOT NULL DEFAULT 1,
  `context` tinyint(1) unsigned NOT NULL DEFAULT 2,
  `language` char(3) NOT NULL DEFAULT '',
  KEY `idx_word` (`term`),
  KEY `idx_context` (`context`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `#__finder_tokens_aggregate`;
CREATE TABLE `#__finder_tokens_aggregate` (
  `term_id` int(10) unsigned NOT NULL,
  `map_suffix` char(1) NOT NULL,
  `term` varchar(75) NOT NULL,
  `stem` varchar(75) NOT NULL,
  `common` tinyint(1) unsigned NOT NULL DEFAULT 0,
  `phrase` tinyint(1) unsigned NOT NULL DEFAULT 0,
  `term_weight` float unsigned NOT NULL,
  `context` tinyint(1) unsigned NOT NULL DEFAULT 2,
  `context_weight` float unsigned NOT NULL,
  `total_weight` float unsigned NOT NULL,
  `language` char(3) NOT NULL DEFAULT '',
  KEY `token` (`term`),
  KEY `keyword_id` (`term_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `#__finder_types`;
CREATE TABLE `#__finder_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `mime` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `title` (`title`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `#__jaem_log`;
CREATE TABLE `#__jaem_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ext_id` varchar(50) DEFAULT NULL,
  `service_id` int(11) DEFAULT NULL,
  `check_date` datetime DEFAULT NULL,
  `check_info` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ext_id` (`ext_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `#__jaem_services`;
CREATE TABLE `#__jaem_services` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ws_name` varchar(255) NOT NULL,
  `ws_mode` varchar(50) NOT NULL DEFAULT 'local',
  `ws_uri` varchar(255) NOT NULL,
  `ws_user` varchar(100) NOT NULL,
  `ws_pass` varchar(100) NOT NULL,
  `ws_default` tinyint(1) NOT NULL DEFAULT 0,
  `ws_core` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

INSERT INTO `#__jaem_services` (`id`, `ws_name`, `ws_mode`, `ws_uri`, `ws_user`, `ws_pass`, `ws_default`, `ws_core`) VALUES
(1, 'Local Service', 'local', '', '', '', 1, 1),
(2, 'JoomlArt Updates', 'remote', 'http://update.joomlart.com/service/', '', '', 0, 1);

DROP TABLE IF EXISTS `#__languages`;
CREATE TABLE `#__languages` (
  `lang_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `asset_id` int(10) unsigned NOT NULL DEFAULT 0,
  `lang_code` char(7) binary NOT NULL,
  `title` varchar(50) NOT NULL,
  `title_native` varchar(50) NOT NULL,
  `sef` varchar(50) NOT NULL,
  `image` varchar(50) NOT NULL,
  `description` varchar(512) NOT NULL,
  `metakey` text NOT NULL,
  `metadesc` text NOT NULL,
  `sitename` varchar(1024) NOT NULL DEFAULT '',
  `published` int(11) NOT NULL DEFAULT 0,
  `access` int(10) unsigned NOT NULL DEFAULT 0,
  `ordering` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`lang_id`),
  UNIQUE KEY `idx_sef` (`sef`),
  UNIQUE KEY `idx_langcode` (`lang_code`),
  KEY `idx_access` (`access`),
  KEY `idx_ordering` (`ordering`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

INSERT INTO `#__languages` (`lang_id`, `asset_id`, `lang_code`, `title`, `title_native`, `sef`, `image`, `description`, `metakey`, `metadesc`, `sitename`, `published`, `access`, `ordering`) VALUES
(1, 0, 'en-GB', 'English (UK)', 'English (UK)', 'en', 'en', '', '', '', '', 1, 1, 1);

DROP TABLE IF EXISTS `#__menu`;
CREATE TABLE `#__menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `menutype` varchar(24) NOT NULL COMMENT 'The type of menu this item belongs to. FK to #__menu_types.menutype',
  `title` varchar(255) NOT NULL COMMENT 'The display title of the menu item.',
  `alias` varchar(400) binary NOT NULL COMMENT 'The SEF alias of the menu item.',
  `note` varchar(255) NOT NULL DEFAULT '',
  `path` varchar(1024) NOT NULL COMMENT 'The computed path of the menu item based on the alias field.',
  `link` varchar(1024) NOT NULL COMMENT 'The actually link the menu item refers to.',
  `type` varchar(16) NOT NULL COMMENT 'The type of link: Component, URL, Alias, Separator',
  `published` tinyint(4) NOT NULL DEFAULT 0 COMMENT 'The published state of the menu link.',
  `parent_id` int(10) unsigned NOT NULL DEFAULT 1 COMMENT 'The parent menu item in the menu tree.',
  `level` int(10) unsigned NOT NULL DEFAULT 0 COMMENT 'The relative level in the tree.',
  `component_id` int(10) unsigned NOT NULL DEFAULT 0 COMMENT 'FK to #__extensions.id',
  `checked_out` int(10) unsigned NOT NULL DEFAULT 0 COMMENT 'FK to #__users.id',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'The time the menu item was checked out.',
  `browserNav` tinyint(4) NOT NULL DEFAULT 0 COMMENT 'The click behaviour of the link.',
  `access` int(10) unsigned NOT NULL DEFAULT 0 COMMENT 'The access level required to view the menu item.',
  `img` varchar(255) NOT NULL COMMENT 'The image of the menu item.',
  `template_style_id` int(10) unsigned NOT NULL DEFAULT 0,
  `params` text NOT NULL COMMENT 'JSON encoded data for the menu item.',
  `lft` int(11) NOT NULL DEFAULT 0 COMMENT 'Nested set lft.',
  `rgt` int(11) NOT NULL DEFAULT 0 COMMENT 'Nested set rgt.',
  `home` tinyint(3) unsigned NOT NULL DEFAULT 0 COMMENT 'Indicates if this menu item is the home or default page.',
  `language` char(7) NOT NULL DEFAULT '',
  `client_id` tinyint(4) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_client_id_parent_id_alias_language` (`client_id`,`parent_id`,`alias`(100),`language`),
  KEY `idx_componentid` (`component_id`,`menutype`,`published`,`access`),
  KEY `idx_menutype` (`menutype`),
  KEY `idx_left_right` (`lft`,`rgt`),
  KEY `idx_alias` (`alias`(100)),
  KEY `idx_path` (`path`(100)),
  KEY `idx_language` (`language`)
) ENGINE=InnoDB AUTO_INCREMENT=218 DEFAULT CHARSET=utf8;

INSERT INTO `#__menu` (`id`, `menutype`, `title`, `alias`, `note`, `path`, `link`, `type`, `published`, `parent_id`, `level`, `component_id`, `checked_out`, `checked_out_time`, `browserNav`, `access`, `img`, `template_style_id`, `params`, `lft`, `rgt`, `home`, `language`, `client_id`) VALUES
(2, 'main', 'com_banners', 'Banners', '', 'Banners', 'index.php?option=com_banners', 'component', 1, 1, 1, 4, 0, '0000-00-00 00:00:00', 0, 0, 'class:banners', 0, '', 1, 10, 0, '*', 1),
(17, 'main', 'com_search', 'Basic Search', '', 'Basic Search', 'index.php?option=com_search', 'component', 1, 1, 1, 19, 0, '0000-00-00 00:00:00', 0, 0, 'class:search', 0, '', 57, 58, 0, '*', 1),
(7, 'main', 'com_contact', 'Contacts', '', 'Contacts', 'index.php?option=com_contact', 'component', 1, 1, 1, 8, 0, '0000-00-00 00:00:00', 0, 0, 'class:contact', 0, '', 39, 44, 0, '*', 1),
(19, 'main', 'com_joomlaupdate', 'Joomla! Update', '', 'Joomla! Update', 'index.php?option=com_joomlaupdate', 'component', 1, 1, 1, 28, 0, '0000-00-00 00:00:00', 0, 0, 'class:joomlaupdate', 0, '', 61, 62, 0, '*', 1),
(10, 'main', 'com_messages', 'Messaging', '', 'Messaging', 'index.php?option=com_messages', 'component', 1, 1, 1, 15, 0, '0000-00-00 00:00:00', 0, 0, 'class:messages', 0, '', 45, 48, 0, '*', 1),
(13, 'main', 'com_newsfeeds', 'News Feeds', '', 'News Feeds', 'index.php?option=com_newsfeeds', 'component', 1, 1, 1, 17, 0, '0000-00-00 00:00:00', 0, 0, 'class:newsfeeds', 0, '', 49, 54, 0, '*', 1),
(21, 'main', 'com_postinstall', 'Post-installation messages', '', 'Post-installation messages', 'index.php?option=com_postinstall', 'component', 1, 1, 1, 32, 0, '0000-00-00 00:00:00', 0, 1, 'class:postinstall', 0, '', 65, 66, 0, '*', 1),
(16, 'main', 'com_redirect', 'Redirect', '', 'Redirect', 'index.php?option=com_redirect', 'component', 1, 1, 1, 24, 0, '0000-00-00 00:00:00', 0, 0, 'class:redirect', 0, '', 55, 56, 0, '*', 1),
(18, 'main', 'com_finder', 'Smart Search', '', 'Smart Search', 'index.php?option=com_finder', 'component', 1, 1, 1, 27, 0, '0000-00-00 00:00:00', 0, 0, 'class:finder', 0, '', 59, 60, 0, '*', 1),
(20, 'main', 'com_tags', 'Tags', '', 'Tags', 'index.php?option=com_tags', 'component', 1, 1, 1, 29, 0, '0000-00-00 00:00:00', 0, 1, 'class:tags', 0, '', 63, 64, 0, '', 1),
(159, 'main', 'COM_JAEXTMANAGER', 'com-jaextmanager', '', 'com-jaextmanager', 'index.php?option=com_jaextmanager', 'component', 1, 1, 1, 10041, 0, '0000-00-00 00:00:00', 0, 1, 'components/com_jaextmanager/assets/images/jauc.png', 0, '{}', 121, 122, 0, '', 1),
(217, 'main', 'com_associations', 'multilingual-associations', '', 'multilingual-associations', 'index.php?option=com_associations', 'component', 1, 1, 1, 34, 0, '0000-00-00 00:00:00', 0, 1, 'class:associations', 0, '{}', 223, 224, 0, '*', 1),
(3, 'main', 'com_banners', 'Banners', '', 'Banners/Banners', 'index.php?option=com_banners', 'component', 1, 2, 2, 4, 0, '0000-00-00 00:00:00', 0, 0, 'class:banners', 0, '', 2, 3, 0, '*', 1),
(4, 'main', 'com_banners_categories', 'Categories', '', 'Banners/Categories', 'index.php?option=com_categories&extension=com_banners', 'component', 1, 2, 2, 6, 0, '0000-00-00 00:00:00', 0, 0, 'class:banners-cat', 0, '', 4, 5, 0, '*', 1),
(5, 'main', 'com_banners_clients', 'Clients', '', 'Banners/Clients', 'index.php?option=com_banners&view=clients', 'component', 1, 2, 2, 4, 0, '0000-00-00 00:00:00', 0, 0, 'class:banners-clients', 0, '', 6, 7, 0, '*', 1),
(6, 'main', 'com_banners_tracks', 'Tracks', '', 'Banners/Tracks', 'index.php?option=com_banners&view=tracks', 'component', 1, 2, 2, 4, 0, '0000-00-00 00:00:00', 0, 0, 'class:banners-tracks', 0, '', 8, 9, 0, '*', 1),
(9, 'main', 'com_contact_categories', 'Categories', '', 'Contacts/Categories', 'index.php?option=com_categories&extension=com_contact', 'component', 1, 7, 2, 6, 0, '0000-00-00 00:00:00', 0, 0, 'class:contact-cat', 0, '', 42, 43, 0, '*', 1),
(8, 'main', 'com_contact_contacts', 'Contacts', '', 'Contacts/Contacts', 'index.php?option=com_contact', 'component', 1, 7, 2, 8, 0, '0000-00-00 00:00:00', 0, 0, 'class:contact', 0, '', 40, 41, 0, '*', 1),
(11, 'main', 'com_messages_add', 'New Private Message', '', 'Messaging/New Private Message', 'index.php?option=com_messages&task=message.add', 'component', 1, 10, 2, 15, 0, '0000-00-00 00:00:00', 0, 0, 'class:messages-add', 0, '', 46, 47, 0, '*', 1),
(15, 'main', 'com_newsfeeds_categories', 'Categories', '', 'News Feeds/Categories', 'index.php?option=com_categories&extension=com_newsfeeds', 'component', 1, 13, 2, 6, 0, '0000-00-00 00:00:00', 0, 0, 'class:newsfeeds-cat', 0, '', 52, 53, 0, '*', 1),
(14, 'main', 'com_newsfeeds_feeds', 'Feeds', '', 'News Feeds/Feeds', 'index.php?option=com_newsfeeds', 'component', 1, 13, 2, 17, 0, '0000-00-00 00:00:00', 0, 0, 'class:newsfeeds', 0, '', 50, 51, 0, '*', 1);
INSERT IGNORE INTO `#__menu` (`id`, `menutype`, `title`, `alias`, `note`, `path`, `link`, `type`, `published`, `parent_id`, `level`, `component_id`, `checked_out`, `checked_out_time`, `browserNav`, `access`, `img`, `template_style_id`, `params`, `lft`, `rgt`, `home`, `language`, `client_id`) VALUES
(1, '', 'Menu_Item_Root', 'root', '', '', '', '', 1, 0, 0, 0, 0, '0000-00-00 00:00:00', 0, 0, '', 0, '', 0, 283, 0, '*', 0),
(101, 'mainmenu', 'Home', 'home', '', 'home', 'index.php?option=com_content&view=featured', 'component', 1, 1, 1, 22, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"num_leading_articles":"1","num_intro_articles":"3","num_columns":"3","num_links":"0","orderby_pri":"","orderby_sec":"front","order_date":"","multi_column_order":"1","show_pagination":"2","show_pagination_results":"1","show_noauth":"","article-allow_ratings":"","article-allow_comments":"","show_feed_link":"1","feed_summary":"","show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_readmore":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_hits":"","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","show_page_heading":1,"page_title":"","page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 39, 40, 1, '*', 0);

DROP TABLE IF EXISTS `#__menu_types`;
CREATE TABLE `#__menu_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `asset_id` int(10) unsigned NOT NULL DEFAULT 0,
  `menutype` varchar(24) NOT NULL,
  `title` varchar(48) NOT NULL,
  `description` varchar(255) NOT NULL DEFAULT '',
  `client_id` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_menutype` (`menutype`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

INSERT INTO `#__menu_types` (`id`, `asset_id`, `menutype`, `title`, `description`, `client_id`) VALUES
(1, 0, 'mainmenu', 'Main Menu', 'The main menu for the site', 0),
(2, 0, 'other-menu', 'Other Menu', '', 0),
(3, 0, 'sample-sites', 'Sample Sites', '', 0),
(4, 0, 'frontend-developer', '[FrontEnd Developer]', '', 0),
(5, 0, 'home-yoga', '[Yoga]', '', 0),
(6, 0, 'model', '[Model]', '', 0),
(7, 0, 'singer', '[Singer]', '', 0),
(8, 0, 'blogger', '[Blogger]', '', 0),
(10, 0, 'social-feed', 'Social Feed', '', 0);

DROP TABLE IF EXISTS `#__messages`;
CREATE TABLE `#__messages` (
  `message_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id_from` int(10) unsigned NOT NULL DEFAULT 0,
  `user_id_to` int(10) unsigned NOT NULL DEFAULT 0,
  `folder_id` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `date_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `state` tinyint(1) NOT NULL DEFAULT 0,
  `priority` tinyint(1) unsigned NOT NULL DEFAULT 0,
  `subject` varchar(255) NOT NULL DEFAULT '',
  `message` text NOT NULL,
  PRIMARY KEY (`message_id`),
  KEY `useridto_state` (`user_id_to`,`state`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `#__messages_cfg`;
CREATE TABLE `#__messages_cfg` (
  `user_id` int(10) unsigned NOT NULL DEFAULT 0,
  `cfg_name` varchar(100) NOT NULL DEFAULT '',
  `cfg_value` varchar(255) NOT NULL DEFAULT '',
  UNIQUE KEY `idx_user_var_name` (`user_id`,`cfg_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `#__modules`;
CREATE TABLE `#__modules` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `asset_id` int(10) unsigned NOT NULL DEFAULT 0 COMMENT 'FK to the #__assets table.',
  `title` varchar(100) NOT NULL DEFAULT '',
  `note` varchar(255) NOT NULL DEFAULT '',
  `content` text NOT NULL,
  `ordering` int(11) NOT NULL DEFAULT 0,
  `position` varchar(50) NOT NULL DEFAULT '',
  `checked_out` int(10) unsigned NOT NULL DEFAULT 0,
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_up` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `published` tinyint(1) NOT NULL DEFAULT 0,
  `module` varchar(50) DEFAULT NULL,
  `access` int(10) unsigned NOT NULL DEFAULT 0,
  `showtitle` tinyint(3) unsigned NOT NULL DEFAULT 1,
  `params` text NOT NULL,
  `client_id` tinyint(4) NOT NULL DEFAULT 0,
  `language` char(7) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `published` (`published`,`access`),
  KEY `newsfeeds` (`module`,`published`),
  KEY `idx_language` (`language`)
) ENGINE=InnoDB AUTO_INCREMENT=187 DEFAULT CHARSET=utf8;

INSERT INTO `#__modules` (`id`, `asset_id`, `title`, `note`, `content`, `ordering`, `position`, `checked_out`, `checked_out_time`, `publish_up`, `publish_down`, `published`, `module`, `access`, `showtitle`, `params`, `client_id`, `language`) VALUES
(2, 40, 'Login', '', '', 1, 'login', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_login', 1, 1, '', 1, '*'),
(3, 41, 'Popular Articles', '', '', 3, 'cpanel', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_popular', 3, 1, '{"count":"5","catid":"","user_id":"0","layout":"_:default","moduleclass_sfx":"","cache":"0"}', 1, '*'),
(4, 42, 'Recently Added Articles', '', '', 4, 'cpanel', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_latest', 3, 1, '{"count":"5","ordering":"c_dsc","catid":"","user_id":"0","layout":"_:default","moduleclass_sfx":"","cache":"0"}', 1, '*'),
(8, 43, 'Toolbar', '', '', 1, 'toolbar', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_toolbar', 3, 1, '', 1, '*'),
(9, 44, 'Quick Icons', '', '', 1, 'icon', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_quickicon', 3, 1, '', 1, '*'),
(10, 45, 'Logged-in Users', '', '', 2, 'cpanel', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_logged', 3, 1, '{"count":"5","name":"1","layout":"_:default","moduleclass_sfx":"","cache":"0"}', 1, '*'),
(12, 46, 'Admin Menu', '', '', 1, 'menu', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_menu', 3, 1, '{"layout":"","moduleclass_sfx":"","shownew":"1","showhelp":"1","cache":"0"}', 1, '*'),
(13, 47, 'Admin Submenu', '', '', 1, 'submenu', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_submenu', 3, 1, '', 1, '*'),
(14, 48, 'User Status', '', '', 2, 'status', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_status', 3, 1, '', 1, '*'),
(15, 49, 'Title', '', '', 1, 'title', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_title', 3, 1, '', 1, '*'),
(79, 52, 'Multilanguage status', '', '', 1, 'status', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 'mod_multilangstatus', 3, 1, '{"layout":"_:default","moduleclass_sfx":"","cache":"0"}', 1, '*'),
(86, 53, 'Joomla Version', '', '', 1, 'footer', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_version', 3, 1, '{"format":"short","product":"1","layout":"_:default","moduleclass_sfx":"","cache":"0"}', 1, '*'),
(87, 54, 'Introduction', '', '', 1, 'photographer-mast-top', 42, '2016-05-05 03:23:37', '2017-07-10 10:08:09', '0000-00-00 00:00:00', 1, 'mod_ja_acm', 1, 1, '{"jatools-config":"{\\":type\\":\\"ja_resume:features-intro\\",\\"features-intro\\":{\\"jatools-layout-features-intro\\":\\"style-1\\",\\"FEATURES[animation]\\":[\\"1\\"],\\"FEATURES[effect-blur]\\":[\\"1\\"],\\"FEATURES[acm-style]\\":[\\"style-dark\\"],\\"FEATURES[position-title]\\":[\\"text-left\\"],\\"FEATURES[title]\\":[\\"Hi! I am cavin harris.\\"],\\"FEATURES[title-time]\\":[\\"0\\"],\\"FEATURES[title-speed]\\":[\\"30\\"],\\"FEATURES[position]\\":[\\"Photographer & Art Director\\"],\\"FEATURES[position-time]\\":[\\"1000\\"],\\"FEATURES[position-speed]\\":[\\"30\\"],\\"FEATURES[des]\\":[\\"Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inve veritatis et quasi architecto beatae vitae dicta sunt explicabo. \\"],\\"FEATURES[des-time]\\":[\\"2000\\"],\\"FEATURES[des-speed]\\":[\\"80\\"],\\"FEATURES[horizontal-position]\\":[\\"center\\"],\\"FEATURES[vertical-position]\\":[\\"center\\"],\\"FEATURES[image]\\":[\\"images\\/joomlart\\/introduction\\/photographer.jpg\\"]}}","moduleclass_sfx":"","cache":"1","cache_time":"900","cachemode":"itemid","module_tag":"div","bootstrap_size":"0","header_tag":"h3","header_class":"","style":"0","full-width":"1"}', 0, '*'),
(89, 56, 'Send Me a Message', '', '', 1, 'contact-2', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_jaquickcontact', 1, 1, '{"sender_label":"Full Name","email_label":"Your Email","subject_label":"Subject","message_label":"Your Message","recipient":"","subject":"","thank_msg":"Thank you!","intro_text":"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed dui quam, iaculis sed malesuada sed, porta eget urna. Donec enim purus, laoreet nec sodales non, tincidunt sit amet ante.","show_email_copy":"0","max_chars":1000,"redirect_url":"index.php","use_ajax":"0","class_suffix":"","moduleclass_sfx":"","cache":"1","cache_time":900,"module_tag":"div","bootstrap_size":"0","header_tag":"h3","header_class":"","style":"0","full-width":"0","module-bg":"","module-bg-position":"left top"}', 0, '*'),
(90, 57, 'About Me', '', '', 1, 'photographer-features-intro', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_ja_acm', 1, 1, '{"jatools-config":"{\\":type\\":\\"ja_resume:features-intro\\",\\"features-intro\\":{\\"jatools-layout-features-intro\\":\\"style-2\\",\\"features[title]\\":[\\"biography\\"],\\"features[des]\\":[\\"Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.((\\/p))\\\\n((p)) Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.\\"],\\"features[button-title]\\":[\\"Dowload my cv\\"],\\"features[button-link]\\":[\\"#\\"],\\"features[button-icon]\\":[\\"fa fa-cloud-download\\"],\\"features[data]\\":{\\"features[data][icon-social]\\":[\\"facebook\\",\\"twitter\\",\\"instagram\\",\\"pinterest-p\\"],\\"features[data][title-social]\\":[\\"\\/cavinharris_photographer\\",\\"\\/cavinharris_photographer\\",\\"\\/cavinharris_photographer\\",\\"\\/cavinharris_photographer\\"],\\"features[data][link-social]\\":[\\"#\\",\\"#\\",\\"#\\",\\"#\\"],\\"rows\\":4,\\"cols\\":4,\\"type\\":\\"list\\"}}}","moduleclass_sfx":"","cache":"1","cache_time":"900","cachemode":"itemid","module_tag":"div","bootstrap_size":"0","header_tag":"h3","header_class":"","style":"0","full-width":"0"}', 0, '*'),
(91, 58, 'Timeline', '', '', 2, 'photographer-features-intro', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_ja_acm', 1, 0, '{"jatools-config":"{\\":type\\":\\"ja_resume:timeline\\",\\"timeline\\":{\\"jatools-layout-timeline\\":\\"style-1\\",\\"timeline[acm-title]\\":[\\"EDUCATION\\"],\\"timeline[acm-style]\\":[],\\"timeline[data]\\":{\\"timeline[data][timeline-date]\\":[\\"March 2011 — March 2013 \\",\\"March 2013 — March 2014 \\",\\"March 2014 — March 2015\\",\\"March 2015 — Present \\"],\\"timeline[data][title]\\":[\\"Freelance Photographer\\",\\"Learning art of wedding\\",\\"Art Studio\\",\\"ART SCHOOL\\"],\\"timeline[data][title-link]\\":[\\"#\\",\\"#\\",\\"#\\",\\"#\\"],\\"timeline[data][description]\\":[\\"Meis simul clita at qui, dolores quaerendum usu an. Vim at magna quando, omnis disputationi te his, cum maiorum instructior ne. Nec id aperiri labores, usu ut inimicus reprehendunt, laudem labitur mentitum per ut.\\",\\"Error facilisi periculis ut pro, in eam iriure voluptaria. Id vix habeo quaeque eloquentiam, sonet rationibus cum ea, mea viris recteque dignissim ne. Pro modus argumentum at, nam ne delectus tincidunt.\\",\\"Meis simul clitNec id aperiri labores, usu ut inimicus reprehendunt, laudem labitur mentitum per ut.a at qui, dolores quaerendum usu an. Vim at magna quando, omnis disputationi te his, cum maiorum.\\",\\"Eam id facer labitur consequat, an usu suas volumus referrentur, vim ex alterum interesset Meis simul clita at qui, dolores quaerendum usu an. Vim at magna quando, omnis disputationi te his, cum maiorum.\\"],\\"rows\\":4,\\"cols\\":5,\\"type\\":\\"list\\"}}}","moduleclass_sfx":" title-style-1","cache":"1","cache_time":"900","cachemode":"itemid","module_tag":"div","bootstrap_size":"0","header_tag":"h3","header_class":"","style":"0","full-width":"0","module-bg":"","module-bg-position":"right center"}', 0, '*'),
(92, 59, 'Gallery', '', '', 4, 'photographer-features-intro', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_ja_acm', 1, 1, '{"jatools-config":"{\\":type\\":\\"ja_resume:gallery\\",\\"gallery\\":{\\"jatools-layout-gallery\\":\\"style-1\\",\\"isotope[acm-title]\\":[\\"Latest shots\\"],\\"isotope[gallery-link-title]\\":[\\"view my 500px\\"],\\"isotope[gallery-link]\\":[\\"#\\"],\\"isotope[gallery-link-icon]\\":[\\"fa fa-500px\\"],\\"isotope[colmb]\\":[\\"2\\"],\\"isotope[coltb]\\":[\\"3\\"],\\"isotope[coldt]\\":[\\"4\\"],\\"isotope[gutter]\\":[\\"30\\"],\\"isotope[animation]\\":[\\"\\"],\\"isotope[gallery]\\":{\\"isotope[gallery][selectitem]\\":[\\"2\\",\\"1\\",\\"1\\",\\"1\\",\\"1\\",\\"2\\",\\"2\\",\\"1\\",\\"1\\"],\\"undefined\\":[\\"\\",\\"\\",\\"\\",\\"\\",\\"\\",\\"\\",\\"\\",\\"\\",\\"\\"],\\"isotope[gallery][img]\\":[\\"images\\/joomlart\\/gallery\\/items-1.jpg\\",\\"images\\/joomlart\\/gallery\\/items-2.jpg\\",\\"images\\/joomlart\\/gallery\\/gallery-9.jpg\\",\\"images\\/joomlart\\/gallery\\/gallery-14.png\\",\\"images\\/joomlart\\/gallery\\/gallery-13.jpg\\",\\"images\\/joomlart\\/gallery\\/gallery-11.jpg\\",\\"images\\/joomlart\\/gallery\\/gallery-18.jpg\\",\\"images\\/joomlart\\/gallery\\/gallery-15.jpg\\",\\"images\\/joomlart\\/gallery\\/gallery-16.jpg\\"],\\"isotope[gallery][title]\\":[\\"Lorem ipsum\\",\\"Nullam posuere\\",\\"In venenatis vel\\",\\"Proin erat odio\\",\\"Proin erat odio\\",\\"Sed consectetur\\",\\"Aliquam ornare at\\",\\"Aliquam ornare at\\",\\"Aliquam ornare at\\"],\\"isotope[gallery][desc]\\":[\\"Lorem ipsum dolor sit amet\\",\\"Nullam posuere mauris neque\\",\\"\\",\\"Fringilla ac ligula mollis\\",\\"Fringilla ac ligula mollis\\",\\"\\",\\"\\",\\"\\",\\"\\"],\\"rows\\":9,\\"cols\\":5,\\"type\\":\\"list\\"}}}","moduleclass_sfx":" title-style-2","cache":"1","cache_time":"900","cachemode":"itemid","module_tag":"div","bootstrap_size":"0","header_tag":"h3","header_class":"","style":"0","full-width":"0"}', 0, '*'),
(93, 60, '[Photographer] My Skills', '', '', 3, 'photographer-features-intro', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_ja_acm', 1, 0, '{"jatools-config":"{\\":type\\":\\"ja_resume:spotlight\\",\\"spotlight\\":{\\"jatools-layout-spotlight\\":\\"style-1\\",\\"spotlight[acm-title]\\":[\\"Skills\\"],\\"spotlight[acm-desc]\\":[\\"Ad nibh malis referrentur vel, scaevola percipit nam eu. Meis simul clita at qui, dolores quaerendum usu an. Vim at magna quando, omnis disputationi te his, cum maiorum instructior ne. Nec id aperiri labores, usu ut inimicus reprehendunt, laudem labitur mentitum per ut.\\"],\\"spotlight[data]\\":{\\"spotlight[data][position]\\":[\\"photographer-skill-1\\",\\"photographer-skill-2\\"],\\"spotlight[data][xs]\\":[\\"col-xs-12\\",\\"col-xs-12\\"],\\"undefined\\":[\\"\\",\\"\\",\\"\\",\\"\\",\\"\\",\\"\\",\\"\\",\\"\\"],\\"spotlight[data][sm]\\":[\\"col-sm-12\\",\\"col-sm-12\\"],\\"spotlight[data][md]\\":[\\"col-md-6\\",\\"col-md-6\\"],\\"spotlight[data][lg]\\":[\\"col-lg-6\\",\\"col-lg-6\\"],\\"rows\\":2,\\"cols\\":6,\\"type\\":\\"list\\"}}}","moduleclass_sfx":" title-style-1","cache":"1","cache_time":"900","cachemode":"itemid","module_tag":"div","bootstrap_size":"0","header_tag":"h3","header_class":"","style":"0","full-width":"0"}', 0, '*'),
(94, 61, '[Photographer] My Skill 1', '', '', 1, 'photographer-skill-1', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_ja_acm', 1, 0, '{"jatools-config":"{\\":type\\":\\"ja_resume:statistics\\",\\"statistics\\":{\\"jatools-layout-statistics\\":\\"style-1\\",\\"statistics[block-bg]\\":[\\"\\"],\\"statistics[acm-title]\\":[\\"\\"],\\"statistics[acm-description]\\":[\\"\\"],\\"statistics[acm-style]\\":[\\"style-light\\"],\\"statistics[full-width]\\":[\\"0\\"],\\"statistics[acm-col-offset]\\":[\\"col-lg-offset-0\\"],\\"statistics[data]\\":{\\"statistics[data][stats-count]\\":[\\"70\\",\\"80\\",\\"85\\",\\"90\\"],\\"statistics[data][stats-name]\\":[\\"Photoshop\\",\\"Retouching\\",\\"Lightning\\",\\"Videography\\"],\\"statistics[data][stats-color]\\":[\\"#fc615d\\",\\"#1f5dea\\",\\"#43cb83\\",\\"#1ecde2\\"],\\"rows\\":4,\\"cols\\":4,\\"type\\":\\"list\\"}}}","moduleclass_sfx":"","cache":"1","cache_time":"900","cachemode":"itemid","module_tag":"div","bootstrap_size":"0","header_tag":"h3","header_class":"","style":"0","full-width":"0","module-bg":"","module-bg-position":"left top"}', 0, '*'),
(95, 62, '[Photographer] My Skill 2', '', '', 1, 'photographer-skill-2', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_ja_acm', 1, 0, '{"jatools-config":"{\\":type\\":\\"ja_resume:statistics\\",\\"statistics\\":{\\"jatools-layout-statistics\\":\\"style-2\\",\\"statistics[block-intro]\\":[\\"\\"],\\"statistics[block-extra-class]\\":[\\"\\"],\\"statistics[block-bg]\\":[\\"\\"],\\"statistics[stats-title]\\":[\\"\\"],\\"statistics[stats-description]\\":[\\"\\"],\\"statistics[acm-style]\\":[\\"style-light\\"],\\"statistics[full-width]\\":[\\"1\\"],\\"statistics[stats-column]\\":[\\"2\\"],\\"statistics[data-style-2]\\":{\\"statistics[data-style-2][stats-count]\\":[\\"90\\",\\"100\\",\\"75\\",\\"85\\"],\\"statistics[data-style-2][stats-name]\\":[\\"Potrait\\",\\"Landscape\\",\\"Marco\\",\\"Streetlife\\"],\\"statistics[data-style-2][stats-color]\\":[\\"#fc615d\\",\\"#1ecde2\\",\\"#1f5dea\\",\\"#43cb83\\"],\\"statistics[data-style-2][stats-shadow]\\":[\\"#eff0f4\\",\\"#eff0f4\\",\\"#eff0f4\\",\\"#eff0f4\\"],\\"statistics[data-style-2][stats-bg]\\":[\\"#fff\\",\\"#fff\\",\\"#fff\\",\\"#fff\\"],\\"rows\\":4,\\"cols\\":6,\\"type\\":\\"list\\"}}}","moduleclass_sfx":"","cache":"1","cache_time":"900","cachemode":"itemid","module_tag":"div","bootstrap_size":"0","header_tag":"h3","header_class":"","style":"0"}', 0, '*'),
(96, 63, 'Testimonial', '', '', 5, 'photographer-features-intro', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_ja_acm', 1, 1, '{"jatools-config":"{\\":type\\":\\"ja_resume:testimonials\\",\\"testimonials\\":{\\"jatools-layout-testimonials\\":\\"style-1\\",\\"testimonials[acm-title]\\":[\\"Testimonial\\"],\\"testimonials[author-info-color]\\":[\\"\\"],\\"testimonials[data-special]\\":{\\"testimonials[data-special][testimonial-text]\\":[\\"We are very pleased with your design and programming talents and continue to rely on your good work. Sure we will get back to you as our site evolves going forward. \\",\\"Your staff has been nothing less than professional and respectful. They are super patient and really listened to what I wanted. I would give you the top stars!\\",\\"You\'re the best! You did an amazing and perfect job … We have received many positive feedbacks on our new site since the launch. Great thanks again. \\"],\\"testimonials[data-special][author-name]\\":[\\"James S. \\",\\"Jaquelin A. \\",\\"Kelly B. \\"],\\"testimonials[data-special][author-title]\\":[\\"Creative Director\\",\\"IT Systems Analyst\\",\\"IT Engineer\\"],\\"testimonials[data-special][author-img]\\":[\\"images\\/joomlart\\/testimonial\\/items-1.jpg\\",\\"images\\/joomlart\\/testimonial\\/items-2.jpg\\",\\"images\\/joomlart\\/testimonial\\/items-3.jpg\\"],\\"rows\\":3,\\"cols\\":5,\\"type\\":\\"list\\"}}}","moduleclass_sfx":"title-style-2","cache":"1","cache_time":"900","cachemode":"itemid","module_tag":"div","bootstrap_size":"0","header_tag":"h3","header_class":"","style":"0","full-width":"0","module-bg":"","module-bg-position":"left top"}', 0, '*'),
(98, 65, 'Contact', '', '', 1, 'mast-bottom', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_ja_acm', 1, 1, '{"jatools-config":"{\\":type\\":\\"ja_resume:spotlight\\",\\"spotlight\\":{\\"jatools-layout-spotlight\\":\\"style-1\\",\\"spotlight[acm-title]\\":[\\"\\"],\\"spotlight[acm-desc]\\":[\\"\\"],\\"spotlight[data]\\":{\\"spotlight[data][position]\\":[\\"contact-1\\",\\"contact-2\\"],\\"spotlight[data][xs]\\":[\\"col-xs-12\\",\\"col-xs-12\\"],\\"undefined\\":[\\"\\",\\"\\",\\"\\",\\"\\",\\"\\",\\"\\",\\"\\",\\"\\"],\\"spotlight[data][sm]\\":[\\"col-sm-12\\",\\"col-sm-12\\"],\\"spotlight[data][md]\\":[\\"col-md-6\\",\\"col-md-6\\"],\\"spotlight[data][lg]\\":[\\"col-lg-6\\",\\"col-lg-6\\"],\\"rows\\":2,\\"cols\\":6,\\"type\\":\\"list\\"}}}","moduleclass_sfx":"","cache":"1","cache_time":"900","cachemode":"itemid","module_tag":"div","bootstrap_size":"0","header_tag":"h3","header_class":"","style":"0","full-width":"0"}', 0, '*'),
(99, 66, 'Contact', '', '', 1, 'contact-1', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_ja_acm', 1, 1, '{"jatools-config":"{\\":type\\":\\"ja_resume:contact-info\\",\\"contact-info\\":{\\"jatools-layout-contact-info\\":\\"style-1\\",\\"contact-info[contact-info-item]\\":{\\"contact-info[contact-info-item][contact-info-icon]\\":[\\"\\",\\"\\",\\"\\",\\"\\"],\\"contact-info[contact-info-item][contact-info-name]\\":[\\"Address\\",\\"Phone\\",\\"Mail\\",\\"Web\\"],\\"contact-info[contact-info-item][contact-info-value]\\":[\\"1600 Amphitheatre Parkway, Mountain View, CA, 94043\\",\\"00 1 650-253-0000\\",\\"no-reply@joomlart.com\\",\\"((a href=\\\\\\"https:\\/\\/www.joomlart.com\\\\\\" title=\\\\\\"Joomlart\\\\\\"))www.joomlart.com((\\/a))\\"],\\"rows\\":4,\\"cols\\":4,\\"type\\":\\"list\\"}}}","moduleclass_sfx":"","cache":"1","cache_time":"900","cachemode":"itemid","module_tag":"div","bootstrap_size":"0","header_tag":"h3","header_class":"","style":"0","full-width":"0"}', 0, '*'),
(100, 67, 'Clients', '', '', 19, 'features-intro', 0, '0000-00-00 00:00:00', '2017-07-10 10:08:09', '0000-00-00 00:00:00', -2, 'mod_ja_acm', 1, 1, '{"jatools-config":"{\\":type\\":\\"ja_resume:clients\\",\\"clients\\":{\\"jatools-layout-clients\\":\\"style-1\\",\\"clients[acm-intro]\\":[\\"As seen on\\"],\\"clients[columns]\\":[\\"5\\"],\\"clients[acm-style]\\":[\\"style-light\\"],\\"clients[full-width]\\":[\\"0\\"],\\"clients[img-gray]\\":[\\"0\\"],\\"clients[img-opacity]\\":[\\"40\\"],\\"clients[client-item]\\":{\\"clients[client-item][client-logo]\\":[\\"images\\/joomlart\\/logos\\/items-1.png\\",\\"images\\/joomlart\\/logos\\/items-2.png\\",\\"images\\/joomlart\\/logos\\/items-3.png\\",\\"images\\/joomlart\\/logos\\/items-4.png\\",\\"images\\/joomlart\\/logos\\/items-5.png\\"],\\"clients[client-item][client-name]\\":[\\"\\",\\"\\",\\"\\",\\"\\",\\"\\"],\\"clients[client-item][client-link]\\":[\\"#\\",\\"#\\",\\"#\\",\\"#\\",\\"#\\"],\\"rows\\":5,\\"cols\\":4,\\"type\\":\\"list\\"}}}","moduleclass_sfx":" bg-light","cache":"1","cache_time":"900","cachemode":"itemid","module_tag":"div","bootstrap_size":"0","header_tag":"h3","header_class":"","style":"0","full-width":"0"}', 0, '*'),
(127, 106, 'Other Menu', '', '', 2, 'off-canvas', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_menu', 1, 1, '{"menutype":"other-menu","base":"","startLevel":"1","endLevel":"0","showAllChildren":"1","tag_id":"","class_sfx":"","window_open":"","layout":"_:default","moduleclass_sfx":"","cache":"1","cache_time":"900","cachemode":"itemid","module_tag":"div","bootstrap_size":"0","header_tag":"h3","header_class":"","style":"0"}', 0, '*'),
(128, 107, 'Main Menu', '', '', 1, 'off-canvas', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_menu', 1, 1, '{"menutype":"mainmenu","base":"","startLevel":"1","endLevel":"0","showAllChildren":"1","tag_id":"","class_sfx":"","window_open":"","layout":"_:default","moduleclass_sfx":"  hidden-lg hidden-md","cache":"1","cache_time":"900","cachemode":"itemid","module_tag":"div","bootstrap_size":"0","header_tag":"h3","header_class":"","style":"0","full-width":"0"}', 0, '*'),
(129, 272, 'Login', '', '', 1, 'sidebar-2', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_login', 1, 1, '{"pretext":"","posttext":"","login":"","logout":"","greeting":"1","name":"0","usesecure":"0","usetext":"0","layout":"_:default","moduleclass_sfx":" module-highlight","cache":"0","module_tag":"div","bootstrap_size":"0","header_tag":"h3","header_class":"","style":"0","full-width":"0"}', 0, '*'),
(134, 309, 'Footer', '', '', 0, 'footer', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_footer', 1, 0, '{"layout":"_:default","moduleclass_sfx":"","cache":"1","cache_time":"900","cachemode":"static","module_tag":"div","bootstrap_size":"0","header_tag":"h3","header_class":"","style":"0","full-width":"0","module-bg":"","module-bg-position":"left top"}', 0, '*'),
(136, 311, 'Sample Sites', '', '', 0, 'off-canvas', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_menu', 1, 1, '{"menutype":"sample-sites","base":"","startLevel":"1","endLevel":"0","showAllChildren":"1","tag_id":"","class_sfx":"","window_open":"","layout":"_:default","moduleclass_sfx":"","cache":"1","cache_time":"900","cachemode":"itemid","module_tag":"div","bootstrap_size":"0","header_tag":"h3","header_class":"","style":"0","full-width":"0","module-bg":"","module-bg-position":"left top"}', 0, '*'),
(137, 312, 'Introduction', '', '', 1, 'frontend-mast-top', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_ja_acm', 1, 1, '{"jatools-config":"{\\":type\\":\\"ja_resume:features-intro\\",\\"features-intro\\":{\\"jatools-layout-features-intro\\":\\"style-1\\",\\"FEATURES[animation]\\":[\\"1\\"],\\"FEATURES[effect-blur]\\":[\\"0\\"],\\"FEATURES[acm-style]\\":[\\"style-dark\\"],\\"FEATURES[position-title]\\":[\\"text-left\\"],\\"FEATURES[title]\\":[\\"Hi! I am cavin harris.\\"],\\"FEATURES[title-time]\\":[\\"0\\"],\\"FEATURES[title-speed]\\":[\\"30\\"],\\"FEATURES[position]\\":[\\"Front-End Web Development\\"],\\"FEATURES[position-time]\\":[\\"1000\\"],\\"FEATURES[position-speed]\\":[\\"30\\"],\\"FEATURES[des]\\":[\\"Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inve veritatis et quasi architecto beatae vitae dicta sunt explicabo. \\"],\\"FEATURES[des-time]\\":[\\"2000\\"],\\"FEATURES[des-speed]\\":[\\"80\\"],\\"FEATURES[horizontal-position]\\":[\\"right\\"],\\"FEATURES[vertical-position]\\":[\\"bottom\\"],\\"FEATURES[image]\\":[\\"images\\/joomlart\\/slideshow\\/frontend.jpg\\"]}}","moduleclass_sfx":"","cache":"1","cache_time":"900","cachemode":"itemid","module_tag":"div","bootstrap_size":"0","header_tag":"h3","header_class":"","style":"0","full-width":"1"}', 0, '*'),
(138, 314, 'My Skill', '', '', 2, 'frontend-features-intro', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_ja_acm', 1, 0, '{"jatools-config":"{\\":type\\":\\"ja_resume:spotlight\\",\\"spotlight\\":{\\"jatools-layout-spotlight\\":\\"style-1\\",\\"spotlight[acm-title]\\":[\\"Skills\\"],\\"spotlight[acm-desc]\\":[\\"Ad nibh malis referrentur vel, scaevola percipit nam eu. Meis simul clita at qui, dolores quaerendum usu an. Vim at magna quando, omnis disputationi te his, cum maiorum instructior ne. Nec id aperiri labores, usu ut inimicus reprehendunt, laudem labitur mentitum per ut.\\"],\\"spotlight[data]\\":{\\"spotlight[data][position]\\":[\\"frontenddeveloper-skill-1\\",\\"frontenddeveloper-skill-2\\"],\\"spotlight[data][xs]\\":[\\"col-xs-12\\",\\"col-xs-12\\"],\\"undefined\\":[\\"\\",\\"\\",\\"\\",\\"\\",\\"\\",\\"\\",\\"\\",\\"\\"],\\"spotlight[data][sm]\\":[\\"col-sm-12\\",\\"col-sm-12\\"],\\"spotlight[data][md]\\":[\\"col-md-6\\",\\"col-md-6\\"],\\"spotlight[data][lg]\\":[\\"col-lg-6\\",\\"col-lg-6\\"],\\"rows\\":2,\\"cols\\":6,\\"type\\":\\"list\\"}}}","moduleclass_sfx":" title-style-1","cache":"1","cache_time":"900","cachemode":"itemid","module_tag":"div","bootstrap_size":"0","header_tag":"h3","header_class":"","style":"0","full-width":"0","module-bg":"","module-bg-position":"left top"}', 0, '*'),
(139, 315, '[FrontEnd Developer] My Skill 1', '', '', 1, 'frontenddeveloper-skill-1', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_ja_acm', 1, 0, '{"jatools-config":"{\\":type\\":\\"ja_resume:statistics\\",\\"statistics\\":{\\"jatools-layout-statistics\\":\\"style-1\\",\\"statistics[block-bg]\\":[\\"\\"],\\"statistics[acm-title]\\":[\\"\\"],\\"statistics[acm-description]\\":[\\"\\"],\\"statistics[acm-style]\\":[\\"style-light\\"],\\"statistics[full-width]\\":[\\"0\\"],\\"statistics[acm-col-offset]\\":[\\"col-lg-offset-0\\"],\\"statistics[data]\\":{\\"statistics[data][stats-count]\\":[\\"70\\",\\"80\\",\\"85\\",\\"90\\"],\\"statistics[data][stats-name]\\":[\\"Photoshop\\",\\"HTML \\/ CSS3\\",\\"PHP \\/ MYSQL\\",\\"Javascript\\"],\\"statistics[data][stats-color]\\":[\\"#fc615d\\",\\"#1f5dea\\",\\"#43cb83\\",\\"#1ecde2\\"],\\"rows\\":4,\\"cols\\":4,\\"type\\":\\"list\\"}}}","moduleclass_sfx":"","cache":"1","cache_time":"900","cachemode":"itemid","module_tag":"div","bootstrap_size":"0","header_tag":"h3","header_class":"","style":"0","full-width":"0","module-bg":"","module-bg-position":"left top"}', 0, '*'),
(140, 316, '[FrontEnd Developer] My Skill 2', '', '', 1, 'frontenddeveloper-skill-2', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_ja_acm', 1, 0, '{"jatools-config":"{\\":type\\":\\"ja_resume:statistics\\",\\"statistics\\":{\\"jatools-layout-statistics\\":\\"style-2\\",\\"statistics[block-bg]\\":[\\"\\"],\\"statistics[acm-title]\\":[\\"\\"],\\"statistics[acm-description]\\":[\\"\\"],\\"statistics[acm-style]\\":[\\"style-light\\"],\\"statistics[full-width]\\":[\\"1\\"],\\"statistics[stats-column]\\":[\\"2\\"],\\"statistics[data-style-2]\\":{\\"statistics[data-style-2][stats-count]\\":[\\"90\\",\\"100\\",\\"75\\",\\"85\\"],\\"statistics[data-style-2][stats-name]\\":[\\"Cross Browser\\",\\"Responsive\\",\\"SEO\\",\\"UI \\/ UX\\"],\\"statistics[data-style-2][stats-color]\\":[\\"#fc615d\\",\\"#1ecde2\\",\\"#1f5dea\\",\\"#43cb83\\"],\\"statistics[data-style-2][stats-shadow]\\":[\\"#eff0f4\\",\\"#eff0f4\\",\\"#eff0f4\\",\\"#eff0f4\\"],\\"statistics[data-style-2][stats-bg]\\":[\\"#fff\\",\\"#fff\\",\\"#fff\\",\\"#fff\\"],\\"rows\\":4,\\"cols\\":6,\\"type\\":\\"list\\"}}}","moduleclass_sfx":"","cache":"1","cache_time":"900","cachemode":"itemid","module_tag":"div","bootstrap_size":"0","header_tag":"h3","header_class":"","style":"0","full-width":"0","module-bg":"","module-bg-position":"left top"}', 0, '*'),
(141, 317, 'Porfolio', '', '', 3, 'frontend-features-intro', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_ja_acm', 1, 1, '{"jatools-config":"{\\":type\\":\\"ja_resume:gallery\\",\\"gallery\\":{\\"jatools-layout-gallery\\":\\"style-2\\",\\"isotope[acm-title]\\":[\\"Latest Projects\\"],\\"isotope[gallery-link-title]\\":[\\"\\"],\\"isotope[gallery-link]\\":[\\"\\"],\\"isotope[gallery-link-icon]\\":[\\"\\"],\\"isotope[colmb]\\":[\\"2\\"],\\"isotope[coltb]\\":[\\"3\\"],\\"isotope[coldt]\\":[\\"4\\"],\\"isotope[gutter]\\":[\\"30\\"],\\"isotope[animation]\\":[\\"effect\\"],\\"isotope[gallery]\\":{\\"isotope[gallery][selectitem]\\":[\\"2\\",\\"1\\",\\"1\\",\\"1\\",\\"1\\",\\"1\\",\\"1\\"],\\"undefined\\":[\\"\\",\\"\\",\\"\\",\\"\\",\\"\\",\\"\\",\\"\\"],\\"isotope[gallery][img]\\":[\\"images\\/joomlart\\/frontend\\/portfolio\\/ja_mono.png\\",\\"images\\/joomlart\\/frontend\\/portfolio\\/ja_events-ii.png\\",\\"images\\/joomlart\\/frontend\\/portfolio\\/ja_healthcare.png\\",\\"images\\/joomlart\\/frontend\\/portfolio\\/ja_playstore.png\\",\\"images\\/joomlart\\/frontend\\/portfolio\\/ja_moviemax.png\\",\\"images\\/joomlart\\/frontend\\/portfolio\\/ja_platon.png\\",\\"images\\/joomlart\\/frontend\\/portfolio\\/ja_sugite.png\\"],\\"isotope[gallery][title]\\":[\\"\\",\\"\\",\\"\\",\\"\\",\\"\\",\\"\\",\\"\\"],\\"isotope[gallery][desc]\\":[\\"\\",\\"\\",\\"\\",\\"\\",\\"\\",\\"\\",\\"\\"],\\"rows\\":7,\\"cols\\":5,\\"type\\":\\"list\\"}}}","moduleclass_sfx":" title-style-2","cache":"1","cache_time":"900","cachemode":"itemid","module_tag":"div","bootstrap_size":"0","header_tag":"h3","header_class":"","style":"0","full-width":"0","module-bg":"","module-bg-position":"left top"}', 0, '*'),
(142, 318, 'Chart', '', '', 5, 'frontend-features-intro', 0, '0000-00-00 00:00:00', '2017-07-10 10:08:09', '0000-00-00 00:00:00', -2, 'mod_jagooglechart_2', 1, 1, '{"tplhelper":"{\\"chart_settings\\":0}","chartType":"ColumnChart","chartData":"csv","data_input":"Project,2015 Users,2016 Users\\r\\nJA Mono,14902,12902\\r\\nJA Events II,6492,9023\\r\\nJA HealthCare,49021,23021\\r\\nJA Platon,24021,31021\\r\\nJA Playstore,490,62022\\r\\nJA Sugite,99631,99321\\r\\nJA MovieMax,24631,34731","data_input_url":"","option_series_targetLine":"","chart_colors":"","chart_description":"","option_displayMode":"regions","option_region":"world","option_resolution":"countries","option_enableRegionInteractivity":"1","option_keepAspectRatio":"1","option_markerOpacity":"1.0","option_colorAxis_minValue":"0","option_colorAxis_maxValue":"","geo_colorAxis_fromColor":"#ffffff","geo_colorAxis_toColor":"#35a339","option_datalessRegionColor":"#f5f5f5","option_pieHole":"","option_explode":"0","option_slices_explode":"","option_is3D":"0","option_reverseCategories":"0","option_pieSliceBorderColor":"#ffffff","option_pieSliceText":"percentage","option_pieSliceTextStyle_fontName":"","option_pieSliceTextStyle_fontSize":"9","option_pieSliceTextStyle_color":"#000000","option_pointShape":"circle","option_trendlines_0_type":"linear","option_trendlines_0_degree":"","option_trendlines_0_color":"","option_trendlines_lineWidth":"","option_trendlines_0_opacity":"","bar_setting":"1","option_candlestick_fallingColor":"#a52714","option_candlestick_risingColor":"#0f9d58","option_width":"100%","option_height":"600","option_chartArea_left":"50","option_chartArea_top":"50","option_chartArea_width":"800","option_chartArea_height":"600","option_backgroundColor_fill":"#ffffff","option_backgroundColor_stroke":"#666666","option_backgroundColor_strokeWidth":"0","option_fontName":"arial","option_lineWidth":"2","option_pointSize":"0","option_hAxis_title":"","option_hAxis_ticks":"","hAxis_titleTextStyle_fontName":"","hAxis_titletextSize_fontSize":"11","option_hAxis_titleTextStyle_color":"#000000","option_hAxis_textPosition":"out","option_hAxis_textStyle_fontName":"","option_hAxis_textStyle_fontSize":"9","hAxis_textStyle_color":"#000000","option_hAxis_direction":"1","option_vAxis_title":"","option_vAxis_ticks":"","option_vAxis_titleTextStyle_fontName":"","option_vAxis_titleTextStyle_fontSize":"11","option_vAxis_titleTextStyle_color":"#000000","option_vAxis_textPosition":"out","option_vAxis_textStyle_fontName":"","option_vAxis_textStyle_size":"9","option_vAxis_textStyle_color":"#000000","option_vAxis_direction":"1","option_title":"Product Downloads","option_titleTextStyle_fontName":"","option_titleTextStyle_fontSize":"34","option_titleTextStyle_color":"#000000","option_legend_position":"right","option_legend_textStyle_fontName":"","option_legend_textStyle_fontSize":"15","option_legend_textStyle_color":"#000000","tooltip_enabled":"1","option_tooltip_textStyle_fontName":"","option_tooltip_textStyle_textSize":"9","option_tooltip_textStyle_color":"#000000","layout":"_:default","moduleclass_sfx":"","cache":"1","cache_time":"900","cachemode":"static","module_tag":"div","bootstrap_size":"0","header_tag":"h3","header_class":"","style":"0","full-width":"0"}', 0, '*'),
(143, 320, 'About Me', '', '', 1, 'frontend-features-intro', 42, '2016-05-06 09:36:30', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_ja_acm', 1, 1, '{"jatools-config":"{\\":type\\":\\"ja_resume:features-intro\\",\\"features-intro\\":{\\"jatools-layout-features-intro\\":\\"style-2\\",\\"features[title]\\":[\\"biography\\"],\\"features[des]\\":[\\"Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.((br\\/))\\\\n\\\\nUt enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.\\"],\\"features[button-title]\\":[\\"Dowload my cv\\"],\\"features[button-link]\\":[\\"#\\"],\\"features[button-icon]\\":[\\"fa fa-cloud-download\\"],\\"features[data]\\":{\\"features[data][icon-social]\\":[\\"facebook\\",\\"twitter\\",\\"instagram\\",\\"pinterest-p\\"],\\"features[data][title-social]\\":[\\"\\/cavinharris_developer\\",\\"\\/cavinharris_developer\\",\\"\\/cavinharris_developer\\",\\"\\/cavinharris_developer\\"],\\"features[data][link-social]\\":[\\"#\\",\\"#\\",\\"#\\",\\"#\\"],\\"rows\\":4,\\"cols\\":4,\\"type\\":\\"list\\"}}}","moduleclass_sfx":"","cache":"1","cache_time":"900","cachemode":"itemid","module_tag":"div","bootstrap_size":"0","header_tag":"h3","header_class":"","style":"0","full-width":"0"}', 0, '*'),
(144, 335, 'Introduction', '', '', 1, 'yoga-mast-top', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_ja_acm', 1, 1, '{"jatools-config":"{\\":type\\":\\"ja_resume:features-intro\\",\\"features-intro\\":{\\"jatools-layout-features-intro\\":\\"style-1\\",\\"FEATURES[animation]\\":[\\"1\\"],\\"FEATURES[effect-blur]\\":[\\"0\\"],\\"FEATURES[acm-style]\\":[\\"style-white\\"],\\"FEATURES[position-title]\\":[\\"text-left\\"],\\"FEATURES[title]\\":[\\"Hi! I’m Debra Valdez\\"],\\"FEATURES[title-time]\\":[\\"0\\"],\\"FEATURES[title-speed]\\":[\\"30\\"],\\"FEATURES[position]\\":[\\"Embrace. Nurture. Inspire. Transform.\\"],\\"FEATURES[position-time]\\":[\\"1000\\"],\\"FEATURES[position-speed]\\":[\\"30\\"],\\"FEATURES[des]\\":[\\"As a global yoga warrior and servant to the breath, I am a student of this heart journey. I ambased in San Francisco and lends a wealth of knowledge and yoga experience to create a unique, vigorous approach to vinyasa yoga\\"],\\"FEATURES[des-time]\\":[\\"2000\\"],\\"FEATURES[des-speed]\\":[\\"80\\"],\\"FEATURES[horizontal-position]\\":[\\"right\\"],\\"FEATURES[vertical-position]\\":[\\"bottom\\"],\\"FEATURES[image]\\":[\\"images\\/joomlart\\/introduction\\/yoga.jpg\\"]}}","moduleclass_sfx":"","cache":"1","cache_time":"900","cachemode":"itemid","module_tag":"div","bootstrap_size":"0","header_tag":"h3","header_class":"","style":"0","full-width":"1"}', 0, '*'),
(145, 336, 'About Me', '', '', 2, 'yoga-features-intro', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_ja_acm', 1, 1, '{"jatools-config":"{\\":type\\":\\"ja_resume:features-intro\\",\\"features-intro\\":{\\"jatools-layout-features-intro\\":\\"style-2\\",\\"features[title]\\":[\\"biography\\"],\\"features[des]\\":[\\"((b))His labores dissentiunt at. Doming facilis expetendis sea ne. Putant tritani mnesarchum qui no. Quo falli causae cu, nam ex labore eripuit.((br\\/))Libris adipiscing conclusionemque usu cu, an vide solum nullam his. Ex oblique salutandi laboramus mei, cu erat iudicabit necessitatibus duo. Sea an congue laoreet verterem, has zril indoctum at.((\\/b))\\\\n((p))His labores dissentiunt at. Doming facilis expetendis sea ne. Putant tritani mnesarchum qui no. Quo falli causae cu, nam ex labore eripuit. Ad eos viderer expetendis concludaturque, nec an magna adversarium. Ne habeo mundi efficiendi vix. Te per falli nobis prompta. Ea tantas mollis facilis mel, pri sale timeam periculis et. Commune lobortis similique ad qui, eam ullum mazim liber cu. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum((\\/p))\\\\n\\\\nUt enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.\\"],\\"features[button-title]\\":[\\"\\"],\\"features[button-link]\\":[\\"\\"],\\"features[data]\\":{\\"features[data][icon-social]\\":[\\"\\"],\\"features[data][title-social]\\":[\\"\\"],\\"features[data][link-social]\\":[\\"\\"],\\"rows\\":1,\\"cols\\":4,\\"type\\":\\"list\\"}}}","moduleclass_sfx":" title-style-1 grid-custom","cache":"1","cache_time":"900","cachemode":"itemid","module_tag":"div","bootstrap_size":"0","header_tag":"h3","header_class":"","style":"0","full-width":"0"}', 0, '*'),
(146, 337, 'Tags Popular', '', '', 1, 'sidebar-2', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_tags_popular', 1, 1, '{"maximum":"5","timeframe":"alltime","order_value":"count","order_direction":"1","display_count":0,"no_results_text":"0","minsize":1,"maxsize":2,"layout":"_:default","moduleclass_sfx":"","owncache":"1","cache_time":"900","module_tag":"div","bootstrap_size":"0","header_tag":"h3","header_class":"","style":"0","full-width":"0"}', 0, '*'),
(147, 338, 'Articles Category', '', '', 1, 'sidebar-2', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_articles_category', 1, 1, '{"mode":"normal","show_on_article_page":"1","count":"5","show_front":"show","category_filtering_type":"1","catid":["17"],"show_child_category_articles":"1","levels":"1","author_filtering_type":"1","created_by":[""],"author_alias_filtering_type":"1","created_by_alias":[""],"excluded_articles":"","date_filtering":"off","date_field":"a.created","start_date_range":"","end_date_range":"","relative_date":"30","article_ordering":"a.title","article_ordering_direction":"ASC","article_grouping":"none","article_grouping_direction":"ksort","month_year_format":"F Y","link_titles":"1","show_date":"0","show_date_field":"created","show_date_format":"Y-m-d H:i:s","show_category":"0","show_hits":"0","show_author":"0","show_introtext":"0","introtext_limit":"100","show_readmore":"0","show_readmore_title":"1","readmore_limit":"15","layout":"_:default","moduleclass_sfx":"","owncache":"1","cache_time":"900","module_tag":"div","bootstrap_size":"0","header_tag":"h3","header_class":"","style":"0","full-width":"0"}', 0, '*'),
(148, 339, 'Latest Articles', '', '', 1, 'sidebar-2', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_articles_latest', 1, 1, '{"catid":["18","19","20"],"count":"5","show_featured":"","ordering":"c_dsc","user_id":"0","layout":"_:default","moduleclass_sfx":"","cache":"1","cache_time":"900","cachemode":"static","module_tag":"div","bootstrap_size":"0","header_tag":"h3","header_class":"","style":"0","full-width":"0"}', 0, '*'),
(149, 340, 'Yoga Gallery', '', '', 3, 'yoga-features-intro', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_ja_acm', 1, 0, '{"jatools-config":"{\\":type\\":\\"ja_resume:gallery\\",\\"gallery\\":{\\"jatools-layout-gallery\\":\\"style-1\\",\\"isotope[acm-title]\\":[\\"\\"],\\"isotope[gallery-link-title]\\":[\\"\\"],\\"isotope[gallery-link]\\":[\\"\\"],\\"isotope[gallery-link-icon]\\":[\\"\\"],\\"isotope[colmb]\\":[\\"2\\"],\\"isotope[coltb]\\":[\\"4\\"],\\"isotope[coldt]\\":[\\"5\\"],\\"isotope[gutter]\\":[\\"30\\"],\\"isotope[animation]\\":[\\"\\"],\\"isotope[gallery]\\":{\\"isotope[gallery][selectitem]\\":[\\"2\\",\\"1\\",\\"1\\",\\"1\\",\\"1\\",\\"2\\",\\"1\\",\\"1\\",\\"1\\"],\\"undefined\\":[\\"\\",\\"\\",\\"\\",\\"\\",\\"\\",\\"\\",\\"\\",\\"\\",\\"\\"],\\"isotope[gallery][img]\\":[\\"images\\/joomlart\\/gallery\\/yg-1.jpg\\",\\"images\\/joomlart\\/gallery\\/yg-2.jpg\\",\\"images\\/joomlart\\/gallery\\/yg-3.jpg\\",\\"images\\/joomlart\\/gallery\\/yg-4.jpg\\",\\"images\\/joomlart\\/gallery\\/yg-5.jpg\\",\\"images\\/joomlart\\/gallery\\/yg-6.jpg\\",\\"images\\/joomlart\\/gallery\\/yg-7.jpg\\",\\"images\\/joomlart\\/gallery\\/yg-8.jpg\\",\\"images\\/joomlart\\/gallery\\/yg-9.jpg\\"],\\"isotope[gallery][title]\\":[\\"\\",\\"\\",\\"\\",\\"\\",\\"\\",\\"\\",\\"\\",\\"\\",\\"\\"],\\"isotope[gallery][desc]\\":[\\"\\",\\"\\",\\"\\",\\"\\",\\"\\",\\"\\",\\"\\",\\"\\",\\"\\"],\\"rows\\":9,\\"cols\\":5,\\"type\\":\\"list\\"}}}","moduleclass_sfx":"","cache":"1","cache_time":"900","cachemode":"itemid","module_tag":"div","bootstrap_size":"0","header_tag":"h3","header_class":"","style":"0","full-width":"0","module-bg":"","module-bg-position":"left top"}', 0, '*'),
(150, 341, 'Teaching Experience', '', '', 4, 'yoga-features-intro', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_ja_acm', 1, 1, '{"jatools-config":"{\\":type\\":\\"ja_resume:timeline\\",\\"timeline\\":{\\"jatools-layout-timeline\\":\\"style-2\\",\\"timeline[acm-title]\\":[\\"Teaching Experience\\"],\\"timeline[acm-style]\\":[],\\"timeline[data]\\":{\\"timeline[data][timeline-date]\\":[\\"September 2013 - June 2015\\",\\"September 2013 - June 2015\\",\\"October 2014 - Current\\",\\"October 2014 - Current\\",\\"October 2015 - Current\\"],\\"timeline[data][title]\\":[\\"St. John\'s United Church\\",\\"Sweat Equity\\",\\"Prescott Town Hall - for members of Walker House\\",\\"Township of Edwardsburgh\\/Cardinal, Town Hall\\",\\"Johnstown Community Centre\\"],\\"timeline[data][title-link]\\":[\\"\\",\\"\\",\\"\\",\\"\\",\\"\\"],\\"timeline[data][description]\\":[\\"2120 Dundas Street, Cardinal, ON, Canada\\",\\"121 King Street West, Prescott, ON K0E, Canada\\",\\"360 Dibble Street West, Prescott, ON K0E, Canada\\",\\"18 Centre Street, Spencerville, ON, Canada\\",\\"24 Sutton Drive, Edwardsburgh\\/Cardinal, ON K0E, Canada\\"],\\"rows\\":5,\\"cols\\":5,\\"type\\":\\"list\\"}}}","moduleclass_sfx":" title-style-1 grid-custom","cache":"1","cache_time":"900","cachemode":"itemid","module_tag":"div","bootstrap_size":"0","header_tag":"h3","header_class":"","style":"0","full-width":"0","module-bg":"","module-bg-position":"left top"}', 0, '*'),
(151, 342, 'My Classes', '', '', 7, 'features-intro', 0, '0000-00-00 00:00:00', '2017-07-10 10:08:09', '0000-00-00 00:00:00', -2, 'mod_ja_acm', 1, 1, '{"jatools-config":"{\\":type\\":\\"ja_resume:features-intro\\",\\"features-intro\\":{\\"jatools-layout-features-intro\\":\\"style-2\\",\\"features[title]\\":[\\"My Classes\\"],\\"features[des]\\":[\\"((p))Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.((\\/p))\\\\n((p)) Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. ((\\/p))\\"],\\"features[button-title]\\":[\\"Dowload my cv\\"],\\"features[button-link]\\":[\\"#\\"],\\"features[data]\\":{\\"features[data][icon-social]\\":[\\"\\"],\\"features[data][title-social]\\":[\\"\\"],\\"features[data][link-social]\\":[\\"\\"],\\"rows\\":1,\\"cols\\":4,\\"type\\":\\"list\\"}}}","moduleclass_sfx":" title-style-2 grid-custom","cache":"1","cache_time":"900","cachemode":"itemid","module_tag":"div","bootstrap_size":"0","header_tag":"h3","header_class":"","style":"0","full-width":"0","module-bg":"","module-bg-position":"left top"}', 0, '*'),
(152, 343, 'My Classes', '', '', 5, 'yoga-features-intro', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_ja_acm', 1, 0, '{"jatools-config":"{\\":type\\":\\"ja_resume:statistics\\",\\"statistics\\":{\\"jatools-layout-statistics\\":\\"style-1\\",\\"statistics[block-bg]\\":[\\"\\"],\\"statistics[acm-title]\\":[\\"My Classes\\"],\\"statistics[acm-description]\\":[\\"((p))Nulla quis erat eget diam malesuada porta. Praesent condimentum ipsum ligula, vitae lobortis ex varius sollicitudin. Nam consectetur ante vel interdum rhoncus. Nam sed quam felis. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam id felis faucibus, congue urna pharetra, vulputate lorem. Suspendisse potenti. Sed erat arcu, viverra in elementum hendrerit, pellentesque vitae quam. Nullam eget mauris auctor, commodo orci eget, dictum ante((\\/p))\\"],\\"statistics[acm-style]\\":[\\"style-light\\"],\\"statistics[acm-col-offset]\\":[\\"col-lg-offset-0\\"],\\"statistics[data]\\":{\\"statistics[data][stats-count]\\":[\\"70\\",\\"80\\",\\"85\\",\\"90\\"],\\"statistics[data][stats-name]\\":[\\"Yoga Strong\\",\\"Yoga Barre\\",\\"Yoga TRX\\",\\"FIT\\"],\\"statistics[data][stats-color]\\":[\\"#fc615d\\",\\"#1f5dea\\",\\"#43cb83\\",\\"#1ecde2\\"],\\"rows\\":4,\\"cols\\":4,\\"type\\":\\"list\\"}}}","moduleclass_sfx":"title-style-2 grid-custom","cache":"1","cache_time":"900","cachemode":"itemid","module_tag":"div","bootstrap_size":"0","header_tag":"h3","header_class":"","style":"0","full-width":"0","module-bg":"","module-bg-position":"left top"}', 0, '*'),
(153, 344, 'Testimonial', '', '', 6, 'yoga-features-intro', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_ja_acm', 1, 1, '{"jatools-config":"{\\":type\\":\\"ja_resume:testimonials\\",\\"testimonials\\":{\\"jatools-layout-testimonials\\":\\"style-1\\",\\"testimonials[acm-title]\\":[\\"Testimonial\\"],\\"testimonials[author-info-color]\\":[\\"\\"],\\"testimonials[data-special]\\":{\\"testimonials[data-special][testimonial-text]\\":[\\"We are very pleased with your design and programming talents and continue to rely on your good work. Sure we will get back to you as our site evolves going forward. \\",\\"Your staff has been nothing less than professional and respectful. They are super patient and really listened to what I wanted. I would give you the top stars!\\",\\"You\'re the best! You did an amazing and perfect job … We have received many positive feedbacks on our new site since the launch. Great thanks again. \\"],\\"testimonials[data-special][author-name]\\":[\\"James S. \\",\\"Jaquelin A. \\",\\"Kelly B. \\"],\\"testimonials[data-special][author-title]\\":[\\"Creative Director\\",\\"IT Systems Analyst\\",\\"IT Engineer\\"],\\"testimonials[data-special][author-img]\\":[\\"images\\/joomlart\\/testimonial\\/items-1.jpg\\",\\"images\\/joomlart\\/testimonial\\/items-2.jpg\\",\\"images\\/joomlart\\/testimonial\\/items-3.jpg\\"],\\"rows\\":3,\\"cols\\":5,\\"type\\":\\"list\\"}}}","moduleclass_sfx":"title-style-2","cache":"1","cache_time":"900","cachemode":"itemid","module_tag":"div","bootstrap_size":"0","header_tag":"h3","header_class":"","style":"0","full-width":"0","module-bg":"","module-bg-position":"left top"}', 0, '*'),
(157, 354, 'Introduction', '', '', 1, 'singer-mast-top', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_ja_acm', 1, 1, '{"jatools-config":"{\\":type\\":\\"ja_resume:features-intro\\",\\"features-intro\\":{\\"jatools-layout-features-intro\\":\\"style-1\\",\\"FEATURES[animation]\\":[\\"1\\"],\\"FEATURES[effect-blur]\\":[\\"0\\"],\\"FEATURES[acm-style]\\":[\\"style-white\\"],\\"FEATURES[position-title]\\":[\\"text-left\\"],\\"FEATURES[title]\\":[\\"Hi! I am cavin harris.\\"],\\"FEATURES[title-time]\\":[\\"0\\"],\\"FEATURES[title-speed]\\":[\\"30\\"],\\"FEATURES[position]\\":[\\"Singer\\"],\\"FEATURES[position-time]\\":[\\"1000\\"],\\"FEATURES[position-speed]\\":[\\"30\\"],\\"FEATURES[des]\\":[\\"Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inve veritatis et quasi architecto beatae vitae dicta sunt explicabo. \\"],\\"FEATURES[des-time]\\":[\\"2000\\"],\\"FEATURES[des-speed]\\":[\\"80\\"],\\"FEATURES[horizontal-position]\\":[\\"right\\"],\\"FEATURES[vertical-position]\\":[\\"bottom\\"],\\"FEATURES[image]\\":[\\"images\\/joomlart\\/slideshow\\/singer.jpg\\"]}}","moduleclass_sfx":"","cache":"1","cache_time":"900","cachemode":"itemid","module_tag":"div","bootstrap_size":"0","header_tag":"h3","header_class":"","style":"0","full-width":"1"}', 0, '*');
INSERT INTO `#__modules` (`id`, `asset_id`, `title`, `note`, `content`, `ordering`, `position`, `checked_out`, `checked_out_time`, `publish_up`, `publish_down`, `published`, `module`, `access`, `showtitle`, `params`, `client_id`, `language`) VALUES
(158, 355, 'About Me', '', '', 1, 'features-intro', 0, '0000-00-00 00:00:00', '2017-07-10 10:08:09', '0000-00-00 00:00:00', -2, 'mod_ja_acm', 1, 1, '{"jatools-config":"{\\":type\\":\\"ja_resume:features-intro\\",\\"features-intro\\":{\\"jatools-layout-features-intro\\":\\"style-2\\",\\"features[title]\\":[\\"biography\\"],\\"features[des]\\":[\\"((b))His labores dissentiunt at. Doming facilis expetendis sea ne. Putant tritani mnesarchum qui no. Quo falli causae cu, nam ex labore eripuit.((br\\/))Libris adipiscing conclusionemque usu cu, an vide solum nullam his. Ex oblique salutandi laboramus mei, cu erat iudicabit necessitatibus duo. Sea an congue laoreet verterem, has zril indoctum at.((\\/b))\\\\n((p))His labores dissentiunt at. Doming facilis expetendis sea ne. Putant tritani mnesarchum qui no. Quo falli causae cu, nam ex labore eripuit. Ad eos viderer expetendis concludaturque, nec an magna adversarium. Ne habeo mundi efficiendi vix. Te per falli nobis prompta. Ea tantas mollis facilis mel, pri sale timeam periculis et. Commune lobortis similique ad qui, eam ullum mazim liber cu. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum((\\/p))\\\\n\\\\n((p)) Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. ((\\/p))\\"],\\"features[button-title]\\":[\\"\\"],\\"features[button-link]\\":[\\"\\"],\\"features[data]\\":{\\"features[data][icon-social]\\":[\\"\\"],\\"features[data][title-social]\\":[\\"\\"],\\"features[data][link-social]\\":[\\"\\"],\\"rows\\":1,\\"cols\\":4,\\"type\\":\\"list\\"}}}","moduleclass_sfx":" title-style-1 grid-custom","cache":"1","cache_time":"900","cachemode":"itemid","module_tag":"div","bootstrap_size":"0","header_tag":"h3","header_class":"","style":"0","full-width":"0","module-bg":"","module-bg-position":"left top"}', 0, '*'),
(159, 356, 'Timeline', '', '', 5, 'singer-features-intro', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_ja_acm', 1, 0, '{"jatools-config":"{\\":type\\":\\"ja_resume:timeline\\",\\"timeline\\":{\\"jatools-layout-timeline\\":\\"style-2\\",\\"timeline[acm-title]\\":[\\"EDUCATION\\"],\\"timeline[acm-style]\\":[\\"style-dark\\"],\\"timeline[data]\\":{\\"timeline[data][timeline-date]\\":[\\"March 2011 — March 2013 \\",\\"March 2013 — March 2014 \\",\\"March 2014 — March 2015\\",\\"March 2015 — Present \\"],\\"timeline[data][title]\\":[\\"Freelance Photographer\\",\\"Learning art of wedding\\",\\"Art Studio\\",\\"ART SCHOOL\\"],\\"timeline[data][title-link]\\":[\\"#\\",\\"#\\",\\"#\\",\\"#\\"],\\"timeline[data][description]\\":[\\"Meis simul clita at qui, dolores quaerendum usu an. Vim at magna quando, omnis disputationi te his, cum maiorum instructior ne. Nec id aperiri labores, usu ut inimicus reprehendunt, laudem labitur mentitum per ut.\\",\\"Error facilisi periculis ut pro, in eam iriure voluptaria. Id vix habeo quaeque eloquentiam, sonet rationibus cum ea, mea viris recteque dignissim ne. Pro modus argumentum at, nam ne delectus tincidunt.\\",\\"Meis simul clitNec id aperiri labores, usu ut inimicus reprehendunt, laudem labitur mentitum per ut.a at qui, dolores quaerendum usu an. Vim at magna quando, omnis disputationi te his, cum maiorum.\\",\\"Eam id facer labitur consequat, an usu suas volumus referrentur, vim ex alterum interesset Meis simul clita at qui, dolores quaerendum usu an. Vim at magna quando, omnis disputationi te his, cum maiorum.\\"],\\"rows\\":4,\\"cols\\":5,\\"type\\":\\"list\\"}}}","moduleclass_sfx":" title-style-2 grid-custom","cache":"1","cache_time":"900","cachemode":"itemid","module_tag":"div","bootstrap_size":"0","header_tag":"h3","header_class":"","style":"0","full-width":"0","module-bg":"","module-bg-position":"right center"}', 0, '*'),
(160, 360, 'Contact', '', '', 1, 'mast-bottom', 0, '0000-00-00 00:00:00', '2017-07-10 10:08:09', '0000-00-00 00:00:00', -2, 'mod_ja_acm', 1, 1, '{"jatools-config":"{\\":type\\":\\"ja_resume:spotlight\\",\\"spotlight\\":{\\"jatools-layout-spotlight\\":\\"style-1\\",\\"spotlight[acm-title]\\":[\\"\\"],\\"spotlight[acm-desc]\\":[\\"\\"],\\"spotlight[data]\\":{\\"spotlight[data][position]\\":[\\"contact-1\\",\\"contact-2\\"],\\"spotlight[data][xs]\\":[\\"col-xs-12\\",\\"col-xs-12\\"],\\"undefined\\":[\\"\\",\\"\\",\\"\\",\\"\\",\\"\\",\\"\\",\\"\\",\\"\\"],\\"spotlight[data][sm]\\":[\\"col-sm-12\\",\\"col-sm-12\\"],\\"spotlight[data][md]\\":[\\"col-md-6\\",\\"col-md-6\\"],\\"spotlight[data][lg]\\":[\\"col-lg-6\\",\\"col-lg-6\\"],\\"rows\\":2,\\"cols\\":6,\\"type\\":\\"list\\"}}}","moduleclass_sfx":" bg-white","cache":"1","cache_time":"900","cachemode":"itemid","module_tag":"div","bootstrap_size":"0","header_tag":"h3","header_class":"","style":"0","full-width":"0","module-bg":"","module-bg-position":"left top"}', 0, '*'),
(162, 363, 'Albums', '', '', 11, 'singer-features-intro', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_ja_acm', 1, 1, '{"jatools-config":"{\\":type\\":\\"ja_resume:gallery\\",\\"gallery\\":{\\"jatools-layout-gallery\\":\\"style-1\\",\\"isotope[acm-title]\\":[\\"My Albums\\"],\\"isotope[gallery-link-title]\\":[\\"\\"],\\"isotope[gallery-link]\\":[\\"\\"],\\"isotope[gallery-link-icon]\\":[\\"\\"],\\"isotope[colmb]\\":[\\"2\\"],\\"isotope[coltb]\\":[\\"4\\"],\\"isotope[coldt]\\":[\\"5\\"],\\"isotope[gutter]\\":[\\"30\\"],\\"isotope[animation]\\":[\\"effect\\"],\\"isotope[gallery]\\":{\\"isotope[gallery][selectitem]\\":[\\"2\\",\\"1\\",\\"1\\",\\"1\\",\\"1\\",\\"2\\",\\"1\\",\\"1\\",\\"1\\"],\\"undefined\\":[\\"\\",\\"\\",\\"\\",\\"\\",\\"\\",\\"\\",\\"\\",\\"\\",\\"\\"],\\"isotope[gallery][img]\\":[\\"images\\/joomlart\\/singer\\/albums\\/album-1.jpg\\",\\"images\\/joomlart\\/singer\\/albums\\/album-2.jpg\\",\\"images\\/joomlart\\/singer\\/albums\\/album-3.jpg\\",\\"images\\/joomlart\\/singer\\/albums\\/album-4.jpg\\",\\"images\\/joomlart\\/singer\\/albums\\/album-5.jpg\\",\\"images\\/joomlart\\/singer\\/albums\\/album-6.jpg\\",\\"images\\/joomlart\\/singer\\/albums\\/album-7.jpg\\",\\"images\\/joomlart\\/singer\\/albums\\/album-8.jpg\\",\\"images\\/joomlart\\/singer\\/albums\\/album-9.jpg\\"],\\"isotope[gallery][title]\\":[\\"\\",\\"\\",\\"\\",\\"\\",\\"\\",\\"\\",\\"\\",\\"\\",\\"\\"],\\"isotope[gallery][desc]\\":[\\"\\",\\"\\",\\"\\",\\"\\",\\"\\",\\"\\",\\"\\",\\"\\",\\"\\"],\\"rows\\":9,\\"cols\\":5,\\"type\\":\\"list\\"}}}","moduleclass_sfx":"","cache":"1","cache_time":"900","cachemode":"itemid","module_tag":"div","bootstrap_size":"0","header_tag":"h3","header_class":"","style":"0","full-width":"0","module-bg":"","module-bg-position":"left top"}', 0, '*'),
(163, 369, 'About Me', '', '', 1, 'singer-features-intro', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_ja_acm', 1, 1, '{"jatools-config":"{\\":type\\":\\"ja_resume:features-intro\\",\\"features-intro\\":{\\"jatools-layout-features-intro\\":\\"style-2\\",\\"features[title]\\":[\\"biography\\"],\\"features[des]\\":[\\"Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.((\\/p))\\\\n((p)) Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.\\"],\\"features[button-title]\\":[\\"\\"],\\"features[button-link]\\":[\\"\\"],\\"features[data]\\":{\\"features[data][icon-social]\\":[\\"\\"],\\"features[data][title-social]\\":[\\"\\"],\\"features[data][link-social]\\":[\\"\\"],\\"rows\\":1,\\"cols\\":4,\\"type\\":\\"list\\"}}}","moduleclass_sfx":" title-style-1 grid-custom","cache":"1","cache_time":"900","cachemode":"itemid","module_tag":"div","bootstrap_size":"0","header_tag":"h3","header_class":"","style":"0","full-width":"0","module-bg":"","module-bg-position":"left top"}', 0, '*'),
(164, 372, 'Introduction', '', '', 1, 'model-mast-top', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_ja_acm', 1, 1, '{"jatools-config":"{\\":type\\":\\"ja_resume:features-intro\\",\\"features-intro\\":{\\"jatools-layout-features-intro\\":\\"style-1\\",\\"FEATURES[animation]\\":[\\"1\\"],\\"FEATURES[effect-blur]\\":[\\"1\\"],\\"FEATURES[acm-style]\\":[\\"style-dark\\"],\\"FEATURES[position-title]\\":[\\"text-left\\"],\\"FEATURES[title]\\":[\\"Hi! I am Stewart.\\"],\\"FEATURES[title-time]\\":[\\"0\\"],\\"FEATURES[title-speed]\\":[\\"30\\"],\\"FEATURES[position]\\":[\\"Model\\"],\\"FEATURES[position-time]\\":[\\"1000\\"],\\"FEATURES[position-speed]\\":[\\"30\\"],\\"FEATURES[des]\\":[\\"Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inve veritatis et quasi architecto beatae vitae dicta sunt explicabo. \\"],\\"FEATURES[des-time]\\":[\\"2000\\"],\\"FEATURES[des-speed]\\":[\\"80\\"],\\"FEATURES[horizontal-position]\\":[\\"right\\"],\\"FEATURES[vertical-position]\\":[\\"bottom\\"],\\"FEATURES[image]\\":[\\"images\\/joomlart\\/introduction\\/model.jpg\\"]}}","moduleclass_sfx":"","cache":"1","cache_time":"900","cachemode":"itemid","module_tag":"div","bootstrap_size":"0","header_tag":"h3","header_class":"","style":"0","full-width":"1"}', 0, '*'),
(165, 376, 'About Me', '', '', 1, 'model-features-intro', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_ja_acm', 1, 0, '{"jatools-config":"{\\":type\\":\\"ja_resume:features-intro\\",\\"features-intro\\":{\\"jatools-layout-features-intro\\":\\"style-2\\",\\"features[title]\\":[\\"About Me\\"],\\"features[des]\\":[\\"((b))Ut enim dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua occaecat cupidatat non proident, sunt in culpa qui officia.((\\/b))((br\\/))((br\\/))\\\\n((b))Full name:((\\/b)) Stewart T. Sayre((br\\/))\\\\n((b))Birthday:((\\/b)) May 16, 1990((br\\/))\\\\n((b))Age:((\\/b)) 26((br\\/))\\\\n((b))Email Address:((\\/b)) no-reply@gmail.com((br\\/))((br\\/))\\\\nUt enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.((br\\/))\\\\nNe vide adipiscing efficiantur ius. Ex honestatis reprehendunt est. Sea vitae vivendum id. Veritus pericula ius ut, sit mutat argumentum ei. Fuisset apeirian suavitate id usu, sed eu omnium audire erroribus. Regione molestiae prodesset at sit, an cum singulis constituam interesset. Mea eu modo commodo signiferumque honestatis reprehendunt est.\\"],\\"features[button-title]\\":[\\"\\"],\\"features[button-link]\\":[\\"\\"],\\"features[data]\\":{\\"features[data][icon-social]\\":[\\"\\"],\\"features[data][title-social]\\":[\\"\\"],\\"features[data][link-social]\\":[\\"\\"],\\"rows\\":1,\\"cols\\":4,\\"type\\":\\"list\\"}}}","moduleclass_sfx":" title-style-1 grid-custom","cache":"1","cache_time":"900","cachemode":"itemid","module_tag":"div","bootstrap_size":"0","header_tag":"h3","header_class":"","style":"0","full-width":"0"}', 0, '*'),
(166, 377, 'Timeline', '', '', 3, 'model-features-intro', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_ja_acm', 1, 0, '{"jatools-config":"{\\":type\\":\\"ja_resume:timeline\\",\\"timeline\\":{\\"jatools-layout-timeline\\":\\"style-2\\",\\"timeline[acm-title]\\":[\\"EDUCATION\\"],\\"timeline[data]\\":{\\"timeline[data][timeline-date]\\":[\\"March 2011 — March 2013 \\",\\"March 2013 — March 2014 \\",\\"March 2014 — March 2015\\",\\"March 2015 — Present \\"],\\"timeline[data][title]\\":[\\"Freelance Photographer\\",\\"Learning art of wedding\\",\\"Art Studio\\",\\"ART SCHOOL\\"],\\"timeline[data][title-link]\\":[\\"#\\",\\"#\\",\\"#\\",\\"#\\"],\\"timeline[data][description]\\":[\\"Meis simul clita at qui, dolores quaerendum usu an. Vim at magna quando, omnis disputationi te his, cum maiorum instructior ne. Nec id aperiri labores, usu ut inimicus reprehendunt, laudem labitur mentitum per ut.\\",\\"Error facilisi periculis ut pro, in eam iriure voluptaria. Id vix habeo quaeque eloquentiam, sonet rationibus cum ea, mea viris recteque dignissim ne. Pro modus argumentum at, nam ne delectus tincidunt.\\",\\"Meis simul clitNec id aperiri labores, usu ut inimicus reprehendunt, laudem labitur mentitum per ut.a at qui, dolores quaerendum usu an. Vim at magna quando, omnis disputationi te his, cum maiorum.\\",\\"Eam id facer labitur consequat, an usu suas volumus referrentur, vim ex alterum interesset Meis simul clita at qui, dolores quaerendum usu an. Vim at magna quando, omnis disputationi te his, cum maiorum.\\"],\\"rows\\":4,\\"cols\\":5,\\"type\\":\\"list\\"}}}","moduleclass_sfx":" title-style-2 grid-custom","cache":"1","cache_time":"900","cachemode":"itemid","module_tag":"div","bootstrap_size":"0","header_tag":"h3","header_class":"","style":"0","full-width":"0"}', 0, '*'),
(167, 380, 'Model Gallery', '', '', 2, 'model-features-intro', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_ja_acm', 1, 0, '{"jatools-config":"{\\":type\\":\\"ja_resume:gallery\\",\\"gallery\\":{\\"jatools-layout-gallery\\":\\"style-1\\",\\"isotope[acm-title]\\":[\\"\\"],\\"isotope[gallery-link-title]\\":[\\"\\"],\\"isotope[gallery-link]\\":[\\"\\"],\\"isotope[gallery-link-icon]\\":[\\"\\"],\\"isotope[colmb]\\":[\\"2\\"],\\"isotope[coltb]\\":[\\"4\\"],\\"isotope[coldt]\\":[\\"5\\"],\\"isotope[gutter]\\":[\\"0\\"],\\"isotope[animation]\\":[\\"\\"],\\"isotope[gallery]\\":{\\"isotope[gallery][selectitem]\\":[\\"1\\",\\"1\\",\\"1\\",\\"1\\",\\"1\\",\\"1\\",\\"1\\",\\"1\\",\\"1\\",\\"1\\"],\\"undefined\\":[\\"\\",\\"\\",\\"\\",\\"\\",\\"\\",\\"\\",\\"\\",\\"\\",\\"\\",\\"\\"],\\"isotope[gallery][img]\\":[\\"images\\/joomlart\\/gallery\\/md-1.jpg\\",\\"images\\/joomlart\\/gallery\\/md-2.jpg\\",\\"images\\/joomlart\\/gallery\\/md-3.jpg\\",\\"images\\/joomlart\\/gallery\\/md-4.jpg\\",\\"images\\/joomlart\\/gallery\\/md-5.jpg\\",\\"images\\/joomlart\\/gallery\\/md-6.jpg\\",\\"images\\/joomlart\\/gallery\\/md-7.jpg\\",\\"images\\/joomlart\\/gallery\\/md-8.jpg\\",\\"images\\/joomlart\\/gallery\\/md-9.jpg\\",\\"images\\/joomlart\\/gallery\\/md-10.jpg\\"],\\"isotope[gallery][title]\\":[\\"Vel te adhuc\\",\\"Eum ut agam\\",\\"Ea quo choro\\",\\"Tempor audiam\\",\\"Mea vocibus\\",\\"Eum ut agam\\",\\"Per ad choro\\",\\"Movet primis\\",\\"Vel te adhuc\\",\\"Tempor audiam\\"],\\"isotope[gallery][desc]\\":[\\"Ea quo choro volumus\\",\\"Ea quo choro volumus\\",\\"Ea quo choro volumus\\",\\"Ea quo choro volumus\\",\\"Ea quo choro volumus\\",\\"Ea quo choro volumus\\",\\"Ea quo choro volumus\\",\\"Ea quo choro volumus\\",\\"Ea quo choro volumus\\",\\"Ea quo choro volumus\\"],\\"rows\\":10,\\"cols\\":5,\\"type\\":\\"list\\"}}}","moduleclass_sfx":"","cache":"1","cache_time":"900","cachemode":"itemid","module_tag":"div","bootstrap_size":"0","header_tag":"h3","header_class":"","style":"0","full-width":"1","module-bg":"","module-bg-position":"left top"}', 0, '*'),
(168, 381, 'Introduction (copy)', '', '', 1, 'singer-mast-top', 0, '0000-00-00 00:00:00', '2017-07-10 10:08:09', '0000-00-00 00:00:00', -2, 'mod_ja_acm', 1, 1, '{"jatools-config":"{\\":type\\":\\"ja_resume:features-intro\\",\\"features-intro\\":{\\"jatools-layout-features-intro\\":\\"style-1\\",\\"FEATURES[animation]\\":[\\"1\\"],\\"FEATURES[effect-blur]\\":[\\"1\\"],\\"FEATURES[acm-style]\\":[\\"style-white\\"],\\"FEATURES[title]\\":[\\"Hi! I am cavin harris.\\"],\\"FEATURES[title-time]\\":[\\"0\\"],\\"FEATURES[title-speed]\\":[\\"30\\"],\\"FEATURES[position]\\":[\\"Singer\\"],\\"FEATURES[position-time]\\":[\\"1000\\"],\\"FEATURES[position-speed]\\":[\\"30\\"],\\"FEATURES[des]\\":[\\"Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inve veritatis et quasi architecto beatae vitae dicta sunt explicabo. \\"],\\"FEATURES[des-time]\\":[\\"2000\\"],\\"FEATURES[des-speed]\\":[\\"80\\"],\\"FEATURES[image]\\":[\\"images\\/joomlart\\/slideshow\\/sl-1.png\\"]}}","moduleclass_sfx":"","cache":"1","cache_time":"900","cachemode":"itemid","module_tag":"div","bootstrap_size":"0","header_tag":"h3","header_class":"","style":"0","full-width":"1","module-bg":"","module-bg-position":"left top"}', 0, '*'),
(169, 382, 'Introduction', '', '', 1, 'blogger-mast-top', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_ja_acm', 1, 1, '{"jatools-config":"{\\":type\\":\\"ja_resume:features-intro\\",\\"features-intro\\":{\\"jatools-layout-features-intro\\":\\"style-1\\",\\"FEATURES[animation]\\":[\\"1\\"],\\"FEATURES[effect-blur]\\":[\\"1\\"],\\"FEATURES[acm-style]\\":[\\"style-white\\"],\\"FEATURES[position-title]\\":[\\"text-left\\"],\\"FEATURES[title]\\":[\\"Hi! I am cavin harris.\\"],\\"FEATURES[title-time]\\":[\\"0\\"],\\"FEATURES[title-speed]\\":[\\"30\\"],\\"FEATURES[position]\\":[\\"Travel Blogger\\"],\\"FEATURES[position-time]\\":[\\"1000\\"],\\"FEATURES[position-speed]\\":[\\"30\\"],\\"FEATURES[des]\\":[\\"Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inve veritatis et quasi architecto beatae vitae dicta sunt explicabo. \\"],\\"FEATURES[des-time]\\":[\\"2000\\"],\\"FEATURES[des-speed]\\":[\\"80\\"],\\"FEATURES[horizontal-position]\\":[\\"center\\"],\\"FEATURES[vertical-position]\\":[\\"center\\"],\\"FEATURES[image]\\":[\\"images\\/joomlart\\/introduction\\/blogger.jpeg\\"]}}","moduleclass_sfx":"","cache":"1","cache_time":"900","cachemode":"itemid","module_tag":"div","bootstrap_size":"0","header_tag":"h3","header_class":"","style":"0","full-width":"1"}', 0, '*'),
(170, 383, 'About Me', '', '', 1, 'blogger-features-intro', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_ja_acm', 1, 1, '{"jatools-config":"{\\":type\\":\\"ja_resume:features-intro\\",\\"features-intro\\":{\\"jatools-layout-features-intro\\":\\"style-2\\",\\"features[title]\\":[\\"biography\\"],\\"features[des]\\":[\\"Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.((\\/p))\\\\n((p)) Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.\\"],\\"features[button-title]\\":[\\"\\"],\\"features[button-link]\\":[\\"\\"],\\"features[data]\\":{\\"features[data][icon-social]\\":[\\"facebook\\",\\"twitter\\",\\"instagram\\",\\"pinterest-p\\"],\\"features[data][title-social]\\":[\\"\\/cavinharris_travel_blogger\\",\\"\\/cavinharris_travel_blogger\\",\\"\\/cavinharris_travel_blogger\\",\\"\\/cavinharris_travel_blogger\\"],\\"features[data][link-social]\\":[\\"#\\",\\"#\\",\\"#\\",\\"#\\"],\\"rows\\":4,\\"cols\\":4,\\"type\\":\\"list\\"}}}","moduleclass_sfx":"","cache":"1","cache_time":"900","cachemode":"itemid","module_tag":"div","bootstrap_size":"0","header_tag":"h3","header_class":"","style":"0","full-width":"0"}', 0, '*'),
(171, 384, 'Destinations', '', '', 2, 'blogger-features-intro', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_ja_acm', 1, 0, '{"jatools-config":"{\\":type\\":\\"ja_resume:timeline\\",\\"timeline\\":{\\"jatools-layout-timeline\\":\\"style-1\\",\\"timeline[acm-title]\\":[\\"Destinations\\"],\\"timeline[data]\\":{\\"timeline[data][timeline-date]\\":[\\"08 — 13 March 2013 \\",\\"18 — 25 July 2014 \\",\\"14 — 22 November 2015\\",\\"01 — 15 February 2016\\"],\\"timeline[data][title]\\":[\\"BangKok\\",\\"Hong Kong\\",\\"New York City\\",\\"Paris\\"],\\"timeline[data][title-link]\\":[\\"#\\",\\"#\\",\\"#\\",\\"#\\"],\\"timeline[data][description]\\":[\\"Meis simul clita at qui, dolores quaerendum usu an. Vim at magna quando, omnis disputationi te his, cum maiorum instructior ne. Nec id aperiri labores, usu ut inimicus reprehendunt, laudem labitur mentitum per ut.\\",\\"Error facilisi periculis ut pro, in eam iriure voluptaria. Id vix habeo quaeque eloquentiam, sonet rationibus cum ea, mea viris recteque dignissim ne. Pro modus argumentum at, nam ne delectus tincidunt.\\",\\"Meis simul clitNec id aperiri labores, usu ut inimicus reprehendunt, laudem labitur mentitum per ut.a at qui, dolores quaerendum usu an. Vim at magna quando, omnis disputationi te his, cum maiorum.\\",\\"Eam id facer labitur consequat, an usu suas volumus referrentur, vim ex alterum interesset Meis simul clita at qui, dolores quaerendum usu an. Vim at magna quando, omnis disputationi te his, cum maiorum.\\"],\\"rows\\":4,\\"cols\\":5,\\"type\\":\\"list\\"}}}","moduleclass_sfx":" title-style-1","cache":"1","cache_time":"900","cachemode":"itemid","module_tag":"div","bootstrap_size":"0","header_tag":"h3","header_class":"","style":"0","full-width":"0"}', 0, '*'),
(172, 385, 'Photo Stories', '', '', 4, 'blogger-features-intro', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_ja_acm', 1, 1, '{"jatools-config":"{\\":type\\":\\"ja_resume:gallery\\",\\"gallery\\":{\\"jatools-layout-gallery\\":\\"style-1\\",\\"isotope[acm-title]\\":[\\"Photo Stories\\"],\\"isotope[gallery-link-title]\\":[\\"view all\\"],\\"isotope[gallery-link]\\":[\\"#\\"],\\"isotope[gallery-link-icon]\\":[\\"500px\\"],\\"isotope[colmb]\\":[\\"2\\"],\\"isotope[coltb]\\":[\\"3\\"],\\"isotope[coldt]\\":[\\"4\\"],\\"isotope[gutter]\\":[\\"30\\"],\\"isotope[animation]\\":[\\"\\"],\\"isotope[gallery]\\":{\\"isotope[gallery][selectitem]\\":[\\"2\\",\\"1\\",\\"1\\",\\"1\\",\\"1\\",\\"2\\",\\"2\\",\\"1\\",\\"1\\"],\\"undefined\\":[\\"\\",\\"\\",\\"\\",\\"\\",\\"\\",\\"\\",\\"\\",\\"\\",\\"\\"],\\"isotope[gallery][img]\\":[\\"images\\/joomlart\\/gallery\\/items-1.jpg\\",\\"images\\/joomlart\\/gallery\\/items-2.jpg\\",\\"images\\/joomlart\\/gallery\\/gallery-9.jpg\\",\\"images\\/joomlart\\/gallery\\/gallery-14.png\\",\\"images\\/joomlart\\/gallery\\/gallery-13.jpg\\",\\"images\\/joomlart\\/gallery\\/gallery-11.jpg\\",\\"images\\/joomlart\\/gallery\\/gallery-18.jpg\\",\\"images\\/joomlart\\/gallery\\/gallery-15.jpg\\",\\"images\\/joomlart\\/gallery\\/gallery-16.jpg\\"],\\"isotope[gallery][title]\\":[\\"Lorem ipsum\\",\\"Nullam posuere\\",\\"In venenatis vel\\",\\"Proin erat odio\\",\\"Proin erat odio\\",\\"Sed consectetur\\",\\"Aliquam ornare at\\",\\"Aliquam ornare at\\",\\"Aliquam ornare at\\"],\\"isotope[gallery][desc]\\":[\\"Lorem ipsum dolor sit amet\\",\\"Nullam posuere mauris neque\\",\\"\\",\\"Fringilla ac ligula mollis\\",\\"Fringilla ac ligula mollis\\",\\"\\",\\"\\",\\"\\",\\"\\"],\\"rows\\":9,\\"cols\\":5,\\"type\\":\\"list\\"}}}","moduleclass_sfx":" title-style-2","cache":"1","cache_time":"900","cachemode":"itemid","module_tag":"div","bootstrap_size":"0","header_tag":"h3","header_class":"","style":"0","full-width":"0"}', 0, '*'),
(173, 386, 'Testimonial', '', '', 5, 'blogger-features-intro', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_ja_acm', 1, 1, '{"jatools-config":"{\\":type\\":\\"ja_resume:testimonials\\",\\"testimonials\\":{\\"jatools-layout-testimonials\\":\\"style-1\\",\\"testimonials[acm-title]\\":[\\"Testimonial\\"],\\"testimonials[author-info-color]\\":[\\"\\"],\\"testimonials[data-special]\\":{\\"testimonials[data-special][testimonial-text]\\":[\\"We are very pleased with your design and programming talents and continue to rely on your good work. Sure we will get back to you as our site evolves going forward. \\",\\"Your staff has been nothing less than professional and respectful. They are super patient and really listened to what I wanted. I would give you the top stars!\\",\\"You\'re the best! You did an amazing and perfect job … We have received many positive feedbacks on our new site since the launch. Great thanks again. \\"],\\"testimonials[data-special][author-name]\\":[\\"James S. \\",\\"Jaquelin A. \\",\\"Kelly B. \\"],\\"testimonials[data-special][author-title]\\":[\\"Creative Director\\",\\"IT Systems Analyst\\",\\"IT Engineer\\"],\\"testimonials[data-special][author-img]\\":[\\"images\\/joomlart\\/testimonial\\/items-1.jpg\\",\\"images\\/joomlart\\/testimonial\\/items-2.jpg\\",\\"images\\/joomlart\\/testimonial\\/items-3.jpg\\"],\\"rows\\":3,\\"cols\\":5,\\"type\\":\\"list\\"}}}","moduleclass_sfx":"title-style-2","cache":"1","cache_time":"900","cachemode":"itemid","module_tag":"div","bootstrap_size":"0","header_tag":"h3","header_class":"","style":"0","full-width":"0","module-bg":"","module-bg-position":"left top"}', 0, '*'),
(174, 387, 'Contact', '', '', 1, 'blogger-mast-bottom', 0, '0000-00-00 00:00:00', '2017-07-10 10:08:09', '0000-00-00 00:00:00', -2, 'mod_ja_acm', 1, 1, '{"jatools-config":"{\\":type\\":\\"ja_resume:spotlight\\",\\"spotlight\\":{\\"jatools-layout-spotlight\\":\\"style-1\\",\\"spotlight[acm-title]\\":[\\"\\"],\\"spotlight[acm-desc]\\":[\\"\\"],\\"spotlight[data]\\":{\\"spotlight[data][position]\\":[\\"contact-1\\",\\"contact-2\\"],\\"spotlight[data][xs]\\":[\\"col-xs-12\\",\\"col-xs-12\\"],\\"undefined\\":[\\"\\",\\"\\",\\"\\",\\"\\",\\"\\",\\"\\",\\"\\",\\"\\"],\\"spotlight[data][sm]\\":[\\"col-sm-12\\",\\"col-sm-12\\"],\\"spotlight[data][md]\\":[\\"col-md-6\\",\\"col-md-6\\"],\\"spotlight[data][lg]\\":[\\"col-lg-6\\",\\"col-lg-6\\"],\\"rows\\":2,\\"cols\\":6,\\"type\\":\\"list\\"}}}","moduleclass_sfx":"","cache":"1","cache_time":"900","cachemode":"itemid","module_tag":"div","bootstrap_size":"0","header_tag":"h3","header_class":"","style":"0","full-width":"0","module-bg":"","module-bg-position":"left top"}', 0, '*'),
(175, 391, 'Testimonial', '', '', 5, 'model-features-intro', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_ja_acm', 1, 0, '{"jatools-config":"{\\":type\\":\\"ja_resume:testimonials\\",\\"testimonials\\":{\\"jatools-layout-testimonials\\":\\"style-1\\",\\"testimonials[acm-title]\\":[\\"Testimonial\\"],\\"testimonials[author-info-color]\\":[\\"\\"],\\"testimonials[data-special]\\":{\\"testimonials[data-special][testimonial-text]\\":[\\"We are very pleased with your design and programming talents and continue to rely on your good work. Sure we will get back to you as our site evolves going forward. \\",\\"Your staff has been nothing less than professional and respectful. They are super patient and really listened to what I wanted. I would give you the top stars!\\",\\"You\'re the best! You did an amazing and perfect job … We have received many positive feedbacks on our new site since the launch. Great thanks again. \\"],\\"testimonials[data-special][author-name]\\":[\\"James S. \\",\\"Jaquelin A. \\",\\"Kelly B. \\"],\\"testimonials[data-special][author-title]\\":[\\"Creative Director\\",\\"IT Systems Analyst\\",\\"IT Engineer\\"],\\"testimonials[data-special][author-img]\\":[\\"images\\/joomlart\\/testimonial\\/items-1.jpg\\",\\"images\\/joomlart\\/testimonial\\/items-2.jpg\\",\\"images\\/joomlart\\/testimonial\\/items-3.jpg\\"],\\"rows\\":3,\\"cols\\":5,\\"type\\":\\"list\\"}}}","moduleclass_sfx":"title-style-2","cache":"1","cache_time":"900","cachemode":"itemid","module_tag":"div","bootstrap_size":"0","header_tag":"h3","header_class":"","style":"0","full-width":"0"}', 0, '*'),
(176, 395, 'More Info', '', '', 4, 'model-features-intro', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_ja_acm', 1, 1, '{"jatools-config":"{\\":type\\":\\"ja_resume:features-intro\\",\\"features-intro\\":{\\"jatools-layout-features-intro\\":\\"style-1\\",\\"FEATURES[animation]\\":[\\"0\\"],\\"FEATURES[effect-blur]\\":[\\"0\\"],\\"FEATURES[acm-style]\\":[\\"style-dark\\"],\\"FEATURES[position-title]\\":[\\"text-center\\"],\\"FEATURES[title]\\":[\\"honestatis reprehendunt\\"],\\"FEATURES[title-time]\\":[\\"0\\"],\\"FEATURES[title-speed]\\":[\\"30\\"],\\"FEATURES[position]\\":[\\"4437 Eden Drive Richmond, VA 23224 \\"],\\"FEATURES[position-time]\\":[\\"1000\\"],\\"FEATURES[position-speed]\\":[\\"30\\"],\\"FEATURES[des]\\":[\\"Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inve veritatis et quasi architecto beatae vitae dicta sunt explicabo. \\"],\\"FEATURES[des-time]\\":[\\"2000\\"],\\"FEATURES[des-speed]\\":[\\"80\\"],\\"FEATURES[image]\\":[\\"images\\/joomlart\\/other\\/bg-md-2.jpg\\"]}}","moduleclass_sfx":"","cache":"1","cache_time":"900","cachemode":"itemid","module_tag":"div","bootstrap_size":"0","header_tag":"h3","header_class":"","style":"0","full-width":"1"}', 0, '*'),
(177, 398, 'Main Menu', '', '', 1, 'off-canvas', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_menu', 1, 1, '{"menutype":"blogger","base":"","startLevel":"1","endLevel":"0","showAllChildren":"1","tag_id":"","class_sfx":"","window_open":"","layout":"_:default","moduleclass_sfx":"  hidden-lg hidden-md","cache":"1","cache_time":"900","cachemode":"itemid","module_tag":"div","bootstrap_size":"0","header_tag":"h3","header_class":"","style":"0","full-width":"0"}', 0, '*'),
(178, 399, 'Main Menu', '', '', 1, 'off-canvas', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_menu', 1, 1, '{"menutype":"frontend-developer","base":"","startLevel":"1","endLevel":"0","showAllChildren":"1","tag_id":"","class_sfx":"","window_open":"","layout":"_:default","moduleclass_sfx":"  hidden-lg hidden-md","cache":"1","cache_time":"900","cachemode":"itemid","module_tag":"div","bootstrap_size":"0","header_tag":"h3","header_class":"","style":"0","full-width":"0"}', 0, '*'),
(179, 400, 'Main Menu', '', '', 1, 'off-canvas', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_menu', 1, 1, '{"menutype":"model","base":"","startLevel":"1","endLevel":"0","showAllChildren":"1","tag_id":"","class_sfx":"","window_open":"","layout":"_:default","moduleclass_sfx":"  hidden-lg hidden-md","cache":"1","cache_time":"900","cachemode":"itemid","module_tag":"div","bootstrap_size":"0","header_tag":"h3","header_class":"","style":"0","full-width":"0"}', 0, '*'),
(180, 401, 'Main Menu', '', '', 1, 'off-canvas', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_menu', 1, 1, '{"menutype":"singer","base":"","startLevel":"1","endLevel":"0","showAllChildren":"1","tag_id":"","class_sfx":"","window_open":"","layout":"_:default","moduleclass_sfx":"  hidden-lg hidden-md","cache":"1","cache_time":"900","cachemode":"itemid","module_tag":"div","bootstrap_size":"0","header_tag":"h3","header_class":"","style":"0","full-width":"0"}', 0, '*'),
(181, 402, 'Main Menu', '', '', 1, 'off-canvas', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_menu', 1, 1, '{"menutype":"home-yoga","base":"","startLevel":"1","endLevel":"0","showAllChildren":"1","tag_id":"","class_sfx":"","window_open":"","layout":"_:default","moduleclass_sfx":"  hidden-lg hidden-md","cache":"1","cache_time":"900","cachemode":"itemid","module_tag":"div","bootstrap_size":"0","header_tag":"h3","header_class":"","style":"0","full-width":"0"}', 0, '*'),
(182, 412, 'Chart', '', '', 1, 'frontenddeveloper-popular-2', 0, '0000-00-00 00:00:00', '2017-07-10 10:08:09', '0000-00-00 00:00:00', 1, 'mod_jagooglechart_2', 1, 0, '{"tplhelper":"{\\"chart_settings\\":1}","chartType":"PieChart","chartData":"csv","data_input":"Project,2015 Users,2016 Users\\r\\nJA Mono,14902,12902\\r\\nJA Events II,6492,9023\\r\\nJA HealthCare,49021,23021\\r\\nJA Platon,24021,31021\\r\\nJA Playstore,490,62022\\r\\nJA Sugite,99631,99321\\r\\nJA MovieMax,24631,34731","data_input_url":"","option_series_targetLine":"","chart_colors":"","chart_description":"","option_displayMode":"regions","option_region":"world","option_resolution":"countries","option_enableRegionInteractivity":"1","option_keepAspectRatio":"1","option_markerOpacity":"1.0","option_colorAxis_minValue":"0","option_colorAxis_maxValue":"","geo_colorAxis_fromColor":"#ffffff","geo_colorAxis_toColor":"#35a339","option_datalessRegionColor":"#f5f5f5","option_pieHole":"","option_explode":"1","option_slices_explode":"","option_is3D":"0","option_reverseCategories":"0","option_pieSliceBorderColor":"#ffffff","option_pieSliceText":"percentage","option_pieSliceTextStyle_fontName":"arial","option_pieSliceTextStyle_fontSize":"14","option_pieSliceTextStyle_color":"#ffffff","option_pointShape":"circle","option_trendlines_0_type":"linear","option_trendlines_0_degree":"","option_trendlines_0_color":"","option_trendlines_lineWidth":"","option_trendlines_0_opacity":"","bar_setting":"0","option_candlestick_fallingColor":"#a52714","option_candlestick_risingColor":"#0f9d58","option_width":"100%","option_height":"600","option_chartArea_left":"50","option_chartArea_top":"0","option_chartArea_width":"450","option_chartArea_height":"450","option_backgroundColor_fill":"#ffffff","option_backgroundColor_stroke":"#666666","option_backgroundColor_strokeWidth":"0","option_fontName":"arial","option_lineWidth":"2","option_pointSize":"0","option_hAxis_title":"","option_hAxis_ticks":"","hAxis_titleTextStyle_fontName":"","hAxis_titletextSize_fontSize":"11","option_hAxis_titleTextStyle_color":"#000000","option_hAxis_textPosition":"out","option_hAxis_textStyle_fontName":"","option_hAxis_textStyle_fontSize":"9","hAxis_textStyle_color":"#000000","option_hAxis_direction":"1","option_vAxis_title":"","option_vAxis_ticks":"","option_vAxis_titleTextStyle_fontName":"","option_vAxis_titleTextStyle_fontSize":"11","option_vAxis_titleTextStyle_color":"#000000","option_vAxis_textPosition":"out","option_vAxis_textStyle_fontName":"","option_vAxis_textStyle_size":"9","option_vAxis_textStyle_color":"#000000","option_vAxis_direction":"1","option_title":"","option_titleTextStyle_fontName":"","option_titleTextStyle_fontSize":"34","option_titleTextStyle_color":"#000000","option_legend_position":"bottom","option_legend_textStyle_fontName":"arial","option_legend_textStyle_fontSize":"12","option_legend_textStyle_color":"#333333","tooltip_enabled":"1","option_tooltip_textStyle_fontName":"","option_tooltip_textStyle_textSize":"9","option_tooltip_textStyle_color":"#000000","layout":"_:default","moduleclass_sfx":"","cache":"1","cache_time":"900","cachemode":"static","module_tag":"div","bootstrap_size":"0","header_tag":"h3","header_class":"","style":"0","full-width":"0"}', 0, '*'),
(183, 413, 'Join My Classes', '', '<h3 class="title-style-1"><span class="acm-title">Join My Classes</span></h3>\r\n<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>\r\n\r\n<script type="text/javascript">\r\n  google.charts.load("current", {packages:["timeline"]});\r\n  google.charts.setOnLoadCallback(drawChart);\r\n  function drawChart() {\r\n    var container = document.getElementById(\'exampleChart\');\r\n    var chart = new google.visualization.Timeline(container);\r\n    var dataTable = new google.visualization.DataTable();\r\n    dataTable.addColumn({ type: \'string\', id: \'Day\' });\r\n    dataTable.addColumn({ type: \'string\', id: \'Name\' });\r\n    dataTable.addColumn({ type: \'date\', id: \'Start\' });\r\n    dataTable.addColumn({ type: \'date\', id: \'End\' });\r\n    dataTable.addRows([\r\n      [ \'Sunday\',  \'Sunrise Yoga\',    new Date(0,0,0,12,0,0),  new Date(0,0,0,14,0,0) ],\r\n      [ \'Sunday\',  \'Vinyasa Flow\',    new Date(0,0,0,14,30,0), new Date(0,0,0,16,0,0) ],\r\n      [ \'Sunday\',  \'Restorative Yoga\', new Date(0,0,0,16,30,0), new Date(0,0,0,19,0,0) ],\r\n      [ \'Monday\', \'Open Yoga\',   new Date(0,0,0,12,30,0), new Date(0,0,0,14,0,0) ],\r\n      [ \'Monday\', \'yoga @ Noon\',       new Date(0,0,0,14,30,0), new Date(0,0,0,16,0,0) ],\r\n      [ \'Monday\', \'Gentle Yoga\',        new Date(0,0,0,16,30,0), new Date(0,0,0,18,0,0) ],\r\n      [ \'Wednesday\', \'Open Yoga\',   new Date(0,0,0,12,30,0), new Date(0,0,0,14,0,0) ],\r\n      [ \'Wednesday\', \'yoga @ Noon\',       new Date(0,0,0,14,30,0), new Date(0,0,0,16,0,0) ],\r\n      [ \'Wednesday\', \'Gentle Yoga\',        new Date(0,0,0,16,30,0), new Date(0,0,0,18,0,0) ],\r\n      [ \'Thursday\', \'Open Yoga\',   new Date(0,0,0,12,30,0), new Date(0,0,0,14,0,0) ],\r\n      [ \'Thursday\', \'yoga @ Noon\',       new Date(0,0,0,14,30,0), new Date(0,0,0,16,0,0) ],\r\n      [ \'Thursday\', \'Gentle Yoga\',        new Date(0,0,0,16,30,0), new Date(0,0,0,18,0,0) ],\r\n      [ \'Friday\', \'Open Yoga\',   new Date(0,0,0,12,30,0), new Date(0,0,0,14,0,0) ],\r\n      [ \'Friday\', \'yoga @ Noon\',       new Date(0,0,0,14,30,0), new Date(0,0,0,16,0,0) ],\r\n      [ \'Friday\', \'Gentle Yoga\',        new Date(0,0,0,16,30,0), new Date(0,0,0,18,0,0) ],\r\n      [ \'Saturday\',   \'Advanced Yoga\',       new Date(0,0,0,12,30,0), new Date(0,0,0,14,0,0) ],\r\n      [ \'Saturday\',   \'Pre-Natal Yoga\',             new Date(0,0,0,14,30,0), new Date(0,0,0,16,0,0) ],\r\n      [ \'Saturday\',   \'Sunset Yoga\',          new Date(0,0,0,16,30,0), new Date(0,0,0,18,30,0) ]]);\r\n\r\n    var options = {\r\n      backgroundColor: \'#222\',\r\n      tooltip: { textStyle: { fontName: \'Work Sans\', fontSize: 14 } },\r\n      timeline: { colorByRowLabel: true },\r\n      timeline: { rowLabelStyle: {fontName: \'Work Sans\', fontSize: 14, color: \'#fff\' },\r\n                     barLabelStyle: { fontName: \'Work Sans\', fontSize: 14 } }\r\n    };\r\n\r\n    chart.draw(dataTable, options);\r\n  }\r\n</script>\r\n<style type=\'text/css\'>\r\n  #exampleChart text[fill="#000000"][text-anchor="middle"],\r\n  #exampleChart text[fill="#000000"][text-anchor="end"]{\r\n    fill: #999!important;\r\n  }\r\n  \r\n  #exampleChart text[fill="#000000"][text-anchor="start"]{\r\n    fill: #fff!important;\r\n  }\r\n  \r\n  #exampleChart path[stroke="#b7b7b7"],\r\n  #exampleChart rect[x="0"][stroke="#9a9a9a"]{\r\n   display: none;\r\n  }\r\n  \r\n  #exampleChart [stroke-width="3"] {\r\n    stroke: rgba(255, 255, 255, 0.6);\r\n    stroke-width: 1;\r\n  }\r\n\r\n</style>\r\n<div id="exampleChart" style="height: 360px;"></div>\r\n', 1, 'yoga-features-intro', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_custom', 1, 1, '{"prepare_content":"0","backgroundimage":"","layout":"_:default","moduleclass_sfx":"","cache":"1","cache_time":"900","cachemode":"static","module_tag":"div","bootstrap_size":"0","header_tag":"h3","header_class":"","style":"0","full-width":"0"}', 0, '*'),
(184, 415, 'Social Feed Categories', '', '', 1, 'before-blog', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_articles_categories', 1, 0, '{"parent":"10","show_description":"0","numitems":"0","show_children":"0","count":"0","maxlevel":"0","layout":"ja_resume:isotope","item_heading":"4","moduleclass_sfx":"","owncache":"1","cache_time":"900","module_tag":"div","bootstrap_size":"0","header_tag":"h3","header_class":"","style":"0","full-width":"0"}', 0, '*'),
(185, 429, 'Chart', '', '', 4, 'frontend-features-intro', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_ja_acm', 1, 1, '{"jatools-config":"{\\":type\\":\\"ja_resume:spotlight\\",\\"spotlight\\":{\\"jatools-layout-spotlight\\":\\"style-1\\",\\"spotlight[acm-title]\\":[\\"\\"],\\"spotlight[acm-desc]\\":[\\"\\"],\\"spotlight[data]\\":{\\"spotlight[data][position]\\":[\\"frontenddeveloper-popular-1\\",\\"frontenddeveloper-popular-2\\"],\\"spotlight[data][xs]\\":[\\"col-xs-12\\",\\"col-xs-12\\"],\\"undefined\\":[\\"\\",\\"\\",\\"\\",\\"\\",\\"\\",\\"\\",\\"\\",\\"\\"],\\"spotlight[data][sm]\\":[\\"col-sm-12\\",\\"col-sm-12\\"],\\"spotlight[data][md]\\":[\\"col-md-6\\",\\"col-md-6\\"],\\"spotlight[data][lg]\\":[\\"col-lg-6\\",\\"col-lg-6\\"],\\"rows\\":2,\\"cols\\":6,\\"type\\":\\"list\\"}}}","moduleclass_sfx":"","cache":"1","cache_time":"900","cachemode":"itemid","module_tag":"div","bootstrap_size":"0","header_tag":"h3","header_class":"","style":"0","full-width":"0"}', 0, '*'),
(186, 431, ' My Popular Products', '', '', 1, 'frontenddeveloper-popular-1', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_ja_acm', 1, 0, '{"jatools-config":"{\\":type\\":\\"ja_resume:features-intro\\",\\"features-intro\\":{\\"jatools-layout-features-intro\\":\\"style-2\\",\\"features[title]\\":[\\" My Popular Products\\"],\\"features[des]\\":[\\"((b))Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum((\\/b))((br\\/))((br\\/))\\\\n((b))Joomla:((\\/b)) 3.5.1((br\\/))\\\\n((b))Framework:((\\/b)) T3 Framework((br\\/))\\\\n((b))Total template:((\\/b)) 1340((br\\/))\\\\n((b))Total download:((\\/b)) 352,453((br\\/))((br\\/))\\\\nUt enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum eu iisque tamquam.((br\\/))\\\\nId mei probo pertinax, velit novum iudico at est, modo denique epicurei te usu. Pri enim eleifend dissentiunt ne. Nec eu iisque tamquam. Ei est nullam discere instructior.\\"],\\"features[button-title]\\":[\\"\\"],\\"features[button-link]\\":[\\"\\"],\\"features[button-icon]\\":[\\"fa fa-cloud-download\\"],\\"features[data]\\":{\\"features[data][icon-social]\\":[\\"\\"],\\"features[data][title-social]\\":[\\"\\"],\\"features[data][link-social]\\":[\\"\\"],\\"rows\\":1,\\"cols\\":4,\\"type\\":\\"list\\"}}}","moduleclass_sfx":"","cache":"1","cache_time":"900","cachemode":"itemid","module_tag":"div","bootstrap_size":"0","header_tag":"h3","header_class":"","style":"0","full-width":"0"}', 0, '*');

DROP TABLE IF EXISTS `#__modules_menu`;
CREATE TABLE `#__modules_menu` (
  `moduleid` int(11) NOT NULL DEFAULT 0,
  `menuid` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`moduleid`,`menuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `#__modules_menu` (`moduleid`, `menuid`) VALUES
(2, 0),
(3, 0),
(4, 0),
(6, 0),
(7, 0),
(8, 0),
(9, 0),
(10, 0),
(12, 0),
(13, 0),
(14, 0),
(15, 0),
(79, 0),
(86, 0),
(87, 101),
(87, 106),
(89, 0),
(90, 101),
(90, 106),
(91, 101),
(91, 106),
(91, 151),
(91, 152),
(92, 101),
(92, 106),
(93, 101),
(93, 106),
(94, 101),
(94, 102),
(94, 103),
(94, 104),
(94, 105),
(94, 106),
(95, 101),
(95, 102),
(95, 103),
(95, 104),
(95, 105),
(95, 106),
(96, 101),
(96, 106),
(98, 101),
(98, 106),
(98, 151),
(98, 152),
(98, 157),
(98, 158),
(98, 167),
(98, 168),
(98, 170),
(98, 171),
(98, 173),
(98, 174),
(99, 0),
(100, 101),
(100, 106),
(127, 0),
(128, 101),
(128, 102),
(128, 103),
(128, 104),
(128, 105),
(128, 129),
(128, 130),
(128, 131),
(128, 132),
(128, 133),
(128, 134),
(128, 135),
(128, 136),
(128, 137),
(128, 138),
(128, 139),
(128, 140),
(128, 141),
(128, 144),
(128, 145),
(128, 146),
(128, 147),
(128, 148),
(128, 149),
(129, 131),
(129, 132),
(129, 135),
(129, 137),
(129, 146),
(129, 147),
(129, 148),
(129, 149),
(130, 129),
(130, 189),
(131, 129),
(131, 189),
(132, 129),
(132, 189),
(134, 0),
(136, 0),
(137, 106),
(137, 151),
(138, 151),
(138, 152),
(139, 0),
(140, 0),
(141, 151),
(141, 152),
(142, 151),
(142, 152),
(143, 151),
(143, 152),
(144, 157),
(144, 158),
(145, 157),
(145, 158),
(146, 131),
(146, 132),
(146, 135),
(146, 137),
(146, 146),
(146, 147),
(146, 148),
(146, 149),
(147, 131),
(147, 132),
(147, 135),
(147, 137),
(147, 146),
(147, 147),
(147, 148),
(147, 149),
(148, 132),
(148, 135),
(148, 137),
(148, 146),
(148, 147),
(148, 148),
(148, 149),
(149, 157),
(149, 158),
(150, 157),
(150, 158),
(151, 157),
(151, 158),
(152, 157),
(152, 158),
(153, 157),
(153, 158),
(154, 129),
(155, 129),
(156, 129),
(157, 167),
(157, 168),
(158, 167),
(158, 168),
(159, 167),
(159, 168),
(160, 101),
(160, 106),
(160, 151),
(160, 152),
(160, 157),
(160, 158),
(162, 167),
(162, 168),
(163, 167),
(163, 168),
(164, 170),
(164, 171),
(165, 170),
(165, 171),
(166, 170),
(166, 171),
(167, 170),
(167, 171),
(168, 167),
(168, 168),
(169, 106),
(169, 173),
(170, 106),
(170, 173),
(171, 173),
(171, 174),
(172, 173),
(172, 174),
(173, 173),
(173, 174),
(174, 173),
(174, 174),
(175, 170),
(175, 171),
(176, 170),
(176, 171),
(177, 173),
(177, 175),
(177, 176),
(177, 177),
(177, 178),
(178, 151),
(178, 153),
(178, 154),
(178, 155),
(178, 156),
(179, 170),
(179, 172),
(179, 179),
(179, 180),
(179, 181),
(180, 163),
(180, 164),
(180, 166),
(180, 167),
(181, 157),
(181, 160),
(181, 161),
(181, 162),
(181, 169),
(182, 151),
(182, 152),
(183, 157),
(183, 158),
(184, 131),
(184, 190),
(184, 191),
(184, 192),
(184, 193),
(184, 194),
(184, 195),
(185, 0),
(186, 151),
(186, 152);

DROP TABLE IF EXISTS `#__newsfeeds`;
CREATE TABLE `#__newsfeeds` (
  `catid` int(11) NOT NULL DEFAULT 0,
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL DEFAULT '',
  `alias` varchar(400) binary NOT NULL DEFAULT '',
  `link` varchar(2048) NOT NULL,
  `published` tinyint(1) NOT NULL DEFAULT 0,
  `numarticles` int(10) unsigned NOT NULL DEFAULT 1,
  `cache_time` int(10) unsigned NOT NULL DEFAULT 3600,
  `checked_out` int(10) unsigned NOT NULL DEFAULT 0,
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ordering` int(11) NOT NULL DEFAULT 0,
  `rtl` tinyint(4) NOT NULL DEFAULT 0,
  `access` int(10) unsigned NOT NULL DEFAULT 0,
  `language` char(7) NOT NULL DEFAULT '',
  `params` text NOT NULL,
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(10) unsigned NOT NULL DEFAULT 0,
  `created_by_alias` varchar(255) NOT NULL DEFAULT '',
  `modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(10) unsigned NOT NULL DEFAULT 0,
  `metakey` text NOT NULL,
  `metadesc` text NOT NULL,
  `metadata` text NOT NULL,
  `xreference` varchar(50) NOT NULL DEFAULT '',
  `publish_up` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `description` text NOT NULL,
  `version` int(10) unsigned NOT NULL DEFAULT 1,
  `hits` int(10) unsigned NOT NULL DEFAULT 0,
  `images` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_access` (`access`),
  KEY `idx_checkout` (`checked_out`),
  KEY `idx_state` (`published`),
  KEY `idx_catid` (`catid`),
  KEY `idx_createdby` (`created_by`),
  KEY `idx_language` (`language`),
  KEY `idx_xreference` (`xreference`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `#__overrider`;
CREATE TABLE `#__overrider` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT 'Primary Key',
  `constant` varchar(255) NOT NULL,
  `string` text NOT NULL,
  `file` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `#__postinstall_messages`;
CREATE TABLE `#__postinstall_messages` (
  `postinstall_message_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `extension_id` bigint(20) NOT NULL DEFAULT 700 COMMENT 'FK to #__extensions',
  `title_key` varchar(255) NOT NULL DEFAULT '' COMMENT 'Lang key for the title',
  `description_key` varchar(255) NOT NULL DEFAULT '' COMMENT 'Lang key for description',
  `action_key` varchar(255) NOT NULL DEFAULT '',
  `language_extension` varchar(255) NOT NULL DEFAULT 'com_postinstall' COMMENT 'Extension holding lang keys',
  `language_client_id` tinyint(3) NOT NULL DEFAULT 1,
  `type` varchar(10) NOT NULL DEFAULT 'link' COMMENT 'Message type - message, link, action',
  `action_file` varchar(255) DEFAULT '' COMMENT 'RAD URI to the PHP file containing action method',
  `action` varchar(255) DEFAULT '' COMMENT 'Action method name or URL',
  `condition_file` varchar(255) DEFAULT NULL COMMENT 'RAD URI to file holding display condition method',
  `condition_method` varchar(255) DEFAULT NULL COMMENT 'Display condition method, must return boolean',
  `version_introduced` varchar(50) NOT NULL DEFAULT '3.2.0' COMMENT 'Version when this message was introduced',
  `enabled` tinyint(3) NOT NULL DEFAULT 1,
  PRIMARY KEY (`postinstall_message_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `#__redirect_links`;
CREATE TABLE `#__redirect_links` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `old_url` varchar(2048) NOT NULL,
  `new_url` varchar(2048) DEFAULT NULL,
  `referer` varchar(2048) NOT NULL,
  `comment` varchar(255) NOT NULL DEFAULT '',
  `hits` int(10) unsigned NOT NULL DEFAULT 0,
  `published` tinyint(4) NOT NULL,
  `created_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `header` smallint(3) NOT NULL DEFAULT 301,
  PRIMARY KEY (`id`),
  KEY `idx_old_url` (`old_url`(100)),
  KEY `idx_link_modifed` (`modified_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `#__schemas`;
CREATE TABLE `#__schemas` (
  `extension_id` int(11) NOT NULL,
  `version_id` varchar(20) NOT NULL,
  PRIMARY KEY (`extension_id`,`version_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `#__session`;
CREATE TABLE `#__session` (
  `session_id` varchar(191) NOT NULL DEFAULT '',
  `client_id` tinyint(3) unsigned DEFAULT NULL,
  `guest` tinyint(4) unsigned DEFAULT 1,
  `time` varchar(14) DEFAULT '',
  `data` mediumtext DEFAULT NULL,
  `userid` int(11) DEFAULT 0,
  `username` varchar(150) DEFAULT '',
  PRIMARY KEY (`session_id`),
  KEY `userid` (`userid`),
  KEY `time` (`time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `#__tags`;
CREATE TABLE `#__tags` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(10) unsigned NOT NULL DEFAULT 0,
  `lft` int(11) NOT NULL DEFAULT 0,
  `rgt` int(11) NOT NULL DEFAULT 0,
  `level` int(10) unsigned NOT NULL DEFAULT 0,
  `path` varchar(400) NOT NULL DEFAULT '',
  `title` varchar(255) NOT NULL,
  `alias` varchar(400) binary NOT NULL DEFAULT '',
  `note` varchar(255) NOT NULL DEFAULT '',
  `description` mediumtext NOT NULL,
  `published` tinyint(1) NOT NULL DEFAULT 0,
  `checked_out` int(11) unsigned NOT NULL DEFAULT 0,
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `access` int(10) unsigned NOT NULL DEFAULT 0,
  `params` text NOT NULL,
  `metadesc` varchar(1024) NOT NULL COMMENT 'The meta description for the page.',
  `metakey` varchar(1024) NOT NULL COMMENT 'The meta keywords for the page.',
  `metadata` varchar(2048) NOT NULL COMMENT 'JSON encoded metadata properties.',
  `created_user_id` int(10) unsigned NOT NULL DEFAULT 0,
  `created_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by_alias` varchar(255) NOT NULL DEFAULT '',
  `modified_user_id` int(10) unsigned NOT NULL DEFAULT 0,
  `modified_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `images` text NOT NULL,
  `urls` text NOT NULL,
  `hits` int(10) unsigned NOT NULL DEFAULT 0,
  `language` char(7) NOT NULL,
  `version` int(10) unsigned NOT NULL DEFAULT 1,
  `publish_up` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `tag_idx` (`published`,`access`),
  KEY `idx_access` (`access`),
  KEY `idx_checkout` (`checked_out`),
  KEY `idx_path` (`path`(100)),
  KEY `idx_left_right` (`lft`,`rgt`),
  KEY `idx_alias` (`alias`(100)),
  KEY `idx_language` (`language`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `#__template_styles`;
CREATE TABLE `#__template_styles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `template` varchar(50) NOT NULL DEFAULT '',
  `client_id` tinyint(1) unsigned NOT NULL DEFAULT 0,
  `home` char(7) NOT NULL DEFAULT '0',
  `title` varchar(255) NOT NULL DEFAULT '',
  `params` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_template` (`template`),
  KEY `idx_home` (`home`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

INSERT INTO `#__template_styles` (`id`, `template`, `client_id`, `home`, `title`, `params`) VALUES
(4, 'beez3', 0, '0', 'Beez3 - Default', '{"wrapperSmall":"53","wrapperLarge":"72","logo":"images\\/joomla_black.png","sitetitle":"Joomla!","sitedescription":"Open Source Content Management","navposition":"left","templatecolor":"personal","html5":"0"}'),
(5, 'hathor', 1, '0', 'Hathor - Default', '{"showSiteName":"0","colourChoice":"","boldText":"0"}'),
(7, 'protostar', 0, '0', 'protostar - Default', '{"templateColor":"","logoFile":"","googleFont":"1","googleFontName":"Open+Sans","fluidContainer":"0"}'),
(8, 'isis', 1, '1', 'isis - Default', '{"templateColor":"","logoFile":""}'),
(9, 'ja_resume', 0, '1', 'ja_resume - Default', '{"logolink":"default","logolink_id":"","t3_template":"1","devmode":"0","themermode":"1","legacy_css":"1","responsive":"1","non_responsive_width":"970px","build_rtl":"0","t3-assets":"t3-assets","t3-rmvlogo":"1","minify":"1","minify_js":"1","minify_js_tool":"jsmin","minify_exclude":"","link_titles":"","theme":"","logotype":"text","sitename":"CV","slogan":"","logoimage":"","enable_logoimage_sm":"0","logoimage_sm":"","mainlayout":"default-content-left","sublayout":"","mm_type":"mainmenu","navigation_trigger":"hover","navigation_type":"megamenu","navigation_animation":"","navigation_animation_duration":"400","mm_config":"","navigation_collapse_enable":"0","addon_offcanvas_enable":"1","addon_offcanvas_effect":"off-canvas-effect-4","snippet_open_head":"","snippet_close_head":"","snippet_open_body":"","snippet_close_body":"","snippet_debug":"0","theme_extras_com_easyblog":["-1"]}'),
(10, 'ja_resume', 0, '0', 'ja_resume - Home - Photographer', '{"logolink":"page","logolink_id":"101","t3_template":"1","devmode":"0","themermode":"1","legacy_css":"1","responsive":"1","non_responsive_width":"970px","build_rtl":"0","t3-assets":"t3-assets","t3-rmvlogo":"1","minify":"1","minify_js":"1","minify_js_tool":"jsmin","minify_exclude":null,"link_titles":null,"theme":"","logotype":"text","sitename":"CV","slogan":"","logoimage":"","enable_logoimage_sm":"0","logoimage_sm":"","mainlayout":"photographer-features-intro","sublayout":"","skip_component_content":["151","101","106","152"],"mm_type":"mainmenu","navigation_trigger":"hover","navigation_type":"megamenu","navigation_animation":null,"navigation_animation_duration":"400","mm_config":null,"navigation_collapse_enable":"0","addon_offcanvas_enable":"1","addon_offcanvas_effect":"off-canvas-effect-4","snippet_open_head":null,"snippet_close_head":null,"snippet_open_body":null,"snippet_close_body":null,"snippet_debug":"0","theme_extras_com_easyblog":["-1"]}'),
(11, 'ja_resume', 0, '0', 'ja_resume - No Sidebar', '{"t3_template":"1","devmode":"0","themermode":"1","legacy_css":"1","responsive":"1","non_responsive_width":"970px","build_rtl":"0","t3-assets":"t3-assets","t3-rmvlogo":"1","minify":"1","minify_js":"1","minify_js_tool":"jsmin","minify_exclude":null,"link_titles":null,"theme":"","logotype":"text","sitename":"CV","slogan":"","logoimage":"","enable_logoimage_sm":"0","logoimage_sm":"","mainlayout":"default-nosidebar","sublayout":"default","mm_type":"mainmenu","navigation_trigger":"hover","navigation_type":"megamenu","navigation_animation":null,"navigation_animation_duration":"400","mm_config":null,"navigation_collapse_enable":"0","addon_offcanvas_enable":"1","addon_offcanvas_effect":"off-canvas-effect-4","snippet_open_head":null,"snippet_close_head":null,"snippet_open_body":null,"snippet_close_body":null,"snippet_debug":"0","theme_extras_com_easyblog":["-1"]}'),
(12, 'ja_resume', 0, '0', 'ja_resume - Home - FrontEnd Developer', '{"logolink":"page","logolink_id":"151","t3_template":"1","devmode":"0","themermode":"1","legacy_css":"1","responsive":"1","non_responsive_width":"970px","build_rtl":"0","t3-assets":"t3-assets","t3-rmvlogo":"1","minify":"1","minify_js":"1","minify_js_tool":"jsmin","minify_exclude":null,"link_titles":null,"theme":"light-triangular-yellow","logotype":"text","sitename":"CV","slogan":"","logoimage":"","enable_logoimage_sm":"0","logoimage_sm":"","mainlayout":"frontend-features-intro","sublayout":"","skip_component_content":["101"],"mm_type":"frontend-developer","navigation_trigger":"hover","navigation_type":"megamenu","navigation_animation":null,"navigation_animation_duration":"400","mm_config":null,"navigation_collapse_enable":"0","addon_offcanvas_enable":"1","addon_offcanvas_effect":"off-canvas-effect-4","snippet_open_head":null,"snippet_close_head":null,"snippet_open_body":null,"snippet_close_body":null,"snippet_debug":"0","theme_extras_com_easyblog":["-1"]}'),
(13, 'ja_resume', 0, '0', 'ja_resume - Home - Yoga', '{"logolink":"page","logolink_id":"157","t3_template":"1","devmode":"0","themermode":"1","legacy_css":"1","responsive":"1","non_responsive_width":"970px","build_rtl":"0","t3-assets":"t3-assets","t3-rmvlogo":"1","minify":"1","minify_js":"1","minify_js_tool":"jsmin","minify_exclude":null,"link_titles":null,"theme":"dark-circle-cyan","logotype":"text","sitename":"YG","slogan":"","logoimage":"","enable_logoimage_sm":"0","logoimage_sm":"","mainlayout":"yoga-features-intro","sublayout":"","skip_component_content":["157","158"],"mm_type":"home-yoga","navigation_trigger":"hover","navigation_type":"megamenu","navigation_animation":null,"navigation_animation_duration":"400","mm_config":null,"navigation_collapse_enable":"0","addon_offcanvas_enable":"1","addon_offcanvas_effect":"off-canvas-effect-4","snippet_open_head":null,"snippet_close_head":null,"snippet_open_body":null,"snippet_close_body":null,"snippet_debug":"0","theme_extras_com_easyblog":["-1"]}'),
(14, 'ja_resume', 0, '0', 'ja_resume - Home - Singer', '{"logolink":"page","logolink_id":"167","t3_template":"1","devmode":"0","themermode":"1","legacy_css":"1","responsive":"1","non_responsive_width":"970px","build_rtl":"0","t3-assets":"t3-assets","t3-rmvlogo":"1","minify":"1","minify_js":"1","minify_js_tool":"jsmin","minify_exclude":null,"link_titles":null,"theme":"dark-square-blue","logotype":"text","sitename":"S","slogan":"","logoimage":"","enable_logoimage_sm":"0","logoimage_sm":"","mainlayout":"singer-features-intro","sublayout":"","skip_component_content":["157","158"],"mm_type":"singer","navigation_trigger":"hover","navigation_type":"megamenu","navigation_animation":null,"navigation_animation_duration":"400","mm_config":null,"navigation_collapse_enable":"0","addon_offcanvas_enable":"1","addon_offcanvas_effect":"off-canvas-effect-4","snippet_open_head":null,"snippet_close_head":null,"snippet_open_body":null,"snippet_close_body":null,"snippet_debug":"0","theme_extras_com_easyblog":["-1"]}'),
(15, 'ja_resume', 0, '0', 'ja_resume - Home - Model', '{"logolink":"page","logolink_id":"170","t3_template":"1","devmode":"0","themermode":"1","legacy_css":"1","responsive":"1","non_responsive_width":"970px","build_rtl":"0","t3-assets":"t3-assets","t3-rmvlogo":"1","minify":"1","minify_js":"1","minify_js_tool":"jsmin","minify_exclude":null,"link_titles":null,"theme":"light-circle-cyan","logotype":"text","sitename":"sw","slogan":"","logoimage":"","enable_logoimage_sm":"0","logoimage_sm":"","mainlayout":"model-features-intro","sublayout":"","skip_component_content":["151","101","106","152"],"mm_type":"model","navigation_trigger":"hover","navigation_type":"megamenu","navigation_animation":null,"navigation_animation_duration":"400","mm_config":null,"navigation_collapse_enable":"0","addon_offcanvas_enable":"1","addon_offcanvas_effect":"off-canvas-effect-4","snippet_open_head":null,"snippet_close_head":null,"snippet_open_body":null,"snippet_close_body":null,"snippet_debug":"0","theme_extras_com_easyblog":["-1"]}'),
(16, 'ja_resume', 0, '0', 'ja_resume - Home - Blogger', '{"logolink":"page","logolink_id":"173","t3_template":"1","devmode":"0","themermode":"1","legacy_css":"1","responsive":"1","non_responsive_width":"970px","build_rtl":"0","t3-assets":"t3-assets","t3-rmvlogo":"1","minify":"1","minify_js":"1","minify_js_tool":"jsmin","minify_exclude":null,"link_titles":null,"theme":"dark-triangular-yellow","logotype":"text","sitename":"bg","slogan":"","logoimage":"","enable_logoimage_sm":"0","logoimage_sm":"","mainlayout":"blogger-features-intro","sublayout":"","skip_component_content":["173","174"],"mm_type":"blogger","navigation_trigger":"hover","navigation_type":"megamenu","navigation_animation":null,"navigation_animation_duration":"400","mm_config":null,"navigation_collapse_enable":"0","addon_offcanvas_enable":"1","addon_offcanvas_effect":"off-canvas-effect-4","snippet_open_head":null,"snippet_close_head":null,"snippet_open_body":null,"snippet_close_body":null,"snippet_debug":"0","theme_extras_com_easyblog":["-1"]}');

DROP TABLE IF EXISTS `#__ucm_base`;
CREATE TABLE `#__ucm_base` (
  `ucm_id` int(10) unsigned NOT NULL,
  `ucm_item_id` int(10) NOT NULL,
  `ucm_type_id` int(11) NOT NULL,
  `ucm_language_id` int(11) NOT NULL,
  PRIMARY KEY (`ucm_id`),
  KEY `idx_ucm_item_id` (`ucm_item_id`),
  KEY `idx_ucm_type_id` (`ucm_type_id`),
  KEY `idx_ucm_language_id` (`ucm_language_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `#__ucm_content`;
CREATE TABLE `#__ucm_content` (
  `core_content_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `core_type_alias` varchar(400) NOT NULL DEFAULT '' COMMENT 'FK to the content types table',
  `core_title` varchar(400) NOT NULL DEFAULT '',
  `core_alias` varchar(400) binary NOT NULL DEFAULT '',
  `core_body` mediumtext NOT NULL,
  `core_state` tinyint(1) NOT NULL DEFAULT 0,
  `core_checked_out_time` varchar(255) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `core_checked_out_user_id` int(10) unsigned NOT NULL DEFAULT 0,
  `core_access` int(10) unsigned NOT NULL DEFAULT 0,
  `core_params` text NOT NULL,
  `core_featured` tinyint(4) unsigned NOT NULL DEFAULT 0,
  `core_metadata` varchar(2048) NOT NULL DEFAULT '' COMMENT 'JSON encoded metadata properties.',
  `core_created_user_id` int(10) unsigned NOT NULL DEFAULT 0,
  `core_created_by_alias` varchar(255) NOT NULL DEFAULT '',
  `core_created_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `core_modified_user_id` int(10) unsigned NOT NULL DEFAULT 0 COMMENT 'Most recent user that modified',
  `core_modified_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `core_language` char(7) NOT NULL DEFAULT '',
  `core_publish_up` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `core_publish_down` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `core_content_item_id` int(10) unsigned NOT NULL DEFAULT 0 COMMENT 'ID from the individual type table',
  `asset_id` int(10) unsigned NOT NULL DEFAULT 0 COMMENT 'FK to the #__assets table.',
  `core_images` text NOT NULL,
  `core_urls` text NOT NULL,
  `core_hits` int(10) unsigned NOT NULL DEFAULT 0,
  `core_version` int(10) unsigned NOT NULL DEFAULT 1,
  `core_ordering` int(11) NOT NULL DEFAULT 0,
  `core_metakey` text NOT NULL,
  `core_metadesc` text NOT NULL,
  `core_catid` int(10) unsigned NOT NULL DEFAULT 0,
  `core_xreference` varchar(50) NOT NULL DEFAULT '' COMMENT 'A reference to enable linkages to external data sets.',
  `core_type_id` int(10) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`core_content_id`),
  KEY `tag_idx` (`core_state`,`core_access`),
  KEY `idx_access` (`core_access`),
  KEY `idx_alias` (`core_alias`(100)),
  KEY `idx_language` (`core_language`),
  KEY `idx_title` (`core_title`(100)),
  KEY `idx_modified_time` (`core_modified_time`),
  KEY `idx_created_time` (`core_created_time`),
  KEY `idx_content_type` (`core_type_alias`(100)),
  KEY `idx_core_modified_user_id` (`core_modified_user_id`),
  KEY `idx_core_checked_out_user_id` (`core_checked_out_user_id`),
  KEY `idx_core_created_user_id` (`core_created_user_id`),
  KEY `idx_core_type_id` (`core_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 COMMENT='Contains core content data in name spaced fields' DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `#__ucm_history`;
CREATE TABLE `#__ucm_history` (
  `version_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ucm_item_id` int(10) unsigned NOT NULL,
  `ucm_type_id` int(10) unsigned NOT NULL,
  `version_note` varchar(255) NOT NULL DEFAULT '' COMMENT 'Optional version name',
  `save_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `editor_user_id` int(10) unsigned NOT NULL DEFAULT 0,
  `character_count` int(10) unsigned NOT NULL DEFAULT 0 COMMENT 'Number of characters in this version.',
  `sha1_hash` varchar(50) NOT NULL DEFAULT '' COMMENT 'SHA1 hash of the version_data column.',
  `version_data` mediumtext NOT NULL COMMENT 'json-encoded string of version data',
  `keep_forever` tinyint(4) NOT NULL DEFAULT 0 COMMENT '0=auto delete; 1=keep',
  PRIMARY KEY (`version_id`),
  KEY `idx_ucm_item_id` (`ucm_type_id`,`ucm_item_id`),
  KEY `idx_save_date` (`save_date`)
) ENGINE=InnoDB AUTO_INCREMENT=852 DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `#__update_sites`;
CREATE TABLE `#__update_sites` (
  `update_site_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT '',
  `type` varchar(20) DEFAULT '',
  `location` text NOT NULL,
  `enabled` int(11) DEFAULT 0,
  `last_check_timestamp` bigint(20) DEFAULT 0,
  `extra_query` varchar(1000) DEFAULT '',
  PRIMARY KEY (`update_site_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 COMMENT='Update Sites' DEFAULT CHARSET=utf8;

INSERT INTO `#__update_sites` (`update_site_id`, `name`, `type`, `location`, `enabled`, `last_check_timestamp`, `extra_query`) VALUES
(1, 'Joomla! Core', 'collection', 'https://update.joomla.org/core/list.xml', 1, 0, ''),
(7, '', 'collection', 'http://update.joomlart.com/service/tracking/list.xml', 1, 1499681968, ''),
(8, 'Joomla! Update Component Update Site', 'extension', 'https://update.joomla.org/core/extensions/com_joomlaupdate.xml', 1, 1499682000, ''),
(9, 'Accredited Joomla! Translations', 'collection', 'https://update.joomla.org/language/translationlist_3.xml', 1, 1499681972, '');

DROP TABLE IF EXISTS `#__update_sites_extensions`;
CREATE TABLE `#__update_sites_extensions` (
  `update_site_id` int(11) NOT NULL DEFAULT 0,
  `extension_id` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`update_site_id`,`extension_id`)
) ENGINE=InnoDB COMMENT='Links extensions to update sites' DEFAULT CHARSET=utf8;

INSERT INTO `#__update_sites_extensions` (`update_site_id`, `extension_id`) VALUES
(1, 700),
(2, 700),
(3, 600),
(7, 10000),
(7, 10003),
(7, 10005),
(7, 10041),
(8, 28),
(9, 802);
INSERT IGNORE INTO `#__update_sites_extensions` VALUES
(1, 700),
(2, 700),
(3, 600);

DROP TABLE IF EXISTS `#__updates`;
CREATE TABLE `#__updates` (
  `update_id` int(11) NOT NULL AUTO_INCREMENT,
  `update_site_id` int(11) DEFAULT 0,
  `extension_id` int(11) DEFAULT 0,
  `name` varchar(100) DEFAULT '',
  `description` text NOT NULL,
  `element` varchar(100) DEFAULT '',
  `type` varchar(20) DEFAULT '',
  `folder` varchar(20) DEFAULT '',
  `client_id` tinyint(3) DEFAULT 0,
  `version` varchar(32) DEFAULT '',
  `data` text NOT NULL,
  `detailsurl` text NOT NULL,
  `infourl` text NOT NULL,
  `extra_query` varchar(1000) DEFAULT '',
  PRIMARY KEY (`update_id`)
) ENGINE=InnoDB AUTO_INCREMENT=413 COMMENT='Available Updates' DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `#__user_keys`;
CREATE TABLE `#__user_keys` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` varchar(150) NOT NULL,
  `token` varchar(255) NOT NULL,
  `series` varchar(191) NOT NULL,
  `invalid` tinyint(4) NOT NULL,
  `time` varchar(200) NOT NULL,
  `uastring` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `series` (`series`),
  UNIQUE KEY `series_2` (`series`),
  UNIQUE KEY `series_3` (`series`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `#__user_notes`;
CREATE TABLE `#__user_notes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL DEFAULT 0,
  `catid` int(10) unsigned NOT NULL DEFAULT 0,
  `subject` varchar(100) NOT NULL DEFAULT '',
  `body` text NOT NULL,
  `state` tinyint(3) NOT NULL DEFAULT 0,
  `checked_out` int(10) unsigned NOT NULL DEFAULT 0,
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_user_id` int(10) unsigned NOT NULL DEFAULT 0,
  `created_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_user_id` int(10) unsigned NOT NULL,
  `modified_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `review_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_up` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `idx_user_id` (`user_id`),
  KEY `idx_category_id` (`catid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `#__user_profiles`;
CREATE TABLE `#__user_profiles` (
  `user_id` int(11) NOT NULL,
  `profile_key` varchar(100) NOT NULL,
  `profile_value` text NOT NULL,
  `ordering` int(11) NOT NULL DEFAULT 0,
  UNIQUE KEY `idx_user_id_profile_key` (`user_id`,`profile_key`)
) ENGINE=InnoDB COMMENT='Simple user profile storage table' DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `#__user_usergroup_map`;
CREATE TABLE `#__user_usergroup_map` (
  `user_id` int(10) unsigned NOT NULL DEFAULT 0 COMMENT 'Foreign Key to #__users.id',
  `group_id` int(10) unsigned NOT NULL DEFAULT 0 COMMENT 'Foreign Key to #__usergroups.id',
  PRIMARY KEY (`user_id`,`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `#__usergroups`;
CREATE TABLE `#__usergroups` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Primary Key',
  `parent_id` int(10) unsigned NOT NULL DEFAULT 0 COMMENT 'Adjacency List Reference Id',
  `lft` int(11) NOT NULL DEFAULT 0 COMMENT 'Nested set lft.',
  `rgt` int(11) NOT NULL DEFAULT 0 COMMENT 'Nested set rgt.',
  `title` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_usergroup_parent_title_lookup` (`parent_id`,`title`),
  KEY `idx_usergroup_title_lookup` (`title`),
  KEY `idx_usergroup_adjacency_lookup` (`parent_id`),
  KEY `idx_usergroup_nested_set_lookup` (`lft`,`rgt`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

INSERT INTO `#__usergroups` (`id`, `parent_id`, `lft`, `rgt`, `title`) VALUES
(1, 0, 1, 18, 'Public'),
(2, 1, 8, 15, 'Registered'),
(3, 2, 9, 14, 'Author'),
(4, 3, 10, 13, 'Editor'),
(5, 4, 11, 12, 'Publisher'),
(6, 1, 4, 7, 'Manager'),
(7, 6, 5, 6, 'Administrator'),
(8, 1, 16, 17, 'Super Users'),
(9, 1, 2, 3, 'Guest');

DROP TABLE IF EXISTS `#__users`;
CREATE TABLE `#__users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(400) NOT NULL DEFAULT '',
  `username` varchar(150) NOT NULL DEFAULT '',
  `email` varchar(100) NOT NULL DEFAULT '',
  `password` varchar(100) NOT NULL DEFAULT '',
  `block` tinyint(4) NOT NULL DEFAULT 0,
  `sendEmail` tinyint(4) DEFAULT 0,
  `registerDate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `lastvisitDate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `activation` varchar(100) NOT NULL DEFAULT '',
  `params` text NOT NULL,
  `lastResetTime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Date of last password reset',
  `resetCount` int(11) NOT NULL DEFAULT 0 COMMENT 'Count of password resets since lastResetTime',
  `otpKey` varchar(1000) NOT NULL DEFAULT '' COMMENT 'Two factor authentication encrypted keys',
  `otep` varchar(1000) NOT NULL DEFAULT '' COMMENT 'One time emergency passwords',
  `requireReset` tinyint(4) NOT NULL DEFAULT 0 COMMENT 'Require user to reset password on next login',
  PRIMARY KEY (`id`),
  KEY `idx_name` (`name`(100)),
  KEY `idx_block` (`block`),
  KEY `username` (`username`),
  KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `#__utf8_conversion`;
CREATE TABLE `#__utf8_conversion` (
  `converted` tinyint(4) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `#__viewlevels`;
CREATE TABLE `#__viewlevels` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Primary Key',
  `title` varchar(100) NOT NULL DEFAULT '',
  `ordering` int(11) NOT NULL DEFAULT 0,
  `rules` varchar(5120) NOT NULL COMMENT 'JSON encoded access control.',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_assetgroup_title_lookup` (`title`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

INSERT INTO `#__viewlevels` (`id`, `title`, `ordering`, `rules`) VALUES
(1, 'Public', 0, '[1]'),
(2, 'Registered', 2, '[6,2,8]'),
(3, 'Special', 3, '[6,3,8]'),
(5, 'Guest', 1, '[9]'),
(6, 'Super Users', 4, '[8]');


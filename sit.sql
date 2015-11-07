-- phpMyAdmin SQL Dump
-- version 3.5.4
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jan 22, 2013 at 02:24 PM
-- Server version: 5.5.16
-- PHP Version: 5.3.8

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `sit`
--

-- --------------------------------------------------------

--
-- Table structure for table `announcement`
--

CREATE TABLE IF NOT EXISTS `announcement` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lesson` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `edate` date NOT NULL DEFAULT '0000-00-00',
  `eclass` tinytext COLLATE utf32_unicode_ci NOT NULL,
  `rno` varchar(255) COLLATE utf32_unicode_ci NOT NULL,
  `etime` time NOT NULL DEFAULT '00:00:00',
  `teachers` varchar(255) COLLATE utf32_unicode_ci NOT NULL,
  `uid` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf32 COLLATE=utf32_unicode_ci AUTO_INCREMENT=7 ;

--
-- Dumping data for table `announcement`
--

INSERT INTO `announcement` (`id`, `lesson`, `edate`, `eclass`, `rno`, `etime`, `teachers`, `uid`) VALUES
(1, 'Programming language C', '2013-01-16', 'IT-3', '123', '09:00:00', ' Y.Kevin H.Richard', 1),
(3, 'Web Programming', '0000-00-00', 'IT-3', '107, 203 ', '10:00:00', ' Y.Kevin', 1),
(5, 'Lesson Select', '2013-01-16', 'All Class', '115, 108, 109, 123', '14:00:00', ' H.Richard', 1),
(6, 'Web Advanced', '2013-01-15', 'IT-4', '114', '14:00:00', ' Y.Kevin', 3);

-- --------------------------------------------------------

--
-- Table structure for table `event`
--

CREATE TABLE IF NOT EXISTS `event` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `etime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `img_url` varchar(255) COLLATE utf32_unicode_ci NOT NULL,
  `content` mediumtext COLLATE utf32_unicode_ci NOT NULL,
  `place` varchar(255) COLLATE utf32_unicode_ci NOT NULL,
  `tag` varchar(255) COLLATE utf32_unicode_ci NOT NULL,
  `contact` varchar(255) COLLATE utf32_unicode_ci NOT NULL,
  `audience` varchar(255) COLLATE utf32_unicode_ci NOT NULL,
  `uid` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf32_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf32 COLLATE=utf32_unicode_ci AUTO_INCREMENT=6 ;

--
-- Dumping data for table `event`
--

INSERT INTO `event` (`id`, `etime`, `img_url`, `content`, `place`, `tag`, `contact`, `audience`, `uid`, `title`) VALUES
(1, '2013-01-23 11:35:00', '', '“City Beneath the City,” a contemporary art exhibition exploring the intersections between art and archaeology, opens on January 11, 2013 at the Stanford Archaeology Center, Stanford University. The exhibition consists of artistic displays of artifacts from San Jose’s first Chinese community, the Market Street Chinatown, which was destroyed in an arson fire on May 4, 1887. Through Rene Yung’s sensitive design, “City Beneath the City” explores the historical tensions that underlie today’s Silicon Valley.\r\n\r\nExhibition Hours:\r\nJanuary 11, 2013 to April 30, 2013\r\nMonday through Thursday 8:30 AM to 5:30 PM\r\nFriday 8:30 AM to 5:00 PM\r\n\r\nFunding and support for this installation of City Beneath the City was generously provided by Stanford University, including the Stanford Ar-chaeology Center, the Department of Anthropology, the Vice Provost for Undergraduate Education''s curricular initiative, “Engaging the Arts,” the Program on Asian American Studies, the Center for Compar-ative Studies of Race and Ethnicity, the Program on Urban Studies, the Office of the Senior Associate Dean of the Social Sciences, and the Stanford Institute for Creativity and the Arts.', 'Stanford Archaeology Center  Building 500  488 Escondido Mall  Stanford, CA 94305', 'exhibition, arts, visual-arts', '(760) 317-6383', 'General Public, Faculty/Staff, Students, Alumni/ Friends', 1, 'Art exhibition: City Beneath the City @ Stanford Archaeology Center'),
(3, '2013-01-15 05:15:00', '', '<em style="color: rgb(0, 0, 0); font-family: Arial, Helvetica, san-serif; font-size: small; line-height: normal;">Abstract</em><span style="color: rgb(0, 0, 0); font-family: Arial, Helvetica, san-serif; font-size: small; line-height: normal;">:&nbsp; The philosopher Peter Singer compares the way most of us live to seeing a child drowning in a shallow pond and declining to save him so as not to muddy our clothes. Even if we don’t see a particular child in danger, if we spend two hundred dollars on shoes that could have bought life-saving medicine, we’re still responsible for a death. Most people either don’t believe this or can’t imagine what their lives would look like if they did; this talk will tell the story of a couple of young utilitarians who do believe it and live their lives accordingly.</span><br style="color: rgb(0, 0, 0); font-family: Arial, Helvetica, san-serif; font-size: small; line-height: normal;"><br style="color: rgb(0, 0, 0); font-family: Arial, Helvetica, san-serif; font-size: small; line-height: normal;"><span style="color: rgb(0, 0, 0); font-family: Arial, Helvetica, san-serif; font-size: small; line-height: normal;">Much contemporary thinking about humans, from biology to the social sciences to fiction, assumes that we’re essentially selfish; suspicion of – or contempt for — virtue is a hallmark of modernity. Saintly people are thought to be unnatural and constricted. But renunciation can be more interesting than indulgence, and a disciplined life more interesting than a desultory one. They make ordinary existence seem flabby, haphazard, and gluttonous.</span>', 'Cemex Auditorium, Knight Management Center', 'lecture, arts, public-service, international, humanities', '650-723-0997', 'General Public, Faculty/Staff, Students, Alumni/Friends, Members', 1, 'MacFarquhar (writer, The New Yorker)'),
(5, '2013-01-23 06:25:00', '', '<p style="color: rgb(0, 0, 0); font-family: Arial, Helvetica, san-serif; font-size: small; line-height: normal;"><strong>John Dornenburg</strong>, viola da gamba, and Yuko Tanaka, harpsichord, perform works by Diego Ortiz, Girolamo Dalla, Girolamo Frescobaldi, François Couperin, August Kühnel, and Johann Sebastian Bach.</p>', 'Memorial Church Side Chapel', 'performance, arts, music', '(650) 723-3811', 'General Public, Faculty/Staff, Students, Alumni/Friends, Members', 1, 'John Dornenburg and Yuko Tanaka: Music for Viola da gamba and Harpsichord');

-- --------------------------------------------------------

--
-- Table structure for table `news`
--

CREATE TABLE IF NOT EXISTS `news` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf32_unicode_ci NOT NULL,
  `img_url` varchar(255) COLLATE utf32_unicode_ci DEFAULT NULL,
  `content` text COLLATE utf32_unicode_ci NOT NULL,
  `etime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `readNo` int(11) NOT NULL,
  `type` varchar(255) COLLATE utf32_unicode_ci NOT NULL,
  `uid` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf32 COLLATE=utf32_unicode_ci AUTO_INCREMENT=31 ;

--
-- Dumping data for table `news`
--

INSERT INTO `news` (`id`, `title`, `img_url`, `content`, `etime`, `readNo`, `type`, `uid`) VALUES
(9, 'After Fukushima', NULL, 'In the 18 months since the disaster at the Fukushima Daiichi nuclear power plant following an earthquake and tsunami, as Japan''s other nuclear reactors shut for routine maintenance, popular opposition kept them from restarting. The country entered the summer of 2012 with all its nuclear generators shuttered. With a fourth of its pre-Fukushima power supply gone, blackouts were expected, especially in the country''s western region.Surprisingly, that did not happen. The electric utilities got through the air-conditioning season primarily because consumers sacrificed their comfort, but luck also played a role, according to Toshiya Okamura, an executive with&nbsp;<a href="http://www.tokyo-gas.co.jp/index_e.html" style="padding: 0px; margin: 0px; outline: 0px; font-style: inherit; vertical-align: baseline; color: rgb(102, 51, 51); text-decoration: underline; border: none !important;">Tokyo Gas Company</a>&nbsp;and a visiting scholar at Stanford&nbsp;', '2013-01-09 15:47:07', 0, '3', 1),
(10, 'Fish story lands', NULL, 'RALEIGH, N.C. (AP) — About four hours after the fishing charter boat&nbsp;<span class="yshortcuts cs4-ndcor" id="lw_1357669325_5" style="cursor: pointer;">Citation</span>&nbsp;left dock on the Outer Banks to compete in one of the country''s richest deep-sea fishing tournaments, crewmembers were in the fight of their lives. Something huge was hooked, but it was invisible to human sight as it dove for the ocean bottom about 27 miles off the North Carolina coast. Five hours later they hauled up a monster, an 883-pound, 14-foot-long blue marlin. They knew the silvery-blue torpedo of muscle bigger than a bear would mean a huge payday in the June 2010 Big Rock Blue Marlin Tournament when they recorded their catch in coastal Morehead City."When we finally saw it we couldn''t believe it," the Citation''s captain, Eric Holmes of Buxton, said at the time. "To catch a fish this big ... it''s something. It really is. We got lucky and it''s good to be lucky."But their luck soured. The boat''s owners landed in a fight for the $910,000 in prize money that continued Tuesday with arguments to North Carolina''s Supreme Court.', '2013-01-09 15:50:52', 0, '3', 1),
(12, 'We are deeply honored', NULL, '<p style="padding: 0px; margin-bottom: 1.25em; border: 0px; outline: 0px; font-size: 12px; vertical-align: baseline; line-height: 1.5em; color: rgb(63, 60, 48); font-family: Verdana, Arial, Helvetica, FreeSans, sans-serif; background-color: rgb(255, 255, 255);">Ban was born in 1944 in the Republic of Korea, and he served for 37 years with the ROK Foreign Ministry, in roles including minister of foreign affairs and trade, foreign policy adviser to the president and chief national security adviser to the president. He took office as the UN secretary-general in January 2007 and was re-elected for a second term by the UN General Assembly in June 2011. Ban will serve as secretary-general until December 2016.</p><p style="padding: 0px; margin-bottom: 1.25em; border: 0px; outline: 0px; font-size: 12px; vertical-align: baseline; line-height: 1.5em; color: rgb(63, 60, 48); font-family: Verdana, Arial, Helvetica, FreeSans, sans-serif; background-color: rgb(255, 255, 255);">"We are deeply honored to have UN Secretary-General Ban Ki-moon visit Stanford," said Gi-Wook Shin, a professor of sociology and director of the&nbsp;<a href="http://aparc.stanford.edu/" style="padding: 0px; margin: 0px; outline: 0px; font-style: inherit; vertical-align: baseline; color: rgb(102, 51, 51); text-decoration: underline; border: none !important;">Walter H. Shorenstein Asia-Pacific Research Center</a>&nbsp;(Shorenstein APARC). "There are few people who understand global trends and dynamics more deeply than he does."</p><p style="padding: 0px; margin-bottom: 1.25em; border: 0px; outline: 0px; font-size: 12px; vertical-align: baseline; line-height: 1.5em; color: rgb(63, 60, 48); font-family: Verdana, Arial, Helvetica, FreeSans, sans-serif; background-color: rgb(255, 255, 255);">Shorenstein APARC and the Freeman Spogli Institute for International Studies are co-sponsoring the event. Ban''s talk, part of the&nbsp;<a href="http://aparc.stanford.edu/events/series/asiapacific_leaders_forum/" style="padding: 0px; margin: 0px; outline: 0px; font-style: inherit; vertical-align: baseline; color: rgb(102, 51, 51); text-decoration: underline; border: none !important;">Asia-Pacific Leaders Forum</a>, will kick off a series of activities commemorating Shorenstein APARC''s 30th anniversary. Founded in 2005, the Asia-Pacific Leaders Forum regularly convenes senior leaders from across Asia and the Pacific to exchange ideas on current political, economic and social dynamics in the region.</p>', '2013-01-12 02:57:43', 0, '3', 1),
(13, 'Online trove of university photographs keeps growing  ', 'sallie_snowman.jpg', '<p style="padding: 0px; margin-bottom: 1.25em; border: 0px; outline: 0px; font-size: 12px; vertical-align: baseline; line-height: 1.5em; color: rgb(63, 60, 48); font-family: Verdana, Arial, Helvetica, FreeSans, sans-serif; background-color: rgb(255, 255, 255);">Nothing says "winter" like a snowman, so when Stanford University Libraries needed an image to illustrate an announcement about its winter break schedule, Kelly Fields used a black-and-white photo of a snowman in White Plaza.</p><p style="padding: 0px; margin-bottom: 1.25em; border: 0px; outline: 0px; font-size: 12px; vertical-align: baseline; line-height: 1.5em; color: rgb(63, 60, 48); font-family: Verdana, Arial, Helvetica, FreeSans, sans-serif; background-color: rgb(255, 255, 255);">It''s one of the many images that Stanford University Libraries has unearthed in the&nbsp;<a href="https://sallie.stanford.edu/WebModule/" style="padding: 0px; margin: 0px; outline: 0px; font-style: inherit; vertical-align: baseline; color: rgb(102, 51, 51); text-decoration: underline; border: none !important;">Stanford ALL-Image Exchange</a>, best known as SALLIE, the university''s online photo library. Fields, who oversees the features section on the libraries'' home page and articles on its news page, said SALLIE has made it easier to add images to web pages.</p><p style="padding: 0px; margin-bottom: 1.25em; border: 0px; outline: 0px; font-size: 12px; vertical-align: baseline; line-height: 1.5em; color: rgb(63, 60, 48); font-family: Verdana, Arial, Helvetica, FreeSans, sans-serif; background-color: rgb(255, 255, 255);">"It has reduced the need for creating last-minute graphics, and the process of accessing and downloading the graphics is easy," she said.</p><p style="padding: 0px; margin-bottom: 1.25em; border: 0px; outline: 0px; font-size: 12px; vertical-align: baseline; line-height: 1.5em; color: rgb(63, 60, 48); font-family: Verdana, Arial, Helvetica, FreeSans, sans-serif; background-color: rgb(255, 255, 255);">Stanford University Libraries is one of two-dozen campus units that are using SALLIE to manage their communications-related digital assets – primarily photographs – since the university<a href="http://news.stanford.edu/news/2012/february/sallie-digital-assets-020712.html" style="padding: 0px; margin: 0px; outline: 0px; font-style: inherit; vertical-align: baseline; color: rgb(102, 51, 51); text-decoration: underline; border: none !important;">established</a>&nbsp;the database in early 2012. SALLIE also has become a repository for logos, illustrations – such as architectural renderings and maps – and videos.</p>', '2013-01-12 03:15:09', 0, '3', 1),
(18, 'Structure', NULL, '<p style="margin-top: 15px; margin-bottom: 15px; padding: 0px; border: 0px; outline: 0px; background-color: transparent; line-height: 21px;"><p style="margin-top: 15px; margin-bottom: 15px; padding: 0px; border: 0px; outline: 0px; background-color: transparent; color: rgb(102, 102, 102); font-family: Arial, Helvetica, sans-serif;"><strong style="margin: 0px; padding: 0px; border: 0px; outline: 0px; background-color: transparent;"><font size="3">Эрдмийн зөвлөл</font></strong></p><p style="margin-top: 15px; margin-bottom: 15px; padding: 0px; border: 0px; outline: 0px; background-color: transparent; color: rgb(102, 102, 102); font-family: Arial, Helvetica, sans-serif;"><font size="3">Эрдмийн зөвлөлийн бүрэлдэхүүнд сургуулийн захирал, профессор багш нар орно. Зөвлөлийг захирал удирдах бөгөөд салбар сургуулийн хэмжээнд шийдвэр гаргах хамгийн дээд шатны зөвлөл юм.&nbsp;<a href="http://sit.num.edu.mn/index.php?option=com_content&amp;view=article&amp;id=108%3A2009-11-27-06-38-38&amp;catid=47&amp;Itemid=108" class="readon" style="margin: 0px; padding: 2px 5px; border: 0px; outline: 0px; background-color: transparent; color: rgb(204, 204, 204); border-top-left-radius: 3px; border-top-right-radius: 3px; border-bottom-right-radius: 3px; border-bottom-left-radius: 3px; text-align: center;">Дэлгэрэнгүй...</a></font></p><p style="margin-top: 15px; margin-bottom: 15px; padding: 0px; border: 0px; outline: 0px; background-color: transparent; color: rgb(102, 102, 102); font-family: Arial, Helvetica, sans-serif;"><strong style="margin: 0px; padding: 0px; border: 0px; outline: 0px; background-color: transparent;"><font size="3">Захиргааны зөвлөл</font></strong></p><p style="margin-top: 15px; margin-bottom: 15px; padding: 0px; border: 0px; outline: 0px; background-color: transparent; color: rgb(102, 102, 102); font-family: Arial, Helvetica, sans-serif;"><font size="3">Захиргааны зөвлөлийн бүрэлдэхүүнд сургуулийн захирал, сургалтын албаны эрхлэгч, тэнхимийн эрхлэгч нараас гадна сургуулийн эрдэмтэн нарийн бичгийн дарга орно. Захирал зөвлөлийг удирдана.&nbsp;<a href="http://sit.num.edu.mn/index.php?option=com_content&amp;view=article&amp;id=106%3A2009-11-27-06-38-38&amp;catid=47&amp;Itemid=108" class="readon" style="margin: 0px; padding: 2px 5px; border: 0px; outline: 0px; background-color: transparent; color: rgb(204, 204, 204); border-top-left-radius: 3px; border-top-right-radius: 3px; border-bottom-right-radius: 3px; border-bottom-left-radius: 3px; text-align: center;">Дэлгэрэнгүй...</a></font></p><p style="margin-top: 15px; margin-bottom: 15px; padding: 0px; border: 0px; outline: 0px; background-color: transparent; color: rgb(102, 102, 102); font-family: Arial, Helvetica, sans-serif;"><font size="3">﻿<strong style="margin: 0px; padding: 0px; border: 0px; outline: 0px; background-color: transparent;">Сургалтын алба</strong></font></p><p style="margin-top: 15px; margin-bottom: 15px; padding: 0px; border: 0px; outline: 0px; background-color: transparent; color: rgb(102, 102, 102); font-family: Arial, Helvetica, sans-serif;"><font size="3">Сургалттай холбоотой бүх үйл ажиллагааг зохицуулж байдаг.&nbsp;<a href="http://sit.num.edu.mn/index.php?option=com_content&amp;view=article&amp;id=107%3A2009-11-27-06-38-38&amp;catid=47&amp;Itemid=108" class="readon" style="margin: 0px; padding: 2px 5px; border: 0px; outline: 0px; background-color: transparent; color: rgb(204, 204, 204); border-top-left-radius: 3px; border-top-right-radius: 3px; border-bottom-right-radius: 3px; border-bottom-left-radius: 3px; text-align: center;">Дэлгэрэнгүй...</a></font></p><font size="3"><strong style="margin: 0px; padding: 0px; border: 0px; outline: 0px; background-color: transparent; color: rgb(102, 102, 102); font-family: Arial, Helvetica, sans-serif;">Оюутны бие даан суралцах төв<br></strong><span style="color: rgb(102, 102, 102); font-family: Arial, Helvetica, sans-serif;"></span></font><p style="margin-top: 15px; margin-bottom: 15px; padding: 0px; border: 0px; outline: 0px; background-color: transparent; color: rgb(102, 102, 102); font-family: Arial, Helvetica, sans-serif;"><font size="3">Оюутны бие даан суралцах төв нь оюутнуудыг бие даан суралцахад&nbsp; туслах, багш оюутны холбоог ойртуулан бэхжүүлэх, багш оюутныг&nbsp; ном, тогтмол хэвлэл, мэдээллээр үйлчлэх, мэдээлэл суртчилгаа, сургалтын олон талт ажил явуулах зорилготойгоор 2002/2003 оны хичээлийн жилд байгуулагдсан.<a href="http://sit.num.edu.mn/index.php?option=com_content&amp;view=article&amp;id=117%3A2009-11-23-06-43-15&amp;catid=45&amp;Itemid=108" class="readon" style="margin: 0px; padding: 2px 5px; border: 0px; outline: 0px; background-color: transparent; color: rgb(204, 204, 204); border-top-left-radius: 3px; border-top-right-radius: 3px; border-bottom-right-radius: 3px; border-bottom-left-radius: 3px; text-align: center;">Дэлгэрэнгүй...</a></font></p><font size="3"><strong style="margin: 0px; padding: 0px; border: 0px; outline: 0px; background-color: transparent; color: rgb(102, 102, 102); font-family: Arial, Helvetica, sans-serif;">Багшлах бүрэлдэхүүн</strong><br style="color: rgb(102, 102, 102); font-family: Arial, Helvetica, sans-serif;"></font><p style="margin-top: 15px; margin-bottom: 15px; padding: 0px; border: 0px; outline: 0px; background-color: transparent; color: rgb(102, 102, 102); font-family: Arial, Helvetica, sans-serif;"><font size="3">Манай сургуульд одоогийн байдлаар нийт 31 профессор, багш ажиллаж байгаагаас багшлах зэрэглэлээр тэргүүлэх профессор 2, профессор 2, дэд профессор 4, багш 7, дадлагажигч багш 3, сургалтын инженер 13 ажилладаг. Нийт боловсон хүчний 80% нь эрэгтэй, 20% нь эмэгтэй багш нар байна. Эрдмийн зэрэг цолтой багш нарын эзлэх хувь 53%. Солонгос, Япон, Австрали зэрэг орнуудад 8 багш докторантурт, 3 багш магистрантурт суралцаж байна.</font></p></p>', '2013-01-12 13:53:11', 0, '4', 1),
(19, 'History', NULL, '<p style="margin-top: 15px; margin-bottom: 15px; padding: 0px; border: 0px; outline: 0px; font-size: 12px; background-color: transparent; color: rgb(102, 102, 102); font-family: Arial, Helvetica, sans-serif; line-height: 21px;"><p style="margin-top: 15px; margin-bottom: 15px; padding: 0px; border: 0px; outline: 0px; background-color: transparent;">Манай сургуулийн үүсэл МУИС-д радиофизик, радиоэлектроникийн чиглэлийн сургалт 1962 онд явуулж эхэлснээс үүдэлтэй.&nbsp; 1990 онд доктор, дэд профессор Э.Дамдинсүрэн, С.Лодойсамба нарын санаачлагаар Электроникийн ангийг МУИС-ийн радиофизикийн сургалтын материаллаг бааз дээр тулгуурлан нээсэн юм. Улмаар 1994 онд МУИС-ийн Физик электроникийн сургуульд Электроникийн тэнхим байгуулагдаж 2002 онд Мэдээллийн технологийн сургууль болж өргөжсөн.&nbsp;</p><p style="margin-top: 15px; margin-bottom: 15px; padding: 0px; border: 0px; outline: 0px; background-color: transparent;"><strong style="margin: 0px; padding: 0px; border: 0px; outline: 0px; background-color: transparent;">1960-1979 он<br></strong></p><ul style="margin-top: 15px; margin-bottom: 15px; margin-left: 0px; border: 0px; outline: 0px; background-color: transparent; list-style-position: inside; list-style-image: initial;"><li style="margin: 0px; padding: 0px 0px 0px 30px; border: 0px; outline: 0px; background-image: none; line-height: 19px;">1962 онд Физик-математикийн факультетийг байгуулж физикийн ангийг 5 жилийн сургалтанд шилжүүлэв.</li><li style="margin: 0px; padding: 0px 0px 0px 30px; border: 0px; outline: 0px; background-image: none; line-height: 19px;">1963 оноос гадаадын анхны мэргэжилтэн ЗХУ-ын Харьковын Политехникийн дээд сургуулийн декан, дэд доктор, доцент Николай Трофимович Цымбал уригдан ирж 2 хичээлийн жил ажиллав.</li><li style="margin: 0px; padding: 0px 0px 0px 30px; border: 0px; outline: 0px; background-image: none; line-height: 19px;">1964-1965 оны хичээлийн жилийн Хаврын улиралд физикийн III ангийн оюутнуудаас&nbsp;<em style="margin: 0px; padding: 0px; border: 0px; outline: 0px; background-color: transparent;">радио мэргэжлийн бүлэг</em>&nbsp;үүсэв.</li><li style="margin: 0px; padding: 0px 0px 0px 30px; border: 0px; outline: 0px; background-image: none; line-height: 19px;">Н.Т.Цымбалын удирдлага дор анхны 3 лабораторийг байгуулав.</li><li style="margin: 0px; padding: 0px 0px 0px 30px; border: 0px; outline: 0px; background-image: none; line-height: 19px;">1965 оны намраас Москвагийн нисэх хүчний дээд сургуулийн багш дэд доктор, доцент Вадим Леонтович Гостюхин мэргэжилтнээр уригдаж хоёр жил ажиллав.</li><li style="margin: 0px; padding: 0px 0px 0px 30px; border: 0px; outline: 0px; background-image: none; line-height: 19px;">1967 онд радиогруппын анхны 7 оюутан дипломын ажлаа амжилттай хамгаалж сургуулиа төгсөв.</li><li style="margin: 0px; padding: 0px 0px 0px 30px; border: 0px; outline: 0px; background-image: none; line-height: 19px;">1967 оны 9-р сард В.И.Уляновын нэрэмжит Ленинградын холбооны цахилгаан техникийн дээд сургуулийн багш Валерий Александрович Степанов мэргэжилтнээр уригдан ажиллаж радиодолгионы тархалтын лаборатори байгуулав.</li><li style="margin: 0px; padding: 0px 0px 0px 30px; border: 0px; outline: 0px; background-image: none; line-height: 19px;">Багш Л.Дэмбэрэл бие даан "Радио хүлээн авах ба өсгөх байгууламж"-ийн 10 гаруй ажилтай лабораторыг байгуулж, Э.Дамдинсүрэн Импульсийн техникийн лабораторыг гүйцээн бий болгов.</li><li style="margin: 0px; padding: 0px 0px 0px 30px; border: 0px; outline: 0px; background-image: none; line-height: 19px;">Радио физикийн ангийг 1967-1968 оны хичээлийн жилээс эхлэн харилцаа холбооны инженер бэлтгэх анги болгон өөрчлөв.</li><li style="margin: 0px; padding: 0px 0px 0px 30px; border: 0px; outline: 0px; background-image: none; line-height: 19px;">1975 онд Москвагийн эрчим хүч, цахилгаан техникийн дээд сургуулийн багш дэд доктор, дэд профессор Алексей Яковлевич Федоров уригдан ирж 2 жил ажиллахдаа хагас дамжуулагч багажийн лаборатор байгуулав.</li></ul><strong style="margin: 0px; padding: 0px; border: 0px; outline: 0px; background-color: transparent;">1980-1999 он</strong><ul style="margin-top: 15px; margin-bottom: 15px; margin-left: 0px; border: 0px; outline: 0px; background-color: transparent; list-style-position: inside; list-style-image: initial;"><li style="margin: 0px; padding: 0px 0px 0px 30px; border: 0px; outline: 0px; background-image: none; line-height: 19px;">1988 оны 2-р сард МУИС-ийн ректорын 85 тоот тушаалаар Электроникийн эрдэм шинжилгээний лабораторыг (эрхлэгч Э.Дамдинсүрэн) байгуулав.</li><li style="margin: 0px; padding: 0px 0px 0px 30px; border: 0px; outline: 0px; background-image: none; line-height: 19px;">1990 онд доктор, дэд профессор Э.Дамдинсүрэн, С.Лодойсамба нарын санаачлагаар Электроникийн ангийг МУИС-ийн радиофизикийн сургалтын материаллаг бааз дээр тулгуурлан нээв.</li><li style="margin: 0px; padding: 0px 0px 0px 30px; border: 0px; outline: 0px; background-image: none; line-height: 19px;">1992 онд электроникийн сургалт эрдэм шинжилгээний лабораторыг Электроник, программчлалын тэнхим (эрхлэгч С.Лодойсамба), Радиофизикийн тэнхим (эрхлэгч Э.Дамдинсүрэн) болгон зохион байгуулав.</li><li style="margin: 0px; padding: 0px 0px 0px 30px; border: 0px; outline: 0px; background-image: none; line-height: 19px;">1994 оноос дээрх хоёр тэнхмийг нэгтгэж электроникийн тэнхим гэж нэрлээд эрхлэгчээр нь Э.Дамдинсүрэн ажиллаж байв.</li><li style="margin: 0px; padding: 0px 0px 0px 30px; border: 0px; outline: 0px; background-image: none; line-height: 19px;">1997 онд Физик, электроникийн сургууль байгуулагдаж тэнхимийн бүтцийг халж салбарын зохион байгуулалтанд оров.</li><li style="margin: 0px; padding: 0px 0px 0px 30px; border: 0px; outline: 0px; background-image: none; line-height: 19px;">1998 онд багш Ж.Нямжавын санаачлагаар МУИС-ийн хөгжлийн сангийн хөрөнгөөр Conrad фирмийн багаж төхөөрөмжөөр "Элекроникийн лаборатор" босгов.</li><li style="margin: 0px; padding: 0px 0px 0px 30px; border: 0px; outline: 0px; background-image: none; line-height: 19px;">1999 онд сургуулийн хэмжээнд үйл ажиллагаа явуулах Компьтерийн төвийг байгуулж эрхлэгчээр Ж.Нямжавыг томилов.</li></ul><strong style="margin: 0px; padding: 0px; border: 0px; outline: 0px; background-color: transparent;">2000 - 2009 он</strong><ul style="margin-top: 15px; margin-bottom: 15px; margin-left: 0px; border: 0px; outline: 0px; background-color: transparent; list-style-position: inside; list-style-image: initial; line-height: 50px;"><li style="margin: 0px; padding: 0px 0px 0px 30px; border: 0px; outline: 0px; background-image: none; line-height: 19px;">2002 онд Физик электроникийн сургуулийн электроникийн салбарын материаллаг бааз дээр үндэслэн Мэдээллийн технологийн сургууль шинээр байгуулав.</li><li style="margin: 0px; padding: 0px 0px 0px 30px; border: 0px; outline: 0px; background-image: none; line-height: 19px;">2004 онд багш Ж.Нямжавын санаачлагаар МУИС-ийн хөгжлийн сангийн хөрөнгөөр CAD лабораторын суурийг тавив.</li><li style="margin: 0px; padding: 0px 0px 0px 30px; border: 0px; outline: 0px; background-image: none; line-height: 19px;">МУИС-д анхны бизнес нэгж "Уником" төвийг 1994 оны 1-р сард байгуулж жил гаруй ажиллуулахдаа компьютерийн сервис болон Монгол бичгийн програм засах, хэвлэлийн эх бэлтгэх зэрэг ажил хийж байв.</li><li style="margin: 0px; padding: 0px 0px 0px 30px; border: 0px; outline: 0px; background-image: none; line-height: 19px;">Электроникийн эрдэм шинжилгээний лабораторт Монгол хэлний эрдэмтэн хөдөлмөрийн баатар, профессор Г.Дашцэдэнгийн удирдлаган дор проф. Ш.Чоймаа, С.Лодойсамба, Ю.Намсрай, М.Эрдэнэчимэг нар нь Худам монгол бичгийн цахим едитор "СУДАРЧ" хэмээх програм хангамжийг зохион бүтээж үүнийгээ сайжруулж Худам Монгол бичгийн ЮНИКОД фонтыг зохион бүтээж ОУ-ын стандартаар батлуулав.</li><li style="margin: 0px; padding: 0px 0px 0px 30px; border: 0px; outline: 0px; background-image: none; line-height: 19px;">2007 оны 6-р сард Компьютер, хэл шинжлэлийн судалгааны төвийг байгуулав.</li><li style="margin: 0px; padding: 0px 0px 0px 30px; border: 0px; outline: 0px; background-image: none; line-height: 19px;">2007 оны 6 сард БНСУ-ын Улсаны Их Сургуулийн Компьютер, Мэдээллийн Технологийн Сургуультай хамтран зуны сургалтыг МТС дээр зохион байгуулав.</li><li style="margin: 0px; padding: 0px 0px 0px 30px; border: 0px; outline: 0px; background-image: none; line-height: 19px;">2008 оны 8 сард Мобайл ба эмбэддэд технологийн судалгааны төвийг байгуулав.</li></ul></p>', '2013-01-12 13:54:08', 0, '4', 1),
(20, 'Project', NULL, '<p style="margin-top: 15px; margin-bottom: 15px; padding: 0px; border: 0px; outline: 0px; font-size: 12px; background-color: transparent; color: rgb(102, 102, 102); font-family: Arial, Helvetica, sans-serif; line-height: 21px;"><strong style="margin: 0px; padding: 0px; border: 0px; outline: 0px; background-color: transparent;">МОНГОЛ ХЭЛНИЙ ҮГИЙН УТГАЗҮЙН СҮЛЖЭЭГ ҮҮСГЭХ БОЛОМЖ&nbsp;<br>Lexical Semantic Network</strong></p><p style="margin-top: 15px; margin-bottom: 15px; padding: 0px; border: 0px; outline: 0px; font-size: 12px; background-color: transparent; color: rgb(102, 102, 102); font-family: Arial, Helvetica, sans-serif; line-height: 21px;">Монгол хэлний үгийн утгазүйн сүлжээг үүсгэх ажлын (энэхүү ажил нь ганц хүн дангаараа хийх ажил биш бөгөөд маш их цаг, зардал шаардсан ажил) эхлэл суурийг тавих, олон эрдэмтдийг татан оролцуулах, тэдний анхаарлыг хандуулах, Монгол хэлний үгийн утгазүйн сүлжээг (хагас) автоматаар үүсгэх арга зүй, загвар сүлжээ үүсгэх нь төслийн гол зорилго болно.</p><ul style="margin-top: 15px; margin-bottom: 15px; margin-left: 0px; border: 0px; outline: 0px; font-size: 12px; background-color: transparent; list-style: circle inside; color: rgb(102, 102, 102); font-family: Arial, Helvetica, sans-serif; line-height: 21px;"><li style="margin: 0px; padding: 0px 0px 0px 30px; border: 0px; outline: 0px; background-image: none; line-height: 19px;">Ямар эх үүсвэрээс үүсгэх талаар судалгаа</li><li style="margin: 0px; padding: 0px 0px 0px 30px; border: 0px; outline: 0px; background-image: none; line-height: 19px;">Ямар арга замаар үүсгэх: гараар, автоматаар, хагас автоматаар</li><li style="margin: 0px; padding: 0px 0px 0px 30px; border: 0px; outline: 0px; background-image: none; line-height: 19px;">Арга зүйг гаргах</li><li style="margin: 0px; padding: 0px 0px 0px 30px; border: 0px; outline: 0px; background-image: none; line-height: 19px;">Загвар сүлжээг үүсгэх (нэр үгийн хэсэг, 10 үгтэй)</li><li style="margin: 0px; padding: 0px 0px 0px 30px; border: 0px; outline: 0px; background-image: none; line-height: 19px;">Хэрэглээнд турших</li></ul><p style="margin-top: 15px; margin-bottom: 15px; padding: 0px; border: 0px; outline: 0px; font-size: 12px; background-color: transparent; color: rgb(102, 102, 102); font-family: Arial, Helvetica, sans-serif; line-height: 21px;"><strong style="margin: 0px; padding: 0px; border: 0px; outline: 0px; background-color: transparent;">Хугацаа:</strong>&nbsp;2009-04-01 ээс 2010-03-31 хүртэл, 1 жил</p><p style="margin-top: 15px; margin-bottom: 15px; padding: 0px; border: 0px; outline: 0px; font-size: 12px; background-color: transparent; color: rgb(102, 102, 102); font-family: Arial, Helvetica, sans-serif; line-height: 21px;"><strong style="margin: 0px; padding: 0px; border: 0px; outline: 0px; background-color: transparent;">Хүрэх үр дүн</strong></p><ul style="margin-top: 15px; margin-bottom: 15px; margin-left: 0px; border: 0px; outline: 0px; font-size: 12px; background-color: transparent; list-style: circle inside; color: rgb(102, 102, 102); font-family: Arial, Helvetica, sans-serif; line-height: 21px;"><li style="margin: 0px; padding: 0px 0px 0px 30px; border: 0px; outline: 0px; background-image: none; line-height: 19px;">Монгол хэлний Үгийн Утгазүйн Сүлжээний Загвар<ul style="margin-top: 15px; margin-bottom: 15px; margin-left: 40px; border: 0px; outline: 0px; background-color: transparent; list-style: disc inside;"><li style="margin: 0px; padding: 0px 0px 0px 30px; border: 0px; outline: 0px; background-image: none; line-height: 19px;">10 мянган үг бүхий Нэр үгийн сүлжээ</li><li style="margin: 0px; padding: 0px 0px 0px 30px; border: 0px; outline: 0px; background-image: none; line-height: 19px;">Олон хэлний сүлжээнүүдэд холбогдох боломж бүхий</li></ul></li><li style="margin: 0px; padding: 0px 0px 0px 30px; border: 0px; outline: 0px; background-image: none; line-height: 19px;">Монгол хэлний Үгийн Утгазүйн Сүлжээг үр дүнтэйгээр үүсгэх арга зүй</li><li style="margin: 0px; padding: 0px 0px 0px 30px; border: 0px; outline: 0px; background-image: none; line-height: 19px;">Үгийн утгазүйн сүлжээг харах, засах хэрэгслүүд, Browser, Editor Tool</li><li style="margin: 0px; padding: 0px 0px 0px 30px; border: 0px; outline: 0px; background-image: none; line-height: 19px;">Загвар үгийн утгазүйн сүлжээг хэрэглээнд нэвтрүүлэх,<ul style="margin-top: 15px; margin-bottom: 15px; margin-left: 40px; border: 0px; outline: 0px; background-color: transparent; list-style: disc inside;"><li style="margin: 0px; padding: 0px 0px 0px 30px; border: 0px; outline: 0px; background-image: none; line-height: 19px;">Semantic Web</li><li style="margin: 0px; padding: 0px 0px 0px 30px; border: 0px; outline: 0px; background-image: none; line-height: 19px;">Хайлтын систем, Information Retrieval</li><li style="margin: 0px; padding: 0px 0px 0px 30px; border: 0px; outline: 0px; background-image: none; line-height: 19px;">Document clustering, Classification</li></ul></li></ul>', '2013-01-12 14:46:55', 0, '4', 1),
(21, 'Foreign Relation', NULL, 'Coming Soon', '2013-01-12 14:49:07', 0, '4', 1),
(22, 'Bachelor', NULL, '<b>Under consrtuction</b>', '2013-01-12 14:50:08', 0, '4', 1),
(23, 'Master, Doctor', NULL, 'coming soon', '2013-01-12 14:50:08', 0, '4', 1),
(24, 'Mainstream', NULL, 'Under construction', '2013-01-12 14:59:43', 0, '4', 1),
(25, 'Seminar', NULL, '', '2013-01-12 14:59:43', 0, '4', 1),
(26, 'Conference', NULL, 'under construction', '2013-01-12 15:00:42', 0, '4', 1),
(27, 'Scholarship', NULL, 'cs', '2013-01-12 15:00:42', 0, '4', 1),
(28, 'Campus', NULL, 'Under construction', '2013-01-12 15:04:26', 0, '4', 1),
(29, 'Center for Independence', NULL, 'Under construction<div><br></div>', '2013-01-12 15:04:26', 0, '4', 1),
(30, 'Heat-resistant corals provide clues to climate change survival, Stanford researchers say', 'Technology_management_LG_FOC.png', '<p style="padding: 0px; margin-bottom: 1.25em; border: 0px; outline: 0px; font-size: 12px; vertical-align: baseline; line-height: 1.5em; color: rgb(63, 60, 48); font-family: Verdana, Arial, Helvetica, FreeSans, sans-serif; background-color: rgb(255, 255, 255);">In a future shaped by climate change, only the strong – or heat-resistant – will survive. A&nbsp;<a href="http://www.pnas.org/content/early/2013/01/02/1210224110.full.pdf+html" style="padding: 0px; margin: 0px; outline: 0px; font-style: inherit; vertical-align: baseline; color: rgb(102, 51, 51); text-decoration: underline; border: none !important;">study</a>published this week in the&nbsp;<a href="http://www.pnas.org/" style="padding: 0px; margin: 0px; outline: 0px; font-style: inherit; vertical-align: baseline; color: rgb(102, 51, 51); text-decoration: underline; border: none !important;"><em style="padding: 0px; margin: 0px;">Proceedings of the National Academy of Sciences</em></a><em style="padding: 0px; margin: 0px;">&nbsp;</em>opens a window into a genetic process that allows some corals to withstand unusually high temperatures and may hold a key to species survival for organisms around the world.</p><p style="padding: 0px; margin-bottom: 1.25em; border: 0px; outline: 0px; font-size: 12px; vertical-align: baseline; line-height: 1.5em; color: rgb(63, 60, 48); font-family: Verdana, Arial, Helvetica, FreeSans, sans-serif; background-color: rgb(255, 255, 255);">"If we can find populations most likely to resist climate change and map them, then we can protect them," said study co-author&nbsp;<a href="http://woods.stanford.edu/about/woods-faculty/stephen-palumbi" style="padding: 0px; margin: 0px; outline: 0px; font-style: inherit; vertical-align: baseline; color: rgb(102, 51, 51); text-decoration: underline; border: none !important;">Stephen Palumbi</a>, a senior fellow at the&nbsp;<a href="http://woods.stanford.edu/" style="padding: 0px; margin: 0px; outline: 0px; font-style: inherit; vertical-align: baseline; color: rgb(102, 51, 51); text-decoration: underline; border: none !important;">Stanford Woods Institute for the Environment</a>&nbsp;and director of the<a href="http://www-marine.stanford.edu/" style="padding: 0px; margin: 0px; outline: 0px; font-style: inherit; vertical-align: baseline; color: rgb(102, 51, 51); text-decoration: underline; border: none !important;">Hopkins Marine Station</a>. "It''s of paramount importance because climate change is coming."</p>', '2013-01-15 18:30:08', 0, '3', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tageve`
--

CREATE TABLE IF NOT EXISTS `tageve` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tagid` int(11) NOT NULL,
  `eid` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`id`),
  KEY `tagid` (`tagid`),
  KEY `eid` (`eid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tags`
--

CREATE TABLE IF NOT EXISTS `tags` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tag` varchar(255) COLLATE utf32_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `teachan`
--

CREATE TABLE IF NOT EXISTS `teachan` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tid` int(11) NOT NULL,
  `aid` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `tid` (`tid`),
  KEY `aid` (`aid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `teachers`
--

CREATE TABLE IF NOT EXISTS `teachers` (
  `tid` int(11) NOT NULL AUTO_INCREMENT,
  `tname` varchar(255) COLLATE utf32_unicode_ci NOT NULL,
  PRIMARY KEY (`tid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf32 COLLATE=utf32_unicode_ci AUTO_INCREMENT=3 ;

--
-- Dumping data for table `teachers`
--

INSERT INTO `teachers` (`tid`, `tname`) VALUES
(1, 'H.Richard'),
(2, 'Y.Kevin');

-- --------------------------------------------------------

--
-- Table structure for table `thumbnail`
--

CREATE TABLE IF NOT EXISTS `thumbnail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `img_url` varchar(255) COLLATE utf32_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf32_unicode_ci NOT NULL,
  `nid` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `nid` (`nid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) COLLATE utf32_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf32_unicode_ci NOT NULL,
  `mail` varchar(25) COLLATE utf32_unicode_ci NOT NULL,
  `role` varchar(25) COLLATE utf32_unicode_ci NOT NULL,
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf32 COLLATE=utf32_unicode_ci AUTO_INCREMENT=4 ;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`uid`, `username`, `password`, `mail`, `role`) VALUES
(1, 'admin', '1b3ae77a2e06580c8cb57e112ddc4a26', 'admin@yahoo.com', 'admin'),
(2, 'user1', 'D79096188B670C2F81B7001F73801117', 'user1@yahoo.com', 'student'),
(3, 'teacher', 'C1572D05424D0ECB2A65EC6A82AEACBF', 'teacher@gmail.com', 'teacher');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `announcement`
--
ALTER TABLE `announcement`
  ADD CONSTRAINT `announcement_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `user` (`uid`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `event`
--
ALTER TABLE `event`
  ADD CONSTRAINT `event_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `user` (`uid`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `news`
--
ALTER TABLE `news`
  ADD CONSTRAINT `news_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `user` (`uid`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tageve`
--
ALTER TABLE `tageve`
  ADD CONSTRAINT `tageve_ibfk_4` FOREIGN KEY (`tagid`) REFERENCES `tags` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tageve_ibfk_5` FOREIGN KEY (`eid`) REFERENCES `event` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `teachan`
--
ALTER TABLE `teachan`
  ADD CONSTRAINT `teachan_ibfk_1` FOREIGN KEY (`tid`) REFERENCES `teachers` (`tid`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `teachan_ibfk_2` FOREIGN KEY (`aid`) REFERENCES `announcement` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `thumbnail`
--
ALTER TABLE `thumbnail`
  ADD CONSTRAINT `thumbnail_ibfk_1` FOREIGN KEY (`nid`) REFERENCES `news` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

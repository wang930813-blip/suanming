-- phpMyAdmin SQL Dump
-- version 4.4.15.10
-- https://www.phpmyadmin.net
--
-- Host: localhost:3306
-- Generation Time: 2025-12-02 23:48:14
-- 服务器版本： 5.6.51-log
-- PHP Version: 5.6.40

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `2025`
--

-- --------------------------------------------------------

--
-- 表的结构 `ffsm_dsyy`
--

CREATE TABLE IF NOT EXISTS `ffsm_dsyy` (
  `id` int(11) NOT NULL,
  `sorting` int(11) NOT NULL COMMENT '排序',
  `project` varchar(255) NOT NULL COMMENT '项目',
  `teacher` varchar(100) NOT NULL COMMENT '大师名',
  `position` varchar(100) NOT NULL DEFAULT '' COMMENT '职位',
  `money` varchar(20) NOT NULL COMMENT '金钱',
  `title` varchar(255) NOT NULL,
  `images` varchar(255) NOT NULL,
  `centent` text NOT NULL,
  `about` varchar(255) NOT NULL,
  `years` varchar(50) NOT NULL DEFAULT '' COMMENT '从业年限',
  `rating` varchar(10) NOT NULL DEFAULT '5' COMMENT '好评率星级',
  `other_skills` text NOT NULL COMMENT '其他擅长领域'
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `ffsm_dsyy`
--

INSERT INTO `ffsm_dsyy` (`id`, `sorting`, `project`, `teacher`, `position`, `money`, `title`, `images`, `centent`, `about`, `years`, `rating`, `other_skills`) VALUES
(1, 1, '八字', ' 张盛舒1', '', '888', '首席咨询师1', '/dashi/picture/01.png', '张盛舒研究紫微40多年，并结合现代心理学、现代管理学、人际学，是成功将传统命理与现代科技完美结合的第一人。张盛舒运用周易及紫微，发明人工智能"定盘"程序，荣获中国专利。他将中国命理学中的知识和理念去粗取精，在现代社会价值观中重新演绎，是世界第一位破除宿命，强调造命的命理老师。', '', '40+', '5', '紫微、紫微姓名学');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `ffsm_dsyy`
--
ALTER TABLE `ffsm_dsyy`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `ffsm_dsyy`
--
ALTER TABLE `ffsm_dsyy`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

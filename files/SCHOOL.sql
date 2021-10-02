--
-- Table structure for table `STUDENTS`
--

DROP TABLE IF EXISTS `STUDENTS`;
CREATE TABLE `STUDENTS` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `nickname` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Data for table `STUDENTS`
--

INSERT INTO `STUDENTS` VALUES (1, 'Diana Prince', 'Wonder Woman'), (2, 'Bruce Wayne', 'Batman'), (3, 'Jay Garrick', 'The Flash');

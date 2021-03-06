DROP TABLE IF EXISTS search_for;
CREATE TABLE search_for (
  `id` varchar(30) not null,
  `mail` varchar(300) not null,
  `q` varchar(300) not null,
  `dump_period` varchar(10) not null default '%Y-%v',
  `sinceid` varchar(30) not NULL default 0,
  `geocode` varchar(200),
  `lang` varchar(20),
  `enabled` BOOL DEFAULT 1,
  `ts` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
   PRIMARY KEY (id)
);

insert into search_for (id, mail, q) values 
  ('bridgestone', 'matteo.redaelli@gmail.com', '#Bridgestone OR @Bridgestone'),
  ('goodyear', 'matteo.redaelli@gmail.com', '#goodyear OR @goodyear_uk'),
  ('pirelli', 'matteo.redaelli@gmail.com', '#pirelli OR @Pirelli_Media'),
  ('continental', 'matteo.redaelli@gmail.com', '#continentaltire OR @continentaltire'),
  ('michelin', 'matteo.redaelli@gmail.com', '#michelin OR @MichelinTyres'),
  ('kumho', 'matteo.redaelli@gmail.com', '#KumhoTyres OR #kumho OR @KumhoTireUSA OR @KumhoTyres OR KumhoTyres')
;

DROP TABLE IF EXISTS search_results;
CREATE TABLE search_results (
  `id` varchar(30) not null,
  `tweet_id` varchar(30) not NULL,
   PRIMARY KEY (id, tweet_id)
);

DROP TABLE IF EXISTS tweets;
CREATE TABLE tweets (
  `text` text,
  `favorited` BOOL DEFAULT NULL,
  `favoriteCount` float DEFAULT NULL,
  `replyToSN` varchar(50),
  `created` datetime,
  `truncated` tinyint(4) DEFAULT NULL,
  `replyToSID` varchar(30) not NULL,
  `id` varchar(30) not NULL,
  `replyToUID` varchar(30) not NULL,
  `statusSource` varchar(300),
  `screenName` varchar(50),
  `retweetCount` float DEFAULT NULL,
  `isRetweet` BOOL DEFAULT NULL,
  `retweeted` BOOL DEFAULT NULL,
  `longitude` float,
  `latitude` float,
  `ts` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  `lang` varchar(2),
  `sentiment` tinyint(4),
  `first_url` varchar(100),
   PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `description` text,
  `statusesCount` BIGINT UNSIGNED DEFAULT NULL,
  `followersCount` BIGINT UNSIGNED DEFAULT NULL,
  `favoritesCount` BIGINT UNSIGNED DEFAULT NULL,
  `friendsCount` BIGINT UNSIGNED DEFAULT NULL,
  `url` varchar(200),
  `name` varchar(100),
  `created` datetime,
  `protected` BOOL DEFAULT NULL,
  `verified` BOOL DEFAULT NULL,
  `screenName` varchar(50),
  `location` varchar(200),
  `id` varchar(30),
  `listedCount` double DEFAULT NULL,
  `followRequestSent` BOOL DEFAULT NULL,
  `profileImageUrl` varchar(200),  
  `ts` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS timeline_for;
CREATE TABLE timeline_for (
  `id` varchar(30) not null,
  `mail` varchar(300) not null default 'noreply@dump_tweets.org',
  `sinceid` varchar(30) not NULL default 1,
  `enabled` BOOL DEFAULT 1,
  `ts` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,	
   PRIMARY KEY (id)
);

insert into timeline_for (id, mail) values 
  ('Bridgestone', 'matteo.redaelli@gmail.com'),
  ('goodyear_uk', 'matteo.redaelli@gmail.com'),
  ('Pirelli_Media', 'matteo.redaelli@gmail.com'),
  ('continentaltire', 'matteo.redaelli@gmail.com'),
  ('MichelinTyres', 'matteo.redaelli@gmail.com'),
  ('MichelinUSA', 'matteo.redaelli@gmail.com'),
  ('KumhoTyres', 'matteo.redaelli@gmail.com'),
  ('KumhoTyresUK', 'matteo.redaelli@gmail.com'),
  ('KumhoTireUSA', 'matteo.redaelli@gmail.com'),
  ('HankookUSA', 'matteo.redaelli@gmail.com'),
  ('HankookSport', 'matteo.redaelli@gmail.com'),
  ('YokohamaTC', 'matteo.redaelli@gmail.com')
;

DROP TABLE IF EXISTS timeline_results;
CREATE TABLE timeline_results (
  `id` varchar(30) not null,
  `tweet_id` varchar(30) not NULL,
   PRIMARY KEY (id, tweet_id)
);

DROP TABLE IF EXISTS stats_db;
CREATE TABLE stats_db (
  `day` varchar(8) not null,
  `users` int(8) not null default 0,
  `tweets` int(8) not null default 0,
  `searches` int(8) not null default 0,
  `hashtags` int(8) not null default 0,   
  `timelines` int(8) not null default 0,     
   PRIMARY KEY (day)
);

DROP TABLE IF EXISTS `hashtags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hashtags` (
  `id` varchar(100),
  `topHashtags` text DEFAULT NULL, 
  `topWords` text DEFAULT NULL,
  `topAgents` text DEFAULT NULL,
  `topSites` text DEFAULT NULL, 
  `topUsers` text DEFAULT NULL, 
  `topRetwittingUsers` text DEFAULT NULL,
  `ts` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `timelines`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `timelines` (
  `id` varchar(30),
  `topHashtags` text DEFAULT NULL, 
  `topWords` text DEFAULT NULL,
  `topAgents` text DEFAULT NULL,
  `topSites` text DEFAULT NULL, 
  `topUsers` text DEFAULT NULL, 
  `topRetwittingUsers` text DEFAULT NULL,
  `ts` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE DATABASE ESportsManagement;
USE ESportsManagement;

CREATE TABLE TEAM (
  team_id INT PRIMARY KEY AUTO_INCREMENT,
  team_name VARCHAR(200) NOT NULL UNIQUE,
  team_region VARCHAR(100) NOT NULL,
  team_owner VARCHAR(100),
  team_birth YEAR NOT NULL
);

CREATE TABLE PLAYER (
  player_id INT PRIMARY KEY AUTO_INCREMENT,
  player_name VARCHAR(200) NOT NULL,
  player_nickname VARCHAR(50),
  player_position VARCHAR(20) NOT NULL,
  player_salary DECIMAL(15,2) NOT NULL,
  team_id INT,
  FOREIGN KEY (team_id) REFERENCES TEAM(team_id)
);

CREATE TABLE MATCHS (
  match_id INT PRIMARY KEY AUTO_INCREMENT,
  match_time DATETIME NOT NULL,
  match_result VARCHAR(20) NOT NULL
);

CREATE TABLE MATCH_STATISTIC (
  match_id INT,
  player_id INT,
  MS_kills INT,
  MS_deaths INT,
  MS_assists INT,
  FOREIGN KEY (match_id) REFERENCES MATCHS(match_id),
  FOREIGN KEY (player_id) REFERENCES PLAYER(player_id)
);

ALTER TABLE MATCHS ADD match_prize DECIMAL(15,2);
ALTER TABLE TEAM CHANGE team_region team_area VARCHAR(100) NOT NULL;

DROP TABLE MATCH_STATISTIC;
DROP TABLE MATCHS;

INSERT INTO TEAM(team_name, team_area, team_owner, team_birth)
VALUES ('SGP', 'Vietnam', 'Lai Bang', 2007),
('T1', 'Korea', 'Lee Sang', 2013),
('G2', 'Europe', 'Carlos R', 2014),
('Fnatic', 'Europe', NULL, 2012),
('TeamLiquid', 'USA', NULL, 2011);

INSERT INTO PLAYER(player_name, player_nickname, player_position, player_salary, team_id)
VALUES ('Phan Minh', 'MinhZ', 'Jungler', 80000000, 1),
('Tran Bao', 'BaoX', 'Top', 60000000, 1),
('Lee Faker', 'Faker', 'Mid', 150000000, 2),
('Nguyen Hoang', 'HoangY', 'ADC', 70000000, 1),
('Carlos G', 'Caps', 'Mid', 120000000, 3);

INSERT INTO MATCHS(match_time, match_result, match_prize)
VALUES ('2026-05-01 18:00:00', '3-1', 40000000),
('2026-05-02 19:00:00', '1-3', 40000000),
('2026-05-03 20:00:00', '2-3', 20000000),
('2026-05-04 17:30:00', '0-3', 6000000),
('2026-05-05 21:00:00', '3-1', 4000000);

INSERT INTO MATCH_STATISTIC(match_id, player_id, MS_kills, MS_deaths, MS_assists)
VALUES (1,1,5,2,7),
(1,2,3,4,5),
(2,3,10,1,8),
(3,4,6,3,9),
(4,5,8,2,6);

UPDATE PLAYER
SET player_salary = player_salary * 1.2
WHERE player_position = 'Jungler';

DELETE FROM TEAM
WHERE team_owner IS NULL;

SELECT * FROM PLAYER
WHERE player_salary >= 50000000 AND player_salary <= 150000000;

SELECT * FROM MATCHS
WHERE match_id = 'MS_007';

SELECT p.player_nickname, p.player_position FROM PLAYER p, TEAM t WHERE p.team_id = t.team_id AND t.team_area = 'Vietnam';





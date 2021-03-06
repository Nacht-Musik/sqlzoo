-- 1
SELECT matchid, player FROM goal
 WHERE teamid = 'GER';

-- 2
SELECT id,stadium,team1,team2
  FROM game
 WHERE id in ('1012');

-- 3
SELECT player, teamid, stadium, mdate
  FROM game JOIN goal ON (id=matchid)
 WHERE teamid IN ('GER');

-- 4
SELECT team1, team2, player
  FROM game JOIN goal ON (id=matchid)
 WHERE player LIKE 'Mario%';

-- 5
SELECT player, teamid, coach, gtime
  FROM goal JOIN eteam ON (teamid = id)
 WHERE gtime<=10;

-- 6
SELECT mdate, teamname
  FROM game JOIN eteam ON (team1 = eteam.id)
 WHERE coach in ('Fernando Santos');

-- 7
SELECT player
  FROM game JOIN goal ON (game.id = matchid)
 WHERE stadium IN ('National Stadium, Warsaw');

-- 8
SELECT DISTINCT player
  FROM goal JOIN game ON (game.id = goal.matchid)
 WHERE teamid != 'GER'
   AND (team1 = 'GER' OR team2 = 'GER');

-- 9
SELECT DISTINCT teamname, COUNT(teamid)
  FROM eteam JOIN goal ON id=teamid
GROUP BY teamname
ORDER BY teamname ASC;

-- 10
SELECT stadium, COUNT(stadium)
FROM game JOIN goal ON (game.id = goal.matchid)
GROUP BY stadium;

-- 11
  SELECT matchid, mdate, COUNT(teamid)
    FROM game JOIN goal ON matchid = id
   WHERE (team1 = 'POL' OR team2 = 'POL')
GROUP BY matchid, mdate;

-- 12
  SELECT matchid, mdate, COUNT(teamid)
    FROM game JOIN goal ON (game.id = goal.matchid)
   WHERE teamid = 'GER'
GROUP BY matchid, mdate;

-- 13
SELECT mdate,
  team1,
  SUM(CASE WHEN teamid=team1 THEN 1 ELSE 0 END) score1,
  team2,
  SUM(CASE WHEN teamid=team2 THEN 1 ELSE 0 END) score2

FROM game LEFT JOIN goal ON matchid = id
GROUP BY mdate, matchid, team1, team2
ORDER BY mdate, matchid, team1, team2;

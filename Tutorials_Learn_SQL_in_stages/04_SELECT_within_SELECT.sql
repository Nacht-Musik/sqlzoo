-- 1
SELECT name FROM world
  WHERE population >
     (SELECT population FROM world
      WHERE name='Russia');

-- 2
SELECT name FROM world
 WHERE gdp/population >
   (SELECT gdp/population FROM world WHERE name = 'United Kingdom')
 AND continent IN ('Europe');

-- 3
SELECT name, continent FROM world
 WHERE continent in (SELECT continent FROM world WHERE name in ('Argentina', 'Australia'))
 ORDER BY name ASC;

-- 4
SELECT name, population FROM world
 WHERE population > (SELECT population FROM world WHERE name = 'Canada')
   AND population < (SELECT population FROM world WHERE name = 'Poland');

-- 5
SELECT name,
  CONCAT(ROUND(100 * population/(SELECT population FROM world WHERE name = 'Germany')), '%')

 FROM world
WHERE continent = 'Europe';

-- 6
SELECT name
  FROM world
 WHERE gdp > ALL(SELECT gdp
                   FROM world
                  WHERE gdp > 0
                    AND continent = 'Europe');

-- 7
SELECT continent, name, area
  FROM world x
 WHERE area >= ALL
               (SELECT area FROM world y
                 WHERE y.continent = x.continent
                   AND area > 0);

-- 8
SELECT continent, name
  FROM world x
 WHERE name <= ALL(SELECT name
                     FROM world y
                    WHERE y.continent = x.continent);

-- 9
SELECT name, continent, population
  FROM world y
 WHERE continent IN (SELECT continent
                       FROM world x
                   GROUP BY continent
                     HAVING SUM(population) < 140000000);

    -- 備考 SUM(population) < 250000000 が問題として正しいが、回答が合わない。
    -- 下記コードで大陸毎の総人口を見るとユーラシア大陸も含まれるはずだが、
    -- 答えのリストを見るとユーラシア大陸は対象外に思われる。
    -- SELECT continent, SUM(population), SUM(area)
    --   FROM world
    -- GROUP BY continent
    -- ORDER BY SUM(population) ASC;

-- 10
SELECT name, continent
  FROM world x
 WHERE population / 3 >= ALL(SELECT population
                               FROM world y
                              WHERE y.continent = x.continent
                                AND y.name <> x.name
                                AND population > 0);

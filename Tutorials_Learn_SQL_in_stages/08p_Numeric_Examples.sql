-- 1
SELECT A_STRONGLY_AGREE
  FROM nss
 WHERE question='Q01'
   AND institution='Edinburgh Napier University'
   AND subject='(8) Computer Science';

-- 2
SELECT institution, subject
  FROM nss
 WHERE question='Q15'
   AND score >= '100';

-- 3
SELECT institution, score
  FROM nss
 WHERE question='Q15'
   AND subject='(8) Computer Science'
   AND score < '50';

-- 4
SELECT subject, SUM(response)
  FROM nss
 WHERE question='Q22'
   AND (subject = '(8) Computer Science' OR subject = '(H) Creative Arts and Design')
 GROUP BY subject;

-- 5


-- 6


-- 7


-- 8
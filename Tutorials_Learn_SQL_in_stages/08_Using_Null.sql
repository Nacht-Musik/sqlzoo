-- 1
SELECT name
  FROM teacher
 WHERE dept IS NULL;

-- 2
SELECT teacher.name as teacher_name, dept.name as dept_name
 FROM teacher INNER JOIN dept
           ON (teacher.dept = dept.id)

-- 3
SELECT teacher.name as teacher_name, dept.name as dept_name
  FROM teacher
  LEFT JOIN dept ON(teacher.dept = dept.id);

-- 4
SELECT teacher.name as teacher_name, dept.name as dept_name
  FROM teacher
  RIGHT JOIN dept ON(teacher.dept = dept.id);

-- 5
SELECT teacher.name as teacher_name
      ,COALESCE(teacher.mobile, '07986 444 2266') as mobile_number
  FROM teacher;

-- 6

SELECT teacher.name as teacher_name
      ,COALESCE(dept.name, 'None') as dept_name
  FROM teacher
  LEFT JOIN dept on (teacher.dept = dept.id);

-- 7
SELECT COUNT(name), COUNT(mobile)
  FROM teacher;

-- 8
SELECT dept.name, COUNT(teacher.name)
  FROM teacher
  RIGHT JOIN dept ON (teacher.dept = dept.id)
  GROUP BY dept.name;

-- 9
SELECT name,
  CASE
    WHEN dept = '1' OR dept = '2' THEN 'Sci'
    ELSE 'Art'
  END

  FROM teacher;

-- 10
SELECT name,
  CASE
    WHEN dept = '1' OR dept = '2' THEN 'Sci'
    WHEN dept = '3' THEN 'Art'
    ELSE 'None'
  END

  FROM teacher;

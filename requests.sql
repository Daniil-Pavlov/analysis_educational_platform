-- Расчет количества студентов, которые правильно решил 20 задач за текущий месяц.

SELECT  count(*) AS number_of_students
FROM (  SELECT st_id, COUNT(correct) AS task_accomplished
        FROM (  SELECT st_id, correct,subject,timest,DATE_TRUNC ('month',timest) = DATE_TRUNC ('month',MAX(timest) OVER (ORDER BY timest ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING)) AS check_month
                FROM peas) AS ch
        WHERE correct = True AND check_month = True
        GROUP BY st_id
        HAVING COUNT(correct) >=20  ) AS std

-- Расчет метрик

WITH new_studs AS ( SELECT st_id,test_grp,active,math_active
                    FROM studs
                    LEFT JOIN ( SELECT  st_id, CASE WHEN COUNT(timest) > 10 THEN True  END AS active
                                FROM peas
                                WHERE correct = True 
                                GROUP BY st_id
                                HAVING CASE WHEN COUNT(timest) > 10 THEN True  END = True) AS act
                    USING (st_id)
                    LEFT JOIN ( SELECT  st_id, CASE WHEN COUNT(timest) >= 2 THEN True  END AS math_active
                                FROM peas
                                WHERE correct = True AND subject = 'Math'
                                GROUP BY st_id
                                HAVING CASE WHEN COUNT(timest) >= 2 THEN True  END = True) AS m_act
                    USING (st_id))



SELECT  test_grp,
        SUM(money) / COUNT(DISTINCT(st_id)) AS ARPU,
        SUM(money) / COUNT(DISTINCT(st_id)) FILTER (WHERE active = True) AS ARPAU,
        COUNT(DISTINCT(st_id)) FILTER (WHERE money IS NOT NULL ) *100/ COUNT(DISTINCT(st_id)) AS cr_to_pay,
        COUNT(DISTINCT(st_id)) FILTER (WHERE money IS NOT NULL AND active = True ) *100/ COUNT(DISTINCT(st_id)) FILTER (WHERE active = True) AS cr_to_pay_active,
        COUNT(DISTINCT(st_id)) FILTER (WHERE money IS NOT NULL AND math_active = True AND subject = 'Math' ) *100/ COUNT(DISTINCT(st_id)) FILTER (WHERE math_active = True) AS cr_to_pay_active_math
        
FROM new_studs
LEFT JOIN final_project_check
USING (st_id)
GROUP BY test_grp

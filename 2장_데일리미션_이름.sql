-- 1번
SELECT
    m.member_id    AS "회원번호",
    m.name         AS "회원명",
    m.birth_year   AS "출생년도",
    m.region       AS "거주지역",
    m.phone        AS "전화번호"
FROM members AS m
WHERE m.birth_year BETWEEN 1970 AND 1989
  AND m.email IS NULL
ORDER BY
    m.birth_year,
    m.member_id;

-- 2번
SELECT
    m.region                    AS "거주지역",
    CASE
        WHEN m.gender = 'F' THEN '여'
        WHEN m.gender = 'M' THEN '남'
    END AS "성별",
    COUNT(*)                    AS "회원수",
    ROUND(AVG(birth_year), 0)   AS "평균출생년도"
FROM members AS m
GROUP BY m.region, m.gender;

-- 3번
SELECT
    m.name                AS "회원명",
    m.phone               AS "전화번호",
    c.course_name         AS "강좌명",
    e.enroll_month        AS "수강월"
FROM enrollments AS e
JOIN members AS m
    ON e.member_id = m.member_id
JOIN courses AS c
    ON e.course_id = c.course_id
LIMIT 10;

-- 4번
SELECT
    s.sport_name AS "종목",
    e.enroll_month AS "수강월",
    COUNT(*) AS "수강인원",
    SUM(e.pay_amount) AS "매출"
FROM enrollments AS e
JOIN courses AS c
    ON e.course_id = c.course_id
JOIN sports AS s
    ON c.sport_id = s.sport_id
GROUP BY
    s.sport_name,
    e.enroll_month
ORDER BY
    e.enroll_month,
    s.sport_name;

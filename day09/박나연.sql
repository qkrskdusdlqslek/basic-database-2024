-- 1번
SELECT Email
     , Mobile
	 , Names
	 , Addr 
  FROM membertbl 
 ORDER BY Addr DESC, Email ASC, Names DESC;

-- 2번
SELECT Names AS '도서명'
     , Author AS '저자'
	 , ISBN
	 , Price AS '정가'
  FROM bookstbl
 ORDER BY Price DESC;

-- 3번
SELECT m.Names AS '회원명'
     , m.Levels AS '회원등급'
	 , m.Addr AS '회원주소'
	 , r.rentalDate AS '대여일'
  FROM membertbl AS m LEFT JOIN rentaltbl as r ON m.memberIdx = r.memberIdx
 WHERE rentalDate IS NULL AND m.Levels = 'A';

-- 4번
SELECT DISTINCT d.Names AS '책 장르'
     , CONCAT(FORMAT(SUM(b.Price), '#,#'), '원') AS '총합계금액'
  FROM divtbl as d , bookstbl as b
 WHERE d.Division = b.Division
 GROUP BY d.Names

-- 5번
SELECT d.Names AS '책 장르'
	 , COUNT(b.bookIdx) AS '권수'
	 , CONCAT(FORMAT(SUM(b.Price), '#,#'), '원') AS '총합계금액'
  FROM divtbl as d JOIN bookstbl as b ON d.Division = b.Division
 GROUP BY d.Names
 UNION ALL
SELECT '--합계--' AS Names
     , COUNT(b.bookIdx) AS '권수'
     , CONCAT(FORMAT(SUM(b.Price), '#,#'), '원') AS '총합계금액'
  FROM bookstbl as b
-- 1번
SELECT Email
     , Mobile
	 , Names
	 , Addr
  FROM membertbl;

-- 2번
SELECT Names AS '도서명'
     , Author AS '저자'
	 , ISBN
	 , Price AS '정가'
  FROM bookstbl;

-- 3번
SELECT m.Names AS '회원명'
     , m.Levels AS '회원등급'
	 , m.Addr AS '회원주소'
	 , r.returnDate AS '대여일'
  FROM membertbl AS m, rentaltbl as r
 WHERE returnDate IS NULL AND m.memberIdx = r.memberIdx 

-- 4번
SELECT *
  FROM divtbl;

SELECT *
  FROM bookstbl;

 
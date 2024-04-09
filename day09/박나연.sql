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
	 , r.rentalDate AS '대여일'
  FROM membertbl AS m LEFT JOIN rentaltbl as r ON m.memberIdx = r.memberIdx
 WHERE rentalDate IS NULL AND m.Levels = 'A';

-- 4번
SELECT d.Names
  FROM divtbl as d JOIN bookstbl as b
 WHE



-- 5번


 
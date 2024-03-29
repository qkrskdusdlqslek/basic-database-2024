-- 연습문제 Part1
-- 1. 도서번호가 1인 도서 검색
SELECT *
  FROM Book
 WHERE bookid = 1;

-- 2. 가격이 20,000원 이상인 도서 검색
SELECT *
  FROM Book
 WHERE price >= 20000;

-- 3. 박지성의 총 구매액(박지성의 고객번호는 1번으로 놓고 작성)
SELECT SUM(saleprice) AS [박지성의 총 구매액]
  FROM Orders  -- 박지성, custid 1번
 WHERE custid = 1;

-- 4. 박지성이 구매한 도서의 수
SELECT COUNT(saleprice) AS [박지성의 총 구매수]
  FROM Orders  -- 박지성, custid 1번
 WHERE custid = 1;
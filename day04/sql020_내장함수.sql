-- 내장함수
-- 수학함수 들
-- 함수의 결과값은 (열 이름 없음) 이름지정 필요
SELECT ABS(-5), ABS(5);

-- 올림, 내림, 반올림, N승
SElECT CEILING(4.1), FLOOR(4.4), ROUND(4.4, 0), POWER(2, 10);

-- 고객별 평균 주문금액
SELECT custid
     , SUM(saleprice) AS '고객별 총 주문금액'
     , AVG(saleprice) AS '고객별 주문평균금액'
     , count(*) AS '고객별 주문 수'
     , ROUND(SUM(saleprice) / COUNT(*), 0) AS '계산한 평균금액'
  FROM Orders
 GROUP BY custid;

-- 문자열함수 들
-- 책제목에 야구를 농구로 바꿔서 출력
-- FORMAT(VAL, '포맷값')
SELECT bookid
     , REPLACE(bookname, '야구', '농구') AS bookname
     , publisher
     , FORMAT(price, '#,#') AS price -- 천단위마다 쉼표 찍는 기능
  FROM Book

SELECT bookname AS '제목'
     , LEN(bookname) AS [제목별 길이]
  FROM Book
 WHERE publisher = '굿스포츠';

-- 영문자 단어, 코드 변환시 유용하게 많이 사용
SELECT LOWER('Hello'), UPPER('hello');

-- TRIM(공백제거) : LTRIM, RTRIM, TRIM(!!)
SELECT '|' + LTRIM('     HELLO     ') + '|'
     , '|' + RTRIM('     HELLO     ') + '|'
     , '|' + TRIM('     HELLO     ') + '|'

-- LEFT(), RIGHT(), SUBSTRING()
SELECT LEFT('HELLO WORLD!', 5)
     , RIGHT('HELLO WORLD!', 5)
     , SUBSTRING('HELLO WORLD', 7, 5)

-- CHARINDEX() 문자 찾기
SELECT CHARINDEX('sql', 'Microsoft SQL Server 2022');

-- SUBSTRING() 연계
SELECT SUBSTRING('Microsoft SQL SERVER 2022',
       CHARINDEX('sql', 'Microsoft SQL Server 2022'),
       Len('sql'));

-- SUBSTRING, DB는 인덱스가 1부터 시작(!!!)
SELECT SUBSTRING([name], 1, 1) AS '성씨'
     , COUNT(*) AS '성씨별 인원 수'
  FROM Customer
 GROUP BY SUBSTRING([name], 1, 1);

-- 날짜/시간 함수
SELECT GETDATE();

SELECT DAY(GETDATE());  -- 일
SELECT MONTH(GETDATE());  -- 월
SELECT YEAR(GETDATE());  -- 년

-- 날짜 포맷을 원하는 형태로 변경 가능
SELECT FORMAT(GETDATE(), 'yyyy-MM-dd');
SELECT FORMAT(GETDATE(), 'HH:mm:ss');

-- 주문 테이블에서 주문 10일 후에 각 주문을 확정짓는다. 확정일자 출력
-- dd(날짜), mm(달), yy(년), qq(분기), wk(주)
SELECT orderid
     , saleprice
     , orderdate AS '주문일자'
     , DATEADD(dd, 10, orderdate) AS '확정일자'
     , DATEADD(mm, 1, orderdate) AS '통계일자'
  FROM Orders

-- TOP n 내장된 키워드(함수 아님)
SELECT TOP 3 orderid, custid, saleprice
  FROM Orders
 ORDER BY saleprice DESC;
CREATE TABLE workers
(
  id CHAR(9),
  name VARCHAR(50),
  state VARCHAR(50),
  salary SMALLINT,
  company VARCHAR(20)
);

INSERT INTO workers VALUES(123456789, 'John Walker', 'Florida', 2500, 'IBM');
INSERT INTO workers VALUES(234567890, 'Brad Pitt', 'Florida', 1500, 'APPLE');
INSERT INTO workers VALUES(345678901, 'Eddie Murphy', 'Texas', 3000, 'IBM');
INSERT INTO workers VALUES(456789012, 'Eddie Murphy', 'Virginia', 1000, 'GOOGLE');
INSERT INTO workers VALUES(567890123, 'Eddie Murphy', 'Texas', 7000, 'MICROSOFT');
INSERT INTO workers VALUES(456789012, 'Brad Pitt', 'Texas', 1500, 'GOOGLE');
INSERT INTO workers VALUES(123456710, 'Mark Stone', 'Pennsylvania', 2500, 'IBM');

SELECT * FROM workers;

--Toplam salary değeri 2500 üzeri olan her bir çalışan için salary toplamını bulun.
SELECT name, SUM(salary) AS "Total Salary" 
FROM workers GROUP BY name 
HAVING SUM(salary) > 2500; -- GROUP BY in ardindan WHERE kullanilmaz

--Birden fazla çalışanı olan, her bir state için çalışan toplamlarını bulun.
SELECT state, count(state) AS "Number Of Employees"
From workers Group by state
having count(state) >1 ; --HAVING, GROUP BY ardindan filtreleme ardindan kullanilir

--Her bir state için değeri 3000'den az olan maximum salary değerlerini bulun.
SELECT state, MAX(salary)
From workers 
group by state
HAVING MAX(salary) < 3000 ;
 
--Her bir company için değeri 2000'den fazla olan minimum salary değerlerini bulun.
SELECT company, MIN(salary) AS min_salary
FROM workers
GROUP BY company
HAVING MIN(salary) >2000;

--Tekrarsiz isimleri cagirin
SELECT DISTINCT name
From workers; --Cagirilan terimlerden tekrarli olanlarin sadece birincisini alir.

--Name değerlerini company kelime uzunluklarına göre sıralayın.
SELECT name, company
from workers
order by LENGTH(company) ASC ;

--Tüm name ve state değerlerini aynı sütunda çağırarak her bir sütun değerinin uzunluğuna göre sıralayın.
--CONCAT==> birden fazla sutun(COLUMN) veya string degerini birlestirmek icin kullanilir
select CONCAT(name,' ' ,state) name_and_state
FROM workers
ORDER BY LENGTH (CONCAT(name, state));

--2.Yol--
select CONCAT(name,' ' ,state) name_and_state
FROM workers
ORDER BY LENGTH (name) + LENGTH (state) ;

--3.Yol--
SELECT name || ' ' || state || ' ' || LENGTH (name) + LENGTH (state) AS "name and state"
FROM workers
ORDER BY LENGTH (name) + LENGTH (state) ;


--UNION OPERATOR--
/*
UNION Operator: 1) İki sorgu(query) sonucunu birleştirmek için kullanılır.
                2) Tekrarsız(unique) recordları verir.
                3) Tek bir sütuna çok sütun koyabiliriz.
				4) Tek bir sütuna çok sütun koyarken mevcut data durumuna dikkat etmek gerekir.				
*/
--salary değeri 3000'den yüksek olan state değerlerini 
--ve 2000'den küçük olan name değerlerini tekrarsız olarak bulun.

SELECT state AS "Name and State", salary
from workers
where salary>3000

UNION
select name, salary

from workers
where salary < 2000;

--salary değeri 3000'den yüksek olan state değerlerini 
--ve 2000'den küçük olan name değerlerini tekrarlı olarak bulun.

SELECT state AS "Name and State", salary
from workers
where salary>3000

UNION ALL --> UNION ile ayni isi yapar. Tek farki, TEKRARLI DEGERLERI DE VERIR.

select name, salary
from workers
where salary < 2000;

--salary değeri 1000'den yüksek,
--2000'den az olan "ortak" name değerlerini bulun

SELECT name
FROM workers
WHERE salary>1000

INTERSECT --> ORTAK DEGERLERI GETIRMEK ISTIYORSAK INTERSECT KEYWORD U KULLANILIZ.TEKRARSIZ

SELECT name
FROM workers
WHERE salary< 2000;
--INTERSECT Operator: İki sorgu (query) sonucunun ortak(common) değerlerini verir. 
--Unique(tekrarsız) recordları verir.

--salary değeri 2000'den az olan ve company değeri  
--IBM, APPLE ya da MICROSOFT olan ortak "name" değerlerini bulun.

SELECT name
FROM workers
WHERE salary< 2000
INTERSECT
SELECT name
FROM workers
WHERE company IN ('IBM', 'APPLE' , 'MICROSOFT') ;

--EXCEPT Operator : Bir sorgu sonucundan başka bir sorgu sonucunu çıkarmak için kullanılır.
--Unique(tekrarsız) recordları verir.

--salary değeri 3000'den az ve GOOGLE'da çalışmayan  name değerlerini bulun.
SELECT name
FROM workers
WHERE salary< 3000 -- 300 den az olanlar

EXCEPT   -- GOOGLE da calisanlarin haricini verir

SELECT name
FROM workers
WHERE company = 'GOOGLE';    -- GOOGLE da calisanlar

















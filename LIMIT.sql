--LIMIT--

--kisiler tablosundan ilk 5 veriyi listeleyiniz
SELECT * FROM kisiler LIMIT 5 ;

--Ilk 2 veriden sonra 5 veriyi listeleyiniz
SELECT * FROM kisiler LIMIT 5 OFFSET 2 ;

--id değeri 5 den büyük olan ilk iki veriyi listeleyiniz
select * from kisiler where id > 5 LIMIT 2;

--  MAAŞ'ı en yüksek 3 kişinin bilgilerini listeleyiniz
select * from kisiler ORDER BY maas desc LIMIT 3 ;

-- En yüksek maaşı alan 4. 5.  6. kişilerin bilgilerini listeleyiniz
SELECT * FROM kisiler ORDER BY maas DESC LIMIT 3 OFFSET 3 ;
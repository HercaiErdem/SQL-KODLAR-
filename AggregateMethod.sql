-- AGGREGATE METHOD KULLANIMI --
/*
-Aggregate Methodları (SUM(Topla),COUNT(Say),MIN(EN küçük değer),MAX(En büyük değer),AVG(Ortalama))
-Subquery içinde de kullanılır
-ANcak, sorgu tek bir değer döndürüyor olmalıdır
SYNTAX: sum() şeklinde olmalı sum () arasında boşluk olmamalı
--ALIAS (AS) toplada geçici isim vermek istersek kosuldan sonra AS sutun_isim olarak kullanılır

*/

select * from calisanlar2;
--Calisanlar2 tablosundaki en yuksek maas degerini listeleyin
select max(maas) from calisanlar2;

--Calisanlar2 tablosundaki maaslarin toplamini listeleyiniz
select sum(maas) from calisanlar2;

--Calisanlar2 tablosundaki maas ortalamalarini listeleyiniz
select avg(maas) from calisanlar2;
select round(avg(maas)) from calisanlar2; // kusarati kaldiriyor
select round(avg(maas),2) from calisanlar2;

--Calisanlar2 tablosundaki en dusuk maas degerini listeleyin
select min(maas) from calisanlar2;

--Calisanlar2 tablosundaki kac kisinin maas aldigini listeleyin
select count(maas) from calisanlar2;

-- Her markanin ismini, calisan sayisini ve o markaya ait calisanlarin toplam maaşini listeleyiniz
select * from markalar;
select marka_isim, calisan_sayisi, (select sum(maas)from calisanlar2
where marka_isim=isyeri)AS toplam_maas from markalar;

-- Her markanin ismini, calisan sayisini ve o markaya ait calisanlarin maksimum ve minumum maaşini
--listeleyen bir Sorgu yaziniz.
SELECT marka_isim,calisan_sayisi,(SELECT max(maas) from calisanlar2 where marka_isim=isyeri) AS max_maas,
                                 (SELECT min(maas) from calisanlar2 where marka_isim=isyeri) AS min_maas
from markalar;

--Her markanin id’sini, ismini ve toplam kaç şehirde bulunduğunu listeleyen bir SORGU yaziniz.
select marka_id, marka_isim, (select count(sehir)from calisanlar2 
							  where marka_isim= isyeri) AS sehir_sayisi 
							  from markalar;

--Interview Question: En yüksek ikinci maas değerini çağırın.
SELECT max(maas) AS enyuksek_ikinci_maas from calisanlar2
WHERE maas < (SELECT max(maas)from calisanlar2);

--Interview Question: En düşük ikinci maas değerini çağırın.
SELECT min(maas) AS endusuk_ikinci_maas from calisanlar2
WHERE maas > (SELECT min(maas)from calisanlar2);


--En yüksek üçüncü maas değerini bulun
SELECT max(maas) AS enyuksek_ucuncu_maas from calisanlar2
WHERE maas < (SELECT max(maas)from calisanlar2 where maas < (SELECT max(maas)from calisanlar2));

--En düşük üçüncü maas değerini bulununuz (ÖDEV)
--cevap 3000 olucak











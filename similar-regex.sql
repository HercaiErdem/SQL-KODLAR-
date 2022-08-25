-- SELECT - SIMILAR TO - REGEX(Regular Expressions) --
/*
SIMILAR TO : Daha karmaşık pattern(kalıp) ile sorgulama işlemi için SIMILAR TO kullanılabilir.
Sadece PostgreSQL de kullanılır. Büyük Küçük harf önemlidir
REGEX : Herhangi bir kod, metin içerisinde istenen yazı veya kod parçasının aranıp bulunmasını sağlayan
kendine ait bir söz dizimi olan bir yapıdır.MySQL de(REGEXP_LİKE) olarak kullanılır
PostgreSQL'de "~" karakteri ile kullanılır.
*/

CREATE TABLE kelimeler
(
id int,
kelime VARCHAR(50),
harf_sayisi int
);

INSERT INTO kelimeler VALUES (1001, 'hot', 3);
INSERT INTO kelimeler VALUES (1002, 'hat', 3);
INSERT INTO kelimeler VALUES (1003, 'hit', 3);
INSERT INTO kelimeler VALUES (1004, 'hbt', 3);
INSERT INTO kelimeler VALUES (1005, 'hct', 3);
INSERT INTO kelimeler VALUES (1006, 'adem', 4);
INSERT INTO kelimeler VALUES (1007, 'selim', 5);
INSERT INTO kelimeler VALUES (1008, 'yusuf', 5);
INSERT INTO kelimeler VALUES (1009, 'hip', 3);
INSERT INTO kelimeler VALUES (1010, 'HOT', 3);
INSERT INTO kelimeler VALUES (1011, 'hOt', 3);
INSERT INTO kelimeler VALUES (1012, 'h9t', 3);
INSERT INTO kelimeler VALUES (1013, 'hoot', 4);
INSERT INTO kelimeler VALUES (1014, 'haaat', 5);
INSERT INTO kelimeler VALUES (1015, 'hooooot', 5);
INSERT INTO kelimeler VALUES (1016, 'booooot', 5);
INSERT INTO kelimeler VALUES (1017, 'bolooot', 5);
   
select * from kelimeler ;

--  İçerisinde 'ot' veya 'at' bulunan kelimeleri listeleyiniz
-- Veya islemi icin | karakterikullanilir

--SIMILAR TO ile
select * from kelimeler where kelime SIMILAR TO '%(ot|at|OT|AT)%';
-- LIKE ile
select * from kelimeler where kelime ILIKE '%at%' or kelime ILIKE'%ot%' ;
select * from kelimeler where kelime ~~* '%at%' or kelime ~~* '%ot%' ;
--REGEX ile
select * from kelimeler where kelime ~* 'ot' or kelime ~* 'at' ;

-- : 'ho' veya 'hi' ile başlayan kelimeleri listeleyeniz
--Like ile 
select * from kelimeler where kelime ~~* 'ho%' or kelime ~~* 'hi%' ;
--similar to ile
select * from kelimeler where kelime similar to 'ho%|hi%' ; --kucuk buyuk harf farketiyor camel case
--REGEX ile
select * from kelimeler where kelime ~* 'h[oi](.*)' ; --Regex te ". (nokta) bir karakteri temsil eder."
--Regex'de ikinci karakter için köşeli parantez kullanılır. * hepsi anlamında kullanılır

--Sonu 't' veya 'm' ile bitenleri listeleyeniz
--Like ile
select * from kelimeler where kelime ~~* '%t' or  kelime ~~* '%m';
--SIMILAR TO ile
select * from kelimeler where kelime similar to '%t|%m' ;
--Regex ile
select * from kelimeler where kelime ~* '(.*)[tm]$' ; -- $ karakteri bitisi gosterir

-- h ile başlayıp t ile biten 3 harfli kelimeleri listeleyeniz
--LIKE ile
select * from kelimeler where kelime ~~* 'h_t' ;
--SIMILAR TO ile
select * from kelimeler where kelime similar to 'h[a-z,A-Z,0-9]t' ;
--REGEX ile
select * from kelimeler where kelime ~* 'h[a-z,A-Z,0-9]t' ;

--İlk karakteri 'h', son karakteri 't' ve ikinci karakteri 'a'dan 'e'ye herhangi bir karakter olan 
--“kelime" değerlerini çağırın.
--Similar to ile
Select kelime from kelimeler where kelime similar to 'h[a-e]%t' ;
--Regex ile
Select kelime from kelimeler where kelime similar to 'h[a-e](.*)t' ;

--İlk karakteri 's', 'a' veya 'y' olan "kelime" değerlerini çağırın.
--Like ile
select kelime  from kelimeler where kelime ~~* 's%' or kelime ~~* 'a%' or kelime ~~* 'y%' ;

--Son karakteri 'm', 'a' veya 'f' olan "kelime" değerlerini çağırın.
--similar to ile
select kelime  from kelimeler where kelime similar to '%m|%a|%f' ;
--REGEX ile
select kelime  from kelimeler where kelime ~ '(.*)[maf]$' ;

--İlk harfi h, son harfi t olup 2.harfi a veya i olan 3 harfli kelimelerin tüm bilgilerini sorgulayalım
--similar to ile
select * from kelimeler where kelime similar to 'h[a|i]t' ;
--Regex ile
select * from kelimeler where kelime ~ 'h[a|i]t$' ;

--İlk harfi 'b' dan ‘s' ye bir karakter olan ve ikinci harfi herhangi bir karakter olup üçüncü harfi ‘l' olan
--“kelime" değerlerini çağırın.
select kelime from kelimeler where kelime ~ '^[b-s].l(.*)';
select*from kelimeler where kelime similar to '[b-s]_l%';

--içerisinde en az 2 adet oo barıdıran kelimelerin tüm bilgilerini listeleyiniz.
select * from kelimeler where kelime similar to '%[o][o]%' ;
select * from kelimeler where kelime ~ '(.*)o(.*)o(.*)';
select * from kelimeler where kelime similar to '%[o]{2}%' -- suslu parantez icinde belirttigimiz rakam 
--bir onceki koseli parantez icinde kac tane oldugunu belirtir

--içerisinde en az 4 adet oooo barıdıran kelimelerin tüm bilgilerini listeleyiniz.
select * from kelimeler where kelime similar to '%[o]{4}%'
select * from kelimeler where kelime similar to '%[o][o][o][o]%';

--'a', 's' ya da 'y' ile başlayan VE 'm' ya da 'f' ile biten "kelime" değerlerini çağırın.
select * from kelimeler where kelime ~'^[a|s|y](.*)[m|f]$';





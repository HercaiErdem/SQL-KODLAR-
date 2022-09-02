--Function olusturma--
--1. Örnek: İki parametre ile çalışıp bu parametreleri toplayarak return yapan bir fonksiyon oluşturun.

--addf ismi boyle toplama function demek
--$$ isaretleri java daki curly braces {} gibi
--SQL(pgadmin4) ise $$ isareti kullanilir acma kapatma islemi yapmak icin

CREATE OR REPLACE FUNCTION toplamaF(x NUMERIC, y NUMERIC)
RETURNS NUMERIC
LANGUAGE plpgsql
AS
$$
BEGIN
RETURN x+y;
END
$$

SELECT + FROM toplamaF(15+25);
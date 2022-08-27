/*
-- GROUP BY -- HAVING --
HAVING ifadesinin işlevi WHERE ifadesininkine çok benziyor. Ancak kümeleme fonksiyonları ile
WHERE ifadesi birlikte kullanılmadığında HAVING ifadesine ihtiyac duyulmuştur
GROUP BY ile kullanılır gruplamadan sonraki şart için group by dan sonra HAVING kullanılır
*/

--Maaş ortalaması 30000’den fazla olan ülkelerdeki erkek çalışanların maaş ortalaması.
SELECT ulke, cinsiyet, round(avg(maas))AS maas_ort from personel
WHERE cinsiyet = 'E'
GROUP BY ulke, cinsiyet 
HAVING avg(maas) > 30000;

--ODEV
--Erkek çalışanların sayısı 1’den fazla olan ülkelerin maaş ortalamasını getiren sorgu
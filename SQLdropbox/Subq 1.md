# Subq 1

## Oefening 1

Geef voor elke speler die een wedstrijd heeft gespeeld het spelersnr en het totaal aantal boetes. Spelers die een wedstrijd gespeeld hebben, maar geen boetes hebben, moeten ook getoond worden.
Sorteer op het aantal boetes en op spelersnr;

```SQL
select distinct W.spelersnr, B.aantalboetes
from wedstrijden W left outer join (
  select spelersnr, count(betalingsnr) as aantalboetes
  from boetes
  group by spelersnr) B on W.spelersnr = B.spelersnr
order by 2,1
```

## Oefening 2

Geef voor alle spelers die geen penningmeester zijn of zijn geweest alle gewonnen wedstrijden, gesorteerd op wedstrijdnummer.

```SQL
select spelersnr, wedstrijdnr 
from wedstrijden
where spelersnr not in (
	select spelersnr
	from bestuursleden
	where functie = 'Penningmeester')
	and gewonnen > verloren
order by 2
```

## Oefening 3

Geef van elke speler het spelersnr, de naam en het verschil tussen zijn of haar jaar van toetreding en het gemiddeld jaar van toetreding van de spelers die in dezelfde plaats wonen. Sorteer op spelersnr. Toon 3 getallen na de komma, zet het verschil om naar het numeric type met precisie van 5 en een schaal van 3.

```SQL
```

## Oefening 4

Je kan per speler berekenen hoeveel boetes die speler heeft gehad en wat het totaalbedrag per speler is. Pas nu deze querie aan zodat per verschillend aantal boetes wordt getoond hoe vaak dit aantal boetes voorkwam.Sorteer eerst op de eerste kolom en daarna op de tweede kolom.

```SQL
select aantalboetes as a, count(aantalboetes)
from (
	select count(*) as aantalboetes 
	from boetes
  	group by spelersnr) T
group by aantalboetes
order by 1,2
```



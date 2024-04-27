# Herh 1

## Oefening 1

Geef voor alle huidige bestuurleden hun functie en de lijst van boetes die voor hen werd betaald.
Omdat je dit wil vergelijken met de boetebedragen die betaald werden voor leden die niet in het bestuur zitten, wil je deze boetebedragen ook opnemen in de tweede kolom van je resultaat. Sorteer je antwoord eerst op functie en daarna op het boetebedrag.

```SQL
select be.functie, bo.bedrag
from bestuursleden be LEFT OUTER JOIN spelers s on be.spelersnr = s.spelersnr
	full join boetes bo on be.spelersnr = bo.spelersnr
where be.eind_datum is null
order by 1,2
```

## Oefening 2

Geef voor elke mannelijke speler wiens naam minstens 2 keer de letter 'e' bevat zijn functie die hij op dit moment uitoefent, als die er op dit moment één heeft.
Sorteer op naam en functie.

```SQL
SELECT S.naam, S.geslacht, B.functie
FROM spelers S left outer join bestuursleden B on S.spelersnr = b.spelersnr and eind_datum is null
WHERE naam like '%e%e%'
	and geslacht = 'M'
ORDER BY 1,3
```

## Oefening 3

Geef per team de verloren wedstrijden. Zorg dat teams zonder verloren wedstrijden ook in de output verschijnen.
Duid per wedstrijd aan of het om een actief bestuurslid gaat.
Sorteer op divisie en wedstrijdnummer.

```SQL
SELECT T.teamnr, divisie, wedstrijdnr, W.spelersnr, 
	CASE
		WHEN functie is null THEN '-'
		ELSE 'actief'
	END as bestuurslid
FROM teams T left outer join wedstrijden W on T.teamnr = W.teamnr and verloren > gewonnen 
	left outer join bestuursleden B on B.spelersnr = W.spelersnr and eind_datum is null 
ORDER BY 2, 3
```
### notes
meer conditions na de ON is meer blij

## Oefening 4

Geef een aflopend gesorteerde lijst van de nummers van alle spelers waarvoor nog geen boete werd betaald en die nog nooit in het bestuur van de tennisvereniging hebben gezeten.

```SQL
SELECT SF.spelersnr
FROM spelers SF left outer join boetes B on SF.spelersnr = B.spelersnr
	left outer join bestuursleden BL on BL.spelersnr = SF.spelersnr
	inner join spelers S on S.spelersnr = SF.spelersnr and betalingsnr is null and functie is null
ORDER BY 1 desc
```

## Oefening 5

Geef de nummers van alle spelers (ook al hebben ze geen wedstrijd gespeeld), een lijst van de nummers van alle wedstrijden die ze gewonnen hebben, alsook het verschil in sets waarmee ze gewonnen hebben.
Toon je resultaten gesorteerd volgens dit verschil van groot naar klein en oplopend op spelersnr.

```SQL
SELECT S.spelersnr, W.wedstrijdnr, (W.gewonnen - W.verloren) as verschil
FROM spelers S LEFT OUTER JOIN wedstrijden W on S.spelersnr = W.spelersnr and gewonnen > verloren
ORDER BY 3 desc, 1
```

## Oefening 6

Geef het spelersnummer en bondsnummer van alle spelers die jonger zijn dan de speler met bondsnummer 8467.
gebruik een INNER JOIN. Sorteer 1,2

```SQL
SELECT S1.spelersnr, S1.bondsnr
FROM spelers S1 inner JOIN 
	spelers S2 on S2.bondsnr = '8467' 
		and S1.geb_datum > S2.geb_datum
ORDER BY 1,2
```

## Oefening 7

Maak een lijst van alle mannelijke aanvoerders van een team en hun gespeelde wedstrijden.
Hierbij toon je voor deze spelers het spelersnummer en de volledige naam, voor het team de divisie en voor de wedstrijd het wedstrijdnummer.
Sorteer ook aflopend op het wedstrijdnummer.

<mark>ONVOLLEDIG</mark>

```SQL
SELECT S.spelersnr, S.naam, S.voorletters, T.divisie, W.wedstrijdnr
FROM spelers S INNER JOIN teams T on S.spelersnr = T.spelersnr and S.geslacht = 'M'
	LEFT OUTER JOIN wedstrijden W on W.teamnr = T.teamnr and W.spelersnr = T.spelersnr
ORDER BY 5 DESC
```

<mark>ONVOLLEDIG</mark>

```SQL
SELECT S.spelersnr, S.naam, S.voorletters, T.divisie, W.wedstrijdnr
FROM teams T LEFT OUTER JOIN spelers S on S.spelersnr = T.spelersnr  and S.geslacht = 'M' and T.spelersnr is not null
	LEFT OUTER JOIN wedstrijden W on W.teamnr = T.teamnr and W.spelersnr = T.spelersnr
ORDER BY 5 DESC
```

## Oefening 8

Geef voor de actieve bestuursleden zonder boete hun laatste gespeelde wedstrijd (die met het hoogste wedstrijdnummer).
Sorteer aflopend op spelersnr.

```SQL
```
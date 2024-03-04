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
<br>

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
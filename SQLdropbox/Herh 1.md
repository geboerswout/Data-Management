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

```

## Oefening 3 <mark>WERKT NIET HELEMAAL</mark>

Geef per team de verloren wedstrijden. Zorg dat teams zonder verloren wedstrijden ook in de output verschijnen.
Duid per wedstrijd aan of het om een actief bestuurslid gaat.
Sorteer op divisie en wedstrijdnummer.

```SQL
SELECT T.teamnr, divisie, wedstrijdnr, W.spelersnr, 
	CASE
		WHEN huidige_functie is not null THEN 'actief'
		ELSE '-'
	END as bestuurslid
FROM teams T left outer join wedstrijden W on T.teamnr = W.teamnr
	left join (
		SELECT spelersnr, 
			MAX(CASE WHEN eind_datum IS NULL THEN functie ELSE '-' END) AS huidige_functie
		FROM bestuursleden
		GROUP BY spelersnr
		) as B on B.spelersnr = W.spelersnr 
WHERE (gewonnen < verloren or gewonnen is null)
ORDER BY 2, 3
```

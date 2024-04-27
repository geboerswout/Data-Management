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
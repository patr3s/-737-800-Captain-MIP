# M3 kalibračný diel v1

Malý skúšobný diel určí správny priemer otvorov na konkrétnej tlačiarni, materiáli a profile 5s3a. Výsledok sa následne prenesie do všetkých veľkých nosných dielov.

## Obsah testu

Pri pohľade zhora sú štyri stĺpce zľava doprava:

| Stĺpec | Heat-set kapsa HS | Priechodzí otvor M3 |
|---:|---:|---:|
| 1 | 4,2 mm | 3,2 mm |
| 2 | 4,4 mm | 3,4 mm |
| 3 | 4,6 mm | 3,6 mm |
| 4 | 4,8 mm | 3,8 mm |

Horný rad označený `HS` má 4,2 mm hlboké slepé kapsy s 3,0 mm pilotným otvorom. Spodný rad `M3` sú priechodzie otvory.

## Tlač

- 1 kus, mierka 100 %.
- Rovnaký materiál, tryska a profil, aké sa použijú na carrier; odporúčanie PETG.
- Tryska 0,4 mm, vrstva 0,20 mm, 4 steny, 5 horných/spodných vrstiev.
- Položiť veľkou rovnou plochou na podložku, bez podpier.
- Rozmer dielu: 84 × 46 × 6 mm.

## Vyhodnotenie

1. Heat-set vložka má pri zahrievaní vojsť kolmo, bez praskania steny a po vychladnutí sa nesmie pretáčať ani vytiahnuť rukou.
2. M3 skrutka má cez zvolený priechodzí otvor prejsť rukou bez rezania závitu, ale bez zbytočne veľkej bočnej vôle.
3. Zapíšte zvolený stĺpec a materiál do tabuľky nižšie.

| Parameter | Výsledok |
|---|---|
| Tlačiareň | Anycubic Kobra X |
| Materiál/značka |  |
| Teplota trysky/podložky |  |
| Zvolená HS kapsa |  |
| Zvolený M3 otvor |  |
| Poznámka |  |

## Výsledok 5s3a – 2026-08-28

- Anycubic PETG sivý, tryska 230 °C, podložka 75 °C, flow 0,96, vrstva 0,20 mm.
- Rozmer 83,82 × 45,85 mm oproti 84 × 46 mm: rovnomerné zmrštenie približne 0,25 %.
- Najlepší M3 priechodzí otvor: **3,2 mm**.
- Heat-set kapsy neboli testované, pretože vložky ešte nie sú zakúpené.

Parameter `m3_clearance` je v nových revíziách nastavený na 3,2 mm pre tento materiál a profil. Pri zmene materiálu alebo flow sa test opakuje.

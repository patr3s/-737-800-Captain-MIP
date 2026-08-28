# Backlight test panel v1 – pokyny pre tlač

## Diely

Vytlačiť po jednom kuse:

- `737-MIP-CAL-002_backlight-base_v1.stl`
- `737-MIP-CAL-002A_backlight-face_v1.stl`
- `737-MIP-CAL-002B_backlight-diffuser_v1.stl`

## Materiál a farby

- Základňa: biely PETG.
- Predná face vrstva: čierny PETG.
- Difúzor: biely PETG; ak je k dispozícii natural/translucent PETG, možno vytlačiť aj druhý difúzor na porovnanie.
- Diely zatiaľ nestriekať. Testujeme priepustnosť svetla priamo cez materiál.

## Nastavenie

- Tryska 0,4 mm.
- Vrstva 0,20 mm; pre čiernu face vrstvu možno použiť 0,16 mm pre čistejšie písmo.
- 4 steny.
- 100 % výplň pre face a difúzor.
- 25 % gyroid pre základňu.
- 5 horných a spodných vrstiev.
- Bez podpier.
- Mierka presne 100 %.
- Každý diel položiť najväčšou rovnou plochou na podložku.

## Zostavenie testu

1. Odstrániť iba voľné vlákna; písmo nevŕtať ani nezväčšovať.
2. Difúzor položiť na svetlú základňu a navrch položiť čiernu face vrstvu.
3. Zarovnať štyri rohové M3 otvory. Na prvý svetelný test možno vrstvy spojiť dočasne páskou alebo štyrmi M3 skrutkami a maticami.
4. Do zadného kanála vložiť krátky kus LED pásu alebo jednotlivé LED podľa dostupného bezpečného napájania.
5. LED nepripájať priamo na Arduino pin. Použiť vhodný zdroj a obmedzenie prúdu podľa typu LED.
6. Testovať v dennom svetle aj v tme a odfotiť panel spredu.

## Čo vyhodnotiť

- či sú `PANEL`, `DIM`, `DUAL`, `TEST` a symbol rovnomerne presvietené,
- či čierna vrstva neprepúšťa svetlo mimo znakov,
- či vidno jednotlivé body LED,
- ktorý difúzor dáva lepší výsledok,
- či treba hlbší LED kanál alebo väčší odstup difúzora.

Otvor pri nápise `DUAL` je iba technologický placeholder. Dual-concentric encoder sa doň zatiaľ nemontuje.


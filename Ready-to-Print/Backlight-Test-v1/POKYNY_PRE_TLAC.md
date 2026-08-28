# Backlight test panel v1 – pokyny pre tlač

## Diely

Vytlačiť po jednom kuse:

- `737-MIP-CAL-002_backlight-base_v1.1.stl`
- `737-MIP-CAL-002A_backlight-face_v1.1.stl`
- `737-MIP-CAL-002B_backlight-diffuser_v1.1.stl`

## Materiál a farby

- Základňa: biely PETG.
- Predná face vrstva: čierny PETG.
- Difúzor: biely PETG, hrúbka 0,4 mm (2 vrstvy pri 0,20 mm). Ak je k dispozícii natural/translucent PETG, možno vytlačiť aj druhý kus na porovnanie.
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
2. Do spredu otvoreného kanála základne vložiť dva rovné kusy 12 V bieleho COB pásika, šírka 5 mm, približne 90 mm na každej dlhej strane.
3. Difúzor položiť na svetlú základňu priamo nad LED kanál a navrch položiť čiernu face vrstvu. Poradie zozadu dopredu je: základňa → LED → 0,4 mm difúzor → čierna face vrstva.
4. Zarovnať štyri rohové M3 otvory. Na prvý test možno vrstvy spojiť páskou alebo štyrmi M3 skrutkami a maticami.
5. LED nepripájať priamo na Arduino pin. Použiť 12 V zdroj s kapacitou aspoň 0,5 A.
6. COB pásik neohýbať do strán. Rohy vynechať a dva úseky prepojiť vodičmi.
7. Testovať v dennom svetle aj v tme a odfotiť panel spredu.

## Čo vyhodnotiť

- či sú `PANEL`, `DIM`, `DUAL`, `TEST` a symbol rovnomerne presvietené,
- či čierna vrstva neprepúšťa svetlo mimo znakov,
- či vidno jednotlivé body LED,
- ktorý difúzor dáva lepší výsledok,
- či treba hlbší LED kanál alebo väčší odstup difúzora.

Otvor pri nápise `DUAL` je iba technologický placeholder. Dual-concentric encoder sa doň zatiaľ nemontuje.

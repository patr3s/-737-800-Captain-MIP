# CAL-004 – multicolor A/B backlight test

Cieľom je rozhodnúť, či biele PETG legendy môžu zároveň fungovať ako difúzor,
bez samostatnej difúznej dosky. Test neoveruje finálny Boeing font ani finálny
layout; tie zostávajú `PROVISIONAL`.

## Súbory a dva multicolor objekty

Základňu vytlačiť raz z bieleho alebo svetlého PETG:

- `737-MIP-CAL-004_backlight-base.stl`

V sliceri vytvoriť dva samostatné multicolor objekty. STL každej dvojice
načítať ako časti jedného objektu; všetky majú spoločný počiatok a mierku.

### Variant A – biela legenda cez celú hrúbku 1,0 mm

- čierna časť: `737-MIP-CAL-004_face-black.stl`
- biela časť: `737-MIP-CAL-004_legends-A-1.0mm.stl`

### Variant B – biela legenda iba 0,4 mm na prednej strane

- čierna časť: `737-MIP-CAL-004_face-black.stl`
- biela časť: `737-MIP-CAL-004_legends-B-0.4mm.stl`

Varianty tlačiť lícom na podložku. Pri variante B sú prvé dve vrstvy biele
legendy a čierne okolie; nad legendami zostáva 0,6 mm otvor v čiernej vrstve.

## Profil

- Anycubic PETG: čierny + biely, bez striekania.
- Tryska 0,4 mm, vrstva presne 0,20 mm.
- Mierka 100 %, bez podpier.
- 4 steny; face objekty 100 % výplň, základňa 25 % gyroid.
- Pre overený Anycubic PETG: 230 °C tryska, 75 °C podložka, flow 0,96.
- Skontrolovať purge tower a dostatočné prečistenie po zmene čierna/biela.

## Svetlo a zostavenie

Do predného kanála základne vložiť dva rovné približne 90 mm úseky bieleho
12 V COB LED pásika širokého 5 mm. Pásik nepripájať na Arduino pin. Použiť
12 V zdroj aspoň 0,5 A. Face variant položiť priamo na základňu a dočasne
uchytiť štyrmi M3 skrutkami, podložkami a maticami.

## Čo porovnať

- čitateľnosť vypnutého panelu za denného svetla,
- jas a rovnomernosť popisov v tme aj pri izbovom svetle,
- presvitanie čiernej plochy a svetelné lemy,
- viditeľnosť vrstiev alebo bodov LED,
- čistotu písmen a symbolu po multicolor tlači,
- najtenší reálne vytlačený ťah písma.

Výsledok zapísať osobitne pre A a B a priložiť fotografie s rovnakým
nastavením expozície. Samostatný difúzor sa z finálneho návrhu odstráni až
vtedy, keď jeden variant týmto testom prejde.

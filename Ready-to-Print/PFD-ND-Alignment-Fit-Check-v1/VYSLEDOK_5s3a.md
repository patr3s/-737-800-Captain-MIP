# Výsledok CAL-003 – PFD/ND alignment fit-check v1

Tlačil a meral: 5s3a, 2026-08-31. Anycubic Kobra X, tryska 0,4 mm.

## Verdikt

**Všetky akceptačné kritériá splnené.** Geometria stredu je potvrdená, veľký
445 mm modul môže ísť ďalej.

Zároveň sú v CAD **tri chyby**, ktoré znemožnili fyzicky vykonať dva kroky
montáže. Kritériá sa dali overiť meraním, ale diely v tejto podobe nesadnú.

| Kritérium | Cieľ | Namerané | |
|---|---|---|---|
| Medzera medzi bezelmi | 6,6 ±0,2 | **6,60** | OK |
| Viditeľný otvor | 40,1 ±0,3 | **39,99** | OK |
| Stupeň v prednom spoji fascie | max 0,2 | **0,01** | OK |
| M3 skrutky cez otvory 3,2 | rukou | tesnejšie, viď nižšie | pozn. |
| Praskliny, násilné lícovanie | žiadne | žiadne | OK |

## Nastavenie tlače

Podľa pokynov, na overenom profile z CAL-001:

| Položka | Hodnota |
|---|---|
| Filament | Anycubic PETG, sivý |
| Tryska / podložka | 230 °C / 75 °C |
| Flow | 0,96 |
| Vrstva | 0,20 mm |
| Steny | 4 |
| Horné/spodné vrstvy | 5 |
| Výplň | 25 % gyroid |
| Podpery | žiadne, 100 % mierka |

Všetkých 9 dielov na jednu podložku, súčet plôch 24 456 mm² z 260 × 260 mm.

## A. Jednotlivé diely

| Diel | Rozmer | Nominál | Namerané |
|---|---|---|---|
| carrier_left | šírka × výška | 70,00 × 80,00 | 70,02 × 80,00 |
| carrier_left | hrúbka | 5,00 | 5,03 |
| carrier_left | vnútorná lišta | 16,25 | 16,23 |
| carrier_right | šírka × výška | 70,00 × 80,00 | 70,02 × 79,98 |
| carrier_right | hrúbka | 5,00 | 5,00 |
| carrier_right | vnútorná lišta | 16,25 | 16,32 |
| bezel_left | šírka × výška | 30,00 × 80,00 | 30,09 × 80,00 |
| bezel_left | hrúbka | 4,80 | 4,79 |
| bezel_left | vnútorná lišta | 16,75 | 16,84 |
| bezel_right | šírka × výška | 30,00 × 80,00 | 30,04 × 79,96 |
| bezel_right | hrúbka | 4,80 | 4,77 |
| bezel_right | vnútorná lišta | 16,75 | 16,79 |
| fascia_center | šírka jazyka | 6,20 | **6,20** |
| fascia_center | celková šírka | 26,00 | 26,05 |
| carrier_joiner | dĺžka | 92,00 | 91,95 |
| fascia_seam_left / right | šírka | 60,00 | 59,99 / 60,00 |

### Dôležité: zmrštenie z CAL-001 na tieto diely neplatí

CAL-001 sa zmrštil o **0,25 %**. Tieto diely vyšli **na nominál alebo mierne
nad** (70 → 70,02, 80 → 80,00, 60 → 59,99).

Pravdepodobná príčina: CAL-001 je plný 6 mm blok, kým tieto sú tenké platne
s 25 % gyroidom. Menej materiálu, menšie zmršťovacie napätie.

**Dôsledok:** obava z 0,5 mm manka na 203,2 mm DU bezeli je pri tomto profile
neopodstatnená. XY compensation netreba. Zmrštenie treba brať ako veličinu
závislú od profilu a objemu dielu, nie ako konštantu materiálu.

### Meranie lišty vs. meranie zostavy

Súčet lišt dáva 6,60 + 16,84 + 16,79 = **40,23**, ale zostava reálne meria
**39,99**. Rozdiel 0,24 mm.

Dôveryhodnejšie je meranie zostavy — je to jedno priame meranie toho, na čom
záleží. Lišty sa merajú cez hranu otvoru, ktorá má po tlači mierny rádius,
a posuvka tam číta o niečo viac. Pri ďalších kupónoch odporúčam kritické
rozmery merať na zostave, nie skladať ich zo súčtu dielov.

## B. M3 priechodzie otvory

Všetkých 12 otvorov priechodných. Skrutka prvýkrát prejde **jemným ľahkým
skrutkovaním**, po prvom prechode už ide rukou. Diely držia dobre a nehrkajú.

Pre tento kupón je to skôr výhoda — spoje sa samy vycentrujú. **Pre veľký
modul to ale odporúčam prehodnotiť:** pri spoji s viacerými otvormi naraz sa
odchýlky sčítajú a zostavu nepolícuješ, ak je každý otvor na interferenciu.
Priechodzí otvor má mať vôľu práve na pohltenie tolerancie.

Návrh: **3,2 mm ponechať tam, kde ide o presnú polohu** (bezel voči carrieru),
**3,4 mm na spoje s viacerými otvormi naraz.**

Poznámka: kalibrácia 3,2 mm z CAL-001 bola robená na **default profile**,
zatiaľ čo tento kupón sa tlačil na **4 steny**. Viac stien otvory utiahne.
Kalibrácia priechodzieho otvoru je viazaná na profil, nielen na materiál.

---

# Chyby v CAD

## 1. `fascia_center` sa nedá zasunúť do medzery — blokujúce

`fascia_center` je plochá doska hrúbky 3,2 mm. Jazyk aj obe krajné nohy ležia
v **jednej rovine**:

- nohy: 26 mm široké, z = 0 … 3,2
- jazyk: 6,2 mm široký, z = 0 … 3,2

Nohy dosadnú na horný povrch bezelov vo výške 9,8 mm, takže jazyk skončí
**nad** medzerou, nie v nej. Krok 3 pokynov *„Insert the narrow fascia-center
coupon between the bezel edges"* sa vykonať nedá.

Aby to fungovalo, jazyk musí vyčnievať pod rovinu nôh o hrúbku bezelu,
teda **4,8 mm**. Taký odskok v module nie je.

**Kritérium sa napriek tomu podarilo overiť meraním:**

- medzera medzi bezelmi: **6,60 mm**
- jazyk: **6,20 mm**
- vôľa: **0,40 mm**, teda presne 0,20 mm na stranu podľa návrhu

Rozmerovo je to teda správne. Po doplnení odskoku v Z diel sadne.

## 2. `fascia_seam_joiner` má nesediacu rozteč dier — blokujúce

Odmerané priamo z STL v `Ready-to-Print`:

| Diel | Poloha diery | Rozteč po zložení |
|---|---|---|
| fascia_seam_left | x = 50,0 | **20 mm** |
| fascia_seam_right | x = 70,0 | |
| fascia_seam_joiner | x = 10,0 a 60,0 | **50 mm** |

Obe polovice majú dieru 10 mm od škáry, teda 20 mm od seba. Spojka ich má
50 mm od seba. Rozdiel 30 mm — vždy sadne len jedna skrutka.

Stupeň v spoji sa dal odmerať aj bez spojky (polovice zrazené na tupo),
výsledok **0,01 mm**. Spojka drží diely pri sebe, rovinnosť škáry určujú
samotné diely.

## 3. `assembly_preview()` umiestňuje `fascia_center` o 3,1 mm vedľa — kozmetické

```scad
translate([coupon_w + (carrier_gap - fascia_center_w)/2 - 13, ...])   // 57,2
```

Mieša sa tu vôľa na stranu `(carrier_gap - fascia_center_w)/2 = 0,2`
s polovicou medzery `carrier_gap/2 = 3,3`. Správne má byť:

```scad
translate([coupon_w + carrier_gap/2 - 13, ...])                       // 60,3
```

Jazyk tak v preview vychádza v strede na 70,2 namiesto 73,3 a prekrýva
`bezel_left`.

Toto je pravdepodobne dôvod, prečo sa chyba č. 1 neodhalila — v preview diel
vyzeral ako maska ležiaca navrchu a nebolo vidieť, že sa má zasúvať.

Poznámka: `assembly_preview()` neobsahuje ani tri seam diely, takže chyba
č. 2 tiež nebola vizuálne skontrolovateľná. Odporúčam do preview doplniť
všetkých 9 dielov.

---

# Čo potrebujeme od patr3s

| # | Vec | Blokuje |
|---|---|---|
| 1 | Odskok jazyka `fascia_center` o 4,8 mm v Z | zasunutie fascie |
| 2 | Rozteč dier `fascia_seam_joiner` na 20 mm | spojenie seam polovíc |
| 3 | Oprava posunu v `assembly_preview()` | vizuálna kontrola |
| 4 | Doplniť seam diely do `assembly_preview()` | vizuálna kontrola |
| 5 | Zvážiť 3,4 mm otvory na viacotvorové spoje | veľký modul |
| 6 | Odmerať OD a dĺžku heat-set vložky | heat-set test |

Chyby 1 a 2 nemenia nič na akceptácii — rozmery sú overené meraním
a sedia. Ide o geometriu montáže, nie o presnosť tlače.

Fotografie posielam samostatne.

# Spätná väzba od 5s3a

Tlačiareň: Anycubic Kobra X, tryska 0,4 mm, podložka 260 × 260 mm.
Dátum: 2026-08-28.

---

# 1. CAL-001 – M3 kalibračný kupón v1 — VYTLAČENÉ

## Použitý materiál a nastavenie

| Položka | Hodnota |
|---|---|
| Filament | **Anycubic PETG, sivý** |
| Tryska | **230 °C** |
| Podložka | **75 °C** |
| Flow | **0,96** |
| Vrstva | 0,20 mm |
| Profil | default Anycubic Slicer Next |

Tlačené podľa pokynov: bez podpier, bez brimu, veľkou rovnou plochou na podložku,
mierka 100 %.

## Rozmerová kontrola

| Os | Nominál | Meranie | Odchýlka |
|---|---|---|---|
| dlhá | 84,00 mm | **83,82 mm** | −0,18 mm (−0,21 %) |
| krátka | 46,00 mm | **45,85 mm** | −0,15 mm (−0,33 %) |

Zmrštenie rovnomerné na oboch osiach. Rohy nezdvihnuté, otvory kruhové,
diel bez chýb.

## Spodný rad – M3 priechodzí otvor

**Najlepší stĺpec: 1 (3,2 mm).**

M3 skrutka prejde rukou bez sily, bez rezania závitu a nekýva sa do strán.
3,2 mm je zároveň spodná hranica rozsahu kupónu — je možné, že by prešlo
aj tesnejšie, ale kupón to už netestuje.

**Odporúčanie: `m3_clearance = 3.2` namiesto súčasných 3,4 mm.**

Tesnejší otvor uberá vôľu v rastri montážnych otvorov. Pri 203,2 mm bezeloch
sa to hodí — viď poznámka o zmrštení v sekcii 5.

## Horný rad – heat-set kapsa

**Netestované.** Vložky ešte nie sú kúpené (BOM ich vedie ako `TBD`),
osadenie a vyhodnotenie si robí patr3s sám.

### Tri veci, ktoré treba vedieť pred tým testom

1. **Hĺbka kapsy 4,2 mm počíta s vložkou dlhou ~4,0 mm.**
   Pod kapsou je 3,0 mm pilot, takže dlhšia vložka sa nemá kam schovať.
   Bežné M3 vložky typu CNC Kitchen / Voron majú **5,7 mm** — tie by trčali
   1,5 mm nad povrch a do 6 mm hrubého kupónu sa nezmestia vôbec.
   Pred testom odmerať dĺžku posuvkou.

2. **Rozsah 4,2 / 4,4 / 4,6 / 4,8 mm predpokladá vložku s OD ~4,0 mm.**
   Ak majú vložky OD 4,6 mm, stĺpce 3 a 4 sú nominál a väčšie — tie sa
   zaručene pretočia a test reálne vyhodnotí len dva stĺpce.

3. **Táto tlačiareň tlačí otvory blízko nominálu.** Dokazuje to stĺpec 1
   pri M3 — pri FDM sa bežne očakáva, že otvory vyjdú menšie, tu nie
   (flow 0,96, zmrštenie 0,25 %). Kapsy teda vyjdú skôr **voľnejšie**,
   než je zvykom. Pri výbere sa prikloniť k menším kapsám (4,2 / 4,4),
   inak hrozí pretáčanie vložky pod momentom.

---

# 2. Empirický nález k difúzii svetla

**Na difúziu stačia 2 vrstvy à 0,20 mm bielej PETG, teda 0,4 mm.**
Overené v praxi, dáva zatiaľ najlepší výsledok.

Toto má priamy dopad na `Backlight_test_panel_v1`:

| Prvok | Súčasný návrh | Poznámka |
|---|---|---|
| Materiál nad LED kanálom v základni | **1,9 mm** (`base_t 3.2` − kanál 1,3) | ~5× viac, než treba |
| Samostatný difúzor `diffuser_t` | **0,8 mm** | 2× viac, než treba |

1,9 mm bielej PETG nad LED-kami zožerie veľkú časť svetla. Panel bude tmavý
a bude to vyzerať ako slabé LED, pričom problém bude v hrúbke steny.

**Návrh:** kanál prehĺbiť tak, aby nad ním zostalo ~0,4–0,6 mm materiálu,
alebo difúziu riešiť samostatnou 0,4 mm vrstvou a základňu nad LED úplne
otvoriť. Vieme vytlačiť obe verzie a porovnať, ak pošleš druhý variant.

---

# 3. Backlight-Test-v1 — zatiaľ NEVYTLAČENÉ

Kontrolované pred tlačou, tri nálezy. Prvý je blokujúci.

## 3.1 Face vrstva má 5 voľných ostrovčekov — blokujúce

`737-MIP-CAL-002A_backlight-face_v1.stl` obsahuje **6 samostatných shellov**
namiesto jedného. Nápisy sú v `dark_face()` rezané cez celú hrúbku
(`linear_extrude(face_t+0.2) labels_2d()`), takže vnútra písmen zostanú
ako nezávislé kusy:

| Písmeno | Poloha x (mm) | Poloha y (mm) |
|---|---|---|
| `D` v DUAL | 80,5–83,2 | 42,2–46,0 |
| `D` v DIM | 23,3–26,5 | 21,8–26,3 |
| `P` v PANEL | 14,4–17,4 | 42,2–44,7 |
| `A` v DUAL | 92,6–94,3 | 43,6–46,1 |
| `A` v PANEL | 21,4–23,6 | 41,4–44,7 |

Sú to voľné kúsky ~2–3 mm × 1 mm bez spojenia so zvyškom dielu. Tryska ich
pri tlači posunie po podložke. Diel sa v tejto podobe nedá vytlačiť.

**Riešenie** — jedno z dvoch:
- stencil font s mostíkmi v písmenách, alebo
- text nechať ako priehlbinu (napr. 0,6 mm) namiesto prierezu

Voľba závisí od toho, či má cez znaky svietiť svetlo priamo, alebo cez
tenkú stenu. Vzhľadom na nález v sekcii 2 (0,4 mm bielej PETG difunduje dobre)
by druhá možnosť mohla byť lepšia aj opticky — znaky by svietili rovnomerne
bez ostrých hrán.

## 3.2 Poradie vrstiev — pokyny si protirečia s CAD-om

`POKYNY_PRE_TLAC.md`, bod 2 zostavenia:

> Difúzor položiť na svetlú základňu a navrch položiť čiernu face vrstvu.

Ale `assembly_preview()` v `.scad` má difúzor **pod** základňou:

```scad
translate([4,4,-diffuser_t]) diffuser();
```

Tam difúzor nie je medzi LED a pozorovateľom — kryje LED kanál zozadu, teda
funguje skôr ako zadný kryt/reflektor a difúziu robí samotná 1,9 mm základňa.
To je konzistentný návrh, ale nie ten, čo popisujú pokyny. **Ktoré platí?**

## 3.3 LED kanál má 1,4 mm — obmedzuje výber pásika

`linear_extrude(1.4)` v `light_base()`.

Rozmery kanála odvodené z CAD:

| Parameter | Hodnota |
|---|---|
| Šírka drážky | 6 mm |
| Hĺbka drážky | 1,4 mm |
| Dráha stredom | 98 × 40 mm, obvod ~276 mm |
| Dĺžka dlhej strany | ~98 mm |
| Servisný vývod | 8 × 1,6 mm, pravý okraj |

Do 6 × 1,4 mm sa **5050 pásik nezmestí** (10 mm široký, 2,0–2,5 mm hrubý).
Štandardný 8 mm pásik tiež nie — je širší než drážka.

**Čo do toho ide: COB LED pásik, 12 V, biely, šírka 5 mm.**

- **COB** (chip-on-board) má súvislú vrstvu luminoforu namiesto jednotlivých
  diód. Test sa priamo pýta *„či vidno jednotlivé body LED"* — s COB-om táto
  otázka odpadne.
- **12 V**, nie 24 V: 12 V pásiky sa strihajú po 25–50 mm, 24 V po 100 mm.
  Dlhá strana má 98 mm, s 24 V sa netrafíme.
- **5 mm šírka**, nie štandardných 8 mm — do 6 mm drážky.

**Upozornenie na hrúbku:** holý pásik má ~1,0–1,2 mm, ale s 3M lepiacou
páskou na chrbte **1,4–1,6 mm**, teda na hranici alebo cez ňu. Buď pásik bez
lepidla, alebo prehĺbiť kanál na 2,0 mm. Základňa má 3,2 mm, priestor tam je —
a podľa sekcie 2 by sa aj tak mal prehĺbiť.

**Poznámka k zapojeniu na test:** pásik sa neohýba do strán, len pozdĺž.
Obvod dokola by znamenal strih a spájku v štyroch rohoch. Na test stačia
**dva rovné kusy po ~90 mm na dve dlhé strany**, rohy vynechať. ~18 cm pásika
je do 2 W, stačí 12 V adaptér od 0,5 A.

## 3.4 Rozmery overené proti podložke

| Diel | Rozmer (mm) | Stav |
|---|---|---|
| CAL-001 kupón | 84,0 × 46,0 × 6,0 | OK |
| CAL-002 base | 120,0 × 62,0 × 3,2 | OK |
| CAL-002A face | 120,0 × 62,0 × 1,0 | OK |
| CAL-002B diffuser | 112,0 × 54,0 × 0,8 | OK |

Montážne otvory aj otvor pre encoder si medzi base, face a diffuser
v zostave sedia — kontrolované, bez posunu.

---

# 4. Pripomienka k BenQ VESA cradle v1

**Návrh: nosnú funkciu neriešiť tlačeným dielom.**

Dva technické dôvody:

## 4.1 PETG tečie pod dlhodobým statickým zaťažením

VESA platňa 170 × 170 × 7 mm bude mesiace niesť monitor. PETG má výrazný
**creep** — pomaly sa dotvaruje pod konštantným zaťažením, aj hlboko pod
medzou pevnosti. `PRINT_BenQ_cradle_v1.md` rieši len rovinnosť po tlači:

> VESA platňa nesmie byť prehnutá; skontrolovať pravítkom cez obe diagonály.

O dotvarovaní v čase sa nehovorí nič. Platňa môže byť po tlači rovná
a po pol roku prehnutá.

## 4.2 Plynové rameno tu nie je alternatíva

Napadlo ma nahradiť cradle pneumatickým držiakom, ale nefunguje to z dvoch dôvodov:

- **Monitor je príliš ľahký.** 18,5" bez stojana váži cca 2–2,5 kg, väčšina
  plynových ramien má *minimálnu* nosnosť okolo 2 kg. Pod ňou pružina monitor
  tlačí hore a neudrží polohu.
- **Rameno je navrhnuté, aby sa hýbalo** — a to je presne to, čo tu nechceme.
  Celý zmysel cradlu je držať aktívnu plochu presne za DU výrezmi
  (posun hornej hrany 6,25 mm, slotované VESA otvory ±2,4 mm, skrutky sa
  doťahujú až *„po zarovnaní obrazu"*). Jedno drgnutie a zarovnanie je preč.

## 4.3 Návrh

**Pevný oceľový VESA 100 držiak** (stenový/plochý, bežne 8–15 €), prikrutený
na rám kokpitu. Nesie záťaž, nedotvaruje sa, nehýbe sa.

Z PETG sa potom vytlačia len **tenké podložky a dorazy na doladenie polohy**,
navrhnuté až po suchej montáži, keď bude vidieť skutočnú odchýlku.
Z 11 tlačených dielov (1 platňa + 4 krídla + 4 ramená + 2 stabilizátory)
by zostali možno 2 malé.

Vieme, že to mení rozhranie na PFD/ND carrier — zaťaženie by už nešlo cez
bočné ramená do okrajov carrieru. Preto je to pripomienka na zváženie,
nie hotové riešenie.

---

# 5. Poznámka k veľkým dielom

Pri nameranom zmrštení −0,25 % vyjde DU bezel s nominálom 203,2 mm ako
~202,7 mm, teda **0,5 mm manko cez celý panel**. Pri M3 priechodzích otvoroch
sa to schová, ale ak sa bezel lícuje na reálny hardvér, treba s tým počítať.

XY size compensation vieme v sliceri zapnúť kedykoľvek. Zatiaľ nie je dôvod —
rovnomerné zmrštenie 0,25 % je pre PETG veľmi dobrý výsledok
(bežne 0,3–0,8 %).

Platí len pre **Anycubic PETG sivý**. Pri zmene značky alebo šarže premerať
znova, ako správne upozorňuješ v pokynoch.

---

# 6. Čo potrebujeme od patr3s

| # | Vec | Blokuje |
|---|---|---|
| 1 | Opraviť voľné ostrovčeky vo face vrstve (3.1) | tlač Backlight-Test-v1 |
| 2 | Potvrdiť poradie vrstiev — pokyny vs. CAD (3.2) | zostavenie testu |
| 3 | Zvážiť prehĺbenie LED kanála a stenu nad LED (2, 3.3) | výber pásika |
| 4 | Odmerať OD a dĺžku heat-set vložky (1) | heat-set test |
| 5 | Vyjadriť sa k BenQ cradle (4) | tlač 11 dielov |

Fotografie CAL-001 posielam samostatne.

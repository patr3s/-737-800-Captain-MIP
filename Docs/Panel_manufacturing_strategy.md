# Stratégia výroby panelov

Rozhodnuté 2026-09-03 (5s3a + patr3s). Týka sa všetkých predných panelov
s popismi a nosnej konštrukcie MIP.

## Rozhodnutia

1. **Skriňa, rámy a konzoly** sa vyrobia CNC frézovaním z **Forexu** a nalakujú.
2. **Predné panely s popismi sa tlačia**, nekupujú a nerobia z akrylátu.
3. **Popisy sa robia multicolor**, nie prierezom cez čiernu dosku.
4. **Zostávame pri parametrickom OpenSCAD zdrojáku**, cudzie STL nekupujeme.

---

## 1. Delenie výroby

| Časť | Technológia | Prečo |
|---|---|---|
| Skriňa MIP, rámy, konzoly, prepážky | Forex CNC + lak | Tabuľa 2 × 3 m, veľký diel vyjde v jednom kuse bez škár |
| Svetlotesné škatule za panelmi | tlač | 3D geometria, priehradky medzi popismi, kanály na LED |
| **Predné panely s popismi** | **tlač, multicolor** | viď sekcia 2 |
| Bezely, puzdrá gombíkov, držiaky encoderov | tlač | hĺbka, závity, dosadacie plochy |

### Prečo Forex nejde na predné panely

Forex je uzavretobunková PVC pena — nepriehľadná, svetlo v nej zaniká.
Vyfrézovaný popis s LED za ním nesvieti. Forex ide **len na nepodsvietené
konštrukčné diely**.

### Pozor pri Forexe

Je mäkký. Skrutka v ňom nedrží, heat-set vložka sa neuchytí, hrana sa dá
zatlačiť nechtom. Všade, kde ide o moment (gombík, encoder) alebo kde sa
bude panel často odoberať, treba **tlačenú alebo hliníkovú podložnú dosku
so závitom**. Neskrutkovať priamo do Forexu.

---

## 2. Multicolor popisy namiesto stencil fontu

### Problém so súčasným riešením

Stencil font v `labels_2d()` bol núdzový obchvat okolo voľných ostrovčekov
vo `dark_face()`. Pri jednom testovacom kupóne to prejde, pri celom kokpite nie:

- reálne 737 panely stencil font nemajú, majú čistý gotický
- stencilové písmo bude na každom paneli a bude to vidieť
- obmedzuje to výber fontu na celý projekt

### Riešenie

5s3a má **ACE Pro so štyrmi cievkami**. Popisy sa vytlačia ako **samostatná
farba v tej istej vrstve**, nie ako prierez.

Z jedného `.scad` sa exportujú dva STL so zdieľaným počiatkom:

| Export | Obsah |
|---|---|
| `*-face-black.stl` | doska mínus objem písma |
| `*-face-legends.stl` | len objem písma |

V sliceri sa načítajú ako **jeden objekt s časťami** a priradí sa filament
na časť.

### Zmena v CAD

Súčasný stav — písmo rezané cez celú hrúbku:

```scad
module dark_face() {
    difference() {
        linear_extrude(face_t) rounded_rect_2d([panel_w,panel_h],corner_r);
        mounting_holes(face_t);
        translate([90,31,-0.1]) cylinder(h=face_t+0.2,d=encoder_hole);
        linear_extrude(face_t+0.2) labels_2d();   // <- necháva ostrovčeky
    }
}
```

Navrhovaná zmena — rovnaký `difference()`, ale pribudne modul na samotné písmo
a `labels_2d()` sa vráti na normálny font:

```scad
module face_legends() {
    linear_extrude(legend_t) labels_2d();
}
```

plus nová vetva v `part` prepínači na export.

### Čo sa tým získa

| | Prierez + stencil | Multicolor |
|---|---|---|
| Voľné ostrovčeky | nutný stencil font | **žiadne**, všetko je spojené |
| Typografia | obmedzená na stencil | **akýkoľvek font** |
| Difúzia | cez otvor, ostrá hrana | cez biely plast, mäkká |
| Počet vrstiev | base + difúzor + face | **base + face** |

Samostatný difúzor tým odpadá — biele písmená sú samy difúzorom. Menej dielov,
menej skrutiek, tenší panel.

---

## 3. Hrúbka bieleho písmena — dve varianty na otestovanie

5s3a empiricky overil, že **na difúziu je optimum 0,4 mm bielej PETG**
(2 vrstvy pri 0,20 mm). Pri hrubšej vrstve svetlo výrazne ubúda.

Písmeno cez celú hrúbku face vrstvy by malo 1,2 mm, teda **3× viac než optimum**.
Preto treba porovnať dve varianty:

### Varianta A — písmeno cez celú hrúbku

`legend_t = face_t`. Jednoduchšie, jeden objem. Riziko: tmavšie popisy.

### Varianta B — písmeno 0,4 mm vpredu, zvyšok otvorený

`legend_t = 0.4`, za ním zostáva 0,8 mm otvorená dutina v čiernej doske.

Tlačí sa **lícom na podložku**: prvé dve vrstvy sú biele písmo + čierne okolie,
ďalšie vrstvy už len čierne s otvorom nad písmom. Žiadne mostíky, žiadne
podpery. Tá 0,8 mm dutina navyše svetlo trochu usmerní.

**Návrh:** vytlačiť obe varianty na `Backlight_test_panel_v1` a porovnať.
Kupón na to existuje a momentálne je aj tak blokovaný — týmto sa z neho stane
užitočný A/B test namiesto opravy stencil fontu.

---

## 4. Overiť pred rozbehnutím celého MIP

**Šírka ťahu písma proti priemeru trysky.**

`CLAUDE.md` má pravidlo ≥ 0,6 mm na embosované písmo. Boeing panelové popisy
majú výšku písmen ~3–4 mm a ťahy okolo 0,5 mm — pri 0,4 mm tryske je to
jedna extrúzia, teda na hrane použiteľnosti.

Zmerať najtenší ťah v reálnej veľkosti na jednom paneli. Ak vyjde pod 0,6 mm,
sú dve možnosti:

- **0,2 mm tryska** na predné panely
- písmo mierne zväčšiť

Lepšie to zistiť teraz než po desiatich vytlačených paneloch.

---

## 5. Prečo nekupujeme cudzie súbory

Zvažovali sme kúpiť hotové panely od 737DIYSIM. Zamietnuté, lebo predávajú
prevažne STL a my potrebujeme do geometrie zasahovať:

- font sa v STL nezmení
- na multicolor sa STL nerozdelí — treba dva objemy z jedného modelu
- nepasuje to na našu Forexovú skriňu, ktorú si robíme vlastnú
- `m3_clearance` na našich 3,2 mm sa neprenastaví

Parametrický OpenSCAD zdroják tieto štyri veci umožňuje, STL nie.

**Napriek tomu stojí za to kúpiť jeden ich panel ako rozmerovú referenciu.**
Za pár eur je odladená geometria — rozteče otvorov, veľkosti výrezov pre
encodery, proporcie popisov. Netlačiť, len premerať proti nášmu návrhu.
Najlacnejší spôsob, ako overiť, či naše čísla sedia na reálny 737.

Ak by predávali aj STEP alebo zdrojáky, oplatí sa to prehodnotiť — vtedy sa
to dá upraviť. Overiť v popise produktu, čo je v balíku.

---

## Nadväzujúce úlohy

| # | Úloha | Kto |
|---|---|---|
| 1 | Prekresliť `dark_face()` na dva exporty, zahodiť stencil font | patr3s |
| 2 | Pripraviť varianty A a B hrúbky písmena na backlight kupón | patr3s |
| 3 | Vytlačiť a porovnať A/B, vybrať `legend_t` | 5s3a |
| 4 | Zmerať najtenší ťah písma proti 0,4 mm tryske | 5s3a |
| 5 | Kúpiť jeden referenčný panel na premeranie | — |

Úloha 1 zároveň ruší blokujúcu chybu s voľnými ostrovčekmi
z `Ready-to-Print/VYSLEDOK_5s3a.md`, sekcia 3.1.

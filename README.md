# 737-800 Captain MIP

Modulárny 1:1 Captain-side Main Instrument Panel pre PMDG 737-800.

## Aktuálny stav

- DU bezel v2: referenčný rozmer 203,2 × 203,2 mm; aktívny otvor 169,7 × 169,7 mm.
- PFD+ND carrier v1: parametrický návrh, rozdelený na samostatný PFD a ND rám pre tlačovú plochu 260 × 260 mm.
- BenQ 18,5\" PETG cradle v1: `HOLD/DO NOT PRINT`; hlavné zaťaženie prevezme pevný oceľový VESA 100 držiak, tlačené budú iba nenosné dorazy a adaptéry.
- DU bezel v3: parametrická backlit-ready svetlá základňa, tmavá face vrstva a samostatný difúzor.
- Backlight test panel v1: technologický kupón s LED kanálom a presvietiteľnými znakmi.
- Dual-concentric knob v1: samostatné parametrické knoby; rozmery hriadeľov sú zatiaľ provisional.
- PFD/ND fascia v1: kompletná 445 × 266 mm predná maska rozdelená na tlačiteľné segmenty; čaká na CAL-003 fit-check.
- PFD/ND Pop Out alignment: fyzická 1:1 geometria prepočítaná na BenQ 1366 × 768.
- Elektronika: Arduino Mega 2560 + MobiFlight; WINCTRL MCP/EFIS.

## Štruktúra

- `CAD/` – parametrické zdrojové modely
- `Ready-to-Print/` – overené exporty určené pre 5s3a
- `Docs/` – technické poznámky, merania a montáž
- `BOM/` – zoznam dielov a stav obstarania
- `Photos/` – fotografie prototypov a montáže

## Pravidlo vydávania dielov

Súbor sa presunie do `Ready-to-Print/` až po kontrole rozmerov, úspešnom STL exporte a kontrole, že sa zmestí na 260 × 260 mm podložku. Experimentálne exporty zostávajú pri zdroji v `CAD/`.

## Najbližší mechanický krok

Dokončiť backlight test v1.1 a heat-set kalibráciu. Následne nasucho osadiť PFD/ND carrier a vybrať pevný oceľový VESA 100 držiak pre hlavné zaťaženie BenQ.

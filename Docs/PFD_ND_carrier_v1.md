# PFD + ND carrier v1

## Účel

Carrier v1 je pevná, servisovateľná základňa pre dva samostatné DU bezely. Nie je to držiak monitora. BenQ bude mať vlastnú zadnú kolísku, doplnenú po fyzickom meraní.

## Konštrukcia

- Dva samostatné rámy PFD a ND, každý 219,2 × 219,2 × 5 mm.
- Každý hlavný diel sa zmestí na tlačovú plochu 260 × 260 mm.
- Otvor rámu je 170,7 × 170,7 mm (169,7 mm aktívny otvor + 1,0 mm montážna vôľa).
- Bezel sa upevňuje štyrmi M3 skrutkami; nominálny servisný raster je 183,2 × 183,2 mm.
- Dve samostatné spojovacie lišty so slotmi ponechávajú rozstup PFD/ND nastaviteľný.
- Horné sloty tvoria rozhranie pre budúci nosník EFIS/MCP.
- ND rám má na pravom okraji tri sloty pre napojenie center MIP.

## Dôležitá otvorená položka

Raster 183,2 × 183,2 mm bol rekonštruovaný z deklarovaných servisných bodov bezel v2 (10 mm od okrajov). Pred tlačou celej zostavy treba porovnať zdrojový alebo fyzický bezel v2. Ak sa líši, upraví sa parameter `bezel_hole_edge`.

## Odporúčaná skúšobná tlač

- Materiál: PETG pre finálny nosný diel; PLA je vhodné na rozmerový prototyp.
- Vrstva: 0,20 mm.
- Steny: 4.
- Horné/spodné vrstvy: 5.
- Výplň: 20–25 % gyroid.
- Orientácia: naplocho, zadnou stranou na podložke.
- Podpery: bez podpier.
- Kompenzácia elephant foot: podľa kalibrácie tlačiarne.

## Spojovací materiál pre carrier

- 8× M3 skrutka pre bezely (dĺžka podľa reálnej hĺbky vložky).
- 4× M3 skrutka + 4× matica alebo heat-set vložka pre dve spojovacie lišty.
- 4× M3 skrutka pre dve horné konzoly rozhrania.
- 3× M3 skrutka pre pravé rozhranie na center MIP.

## Stav verifikácie

- [x] Parametrický zdroj vytvorený.
- [x] Maximálny obrys hlavného dielu pod 260 × 260 mm.
- [x] STL exportovaný; OpenSCAD CGAL kontrola: `Simple: yes`.
- [x] Obrysy exportov skontrolované: 219,2 × 219,2 × 5 mm (PFD/ND), 92 × 18 × 5 mm (spojka), 80 × 22 × 5 mm (horné rozhranie).
- [ ] Overený raster otvorov proti bezel v2.
- [ ] Skúšobne vytlačené.
- [ ] Rozstup PFD/ND uzamknutý po fyzickej skúške.

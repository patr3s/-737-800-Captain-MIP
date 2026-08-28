# BenQ VESA cradle v1 – HOLD / DO NOT PRINT

## Rozhodnutie po revízii 5s3a

Tlačený PETG cradle sa nebude používať ako hlavný dlhodobý nosný prvok. PETG sa pri trvalom statickom zaťažení môže časom dotvarovať. Hlavné zaťaženie monitora preto prevezme pevný oceľový VESA 100 × 100 mm držiak upevnený do konštrukčného rámu MIP.

Existujúce SCAD/STL zostávajú zachované ako vývojová referencia, ale majú stav `HOLD/DO NOT PRINT`. Nové tlačené diely budú iba nastaviteľné podložky, bočné dorazy a stabilizátory bez hlavnej nosnej funkcie. Tie sa navrhnú podľa geometrie vybraného oceľového držiaka a suchej montáže.

## Použité fyzické rozmery

| Parameter | Hodnota |
|---|---:|
| Monitor | 445 × 266 × 60 mm |
| Aktívna LCD plocha | 410 × 232 mm |
| Aktívna plocha odľava/zhora | 18 / 18 mm |
| VESA | 100 × 100 mm |
| Ľavá horná VESA diera odľava/zhora | približne 170 / 80 mm |

Carrier má po nastavení stredovej medzery 7,0 mm celkovú šírku 445,4 mm. Monitor sa centruje vodorovne. Jeho horná hrana je voči carrieru posunutá o 6,25 mm, čím aktívna plocha začína na rovnakej výškovej referencii ako DU otvory.

## Architektúra

- Centrálna VESA platňa 170 × 170 × 7 mm nesie hlavné zaťaženie monitora.
- Štyri zadné krídla prepájajú platňu s bočnými hĺbkovými ramenami.
- Štyri bočné ramená prenášajú zaťaženie do vonkajších okrajov PFD/ND carrieru.
- Dve spodné podpery s nastaviteľným M3 nylonovým alebo TPU dotykom iba tlmia pohyb. Nesmú nadvihovať monitor ani preberať hlavné zaťaženie.
- Monitor sa po odskrutkovaní štyroch VESA skrutiek vyberá zozadu; zadná zostava nezakrýva bočné oblasti konektorov.
- Žiadny samostatný tlačený diel neprekračuje 170 × 170 × 78 mm.

## Nastaviteľnosť

Všetky štyri VESA otvory majú zaoblený dvoj-osový obrys 10 × 10 mm s minimálnou šírkou 5,2 mm. Umožňujú približne ±2,4 mm korekciu v horizontálnom aj vertikálnom smere súčasne. Pri montáži sa použijú široké podložky, všetky skrutky sa najprv nechajú voľné a dotiahnu sa až po zarovnaní obrazu.

## Spojovací materiál

- Tlačené spoje: M3 skrutky, podložky a M3 heat-set vložky.
- VESA do monitora: 4× skrutka podľa skutočného závitu monitora, pravdepodobne M4. M3 skrutku nepoužívať len preto, že ostatné spoje sú M3.
- Maximálnu hĺbku zaskrutkovania do monitora treba overiť fyzicky. Skrutka sa nikdy nesmie dotiahnuť na doraz vo vnútri monitora.
- Odporúčané široké podložky pod všetky podlhovasté otvory.

## Prístup ku konektorom

Krídla sú umiestnené v zadnej stredovej rovine a bočné ramená mimo obrysu monitora. VGA a napájací konektor musia byť pri prvej suchej montáži overené so zapojenými káblami. Kábel potrebuje voľný polomer ohybu; ak konkrétny konektor koliduje, príslušné krídlo sa presunie v slote, nie kábel násilne ohne.

## Poradie montáže

1. Zmontovať PFD a ND carrier so stredovou medzerou 7,0 mm, zatiaľ bez monitora.
2. Osadiť bočné hĺbkové ramená, ale M3 skrutky nechať mierne povolené.
3. Pripojiť štyri zadné krídla k VESA platni.
4. Priložiť zostavu k monitoru a overiť závit aj bezpečnú dĺžku VESA skrutiek.
5. Zavesiť monitor cez VESA, zapojiť VGA aj napájanie a skontrolovať prístup.
6. Zarovnať aktívnu plochu za DU otvormi a postupne dotiahnuť VESA a M3 spoje.
7. Spodné stabilizátory nastaviť iba na ľahký dotyk s krytom monitora.

## Pred tlačou celej zostavy

- Vytlačiť M3 kalibračný diel a preniesť výsledný priemer heat-set kapsy do parametra `m3_insert`.
- Fyzicky overiť, že VESA závit je M4 a zistiť bezpečnú dĺžku skrutky.
- Overiť raster servisných otvorov DU bezel v2.
- Urobiť suchý CAD/ručný test polohy VGA a napájacieho konektora podľa fotografie zadnej strany.

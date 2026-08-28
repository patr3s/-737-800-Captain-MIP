# Viditeľná PFD/ND časť a backlight v1

## Rozmerová politika

Referenčný PMDG screenshot sa používa iba na identifikáciu vizuálneho usporiadania a typov ovládačov. Rozmery odvodené iba z pixelov sa nepoužívajú ako výrobné rozmery.

Potvrdené rozmery DU sú 203,2 × 203,2 mm a otvor 169,7 × 169,7 mm. Nový bezel v3 používa rovnaký nominálny servisný raster 183,2 × 183,2 mm ako carrier v1. Raster treba pred veľkou tlačou overiť vytlačením rohového fit-check dielu alebo fyzickým meraním.

## DU bezel v3

Bezel je rozdelený na:

- svetlú nosnú základňu 3,2 mm,
- tmavú prednú vrstvu 1,2 mm,
- samostatný 0,4 mm difúzny prstenec,
- spredu otvorený LED kanál široký 5,6 mm a hlboký 2,0 mm pre 5 mm COB pásik,
- štyri alternatívne vývody kabeláže,
- štyri servisné M3 otvory.

Rovnaký model sa použije pre PFD aj ND. Čierna predná vrstva sa môže tlačiť priamo alebo nastriekať; svetlá základňa a difúzor majú zostať svetlé/priesvitné v miestach presvietenia.

## Dual-concentric ovládače

Červeným označené ovládače na referencii sú dvojité koncentrické prvky. Panelový otvor aj oba knob kryty sú parametrické. Aktuálne skúšobné hodnoty 10,2 mm panelový otvor, 8,2 mm spodný shaft a 6,2 mm horný shaft sú **provisional** a nesmú sa použiť ako finálny fit bez zmerania konkrétneho enkódera.

Knoby sú oddelené diely:

- spodný knob: 28 × 10 mm,
- horný knob: 17 × 14 mm,
- radiálny pilot pre M3 zaisťovaciu skrutku.

## Backlight testovací panel

Opravená revízia 1.1 panelu 120 × 62 mm testuje:

- dvojmateriálovú skladbu svetlá základňa/tmavá maska,
- presvietiteľné texty a symbol,
- 0,4 mm difúzor medzi LED a čiernou face vrstvou,
- 2,0 mm spredu otvorený LED kanál a bočný vývod,
- otvor pre budúci dual-concentric encoder,
- servisné M3 upevnenie.

Použiť dva rovné približne 90 mm úseky 12 V bieleho COB pásika širokého 5 mm. Čierna face vrstva používa stencil písmo, takže stredy písmen nie sú samostatné neprintovateľné ostrovčeky. Samostatný dimmer okruh má používať vlastné dva vodiče a spoločný bod napájania až v elektronickej rozvodnici.

## V1 výnimky

- Analógový flap indicator môže zostať nefunkčný placeholder alebo byť vynechaný.
- Zeleno označený manuálny ukazovateľ sa do v1 nezahŕňa.

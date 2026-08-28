# PFD/ND fascia v1

## Purpose

The fascia covers the full 445 × 266 mm monitor envelope and masks every LCD area outside the two confirmed 169,7 mm DU openings. Two 203,2 mm bezel assemblies install into 203,6 mm fascia cutouts, providing 0,2 mm nominal clearance per edge.

## Printable segmentation

The fascia is divided into seven base/face segments:

- top-left and top-right rails,
- bottom-left and bottom-right rails,
- left outer rail,
- center rail,
- right outer rail.

Top and bottom center seams use rear 70 × 16 × 3 mm M3 joiner plates. The narrow center rail is captured by the two bezels and the top/bottom rails; it is a mask, not a primary structural member. Carrier frames behind the fascia provide the main printed-module stiffness.

No fascia segment exceeds 222,5 × 203,6 mm, so every part fits the 260 × 260 mm Kobra X bed.

## Layer philosophy

- Light base: 3,2 mm white/light PETG.
- Dark face: 1,0 mm black PETG.
- Optional diffuser under future illuminated top/bottom legends: 0,4 mm white/natural PETG.
- Rear cable routes are reserved for a separate panel-dimmer circuit.
- The DU bezel v3 carries its own 5,6 × 2,0 mm channel for 5 mm COB lighting.

No unverified Boeing legend positions are engraved in v1. The screenshot is used only as a visual reference; future legends remain parameterized until reliable 1:1 dimensions are available.

## Service

The fascia and bezels are removed from the front with M3 screws. The monitor remains independently supported by the future fixed steel VESA bracket and is removed from the rear. Fascia/carrier parts only establish alignment and light stabilization; they do not carry monitor weight.

## Release status

CAD/STL are prototype exports. They remain outside `Ready-to-Print` until the center alignment fit-check confirms:

- 6,6 mm physical bezel gap,
- carrier-to-bezel offset,
- fascia cutout clearance,
- center mask fit,
- M3 seam registration.


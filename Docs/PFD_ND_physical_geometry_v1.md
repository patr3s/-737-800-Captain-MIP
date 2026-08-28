# PFD + ND physical geometry v1

## Confirmed inputs

- BenQ body: 445 × 266 × 60 mm.
- Active LCD: 410 × 232 mm.
- Active LCD offset: 18 mm left and 18 mm top; derived right border is 17 mm and bottom border 16 mm.
- DU visible opening: 169,7 × 169,7 mm.
- DU bezel: 203,2 × 203,2 mm.

## Final nominal arrangement

The carrier pair is 445,0 mm wide: `219,2 + 6,6 + 219,2`. The physical bezel gap is also 6,6 mm because each bezel is shifted toward the center of its asymmetric carrier. The complete visible pair is centered on the active LCD, not on the monitor plastic.

| Quantity | Value |
|---|---:|
| Physical bezel gap | 6,6 mm |
| PFD-center to ND-center pitch | 209,8 mm |
| Gap between visible DU openings | 40,1 mm |
| Total visible pair width | 379,5 mm |
| Active LCD margin left/right | 15,25 / 15,25 mm |
| Active LCD margin top/bottom | 31,15 / 31,15 mm |

Coordinates below use the active LCD top-left as `(0,0)`:

| Opening | Left | Top | Width | Height | Center X | Center Y |
|---|---:|---:|---:|---:|---:|---:|
| PFD | 15,25 | 31,15 | 169,7 | 169,7 | 100,10 | 116,00 |
| ND | 225,05 | 31,15 | 169,7 | 169,7 | 309,90 | 116,00 |

Coordinates relative to the complete 445 × 266 mm monitor body:

| Opening | Left | Top | Center X | Center Y |
|---|---:|---:|---:|---:|
| PFD | 33,25 | 49,15 | 118,10 | 134,00 |
| ND | 243,05 | 49,15 | 327,90 | 134,00 |

The physical bezel outer edges are at X 16,5–219,7 mm and 226,3–429,5 mm. This leaves 16,5 mm at the monitor left and 15,5 mm at the right, matching the 0,5 mm active-area offset relative to the monitor-body center.

## Change from the previous carrier

The previous 7 mm carrier gap with centered bezels produced a physical bezel gap of approximately 23 mm because each 219,2 mm carrier added an 8 mm inner margin. In v1 final geometry:

- carrier gap changes from 7,0 to 6,6 mm,
- the left bezel shifts +8,5 mm toward the center,
- the right bezel shifts −7,5 mm toward the center,
- physical bezel gap becomes 6,6 mm,
- visible opening gap becomes 40,1 mm.

The 6,6 mm physical gap is a project interface derived from confirmed monitor and bezel dimensions. It remains parameterized and should be verified with the low-cost center fit-check before large prints.


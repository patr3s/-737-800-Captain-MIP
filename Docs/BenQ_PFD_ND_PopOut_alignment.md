# BenQ PFD/ND Pop Out Panel Manager alignment

## Physical source geometry

- Active LCD: 410 × 232 mm.
- BenQ resolution: 1366 × 768 px.
- PFD/ND physical opening: 169,7 × 169,7 mm.
- Center pitch: 209,8 mm.
- Visible gap: 40,1 mm.

Independent axis conversion is required because the physical pixel pitch is slightly different in X and Y:

- X: `410 / 1366 = 0,300146 mm/px`.
- Y: `232 / 768 = 0,302083 mm/px`.

## Recommended Pop Out values

The following values are relative to the top-left pixel of the BenQ desktop. If Windows places the BenQ at a non-zero desktop coordinate, add that monitor origin to `Left` and `Top`.

| Window | Left | Top | Width | Height |
|---|---:|---:|---:|---:|
| PFD | **51** | **103** | **565** | **562** |
| ND | **750** | **103** | **565** | **562** |

Unrounded calculations:

- PFD Left: 50,81 px.
- ND Left: 749,80 px.
- Top: 103,12 px.
- Width: 565,39 px.
- Height: 561,77 px.
- Pixel gap after rounding: 134 px.
- Left/right pixel margins after rounding: approximately 51 px.

These values intentionally follow the confirmed physical 1:1 geometry, not the current accidental 565 × 562 pop-out placement.

## Alignment procedure with the physical fascia

1. Configure Windows to use the BenQ at native 1366 × 768 resolution and 100 % scaling.
2. Disable overscan/scaling in the GPU and monitor menu; the desktop must fill the active LCD exactly.
3. Enter the values above for PFD and ND.
4. Install the monitor behind the fascia with the steel VESA bracket still slightly loose in X/Y.
5. Display a high-contrast calibration image or the PMDG PFD/ND pop-outs.
6. Mechanically center the active LCD behind both physical openings using the ±3 mm alignment allowance.
7. Tighten the steel bracket only after both openings show equal margins.
8. Fine-tune Pop Out values by 1–2 px only after mechanical alignment. Do not use large pixel corrections to compensate for a mechanically misplaced monitor.
9. Save the final measured values and monitor desktop origin in the project documentation.

If the physical Windows desktop is rotated, scaled, or the BenQ is not at 100 %, these coordinates must be recalculated.


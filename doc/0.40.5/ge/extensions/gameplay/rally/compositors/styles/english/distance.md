# `gameplay_rally_compositors_styles_english_distance`

*File: `lua/ge/extensions/gameplay/rally/compositors/styles/english/distance.lua` · VM: Game Engine (GE) · 25 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `gameplay_rally_compositors_styles_english_distance`: `extensions.load("gameplay_rally_compositors_styles_english_distance")`, then the global `gameplay_rally_compositors_styles_english_distance`

Distance call configuration of the English styles: link words depending on the gap between two notes, spoken units, rounding rules and maximum spoken distance. Read by textCompositor (roundDistance, distanceToString, getDistanceCallShorthand...).

## Notes

- Links: gap < 5 m = no word (text nil), < 20 m = 'into', < 40 m = 'and'; beyond that, the distance is spoken in digits.
- Units: base 'm', large 'km', decimal point word 'point'.
- Rounding: 10 m step below 100 m, 50 m step from 100 m to 1000 m, beyond 1000 m value in km with a 250 m step. Max distance: 2000 m.
- The module returns the table directly (no M).

## Fields

| Field | Type | Description |
|---|---|---|
| `links` | table[] | Ordered links {threshold, text} with strictly increasing thresholds (5, 20, 40 m). |
| `max` | number | Maximum spoken distance: 2000 m. |
| `rounding` | table | {small=10, medium=50, mediumThreshold=100, large=250, largeThreshold=1000} (meters). |
| `units` | table | {base='m', large='km', point='point'}. |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/gameplay/rally/compositors/styles/english/distance.lua`.*

# `editor_toolUtilities_walkRibbon`

*Fichier : `lua/ge/extensions/editor/toolUtilities/walkRibbon.lua` · VM : Game Engine (GE) · 335 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_toolUtilities_walkRibbon` : `extensions.load("editor_toolUtilities_walkRibbon")`, puis la globale `editor_toolUtilities_walkRibbon`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_toolUtilities_walkRibbon.build(inner, outer, opts)` | Sweep the walk between two matching rails of { x, y, z }: the kerb line on the road and the back of the paving.<br> opts: parts, paving, variant, caps (default true), scale (per-station kerb height, 0 is dropped), uvs (paving flags to<br> the metre), worldUv (lay the paving from world x,y), uRail (line the along-run UVs are measured on), bury, back. | 73 |
| `editor_toolUtilities_walkRibbon.crossingDips(crossings, div, inner, outer)` | Densifies inner/outer within each crossing band (to ~crossingSampleM) and returns the densified rails + the per-station<br> dip multiplier. Without the densification a coarse rail can have NO station inside the crossing band, so nothing<br> sinks and the walk stays full-height across the zebra -- exactly the "not dipping" case. `crossings` are a road's<br> { t, depthM } and `div` its centreline. Returns the ORIGINAL rails + nil when the road has no crossings. | 261 |
| `editor_toolUtilities_walkRibbon.dropScale(cum, centres, depths)` | The per-station kerb-height multiplier for a walk crossed by pedestrian crossings: flush over each crossing, ramped<br> either side. `cum`, `centres` and `depths` are all arc lengths on the rail the walk is swept along. nil where none reach. | 190 |
| `editor_toolUtilities_walkRibbon.rise()` | How far the walking surface stands above the road the inner rail sits on. | 320 |
| `editor_toolUtilities_walkRibbon.width()` | How far out from the inner rail the outer one belongs: the kerb plus one paving stone. | 315 |

## Champs

| Champ | Type | Description |
|---|---|---|
| `crossingDepthM` | number |  |
| `crossingRampM` | number | Public interface. |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/toolUtilities/walkRibbon.lua`.*

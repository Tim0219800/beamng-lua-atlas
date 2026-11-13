# `editor_toolUtilities_engineeredGeom`

*Fichier : `lua/ge/extensions/editor/toolUtilities/engineeredGeom.lua` · VM : Game Engine (GE) · 699 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_toolUtilities_engineeredGeom` : `extensions.load("editor_toolUtilities_engineeredGeom")`, puis la globale `editor_toolUtilities_engineeredGeom`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_toolUtilities_engineeredGeom.applyDefaults(group)` | Backfills the four engineered fields on a group in place (new-group creation AND deserialize of sessions saved before the fields<br> existed). Only sets a field when nil, so authored values survive. Call from the tool's addNewGroup and deserializeGroup. | 574 |
| `editor_toolUtilities_engineeredGeom.buildCenterline(spline, p)` | Builds the engineered plan-view centerline. Returns nothing; mutates spline.divPoints/divWidths/normals/divCurv/discMap and runs<br> computeFrenetFrame. p = { R, Ls, minR, minAngleDeg, stepM, lonRes, zMode='free'\|'raycast'\|'conform' }. | 290 |
| `editor_toolUtilities_engineeredGeom.buildCenterlineConform(spline, p)` |  | 556 |
| `editor_toolUtilities_engineeredGeom.buildCenterlineFree(spline, p)` | Thin z-mode wrappers mirroring the geom.lua sampler trio, so a tool can branch by name. | 548 |
| `editor_toolUtilities_engineeredGeom.buildCenterlineRaycast(spline, p)` |  | 552 |
| `editor_toolUtilities_engineeredGeom.drawControlPolygon(group)` |  | 603 |
| `editor_toolUtilities_engineeredGeom.sampleInto(group, opts)` | Single sampling entry point honoring group.geometryMode. opts = { zMode='free'\|'raycast'\|'conform', lonRes, deckZ, maxStep, levelStart,<br> levelFinish (free mode: that end meets a flat junction pad, so the profile arrives level) }. In engineered<br> mode it fills divPoints/divWidths/normals/divCurv/discMap (+ Frenet frame) and returns true, so the caller need not sample. In<br> spline mode it clears any stale divCurv and returns false, letting the caller run its OWN geom.catmullRom* variant (keeping each<br> tool's banking / conform specifics). This keeps the branch a one-liner and the field set uniform everywhere. | 591 |
| `editor_toolUtilities_engineeredGeom.selfTest()` | Self-test: builds a single 90-degree corner and checks C0/C1 continuity and the end curvature, logging pass/fail. Call manually. | 657 |
| `editor_toolUtilities_engineeredGeom.solveCorner(pPrev, pI, pNext, R, Ls, minAngle)` | One corner's solved geometry. delta is the SIGNED deflection (rad); turn is its sign (+1 left/CCW, -1 right/CW); R/Ls are this<br> corner's (possibly shrunk) radius and spiral length; thetaS the spiral angle; arc the circular central angle; T the tangent<br> distance the fillet eats along each adjoining straight. through=true means "too shallow, no fillet". | 62 |

## Champs

| Champ | Type | Description |
|---|---|---|
| `CONTROLS` | table | Public interface. |
| `DEFAULT_MIN_R` | number |  |

## Appels vers le moteur (C++)

- `debugDrawer:` `drawLineInstance`, `drawSphere`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/toolUtilities/engineeredGeom.lua`.*

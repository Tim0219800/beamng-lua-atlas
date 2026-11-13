# `career_modules_tether`

*Fichier : `lua/ge/extensions/career/modules/tether.lua` · VM : Game Engine (GE) · 287 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `career_modules_tether` : `extensions.load("career_modules_tether")`, puis la globale `career_modules_tether`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `career_modules_tether.addTether(t)` |  | 205 |
| `career_modules_tether.drawAxisBox(corner, x, y, z, clr)` |  | 228 |
| `career_modules_tether.removeTether(t)` |  | 213 |
| `career_modules_tether.startBoxTether(p1, x1, y1, z1, callback, data)` | breaks when the player walks too far away | 27 |
| `career_modules_tether.startCapsuleTetherBetweenStaticAndVehicle(p1, r1, vehId, r2, callback, data)` | breaks when the player walks too far away. one po | 112 |
| `career_modules_tether.startCapsuleTetherBetweenStatics(p1, r1, p2, r2, callback, data)` | breaks when the player walks too far away | 94 |
| `career_modules_tether.startDoorTether(door, bufferLength, callback, data)` |  | 38 |
| `career_modules_tether.startSphereTether(p1, r1, callback, data)` | breaks when the player walks too far away | 63 |
| `career_modules_tether.startVehicleTether(vehId, radius, inverse, callback)` |  | 156 |

## Champs

| Champ | Type | Description |
|---|---|---|
| `onUpdate` | any |  |

## Hooks émis

Évènements diffusés aux extensions par `extensions.hook` :

- `onUpdate` — écouté par 186 module(s)

## Appels vers le moteur (C++)

- `debugDrawer:` `drawLine`, `drawSphere`, `drawTriSolid`
- `scenetree.` `findObject`, `findObjectById`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/career/modules/tether.lua`.*

# `util_trackBuilder_proceduralPrimitives`

*Fichier : `lua/ge/extensions/util/trackBuilder/proceduralPrimitives.lua` · VM : Game Engine (GE) · 681 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `util_trackBuilder_proceduralPrimitives` : `extensions.load("util_trackBuilder_proceduralPrimitives")`, puis la globale `util_trackBuilder_proceduralPrimitives`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `util_trackBuilder_proceduralPrimitives.createBump(length, width, height, upperLength, upperWidth, material)` | BUMP | 289 |
| `util_trackBuilder_proceduralPrimitives.createCone(radius, height, material)` | CONE | 406 |
| `util_trackBuilder_proceduralPrimitives.createCube(size, material, uvStyle)` | CUBE | 472 |
| `util_trackBuilder_proceduralPrimitives.createCylinder(radius, height, material)` | CYLINDER | 66 |
| `util_trackBuilder_proceduralPrimitives.createRamp(width, len, hei, thinning, attack, twist, material)` | RÄMP | 160 |
| `util_trackBuilder_proceduralPrimitives.createRing(radius, thickness, material)` | TORUS | 8 |

## Appels vers le moteur (C++)

- `be:` `reloadCollision`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/util/trackBuilder/proceduralPrimitives.lua`.*

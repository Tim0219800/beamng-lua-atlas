# `gameplay_drift_stuntZones_driftThrough`

*Fichier : `lua/ge/extensions/gameplay/drift/stuntZones/driftThrough.lua` · VM : Game Engine (GE) · 95 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/gameplay/drift/stuntZones/driftThrough")` (fichier sous extensions/ mais pas une extension classique)

## Classe `C`

Le module renvoie un constructeur : `local obj = require("gameplay_drift_stuntZones_driftThrough")(options)`.

| Méthode | Description | Ligne |
|---|---|---|
| `C:accomplish()` |  | 24 |
| `C:detectStunt()` |  | 41 |
| `C:init(data)` |  | 19 |
| `C:isAvailable()` |  | 47 |
| `C:isPlayerInside()` |  | 51 |
| `C:onUpdate()` |  | 59 |
| `C:reset()` |  | 11 |
| `C:sendDecals()` |  | 70 |

## Hooks émis

Évènements diffusés aux extensions par `extensions.hook` :

- `onAnyStuntZoneAccomplished` — écouté par 3 module(s)

## Appels vers le moteur (C++)

- `debugDrawer:` `drawLineInstance`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/gameplay/drift/stuntZones/driftThrough.lua`.*

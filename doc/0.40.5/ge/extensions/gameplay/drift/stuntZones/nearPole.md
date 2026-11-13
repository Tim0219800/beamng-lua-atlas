# `gameplay_drift_stuntZones_nearPole`

*Fichier : `lua/ge/extensions/gameplay/drift/stuntZones/nearPole.lua` · VM : Game Engine (GE) · 171 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/gameplay/drift/stuntZones/nearPole")` (fichier sous extensions/ mais pas une extension classique)

## Classe `C`

Le module renvoie un constructeur : `local obj = require("gameplay_drift_stuntZones_nearPole")(options)`.

| Méthode | Description | Ligne |
|---|---|---|
| `C:accomplish()` |  | 82 |
| `C:clear()` |  | 8 |
| `C:clearMarker()` |  | 15 |
| `C:createMarker()` |  | 22 |
| `C:detectStunt()` |  | 104 |
| `C:init(data)` |  | 67 |
| `C:isAvailable()` |  | 159 |
| `C:onUpdate(dtReal, dtSim)` |  | 132 |
| `C:onVehicleDestroyed(vehId)` |  | 152 |
| `C:reset()` |  | 46 |
| `C:resetData()` |  | 33 |

## Hooks émis

Évènements diffusés aux extensions par `extensions.hook` :

- `onAnyStuntZoneAccomplished` — écouté par 3 module(s)

## Appels vers le moteur (C++)

- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/gameplay/drift/stuntZones/nearPole.lua`.*

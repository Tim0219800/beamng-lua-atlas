# `gameplay_drift_stuntZones_hitPole`

*Fichier : `lua/ge/extensions/gameplay/drift/stuntZones/hitPole.lua` · VM : Game Engine (GE) · 140 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/gameplay/drift/stuntZones/hitPole")` (fichier sous extensions/ mais pas une extension classique)

## Classe `C`

Le module renvoie un constructeur : `local obj = require("gameplay_drift_stuntZones_hitPole")(options)`.

| Méthode | Description | Ligne |
|---|---|---|
| `C:accomplish()` |  | 77 |
| `C:clear()` |  | 6 |
| `C:clearMarker()` |  | 13 |
| `C:createMarker()` |  | 20 |
| `C:detectStunt()` |  | 96 |
| `C:init(data)` |  | 62 |
| `C:isAvailable()` |  | 129 |
| `C:onUpdate(dtReal, dtSim)` |  | 102 |
| `C:onVehicleDestroyed(vehId)` |  | 122 |
| `C:reset()` |  | 41 |
| `C:resetData()` |  | 31 |

## Hooks émis

Évènements diffusés aux extensions par `extensions.hook` :

- `onAnyStuntZoneAccomplished` — écouté par 3 module(s)

## Appels vers le moteur (C++)

- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/gameplay/drift/stuntZones/hitPole.lua`.*

# `gameplay_missions_missionTypes_baseMission`

*Fichier : `lua/ge/extensions/gameplay/missions/missionTypes/baseMission.lua` · VM : Game Engine (GE) · 40 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/gameplay/missions/missionTypes/baseMission")` (fichier sous extensions/ mais pas une extension classique)

## Classe `C`

Le module renvoie un constructeur : `local obj = require("gameplay_missions_missionTypes_baseMission")(options)`.

| Méthode | Description | Ligne |
|---|---|---|
| `C:getProgressKeyTranslation(progressKey)` |  | 13 |
| `C:init()` | This is called when a mission of this type is being created. Load files, initialize variables etc | 8 |
| `C:onStart()` | when the mission starts | 23 |
| `C:onStop(data)` | called when the activity stops. attempt might be nil | 27 |
| `C:onUpdate(dtReal, dtSim, dtRaw)` | called each frame | 25 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/gameplay/missions/missionTypes/baseMission.lua`.*

# `gameplay_rally_tools_rallyToolbox`

*Fichier : `lua/ge/extensions/gameplay/rally/tools/rallyToolbox.lua` · VM : Game Engine (GE) · 1882 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/gameplay/rally/tools/rallyToolbox")` (fichier sous extensions/ mais pas une extension classique)

## Classe `C`

Le module renvoie un constructeur : `local obj = require("gameplay_rally_tools_rallyToolbox")(options)`.

| Méthode | Description | Ligne |
|---|---|---|
| `C:_cancelVehiclePlacement()` |  | 386 |
| `C:_invalidateVoicepackCache()` |  | 117 |
| `C:_placeVehicleAt(pos)` |  | 391 |
| `C:_spawnPrefab(filepath, ownerMissionId)` |  | 489 |
| `C:_startVehiclePlacement()` |  | 381 |
| `C:_updateVehiclePlacementMode()` |  | 414 |
| `C:clearReccePoints()` |  | 1076 |
| `C:draw()` |  | 644 |
| `C:drawDebug()` |  | 1195 |
| `C:drawLoopTools()` |  | 255 |
| `C:drawPrefabTools()` |  | 562 |
| `C:drawRallyRecoveryTools(rm)` |  | 287 |
| `C:drawVehicleTools()` |  | 444 |
| `C:drawVoicepackPicker(rm)` | Voicepack picker dropdown. Entry shape: { label, pick = { type, scope, dirname } }.<br> Picker entries are built once per mission load and cached on the toolbox instance.<br> The closed-combo label is cached per (missionDir, pick) pair. Both rebuild only on<br> mission change, on user pick change, or on runtime resync / asset rebuild.<br> TODO: persist the pick across sessions (currently in-memory only). | 150 |
| `C:getDebugLogging()` |  | 137 |
| `C:getRace()` | Returns the current race object, and assigns debug colors to each segment if not already set.<br> Alternates colors between orange and yellow for visual debugging. | 216 |
| `C:getRallyManager()` |  | 129 |
| `C:init()` |  | 41 |
| `C:setDebugLogging(debugLogging)` |  | 125 |
| `C:setMouseAsVehicleEnabled(enabled)` |  | 240 |
| `C:setRallyManager(rallyManager)` |  | 107 |
| `C:toggleMouseMovementCheckbox()` |  | 251 |

## Appels vers le moteur (C++)

- `FS:` `fileExists`
- `Sim.` `getUniqueName`
- `debugDrawer:` `drawLine`, `drawLineInstance`, `drawSphere`, `drawSquarePrism`, `drawTextAdvanced`
- `obj:` `getClassName`, `getID`, `getName`
- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/gameplay/rally/tools/rallyToolbox.lua`.*

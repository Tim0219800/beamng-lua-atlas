# `gameplay_rally_tools_devTools`

*Fichier : `lua/ge/extensions/gameplay/rally/tools/devTools.lua` · VM : Game Engine (GE) · 1857 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/gameplay/rally/tools/devTools")` (fichier sous extensions/ mais pas une extension classique)

## Classe `C`

Le module renvoie un constructeur : `local obj = require("gameplay_rally_tools_devTools")(options)`.

| Méthode | Description | Ligne |
|---|---|---|
| `C:calculateCorners()` |  | 1286 |
| `C:clearDrivelinePoints()` |  | 1397 |
| `C:draw()` |  | 1456 |
| `C:drawDrivelinePoints()` | Dark grey | 1352 |
| `C:drawElevationProfilePoints()` |  | 1221 |
| `C:drawGameSettings()` |  | 1282 |
| `C:drawTrafficZones()` |  | 1407 |
| `C:enumerate()` |  | 280 |
| `C:exportElevationProfileToJson()` |  | 1198 |
| `C:exportScriptReaderHtml()` |  | 1077 |
| `C:exportScriptReaderTxt()` |  | 1117 |
| `C:generateVoicepackSkeleton()` |  | 174 |
| `C:getSelectedRallyLoopId()` |  | 1435 |
| `C:init()` |  | 17 |
| `C:isPacenotesToolsSectionExpanded()` |  | 1846 |
| `C:loadCompositors()` |  | 87 |
| `C:onUpdate()` |  | 1445 |
| `C:onVehicleResetted()` |  | 1841 |
| `C:recordingCoverageEntries()` |  | 228 |
| `C:refreshRallyLoopMissions()` |  | 1418 |
| `C:resetCornerDetectionParams()` |  | 1342 |
| `C:selectedCompositors()` |  | 217 |
| `C:storeCornerDetection(detection)` |  | 1319 |
| `C:storeDrivelinePoints(points)` |  | 1330 |
| `C:storeElevationProfile(elevationProfile)` |  | 1152 |
| `C:voicepackSkeletonOutDir()` |  | 169 |

## Appels vers le moteur (C++)

- `FS:` `directoryCreate`, `directoryExists`, `directoryRemove`, `fileExists`, `findFiles`, `remove`
- `debugDrawer:` `drawLineInstance`, `drawSphere`, `drawTextAdvanced`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/gameplay/rally/tools/devTools.lua`.*

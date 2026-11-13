# `flowgraph_modules_missionReplayModule`

*Fichier : `lua/ge/extensions/flowgraph/modules/missionReplayModule.lua` · VM : Game Engine (GE) · 196 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/modules/missionReplayModule")` (fichier sous extensions/ mais pas une extension classique)

## Classe `C`

| Méthode | Description | Ligne |
|---|---|---|
| `C:buildMetaInfo(attempt, mission, progressKey)` |  | 102 |
| `C:deleteByCount()` |  | 52 |
| `C:deleteByMaxSize()` |  | 62 |
| `C:deleteOlderReplays()` |  | 76 |
| `C:deleteReplayFile(file)` |  | 48 |
| `C:executionStarted()` |  | 31 |
| `C:executionStopped()` |  | 23 |
| `C:getMissionReplayFiles()` |  | 35 |
| `C:init()` |  | 18 |
| `C:missionPlaybackEnded()` |  | 168 |
| `C:missionPlaybackStarted()` |  | 153 |
| `C:onMissionAttemptAggregated(attempt, mission, progressKey)` |  | 136 |
| `C:onMissionAutoReplayRecordingSettingChanged(newValue)` |  | 145 |
| `C:onReplayRecordingValueRequested()` |  | 141 |
| `C:onReplayStateChanged(state)` |  | 179 |
| `C:saveMetaInfoWithoutAttempt()` |  | 131 |
| `C:startNewRec()` |  | 91 |
| `C:stopIfRec()` |  | 84 |

**Évènements UI (guihooks.trigger) :** `onReplayRecordingValueRequested`

## Appels vers le moteur (C++)

- `FS:` `findFiles`, `removeFile`, `stat`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/modules/missionReplayModule.lua`.*

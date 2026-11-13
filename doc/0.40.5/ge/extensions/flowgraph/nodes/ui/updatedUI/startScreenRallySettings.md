# `flowgraph_nodes_ui_updatedUI_startScreenRallySettings`

*Fichier : `lua/ge/extensions/flowgraph/nodes/ui/updatedUI/startScreenRallySettings.lua` · VM : Game Engine (GE) · 321 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/ui/updatedUI/startScreenRallySettings")` (fichier sous extensions/ mais pas une extension classique)

## Classe `C`

| Méthode | Description | Ligne |
|---|---|---|
| `C:_executionStarted()` |  | 115 |
| `C:applyPick(value)` |  | 290 |
| `C:buildBoolSettings(mission)` |  | 154 |
| `C:buildLoopOptions(loopManager)` |  | 125 |
| `C:buildStageOptions(rm)` |  | 140 |
| `C:getMission(loopManager)` |  | 120 |
| `C:init()` |  | 102 |
| `C:onCoDriverSelectedByPanel(value)` |  | 236 |
| `C:onRallyStartSettingChanged(key, value)` | Update the mission's session-local settings immediately so the loop manager can<br> reliably re-read them in its own Start hook regardless of extension hook order.<br> Cloud persistence remains deferred until Start is committed. | 252 |
| `C:onUIStartButtonClicked()` |  | 276 |
| `C:onUpdate(dtReal, dtSim, dtRaw)` |  | 232 |
| `C:onVisualPacenotesChangedByPanel(value)` |  | 243 |
| `C:playSample(entry, audioObjs)` |  | 224 |
| `C:resolveEntry(value)` |  | 214 |
| `C:work()` |  | 173 |

## Appels vers le moteur (C++)

- `FS:` `fileExists`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/ui/updatedUI/startScreenRallySettings.lua`.*

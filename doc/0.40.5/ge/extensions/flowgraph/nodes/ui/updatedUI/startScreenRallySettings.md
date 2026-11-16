# `flowgraph_nodes_ui_updatedUI_startScreenRallySettings`

*File: `lua/ge/extensions/flowgraph/nodes/ui/updatedUI/startScreenRallySettings.lua` · VM: Game Engine (GE) · 321 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/ui/updatedUI/startScreenRallySettings")` (file under extensions/ but not a regular extension)

Node "StartScreen Rally Settings" (repeat_instant, color ui). Adds a "coDriverSelector" panel to the start screen of a rally mission: co-driver choice (voicepack), visual notes checkbox and boolean settings (rallyRepairVehicleOnRecovery, rallyEnableFalseStarts, rallyEnableEarlyTimeControlPenalties). Plays an audio sample of the chosen co-driver. The choices are stored as pending and applied on clicking Start (onUIStartButtonClicked hook). Also handles the "rallyLoop" mode. Input flow, output flow (chainFlow).

## Notes

- The file's local functions handle the audio sample: intercomCheckAudioObjs, composedSampleAudioObjs, recordedSampleAudioObjs (reference mission automation_test_track/rallyStage/002-mixedstage, pacenote_27.ogg).
- The file depends on gameplay/rally/voicepack, util, audioManager and compositors/helpers/textCompositor.

## Class `C`

Flowgraph node class; each instance represents a node in a graph.

| Method | Description | Line |
|---|---|---|
| `C:_executionStarted()` | Clears pendingValue and pendingSettings. | 115 |
| `C:applyPick(value)` | Applies the co-driver choice: records rallyVoicepackPick (loop) or reloads the voicepack assets via rm:reloadVoicepackAssets; logs an error on failure. | 290 |
| `C:buildBoolSettings(mission)` | Returns the mission's boolean settings kept in settingKeys, with the pending value if it exists. | 154 |
| `C:buildLoopOptions(loopManager)` | Builds the list of co-drivers for a rally loop mission (label, value, shortLabel, detail) and the selected value; returns nil if nothing is available. | 125 |
| `C:buildStageOptions(rm)` | Same for a standard rally special stage from the rally manager. | 140 |
| `C:getMission(loopManager)` | Returns the rally mission of the loop (loopManager:getRallyLoopMission()) or, without a loop, the manager's activity. | 120 |
| `C:init()` | Creates the panel {type='coDriverSelector', ...} and clears the pending choices. | 102 |
| `C:onCoDriverSelectedByPanel(value)` | Called by the panel when a co-driver is chosen: stores the choice and plays a sample (composed, recorded or intercom test). | 236 |
| `C:onRallyStartSettingChanged(key, value)` | Called when a boolean setting changes: updates pendingSettings, mission.lastUserSettings and the panel. Accepts either (key, value) or a table {key, value}. | 252 |
| `C:onUIStartButtonClicked()` | Hook called on clicking Start: stops the audio, writes the pending settings via settings.setValue and applies the chosen co-driver (applyPick). | 276 |
| `C:onUpdate(dtReal, dtSim, dtRaw)` | Called every frame as an extension; advances the sample audio queue. | 232 |
| `C:onVisualPacenotesChangedByPanel(value)` | Called when the visual notes checkbox changes; stores rallyVisualPacenotes as pending. | 243 |
| `C:playSample(entry, audioObjs)` | Resets the sample audio queue then puts the given audio objects in it (voicepack timing of the entry). | 224 |
| `C:resolveEntry(value)` | Finds the voicepack entry matching the chosen value (loop or special stage mode). | 214 |
| `C:work()` | Builds the panel (co-driver options, selection, visual notes, boolean settings, loop note) and adds it to the UI, then plays the intercom test of the selected co-driver. Without a rally manager or without options, logs a warning and skips the panel. | 173 |

## Calls into the engine (C++)

- `FS:` `fileExists`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/ui/updatedUI/startScreenRallySettings.lua`.*

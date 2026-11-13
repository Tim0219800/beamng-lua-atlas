---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/rallyEditor/drivelineTab.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classe locale `C` de lua/ge/extensions/editor/rallyEditor/drivelineTab.lua (instanciée par la fonction renvoyée par le module)
---@class editor_rallyEditor_drivelineTab
local editor_rallyEditor_drivelineTab = {}

---Source : lua/ge/extensions/editor/rallyEditor/drivelineTab.lua:574
function editor_rallyEditor_drivelineTab:calculateRaceDistance() end

---Source : lua/ge/extensions/editor/rallyEditor/drivelineTab.lua:94
function editor_rallyEditor_drivelineTab:clearState() end

--- Probe the terrain groundmodel along the race span (start line -> flying finish)
---  and return a map of category -> percentage (float, 1 decimal), only including
---  categories with a non-zero share. Returns nil if it can't be computed.
---Source : lua/ge/extensions/editor/rallyEditor/drivelineTab.lua:618
---@param startPos any
---@param finishPos any
function editor_rallyEditor_drivelineTab:computeSurfacePercentages(startPos, finishPos) end

--- Create a new driveline from the edited spline
---Source : lua/ge/extensions/editor/rallyEditor/drivelineTab.lua:502
function editor_rallyEditor_drivelineTab:createDrivelineFromSpline() end

--- Create a temporary rally manager with our current (possibly unsaved) drivelineV3
---  so we can query race path / distance against the in-editor geometry.
---Source : lua/ge/extensions/editor/rallyEditor/drivelineTab.lua:548
function editor_rallyEditor_drivelineTab:createTempRallyManager() end

--- Deep copy function for undo/redo
---Source : lua/ge/extensions/editor/rallyEditor/drivelineTab.lua:485
function editor_rallyEditor_drivelineTab:deepCopySpline() end

---Source : lua/ge/extensions/editor/rallyEditor/drivelineTab.lua:837
---@param mouseInfo any
---@param dtReal any
---@param dtSim any
---@param dtRaw any
function editor_rallyEditor_drivelineTab:draw(mouseInfo, dtReal, dtSim, dtRaw) end

---Source : lua/ge/extensions/editor/rallyEditor/drivelineTab.lua:1186
---@param mouseInfo any
function editor_rallyEditor_drivelineTab:drawDebugEntrypoint(mouseInfo) end

---Source : lua/ge/extensions/editor/rallyEditor/drivelineTab.lua:182
---@param dist any
function editor_rallyEditor_drivelineTab:formatDistance(dist) end

---Source : lua/ge/extensions/editor/rallyEditor/drivelineTab.lua:208
---@param timeSecs any
function editor_rallyEditor_drivelineTab:formatDurationSecs(timeSecs) end

--- Generate buffer zone around driveline (experimental)
---Source : lua/ge/extensions/editor/rallyEditor/drivelineTab.lua:772
function editor_rallyEditor_drivelineTab:generateBuffer() end

---Source : lua/ge/extensions/editor/rallyEditor/drivelineTab.lua:444
function editor_rallyEditor_drivelineTab:getDrivelineLength() end

---Source : lua/ge/extensions/editor/rallyEditor/drivelineTab.lua:463
function editor_rallyEditor_drivelineTab:getDrivelinePointCount() end

---Source : lua/ge/extensions/editor/rallyEditor/drivelineTab.lua:196
function editor_rallyEditor_drivelineTab:getFinalDrivelineLength() end

---Source : lua/ge/extensions/editor/rallyEditor/drivelineTab.lua:221
function editor_rallyEditor_drivelineTab:getMissionSilverTimeSecs() end

--- Handle spline interaction (mouse/keyboard input)
---Source : lua/ge/extensions/editor/rallyEditor/drivelineTab.lua:1314
function editor_rallyEditor_drivelineTab:handleSplineInteraction() end

--- Check if final driveline exists
---Source : lua/ge/extensions/editor/rallyEditor/drivelineTab.lua:245
function editor_rallyEditor_drivelineTab:hasFinalDriveline() end

--- Check if recording driveline exists
---Source : lua/ge/extensions/editor/rallyEditor/drivelineTab.lua:236
function editor_rallyEditor_drivelineTab:hasRecording() end

---Source : lua/ge/extensions/editor/rallyEditor/drivelineTab.lua:60
---@param rallyEditor any
function editor_rallyEditor_drivelineTab:init(rallyEditor) end

--- Check if a point is inside the buffer zone
---Source : lua/ge/extensions/editor/rallyEditor/drivelineTab.lua:814
---@param point any
function editor_rallyEditor_drivelineTab:isPointInBuffer(point) end

--- Load from final driveline
---Source : lua/ge/extensions/editor/rallyEditor/drivelineTab.lua:286
function editor_rallyEditor_drivelineTab:loadFromFinal() end

--- Load from race path
---Source : lua/ge/extensions/editor/rallyEditor/drivelineTab.lua:337
function editor_rallyEditor_drivelineTab:loadFromRace() end

--- Load from recording (raw driveline)
---Source : lua/ge/extensions/editor/rallyEditor/drivelineTab.lua:256
function editor_rallyEditor_drivelineTab:loadFromRecording() end

---Source : lua/ge/extensions/editor/rallyEditor/drivelineTab.lua:517
function editor_rallyEditor_drivelineTab:recalculateDrivelineStats() end

---Source : lua/ge/extensions/editor/rallyEditor/drivelineTab.lua:531
function editor_rallyEditor_drivelineTab:recalculateRaceDistance() end

--- Redo callback
---Source : lua/ge/extensions/editor/rallyEditor/drivelineTab.lua:496
---@param data any
function editor_rallyEditor_drivelineTab:redoSplineEdit(data) end

--- Recompute the stored stats (race distance + surface composition) and persist
---  them into the driveline spline file under the top-level "stats" key.
---Source : lua/ge/extensions/editor/rallyEditor/drivelineTab.lua:731
function editor_rallyEditor_drivelineTab:refreshStats() end

---Source : lua/ge/extensions/editor/rallyEditor/drivelineTab.lua:510
function editor_rallyEditor_drivelineTab:resetDrivelineStats() end

---Source : lua/ge/extensions/editor/rallyEditor/drivelineTab.lua:767
function editor_rallyEditor_drivelineTab:saveFinalDriveline() end

--- called by RallyEditor when this tab is selected.
---Source : lua/ge/extensions/editor/rallyEditor/drivelineTab.lua:169
function editor_rallyEditor_drivelineTab:selected() end

---Source : lua/ge/extensions/editor/rallyEditor/drivelineTab.lua:594
function editor_rallyEditor_drivelineTab:setAverageSpeedFromSilverTimeAndRaceDistance() end

---Source : lua/ge/extensions/editor/rallyEditor/drivelineTab.lua:117
---@param path any
function editor_rallyEditor_drivelineTab:setPath(path) end

---Source : lua/ge/extensions/editor/rallyEditor/drivelineTab.lua:157
function editor_rallyEditor_drivelineTab:splineEditCallbacks() end

--- Undo callback
---Source : lua/ge/extensions/editor/rallyEditor/drivelineTab.lua:490
---@param data any
function editor_rallyEditor_drivelineTab:undoSplineEdit(data) end

--- called by RallyEditor when this tab is unselected.
---Source : lua/ge/extensions/editor/rallyEditor/drivelineTab.lua:176
function editor_rallyEditor_drivelineTab:unselect() end

---Source : lua/ge/extensions/editor/rallyEditor/drivelineTab.lua:476
function editor_rallyEditor_drivelineTab:updateSplineGeometry() end


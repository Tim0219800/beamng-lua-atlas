---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/markerInteraction.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `gameplay_markerInteraction` : `extensions.load("gameplay_markerInteraction")`, puis la globale `gameplay_markerInteraction`
---@class gameplay_markerInteraction
---@field abandonCurrent any
---@field dependencies table
---@field getClusterMarker any
---@field restartCurrent any
gameplay_markerInteraction = {}

---Source : lua/ge/extensions/gameplay/markerInteraction.lua:138
---@param id any
---@param settings any
function gameplay_markerInteraction.changeUserSettings(id, settings) end

---Source : lua/ge/extensions/gameplay/markerInteraction.lua:651
function gameplay_markerInteraction.clearCache() end

---Source : lua/ge/extensions/gameplay/markerInteraction.lua:211
---@param force any
function gameplay_markerInteraction.closeViewDetailPrompt(force) end

---Source : lua/ge/extensions/gameplay/markerInteraction.lua:114
function gameplay_markerInteraction.formatDataForUi() end

---Source : lua/ge/extensions/gameplay/markerInteraction.lua:66
---@param m any
function gameplay_markerInteraction.formatMission(m) end

---Source : lua/ge/extensions/gameplay/markerInteraction.lua:61
function gameplay_markerInteraction.getCurrentInteractableElements() end

---Source : lua/ge/extensions/gameplay/markerInteraction.lua:149
---@param fromMissionMenu any
function gameplay_markerInteraction.getGameContext(fromMissionMenu) end

---Source : lua/ge/extensions/gameplay/markerInteraction.lua:666
---@param state any
function gameplay_markerInteraction.onAnyMissionChanged(state) end

---Source : lua/ge/extensions/gameplay/markerInteraction.lua:685
---@param levelPath any
function gameplay_markerInteraction.onClientEndMission(levelPath) end

---Source : lua/ge/extensions/gameplay/markerInteraction.lua:678
---@param poiId any
function gameplay_markerInteraction.onNavigateToMission(poiId) end

---Source : lua/ge/extensions/gameplay/markerInteraction.lua:603
---@param dtReal any
---@param dtSim any
function gameplay_markerInteraction.onPreRender(dtReal, dtSim) end

---Source : lua/ge/extensions/gameplay/markerInteraction.lua:199
---@param idx any
function gameplay_markerInteraction.onSelectDetailPromptClicked(idx) end

---Source : lua/ge/extensions/gameplay/markerInteraction.lua:221
function gameplay_markerInteraction.onSettingsChanged() end

---Source : lua/ge/extensions/gameplay/markerInteraction.lua:713
---@param enteredPlay any
function gameplay_markerInteraction.onUIPlayStateChanged(enteredPlay) end

---Source : lua/ge/extensions/gameplay/markerInteraction.lua:709
function gameplay_markerInteraction.setForceReevaluateOpenPrompt() end

---Source : lua/ge/extensions/gameplay/markerInteraction.lua:689
---@param visible any
function gameplay_markerInteraction.setMarkersVisibleTemporary(visible) end

---Source : lua/ge/extensions/gameplay/markerInteraction.lua:144
---@param mId any
function gameplay_markerInteraction.setPreselectedMissionId(mId) end

---Source : lua/ge/extensions/gameplay/markerInteraction.lua:660
---@param active any
function gameplay_markerInteraction.showMissionMarkersToggled(active) end

---Source : lua/ge/extensions/gameplay/markerInteraction.lua:656
function gameplay_markerInteraction.skipNextIconFading() end

---Source : lua/ge/extensions/gameplay/markerInteraction.lua:128
---@param id any
---@param userSettings any
---@param startingOptions any
function gameplay_markerInteraction.startMissionById(id, userSettings, startingOptions) end

---Source : lua/ge/extensions/gameplay/markerInteraction.lua:133
---@param id any
---@param force any
function gameplay_markerInteraction.stopMissionById(id, force) end


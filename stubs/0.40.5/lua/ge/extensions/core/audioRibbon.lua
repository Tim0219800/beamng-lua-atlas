---@meta
-- tim19Atlas stub generated from lua/ge/extensions/core/audioRibbon.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- GE extension (core_audioRibbon): dynamic audio for 'ribbons' (rivers, waterfalls, etc.) defined in the editor. A ribbon is a strip of quadrilaterals (nodes in left/right pairs, with depth). Every frame, for the listener (SFXSystem), the module tracks the closest point on each nearby ribbon and drives up to 5 SFX emitters per event (1 central/ambient 'A', then 4 around the listener: F front, B back, R right, L left), setting volume, pitch, color and texture (RTPC) from the ribbon's width, depth and speed. Ribbons are loaded from levels/<level>/dynamicAudioEmitters/ribbonData.audioSFX.json (JSON lines format, one ribbon per line), written by the editor on save. Many exported functions are mainly for the editor.
--- Access: extension `core_audioRibbon`: `extensions.load("core_audioRibbon")`, then the global `core_audioRibbon`
---@class core_audioRibbon
core_audioRibbon = {}

--- Removes all dynamic SFXEmitter objects (5 axes) and empties their table.
---Source: lua/ge/extensions/core/audioRibbon.lua:494
function core_audioRibbon.clearAllSFXEmitters() end

--- Empties the near, mid and far lists (they will be rebuilt next frame).
---Source: lua/ge/extensions/core/audioRibbon.lua:802
function core_audioRibbon.clearNearFarLists() end

--- Empties the ribbon names table.
---Source: lua/ge/extensions/core/audioRibbon.lua:809
function core_audioRibbon.clearRibbonNames() end

--- Creates the record of a dynamic emitter host (initial position at infinity, bestSeg 0, direction 1).
---Source: lua/ge/extensions/core/audioRibbon.lua:535
---@param eventName string FMOD event name
---@return table  {bestSeg, dir, vol, pos, bN, eventNameStr}
function core_audioRibbon.createEmitterHost(eventName) end

--- Returns the far list (distant ribbons, only one visited per frame).
---Source: lua/ge/extensions/core/audioRibbon.lua:817
---@return table<string, integer>  Far list
function core_audioRibbon.getFarList() end

--- Returns the mid list (ribbons within 400 m, only the internal point updated).
---Source: lua/ge/extensions/core/audioRibbon.lua:816
---@return table<string, integer>  Mid list
function core_audioRibbon.getMidList() end

--- Returns the near list (persistantId -> ribbon index), at most 2 ribbons.
---Source: lua/ge/extensions/core/audioRibbon.lua:815
---@return table<string, integer>  Near list
function core_audioRibbon.getNearList() end

--- Returns the table of known ribbon identifiers (persistantId -> true).
---Source: lua/ge/extensions/core/audioRibbon.lua:814
---@return table<string, boolean>  Table of identifiers
function core_audioRibbon.getRibbonNames() end

--- Returns the list of ribbons (nil before the first load).
---Source: lua/ge/extensions/core/audioRibbon.lua:812
---@return table|nil  List of ribbons
function core_audioRibbon.getRibbons() end

--- Returns the 5 per-axis SFX emitter tables, keyed by event name ({emitter, vol, pitch, color, texture, pos}).
---Source: lua/ge/extensions/core/audioRibbon.lua:818
---@return table  Array of 5 tables
function core_audioRibbon.getSfxEmitters() end

--- Hook called when the level objects are created: resets the ribbons then re-reads the level's ribbonData.audioSFX.json file.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/audioRibbon.lua:792
function core_audioRibbon.onClientCustomObjectSpawning() end

--- Hook called at the end of the level: removes the emitters and empties the ribbons (resetRibbons).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/audioRibbon.lua:778
function core_audioRibbon.onClientEndMission() end

--- Restore hook after Lua reload: rebuilds the ribbons (nodes as vec3, emitter hosts, widths, numSegs) and the names table.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/audioRibbon.lua:721
---@param data table|nil Data from onSerialize
function core_audioRibbon.onDeserialized(data) end

--- Hook called before the level is saved in the editor: writes the ribbons to levels/<level>/dynamicAudioEmitters/ribbonData.audioSFX.json (sorted by name).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/audioRibbon.lua:769
function core_audioRibbon.onEditorBeforeSaveLevel() end

--- Hook called when the game closes: removes all dynamic SFX emitters.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/audioRibbon.lua:494
function core_audioRibbon.onExit() end

--- Serialization hook before Lua reload: returns a full copy of the ribbons then DELETES all ribbons and emitters. Returns nil if there are no ribbons.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/audioRibbon.lua:708
---@return table|nil  List of serialized ribbons
function core_audioRibbon.onSerialize() end

--- Hook called every frame: reads the listener pose, updates the near/mid/far lists, computes the closest points and RTPCs for each nearby ribbon, then creates/drives the SFXEmitter emitters (positions and setVolumePitchCT). Does nothing if there are no ribbons.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/audioRibbon.lua:311
---@param dtReal number Real time step (s)
---@param dtSim number Simulation time step (s)
---@param dtRaw number Raw time step (s)
function core_audioRibbon.onUpdate(dtReal, dtSim, dtRaw) end

--- Rebuilds the names table (persistantId -> true) from the ribbons.
---Source: lua/ge/extensions/core/audioRibbon.lua:486
function core_audioRibbon.recomputeMap() end

--- Removes all SFX emitters, removes the ribbon at index idx from the list and from the names table, and empties the near/mid/far lists.
---Source: lua/ge/extensions/core/audioRibbon.lua:506
---@param idx integer Ribbon index in getRibbons()
function core_audioRibbon.removeRibbon(idx) end

--- Replaces the list of ribbons (used by the editor).
---Source: lua/ge/extensions/core/audioRibbon.lua:813
---@param val table New list
function core_audioRibbon.setRibbons(val) end

--- To call after any change to a ribbon's nodes: resets bestSeg=1 and dir=1 for the 5 hosts, recomputes ribbon.numSegs = max(0, (#nodes - 4)/2 + 1) and ribbon.widths (distance between the two nodes of each pair).
---Source: lua/ge/extensions/core/audioRibbon.lua:517
---@param ribbon table Ribbon (nodes, emitters) modified in place
function core_audioRibbon.updateRibbonData(ribbon) end


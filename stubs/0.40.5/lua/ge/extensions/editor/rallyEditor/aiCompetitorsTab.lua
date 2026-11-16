---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/rallyEditor/aiCompetitorsTab.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- AI competitors configuration tab (windowDescription = "AI Competitors Configuration"). Main fields: competitors (list copied for editing), ui, selectedCompetitorIndex, generalFloatPtrs (one FloatPtr per general parameter), referenceTimePtr and traitSkillPtr / traitConsistencyPtr / traitRiskPtr. Called by the rally editor window (draw).
---@class editor_rallyEditor_aiCompetitorsTab
local editor_rallyEditor_aiCompetitorsTab = {}

--- Applies a general parameters table to the sliders, each value being clamped to its range.
---Source: lua/ge/extensions/editor/rallyEditor/aiCompetitorsTab.lua:73
---@param general table<string, number> General parameters.
function editor_rallyEditor_aiCompetitorsTab:applyGeneralTable(general) end

--- Sets the trait sliders to the selected competitor's values (index clamped to the list; default value ui.default_slider_value or 0.5 if the trait is missing).
---Source: lua/ge/extensions/editor/rallyEditor/aiCompetitorsTab.lua:97
function editor_rallyEditor_aiCompetitorsTab:applySelectedCompetitorToTraitSliders() end

--- Syncs the traits then computes the preview data (aiCompetitorsEditorPreview.computeVisualization) with the traits brought back to [0,1] according to slider_min/slider_max.
---Source: lua/ge/extensions/editor/rallyEditor/aiCompetitorsTab.lua:146
---@return table  {weights, density, weightedComponents, yMax, timeLo, timeHi}.
function editor_rallyEditor_aiCompetitorsTab:buildVisualization() end

--- Returns a competitor's displayable name, or "?" if it is missing or empty.
---Source: lua/ge/extensions/editor/rallyEditor/aiCompetitorsTab.lua:111
---@param competitor table|nil Competitor {name, skill, consistency, risk}.
---@return string  Name or "?".
function editor_rallyEditor_aiCompetitorsTab:competitorDisplayName(competitor) end

--- Called every frame by the rally editor window: toolbar (Reload / Save), outcome shares, chart, then two columns (general parameters, reference and competitors). Arguments are ignored.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/rallyEditor/aiCompetitorsTab.lua:288
---@param _mouseInfo table|nil Not used.
---@param _dtReal number|nil Not used.
---@param _dtSim number|nil Not used.
---@param _dtRaw number|nil Not used.
function editor_rallyEditor_aiCompetitorsTab:draw(_mouseInfo, _dtReal, _dtSim, _dtRaw) end

--- Draws the general parameter slider groups with titles, descriptions, tooltips and formatted value.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/rallyEditor/aiCompetitorsTab.lua:161
function editor_rallyEditor_aiCompetitorsTab:drawGeneralParameterGroups() end

--- Draws the right column: reference time field then the trait sliders.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/rallyEditor/aiCompetitorsTab.lua:254
function editor_rallyEditor_aiCompetitorsTab:drawReferenceAndDriversColumn() end

--- Draws the Prev / Next navigation between competitors and the Pace, Consistency and Risk sliders.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/rallyEditor/aiCompetitorsTab.lua:197
function editor_rallyEditor_aiCompetitorsTab:drawTraitSliders() end

--- Reads the slider values back into a general parameters table.
---Source: lua/ge/extensions/editor/rallyEditor/aiCompetitorsTab.lua:62
---@return table<string, number>  Current general parameters.
function editor_rallyEditor_aiCompetitorsTab:gatherGeneralTable() end

--- Creates the ImGui pointers (default general parameters, reference time, traits at 0.5) then loads the configuration file.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/rallyEditor/aiCompetitorsTab.lua:46
function editor_rallyEditor_aiCompetitorsTab:init() end

--- Re-reads the configuration (loadRawConfig then configWithDefaults), updates sliders, competitors, ui and reference time, and reselects the first competitor.
---Source: lua/ge/extensions/editor/rallyEditor/aiCompetitorsTab.lua:122
function editor_rallyEditor_aiCompetitorsTab:loadFromDisk() end

--- Validates the entered reference time: replaces an invalid value (NaN) with the default and enforces a minimum of 1 s.
---Source: lua/ge/extensions/editor/rallyEditor/aiCompetitorsTab.lua:133
---@return number  Reference time in seconds.
function editor_rallyEditor_aiCompetitorsTab:parseReferenceTimeSeconds() end

--- Copies the three trait sliders into the selected competitor (no effect if no competitor or invalid index).
---Source: lua/ge/extensions/editor/rallyEditor/aiCompetitorsTab.lua:82
function editor_rallyEditor_aiCompetitorsTab:syncTraitsIntoSelectedCompetitor() end

--- Syncs the traits, updates ui.default_player_time_sec and writes the file via saveConfig; logs "Wrote ..." (I) or "Failed to save ..." (E).
---Source: lua/ge/extensions/editor/rallyEditor/aiCompetitorsTab.lua:271
function editor_rallyEditor_aiCompetitorsTab:trySaveToDisk() end


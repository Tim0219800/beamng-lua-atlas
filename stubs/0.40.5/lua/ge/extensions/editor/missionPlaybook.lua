---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/missionPlaybook.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- "Mission Playbook" editor extension (Missions menu). A playbook is a list of instructions (book.instructions) replayed on a career slot to test mission unlocking: each missionAttempt instruction gives a mission and the stars obtained, and is run via gameplay_missions_progress.generateAttempt. After each step, the hook onPlaybookLogAfterStep is emitted so the viewers (attributes, unlocked missions, tree) record their state in book.results. The window lets you save/load a playbook (.missionPlaybook.json, missionPlaybooks/ folder), replay on the current slot or an empty slot (playbookTestingSlot) and automatically generate playbooks (all missions, by tier, by branch, default or bonus stars).
--- Access: extension `editor_missionPlaybook`: `extensions.load("editor_missionPlaybook")`, then the global `editor_missionPlaybook`
---@class editor_missionPlaybook
---@field book table Current book: {page = integer, instructions = table[], results = table[]}. Serialized by onSerialize.
---@field dependencies string[] Extensions loaded before: gameplay_missions_missions and the three playbook viewers.
editor_missionPlaybook = {}

--- Draws the page slider (1 to #book.results) and the "Condensed" checkbox. Called by onEditorGui.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/missionPlaybook.lua:430
function editor_missionPlaybook.drawBookViewer() end

--- Restores book and condensed after an extensions reload.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/missionPlaybook.lua:454
---@param data table|nil Data returned by onSerialize.
function editor_missionPlaybook.onDeserialized(data) end

--- Editor hook called every frame: draws the "Mission Playbook" window (File, Util, Run, Generate menus, list of instructions with Up/Down/Remove buttons outside condensed mode, "Add..." button).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/missionPlaybook.lua:251
function editor_missionPlaybook.onEditorGui() end

--- Hook called when the editor is initialized: registers the window (1500x700) and the "Missions" menu entry.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/missionPlaybook.lua:408
function editor_missionPlaybook.onEditorInitialized() end

--- Editor preferences registration hook; empty.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/missionPlaybook.lua:415
---@param prefsRegistry table Preferences registry.
function editor_missionPlaybook.onEditorRegisterPreferences(prefsRegistry) end

--- Called when the Lua extensions are reloaded: returns {book, condensed} to save the state.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/missionPlaybook.lua:446
---@return table  Data to keep.
function editor_missionPlaybook.onSerialize() end

--- Shows the "Mission Playbook" window.
---Source: lua/ge/extensions/editor/missionPlaybook.lua:403
function editor_missionPlaybook.show() end


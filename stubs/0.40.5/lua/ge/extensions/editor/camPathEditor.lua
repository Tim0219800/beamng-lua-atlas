---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/camPathEditor.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `editor_camPathEditor` : `extensions.load("editor_camPathEditor")`, puis la globale `editor_camPathEditor`
---@class editor_camPathEditor
---@field dependencies table
---@field onExtensionLoaded any
editor_camPathEditor = {}

--- Function to provide tracking offset to core camera system
---Source : lua/ge/extensions/editor/camPathEditor.lua:2476
function editor_camPathEditor.getTrackingOffset() end

---Source : lua/ge/extensions/editor/camPathEditor.lua:2471
function editor_camPathEditor.onClientStartMission() end

---Source : lua/ge/extensions/editor/camPathEditor.lua:2020
function editor_camPathEditor.onEditorGui() end

---Source : lua/ge/extensions/editor/camPathEditor.lua:2453
function editor_camPathEditor.onEditorInitialized() end

---Source : lua/ge/extensions/editor/camPathEditor.lua:2433
function editor_camPathEditor.onPreRender() end

---Source : lua/ge/extensions/editor/camPathEditor.lua:2429
---@param dtReal any
---@param dtSim any
---@param dtRaw any
function editor_camPathEditor.onUpdate(dtReal, dtSim, dtRaw) end

---Source : lua/ge/extensions/editor/camPathEditor.lua:127
---@param path any
function editor_camPathEditor.selectPath(path) end


---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/terraformTool.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `editor_terraformTool` : `extensions.load("editor_terraformTool")`, puis la globale `editor_terraformTool`
---@class editor_terraformTool
editor_terraformTool = {}

--- Clears the current polygon.
---Source : lua/ge/extensions/editor/terraformTool.lua:49
function editor_terraformTool.clearPolygon() end

--- Getters for the tool properties.
---Source : lua/ge/extensions/editor/terraformTool.lua:29
function editor_terraformTool.getDOI() end

---Source : lua/ge/extensions/editor/terraformTool.lua:31
function editor_terraformTool.getFalloff() end

---Source : lua/ge/extensions/editor/terraformTool.lua:30
function editor_terraformTool.getMargin() end

--- Returns the current polygon.
---Source : lua/ge/extensions/editor/terraformTool.lua:43
function editor_terraformTool.getPolygon() end

---Source : lua/ge/extensions/editor/terraformTool.lua:32
function editor_terraformTool.getRoughness() end

---Source : lua/ge/extensions/editor/terraformTool.lua:33
function editor_terraformTool.getScale() end

--- Handles the terraforming polygon drawing.
---Source : lua/ge/extensions/editor/terraformTool.lua:58
function editor_terraformTool.handleTerraformingPolygon() end

--- Checks if a valid polygon exists.
---Source : lua/ge/extensions/editor/terraformTool.lua:46
function editor_terraformTool.isPolygonExist() end

--- Register preferences.
---Source : lua/ge/extensions/editor/terraformTool.lua:67
---@param prefs any
function editor_terraformTool.onEditorRegisterPreferences(prefs) end

--- Setters for the tool properties.
---Source : lua/ge/extensions/editor/terraformTool.lua:36
---@param value any
function editor_terraformTool.setDOI(value) end

---Source : lua/ge/extensions/editor/terraformTool.lua:38
---@param value any
function editor_terraformTool.setFalloff(value) end

---Source : lua/ge/extensions/editor/terraformTool.lua:37
---@param value any
function editor_terraformTool.setMargin(value) end

---Source : lua/ge/extensions/editor/terraformTool.lua:39
---@param value any
function editor_terraformTool.setRoughness(value) end

---Source : lua/ge/extensions/editor/terraformTool.lua:40
---@param value any
function editor_terraformTool.setScale(value) end

--- Terraform to the polygon.
---Source : lua/ge/extensions/editor/terraformTool.lua:52
---@param polygon any
function editor_terraformTool.terraformPolygon(polygon) end

--- Terraform to the selection.
---Source : lua/ge/extensions/editor/terraformTool.lua:61
function editor_terraformTool.terraformSelection() end


---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/terraformTool.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Facade of the world editor's Terraform tool. It stores five settings (domain of influence, margin, falloff, roughness, noise scale) as editor preferences, manages the polygon drawn by the user and triggers terrain terraforming (editor/terraform/terraform) from sources fetched by editor/terraform/fetchSources (roads, etc.) in a polygon or in the selection. A modder uses it to terraform by script or to read/modify the settings.
--- Access: extension `editor_terraformTool`: `extensions.load("editor_terraformTool")`, then the global `editor_terraformTool`
---@class editor_terraformTool
editor_terraformTool = {}

--- Clears the current polygon.
---Source: lua/ge/extensions/editor/terraformTool.lua:49
function editor_terraformTool.clearPolygon() end

--- Returns the terraforming domain of influence (in meters), read from the terraformTool.general.domainOfInfluence preference (default 100).
---Source: lua/ge/extensions/editor/terraformTool.lua:29
---@return number  Domain of influence in meters.
function editor_terraformTool.getDOI() end

--- Returns the decay distance (falloff, in meters), preference terraformTool.general.falloff (default 1.5).
---Source: lua/ge/extensions/editor/terraformTool.lua:31
---@return number  Falloff in meters.
function editor_terraformTool.getFalloff() end

--- Returns the lateral margin (in meters) around the sources, preference terraformTool.general.margin (default 5.0).
---Source: lua/ge/extensions/editor/terraformTool.lua:30
---@return number  Margin in meters.
function editor_terraformTool.getMargin() end

--- Returns the current polygon (delegates to editor/toolUtilities/polygon).
---Source: lua/ge/extensions/editor/terraformTool.lua:43
---@return table  Current polygon (structure defined by the polygon module).
function editor_terraformTool.getPolygon() end

--- Returns the noise roughness, preference terraformTool.general.roughness (default 0.4, range [0, 1]).
---Source: lua/ge/extensions/editor/terraformTool.lua:32
---@return number  Roughness.
function editor_terraformTool.getRoughness() end

--- Returns the noise scale, preference terraformTool.general.scale (default 0.5, range [0, 1]).
---Source: lua/ge/extensions/editor/terraformTool.lua:33
---@return number  Noise scale.
function editor_terraformTool.getScale() end

--- To be called every frame of the UI: handles the user's polygon drawing and launches terraformPolygon when they confirm.
---Source: lua/ge/extensions/editor/terraformTool.lua:58
function editor_terraformTool.handleTerraformingPolygon() end

--- Tells whether a valid polygon exists (poly.isPolygonValid).
---Source: lua/ge/extensions/editor/terraformTool.lua:46
---@return boolean  true if the polygon is valid.
function editor_terraformTool.isPolygonExist() end

--- Editor hook: registers the terraformTool preference category and its general subcategory (domainOfInfluence as int, margin, falloff, roughness, scale as float) with their bounds.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/terraformTool.lua:67
---@param prefs table Editor preferences registry.
function editor_terraformTool.onEditorRegisterPreferences(prefs) end

--- Saves the domain of influence in the editor preferences.
---Source: lua/ge/extensions/editor/terraformTool.lua:36
---@param value number Domain of influence in meters.
function editor_terraformTool.setDOI(value) end

--- Saves the decay distance in the editor preferences.
---Source: lua/ge/extensions/editor/terraformTool.lua:38
---@param value number Falloff in meters.
function editor_terraformTool.setFalloff(value) end

--- Saves the lateral margin in the editor preferences.
---Source: lua/ge/extensions/editor/terraformTool.lua:37
---@param value number Margin in meters.
function editor_terraformTool.setMargin(value) end

--- Saves the noise roughness in the editor preferences.
---Source: lua/ge/extensions/editor/terraformTool.lua:39
---@param value number Roughness in [0, 1].
function editor_terraformTool.setRoughness(value) end

--- Saves the noise scale in the editor preferences.
---Source: lua/ge/extensions/editor/terraformTool.lua:40
---@param value number Scale in [0, 1].
function editor_terraformTool.setScale(value) end

--- Fetches all supported sources in the polygon (fetchSources.getAllSourcesInPolygon) then calls terraformToSources with the current settings (DOI, margin, falloff, roughness, scale).
---Source: lua/ge/extensions/editor/terraformTool.lua:52
---@param polygon table Polygon in which to search for sources (inferred from code).
function editor_terraformTool.terraformPolygon(polygon) end

--- Fetches the supported objects of the editor selection (fetchSources.getAllSourcesInSelection) and terraforms the terrain around them with the current settings.
---Source: lua/ge/extensions/editor/terraformTool.lua:61
function editor_terraformTool.terraformSelection() end


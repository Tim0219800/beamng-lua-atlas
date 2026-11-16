---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/roadUtils.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Road template utilities of the editor. Reads the levels/<level>/roadtemplates/*.road.json files, stores the templates' materials and material names, then applies the template of each DecalRoad that references one: creates child roads, decorations and decals along the road. Everything is inactive as long as the roadTemplates.general.loadTemplates preference is false.
--- Access: extension `editor_roadUtils`: `extensions.load("editor_roadUtils")`, then the global `editor_roadUtils`
---@class editor_roadUtils
---@field onEditorInitialized nil Always nil: explicit assignment with no effect.
editor_roadUtils = {}

--- Returns the material names of the templates, in the same order as getMaterials.
---Source: lua/ge/extensions/editor/roadUtils.lua:287
---@return string[]  Material names.
function editor_roadUtils.getMaterialNames() end

--- Returns the list of textures (editor.texObj objects) of the materials of the templates loaded by reloadTemplates.
---Source: lua/ge/extensions/editor/roadUtils.lua:283
---@return table  Indexed array of ImGui textures.
function editor_roadUtils.getMaterials() end

--- Returns the paths of the *.road.json files found by the last reloadTemplates.
---Source: lua/ge/extensions/editor/roadUtils.lua:291
---@return string[]  File paths.
function editor_roadUtils.getRoadTemplateFiles() end

--- Deletes the road's previous decals (decalIDs field) then recreates those defined by the template and stores their ids in the decalIDs dynamic field.
---Source: lua/ge/extensions/editor/roadUtils.lua:97
---@param road userdata DecalRoad object.
---@param template table|nil Template data already read; if nil, reread from the road's template field.
function editor_roadUtils.reloadDecals(road, template) end

--- Deletes the road's old decorations (decorationIDs field) then recreates those of the template. Ignores child roads, roads without a template or with useTemplate different from "true".
---Source: lua/ge/extensions/editor/roadUtils.lua:43
---@param road userdata DecalRoad object.
function editor_roadUtils.reloadDecorations(road) end

--- Rereads the .road.json files of the current level, rebuilds the material lists (colorMap texture, or warnMat.dds if the material is not found) then reapplies to each DecalRoad using a template: child roads, decorations and decals. Finally reloads the collisions (be:reloadCollision). Returns immediately if the preference is off or if there is no level.
---Source: lua/ge/extensions/editor/roadUtils.lua:234
function editor_roadUtils.reloadTemplates() end

--- Deletes a road's child roads then recreates, according to its template, one child road per additional entry of template.roads (relative or absolute width, lateral offset horizPosRelative). The first entry of the template is pasted onto the road itself.
---Source: lua/ge/extensions/editor/roadUtils.lua:172
---@param road userdata DecalRoad object carrying the template/useTemplate dynamic fields.
function editor_roadUtils.updateChildRoads(road) end


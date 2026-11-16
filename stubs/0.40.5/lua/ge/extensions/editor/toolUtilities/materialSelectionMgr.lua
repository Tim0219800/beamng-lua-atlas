---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/toolUtilities/materialSelectionMgr.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- ImGui "Material Selector" window (300 x 500) to pick a material, with thumbnails and a search bar. Used by the editor's decal tools. It lists the materials of Sim.getMaterialSet() filtered by tag (decal for decal patches, RoadAndPath for decal roads) and calls a callback with the chosen material name.
--- Access: extension `editor_toolUtilities_materialSelectionMgr`: `extensions.load("editor_toolUtilities_materialSelectionMgr")`, then the global `editor_toolUtilities_materialSelectionMgr`
---@class editor_toolUtilities_materialSelectionMgr
editor_toolUtilities_materialSelectionMgr = {}

--- Hides the material selection window.
---Source: lua/ge/extensions/editor/toolUtilities/materialSelectionMgr.lua:63
function editor_toolUtilities_materialSelectionMgr.closeWindow() end

--- Returns the texture object for an absolute path, loading it via editor.texObj if needed (limited to 5 loads per frame). Returns false if loading failed, nil if the limit is reached before the first attempt.
---Source: lua/ge/extensions/editor/toolUtilities/materialSelectionMgr.lua:43
---@param absPath string Absolute path of the image.
---@return table|boolean|nil  Texture object (with .tex), false or nil.
function editor_toolUtilities_materialSelectionMgr.getTexObj(absPath) end

--- To be called every frame: draws the window (search + scrolling list of materials with a diffuseMap thumbnail) and calls onSelectMaterialFunct(materialName) on click. Hides the window if there are no materials.
---Source: lua/ge/extensions/editor/toolUtilities/materialSelectionMgr.lua:66
---@param isDecal boolean true: decal patches ('decal' tag); false: decal roads ('RoadAndPath' tag).
---@param onSelectMaterialFunct function|nil Callback called with the chosen material name.
function editor_toolUtilities_materialSelectionMgr.handleMaterialSelectionSubWindow(isDecal, onSelectMaterialFunct) end

--- Shows the material selection window.
---Source: lua/ge/extensions/editor/toolUtilities/materialSelectionMgr.lua:60
function editor_toolUtilities_materialSelectionMgr.openWindow() end

--- Registers the 'materialSelect' window in the editor (editor.registerWindow).
---Source: lua/ge/extensions/editor/toolUtilities/materialSelectionMgr.lua:57
function editor_toolUtilities_materialSelectionMgr.registerWindow() end


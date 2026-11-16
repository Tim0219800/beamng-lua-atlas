---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/terrainMaterialsEditor.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- World Editor 'Terrain Material Library' window: lists, edits, duplicates, deletes and imports from another level the level's terrain materials (TerrainMaterial), with texture validation (PNG format, power-of-2 sizes, value ranges, distance order), undo through history for properties, bulk texture change and upgrade of the old file format (art/terrains/materials.json to art/terrain/main.materials.json). Depends on editor_terrainEditor (which provides the library and the material proxies). Publishes editor.showTerrainMaterialsEditor(internalName) to open the window on a given material.
--- Access: extension `editor_terrainMaterialsEditor`: `extensions.load("editor_terrainMaterialsEditor")`, then the global `editor_terrainMaterialsEditor`
---@class editor_terrainMaterialsEditor
---@field dependencies string[] {"editor_terrainEditor"}: extensions to load before this one.
editor_terrainMaterialsEditor = {}

--- Hook called when the editor is activated: if the window is visible, reloads the material library (editor_terrainEditor.updateMaterialLibrary) and invalidates the validation cache.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/terrainMaterialsEditor.lua:2282
function editor_terrainMaterialsEditor.onEditorActivated() end

--- Editor render hook: draws the 'Terrain Material Library' window (material list, V0/V1 properties, validation, import/duplicate/delete/upgrade buttons) and the associated modal windows.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/terrainMaterialsEditor.lua:1666
function editor_terrainMaterialsEditor.onEditorGui() end

--- Editor initialization hook: registers the window (710x530), the modals (bulk texture change, upgrade, import) and publishes editor.showTerrainMaterialsEditor.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/terrainMaterialsEditor.lua:2272
function editor_terrainMaterialsEditor.onEditorInitialized() end


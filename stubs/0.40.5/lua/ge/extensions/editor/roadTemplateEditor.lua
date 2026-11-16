---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/roadTemplateEditor.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Road template editor (Window > Roads > "Road Template Editor" menu). Lets you choose, save ("Save", "Save as..."), create ("New") and delete a road template (.road.json file) made of DecalRoads, decorations and decals; the fields are edited in the Inspector window. Depends on editor_roadEditor and relies on editor_roadUtils (template reloading). When the window is hidden, the current template is deselected and its temporary objects are deleted.
--- Access: extension `editor_roadTemplateEditor`: `extensions.load("editor_roadTemplateEditor")`, then the global `editor_roadTemplateEditor`
---@class editor_roadTemplateEditor
---@field dependencies string[] {"editor_roadEditor"}: extensions loaded before this one.
editor_roadTemplateEditor = {}

--- Called every frame: if the "roadTemplateEditor" window is hidden, deselects the template; otherwise draws the "Road Templates" window with the buttons Choose Template, Save, Save as..., New, Delete and the choice of the template's roads/decorations/decals.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/roadTemplateEditor.lua:182
function editor_roadTemplateEditor.onEditorGui() end

--- Called when the editor initializes: adds the "Road Template Editor" menu entry (Roads group) and registers the window (200x400).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/roadTemplateEditor.lua:407
function editor_roadTemplateEditor.onEditorInitialized() end

--- Registers the "roadTemplates" preference category with the "general" subcategory and the loadTemplates checkbox (bool, false by default).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/roadTemplateEditor.lua:412
---@param prefsRegistry table Editor preferences registry.
function editor_roadTemplateEditor.onEditorRegisterPreferences(prefsRegistry) end


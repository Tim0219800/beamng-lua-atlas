---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/iesEditor.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Editor window "IES Cookie Importer (WIP)" (Window > Experimental menu). It reads an IES photometric file, displays its metadata (header, photometric type, units, peak direction), a preview, and generates a light "cookie" image (PNG named by default <file>.color.png, with metadata) via editor/api/iesImporter. Useful to a modder who wants to create headlight projection textures from IES data.
--- Access: extension `editor_iesEditor`: `extensions.load("editor_iesEditor")`, then the global `editor_iesEditor`
---@class editor_iesEditor
editor_iesEditor = {}

--- Called every frame by the editor: initializes the defaults once, handles the possible end of the generation job, then draws the window (files/info table and preview, then settings).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/iesEditor.lua:983
function editor_iesEditor.onEditorGui() end

--- Called at editor initialization: adds the menu entry in the 'Experimental' group, registers the window (980x700), initializes the defaults and logs 'Initialized'.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/iesEditor.lua:1022
function editor_iesEditor.onEditorInitialized() end

--- Shows the 'iesEditor' window (editor.showWindow); called by the menu entry.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/iesEditor.lua:1018
function editor_iesEditor.onWindowMenuItem() end


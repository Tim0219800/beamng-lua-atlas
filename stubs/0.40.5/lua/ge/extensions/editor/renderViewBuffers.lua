---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/renderViewBuffers.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Editor debug tool (menu Debug > "NamedTextureTarget Viewer") to preview render buffers (NamedTexTargets) with imgui: filterable list on the left, preview on the right with zoom/pan (wheel, drag), channel choice (RGBA, R, G, B) and view reset by double-click. Useful to inspect render targets, for example shadow maps.
--- Access: extension `editor_renderViewBuffers`: `extensions.load("editor_renderViewBuffers")`, then the global `editor_renderViewBuffers`
---@class editor_renderViewBuffers
editor_renderViewBuffers = {}

--- Hook: draws the window (list + preview) and refreshes the target list on opening.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/renderViewBuffers.lua:274
function editor_renderViewBuffers.onEditorGui() end

--- Hook: adds the Debug menu entry and registers the window (1100x700).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/renderViewBuffers.lua:297
function editor_renderViewBuffers.onEditorInitialized() end


---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/logger.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Empty editor extension (skeleton). It declares onEditorGui and onExtensionLoaded without any code: no window or behavior is added.
--- Access: extension `editor_logger`: `extensions.load("editor_logger")`, then the global `editor_logger`
---@class editor_logger
editor_logger = {}

--- Hook called every frame by the editor to draw the interface. Empty body here.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/logger.lua:9
function editor_logger.onEditorGui() end

--- Hook called when the extension loads. Empty body here.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/logger.lua:12
function editor_logger.onExtensionLoaded() end


---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/rallyEditor/pacenotes/structuredForm.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- "Structured" editing form of a pacenote in the rally editor. It displays a preview of the text and audio files, then the sections Caution, Modifiers Before (preMod1/preMod2), Corner (intensity descriptor, direction, shape, signed steps, length mode, slow corner release type), Modifiers After (postMod1/postMod2) and Distance. Modifiers are chosen by menu or by text search, with a list of the most recently used (10 max). The options come from the notebook's text composer configuration. Used by pacenoteForm.
--- Access: extension `editor_rallyEditor_pacenotes_structuredForm`: `extensions.load("editor_rallyEditor_pacenotes_structuredForm")`, then the global `editor_rallyEditor_pacenotes_structuredForm`
---@class editor_rallyEditor_pacenotes_structuredForm
editor_rallyEditor_pacenotes_structuredForm = {}

--- Resets the form's internal state (configuration, options, search states, active window).
---Source: lua/ge/extensions/editor/rallyEditor/pacenotes/structuredForm.lua:1022
function editor_rallyEditor_pacenotes_structuredForm.clear() end

--- Draws the whole structured form for the given pacenote (loads the configuration if needed).
---Source: lua/ge/extensions/editor/rallyEditor/pacenotes/structuredForm.lua:989
---@param pacenote table Pacenote being edited.
---@param pacenoteToolsWindow table Pacenote tools window, stored for refreshes.
function editor_rallyEditor_pacenotes_structuredForm.draw(pacenote, pacenoteToolsWindow) end


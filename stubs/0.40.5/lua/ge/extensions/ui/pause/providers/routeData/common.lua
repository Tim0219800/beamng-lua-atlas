---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/pause/providers/routeData/common.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `ui_pause_providers_routeData_common` : `extensions.load("ui_pause_providers_routeData_common")`, puis la globale `ui_pause_providers_routeData_common`
---@class ui_pause_providers_routeData_common
---@field ExitGameTexts table
---@field ExitLevelTexts table
ui_pause_providers_routeData_common = {}

--- Skip empty action lists so JSON encodes rail actions as arrays, not objects.
---Source : lua/ge/extensions/ui/pause/providers/routeData/common.lua:81
---@param id any
---@param actions any
function ui_pause_providers_routeData_common.asRailGroup(id, actions) end

---Source : lua/ge/extensions/ui/pause/providers/routeData/common.lua:7
---@param value any
function ui_pause_providers_routeData_common.bool(value) end

---Source : lua/ge/extensions/ui/pause/providers/routeData/common.lua:21
---@param button any
function ui_pause_providers_routeData_common.registerPauseButton(button) end

---Source : lua/ge/extensions/ui/pause/providers/routeData/common.lua:72
---@param exitFn any
---@param payload any
function ui_pause_providers_routeData_common.runExit(exitFn, payload) end

---Source : lua/ge/extensions/ui/pause/providers/routeData/common.lua:11
---@param states any
function ui_pause_providers_routeData_common.tryPushStateSequence(states) end

--- In career the text warns about unsaved progress; the UI fills {{time}} from confirmSince when the popup opens.
---  Without any save, "Save and exit" is offered only while saving is allowed (the onboarding tutorial blocks it).
---Source : lua/ge/extensions/ui/pause/providers/routeData/common.lua:49
---@param button any
---@param context any
---@param texts any
function ui_pause_providers_routeData_common.withExitConfirm(button, context, texts) end


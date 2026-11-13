---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/photomode/session.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `ui_photomode_session` : `extensions.load("ui_photomode_session")`, puis la globale `ui_photomode_session`
---@class ui_photomode_session
---@field dependencies table
ui_photomode_session = {}

---Source : lua/ge/extensions/ui/photomode/session.lua:540
---@param options any
function ui_photomode_session.beginPhotomodeSession(options) end

---Source : lua/ge/extensions/ui/photomode/session.lua:271
function ui_photomode_session.buildCapabilities() end

---Source : lua/ge/extensions/ui/photomode/session.lua:484
function ui_photomode_session.cancelExitConfirmation() end

---Source : lua/ge/extensions/ui/photomode/session.lua:495
function ui_photomode_session.confirmExit() end

---Source : lua/ge/extensions/ui/photomode/session.lua:434
function ui_photomode_session.consumeExitConfirmationBypass() end

---Source : lua/ge/extensions/ui/photomode/session.lua:578
function ui_photomode_session.endPhotomodeSession() end

---Source : lua/ge/extensions/ui/photomode/session.lua:415
function ui_photomode_session.getPanelSurfaceMode() end

---Source : lua/ge/extensions/ui/photomode/session.lua:362
function ui_photomode_session.getRoutePayload() end

---Source : lua/ge/extensions/ui/photomode/session.lua:625
function ui_photomode_session.handleExtensionLoaded() end

---Source : lua/ge/extensions/ui/photomode/session.lua:633
function ui_photomode_session.handleExtensionUnloaded() end

---Source : lua/ge/extensions/ui/photomode/session.lua:385
function ui_photomode_session.isCaptureInProgress() end

---Source : lua/ge/extensions/ui/photomode/session.lua:510
function ui_photomode_session.isDebugEnabled() end

---Source : lua/ge/extensions/ui/photomode/session.lua:389
function ui_photomode_session.isPersistentSessionEnabled() end

---Source : lua/ge/extensions/ui/photomode/session.lua:381
function ui_photomode_session.isPhotomodeSessionActive() end

---Source : lua/ge/extensions/ui/photomode/session.lua:532
---@param routeName any
function ui_photomode_session.onPhotomodeRouteEnter(routeName) end

---Source : lua/ge/extensions/ui/photomode/session.lua:536
---@param routeName any
function ui_photomode_session.onPhotomodeRouteLeave(routeName) end

---Source : lua/ge/extensions/ui/photomode/session.lua:442
---@param route any
---@param params any
---@param context any
function ui_photomode_session.requestExitConfirmation(route, params, context) end

---Source : lua/ge/extensions/ui/photomode/session.lua:514
---@param value any
function ui_photomode_session.setDebugEnabled(value) end

---Source : lua/ge/extensions/ui/photomode/session.lua:97
---@param enabled any
function ui_photomode_session.setHiddenCameraInputEnabled(enabled) end

---Source : lua/ge/extensions/ui/photomode/session.lua:420
---@param mode any
function ui_photomode_session.setPanelSurfaceMode(mode) end

---Source : lua/ge/extensions/ui/photomode/session.lua:396
---@param value any
function ui_photomode_session.setPersistentSessionEnabled(value) end

---Source : lua/ge/extensions/ui/photomode/session.lua:523
---@param scope any
---@param payload any
function ui_photomode_session.traceCaptureDebug(scope, payload) end


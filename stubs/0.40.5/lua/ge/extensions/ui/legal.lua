---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/legal.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Checks whether the user has answered the online consent wizard (settings `onlineFeatures` and `telemetry`, value "ask" = not answered yet). Used by the UI router to prevent leaving the consent screen until it is validated.
--- Access: extension `ui_legal`: `extensions.load("ui_legal")`, then the global `ui_legal`
---@class ui_legal
ui_legal = {}

--- Returns whether navigating away from the current route is allowed: always true inside the `legal.*` route tree (to finish the wizard), otherwise depends on isOnlineConsentSet().
---Source: lua/ge/extensions/ui/legal.lua:35
---@param route table UI route (name field of the form "legal.xxx").
---@return boolean  true if leaving is allowed.
function ui_legal.canLeaveOnlineConsent(route) end

--- Returns true if telemetry and onlineFeatures are both different from "ask". Side effect in simple menu: enables both settings and saves.
---Source: lua/ge/extensions/ui/legal.lua:18
---@return boolean  Consent provided.
function ui_legal.isOnlineConsentSet() end


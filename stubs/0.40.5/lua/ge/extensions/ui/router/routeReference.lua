---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/router/routeReference.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `ui_router_routeReference` : `extensions.load("ui_router_routeReference")`, puis la globale `ui_router_routeReference`
---@class ui_router_routeReference
ui_router_routeReference = {}

--- Overlay explicit params on top of inline params. Explicit params win on
---  collision and log a warning. Inline values are copied as-is (strings).
---Source : lua/ge/extensions/ui/router/routeReference.lua:118
---@param inlineParams any
---@param explicitParams any
function ui_router_routeReference.mergeParams(inlineParams, explicitParams) end

--- Split "route[?query][:scope]" into its parts.
---  Returns { route = string, scope = string|nil, params = table }.
---  Non-string references pass through untouched with empty params.
---Source : lua/ge/extensions/ui/router/routeReference.lua:70
---@param reference any
function ui_router_routeReference.parse(reference) end

--- Parse the "a=1&b=2" segment into a params table. Values remain strings.
---  Repeated keys keep the last value and emit a warning. Bare keys ("flag")
---  resolve to an empty string value.
---Source : lua/ge/extensions/ui/router/routeReference.lua:38
---@param query any
function ui_router_routeReference.parseQuery(query) end

--- Percent-decode a query component and turn '+' into a space, matching the
---  application/x-www-form-urlencoded convention used when the reference is built.
---Source : lua/ge/extensions/ui/router/routeReference.lua:24
---@param value any
function ui_router_routeReference.urlDecode(value) end


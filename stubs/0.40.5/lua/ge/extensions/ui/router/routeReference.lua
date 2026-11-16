---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/router/routeReference.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Pure functions to decompose a decorated navigation reference of the form `route[?key=value&...][:scope]`. The route part may stay relative ("./options"): this module does not resolve it, it only separates the inline query and the scope and decodes the inline parameters.
--- Access: extension `ui_router_routeReference`: `extensions.load("ui_router_routeReference")`, then the global `ui_router_routeReference`
---@class ui_router_routeReference
ui_router_routeReference = {}

--- Overlays explicit parameters on inline parameters (copy). Explicit ones win and a warning is logged if the value differs.
---Source: lua/ge/extensions/ui/router/routeReference.lua:118
---@param inlineParams table|nil Parameters coming from the reference.
---@param explicitParams table|nil Explicitly passed parameters.
---@return table  Merged table.
function ui_router_routeReference.mergeParams(inlineParams, explicitParams) end

--- Splits "route[?query][:scope]" into its parts. A non-string reference is returned unchanged with empty params.
---Source: lua/ge/extensions/ui/router/routeReference.lua:70
---@param reference string|any Raw navigation reference.
---@return table  { route = string, scope = string|nil, params = table<string, string> }
function ui_router_routeReference.parse(reference) end

--- Parses an "a=1&b=2" segment into a table. Values stay strings; a repeated key keeps the last value (warning); a bare key ("flag") is an empty string; empty keys are ignored.
---Source: lua/ge/extensions/ui/router/routeReference.lua:38
---@param query string|nil Query segment without the '?'.
---@return table<string, string>  Decoded parameters.
function ui_router_routeReference.parseQuery(query) end

--- Decodes a query component: '+' becomes a space, then %XX sequences are decoded.
---Source: lua/ge/extensions/ui/router/routeReference.lua:24
---@param value string Encoded text; a non-string value is returned as is.
---@return string  Decoded text.
function ui_router_routeReference.urlDecode(value) end


# `ui_router_routeReference`

*File: `lua/ge/extensions/ui/router/routeReference.lua` · VM: Game Engine (GE) · 140 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `ui_router_routeReference`: `extensions.load("ui_router_routeReference")`, then the global `ui_router_routeReference`

Pure functions to decompose a decorated navigation reference of the form `route[?key=value&...][:scope]`. The route part may stay relative ("./options"): this module does not resolve it, it only separates the inline query and the scope and decodes the inline parameters.

## Example

```lua
local r = extensions.ui_router_routeReference.parse("menu.options?tab=audio&x=1:scope1")
-- r.route == "menu.options", r.scope == "scope1", r.params == {tab="audio", x="1"}
```

## Notes

- Inline values stay strings. Explicit parameters passed programmatically win over inline ones on collision (mergeParams, with a warning).
- Without '?', the scope separator is the first ':' of the reference; with '?', it is the first ':' after the '?'.
- A reference whose route is empty, or whose scope is empty, is treated as an undecorated route (scope nil).

## Functions

| Function | Description | Line |
|---|---|---|
| `ui_router_routeReference.mergeParams(inlineParams, explicitParams)` | Overlays explicit parameters on inline parameters (copy). Explicit ones win and a warning is logged if the value differs. | 118 |
| `ui_router_routeReference.parse(reference)` | Splits "route[?query][:scope]" into its parts. A non-string reference is returned unchanged with empty params. | 70 |
| `ui_router_routeReference.parseQuery(query)` | Parses an "a=1&b=2" segment into a table. Values stay strings; a repeated key keeps the last value (warning); a bare key ("flag") is an empty string; empty keys are ignored. | 38 |
| `ui_router_routeReference.urlDecode(value)` | Decodes a query component: '+' becomes a space, then %XX sequences are decoded. | 24 |

### Parameter details

#### `ui_router_routeReference.mergeParams(inlineParams, explicitParams)`

Overlays explicit parameters on inline parameters (copy). Explicit ones win and a warning is logged if the value differs.

- `inlineParams` (*table|nil*) : Parameters coming from the reference.
- `explicitParams` (*table|nil*) : Explicitly passed parameters.
- **returns**: table Merged table.

#### `ui_router_routeReference.parse(reference)`

Splits "route[?query][:scope]" into its parts. A non-string reference is returned unchanged with empty params.

- `reference` (*string|any*) : Raw navigation reference.
- **returns**: table { route = string, scope = string|nil, params = table<string, string> }

#### `ui_router_routeReference.parseQuery(query)`

Parses an "a=1&b=2" segment into a table. Values stay strings; a repeated key keeps the last value (warning); a bare key ("flag") is an empty string; empty keys are ignored.

- `query` (*string|nil*) : Query segment without the '?'.
- **returns**: table<string, string> Decoded parameters.

#### `ui_router_routeReference.urlDecode(value)`

Decodes a query component: '+' becomes a space, then %XX sequences are decoded.

- `value` (*string*) : Encoded text; a non-string value is returned as is.
- **returns**: string Decoded text.

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/ui/router/routeReference.lua`.*

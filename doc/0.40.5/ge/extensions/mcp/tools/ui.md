# `mcp_tools_ui`

*File: `lua/ge/extensions/mcp/tools/ui.lua` · VM: Game Engine (GE) · 205 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `mcp_tools_ui`: `extensions.load("mcp_tools_ui")`, then the global `mcp_tools_ui`

MCP tools for the interface (CEF/Vue): read the route and Pinia state, navigate, show/hide the UI, display a message, and drive the DOM (arbitrary JS, click, wheel, typing, keyboard, hover) for interface testing. JS commands are sent with be:executeJS; results come back to GE through window.beamng.sendEngineLua to the `_cb.vueDump` / `_cb.uiEval` callbacks.

## Notes

- Security warning: ui_eval runs arbitrary JavaScript in the UI.
- ui_eval and dump_vue_state are asynchronous: a call returns the result of the previous request (if there is one) or a "call again" message. In ui_eval, if a result is already pending it is returned WITHOUT relaunching the evaluation. The JS body can be an expression (auto-returned if the text does not contain "return").
- The ui_eval serializer is bounded (depth 5, 200 array elements, 100 object keys); DOM nodes are reduced to a <tag#id.class> descriptor.
- ui_click, ui_scroll, ui_type, ui_key, ui_hover are "fire-and-forget" (JS errors swallowed, no feedback on actual success): check the effect with ui_eval. `nth` is 1-based.
- The ui_eval callback is shared: `ui_eval` uses shared.asyncResults.ui, `dump_vue_state` shared.asyncResults.vue.

## Functions

| Function | Description | Line |
|---|---|---|
| `mcp_tools_ui.dump_vue_state()` | Requests a snapshot of the current route and the Pinia stores (asynchronous). | 50 |
| `mcp_tools_ui.get_ui_state()` | UI state: route/scope (ui_router.getState) and game state (core_gamestate.getGameState). | 36 |
| `mcp_tools_ui.set_ui_state(args)` | Navigates to a UI route (ui_router.navigate). | 42 |
| `mcp_tools_ui.show_message(args)` | Displays a message in the game's message app via ui_message; reusing the same category replaces the previous message. | 66 |
| `mcp_tools_ui.toggle_ui(args)` | Shows/hides the UI (like Alt+U) via ui_visibility. | 58 |
| `mcp_tools_ui.ui_click(args)` | Simulates a full click (pointerdown, mousedown, pointerup, mouseup, click, optional dblclick) at the center of an element found by CSS selector; right click also triggers contextmenu. | 89 |
| `mcp_tools_ui.ui_eval(args)` | Evaluates JavaScript in the UI and returns its value as JSON (asynchronous). | 76 |
| `mcp_tools_ui.ui_hover(args)` | Simulates hovering (pointerover, mouseover, pointerenter, mouseenter, pointermove, mousemove) over an element. | 134 |
| `mcp_tools_ui.ui_key(args)` | Sends a keyboard event to an element or to the active element. | 124 |
| `mcp_tools_ui.ui_scroll(args)` | Sends a wheel event to an element (deltaY>0 = down; 120 by default if no delta). | 103 |
| `mcp_tools_ui.ui_type(args)` | Types text into an input/textarea/contenteditable (sets the value then triggers input and change, v-model compatible). | 113 |

### Parameter details

#### `mcp_tools_ui.dump_vue_state()`

Requests a snapshot of the current route and the Pinia stores (asynchronous).

- **returns**: string Previous JSON {route, stores}, or message.
- **returns**: boolean false.

#### `mcp_tools_ui.get_ui_state()`

UI state: route/scope (ui_router.getState) and game state (core_gamestate.getGameState).

- **returns**: string JSON {route, gameState}.
- **returns**: boolean false.

#### `mcp_tools_ui.set_ui_state(args)`

Navigates to a UI route (ui_router.navigate).

- `args` (*table*) : {route: string (e.g. 'menu', 'menu.vehicles'), params?: table}
- **returns**: string Message.
- **returns**: boolean true on error.

#### `mcp_tools_ui.show_message(args)`

Displays a message in the game's message app via ui_message; reusing the same category replaces the previous message.

- `args` (*table*) : {text: string, ttl?: number s (default 5), category?: string (default 'mcp'), icon?: string (default 'info')}
- **returns**: string "shown: …".
- **returns**: boolean true if text is missing.

#### `mcp_tools_ui.toggle_ui(args)`

Shows/hides the UI (like Alt+U) via ui_visibility.

- `args` (*table|nil*) : {show?: boolean} true/false to set, absent to toggle.
- **returns**: string "ui visible: …".
- **returns**: boolean true if ui_visibility is absent.

#### `mcp_tools_ui.ui_click(args)`

Simulates a full click (pointerdown, mousedown, pointerup, mouseup, click, optional dblclick) at the center of an element found by CSS selector; right click also triggers contextmenu.

- `args` (*table*) : {selector: string, nth?: integer, button?: 'left'|'middle'|'right'|0|1|2, doubleClick?: boolean}
- **returns**: string Message.
- **returns**: boolean true if selector is missing.

#### `mcp_tools_ui.ui_eval(args)`

Evaluates JavaScript in the UI and returns its value as JSON (asynchronous).

- `args` (*table*) : {js: string}
- **returns**: string JSON result or "dispatched" message.
- **returns**: boolean true if js is missing.

#### `mcp_tools_ui.ui_hover(args)`

Simulates hovering (pointerover, mouseover, pointerenter, mouseenter, pointermove, mousemove) over an element.

- `args` (*table*) : {selector: string, nth?: integer}
- **returns**: string Message.
- **returns**: boolean true if selector is missing.

#### `mcp_tools_ui.ui_key(args)`

Sends a keyboard event to an element or to the active element.

- `args` (*table*) : {key: string (e.g. 'Enter'), selector?: string, event?: 'down'|'up'|'press' (default keydown+keyup), nth?: integer}
- **returns**: string Message.
- **returns**: boolean true if key is missing.

#### `mcp_tools_ui.ui_scroll(args)`

Sends a wheel event to an element (deltaY>0 = down; 120 by default if no delta).

- `args` (*table*) : {selector: string, deltaX?: number, deltaY?: number, nth?: integer}
- **returns**: string Message.
- **returns**: boolean true if selector is missing.

#### `mcp_tools_ui.ui_type(args)`

Types text into an input/textarea/contenteditable (sets the value then triggers input and change, v-model compatible).

- `args` (*table*) : {selector: string, text: string, clear?: boolean (default true, false = append), nth?: integer}
- **returns**: string Message.
- **returns**: boolean true if a parameter is missing.

## Fields

| Field | Type | Description |
|---|---|---|
| `cb` | table<string, function> | Callbacks `vueDump(s)` and `uiEval(s)`: store the string in shared.asyncResults.vue / .ui. |
| `schemas` | table<string, table> | Schemas of the interface tools. |

## Calls into the engine (C++)

- `be:` `executeJS`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/mcp/tools/ui.lua`.*

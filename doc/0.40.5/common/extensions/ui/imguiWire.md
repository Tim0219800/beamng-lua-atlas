# `ui_imguiWire`

*File: `lua/common/extensions/ui/imguiWire.lua` · VM: Common (GE + vehicle) · 69 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `ui_imguiWire`: `extensions.load("ui_imguiWire")`, then the global `ui_imguiWire`

ImGui "cable" prototype: loads ui_imgui then replaces each ui_imgui function with a wrapper that, instead of calling ImGui, records the call (name + arguments) in a buffer. clear() then executes the whole buffer via ui_imgui and stores the return values, which are returned at the next cycle to identical calls. Designed to send ImGui calls from one VM to another (comments "send buf to GE / GE: execute").

## Notes

- Known issue noted in the code: nils are "swallowed" (c.ProgressBar(0.4, nil, 'FOO') becomes c.ProgressBar(0.4, 'FOO')).
- Calls not yet executed return false (unpack(returns[id] or {false})); return values are only available at the next cycle.
- Results are identified by a key built with tostring of the arguments + an occurrence counter: two identical calls in the same cycle get different keys.
- The wrapper is only created for keys present in ui_imgui when this module loads.
- The module only returns M.clear; the wrapped functions are added to M (so M.Begin, M.Text...).

## Functions

| Function | Description | Line |
|---|---|---|
| `ui_imguiWire.clear()` | Executes all stored ImGui calls in order on ui_imgui, keeps the non-empty return values for the calls of the next cycle, then empties the buffer and the identifier cache. | 61 |

**Loads extensions:** `ui_imgui`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/common/extensions/ui/imguiWire.lua`.*

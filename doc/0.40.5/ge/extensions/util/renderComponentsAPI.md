# `util_renderComponentsAPI`

*File: `lua/ge/extensions/util/renderComponentsAPI.lua` · VM: Game Engine (GE) · 16 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `util_renderComponentsAPI`: `extensions.load("util_renderComponentsAPI")`, then the global `util_renderComponentsAPI`

Small helper module for the render components UI: lists the color correction (LUT) PNG files present in art/postfx, usable for post-processing.

## Example

```lua
dump(extensions.util_renderComponentsAPI.getColorCorrections())
```

## Functions

| Function | Description | Line |
|---|---|---|
| `util_renderComponentsAPI.getColorCorrections()` | Lists the *.png files in the art/postfx folder (non-recursive). | 7 |

### Parameter details

#### `util_renderComponentsAPI.getColorCorrections()`

Lists the *.png files in the art/postfx folder (non-recursive).

- **returns**: table[] List of tables {filename = PNG path}

## Calls into the engine (C++)

- `FS:` `findFiles`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/util/renderComponentsAPI.lua`.*

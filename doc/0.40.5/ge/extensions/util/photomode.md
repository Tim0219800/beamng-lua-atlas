# `util_photomode`

*File: `lua/ge/extensions/util/photomode.lua` · VM: Game Engine (GE) · 16 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `util_photomode`: `extensions.load("util_photomode")`, then the global `util_photomode`

Small photo mode module: lists the PNG overlay images available in ui/modules/photomode/ui-overlays (frames, watermarks) that the UI offers to the user. A modder can drop their own PNGs there to make them available.

## Example

```lua
dump(extensions.util_photomode.getPhotomodeOverlays())
```

## Functions

| Function | Description | Line |
|---|---|---|
| `util_photomode.getPhotomodeOverlays()` | Lists the *.png files in ui/modules/photomode/ui-overlays (non-recursive). | 7 |

### Parameter details

#### `util_photomode.getPhotomodeOverlays()`

Lists the *.png files in ui/modules/photomode/ui-overlays (non-recursive).

- **returns**: table[] List of tables {filename = PNG path}

## Calls into the engine (C++)

- `FS:` `findFiles`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/util/photomode.lua`.*

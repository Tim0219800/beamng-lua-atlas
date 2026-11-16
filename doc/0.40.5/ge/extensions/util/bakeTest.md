# `util_bakeTest`

*File: `lua/ge/extensions/util/bakeTest.lua` · VM: Game Engine (GE) · 69 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `util_bakeTest`: `extensions.load("util_bakeTest")`, then the global `util_bakeTest`

Internal development tool: after a mission starts, it runs the GPU material "baker" (bakeShapeMaterialsPBR) then the glTF export (exportShapeToGltf) on a fixed list of 10 buildings of the west_coast_usa level, to validate the chain end to end. The results (PNG atlas and .gltf file) are written to /temp/bakeTest/<name>/.

## Example

```lua
-lua "extensions.load('util/bakeTest')"
```

## Notes

- Baking at 4096 px with a 16 px gutter. A 60-frame wait follows the mission start to let the shaders compile; one mesh is processed per frame (onUpdate).
- A [i/n] log is written for each mesh (OK or FAIL), then a summary "bakeTest DONE: n ok, m failed".
- Depends on global engine functions (bakeShapeMaterialsPBR, exportShapeToGltf) and on .dae files of the west_coast_usa level.

## Functions

| Function | Description | Line |
|---|---|---|
| `util_bakeTest.onClientPostStartMission()` | Hook called after a mission starts: arms the processing and starts a 60-frame wait. *(internal)* *(hook)* | 50 |
| `util_bakeTest.onUpdate()` | Hook called every frame: after the wait, processes one mesh per frame (baking then glTF export) until the end of the list. *(internal)* *(hook)* | 55 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/util/bakeTest.lua`.*

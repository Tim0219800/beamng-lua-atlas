# `ssaoModule`

*File: `lua/ge/client/postFx/ssao.lua` · VM: Game Engine (GE) · 91 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** global `ssaoModule`

Screen-space ambient occlusion (SSAO, with bent normals / GTAO). On import, creates the object "SSAOPostFx" (PostEffectSSAO) if missing, then sets its bentNormals property from the PostFXSpecularOcclusionEnabled setting, and creates "SSAOVizPostFx" to visualize #ssaoMask. The module keeps the current contrast and radius in memory and passes them to the object.

## Example

```lua
local ssao = require('client/postFx/ssao')
ssao.setRadius(2.0)
ssao.setContrast(1.5)
print(ssao.getRadius(), ssao.getContrast())
```

## Notes

- Default values: contrast 2, radius 1.5 (variables defaultContrast / defaultRadius).
- setContrast and setRadius apply tonumber; a non-numeric value is ignored without error.

## Functions

| Function | Description | Line |
|---|---|---|
| `ssaoModule.applyDefaults()` | Sets $SSAOPostFx::Enable to true and restores the default contrast (2) and radius (1.5). | 35 |
| `ssaoModule.getContrast()` | Returns the stored contrast. | 44 |
| `ssaoModule.getRadius()` | Returns the stored radius. | 45 |
| `ssaoModule.setBentNormalDebugEnabled(enabled)` | Enables or disables a debug effect (GTAOBentNormalsVizPostFx, created on demand) that displays the bent normals map #gtaoOutput. No cost while it is disabled. | 49 |
| `ssaoModule.setContrast(value)` | Stores the SSAO contrast and applies it to SSAOPostFx (the object's setContrast method). Ignored if the value cannot be converted to a number. | 15 |
| `ssaoModule.setRadius(value)` | Stores the SSAO radius and applies it to SSAOPostFx. Ignored if the value is not numeric. | 25 |

### Parameter details

#### `ssaoModule.getContrast()`

Returns the stored contrast.

- **returns**: number Current contrast.

#### `ssaoModule.getRadius()`

Returns the stored radius.

- **returns**: number Current radius.

#### `ssaoModule.setBentNormalDebugEnabled(enabled)`

Enables or disables a debug effect (GTAOBentNormalsVizPostFx, created on demand) that displays the bent normals map #gtaoOutput. No cost while it is disabled.

- `enabled` (*boolean*) : true to show, false to hide.

#### `ssaoModule.setContrast(value)`

Stores the SSAO contrast and applies it to SSAOPostFx (the object's setContrast method). Ignored if the value cannot be converted to a number.

- `value` (*number|string*) : New contrast.

#### `ssaoModule.setRadius(value)`

Stores the SSAO radius and applies it to SSAOPostFx. Ignored if the value is not numeric.

- `value` (*number|string*) : New radius (scene unit, inferred from code).

## Calls into the engine (C++)

- `scenetree.` `findObject`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/client/postFx/ssao.lua`.*

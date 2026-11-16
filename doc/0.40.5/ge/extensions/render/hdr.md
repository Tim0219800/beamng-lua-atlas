# `render_hdr`

*File: `lua/ge/extensions/render/hdr.lua` · VM: Game Engine (GE) · 72 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `render_hdr`: `extensions.load("render_hdr")`, then the global `render_hdr`

Creates, on the first frame, the HDR post-processing effect chain (auto/local exposure): PostEffectBrightPass (AfterPostFX rendering at 0.5 scale) with its children PostEffectDownScale, PostEffectLuminance and PostEffectCombinePass, plus PostEffectLocalExposure (0.25 scale) whose exposure bias in EV comes from the GraphicEVCompensation setting. Not used directly by a modder; global: render_hdr.

## Notes

- Does nothing if the only graphics adapter is "GFX Null Device" (server without GPU): error log "Null graphics device detected".
- Each object is only created if it does not already exist in the scenetree (lookup by name PostEffect…Object); only exposureBiasEV of PostEffectLocalExposureObject is updated on each call.
- The variable `initialized` is never set to true in onFirstUpdate (only by onDeserialized): the guard therefore only acts after a Lua reload; creation remains idempotent thanks to the lookups by name.

## Functions

| Function | Description | Line |
|---|---|---|
| `render_hdr.onDeserialized(data)` | After Lua reload: restores the initialized flag. *(internal)* *(hook)* | 61 |
| `render_hdr.onFirstUpdate()` | Hook of the game's first update: creates (if absent) the HDR post-processing objects described above and applies the GraphicEVCompensation exposure bias (setting, in EV, 0 by default). *(internal)* *(hook)* | 9 |
| `render_hdr.onSerialize()` | Before Lua reload. *(internal)* *(hook)* | 57 |

### Parameter details

#### `render_hdr.onDeserialized(data)`

After Lua reload: restores the initialized flag.

- `data` (*table*) : Table returned by onSerialize.

#### `render_hdr.onSerialize()`

Before Lua reload.

- **returns**: table {initialized = true}

## Calls into the engine (C++)

- `scenetree.` `findObject`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/render/hdr.lua`.*

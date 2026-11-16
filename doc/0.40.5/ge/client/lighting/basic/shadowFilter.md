# `client_lighting_basic_shadowFilter`

*File: `lua/ge/client/lighting/basic/shadowFilter.lua` · VM: Game Engine (GE) · 44 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("client/lighting/basic/shadowFilter")`

Creates the shadow blur filter of basic lighting: two ShaderData (BL_ShadowFilterShaderV and BL_ShadowFilterShaderH, same compute shader shadowFilter.cs.hlsl with BLUR_DIR = (1,0) then (0,1)) and a PostEffect "BL_ShadowFilterPostFx" that chains the two passes. Loaded by lighting/basic/init.lua. No exported function.

## Notes

- The variable of the second pass is also named bl_ShadowFilterShaderH in the code but refers to a PostEffect (reused name); it is registered without a name.
- The shader named "...V" receives the horizontal direction (1,0) and the "...H" the vertical (0,1): the suffixes do not match the actual direction.

## Calls into the engine (C++)

- `scenetree.` `findObject`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/client/lighting/basic/shadowFilter.lua`.*

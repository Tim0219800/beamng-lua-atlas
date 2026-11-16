# `client_lighting_shadowMaps_init`

*File: `lua/ge/client/lighting/shadowMaps/init.lua` · VM: Game Engine (GE) · 12 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("client/lighting/shadowMaps/init")`

Declares the ShaderData "BlurDepthShader" (boxFilterV.hlsl / boxFilterP.hlsl) used to blur shadow maps, if it does not already exist. No exported function.

## Calls into the engine (C++)

- `scenetree.` `findObject`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/client/lighting/shadowMaps/init.lua`.*

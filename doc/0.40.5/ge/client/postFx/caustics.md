# `client_postFx_caustics`

*File: `lua/ge/client/postFx/caustics.lua` · VM: Game Engine (GE) · 49 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("client/postFx/caustics")`

Underwater caustics post-effect. Creates (if they do not exist) the state block PFX_CausticsStateBlock (additive blending), the shader PFX_CausticsShader (caustics.cs.hlsl) and the PostEffect "CausticsPFX", disabled by default, which reads the prepass, the depth and two textures caustics_1.png / caustics_2.png. It is enabled and disabled by the callbacks of UnderwaterFogPostFx (see fog.lua). No exported function.

## Calls into the engine (C++)

- `scenetree.` `findObject`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/client/postFx/caustics.lua`.*

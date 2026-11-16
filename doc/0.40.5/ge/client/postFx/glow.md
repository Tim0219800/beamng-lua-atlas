# `client_postFx_glow`

*File: `lua/ge/client/postFx/glow.lua` · VM: Game Engine (GE) · 90 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("client/postFx/glow")`

Glow effect. Creates the separable blur shaders PFX_GlowBlurVertShader and PFX_GlowBlurHorzShader, the combine shader PFX_GlowCombineShader and the PostEffect "GlowPostFx" (rendered after GlowBin, resolution 0.5x0.5, reads #glowbuffer) to which three sub-effects are added: vertical blur, horizontal blur then combination with $backBuffer. No exported function.

## Notes

- In the code, the "Vert" blur has BLUR_DIR=(0,1) and the "Horz" one BLUR_DIR=(1,0).
- The local variable of the main PostEffect is named gammaPostFX (name inherited from a copy-paste) but the registered object is GlowPostFx.

## Calls into the engine (C++)

- `scenetree.` `findObject`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/client/postFx/glow.lua`.*

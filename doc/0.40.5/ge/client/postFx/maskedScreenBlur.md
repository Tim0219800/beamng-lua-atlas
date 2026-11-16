# `client_postFx_maskedScreenBlur`

*File: `lua/ge/client/postFx/maskedScreenBlur.lua` · VM: Game Engine (GE) · 94 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("client/postFx/maskedScreenBlur")`

Masked screen blur. Creates the object "ScreenBlurFX" (type PostEffectMaskedBlur, enabled, rendered after OverlayRender, target at 40% of the screen) with three sub-effects: Y blur, X blur (shader DOF_Gausian.cs.hlsl) then SimpleBlendShader which mixes the sharp screen and the blurred image according to the #screenBlurMask mask. Used for example to blur the background under menus. No exported function.

## Calls into the engine (C++)

- `scenetree.` `findObject`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/client/postFx/maskedScreenBlur.lua`.*

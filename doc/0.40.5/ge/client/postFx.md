# `client_postFx`

*File: `lua/ge/client/postFx.lua` · VM: Game Engine (GE) · 154 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("client/postFx")`

Manager of the game's post-effects (PostFX). On import it creates the common objects: state blocks PFX_DefaultStateBlock and PFX_DefaultBlitStateBlock, shaders PFX_PassthruShader and PFX_PassthruComputeShader, and the PostEffects AL_FormatBlit and AL_UpscaleBilinear (disabled at the start). It loads the effects from client/postFx/* (caustics, dof, edgeAA, fog, fxaa, glow, maskedScreenBlur, smaa, ssao, screenSpaceShadows) and can reapply the SSAO and DOF default values.

## Notes

- initPostEffects and reloadPostEffects contain the same code (one require per effect); require caches, so reloading only runs the modules once unless the cache is cleared.
- The global table postEffectCallbacks is published via rawset on _G; its onEnabled always returns true.

## Functions

| Function | Description | Line |
|---|---|---|
| `client_postFx.applyDefaults()` | Reapplies the default values of ssao and dof (applyDefaults of each module), enables or disables the SSAOPostFx object according to $SSAOPostFx::Enable, then calls dof.updateDOFSettings(). | 133 |
| `client_postFx.initPostEffects()` | Loads all post-effect modules and keeps references to dof and ssao. *(internal)* | 84 |
| `client_postFx.reloadPostEffects()` | Identical to initPostEffects (called by reloadClient). *(internal)* | 103 |

## Class `postEffectCallbacks`

Global callback table (_G.postEffectCallbacks) used by the engine for PostEffects.

| Method | Description | Line |
|---|---|---|
| `postEffectCallbacks.onEnabled()` | Called when a PostEffect is enabled; returns true (allows the activation). | 125 |

## Calls into the engine (C++)

- `scenetree.` `findObject`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/client/postFx.lua`.*

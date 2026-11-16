# `client_lighting_advanced_shaders`

*File: `lua/ge/client/lighting/advanced/shaders.lua` · VM: Game Engine (GE) · 227 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("client/lighting/advanced/shaders")`

Declares, if absent, the rendering objects of advanced (deferred) lighting: state blocks AL_VectorLightState and AL_ConvexLightState, shaders and materials for directional lights (AL_VectorLightShader/Material, "lightinfo" target), point lights (AL_PointLight*), spot lights (AL_SpotLight*) and particles (AL_ParticlePointLight*), as well as the default materials AL_DefaultPrePassMaterial and AL_DefaultShadowMaterial (double-sided). Loaded by lighting/advanced/init.lua. No exported function; only a low-level rendering modder cares about it.

## Notes

- The materials read the G-buffers (#prepass[RT0..RT5], #prepass[Depth]), the shadow map ($dynamiclight), the cookies ($dynamiclightmask, #cloudTransmittanceCookie) and the masks #ssaoMask, #sssMask, #sunShadowMask.
- AL_ConvexLightState chooses zFunc GFXCmpLessEqual if $Scene::useReversedDepthBuffer is true, otherwise GFXCmpGreaterEqual; stencilRef = 4 for both light state blocks.
- Shadow maps are sampled with SamplerClampPoint (code comment: some cards do not filter identically).

## Calls into the engine (C++)

- `scenetree.` `findObject`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/client/lighting/advanced/shaders.lua`.*

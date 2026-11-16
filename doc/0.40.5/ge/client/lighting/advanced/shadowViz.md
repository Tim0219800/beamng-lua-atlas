# `client_lighting_advanced_shadowViz`

*File: `lua/ge/client/lighting/advanced/shadowViz.lua` · VM: Game Engine (GE) · 95 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("client/lighting/advanced/shadowViz")`

Declares, if they do not exist, the ShaderData "AL_ShadowVisualizeShader" (dbgShadowVisualizeP.hlsl) and the CustomMaterial "AL_ShadowVisualizeMaterial" that displays a light's shadow map (sampler shadowMap = #AL_ShadowVizTexture). The rest of the file, the TorqueScript toggle functions (toggleShadowViz, showShadowVizForLight, lockShadowViz…), is entirely commented out and therefore inactive. No exported function.

## Calls into the engine (C++)

- `scenetree.` `findObject`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/client/lighting/advanced/shadowViz.lua`.*

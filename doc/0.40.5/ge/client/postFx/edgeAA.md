# `client_postFx_edgeAA`

*File: `lua/ge/client/postFx/edgeAA.lua` · VM: Game Engine (GE) · 41 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("client/postFx/edgeAA")`

Edge detection for edge-based anti-aliasing. Creates the state block PFX_DefaultEdgeAAStateBlock, the shader PFX_EdgeAADetectShader (edgeDetect.cs.hlsl) and the PostEffect "EdgeDetectPostEffect" (enabled, resolution 0.5x0.5, target #edge, before ObjTranslucentBin) which reads #prepass[RT0] and the depth. No exported function.

## Calls into the engine (C++)

- `scenetree.` `findObject`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/client/postFx/edgeAA.lua`.*

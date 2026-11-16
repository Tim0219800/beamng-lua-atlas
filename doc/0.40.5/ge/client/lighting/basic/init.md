# `client_lighting_basic_init`

*File: `lua/ge/client/lighting/basic/init.lua` · VM: Game Engine (GE) · 92 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("client/lighting/basic/init")`

"Basic Lighting" light manager. Creates the state block BL_ProjectedShadowSBData, the shader BL_ProjectedShadowShaderData and the material BL_ProjectedShadowMaterial (projected shadows), loads shadowFilter, then publishes the global table BLMCallbacks. onActivate enables AL_FormatToken and creates a RenderPassManager "BL_ProjectedShadowRPM" with a RenderFastMgr, added to RootGroup; onDeactivate disables AL_FormatToken and deletes this RenderPassManager.

## Notes

- The depth biases (zBias/zSlopeBias) are +1 if $Scene::useReversedDepthBuffer is true, otherwise -5.
- onDeactivate calls renderPassManager:delete() without checking that BL_ProjectedShadowRPM exists: error if deactivated without prior activation.
- blendEnable is assigned twice in a row (harmless duplicate).

## Calls into the engine (C++)

- `scenetree.` `findObject`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/client/lighting/basic/init.lua`.*

# `client_init`

*File: `lua/ge/client/init.lua` · VM: Game Engine (GE) · 200 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("client/init")`

Initialization of the graphics client (port of Torque's client.cs). initClient prepares rendering (postFx, renderManager, lighting systems), creates the GameViewportCtrl "OnlyGui" and CefGui "maincef" controls (web interface), loads the datablocks (core/art/datablocks, art, assets) then shows the main menu. reloadClient only reloads the lighting systems and post-effects.

## Notes

- The name "maincef" must not change: it is hardcoded on the C++ side (code comment). Its start URL is local://local/ui/entrypoints/main/index.html.
- With the command-line argument -noui, GameViewportCtrl is not created.
- If the graphics adapter is "GFX Null Device", PostFX initialization is skipped (error logged).
- With -convertCSMaterials, the datablock folders are not loaded.
- $defaultLevelEnviromentMap is set to BNG_Sky_02_cubemap (default cubemap for levels without globalEnviromentMap).

## Functions

| Function | Description | Line |
|---|---|---|
| `client_init.initClient()` | Full client initialization sequence: base rendering, GUI controls, datablocks, audioData.cs if it exists, then loadMainMenu. *(internal)* | 164 |
| `client_init.loadMainMenu()` | Shows the "OnlyGui" control as the canvas content (main menu), if both objects exist. *(internal)* | 89 |
| `client_init.reloadClient()` | Reloads the lighting systems and post-effects (reloadLightingSystems, reloadPostEffects), useful after a graphics configuration change. *(internal)* | 193 |

## Calls into the engine (C++)

- `Engine.` `getStartingArgs`
- `FS:` `expandFilename`, `fileExists`
- `TorqueScriptLua.` `exec`
- `scenetree.` `findObject`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/client/init.lua`.*

# `client_lighting_advanced_lightViz`

*File: `lua/ge/client/lighting/advanced/lightViz.lua` · VM: Game Engine (GE) · 247 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("client/lighting/advanced/lightViz")`

Debug visualization modes for advanced lighting. It creates PostEffects (priority 9999, target $backBuffer): AL_DepthVisualize, AL_NormalsVisualize, AL_LightColorVisualize, AL_LightSpecularVisualize, AL_VelocityVisualize and AnnotationVisualize, with their shaders and state blocks. It defines toggle globals (toggleDepthViz, toggleNormalsViz, toggleLightColorViz, toggleLightSpecularViz, toggleVelocityViz, toggleAnnotationVisualize, toggleLightVisualizer) and onEnabled/onDisabled callback tables. Only one mode is active at a time: enabling a mode disables the previous one.

## Example

```lua
toggleDepthViz()        -- toggles depth visualization
toggleNormalsViz(true)  -- forces enabling
toggleNormalsViz(false) -- forces disabling
```

## Notes

- Argument of the toggleXxxViz(enable) functions: nil or "" toggles (and updates the variable $AL_xxxVisualizeVar), true enables, false disables.
- The onEnabled callbacks return true. The one for AnnotationVisualize enables Engine.Annotation.enable(true) if it exists, and onDisabled disables it.
- Inconsistency: the normals callback table is published under the global "AL_NormalsVisualize" (same name as the PostEffect object) instead of "AL_NormalsVisualizeCallbacks" as for the other modes.
- The callback tables are local with rawset on _G: AL_DepthVisualizeCallbacks, AL_LightColorVisualizeCallbacks, AL_LightSpecularVisualizeCallbacks, AL_VelocityVisualizeCallbacks, AnnotationVisualizeCallbacks.

## Class `aL_LightColorVisualizeCallbacks`

Callbacks of AL_LightColorVisualize.

| Method | Description | Line |
|---|---|---|
| `aL_LightColorVisualizeCallbacks.onEnabled()` | Same logic for AL_LightColorVisualize. | 113 |

## Class `aL_LightSpecularVisualizeCallbacks`

Callbacks of AL_LightSpecularVisualize.

| Method | Description | Line |
|---|---|---|
| `aL_LightSpecularVisualizeCallbacks.onEnabled()` | Same logic for AL_LightSpecularVisualize. | 140 |

## Class `aL_NormalsVisualizeCallbacks`

Callbacks of AL_NormalsVisualize (published under the global AL_NormalsVisualize).

| Method | Description | Line |
|---|---|---|
| `aL_NormalsVisualizeCallbacks.onEnabled()` | Same logic for AL_NormalsVisualize. | 85 |

## Class `al_DepthVisualizeCallbacks`

Callbacks of AL_DepthVisualize (global AL_DepthVisualizeCallbacks).

| Method | Description | Line |
|---|---|---|
| `al_DepthVisualizeCallbacks.onEnabled()` | Disables the previous visualization mode, remembers AL_DepthVisualize as the current mode, returns true. | 56 |

## Class `al_VelocityVisualizeCallbacks`

Callbacks of AL_VelocityVisualize (texture #VelocityBuffer).

| Method | Description | Line |
|---|---|---|
| `al_VelocityVisualizeCallbacks.onEnabled()` | Same logic for AL_VelocityVisualize. | 167 |

## Class `annotationVisualizeCallbacks`

Callbacks of AnnotationVisualize (annotation buffer).

| Method | Description | Line |
|---|---|---|
| `annotationVisualizeCallbacks.onDisabled()` | Disables Engine.Annotation if available. | 203 |
| `annotationVisualizeCallbacks.onEnabled()` | If Engine.Annotation exists: selects the AnnotationVisualize mode and enables Engine.Annotation. | 195 |

## Calls into the engine (C++)

- `scenetree.` `findObject`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/client/lighting/advanced/lightViz.lua`.*

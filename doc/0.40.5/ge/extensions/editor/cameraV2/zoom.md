# `editor_cameraV2_zoom`

*Fichier : `lua/ge/extensions/editor/cameraV2/zoom.lua` · VM : Game Engine (GE) · 267 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_cameraV2_zoom` : `extensions.load("editor_cameraV2_zoom")`, puis la globale `editor_cameraV2_zoom`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_cameraV2_zoom.cancel()` |  | 254 |
| `editor_cameraV2_zoom.isActive()` |  | 258 |
| `editor_cameraV2_zoom.lastZoomUsedTerrainOnly()` |  | 262 |
| `editor_cameraV2_zoom.onMouseWheel(value, fixedFocus)` | *(hook)* | 171 |
| `editor_cameraV2_zoom.update(deltaTime)` |  | 234 |

## Appels vers le moteur (C++)

- `Engine.` `castRay`
- `ui_imgui.` `GetIO`, `IsMouseDown`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/cameraV2/zoom.lua`.*

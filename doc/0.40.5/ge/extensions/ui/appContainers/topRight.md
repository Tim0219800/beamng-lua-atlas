# `ui_appContainers_topRight`

*File: `lua/ge/extensions/ui/appContainers/topRight.lua` · VM: Game Engine (GE) · 20 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `ui_appContainers_topRight`: `extensions.load("ui_appContainers_topRight")`, then the global `ui_appContainers_topRight`

Declares the "topRight" app container (top-right corner of the interface) with ui_appContainers, with the UI trigger setTopRightAppVisibility. The app list is empty in 0.40.5: the container exists but manages no app.

## Notes

- Replaces the old identifier secondaryApps (see ui_appContainers.resolveContainerId).

**Dependencies (loaded first):** `ui_appContainers`

## Functions

| Function | Description | Line |
|---|---|---|
| `ui_appContainers_topRight.onExtensionLoaded()` | Called when the extension loads: registers the topRight container (no apps) via ui_appContainers.registerContainer. *(internal)* *(hook)* | 8 |

## Fields

| Field | Type | Description |
|---|---|---|
| `dependencies` | table<integer, string> | { "ui_appContainers" }: loaded before this module. |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/ui/appContainers/topRight.lua`.*

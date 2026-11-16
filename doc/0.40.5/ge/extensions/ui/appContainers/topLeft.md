# `ui_appContainers_topLeft`

*File: `lua/ge/extensions/ui/appContainers/topLeft.lua` · VM: Game Engine (GE) · 26 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `ui_appContainers_topLeft`: `extensions.load("ui_appContainers_topLeft")`, then the global `ui_appContainers_topLeft`

Declares the "topLeft" app container (top-left corner of the interface) with ui_appContainers. The UI trigger is setTopLeftAppVisibility. Declared apps: messages and tasks (visible by default), scoreboard, driftScores, dragInfo and dragDialControl (hidden by default).

## Notes

- Replaces the old identifier utilityApps (see ui_appContainers.resolveContainerId).

**Dependencies (loaded first):** `ui_appContainers`

## Functions

| Function | Description | Line |
|---|---|---|
| `ui_appContainers_topLeft.onExtensionLoaded()` | Called when the extension loads: registers the topLeft container via ui_appContainers.registerContainer. *(internal)* *(hook)* | 8 |

## Fields

| Field | Type | Description |
|---|---|---|
| `dependencies` | table<integer, string> | { "ui_appContainers" }: loaded before this module. |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/ui/appContainers/topLeft.lua`.*

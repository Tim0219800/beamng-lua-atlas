# `telemetry_trackers_editor`

*Fichier : `lua/ge/extensions/telemetry/trackers/editor.lua` · VM : Game Engine (GE) · 59 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `telemetry_trackers_editor` : `extensions.load("telemetry_trackers_editor")`, puis la globale `telemetry_trackers_editor`

**Dépendances (chargées avant) :** `telemetry_core`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `telemetry_trackers_editor.onEditorActivated()` | *(hook)* | 19 |
| `telemetry_trackers_editor.onEditorDeactivated()` | *(hook)* | 25 |
| `telemetry_trackers_editor.onEditorToolWindowOpened(toolName, entryPoint)` | *(hook)* | 31 |
| `telemetry_trackers_editor.onExit()` | close the open activity, otherwise the last one has no duration *(hook)* | 45 |
| `telemetry_trackers_editor.onExtensionLoaded()` | *(hook)* | 39 |
| `telemetry_trackers_editor.onExtensionUnloaded()` | close the open activity, otherwise the last one has no duration *(hook)* | 45 |

## Champs

| Champ | Type | Description |
|---|---|---|
| `dependencies` | table |  |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/telemetry/trackers/editor.lua`.*

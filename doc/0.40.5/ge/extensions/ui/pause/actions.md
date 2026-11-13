# `ui_pause_actions`

*Fichier : `lua/ge/extensions/ui/pause/actions.lua` · VM : Game Engine (GE) · 223 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `ui_pause_actions` : `extensions.load("ui_pause_actions")`, puis la globale `ui_pause_actions`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `ui_pause_actions.clearActions()` |  | 24 |
| `ui_pause_actions.executeAction(buttonId, payload)` |  | 42 |
| `ui_pause_actions.getAllButtonInfos()` |  | 50 |
| `ui_pause_actions.getVisibleModTabs()` | shaped for buildPauseTabs | 194 |
| `ui_pause_actions.onExtensionLoaded()` | *(hook)* | 54 |
| `ui_pause_actions.onSaveFinished()` | *(hook)* | 34 |
| `ui_pause_actions.registerButton(metadata, callback)` |  | 46 |
| `ui_pause_actions.registerModButton(button)` |  | 133 |
| `ui_pause_actions.registerModTab(tab)` |  | 102 |
| `ui_pause_actions.saveCareerThen(callback)` |  | 29 |
| `ui_pause_actions.unregisterModButton(id)` |  | 173 |
| `ui_pause_actions.unregisterModTab(id)` |  | 124 |

**Évènements UI (guihooks.trigger) :** `PauseModActionsChanged`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/ui/pause/actions.lua`.*

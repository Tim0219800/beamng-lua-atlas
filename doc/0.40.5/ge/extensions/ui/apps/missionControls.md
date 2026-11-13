# `ui_apps_missionControls`

*Fichier : `lua/ge/extensions/ui/apps/missionControls.lua` · VM : Game Engine (GE) · 69 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `ui_apps_missionControls` : `extensions.load("ui_apps_missionControls")`, puis la globale `ui_apps_missionControls`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `ui_apps_missionControls.clearControls()` |  | 54 |
| `ui_apps_missionControls.onInit()` | *(hook)* | 6 |
| `ui_apps_missionControls.sendAllData()` |  | 59 |
| `ui_apps_missionControls.setControl(args)` | Adds/updates/removes a single hint, keyed by category (defaults to action/uiEvent). | 22 |
| `ui_apps_missionControls.setControls(list)` | Bulk replace of all hints, for direct Lua/gamemode callers. | 40 |

**Évènements UI (guihooks.trigger) :** `SetMissionControls`, `SetMissionControlsResetAll`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/ui/apps/missionControls.lua`.*

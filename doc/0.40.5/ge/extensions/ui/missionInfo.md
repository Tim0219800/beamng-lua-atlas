# `ui_missionInfo`

*Fichier : `lua/ge/extensions/ui/missionInfo.lua` · VM : Game Engine (GE) · 115 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `ui_missionInfo` : `extensions.load("ui_missionInfo")`, puis la globale `ui_missionInfo`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `ui_missionInfo.closeDialogue()` |  | 82 |
| `ui_missionInfo.onAfterRouteChange(routeEntry)` | *(hook)* | 109 |
| `ui_missionInfo.onInputBindingsChanged()` | *(hook)* | 105 |
| `ui_missionInfo.openActivityAcceptDialogue(content)` |  | 58 |
| `ui_missionInfo.openDialogue(content)` |  | 38 |
| `ui_missionInfo.performAction(actionName)` |  | 26 |
| `ui_missionInfo.performActivityAction(id)` |  | 51 |
| `ui_missionInfo.setActivityIndexVisible(index)` |  | 96 |

## Champs

| Champ | Type | Description |
|---|---|---|
| `buttonsTable` | nil |  |
| `openState` | nil |  |

## Hooks émis

Évènements diffusés aux extensions par `extensions.hook` :

- `onActivityAcceptUpdate`
- `onActivityIndexVisible` — écouté par 1 module(s)
- `onMissionInfoChangedState` — écouté par 1 module(s)

**Évènements UI (guihooks.trigger) :** `ActivityAcceptClose`, `ActivityAcceptUpdate`, `MissionInfoUpdate`

## Appels vers le moteur (C++)

- `scenetree.` `findObject`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/ui/missionInfo.lua`.*

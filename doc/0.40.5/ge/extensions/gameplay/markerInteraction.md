# `gameplay_markerInteraction`

*Fichier : `lua/ge/extensions/gameplay/markerInteraction.lua` · VM : Game Engine (GE) · 718 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `gameplay_markerInteraction` : `extensions.load("gameplay_markerInteraction")`, puis la globale `gameplay_markerInteraction`

**Dépendances (chargées avant) :** `gameplay_missions_missions`, `gameplay_missions_missionManager`, `freeroam_bigMapMode`, `gameplay_playmodeMarkers`, `freeroam_bigMapPoiProvider`, `ui_missionInfo`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `gameplay_markerInteraction.changeUserSettings(id, settings)` |  | 138 |
| `gameplay_markerInteraction.clearCache()` |  | 651 |
| `gameplay_markerInteraction.closeViewDetailPrompt(force)` |  | 211 |
| `gameplay_markerInteraction.formatDataForUi()` |  | 114 |
| `gameplay_markerInteraction.formatMission(m)` |  | 66 |
| `gameplay_markerInteraction.getCurrentInteractableElements()` |  | 61 |
| `gameplay_markerInteraction.getGameContext(fromMissionMenu)` |  | 149 |
| `gameplay_markerInteraction.onAnyMissionChanged(state)` | *(hook)* | 666 |
| `gameplay_markerInteraction.onClientEndMission(levelPath)` | *(hook)* | 685 |
| `gameplay_markerInteraction.onNavigateToMission(poiId)` | *(hook)* | 678 |
| `gameplay_markerInteraction.onPreRender(dtReal, dtSim)` | *(hook)* | 603 |
| `gameplay_markerInteraction.onSelectDetailPromptClicked(idx)` | *(hook)* | 199 |
| `gameplay_markerInteraction.onSettingsChanged()` | *(hook)* | 221 |
| `gameplay_markerInteraction.onUIPlayStateChanged(enteredPlay)` | *(hook)* | 713 |
| `gameplay_markerInteraction.setForceReevaluateOpenPrompt()` |  | 709 |
| `gameplay_markerInteraction.setMarkersVisibleTemporary(visible)` |  | 689 |
| `gameplay_markerInteraction.setPreselectedMissionId(mId)` |  | 144 |
| `gameplay_markerInteraction.showMissionMarkersToggled(active)` |  | 660 |
| `gameplay_markerInteraction.skipNextIconFading()` |  | 656 |
| `gameplay_markerInteraction.startMissionById(id, userSettings, startingOptions)` |  | 128 |
| `gameplay_markerInteraction.stopMissionById(id, force)` |  | 133 |

## Champs

| Champ | Type | Description |
|---|---|---|
| `abandonCurrent` | any |  ⚠ référence `abandonCurrent` non définie dans le fichier (vaut probablement nil) |
| `dependencies` | table |  |
| `getClusterMarker` | any |  ⚠ référence `getClusterMarker` non définie dans le fichier (vaut probablement nil) |
| `restartCurrent` | any |  ⚠ référence `restartCurrent` non définie dans le fichier (vaut probablement nil) |

## Hooks émis

Évènements diffusés aux extensions par `extensions.hook` :

- `onActivityAcceptGatherData` — écouté par 7 module(s)
- `onMissionAvailabilityChanged` — écouté par 1 module(s)
- `onReachedTargetPos` — écouté par 2 module(s)

**Évènements UI (guihooks.trigger) :** `ActivityAcceptUpdate`, `onMissionAvailabilityChanged`

## Appels vers le moteur (C++)

- `be:` `getObjectOOBBCenterXYZ`, `getObjectOOBBHalfAxisXYZ`, `getObjectVelocityXYZ`
- `debugDrawer:` `drawCylinder`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/gameplay/markerInteraction.lua`.*

# `ui_bindingsLegend`

*Fichier : `lua/ge/extensions/ui/bindingsLegend.lua` · VM : Game Engine (GE) · 1107 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `ui_bindingsLegend` : `extensions.load("ui_bindingsLegend")`, puis la globale `ui_bindingsLegend`

**Dépendances (chargées avant) :** `core_input_actions`, `core_input_bindings`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `ui_bindingsLegend.addActions(label, actions, additionalData)` |  | 754 |
| `ui_bindingsLegend.enableShowVehicleSpecificActions(enable)` |  | 925 |
| `ui_bindingsLegend.onActionFilterUpdated()` | *(hook)* | 979 |
| `ui_bindingsLegend.onClientEndMission()` | *(hook)* | 951 |
| `ui_bindingsLegend.onClientStartMission()` | *(hook)* | 948 |
| `ui_bindingsLegend.onDeserialized(data)` | *(hook)* | 1069 |
| `ui_bindingsLegend.onDeviceChanged()` | *(hook)* | 1063 |
| `ui_bindingsLegend.onExtensionLoaded()` | *(hook)* | 1050 |
| `ui_bindingsLegend.onModifierChanged(newModifiers)` | *(hook)* | 791 |
| `ui_bindingsLegend.onSettingsChanged()` | *(hook)* | 996 |
| `ui_bindingsLegend.onUpdate(dtReal, dtSim, dtRaw)` | *(hook)* | 869 |
| `ui_bindingsLegend.onVehicleResetted(vehId)` | *(hook)* | 969 |
| `ui_bindingsLegend.onVehicleSpawned(vehId)` | *(hook)* | 969 |
| `ui_bindingsLegend.onVehicleSwitched(oldId, newId, player)` | *(hook)* | 1027 |
| `ui_bindingsLegend.resetFade()` |  | 107 |
| `ui_bindingsLegend.sendDataToUI(forceResetFade)` |  | 630 |
| `ui_bindingsLegend.setDebug(enabled)` | Debug ImGui window to test fade behavior quickly | 82 |
| `ui_bindingsLegend.setShowBasicDrivingControls(enable)` |  | 901 |
| `ui_bindingsLegend.showToggleVehicleSpecificActionsMessage()` |  | 1007 |
| `ui_bindingsLegend.toggleShowApp()` |  | 1075 |
| `ui_bindingsLegend.toggleShowVehicleSpecificActions()` |  | 944 |
| `ui_bindingsLegend.triggerInputAction(action, value)` |  | 1058 |

## Champs

| Champ | Type | Description |
|---|---|---|
| `dependencies` | table |  |

**Évènements UI (guihooks.trigger) :** `Message`, `setActionsForLegend`, `setBindingsLegendFade`

## Appels vers le moteur (C++)

- `be:` `getPlayerVehicle`, `getPlayerVehicleID`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/ui/bindingsLegend.lua`.*

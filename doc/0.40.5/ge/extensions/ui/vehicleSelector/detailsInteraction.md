# `ui_vehicleSelector_detailsInteraction`

*Fichier : `lua/ge/extensions/ui/vehicleSelector/detailsInteraction.lua` · VM : Game Engine (GE) · 84 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `ui_vehicleSelector_detailsInteraction` : `extensions.load("ui_vehicleSelector_detailsInteraction")`, puis la globale `ui_vehicleSelector_detailsInteraction`

**Dépendances (chargées avant) :** `ui_vehicleSelector_vehicleOperations`, `ui_vehicleSelector_vehicleSpecifications`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `ui_vehicleSelector_detailsInteraction.executeButton(...)` | Expose sub-module functions through main interface | 79 |
| `ui_vehicleSelector_detailsInteraction.executeDoubleClick(...)` |  | 80 |
| `ui_vehicleSelector_detailsInteraction.exploreFolder(path)` |  | 65 |
| `ui_vehicleSelector_detailsInteraction.getDetails(itemDetails)` | Coordinate between modules | 13 |
| `ui_vehicleSelector_detailsInteraction.getManagementDetails()` |  | 55 |
| `ui_vehicleSelector_detailsInteraction.goToMod(modId)` |  | 70 |
| `ui_vehicleSelector_detailsInteraction.setCustomDetailsButtons(buttons)` |  | 83 |
| `ui_vehicleSelector_detailsInteraction.setDetailsButtonForFreeroam(...)` |  | 82 |
| `ui_vehicleSelector_detailsInteraction.setExitCallback(callback)` |  | 59 |
| `ui_vehicleSelector_detailsInteraction.setManagementButtonsEnabled(...)` |  | 81 |

## Champs

| Champ | Type | Description |
|---|---|---|
| `customDetailsButtons` | table |  |
| `dependencies` | table |  |
| `exitCallback` | any |  |
| `managementButtonsEnabled` | boolean | Configuration |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/ui/vehicleSelector/detailsInteraction.lua`.*

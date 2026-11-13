# `ui_vehicleSelector_vehicleSpecifications`

*Fichier : `lua/ge/extensions/ui/vehicleSelector/vehicleSpecifications.lua` · VM : Game Engine (GE) · 553 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `ui_vehicleSelector_vehicleSpecifications` : `extensions.load("ui_vehicleSelector_vehicleSpecifications")`, puis la globale `ui_vehicleSelector_vehicleSpecifications`

**Dépendances (chargées avant) :** `core_locales`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `ui_vehicleSelector_vehicleSpecifications.addIconTags(modelDetails, configDetails)` |  | 307 |
| `ui_vehicleSelector_vehicleSpecifications.getDetails(itemDetails)` |  | 359 |
| `ui_vehicleSelector_vehicleSpecifications.makeSpec(modelDetails, configDetails, key, list)` |  | 285 |
| `ui_vehicleSelector_vehicleSpecifications.propTitle(key)` | Public API | 4 |
| `ui_vehicleSelector_vehicleSpecifications.propValue(propName, key)` |  | 5 |

## Champs

| Champ | Type | Description |
|---|---|---|
| `CONVERSIONS` | table |  |
| `dependencies` | table |  |
| `specificationSetup` | table |  |
| `valueToUnit` | table |  |

## Hooks émis

Évènements diffusés aux extensions par `extensions.hook` :

- `onVehicleSelectorViewDetails`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/ui/vehicleSelector/vehicleSpecifications.lua`.*

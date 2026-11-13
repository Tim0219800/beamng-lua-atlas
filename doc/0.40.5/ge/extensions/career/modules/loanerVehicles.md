# `career_modules_loanerVehicles`

*Fichier : `lua/ge/extensions/career/modules/loanerVehicles.lua` · VM : Game Engine (GE) · 440 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `career_modules_loanerVehicles` : `extensions.load("career_modules_loanerVehicles")`, puis la globale `career_modules_loanerVehicles`

**Dépendances (chargées avant) :** `util_stepHandler`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `career_modules_loanerVehicles.formatLoanerOfferForUi(facility)` |  | 288 |
| `career_modules_loanerVehicles.formatSpawnedLoanersForUi()` |  | 254 |
| `career_modules_loanerVehicles.getLoanedVehiclesByOrg(organizationId)` |  | 139 |
| `career_modules_loanerVehicles.getLoaningOrgsOfVehicle(vehId)` |  | 210 |
| `career_modules_loanerVehicles.markForSpawning(offer)` |  | 18 |
| `career_modules_loanerVehicles.onUpdate(dtReal, dtSim, dtRaw)` | *(hook)* | 151 |
| `career_modules_loanerVehicles.onVehicleAdded(id)` | *(hook)* | 33 |
| `career_modules_loanerVehicles.returnVehicle(inventoryId, callback)` |  | 114 |
| `career_modules_loanerVehicles.spawnAllOffers()` |  | 37 |
| `career_modules_loanerVehicles.unmarkAllForSpawning()` |  | 27 |

## Champs

| Champ | Type | Description |
|---|---|---|
| `dependencies` | table |  |
| `spawnAndLoanVehicle` | any |  ⚠ référence `spawnAndLoanVehicle` non définie dans le fichier (vaut probablement nil) |

**Évènements UI (guihooks.trigger) :** `toastrMsg`

## Appels vers le moteur (C++)

- `be:` `getObjectPositionXYZ`, `getPlayerVehicleID`
- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/career/modules/loanerVehicles.lua`.*

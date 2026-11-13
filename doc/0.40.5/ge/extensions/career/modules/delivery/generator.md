# `career_modules_delivery_generator`

*Fichier : `lua/ge/extensions/career/modules/delivery/generator.lua` · VM : Game Engine (GE) · 1534 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `career_modules_delivery_generator` : `extensions.load("career_modules_delivery_generator")`, puis la globale `career_modules_delivery_generator`

**Dépendances (chargées avant) :** `freeroam_facilities`, `gameplay_sites_sitesManager`, `util_configListGenerator`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `career_modules_delivery_generator.addMaterialAsParcelToContainer(con, storage, amount, sourceFacId, sourcePsPath)` |  | 816 |
| `career_modules_delivery_generator.changeMaterialAmountInFacility(facId, materialType, change)` |  | 957 |
| `career_modules_delivery_generator.distanceBetween(posA, posB)` |  | 75 |
| `career_modules_delivery_generator.finalizeMaterialDistanceRewards(item, destination)` |  | 983 |
| `career_modules_delivery_generator.finalizeMaterialDistances(fac)` |  | 713 |
| `career_modules_delivery_generator.finalizeParcelItemDistanceAndRewards(item)` |  | 142 |
| `career_modules_delivery_generator.finalizeVehicleOffer(offer)` |  | 470 |
| `career_modules_delivery_generator.getDistanceBetweenFacilities(loc1, loc2)` | M.getLogisticTypesLookup = function() return logisticTypesLookup end | 105 |
| `career_modules_delivery_generator.getFacilities()` |  | 1517 |
| `career_modules_delivery_generator.getFacilitiesForOrganizationId(orgId)` |  | 1520 |
| `career_modules_delivery_generator.getFacilityById(id)` |  | 1518 |
| `career_modules_delivery_generator.getLocationCoordinates(loc)` |  | 90 |
| `career_modules_delivery_generator.getMaterialsTemplatesById(id)` |  | 687 |
| `career_modules_delivery_generator.getParcelTemplateById(templateId)` |  | 224 |
| `career_modules_delivery_generator.getParkingSpotByPath(path)` |  | 1519 |
| `career_modules_delivery_generator.isMixable(type)` |  | 1084 |
| `career_modules_delivery_generator.moveMaterialToDestination(cargo, destination)` |  | 920 |
| `career_modules_delivery_generator.onCareerActivated()` | *(hook)* | 10 |
| `career_modules_delivery_generator.onUpdate(dtReal, dtSim, dtRaw)` | *(hook)* | 1033 |
| `career_modules_delivery_generator.selectAccessPointByLookupKeyByType(accessPointsByName, logisticType, typeLookupKey)` |  | 56 |
| `career_modules_delivery_generator.setup(loadData)` |  | 1458 |
| `career_modules_delivery_generator.splitOffPartsFromMaterialCargo(cargo, otherPartSizes)` |  | 894 |
| `career_modules_delivery_generator.triggerAllGenerators()` |  | 1020 |
| `career_modules_delivery_generator.triggerGenerator(fac, generator, timeOffset)` |  | 1004 |

## Champs

| Champ | Type | Description |
|---|---|---|
| `dependencies` | table |  |

## Appels vers le moteur (C++)

- `FS:` `findFiles`
- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/career/modules/delivery/generator.lua`.*

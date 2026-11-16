# `career_modules_valueCalculator`

*Fichier : `lua/ge/extensions/career/modules/valueCalculator.lua` · VM : Game Engine (GE) · 245 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `career_modules_valueCalculator` : `extensions.load("career_modules_valueCalculator")`, puis la globale `career_modules_valueCalculator`

Calcul de la valeur et de l'état de réparation des véhicules et pièces de la carrière : dépréciation par année d'âge (table depreciationByYear), perte liée au kilométrage (odomètre), valeur de ferraille (5 % de la valeur), valeur d'un véhicule d'inventaire en tenant compte des pièces ajoutées/retirées et des dégâts, coût et durée de réparation (pièces à intégrité 0).

## Remarques

- Constantes : perte de 0,0000025 par km relatif, ferraille 5 %, 20 s de réparation par pièce, seuil de 3 pièces cassées pour considérer le véhicule à réparer, valeur minimale min(500, 5 % de la valeur neuve).
- L'année de référence est codée en dur à 2023 (âge = 2023 - année) dans getPartValue et getVehicleValue.
- Prix de réparation : 60 % de part.value (700 par défaut) pour chaque pièce dont integrityValue vaut 0.
- Dans la valeur d'un véhicule, les pièces ajoutées comptent pour 50 % de leur valeur et les pièces retirées sont soustraites à 50 %.
- partConditionsNeedRepair ne tient pas compte des exceptions (pare-chocs, portes, rétroviseurs, face avant) : l'ancienne logique est en commentaire.

**Dépendances (chargées avant) :** `career_career`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `career_modules_valueCalculator.getAdjustedVehicleBaseValue(value, vehicleCondition)` | Valeur ajustée d'un objet selon son âge et son kilométrage : dépréciation annuelle, perte par kilométrage, plus la valeur de ferraille. | 47 |
| `career_modules_valueCalculator.getBrokenPartsThreshold()` | Retourne le seuil de pièces cassées (3). | 229 |
| `career_modules_valueCalculator.getInventoryVehicleValue(inventoryId, ignoreDamage)` | Valeur actuelle d'un véhicule d'inventaire (base ajustée + pièces - réparations, plancher à la valeur minimale). | 194 |
| `career_modules_valueCalculator.getNumberOfBrokenParts(partConditions)` | Compte les pièces dont integrityValue vaut 0. | 200 |
| `career_modules_valueCalculator.getPartDifference(originalParts, newParts, changedSlots)` | Compare les pièces d'origine d'un véhicule aux pièces actuelles et retourne les pièces ajoutées et retirées par emplacement. | 55 |
| `career_modules_valueCalculator.getPartValue(part)` | Valeur d'une pièce : valeur ajustée par âge et kilométrage, -5 % si apprêtée (primered), réduite selon le nombre de réparations. | 91 |
| `career_modules_valueCalculator.getRepairDetails(invVehInfo)` | API dégâts : calcule prix, durée et nombre de pièces à remplacer pour un véhicule d'inventaire. | 133 |
| `career_modules_valueCalculator.getVehicleMileageById(inventoryId)` | Retourne le kilométrage (odomètre de la pièce principale) d'un véhicule d'inventaire. 0 si introuvable. | 33 |
| `career_modules_valueCalculator.partConditionsNeedRepair(partConditions)` | Indique si le nombre de pièces cassées atteint le seuil (3). | 219 |

### Détail des paramètres

#### `career_modules_valueCalculator.getAdjustedVehicleBaseValue(value, vehicleCondition)`

Valeur ajustée d'un objet selon son âge et son kilométrage : dépréciation annuelle, perte par kilométrage, plus la valeur de ferraille.

- `value` (*number*) : Valeur de base.
- `vehicleCondition` (*table*) : {age = années, mileage = odomètre}.
- **renvoie** : number Valeur ajustée.

#### `career_modules_valueCalculator.getBrokenPartsThreshold()`

Retourne le seuil de pièces cassées (3).

- **renvoie** : integer Seuil.

#### `career_modules_valueCalculator.getInventoryVehicleValue(inventoryId, ignoreDamage)`

Valeur actuelle d'un véhicule d'inventaire (base ajustée + pièces - réparations, plancher à la valeur minimale).

- `inventoryId` (*integer*) : Id d'inventaire.
- `ignoreDamage` (*boolean|nil*) : Si vrai, ne déduit pas le coût de réparation.
- **renvoie** : number|nil Valeur, ou nil si le véhicule n'existe pas.

#### `career_modules_valueCalculator.getNumberOfBrokenParts(partConditions)`

Compte les pièces dont integrityValue vaut 0.

- `partConditions` (*table|nil*) : Conditions par chemin de pièce.
- **renvoie** : integer Nombre de pièces cassées (0 si l'argument n'est pas une table).

#### `career_modules_valueCalculator.getPartDifference(originalParts, newParts, changedSlots)`

Compare les pièces d'origine d'un véhicule aux pièces actuelles et retourne les pièces ajoutées et retirées par emplacement.

- `originalParts` (*table<string, table>*) : Pièces d'origine par slot (avec .name).
- `newParts` (*table<string, string>*) : Noms des pièces actuelles par slot.
- `changedSlots` (*table<string, boolean>*) : Slots modifiés (pour détecter une pièce identique remplacée).
- **renvoie** : table<string, string> addedParts (slot -> nom).
- **renvoie** : table removedParts.

#### `career_modules_valueCalculator.getPartValue(part)`

Valeur d'une pièce : valeur ajustée par âge et kilométrage, -5 % si apprêtée (primered), réduite selon le nombre de réparations.

- `part` (*table*) : Pièce avec value, year, partCondition.odometer, primered, repairCount.
- **renvoie** : number Valeur de la pièce.

#### `career_modules_valueCalculator.getRepairDetails(invVehInfo)`

API dégâts : calcule prix, durée et nombre de pièces à remplacer pour un véhicule d'inventaire.

- `invVehInfo` (*table*) : Véhicule d'inventaire (id, partConditions, config.partsTree).
- **renvoie** : table {price, repairTime, partsCountToBeReplaced}.

#### `career_modules_valueCalculator.getVehicleMileageById(inventoryId)`

Retourne le kilométrage (odomètre de la pièce principale) d'un véhicule d'inventaire. 0 si introuvable.

- `inventoryId` (*integer*) : Id d'inventaire.
- **renvoie** : number Odomètre (unité du jeu pour partCondition.odometer, déduit du code).

#### `career_modules_valueCalculator.partConditionsNeedRepair(partConditions)`

Indique si le nombre de pièces cassées atteint le seuil (3).

- `partConditions` (*table|nil*) : Conditions par chemin de pièce.
- **renvoie** : boolean true si le véhicule doit être réparé.

## Champs

| Champ | Type | Description |
|---|---|---|
| `dependencies` | string[] | {'career_career'}. |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/career/modules/valueCalculator.lua`.*

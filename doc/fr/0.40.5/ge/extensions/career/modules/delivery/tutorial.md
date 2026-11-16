# `career_modules_delivery_tutorial`

*Fichier : `lua/ge/extensions/career/modules/delivery/tutorial.lua` · VM : Game Engine (GE) · 225 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `career_modules_delivery_tutorial` : `extensions.load("career_modules_delivery_tutorial")`, puis la globale `career_modules_delivery_tutorial`

Détermine si les tutoriels de livraison (colis, véhicules, matériaux) sont encore actifs et fournit les listes de tâches du tutoriel pour la page de progression de carrière. Un tutoriel est actif tant que l'XP de la branche correspondante (logistics-delivery, logistics-vehicleDelivery, logistics-materials) vaut 0 ; le résultat est mis en cache et invalidé quand cette XP change, ce qui débloque aussi un succès.

## Remarques

- Le cache (tutorialStatusCache) est vidé dans onPlayerAttributesChanged ; les succès DELIVERY_TUTORIAL_COMPLETED, VEHICLE_DELIVERY_COMPLETED et MATERIALS_DELIVERY_COMPLETED sont débloqués à chaque changement de l'attribut correspondant, pas seulement la première fois.
- currentVehicleHasDryBulkContainer et currentVehicleHasTutorialMaterials renvoient toujours false : l'étape « charger des matériaux » du tutoriel matériaux n'est donc jamais cochée avant la fin du tutoriel.
- tutorialVehicleTakenOutOfFacility teste n'importe quelle tâche de véhicule avec isTutorialVehicle, pas seulement celle du véhicule actuel.
- currentOrNearbyVehicleHasContainer considère un conteneur attaché à moins de 20 m du joueur (ou du véhicule actuel).
- getTutorialInfo ne renseigne que 'parcel' et 'vehicle' ; le tutoriel 'materials-introduction' existe dans onCareerProgressPageGetTasklistData mais n'est pas inclus.
- Les titres 'Delivery Introduction', 'Vehicle Delivery Introduction' et 'Materials Introduction' sont en anglais, non traduits.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `career_modules_delivery_tutorial.getTutorialInfo()` | Renvoie l'état des tutoriels colis et véhicule : unlocked, isActive et la liste de tâches, pour l'UI. | 114 |
| `career_modules_delivery_tutorial.isCargoDeliveryTutorialActive()` | Vrai tant que l'XP de logistics-delivery est 0 (résultat mis en cache). | 25 |
| `career_modules_delivery_tutorial.isMaterialsDeliveryTutorialActive()` | Vrai tant que l'XP de logistics-materials est 0 (mis en cache). | 39 |
| `career_modules_delivery_tutorial.isVehicleDeliveryTutorialActive()` | Vrai tant que l'XP de logistics-vehicleDelivery est 0 (mis en cache). | 32 |
| `career_modules_delivery_tutorial.onCareerActivated()` | Hook appelé à l'activation de la carrière : mémorise les extensions de livraison utilisées. *(interne)* *(hook)* | 8 |
| `career_modules_delivery_tutorial.onCareerProgressPageGetTasklistData(tasklistData, tasklistId)` | Hook de la page de progression : remplit tasklistData.headerLabel et tasklistData.tasks ({label, description, done}) pour 'delivery-introduction' (installer un conteneur, charger un colis du tutoriel, livrer), 'vehicle-delivery-introduction' (récupérer le véhicule, livrer) ou 'materials-introduction'. Si le tutoriel est terminé, une seule tâche « terminé » est renvoyée. *(hook)* | 132 |
| `career_modules_delivery_tutorial.onPlayerAttributesChanged(change, reason)` | Hook appelé quand des attributs du joueur changent : invalide le cache du tutoriel concerné et débloque le succès associé. *(interne)* *(hook)* | 46 |

### Détail des paramètres

#### `career_modules_delivery_tutorial.getTutorialInfo()`

Renvoie l'état des tutoriels colis et véhicule : unlocked, isActive et la liste de tâches, pour l'UI.

- **renvoie** : table {parcel = {unlocked, isActive, tasks, headerLabel}, vehicle = {…}}.

#### `career_modules_delivery_tutorial.isCargoDeliveryTutorialActive()`

Vrai tant que l'XP de logistics-delivery est 0 (résultat mis en cache).

- **renvoie** : boolean Tutoriel de colis actif.

#### `career_modules_delivery_tutorial.isMaterialsDeliveryTutorialActive()`

Vrai tant que l'XP de logistics-materials est 0 (mis en cache).

- **renvoie** : boolean Tutoriel de matériaux actif.

#### `career_modules_delivery_tutorial.isVehicleDeliveryTutorialActive()`

Vrai tant que l'XP de logistics-vehicleDelivery est 0 (mis en cache).

- **renvoie** : boolean Tutoriel de livraison de véhicules actif.

#### `career_modules_delivery_tutorial.onCareerProgressPageGetTasklistData(tasklistData, tasklistId)`

Hook de la page de progression : remplit tasklistData.headerLabel et tasklistData.tasks ({label, description, done}) pour 'delivery-introduction' (installer un conteneur, charger un colis du tutoriel, livrer), 'vehicle-delivery-introduction' (récupérer le véhicule, livrer) ou 'materials-introduction'. Si le tutoriel est terminé, une seule tâche « terminé » est renvoyée.

- `tasklistData` (*table*) : Table à remplir.
- `tasklistId` (*string*) : 'delivery-introduction', 'vehicle-delivery-introduction' ou 'materials-introduction'.

#### `career_modules_delivery_tutorial.onPlayerAttributesChanged(change, reason)`

Hook appelé quand des attributs du joueur changent : invalide le cache du tutoriel concerné et débloque le succès associé.

- `change` (*table<string, number>*) : Attributs modifiés (clés logistics-delivery, logistics-vehicleDelivery, logistics-materials).
- `reason` (*any*) : Raison du changement (non utilisée).

## Appels vers le moteur (C++)

- `be:` `getPlayerVehicleID`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/career/modules/delivery/tutorial.lua`.*

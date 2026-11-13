# `career_modules_partInventory`

*Fichier : `lua/ge/extensions/career/modules/partInventory.lua` · VM : Game Engine (GE) · 595 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `career_modules_partInventory` : `extensions.load("career_modules_partInventory")`, puis la globale `career_modules_partInventory`

Inventaire des pièces de la carrière. Chaque pièce (installée sur un véhicule de l'inventaire ou en stockage, location = 0) est une entrée de la table partInventory indexée par un partId entier. Le module génère les pièces d'un véhicule depuis son arbre de pièces (partsTree), les réconcilie avec le véhicule réel après modification, vend les pièces stockées, alimente l'écran « Mes pièces » de l'ordinateur de garage et sauvegarde le tout dans career/partInventory.json (sérialisé).

## Exemple

```lua
local inv = career_modules_partInventory.getInventory()
local id = career_modules_partInventory.getPartPathToPartIdMap()[inventoryId]["/main/".."partName"]
local part = inv[id]
```

## Remarques

- Champs d'une pièce : name, value (100 par défaut), description (infos JBeam, non sauvegardé), partCondition, tags, vehicleModel, location (0 = stockage, sinon inventoryId du véhicule), containingSlot (chemin du slot), partPath (= containingSlot .. name), mainPart (slot "/"), et selon le cas year, repairCount, primered.
- slotToPartIdMap : location -> containingSlot -> partId. partPathToPartIdMap : inventoryId -> partPath -> partId (seulement pour location > 0). Ces tables sont reconstruites par updateVehicleMaps (de façon asynchrone dans onUpdate après un changement de véhicule).
- À l'ajout d'un véhicule (onVehicleAdded), ses pièces sont ajoutées dans onUpdate dès que le véhicule est présent et que partConditions existe ; le hook onAddedVehiclePartsToInventory(inventoryId, newParts) est alors émis.
- Une pièce auxiliaire (description.isAuxiliary) de valeur 0 est masquée de l'UI et supprimée du stockage.
- Si la version de sauvegarde est inférieure à celle du système de sauvegarde, toutes les pièces en stockage sont vendues au chargement. Si la sauvegarde est plus ancienne que la version 42, l'inventaire est vide.
- sellParts abandonne en silence (sans rien vendre) si l'un des ids est inconnu ou n'est pas en stockage ; la vente rapporte la somme de career_modules_valueCalculator.getPartValue, avec tags partsSold et selling.
- debugMenu (fenêtre ImGui) est défini mais son appel est commenté.

**Dépendances (chargées avant) :** `career_career`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `career_modules_partInventory.addPartToInventory(part)` | Ajoute une pièce sous le plus petit partId libre (à partir de 1). | 121 |
| `career_modules_partInventory.closeMenu()` | Ferme l'écran : si l'autosauvegarde est active et des véhicules sont modifiés, les sauvegarde d'abord (la fermeture se fait dans onSaveFinished), sinon retourne directement à l'ordinateur ou ferme les menus. | 508 |
| `career_modules_partInventory.getInventory()` | Renvoie la table de toutes les pièces (partId -> pièce), par référence. | 548 |
| `career_modules_partInventory.getPart(inventoryId, path)` | Cherche la pièce installée dans un slot d'un véhicule. | 467 |
| `career_modules_partInventory.getPartPathToPartIdMap()` | Renvoie la table inventoryId -> partPath -> partId (véhicules seulement). | 544 |
| `career_modules_partInventory.getSlotToPartIdMap()` | Renvoie la table location -> containingSlot -> partId. | 540 |
| `career_modules_partInventory.isHiddenInUI(part)` | Indique si la pièce doit être cachée dans l'UI : auxiliaire (description.isAuxiliary) et de valeur nulle. | 129 |
| `career_modules_partInventory.onComputerAddFunctions(menuData, computerFunctions)` | Hook de l'ordinateur : ajoute la fonction « Mes pièces » (ordre 5), désactivée tant que le véhicule de départ n'est pas acheté. *(interne)* *(hook)* | 552 |
| `career_modules_partInventory.onEnterVehicleFinished(currentVehicle)` | Hook : planifie la mise à jour des tables d'index lors de l'entrée dans un véhicule. *(interne)* *(hook)* | 438 |
| `career_modules_partInventory.onExtensionLoaded()` | Hook : charge partInventory.json (désérialisé), vend les pièces en stockage si la sauvegarde est d'une version plus ancienne, recharge les descriptions JBeam, supprime les pièces cachées en stockage et reconstruit les tables d'index. *(interne)* *(hook)* | 399 |
| `career_modules_partInventory.onPartShoppingTransactionComplete()` | Hook : après un achat de pièces, supprime les pièces cachées en stockage et reconstruit les index. *(interne)* *(hook)* | 445 |
| `career_modules_partInventory.onRouteMount(context, toRoute, fromRoute, data)` | Cycle de vie du routeur UI : renvoie les données de l'inventaire une fois la vue montée si le menu est ouvert. *(interne)* *(hook)* | 493 |
| `career_modules_partInventory.onSaveFinished()` | Hook de fin de sauvegarde : ferme le menu si closeMenu l'attendait. *(interne)* *(hook)* | 529 |
| `career_modules_partInventory.onUpdate()` | Hook de frame : ajoute les pièces d'un véhicule nouvellement ajouté et met à jour les tables d'index après un changement de véhicule, dès que partConditions est disponible. *(interne)* *(hook)* | 282 |
| `career_modules_partInventory.onVehicleAdded(inventoryId)` | Hook : mémorise le véhicule dont il faudra ajouter les pièces dans onUpdate. *(interne)* *(hook)* | 450 |
| `career_modules_partInventory.onVehicleRemoved(inventoryId)` | Hook : supprime toutes les pièces localisées sur le véhicule retiré. *(interne)* *(hook)* | 454 |
| `career_modules_partInventory.onVehicleSaveFinished(currentSavePath)` | Hook de sauvegarde : écrit partInventory.json dans <save>/career/ (sans le champ description, via serialize). *(interne)* *(hook)* | 355 |
| `career_modules_partInventory.openMenu(_originComputerId)` | Ouvre l'écran des pièces : choisit le véhicule courant ou celui du garage le plus proche, met à jour ses conditions de pièces puis navigue vers career.computer.partInventory. | 476 |
| `career_modules_partInventory.partInventoryClosed()` | Notifie que l'UI de l'inventaire est fermée (partInventoryOpen = false). | 536 |
| `career_modules_partInventory.requestExit()` | Point d'entrée du bouton retour du routeur UI : appelle closeMenu pour conserver le comportement d'autosauvegarde. | 525 |
| `career_modules_partInventory.sellParts(partIds)` | Vend des pièces en stockage : crédite la somme de leurs valeurs, joue le son d'achat, les supprime et rafraîchit l'UI si le menu est ouvert. | 24 |
| `career_modules_partInventory.sendUIData()` | Envoie à l'UI (guihooks partInventoryData) la liste des pièces visibles (hors pièces principales), leur valeur finale, leur accessibilité (non installées sur un véhicule) et les données des véhicules. | 316 |
| `career_modules_partInventory.updatePartConditionsInInventory()` | Recopie dans chaque pièce la condition (partCondition) connue du véhicule qui la contient. | 110 |
| `career_modules_partInventory.updatePartsToMatchSpawnedVehicle(inventoryId)` | Relit les pièces du véhicule actuellement présent et les réconcilie avec l'inventaire : met à jour vehicle.config, conserve condition, tags, année, repairCount et primered des pièces existantes (même slot), ajoute les nouvelles (condition par défaut intégrité 1, odomètre 0, visuel 1) et supprime celles disparues. Marque le véhicule comme modifié. | 152 |

### Détail des paramètres

#### `career_modules_partInventory.addPartToInventory(part)`

Ajoute une pièce sous le plus petit partId libre (à partir de 1).

- `part` (*table*) : Pièce à ajouter.

#### `career_modules_partInventory.getInventory()`

Renvoie la table de toutes les pièces (partId -> pièce), par référence.

- **renvoie** : table<integer, table> Inventaire des pièces.

#### `career_modules_partInventory.getPart(inventoryId, path)`

Cherche la pièce installée dans un slot d'un véhicule.

- `inventoryId` (*integer*) : Id d'inventaire du véhicule (location).
- `path` (*string*) : Chemin du slot (containingSlot).
- **renvoie** : table|nil La pièce.

#### `career_modules_partInventory.getPartPathToPartIdMap()`

Renvoie la table inventoryId -> partPath -> partId (véhicules seulement).

- **renvoie** : table Table des chemins de pièces.

#### `career_modules_partInventory.getSlotToPartIdMap()`

Renvoie la table location -> containingSlot -> partId.

- **renvoie** : table Table des slots.

#### `career_modules_partInventory.isHiddenInUI(part)`

Indique si la pièce doit être cachée dans l'UI : auxiliaire (description.isAuxiliary) et de valeur nulle.

- `part` (*table*) : Pièce.
- **renvoie** : boolean|nil true si masquée.

#### `career_modules_partInventory.onComputerAddFunctions(menuData, computerFunctions)`

Hook de l'ordinateur : ajoute la fonction « Mes pièces » (ordre 5), désactivée tant que le véhicule de départ n'est pas acheté.

- `menuData` (*table*) : Données du menu.
- `computerFunctions` (*table*) : Fonctions à compléter (general).

#### `career_modules_partInventory.onEnterVehicleFinished(currentVehicle)`

Hook : planifie la mise à jour des tables d'index lors de l'entrée dans un véhicule.

- `currentVehicle` (*integer|nil*) : Id d'inventaire du véhicule courant.

#### `career_modules_partInventory.onRouteMount(context, toRoute, fromRoute, data)`

Cycle de vie du routeur UI : renvoie les données de l'inventaire une fois la vue montée si le menu est ouvert.

- `context` (*any*) : Contexte du routeur.
- `toRoute` (*any*) : Route cible.
- `fromRoute` (*any*) : Route précédente.
- `data` (*table*) : routeData.

#### `career_modules_partInventory.onVehicleAdded(inventoryId)`

Hook : mémorise le véhicule dont il faudra ajouter les pièces dans onUpdate.

- `inventoryId` (*integer*) : Id d'inventaire.

#### `career_modules_partInventory.onVehicleRemoved(inventoryId)`

Hook : supprime toutes les pièces localisées sur le véhicule retiré.

- `inventoryId` (*integer*) : Id d'inventaire.

#### `career_modules_partInventory.onVehicleSaveFinished(currentSavePath)`

Hook de sauvegarde : écrit partInventory.json dans <save>/career/ (sans le champ description, via serialize).

- `currentSavePath` (*string*) : Dossier de sauvegarde.

#### `career_modules_partInventory.openMenu(_originComputerId)`

Ouvre l'écran des pièces : choisit le véhicule courant ou celui du garage le plus proche, met à jour ses conditions de pièces puis navigue vers career.computer.partInventory.

- `_originComputerId` (*string|nil*) : Id de l'ordinateur d'origine.

#### `career_modules_partInventory.sellParts(partIds)`

Vend des pièces en stockage : crédite la somme de leurs valeurs, joue le son d'achat, les supprime et rafraîchit l'UI si le menu est ouvert.

- `partIds` (*integer[]*) : Ids des pièces à vendre (location 0 obligatoire).

#### `career_modules_partInventory.updatePartsToMatchSpawnedVehicle(inventoryId)`

Relit les pièces du véhicule actuellement présent et les réconcilie avec l'inventaire : met à jour vehicle.config, conserve condition, tags, année, repairCount et primered des pièces existantes (même slot), ajoute les nouvelles (condition par défaut intégrité 1, odomètre 0, visuel 1) et supprime celles disparues. Marque le véhicule comme modifié.

- `inventoryId` (*integer*) : Id d'inventaire du véhicule.
- **renvoie** : {added: table[], removed: table[], changed: {old: table, new: table}[]} Différences détectées.

## Champs

| Champ | Type | Description |
|---|---|---|
| `dependencies` | table<integer, string> | Extensions chargées avant : career_career. |

## Hooks émis

Évènements diffusés aux extensions par `extensions.hook` :

- `onAddedVehiclePartsToInventory` — écouté par 1 module(s)

**Évènements UI (guihooks.trigger) :** `partInventoryData`

## Appels vers le moteur (C++)

- `FS:` `directoryExists`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/career/modules/partInventory.lua`.*

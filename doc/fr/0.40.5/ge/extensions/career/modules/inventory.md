# `career_modules_inventory`

*Fichier : `lua/ge/extensions/career/modules/inventory.lua` · VM : Game Engine (GE) · 1448 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `career_modules_inventory` : `extensions.load("career_modules_inventory")`, puis la globale `career_modules_inventory`

Inventaire de véhicules de la carrière : la table vehicles (inventoryId -> infos : model, config, niceName, owned, partConditions, timeToAccess, loanType, owningOrganization...), la correspondance inventoryId <-> id d'objet véhicule dans le monde, le véhicule courant, le dernier et le favori. Il gère l'ajout et la suppression de véhicules, leur apparition/entrée (spawnVehicle, enterVehicle), la sauvegarde (un fichier JSON et une miniature par véhicule dans career/vehicles/ plus career/inventory.json), le menu « Mes véhicules » de l'ordinateur, la vente, les plaques, les permissions et les POI de la grande carte.

## Exemple

```lua
local invId = career_modules_inventory.getCurrentVehicle()
local info = career_modules_inventory.getVehicle(invId)
print(info.niceName, info.owned)
```

## Remarques

- L'inventaire compte 20 emplacements (slotAmount) ; seuls les véhicules owned sans takesNoInventorySpace occupent un emplacement.
- inventoryId = plus petit entier libre à partir de 1. Un véhicule ajouté reçoit les champs configBaseValue, finalBuyingPrice, defaultThumbnail et plaque (config.licenseName).
- Le premier véhicule ajouté devient le favori. Posséder 3 véhicules débloque le succès GARAGE_STARTER.
- À l'ajout, les conditions de pièces sont initialisées côté véhicule puis lues ; le hook onVehicleAdded(inventoryId) est émis quand elles sont à jour (attention : onVehicleAdded n'est donc pas immédiat).
- Hooks émis : onInventoryPreRemoveVehicleObject(inventoryId, vehId), onVehicleRemoved(inventoryId), onEnterVehicleFinished(inventoryId), onBeforeVehicleSell({inventoryId, price}), onVehicleSaveFinished(savePath).
- Le chargement (onExtensionLoaded) ignore les sauvegardes de version < 42 ; si la version est < 64, tous les véhicules sont vendus (ou loaners rendus, ou supprimés) à l'activation de la carrière.
- timeToAccess (s) retarde l'accès à un véhicule (achat, réparation) ; il décroît en temps réel dans onUpdate, y compris pendant que le jeu est fermé (réduit de la durée écoulée depuis la sauvegarde).
- Un véhicule non possédé (owned = false) est interdit à la vente, réparation, peinture, tuning, achat de pièces, plaque, stockage, favori, remorquage au garage ; returnLoanedVehicle est autorisé seulement pour ces véhicules (caché pour les possédés).
- getInventoryIdsInClosestGarage(true) renvoie next(...) de l'ensemble des véhicules du garage, donc un véhicule quelconque et non nécessairement le plus proche (le tri par distance n'est appliqué qu'à la liste complète).
- setLicensePlateText teste `if inventoryId` au lieu de `if vehId` : si le véhicule n'est pas dans le monde (vehId nil), core_vehicles.setPlateText est appelé avec nil.
- saveAnyVehiclePosDEBUG vaut true : les positions de tous les véhicules sont toujours restaurées telles que sauvegardées.

**Dépendances (chargées avant) :** `career_career`, `career_modules_log`, `gameplay_tutorial_setup`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `career_modules_inventory.addVehicle(vehId, inventoryId, options)` | Ajoute un véhicule du monde à l'inventaire : enregistre modèle, config, nom, plaque, valeur de base (configBaseValue), initialise les conditions de pièces, attribue un inventoryId libre si absent, définit le favori s'il est le premier et débloque GARAGE_STARTER à 3 véhicules possédés. | 299 |
| `career_modules_inventory.applyPartConditions(inventoryId, vehId)` | Réapplique au véhicule en jeu les conditions de pièces sauvegardées (initPartConditions). | 428 |
| `career_modules_inventory.chooseVehicleFromMenu(inventoryId, buttonIndex, repairPrevVeh)` | Exécute le callback du bouton de choix d'indice buttonIndex pour le véhicule donné. | 1111 |
| `career_modules_inventory.closeMenu()` | Ferme tous les menus de la carrière. | 1032 |
| `career_modules_inventory.debugRespawnCurrentVehicle()` | Debug : met à jour les conditions de pièces du véhicule courant puis le refait apparaître (replaceOption 2). | 1370 |
| `career_modules_inventory.delayVehicleAccess(inventoryId, delay, reason)` | Rend un véhicule inaccessible pendant `delay` secondes (timeToAccess) avec une raison (bought, repair). Ignoré si delay <= 0. | 1193 |
| `career_modules_inventory.enterVehicle(newInventoryId, loadOption, callback)` | Fait entrer le joueur dans un véhicule de l'inventaire (nil = passer à pied). Sans effet si le véhicule est inaccessible (timeToAccess). Met d'abord à jour les conditions de pièces des véhicules apparus, sauf loadOption 1. | 538 |
| `career_modules_inventory.expediteRepairFromInventory(inventoryId, price)` | Accélère une réparation d'assurance payante (insurance.expediteRepair), sauvegarde et rafraîchit l'UI. | 1187 |
| `career_modules_inventory.getClosestGarage(pos)` | Renvoie le garage dont la première zone est la plus proche de pos (position du joueur par défaut) dans le niveau courant. | 36 |
| `career_modules_inventory.getCurrentVehicle()` | Id d'inventaire du véhicule que le joueur conduit (nil à pied). Listé dans les fonctions « Debug » du fichier. | 674 |
| `career_modules_inventory.getCurrentVehicleId()` | Id d'objet (monde) du véhicule courant de l'inventaire. | 698 |
| `career_modules_inventory.getDirtiedVehicles()` | Renvoie l'ensemble des inventoryId modifiés depuis la dernière sauvegarde. | 1343 |
| `career_modules_inventory.getFavoriteVehicle()` | Renvoie l'id d'inventaire du véhicule favori. | 1214 |
| `career_modules_inventory.getInventoryIdFromVehicleId(vehId)` | Convertit un id d'objet du monde en id d'inventaire (nil si le véhicule n'est pas dans l'inventaire). | 688 |
| `career_modules_inventory.getInventoryIdsInClosestGarage(onlyFirst)` | Liste les véhicules de l'inventaire présents dans le garage le plus proche (zone intersectée), triés par distance au joueur. Avec onlyFirst, renvoie un seul id (le premier trouvé par next, voir notes). | 973 |
| `career_modules_inventory.getLastVehicle()` | Id d'inventaire du dernier véhicule dans lequel le joueur est entré. | 678 |
| `career_modules_inventory.getMapInventoryIdToVehId()` | Renvoie la table inventoryId -> id d'objet pour les véhicules présents dans le monde (par référence). | 694 |
| `career_modules_inventory.getNumberOfFreeSlots()` | Nombre d'emplacements libres (20 moins les véhicules owned qui occupent de la place). | 286 |
| `career_modules_inventory.getPartConditionsCallback(partConditions, inventoryId)` | Enregistre les conditions de pièces reçues du véhicule (ignorées avec un avertissement si ce n'est pas une table), finalise un ajout en attente (hook onVehicleAdded) et synchronise l'inventaire de pièces. *(interne)* | 395 |
| `career_modules_inventory.getVehicle(inventoryId)` | Renvoie les infos d'un véhicule de l'inventaire. | 1152 |
| `career_modules_inventory.getVehicleIdFromInventoryId(inventoryId)` | Convertit un id d'inventaire en id d'objet du monde (nil si non apparu). | 682 |
| `career_modules_inventory.getVehicleNiceNameTranslated(inventoryId)` | Nom d'affichage traduit du véhicule. | 833 |
| `career_modules_inventory.getVehicleThumbnail(inventoryId)` | Chemin de la miniature du véhicule : fichier de la sauvegarde si une capture existe, sinon aperçu par défaut de sa configuration. | 760 |
| `career_modules_inventory.getVehicleUiData(inventoryId, inventoryIdsInGarage)` | Prépare les données d'un véhicule pour l'UI : valeur (et valeur réparée), prix de réparation express, distance, présence au garage/stockage, besoin de réparation, favori, assurance, permissions (réparation, vente, favori, stockage, plaque, retour de prêt), mise en vente et données de performance. | 839 |
| `career_modules_inventory.getVehicles()` | Renvoie la table complète des véhicules de l'inventaire (par référence). | 1148 |
| `career_modules_inventory.hasFreeSlot()` | Indique s'il reste au moins un emplacement libre. | 294 |
| `career_modules_inventory.isEmpty()` | Indique si l'inventaire ne contient aucun véhicule. | 1347 |
| `career_modules_inventory.isLicensePlateValid(text)` | Valide un texte de plaque via core_vehicles.isLicensePlateValid. | 1351 |
| `career_modules_inventory.isSeatedInsideOwnedVehicle()` | Indique si le joueur est dans un véhicule de l'inventaire (currentVehicle défini), possédé ou non. | 702 |
| `career_modules_inventory.isVehicleNameValid(text)` | Valide un nom de véhicule : non vide et sans guillemet, antislash ni caractère de contrôle (\b \f \n \r \t). | 1355 |
| `career_modules_inventory.onAvailableMissionsSentToUi()` | Hook : met à jour les conditions de pièces du véhicule courant et envoie à l'UI s'il a besoin de réparation (gameContextPlayerVehicleDamageInfo). *(interne)* *(hook)* | 1200 |
| `career_modules_inventory.onBeforeWalkingModeToggled(enabled, vehicleInFrontVehId)` | Hook : sortir du véhicule (mode marche) fait entrer dans « aucun véhicule » ; monter dans un véhicule de l'inventaire l'enregistre comme courant. *(interne)* *(hook)* | 964 |
| `career_modules_inventory.onBigMapActivated()` | Hook : à l'ouverture de la grande carte, crée un instantané de conditions de pièces « beforeReset » pour le véhicule courant. *(interne)* *(hook)* | 662 |
| `career_modules_inventory.onCareerActive(active)` | Hook : vend les véhicules si la sauvegarde est trop ancienne, puis prépare l'inventaire (réapparition des véhicules, entrée dans le véhicule courant, équipement de départ pour une nouvelle carrière). *(interne)* *(hook)* | 636 |
| `career_modules_inventory.onCheckPermission(tags, permissions, additionalData)` | Hook de permissions : pour les véhicules non possédés, interdit vente, réparation, mission, peinture, achat de pièces, plaque, tuning, stockage, échange de pièces, remorquage au garage et favori ; interdit aussi réparer/vendre un véhicule inaccessible, mettre en favori le favori ou un fichier manquant, stocker un véhicule absent du monde. *(interne)* *(hook)* | 1270 |
| `career_modules_inventory.onComputerAddFunctions(menuData, computerFunctions)` | Hook de l'ordinateur : ajoute la fonction « Mes véhicules » (ordre 1), désactivée tant que le véhicule de départ n'est pas acheté. *(interne)* *(hook)* | 1218 |
| `career_modules_inventory.onEnterVehicleFinished(inventoryId)` | Hook : mémorise le véhicule dans lequel on est entré comme dernier véhicule. *(interne)* *(hook)* | 1142 |
| `career_modules_inventory.onExitVehicleInventory()` | Hook : l'écran d'inventaire est fermé. *(interne)* *(hook)* | 1137 |
| `career_modules_inventory.onExtensionLoaded()` | Hook : si la carrière est active, charge les fichiers de career/vehicles/ et inventory.json (véhicule courant, dernier, favori, positions, position à pied) ; décrémente timeToAccess du temps écoulé depuis la sauvegarde. *(interne)* *(hook)* | 54 |
| `career_modules_inventory.onGetRawPoiListForLevel(levelIdentifier, elements)` | Hook de la liste de POI : ajoute un marqueur de grande carte pour chaque véhicule de l'inventaire présent dans le monde (autre que celui du joueur), avec description (distance, plaque, odomètre) et miniature. *(interne)* *(hook)* | 1299 |
| `career_modules_inventory.onSaveCurrentProfile(currentSavePath, vehiclesThumbnailUpdate)` | Hook de sauvegarde : écrit inventory.json, met à jour les conditions de pièces, puis écrit chaque véhicule (JSON + miniature si demandée) et supprime les fichiers de véhicules disparus ; à la fin, émet onVehicleSaveFinished. *(interne)* *(hook)* | 247 |
| `career_modules_inventory.onSaveCurrentProfileAsyncStart()` | Hook : enregistre l'inventaire comme extension de sauvegarde asynchrone (career_saveSystem.registerAsyncSaveExtension). *(interne)* *(hook)* | 177 |
| `career_modules_inventory.onScreenFadeState(state)` | Hook : quand le fondu d'écran est complet (state 1), supprime les véhicules marqués puis exécute l'action différée (apparition d'un véhicule). *(interne)* *(hook)* | 1001 |
| `career_modules_inventory.onUpdate(dtReal, dtSim, dtRaw)` | Hook de frame : sauvegarde initiale d'une nouvelle carrière (après 10 frames), toasts de véhicule mis en stockage ou prêt rendu, décompte de timeToAccess avec messages de livraison/réparation. *(interne)* *(hook)* | 923 |
| `career_modules_inventory.openInventoryMenuForChoosingListing()` | Ouvre l'inventaire pour choisir un véhicule à mettre en vente (action addListing côté UI), toutes les autres actions désactivées. | 1115 |
| `career_modules_inventory.openMenu(_chooseButtonsData, header, _buttonsActive, _backTarget)` | Ouvre l'écran d'inventaire (career.computer.vehicleInventory) avec des boutons de choix configurables et met à jour les conditions de pièces des véhicules apparus. | 1009 |
| `career_modules_inventory.openMenuFromComputer(_originComputerId)` | Ouvre l'inventaire depuis l'ordinateur du garage avec trois boutons : récupérer au garage, remplacer le véhicule actuel, ouvrir l'indice de performance. | 1082 |
| `career_modules_inventory.purchaseLicensePlateText(inventoryId, text, money)` | Achète un changement de plaque : paie, applique le texte, débloque NOW_ITS_MINE, joue le son et marque le véhicule modifié. Ne fait rien si le joueur ne peut pas payer. | 1243 |
| `career_modules_inventory.removeVehicle(inventoryId)` | Supprime le véhicule de l'inventaire et du monde, émet onVehicleRemoved et réassigne le favori si besoin. | 378 |
| `career_modules_inventory.removeVehicleObject(inventoryId, skipPartConditions)` | Supprime seulement l'objet véhicule du monde (le véhicule reste dans l'inventaire, en stockage) ; passe le joueur en mode marche s'il le conduisait. Émet onInventoryPreRemoveVehicleObject. | 360 |
| `career_modules_inventory.renameVehicle(inventoryId, name)` | Renomme le véhicule (niceName) s'il est valide et le marque modifié. | 1360 |
| `career_modules_inventory.requestPickerExit()` | Quitte le sélecteur : navigue vers la route de retour (career.computer par défaut). | 1036 |
| `career_modules_inventory.returnLoanedVehicleFromInventory(inventoryId)` | Rend un véhicule prêté (career_modules_loanerVehicles.returnVehicle) puis sauvegarde et rafraîchit l'UI. | 1180 |
| `career_modules_inventory.sellVehicle(inventoryId, price)` | Vend un véhicule : émet onBeforeVehicleSell, crédite le prix (ou la valeur calculée par valueCalculator), supprime le véhicule, joue le son d'achat, débloque FLIP_PROFIT si revendu au-dessus du prix d'achat final, et journalise. | 1156 |
| `career_modules_inventory.sellVehicleFromInventory(inventoryId)` | Vend depuis l'écran d'inventaire : vend, sauvegarde la carrière et renvoie les données à l'UI. | 1173 |
| `career_modules_inventory.sendDataToUi()` | Envoie à l'UI (guihooks vehicleInventoryData) tous les véhicules, les boutons de choix, l'en-tête, le nombre d'emplacements libres et l'argent du joueur. | 903 |
| `career_modules_inventory.setFavoriteVehicle(inventoryId)` | Définit le véhicule favori (ignoré si l'id est inconnu). | 1208 |
| `career_modules_inventory.setLicensePlateText(inventoryId, text)` | Change le texte de plaque du véhicule dans le monde et dans sa config. | 1235 |
| `career_modules_inventory.setVehicleDirty(inventoryId)` | Marque un véhicule comme modifié : il sera réécrit (avec nouvelle dirtyDate) à la prochaine sauvegarde. | 146 |
| `career_modules_inventory.spawnVehicle(inventoryId, replaceOption, callback)` | Fait apparaître un véhicule de l'inventaire depuis sa config (liste de pièces aplatie), restaure ses conditions de pièces et réconcilie l'inventaire de pièces. Retourne nil si le modèle ou le fichier de config n'existe plus. | 436 |
| `career_modules_inventory.teleportedFromBigmap()` | Appelé après une téléportation depuis la grande carte : sauvegarde la carrière si le joueur est dans un véhicule de l'inventaire et si l'autosauvegarde est active. | 668 |
| `career_modules_inventory.updatePartConditions(vehId, inventoryId, callback)` | Demande au véhicule ses conditions de pièces (getPartConditions) et les stocke dans l'inventaire puis dans l'inventaire de pièces. | 406 |
| `career_modules_inventory.updatePartConditionsOfSpawnedVehicles(callback)` | Marque tous les véhicules apparus comme modifiés et met à jour leurs conditions de pièces ; callback est appelé quand tous sont traités (ou tout de suite s'il n'y en a aucun). | 150 |

### Détail des paramètres

#### `career_modules_inventory.addVehicle(vehId, inventoryId, options)`

Ajoute un véhicule du monde à l'inventaire : enregistre modèle, config, nom, plaque, valeur de base (configBaseValue), initialise les conditions de pièces, attribue un inventoryId libre si absent, définit le favori s'il est le premier et débloque GARAGE_STARTER à 3 véhicules possédés.

- `vehId` (*integer*) : Id d'objet du véhicule.
- `inventoryId` (*integer|nil*) : Id d'inventaire imposé, sinon le premier libre.
- `options` (*{owned: boolean|nil, finalPrice: number|nil}|nil*) : owned vaut true par défaut ; finalPrice sert au succès FLIP_PROFIT.
- **renvoie** : integer|nil inventoryId, nil si l'objet ou ses données sont introuvables.

#### `career_modules_inventory.applyPartConditions(inventoryId, vehId)`

Réapplique au véhicule en jeu les conditions de pièces sauvegardées (initPartConditions).

- `inventoryId` (*integer*) : Id d'inventaire.
- `vehId` (*integer|nil*) : Id d'objet ; sinon déduit de l'inventaire.

#### `career_modules_inventory.chooseVehicleFromMenu(inventoryId, buttonIndex, repairPrevVeh)`

Exécute le callback du bouton de choix d'indice buttonIndex pour le véhicule donné.

- `inventoryId` (*integer*) : Id d'inventaire choisi.
- `buttonIndex` (*integer*) : Indice du bouton (à partir de 1).
- `repairPrevVeh` (*any*) : Transmis au callback.

#### `career_modules_inventory.delayVehicleAccess(inventoryId, delay, reason)`

Rend un véhicule inaccessible pendant `delay` secondes (timeToAccess) avec une raison (bought, repair). Ignoré si delay <= 0.

- `inventoryId` (*integer*) : Id d'inventaire.
- `delay` (*number*) : Durée en secondes.
- `reason` (*string*) : Raison ("bought" ou "repair" produisent un message à la fin).

#### `career_modules_inventory.enterVehicle(newInventoryId, loadOption, callback)`

Fait entrer le joueur dans un véhicule de l'inventaire (nil = passer à pied). Sans effet si le véhicule est inaccessible (timeToAccess). Met d'abord à jour les conditions de pièces des véhicules apparus, sauf loadOption 1.

- `newInventoryId` (*integer|nil*) : Id d'inventaire.
- `loadOption` (*integer|nil*) : 1 : ne pas recharger le véhicule ; 2 : forcer le rechargement ; nil : entrer dans l'objet existant ou le faire apparaître.
- `callback` (*function|nil*) : Appelée après l'entrée.

#### `career_modules_inventory.expediteRepairFromInventory(inventoryId, price)`

Accélère une réparation d'assurance payante (insurance.expediteRepair), sauvegarde et rafraîchit l'UI.

- `inventoryId` (*integer*) : Id d'inventaire.
- `price` (*number*) : Prix de l'accélération.

#### `career_modules_inventory.getClosestGarage(pos)`

Renvoie le garage dont la première zone est la plus proche de pos (position du joueur par défaut) dans le niveau courant.

- `pos` (*vec3|nil*) : Position de référence.
- **renvoie** : table|nil Installation garage.

#### `career_modules_inventory.getCurrentVehicle()`

Id d'inventaire du véhicule que le joueur conduit (nil à pied). Listé dans les fonctions « Debug » du fichier.

- **renvoie** : integer|nil inventoryId courant.

#### `career_modules_inventory.getCurrentVehicleId()`

Id d'objet (monde) du véhicule courant de l'inventaire.

- **renvoie** : integer|nil Id d'objet véhicule.

#### `career_modules_inventory.getDirtiedVehicles()`

Renvoie l'ensemble des inventoryId modifiés depuis la dernière sauvegarde.

- **renvoie** : table<integer, boolean> Ensemble des ids.

#### `career_modules_inventory.getFavoriteVehicle()`

Renvoie l'id d'inventaire du véhicule favori.

- **renvoie** : integer|nil inventoryId favori.

#### `career_modules_inventory.getInventoryIdFromVehicleId(vehId)`

Convertit un id d'objet du monde en id d'inventaire (nil si le véhicule n'est pas dans l'inventaire).

- `vehId` (*integer|nil*) : Id d'objet véhicule.
- **renvoie** : integer|nil Id d'inventaire.

#### `career_modules_inventory.getInventoryIdsInClosestGarage(onlyFirst)`

Liste les véhicules de l'inventaire présents dans le garage le plus proche (zone intersectée), triés par distance au joueur. Avec onlyFirst, renvoie un seul id (le premier trouvé par next, voir notes).

- `onlyFirst` (*boolean|nil*) : Ne renvoyer qu'un id.
- **renvoie** : integer[]|integer|nil Liste d'ids, ou un id si onlyFirst.

#### `career_modules_inventory.getLastVehicle()`

Id d'inventaire du dernier véhicule dans lequel le joueur est entré.

- **renvoie** : integer|nil inventoryId.

#### `career_modules_inventory.getMapInventoryIdToVehId()`

Renvoie la table inventoryId -> id d'objet pour les véhicules présents dans le monde (par référence).

- **renvoie** : table<integer, integer> Correspondance.

#### `career_modules_inventory.getNumberOfFreeSlots()`

Nombre d'emplacements libres (20 moins les véhicules owned qui occupent de la place).

- **renvoie** : integer Emplacements libres.

#### `career_modules_inventory.getPartConditionsCallback(partConditions, inventoryId)`

Enregistre les conditions de pièces reçues du véhicule (ignorées avec un avertissement si ce n'est pas une table), finalise un ajout en attente (hook onVehicleAdded) et synchronise l'inventaire de pièces.

- `partConditions` (*table|boolean*) : Conditions, ou false si non initialisées.
- `inventoryId` (*integer*) : Id d'inventaire.

#### `career_modules_inventory.getVehicle(inventoryId)`

Renvoie les infos d'un véhicule de l'inventaire.

- `inventoryId` (*integer*) : Id d'inventaire.
- **renvoie** : table|nil Infos du véhicule.

#### `career_modules_inventory.getVehicleIdFromInventoryId(inventoryId)`

Convertit un id d'inventaire en id d'objet du monde (nil si non apparu).

- `inventoryId` (*integer|nil*) : Id d'inventaire.
- **renvoie** : integer|nil Id d'objet.

#### `career_modules_inventory.getVehicleNiceNameTranslated(inventoryId)`

Nom d'affichage traduit du véhicule.

- `inventoryId` (*integer*) : Id d'inventaire.
- **renvoie** : string|nil Nom.

#### `career_modules_inventory.getVehicleThumbnail(inventoryId)`

Chemin de la miniature du véhicule : fichier de la sauvegarde si une capture existe, sinon aperçu par défaut de sa configuration.

- `inventoryId` (*integer|nil*) : Id d'inventaire.
- **renvoie** : string|nil Chemin d'image.

#### `career_modules_inventory.getVehicleUiData(inventoryId, inventoryIdsInGarage)`

Prépare les données d'un véhicule pour l'UI : valeur (et valeur réparée), prix de réparation express, distance, présence au garage/stockage, besoin de réparation, favori, assurance, permissions (réparation, vente, favori, stockage, plaque, retour de prêt), mise en vente et données de performance.

- `inventoryId` (*integer*) : Id d'inventaire.
- `inventoryIdsInGarage` (*table<integer, boolean>|nil*) : Véhicules du garage le plus proche (calculé si nil).
- **renvoie** : table|nil Données pour l'UI.

#### `career_modules_inventory.getVehicles()`

Renvoie la table complète des véhicules de l'inventaire (par référence).

- **renvoie** : table<integer, table> inventoryId -> infos du véhicule.

#### `career_modules_inventory.hasFreeSlot()`

Indique s'il reste au moins un emplacement libre.

- **renvoie** : boolean true si oui.

#### `career_modules_inventory.isEmpty()`

Indique si l'inventaire ne contient aucun véhicule.

- **renvoie** : boolean true si vide.

#### `career_modules_inventory.isLicensePlateValid(text)`

Valide un texte de plaque via core_vehicles.isLicensePlateValid.

- `text` (*string*) : Texte.
- **renvoie** : boolean Validité.

#### `career_modules_inventory.isSeatedInsideOwnedVehicle()`

Indique si le joueur est dans un véhicule de l'inventaire (currentVehicle défini), possédé ou non.

- **renvoie** : boolean true si assis dans un véhicule de l'inventaire.

#### `career_modules_inventory.isVehicleNameValid(text)`

Valide un nom de véhicule : non vide et sans guillemet, antislash ni caractère de contrôle (\b \f \n \r \t).

- `text` (*string|nil*) : Nom.
- **renvoie** : boolean Validité.

#### `career_modules_inventory.onBeforeWalkingModeToggled(enabled, vehicleInFrontVehId)`

Hook : sortir du véhicule (mode marche) fait entrer dans « aucun véhicule » ; monter dans un véhicule de l'inventaire l'enregistre comme courant.

- `enabled` (*boolean*) : true si on passe en mode marche.
- `vehicleInFrontVehId` (*integer|nil*) : Id du véhicule devant le joueur.

#### `career_modules_inventory.onCareerActive(active)`

Hook : vend les véhicules si la sauvegarde est trop ancienne, puis prépare l'inventaire (réapparition des véhicules, entrée dans le véhicule courant, équipement de départ pour une nouvelle carrière).

- `active` (*boolean*) : Rien si false.

#### `career_modules_inventory.onCheckPermission(tags, permissions, additionalData)`

Hook de permissions : pour les véhicules non possédés, interdit vente, réparation, mission, peinture, achat de pièces, plaque, tuning, stockage, échange de pièces, remorquage au garage et favori ; interdit aussi réparer/vendre un véhicule inaccessible, mettre en favori le favori ou un fichier manquant, stocker un véhicule absent du monde.

- `tags` (*string[]*) : Tags demandés.
- `permissions` (*table[]*) : Liste à compléter ({permission}).
- `additionalData` (*{inventoryId: integer}|nil*) : Contexte (inventoryId).

#### `career_modules_inventory.onComputerAddFunctions(menuData, computerFunctions)`

Hook de l'ordinateur : ajoute la fonction « Mes véhicules » (ordre 1), désactivée tant que le véhicule de départ n'est pas acheté.

- `menuData` (*table*) : Données du menu.
- `computerFunctions` (*table*) : Fonctions à compléter (general).

#### `career_modules_inventory.onEnterVehicleFinished(inventoryId)`

Hook : mémorise le véhicule dans lequel on est entré comme dernier véhicule.

- `inventoryId` (*integer|nil*) : Id d'inventaire.

#### `career_modules_inventory.onGetRawPoiListForLevel(levelIdentifier, elements)`

Hook de la liste de POI : ajoute un marqueur de grande carte pour chaque véhicule de l'inventaire présent dans le monde (autre que celui du joueur), avec description (distance, plaque, odomètre) et miniature.

- `levelIdentifier` (*string*) : Niveau (non utilisé).
- `elements` (*table[]*) : Liste de POI à compléter.

#### `career_modules_inventory.onSaveCurrentProfile(currentSavePath, vehiclesThumbnailUpdate)`

Hook de sauvegarde : écrit inventory.json, met à jour les conditions de pièces, puis écrit chaque véhicule (JSON + miniature si demandée) et supprime les fichiers de véhicules disparus ; à la fin, émet onVehicleSaveFinished.

- `currentSavePath` (*string*) : Dossier de sauvegarde.
- `vehiclesThumbnailUpdate` (*integer[]|nil*) : Ids des véhicules dont la miniature doit être refaite.

#### `career_modules_inventory.onScreenFadeState(state)`

Hook : quand le fondu d'écran est complet (state 1), supprime les véhicules marqués puis exécute l'action différée (apparition d'un véhicule).

- `state` (*integer*) : État du fondu.

#### `career_modules_inventory.onUpdate(dtReal, dtSim, dtRaw)`

Hook de frame : sauvegarde initiale d'une nouvelle carrière (après 10 frames), toasts de véhicule mis en stockage ou prêt rendu, décompte de timeToAccess avec messages de livraison/réparation.

- `dtReal` (*number*) : Temps réel (s).
- `dtSim` (*number*) : Temps simulé (s).
- `dtRaw` (*number*) : Temps brut (s).

#### `career_modules_inventory.openMenu(_chooseButtonsData, header, _buttonsActive, _backTarget)`

Ouvre l'écran d'inventaire (career.computer.vehicleInventory) avec des boutons de choix configurables et met à jour les conditions de pièces des véhicules apparus.

- `_chooseButtonsData` (*table[]|nil*) : Boutons {callback, buttonText, repairRequired, insuranceRequired, ownedRequired...}.
- `header` (*string|nil*) : Titre du menu.
- `_buttonsActive` (*table|nil*) : repairEnabled, sellEnabled, favoriteEnabled, storingEnabled, returnLoanerEnabled (true par défaut).
- `_backTarget` (*string|nil*) : Route de retour.

#### `career_modules_inventory.openMenuFromComputer(_originComputerId)`

Ouvre l'inventaire depuis l'ordinateur du garage avec trois boutons : récupérer au garage, remplacer le véhicule actuel, ouvrir l'indice de performance.

- `_originComputerId` (*string*) : Id de l'ordinateur d'origine.

#### `career_modules_inventory.purchaseLicensePlateText(inventoryId, text, money)`

Achète un changement de plaque : paie, applique le texte, débloque NOW_ITS_MINE, joue le son et marque le véhicule modifié. Ne fait rien si le joueur ne peut pas payer.

- `inventoryId` (*integer*) : Id d'inventaire.
- `text` (*string*) : Texte de plaque.
- `money` (*number*) : Prix.

#### `career_modules_inventory.removeVehicle(inventoryId)`

Supprime le véhicule de l'inventaire et du monde, émet onVehicleRemoved et réassigne le favori si besoin.

- `inventoryId` (*integer*) : Id d'inventaire.

#### `career_modules_inventory.removeVehicleObject(inventoryId, skipPartConditions)`

Supprime seulement l'objet véhicule du monde (le véhicule reste dans l'inventaire, en stockage) ; passe le joueur en mode marche s'il le conduisait. Émet onInventoryPreRemoveVehicleObject.

- `inventoryId` (*integer*) : Id d'inventaire.
- `skipPartConditions` (*boolean|nil*) : Non utilisé dans le corps (reste un TODO).

#### `career_modules_inventory.renameVehicle(inventoryId, name)`

Renomme le véhicule (niceName) s'il est valide et le marque modifié.

- `inventoryId` (*integer*) : Id d'inventaire.
- `name` (*string*) : Nouveau nom.
- **renvoie** : boolean false si le nom est invalide.

#### `career_modules_inventory.requestPickerExit()`

Quitte le sélecteur : navigue vers la route de retour (career.computer par défaut).

- **renvoie** : any Résultat de ui_router.navigate.

#### `career_modules_inventory.returnLoanedVehicleFromInventory(inventoryId)`

Rend un véhicule prêté (career_modules_loanerVehicles.returnVehicle) puis sauvegarde et rafraîchit l'UI.

- `inventoryId` (*integer*) : Id d'inventaire.

#### `career_modules_inventory.sellVehicle(inventoryId, price)`

Vend un véhicule : émet onBeforeVehicleSell, crédite le prix (ou la valeur calculée par valueCalculator), supprime le véhicule, joue le son d'achat, débloque FLIP_PROFIT si revendu au-dessus du prix d'achat final, et journalise.

- `inventoryId` (*integer*) : Id d'inventaire.
- `price` (*number|nil*) : Prix imposé (sinon valeur calculée).
- **renvoie** : boolean|nil true si vendu, nil si le véhicule n'existe pas.

#### `career_modules_inventory.sellVehicleFromInventory(inventoryId)`

Vend depuis l'écran d'inventaire : vend, sauvegarde la carrière et renvoie les données à l'UI.

- `inventoryId` (*integer*) : Id d'inventaire.

#### `career_modules_inventory.setFavoriteVehicle(inventoryId)`

Définit le véhicule favori (ignoré si l'id est inconnu).

- `inventoryId` (*integer*) : Id d'inventaire.

#### `career_modules_inventory.setLicensePlateText(inventoryId, text)`

Change le texte de plaque du véhicule dans le monde et dans sa config.

- `inventoryId` (*integer*) : Id d'inventaire.
- `text` (*string*) : Texte de plaque.

#### `career_modules_inventory.setVehicleDirty(inventoryId)`

Marque un véhicule comme modifié : il sera réécrit (avec nouvelle dirtyDate) à la prochaine sauvegarde.

- `inventoryId` (*integer*) : Id d'inventaire.

#### `career_modules_inventory.spawnVehicle(inventoryId, replaceOption, callback)`

Fait apparaître un véhicule de l'inventaire depuis sa config (liste de pièces aplatie), restaure ses conditions de pièces et réconcilie l'inventaire de pièces. Retourne nil si le modèle ou le fichier de config n'existe plus.

- `inventoryId` (*integer*) : Id d'inventaire.
- `replaceOption` (*integer|nil*) : 1 : remplace le véhicule courant du joueur ; 2 : remplace l'objet ayant le même inventoryId ; autre : nouveau véhicule sans y entrer.
- `callback` (*function|nil*) : Appelée quand les conditions de pièces sont synchronisées.
- **renvoie** : userdata|nil Objet véhicule créé.

#### `career_modules_inventory.updatePartConditions(vehId, inventoryId, callback)`

Demande au véhicule ses conditions de pièces (getPartConditions) et les stocke dans l'inventaire puis dans l'inventaire de pièces.

- `vehId` (*integer|nil*) : Id d'objet ; sinon déduit de inventoryId.
- `inventoryId` (*integer*) : Id d'inventaire.
- `callback` (*function|nil*) : Appelée une fois la valeur reçue.

#### `career_modules_inventory.updatePartConditionsOfSpawnedVehicles(callback)`

Marque tous les véhicules apparus comme modifiés et met à jour leurs conditions de pièces ; callback est appelé quand tous sont traités (ou tout de suite s'il n'y en a aucun).

- `callback` (*function|nil*) : Appelée à la fin.

## Champs

| Champ | Type | Description |
|---|---|---|
| `dependencies` | table<integer, string> | Extensions chargées avant : career_career, career_modules_log, gameplay_tutorial_setup. |

## Hooks émis

Évènements diffusés aux extensions par `extensions.hook` :

- `onBeforeVehicleSell` — écouté par 1 module(s)
- `onEnterVehicleFinished` — écouté par 4 module(s)
- `onInventoryPreRemoveVehicleObject` — écouté par 1 module(s)
- `onVehicleAdded` — écouté par 2 module(s)
- `onVehicleRemoved` — écouté par 3 module(s)
- `onVehicleSaveFinished` — écouté par 8 module(s)

**Évènements UI (guihooks.trigger) :** `addListing`, `gameContextPlayerVehicleDamageInfo`, `saveFinished`, `toastrMsg`, `vehicleInventoryData`

## Appels vers le moteur (C++)

- `FS:` `copyFile`, `fileExists`, `findFiles`, `removeFile`
- `be:` `enterVehicle`, `getPlayerVehicleID`
- `obj:` `delete`
- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/career/modules/inventory.lua`.*

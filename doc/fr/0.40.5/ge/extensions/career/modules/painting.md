# `career_modules_painting`

*Fichier : `lua/ge/extensions/career/modules/painting.lua` · VM : Game Engine (GE) · 337 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `career_modules_painting` : `extensions.load("career_modules_painting")`, puis la globale `career_modules_painting`

Atelier de peinture de la carrière, accessible depuis l'ordinateur du garage. Il prépare la scène (entre dans le véhicule, le fige, caméra orbitale, blocage des actions walkingMode et bigMap), envoie à l'UI les couleurs d'origine, les prix et les classes de peinture, applique en direct les peintures choisies (setPaints), puis facture et enregistre (apply) ou annule (close/cleanup). Les données restent dans l'inventaire du véhicule (config.paints et partConditions).

## Remarques

- Prix de base par classe de peinture : factory 600, semiGloss 1000, gloss 1500, semiMetallic 1500, metallic 2500, matte 1800, chrome 3400, custom 4000. Vernis (clearcoat) : 500 de base + clearCoatPolish * 1000. Tous avec canBeNegative = false.
- Paramètres physiques par classe (metallic, roughness) : semiGloss 0/0.13, gloss 0/0, semiMetallic 0.5/0.5, metallic 1/0.5, matte 0/0.7, chrome 1/0.
- setPaints complète les paints à 3 entrées en répétant la précédente ; elle applique les peintures sur le véhicule (core_vehicle_colors.setVehiclePaint) et via partCondition.setPartPaints / setAllPartPaints côté véhicule.
- apply remet l'odomètre de peinture à 0 pour toutes les pièces peintes (TODO du code : cela remet les 3 peintures à 0) et enlève le drapeau primered des pièces.
- start répare d'abord le véhicule via l'assurance si le nombre de pièces cassées est entre 1 et le seuil (getBrokenPartsThreshold), puis démarre.
- Permissions : la fonction d'ordinateur est désactivée si le véhicule a besoin de réparation, si le véhicule de départ n'est pas acheté, ou si career_modules_permissions refuse les tags painting/vehicleModification.

**Dépendances (chargées avant) :** `career_career`, `gameplay_achievement`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `career_modules_painting.apply()` | Valide la sélection : vérifie et paie le prix total (tags vehiclePainting, buying), joue le son d'achat, enregistre les peintures dans le véhicule d'inventaire, débloque VEHICLE_MODIFIED, ferme le mode et lance la sauvegarde du véhicule. Ne fait rien si le joueur ne peut pas payer. | 186 |
| `career_modules_painting.cleanup()` | Restaure l'état du véhicule (réapparition depuis l'inventaire), de la caméra, du mode marche et des entrées. Ne navigue pas (le routeur UI s'en charge) ; sans effet si la peinture n'est pas active. | 128 |
| `career_modules_painting.close(_closeMenuAfterSaving)` | Quitte le mode peinture (cleanup) puis rouvre le menu de l'ordinateur ou ferme les menus ; si autosauvegarde active et _closeMenuAfterSaving vrai, la fermeture du menu attend onVehicleSaveFinished. | 153 |
| `career_modules_painting.getFactoryPaint()` | Renvoie les peintures d'usine du modèle du véhicule en cours de peinture. | 282 |
| `career_modules_painting.getPaintData()` | Renvoie les données envoyées à l'UI : colors (peintures d'origine de la pièce « body » ou de la première pièce peinte), prices et colorClassData. | 75 |
| `career_modules_painting.getPrimerColor()` | Renvoie la peinture d'apprêt grise (baseColor {0.58, 0.58, 0.585}, roughness 0.475, clearcoat 0). | 45 |
| `career_modules_painting.onComputerAddFunctions(menuData, computerFunctions)` | Hook de l'ordinateur : ajoute la fonction « peinture » (ordre 15) pour chaque véhicule présent dans le garage, avec les raisons de désactivation éventuelles. *(interne)* *(hook)* | 215 |
| `career_modules_painting.onRouteMount(context, toRoute, fromRoute, data)` | Cycle de vie du routeur UI : renvoie les données de peinture une fois la vue montée. *(interne)* *(hook)* | 296 |
| `career_modules_painting.onUIOpened()` | Hook appelé à l'ouverture de l'UI : entre dans le véhicule (avec un délai d'une frame), le fige, règle la caméra orbitale (rotation 145, -15) et décale le cadrage ; émet onVehiclePaintingUiOpened. *(interne)* *(hook)* | 300 |
| `career_modules_painting.onVehicleSaveFinished()` | Hook appelé quand la sauvegarde du véhicule est terminée : ferme le menu si close() l'avait demandé. *(interne)* *(hook)* | 165 |
| `career_modules_painting.sendPaintingDataToUI()` | Envoie à l'UI les données de peinture et la peinture d'usine (guihooks paintingData) si la peinture est active. | 288 |
| `career_modules_painting.setPaints(paints, paintOptions, partName)` | Enregistre le choix du joueur, envoie le prix du panier à l'UI (sendPaintingShoppingCartData) et applique les peintures au véhicule (toutes les pièces, ou seulement partName). | 258 |
| `career_modules_painting.start(_inventoryId, _originComputerId)` | Ouvre le mode peinture pour un véhicule de l'inventaire (celui du garage le plus proche si inventoryId est nil). Ne fait rien si le véhicule n'est pas apparu dans le monde. Passe d'abord par une réparation d'assurance si nécessaire. | 105 |

### Détail des paramètres

#### `career_modules_painting.close(_closeMenuAfterSaving)`

Quitte le mode peinture (cleanup) puis rouvre le menu de l'ordinateur ou ferme les menus ; si autosauvegarde active et _closeMenuAfterSaving vrai, la fermeture du menu attend onVehicleSaveFinished.

- `_closeMenuAfterSaving` (*boolean|nil*) : Attendre la fin de la sauvegarde avant de fermer le menu.

#### `career_modules_painting.getFactoryPaint()`

Renvoie les peintures d'usine du modèle du véhicule en cours de peinture.

- **renvoie** : table Peintures du modèle ({} si aucune).

#### `career_modules_painting.getPaintData()`

Renvoie les données envoyées à l'UI : colors (peintures d'origine de la pièce « body » ou de la première pièce peinte), prices et colorClassData.

- **renvoie** : {colors: table|nil, prices: table, colorClassData: table} Données de peinture.

#### `career_modules_painting.getPrimerColor()`

Renvoie la peinture d'apprêt grise (baseColor {0.58, 0.58, 0.585}, roughness 0.475, clearcoat 0).

- **renvoie** : table Table de peinture.

#### `career_modules_painting.onComputerAddFunctions(menuData, computerFunctions)`

Hook de l'ordinateur : ajoute la fonction « peinture » (ordre 15) pour chaque véhicule présent dans le garage, avec les raisons de désactivation éventuelles.

- `menuData` (*table*) : Données du menu (computerFacility, vehiclesInGarage, hasBoughtStarterVehicle).
- `computerFunctions` (*table*) : Fonctions de l'ordinateur à compléter (vehicleSpecific[inventoryId]).

#### `career_modules_painting.onRouteMount(context, toRoute, fromRoute, data)`

Cycle de vie du routeur UI : renvoie les données de peinture une fois la vue montée.

- `context` (*any*) : Contexte du routeur.
- `toRoute` (*any*) : Route cible.
- `fromRoute` (*any*) : Route précédente.
- `data` (*table*) : routeData.

#### `career_modules_painting.setPaints(paints, paintOptions, partName)`

Enregistre le choix du joueur, envoie le prix du panier à l'UI (sendPaintingShoppingCartData) et applique les peintures au véhicule (toutes les pièces, ou seulement partName).

- `paints` (*table[]*) : Jusqu'à 3 peintures.
- `paintOptions` (*table[]*) : Options par peinture (paintClass, clearCoat, clearCoatPolish) servant au calcul du prix.
- `partName` (*string|nil*) : Pièce visée ; toutes les pièces si nil.

#### `career_modules_painting.start(_inventoryId, _originComputerId)`

Ouvre le mode peinture pour un véhicule de l'inventaire (celui du garage le plus proche si inventoryId est nil). Ne fait rien si le véhicule n'est pas apparu dans le monde. Passe d'abord par une réparation d'assurance si nécessaire.

- `_inventoryId` (*integer|nil*) : Id d'inventaire du véhicule.
- `_originComputerId` (*string|nil*) : Id de l'ordinateur d'origine ; si fourni, navigue vers career.computer.painting.

## Champs

| Champ | Type | Description |
|---|---|---|
| `dependencies` | table<integer, string> | Extensions chargées avant : career_career, gameplay_achievement. |

## Hooks émis

Évènements diffusés aux extensions par `extensions.hook` :

- `onVehiclePaintingUiOpened`

**Évènements UI (guihooks.trigger) :** `onCareerPaintingStarted`, `paintingData`, `sendPaintingShoppingCartData`

## Appels vers le moteur (C++)

- `be:` `getPlayerVehicleID`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/career/modules/painting.lua`.*

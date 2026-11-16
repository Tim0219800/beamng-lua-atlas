# `career_modules_partShopping`

*Fichier : `lua/ge/extensions/career/modules/partShopping.lua` · VM : Game Engine (GE) · 1086 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `career_modules_partShopping` : `extensions.load("career_modules_partShopping")`, puis la globale `career_modules_partShopping`

Boutique de pièces de la carrière (écran « personnalisation de pièces » de l'ordinateur du garage). Pour un véhicule de l'inventaire, il génère la liste des pièces compatibles par slot (pièces neuves du JBeam avec leur valeur, plus pièces en stockage de l'inventaire à coût nul), tient un panier (partsIn / partsOut), prévisualise le résultat en refaisant apparaître le véhicule avec les pièces choisies, ajoute automatiquement les pièces nécessaires dans les sous-slots, retire les pièces devenues incompatibles et applique l'achat (paiement, mise à jour de l'inventaire de pièces, sauvegarde).

## Exemple

```lua
career_modules_partShopping.startShopping(inventoryId, computerId)
career_modules_partShopping.installPartByPartShopId(partShopId)
local cart = career_modules_partShopping.getShoppingCart()
print(cart.total)
```

## Remarques

- Taxe de vente : 7 % (salesTax) ajoutée au total du panier ; shoppingCart.total = somme des finalValue + taxes.
- Une pièce neuve a une valeur finale = valeur calculée (career_modules_valueCalculator.getPartValue) arrondie à 5 près moins 0,01 (minimum 0) ; une pièce de l'inventaire proposée a finalValue = 0 ; l'entrée « empty » (emptyPlaceholder) permet de retirer une pièce non essentielle.
- Les pièces de cargo (dryBulk ou fluid) sont désactivées (disabled) tant que la branche logistics-materials n'est pas débloquée (hors pièce de test « Magic Cargo Testing Part »).
- La prévisualisation remplace le véhicule (core_vehicles.replaceVehicle) avec previewVehicle.config et gèle le véhicule ; la peinture des nouvelles pièces utilise la couleur d'apprêt de career_modules_painting.getPrimerColor.
- Un véhicule avec des pièces cassées (entre 1 et le seuil) est d'abord réparé via l'assurance avant d'entrer en boutique.
- Une laisse (tether) capsule entre l'ordinateur et le véhicule annule la session (cancelShopping) si le joueur s'éloigne.
- Hooks émis : onPartShoppingStarted, onPartShoppingPartInstalled({part}), onPartShoppingCancelled, onPartShoppingTransactionComplete, plus guihooks partShoppingData et partShoppingRequestExit.
- L'achat appelle career_modules_vehiclePerformance.invalidateCertification et débloque le succès VEHICLE_MODIFIED.
- Route UI : career.computer.partShopping, .category (catégories « cargo » ou toutes les pièces) et .category.slot ; le panneau actif (categories, slots, parts) dépend de la route.

**Dépendances (chargées avant) :** `career_career`, `gameplay_achievement`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `career_modules_partShopping.applyShopping()` | Valide l'achat : ne fait rien si le joueur ne peut pas payer le total TTC. Sinon remplace le véhicule de l'inventaire par la prévisualisation, déplace les pièces retirées en stockage, ajoute/met à jour les pièces installées, paie (tags partsBought, buying), sauvegarde le véhicule, joue le son et émet onPartShoppingTransactionComplete. | 972 |
| `career_modules_partShopping.cancelShopping()` | Annule la session : émet onPartShoppingCancelled, refait apparaître le véhicule d'origine (spawnVehicle option 2) et ferme le menu. | 910 |
| `career_modules_partShopping.getCategoryBreadcrumbTitle(category)` | Titre de fil d'Ariane pour la route de catégorie : « pièces de cargo » pour category == "cargo", sinon « toutes les pièces ». | 1000 |
| `career_modules_partShopping.getPartsInShop()` | Renvoie la liste des pièces proposées (partsInShop). | 1020 |
| `career_modules_partShopping.getShoppingCart()` | Renvoie le panier {partsIn, partsOut, partsInList, partsOutList, slotList, taxes, total}. | 1024 |
| `career_modules_partShopping.getSlotBreadcrumbTitle(slotPath)` | Titre de fil d'Ariane pour la route de slot : nom lisible du dernier segment du chemin. | 1010 |
| `career_modules_partShopping.installPart(part)` | Ajoute une pièce au panier (sans effet hors session), complète automatiquement les sous-slots vides avec des pièces de l'inventaire ou par défaut, met à jour la prévisualisation et émet onPartShoppingPartInstalled. | 855 |
| `career_modules_partShopping.installPartByPartShopId(partShopId)` | Installe la pièce de la boutique identifiée par son partShopId. | 870 |
| `career_modules_partShopping.isShoppingSessionActive()` | Indique si une session d'achat est active. | 994 |
| `career_modules_partShopping.onComputerAddFunctions(menuData, computerFunctions)` | Hook de l'ordinateur : ajoute la fonction « personnalisation de pièces » (ordre 1) pour chaque véhicule du garage, désactivée si le véhicule est à réparer, si le véhicule de départ n'est pas acheté ou si career_modules_permissions refuse partBuying/vehicleModification. *(interne)* *(hook)* | 1028 |
| `career_modules_partShopping.onRouteEnter(context, toRoute, fromRoute, data)` | Cycle de vie du routeur UI : mémorise la sélection (catégorie, slot, panneau) déduite de la route. *(interne)* *(hook)* | 445 |
| `career_modules_partShopping.onRouteMount(context, toRoute, fromRoute, data)` | Cycle de vie du routeur UI : renormalise la sélection puis envoie les données de la boutique. *(interne)* *(hook)* | 451 |
| `career_modules_partShopping.onVehicleSaveFinished()` | Hook : une fois la sauvegarde du véhicule terminée après un achat, ferme le menu si la fermeture était différée. *(interne)* *(hook)* | 922 |
| `career_modules_partShopping.removePartBySlot(slot)` | Retire du panier la pièce du slot donné (restaure la pièce d'origine si elle convient encore au slot). | 879 |
| `career_modules_partShopping.requestExit()` | Demande à l'UI de quitter l'écran (guihooks partShoppingRequestExit). | 918 |
| `career_modules_partShopping.sendShoppingDataToUI()` | Régénère la boutique et envoie à l'UI (guihooks partShoppingData) : pièces, arbre de slots, panier, noms, liste de recherche, pièces filtrées selon la route, carte slot -> pièce installée et argent du joueur. | 414 |
| `career_modules_partShopping.setupTether()` | Crée la laisse capsule entre l'ordinateur et le véhicule ; quand elle est franchie, cancelShopping est appelé. | 516 |
| `career_modules_partShopping.startShopping(inventoryId, _originComputerId)` | Démarre une session pour un véhicule (celui donné, le courant, sinon celui du garage le plus proche). Répare d'abord par l'assurance si le véhicule est abîmé, puis prépare le panier, génère la boutique, pose la laisse, ouvre l'écran et fige le véhicule. | 531 |
| `career_modules_partShopping.updatePreviewVehicle(currentPartConditions)` | Rappel appelé par le véhicule avec ses conditions de pièces après le respawn de prévisualisation : recopie l'arbre de pièces, met à jour le panier, renvoie les données à l'UI et refige le véhicule. *(interne)* | 456 |

### Détail des paramètres

#### `career_modules_partShopping.getCategoryBreadcrumbTitle(category)`

Titre de fil d'Ariane pour la route de catégorie : « pièces de cargo » pour category == "cargo", sinon « toutes les pièces ».

- `category` (*string*) : Paramètre de route category.
- **renvoie** : string Titre traduit.

#### `career_modules_partShopping.getPartsInShop()`

Renvoie la liste des pièces proposées (partsInShop).

- **renvoie** : table[] Pièces de la boutique.

#### `career_modules_partShopping.getShoppingCart()`

Renvoie le panier {partsIn, partsOut, partsInList, partsOutList, slotList, taxes, total}.

- **renvoie** : table Panier.

#### `career_modules_partShopping.getSlotBreadcrumbTitle(slotPath)`

Titre de fil d'Ariane pour la route de slot : nom lisible du dernier segment du chemin.

- `slotPath` (*string*) : Paramètre de route slotPath.
- **renvoie** : string|nil Nom du slot, nil si inconnu.

#### `career_modules_partShopping.installPart(part)`

Ajoute une pièce au panier (sans effet hors session), complète automatiquement les sous-slots vides avec des pièces de l'inventaire ou par défaut, met à jour la prévisualisation et émet onPartShoppingPartInstalled.

- `part` (*table*) : Pièce de la boutique (containingSlot, name, partPath, finalValue...).

#### `career_modules_partShopping.installPartByPartShopId(partShopId)`

Installe la pièce de la boutique identifiée par son partShopId.

- `partShopId` (*integer*) : Identifiant de la pièce dans partsInShop.

#### `career_modules_partShopping.isShoppingSessionActive()`

Indique si une session d'achat est active.

- **renvoie** : boolean true si active.

#### `career_modules_partShopping.onComputerAddFunctions(menuData, computerFunctions)`

Hook de l'ordinateur : ajoute la fonction « personnalisation de pièces » (ordre 1) pour chaque véhicule du garage, désactivée si le véhicule est à réparer, si le véhicule de départ n'est pas acheté ou si career_modules_permissions refuse partBuying/vehicleModification.

- `menuData` (*table*) : Données du menu (computerFacility, vehiclesInGarage...).
- `computerFunctions` (*table*) : Fonctions à compléter (vehicleSpecific[inventoryId]).

#### `career_modules_partShopping.onRouteEnter(context, toRoute, fromRoute, data)`

Cycle de vie du routeur UI : mémorise la sélection (catégorie, slot, panneau) déduite de la route.

- `context` (*any*) : Contexte du routeur.
- `toRoute` (*table*) : Route cible (name, params).
- `fromRoute` (*any*) : Route précédente.
- `data` (*table*) : routeData.

#### `career_modules_partShopping.onRouteMount(context, toRoute, fromRoute, data)`

Cycle de vie du routeur UI : renormalise la sélection puis envoie les données de la boutique.

- `context` (*any*) : Contexte du routeur.
- `toRoute` (*table*) : Route cible.
- `fromRoute` (*any*) : Route précédente.
- `data` (*table*) : routeData.

#### `career_modules_partShopping.removePartBySlot(slot)`

Retire du panier la pièce du slot donné (restaure la pièce d'origine si elle convient encore au slot).

- `slot` (*string*) : Chemin du slot (containingSlot).

#### `career_modules_partShopping.startShopping(inventoryId, _originComputerId)`

Démarre une session pour un véhicule (celui donné, le courant, sinon celui du garage le plus proche). Répare d'abord par l'assurance si le véhicule est abîmé, puis prépare le panier, génère la boutique, pose la laisse, ouvre l'écran et fige le véhicule.

- `inventoryId` (*integer|nil*) : Id d'inventaire du véhicule.
- `_originComputerId` (*string|nil*) : Id de l'ordinateur d'origine (sert au retour et à la laisse).

#### `career_modules_partShopping.updatePreviewVehicle(currentPartConditions)`

Rappel appelé par le véhicule avec ses conditions de pièces après le respawn de prévisualisation : recopie l'arbre de pièces, met à jour le panier, renvoie les données à l'UI et refige le véhicule.

- `currentPartConditions` (*table|nil*) : Conditions de pièces lues sur le véhicule.

## Champs

| Champ | Type | Description |
|---|---|---|
| `dependencies` | table<integer, string> | Extensions chargées avant : career_career, gameplay_achievement. |

## Hooks émis

Évènements diffusés aux extensions par `extensions.hook` :

- `onPartShoppingCancelled` — écouté par 1 module(s)
- `onPartShoppingPartInstalled`
- `onPartShoppingStarted` — écouté par 2 module(s)
- `onPartShoppingTransactionComplete` — écouté par 2 module(s)

**Évènements UI (guihooks.trigger) :** `partShoppingData`, `partShoppingRequestExit`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/career/modules/partShopping.lua`.*

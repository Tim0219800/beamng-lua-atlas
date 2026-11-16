# `career_modules_tuning`

*Fichier : `lua/ge/extensions/career/modules/tuning.lua` · VM : Game Engine (GE) · 412 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `career_modules_tuning` : `extensions.load("career_modules_tuning")`, puis la globale `career_modules_tuning`

Menu de réglage (tuning) d'un véhicule d'inventaire en carrière, depuis l'ordinateur du garage. Il lit les variables de tuning du véhicule, applique les changements en réapparaissant le véhicule, construit un panier d'achat (catégories, sous-catégories, prix, taxes de 7 %) envoyé à l'UI, et débite l'argent à la validation. Une laisse (tether) capsule annule les achats si le joueur s'éloigne du garage.

## Remarques

- Les prix sont codés en dur dans la table locale `prices` (100 par défaut pour suspension/roues/alignement/châssis, 500 pour la transmission, 200 par défaut) ; la catégorie, la sous-catégorie et chaque variable peuvent s'additionner.
- Variables exclues du panier (prix 0) : $$ffbstrength, $tirepressure_F et $tirepressure_R. Variables masquées en carrière : $fuel, $fuel_R, $fuel_L et la catégorie Cargo.
- Total = somme des prix + 7 % de taxes. L'achat appelle invalidateCertification, setVehicleDirty, retire l'argent (tags tuning/buying) et débloque le succès VEHICLE_TUNED.
- Le véhicule est gelé (setFreeze) pendant le menu et dégelé à la fermeture.
- Dans onComputerAddFunctions, la variable `buttonDisabled` n'est pas définie dans le fichier (vaut nil).

**Dépendances (chargées avant) :** `career_career`, `gameplay_achievement`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `career_modules_tuning.apply(tuningValues, callback)` | Fusionne de nouvelles valeurs de tuning dans la config du véhicule, le refait apparaître à la même position et rotation, le gèle, déclenche le hook onCareerTuningApplied, met à jour les variables modifiées et recalcule le panier. | 310 |
| `career_modules_tuning.applyShopping()` | Valide l'achat : invalide la certification, marque le véhicule modifié, débite le total, débloque le succès, joue le son, puis sauvegarde (si autosave) avant de fermer, sinon ferme directement. | 152 |
| `career_modules_tuning.cancelShopping()` | Annule : réapplique les variables d'origine puis ferme le menu. Appelé aussi par la laisse quand le joueur s'éloigne. | 346 |
| `career_modules_tuning.close()` | Ferme le menu : retourne au menu de l'ordinateur (ou ferme tous les menus de carrière), dégèle le véhicule et retire la laisse. | 350 |
| `career_modules_tuning.getTuningData()` | Retourne les données de tuning du véhicule courant (variables traduites par core_vehicle_partmgmt), sans les variables masquées en carrière. | 183 |
| `career_modules_tuning.onComputerAddFunctions(menuData, computerFunctions)` | Hook de l'ordinateur du garage : ajoute le bouton « tuning » pour chaque véhicule du garage. Désactivé si le véhicule doit être réparé, si le véhicule de départ n'est pas acheté ou si les permissions refusent les tags tuning/vehicleModification. *(interne)* *(hook)* | 364 |
| `career_modules_tuning.onVehicleSaveFinished()` | Hook appelé à la fin de la sauvegarde d'un véhicule ; ferme le menu si la fermeture attendait la sauvegarde. *(interne)* *(hook)* | 168 |
| `career_modules_tuning.removeVarFromShoppingCart(varName)` | Remet une variable à sa valeur d'origine, la retire du panier et envoie l'UI (updateTuningVariable). | 333 |
| `career_modules_tuning.start(_inventoryId, _originComputerId)` | Ouvre le tuning pour un véhicule d'inventaire. Mémorise les variables d'origine, complète les valeurs par défaut manquantes, propose une réparation si peu de pièces sont cassées (sous le seuil de valueCalculator), puis navigue vers career.computer.tuning, crée le panier et la laisse. Ne fait rien si le véhicule n'est pas apparu dans la carte. | 289 |

### Détail des paramètres

#### `career_modules_tuning.apply(tuningValues, callback)`

Fusionne de nouvelles valeurs de tuning dans la config du véhicule, le refait apparaître à la même position et rotation, le gèle, déclenche le hook onCareerTuningApplied, met à jour les variables modifiées et recalcule le panier.

- `tuningValues` (*table<string, number>*) : Variables de tuning (ex. "$gear_1") et leur valeur.
- `callback` (*function|nil*) : Passé à career_modules_inventory.spawnVehicle.

#### `career_modules_tuning.getTuningData()`

Retourne les données de tuning du véhicule courant (variables traduites par core_vehicle_partmgmt), sans les variables masquées en carrière.

- **renvoie** : table|nil Variables de tuning, ou nil si le véhicule n'est pas trouvé.

#### `career_modules_tuning.onComputerAddFunctions(menuData, computerFunctions)`

Hook de l'ordinateur du garage : ajoute le bouton « tuning » pour chaque véhicule du garage. Désactivé si le véhicule doit être réparé, si le véhicule de départ n'est pas acheté ou si les permissions refusent les tags tuning/vehicleModification.

- `menuData` (*table*) : Données du menu (computerFacility, vehiclesInGarage, hasBoughtStarterVehicle).
- `computerFunctions` (*table*) : Table à remplir (vehicleSpecific[inventoryId][id]).

#### `career_modules_tuning.removeVarFromShoppingCart(varName)`

Remet une variable à sa valeur d'origine, la retire du panier et envoie l'UI (updateTuningVariable).

- `varName` (*string*) : Nom de la variable de tuning.

#### `career_modules_tuning.start(_inventoryId, _originComputerId)`

Ouvre le tuning pour un véhicule d'inventaire. Mémorise les variables d'origine, complète les valeurs par défaut manquantes, propose une réparation si peu de pièces sont cassées (sous le seuil de valueCalculator), puis navigue vers career.computer.tuning, crée le panier et la laisse. Ne fait rien si le véhicule n'est pas apparu dans la carte.

- `_inventoryId` (*integer|nil*) : Id d'inventaire ; par défaut, le premier du garage le plus proche.
- `_originComputerId` (*any*) : Id de l'ordinateur du garage d'origine (sinon pas d'UI ni de laisse).

## Champs

| Champ | Type | Description |
|---|---|---|
| `dependencies` | string[] | {"career_career", "gameplay_achievement"}. |

## Hooks émis

Évènements diffusés aux extensions par `extensions.hook` :

- `onCareerTuningApplied`
- `onCareerTuningStarted` — écouté par 1 module(s)

**Évènements UI (guihooks.trigger) :** `sendTuningShoppingData`, `updateTuningVariable`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/career/modules/tuning.lua`.*

# `career_modules_insurance_repairScreen`

*Fichier : `lua/ge/extensions/career/modules/insurance/repairScreen.lua` · VM : Game Engine (GE) · 224 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `career_modules_insurance_repairScreen` : `extensions.load("career_modules_insurance_repairScreen")`, puis la globale `career_modules_insurance_repairScreen`

Prépare les données et gère l'ouverture/fermeture de l'écran de réparation (route UI career.computer.repair) accessible depuis l'ordinateur du garage en carrière. Il construit les options de réparation avec ou sans assurance (coût des dégâts, délais de réparation de instantané à 10 minutes, franchise, prime actuelle et future après réclamation, score de conducteur), ajoute la fonction « Réparer » aux fonctions de l'ordinateur et applique une laisse (tether) de 7 m autour de l'ordinateur.

## Remarques

- Délais de réparation sans assurance (premiumInfluence = supplément en argent) : instantané 500, 2 min 350, 5 min 150, 10 min 50 ; prix total = supplément + coût des dégâts.
- Avec assurance, seule l'option de délai incluse dans le contrat et l'option instantanée sont proposées ; l'option incluse ne coûte que la franchise, l'instantanée coûte franchise + 500 (sauf perk instantRepair gratuit).
- futureDriverScore baisse de 1 après une réclamation, sauf s'il reste des 'accidentForgiveness' sur le contrat.
- startRepairInGarage bloque les appels répétés (closeMenuAfterSaving) jusqu'à onVehicleSaveFinished : une réparation instantanée enregistre une nouvelle vignette de véhicule qui masque l'UI.
- Le module n'a pas de fonction d'initialisation : l'état (véhicule, ordinateur d'origine, tether) est défini par openRepairMenu.
- getRepairData suppose que openRepairMenu a été appelé avant (vehicleToRepairData non nil), sinon plante.

**Dépendances (chargées avant) :** `career_modules_valueCalculator`, `career_modules_inventory`, `career_modules_playerAttributes`, `career_modules_payment`, `career_modules_insurance_insurance`, `career_modules_tether`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `career_modules_insurance_repairScreen.closeMenu()` | Appelé par l'UI pour fermer l'écran ; ignoré tant qu'une sauvegarde de véhicule après réparation est en cours. | 196 |
| `career_modules_insurance_repairScreen.closeRepairMenu()` | Ferme l'écran : revient au menu de l'ordinateur d'origine, ou ferme tous les menus carrière. | 34 |
| `career_modules_insurance_repairScreen.getRepairData()` | Construit les données de l'écran : repairOptions (noInsuranceRepairData, insuranceRepairData avec prime, franchise, renouvellement, tolérances), vehicleData (coût des dégâts, nom, valeur initiale, vignette, assuré), attributs du joueur, paliers et score de conducteur actuel et futur. | 96 |
| `career_modules_insurance_repairScreen.onComputerAddFunctions(menuData, computerFunctions)` | Hook de l'ordinateur du garage : ajoute la fonction « repair » pour chaque véhicule du garage (désactivée avant l'achat du véhicule de départ ou si les permissions 'vehicleRepair' l'interdisent). *(interne)* *(hook)* | 43 |
| `career_modules_insurance_repairScreen.onMenuClosed()` | Hook de fermeture de menu : retire la laisse. *(interne)* *(hook)* | 188 |
| `career_modules_insurance_repairScreen.onVehicleSaveFinished()` | Hook de fin de sauvegarde du véhicule : si une réparation attendait cette fin, referme l'écran. *(interne)* *(hook)* | 207 |
| `career_modules_insurance_repairScreen.openRepairMenu(vehicle, _originComputerId)` | Ouvre l'écran de réparation d'un véhicule. Si un ordinateur d'origine est donné, démarre une laisse (porte ou sphère, 7 m) qui ferme les menus si le joueur s'éloigne. | 13 |
| `career_modules_insurance_repairScreen.startRepairInGarage(invVehId, repairOptionData)` | Lance la réparation via career_modules_insurance_insurance.startRepairInGarage et attend la fin de la sauvegarde du véhicule avant de refermer l'écran. | 201 |

### Détail des paramètres

#### `career_modules_insurance_repairScreen.getRepairData()`

Construit les données de l'écran : repairOptions (noInsuranceRepairData, insuranceRepairData avec prime, franchise, renouvellement, tolérances), vehicleData (coût des dégâts, nom, valeur initiale, vignette, assuré), attributs du joueur, paliers et score de conducteur actuel et futur.

- **renvoie** : table Données pour l'UI.

#### `career_modules_insurance_repairScreen.onComputerAddFunctions(menuData, computerFunctions)`

Hook de l'ordinateur du garage : ajoute la fonction « repair » pour chaque véhicule du garage (désactivée avant l'achat du véhicule de départ ou si les permissions 'vehicleRepair' l'interdisent).

- `menuData` (*table*) : Données du menu (computerFacility, vehiclesInGarage, hasBoughtStarterVehicle).
- `computerFunctions` (*table*) : Fonctions à compléter (vehicleSpecific[inventoryId][id]).

#### `career_modules_insurance_repairScreen.openRepairMenu(vehicle, _originComputerId)`

Ouvre l'écran de réparation d'un véhicule. Si un ordinateur d'origine est donné, démarre une laisse (porte ou sphère, 7 m) qui ferme les menus si le joueur s'éloigne.

- `vehicle` (*table*) : Données du véhicule d'inventaire à réparer.
- `_originComputerId` (*string|nil*) : Identifiant de l'ordinateur du garage qui a ouvert l'écran.

#### `career_modules_insurance_repairScreen.startRepairInGarage(invVehId, repairOptionData)`

Lance la réparation via career_modules_insurance_insurance.startRepairInGarage et attend la fin de la sauvegarde du véhicule avant de refermer l'écran.

- `invVehId` (*integer*) : Identifiant du véhicule d'inventaire.
- `repairOptionData` (*table*) : Option de réparation choisie (assurance ou non, délai).

## Champs

| Champ | Type | Description |
|---|---|---|
| `dependencies` | table<integer, string> | Extensions chargées avant : valueCalculator, inventory, playerAttributes, payment, insurance_insurance, tether, etc. |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/career/modules/insurance/repairScreen.lua`.*

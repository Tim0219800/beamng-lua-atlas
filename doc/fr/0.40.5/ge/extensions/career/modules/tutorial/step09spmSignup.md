# `career_modules_tutorial_step09spmSignup`

*Fichier : `lua/ge/extensions/career/modules/tutorial/step09spmSignup.lua` · VM : Game Engine (GE) · 320 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `career_modules_tutorial_step09spmSignup` : `extensions.load("career_modules_tutorial_step09spmSignup")`, puis la globale `career_modules_tutorial_step09spmSignup`

Étape 9 et dernière du tutoriel de carrière (« spmSignup ») : le joueur accède à l'ordinateur du garage, signe le contrat d'embauche (popup de contrat, prime de départ de 10 000), ouvre la boutique de véhicules, choisit un vendeur, ouvre l'écran d'achat et achète son premier véhicule. À l'ajout au inventaire, la popup v2/careerUnlocked s'affiche, puis career_modules_tutorial.endTutorial() est appelé. Le véhicule du tutoriel est supprimé à l'ouverture de l'écran d'achat.

## Remarques

- Phases (chaînes) : waitComputer, waitApmPopup, waitMarketplaceOpen, waitSellerSelect, waitPurchaseMenu, waitVehicleAdded, waitCareerUnlocked.
- La prime STARTING_BONUS_MONEY = 10000 est créditée une seule fois (tags tutorial/startingBonus), avec un son d'argent ; elle est déclenchée à la fermeture de la popup contractSign ou par onCareerTutorialRedeemedContractVoucher.
- Succès débloqués : WELCOME_TO_APM (signature), FIRST_ROLLOUT (fin), EXTRA_CREDIT si career_modules_tutorial.playedAdvancedTimeTrial est vrai (champ posé dynamiquement par l'étape 4).
- Les hooks onVehicleShopping* et onVehicleAddedToInventory sont émis par le module career_modules_vehicleShopping et l'inventaire.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `career_modules_tutorial_step09spmSignup.cleanup()` | Supprime marqueur et son d'argent, vide zones, reset et liste de tâches. *(interne)* | 291 |
| `career_modules_tutorial_step09spmSignup.onCareerTutorialRedeemedContractVoucher()` | Hook émis quand le bon de contrat est utilisé : crédite la prime de départ. *(interne)* *(hook)* | 202 |
| `career_modules_tutorial_step09spmSignup.onComputerMenuOpened()` | Hook émis à l'ouverture du menu de l'ordinateur : valide l'objectif et ouvre la popup de signature du contrat (utilisateur = profil courant). *(interne)* *(hook)* | 171 |
| `career_modules_tutorial_step09spmSignup.onDebugMenu(im)` | Affiche la phase et un bouton « Skip Step 9 » (valide tous les objectifs et ouvre la popup careerUnlocked). *(interne)* *(hook)* | 305 |
| `career_modules_tutorial_step09spmSignup.onGetRawPoiListForTutorial(elements)` | Ajoute à la liste de POI l'ordinateur du garage (facilité servicestationGarageComputer) pendant l'étape 09spmSignup. *(interne)* *(hook)* | 283 |
| `career_modules_tutorial_step09spmSignup.onIntroPopupCareerClosed(id)` | Hook de fermeture de popup : contractSign (prime + succès), v2/apmOnboarding (objectif d'ouverture du marché) et v2/careerUnlocked (succès puis fin du tutoriel). *(interne)* *(hook)* | 207 |
| `career_modules_tutorial_step09spmSignup.onUpdate(dtReal, dtSim, dtRaw)` | Appelé chaque frame (phase waitComputer) : masque le marqueur d'entrée à moins de 3 m et efface le tracé de guidage à moins de 1 m du point de départ de marche. *(interne)* *(hook)* | 186 |
| `career_modules_tutorial_step09spmSignup.onVehicleAddedToInventory(data)` | Hook émis quand un véhicule est ajouté à l'inventaire : désactive zones et reset, valide l'objectif final et affiche la popup v2/careerUnlocked. *(interne)* *(hook)* | 266 |
| `career_modules_tutorial_step09spmSignup.onVehicleShoppingMenuOpened(data)` | Hook émis à l'ouverture de la boutique de véhicules : valide l'objectif et demande de choisir un vendeur. *(interne)* *(hook)* | 235 |
| `career_modules_tutorial_step09spmSignup.onVehicleShoppingPurchaseMenuOpened(data)` | Hook émis à l'ouverture de l'écran d'achat : supprime le véhicule du tutoriel et affiche la popup v2/vehiclePurchaseAndInsurance. *(interne)* *(hook)* | 253 |
| `career_modules_tutorial_step09spmSignup.onVehicleShoppingSelectedSellerIdChanged(payload)` | Hook émis quand le vendeur sélectionné change : valide l'objectif et demande d'ouvrir l'achat. *(interne)* *(hook)* | 244 |
| `career_modules_tutorial_step09spmSignup.setup(stepData)` | Appelé à l'activation : remet les objectifs à zéro, active la zone garageBounds, récupère les places garageInteriorWalkStart et garageEntranceMarker, affiche l'objectif « accéder à l'ordinateur » et le marqueur d'entrée. *(interne)* | 146 |

### Détail des paramètres

#### `career_modules_tutorial_step09spmSignup.onDebugMenu(im)`

Affiche la phase et un bouton « Skip Step 9 » (valide tous les objectifs et ouvre la popup careerUnlocked).

- `im` (*table*) : Table ui_imgui.

#### `career_modules_tutorial_step09spmSignup.onGetRawPoiListForTutorial(elements)`

Ajoute à la liste de POI l'ordinateur du garage (facilité servicestationGarageComputer) pendant l'étape 09spmSignup.

- `elements` (*table*) : Liste de POI à compléter.

#### `career_modules_tutorial_step09spmSignup.onIntroPopupCareerClosed(id)`

Hook de fermeture de popup : contractSign (prime + succès), v2/apmOnboarding (objectif d'ouverture du marché) et v2/careerUnlocked (succès puis fin du tutoriel).

- `id` (*string*) : Id de la popup.

#### `career_modules_tutorial_step09spmSignup.onUpdate(dtReal, dtSim, dtRaw)`

Appelé chaque frame (phase waitComputer) : masque le marqueur d'entrée à moins de 3 m et efface le tracé de guidage à moins de 1 m du point de départ de marche.

- `dtReal` (*number*) : Delta temps réel (s).
- `dtSim` (*number*) : Delta simulation (s).
- `dtRaw` (*number*) : Delta brut (s).

#### `career_modules_tutorial_step09spmSignup.onVehicleAddedToInventory(data)`

Hook émis quand un véhicule est ajouté à l'inventaire : désactive zones et reset, valide l'objectif final et affiche la popup v2/careerUnlocked.

- `data` (*any*) : Données du véhicule ajouté (non utilisées).

#### `career_modules_tutorial_step09spmSignup.onVehicleShoppingMenuOpened(data)`

Hook émis à l'ouverture de la boutique de véhicules : valide l'objectif et demande de choisir un vendeur.

- `data` (*any*) : Données du menu (non utilisées).

#### `career_modules_tutorial_step09spmSignup.onVehicleShoppingPurchaseMenuOpened(data)`

Hook émis à l'ouverture de l'écran d'achat : supprime le véhicule du tutoriel et affiche la popup v2/vehiclePurchaseAndInsurance.

- `data` (*any*) : Données du menu (non utilisées).

#### `career_modules_tutorial_step09spmSignup.onVehicleShoppingSelectedSellerIdChanged(payload)`

Hook émis quand le vendeur sélectionné change : valide l'objectif et demande d'ouvrir l'achat.

- `payload` (*any*) : Données du changement (non utilisées).

#### `career_modules_tutorial_step09spmSignup.setup(stepData)`

Appelé à l'activation : remet les objectifs à zéro, active la zone garageBounds, récupère les places garageInteriorWalkStart et garageEntranceMarker, affiche l'objectif « accéder à l'ordinateur » et le marqueur d'entrée.

- `stepData` (*any*) : Données de l'étape (non utilisées).

**Évènements UI (guihooks.trigger) :** `ClearTasklist`, `careerStatusDataUpdated`

## Appels vers le moteur (C++)

- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/career/modules/tutorial/step09spmSignup.lua`.*

# `career_modules_tutorial_step01enterVehicle`

*Fichier : `lua/ge/extensions/career/modules/tutorial/step01enterVehicle.lua` · VM : Game Engine (GE) · 234 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `career_modules_tutorial_step01enterVehicle` : `extensions.load("career_modules_tutorial_step01enterVehicle")`, puis la globale `career_modules_tutorial_step01enterVehicle`

Étape 1 du tutoriel de carrière (« enterVehicle ») : le joueur monte dans le véhicule du tutoriel, apprend les commandes de base (accélérer, freiner, tourner, objectifs validés à 0,75 / 0,75 / 0,5 de la valeur d'entrée), choisit son mode de boîte via une popup d'aides à la conduite, puis l'étape 02moveOff est activée. Fonctionne par phases : waitVehicleSetup, getInCar, waitBasicControlsPopup, controls, shiftMode, waitBeginFirstChallenge. Extension chargée par gameplay_tutorial_runtime (préfixe career_modules_tutorial_step).

## Remarques

- Les hooks setup, cleanup, onUpdate, onCareerTutorialLeftBounds et onDebugMenu sont appelés par le runtime du tutoriel ; onIntroPopupCareerClosed et onShiftModeSelectedViaPopup sont émis par les popups / l'UI (GearboxSelect.vue).
- Sorties de zone : la première utilise un reset instantané au départ, les suivantes un reset avec fondu.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `career_modules_tutorial_step01enterVehicle.cleanup()` | Appelé à la fin de l'étape ou du tutoriel : retire le gestionnaire de sortie de zone et le marqueur au-dessus du véhicule. *(interne)* | 131 |
| `career_modules_tutorial_step01enterVehicle.onCareerTutorialLeftBounds()` | Hook émis quand le joueur quitte la zone autorisée : reset de position immédiat une seule fois au démarrage, puis reset standard de l'étape. *(interne)* *(hook)* | 59 |
| `career_modules_tutorial_step01enterVehicle.onDebugMenu(im)` | Ajoute au menu de debug un bouton « Skip Step 1 » (met le joueur au volant, allume le moteur, passe à l'étape suivante). *(interne)* *(hook)* | 226 |
| `career_modules_tutorial_step01enterVehicle.onIntroPopupCareerClosed(id)` | Hook émis à la fermeture d'une popup d'intro. Selon l'id : v2/approachVehicle affiche l'objectif « monter dans la voiture » et un marqueur ; v2/basicControls active le suivi des entrées et allume le moteur ; v2/beginFirstChallenge active l'étape 02moveOff. *(interne)* *(hook)* | 142 |
| `career_modules_tutorial_step01enterVehicle.onShiftModeSelectedViaPopup(data)` | Appelé depuis GearboxSelect.vue quand le joueur confirme le mode de boîte (phase shiftMode) : applique setGearboxMode sur le véhicule puis affiche la popup beginFirstChallenge. *(interne)* *(hook)* | 183 |
| `career_modules_tutorial_step01enterVehicle.onUpdate(dtReal, dtSim, dtRaw)` | Appelé chaque frame pendant l'étape. Gère les phases : lance les popups d'introduction, détecte que le joueur est monté (gameplay_walk), puis valide les objectifs throttle/brake/steer et ouvre la popup d'aides à la conduite. *(interne)* *(hook)* | 70 |
| `career_modules_tutorial_step01enterVehicle.setup(stepData)` | Appelé à l'activation de l'étape : remet les objectifs à zéro, passe en phase waitVehicleSetup, installe le gestionnaire de sortie de zone (retour au départ du parking), active la zone evalZone, le suivi de dégâts, les réglages de récupération du tutoriel et affiche l'app de tâches. *(interne)* | 36 |

### Détail des paramètres

#### `career_modules_tutorial_step01enterVehicle.onDebugMenu(im)`

Ajoute au menu de debug un bouton « Skip Step 1 » (met le joueur au volant, allume le moteur, passe à l'étape suivante).

- `im` (*table*) : Table ui_imgui.

#### `career_modules_tutorial_step01enterVehicle.onIntroPopupCareerClosed(id)`

Hook émis à la fermeture d'une popup d'intro. Selon l'id : v2/approachVehicle affiche l'objectif « monter dans la voiture » et un marqueur ; v2/basicControls active le suivi des entrées et allume le moteur ; v2/beginFirstChallenge active l'étape 02moveOff.

- `id` (*string*) : Id de la popup (ex. "v2/basicControls").

#### `career_modules_tutorial_step01enterVehicle.onShiftModeSelectedViaPopup(data)`

Appelé depuis GearboxSelect.vue quand le joueur confirme le mode de boîte (phase shiftMode) : applique setGearboxMode sur le véhicule puis affiche la popup beginFirstChallenge.

- `data` (*table*) : Table avec le champ mode (mode de boîte choisi).

#### `career_modules_tutorial_step01enterVehicle.onUpdate(dtReal, dtSim, dtRaw)`

Appelé chaque frame pendant l'étape. Gère les phases : lance les popups d'introduction, détecte que le joueur est monté (gameplay_walk), puis valide les objectifs throttle/brake/steer et ouvre la popup d'aides à la conduite.

- `dtReal` (*number*) : Delta temps réel (s).
- `dtSim` (*number*) : Delta simulation (s).
- `dtRaw` (*number*) : Delta brut (s).

#### `career_modules_tutorial_step01enterVehicle.setup(stepData)`

Appelé à l'activation de l'étape : remet les objectifs à zéro, passe en phase waitVehicleSetup, installe le gestionnaire de sortie de zone (retour au départ du parking), active la zone evalZone, le suivi de dégâts, les réglages de récupération du tutoriel et affiche l'app de tâches.

- `stepData` (*any*) : Données de l'étape fournies par le runtime (non utilisées).

**Évènements UI (guihooks.trigger) :** `ClearTasklist`

## Appels vers le moteur (C++)

- `be:` `getPlayerVehicleID`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/career/modules/tutorial/step01enterVehicle.lua`.*

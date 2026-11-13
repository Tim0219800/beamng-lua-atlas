# `career_modules_tutorial_step08driveToGarage`

*Fichier : `lua/ge/extensions/career/modules/tutorial/step08driveToGarage.lua` · VM : Game Engine (GE) · 360 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `career_modules_tutorial_step08driveToGarage` : `extensions.load("career_modules_tutorial_step08driveToGarage")`, puis la globale `career_modules_tutorial_step08driveToGarage`

Étape 8 du tutoriel de carrière (« driveToGarage ») : le joueur conduit jusqu'au garage, se gare sur la place garageExteriorPark (immobile 1 s, à moins de 25 m pour déclencher la phase de parking), puis sort du véhicule (mode marche). Phases : driveToGarage, parkAtGarage, hopOut, waitArrivalPopups. Deux popups d'arrivée (v2/garageArrivalIntro1 et 2) concluent l'étape, puis le guidage mène au point garageInteriorWalkStart.

## Remarques

- Trois zones driveToGarageZone1 à 3 servent de points de reprise : en cas de sortie de zone, le véhicule est replacé sur la place driveToGarageReset<N> du dernier checkpoint atteint.
- Si aucune zone de reprise n'existe dans les sites du tutoriel, les zones actives sont vidées et aucun reset n'est installé.
- Une fois garé : moteur coupé, véhicule gelé et mis sur liste noire pour la marche (joueur non remontable), suivi de dégâts désactivé à la sortie.
- Au début de l'étape, la course de drag éventuelle est arrêtée (gameplay_drag_dragBridge.stopDragRace).

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `career_modules_tutorial_step08driveToGarage.cleanup()` | Retire le reset de zone, débloque la marche, vide les tâches et supprime les visuels du parking. *(interne)* | 325 |
| `career_modules_tutorial_step08driveToGarage.onCareerTutorialLeftBounds()` | Hook de sortie de zone : lance le reset de sortie de zone de l'étape. *(interne)* *(hook)* | 258 |
| `career_modules_tutorial_step08driveToGarage.onDebugMenu(im)` | Affiche la phase et un bouton « Skip Step 8 » (téléporte au garage, passe en mode marche, avance). *(interne)* *(hook)* | 333 |
| `career_modules_tutorial_step08driveToGarage.onIntroPopupCareerClosed(id)` | Hook de fermeture de popup : à la fermeture de v2/garageArrivalIntro2 (phase waitArrivalPopups), trace la route vers l'intérieur du garage et programme l'avance d'étape après 1 s. *(interne)* *(hook)* | 262 |
| `career_modules_tutorial_step08driveToGarage.onUpdate(dtReal, dtSim, dtRaw)` | Appelé chaque frame : met à jour le checkpoint de reprise, gère les phases conduite / parking / sortie du véhicule. *(interne)* *(hook)* | 272 |
| `career_modules_tutorial_step08driveToGarage.setup(stepData)` | Appelé à l'activation : arrête le drag, retrouve le véhicule joueur, les places et zones du garage, installe zones et reset, autorise la marche et l'entrée dans le véhicule, crée le marqueur et affiche l'objectif. *(interne)* | 181 |

### Détail des paramètres

#### `career_modules_tutorial_step08driveToGarage.onDebugMenu(im)`

Affiche la phase et un bouton « Skip Step 8 » (téléporte au garage, passe en mode marche, avance).

- `im` (*table*) : Table ui_imgui.

#### `career_modules_tutorial_step08driveToGarage.onIntroPopupCareerClosed(id)`

Hook de fermeture de popup : à la fermeture de v2/garageArrivalIntro2 (phase waitArrivalPopups), trace la route vers l'intérieur du garage et programme l'avance d'étape après 1 s.

- `id` (*string*) : Id de la popup.

#### `career_modules_tutorial_step08driveToGarage.onUpdate(dtReal, dtSim, dtRaw)`

Appelé chaque frame : met à jour le checkpoint de reprise, gère les phases conduite / parking / sortie du véhicule.

- `dtReal` (*number*) : Delta temps réel (s).
- `dtSim` (*number*) : Delta simulation (s).
- `dtRaw` (*number*) : Delta brut (s).

#### `career_modules_tutorial_step08driveToGarage.setup(stepData)`

Appelé à l'activation : arrête le drag, retrouve le véhicule joueur, les places et zones du garage, installe zones et reset, autorise la marche et l'entrée dans le véhicule, crée le marqueur et affiche l'objectif.

- `stepData` (*any*) : Données de l'étape (non utilisées).

**Évènements UI (guihooks.trigger) :** `ClearTasklist`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/career/modules/tutorial/step08driveToGarage.lua`.*

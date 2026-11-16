# `career_modules_tutorial_step06dragStripBasics`

*Fichier : `lua/ge/extensions/career/modules/tutorial/step06dragStripBasics.lua` · VM : Game Engine (GE) · 649 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `career_modules_tutorial_step06dragStripBasics` : `extensions.load("career_modules_tutorial_step06dragStripBasics")`, puis la globale `career_modules_tutorial_step06dragStripBasics`

Étape 6 du tutoriel de carrière (« dragStripBasics ») : apprendre une course de drag. Le joueur se place (staging), attend le compte à rebours, part, atteint la ligne d'arrivée, puis une popup de bulletin de temps (timeslip) conclut l'étape. Gère aussi les disqualifications (faux départ ou sortie de voie), des popups de coaching qui mettent le jeu en pause (simTimeAuthority) et un ralenti à la fin du compte à rebours. Les hooks dragRaceStarted, dragRaceEndLineReached, onDragRacersSetup et onRacerPhaseTransition sont émis par gameplay_drag_*.

## Remarques

- Phases internes : waitIntroPopup, active, waitDqPopup, waitFalseStartRestage, waitTimeslipPopup.
- Après 3 échecs depuis la dernière réinitialisation, les popups de coaching (approche, compte à rebours) sont de nouveau autorisées.
- Une disqualification pour faux départ amène à un objectif « retourner au staging » ; une sortie de voie provoque un reset avec fondu sur la place dragStripResetSpot puis un redémarrage de la tentative (attente de 2,5 s).
- Les hooks de course ne comptent que si l'étape courante est 06dragStripBasics, si le véhicule est celui du tutoriel et si le joueur est dans les limites.
- Ralenti de fin de compte à rebours : le temps de simulation passe de 0,1 à 0,75 sur 2 s (courbe quadratique), puis revient à 1.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `career_modules_tutorial_step06dragStripBasics.cleanup()` | Retire le reset de zone, lève la pause, remet le temps de simulation à 1 et supprime marqueurs, guidage et tâches. *(interne)* | 609 |
| `career_modules_tutorial_step06dragStripBasics.dragRaceEndLineReached(vehId)` | Hook émis à l'arrivée du véhicule : démarre le flux de disqualification si le pilote est disqualifié, sinon valide l'objectif d'arrivée et ouvre la popup de timeslip après 2 s. *(interne)* | 506 |
| `career_modules_tutorial_step06dragStripBasics.dragRaceStarted(vehId)` | Hook émis au départ réel de la course : valide les objectifs « se placer » et « partir ». *(interne)* | 493 |
| `career_modules_tutorial_step06dragStripBasics.onCareerTutorialLeftBounds()` | Hook de sortie de zone : lance le reset de sortie de zone de l'étape. *(interne)* *(hook)* | 412 |
| `career_modules_tutorial_step06dragStripBasics.onDebugMenu(im)` | Affiche la phase et l'état des objectifs ; bouton « Skip Step 6 » (marque tout comme fait et avance). *(interne)* *(hook)* | 626 |
| `career_modules_tutorial_step06dragStripBasics.onDragRacersSetup(data)` | Hook émis quand les coureurs sont remis en place pour une nouvelle tentative : valide l'objectif « retourner au staging » après un faux départ et relance la tentative après 1 s. *(interne)* *(hook)* | 594 |
| `career_modules_tutorial_step06dragStripBasics.onIntroPopupCareerClosed(id)` | Hook de fermeture de popup : fait avancer la machine d'état (accueil terminé -> affiche les objectifs ; popup de disqualification -> reset ou retour au staging ; timeslip -> avance à l'étape suivante ; coaching -> reprise de la pause et éventuel ralenti). *(interne)* *(hook)* | 416 |
| `career_modules_tutorial_step06dragStripBasics.onRacerPhaseTransition(vehId, oldPhase, newPhase, newPhaseName)` | Hook de gameplay_drag : à la phase compte à rebours, valide l'objectif « se placer » et ouvre la popup de coaching du compte à rebours (une fois). *(interne)* *(hook)* | 477 |
| `career_modules_tutorial_step06dragStripBasics.onUpdate(dtReal, dtSim, dtRaw)` | Appelé chaque frame : gère le ralenti de départ, déclenche la popup d'approche à moins de 15 m de la ligne de départ, masque le marqueur de ligne à moins de 5 m, et détecte les disqualifications. *(interne)* *(hook)* | 543 |
| `career_modules_tutorial_step06dragStripBasics.setup(stepData)` | Appelé à l'activation : réinitialise l'état, active les zones drivingToDragBounds et dragStripBounds, retrouve les places beforeDragStrip et dragStartLine, affiche la popup d'accueil v2/dragStripWelcome, bascule les préfabriqués et crée les marqueurs de direction (dragGuide1 à 3). *(interne)* | 359 |

### Détail des paramètres

#### `career_modules_tutorial_step06dragStripBasics.dragRaceEndLineReached(vehId)`

Hook émis à l'arrivée du véhicule : démarre le flux de disqualification si le pilote est disqualifié, sinon valide l'objectif d'arrivée et ouvre la popup de timeslip après 2 s.

- `vehId` (*integer*) : Id du véhicule.

#### `career_modules_tutorial_step06dragStripBasics.dragRaceStarted(vehId)`

Hook émis au départ réel de la course : valide les objectifs « se placer » et « partir ».

- `vehId` (*integer*) : Id du véhicule.

#### `career_modules_tutorial_step06dragStripBasics.onDebugMenu(im)`

Affiche la phase et l'état des objectifs ; bouton « Skip Step 6 » (marque tout comme fait et avance).

- `im` (*table*) : Table ui_imgui.

#### `career_modules_tutorial_step06dragStripBasics.onDragRacersSetup(data)`

Hook émis quand les coureurs sont remis en place pour une nouvelle tentative : valide l'objectif « retourner au staging » après un faux départ et relance la tentative après 1 s.

- `data` (*table*) : Données de mise en place (non utilisées).

#### `career_modules_tutorial_step06dragStripBasics.onIntroPopupCareerClosed(id)`

Hook de fermeture de popup : fait avancer la machine d'état (accueil terminé -> affiche les objectifs ; popup de disqualification -> reset ou retour au staging ; timeslip -> avance à l'étape suivante ; coaching -> reprise de la pause et éventuel ralenti).

- `id` (*string*) : Id de la popup fermée.

#### `career_modules_tutorial_step06dragStripBasics.onRacerPhaseTransition(vehId, oldPhase, newPhase, newPhaseName)`

Hook de gameplay_drag : à la phase compte à rebours, valide l'objectif « se placer » et ouvre la popup de coaching du compte à rebours (une fois).

- `vehId` (*integer*) : Id du véhicule.
- `oldPhase` (*integer*) : Ancienne phase.
- `newPhase` (*integer*) : Nouvelle phase (2 = compte à rebours).
- `newPhaseName` (*string*) : Nom de la nouvelle phase (« countdown »).

#### `career_modules_tutorial_step06dragStripBasics.onUpdate(dtReal, dtSim, dtRaw)`

Appelé chaque frame : gère le ralenti de départ, déclenche la popup d'approche à moins de 15 m de la ligne de départ, masque le marqueur de ligne à moins de 5 m, et détecte les disqualifications.

- `dtReal` (*number*) : Delta temps réel (s).
- `dtSim` (*number*) : Delta simulation (s).
- `dtRaw` (*number*) : Delta brut (s).

#### `career_modules_tutorial_step06dragStripBasics.setup(stepData)`

Appelé à l'activation : réinitialise l'état, active les zones drivingToDragBounds et dragStripBounds, retrouve les places beforeDragStrip et dragStartLine, affiche la popup d'accueil v2/dragStripWelcome, bascule les préfabriqués et crée les marqueurs de direction (dragGuide1 à 3).

- `stepData` (*any*) : Données de l'étape (non utilisées).

**Évènements UI (guihooks.trigger) :** `ClearTasklist`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/career/modules/tutorial/step06dragStripBasics.lua`.*

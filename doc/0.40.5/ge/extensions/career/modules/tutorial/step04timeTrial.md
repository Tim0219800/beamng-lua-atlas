# `career_modules_tutorial_step04timeTrial`

*Fichier : `lua/ge/extensions/career/modules/tutorial/step04timeTrial.lua` · VM : Game Engine (GE) · 315 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `career_modules_tutorial_step04timeTrial` : `extensions.load("career_modules_tutorial_step04timeTrial")`, puis la globale `career_modules_tutorial_step04timeTrial`

Étape 4 du tutoriel de carrière (« timeTrial ») : une popup d'intro lance la mission contre-la-montre west_coast_usa/timeTrial/tutorialSimple, avec guidage au sol (core_groundMarkers) construit à partir des prochains pathnodes de la course. À la fin, une popup propose un défi optionnel (tutorialAdvanced) ou le passage à la suite ; l'étape avance à la fin de la mission avancée ou si le joueur choisit autre chose. Phases : waitIntro, simpleMission, waitChoicePopup, waitPostSimplePopupClose, waitChoiceSelection, advancedMission. Active la zone de limites timeTrialBounds.

## Remarques

- Si le joueur reste hors limites trop longtemps (onCareerTutorialOutOfBoundsTimedOut), la mission en cours est redémarrée (core_recoveryPrompt.buttonPressed("restartMission")) avec un message.
- À la fin de l'étape, le véhicule du tutoriel est désactivé (setActive(0)) ; il est réactivé au début de l'étape.
- À la fin de la mission avancée, le code écrit career_modules_tutorial.playedAdvancedTimeTrial = true ; ce champ n'est pas déclaré dans tutorial.lua (champ ajouté dynamiquement).
- Si la mission avancée est introuvable, une erreur est loggée et l'étape avance quand même.
- Tous les hooks de suivi ignorent les évènements si l'étape courante n'est pas 04timeTrial.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `career_modules_tutorial_step04timeTrial.cleanup()` | Appelé à la fin de l'étape : retire le reset de zone, efface le guidage et arrête la mission du tutoriel si elle est au premier plan. *(interne)* | 280 |
| `career_modules_tutorial_step04timeTrial.onAnyMissionChanged(state, mission)` | Hook émis par le gestionnaire de missions. Sur « started » de la mission simple, mémorise la course ; sur « stopped », passe à la popup de bilan (mission simple) ou avance d'étape (mission avancée). *(interne)* *(hook)* | 185 |
| `career_modules_tutorial_step04timeTrial.onCareerTutorialAdvancedOrDragSelection(choice)` | Appelé depuis OptionalChallengeSelect.vue quand le joueur choisit : « advancedTimeTrial » lance la mission avancée, tout autre choix désactive le véhicule et passe à l'étape suivante. *(interne)* *(hook)* | 257 |
| `career_modules_tutorial_step04timeTrial.onCareerTutorialLeftBounds()` | Hook de sortie de zone : lance le reset de sortie de zone de l'étape. *(interne)* *(hook)* | 276 |
| `career_modules_tutorial_step04timeTrial.onCareerTutorialOutOfBoundsTimedOut()` | Hook émis quand le joueur est resté trop longtemps hors zone : affiche un avertissement et relance la mission en cours. *(interne)* *(hook)* | 211 |
| `career_modules_tutorial_step04timeTrial.onDebugMenu(im)` | Bouton « Skip Step 4 » : arrête la mission, désactive le véhicule et avance. *(interne)* *(hook)* | 298 |
| `career_modules_tutorial_step04timeTrial.onIntroPopupCareerClosed(id)` | Hook de fermeture de popup. v2/simpleTimeTrial : démarre la mission simple et, après 0,5 s, bascule les préfabriqués de piste (tutorialTrackOpen). v2/timeTrialAssessmentComplete : ouvre la popup de choix de défi optionnel. *(interne)* *(hook)* | 146 |
| `career_modules_tutorial_step04timeTrial.onRacePathnodeReached(data)` | Hook émis à chaque pathnode atteint : met à jour le guidage pour la course simple du tutoriel. *(interne)* *(hook)* | 234 |
| `career_modules_tutorial_step04timeTrial.onRaceStarted(data)` | Hook de départ de course : si c'est la course du tutoriel simple, la mémorise et trace le guidage. *(interne)* *(hook)* | 224 |
| `career_modules_tutorial_step04timeTrial.onScreenFadeState(state)` | Hook de fondu d'écran : quand l'état vaut 3 pendant waitChoicePopup, remet l'état de jeu « career » et ouvre la popup de bilan ou de choix. *(interne)* *(hook)* | 242 |
| `career_modules_tutorial_step04timeTrial.onUpdate(dtReal, dtSim, dtRaw)` | Appelé chaque frame : pendant la mission simple, met à jour le tracé de guidage vers les prochains pathnodes (ou vers l'arrivée). *(interne)* *(hook)* | 171 |
| `career_modules_tutorial_step04timeTrial.setup(stepData)` | Appelé à l'activation : active la zone timeTrialBounds, réinitialise les états, retrouve la place simpleTimeTrialFinish, remet le joueur dans le véhicule du tutoriel et ouvre la popup v2/simpleTimeTrial. *(interne)* | 124 |

### Détail des paramètres

#### `career_modules_tutorial_step04timeTrial.onAnyMissionChanged(state, mission)`

Hook émis par le gestionnaire de missions. Sur « started » de la mission simple, mémorise la course ; sur « stopped », passe à la popup de bilan (mission simple) ou avance d'étape (mission avancée).

- `state` (*string*) : État de la mission ("started", "stopped"…).
- `mission` (*table*) : Mission concernée (id, race).

#### `career_modules_tutorial_step04timeTrial.onCareerTutorialAdvancedOrDragSelection(choice)`

Appelé depuis OptionalChallengeSelect.vue quand le joueur choisit : « advancedTimeTrial » lance la mission avancée, tout autre choix désactive le véhicule et passe à l'étape suivante.

- `choice` (*string*) : Choix du joueur ("advancedTimeTrial" ou autre).

#### `career_modules_tutorial_step04timeTrial.onDebugMenu(im)`

Bouton « Skip Step 4 » : arrête la mission, désactive le véhicule et avance.

- `im` (*table*) : Table ui_imgui.

#### `career_modules_tutorial_step04timeTrial.onIntroPopupCareerClosed(id)`

Hook de fermeture de popup. v2/simpleTimeTrial : démarre la mission simple et, après 0,5 s, bascule les préfabriqués de piste (tutorialTrackOpen). v2/timeTrialAssessmentComplete : ouvre la popup de choix de défi optionnel.

- `id` (*string*) : Id de la popup.

#### `career_modules_tutorial_step04timeTrial.onRacePathnodeReached(data)`

Hook émis à chaque pathnode atteint : met à jour le guidage pour la course simple du tutoriel.

- `data` (*table*) : Table avec le champ race.

#### `career_modules_tutorial_step04timeTrial.onRaceStarted(data)`

Hook de départ de course : si c'est la course du tutoriel simple, la mémorise et trace le guidage.

- `data` (*table*) : Table avec le champ race.

#### `career_modules_tutorial_step04timeTrial.onScreenFadeState(state)`

Hook de fondu d'écran : quand l'état vaut 3 pendant waitChoicePopup, remet l'état de jeu « career » et ouvre la popup de bilan ou de choix.

- `state` (*integer*) : État du fondu (3 = traité ici).

#### `career_modules_tutorial_step04timeTrial.onUpdate(dtReal, dtSim, dtRaw)`

Appelé chaque frame : pendant la mission simple, met à jour le tracé de guidage vers les prochains pathnodes (ou vers l'arrivée).

- `dtReal` (*number*) : Delta temps réel (s).
- `dtSim` (*number*) : Delta simulation (s).
- `dtRaw` (*number*) : Delta brut (s).

#### `career_modules_tutorial_step04timeTrial.setup(stepData)`

Appelé à l'activation : active la zone timeTrialBounds, réinitialise les états, retrouve la place simpleTimeTrialFinish, remet le joueur dans le véhicule du tutoriel et ouvre la popup v2/simpleTimeTrial.

- `stepData` (*any*) : Données de l'étape (non utilisées).

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/career/modules/tutorial/step04timeTrial.lua`.*

# `gameplay_drag_display`

*Fichier : `lua/ge/extensions/gameplay/drag/display.lua` · VM : Game Engine (GE) · 1770 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `gameplay_drag_display` : `extensions.load("gameplay_drag_display")`, puis la globale `gameplay_drag_display`

Affichage de la piste de drag : arbre de départ (feux pré-stage, stage, trois ambres, vert, rouge, bleu global, feu gagnant, feu conducteur clignotant), panneaux de chrono/vitesse (chiffres 5 par couloir, temps en 3 décimales, vitesse en mph avec 2 décimales), messages flash, repère de guidage de staging, et événements UI (guihooks) pour l'app d'arbre. Il pilote les objets de scène nommés par couloir (displayTime1..5, displaySpeed1..5, displayLight) et applique les états reçus du réseau en multijoueur. Chargée à la demande par gameplay_drag_core ; un moddeur s'en sert surtout via les hooks et pour allumer/éteindre des feux.

## Remarques

- Les chiffres des panneaux sont mis en file (queueDigitShape/applyPendingDigitShapes) car changer le shapeName recharge le mesh : tout faire sur la frame d'arrivée gèlerait le jeu.
- La vitesse affichée vient de timers en m/s multipliés par 2.23694 (mph) ; le temps est celui du timer important (importantTimerId, time_1_4 par défaut) ; rien n'est affiché tant que ce timer vaut 0.
- Deux arbres supportés : treeType '.500' (par défaut) et '.400', gérés par handle500TreeLogic / handle400TreeLogic. En MP seul l'hôte pilote les feux de décompte ; les clients appliquent l'état reçu (updateTreeLightsFromNetwork).
- Le feu conducteur clignote 6 fois à 6 Hz après l'allumage du feu gagnant.
- Séquence ambre/vert de l'arbre (lightStages) : ambre 1 à 1,0 s, ambre 2 à 1,5 s, ambre 3 à 2,0 s, vert à 2,5 s (temps du laneTimer).
- Option de jeu dragAssistStageGuideVisualizer : active le repère de guidage de staging (onPreRender).
- M.alwaysShowStageApp vaut true : l'app de staging reste visible même loin de la ligne ; si false, elle est cachée au-delà de 10 m en freeroam.
- Multiseat : les événements UI sont dupliqués par joueur sous le nom multiseatDrag.<joueur>.<événement>.
- Les fonctions onBeforeDragUnloadAllExtensions et clearAll sont la même fonction.

**Dépendances (chargées avant) :** `gameplay_drag_core`, `gameplay_drag_phaseHandlers`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `gameplay_drag_display.broadcastTreeLightStaging(visible)` | Affiche ou cache le voyant de staging de l'UI (guihook updateTreeLightStaging), et le répète pour chaque joueur multiseat. | 117 |
| `gameplay_drag_display.clearAll()` | Éteint tous les feux de l'arbre, cache les chiffres des panneaux et le repère de staging, annule un flash en cours et réinitialise la graine aléatoire. | 684 |
| `gameplay_drag_display.dragRaceEndLineReached(vehId)` | Ligne d'arrivée franchie : met à jour les panneaux (temps et vitesse) du couloir du racer. | 1651 |
| `gameplay_drag_display.dragRaceVehicleStopped()` | Véhicule arrêté après la course : envoie updateTreeLightPhase=false à l'UI. N'efface pas les résultats affichés. | 1655 |
| `gameplay_drag_display.onBeforeDragUnloadAllExtensions()` | Hook émis par core avant de décharger les extensions drag ; fait clearAll (même fonction). *(interne)* *(hook)* | 684 |
| `gameplay_drag_display.onDragClear(options)` | Hook de clear complet : vide les caches joueur, fait clearAll puis lance un flash « reset système » (feux et chiffres clignotent 2 fois puis restent éteints) à partir d'un cache de la piste. *(interne)* *(hook)* | 1724 |
| `gameplay_drag_display.onDragDataSet(data)` | Hook émis par core.setDragRaceData : construit l'arbre de feux et les chiffres de la piste. En MP, ne déclenche pas le staging et garde les chiffres de la manche précédente (réinitialise seulement les feux) ; en solo fait clearAll. *(interne)* *(hook)* | 1733 |
| `gameplay_drag_display.onDragRaceTimerUpdated(raceId, mpPlayerId, timerName, timerValue)` | Hook MP : un timer d'un pilote distant est arrivé ; met à jour ses panneaux. *(interne)* *(hook)* | 1758 |
| `gameplay_drag_display.onDragReset(options)` | Hook de reset : éteint les feux (mais garde les chiffres des résultats), annule un flash, remet à zéro les timers de couloir et les drapeaux treeStarted/raceStartBroadcasted. *(interne)* *(hook)* | 1711 |
| `gameplay_drag_display.onExtensionLoaded()` | Hook de chargement : init() puis clearAll(). *(interne)* *(hook)* | 695 |
| `gameplay_drag_display.onPreRender(dtReal, dtSim, dtRaw)` | Hook de pré-rendu : met à jour ou efface le repère de guidage de staging selon l'option dragAssistStageGuideVisualizer. *(interne)* *(hook)* | 1350 |
| `gameplay_drag_display.onUpdate(dtReal, dtSim, dtRaw)` | Hook par frame : applique les chiffres en attente, envoie les mises à jour d'arbre différées (MP), avance l'éventuel flash, vérifie la visibilité de l'app de staging, fait avancer le décompte de chaque racer et le clignotement du feu conducteur. *(interne)* *(hook)* | 1303 |
| `gameplay_drag_display.onWinnerLightOn(lane)` | Allume le feu gagnant du couloir et fait clignoter son feu conducteur. *(hook)* | 1365 |
| `gameplay_drag_display.preStageLightOff(vehId)` | Éteint le feu de pré-stage du couloir du racer et met l'UI à jour. | 1472 |
| `gameplay_drag_display.preStageLightOn(vehId)` | Allume le feu de pré-stage du couloir du racer, met l'UI à jour et affiche le message flash ui.drag.flash.preStage pour un racer jouable. | 1437 |
| `gameplay_drag_display.resetDragRaceValues()` | Remet à zéro les timers de couloir de l'arbre (laneTimer, laneTimerFlag, dialOffset) et les drapeaux treeStarted/raceStartBroadcasted de chaque racer. | 1681 |
| `gameplay_drag_display.setDisqualifiedLights(vehId)` | Éteint les ambres du racer disqualifié ; si la raison est le faux départ (redLightReason), éteint le vert et allume le rouge. Efface les panneaux, émet startRaceFromTree et affiche la raison en message flash (5 s) pour un racer jouable. | 1597 |
| `gameplay_drag_display.stageLightOff(vehId)` | Éteint le feu de stage, le feu bleu, décrémente le compteur de racers en stage et synchronise l'état (MP : drag.syncStageLightState). | 1537 |
| `gameplay_drag_display.stageLightOn(vehId)` | Allume le feu de stage du racer ; quand tous les couloirs sont en stage, allume le feu bleu. Met l'UI à jour, synchronise l'état (MP) et affiche ui.drag.flash.stage pour un racer jouable. | 1500 |
| `gameplay_drag_display.startDragCountdown(vehId, dial)` | Démarre le décompte de l'arbre pour un racer en phase 2 'countdown' : émet onDragCountdownStarted, met treeStarted à true et règle dialOffset (dial moins le temps déjà écoulé depuis le départ MP). | 1568 |
| `gameplay_drag_display.stoppingVehicleDrag(vehId)` | Affiche le message flash missions.dragRace.gameplay.inLine (5 s) pour un racer jouable. | 1644 |
| `gameplay_drag_display.updateTreeLightsFromNetwork(lane, lightState)` | Applique à un couloir l'état de feux reçu du réseau (countDownLights, stageLights) : met à jour isOn, les objets de scène, et l'UI du joueur du couloir (et multiseat). Construit l'arbre s'il n'existe pas encore. | 455 |

### Détail des paramètres

#### `gameplay_drag_display.broadcastTreeLightStaging(visible)`

Affiche ou cache le voyant de staging de l'UI (guihook updateTreeLightStaging), et le répète pour chaque joueur multiseat.

- `visible` (*boolean*) : true pour afficher.

#### `gameplay_drag_display.dragRaceEndLineReached(vehId)`

Ligne d'arrivée franchie : met à jour les panneaux (temps et vitesse) du couloir du racer.

- `vehId` (*integer*) : ID du véhicule du racer.

#### `gameplay_drag_display.onDragClear(options)`

Hook de clear complet : vide les caches joueur, fait clearAll puis lance un flash « reset système » (feux et chiffres clignotent 2 fois puis restent éteints) à partir d'un cache de la piste.

- `options` (*table*) : Options du clear (non utilisées).

#### `gameplay_drag_display.onDragDataSet(data)`

Hook émis par core.setDragRaceData : construit l'arbre de feux et les chiffres de la piste. En MP, ne déclenche pas le staging et garde les chiffres de la manche précédente (réinitialise seulement les feux) ; en solo fait clearAll.

- `data` (*table*) : Données de piste armées.

#### `gameplay_drag_display.onDragRaceTimerUpdated(raceId, mpPlayerId, timerName, timerValue)`

Hook MP : un timer d'un pilote distant est arrivé ; met à jour ses panneaux.

- `raceId` (*any*) : Identifiant de course.
- `mpPlayerId` (*any*) : Joueur MP.
- `timerName` (*string*) : Nom du timer.
- `timerValue` (*number*) : Valeur.

#### `gameplay_drag_display.onDragReset(options)`

Hook de reset : éteint les feux (mais garde les chiffres des résultats), annule un flash, remet à zéro les timers de couloir et les drapeaux treeStarted/raceStartBroadcasted.

- `options` (*table*) : Options (raceId...), non utilisées.

#### `gameplay_drag_display.onPreRender(dtReal, dtSim, dtRaw)`

Hook de pré-rendu : met à jour ou efface le repère de guidage de staging selon l'option dragAssistStageGuideVisualizer.

- `dtReal` (*number*) : Delta temps réel (s).
- `dtSim` (*number*) : Delta temps simulé (s).
- `dtRaw` (*number*) : Delta brut (s).

#### `gameplay_drag_display.onUpdate(dtReal, dtSim, dtRaw)`

Hook par frame : applique les chiffres en attente, envoie les mises à jour d'arbre différées (MP), avance l'éventuel flash, vérifie la visibilité de l'app de staging, fait avancer le décompte de chaque racer et le clignotement du feu conducteur.

- `dtReal` (*number*) : Delta temps réel (s).
- `dtSim` (*number*) : Delta temps simulé (s).
- `dtRaw` (*number*) : Delta brut (s).

#### `gameplay_drag_display.onWinnerLightOn(lane)`

Allume le feu gagnant du couloir et fait clignoter son feu conducteur.

- `lane` (*integer*) : Couloir gagnant.

#### `gameplay_drag_display.preStageLightOff(vehId)`

Éteint le feu de pré-stage du couloir du racer et met l'UI à jour.

- `vehId` (*integer*) : ID du véhicule.

#### `gameplay_drag_display.preStageLightOn(vehId)`

Allume le feu de pré-stage du couloir du racer, met l'UI à jour et affiche le message flash ui.drag.flash.preStage pour un racer jouable.

- `vehId` (*integer*) : ID du véhicule.

#### `gameplay_drag_display.setDisqualifiedLights(vehId)`

Éteint les ambres du racer disqualifié ; si la raison est le faux départ (redLightReason), éteint le vert et allume le rouge. Efface les panneaux, émet startRaceFromTree et affiche la raison en message flash (5 s) pour un racer jouable.

- `vehId` (*integer*) : ID du véhicule disqualifié.

#### `gameplay_drag_display.stageLightOff(vehId)`

Éteint le feu de stage, le feu bleu, décrémente le compteur de racers en stage et synchronise l'état (MP : drag.syncStageLightState).

- `vehId` (*integer*) : ID du véhicule.

#### `gameplay_drag_display.stageLightOn(vehId)`

Allume le feu de stage du racer ; quand tous les couloirs sont en stage, allume le feu bleu. Met l'UI à jour, synchronise l'état (MP) et affiche ui.drag.flash.stage pour un racer jouable.

- `vehId` (*integer*) : ID du véhicule.

#### `gameplay_drag_display.startDragCountdown(vehId, dial)`

Démarre le décompte de l'arbre pour un racer en phase 2 'countdown' : émet onDragCountdownStarted, met treeStarted à true et règle dialOffset (dial moins le temps déjà écoulé depuis le départ MP).

- `vehId` (*integer*) : ID du véhicule.
- `dial` (*number*) : Délai avant le début de la séquence de feux (s).

#### `gameplay_drag_display.stoppingVehicleDrag(vehId)`

Affiche le message flash missions.dragRace.gameplay.inLine (5 s) pour un racer jouable.

- `vehId` (*integer*) : ID du véhicule.

#### `gameplay_drag_display.updateTreeLightsFromNetwork(lane, lightState)`

Applique à un couloir l'état de feux reçu du réseau (countDownLights, stageLights) : met à jour isOn, les objets de scène, et l'UI du joueur du couloir (et multiseat). Construit l'arbre s'il n'existe pas encore.

- `lane` (*integer*) : Couloir.
- `lightState` (*table*) : {countDownLights = {amberLight1..3, greenLight, redLight}, stageLights = {prestageLight, stageLight}}.

## Champs

| Champ | Type | Description |
|---|---|---|
| `alwaysShowStageApp` | boolean | true par défaut : garde l'app de staging visible quelle que soit la distance à la ligne de stage. |
| `dependencies` | string[] | gameplay_drag_core, gameplay_drag_phaseHandlers. |

## Hooks émis

Évènements diffusés aux extensions par `extensions.hook` :

- `onDragCountdownStarted` — écouté par 1 module(s)
- `startRaceFromTree`

**Évènements UI (guihooks.trigger) :** `ScenarioFlashMessage`, `TopCenterAppsFlashMessage`, `updateTreeLightApp`, `updateTreeLightDistance`, `updateTreeLightPhase`, `updateTreeLightStaging`

## Appels vers le moteur (C++)

- `be:` `getPlayerVehicleID`
- `scenetree.` `findObject`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/gameplay/drag/display.lua`.*

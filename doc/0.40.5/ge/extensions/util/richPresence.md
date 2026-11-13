# `util_richPresence`

*Fichier : `lua/ge/extensions/util/richPresence.lua` · VM : Game Engine (GE) · 729 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `util_richPresence` : `extensions.load("util_richPresence")`, puis la globale `util_richPresence`

Gère la « présence enrichie » du jeu : le statut affiché dans Steam (rich presence et timeline Steam), l'activité UDS (startActivityByID) et le statut Discord. Il déduit l'activité courante (replay, mode photo, carrière et ses sous-modes, garage, mission, scénario, drag, crawl, drift, niveau, menu principal) et le texte du statut (par exemple « Playing X on Niveau with Marque Modèle »), et il ajoute des évènements à la timeline Steam (crash, rollover, tentative, tour de course, résultat…). Les fonctions set et setActivity sont remplacées par nop quand la fonction est désactivée (versions de développement ou réglage richPresence à faux).

## Exemple

```lua
print(extensions.util_richPresence.set('yolo'))
```

## Remarques

- La présence enrichie n'est active que pour une build de release (titre de fenêtre contenant RELEASE et build « shipping ») ou si UDS existe, et si le réglage richPresence est vrai ; le réglage richPresenceDiscord pilote Discord.
- M.set est défini uniquement par enableToggleableFunctions (appelé à la fin du fichier ou dans onSettingsChanged) ; sans cela il vaut nil jusque-là.
- Les activités sont des identifiants (challenge_type_*, level_*, career_*, freeroam_*, main_menu, etc.) ; un type de mission ou un niveau inconnu retombe sur challenge_generic ou level_generic.
- Le niveau « gridmap » correspond à l'activité level_gridmap_v2 dans la table activities, mais getCurrentActivity construit « level_ » + identifiant du niveau : un niveau dont l'identifiant est gridmap_v2 est reconnu, gridmap seul ne l'est pas.
- Évènements de timeline Steam enregistrés via gameplay_statistic.callbackRegister : vehicle/crash, vehicle/airtime.time (plage), vehicle/rollover, vehicle/jturn, drift/crashes.
- Modes de jeu Steam timeline utilisés : 1 jeu, 2 mise en place/éditeur, 3 menu, 4 écran de chargement.
- Les hooks onDragReset, onDragDataSet, onDragClear, onDragClearComplete, onCrawlStarted, onCrawlCleared, onDriftContextChanged, onCareerActive, onDeliveryModeStarted/Stopped, onPartShopping*, onScenarioChange et onWorldReadyState recalculent simplement l'activité.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `util_richPresence.clientEndMission(levelpath)` | Hook appelé à la fin d'un niveau : passe la timeline Steam en mode écran de chargement (4). *(interne)* | 526 |
| `util_richPresence.clientPreStartMission(levelpath)` | Hook appelé avant le démarrage d'un niveau : passe la timeline Steam en mode écran de chargement (4). *(interne)* | 526 |
| `util_richPresence.onAnyMissionChanged()` | Hook appelé quand une mission change : met à jour le message et l'activité. *(interne)* *(hook)* | 398 |
| `util_richPresence.onAttemptCompleted(attemptData)` | Hook appelé à la réussite d'une tentative : évènement « Completed » dans la timeline Steam. *(interne)* *(hook)* | 616 |
| `util_richPresence.onAttemptFailed(attemptData)` | Hook appelé à l'échec d'une tentative : évènement « Failed » dans la timeline Steam. *(interne)* *(hook)* | 606 |
| `util_richPresence.onCareerActive()` | Hook : recalcule l'activité quand la carrière devient active. *(interne)* *(hook)* | 230 |
| `util_richPresence.onClientPostStartMission(levelPath)` | Hook appelé après le démarrage d'un niveau : mémorise l'identifiant et le nom lisible du niveau, met à jour le message et l'activité. *(interne)* *(hook)* | 357 |
| `util_richPresence.onCrawlCleared()` | Hook : recalcule l'activité à la fin d'un parcours de crawl. *(interne)* *(hook)* | 242 |
| `util_richPresence.onCrawlStarted()` | Hook : recalcule l'activité au début d'un parcours de crawl. *(interne)* *(hook)* | 241 |
| `util_richPresence.onDeliveryModeStarted()` | Hook : recalcule l'activité au début du mode livraison. *(interne)* *(hook)* | 231 |
| `util_richPresence.onDeliveryModeStopped()` | Hook : recalcule l'activité à la fin du mode livraison. *(interne)* *(hook)* | 232 |
| `util_richPresence.onDragClear()` | Hook : recalcule l'activité à l'effacement des données de drag. *(interne)* *(hook)* | 239 |
| `util_richPresence.onDragClearComplete()` | Hook : recalcule l'activité une fois l'effacement du drag terminé. *(interne)* *(hook)* | 240 |
| `util_richPresence.onDragDataSet()` | Hook : recalcule l'activité quand les données de drag sont définies. *(interne)* *(hook)* | 238 |
| `util_richPresence.onDragReset()` | Hook : recalcule l'activité à la réinitialisation du drag. *(interne)* *(hook)* | 237 |
| `util_richPresence.onDriftContextChanged()` | Hook : recalcule l'activité quand le contexte de drift change. *(interne)* *(hook)* | 243 |
| `util_richPresence.onEditorActivated()` | Hook appelé à l'ouverture de l'éditeur : message « Using World Editor » et mode de jeu Steam 2. *(interne)* *(hook)* | 379 |
| `util_richPresence.onEditorDeactivated()` | Hook appelé à la fermeture de l'éditeur : met à jour le message et remet le mode de jeu Steam à 1. *(interne)* *(hook)* | 386 |
| `util_richPresence.onExtensionLoaded()` | Appelé au chargement : initialise la présence enrichie Steam et Discord selon les réglages et enregistre les rappels de statistiques pour la timeline Steam. *(interne)* *(hook)* | 440 |
| `util_richPresence.onExtensionUnloaded()` | Appelé au déchargement : efface le statut Steam et l'activité Discord et retire les rappels de statistiques. *(interne)* *(hook)* | 460 |
| `util_richPresence.onGameStateUpdate(state)` | Hook appelé quand l'état du jeu change : met à jour le message et l'activité. *(interne)* *(hook)* | 393 |
| `util_richPresence.onMissionAttemptAggregated(attempt, mission)` | Hook appelé quand une tentative de mission est agrégée : évènement « Mission <type> » avec le nom de la mission dans la timeline Steam. *(interne)* *(hook)* | 669 |
| `util_richPresence.onNewAttempt(attemptData)` | Hook appelé au début d'une tentative : évènement « New attempt » dans la timeline Steam. *(interne)* *(hook)* | 596 |
| `util_richPresence.onPartShoppingCancelled()` | Hook : recalcule l'activité à l'annulation d'un achat de pièces. *(interne)* *(hook)* | 236 |
| `util_richPresence.onPartShoppingStarted()` | Hook : recalcule l'activité au début d'une session d'achat de pièces. *(interne)* *(hook)* | 233 |
| `util_richPresence.onPartShoppingTransactionComplete()` | Hook : recalcule l'activité après une transaction d'achat de pièces. *(interne)* *(hook)* | 234 |
| `util_richPresence.onRaceBranchChosen(data)` | Hook appelé au choix d'une branche de course : évènement « Race branch » dans la timeline Steam. *(interne)* *(hook)* | 647 |
| `util_richPresence.onRaceLap(data)` | Hook appelé à la fin d'un tour : évènement « Race lap N » avec le temps formaté mm:ss.mmm dans la timeline Steam. *(interne)* *(hook)* | 636 |
| `util_richPresence.onRaceResult(data)` | Hook appelé au résultat de course : évènement « Race Result » avec le temps final formaté dans la timeline Steam. *(interne)* *(hook)* | 658 |
| `util_richPresence.onRaceWaypointReached(data)` | Hook appelé au passage d'un point de course : évènement « Race waypoint » dans la timeline Steam. *(interne)* *(hook)* | 626 |
| `util_richPresence.onResetGameplay()` | Hook appelé à la réinitialisation du gameplay : ajoute un évènement « reset » à la timeline Steam. *(interne)* *(hook)* | 586 |
| `util_richPresence.onScenarioChange()` | Hook : recalcule l'activité au changement de scénario. *(interne)* *(hook)* | 235 |
| `util_richPresence.onSettingsChanged()` | Hook appelé quand les réglages changent : active ou désactive la présence enrichie (Steam, Discord, set/setActivity) selon richPresence et richPresenceDiscord. *(interne)* *(hook)* | 493 |
| `util_richPresence.onUiChangedState(toState, fromState)` | Hook appelé au changement d'état de l'interface : met à jour le mode de jeu et la description d'état de la timeline Steam. *(interne)* *(hook)* | 562 |
| `util_richPresence.onUiReady()` | Hook appelé quand l'interface est prête : déduit le mode de jeu Steam (menu, chargement, mise en place, jeu) de l'état courant et met à jour l'activité. *(interne)* *(hook)* | 533 |
| `util_richPresence.onVehicleSwitched(oldId, newId, player)` | Hook appelé au changement de véhicule joueur : relit le nom et la marque du véhicule (info.json) et met à jour le message. *(interne)* *(hook)* | 339 |
| `util_richPresence.onWorldReadyState(levelpath)` | Hook : recalcule l'activité quand l'état du monde change. *(interne)* *(hook)* | 244 |
| `util_richPresence.set(v)` | Définit le texte de rich presence Steam (clé 'b') ; renvoie le succès. Remplacée par nop si la présence enrichie est désactivée. (assignée dynamiquement) | dyn |
| `util_richPresence.setActivity(activityId)` | Démarre une activité UDS par identifiant si elle diffère de la dernière envoyée. Remplacée par nop si désactivée. (assignée dynamiquement) | dyn |

### Détail des paramètres

#### `util_richPresence.clientEndMission(levelpath)`

Hook appelé à la fin d'un niveau : passe la timeline Steam en mode écran de chargement (4).

- `levelpath` (*string*) : Chemin du niveau

#### `util_richPresence.clientPreStartMission(levelpath)`

Hook appelé avant le démarrage d'un niveau : passe la timeline Steam en mode écran de chargement (4).

- `levelpath` (*string*) : Chemin du niveau

#### `util_richPresence.onAttemptCompleted(attemptData)`

Hook appelé à la réussite d'une tentative : évènement « Completed » dans la timeline Steam.

- `attemptData` (*table*) : Données de la tentative (non utilisées)

#### `util_richPresence.onAttemptFailed(attemptData)`

Hook appelé à l'échec d'une tentative : évènement « Failed » dans la timeline Steam.

- `attemptData` (*table*) : Données de la tentative (non utilisées)

#### `util_richPresence.onClientPostStartMission(levelPath)`

Hook appelé après le démarrage d'un niveau : mémorise l'identifiant et le nom lisible du niveau, met à jour le message et l'activité.

- `levelPath` (*string*) : Chemin du niveau

#### `util_richPresence.onGameStateUpdate(state)`

Hook appelé quand l'état du jeu change : met à jour le message et l'activité.

- `state` (*table*) : Nouvel état (non utilisé directement)

#### `util_richPresence.onMissionAttemptAggregated(attempt, mission)`

Hook appelé quand une tentative de mission est agrégée : évènement « Mission <type> » avec le nom de la mission dans la timeline Steam.

- `attempt` (*table*) : Tentative (champ type utilisé)
- `mission` (*table*) : Mission (champ name utilisé)

#### `util_richPresence.onNewAttempt(attemptData)`

Hook appelé au début d'une tentative : évènement « New attempt » dans la timeline Steam.

- `attemptData` (*table*) : Données de la tentative (non utilisées)

#### `util_richPresence.onRaceBranchChosen(data)`

Hook appelé au choix d'une branche de course : évènement « Race branch » dans la timeline Steam.

- `data` (*table*) : Données de la branche (non utilisées)

#### `util_richPresence.onRaceLap(data)`

Hook appelé à la fin d'un tour : évènement « Race lap N » avec le temps formaté mm:ss.mmm dans la timeline Steam.

- `data` (*table*) : Contient lap (numéro de tour) et time (secondes)

#### `util_richPresence.onRaceResult(data)`

Hook appelé au résultat de course : évènement « Race Result » avec le temps final formaté dans la timeline Steam.

- `data` (*table*) : Contient finalTime (secondes)

#### `util_richPresence.onRaceWaypointReached(data)`

Hook appelé au passage d'un point de course : évènement « Race waypoint » dans la timeline Steam.

- `data` (*table*) : Données du point (non utilisées)

#### `util_richPresence.onUiChangedState(toState, fromState)`

Hook appelé au changement d'état de l'interface : met à jour le mode de jeu et la description d'état de la timeline Steam.

- `toState` (*string*) : Nouvel état (menu.*, loading, scenario-*, autre)
- `fromState` (*string*) : Ancien état

#### `util_richPresence.onVehicleSwitched(oldId, newId, player)`

Hook appelé au changement de véhicule joueur : relit le nom et la marque du véhicule (info.json) et met à jour le message.

- `oldId` (*integer*) : Ancien identifiant de véhicule
- `newId` (*integer*) : Nouvel identifiant de véhicule
- `player` (*integer*) : Index du joueur

#### `util_richPresence.onWorldReadyState(levelpath)`

Hook : recalcule l'activité quand l'état du monde change.

- `levelpath` (*string*) : Chemin du niveau (non utilisé)

#### `util_richPresence.set(v)`

Définit le texte de rich presence Steam (clé 'b') ; renvoie le succès. Remplacée par nop si la présence enrichie est désactivée. (assignée dynamiquement)

- `v` (*any*) : Texte à afficher (converti avec tostring)
- **renvoie** : boolean|nil true en cas de succès (retour de OnlineServiceProvider.setRichPresence)

#### `util_richPresence.setActivity(activityId)`

Démarre une activité UDS par identifiant si elle diffère de la dernière envoyée. Remplacée par nop si désactivée. (assignée dynamiquement)

- `activityId` (*string*) : Identifiant de l'activité (voir la table activities du fichier)

## Champs

| Champ | Type | Description |
|---|---|---|
| `onDeserialized` | function | nop (à ne pas supprimer, selon le commentaire du code) |
| `richPresenceEnabled` | boolean | true si les fonctions set/setActivity sont actives |
| `state` | table | {levelName, vehicleName, levelIdentifier, vehicleJbeam?} : état utilisé pour composer le message |

## Appels vers le moteur (C++)

- `Steam.` `timelineAddEvent`, `timelineSetGameMode`, `timelineSetStateDescription`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/util/richPresence.lua`.*

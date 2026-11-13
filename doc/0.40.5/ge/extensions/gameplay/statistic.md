# `gameplay_statistic`

*Fichier : `lua/ge/extensions/gameplay/statistic.lua` · VM : Game Engine (GE) · 837 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `gameplay_statistic` : `extensions.load("gameplay_statistic")`, puis la globale `gameplay_statistic`

Extension de statistiques de jeu. Elle tient des métriques nommées (compteurs, valeurs, minuteurs) enregistrées dans settings/cloud/gameplay_stat.json, et une copie séparée par profil de carrière (career/gameplay_stat.json dans le slot de sauvegarde). Elle mesure le temps passé par mode, niveau et activité, compte des événements (véhicules apparus, resets, changements de véhicule, scénarios finis) et charge les modules de gameplay/statisticModules (watchJturn, watchRollover…) dont la fonction workload est appelée tour à tour sur le véhicule du joueur. Les moddeurs s'en servent pour lire, incrémenter ou observer des métriques.

## Exemple

```lua
gameplay_statistic.metricAdd('mymod/jumps', 1)
local e = gameplay_statistic.metricGet('mymod/jumps')
print(e and e.value)
gameplay_statistic.callbackRegister('mymod/jumps', 10, function(name, old, new) print('10 sauts !') end)
```

## Remarques

- Une entrée de métrique est {value=…} ; avec aggregate = true elle contient aussi last (pour metricAdd), count, min, max.
- Noms de métriques : chemins avec « / » (ex. vehicle/jturn, vehicle/rollover, general/mode/<mode>.time, general/map/<niveau>.time, scenario/finished). Les minuteurs enregistrent des secondes (temps réel, ou temps simulé avec useSimTime).
- Un callback avec trigger ne s'exécute qu'une fois (supprimé après appel) quand newentry.value >= trigger. Un nom contenant « * » est traité comme motif Lua (string.match) dans une table de callbacks génériques.
- Une fonction workload d'un module n'est appelée que si le véhicule joueur est jouable, contrôlé par le joueur et si dtSim ~= 0 ; une seule fonction par frame (tourniquet).
- Sauvegarde : au plus tard à la fin de la mission, à la sérialisation, à l'arrêt du jeu ou quand sendGUIState constate des entrées modifiées ou plus de 60 s sans sauvegarde ; l'écriture passe par un fichier .tmp renommé.
- Bug mineur : dans startActivity, le test d'arrêt du minuteur de niveau lit la clé « general/mapmap/<niveau>.time » (faute de frappe) au lieu de « general/map/… ».
- checkSaveDecay (non appelée) affecte une globale saveNextFrame jamais déclarée.

**Dépendances (chargées avant) :** `ui_imgui`, `core_gamestate`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `gameplay_statistic.addSchedule(fn)` | Ajoute une fonction à la file des surveillances par véhicule. Appelée fn(vehicleObj, vehicleId, dtSim), une fonction par frame en tourniquet. | 128 |
| `gameplay_statistic.callbackRegister(name, trigger, callbackFunction, career)` | Enregistre une fonction appelée quand une métrique change. Signature du callback : fn(name, oldEntry, newEntry) ; newEntry.career indique le contexte carrière. Avec trigger, appelée une seule fois quand la valeur atteint le seuil. | 356 |
| `gameplay_statistic.callbackRemove(name, trigger, callbackFunction, career)` | Retire un callback enregistré (mêmes name, trigger, fonction et career). | 382 |
| `gameplay_statistic.forceTimerUpdate()` | Enregistre le temps écoulé de tous les minuteurs en cours (sans les arrêter). | 782 |
| `gameplay_statistic.metricAdd(name, value, aggregate)` | Ajoute value à la métrique name (la crée si absente), pour les statistiques générales et, si la carrière est active, pour celles de la carrière. Déclenche les callbacks associés. | 230 |
| `gameplay_statistic.metricGet(name, carreer)` | Renvoie une copie de l'entrée d'une métrique. | 293 |
| `gameplay_statistic.metricGetMatchPattern(namePattern, carreer)` | Renvoie les copies de toutes les métriques dont le nom correspond à un motif Lua (string.match). | 307 |
| `gameplay_statistic.metricSet(name, value, aggregate)` | Fixe la valeur de la métrique (général et carrière). Déclenche les callbacks. | 273 |
| `gameplay_statistic.onCareerActive(active)` | Hook appelé à l'activation ou désactivation de la carrière : charge ou libère les statistiques du profil. *(interne)* *(hook)* | 757 |
| `gameplay_statistic.onClientEndMission(levelPath)` | Hook appelé à la fin d'un niveau : termine l'activité et sauvegarde. *(interne)* *(hook)* | 526 |
| `gameplay_statistic.onClientPostStartMission(levelPath)` | Hook appelé après le chargement du niveau : démarre l'activité et recharge les sous-modules. *(interne)* *(hook)* | 531 |
| `gameplay_statistic.onClientStartMission(levelPath)` | Hook appelé au début d'un niveau : redémarre le suivi d'activité. *(interne)* *(hook)* | 522 |
| `gameplay_statistic.onDeserialized(data)` | Hook : recharge le fichier et restaure l'état après rechargement Lua. *(interne)* *(hook)* | 94 |
| `gameplay_statistic.onEditorActivated()` | Hook : démarre le minuteur general/editor.time. *(interne)* *(hook)* | 544 |
| `gameplay_statistic.onEditorDeactivated()` | Hook : arrête le minuteur general/editor.time. *(interne)* *(hook)* | 548 |
| `gameplay_statistic.onExit()` | Hook appelé à la fermeture du jeu : termine l'activité et sauvegarde. *(interne)* *(hook)* | 71 |
| `gameplay_statistic.onExtensionLoaded()` | Hook : charge le fichier de statistiques et les sous-modules statisticModules. *(interne)* *(hook)* | 776 |
| `gameplay_statistic.onExtensionUnloaded()` | Hook : sauvegarde. *(interne)* *(hook)* | 78 |
| `gameplay_statistic.onGameStateUpdate(newState)` | Hook appelé au changement d'état de jeu : redémarre le suivi d'activité (ignoré en carrière tant que le temps réel est à 0). *(interne)* *(hook)* | 582 |
| `gameplay_statistic.onPlayerVehicleCloned()` | Hook : incrémente vehicle/spawned. *(interne)* *(hook)* | 595 |
| `gameplay_statistic.onSaveCurrentProfile(currentSavePath)` | Hook appelé à la sauvegarde du profil de carrière : écrit career/gameplay_stat.json dans le slot. *(interne)* *(hook)* | 747 |
| `gameplay_statistic.onScenarioFinished(scenario)` | Hook appelé à la fin d'un scénario : incrémente scenario/finished. *(interne)* *(hook)* | 566 |
| `gameplay_statistic.onScenarioLoaded(scenario)` | Hook appelé au chargement d'un scénario : redémarre le suivi d'activité. *(interne)* *(hook)* | 559 |
| `gameplay_statistic.onScenarioRestarted(scenario)` | Hook appelé au redémarrage d'un scénario : incrémente scenario/restarted. *(interne)* *(hook)* | 574 |
| `gameplay_statistic.onSerialize()` | Hook : sauvegarde puis renvoie l'état (activité, niveau, mode, minuteurs) avant rechargement Lua. *(interne)* *(hook)* | 82 |
| `gameplay_statistic.onSpawnDefaultVehicle()` | Hook : incrémente vehicle/spawned. *(interne)* *(hook)* | 598 |
| `gameplay_statistic.onUpdate(dtReal, dtSim, dtRaw)` | Hook appelé à chaque frame : cumule les temps réel et simulé, exécute une fonction de surveillance du véhicule joueur, dessine la fenêtre de debug si ouverte. *(interne)* *(hook)* | 603 |
| `gameplay_statistic.onVehicleDestroyed(vid)` | Hook : oublie le véhicule du joueur s'il est détruit. *(interne)* *(hook)* | 720 |
| `gameplay_statistic.onVehicleResetted(vid)` | Hook : incrémente vehicle/reset si c'est le véhicule du joueur. *(interne)* *(hook)* | 716 |
| `gameplay_statistic.onVehicleSelectorReplaceCurrent()` | Hook : incrémente vehicle/spawned. *(interne)* *(hook)* | 592 |
| `gameplay_statistic.onVehicleSelectorSpawnNew()` | Hook : incrémente vehicle/spawned. *(interne)* *(hook)* | 589 |
| `gameplay_statistic.onVehicleSpawned(vid, v)` | Hook appelé à l'apparition d'un véhicule ; ne fait rien. *(interne)* *(hook)* | 701 |
| `gameplay_statistic.onVehicleSwitched(oldid, newid, player)` | Hook appelé au changement de véhicule : pour le joueur 0, mémorise le véhicule et incrémente vehicle/switch. *(interne)* *(hook)* | 704 |
| `gameplay_statistic.onWorldReadyState(worldReadyState)` | Hook appelé au changement d'état du monde ; ne fait rien. *(interne)* *(hook)* | 540 |
| `gameplay_statistic.removeSchedule(fn)` | Retire une fonction de la file des surveillances. | 133 |
| `gameplay_statistic.sendGUIState()` | Sauvegarde si nécessaire puis envoie à l'interface l'évènement StatisticData avec {general = entrées, career = entrées si active}. | 735 |
| `gameplay_statistic.setDebug(newValue)` | Ouvre ou ferme la fenêtre imgui de debug « gameplay_statistic Debugger » (modules, entrées, callbacks). | 727 |
| `gameplay_statistic.timerStart(name, increment, aggregate, useSimTime)` | Démarre un minuteur nommé. Si un minuteur de ce nom tourne déjà, l'appel est ignoré avec un avertissement. | 323 |
| `gameplay_statistic.timerStop(name)` | Arrête le minuteur et enregistre le temps écoulé dans la métrique. | 346 |

### Détail des paramètres

#### `gameplay_statistic.addSchedule(fn)`

Ajoute une fonction à la file des surveillances par véhicule. Appelée fn(vehicleObj, vehicleId, dtSim), une fonction par frame en tourniquet.

- `fn` (*function*) : Fonction de surveillance.

#### `gameplay_statistic.callbackRegister(name, trigger, callbackFunction, career)`

Enregistre une fonction appelée quand une métrique change. Signature du callback : fn(name, oldEntry, newEntry) ; newEntry.career indique le contexte carrière. Avec trigger, appelée une seule fois quand la valeur atteint le seuil.

- `name` (*string*) : Nom de métrique, ou motif contenant « * ».
- `trigger` (*number|nil*) : Seuil de valeur ; nil = à chaque changement.
- `callbackFunction` (*function*) : Callback.
- `career` (*boolean|nil*) : Écouter les métriques de carrière.

#### `gameplay_statistic.callbackRemove(name, trigger, callbackFunction, career)`

Retire un callback enregistré (mêmes name, trigger, fonction et career).

- `name` (*string*) : Nom ou motif.
- `trigger` (*number|nil*) : Seuil utilisé à l'enregistrement.
- `callbackFunction` (*function*) : Callback.
- `career` (*boolean|nil*) : Contexte carrière.
- **renvoie** : boolean true si retiré.

#### `gameplay_statistic.metricAdd(name, value, aggregate)`

Ajoute value à la métrique name (la crée si absente), pour les statistiques générales et, si la carrière est active, pour celles de la carrière. Déclenche les callbacks associés.

- `name` (*string*) : Nom de la métrique.
- `value` (*number*) : Valeur à ajouter.
- `aggregate` (*boolean|nil*) : Suivre aussi last, count, min, max.

#### `gameplay_statistic.metricGet(name, carreer)`

Renvoie une copie de l'entrée d'une métrique.

- `name` (*string*) : Nom de la métrique.
- `carreer` (*boolean|nil*) : true pour lire les données de la carrière (si active).
- **renvoie** : table|nil {value, …} ou nil si inconnue.

#### `gameplay_statistic.metricGetMatchPattern(namePattern, carreer)`

Renvoie les copies de toutes les métriques dont le nom correspond à un motif Lua (string.match).

- `namePattern` (*string*) : Motif Lua.
- `carreer` (*boolean|nil*) : true pour la carrière (si active).
- **renvoie** : table<string, table> nom -> entrée.

#### `gameplay_statistic.metricSet(name, value, aggregate)`

Fixe la valeur de la métrique (général et carrière). Déclenche les callbacks.

- `name` (*string*) : Nom de la métrique.
- `value` (*number*) : Nouvelle valeur.
- `aggregate` (*boolean|nil*) : Suivre aussi count, min, max.

#### `gameplay_statistic.onCareerActive(active)`

Hook appelé à l'activation ou désactivation de la carrière : charge ou libère les statistiques du profil.

- `active` (*boolean*) : true si la carrière devient active.

#### `gameplay_statistic.onClientEndMission(levelPath)`

Hook appelé à la fin d'un niveau : termine l'activité et sauvegarde.

- `levelPath` (*string*) : Chemin du niveau.

#### `gameplay_statistic.onClientPostStartMission(levelPath)`

Hook appelé après le chargement du niveau : démarre l'activité et recharge les sous-modules.

- `levelPath` (*string*) : Chemin du niveau.

#### `gameplay_statistic.onClientStartMission(levelPath)`

Hook appelé au début d'un niveau : redémarre le suivi d'activité.

- `levelPath` (*string*) : Chemin du niveau.

#### `gameplay_statistic.onDeserialized(data)`

Hook : recharge le fichier et restaure l'état après rechargement Lua.

- `data` (*table*) : Données de onSerialize.

#### `gameplay_statistic.onGameStateUpdate(newState)`

Hook appelé au changement d'état de jeu : redémarre le suivi d'activité (ignoré en carrière tant que le temps réel est à 0).

- `newState` (*table|nil*) : Nouvel état.

#### `gameplay_statistic.onSaveCurrentProfile(currentSavePath)`

Hook appelé à la sauvegarde du profil de carrière : écrit career/gameplay_stat.json dans le slot.

- `currentSavePath` (*string*) : Dossier du slot de sauvegarde.

#### `gameplay_statistic.onScenarioFinished(scenario)`

Hook appelé à la fin d'un scénario : incrémente scenario/finished.

- `scenario` (*table*) : Scénario.

#### `gameplay_statistic.onScenarioLoaded(scenario)`

Hook appelé au chargement d'un scénario : redémarre le suivi d'activité.

- `scenario` (*table*) : Scénario.

#### `gameplay_statistic.onScenarioRestarted(scenario)`

Hook appelé au redémarrage d'un scénario : incrémente scenario/restarted.

- `scenario` (*table*) : Scénario.

#### `gameplay_statistic.onUpdate(dtReal, dtSim, dtRaw)`

Hook appelé à chaque frame : cumule les temps réel et simulé, exécute une fonction de surveillance du véhicule joueur, dessine la fenêtre de debug si ouverte.

- `dtReal` (*number*) : Temps réel écoulé (s).
- `dtSim` (*number*) : Temps simulé écoulé (s).
- `dtRaw` (*number*) : Temps brut écoulé (s).

#### `gameplay_statistic.onVehicleDestroyed(vid)`

Hook : oublie le véhicule du joueur s'il est détruit.

- `vid` (*integer*) : Identifiant du véhicule.

#### `gameplay_statistic.onVehicleResetted(vid)`

Hook : incrémente vehicle/reset si c'est le véhicule du joueur.

- `vid` (*integer*) : Identifiant du véhicule.

#### `gameplay_statistic.onVehicleSpawned(vid, v)`

Hook appelé à l'apparition d'un véhicule ; ne fait rien.

- `vid` (*integer*) : Identifiant du véhicule.
- `v` (*userdata*) : Objet véhicule.

#### `gameplay_statistic.onVehicleSwitched(oldid, newid, player)`

Hook appelé au changement de véhicule : pour le joueur 0, mémorise le véhicule et incrémente vehicle/switch.

- `oldid` (*integer*) : Ancien véhicule.
- `newid` (*integer*) : Nouveau véhicule (-1 si aucun).
- `player` (*integer*) : Indice du joueur.

#### `gameplay_statistic.onWorldReadyState(worldReadyState)`

Hook appelé au changement d'état du monde ; ne fait rien.

- `worldReadyState` (*integer*) : État.

#### `gameplay_statistic.removeSchedule(fn)`

Retire une fonction de la file des surveillances.

- `fn` (*function*) : Fonction ajoutée avec addSchedule.
- **renvoie** : boolean true si retirée.

#### `gameplay_statistic.setDebug(newValue)`

Ouvre ou ferme la fenêtre imgui de debug « gameplay_statistic Debugger » (modules, entrées, callbacks).

- `newValue` (*boolean*) : true pour afficher.

#### `gameplay_statistic.timerStart(name, increment, aggregate, useSimTime)`

Démarre un minuteur nommé. Si un minuteur de ce nom tourne déjà, l'appel est ignoré avec un avertissement.

- `name` (*string*) : Nom (aussi nom de la métrique alimentée).
- `increment` (*boolean|nil*) : true (défaut) : ajoute le temps avec metricAdd ; false : metricSet.
- `aggregate` (*boolean|nil*) : Mode agrégat (défaut false).
- `useSimTime` (*boolean|nil*) : Utiliser le temps simulé plutôt que le temps réel (défaut false).

#### `gameplay_statistic.timerStop(name)`

Arrête le minuteur et enregistre le temps écoulé dans la métrique.

- `name` (*string*) : Nom du minuteur.
- **renvoie** : number Secondes écoulées depuis le dernier enregistrement (0 si le minuteur n'existe pas).

## Champs

| Champ | Type | Description |
|---|---|---|
| `dependencies` | string[] | Extensions chargées avant : ui_imgui et core_gamestate. |

**Évènements UI (guihooks.trigger) :** `StatisticData`

## Appels vers le moteur (C++)

- `FS:` `findFiles`, `removeFile`, `renameFile`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/gameplay/statistic.lua`.*

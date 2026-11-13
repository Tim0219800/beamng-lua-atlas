# `ui_multiseat_freeroam`

*Fichier : `lua/ge/extensions/ui/multiseat/freeroam.lua` · VM : Game Engine (GE) · 353 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `ui_multiseat_freeroam` : `extensions.load("ui_multiseat_freeroam")`, puis la globale `ui_multiseat_freeroam`

Gère la session multi-sièges (écran partagé) en balade libre : choix des véhicules suggérés, plan d'apparition (positions du niveau, sinon groupe de places de parking proches, sinon route), ouverture des réglages multiseat, activation/désactivation du split screen et du trafic, sortie vers le mode solo, et restauration après rechargement de l'interface (Lua/UI). Un niveau peut fournir mainLevel.getMultiseatSuggestedVehicles(playerCount) et mainLevel.getMultiseatSpawnPositions(playerCount), ou multiseat.suggestedVehicles dans info.json.

## Remarques

- Les positions renvoyées par mainLevel.getMultiseatSpawnPositions peuvent être {parkingSpot}, un objet parking (avec moveResetVehicleTo) ou {pos, rot} ; il en faut au moins une par joueur, sinon le plan de repli (parking) est utilisé.
- Le plan de parking cherche un groupe de places libres de taille standard dans un rayon de 30 m (PARKING_CLUSTER_RADIUS) assez grand pour tous les joueurs ; sinon les véhicules sont placés sur la route via reconcileFreeroamVehicles.
- Codes de raison renvoyés par startSplitscreenFreeroam : no_players, vehicle_assignment_failed, vehicle_spawn_failed.
- onSerialize renvoie {restoreAsFreeroam = true} seulement si la session (ou un gamemode) est active ; onUiReady rétablit alors le réglage multiseat, le split screen et la route UI « multiseat ».
- exitMultiseat garde le véhicule du joueur 0, supprime les autres, désactive multiseat (settings multiseat = false) et décharge render_splitScreen et gameplay_traffic_source.

**Dépendances (chargées avant) :** `gameplay_city`, `gameplay_parking`, `gameplay_traffic`, `ui_multiseat_multiseatSettings`, `ui_multiseat_multiseatVehicles`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `ui_multiseat_freeroam.activate()` | Charge gameplay_multiseat_gamemodeManager et marque la session freeroam multiseat comme active. | 109 |
| `ui_multiseat_freeroam.deactivate()` | Marque la session comme inactive et annule toute restauration en attente. | 114 |
| `ui_multiseat_freeroam.exitMultiseat(options)` | Revient au freeroam solo : arrête le gamemode multiseat, applique éventuellement un cache d'affectations (options.assignmentCache), arrête les courses de drag et un crawl hors mission, supprime tous les véhicules sauf celui du joueur 0, vide la session, coupe multiseat et rend le véhicule au joueur 0 avec la caméra de jeu. | 191 |
| `ui_multiseat_freeroam.isActive()` | Indique si la session freeroam multiseat est active. | 119 |
| `ui_multiseat_freeroam.onClientEndMission()` | Hook appelé à la fin du niveau ; désactive la session et annule toute restauration. *(interne)* *(hook)* | 343 |
| `ui_multiseat_freeroam.onDeserialized(data)` | Hook appelé après un rechargement Lua ; si le marqueur restoreAsFreeroam est présent, appelle restoreAfterReload. *(interne)* *(hook)* | 295 |
| `ui_multiseat_freeroam.onMultiseatSettingsApplied(changeSet, result)` | Hook appelé quand les réglages multiseat ont été appliqués. Active la session ; avec plus d'un joueur, charge render_splitScreen, lui donne les joueurs et ajoute les joueurs aux sources de trafic ; avec un seul joueur, décharge split screen et trafic. Ferme ensuite le menu. Sans effet si result.success == false ou result.exitAfterApply == true. *(interne)* *(hook)* | 164 |
| `ui_multiseat_freeroam.onMultiseatSettingsClosed()` | Hook appelé à la fermeture des réglages multiseat ; ne fait rien ici. *(interne)* *(hook)* | 250 |
| `ui_multiseat_freeroam.onPauseHomeRailBuildMultiseatActions(actions, _context, registerButton)` | Hook du rail d'accueil du menu pause : ajoute les boutons « home.changeMultiseatSettings » (ouvre pause.multiseatSettings) et « home.exitMultiseat » (confirmation, puis exitMultiseat et retour à « play »). Rien n'est ajouté si ni la session ni un gamemode multiseat n'est actif. *(interne)* *(hook)* | 253 |
| `ui_multiseat_freeroam.onSerialize(reason)` | Hook appelé avant un rechargement Lua ; renvoie {restoreAsFreeroam = true} si une session est active, sinon rien. *(interne)* *(hook)* | 280 |
| `ui_multiseat_freeroam.onUiReady()` | Hook appelé quand l'interface est prête ; si une restauration est en attente, rétablit multiseat, le split screen, le trafic et recharge la route UI « multiseat » (définie comme route de jeu). *(interne)* *(hook)* | 304 |
| `ui_multiseat_freeroam.openSettings()` | Démarre une configuration multiseat (source « settings ») et navigue vers la route « pause.multiseatSettings ». Si la navigation échoue, la configuration est abandonnée. | 155 |
| `ui_multiseat_freeroam.restoreAfterReload()` | Marque la session active et met en file une restauration, exécutée au prochain onUiReady. *(interne)* | 123 |
| `ui_multiseat_freeroam.startSplitscreenFreeroam(levelName)` | Lance le freeroam en écran partagé : attribue à chaque joueur inscrit un véhicule suggéré pour le niveau, construit un plan d'apparition (niveau, puis parking, sinon route), fait apparaître les véhicules et active la session en cas de succès. En cas d'échec d'apparition, les véhicules sont retirés. | 129 |

### Détail des paramètres

#### `ui_multiseat_freeroam.exitMultiseat(options)`

Revient au freeroam solo : arrête le gamemode multiseat, applique éventuellement un cache d'affectations (options.assignmentCache), arrête les courses de drag et un crawl hors mission, supprime tous les véhicules sauf celui du joueur 0, vide la session, coupe multiseat et rend le véhicule au joueur 0 avec la caméra de jeu.

- `options` (*table|nil*) : Options ; assignmentCache = affectations de joueurs à mettre en cache avant la sortie.
- **renvoie** : boolean false si la session n'était pas active ou si le cache n'a pas pu être enregistré, sinon true.

#### `ui_multiseat_freeroam.isActive()`

Indique si la session freeroam multiseat est active.

- **renvoie** : boolean true si active.

#### `ui_multiseat_freeroam.onDeserialized(data)`

Hook appelé après un rechargement Lua ; si le marqueur restoreAsFreeroam est présent, appelle restoreAfterReload.

- `data` (*table*) : Données renvoyées par onSerialize.

#### `ui_multiseat_freeroam.onMultiseatSettingsApplied(changeSet, result)`

Hook appelé quand les réglages multiseat ont été appliqués. Active la session ; avec plus d'un joueur, charge render_splitScreen, lui donne les joueurs et ajoute les joueurs aux sources de trafic ; avec un seul joueur, décharge split screen et trafic. Ferme ensuite le menu. Sans effet si result.success == false ou result.exitAfterApply == true.

- `changeSet` (*table*) : Changements appliqués (non utilisé ici).
- `result` (*table*) : Résultat de l'application (success, exitAfterApply).

#### `ui_multiseat_freeroam.onPauseHomeRailBuildMultiseatActions(actions, _context, registerButton)`

Hook du rail d'accueil du menu pause : ajoute les boutons « home.changeMultiseatSettings » (ouvre pause.multiseatSettings) et « home.exitMultiseat » (confirmation, puis exitMultiseat et retour à « play »). Rien n'est ajouté si ni la session ni un gamemode multiseat n'est actif.

- `actions` (*table*) : Liste d'actions à compléter.
- `_context` (*table*) : Contexte (non utilisé).
- `registerButton` (*function*) : Fonction qui enregistre un bouton et son callback.

#### `ui_multiseat_freeroam.onSerialize(reason)`

Hook appelé avant un rechargement Lua ; renvoie {restoreAsFreeroam = true} si une session est active, sinon rien.

- `reason` (*string*) : Raison de la sérialisation (log).
- **renvoie** : table|nil Marqueur de restauration.

#### `ui_multiseat_freeroam.openSettings()`

Démarre une configuration multiseat (source « settings ») et navigue vers la route « pause.multiseatSettings ». Si la navigation échoue, la configuration est abandonnée.

- **renvoie** : boolean false si la navigation a échoué, sinon true.

#### `ui_multiseat_freeroam.startSplitscreenFreeroam(levelName)`

Lance le freeroam en écran partagé : attribue à chaque joueur inscrit un véhicule suggéré pour le niveau, construit un plan d'apparition (niveau, puis parking, sinon route), fait apparaître les véhicules et active la session en cas de succès. En cas d'échec d'apparition, les véhicules sont retirés.

- `levelName` (*string*) : Nom du niveau, utilisé pour trouver les véhicules suggérés.
- **renvoie** : boolean true si tout a réussi.
- **renvoie** : string|nil Raison de l'échec (voir notes).

## Champs

| Champ | Type | Description |
|---|---|---|
| `dependencies` | table<integer, string> | Extensions chargées avant : gameplay_city, gameplay_parking, gameplay_traffic, ui_multiseat_multiseatSettings, ui_multiseat_multiseatVehicles. |

## Hooks émis

Évènements diffusés aux extensions par `extensions.hook` :

- `onSplitScreenStartRequested` — écouté par 1 module(s)

**Évènements UI (guihooks.trigger) :** `onDragRaceTimeslipData`, `onDragReset`

## Appels vers le moteur (C++)

- `be:` `enterVehicle`

**Charge les extensions :** `gameplay_multiseat_gamemodeManager`, `gameplay_traffic_source`, `render_splitScreen`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/ui/multiseat/freeroam.lua`.*

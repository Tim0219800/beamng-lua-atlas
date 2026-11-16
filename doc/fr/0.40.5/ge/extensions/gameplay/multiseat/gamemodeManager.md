# `gameplay_multiseat_gamemodeManager`

*Fichier : `lua/ge/extensions/gameplay/multiseat/gamemodeManager.lua` · VM : Game Engine (GE) · 722 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `gameplay_multiseat_gamemodeManager` : `extensions.load("gameplay_multiseat_gamemodeManager")`, puis la globale `gameplay_multiseat_gamemodeManager`

Gestionnaire des modes de jeu multi-sièges (écran partagé). Il charge les fournisseurs gameplay/discover/multiseat/*Rules.lua, collecte leurs infos via le hook onGetMultiseatGamemodeInfos, démarre/arrête/relance un mode, gère le fondu, le blocage des actions d'entrée, l'attente des véhicules, ainsi que les écrans de début et de fin (via ui_router et mission.control). Un moddeur qui ajoute un mode multi-sièges passe par lui : il appelle ext.start(settings), ext.onReady(vehicles), ext.stop(), buildStartScreen, buildEndScreen.

## Exemple

```lua
gameplay_multiseat_gamemodeManager.start('monMode', nil, {withFade = false})
-- depuis le mode : gameplay_multiseat_gamemodeManager.showEndScreen({winnerPlayer = 0})
```

## Remarques

- Phases de gamemodePhase : nil, 'starting', 'waiting', 'running'.
- start() échoue (false) si le mode est inconnu, sans extensionPath, ou si plus de joueurs que playerCount.max ont rejoint.
- Changer de véhicule en phase 'running' (hors synchronisation) relance le mode ; les actions vehicleSwitching et walkingMode restent toujours bloquées, les autres seulement si le réglage restrictScenarios est actif.
- startScreenPendingOnPauseExit n'est jamais mis à true dans ce fichier : playPendingRound renvoie donc toujours false et isStartScreenPending toujours false.
- Après VEHICLE_READY_TIMEOUT (5 s), le mode continue même si les véhicules ne sont pas prêts.
- Durée du fondu : 0,35 s (FADE_DURATION).

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `gameplay_multiseat_gamemodeManager.deferReady()` | Passe la phase de 'starting' à 'waiting' : le mode annonce qu'il notifiera lui-même qu'il est prêt avec notifyReady. | 372 |
| `gameplay_multiseat_gamemodeManager.getGamemodeId()` | Nom du mode en cours. | 503 |
| `gameplay_multiseat_gamemodeManager.getMaxPlayers()` | Nombre maximal de joueurs du mode en cours (info.playerCount.max). | 507 |
| `gameplay_multiseat_gamemodeManager.getPhase()` | Phase actuelle du mode. | 512 |
| `gameplay_multiseat_gamemodeManager.getPlayerName(playerIndex)` | Nom affiché du joueur local d'index donné, d'après le persona du participant rejoint. | 128 |
| `gameplay_multiseat_gamemodeManager.getVehiclePool()` | Renvoie info.vehiclePool du mode en cours. | 394 |
| `gameplay_multiseat_gamemodeManager.goToMainMenu()` | Retourne au menu principal (returnToMainMenu). | 319 |
| `gameplay_multiseat_gamemodeManager.isActive()` | Indique si un mode est en cours. | 499 |
| `gameplay_multiseat_gamemodeManager.isStartScreenPending()` | Indique si l'écran de début est en attente de la sortie de pause (la variable n'est jamais mise à true dans ce fichier). | 516 |
| `gameplay_multiseat_gamemodeManager.notifyReady()` | Passe en phase 'running', termine le fondu s'il est actif et exécute le callback défini par setReadyCallback. Sans effet hors phases 'starting'/'waiting'. | 378 |
| `gameplay_multiseat_gamemodeManager.onAfterRouteChange(context)` | Hook après changement de route UI : si un écran de début est en attente et que la route cible est 'play' ou 'multiseat', le joue. *(interne)* *(hook)* | 591 |
| `gameplay_multiseat_gamemodeManager.onClientEndMission()` | Hook de fin de niveau : arrête le mode sans réactiver le freeroam. *(interne)* *(hook)* | 686 |
| `gameplay_multiseat_gamemodeManager.onExtensionUnloaded()` | Hook de déchargement : débloque les actions, appelle ext.stop() et réinitialise tout l'état, y compris le registre des modes. *(interne)* *(hook)* | 599 |
| `gameplay_multiseat_gamemodeManager.onGetIsMissionStartOrEndScreenActive(screensActive)` | Hook : ajoute le mode d'écran actif à la liste screensActive. *(interne)* *(hook)* | 581 |
| `gameplay_multiseat_gamemodeManager.onLoadingScreenFadeout()` | Hook vide : le flux « véhicules prêts » d'onPreRender gère déjà la transition. *(interne)* *(hook)* | 587 |
| `gameplay_multiseat_gamemodeManager.onMissionScreenButtonClicked(button)` | Hook : exécute le callback du bouton cliqué (mgrId 'multiseatGamemode'). Pour l'écran de fin, immédiatement ; pour l'écran de début, après retour à la route multiseat, onUIStartButtonClicked et 0,1 s de délai. *(interne)* *(hook)* | 557 |
| `gameplay_multiseat_gamemodeManager.onMultiseatSettingsApplied(changeSet, result)` | Hook après application des réglages multi-sièges : relance le mode si changeSet.requiresRestart et si l'application a réussi sans exitAfterApply. *(interne)* *(hook)* | 681 |
| `gameplay_multiseat_gamemodeManager.onPauseHomeRailBuildMultiseatActions(actions, context, registerButton)` | Hook de construction du menu pause multi-sièges : ajoute le bouton Modes de jeu s'il n'y a pas de mode actif, sinon Réglages, Quitter et Relancer le mode. *(interne)* *(hook)* | 624 |
| `gameplay_multiseat_gamemodeManager.onPreRender(dtReal, dtSim)` | Appelé chaque image. En phase 'waiting' avec véhicules en attente : attend qu'ils soient prêts (ou le délai de 5 s), notifie prêt, appelle ext.onReady(vehicles), gèle les véhicules puis affiche l'écran de début. *(interne)* *(hook)* | 533 |
| `gameplay_multiseat_gamemodeManager.onRequestMissionScreenData(mode)` | Hook : quand l'UI demande les données d'écran de mission (mode ne contenant pas 'test'), renvoie l'écran actif via onRequestMissionScreenDataReady et émet onMissionScreenReady. *(interne)* *(hook)* | 550 |
| `gameplay_multiseat_gamemodeManager.onScreenFadeState(state)` | Hook de fondu d'écran : quand state vaut 1 (écran noir) et qu'un lancement est différé, lance le mode. *(interne)* *(hook)* | 527 |
| `gameplay_multiseat_gamemodeManager.onVehicleSwitched(oldId, newId, player)` | Hook de changement de véhicule : relance le mode si en phase 'running' et hors synchronisation des véhicules. *(interne)* *(hook)* | 675 |
| `gameplay_multiseat_gamemodeManager.playPendingRound()` | Affiche l'écran de début s'il était en attente. | 520 |
| `gameplay_multiseat_gamemodeManager.requestGamemodeData()` | Envoie à l'UI (guihooks OnGamemodeData, context 'multiseat') la liste des modes disponibles, le mode en cours, ses réglages et la liste des joueurs. Les modes mapUnsupported ou dépassant le nombre de joueurs sont comptés mais non listés. | 144 |
| `gameplay_multiseat_gamemodeManager.restart(name, settings)` | Relance le mode (celui en cours si name est nil) avec fondu. Si le mode demandé n'est pas le mode actif, appelle start. | 481 |
| `gameplay_multiseat_gamemodeManager.setReadyCallback(callback)` | Définit une fonction appelée une fois, quand le mode passe à la phase 'running' (notifyReady). | 368 |
| `gameplay_multiseat_gamemodeManager.shouldAssignVehiclePool()` | Indique si le démarrage a été demandé avec options.assignVehiclePool = true. | 399 |
| `gameplay_multiseat_gamemodeManager.showEndScreen(resultData)` | Affiche l'écran de fin : émet onMultiseatGamemodeFinished, met le temps de simulation en pause, puis construit l'écran à partir de resultData et des surcharges de buildEndScreen du mode (header, headerColor, body, layout, pages, buttons). Par défaut : boutons Rejouer, Freeroam, Menu principal. | 252 |
| `gameplay_multiseat_gamemodeManager.start(name, settings, options)` | Démarre un mode : charge ui_multiseat_freeroam, arrête le mode précédent, charge l'extension du mode (info.extensionPath), lui assigne ext.info, retient les réglages (défauts de info.settings si nil), désactive le freeroam multi-sièges puis lance le mode (avec fondu sauf options.withFade == false). | 432 |
| `gameplay_multiseat_gamemodeManager.stop()` | Arrête le mode en cours, appelle ext.stop() et réactive le freeroam multi-sièges (ui_multiseat_freeroam.activate). | 364 |

### Détail des paramètres

#### `gameplay_multiseat_gamemodeManager.getGamemodeId()`

Nom du mode en cours.

- **renvoie** : string|nil Nom, ou nil.

#### `gameplay_multiseat_gamemodeManager.getMaxPlayers()`

Nombre maximal de joueurs du mode en cours (info.playerCount.max).

- **renvoie** : integer|nil Maximum, ou nil.

#### `gameplay_multiseat_gamemodeManager.getPhase()`

Phase actuelle du mode.

- **renvoie** : string|nil nil, 'starting', 'waiting' ou 'running'.

#### `gameplay_multiseat_gamemodeManager.getPlayerName(playerIndex)`

Nom affiché du joueur local d'index donné, d'après le persona du participant rejoint.

- `playerIndex` (*integer*) : Index du joueur (à partir de 0).
- **renvoie** : string|nil displayName, ou nil si inconnu.

#### `gameplay_multiseat_gamemodeManager.getVehiclePool()`

Renvoie info.vehiclePool du mode en cours.

- **renvoie** : table|nil Pool de véhicules déclaré par le mode.

#### `gameplay_multiseat_gamemodeManager.isActive()`

Indique si un mode est en cours.

- **renvoie** : boolean true si un mode est actif.

#### `gameplay_multiseat_gamemodeManager.isStartScreenPending()`

Indique si l'écran de début est en attente de la sortie de pause (la variable n'est jamais mise à true dans ce fichier).

- **renvoie** : boolean Toujours false en pratique.

#### `gameplay_multiseat_gamemodeManager.onAfterRouteChange(context)`

Hook après changement de route UI : si un écran de début est en attente et que la route cible est 'play' ou 'multiseat', le joue.

- `context` (*table*) : Contient toRoute.name.

#### `gameplay_multiseat_gamemodeManager.onGetIsMissionStartOrEndScreenActive(screensActive)`

Hook : ajoute le mode d'écran actif à la liste screensActive.

- `screensActive` (*string[]*) : Liste remplie en place.

#### `gameplay_multiseat_gamemodeManager.onMissionScreenButtonClicked(button)`

Hook : exécute le callback du bouton cliqué (mgrId 'multiseatGamemode'). Pour l'écran de fin, immédiatement ; pour l'écran de début, après retour à la route multiseat, onUIStartButtonClicked et 0,1 s de délai.

- `button` (*table*) : Bouton avec mgrId et funId.

#### `gameplay_multiseat_gamemodeManager.onMultiseatSettingsApplied(changeSet, result)`

Hook après application des réglages multi-sièges : relance le mode si changeSet.requiresRestart et si l'application a réussi sans exitAfterApply.

- `changeSet` (*table*) : Changements (requiresRestart).
- `result` (*table*) : Résultat (success, exitAfterApply).

#### `gameplay_multiseat_gamemodeManager.onPauseHomeRailBuildMultiseatActions(actions, context, registerButton)`

Hook de construction du menu pause multi-sièges : ajoute le bouton Modes de jeu s'il n'y a pas de mode actif, sinon Réglages, Quitter et Relancer le mode.

- `actions` (*table[]*) : Liste d'actions à compléter.
- `context` (*table*) : Contexte (inutilisé).
- `registerButton` (*function*) : Fonction qui enregistre un bouton et son callback.

#### `gameplay_multiseat_gamemodeManager.onPreRender(dtReal, dtSim)`

Appelé chaque image. En phase 'waiting' avec véhicules en attente : attend qu'ils soient prêts (ou le délai de 5 s), notifie prêt, appelle ext.onReady(vehicles), gèle les véhicules puis affiche l'écran de début.

- `dtReal` (*number*) : Delta temps réel (s).
- `dtSim` (*number*) : Delta temps simulé (s).

#### `gameplay_multiseat_gamemodeManager.onRequestMissionScreenData(mode)`

Hook : quand l'UI demande les données d'écran de mission (mode ne contenant pas 'test'), renvoie l'écran actif via onRequestMissionScreenDataReady et émet onMissionScreenReady.

- `mode` (*string*) : Mode d'écran demandé.

#### `gameplay_multiseat_gamemodeManager.onScreenFadeState(state)`

Hook de fondu d'écran : quand state vaut 1 (écran noir) et qu'un lancement est différé, lance le mode.

- `state` (*integer*) : État du fondu ; 1 = totalement fondu.

#### `gameplay_multiseat_gamemodeManager.onVehicleSwitched(oldId, newId, player)`

Hook de changement de véhicule : relance le mode si en phase 'running' et hors synchronisation des véhicules.

- `oldId` (*integer*) : Ancien id de véhicule.
- `newId` (*integer*) : Nouvel id.
- `player` (*integer*) : Joueur concerné.

#### `gameplay_multiseat_gamemodeManager.playPendingRound()`

Affiche l'écran de début s'il était en attente.

- **renvoie** : boolean true si l'écran a été affiché.

#### `gameplay_multiseat_gamemodeManager.restart(name, settings)`

Relance le mode (celui en cours si name est nil) avec fondu. Si le mode demandé n'est pas le mode actif, appelle start.

- `name` (*string|nil*) : Mode à relancer.
- `settings` (*table|nil*) : Nouveaux réglages ; nil = garder les actuels.
- **renvoie** : boolean false s'il n'y a aucun mode à relancer.

#### `gameplay_multiseat_gamemodeManager.setReadyCallback(callback)`

Définit une fonction appelée une fois, quand le mode passe à la phase 'running' (notifyReady).

- `callback` (*function|nil*) : Fonction sans argument.

#### `gameplay_multiseat_gamemodeManager.shouldAssignVehiclePool()`

Indique si le démarrage a été demandé avec options.assignVehiclePool = true.

- **renvoie** : boolean true si le pool doit être assigné.

#### `gameplay_multiseat_gamemodeManager.showEndScreen(resultData)`

Affiche l'écran de fin : émet onMultiseatGamemodeFinished, met le temps de simulation en pause, puis construit l'écran à partir de resultData et des surcharges de buildEndScreen du mode (header, headerColor, body, layout, pages, buttons). Par défaut : boutons Rejouer, Freeroam, Menu principal.

- `resultData` (*table|nil*) : Champs lus : title, tied, winnerPlayer (index), text.

#### `gameplay_multiseat_gamemodeManager.start(name, settings, options)`

Démarre un mode : charge ui_multiseat_freeroam, arrête le mode précédent, charge l'extension du mode (info.extensionPath), lui assigne ext.info, retient les réglages (défauts de info.settings si nil), désactive le freeroam multi-sièges puis lance le mode (avec fondu sauf options.withFade == false).

- `name` (*string*) : Nom du mode dans le registre.
- `settings` (*table|nil*) : Réglages ; nil = valeurs par défaut.
- `options` (*table|nil*) : withFade (boolean, false = sans fondu), assignVehiclePool (boolean).
- **renvoie** : boolean true si le lancement est démarré, false en cas d'erreur.

## Champs

| Champ | Type | Description |
|---|---|---|
| `ModuleName` | string | Nom du module : 'gamemodeManager'. |

## Hooks émis

Évènements diffusés aux extensions par `extensions.hook` :

- `onGetMultiseatGamemodeInfos`
- `onMissionScreenReady` — écouté par 1 module(s)
- `onMultiseatGamemodeFinished` — écouté par 1 module(s)
- `onMultiseatGamemodeLaunched` — écouté par 1 module(s)
- `onMultiseatGamemodeStopped` — écouté par 1 module(s)
- `onStartScreenFinishedBuilding` — écouté par 1 module(s)
- `onUIStartButtonClicked` — écouté par 2 module(s)

**Évènements UI (guihooks.trigger) :** `OnGamemodeData`, `onRequestMissionScreenDataReady`

## Appels vers le moteur (C++)

- `FS:` `fileExists`, `findFiles`

**Charge les extensions :** `ui_multiseat_freeroam`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/gameplay/multiseat/gamemodeManager.lua`.*

# `telemetry_trackers_splitscreen`

*Fichier : `lua/ge/extensions/telemetry/trackers/splitscreen.lua` · VM : Game Engine (GE) · 184 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `telemetry_trackers_splitscreen` : `extensions.load("telemetry_trackers_splitscreen")`, puis la globale `telemetry_trackers_splitscreen`

Suiveur de télémétrie de l'écran partagé : sessions d'écran partagé, durée d'usage de chaque configuration et modes de jeu multi-siège joués. splitScreenStarted et splitScreenStopped encadrent une session dans un niveau ; l'activité « splitScreenActive » redémarre quand le nombre de joueurs, la disposition ou le mode change ; « splitScreenGamemode » couvre un mode de jeu multi-siège.

## Remarques

- Une demande de démarrage (onSplitScreenStartRequested) est mémorisée 300 s au plus pour documenter l'origine du démarrage (entry, activity, fromMainMenu).
- À la fin d'une manche, seuls le type de résultat (égalité, présence d'un vainqueur) est rapporté, pas les indices de joueurs.
- Raisons de fin de mode de jeu : restarted, switched, stopped, levelEnded, gameExit. Raisons de fin de session : disabled, levelEnded, gameExit.
- onExit et onExtensionUnloaded sont la même fonction (closeAll).

**Dépendances (chargées avant) :** `telemetry_core`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `telemetry_trackers_splitscreen.onClientEndMission()` | Hook appelé à la fin du niveau : clôt mode de jeu, activité et session (raison levelEnded). *(interne)* *(hook)* | 160 |
| `telemetry_trackers_splitscreen.onClientStartMission()` | Hook appelé au démarrage d'un niveau : resynchronise l'état d'écran partagé. *(interne)* *(hook)* | 156 |
| `telemetry_trackers_splitscreen.onExit()` | Hook appelé à la fermeture du jeu : clôt tout (raison gameExit). *(interne)* *(hook)* | 166 |
| `telemetry_trackers_splitscreen.onExtensionLoaded()` | Hook appelé au chargement : déchargement manuel et synchronisation avec la configuration courante de render_splitScreen. *(interne)* *(hook)* | 151 |
| `telemetry_trackers_splitscreen.onExtensionUnloaded()` | Hook appelé au déchargement : clôt tout (même fonction que onExit). *(interne)* *(hook)* | 166 |
| `telemetry_trackers_splitscreen.onMultiseatGamemodeFinished(gamemodeId, result)` | Hook appelé à l'écran de fin d'une manche : émet splitScreenGamemodeFinished (tied, hasWinner). *(interne)* *(hook)* | 132 |
| `telemetry_trackers_splitscreen.onMultiseatGamemodeLaunched(gamemodeId)` | Hook appelé pour chaque manche lancée, y compris un redémarrage depuis l'écran de fin ou le menu pause : termine le mode précédent (restarted ou switched) et démarre l'activité splitScreenGamemode. *(interne)* *(hook)* | 121 |
| `telemetry_trackers_splitscreen.onMultiseatGamemodeStopped()` | Hook appelé quand le mode de jeu s'arrête : termine l'activité avec la raison « stopped ». *(interne)* *(hook)* | 142 |
| `telemetry_trackers_splitscreen.onSplitScreenChanged(enabled, playerCount, layout, mode)` | Hook appelé quand la configuration d'écran partagé change : démarre/met à jour la session et l'activité, ou les termine si désactivé. *(interne)* *(hook)* | 96 |
| `telemetry_trackers_splitscreen.onSplitScreenStartRequested(entry, activity)` | Hook appelé quand le joueur demande le démarrage de l'écran partagé : mémorise l'origine. *(interne)* *(hook)* | 54 |

### Détail des paramètres

#### `telemetry_trackers_splitscreen.onMultiseatGamemodeFinished(gamemodeId, result)`

Hook appelé à l'écran de fin d'une manche : émet splitScreenGamemodeFinished (tied, hasWinner).

- `gamemodeId` (*string*) : Identifiant du mode de jeu.
- `result` (*table|nil*) : Résultat ({tied, winnerPlayer}).

#### `telemetry_trackers_splitscreen.onMultiseatGamemodeLaunched(gamemodeId)`

Hook appelé pour chaque manche lancée, y compris un redémarrage depuis l'écran de fin ou le menu pause : termine le mode précédent (restarted ou switched) et démarre l'activité splitScreenGamemode.

- `gamemodeId` (*string*) : Identifiant du mode de jeu.

#### `telemetry_trackers_splitscreen.onSplitScreenChanged(enabled, playerCount, layout, mode)`

Hook appelé quand la configuration d'écran partagé change : démarre/met à jour la session et l'activité, ou les termine si désactivé.

- `enabled` (*boolean*) : Écran partagé actif.
- `playerCount` (*integer*) : Nombre de joueurs.
- `layout` (*any*) : Disposition.
- `mode` (*any*) : Mode.

#### `telemetry_trackers_splitscreen.onSplitScreenStartRequested(entry, activity)`

Hook appelé quand le joueur demande le démarrage de l'écran partagé : mémorise l'origine.

- `entry` (*string*) : discover ou multiseatSettings.
- `activity` (*string*) : Identifiant du mode de jeu ou « freeroam ».

## Champs

| Champ | Type | Description |
|---|---|---|
| `dependencies` | string[] | telemetry_core. |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/telemetry/trackers/splitscreen.lua`.*

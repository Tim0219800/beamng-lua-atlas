# `core_gamestate`

*Fichier : `lua/ge/extensions/core/gamestate.lua` · VM : Game Engine (GE) · 258 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `core_gamestate` : `extensions.load("core_gamestate")`, puis la globale `core_gamestate`

Extension GE `core_gamestate` : deux rôles. (1) Stocker l'état de JEU (freeroam, campagne… avec disposition d'applis et éléments de menu) et le diffuser aux extensions et à l'UI. (2) Piloter l'écran de chargement : les modules demandent à l'afficher (requestEnterLoadingScreen) et à le fermer (requestExitLoadingScreen) ; l'écran ne se ferme que quand TOUS les demandeurs ont terminé. Un moddeur l'utilise pour afficher l'écran de chargement pendant un travail long.

## Exemple

```lua
core_gamestate.requestEnterLoadingScreen('monMod', function()
  -- appelé quand l'écran de chargement est réellement affiché
  -- ... charger des choses ...
  core_gamestate.requestExitLoadingScreen('monMod')
end)
```

## Remarques

- L'état est une table {state, appLayout, menuItems, options}. setGameState ne remplace que les champs fournis (non nil) ; M.state est reconstruit à chaque appel.
- Écran de chargement : loadingScreenRequests[tag] = true/false ; l'écran se ferme quand toutes les entrées sont false. Le callback de requestEnterLoadingScreen est exécuté tout de suite si l'écran est déjà actif (loadingActive), sinon mis en file jusqu'à loadingScreenActive() (appelée par l'UI). Filet de sécurité : si l'UI ne répond pas, onUpdate force la suite après 1 s cumulée.
- En mode sans UI (argument de ligne de commande -noui) ou headless_mode, requestEnterLoadingScreen exécute le callback immédiatement sans afficher d'écran, et ne l'enregistre pas.
- À la fermeture, si getMissionFilename() == '' (aucun niveau), l'UI est envoyée au menu principal et l'état de jeu est remis à zéro.
- Évènements : hook extensions onGameStateUpdate(state) ; onLoadingScreenInactive(state) ; UI : GameStateUpdate, LoadingScreen {active, gotoMainMenu, gameState}, ShowEntertainingBackground, requestUIInitialised.
- Incohérences : le paramètre ignoreMenuswitch de requestExitLoadingScreen n'est pas utilisé ; gameStateDecorator fait un dump() de debug à chaque appel ; onDeserialized est vide.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `core_gamestate.gameStateDecorator()` | Renvoie le nom de l'état de jeu s'il est non vide (affiche aussi l'état par dump(), debug). | 43 |
| `core_gamestate.getGameState()` | Copie profonde de l'état de jeu. | 39 |
| `core_gamestate.getLoadingStatus(tagName)` | État de la demande d'un module. | 97 |
| `core_gamestate.loading()` | Indique si au moins un module demande l'écran de chargement. À ne pas utiliser pendant le processus de chargement lui-même (le code le déconseille) ; préférer getLoadingStatus. | 93 |
| `core_gamestate.loadingScreenActive()` | Appelé par l'UI quand l'écran de chargement est réellement affiché : marque loadingActive et exécute les callbacks en attente. *(interne)* | 169 |
| `core_gamestate.loadingScreenInactive(state)` | Appelé par l'UI quand l'écran de chargement est fermé : remet les paramètres audio à 0, signale LoadingManager et émet le hook onLoadingScreenInactive. *(interne)* | 175 |
| `core_gamestate.onAfterRouteChange(context)` | Hook de changement de route UI : met à jour la musique du menu principal si les fonctions globales existent. *(interne)* *(hook)* | 224 |
| `core_gamestate.onDeserialized(data)` | Hook de restauration : ne fait rien. *(interne)* *(hook)* | 184 |
| `core_gamestate.onExtensionLoaded()` | Appelé au chargement de l'extension : demande à l'UI de signaler son initialisation (guihooks requestUIInitialised). *(interne)* *(hook)* | 202 |
| `core_gamestate.onUIInitialised()` | Hook (alias de uiReady) appelé quand l'UI est prête : si un chargement attendait l'UI, ré-émet LoadingScreen {active = true}. *(interne)* *(hook)* | 187 |
| `core_gamestate.onUpdate(dtReal, dtSim, dtRaw)` | Hook par image : si des callbacks attendent l'écran de chargement depuis plus d'1 s (temps cumulé borné à 1/30 s par image), force loadingScreenActive. *(interne)* *(hook)* | 210 |
| `core_gamestate.requestEnterLoadingScreen(tagName, func)` | Demande l'affichage de l'écran de chargement au nom d'un module. À la première demande, envoie LoadingScreen {active = true} et règle les paramètres audio g_GameLoading=1 et g_FadeTimeMS=1000. func est appelé quand l'écran est prêt. | 101 |
| `core_gamestate.requestExitLoadingScreen(tagName, ignoreMenuswitch)` | Indique que le demandeur a fini. Quand tous ont fini, l'écran de chargement est masqué (LoadingScreen {active = false, gotoMainMenu, gameState}) et la file de callbacks est vidée. | 141 |
| `core_gamestate.requestGameState()` | Diffuse l'état de jeu courant : hook onGameStateUpdate et évènement UI GameStateUpdate (alias de sendGameState). | 23 |
| `core_gamestate.requestMainMenuState()` | Indique à l'UI s'il faut afficher le fond du menu principal (guihooks ShowEntertainingBackground) : vrai quand getMissionFilename() est vide. Ne change pas la route de l'UI. | 59 |
| `core_gamestate.setGameState(state, appLayout, menuItems, options)` | Met à jour l'état de jeu (freeroam, campagne…) puis le diffuse. Les paramètres nil gardent l'ancienne valeur. | 29 |

### Détail des paramètres

#### `core_gamestate.gameStateDecorator()`

Renvoie le nom de l'état de jeu s'il est non vide (affiche aussi l'état par dump(), debug).

- **renvoie** : string|nil Nom de l'état ou nil.

#### `core_gamestate.getGameState()`

Copie profonde de l'état de jeu.

- **renvoie** : table Copie de M.state.

#### `core_gamestate.getLoadingStatus(tagName)`

État de la demande d'un module.

- `tagName` (*string*) : Identifiant du demandeur.
- **renvoie** : boolean|nil true = demandé, false = terminé, nil = jamais demandé.

#### `core_gamestate.loading()`

Indique si au moins un module demande l'écran de chargement. À ne pas utiliser pendant le processus de chargement lui-même (le code le déconseille) ; préférer getLoadingStatus.

- **renvoie** : boolean true si un chargement est demandé.

#### `core_gamestate.loadingScreenInactive(state)`

Appelé par l'UI quand l'écran de chargement est fermé : remet les paramètres audio à 0, signale LoadingManager et émet le hook onLoadingScreenInactive.

- `state` (*number|string*) : État envoyé par l'UI (converti en nombre si possible).

#### `core_gamestate.onAfterRouteChange(context)`

Hook de changement de route UI : met à jour la musique du menu principal si les fonctions globales existent.

- `context` (*table*) : Contexte avec toRoute.name.

#### `core_gamestate.onDeserialized(data)`

Hook de restauration : ne fait rien.

- `data` (*any*) : Non utilisé.

#### `core_gamestate.onUpdate(dtReal, dtSim, dtRaw)`

Hook par image : si des callbacks attendent l'écran de chargement depuis plus d'1 s (temps cumulé borné à 1/30 s par image), force loadingScreenActive.

- `dtReal` (*number*) : Delta temps réel en secondes.
- `dtSim` (*number*) : Delta simulation.
- `dtRaw` (*number*) : Delta brut.

#### `core_gamestate.requestEnterLoadingScreen(tagName, func)`

Demande l'affichage de l'écran de chargement au nom d'un module. À la première demande, envoie LoadingScreen {active = true} et règle les paramètres audio g_GameLoading=1 et g_FadeTimeMS=1000. func est appelé quand l'écran est prêt.

- `tagName` (*string*) : Identifiant du demandeur (même nom à réutiliser pour la sortie). nil : ignoré.
- `func` (*function|nil*) : Callback à exécuter quand l'écran est affiché.

#### `core_gamestate.requestExitLoadingScreen(tagName, ignoreMenuswitch)`

Indique que le demandeur a fini. Quand tous ont fini, l'écran de chargement est masqué (LoadingScreen {active = false, gotoMainMenu, gameState}) et la file de callbacks est vidée.

- `tagName` (*string*) : Même identifiant que pour l'entrée. Un tag inconnu produit un avertissement.
- `ignoreMenuswitch` (*boolean|nil*) : Non utilisé dans le code.

#### `core_gamestate.requestMainMenuState()`

Indique à l'UI s'il faut afficher le fond du menu principal (guihooks ShowEntertainingBackground) : vrai quand getMissionFilename() est vide. Ne change pas la route de l'UI.

- **renvoie** : boolean true si aucun niveau n'est chargé.

#### `core_gamestate.setGameState(state, appLayout, menuItems, options)`

Met à jour l'état de jeu (freeroam, campagne…) puis le diffuse. Les paramètres nil gardent l'ancienne valeur.

- `state` (*string|nil*) : Nom de l'état de jeu.
- `appLayout` (*any*) : Disposition des applis UI (déduit du code).
- `menuItems` (*any*) : Éléments de menu (déduit du code).
- `options` (*any*) : Options supplémentaires.

## Champs

| Champ | Type | Description |
|---|---|---|
| `state` | table | État de jeu courant {state, appLayout, menuItems, options} ; {} au départ et après un retour au menu principal. |

## Hooks émis

Évènements diffusés aux extensions par `extensions.hook` :

- `onGameStateUpdate` — écouté par 3 module(s)
- `onLoadingScreenInactive` — écouté par 1 module(s)

**Évènements UI (guihooks.trigger) :** `GameStateUpdate`, `LoadingScreen`, `ShowEntertainingBackground`, `requestUIInitialised`

## Appels vers le moteur (C++)

- `Engine.` `getStartingArgs`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/core/gamestate.lua`.*

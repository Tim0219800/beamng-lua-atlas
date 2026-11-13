# `ui_menuManager`

*Fichier : `lua/ge/extensions/ui/menuManager.lua` · VM : Game Engine (GE) · 344 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `ui_menuManager` : `extensions.load("ui_menuManager")`, puis la globale `ui_menuManager`

Décide quelle route de l'interface (ui_router) afficher quand le joueur ouvre, ferme ou bascule le menu : menu principal, menu pause v2, garage, écrans de mission ou de scénario, ou retour au jeu. Il émet les hooks onBeforeMenuOpened et onMenuToggled. Un moddeur l'utilise pour ouvrir/fermer le menu par script ou pour définir la route de jeu (setGameplayRoute) ou de pause (setPauseRoute) actives.

## Remarques

- La plupart des fonctions renvoient une table {handled = true, targetRoute, navigation} ou {handled = false, reason = "no_current_route"} quand aucune route n'est active.
- Sans niveau chargé (getMissionFilename vide), la seule destination « menu » valide est « menu » (menu principal) ; pause et play sont des routes de niveau.
- Route de jeu par défaut : « play ». Routes de pause : « pause » (pause v2, ou « pause.replay:pause-replay-player » si un replay est chargé), ou « menu.careerPause » en carrière si pause v2 est désactivé.
- pauseV2Enabled est une variable locale fixée à true ; aucune fonction ne la modifie, isPauseV2Enabled renvoie donc toujours true.
- Quand un retour est bloqué par une garde de route (guard_blocked_exit), la sortie n'est forcée vers le menu qu'au 6e blocage consécutif (BLOCK_FORCE_THRESHOLD).
- En mode garage, toggleMenu ouvre « garage » depuis « menu », ne fait rien si déjà sur « garage », sinon revient en arrière.
- Pendant un scénario à l'état pre-running, toggleMenu ouvre « scenario.start » ; à l'état finished/post, l'écran de fin (scenario.end, scenario.quickrace.end ou scenario.chapter.end).
- Des alias de routes existent pour MenuOpenModule : vehicleselect -> menu.vehicles, vehicleconfig -> menu.vehicleconfig.parts, vehicledebug -> menu.vehicleconfig.debug, appedit -> pause.hudApps.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `ui_menuManager.MenuOpenModule(data)` | Navigue vers une route : soit une chaîne (nom de route, alias, ou « options » qui devient « pause.options » en niveau), soit une table {state, params}. Ne renvoie rien. | 318 |
| `ui_menuManager.closeMenu()` | Revient à la route de jeu active (émet onMenuToggled(false)), sauf si on est déjà sur une route de jeu ou sur « garage » ou s'il n'y a pas de route courante. | 309 |
| `ui_menuManager.closeToMenu()` | Navigue directement vers la route « menu » (menu principal), sans émettre onMenuToggled. | 305 |
| `ui_menuManager.getGameplayRoute()` | Renvoie la route de jeu active. | 21 |
| `ui_menuManager.isPauseV2Enabled()` | Indique si le menu pause v2 est actif (toujours true dans cette version, voir notes). | 339 |
| `ui_menuManager.menuHide(showMenu)` | Affiche le menu (route de menu/pause) si showMenu est vrai, sinon la route de jeu. | 327 |
| `ui_menuManager.openMenu()` | Ouvre le menu (route de pause ou menu principal) sauf si on y est déjà. Émet onBeforeMenuOpened puis onMenuToggled(true). | 296 |
| `ui_menuManager.setGameplayRoute(route)` | Définit la route considérée comme « jeu » (« play » si nil). | 13 |
| `ui_menuManager.setPauseRoute(route)` | Définit une route de pause spécifique, prioritaire sur « pause » quand un niveau est chargé (nil pour revenir au comportement par défaut). | 17 |
| `ui_menuManager.toggleMenu()` | Bascule entre le jeu et le menu (touche Échap). Gère les cas sans niveau, garage, écrans de mission (mission.control), scénarios, jeu vers menu, menu vers jeu, sinon navigue en arrière. | 201 |

### Détail des paramètres

#### `ui_menuManager.MenuOpenModule(data)`

Navigue vers une route : soit une chaîne (nom de route, alias, ou « options » qui devient « pause.options » en niveau), soit une table {state, params}. Ne renvoie rien.

- `data` (*string|table*) : Nom de route ou {state = route, params = table}.

#### `ui_menuManager.closeMenu()`

Revient à la route de jeu active (émet onMenuToggled(false)), sauf si on est déjà sur une route de jeu ou sur « garage » ou s'il n'y a pas de route courante.

- **renvoie** : table {handled = true, ...}.

#### `ui_menuManager.closeToMenu()`

Navigue directement vers la route « menu » (menu principal), sans émettre onMenuToggled.

- **renvoie** : table {handled = true, targetRoute = "menu", navigation}.

#### `ui_menuManager.getGameplayRoute()`

Renvoie la route de jeu active.

- **renvoie** : string « play » par défaut.

#### `ui_menuManager.isPauseV2Enabled()`

Indique si le menu pause v2 est actif (toujours true dans cette version, voir notes).

- **renvoie** : boolean true.

#### `ui_menuManager.menuHide(showMenu)`

Affiche le menu (route de menu/pause) si showMenu est vrai, sinon la route de jeu.

- `showMenu` (*boolean*) : true pour afficher le menu.
- **renvoie** : table {handled = true, targetRoute, navigation}.

#### `ui_menuManager.openMenu()`

Ouvre le menu (route de pause ou menu principal) sauf si on y est déjà. Émet onBeforeMenuOpened puis onMenuToggled(true).

- **renvoie** : table {handled = true, ...}.

#### `ui_menuManager.setGameplayRoute(route)`

Définit la route considérée comme « jeu » (« play » si nil).

- `route` (*string|nil*) : Nom de route.

#### `ui_menuManager.setPauseRoute(route)`

Définit une route de pause spécifique, prioritaire sur « pause » quand un niveau est chargé (nil pour revenir au comportement par défaut).

- `route` (*string|nil*) : Nom de route.

#### `ui_menuManager.toggleMenu()`

Bascule entre le jeu et le menu (touche Échap). Gère les cas sans niveau, garage, écrans de mission (mission.control), scénarios, jeu vers menu, menu vers jeu, sinon navigue en arrière.

- **renvoie** : table {handled = boolean, ...} avec targetRoute et navigation selon le cas.

## Hooks émis

Évènements diffusés aux extensions par `extensions.hook` :

- `onBeforeMenuOpened` — écouté par 1 module(s)
- `onMenuToggled` — écouté par 1 module(s)

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/ui/menuManager.lua`.*

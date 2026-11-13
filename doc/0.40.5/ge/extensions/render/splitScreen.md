# `render_splitScreen`

*Fichier : `lua/ge/extensions/render/splitScreen.lua` · VM : Game Engine (GE) · 623 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `render_splitScreen` : `extensions.load("render_splitScreen")`, puis la globale `render_splitScreen`

Écran partagé (multiseat) : crée une vue de rendu par joueur (RenderViewManagerInstance, vues nommées 'splitscreen0', 'splitscreen1'...), calcule la disposition à l'écran avec render_splitScreenLayouts selon le nombre de joueurs et le réglage multiseatLayout<N>, gère les contextes caméra par joueur, les étiquettes de joueurs et le HUD Vue 'multiseat'. L'extension s'active dès son chargement (onExtensionLoaded appelle enable) et se désactive au déchargement. Un moddeur ou une mission peut imposer la liste des joueurs avec setCustomPlayers.

## Exemple

```lua
extensions.load('render_splitScreen')
render_splitScreen.setCustomPlayers({0, 1})  -- deux vues, joueurs 0 et 1
-- ...
render_splitScreen.clearCustomPlayers()
extensions.unload('render_splitScreen')
```

## Remarques

- Dépend de core_playerPersonas, render_playerTags et render_playerCompassMarkers (chargés avant).
- Maximum 64 vues (une par joueur). Liste de joueurs vide : renvoie {0}.
- Pour économiser le rendu, chaque vue reçoit un facteur de qualité (meshDetailAdjust et groundCoverScale multipliés) : 1.0 pour 1 vue, 0.75 pour 2, 0.6 pour 3, 0.5 pour 4 et au-delà. Les miroirs et réflexions dynamiques des véhicules sont coupés sauf pour la vue en solo. Les réglages graphiques de l'utilisateur ne sont pas modifiés.
- En activant l'extension : les actions 'vehicleMenues' et 'nodegrabber' sont bloquées, le réglage 'multiseat' est mis à true et la route de jeu 'multiseat' est installée.
- Mode 'shared' (disposition partagée) : une seule vue principale est rendue ; mode 'split' : une vue par joueur.
- La fonction 'performance preset' (setPerformancePreset) existe mais son appel est commenté : inutilisée.
- Hooks émis : onSplitScreenChanged(enabled, playerCount, layoutId, mode) à l'activation et quand les joueurs ou la disposition changent (false seul à la désactivation), et onSplitScreenLayoutChanged() à chaque nouveau calcul de disposition. Évènement UI : MultiseatHudData(count, layout, players, mode) ou MultiseatHudData(0).

**Dépendances (chargées avant) :** `core_playerPersonas`, `render_playerTags`, `render_playerCompassMarkers`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `render_splitScreen.beginSoloView(player, options)` | Affiche temporairement un seul joueur en plein écran sans changer la liste des participants ni l'état du HUD. Avec options.mainView = true, utilise la vue principale ; sinon agrandit la vue du joueur avec une caméra 'orbit'. Les étiquettes de joueurs sont supprimées pendant la vue solo. | 482 |
| `render_splitScreen.clearCustomPlayers()` | Raccourci pour setCustomPlayers(nil). | 377 |
| `render_splitScreen.endSoloView()` | Termine la vue solo et restaure la caméra du contexte et la disposition. | 458 |
| `render_splitScreen.getCurrentConfiguration()` | Renvoie la configuration d'affichage courante. | 562 |
| `render_splitScreen.getPlayers(result)` | Renvoie la liste ordonnée des indices de joueurs qui ont une vue : la liste personnalisée de setCustomPlayers si elle existe, sinon core_multiseat.getPlayers. Limitée à 64 ; contient {0} si vide. | 82 |
| `render_splitScreen.isSharedView()` | Vrai si l'écran partagé est actif, rendu en vue partagée et sans vue solo. | 567 |
| `render_splitScreen.onAfterRouteChange(context)` | Hook de changement de route de l'UI : renvoie l'état du HUD à chaque entrée dans la route 'multiseat', car la vue Vue est remontée avec sa route. *(interne)* *(hook)* | 433 |
| `render_splitScreen.onClientEndMission()` | Hook de fin de mission : termine la vue solo (endSoloView). *(interne)* *(hook)* | 458 |
| `render_splitScreen.onDeserialized(data)` | Hook appelé après un rechargement Lua GE : restaure la liste de joueurs sauvegardée et réactive l'écran partagé. *(interne)* *(hook)* | 583 |
| `render_splitScreen.onExtensionLoaded(data)` | Hook de chargement de l'extension : restaure customPlayers si des données sont fournies et active l'écran partagé. *(interne)* *(hook)* | 593 |
| `render_splitScreen.onExtensionUnloaded(preserveRoute)` | Hook de déchargement : alias de disable(preserveRoute). Détruit les vues, rend le monde sur la vue principale, remet l'exposition à zéro et rétablit la route de jeu 'play' sauf si preserveRoute. *(interne)* *(hook)* | 396 |
| `render_splitScreen.onSerialize(reason)` | Hook appelé avant un rechargement Lua GE : renvoie {customPlayers} et désactive l'écran partagé en conservant la route, pour détruire les vues C++. *(interne)* *(hook)* | 571 |
| `render_splitScreen.onSettingsChanged()` | Hook appelé quand les réglages changent : reconstruit les surcharges de qualité des vues, qui sont un instantané des réglages globaux. *(interne)* *(hook)* | 448 |
| `render_splitScreen.onUpdate(dtReal, dtSim)` | Hook appelé à chaque image : recalcule la configuration (joueurs, taille de fenêtre, disposition) et met à jour les marqueurs de boussole des joueurs. *(interne)* *(hook)* | 440 |
| `render_splitScreen.refreshLayout()` | Force le recalcul de la disposition au prochain passage (réinitialise la taille mémorisée) et le fait tout de suite si actif. | 556 |
| `render_splitScreen.setCustomPlayers(players)` | Impose la liste des joueurs qui doivent avoir une vue (par exemple pour une mission), ou la supprime avec nil. Une liste vide équivaut à nil. Si l'écran partagé est actif, recalcule tout de suite. | 360 |
| `render_splitScreen.toggleFreeCam(player)` | Passe la vue propre à ce joueur au groupe de caméras suivant (core_camera.cycleCameraGroup). | 549 |

### Détail des paramètres

#### `render_splitScreen.beginSoloView(player, options)`

Affiche temporairement un seul joueur en plein écran sans changer la liste des participants ni l'état du HUD. Avec options.mainView = true, utilise la vue principale ; sinon agrandit la vue du joueur avec une caméra 'orbit'. Les étiquettes de joueurs sont supprimées pendant la vue solo.

- `player` (*integer*) : Indice du joueur (converti par tonumber).
- `options` (*table|nil*) : {mainView = boolean}.
- **renvoie** : boolean false si player n'est pas numérique ou n'est pas dans la liste des joueurs configurés (ou sans vue) ; true sinon.

#### `render_splitScreen.endSoloView()`

Termine la vue solo et restaure la caméra du contexte et la disposition.

- **renvoie** : boolean true si une vue solo était active.

#### `render_splitScreen.getCurrentConfiguration()`

Renvoie la configuration d'affichage courante.

- **renvoie** : boolean false si l'écran partagé est inactif.
- **renvoie** : integer|nil Nombre de joueurs.
- **renvoie** : string|nil Identifiant de disposition.
- **renvoie** : string|nil Mode : 'shared' ou 'split'.

#### `render_splitScreen.getPlayers(result)`

Renvoie la liste ordonnée des indices de joueurs qui ont une vue : la liste personnalisée de setCustomPlayers si elle existe, sinon core_multiseat.getPlayers. Limitée à 64 ; contient {0} si vide.

- `result` (*integer[]|nil*) : Table à remplir et renvoyer (réutilisable pour éviter une allocation) ; créée si nil.
- **renvoie** : integer[] Indices de joueurs.

#### `render_splitScreen.isSharedView()`

Vrai si l'écran partagé est actif, rendu en vue partagée et sans vue solo.

- **renvoie** : boolean État.

#### `render_splitScreen.onAfterRouteChange(context)`

Hook de changement de route de l'UI : renvoie l'état du HUD à chaque entrée dans la route 'multiseat', car la vue Vue est remontée avec sa route.

- `context` (*table*) : Contexte de navigation (context.toRoute.name).

#### `render_splitScreen.onDeserialized(data)`

Hook appelé après un rechargement Lua GE : restaure la liste de joueurs sauvegardée et réactive l'écran partagé.

- `data` (*table*) : Données de onSerialize (customPlayers).

#### `render_splitScreen.onExtensionLoaded(data)`

Hook de chargement de l'extension : restaure customPlayers si des données sont fournies et active l'écran partagé.

- `data` (*table|nil*) : Données sérialisées éventuelles.

#### `render_splitScreen.onExtensionUnloaded(preserveRoute)`

Hook de déchargement : alias de disable(preserveRoute). Détruit les vues, rend le monde sur la vue principale, remet l'exposition à zéro et rétablit la route de jeu 'play' sauf si preserveRoute.

- `preserveRoute` (*boolean|nil*) : Si vrai, ne change pas la route de jeu.

#### `render_splitScreen.onSerialize(reason)`

Hook appelé avant un rechargement Lua GE : renvoie {customPlayers} et désactive l'écran partagé en conservant la route, pour détruire les vues C++.

- `reason` (*string*) : Raison de la sérialisation (utilisée dans le log).
- **renvoie** : table {customPlayers = ...}.

#### `render_splitScreen.onUpdate(dtReal, dtSim)`

Hook appelé à chaque image : recalcule la configuration (joueurs, taille de fenêtre, disposition) et met à jour les marqueurs de boussole des joueurs.

- `dtReal` (*number*) : Durée réelle de l'image (s).
- `dtSim` (*number*) : Durée simulée (s), non utilisée.

#### `render_splitScreen.setCustomPlayers(players)`

Impose la liste des joueurs qui doivent avoir une vue (par exemple pour une mission), ou la supprime avec nil. Une liste vide équivaut à nil. Si l'écran partagé est actif, recalcule tout de suite.

- `players` (*integer[]|nil*) : Indices de joueurs ordonnés, ou nil pour effacer la surcharge.

#### `render_splitScreen.toggleFreeCam(player)`

Passe la vue propre à ce joueur au groupe de caméras suivant (core_camera.cycleCameraGroup).

- `player` (*integer*) : Indice du joueur.
- **renvoie** : boolean false si le joueur n'a pas de vue d'écran partagé (l'appelant peut alors utiliser le basculement de caméra principale).

## Champs

| Champ | Type | Description |
|---|---|---|
| `dependencies` | string[] | Extensions chargées avant : core_playerPersonas, render_playerTags, render_playerCompassMarkers. |

## Hooks émis

Évènements diffusés aux extensions par `extensions.hook` :

- `onSplitScreenChanged` — écouté par 5 module(s)
- `onSplitScreenLayoutChanged` — écouté par 1 module(s)

**Évènements UI (guihooks.trigger) :** `MultiseatHudData`

## Appels vers le moteur (C++)

- `scenetree.` `findObject`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/render/splitScreen.lua`.*

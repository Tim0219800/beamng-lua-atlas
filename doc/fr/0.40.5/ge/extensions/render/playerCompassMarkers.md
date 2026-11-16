# `render_playerCompassMarkers`

*Fichier : `lua/ge/extensions/render/playerCompassMarkers.lua` · VM : Game Engine (GE) · 271 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `render_playerCompassMarkers` : `extensions.load("render_playerCompassMarkers")`, puis la globale `render_playerCompassMarkers`

Indicateurs de direction des autres joueurs pour l'écran partagé (multi-sièges en freeroam). Pour chaque vue, dessine en haut de la vue une pastille colorée par autre joueur, positionnée horizontalement selon la direction où il se trouve (comme une boussole), dans une texture ImGui transparente. Piloté par render_splitScreen (appel de update chaque frame). Dépend de ui_imgui, core_gamestate, core_camera. Global : render_playerCompassMarkers.

## Remarques

- Actif seulement si : ui_multiseat_freeroam.isActive(), enabled vrai, TextureDrawPrimitiveRegistry disponible, au moins 2 joueurs, et pas pendant un écran de chargement (suppression tant que le chargement n'est pas terminé, levée par onLoadingScreenInactive(2)). Sinon destroy() libère textures et états.
- Un marqueur apparaît pour un joueur seulement s'il est à plus de 40 m (hideDistance) ; toujours affiché au-delà de 100 m (alwaysShowDistance) ; entre les deux il n'est affiché que s'il est masqué à la vue (rayon castRayStatic de la caméra vers lui, uniquement s'il est dans le frustum). Un changement d'état doit rester stable 3 s (visibilityDelay) avant de prendre effet, avec un fondu de 0,5 s.
- La marge de sécurité reproduit la variable CSS --safezone de l'UI (réglage uiLayoutSafeArea, borné à 0.8..1 par défaut 0.98, zone limitée au 16:9).
- Chaque vue fournit un markerRect {x, y, largeur, hauteur} en pixels ; la couleur de chaque joueur est une chaîne hexadécimale '#RRGGBB' (playerInfo.color).
- Taille du marqueur : markerScale 0.4, fond d'alpha 77, marqueur d'alpha 255 (valeurs locales).

**Dépendances (chargées avant) :** `ui_imgui`, `core_gamestate`, `core_camera`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `render_playerCompassMarkers.destroy()` | Libère les textures de direction enregistrées et réinitialise les états ; sans effet si déjà inactif. | 54 |
| `render_playerCompassMarkers.onLoadingScreenInactive(state)` | Hook de l'écran de chargement : quand state vaut 2, lève la suppression des marqueurs. *(interne)* *(hook)* | 260 |
| `render_playerCompassMarkers.update(enabled, views, players, vehicleForPlayer)` | Met à jour et dessine les marqueurs de direction pour toutes les vues d'écran partagé (collecte, texture, fenêtre ImGui sans fond ni entrées par vue). *(interne)* | 179 |

### Détail des paramètres

#### `render_playerCompassMarkers.onLoadingScreenInactive(state)`

Hook de l'écran de chargement : quand state vaut 2, lève la suppression des marqueurs.

- `state` (*integer*) : État de l'écran de chargement (2 = terminé, déduit du code).

#### `render_playerCompassMarkers.update(enabled, views, players, vehicleForPlayer)`

Met à jour et dessine les marqueurs de direction pour toutes les vues d'écran partagé (collecte, texture, fenêtre ImGui sans fond ni entrées par vue).

- `enabled` (*boolean*) : Activer la fonction.
- `views` (*table[]*) : Vues : {name, player, markerRect = {x, y, w, h}}.
- `players` (*table[]*) : Joueurs : {player, color = '#RRGGBB'}.
- `vehicleForPlayer` (*function*) : function(player) -> objet véhicule ou nil.

## Champs

| Champ | Type | Description |
|---|---|---|
| `dependencies` | table |  |

## Appels vers le moteur (C++)

- `scenetree.` `findObject`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/render/playerCompassMarkers.lua`.*

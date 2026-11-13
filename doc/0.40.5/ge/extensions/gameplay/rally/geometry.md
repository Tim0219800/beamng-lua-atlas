# `gameplay_rally_geometry`

*Fichier : `lua/ge/extensions/gameplay/rally/geometry.lua` · VM : Game Engine (GE) · 544 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `gameplay_rally_geometry` : `extensions.load("gameplay_rally_geometry")`, puis la globale `gameplay_rally_geometry`

Prototype de génération automatique de notes de rallye à partir de la géométrie de la route. Quand un marqueur de route (ground marker) est actif, il calcule une trajectoire optimisée entre départ et arrivée (map.optimizePath), la sauvegarde dans temp/, puis estime pour chaque nœud le rayon de courbure, la vitesse de passage (pneus slick, frottement 1,7) et une sévérité (Hairpin, Medium, Fast, Easy, Flat, Straight), regroupe les nœuds en notes (ex. 'Medium left long tightens') et les dessine avec debugDrawer. Pendant la conduite, il affiche les notes à venir et envoie le texte à l'UI via guihooks 'ScenarioRealtimeDisplay'. Sans marqueur, il recharge la dernière route sauvegardée.

## Remarques

- Seul le hook onUpdate est exporté ; tout le reste est local.
- BUG : getRouteJsonPath appelle string.format avec les variables `level` et `map` non définies localement (la variable locale s'appelle levelName). Le format ne contient qu'un %s : le fichier est donc toujours temp/rally_route_nil.json, quel que soit le niveau.
- BUG : renderNode lit `currentVelocity`, variable globale inexistante (nil) : la vitesse affichée est toujours celle du nœud.
- Deux tables 'severities' sont déclarées ; la seconde (Hairpin, 2 à 6, vitesses max 50/80/110/150/200/300 km/h) masque la première et seule elle est utilisée.
- Les vitesses des nœuds sont en km/h, les longueurs en m, les angles en degrés (positif = droite).
- Le seuil 'debug = true' fait dessiner toutes les notes quand le véhicule est à l'arrêt (vitesse < 1 m/s) ; en mouvement seules les notes proches sont dessinées.
- Outil de développement : il ne produit pas de carnet de notes utilisable par le système de rallye principal.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `gameplay_rally_geometry.onUpdate(dt, dtSim)` | Hook appelé à chaque frame. (Re)génère les notes si la source change (marqueur de route actif ou cache fichier), puis lit la position et la vitesse du véhicule joueur et dessine les notes : toutes si le véhicule est à l'arrêt, sinon les notes des 4 prochaines secondes (au moins 2), et envoie la 2e note (si ce n'est pas une ligne droite) au message d'UI ScenarioRealtimeDisplay. *(interne)* *(hook)* | 502 |

### Détail des paramètres

#### `gameplay_rally_geometry.onUpdate(dt, dtSim)`

Hook appelé à chaque frame. (Re)génère les notes si la source change (marqueur de route actif ou cache fichier), puis lit la position et la vitesse du véhicule joueur et dessine les notes : toutes si le véhicule est à l'arrêt, sinon les notes des 4 prochaines secondes (au moins 2), et envoie la 2e note (si ce n'est pas une ligne droite) au message d'UI ScenarioRealtimeDisplay.

- `dt` (*number*) : Delta de temps réel (s).
- `dtSim` (*number*) : Delta de temps de simulation (s) ; inférieur à 0,001 = jeu en pause (affiche alors le détail des nœuds).

**Évènements UI (guihooks.trigger) :** `ScenarioRealtimeDisplay`

## Appels vers le moteur (C++)

- `debugDrawer:` `drawCylinder`, `drawSphere`, `drawTextAdvanced`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/gameplay/rally/geometry.lua`.*

# `gameplay_crawl_debugDraw`

*Fichier : `lua/ge/extensions/gameplay/crawl/debugDraw.lua` · VM : Game Engine (GE) · 121 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `gameplay_crawl_debugDraw` : `extensions.load("gameplay_crawl_debugDraw")`, puis la globale `gameplay_crawl_debugDraw`

Visualisation de debug en lecture seule des parcours du mode crawl, via debugDrawer : points de passage (sphères, flèches de direction, étiquettes) et segments, zone limite, position de départ. Partagé par l'éditeur de crawl et l'overlay de dev en jeu pour garder un rendu cohérent. À appeler à chaque image de rendu.

## Exemple

```lua
gameplay_crawl_debugDraw.drawPath(path.nodes, {maxDist = 200, showSegmentDistance = true})
```

## Remarques

- Couleurs : noeud normal blanc, point de récupération jaune, bonus violet, dernier noeud bleu ; flèche verte ; segments bleu clair.
- Les noeuds et segments au-delà de maxDist (400 m par défaut) de la caméra ne sont pas dessinés.
- Le rayon de sphère d'un noeud est node.radius (4.0 m par défaut) ; celui de la position de départ est transform.radius (10.0 m par défaut).
- Cette page n'exporte pas d'autres fonctions ; dessiner ne modifie aucune donnée.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `gameplay_crawl_debugDraw.drawBoundary(boundary, drawMode)` | Dessine la zone limite en appelant boundary:drawDebug(drawMode) (le culling caméra est fait par la zone). | 99 |
| `gameplay_crawl_debugDraw.drawPath(nodes, opts)` | Dessine chaque noeud (sphère, flèche selon sa rotation, étiquette « indice: nom [REC]/[BONUS] ») et les cylindres entre noeuds consécutifs, avec éventuellement la distance cumulée. | 53 |
| `gameplay_crawl_debugDraw.drawStartingPosition(startingPosition)` | Dessine la sphère de la zone de départ, une flèche de direction et, si présent, une petite sphère à iconPosition. | 105 |

### Détail des paramètres

#### `gameplay_crawl_debugDraw.drawBoundary(boundary, drawMode)`

Dessine la zone limite en appelant boundary:drawDebug(drawMode) (le culling caméra est fait par la zone).

- `boundary` (*table|nil*) : Zone avec la méthode drawDebug.
- `drawMode` (*any*) : Mode de dessin transmis tel quel à drawDebug.

#### `gameplay_crawl_debugDraw.drawPath(nodes, opts)`

Dessine chaque noeud (sphère, flèche selon sa rotation, étiquette « indice: nom [REC]/[BONUS] ») et les cylindres entre noeuds consécutifs, avec éventuellement la distance cumulée.

- `nodes` (*table<integer, table>*) : Noeuds : pos (vec3), radius, rotation (quat), name, flags (isRecoveryCheckpoint, isBonusCheckpoint).
- `opts` (*table|nil*) : {maxDist = number (m, 400 par défaut), showSegmentDistance = boolean, showLabels = boolean (vrai par défaut)}.

#### `gameplay_crawl_debugDraw.drawStartingPosition(startingPosition)`

Dessine la sphère de la zone de départ, une flèche de direction et, si présent, une petite sphère à iconPosition.

- `startingPosition` (*table|nil*) : Position de départ : transform (position, rotation, radius) et iconPosition.

## Appels vers le moteur (C++)

- `debugDrawer:` `drawCylinder`, `drawSphere`, `drawSquarePrism`, `drawTextAdvanced`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/gameplay/crawl/debugDraw.lua`.*

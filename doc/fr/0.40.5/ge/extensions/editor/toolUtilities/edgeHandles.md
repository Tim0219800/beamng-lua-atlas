# `editor_toolUtilities_edgeHandles`

*Fichier : `lua/ge/extensions/editor/toolUtilities/edgeHandles.lua` · VM : Game Engine (GE) · 148 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_toolUtilities_edgeHandles` : `extensions.load("editor_toolUtilities_edgeHandles")`, puis la globale `editor_toolUtilities_edgeHandles`

Utilitaire d'outils d'éditeur pour des poignées « portes » (gates) déplaçables le long du contour d'un polygone (ring : liste de points {x,y}). Une porte est { edge, t, id } : indice d'arête et position t (0..1) sur cette arête. Fournit l'accrochage au contour, les portes par défaut (extrémités du grand axe), la géométrie d'une poignée flottante hors du bord et son dessin via debugDraw.

## Remarques

- Le ring est fermé implicitement : l'arête i va du point i au point (i % n) + 1.
- Le centre utilisé (centroid) est la moyenne simple des sommets, pas pondérée par l'aire.
- gateWorldDir renvoie 4 valeurs (wx, wy, nx, ny), la normale pointant à l'opposé du centre du ring.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_toolUtilities_edgeHandles.defaultGates(ring)` | Deux portes par défaut aux extrémités opposées du grand axe du ring (entrée, sortie). | 99 |
| `editor_toolUtilities_edgeHandles.drawHandle(gp, cp, e1, e2, base, glow, hovered)` | Dessine la poignée (points de handleGeom) : tige du bord à la barre, barre avec points d'extrémité, bouton central qui pulse au survol. | 127 |
| `editor_toolUtilities_edgeHandles.gateWorldDir(ring, gate)` | Position monde d'une porte et normale unitaire sortante de son arête (à l'opposé du centre du ring). | 84 |
| `editor_toolUtilities_edgeHandles.handleGeom(ring, gate, outDist, halfWidth, liftFn)` | Géométrie de la poignée saisissable d'une porte : la barre flotte à outDist mètres hors du bord et s'étend de halfWidth mètres de chaque côté. | 115 |
| `editor_toolUtilities_edgeHandles.nearestGate(ring, px, py)` | Accroche un point du monde (px,py) à la porte la plus proche sur le contour. | 68 |
| `editor_toolUtilities_edgeHandles.tagGates(gates)` | Donne un id unique (Engine.generateUUID) à chaque porte qui n'en a pas, puis renvoie la liste. Une porte n'est sinon repérée que par sa position dans la liste, qui change quand une porte précédente est retirée. | 60 |

### Détail des paramètres

#### `editor_toolUtilities_edgeHandles.defaultGates(ring)`

Deux portes par défaut aux extrémités opposées du grand axe du ring (entrée, sortie).

- `ring` (*table*) : Liste de points {x,y}
- **renvoie** : table Porte d'entrée { edge, t }
- **renvoie** : table Porte de sortie { edge, t }

#### `editor_toolUtilities_edgeHandles.drawHandle(gp, cp, e1, e2, base, glow, hovered)`

Dessine la poignée (points de handleGeom) : tige du bord à la barre, barre avec points d'extrémité, bouton central qui pulse au survol.

- `gp` (*vec3*) : Point sur le bord
- `cp` (*vec3*) : Centre de la barre
- `e1` (*vec3*) : Extrémité 1
- `e2` (*vec3*) : Extrémité 2
- `base` (*integer*) : Couleur de base (packée)
- `glow` (*integer*) : Couleur de halo (packée)
- `hovered` (*boolean*) : true si survolée

#### `editor_toolUtilities_edgeHandles.gateWorldDir(ring, gate)`

Position monde d'une porte et normale unitaire sortante de son arête (à l'opposé du centre du ring).

- `ring` (*table*) : Liste de points {x,y}
- `gate` (*table*) : { edge, t }
- **renvoie** : number wx
- **renvoie** : number wy
- **renvoie** : number nx (normale sortante)
- **renvoie** : number ny (normale sortante)

#### `editor_toolUtilities_edgeHandles.handleGeom(ring, gate, outDist, halfWidth, liftFn)`

Géométrie de la poignée saisissable d'une porte : la barre flotte à outDist mètres hors du bord et s'étend de halfWidth mètres de chaque côté.

- `ring` (*table*) : Liste de points {x,y}
- `gate` (*table|nil*) : { edge, t }
- `outDist` (*number*) : Distance de la barre au bord (m)
- `halfWidth` (*number*) : Demi-largeur de la barre (m)
- `liftFn` (*function|nil*) : function(x,y) -> vec3 qui pose un point sur le terrain ; plan z=0 par défaut.
- **renvoie** : vec3|nil Point sur le bord
- **renvoie** : vec3 Centre de la barre (bouton de saisie)
- **renvoie** : vec3 Extrémité 1 de la barre
- **renvoie** : vec3 Extrémité 2 de la barre

#### `editor_toolUtilities_edgeHandles.nearestGate(ring, px, py)`

Accroche un point du monde (px,py) à la porte la plus proche sur le contour.

- `ring` (*table*) : Liste de points {x=,y=}
- `px` (*number*) : x monde
- `py` (*number*) : y monde
- **renvoie** : table { edge = indice d'arête, t = position 0..1 }

#### `editor_toolUtilities_edgeHandles.tagGates(gates)`

Donne un id unique (Engine.generateUUID) à chaque porte qui n'en a pas, puis renvoie la liste. Une porte n'est sinon repérée que par sa position dans la liste, qui change quand une porte précédente est retirée.

- `gates` (*table|nil*) : Liste de portes { edge, t, id? }
- **renvoie** : table|nil La même liste, portes nommées.

## Appels vers le moteur (C++)

- `Engine.` `generateUUID`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/toolUtilities/edgeHandles.lua`.*

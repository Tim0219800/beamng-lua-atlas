# `editor_toolUtilities_render_spheres`

*Fichier : `lua/ge/extensions/editor/toolUtilities/render/spheres.lua` · VM : Game Engine (GE) · 228 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_toolUtilities_render_spheres` : `extensions.load("editor_toolUtilities_render_spheres")`, puis la globale `editor_toolUtilities_render_spheres`

Dessin de sphères et de poignées de debug pour les outils d'édition de splines (issu de l'ancien render.lua). Module feuille : dépend de utils/debugDraw et du style partagé. Le rayon est proportionnel à la distance à la caméra (taille apparente constante jusqu'à 60 m, puis taille monde fixe), via getSphereScale que réutilisent les modules render/spline, transport et graph. Contient les nœuds, jonctions, poignées de barre et de courbe, surbrillances (survol, sélection, pulsées dans le temps) et fantômes « rayons X » sans test de profondeur.

## Remarques

- Les variantes « Culled » (et la plupart des dessins de nœuds) ne dessinent qu'à moins de 600 m de la caméra ; drawSphereCursor et drawSphereImmediate ne sont pas filtrées.
- Les surbrillances pulsent avec os.clock() selon les fréquences du style (highlightPulseHz, highlightHoverPulseHz).
- Les fonctions « Fixed » prennent un rayon monde fixe au lieu de l'échelle liée à la distance.
- Les fantômes (Ghost) et surbrillances sont dessinés sans test de profondeur : visibles à travers le terrain.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_toolUtilities_render_spheres.drawHoverNavGraphNode(p)` | Halo pulsé d'un nœud de navGraph survolé. | 122 |
| `editor_toolUtilities_render_spheres.drawPathNode(p)` | Nœud de chemin (colourPathNode). | 112 |
| `editor_toolUtilities_render_spheres.drawSelectedNavGraphNode(p)` | Gros nœud pulsé du graphe de navigation sélectionné. | 113 |
| `editor_toolUtilities_render_spheres.drawSphereBar(p)` | Poignée de barre (halo puis cœur). | 43 |
| `editor_toolUtilities_render_spheres.drawSphereBarGhost(p)` | Fantôme rayons X de la poignée de barre. | 191 |
| `editor_toolUtilities_render_spheres.drawSphereBarHover(p)` | Poignée de barre survolée : halo pulsé plus grand. | 49 |
| `editor_toolUtilities_render_spheres.drawSphereCornerHandleGhost(p)` | Fantôme rayons X de la poignée de coin. | 188 |
| `editor_toolUtilities_render_spheres.drawSphereCulled(p, scale, col)` | Sphère à l'échelle liée à la distance, si le point est à moins de 600 m. | 31 |
| `editor_toolUtilities_render_spheres.drawSphereCursor(p, isActive)` | Sphère du curseur souris sur la carte ; distance plafonnée à 100 m pour la taille. Non filtrée. | 154 |
| `editor_toolUtilities_render_spheres.drawSphereCurveHandle(p)` | Poignée d'apex de courbe (flexion d'arête, rayon de coin), verte par défaut. | 76 |
| `editor_toolUtilities_render_spheres.drawSphereCurveHandleCol(p, coreCol, glowCol)` | Poignée de courbe avec couleurs de cœur et de halo choisies par l'outil : point stable avec halo doux. | 61 |
| `editor_toolUtilities_render_spheres.drawSphereCurveHandleHover(p)` | Poignée de courbe survolée (halo pulsé). | 77 |
| `editor_toolUtilities_render_spheres.drawSphereCurveHandleHoverCol(p, coreCol, glowCol)` | Version survolée de drawSphereCurveHandleCol : halo plus grand, plus brillant et pulsé. | 66 |
| `editor_toolUtilities_render_spheres.drawSphereHighlight(p)` | Surbrillance de nœud (colourHighlight, sans test de profondeur), filtrée à 600 m. | 163 |
| `editor_toolUtilities_render_spheres.drawSphereHighlightForeground(p)` | Surbrillance de nœud sans filtrage de distance. | 177 |
| `editor_toolUtilities_render_spheres.drawSphereHighlightHover(p)` | Surbrillance de survol pulsée, à l'échelle liée à la distance. | 78 |
| `editor_toolUtilities_render_spheres.drawSphereHighlightHoverFixed(p, radius)` | Surbrillance de survol pulsée de rayon monde fixe. | 88 |
| `editor_toolUtilities_render_spheres.drawSphereHighlightSelected(p)` | Surbrillance de sélection pulsée, à l'échelle liée à la distance. | 95 |
| `editor_toolUtilities_render_spheres.drawSphereHighlightSelectedFixed(p, radius)` | Surbrillance de sélection pulsée de rayon monde fixe. | 105 |
| `editor_toolUtilities_render_spheres.drawSphereImmediate(p, scale, col)` | Sphère à l'échelle liée à la distance, sans filtrage par distance. | 153 |
| `editor_toolUtilities_render_spheres.drawSphereJunction(p)` | Centre de jonction (halo puis cœur). | 144 |
| `editor_toolUtilities_render_spheres.drawSphereJunctionDull(p)` | Centre de jonction atténué. | 150 |
| `editor_toolUtilities_render_spheres.drawSphereJunctionGhost(p)` | Fantôme rayons X d'une jonction. | 185 |
| `editor_toolUtilities_render_spheres.drawSphereNode(p)` | Nœud standard : halo puis cœur. | 131 |
| `editor_toolUtilities_render_spheres.drawSphereNodeDull(p)` | Nœud atténué. | 162 |
| `editor_toolUtilities_render_spheres.drawSphereNodeForeground(p)` | Nœud (halo puis cœur) dessiné sans test de profondeur. | 170 |
| `editor_toolUtilities_render_spheres.drawSphereNodeGhost(p)` | Fantôme rayons X d'un nœud : seule la partie enfouie dans le terrain ou un maillage se voit. | 182 |
| `editor_toolUtilities_render_spheres.drawSphereNodeLocked(p)` | Nœud verrouillé (couleurs colourNodeLocked). | 137 |
| `editor_toolUtilities_render_spheres.drawSphereRib(p)` | Poignée de nervure : halo puis cœur. | 37 |
| `editor_toolUtilities_render_spheres.getSphereScale(d)` | Facteur d'échelle de sphère pour une distance d à la caméra : d plafonné à 60 m, multiplié par une pente (1/sqrt(30) * 0.8). | 26 |

### Détail des paramètres

#### `editor_toolUtilities_render_spheres.drawHoverNavGraphNode(p)`

Halo pulsé d'un nœud de navGraph survolé.

- `p` (*vec3*) : Centre.

#### `editor_toolUtilities_render_spheres.drawPathNode(p)`

Nœud de chemin (colourPathNode).

- `p` (*vec3*) : Centre.

#### `editor_toolUtilities_render_spheres.drawSelectedNavGraphNode(p)`

Gros nœud pulsé du graphe de navigation sélectionné.

- `p` (*vec3*) : Centre.

#### `editor_toolUtilities_render_spheres.drawSphereBar(p)`

Poignée de barre (halo puis cœur).

- `p` (*vec3*) : Centre.

#### `editor_toolUtilities_render_spheres.drawSphereBarGhost(p)`

Fantôme rayons X de la poignée de barre.

- `p` (*vec3*) : Centre.

#### `editor_toolUtilities_render_spheres.drawSphereBarHover(p)`

Poignée de barre survolée : halo pulsé plus grand.

- `p` (*vec3*) : Centre.

#### `editor_toolUtilities_render_spheres.drawSphereCornerHandleGhost(p)`

Fantôme rayons X de la poignée de coin.

- `p` (*vec3*) : Centre.

#### `editor_toolUtilities_render_spheres.drawSphereCulled(p, scale, col)`

Sphère à l'échelle liée à la distance, si le point est à moins de 600 m.

- `p` (*vec3*) : Centre.
- `scale` (*number*) : Multiplicateur d'échelle.
- `col` (*integer*) : Couleur packée.

#### `editor_toolUtilities_render_spheres.drawSphereCursor(p, isActive)`

Sphère du curseur souris sur la carte ; distance plafonnée à 100 m pour la taille. Non filtrée.

- `p` (*vec3*) : Position.
- `isActive` (*boolean|nil*) : true pour la couleur active, sinon couleur inactive.

#### `editor_toolUtilities_render_spheres.drawSphereCurveHandle(p)`

Poignée d'apex de courbe (flexion d'arête, rayon de coin), verte par défaut.

- `p` (*vec3*) : Centre.

#### `editor_toolUtilities_render_spheres.drawSphereCurveHandleCol(p, coreCol, glowCol)`

Poignée de courbe avec couleurs de cœur et de halo choisies par l'outil : point stable avec halo doux.

- `p` (*vec3*) : Centre.
- `coreCol` (*integer*) : Couleur du cœur.
- `glowCol` (*integer*) : Couleur du halo.

#### `editor_toolUtilities_render_spheres.drawSphereCurveHandleHover(p)`

Poignée de courbe survolée (halo pulsé).

- `p` (*vec3*) : Centre.

#### `editor_toolUtilities_render_spheres.drawSphereCurveHandleHoverCol(p, coreCol, glowCol)`

Version survolée de drawSphereCurveHandleCol : halo plus grand, plus brillant et pulsé.

- `p` (*vec3*) : Centre.
- `coreCol` (*integer*) : Couleur du cœur.
- `glowCol` (*integer*) : Couleur du halo.

#### `editor_toolUtilities_render_spheres.drawSphereHighlight(p)`

Surbrillance de nœud (colourHighlight, sans test de profondeur), filtrée à 600 m.

- `p` (*vec3*) : Centre.

#### `editor_toolUtilities_render_spheres.drawSphereHighlightForeground(p)`

Surbrillance de nœud sans filtrage de distance.

- `p` (*vec3*) : Centre.

#### `editor_toolUtilities_render_spheres.drawSphereHighlightHover(p)`

Surbrillance de survol pulsée, à l'échelle liée à la distance.

- `p` (*vec3*) : Centre.

#### `editor_toolUtilities_render_spheres.drawSphereHighlightHoverFixed(p, radius)`

Surbrillance de survol pulsée de rayon monde fixe.

- `p` (*vec3*) : Centre.
- `radius` (*number*) : Rayon de base en mètres.

#### `editor_toolUtilities_render_spheres.drawSphereHighlightSelected(p)`

Surbrillance de sélection pulsée, à l'échelle liée à la distance.

- `p` (*vec3*) : Centre.

#### `editor_toolUtilities_render_spheres.drawSphereHighlightSelectedFixed(p, radius)`

Surbrillance de sélection pulsée de rayon monde fixe.

- `p` (*vec3*) : Centre.
- `radius` (*number*) : Rayon de base en mètres.

#### `editor_toolUtilities_render_spheres.drawSphereImmediate(p, scale, col)`

Sphère à l'échelle liée à la distance, sans filtrage par distance.

- `p` (*vec3*) : Centre.
- `scale` (*number*) : Multiplicateur d'échelle.
- `col` (*integer*) : Couleur packée.

#### `editor_toolUtilities_render_spheres.drawSphereJunction(p)`

Centre de jonction (halo puis cœur).

- `p` (*vec3*) : Centre.

#### `editor_toolUtilities_render_spheres.drawSphereJunctionDull(p)`

Centre de jonction atténué.

- `p` (*vec3*) : Centre.

#### `editor_toolUtilities_render_spheres.drawSphereJunctionGhost(p)`

Fantôme rayons X d'une jonction.

- `p` (*vec3*) : Centre.

#### `editor_toolUtilities_render_spheres.drawSphereNode(p)`

Nœud standard : halo puis cœur.

- `p` (*vec3*) : Centre.

#### `editor_toolUtilities_render_spheres.drawSphereNodeDull(p)`

Nœud atténué.

- `p` (*vec3*) : Centre.

#### `editor_toolUtilities_render_spheres.drawSphereNodeForeground(p)`

Nœud (halo puis cœur) dessiné sans test de profondeur.

- `p` (*vec3*) : Centre.

#### `editor_toolUtilities_render_spheres.drawSphereNodeGhost(p)`

Fantôme rayons X d'un nœud : seule la partie enfouie dans le terrain ou un maillage se voit.

- `p` (*vec3*) : Centre.

#### `editor_toolUtilities_render_spheres.drawSphereNodeLocked(p)`

Nœud verrouillé (couleurs colourNodeLocked).

- `p` (*vec3*) : Centre.

#### `editor_toolUtilities_render_spheres.drawSphereRib(p)`

Poignée de nervure : halo puis cœur.

- `p` (*vec3*) : Centre.

#### `editor_toolUtilities_render_spheres.getSphereScale(d)`

Facteur d'échelle de sphère pour une distance d à la caméra : d plafonné à 60 m, multiplié par une pente (1/sqrt(30) * 0.8).

- `d` (*number*) : Distance caméra-point en mètres.
- **renvoie** : number Échelle de base.

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/toolUtilities/render/spheres.lua`.*

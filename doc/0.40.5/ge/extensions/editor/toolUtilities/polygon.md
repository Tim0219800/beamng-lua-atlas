# `editor_toolUtilities_polygon`

*Fichier : `lua/ge/extensions/editor/toolUtilities/polygon.lua` · VM : Game Engine (GE) · 488 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_toolUtilities_polygon` : `extensions.load("editor_toolUtilities_polygon")`, puis la globale `editor_toolUtilities_polygon`

Utilitaire de l'éditeur pour dessiner et modifier à la souris un polygone défini par l'utilisateur sur la carte (posé sur le terrain). Un seul polygone est géré par le module. L'outil hôte appelle handleUserPolygon chaque frame : clic pour ajouter un nœud, glissement pour déplacer, double-clic (plus de 2 nœuds) pour terminer, touche Suppr pour retirer le nœud sélectionné, Alt pour afficher/masquer le gizmo de translation. render, isDragging et isMouseOverEditable permettent à un outil qui pilote sa propre interaction de rester cohérent.

## Exemple

```lua
local poly = extensions.editor_toolUtilities_polygon
-- chaque frame :
poly.handleUserPolygon(function(nodes) print('polygone fini', #nodes) end, {clearOnComplete = false, snap = {ox = 0, oy = 0, step = 1}})
if poly.consumeDirty() then local p = poly.getPolygon() end
```

## Remarques

- Les nœuds sont des vec3 ; la hauteur z est ré-échantillonnée sur le terrain (core_terrain.getTerrainHeight).
- handleUserPolygon accepte aussi opts.ground (booléen) et opts.open (booléen : polyligne ouverte sans arête de fermeture), non documentés dans le commentaire d'en-tête ; render accepte opts.open, opts.foreground, opts.segmentLabels et opts.hover.
- Les bords sont tracés relevés de 0.1 m au-dessus du terrain ; une marque d'angle droit est affichée quand un coin est à environ 1 degré de l'équerre.
- Le callback de double-clic reçoit une copie profonde du polygone ; si clearOnComplete vaut true (défaut) le polygone est ensuite vidé.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_toolUtilities_polygon.beginDragNode(nodeIdx)` | Commence immédiatement le glissement du nœud donné pendant l'appui souris courant, sans nouveau clic. Sans effet si l'indice est invalide. | 455 |
| `editor_toolUtilities_polygon.clearPolygon()` | Vide le polygone (lève dirty s'il contenait des nœuds). | 124 |
| `editor_toolUtilities_polygon.consumeDirty()` | Renvoie le drapeau dirty (polygone modifié depuis le dernier appel) puis le remet à false. | 132 |
| `editor_toolUtilities_polygon.getPolygon()` | Renvoie la table interne du polygone (liste de vec3, pas une copie). | 90 |
| `editor_toolUtilities_polygon.handleUserPolygon(doubleClickCallback, opts)` | Gère tout le cycle de vie du polygone utilisateur : rendu, curseur, ajout, insertion sur une arête, glissement de nœuds, gizmo (Alt), suppression (Suppr), fin par double-clic. À appeler chaque frame tant que l'outil est actif. | 238 |
| `editor_toolUtilities_polygon.isDragging()` | Vrai tant qu'un nœud est en cours de glissement ; permet à l'outil hôte de suspendre ses propres interactions de scène. | 451 |
| `editor_toolUtilities_polygon.isMouseOverEditable()` | Vrai si la souris est sur un nœud ou une arête du polygone (une cible d'édition), pour donner priorité au polygone sur la sélection inter-outils. | 467 |
| `editor_toolUtilities_polygon.isPolygonValid()` | Vrai si le polygone a plus de 2 nœuds. | 121 |
| `editor_toolUtilities_polygon.render(opts)` | Passe de dessin seule, sans entrée : affiche nœuds, arêtes et éventuellement les longueurs de segments. Utile quand l'outil hôte gère sa propre interaction (déplacement rigide par exemple). opts.hover fait aussi pulser le nœud sous le curseur. | 436 |
| `editor_toolUtilities_polygon.setPolygon(nodes)` | Remplace le polygone par une copie des nœuds donnés (nil ou vide = effacer). Réinitialise le glissement et le gizmo, et lève le drapeau dirty. | 94 |

### Détail des paramètres

#### `editor_toolUtilities_polygon.beginDragNode(nodeIdx)`

Commence immédiatement le glissement du nœud donné pendant l'appui souris courant, sans nouveau clic. Sans effet si l'indice est invalide.

- `nodeIdx` (*integer*) : Indice (à partir de 1) du nœud.

#### `editor_toolUtilities_polygon.consumeDirty()`

Renvoie le drapeau dirty (polygone modifié depuis le dernier appel) puis le remet à false.

- **renvoie** : boolean true si le polygone a changé.

#### `editor_toolUtilities_polygon.getPolygon()`

Renvoie la table interne du polygone (liste de vec3, pas une copie).

- **renvoie** : table Liste de vec3.

#### `editor_toolUtilities_polygon.handleUserPolygon(doubleClickCallback, opts)`

Gère tout le cycle de vie du polygone utilisateur : rendu, curseur, ajout, insertion sur une arête, glissement de nœuds, gizmo (Alt), suppression (Suppr), fin par double-clic. À appeler chaque frame tant que l'outil est actif.

- `doubleClickCallback` (*function|nil*) : Appelé avec une copie du polygone au double-clic quand il a plus de 2 nœuds.
- `opts` (*table|nil*) : clearOnComplete (défaut true), doRender (défaut true), foreground (défaut false : dessin à travers la géométrie), snap = {ox, oy, step} (accrochage à une grille), segmentLabels (longueur de chaque segment), rigid (glisser un nœud déplace tout le polygone), ground, open.

#### `editor_toolUtilities_polygon.isDragging()`

Vrai tant qu'un nœud est en cours de glissement ; permet à l'outil hôte de suspendre ses propres interactions de scène.

- **renvoie** : boolean true pendant un glissement.

#### `editor_toolUtilities_polygon.isMouseOverEditable()`

Vrai si la souris est sur un nœud ou une arête du polygone (une cible d'édition), pour donner priorité au polygone sur la sélection inter-outils.

- **renvoie** : boolean true si survol d'un élément éditable.

#### `editor_toolUtilities_polygon.isPolygonValid()`

Vrai si le polygone a plus de 2 nœuds.

- **renvoie** : boolean true si valide.

#### `editor_toolUtilities_polygon.render(opts)`

Passe de dessin seule, sans entrée : affiche nœuds, arêtes et éventuellement les longueurs de segments. Utile quand l'outil hôte gère sa propre interaction (déplacement rigide par exemple). opts.hover fait aussi pulser le nœud sous le curseur.

- `opts` (*table|nil*) : { open, foreground, segmentLabels, hover }

#### `editor_toolUtilities_polygon.setPolygon(nodes)`

Remplace le polygone par une copie des nœuds donnés (nil ou vide = effacer). Réinitialise le glissement et le gizmo, et lève le drapeau dirty.

- `nodes` (*table|nil*) : Liste de points {x,y,z} (vec3 ou équivalent).

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/toolUtilities/polygon.lua`.*

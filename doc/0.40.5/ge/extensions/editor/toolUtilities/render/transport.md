# `editor_toolUtilities_render_transport`

*Fichier : `lua/ge/extensions/editor/toolUtilities/render/transport.lua` · VM : Game Engine (GE) · 519 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_toolUtilities_render_transport` : `extensions.load("editor_toolUtilities_render_transport")`, puis la globale `editor_toolUtilities_render_transport`

Rendu propre aux réseaux de transport et à l'éditeur de routes : centres de jonction, extrémités liées, fil de fer du ruban de route, candidats de boucle ou de jonction, rubans prismes gauche/droite et fantômes (copies faibles sans test de profondeur pour retrouver ce qui est enterré dans le terrain). Séparé de render.lua car seuls roadNetwork et heroRoadEditor l'utilisent. Module composite qui dessine via render/spheres, lines, tris et markup.

## Remarques

- Distances de filtrage : 800 m pour les rubans non sélectionnés et jonctions, 400 m pour leurs fantômes (les fantômes coûtent un appel par ligne).
- Le fil de fer d'une spline est calculé une fois et dessiné par lot ; si la spline expose meshEdgeL/meshEdgeR (Hero Road, vrais bords du tablier avec dévers, bombé, accotements), ce sont ceux-ci qui sont tracés, sinon le ruban de référence plat.
- Un barreau est tracé tous les 12 points (ribbonRungSpacing) ; la binormale est espacée de 2 points (masterWireBinormalSpacing).
- drawJunctionGhosts met en cache les points des bords de jonction (table à clés faibles) tant que rev ne change pas.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_toolUtilities_render_transport.drawJunctionFilletHandle(base, handle, value, highlight)` | Poignée de « flare room » de la jonction sélectionnée : sphère de barre (cyan) sur le plus large îlot, ligne fine vers le nœud central et étiquette de valeur toujours affichée. Glisser vers l'intérieur ou l'extérieur règle l'évasement. Fantôme pour rester trouvable quand elle est enterrée. | 73 |
| `editor_toolUtilities_render_transport.drawJunctionGhosts(junctions, rev)` | Fantômes du centre et des bords extérieurs (contour d'asphalte entre les bras) de chaque jonction à moins de 400 m. Les points de bord relevés viennent du cache tant que rev est inchangé. | 144 |
| `editor_toolUtilities_render_transport.drawLanePick(a, b, dir, len, ok)` | Bande de voies de a à b en travers d'un bout de route, sur len selon dir : les voies qu'une extrémité glissée rejoindrait (rouge) ou la route qu'un balayage de voies créerait (bleu et bord blanc si ok, rouge sinon). | 113 |
| `editor_toolUtilities_render_transport.drawLanePortal(a, b, dir, len, leaves, lit)` | Portail d'une voie ouverte en bout de route : tuile de a à b en travers de la voie, sur la longueur len selon dir ; verte si le trafic sort de la route par là, rouge s'il y entre. lit (survolé ou balayé) l'affiche plus vif et cerné. | 103 |
| `editor_toolUtilities_render_transport.drawLinkedTips(groups)` | Dessine en rouge verrouillé les extrémités de route liées à une jonction (par-dessus les sphères de nœuds normales) : premier nœud si jctIdStart, dernier si jctIdFinish. | 119 |
| `editor_toolUtilities_render_transport.drawNodeGhosts(spline, hidden)` | Copies faibles sans test de profondeur des nœuds d'une spline (sauf ceux de l'ensemble hidden) pour que les poignées enterrées restent repérables. Ignore les splines désactivées ou isLink. | 133 |
| `editor_toolUtilities_render_transport.drawTransportJunctions(junctions, selectedIdx, elevScale, isGizmoActive)` | Dessine les centres de jonction du réseau (sphères vertes) avec élévation, comme les nœuds de route ; la jonction sélectionnée est mise en évidence. | 42 |
| `editor_toolUtilities_render_transport.renderCandidateJoin(node1, node2, refusal)` | Indique visuellement qu'une jonction de deux splines distinctes est possible. Si refusal est donné, affiche à la place des extrémités rouges, une ligne fixe et la raison du refus. | 305 |
| `editor_toolUtilities_render_transport.renderCandidateLoop(node1, node2)` | Indique visuellement qu'une boucle est possible entre début et fin de la même spline : surbrillance des deux nœuds, ligne spéciale et invite « maintenir CTRL + relâcher ». | 294 |
| `editor_toolUtilities_render_transport.renderRibbon(ribbons, selectedRibbonIdx, selectedNodeIdx, placedLeftNode, hoveredRibbonIdx, bestCursorSeg, isDragging)` | Dessine les rubans donnés. Un ruban est une spline posée en paires gauche/droite dont les segments sont des boîtes à 8 points adjacentes ; il peut avoir des surfaces actives (haut ou bas) et des segments les plus proches (utilisé par exemple pour le placement d'émetteurs audio dynamiques). Utilise la position souris sur la carte. | 332 |
| `editor_toolUtilities_render_transport.renderRibbonWireFrame(splines, selSplineIdx, binormalSpacing, ghosted)` | Dessine le fil de fer des splines de ruban. Avec ghosted, trace aussi les rubans sans test de profondeur et faiblement, pour que les tronçons enterrés se voient : le ruban sélectionné en entier, les autres par leurs bords seulement. | 251 |
| `editor_toolUtilities_render_transport.ribbonExtentsAt(spline, j)` | Extensions gauche et droite d'un ruban de référence plat à la division j, en mètres de part et d'autre de divPoints[j] selon sa binormale. Utilise leftExtM/rightExtM si présents, sinon la demi-largeur symétrique, plus la demi-médiane (affinée) d'une chaussée séparée, l'élargissement dans les virages (curveWiden*ByDiv) et l'accotement stabilisé (hardShoulder*ByDiv). | 175 |

### Détail des paramètres

#### `editor_toolUtilities_render_transport.drawJunctionFilletHandle(base, handle, value, highlight)`

Poignée de « flare room » de la jonction sélectionnée : sphère de barre (cyan) sur le plus large îlot, ligne fine vers le nœud central et étiquette de valeur toujours affichée. Glisser vers l'intérieur ou l'extérieur règle l'évasement. Fantôme pour rester trouvable quand elle est enterrée.

- `base` (*vec3*) : Position du nœud central.
- `handle` (*vec3*) : Position de la poignée.
- `value` (*number*) : Valeur affichée.
- `highlight` (*boolean*) : true si survolée ou en cours de glissement (déduit du nom).

#### `editor_toolUtilities_render_transport.drawJunctionGhosts(junctions, rev)`

Fantômes du centre et des bords extérieurs (contour d'asphalte entre les bras) de chaque jonction à moins de 400 m. Les points de bord relevés viennent du cache tant que rev est inchangé.

- `junctions` (*table|nil*) : Liste de jonctions (pos, connectorEdges).
- `rev` (*any*) : Révision de construction de l'appelant, pour invalider le cache.

#### `editor_toolUtilities_render_transport.drawLanePick(a, b, dir, len, ok)`

Bande de voies de a à b en travers d'un bout de route, sur len selon dir : les voies qu'une extrémité glissée rejoindrait (rouge) ou la route qu'un balayage de voies créerait (bleu et bord blanc si ok, rouge sinon).

- `a` (*vec3*) : Bord de la bande.
- `b` (*vec3*) : Autre bord.
- `dir` (*vec3*) : Direction d'extension.
- `len` (*number*) : Longueur.
- `ok` (*boolean*) : true si l'opération est possible.

#### `editor_toolUtilities_render_transport.drawLanePortal(a, b, dir, len, leaves, lit)`

Portail d'une voie ouverte en bout de route : tuile de a à b en travers de la voie, sur la longueur len selon dir ; verte si le trafic sort de la route par là, rouge s'il y entre. lit (survolé ou balayé) l'affiche plus vif et cerné.

- `a` (*vec3*) : Bord de la voie.
- `b` (*vec3*) : Autre bord de la voie.
- `dir` (*vec3*) : Direction d'extension.
- `len` (*number*) : Longueur de la tuile.
- `leaves` (*boolean*) : true si le trafic quitte la route ici.
- `lit` (*boolean*) : Mise en évidence.

#### `editor_toolUtilities_render_transport.drawLinkedTips(groups)`

Dessine en rouge verrouillé les extrémités de route liées à une jonction (par-dessus les sphères de nœuds normales) : premier nœud si jctIdStart, dernier si jctIdFinish.

- `groups` (*table*) : Groupes/routes avec nodes, jctIdStart, jctIdFinish.

#### `editor_toolUtilities_render_transport.drawNodeGhosts(spline, hidden)`

Copies faibles sans test de profondeur des nœuds d'une spline (sauf ceux de l'ensemble hidden) pour que les poignées enterrées restent repérables. Ignore les splines désactivées ou isLink.

- `spline` (*table*) : Spline avec nodes.
- `hidden` (*table<integer, boolean>|nil*) : Ensemble d'indices de nœuds à ne pas dessiner.

#### `editor_toolUtilities_render_transport.drawTransportJunctions(junctions, selectedIdx, elevScale, isGizmoActive)`

Dessine les centres de jonction du réseau (sphères vertes) avec élévation, comme les nœuds de route ; la jonction sélectionnée est mise en évidence.

- `junctions` (*table|nil*) : Liste de jonctions (pos, etc.).
- `selectedIdx` (*integer|nil*) : Indice de la jonction sélectionnée (défaut 0).
- `elevScale` (*number|nil*) : Échelle de couleur d'élévation (défaut 100).
- `isGizmoActive` (*boolean*) : Gizmo actif (déduit du nom).

#### `editor_toolUtilities_render_transport.renderCandidateJoin(node1, node2, refusal)`

Indique visuellement qu'une jonction de deux splines distinctes est possible. Si refusal est donné, affiche à la place des extrémités rouges, une ligne fixe et la raison du refus.

- `node1` (*vec3*) : Premier nœud.
- `node2` (*vec3*) : Second nœud.
- `refusal` (*string|nil*) : Raison du refus par l'outil.

#### `editor_toolUtilities_render_transport.renderCandidateLoop(node1, node2)`

Indique visuellement qu'une boucle est possible entre début et fin de la même spline : surbrillance des deux nœuds, ligne spéciale et invite « maintenir CTRL + relâcher ».

- `node1` (*vec3*) : Premier nœud.
- `node2` (*vec3*) : Second nœud.

#### `editor_toolUtilities_render_transport.renderRibbon(ribbons, selectedRibbonIdx, selectedNodeIdx, placedLeftNode, hoveredRibbonIdx, bestCursorSeg, isDragging)`

Dessine les rubans donnés. Un ruban est une spline posée en paires gauche/droite dont les segments sont des boîtes à 8 points adjacentes ; il peut avoir des surfaces actives (haut ou bas) et des segments les plus proches (utilisé par exemple pour le placement d'émetteurs audio dynamiques). Utilise la position souris sur la carte.

- `ribbons` (*table*) : Liste de rubans.
- `selectedRibbonIdx` (*integer*) : Indice du ruban sélectionné.
- `selectedNodeIdx` (*integer|nil*) : Indice du nœud sélectionné.
- `placedLeftNode` (*vec3|nil*) : Nœud gauche déjà posé par l'utilisateur.
- `hoveredRibbonIdx` (*integer|nil*) : Indice du ruban survolé.
- `bestCursorSeg` (*integer|nil*) : Indice du segment le plus proche du curseur.
- `isDragging` (*boolean*) : Un nœud est en cours de glissement.

#### `editor_toolUtilities_render_transport.renderRibbonWireFrame(splines, selSplineIdx, binormalSpacing, ghosted)`

Dessine le fil de fer des splines de ruban. Avec ghosted, trace aussi les rubans sans test de profondeur et faiblement, pour que les tronçons enterrés se voient : le ruban sélectionné en entier, les autres par leurs bords seulement.

- `splines` (*table*) : Liste de splines.
- `selSplineIdx` (*integer*) : Indice de la spline sélectionnée.
- `binormalSpacing` (*integer*) : Espacement des binormales.
- `ghosted` (*boolean*) : Ajouter les tracés fantômes.

#### `editor_toolUtilities_render_transport.ribbonExtentsAt(spline, j)`

Extensions gauche et droite d'un ruban de référence plat à la division j, en mètres de part et d'autre de divPoints[j] selon sa binormale. Utilise leftExtM/rightExtM si présents, sinon la demi-largeur symétrique, plus la demi-médiane (affinée) d'une chaussée séparée, l'élargissement dans les virages (curveWiden*ByDiv) et l'accotement stabilisé (hardShoulder*ByDiv).

- `spline` (*table*) : Spline avec divWidths et les tableaux optionnels medianHalfByDiv, hardShoulderLeftByDiv, hardShoulderRightByDiv, curveWidenLeftByDiv, curveWidenRightByDiv, leftExtM, rightExtM.
- `j` (*integer*) : Indice de division.
- **renvoie** : number Extension gauche en mètres.
- **renvoie** : number Extension droite en mètres.

## Appels vers le moteur (C++)

- `debugDrawer:` `drawLineInstance`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/toolUtilities/render/transport.lua`.*

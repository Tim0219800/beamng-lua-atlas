---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/toolUtilities/render/transport.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Rendu propre aux réseaux de transport et à l'éditeur de routes : centres de jonction, extrémités liées, fil de fer du ruban de route, candidats de boucle ou de jonction, rubans prismes gauche/droite et fantômes (copies faibles sans test de profondeur pour retrouver ce qui est enterré dans le terrain). Séparé de render.lua car seuls roadNetwork et heroRoadEditor l'utilisent. Module composite qui dessine via render/spheres, lines, tris et markup.
--- Accès : extension `editor_toolUtilities_render_transport` : `extensions.load("editor_toolUtilities_render_transport")`, puis la globale `editor_toolUtilities_render_transport`
---@class editor_toolUtilities_render_transport
editor_toolUtilities_render_transport = {}

--- Poignée de « flare room » de la jonction sélectionnée : sphère de barre (cyan) sur le plus large îlot, ligne fine vers le nœud central et étiquette de valeur toujours affichée. Glisser vers l'intérieur ou l'extérieur règle l'évasement. Fantôme pour rester trouvable quand elle est enterrée.
---Source : lua/ge/extensions/editor/toolUtilities/render/transport.lua:73
---@param base vec3 Position du nœud central.
---@param handle vec3 Position de la poignée.
---@param value number Valeur affichée.
---@param highlight boolean true si survolée ou en cours de glissement (déduit du nom).
function editor_toolUtilities_render_transport.drawJunctionFilletHandle(base, handle, value, highlight) end

--- Fantômes du centre et des bords extérieurs (contour d'asphalte entre les bras) de chaque jonction à moins de 400 m. Les points de bord relevés viennent du cache tant que rev est inchangé.
---Source : lua/ge/extensions/editor/toolUtilities/render/transport.lua:144
---@param junctions table|nil Liste de jonctions (pos, connectorEdges).
---@param rev any Révision de construction de l'appelant, pour invalider le cache.
function editor_toolUtilities_render_transport.drawJunctionGhosts(junctions, rev) end

--- Bande de voies de a à b en travers d'un bout de route, sur len selon dir : les voies qu'une extrémité glissée rejoindrait (rouge) ou la route qu'un balayage de voies créerait (bleu et bord blanc si ok, rouge sinon).
---Source : lua/ge/extensions/editor/toolUtilities/render/transport.lua:113
---@param a vec3 Bord de la bande.
---@param b vec3 Autre bord.
---@param dir vec3 Direction d'extension.
---@param len number Longueur.
---@param ok boolean true si l'opération est possible.
function editor_toolUtilities_render_transport.drawLanePick(a, b, dir, len, ok) end

--- Portail d'une voie ouverte en bout de route : tuile de a à b en travers de la voie, sur la longueur len selon dir ; verte si le trafic sort de la route par là, rouge s'il y entre. lit (survolé ou balayé) l'affiche plus vif et cerné.
---Source : lua/ge/extensions/editor/toolUtilities/render/transport.lua:103
---@param a vec3 Bord de la voie.
---@param b vec3 Autre bord de la voie.
---@param dir vec3 Direction d'extension.
---@param len number Longueur de la tuile.
---@param leaves boolean true si le trafic quitte la route ici.
---@param lit boolean Mise en évidence.
function editor_toolUtilities_render_transport.drawLanePortal(a, b, dir, len, leaves, lit) end

--- Dessine en rouge verrouillé les extrémités de route liées à une jonction (par-dessus les sphères de nœuds normales) : premier nœud si jctIdStart, dernier si jctIdFinish.
---Source : lua/ge/extensions/editor/toolUtilities/render/transport.lua:119
---@param groups table Groupes/routes avec nodes, jctIdStart, jctIdFinish.
function editor_toolUtilities_render_transport.drawLinkedTips(groups) end

--- Copies faibles sans test de profondeur des nœuds d'une spline (sauf ceux de l'ensemble hidden) pour que les poignées enterrées restent repérables. Ignore les splines désactivées ou isLink.
---Source : lua/ge/extensions/editor/toolUtilities/render/transport.lua:133
---@param spline table Spline avec nodes.
---@param hidden table<integer, boolean>|nil Ensemble d'indices de nœuds à ne pas dessiner.
function editor_toolUtilities_render_transport.drawNodeGhosts(spline, hidden) end

--- Dessine les centres de jonction du réseau (sphères vertes) avec élévation, comme les nœuds de route ; la jonction sélectionnée est mise en évidence.
---Source : lua/ge/extensions/editor/toolUtilities/render/transport.lua:42
---@param junctions table|nil Liste de jonctions (pos, etc.).
---@param selectedIdx integer|nil Indice de la jonction sélectionnée (défaut 0).
---@param elevScale number|nil Échelle de couleur d'élévation (défaut 100).
---@param isGizmoActive boolean Gizmo actif (déduit du nom).
function editor_toolUtilities_render_transport.drawTransportJunctions(junctions, selectedIdx, elevScale, isGizmoActive) end

--- Indique visuellement qu'une jonction de deux splines distinctes est possible. Si refusal est donné, affiche à la place des extrémités rouges, une ligne fixe et la raison du refus.
---Source : lua/ge/extensions/editor/toolUtilities/render/transport.lua:305
---@param node1 vec3 Premier nœud.
---@param node2 vec3 Second nœud.
---@param refusal string|nil Raison du refus par l'outil.
function editor_toolUtilities_render_transport.renderCandidateJoin(node1, node2, refusal) end

--- Indique visuellement qu'une boucle est possible entre début et fin de la même spline : surbrillance des deux nœuds, ligne spéciale et invite « maintenir CTRL + relâcher ».
---Source : lua/ge/extensions/editor/toolUtilities/render/transport.lua:294
---@param node1 vec3 Premier nœud.
---@param node2 vec3 Second nœud.
function editor_toolUtilities_render_transport.renderCandidateLoop(node1, node2) end

--- Dessine les rubans donnés. Un ruban est une spline posée en paires gauche/droite dont les segments sont des boîtes à 8 points adjacentes ; il peut avoir des surfaces actives (haut ou bas) et des segments les plus proches (utilisé par exemple pour le placement d'émetteurs audio dynamiques). Utilise la position souris sur la carte.
---Source : lua/ge/extensions/editor/toolUtilities/render/transport.lua:332
---@param ribbons table Liste de rubans.
---@param selectedRibbonIdx integer Indice du ruban sélectionné.
---@param selectedNodeIdx integer|nil Indice du nœud sélectionné.
---@param placedLeftNode vec3|nil Nœud gauche déjà posé par l'utilisateur.
---@param hoveredRibbonIdx integer|nil Indice du ruban survolé.
---@param bestCursorSeg integer|nil Indice du segment le plus proche du curseur.
---@param isDragging boolean Un nœud est en cours de glissement.
function editor_toolUtilities_render_transport.renderRibbon(ribbons, selectedRibbonIdx, selectedNodeIdx, placedLeftNode, hoveredRibbonIdx, bestCursorSeg, isDragging) end

--- Dessine le fil de fer des splines de ruban. Avec ghosted, trace aussi les rubans sans test de profondeur et faiblement, pour que les tronçons enterrés se voient : le ruban sélectionné en entier, les autres par leurs bords seulement.
---Source : lua/ge/extensions/editor/toolUtilities/render/transport.lua:251
---@param splines table Liste de splines.
---@param selSplineIdx integer Indice de la spline sélectionnée.
---@param binormalSpacing integer Espacement des binormales.
---@param ghosted boolean Ajouter les tracés fantômes.
function editor_toolUtilities_render_transport.renderRibbonWireFrame(splines, selSplineIdx, binormalSpacing, ghosted) end

--- Extensions gauche et droite d'un ruban de référence plat à la division j, en mètres de part et d'autre de divPoints[j] selon sa binormale. Utilise leftExtM/rightExtM si présents, sinon la demi-largeur symétrique, plus la demi-médiane (affinée) d'une chaussée séparée, l'élargissement dans les virages (curveWiden*ByDiv) et l'accotement stabilisé (hardShoulder*ByDiv).
---Source : lua/ge/extensions/editor/toolUtilities/render/transport.lua:175
---@param spline table Spline avec divWidths et les tableaux optionnels medianHalfByDiv, hardShoulderLeftByDiv, hardShoulderRightByDiv, curveWidenLeftByDiv, curveWidenRightByDiv, leftExtM, rightExtM.
---@param j integer Indice de division.
---@return number  Extension gauche en mètres.
---@return number  Extension droite en mètres.
function editor_toolUtilities_render_transport.ribbonExtentsAt(spline, j) end


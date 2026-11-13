---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/toolUtilities/render/spheres.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Dessin de sphères et de poignées de debug pour les outils d'édition de splines (issu de l'ancien render.lua). Module feuille : dépend de utils/debugDraw et du style partagé. Le rayon est proportionnel à la distance à la caméra (taille apparente constante jusqu'à 60 m, puis taille monde fixe), via getSphereScale que réutilisent les modules render/spline, transport et graph. Contient les nœuds, jonctions, poignées de barre et de courbe, surbrillances (survol, sélection, pulsées dans le temps) et fantômes « rayons X » sans test de profondeur.
--- Accès : extension `editor_toolUtilities_render_spheres` : `extensions.load("editor_toolUtilities_render_spheres")`, puis la globale `editor_toolUtilities_render_spheres`
---@class editor_toolUtilities_render_spheres
editor_toolUtilities_render_spheres = {}

--- Halo pulsé d'un nœud de navGraph survolé.
---Source : lua/ge/extensions/editor/toolUtilities/render/spheres.lua:122
---@param p vec3 Centre.
function editor_toolUtilities_render_spheres.drawHoverNavGraphNode(p) end

--- Nœud de chemin (colourPathNode).
---Source : lua/ge/extensions/editor/toolUtilities/render/spheres.lua:112
---@param p vec3 Centre.
function editor_toolUtilities_render_spheres.drawPathNode(p) end

--- Gros nœud pulsé du graphe de navigation sélectionné.
---Source : lua/ge/extensions/editor/toolUtilities/render/spheres.lua:113
---@param p vec3 Centre.
function editor_toolUtilities_render_spheres.drawSelectedNavGraphNode(p) end

--- Poignée de barre (halo puis cœur).
---Source : lua/ge/extensions/editor/toolUtilities/render/spheres.lua:43
---@param p vec3 Centre.
function editor_toolUtilities_render_spheres.drawSphereBar(p) end

--- Fantôme rayons X de la poignée de barre.
---Source : lua/ge/extensions/editor/toolUtilities/render/spheres.lua:191
---@param p vec3 Centre.
function editor_toolUtilities_render_spheres.drawSphereBarGhost(p) end

--- Poignée de barre survolée : halo pulsé plus grand.
---Source : lua/ge/extensions/editor/toolUtilities/render/spheres.lua:49
---@param p vec3 Centre.
function editor_toolUtilities_render_spheres.drawSphereBarHover(p) end

--- Fantôme rayons X de la poignée de coin.
---Source : lua/ge/extensions/editor/toolUtilities/render/spheres.lua:188
---@param p vec3 Centre.
function editor_toolUtilities_render_spheres.drawSphereCornerHandleGhost(p) end

--- Sphère à l'échelle liée à la distance, si le point est à moins de 600 m.
---Source : lua/ge/extensions/editor/toolUtilities/render/spheres.lua:31
---@param p vec3 Centre.
---@param scale number Multiplicateur d'échelle.
---@param col integer Couleur packée.
function editor_toolUtilities_render_spheres.drawSphereCulled(p, scale, col) end

--- Sphère du curseur souris sur la carte ; distance plafonnée à 100 m pour la taille. Non filtrée.
---Source : lua/ge/extensions/editor/toolUtilities/render/spheres.lua:154
---@param p vec3 Position.
---@param isActive boolean|nil true pour la couleur active, sinon couleur inactive.
function editor_toolUtilities_render_spheres.drawSphereCursor(p, isActive) end

--- Poignée d'apex de courbe (flexion d'arête, rayon de coin), verte par défaut.
---Source : lua/ge/extensions/editor/toolUtilities/render/spheres.lua:76
---@param p vec3 Centre.
function editor_toolUtilities_render_spheres.drawSphereCurveHandle(p) end

--- Poignée de courbe avec couleurs de cœur et de halo choisies par l'outil : point stable avec halo doux.
---Source : lua/ge/extensions/editor/toolUtilities/render/spheres.lua:61
---@param p vec3 Centre.
---@param coreCol integer Couleur du cœur.
---@param glowCol integer Couleur du halo.
function editor_toolUtilities_render_spheres.drawSphereCurveHandleCol(p, coreCol, glowCol) end

--- Poignée de courbe survolée (halo pulsé).
---Source : lua/ge/extensions/editor/toolUtilities/render/spheres.lua:77
---@param p vec3 Centre.
function editor_toolUtilities_render_spheres.drawSphereCurveHandleHover(p) end

--- Version survolée de drawSphereCurveHandleCol : halo plus grand, plus brillant et pulsé.
---Source : lua/ge/extensions/editor/toolUtilities/render/spheres.lua:66
---@param p vec3 Centre.
---@param coreCol integer Couleur du cœur.
---@param glowCol integer Couleur du halo.
function editor_toolUtilities_render_spheres.drawSphereCurveHandleHoverCol(p, coreCol, glowCol) end

--- Surbrillance de nœud (colourHighlight, sans test de profondeur), filtrée à 600 m.
---Source : lua/ge/extensions/editor/toolUtilities/render/spheres.lua:163
---@param p vec3 Centre.
function editor_toolUtilities_render_spheres.drawSphereHighlight(p) end

--- Surbrillance de nœud sans filtrage de distance.
---Source : lua/ge/extensions/editor/toolUtilities/render/spheres.lua:177
---@param p vec3 Centre.
function editor_toolUtilities_render_spheres.drawSphereHighlightForeground(p) end

--- Surbrillance de survol pulsée, à l'échelle liée à la distance.
---Source : lua/ge/extensions/editor/toolUtilities/render/spheres.lua:78
---@param p vec3 Centre.
function editor_toolUtilities_render_spheres.drawSphereHighlightHover(p) end

--- Surbrillance de survol pulsée de rayon monde fixe.
---Source : lua/ge/extensions/editor/toolUtilities/render/spheres.lua:88
---@param p vec3 Centre.
---@param radius number Rayon de base en mètres.
function editor_toolUtilities_render_spheres.drawSphereHighlightHoverFixed(p, radius) end

--- Surbrillance de sélection pulsée, à l'échelle liée à la distance.
---Source : lua/ge/extensions/editor/toolUtilities/render/spheres.lua:95
---@param p vec3 Centre.
function editor_toolUtilities_render_spheres.drawSphereHighlightSelected(p) end

--- Surbrillance de sélection pulsée de rayon monde fixe.
---Source : lua/ge/extensions/editor/toolUtilities/render/spheres.lua:105
---@param p vec3 Centre.
---@param radius number Rayon de base en mètres.
function editor_toolUtilities_render_spheres.drawSphereHighlightSelectedFixed(p, radius) end

--- Sphère à l'échelle liée à la distance, sans filtrage par distance.
---Source : lua/ge/extensions/editor/toolUtilities/render/spheres.lua:153
---@param p vec3 Centre.
---@param scale number Multiplicateur d'échelle.
---@param col integer Couleur packée.
function editor_toolUtilities_render_spheres.drawSphereImmediate(p, scale, col) end

--- Centre de jonction (halo puis cœur).
---Source : lua/ge/extensions/editor/toolUtilities/render/spheres.lua:144
---@param p vec3 Centre.
function editor_toolUtilities_render_spheres.drawSphereJunction(p) end

--- Centre de jonction atténué.
---Source : lua/ge/extensions/editor/toolUtilities/render/spheres.lua:150
---@param p vec3 Centre.
function editor_toolUtilities_render_spheres.drawSphereJunctionDull(p) end

--- Fantôme rayons X d'une jonction.
---Source : lua/ge/extensions/editor/toolUtilities/render/spheres.lua:185
---@param p vec3 Centre.
function editor_toolUtilities_render_spheres.drawSphereJunctionGhost(p) end

--- Nœud standard : halo puis cœur.
---Source : lua/ge/extensions/editor/toolUtilities/render/spheres.lua:131
---@param p vec3 Centre.
function editor_toolUtilities_render_spheres.drawSphereNode(p) end

--- Nœud atténué.
---Source : lua/ge/extensions/editor/toolUtilities/render/spheres.lua:162
---@param p vec3 Centre.
function editor_toolUtilities_render_spheres.drawSphereNodeDull(p) end

--- Nœud (halo puis cœur) dessiné sans test de profondeur.
---Source : lua/ge/extensions/editor/toolUtilities/render/spheres.lua:170
---@param p vec3 Centre.
function editor_toolUtilities_render_spheres.drawSphereNodeForeground(p) end

--- Fantôme rayons X d'un nœud : seule la partie enfouie dans le terrain ou un maillage se voit.
---Source : lua/ge/extensions/editor/toolUtilities/render/spheres.lua:182
---@param p vec3 Centre.
function editor_toolUtilities_render_spheres.drawSphereNodeGhost(p) end

--- Nœud verrouillé (couleurs colourNodeLocked).
---Source : lua/ge/extensions/editor/toolUtilities/render/spheres.lua:137
---@param p vec3 Centre.
function editor_toolUtilities_render_spheres.drawSphereNodeLocked(p) end

--- Poignée de nervure : halo puis cœur.
---Source : lua/ge/extensions/editor/toolUtilities/render/spheres.lua:37
---@param p vec3 Centre.
function editor_toolUtilities_render_spheres.drawSphereRib(p) end

--- Facteur d'échelle de sphère pour une distance d à la caméra : d plafonné à 60 m, multiplié par une pente (1/sqrt(30) * 0.8).
---Source : lua/ge/extensions/editor/toolUtilities/render/spheres.lua:26
---@param d number Distance caméra-point en mètres.
---@return number  Échelle de base.
function editor_toolUtilities_render_spheres.getSphereScale(d) end


---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/crawlEditor/waypoints.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Instance de l'outil. Champs : crawlEditor (éditeur parent), path (chemin édité), index (id du nœud sélectionné, -1 par défaut), mouseInfo (dernières infos souris), fields (buffers ImGui des champs personnalisés).
---@class editor_crawlEditor_waypoints
local editor_crawlEditor_waypoints = {}

--- Début de manipulation du gizmo : mémorise l'état sérialisé, la rotation et le rayon du nœud.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/crawlEditor/waypoints.lua:86
function editor_crawlEditor_waypoints:beginDrag() end

--- Affiche « Add manual Pathnode (Click to place) » au point visé ; au clic, crée (annulable) un nœud au point de raycast, rayon 5.0, nom « Pathnode », et un segment depuis le dernier nœud trié.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/crawlEditor/waypoints.lua:179
function editor_crawlEditor_waypoints:createManualPathnode() end

--- Pendant la manipulation : translation (position du gizmo), rotation (nouvelle normale, si le nœud en a une) ou échelle (rayon).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/crawlEditor/waypoints.lua:97
function editor_crawlEditor_waypoints:dragging() end

--- Appelé à chaque frame : mémorise mouseInfo et, si le gizmo est autorisé, met à jour le gizmo et traite l'entrée.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/crawlEditor/waypoints.lua:328
---@param mouseInfo table infos souris de l'éditeur
function editor_crawlEditor_waypoints:draw(mouseInfo) end

--- Dessine l'éditeur des champs personnalisés d'un nœud (tables names/types/values ; type string édité via un champ de 4096 caractères). Crée les tables si absentes.
---Source : lua/ge/extensions/editor/crawlEditor/waypoints.lua:546
---@param fields table {names, types, values}
function editor_crawlEditor_waypoints:drawCustomFields(fields) end

--- Dessine le panneau de détail d'un nœud (nom, position, rayon, normale, champs personnalisés…) avec historique d'annulation.
---Source : lua/ge/extensions/editor/crawlEditor/waypoints.lua:461
---@param pathnode table nœud
---@param index integer id du nœud
function editor_crawlEditor_waypoints:drawPathnodeDetail(pathnode, index) end

--- Dessine la liste des nœuds du trail avec le bouton « Add Pathnode » (crée un nœud à la position de la caméra, rayon 5.0).
---Source : lua/ge/extensions/editor/crawlEditor/waypoints.lua:366
---@param trail table trail contenant path.pathnodes
function editor_crawlEditor_waypoints:drawPathnodeList(trail) end

--- Dessine un prisme entre chaque paire de nœuds consécutifs triés avec l'étiquette « Segment from-to » ; plus opaque en mode « Edit Pathnodes ».
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/crawlEditor/waypoints.lua:278
function editor_crawlEditor_waypoints:drawPathnodeSegments() end

--- Dessine tous les nœuds (mode highlight, normal ou faded selon la sélection et le mode d'édition « Edit Pathnodes »), les segments et le texte de statut.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/crawlEditor/waypoints.lua:247
function editor_crawlEditor_waypoints:drawPathnodeSelectionIndicators() end

--- Fin de manipulation : enregistre l'action « Manipulated Pathnode via Gizmo » dans l'historique avec l'ancien et le nouvel état.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/crawlEditor/waypoints.lua:139
function editor_crawlEditor_waypoints:endDragging() end

--- Renvoie l'id du nœud sélectionné.
---Source : lua/ge/extensions/editor/crawlEditor/waypoints.lua:538
---@return integer  id (-1 si aucun au départ)
function editor_crawlEditor_waypoints:getSelectedPathnodeIndex() end

--- Clic : sélectionne le nœud survolé, ou désélectionne si on ne clique pas sur le gizmo.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/crawlEditor/waypoints.lua:167
---@param hovered table|nil nœud survolé
function editor_crawlEditor_waypoints:handleMouseDown(hovered) end

--- Constructeur : mémorise l'éditeur Crawl parent et initialise sélection, champs et données de glisser.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/crawlEditor/waypoints.lua:33
---@param crawlEditorParam table module editor_crawlEditor (doit fournir allowGizmo())
function editor_crawlEditor_waypoints:init(crawlEditorParam) end

--- Traite l'entrée : indicateurs, création manuelle avec Maj, survol et sélection au clic. Ne fait rien si mouseInfo.valid est faux.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/crawlEditor/waypoints.lua:336
function editor_crawlEditor_waypoints:input() end

--- Cherche le nœud le plus proche de la caméra dont la distance au rayon de la souris est ≤ 1.0 m.
---Source : lua/ge/extensions/editor/crawlEditor/waypoints.lua:222
---@return table|nil  nœud survolé
function editor_crawlEditor_waypoints:mouseOverPathnodes() end

--- Sélectionne le nœud d'id donné : met à jour le mode de dessin (highlight/normal) des nœuds, place le gizmo dessus et vide les champs personnalisés. Ne fait rien si id est nil.
---Source : lua/ge/extensions/editor/crawlEditor/waypoints.lua:48
---@param id integer|nil id du nœud
function editor_crawlEditor_waypoints:selectPathnode(id) end

--- Renvoie le nœud sélectionné, ou nil s'il n'y en a pas ou s'il est marqué missing.
---Source : lua/ge/extensions/editor/crawlEditor/waypoints.lua:159
---@return table|nil  nœud
function editor_crawlEditor_waypoints:selectedPathnode() end

--- Définit le chemin dont on édite les nœuds.
---Source : lua/ge/extensions/editor/crawlEditor/waypoints.lua:44
---@param pathParam table|nil chemin avec pathnodes et segments
function editor_crawlEditor_waypoints:setPath(pathParam) end

--- Définit l'id sélectionné sans mettre à jour le gizmo ni le dessin (contrairement à selectPathnode).
---Source : lua/ge/extensions/editor/crawlEditor/waypoints.lua:542
---@param indexParam integer id du nœud
function editor_crawlEditor_waypoints:setSelectedPathnodeIndex(indexParam) end

--- Place le gizmo sur la position du nœud (orienté selon sa normale en alignement local). Sans effet si le gizmo n'est pas autorisé.
---Source : lua/ge/extensions/editor/crawlEditor/waypoints.lua:65
---@param index integer id du nœud
function editor_crawlEditor_waypoints:updateTransform(index) end


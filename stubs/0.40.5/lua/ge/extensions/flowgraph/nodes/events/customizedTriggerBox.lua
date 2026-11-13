---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/events/customizedTriggerBox.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classe du nœud.
---@class flowgraph_nodes_events_customizedTriggerBox_C
local flowgraph_nodes_events_customizedTriggerBox_C = {}

--- Réinitialise les états dedans/dehors et marque le trigger à recalculer.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/events/customizedTriggerBox.lua:51
function flowgraph_nodes_events_customizedTriggerBox_C:_executionStarted() end

--- Oublie la position, l'échelle et les points mémorisés.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/events/customizedTriggerBox.lua:59
function flowgraph_nodes_events_customizedTriggerBox_C:_executionStopped() end

--- Relit triggerType depuis res.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/events/customizedTriggerBox.lua:263
---@param res table Données sauvegardées
function flowgraph_nodes_events_customizedTriggerBox_C:_onDeserialized(res) end

--- Sauvegarde triggerType dans res.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/events/customizedTriggerBox.lua:259
---@param res table Table de sérialisation
function flowgraph_nodes_events_customizedTriggerBox_C:_onSerialize(res) end

--- Teste si l'un des points du véhicule est dans la zone (containsOBB_point ou containsEllipsoid_Point) et met à jour enterFlag, exitFlag, vehInside.
---Source : lua/ge/extensions/flowgraph/nodes/events/customizedTriggerBox.lua:66
function flowgraph_nodes_events_customizedTriggerBox_C:checkIntersections() end

--- Dessine une boîte colorée avec arêtes via debugDrawer (mode debug).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/events/customizedTriggerBox.lua:178
---@param corner vec3 Coin de départ
---@param x vec3 Vecteur de l'axe x
---@param y vec3 Vecteur de l'axe y
---@param z vec3 Vecteur de l'axe z
---@param clr table Couleur (color(...))
function flowgraph_nodes_events_customizedTriggerBox_C:drawAxisBox(corner, x, y, z, clr) end

--- Éditeur : liste déroulante du type de trigger ; renvoie la raison du changement.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/events/customizedTriggerBox.lua:235
function flowgraph_nodes_events_customizedTriggerBox_C:drawCustomProperties() end

--- Dessin du nœud dans l'éditeur.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/events/customizedTriggerBox.lua:255
---@param builder any
---@param style any
function flowgraph_nodes_events_customizedTriggerBox_C:drawMiddle(builder, style) end

--- Initialise les drapeaux, triggerType = 'Box', data.highPrecision et data.debug à false.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/events/customizedTriggerBox.lua:40
---@param mgr table Gestionnaire du flowgraph
---@param ... any
function flowgraph_nodes_events_customizedTriggerBox_C:init(mgr, ...) end

--- Recalcule la zone si besoin, récupère les points du véhicule, appelle checkIntersections et remplit les pins de sortie.
---Source : lua/ge/extensions/flowgraph/nodes/events/customizedTriggerBox.lua:93
---@param args table Arguments du flowgraph
function flowgraph_nodes_events_customizedTriggerBox_C:work(args) end


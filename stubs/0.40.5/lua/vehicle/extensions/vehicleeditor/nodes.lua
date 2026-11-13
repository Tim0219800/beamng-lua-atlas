---@meta
-- tim19Atlas stub generated from lua/vehicle/extensions/vehicleeditor/nodes.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Petit utilitaire de l'éditeur de véhicule : calcule la masse cumulée de nœuds du véhicule à partir de la masse physique réellement simulée (obj:getNodeMass).
--- Accès : extension `vehicleeditor_nodes` : `extensions.load (VM véhicule)("vehicleeditor_nodes")`, puis la globale `vehicleeditor_nodes`
---@class vehicleeditor_nodes
vehicleeditor_nodes = {}

--- Somme les masses des nœuds de la table et renvoie aussi la plus petite et la plus grande masse de nœud.
---Source : lua/vehicle/extensions/vehicleeditor/nodes.lua:7
---@param nodesTbl table|nil Table de nœuds (chacun avec un champ cid) ; v.data.nodes si nil.
---@return number  Masse totale.
---@return number  Masse minimale d'un nœud.
---@return number  Masse maximale d'un nœud.
function vehicleeditor_nodes.calculateNodesWeight(nodesTbl) end


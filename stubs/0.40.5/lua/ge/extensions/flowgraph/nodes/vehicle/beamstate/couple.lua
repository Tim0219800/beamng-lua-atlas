---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/vehicle/beamstate/couple.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classe du nœud flowgraph (renvoyée par `_flowgraph_createNode(C)`). Champs de définition : name, description, category, pinSchema, tags.
---@class flowgraph_nodes_vehicle_beamstate_couple_C
local flowgraph_nodes_vehicle_beamstate_couple_C = {}

--- Affichage ImGui au centre du nœud dans l'éditeur de flowgraph ; purement visuel.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/vehicle/beamstate/couple.lua:52
---@param builder any Constructeur de nœud de l'éditeur (builder:Middle()).
---@param style any Style ImGui de l'éditeur.
function flowgraph_nodes_vehicle_beamstate_couple_C:drawMiddle(builder, style) end

--- Constructeur ; fixe `data.mode = "activate"` (paramètres `mgr, ...` ignorés).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/vehicle/beamstate/couple.lua:26
---@param mgr any
---@param ... any
function flowgraph_nodes_vehicle_beamstate_couple_C:init(mgr, ...) end

--- Envoie au véhicule la commande beamstate correspondant à `data.mode`.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/vehicle/beamstate/couple.lua:30
function flowgraph_nodes_vehicle_beamstate_couple_C:work() end


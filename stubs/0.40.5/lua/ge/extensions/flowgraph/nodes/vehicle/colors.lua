---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/vehicle/colors.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classe du nœud flowgraph (renvoyée par `_flowgraph_createNode(C)`). Champs de définition : name, description, category, pinSchema, tags.
---@class flowgraph_nodes_vehicle_colors_C
local flowgraph_nodes_vehicle_colors_C = {}

--- Marque les trois pins couleur avec `colorSetup = {vehicleColor = true}` (sélecteur de peinture véhicule dans l'éditeur).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/vehicle/colors.lua:29
function flowgraph_nodes_vehicle_colors_C:postInit() end

--- Crée une peinture par pin couleur non nil, l'applique à l'objet véhicule et envoie la liste des peintures avec `setMetallicPaintData`.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/vehicle/colors.lua:43
function flowgraph_nodes_vehicle_colors_C:work() end


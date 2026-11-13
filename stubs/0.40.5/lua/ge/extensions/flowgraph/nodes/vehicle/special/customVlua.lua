---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/vehicle/special/customVlua.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classe du nœud flowgraph (renvoyée par `_flowgraph_createNode(C)`). Champs de définition : name, description, category, pinSchema, tags.
---@class flowgraph_nodes_vehicle_special_customVlua_C
local flowgraph_nodes_vehicle_special_customVlua_C = {}

--- Migration des anciens projets : déplace `data.func` vers un pin codé en dur `func`.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/vehicle/special/customVlua.lua:49
---@param data any
function flowgraph_nodes_vehicle_special_customVlua_C:_onDeserialized(data) end

--- Affichage central vide.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/vehicle/special/customVlua.lua:45
---@param builder any Constructeur de nœud de l'éditeur (builder:Middle()).
---@param style any Style ImGui de l'éditeur.
function flowgraph_nodes_vehicle_special_customVlua_C:drawMiddle(builder, style) end

--- Envoie `func` au véhicule et recopie `vehId` sur la sortie.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/vehicle/special/customVlua.lua:31
function flowgraph_nodes_vehicle_special_customVlua_C:work() end


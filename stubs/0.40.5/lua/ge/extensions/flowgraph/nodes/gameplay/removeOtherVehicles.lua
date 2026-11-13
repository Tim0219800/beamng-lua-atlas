---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/gameplay/removeOtherVehicles.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classe du nœud flowgraph (créée via `_flowgraph_createNode(C)`).
---@class flowgraph_nodes_gameplay_removeOtherVehicles_C
local flowgraph_nodes_gameplay_removeOtherVehicles_C = {}

--- Restaure les réglages propres au nœud à partir des données sauvegardées.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/removeOtherVehicles.lua:133
---@param data table données sauvegardées du nœud
function flowgraph_nodes_gameplay_removeOtherVehicles_C:_onDeserialized(data) end

--- Ajoute les réglages propres au nœud à la table `res` lors de la sauvegarde du graphe.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/removeOtherVehicles.lua:127
---@param res table table de sérialisation à remplir
function flowgraph_nodes_gameplay_removeOtherVehicles_C:_onSerialize(res) end

--- Dessine les propriétés personnalisées du nœud dans le panneau de l'éditeur flowgraph (ImGui).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/removeOtherVehicles.lua:27
function flowgraph_nodes_gameplay_removeOtherVehicles_C:drawCustomProperties() end

--- Initialise l'état interne du nœud à sa création (appelé par le moteur flowgraph).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/removeOtherVehicles.lua:21
function flowgraph_nodes_gameplay_removeOtherVehicles_C:init() end

--- Ajoute ou retire des pins d'entrée idToIgnore_i pour passer de old à new ; supprime les liens des pins retirés.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/removeOtherVehicles.lua:62
---@param old integer ancien nombre de pins
---@param new integer nouveau nombre de pins
function flowgraph_nodes_gameplay_removeOtherVehicles_C:updatePins(old, new) end

--- Exécuté une seule fois (catégorie once_*) lorsque le nœud est déclenché : lit les pins d'entrée et applique l'effet.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/removeOtherVehicles.lua:81
function flowgraph_nodes_gameplay_removeOtherVehicles_C:workOnce() end


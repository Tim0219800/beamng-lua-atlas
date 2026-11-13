---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/types/number.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classe du noeud flowgraph (retournee par _flowgraph_createNode(C)). Les methodes sont appelees par le gestionnaire flowgraph ou l'editeur.
---@class flowgraph_nodes_types_number_C
local flowgraph_nodes_types_number_C = {}

--- Dessine le contenu central du noeud dans l'éditeur.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/types/number.lua:28
---@param builder any constructeur de noeud imgui
---@param style any style du noeud
function flowgraph_nodes_types_number_C:drawMiddle(builder, style) end

--- data.value = 0 et clearOutPinsOnStart = false.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/types/number.lua:19
function flowgraph_nodes_types_number_C:init() end

--- Vide (nom sans underscore, contrairement à _onSerialize utilisé par les autres noeuds).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/types/number.lua:36
---@param nodeData any données sauvegardées
function flowgraph_nodes_types_number_C:onDeserialized(nodeData) end

--- Vide (nom sans underscore, contrairement à _onSerialize utilisé par les autres noeuds).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/types/number.lua:33
---@param res any table de sauvegarde
function flowgraph_nodes_types_number_C:onSerialize(res) end

--- Écrit data.value sur la sortie.
---Source : lua/ge/extensions/flowgraph/nodes/types/number.lua:24
function flowgraph_nodes_types_number_C:work() end


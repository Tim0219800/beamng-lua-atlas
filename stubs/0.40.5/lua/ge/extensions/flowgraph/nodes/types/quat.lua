---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/types/quat.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classe du noeud flowgraph (retournee par _flowgraph_createNode(C)). Les methodes sont appelees par le gestionnaire flowgraph ou l'editeur.
---@class flowgraph_nodes_types_quat_C
local flowgraph_nodes_types_quat_C = {}

--- Ne restaure rien.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/types/quat.lua:41
---@param nodeData any données sauvegardées
function flowgraph_nodes_types_quat_C:_onDeserialized(nodeData) end

--- Ne sauvegarde rien.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/types/quat.lua:38
---@param res any table de sauvegarde
function flowgraph_nodes_types_quat_C:_onSerialize(res) end

--- Dessine le contenu central du noeud dans l'éditeur.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/types/quat.lua:30
---@param builder any constructeur de noeud imgui
---@param style any style du noeud
function flowgraph_nodes_types_quat_C:drawMiddle(builder, style) end

--- Vide.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/types/quat.lua:35
function flowgraph_nodes_types_quat_C:drawProperties() end

--- Compose le quaternion et écrit la table.
---Source : lua/ge/extensions/flowgraph/nodes/types/quat.lua:24
function flowgraph_nodes_types_quat_C:work() end


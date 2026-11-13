---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/string/match.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classe du noeud flowgraph (retournee par _flowgraph_createNode(C)). Les methodes sont appelees par le gestionnaire flowgraph ou l'editeur.
---@class flowgraph_nodes_string_match_C
local flowgraph_nodes_string_match_C = {}

--- Dessine le contenu central du noeud dans l'éditeur.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/string/match.lua:31
---@param builder any constructeur de noeud imgui
---@param style any style du noeud
function flowgraph_nodes_string_match_C:drawMiddle(builder, style) end

--- data.pattern = '%d'.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/string/match.lua:23
function flowgraph_nodes_string_match_C:init() end

--- Appelle string.match(value, data.pattern.value) et écrit le résultat.
---Source : lua/ge/extensions/flowgraph/nodes/string/match.lua:27
function flowgraph_nodes_string_match_C:work() end


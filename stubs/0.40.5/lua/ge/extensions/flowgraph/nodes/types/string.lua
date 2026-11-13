---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/types/string.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classe du noeud flowgraph (retournee par _flowgraph_createNode(C)). Les methodes sont appelees par le gestionnaire flowgraph ou l'editeur.
---@class flowgraph_nodes_types_string_C
local flowgraph_nodes_types_string_C = {}

--- Restaure la chaîne (supporte l'ancien format data.value) et multiLine.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/types/string.lua:80
---@param nodeData any données sauvegardées
function flowgraph_nodes_types_string_C:_onDeserialized(nodeData) end

--- Sauvegarde l'état du noeud dans la table donnée.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/types/string.lua:75
---@param res any table de sauvegarde
function flowgraph_nodes_types_string_C:_onSerialize(res) end

--- Case « Multi Line » et champ de saisie (tampon de 2048 caractères).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/types/string.lua:29
function flowgraph_nodes_types_string_C:drawCustomProperties() end

--- Dessine le contenu central du noeud dans l'éditeur.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/types/string.lua:58
---@param builder any constructeur de noeud imgui
---@param style any style du noeud
function flowgraph_nodes_types_string_C:drawMiddle(builder, style) end

--- Vide.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/types/string.lua:72
function flowgraph_nodes_types_string_C:drawProperties() end

--- string = 'Hello World', multiLine = false.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/types/string.lua:20
function flowgraph_nodes_types_string_C:init() end

--- Écrit la chaîne sur la sortie.
---Source : lua/ge/extensions/flowgraph/nodes/types/string.lua:25
function flowgraph_nodes_types_string_C:work() end


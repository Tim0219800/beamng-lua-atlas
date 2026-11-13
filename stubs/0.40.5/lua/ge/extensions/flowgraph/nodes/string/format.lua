---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/string/format.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classe du noeud flowgraph (retournee par _flowgraph_createNode(C)). Les methodes sont appelees par le gestionnaire flowgraph ou l'editeur.
---@class flowgraph_nodes_string_format_C
local flowgraph_nodes_string_format_C = {}

--- Restaure count et recrée les pins.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/string/format.lua:71
---@param res any données sauvegardées
function flowgraph_nodes_string_format_C:_onDeserialized(res) end

--- Sauvegarde l'état du noeud dans la table donnée.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/string/format.lua:67
---@param res any table de sauvegarde
function flowgraph_nodes_string_format_C:_onSerialize(res) end

--- Champ « Count » (min 1) qui ajoute/retire des pins.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/string/format.lua:31
function flowgraph_nodes_string_format_C:drawCustomProperties() end

--- Dessine le contenu central du noeud dans l'éditeur.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/string/format.lua:145
---@param builder any constructeur de noeud imgui
---@param style any style du noeud
function flowgraph_nodes_string_format_C:drawMiddle(builder, style) end

--- data.pattern = '%d' et count = 1.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/string/format.lua:22
function flowgraph_nodes_string_format_C:init() end

--- Crée les pins value_i initiaux.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/string/format.lua:27
function flowgraph_nodes_string_format_C:postInit() end

--- Crée ou supprime les pins value_i (et les liens associés) pour passer de old à new valeurs.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/string/format.lua:49
---@param old any nombre actuel
---@param new any nouveau nombre
function flowgraph_nodes_string_format_C:updatePins(old, new) end

--- Formate le pattern avec les valeurs value_1..value_count.
---Source : lua/ge/extensions/flowgraph/nodes/string/format.lua:77
function flowgraph_nodes_string_format_C:work() end


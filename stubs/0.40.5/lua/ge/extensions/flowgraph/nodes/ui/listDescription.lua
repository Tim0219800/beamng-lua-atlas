---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/ui/listDescription.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classe du nœud flowgraph (retournée par _flowgraph_createNode(C)).
---@class flowgraph_nodes_ui_listDescription_C
local flowgraph_nodes_ui_listDescription_C = {}

--- Restaure count.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/ui/listDescription.lua:69
---@param res table Table de sauvegarde du nœud à remplir.
function flowgraph_nodes_ui_listDescription_C:_onDeserialized(res) end

--- Sauvegarde count.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/ui/listDescription.lua:65
---@param res table Table de sauvegarde du nœud à remplir.
function flowgraph_nodes_ui_listDescription_C:_onSerialize(res) end

--- Champ « List Item Count ».
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/ui/listDescription.lua:29
function flowgraph_nodes_ui_listDescription_C:drawCustomProperties() end

--- count = 1.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/ui/listDescription.lua:21
function flowgraph_nodes_ui_listDescription_C:init() end

--- Crée les pins initiaux.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/ui/listDescription.lua:25
function flowgraph_nodes_ui_listDescription_C:postInit() end

--- Ajuste le nombre de pins item_i.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/ui/listDescription.lua:47
---@param old integer Ancien nombre d'éléments.
---@param new integer Nouveau nombre d'éléments.
function flowgraph_nodes_ui_listDescription_C:updatePins(old, new) end

--- Traduit chaque élément (core_locales.translateWithOrWithoutContext), construit la liste et l'écrit sur « value ».
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/ui/listDescription.lua:74
function flowgraph_nodes_ui_listDescription_C:work() end


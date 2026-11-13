---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/util/getMapObjectsDynField.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classe du nœud flowgraph ; chaque instance représente un nœud dans un graphe.
---@class flowgraph_nodes_util_getMapObjectsDynField_C
local flowgraph_nodes_util_getMapObjectsDynField_C = {}

--- Met oldPos à nil (champ inutilisé ensuite).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/util/getMapObjectsDynField.lua:24
function flowgraph_nodes_util_getMapObjectsDynField_C:_executionStarted() end

--- Parcourt map.objects, lit object:getDynamicFields() et renvoie les ids dont un nom correspond.
---Source : lua/ge/extensions/flowgraph/nodes/util/getMapObjectsDynField.lua:28
---@param dynamicFieldName string Nom du champ dynamique recherché.
function flowgraph_nodes_util_getMapObjectsDynField_C:findObjectsWithDynField(dynamicFieldName) end

--- Ne fait rien.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/util/getMapObjectsDynField.lua:20
---@param mgr any
function flowgraph_nodes_util_getMapObjectsDynField_C:init(mgr) end

--- Si le nom est fourni, recalcule la liste à chaque frame et l'écrit dans objects.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/util/getMapObjectsDynField.lua:41
function flowgraph_nodes_util_getMapObjectsDynField_C:work() end


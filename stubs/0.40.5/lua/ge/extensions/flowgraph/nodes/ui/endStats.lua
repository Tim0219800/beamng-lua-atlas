---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/ui/endStats.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classe du nœud flowgraph (retournée par _flowgraph_createNode(C)).
---@class flowgraph_nodes_ui_endStats_C
local flowgraph_nodes_ui_endStats_C = {}

--- Vide.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/ui/endStats.lua:37
function flowgraph_nodes_ui_endStats_C:_executionStarted() end

--- Restaure count.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/ui/endStats.lua:105
---@param res table Table de sauvegarde du nœud à remplir.
function flowgraph_nodes_ui_endStats_C:_onDeserialized(res) end

--- Sauvegarde count.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/ui/endStats.lua:101
---@param res table Table de sauvegarde du nœud à remplir.
function flowgraph_nodes_ui_endStats_C:_onSerialize(res) end

--- Champ « Count » pour le nombre de statistiques.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/ui/endStats.lua:41
function flowgraph_nodes_ui_endStats_C:drawCustomProperties() end

--- Zone centrale vide.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/ui/endStats.lua:32
---@param builder any Constructeur de nœud de l'éditeur (builder:Middle() ouvre la zone centrale).
---@param style any Style d'affichage du nœud fourni par l'éditeur.
function flowgraph_nodes_ui_endStats_C:drawMiddle(builder, style) end

--- count = 0.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/ui/endStats.lua:28
function flowgraph_nodes_ui_endStats_C:init() end

--- Ajuste le nombre de groupes de 3 pins d'entrée (label, points, maxPoints).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/ui/endStats.lua:58
---@param old integer Ancien nombre d'éléments.
---@param new integer Nouveau nombre d'éléments.
function flowgraph_nodes_ui_endStats_C:updatePins(old, new) end

--- Reprend la liste en entrée, ajoute une entrée {label, points, maxPoints, relativePoints} par statistique et l'écrit sur « statData ».
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/ui/endStats.lua:86
function flowgraph_nodes_ui_endStats_C:work() end


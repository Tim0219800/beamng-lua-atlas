---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/ui/multiDescription.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classe du nœud flowgraph (retournée par _flowgraph_createNode(C)).
---@class flowgraph_nodes_ui_multiDescription_C
local flowgraph_nodes_ui_multiDescription_C = {}

--- Restaure count.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/ui/multiDescription.lua:69
---@param res table Table de sauvegarde du nœud à remplir.
function flowgraph_nodes_ui_multiDescription_C:_onDeserialized(res) end

--- Sauvegarde count.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/ui/multiDescription.lua:65
---@param res table Table de sauvegarde du nœud à remplir.
function flowgraph_nodes_ui_multiDescription_C:_onSerialize(res) end

--- Champ « Count ».
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/ui/multiDescription.lua:29
function flowgraph_nodes_ui_multiDescription_C:drawCustomProperties() end

--- Affiche self.data.pattern (10 premiers caractères) si défini.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/ui/multiDescription.lua:82
---@param builder any Constructeur de nœud de l'éditeur (builder:Middle() ouvre la zone centrale).
---@param style any Style d'affichage du nœud fourni par l'éditeur.
function flowgraph_nodes_ui_multiDescription_C:drawMiddle(builder, style) end

--- count = 1.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/ui/multiDescription.lua:21
function flowgraph_nodes_ui_multiDescription_C:init() end

--- Crée les pins initiaux.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/ui/multiDescription.lua:25
function flowgraph_nodes_ui_multiDescription_C:postInit() end

--- Ajuste le nombre de pins value_i.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/ui/multiDescription.lua:47
---@param old integer Ancien nombre d'éléments.
---@param new integer Nouveau nombre d'éléments.
function flowgraph_nodes_ui_multiDescription_C:updatePins(old, new) end

--- Construit la liste des valeurs d'entrée et l'écrit sur « value ».
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/ui/multiDescription.lua:75
function flowgraph_nodes_ui_multiDescription_C:work() end


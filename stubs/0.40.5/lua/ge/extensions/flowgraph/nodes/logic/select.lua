---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/logic/select.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classe du noeud flowgraph (creee par _flowgraph_createNode(C)). Les methodes sont appelees par le gestionnaire flowgraph ou l'editeur.
---@class flowgraph_nodes_logic_select_C
local flowgraph_nodes_logic_select_C = {}

--- Vide.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/logic/select.lua:38
function flowgraph_nodes_logic_select_C:_executionStarted() end

--- Relit mode ('first' par defaut) et count, recree les pins.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/logic/select.lua:128
---@param res any
function flowgraph_nodes_logic_select_C:_onDeserialized(res) end

--- Sauvegarde mode et count.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/logic/select.lua:123
---@param res any
function flowgraph_nodes_logic_select_C:_onSerialize(res) end

--- Panneau : nombre de choix (Count) et liste deroulante des fonctions de fusion (hors 'readOnly') avec infobulle.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/logic/select.lua:42
function flowgraph_nodes_logic_select_C:drawCustomProperties() end

--- Affiche le mode de fusion.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/logic/select.lua:32
---@param builder any
---@param style any
function flowgraph_nodes_logic_select_C:drawMiddle(builder, style) end

--- count=1, mode='first'.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/logic/select.lua:27
function flowgraph_nodes_logic_select_C:init() end

--- Cree ou supprime les paires de pins select_i / value_i et les liens associes.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/logic/select.lua:74
---@param old integer ancien nombre
---@param new integer nouveau nombre
function flowgraph_nodes_logic_select_C:updatePins(old, new) end

--- Initialise la fusion, merge les value_i dont select_i est actif (si flow), finalise. Si au moins un choix : flow=true et value=resultat ; sinon flow suit l'entree et value=nil.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/logic/select.lua:100
function flowgraph_nodes_logic_select_C:work() end


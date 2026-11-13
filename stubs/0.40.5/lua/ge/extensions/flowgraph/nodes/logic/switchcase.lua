---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/logic/switchcase.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classe du noeud flowgraph (creee par _flowgraph_createNode(C)). Les methodes sont appelees par le gestionnaire flowgraph ou l'editeur.
---@class flowgraph_nodes_logic_switchcase_C
local flowgraph_nodes_logic_switchcase_C = {}

--- Vide.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/logic/switchcase.lua:36
function flowgraph_nodes_logic_switchcase_C:_executionStarted() end

--- Relit count (1 par defaut) et recree les pins.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/logic/switchcase.lua:100
---@param res any
function flowgraph_nodes_logic_switchcase_C:_onDeserialized(res) end

--- Sauvegarde count.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/logic/switchcase.lua:96
---@param res any
function flowgraph_nodes_logic_switchcase_C:_onSerialize(res) end

--- Panneau : nombre de cas (Count).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/logic/switchcase.lua:40
function flowgraph_nodes_logic_switchcase_C:drawCustomProperties() end

--- Dessine le milieu du noeud (vide).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/logic/switchcase.lua:31
---@param builder any
---@param style any
function flowgraph_nodes_logic_switchcase_C:drawMiddle(builder, style) end

--- count=1.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/logic/switchcase.lua:26
function flowgraph_nodes_logic_switchcase_C:init() end

--- Cree ou supprime les pins value_i et match_i et les liens associes.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/logic/switchcase.lua:57
---@param old integer ancien nombre
---@param new integer nouveau nombre
function flowgraph_nodes_logic_switchcase_C:updatePins(old, new) end

--- flow=true ; pour chaque i, match_i = (value_i == value) ; none = aucun correspondant.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/logic/switchcase.lua:82
function flowgraph_nodes_logic_switchcase_C:work() end


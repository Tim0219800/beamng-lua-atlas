---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/logic/timedTrigger.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classe du noeud flowgraph (creee par _flowgraph_createNode(C)). Les methodes sont appelees par le gestionnaire flowgraph ou l'editeur.
---@class flowgraph_nodes_logic_timedTrigger_C
local flowgraph_nodes_logic_timedTrigger_C = {}

--- Remet tous les compteurs a zero.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/logic/timedTrigger.lua:35
function flowgraph_nodes_logic_timedTrigger_C:_executionStopped() end

--- Relit data.duration.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/logic/timedTrigger.lua:47
---@param res any
function flowgraph_nodes_logic_timedTrigger_C:_onDeserialized(res) end

--- Sauvegarde data.duration.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/logic/timedTrigger.lua:43
---@param res any
function flowgraph_nodes_logic_timedTrigger_C:_onSerialize(res) end

--- Deux barres de progression (charge et reset) avec temps restant.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/logic/timedTrigger.lua:70
---@param builder any
---@param style any
function flowgraph_nodes_logic_timedTrigger_C:drawMiddle(builder, style) end

--- Initialise resetTimer=1, duration=3 et l'etat interne.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/logic/timedTrigger.lua:25
---@param mgr any
---@param ... any
function flowgraph_nodes_logic_timedTrigger_C:init(mgr, ...) end

--- Incremente timer (dtSim) quand charge est actif, declenche completeTrigger a la duree ; sinon incremente reset et remet le timer a zero apres resetTimer.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/logic/timedTrigger.lua:50
function flowgraph_nodes_logic_timedTrigger_C:updateCharge() end

--- Appelle updateCharge, flow = (timer >= duration), complete = impulsion une seule fois (completeReady).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/logic/timedTrigger.lua:80
---@param args any non utilise
function flowgraph_nodes_logic_timedTrigger_C:work(args) end


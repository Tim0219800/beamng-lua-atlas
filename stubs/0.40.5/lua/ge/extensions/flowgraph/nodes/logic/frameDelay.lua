---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/logic/frameDelay.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classe du noeud flowgraph (creee par _flowgraph_createNode(C)). Les methodes sont appelees par le gestionnaire flowgraph ou l'editeur.
---@class flowgraph_nodes_logic_frameDelay_C
local flowgraph_nodes_logic_frameDelay_C = {}

--- Remet counter et running a zero au demarrage.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/logic/frameDelay.lua:28
function flowgraph_nodes_logic_frameDelay_C:_executionStarted() end

--- Relit data.duration.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/logic/frameDelay.lua:37
---@param res any
function flowgraph_nodes_logic_frameDelay_C:_onDeserialized(res) end

--- Sauvegarde data.duration (champ herite, non utilise ailleurs).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/logic/frameDelay.lua:33
---@param res any
function flowgraph_nodes_logic_frameDelay_C:_onSerialize(res) end

--- Barre de progression compteur/frames et bouton Reset.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/logic/frameDelay.lua:49
---@param builder any
---@param style any
function flowgraph_nodes_logic_frameDelay_C:drawMiddle(builder, style) end

--- Initialise counter=0 et running=false.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/logic/frameDelay.lua:23
---@param mgr any
---@param ... any
function flowgraph_nodes_logic_frameDelay_C:init(mgr, ...) end

--- Si en cours, incremente le compteur et arrete quand il depasse 'frames'.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/logic/frameDelay.lua:41
function flowgraph_nodes_logic_frameDelay_C:updateCounter() end

--- Gere reset, demarre le compte quand il y a du flux, appelle updateCounter ; sortie flow = (counter >= frames).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/logic/frameDelay.lua:59
---@param args any non utilise
function flowgraph_nodes_logic_frameDelay_C:work(args) end


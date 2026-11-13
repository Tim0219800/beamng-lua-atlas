---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/logic/rateLimit.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classe du noeud flowgraph (creee par _flowgraph_createNode(C)). Les methodes sont appelees par le gestionnaire flowgraph ou l'editeur.
---@class flowgraph_nodes_logic_rateLimit_C
local flowgraph_nodes_logic_rateLimit_C = {}

--- Remet time et prevFps a leur valeur initiale.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/logic/rateLimit.lua:39
function flowgraph_nodes_logic_rateLimit_C:_executionStarted() end

--- Barre de progression du cycle.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/logic/rateLimit.lua:44
---@param builder any
---@param style any
function flowgraph_nodes_logic_rateLimit_C:drawMiddle(builder, style) end

--- time=0, prevFps=-1.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/logic/rateLimit.lua:34
function flowgraph_nodes_logic_rateLimit_C:init() end

--- Reinitialise le minuteur au reset ou quand input change ; avec du flux, decremente time de dt ; quand time <= 0, ajoute 1/fps (ou input en mode duree) et emet flow=true cette frame, sinon false.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/logic/rateLimit.lua:51
function flowgraph_nodes_logic_rateLimit_C:work() end


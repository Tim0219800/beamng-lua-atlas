---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/career/menuClosed.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classe du nœud.
---@class flowgraph_nodes_career_menuClosed_C
local flowgraph_nodes_career_menuClosed_C = {}

--- Crée la table de drapeaux.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/career/menuClosed.lua:19
function flowgraph_nodes_career_menuClosed_C:init() end

--- Hook : si le joueur est revenu en état de jeu, lève le drapeau menuClosed.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/career/menuClosed.lua:31
---@param enteredPlay boolean vrai si on entre dans l'état de jeu
function flowgraph_nodes_career_menuClosed_C:onUIPlayStateChanged(enteredPlay) end

--- Chaque frame : menuClosed à faux, applique puis efface les drapeaux.
---Source : lua/ge/extensions/flowgraph/nodes/career/menuClosed.lua:23
---@param args any non utilisé
function flowgraph_nodes_career_menuClosed_C:work(args) end


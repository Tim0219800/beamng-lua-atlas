---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/career/onMissionRunstateChanged.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classe du nœud.
---@class flowgraph_nodes_career_onMissionRunstateChanged_C
local flowgraph_nodes_career_onMissionRunstateChanged_C = {}

--- Crée la table de drapeaux.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/career/onMissionRunstateChanged.lua:22
function flowgraph_nodes_career_onMissionRunstateChanged_C:init() end

--- Hook : lève stopped quand le nouvel état est 'stopped'.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/career/onMissionRunstateChanged.lua:39
---@param newState string nouvel état de la mission
---@param mission table mission concernée (non utilisée)
function flowgraph_nodes_career_onMissionRunstateChanged_C:onAnyMissionChanged(newState, mission) end

--- Hook : lève started.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/career/onMissionRunstateChanged.lua:35
---@param data any non utilisé
function flowgraph_nodes_career_onMissionRunstateChanged_C:onMissionStartWithFade(data) end

--- Chaque frame : started à faux, applique puis efface les drapeaux.
---Source : lua/ge/extensions/flowgraph/nodes/career/onMissionRunstateChanged.lua:27
---@param args any non utilisé
function flowgraph_nodes_career_onMissionRunstateChanged_C:work(args) end


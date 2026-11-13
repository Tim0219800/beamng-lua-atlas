---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/activity/starsActive.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classe du nœud.
---@class flowgraph_nodes_activity_starsActive_C
local flowgraph_nodes_activity_starsActive_C = {}

--- Efface le cache des étoiles actives.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/activity/starsActive.lua:28
function flowgraph_nodes_activity_starsActive_C:_executionStarted() end

--- Active savePins et allowCustomOutPins.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/activity/starsActive.lua:23
function flowgraph_nodes_activity_starsActive_C:init() end

--- Calcule (une fois) starInfo puis met chaque pin de sortie flow à enabled de l'étoile correspondante.
---Source : lua/ge/extensions/flowgraph/nodes/activity/starsActive.lua:33
function flowgraph_nodes_activity_starsActive_C:work() end


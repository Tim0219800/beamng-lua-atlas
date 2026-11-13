---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/ui/missionControlHint.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classe du nœud flowgraph (retournée par _flowgraph_createNode(C)).
---@class flowgraph_nodes_ui_missionControlHint_C
local flowgraph_nodes_ui_missionControlHint_C = {}

--- Restaure count.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/ui/missionControlHint.lua:92
---@param res table Table de sauvegarde du nœud à remplir.
function flowgraph_nodes_ui_missionControlHint_C:_onDeserialized(res) end

--- Sauvegarde count.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/ui/missionControlHint.lua:88
---@param res table Table de sauvegarde du nœud à remplir.
function flowgraph_nodes_ui_missionControlHint_C:_onSerialize(res) end

--- Champ « Hint Count ».
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/ui/missionControlHint.lua:71
function flowgraph_nodes_ui_missionControlHint_C:drawCustomProperties() end

--- count = 1.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/ui/missionControlHint.lua:40
function flowgraph_nodes_ui_missionControlHint_C:init() end

--- Crée les pins et charge l'extension ui_apps_missionControls.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/ui/missionControlHint.lua:44
function flowgraph_nodes_ui_missionControlHint_C:postInit() end

--- Ajuste le nombre de trios de pins (action, uiEvent, label).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/ui/missionControlHint.lua:49
---@param old integer Ancien nombre d'éléments.
---@param new integer Nouveau nombre d'éléments.
function flowgraph_nodes_ui_missionControlHint_C:updatePins(old, new) end

--- Charge l'extension si besoin, efface si reset, sinon envoie ou efface chaque indication via setControl.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/ui/missionControlHint.lua:97
function flowgraph_nodes_ui_missionControlHint_C:work() end


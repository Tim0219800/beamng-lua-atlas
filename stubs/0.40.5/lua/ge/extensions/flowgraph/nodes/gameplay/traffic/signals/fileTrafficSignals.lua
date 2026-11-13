---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/gameplay/traffic/signals/fileTrafficSignals.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classe du nœud flowgraph (créée via `_flowgraph_createNode(C)`).
---@class flowgraph_nodes_gameplay_traffic_signals_fileTrafficSignals_C
local flowgraph_nodes_gameplay_traffic_signals_fileTrafficSignals_C = {}

--- Vide la sortie et recharge le fichier de signaux par défaut de la carte.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/traffic/signals/fileTrafficSignals.lua:47
function flowgraph_nodes_gameplay_traffic_signals_fileTrafficSignals_C:_executionStopped() end

--- Dessine les propriétés personnalisées du nœud dans le panneau de l'éditeur flowgraph (ImGui).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/traffic/signals/fileTrafficSignals.lua:35
function flowgraph_nodes_gameplay_traffic_signals_fileTrafficSignals_C:drawCustomProperties() end

--- Initialise l'état interne du nœud à sa création (appelé par le moteur flowgraph).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/traffic/signals/fileTrafficSignals.lua:24
function flowgraph_nodes_gameplay_traffic_signals_fileTrafficSignals_C:init() end

--- Vide la sortie signalsData.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/traffic/signals/fileTrafficSignals.lua:43
function flowgraph_nodes_gameplay_traffic_signals_fileTrafficSignals_C:onNodeReset() end

--- Appelé après la création des pins du nœud ; sert à ajuster les pins (modèles de valeurs, filtres de fichiers, clés dynamiques).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/traffic/signals/fileTrafficSignals.lua:29
function flowgraph_nodes_gameplay_traffic_signals_fileTrafficSignals_C:postInit() end

--- Au premier appel, charge les signaux, active la simulation et publie core_trafficSignals.getData() sur signalsData.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/traffic/signals/fileTrafficSignals.lua:54
function flowgraph_nodes_gameplay_traffic_signals_fileTrafficSignals_C:work() end


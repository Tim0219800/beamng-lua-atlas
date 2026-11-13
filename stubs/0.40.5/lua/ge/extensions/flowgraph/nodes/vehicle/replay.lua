---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/vehicle/replay.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classe du nœud flowgraph (renvoyée par `_flowgraph_createNode(C)`). Champs de définition : name, description, category, pinSchema, tags.
---@class flowgraph_nodes_vehicle_replay_C
local flowgraph_nodes_vehicle_replay_C = {}

--- Arrête le replay en cours.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/vehicle/replay.lua:46
function flowgraph_nodes_vehicle_replay_C:_executionStopped() end

--- Bouton « Load Replays » et liste déroulante pour choisir un enregistrement.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/vehicle/replay.lua:50
function flowgraph_nodes_vehicle_replay_C:drawCustomProperties() end

--- Affiche le nom du replay et les drapeaux internes.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/vehicle/replay.lua:82
---@param builder any Constructeur de nœud de l'éditeur (builder:Middle()).
---@param style any Style ImGui de l'éditeur.
function flowgraph_nodes_vehicle_replay_C:drawMiddle(builder, style) end

--- Constructeur ; configure la timeline (5 à 10) et `replayName`.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/vehicle/replay.lua:28
function flowgraph_nodes_vehicle_replay_C:init() end

--- Appelé au début du segment de timeline ; demande le démarrage du replay.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/vehicle/replay.lua:72
---@param globalTime number Temps global de la timeline.
---@param localTime number Temps local du segment.
function flowgraph_nodes_vehicle_replay_C:onTimelineBegin(globalTime, localTime) end

--- Appelé à la fin du segment ; demande l'arrêt du replay.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/vehicle/replay.lua:77
---@param globalTime number Temps global de la timeline.
---@param localTime number Temps local du segment.
function flowgraph_nodes_vehicle_replay_C:onTimelineEnd(globalTime, localTime) end

--- Charge le replay (chemin relatif du `filename`) si `startReplay`, ou l'arrête si `stopReplay`.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/vehicle/replay.lua:33
function flowgraph_nodes_vehicle_replay_C:work() end


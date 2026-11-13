---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/vehicle/ai/scriptAI/playRecording.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classe du nœud flowgraph ; chaque instance représente un nœud dans un graphe.
---@class flowgraph_nodes_vehicle_ai_scriptAI_playRecording_C
local flowgraph_nodes_vehicle_ai_scriptAI_playRecording_C = {}

--- Affiche un bouton Load, l'état et les infos de l'enregistrement (véhicule, niveau, nombre de points, durée) ; dessine le tracé si renderDebug.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/vehicle/ai/scriptAI/playRecording.lua:96
---@param builder table Constructeur de nœud.
---@param style table Style du nœud.
function flowgraph_nodes_vehicle_ai_scriptAI_playRecording_C:drawMiddle(builder, style) end

--- Renvoie le véhicule dont l'id est donné en entrée, ou le véhicule du joueur (getPlayerVehicle(0)) sans entrée.
---Source : lua/ge/extensions/flowgraph/nodes/vehicle/ai/scriptAI/playRecording.lua:44
function flowgraph_nodes_vehicle_ai_scriptAI_playRecording_C:getVeh() end

--- Initialise recording=nil, data.renderDebug=false et running=false.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/vehicle/ai/scriptAI/playRecording.lua:32
function flowgraph_nodes_vehicle_ai_scriptAI_playRecording_C:init() end

--- Lit le fichier JSON en essayant trois emplacements (relatif au projet, dossier des pistes, dossier des pistes + extension) et le mémorise.
---Source : lua/ge/extensions/flowgraph/nodes/vehicle/ai/scriptAI/playRecording.lua:76
function flowgraph_nodes_vehicle_ai_scriptAI_playRecording_C:loadRecording() end

--- Charge l'enregistrement, fixe loopCount et loopType « firstOnlyTeleport » puis envoie ai.startFollowing(recording).
---Source : lua/ge/extensions/flowgraph/nodes/vehicle/ai/scriptAI/playRecording.lua:54
function flowgraph_nodes_vehicle_ai_scriptAI_playRecording_C:play() end

--- Limite le sélecteur de fichier de fileName aux fichiers .track.json.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/vehicle/ai/scriptAI/playRecording.lua:38
function flowgraph_nodes_vehicle_ai_scriptAI_playRecording_C:postInit() end

--- Passe running à false et envoie ai.stopFollowing() au véhicule.
---Source : lua/ge/extensions/flowgraph/nodes/vehicle/ai/scriptAI/playRecording.lua:67
function flowgraph_nodes_vehicle_ai_scriptAI_playRecording_C:stop() end

--- Appelle play sur l'impulsion start, ou stop sur l'impulsion stop.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/vehicle/ai/scriptAI/playRecording.lua:88
function flowgraph_nodes_vehicle_ai_scriptAI_playRecording_C:work() end


---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/vehicle/ai/scriptAI/followPath.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classe du nœud flowgraph ; chaque instance représente un nœud dans un graphe.
---@class flowgraph_nodes_vehicle_ai_scriptAI_followPath_C
local flowgraph_nodes_vehicle_ai_scriptAI_followPath_C = {}

--- Arrête l'IA si le chemin était en cours puis remet started/complete à false.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/vehicle/ai/scriptAI/followPath.lua:87
function flowgraph_nodes_vehicle_ai_scriptAI_followPath_C:_executionStopped() end

--- Restaure timeScale (1 par défaut).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/vehicle/ai/scriptAI/followPath.lua:138
---@param nodeData any
function flowgraph_nodes_vehicle_ai_scriptAI_followPath_C:_onDeserialized(nodeData) end

--- Sauvegarde timeScale.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/vehicle/ai/scriptAI/followPath.lua:134
---@param res any
function flowgraph_nodes_vehicle_ai_scriptAI_followPath_C:_onSerialize(res) end

--- Dessine le champ Timescale (minimum 0,25), le choix du mode de reset et le bouton « Reset AI ».
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/vehicle/ai/scriptAI/followPath.lua:38
function flowgraph_nodes_vehicle_ai_scriptAI_followPath_C:drawCustomProperties() end

--- Affiche les états Complete et Started.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/vehicle/ai/scriptAI/followPath.lua:143
---@param builder table Constructeur de nœud.
---@param style table Style du nœud.
function flowgraph_nodes_vehicle_ai_scriptAI_followPath_C:drawMiddle(builder, style) end

--- Envoie au véhicule ai:scriptStop(handBrake, straightenWheels).
---Source : lua/ge/extensions/flowgraph/nodes/vehicle/ai/scriptAI/followPath.lua:70
function flowgraph_nodes_vehicle_ai_scriptAI_followPath_C:endAI() end

--- Renvoie le véhicule dont l'id est donné en entrée, ou le véhicule du joueur (getPlayerVehicle(0)) sans entrée.
---Source : lua/ge/extensions/flowgraph/nodes/vehicle/ai/scriptAI/followPath.lua:60
function flowgraph_nodes_vehicle_ai_scriptAI_followPath_C:getVeh() end

--- Initialise started, complete, loopMode=« neverReset », timeScale=1 et les données.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/vehicle/ai/scriptAI/followPath.lua:29
function flowgraph_nodes_vehicle_ai_scriptAI_followPath_C:init() end

--- Charge le chemin depuis le pin path dans self.path.
---Source : lua/ge/extensions/flowgraph/nodes/vehicle/ai/scriptAI/followPath.lua:95
function flowgraph_nodes_vehicle_ai_scriptAI_followPath_C:loadPath() end

--- Hook appelé par la commande envoyée à chaque frame (ai.scriptState du véhicule) ; quand l'info est nil pour ce véhicule et ce nœud, marque le chemin comme terminé et arrête l'IA.
---Source : lua/ge/extensions/flowgraph/nodes/vehicle/ai/scriptAI/followPath.lua:77
---@param id string|number Id du véhicule.
---@param info table|nil État du script IA, nil quand il est fini.
---@param nodeID number|nil Id du nœud demandeur.
function flowgraph_nodes_vehicle_ai_scriptAI_followPath_C:onVehicleSubmitInfo(id, info, nodeID) end

--- Prépare le chemin (temps divisés par timeScale, dir/up conservés) et envoie ai.startFollowing(chemin, nil, loopCount, mode de boucle).
---Source : lua/ge/extensions/flowgraph/nodes/vehicle/ai/scriptAI/followPath.lua:99
function flowgraph_nodes_vehicle_ai_scriptAI_followPath_C:setupAI() end

--- Gère reset ; au premier passage lance setupAI ; chaque frame demande via be:queueAllObjectLua l'état ai.scriptState() de chaque véhicule qui rappelle le hook onVehicleSubmitInfo ; active flow une fois complete.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/vehicle/ai/scriptAI/followPath.lua:118
function flowgraph_nodes_vehicle_ai_scriptAI_followPath_C:work() end


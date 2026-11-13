---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/gameplay/rally/vehicleStoppedNearPlane.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classe du nœud.
---@class flowgraph_nodes_gameplay_rally_vehicleStoppedNearPlane_C
local flowgraph_nodes_gameplay_rally_vehicleStoppedNearPlane_C = {}

--- Remet à zéro chrono, cache et état de proximité.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/rally/vehicleStoppedNearPlane.lua:59
function flowgraph_nodes_gameplay_rally_vehicleStoppedNearPlane_C:_executionStarted() end

--- Dessine le plan et les repères de debug via StagedCountdownUtils.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/rally/vehicleStoppedNearPlane.lua:262
function flowgraph_nodes_gameplay_rally_vehicleStoppedNearPlane_C:drawDebugVisualization() end

--- Affiche une barre de progression du chrono.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/rally/vehicleStoppedNearPlane.lua:87
---@param builder table Constructeur de nœud.
---@param style table Style.
function flowgraph_nodes_gameplay_rally_vehicleStoppedNearPlane_C:drawMiddle(builder, style) end

--- Renvoie le gestionnaire de boucle rally si gameplay_rallyLoop existe.
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/rally/vehicleStoppedNearPlane.lua:250
---@return table|nil  Gestionnaire.
function flowgraph_nodes_gameplay_rally_vehicleStoppedNearPlane_C:getRallyLoopManager() end

--- Initialise le chrono et l'état de proximité mis en cache.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/rally/vehicleStoppedNearPlane.lua:33
---@param mgr table Gestionnaire flowgraph.
---@param ... any
function flowgraph_nodes_gameplay_rally_vehicleStoppedNearPlane_C:init(mgr, ...) end

--- Renvoie l'état de proximité mis en cache.
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/rally/vehicleStoppedNearPlane.lua:258
---@return boolean  Près du plan.
function flowgraph_nodes_gameplay_rally_vehicleStoppedNearPlane_C:isNearPlane() end

--- Vrai si data.drawDebug ou le drapeau stopZones de la boucle rally est actif.
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/rally/vehicleStoppedNearPlane.lua:245
---@return boolean  Dessiner le debug.
function flowgraph_nodes_gameplay_rally_vehicleStoppedNearPlane_C:shouldDrawDebug() end

--- Calcule distance signée au plan, distance latérale, zone finie, arrêt, proximité, distance d'affichage et état « staged ».
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/rally/vehicleStoppedNearPlane.lua:179
function flowgraph_nodes_gameplay_rally_vehicleStoppedNearPlane_C:updateProximityState() end

--- Avance le chrono ; à la durée atteinte, arrête le chrono et émet l'impulsion.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/rally/vehicleStoppedNearPlane.lua:78
function flowgraph_nodes_gameplay_rally_vehicleStoppedNearPlane_C:updateTimer() end

--- Met à jour position avant et vitesse du véhicule suivi à partir de map.objects.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/rally/vehicleStoppedNearPlane.lua:99
---@return boolean  Vrai si les données sont valides.
function flowgraph_nodes_gameplay_rally_vehicleStoppedNearPlane_C:updateVehicleData() end

--- Chaque frame : lit pos/rot, met à jour le véhicule et la proximité, gère chrono et reset, diffuse l'UI, renseigne flow et impulse.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/rally/vehicleStoppedNearPlane.lua:272
---@param args table Arguments du moteur flowgraph (non utilisés).
function flowgraph_nodes_gameplay_rally_vehicleStoppedNearPlane_C:work(args) end


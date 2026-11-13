---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/gameplay/race/fileRace.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classe du nœud.
---@class flowgraph_nodes_gameplay_race_fileRace_C
local flowgraph_nodes_gameplay_race_fileRace_C = {}

--- Remet à zéro race, started et vehicleChanged.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/race/fileRace.lua:103
function flowgraph_nodes_gameplay_race_fileRace_C:_executionStarted() end

--- Appelle race:stopRace() si une course existe, puis l'oublie.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/race/fileRace.lua:109
function flowgraph_nodes_gameplay_race_fileRace_C:_executionStopped() end

--- Relit count (défaut 1) et recrée les pins.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/race/fileRace.lua:99
---@param res table Données sérialisées.
function flowgraph_nodes_gameplay_race_fileRace_C:_onDeserialized(res) end

--- Sauvegarde count dans la table de sérialisation.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/race/fileRace.lua:95
---@param res table Table de résultat à compléter.
function flowgraph_nodes_gameplay_race_fileRace_C:_onSerialize(res) end

--- Champ éditeur « Vehicle Count » qui ajoute ou retire des pins vehId_i.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/race/fileRace.lua:59
---@return string|nil  Raison de la modification pour l'historique d'annulation.
function flowgraph_nodes_gameplay_race_fileRace_C:drawCustomProperties() end

--- Affiche « Started » ou « Stopped » dans le nœud.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/race/fileRace.lua:115
---@param builder table Constructeur de nœud imgui.
---@param style table Style du nœud.
function flowgraph_nodes_gameplay_race_fileRace_C:drawMiddle(builder, style) end

--- Initialise l'état (started, race, count = 1) et les options data.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/race/fileRace.lua:45
---@param mgr table Gestionnaire flowgraph.
---@param ... any
function flowgraph_nodes_gameplay_race_fileRace_C:init(mgr, ...) end

--- Crée les pins vehId_i selon self.count.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/race/fileRace.lua:55
function flowgraph_nodes_gameplay_race_fileRace_C:postInit() end

--- Passe le nombre de pins vehId_i de old à new : supprime les pins en trop (et leurs liens) ou en crée de nouvelles.
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/race/fileRace.lua:77
---@param old integer Nombre actuel de véhicules.
---@param new integer Nouveau nombre de véhicules.
function flowgraph_nodes_gameplay_race_fileRace_C:updatePins(old, new) end

--- Gère reset, démarre la course au premier flux, la met à jour chaque frame et renseigne les pins de sortie.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/race/fileRace.lua:120
---@param args table Arguments du moteur flowgraph (non utilisés).
function flowgraph_nodes_gameplay_race_fileRace_C:work(args) end


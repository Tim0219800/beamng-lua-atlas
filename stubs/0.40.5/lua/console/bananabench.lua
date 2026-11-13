---@meta
-- tim19Atlas stub generated from lua/console/bananabench.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Banc d'essai « bananabench » de la physique des véhicules (version 0.5), exécuté dans la VM console (BeamNG sans interface). Il initialise un moteur de physique (initBeamEngine à 2000 Hz), charge un véhicule (jbeam/loader), le fait apparaître en 1 à N exemplaires et mesure, sur 200 itérations de 100 pas physiques, le débit en millions de poutres par seconde (MBeams/s) et le pourcentage de temps réel. Il imprime un tableau et renvoie les résultats. C'est la base utilisée par bananabench-json, bananabench-csv, bananabench-xml et bananabench-print.
--- Accès : `require("bananabench")`
---@class bananabench
local bananabench = {}

--- Renvoie l'objet moteur BeamEngine créé par ce module, pour le piloter directement (par ex. setThreadingLayout pour un balayage du nombre de threads).
---Source : lua/console/bananabench.lua:234
---@return userdata  Système BeamNG natif.
function bananabench.beam() end

--- Liste les sous-dossiers de /vehicles (hors /vehicles/common) sous forme de noms.
---Source : lua/console/bananabench.lua:84
---@return string[]  Noms de véhicules.
function bananabench.getAllVehicles() end

--- Lance le benchmark de physique (alias de benchPhysics). Pour chaque véhicule de la liste, mesure de vehicleMin à vehicleMax exemplaires et imprime un tableau MBeams/s et % temps réel.
---Source : lua/console/bananabench.lua:94
---@param vehicles string[]|nil Noms de dossiers sous /vehicles ; défaut {'pickup'}.
---@param vehicleMin integer|nil Nombre minimal de véhicules simultanés (défaut 1).
---@param vehicleMax integer|nil Nombre maximal (défaut VehiclesToTest ou 40).
---@return table|nil  Résultats du benchmark (voir notes), nil si le moteur est indisponible.
function bananabench.physics(vehicles, vehicleMin, vehicleMax) end

---Source : lua/console/bananabench.lua:71
---@param level any
---@param origin any
---@param msg any
---@param newline any
function benchLog(level, origin, msg, newline) end

---Source : lua/console/bananabench.lua:94
---@param vehicles any
---@param vehicleMin any
---@param vehicleMax any
function benchPhysics(vehicles, vehicleMin, vehicleMax) end

---Source : lua/console/bananabench.lua:33
---@param testVehicle any
---@param vehLPackData any
---@param n any
---@param steps any
function myBenchStep(testVehicle, vehLPackData, n, steps) end

return bananabench

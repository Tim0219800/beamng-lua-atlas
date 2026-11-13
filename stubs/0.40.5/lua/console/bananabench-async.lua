---@meta
-- tim19Atlas stub generated from lua/console/bananabench-async.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Collecteur de logs : stocke les entrées (sauf niveaux A, D, S) dans une liste locale et mémorise la gravité maximale (warn/error).
---Source : lua/console/bananabench-async.lua:41
---@param level string Niveau de log (A, D, S, W, E…).
---@param origin string Origine.
---@param msg string Message.
---@param newline boolean Saut de ligne.
function benchLog(level, origin, msg, newline) end

--- Exécute le benchmark (collision dynamique activée puis désactivée) pour chaque véhicule et renvoie le tableau de résultats ; doit tourner dans une coroutine.
---Source : lua/console/bananabench-async.lua:72
---@param vehicles string[]|nil Véhicules (défaut {'pickup'}).
---@param vehicleMin integer|nil Minimum (défaut 1).
---@param vehicleMax integer|nil Maximum (défaut 12).
---@return table  Résultats du benchmark.
function benchPhysics(vehicles, vehicleMin, vehicleMax) end

--- Crée la coroutine qui exécutera benchPhysics.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/console/bananabench-async.lua:210
function benchmark_start() end

--- Reprend la coroutine d'une étape ; à appeler à chaque mise à jour par le programme hôte.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/console/bananabench-async.lua:215
function benchmark_update() end

--- Fait apparaître des véhicules jusqu'à n (positions 300*i), puis laisse passer gfxSteps images (coroutine.yield) en mesurant le temps. Signale une instabilité.
---Source : lua/console/bananabench-async.lua:16
---@param testVehicle string Dossier du véhicule (vehicles/<nom>/).
---@param n integer Nombre de véhicules à avoir en scène.
---@return number  Temps d'apparition.
---@return number  Temps de simulation.
function myBenchStep(testVehicle, n) end

---@type table
M = nil

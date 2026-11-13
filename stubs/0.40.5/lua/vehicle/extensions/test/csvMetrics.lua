---@meta
-- tim19Atlas stub generated from lua/vehicle/extensions/test/csvMetrics.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Outil de test : enregistre périodiquement des métriques du véhicule (temps, position, rotation quaternion, et en mode étendu températures, régime, carburant, vitesses, thermique des freins et des moteurs) dans un rapport CSV écrit avec csvlib à l'appel de disable(). Lit electrics.values et powertrain.getDevicesByType('combustionEngine').
--- Accès : extension `test_csvMetrics` : `extensions.load (VM véhicule)("test_csvMetrics")`, puis la globale `test_csvMetrics`
---@class test_csvMetrics
test_csvMetrics = {}

--- Écrit le CSV accumulé sur disque (csvData:write(path)), désactive l'enregistrement et remet le compteur de frames à 1.
---Source : lua/vehicle/extensions/test/csvMetrics.lua:95
function test_csvMetrics.disable() end

--- Démarre l'enregistrement : mémorise le chemin de sortie, la cadence, construit l'en-tête du CSV (simple ou étendu) et active updateGFX.
---Source : lua/vehicle/extensions/test/csvMetrics.lua:16
---@param path string Chemin du fichier CSV écrit par disable().
---@param writeRate integer|nil Une ligne toutes les N frames ; 64 si nil.
---@param extended boolean|nil nil = métriques étendues ; toute autre valeur = métriques simples (voir notes, comportement inversé).
function test_csvMetrics.enable(path, writeRate, extended) end

--- Appelé à chaque frame graphique (extensions.hook('updateGFX')). Si activé, cumule le temps et écrit une ligne toutes les `rate` frames.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/extensions/test/csvMetrics.lua:82
---@param dt number Pas de temps en secondes.
function test_csvMetrics.updateGFX(dt) end


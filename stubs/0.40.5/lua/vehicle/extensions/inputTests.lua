---@meta
-- tim19Atlas stub generated from lua/vehicle/extensions/inputTests.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Banc de test de latence et de précision du retour de force (FFB) des volants : mesure la latence matérielle USB, la résolution et la fréquence de mise à jour du volant, la latence du moteur de simulation et celle du véhicule, ainsi que les oscillations de la direction. Les tests tournent dans une coroutine appelée par hydros via hydros.testHook ; les résultats (statistiques, histogrammes en 30 classes) sont envoyés au GE par le hook onInputTestStats, et la fin par onInputTestStatus.
--- Accès : extension `inputTests` : `extensions.load (VM véhicule)("inputTests")`, puis la globale `inputTests`
---@class inputTests
inputTests = {}

--- Appelé au déchargement : retire hydros.testHook.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/extensions/inputTests.lua:478
function inputTests.onExtensionUnloaded() end

--- Démarre un test : récupère l'identifiant FFB, crée la coroutine et installe M.update dans hydros.testHook.
---Source : lua/vehicle/extensions/inputTests.lua:463
---@param testId string 'systemTest', 'simulationTest', 'vehicleTest' ou 'vehicleOscillationTest'.
function inputTests.start(testId) end

--- Appelé par hydros à chaque pas FFB via testHook : reprend la coroutine du test avec le dt réel (horloge murale) et les positions de volant simulé et matériel. Renvoie si le calcul FFB normal doit être exécuté et la position matérielle suivante.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/extensions/inputTests.lua:34
---@param dtSim number Pas de temps de simulation (utilisé seulement au premier appel).
---@param simWheelPos number Position du volant simulé (normalisée, -1 à 1 déduit du code).
---@param hydroPos number Position cible du volant matériel.
---@return boolean  true pour exécuter le calcul FFB du véhicule ce pas.
---@return number  Position matérielle à appliquer ensuite.
function inputTests.update(dtSim, simWheelPos, hydroPos) end


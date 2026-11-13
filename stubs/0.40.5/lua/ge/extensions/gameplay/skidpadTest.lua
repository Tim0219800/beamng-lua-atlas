---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/skidpadTest.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Extension de test de skidpad : téléporte un véhicule au point de départ « skidpadSpawn » puis lui fait suivre par l'IA le circuit défini par les waypoints skidpadWP1 à skidpadWP4 (2 tours). Utilise util_stepHandler pour enchaîner les étapes. Le niveau doit contenir ces objets de scène.
--- Accès : extension `gameplay_skidpadTest` : `extensions.load("gameplay_skidpadTest")`, puis la globale `gameplay_skidpadTest`
---@class gameplay_skidpadTest
gameplay_skidpadTest = {}

--- Lève le drapeau d'annulation (sans effet réel, voir notes).
---Source : lua/ge/extensions/gameplay/skidpadTest.lua:53
function gameplay_skidpadTest.cancelTest() end

--- Renvoie les résultats du test (testResults).
---Source : lua/ge/extensions/gameplay/skidpadTest.lua:49
---@return table|nil  Toujours nil dans cette version (jamais rempli).
function gameplay_skidpadTest.getData() end

--- Lance la séquence : téléportation sûre du véhicule sur skidpadSpawn (orientation retournée de 180°), attente 0,2 s, puis ai.driveUsingPath sur les waypoints skidpadWP1..4, WP1 avec noOfLaps = 2 et aggression = 1.
---Source : lua/ge/extensions/gameplay/skidpadTest.lua:44
---@param vehId integer Identifiant du véhicule à tester.
function gameplay_skidpadTest.startTest(vehId) end


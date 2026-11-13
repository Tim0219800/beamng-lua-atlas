---@meta
-- tim19Atlas stub generated from lua/console/benchphysics.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Boucle de 0 à 8 véhicules, appelle testStep et écrit phys-scale.csv ; affiche « Benchmark running: ... done! ».
---Source : lua/console/benchphysics.lua:15
function benchPhysics() end

--- Fait apparaître i véhicules, joue 1000 images et renvoie le temps moyen par image en ms (t / frames).
---Source : lua/console/benchphysics.lua:5
---@param i integer Nombre de véhicules.
---@return number  Temps moyen par mise à jour, en ms.
function testStep(i) end


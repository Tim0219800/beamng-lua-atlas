---@meta
-- tim19Atlas stub generated from lua/vehicle/extensions/core/booster.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Extension expérimentale de 'poussée' : simule une force sur le véhicule en plaçant des 'planètes' à masse négative très éloignées (obj:setPlanets), ce qui repousse le véhicule dans une direction donnée pendant une durée limitée. Un appel à boost(force, dt) ajoute une poussée qui dure dt secondes.
--- Accès : extension `core_booster` : `extensions.load (VM véhicule)("core_booster")`, puis la globale `core_booster`
---@class core_booster
core_booster = {}

--- Ajoute une poussée : la direction/force est donnée par un vecteur, dt est sa durée.
---Source : lua/vehicle/extensions/core/booster.lua:35
---@param force vec3|table Vecteur de poussée (converti en vec3) ; il est multiplié par 1000 pour placer la planète.
---@param dt number Durée de la poussée en secondes.
function core_booster.boost(force, dt) end

--- Appelé chaque frame : met à jour les durées de vie, construit la liste des planètes et l'applique avec obj:setPlanets.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/extensions/core/booster.lua:9
---@param dtSim number Pas de temps de simulation en secondes.
function core_booster.updateGFX(dtSim) end


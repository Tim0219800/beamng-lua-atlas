---@meta
-- tim19Atlas stub generated from lua/ge/extensions/core/funstuff.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Extension GE `core_funstuff` : actions « fun » du menu radial du mode bac à sable (sandbox) : champ de force, propulsions et lancers du véhicule, destruction (casser, dégonfler, incendier, exploser), ouverture des capots/portes, niveau de carburant, couleurs et véhicule aléatoires, itinéraire aléatoire. Les fonctions exportées agissent sur le véhicule joueur 0 et renvoient une instruction pour le menu radial ({'hide'} ou {'reload'}). registerFunstuffActions enregistre les entrées dans core_quickAccess.
--- Accès : extension `core_funstuff` : `extensions.load("core_funstuff")`, puis la globale `core_funstuff`
---@class core_funstuff
---@field dependencies string[] {'core_jobsystem', 'gameplay_forceField'}.
core_funstuff = {}

--- Ajoute 25 m/s au véhicule joueur dans sa direction avant.
---Source : lua/ge/extensions/core/funstuff.lua:61
---@return string[]  {'hide'}.
function core_funstuff.boost() end

--- Ajoute 25 m/s au véhicule joueur vers l'arrière.
---Source : lua/ge/extensions/core/funstuff.lua:72
---@return string[]  {'hide'}.
function core_funstuff.boostBackwards() end

--- Casse tous les groupes de rupture (breakgroups) du véhicule joueur (beamstate.breakAllBreakgroups). Erreur s'il n'y a pas de véhicule.
---Source : lua/ge/extensions/core/funstuff.lua:85
---@return string[]  {'hide'}.
function core_funstuff.breakAllBreakgroups() end

--- Casse les charnières du véhicule joueur (beamstate.breakHinges).
---Source : lua/ge/extensions/core/funstuff.lua:90
---@return string[]  {'hide'}.
function core_funstuff.breakHinges() end

--- Ferme tous les verrous du véhicule joueur via l'action 'latchesClose'.
---Source : lua/ge/extensions/core/funstuff.lua:253
---@return string[]  {'hide'}.
function core_funstuff.closeLatches() end

--- Dégonfle un pneu au hasard (beamstate.deflateRandomTire).
---Source : lua/ge/extensions/core/funstuff.lua:100
---@return string[]  {'hide'}.
function core_funstuff.deflateRandomTire() end

--- Dégonfle tous les pneus du véhicule joueur (beamstate.deflateTires).
---Source : lua/ge/extensions/core/funstuff.lua:95
---@return string[]  {'hide'}.
function core_funstuff.deflateTires() end

--- Fait exploser le véhicule joueur (voir notes : planète répulsive temporaire + fire.explodeVehicle + rupture de tous les breakgroups). S'exécute dans un job de core_jobsystem.
---Source : lua/ge/extensions/core/funstuff.lua:133
---@return string[]|nil  {'hide'} ; nil s'il n'y a pas de véhicule joueur.
function core_funstuff.explodeVehicle() end

--- Éteint le feu du véhicule joueur (fire.extinguishVehicle).
---Source : lua/ge/extensions/core/funstuff.lua:110
---@return string[]  {'hide'}.
function core_funstuff.extinguishVehicle() end

--- Projette le véhicule joueur vers le bas de 15 m/s.
---Source : lua/ge/extensions/core/funstuff.lua:53
---@return string[]  {'hide'}.
function core_funstuff.flingDownward() end

--- Projette le véhicule joueur vers le haut de 15 m/s (réduit s'il monte déjà vite).
---Source : lua/ge/extensions/core/funstuff.lua:45
---@return string[]  {'hide'}.
function core_funstuff.flingUpward() end

--- Met le feu au véhicule joueur (fire.igniteVehicle).
---Source : lua/ge/extensions/core/funstuff.lua:105
---@return string[]  {'hide'}.
function core_funstuff.igniteVehicle() end

--- Ouvre tous les verrous (portes, capot, coffre) du véhicule joueur via core_vehicleBridge.executeAction(…, 'latchesOpen').
---Source : lua/ge/extensions/core/funstuff.lua:248
---@return string[]  {'hide'}.
function core_funstuff.openLatches() end

--- Enregistre dans core_quickAccess les niveaux de menu radial '/root/sandbox/funStuff/' (accueil + sous-menus Destruction, Forces, Other) et leurs entrées, en respectant les actions bloquées par core_input_actionFilter.
---Source : lua/ge/extensions/core/funstuff.lua:271
---@param entries any Non utilisé.
function core_funstuff.registerFunstuffActions(entries) end

--- Fait tourner le champ de force sur trois états : inactif -> répulsion (multiplicateur 1) -> attraction (multiplicateur -0.5) -> inactif.
---Source : lua/ge/extensions/core/funstuff.lua:9
---@return string[]  {'reload'} : recharge le menu radial.
function core_funstuff.toggleForceField() end


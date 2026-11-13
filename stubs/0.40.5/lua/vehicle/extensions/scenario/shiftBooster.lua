---@meta
-- tim19Atlas stub generated from lua/vehicle/extensions/scenario/shiftBooster.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Extension de scénario de démonstration : donne un coup de pouce (« boost ») au véhicule en lui appliquant un vent constant dirigé selon son axe avant via obj:setWind. Peut se déclencher à chaque changement de rapport montant (listenToShift) ou manuellement (manualBoost). Le boost dure `boostTime` secondes, décompté dans updateGFX.
--- Accès : extension `scenario_shiftBooster` : `extensions.load (VM véhicule)("scenario_shiftBooster")`, puis la globale `scenario_shiftBooster`
---@class scenario_shiftBooster
scenario_shiftBooster = {}

--- Enveloppe drivetrain.shiftUp : après le vrai changement de rapport, règle boostTime à 0.4 s, affiche un message UI « Boooooost! » (5 s) et applique un boost de force par défaut.
---Source : lua/vehicle/extensions/scenario/shiftBooster.lua:27
function scenario_shiftBooster.listenToShift() end

--- Démarre un boost manuel : fixe boostTime à la durée donnée et applique immédiatement le boost.
---Source : lua/vehicle/extensions/scenario/shiftBooster.lua:68
---@param duration number Durée du boost en secondes.
---@param strength number|nil Intensité multipliée au vecteur direction ; 300 si nil.
function scenario_shiftBooster.manualBoost(duration, strength) end

--- Hook de dessin debug : si un boost est actif, dessine une sphère de rayon boostTime 2 m au-dessus du véhicule, de couleur variable.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/extensions/scenario/shiftBooster.lua:58
---@param focusPos vec3 Position du focus caméra (non utilisée).
function scenario_shiftBooster.onDebugDraw(focusPos) end

--- Hook de configuration scénario ; corps vide, aucune donnée n'est lue.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/extensions/scenario/shiftBooster.lua:65
---@param data table Données du scénario (ignorées).
function scenario_shiftBooster.onVehicleScenarioData(data) end

--- Appelé à chaque frame graphique par la boucle principale (extensions.hook('updateGFX')). Tant que boostTime > 0.01 : le décrémente de dt et réapplique le boost ; sinon remet le vent à zéro.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/extensions/scenario/shiftBooster.lua:46
---@param dt number Pas de temps de simulation en secondes.
function scenario_shiftBooster.updateGFX(dt) end


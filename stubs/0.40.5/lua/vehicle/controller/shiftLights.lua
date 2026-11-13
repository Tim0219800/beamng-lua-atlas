---@meta
-- tim19Atlas stub generated from lua/vehicle/controller/shiftLights.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Contrôleur auxiliaire de LEDs de changement de rapport (shift lights). Découpe la plage de régime [minRPM, maxRPM] en paliers (un par electric listé dans outputElectrics) et met chaque electric à 1 quand le régime atteint son palier ; au-dessus de maxRPM (ou moteur calé si hasStallWarning), les LEDs « flashing » clignotent et electrics.values.shouldShift passe à vrai.
--- Accès : contrôleur `shiftLights` déclaré dans le jbeam (`controller`), accessible par `controller.getController("nom")`
---@class controller_shiftLights
---@field type string "auxiliary".
local controller_shiftLights = {}

--- Lit les clés jbeam et construit les paliers de régime et les listes de LEDs clignotantes.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/shiftLights.lua:59
---@param jbeamData table Données jbeam du contrôleur.
function controller_shiftLights.init(jbeamData) end

--- Chaque frame : met à jour les electrics des paliers, shouldShift et le clignotement.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/shiftLights.lua:25
---@param dt number Pas de temps en secondes.
function controller_shiftLights.updateGFX(dt) end

return controller_shiftLights

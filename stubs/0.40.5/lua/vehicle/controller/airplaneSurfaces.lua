---@meta
-- tim19Atlas stub generated from lua/vehicle/controller/airplaneSurfaces.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Contrôleur auxiliaire pour les avions : combine les entrées du pilote (gouverne de direction, ailerons, profondeur) avec les trims, et gère les volets (flap) et becs (slat). Il écrit les résultats dans `electrics.values` (rudder, aileron, elevator, slat, flap) qu'utilisent ensuite les actionneurs jbeam, et affiche des messages UI quand une valeur change.
--- Accès : contrôleur `airplaneSurfaces` déclaré dans le jbeam (`controller`), accessible par `controller.getController("nom")`
---@class controller_airplaneSurfaces
---@field type string "auxiliary" (paramètre obligatoire de contrôleur).
local controller_airplaneSurfaces = {}

--- Initialise les electrics, les valeurs de départ de volets/becs/trims et les vitesses depuis le jbeam.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/airplaneSurfaces.lua:91
---@param jbeamData table Données jbeam du contrôleur.
function controller_airplaneSurfaces.init(jbeamData) end

--- Fixe directement la valeur de trim d'un axe (sans effet si l'axe est inconnu).
---Source : lua/vehicle/controller/airplaneSurfaces.lua:85
---@param input string "rudder", "aileron" ou "elevator".
---@param value number Valeur de trim (normalement -1 à 1).
function controller_airplaneSurfaces.setTrimValue(input, value) end

--- Passe à l'axe de trim suivant (elevator, aileron, rudder) et l'annonce par un message UI.
---Source : lua/vehicle/controller/airplaneSurfaces.lua:75
function controller_airplaneSurfaces.toggleTrimMode() end

--- Chaque frame : applique les entrées et trims aux electrics rudder, aileron, elevator, met à jour flap et slat (valeur absolue d'entrée si elle a changé, sinon ajustement relatif), et affiche un message UI quand un trim, les volets ou les becs varient de plus de 0,005.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/airplaneSurfaces.lua:32
---@param dt number Pas de temps en secondes.
function controller_airplaneSurfaces.updateGFX(dt) end

return controller_airplaneSurfaces

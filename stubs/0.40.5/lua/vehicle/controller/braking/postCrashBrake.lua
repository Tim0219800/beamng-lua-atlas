---@meta
-- tim19Atlas stub generated from lua/vehicle/controller/braking/postCrashBrake.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Contrôleur auxiliaire de freinage automatique après un choc. Une machine à états (idle, braking, holding, disabled) détecte une forte accélération (accéléromètres `sensors.gx2`, `gy2`, `gz2`) : il passe en freinage total, coupe l'accélérateur, allume les feux de détresse, puis serre le frein de stationnement à l'arrêt (ou en marche arrière) et relâche quand le conducteur ré-accélère ou que le véhicule roule à plus de 5 m/s. Ordre d'appel : `defaultOrder = 700`.
--- Accès : contrôleur `braking/postCrashBrake` déclaré dans le jbeam (`controller`), accessible par `controller.getController("nom")`
---@class controller_braking_postCrashBrake
---@field defaultOrder number 700 : rang d'appel par défaut.
---@field type string "auxiliary".
local controller_braking_postCrashBrake = {}

--- Renvoie l'état courant et le compteur de chocs pour la synchronisation d'état.
---Source : lua/vehicle/controller/braking/postCrashBrake.lua:103
---@return table  Clés `<nom>_state` et `<nom>_crashCounter`.
function controller_braking_postCrashBrake.getState() end

--- Remet la machine à l'état idle (éteint les feux de détresse s'ils étaient commandés par ce contrôleur) et lit les seuils jbeam.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/braking/postCrashBrake.lua:84
---@param jbeamData table Données jbeam du contrôleur.
function controller_braking_postCrashBrake.init(jbeamData) end

--- Restaure le compteur de chocs et applique un état valide (idle, braking, holding, disabled) s'il diffère.
---Source : lua/vehicle/controller/braking/postCrashBrake.lua:109
---@param data table|nil Table d'état.
function controller_braking_postCrashBrake.setState(data) end

--- Chaque frame : détecte le choc en idle, impose le freinage en braking, maintient le frein en holding et gère la sortie.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/braking/postCrashBrake.lua:30
---@param dt number Pas de temps en secondes (non utilisé).
function controller_braking_postCrashBrake.updateGFX(dt) end

return controller_braking_postCrashBrake

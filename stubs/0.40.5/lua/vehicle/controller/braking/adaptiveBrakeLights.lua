---@meta
-- tim19Atlas stub generated from lua/vehicle/controller/braking/adaptiveBrakeLights.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Contrôleur auxiliaire qui calcule la valeur des feux stop (`electrics.values.brakelights` par défaut) en plus de la simple pédale de frein : clignotement pendant l'ABS, allumage lors d'une intervention de l'ESC au-dessus de 14 m/s, allumage quand la décélération (régénération « one pedal ») dépasse un seuil, ajout du freinage par récupération, et allumage automatique des feux de détresse après un freinage d'urgence jusqu'à l'arrêt. Ordre d'appel : `defaultOrder = 900` (tard).
--- Accès : contrôleur `braking/adaptiveBrakeLights` déclaré dans le jbeam (`controller`), accessible par `controller.getController("nom")`
---@class controller_braking_adaptiveBrakeLights
---@field defaultOrder number 900 : rang d'appel par défaut, tard dans la liste triée.
---@field type string "auxiliary".
local controller_braking_adaptiveBrakeLights = {}

--- Lit les paramètres jbeam et crée les lisseurs (ABS, ESC, accélération).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/braking/adaptiveBrakeLights.lua:139
---@param jbeamData table Données jbeam du contrôleur.
function controller_braking_adaptiveBrakeLights.init(jbeamData) end

--- Éteint les feux de détresse déclenchés par ce contrôleur et remet à zéro les minuteurs, lisseurs et verrous.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/braking/adaptiveBrakeLights.lua:122
function controller_braking_adaptiveBrakeLights.reset() end

--- Active ou désactive le comportement adaptatif ; désactivé, les feux suivent simplement le frein.
---Source : lua/vehicle/controller/braking/adaptiveBrakeLights.lua:165
---@param parameters table Champ facultatif : isEnabled (boolean).
function controller_braking_adaptiveBrakeLights.setParameters(parameters) end

--- Chaque frame : calcule la valeur des feux stop (frein + ESC + décélération + récupération, limitée à 1), applique le clignotement ABS et gère les feux de détresse de freinage d'urgence.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/braking/adaptiveBrakeLights.lua:48
---@param dt number Pas de temps en secondes.
function controller_braking_adaptiveBrakeLights.updateGFX(dt) end

return controller_braking_adaptiveBrakeLights

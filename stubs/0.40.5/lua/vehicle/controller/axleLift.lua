---@meta
-- tim19Atlas stub generated from lua/vehicle/controller/axleLift.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Contrôleur auxiliaire qui lève ou abaisse des essieux (typiquement les essieux relevables d'un camion) pour gagner de la garde au sol. Il écrit une position cible dans deux valeurs `electrics.values` (avant et arrière) que lit le jbeam. Trois modes : auto (lève sauf si vitesse trop haute, vitesse trop basse, frein à main serré ou accélération latérale trop forte), manual (toujours levé) et off (toujours abaissé).
--- Accès : contrôleur `axleLift` déclaré dans le jbeam (`controller`), accessible par `controller.getController("nom")`
---@class controller_axleLift
---@field type string "auxiliary".
local controller_axleLift = {}

--- Renvoie le mode courant sous la clé `<nom>Mode`.
---Source : lua/vehicle/controller/axleLift.lua:148
---@return table<string, string>  Table d'état.
function controller_axleLift.getState() end

--- Lit les paramètres jbeam, met les electrics à 0, passe en mode auto et ajoute l'entrée du menu radial.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/axleLift.lua:90
---@param jbeamData table Données jbeam du contrôleur.
function controller_axleLift.init(jbeamData) end

--- Remet les deux valeurs electrics d'essieu à 0.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/axleLift.lua:85
function controller_axleLift.reset() end

--- Change le mode ("auto", "manual" ou "off"). Un mode inconnu est ignoré. Affiche un message UI sauf si silent.
---Source : lua/vehicle/controller/axleLift.lua:60
---@param mode string "auto", "manual" ou "off".
---@param silent boolean|nil true pour ne pas afficher de message.
function controller_axleLift.setMode(mode, silent) end

--- Modifie à chaud les seuils et le mode ; seuls les champs présents sont appliqués.
---Source : lua/vehicle/controller/axleLift.lua:133
---@param parameters table Champs facultatifs : mode, accelerationThreshold, velocityThresholdDisable, velocityThresholdEnable.
function controller_axleLift.setParameters(parameters) end

--- Restaure le mode depuis une table d'état (silencieusement) si la valeur est valide.
---Source : lua/vehicle/controller/axleLift.lua:153
---@param data table|nil Table contenant la clé `<nom>Mode`.
function controller_axleLift.setState(data) end

--- Passe au mode suivant dans l'ordre auto, manual, off, auto.
---Source : lua/vehicle/controller/axleLift.lua:81
function controller_axleLift.toggleMode() end

--- Chaque frame : choisit la position levée ou abaissée selon le mode (en auto : vitesse lissée, vitesse de roue, frein à main, accélération latérale) et l'écrit dans les deux electrics d'essieu.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/axleLift.lua:34
---@param dt number Pas de temps en secondes.
function controller_axleLift.updateGFX(dt) end

return controller_axleLift

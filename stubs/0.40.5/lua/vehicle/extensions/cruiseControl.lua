---@meta
-- tim19Atlas stub generated from lua/vehicle/extensions/cruiseControl.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Régulateur de vitesse (cruise control) : un PID pilote electrics.values.throttleOverride pour maintenir la vitesse de roue (electrics.values.wheelspeed, m/s) à une consigne. Il s'arrête au freinage, après un freinage post-crash et ne pilote pas la pédale si le conducteur appuie sur l'embrayage ou l'accélérateur. Un moddeur peut le piloter via setSpeed, changeSpeed, holdCurrentSpeed et setEnabled.
--- Accès : extension `cruiseControl` : `extensions.load (VM véhicule)("cruiseControl")`, puis la globale `cruiseControl`
---@class cruiseControl
---@field hasReachedTargetSpeed boolean true quand la vitesse est à moins de 3 % de la consigne.
---@field minimumSpeed number Consigne minimale en m/s (30 km/h).
cruiseControl = {}

--- Active le régulateur et ajoute un décalage à la consigne actuelle.
---Source : lua/vehicle/extensions/cruiseControl.lua:81
---@param offset number Variation en m/s (positive ou négative).
function cruiseControl.changeSpeed(offset) end

--- Renvoie la configuration courante.
---Source : lua/vehicle/extensions/cruiseControl.lua:123
---@return table  {isEnabled, targetSpeed, minimumSpeed, hasReachedTargetSpeed}.
function cruiseControl.getConfiguration() end

--- Fixe la consigne sur la vitesse actuelle si elle dépasse la vitesse minimale.
---Source : lua/vehicle/extensions/cruiseControl.lua:89
function cruiseControl.holdCurrentSpeed() end

--- Hook de reset du véhicule : remet hasReachedTargetSpeed, l'état et le lisseur à zéro.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/extensions/cruiseControl.lua:23
function cruiseControl.onReset() end

--- Publie l'état (electrics.cruiseControlTarget/Active) et envoie 'CruiseControlState' à l'UI.
---Source : lua/vehicle/extensions/cruiseControl.lua:110
function cruiseControl.requestState() end

--- Active ou désactive le régulateur ; remet throttleOverride à nil et le lisseur à zéro.
---Source : lua/vehicle/extensions/cruiseControl.lua:97
---@param enabled boolean true pour activer.
function cruiseControl.setEnabled(enabled) end

--- Active le régulateur avec la consigne donnée (bornée au minimum).
---Source : lua/vehicle/extensions/cruiseControl.lua:73
---@param speed number Consigne en m/s.
function cruiseControl.setSpeed(speed) end

--- Fixe l'accélération (en m/s²) de la rampe de consigne.
---Source : lua/vehicle/extensions/cruiseControl.lua:106
---@param target number Accélération cible, défaut 3.
function cruiseControl.setTargetAcceleration(target) end

--- Appelé chaque frame : si actif, applique la régulation PID et gère les conditions d'arrêt.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/extensions/cruiseControl.lua:34
---@param dt number Pas de temps en secondes.
function cruiseControl.updateGFX(dt) end


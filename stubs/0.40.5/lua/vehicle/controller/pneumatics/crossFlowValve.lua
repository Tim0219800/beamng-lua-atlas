---@meta
-- tim19Atlas stub generated from lua/vehicle/controller/pneumatics/crossFlowValve.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Contrôleur auxiliaire simulant une vanne de transfert d'air entre deux réservoirs (energyStorage) : l'air passe du réservoir source vers le réservoir cible tant que la pression source dépasse un minimum et celle de la cible. Le débit dépend de la section de la vanne et de la différence de pression (équation d'orifice).
--- Accès : contrôleur `pneumatics/crossFlowValve` déclaré dans le jbeam (`controller`), accessible par `controller.getController("nom")`
---@class controller_pneumatics_crossFlowValve
---@field type string "auxiliary".
local controller_pneumatics_crossFlowValve = {}

--- Récupère les réservoirs source/cible et calcule les sections et seuils de pression à partir des clés jbeam.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/pneumatics/crossFlowValve.lua:66
---@param jbeamData table Données jbeam du contrôleur.
function controller_pneumatics_crossFlowValve.init(jbeamData) end

--- Ne fait rien.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/pneumatics/crossFlowValve.lua:62
function controller_pneumatics_crossFlowValve.reset() end

--- Pas physique : calcule le débit d'air entre les réservoirs et transfère l'énergie stockée de la source vers la cible, en mettant à jour currentPressure des deux.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/pneumatics/crossFlowValve.lua:34
---@param dt number Pas physique en secondes.
function controller_pneumatics_crossFlowValve.updateFixedStep(dt) end

return controller_pneumatics_crossFlowValve

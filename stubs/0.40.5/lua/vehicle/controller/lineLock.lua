---@meta
-- tim19Atlas stub generated from lua/vehicle/controller/lineLock.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Contrôleur auxiliaire « line lock » de dragster (type "auxiliary", defaultOrder 40) : verrouille la pression de frein des roues listées (typiquement l'avant) au niveau actuel pour permettre de chauffer les pneus arrière. À l'activation, il mémorise le couple de frein principal courant de chaque roue verrouillée et le réapplique à chaque pas dans wd.desiredBrakingTorque tant que le line lock est actif. Une entrée « Line Lock » est ajoutée au menu radial.
--- Accès : contrôleur `lineLock` déclaré dans le jbeam (`controller`), accessible par `controller.getController("nom")`
---@class controller_lineLock
---@field defaultOrder number 40.
---@field type string "auxiliary".
local controller_lineLock = {}

--- Renvoie l'état actif et les couples mémorisés par roue.
---Source : lua/vehicle/controller/lineLock.lua:115
---@return table  Table d'état (réutilisée).
function controller_lineLock.getState() end

--- Lit les roues à verrouiller, enregistre l'entrée du menu radial.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/lineLock.lua:66
---@param jbeamData table Données jbeam du contrôleur.
function controller_lineLock.init(jbeamData) end

--- Active ou désactive le line lock et mémorise le couple de frein courant des roues verrouillées.
---Source : lua/vehicle/controller/lineLock.lua:43
---@param value number 1 pour activer, 0 pour désactiver.
function controller_lineLock.setLineLock(value) end

--- Restaure l'état renvoyé par getState.
---Source : lua/vehicle/controller/lineLock.lua:123
---@param data table|nil Table d'état.
function controller_lineLock.setState(data) end

--- Inverse l'état du line lock.
---Source : lua/vehicle/controller/lineLock.lua:61
function controller_lineLock.toggleLineLock() end

--- Écrit l'état dans electrics.values.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/lineLock.lua:39
---@param dt number Pas de temps (s).
function controller_lineLock.updateGFX(dt) end

--- Chaque pas : applique les couples de frein mémorisés aux roues verrouillées quand le line lock est actif.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/lineLock.lua:30
---@param dt number Pas de temps (s).
function controller_lineLock.updateWheelsIntermediate(dt) end

return controller_lineLock

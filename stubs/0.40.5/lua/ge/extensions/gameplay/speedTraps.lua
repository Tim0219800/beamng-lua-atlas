---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/speedTraps.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Extension qui gère les radars de vitesse et de feu rouge posés dans les niveaux sous forme de triggers BeamNGTrigger portant un champ speedTrapType (« speed » ou « redLight »). Quand un véhicule entre dans le trigger, dans le bon sens et trop vite, elle émet les hooks onSpeedTrapTriggered ou onRedLightCamTriggered et fait flasher la lumière associée. Inactive pendant une mission au premier plan.
--- Accès : extension `gameplay_speedTraps` : `extensions.load("gameplay_speedTraps")`, puis la globale `gameplay_speedTraps`
---@class gameplay_speedTraps
gameplay_speedTraps = {}

--- Liste les triggers BeamNGTrigger du niveau courant dont le speedTrapType correspond.
---Source : lua/ge/extensions/gameplay/speedTraps.lua:105
---@param speedTrapType string 'speed' ou 'redLight'.
---@return table[]  Objets trigger (table vide si aucun).
function gameplay_speedTraps.getSpeedTrapsInCurrentLevel(speedTrapType) end

--- Hook appelé par le moteur à chaque événement d'un BeamNGTrigger. Ne traite que les triggers avec speedTrapType et l'événement 'enter'. Calcule la vitesse du véhicule, vérifie le sens de passage et émet onSpeedTrapTriggered(data, vehSpeed, overSpeed) ou onRedLightCamTriggered(data, vehSpeed), puis allume la lumière nommée.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/speedTraps.lua:45
---@param data table Données du trigger (voir notes).
function gameplay_speedTraps.onBeamNGTrigger(data) end


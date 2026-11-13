---@meta
-- tim19Atlas stub generated from lua/ge/extensions/core/interAero.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Extension GE `core_interAero` : simule les interactions aérodynamiques ENTRE véhicules (aspiration / slipstream, « bump drafting » et effet de côté). À chaque image de simulation, pour chaque paire de véhicules en mouvement, il calcule un vent local (vec3, en m/s) à appliquer à chaque véhicule via `veh:setWindAero(x, y, z)`. L'extension n'a pas d'API publique à appeler : elle s'exécute seule dans onUpdate et ses réglages sont des constantes locales. Un moddeur la lit pour comprendre ou reproduire l'effet.
--- Accès : extension `core_interAero` : `extensions.load("core_interAero")`, puis la globale `core_interAero`
---@class core_interAero
core_interAero = {}

--- Hook par image : calcule les effets aérodynamiques inter-véhicules (calculateAero) à partir de dtSim et applique le vent résultant à chaque véhicule actif par setWindAero.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/interAero.lua:563
---@param dtReal number Delta temps réel en secondes (utilisé pour le clignotement du debug).
---@param dtSim number Delta temps de simulation en secondes ; sert à estimer les vitesses.
---@param dtRaw number Delta temps brut (non utilisé).
function core_interAero.onUpdate(dtReal, dtSim, dtRaw) end

--- Hook : un véhicule est devenu actif ou inactif. Supprime son entrée du cache pour qu'elle soit recalculée.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/interAero.lua:260
---@param vehId integer Id du véhicule.
function core_interAero.onVehicleActiveChanged(vehId) end

--- Hook à la destruction d'un véhicule : vide son entrée de cache.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/interAero.lua:260
---@param vehId integer Id du véhicule.
function core_interAero.onVehicleDestroyed(vehId) end

--- Hook à la création d'un véhicule : vide son entrée de cache (nécessaire quand un véhicule en remplace un autre avec le même id).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/interAero.lua:260
---@param vehId integer Id du véhicule.
function core_interAero.onVehicleSpawned(vehId) end


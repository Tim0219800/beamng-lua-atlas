---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/rally/codriverTiming.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Calcule le délai du copilote de rallye : l'écart (en secondes) entre la fin de l'annonce d'une note et l'arrivée de la voiture au virage. Le délai minimum vient du réglage utilisateur 'rallyCodriverTiming' (plus un décalage propre au pack vocal) ; il augmente avec la vitesse entre startSpeedMph et endSpeedMph jusqu'à un supplément maxDelayOffsetSeconds. Les valeurs par défaut sont lues dans /gameplay/rally/codriverTiming.json.
--- Accès : extension `gameplay_rally_codriverTiming` : `extensions.load("gameplay_rally_codriverTiming")`, puis la globale `gameplay_rally_codriverTiming`
---@class gameplay_rally_codriverTiming
gameplay_rally_codriverTiming = {}

--- Renvoie la configuration chargée (et mise en cache) : maxDelayOffsetSeconds, startSpeedMph, endSpeedMph.
---Source : lua/ge/extensions/gameplay/rally/codriverTiming.lua:28
---@return table  {maxDelayOffsetSeconds, startSpeedMph, endSpeedMph}.
function gameplay_rally_codriverTiming.config() end

--- Délai pour une vitesse donnée : minDelay en dessous de startSpeedMph, puis interpolation linéaire jusqu'à minDelay + maxDelayOffsetSeconds à endSpeedMph (plafonné).
---Source : lua/ge/extensions/gameplay/rally/codriverTiming.lua:42
---@param speedMph number Vitesse du véhicule en mph.
---@param enableSpeedScaling boolean|nil false pour toujours renvoyer le minimum.
---@param offsetSeconds number|nil Décalage du pack vocal.
---@return number  Délai en secondes.
function gameplay_rally_codriverTiming.delayForSpeed(speedMph, enableSpeedScaling, offsetSeconds) end

--- Délai maximum en secondes (atteint à endSpeedMph) : minDelay + maxDelayOffsetSeconds, ou minDelay si la mise à l'échelle par la vitesse est désactivée.
---Source : lua/ge/extensions/gameplay/rally/codriverTiming.lua:36
---@param enableSpeedScaling boolean|nil false pour désactiver la partie liée à la vitesse.
---@param offsetSeconds number|nil Décalage du pack vocal.
---@return number  Délai maximum en secondes.
function gameplay_rally_codriverTiming.maxDelay(enableSpeedScaling, offsetSeconds) end

--- Délai minimum en secondes : réglage rallyCodriverTiming + décalage du pack vocal.
---Source : lua/ge/extensions/gameplay/rally/codriverTiming.lua:32
---@param offsetSeconds number|nil Décalage du pack vocal (0 si nil).
---@return number  Délai minimum en secondes.
function gameplay_rally_codriverTiming.minDelay(offsetSeconds) end

--- Décale la plage de délais de 'tick' secondes : seul le minimum (réglage rallyCodriverTiming, borné à [1, 10]) bouge, le maximum suit via le décalage. Enregistre le nouveau réglage.
---Source : lua/ge/extensions/gameplay/rally/codriverTiming.lua:54
---@param tick number Variation en secondes (positive ou négative).
---@return number  Nouveau délai minimum.
---@return number  Nouveau délai maximum (min + maxDelayOffsetSeconds).
function gameplay_rally_codriverTiming.nudge(tick) end


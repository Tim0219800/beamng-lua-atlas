---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/rally/loop/speedingDetector.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Détecteur de vitesse. Champs d'instance : manager, currentLimitKph, bufferSize (5), data (tampon circulaire), writeIndex, count, sampleRate (1 s), penaltyRateLimit (60 s), penalties (liste des pénalités déclenchées), maxSpeedOver/maxProbability (60 / 0.05), strictMaxSpeedOver/strictMaxProbability (5 / 0.2), strictMode.
---@class gameplay_rally_loop_speedingDetector
local gameplay_rally_loop_speedingDetector = {}

--- Ajoute une vitesse au tampon circulaire en écrasant la plus ancienne si besoin.
---Source : lua/ge/extensions/gameplay/rally/loop/speedingDetector.lua:42
---@param sample number Vitesse en km/h.
function gameplay_rally_loop_speedingDetector:addSample(sample) end

--- Fenêtre ImGui « Speeding Detector Debug » : limite, vitesses courante et moyenne, probabilité, pénalités et échantillons. Actuellement jamais appelée par update.
---Source : lua/ge/extensions/gameplay/rally/loop/speedingDetector.lua:155
function gameplay_rally_loop_speedingDetector:drawDebug() end

--- Moyenne des échantillons valides du tampon.
---Source : lua/ge/extensions/gameplay/rally/loop/speedingDetector.lua:49
---@return number|nil  km/h, nil si aucun échantillon.
function gameplay_rally_loop_speedingDetector:getAverageSpeed() end

--- Vitesse du véhicule joueur 0 en km/h (norme de la vitesse * 3.6).
---Source : lua/ge/extensions/gameplay/rally/loop/speedingDetector.lua:35
---@return number|nil  km/h, nil s'il n'y a pas de véhicule joueur.
function gameplay_rally_loop_speedingDetector:getCurrentSpeedKph() end

--- Initialise le tampon et les paramètres. Appelé par le constructeur.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/rally/loop/speedingDetector.lua:9
---@param manager table rallyLoopManager (reçoit recordSpeedingPenalty).
function gameplay_rally_loop_speedingDetector:init(manager) end

--- Décide au hasard si une pénalité est déclenchée selon la moyenne par rapport à la limite : probabilité linéaire de 0 (à la limite) à maxProbability (à maxSpeedOver au-dessus).
---Source : lua/ge/extensions/gameplay/rally/loop/speedingDetector.lua:60
---@param maxSpeedOver number Dépassement (km/h) pour atteindre la probabilité maximale.
---@param maxProbability number Probabilité maximale (0 à 1).
---@return boolean  true si la pénalité est déclenchée.
---@return number  Probabilité utilisée (0 à 1).
function gameplay_rally_loop_speedingDetector:stochasticPenalty(maxSpeedOver, maxProbability) end

--- À appeler à chaque frame. Cumule le temps, prend un échantillon toutes les secondes et, si le délai de 60 s est écoulé, tire une pénalité ; en cas de pénalité, stocke {averageSpeed, instantSpeed, speedLimit, speedOver, probability, strictMode} et appelle manager:recordSpeedingPenalty.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/rally/loop/speedingDetector.lua:86
---@param dtSim number Temps de simulation écoulé, en secondes.
---@param limitKph number|nil Limite de vitesse en km/h (nil = pas de limite, jamais de pénalité).
---@param strictMode boolean|nil true pour utiliser les paramètres stricts.
function gameplay_rally_loop_speedingDetector:update(dtSim, limitKph, strictMode) end


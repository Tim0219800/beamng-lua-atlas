---@meta
-- tim19Atlas stub generated from lua/ge/extensions/telemetry/performanceSpatialDetector.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Détecteur de chutes de performance (« dips ») pour le tracker performanceSpatial. Il suit une moyenne mobile exponentielle du temps de frame (baseline, alpha 0,05) et ouvre un épisode quand les FPS passent sous un seuil absolu ou quand le temps de frame dépasse baseline * ratio. L'épisode se termine au retour à la normale et ne produit un événement que s'il a duré assez longtemps. Un délai de repos et un plafond d'événements par session limitent le bruit.
--- Accès : extension `telemetry_performanceSpatialDetector` : `extensions.load("telemetry_performanceSpatialDetector")`, puis la globale `telemetry_performanceSpatialDetector`
---@class telemetry_performanceSpatialDetector
telemetry_performanceSpatialDetector = {}

--- Crée un détecteur.
---Source : lua/ge/extensions/telemetry/performanceSpatialDetector.lua:107
---@param config table dipFpsThreshold, dipFrameTimeRatio, dipMinDurationMs, dipCooldownSeconds, maxDipEventsPerSession, maxEpisodeMs (facultatif).
---@return Detector  Instance du détecteur.
function telemetry_performanceSpatialDetector.new(config) end

--- Détecteur renvoyé par new(config).
---@class telemetry_performanceSpatialDetector_Detector
local telemetry_performanceSpatialDetector_Detector = {}

--- Vrai si le délai de repos est écoulé et si le plafond d'événements de la session n'est pas atteint.
---Source : lua/ge/extensions/telemetry/performanceSpatialDetector.lua:58
---@param nowMs number Temps courant en ms.
---@return boolean  true si un nouvel épisode peut être ouvert.
function telemetry_performanceSpatialDetector_Detector:canReport(nowMs) end

--- Force la fin de l'épisode ouvert et renvoie son événement s'il a duré au moins dipMinDurationMs.
---Source : lua/ge/extensions/telemetry/performanceSpatialDetector.lua:62
---@param nowMs number Temps courant en ms.
---@return table|nil  Événement {durationMs, worstAgoMs, baselineFrameMs, trigger, seuils…} ou nil.
function telemetry_performanceSpatialDetector_Detector:finish(nowMs) end

--- Oublie la baseline et l'épisode en cours.
---Source : lua/ge/extensions/telemetry/performanceSpatialDetector.lua:53
function telemetry_performanceSpatialDetector_Detector:reset() end

--- Traite un échantillon. Renvoie un booléen « capturer cette frame » (début d'épisode ou nouveau pire temps de frame) puis éventuellement l'événement d'un épisode terminé. Hors épisode, met à jour la baseline.
---Source : lua/ge/extensions/telemetry/performanceSpatialDetector.lua:66
---@param nowMs number Temps courant en ms.
---@param fps number FPS instantanés.
---@param frameMs number Durée de la frame en ms.
---@param absoluteAllowed boolean|nil false si le plafond de FPS est volontaire (le déclencheur absolu est alors ignoré).
---@return boolean  true s'il faut capturer un instantané.
---@return table|nil  Événement de fin d'épisode.
function telemetry_performanceSpatialDetector_Detector:update(nowMs, fps, frameMs, absoluteAllowed) end


---@meta
-- tim19Atlas stub generated from lua/vehicle/extensions/gameplayStatistic.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Relais de statistiques de gameplay côté véhicule : transmet des métriques au module GE gameplay_statistic (metricAdd/metricSet) et exécute à tour de rôle, une par frame, des fonctions de surveillance enregistrées (planificateur). Au chargement il active les modules watchAirtime (temps en l'air) et watchBurnout (temps de burnout).
--- Accès : extension `gameplayStatistic` : `extensions.load (VM véhicule)("gameplayStatistic")`, puis la globale `gameplayStatistic`
---@class gameplayStatistic
gameplayStatistic = {}

--- Ajoute une fonction au planificateur (exécutée une fois tous les N frames où N = nombre de fonctions) et active updateGFX.
---Source : lua/vehicle/extensions/gameplayStatistic.lua:31
---@param fn function Fonction sans argument à exécuter périodiquement.
function gameplayStatistic.addSchedule(fn) end

--- Ajoute une valeur à une métrique du GE.
---Source : lua/vehicle/extensions/gameplayStatistic.lua:14
---@param name string Nom de la métrique (ex. 'vehicle/airtime.time').
---@param value number Valeur à ajouter.
---@param aggregate boolean|nil Transmis tel quel au GE (agrégation, déduit du code).
function gameplayStatistic.metricAdd(name, value, aggregate) end

--- Fixe la valeur d'une métrique du GE.
---Source : lua/vehicle/extensions/gameplayStatistic.lua:18
---@param name string Nom de la métrique.
---@param value number Valeur.
---@param aggregate boolean|nil Transmis tel quel au GE.
function gameplayStatistic.metricSet(name, value, aggregate) end

--- Appelé au chargement : se décharge pour les véhicules sans roues ni physique de powertrain/hydros, sinon charge watchAirtime et watchBurnout et enregistre leur workload dans le planificateur.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/extensions/gameplayStatistic.lua:53
---@return boolean|nil  false pour demander le déchargement.
function gameplayStatistic.onExtensionLoaded() end

--- Retire une fonction du planificateur ; désactive updateGFX s'il n'en reste plus.
---Source : lua/vehicle/extensions/gameplayStatistic.lua:38
---@param fn function Fonction précédemment ajoutée.
---@return boolean  true si retirée, false si introuvable.
function gameplayStatistic.removeSchedule(fn) end

--- Vaut nil au repos ; quand actif, exécute une fonction du planificateur par frame. (assignée dynamiquement)
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/extensions/gameplayStatistic.lua:dyn
---@param dt number Pas de temps en secondes.
function gameplayStatistic.updateGFX(dt) end


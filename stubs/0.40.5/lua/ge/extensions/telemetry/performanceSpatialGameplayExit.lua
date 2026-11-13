---@meta
-- tim19Atlas stub generated from lua/ge/extensions/telemetry/performanceSpatialGameplayExit.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Aide de télémétrie : détermine quelle activité de gameplay est en cours (mission, scénario, livraison, essai, certification, drag/drift/crawl en freeroam, livraison de carrière) et fabrique l'évènement « gameplayActivityExit » quand le joueur la quitte (abandon, sortie du monde ou du jeu), avec le niveau et la position arrondie du joueur. Les entrées sont validées strictement (types, longueur, caractères) ; un paramètre `source` permet d'injecter de faux modules pour les tests (par défaut _G).
--- Accès : extension `telemetry_performanceSpatialGameplayExit` : `extensions.load("telemetry_performanceSpatialGameplayExit")`, puis la globale `telemetry_performanceSpatialGameplayExit`
---@class telemetry_performanceSpatialGameplayExit
telemetry_performanceSpatialGameplayExit = {}

--- Construit l'évènement de sortie d'activité : name = "gameplayActivityExit", exitKind, level, position {x,y,z}, positionSource, plus activityType/activityId.
---Source : lua/ge/extensions/telemetry/performanceSpatialGameplayExit.lua:146
---@param exitKind string abort, worldExit ou gameExit.
---@param currentActivity table|nil Activité déjà résolue ({activityType, activityId}) ; sinon resolveActivity(source) est appelée.
---@param trackedLevels table<string, boolean>|nil Ensemble des niveaux suivis ; hors de cet ensemble, rien n'est capturé.
---@param source table|nil Source de modules injectable (_G par défaut).
---@return table|nil  Évènement prêt à envoyer, ou nil si une validation échoue.
function telemetry_performanceSpatialGameplayExit.capture(exitKind, currentActivity, trackedLevels, source) end

--- Identifie l'activité de gameplay en cours selon l'ordre de priorité décrit dans les notes.
---Source : lua/ge/extensions/telemetry/performanceSpatialGameplayExit.lua:52
---@param source table|nil Table dont les champs jouent le rôle des modules du jeu (_G par défaut) ; sert aux tests.
---@return table|nil  {activityType, activityId} ou nil si aucune activité n'est en cours.
function telemetry_performanceSpatialGameplayExit.resolveActivity(source) end


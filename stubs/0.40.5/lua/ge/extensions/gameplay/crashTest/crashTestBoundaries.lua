---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/crashTest/crashTestBoundaries.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Gère les limites de zone du scénario de test de collision (crash test). Charge un fichier .sites.json de la mission (bounds.sites.json, ou boundsStep<id>.sites.json si l'étape a son propre fichier) et vérifie à chaque image si le véhicule du joueur est hors de toutes les zones. Si oui, il appelle gameplay_crashTest_scenarioManager.onPlayerOutOfBounds(). Dessine aussi les zones en blanc, ou en rouge clignotant quand le joueur est dehors.
--- Accès : extension `gameplay_crashTest_crashTestBoundaries` : `extensions.load("gameplay_crashTest_crashTestBoundaries")`, puis la globale `gameplay_crashTest_crashTestBoundaries`
---@class gameplay_crashTest_crashTestBoundaries
gameplay_crashTest_crashTestBoundaries = {}

--- Désactive les limites (équivaut à setParameters sans filePath).
---Source : lua/ge/extensions/gameplay/crashTest/crashTestBoundaries.lua:96
function gameplay_crashTest_crashTestBoundaries.deactivateBounds() end

--- Hook appelé au début d'une étape du crash test : charge le fichier de bornes de cette étape (ou bounds.sites.json par défaut).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/crashTest/crashTestBoundaries.lua:92
---@param stepData table Données de l'étape : id, hasStepBoundsFile.
function gameplay_crashTest_crashTestBoundaries.onNewCrashTestStep(stepData) end

--- Hook appelé à chaque image : teste si le véhicule joueur est hors limites, prévient scenarioManager le cas échéant et dessine les limites.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/crashTest/crashTestBoundaries.lua:64
function gameplay_crashTest_crashTestBoundaries.onUpdate() end

--- Mémorise un drapeau de debug (non exploité ailleurs dans le fichier).
---Source : lua/ge/extensions/gameplay/crashTest/crashTestBoundaries.lua:75
---@param debug boolean Drapeau de debug.
function gameplay_crashTest_crashTestBoundaries.setDebug(debug) end

--- Charge les zones de limites depuis un fichier de sites et les finalise. Sans filePath, supprime les limites et remet isPlayerOutOfBounds à false.
---Source : lua/ge/extensions/gameplay/crashTest/crashTestBoundaries.lua:16
---@param params table|nil Table avec filePath (string) : chemin du fichier .sites.json ; drawBoundsWhenNear_ (voir notes).
function gameplay_crashTest_crashTestBoundaries.setParameters(params) end


---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/raceEditor/testing.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Fenêtre de test de course (windowDescription = 'General'). Instanciée avec init(raceEditor). Champs : race (objet gameplay/race/race), state ('setup', 'race' ou 'stopped'), path.
---@class editor_raceEditor_testing
local editor_raceEditor_testing = {}

--- Dessine l'interface selon l'état (setup, race avec mise à jour de la course, stopped).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/raceEditor/testing.lua:44
---@param dt number Delta temps de simulation (secondes).
function editor_raceEditor_testing:draw(dt) end

--- Affiche le journal d'événements du premier véhicule via race:inDrawEventlog.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/raceEditor/testing.lua:154
function editor_raceEditor_testing:drawEventLog() end

--- Interface en course : boutons Stop (abandonne la course pour tous les véhicules et rouvre l'éditeur), State (dump de l'état), Recover (requestRecover), puis temps et journal.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/raceEditor/testing.lua:110
---@param dt number|nil Non utilisé.
function editor_raceEditor_testing:drawRace(dt) end

--- Interface de préparation : nombre de tours, boutons « Move to <départ> », Start, Start Rolling, déplacer tous les véhicules aux positions de départ, tests IA.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/raceEditor/testing.lua:55
function editor_raceEditor_testing:drawSetup() end

--- Interface après arrêt : bouton Restart (retour à la préparation), temps et journal.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/raceEditor/testing.lua:131
function editor_raceEditor_testing:drawStopped() end

--- Affiche les temps du premier véhicule via race:inDrawTimes ; un clic bascule l'affichage détaillé.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/raceEditor/testing.lua:142
function editor_raceEditor_testing:drawTimes() end

--- Mémorise raceEditor, startIndex = -1 et l'état 'setup'.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/raceEditor/testing.lua:9
---@param raceEditor table Module editor_raceEditor (utilise show()).
function editor_raceEditor_testing:init(raceEditor) end

--- Définit le chemin de course à tester.
---Source : lua/ge/extensions/editor/raceEditor/testing.lua:15
---@param path table Objet gameplay/race/path.
function editor_raceEditor_testing:setPath(path) end

--- Crée un nouvel objet race pour le chemin (en conservant le nombre de tours précédent, sinon 1), active useDebugDraw, assigne le véhicule joueur et passe à l'état 'setup'.
---Source : lua/ge/extensions/editor/raceEditor/testing.lua:19
function editor_raceEditor_testing:setupRace() end

--- Démarre la course : applique config.rollingStart au chemin, assigne les véhicules, appelle race:startRace(), passe à l'état 'race' et, si enableAi, lance l'IA sur chaque véhicule (vitesse relative 0.8).
---Source : lua/ge/extensions/editor/raceEditor/testing.lua:29
---@param vehIds table<integer, integer>|nil IDs des véhicules ; par défaut le véhicule joueur (be:getPlayerVehicleID(0)).
---@param enableAi boolean true pour que l'IA conduise les véhicules.
---@param rollingStart boolean true pour un départ lancé (rollingStart).
function editor_raceEditor_testing:startRace(vehIds, enableAi, rollingStart) end


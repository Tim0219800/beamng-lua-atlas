---@meta
-- tim19Atlas stub generated from lua/ge/extensions/career/modules/tutorial/step03basicManeuvers.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Étape 3 du tutoriel de carrière (« basicManeuvers ») : le joueur conduit librement (message sur le changement de caméra) puis doit garer le véhicule sur la place de parking nommée simpleCourseStart (marqueur + décalque au sol). Le objectif est validé quand le véhicule reste immobile dans la place pendant 1 s (gameplay_tutorial_markers.checkParkGoalWithStationaryTime) ; l'étape suivante est alors activée après 1,5 s.
--- Accès : extension `career_modules_tutorial_step03basicManeuvers` : `extensions.load("career_modules_tutorial_step03basicManeuvers")`, puis la globale `career_modules_tutorial_step03basicManeuvers`
---@class career_modules_tutorial_step03basicManeuvers
career_modules_tutorial_step03basicManeuvers = {}

--- Appelé à la fin de l'étape : retire le reset de sortie de zone, vide la liste de tâches, supprime marqueur et décalque.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/career/modules/tutorial/step03basicManeuvers.lua:125
function career_modules_tutorial_step03basicManeuvers.cleanup() end

--- Hook de sortie de zone : lance le reset de sortie de zone de l'étape.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/career/modules/tutorial/step03basicManeuvers.lua:107
function career_modules_tutorial_step03basicManeuvers.onCareerTutorialLeftBounds() end

--- Affiche l'état des objectifs et un bouton « Skip Step 3 » (téléporte le véhicule sur la place et avance).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/career/modules/tutorial/step03basicManeuvers.lua:164
---@param im table Table ui_imgui.
function career_modules_tutorial_step03basicManeuvers.onDebugMenu(im) end

--- Appelé chaque frame : teste l'objectif de parking ; une fois validé, passe à l'étape suivante après 1,5 s.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/career/modules/tutorial/step03basicManeuvers.lua:112
---@param dtReal number Delta temps réel (s).
---@param dtSim number Delta simulation (s).
---@param dtRaw number Delta brut (s).
function career_modules_tutorial_step03basicManeuvers.onUpdate(dtReal, dtSim, dtRaw) end

--- Appelé à l'activation : réinitialise l'objectif, active la zone evalZone, installe le reset de sortie de zone, puis démarre directement la phase de parking (débloque les vitesses, dégèle le véhicule, crée le marqueur).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/career/modules/tutorial/step03basicManeuvers.lua:89
---@param stepData any Données de l'étape (non utilisées).
function career_modules_tutorial_step03basicManeuvers.setup(stepData) end


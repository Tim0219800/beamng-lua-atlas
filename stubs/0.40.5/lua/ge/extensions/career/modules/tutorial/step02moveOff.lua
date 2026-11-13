---@meta
-- tim19Atlas stub generated from lua/ge/extensions/career/modules/tutorial/step02moveOff.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Étape 2 du tutoriel de carrière (« moveOff ») : apprendre à démarrer le véhicule selon le mode de boîte réglé à l'étape 1. Trois modes (déduits du réglage gearboxMode et de autoClutch) : arcade, realistic_clutch (passer la 1re puis accélérer) et realistic_no_clutch (embrayage manuel, avec récupération en cas de calage moteur). L'étape se termine quand le véhicule s'est déplacé d'au moins 3 m, puis active 03basicManeuvers après 1 s.
--- Accès : extension `career_modules_tutorial_step02moveOff` : `extensions.load("career_modules_tutorial_step02moveOff")`, puis la globale `career_modules_tutorial_step02moveOff`
---@class career_modules_tutorial_step02moveOff
career_modules_tutorial_step02moveOff = {}

--- Retire le gestionnaire de sortie de zone, désenregistre les notifications du véhicule et vide la liste de tâches.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/career/modules/tutorial/step02moveOff.lua:229
function career_modules_tutorial_step02moveOff.cleanup() end

--- Hook de sortie de zone : lance le reset de sortie de zone de l'étape.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/career/modules/tutorial/step02moveOff.lua:149
function career_modules_tutorial_step02moveOff.onCareerTutorialLeftBounds() end

--- Affiche le mode courant et un bouton pour sauter l'étape (active 03basicManeuvers).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/career/modules/tutorial/step02moveOff.lua:252
---@param im table Table ui_imgui.
function career_modules_tutorial_step02moveOff.onDebugMenu(im) end

--- Appelé chaque frame : lit les entrées du véhicule en cache, gère le calage, valide les objectifs et avance à l'étape 03 quand la distance de 3 m est atteinte.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/career/modules/tutorial/step02moveOff.lua:153
---@param dtReal number Delta temps réel (s).
---@param dtSim number Delta simulation (s).
---@param dtRaw number Delta brut (s).
function career_modules_tutorial_step02moveOff.onUpdate(dtReal, dtSim, dtRaw) end

--- Appelé à l'activation : réinitialise l'état, active la zone evalZone, enregistre les notifications throttle_input, clutch, gearIndex, ignitionLevel, lit le comportement de boîte (mainController/gearboxMode), choisit le mode, débloque les actions de changement de vitesse, dégèle le véhicule et construit la liste de tâches.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/career/modules/tutorial/step02moveOff.lua:93
---@param stepData any Données de l'étape (non utilisées).
function career_modules_tutorial_step02moveOff.setup(stepData) end


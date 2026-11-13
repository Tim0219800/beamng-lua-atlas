---@meta
-- tim19Atlas stub generated from lua/ge/extensions/career/modules/tutorial/step08driveToGarage.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Étape 8 du tutoriel de carrière (« driveToGarage ») : le joueur conduit jusqu'au garage, se gare sur la place garageExteriorPark (immobile 1 s, à moins de 25 m pour déclencher la phase de parking), puis sort du véhicule (mode marche). Phases : driveToGarage, parkAtGarage, hopOut, waitArrivalPopups. Deux popups d'arrivée (v2/garageArrivalIntro1 et 2) concluent l'étape, puis le guidage mène au point garageInteriorWalkStart.
--- Accès : extension `career_modules_tutorial_step08driveToGarage` : `extensions.load("career_modules_tutorial_step08driveToGarage")`, puis la globale `career_modules_tutorial_step08driveToGarage`
---@class career_modules_tutorial_step08driveToGarage
career_modules_tutorial_step08driveToGarage = {}

--- Retire le reset de zone, débloque la marche, vide les tâches et supprime les visuels du parking.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/career/modules/tutorial/step08driveToGarage.lua:325
function career_modules_tutorial_step08driveToGarage.cleanup() end

--- Hook de sortie de zone : lance le reset de sortie de zone de l'étape.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/career/modules/tutorial/step08driveToGarage.lua:258
function career_modules_tutorial_step08driveToGarage.onCareerTutorialLeftBounds() end

--- Affiche la phase et un bouton « Skip Step 8 » (téléporte au garage, passe en mode marche, avance).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/career/modules/tutorial/step08driveToGarage.lua:333
---@param im table Table ui_imgui.
function career_modules_tutorial_step08driveToGarage.onDebugMenu(im) end

--- Hook de fermeture de popup : à la fermeture de v2/garageArrivalIntro2 (phase waitArrivalPopups), trace la route vers l'intérieur du garage et programme l'avance d'étape après 1 s.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/career/modules/tutorial/step08driveToGarage.lua:262
---@param id string Id de la popup.
function career_modules_tutorial_step08driveToGarage.onIntroPopupCareerClosed(id) end

--- Appelé chaque frame : met à jour le checkpoint de reprise, gère les phases conduite / parking / sortie du véhicule.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/career/modules/tutorial/step08driveToGarage.lua:272
---@param dtReal number Delta temps réel (s).
---@param dtSim number Delta simulation (s).
---@param dtRaw number Delta brut (s).
function career_modules_tutorial_step08driveToGarage.onUpdate(dtReal, dtSim, dtRaw) end

--- Appelé à l'activation : arrête le drag, retrouve le véhicule joueur, les places et zones du garage, installe zones et reset, autorise la marche et l'entrée dans le véhicule, crée le marqueur et affiche l'objectif.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/career/modules/tutorial/step08driveToGarage.lua:181
---@param stepData any Données de l'étape (non utilisées).
function career_modules_tutorial_step08driveToGarage.setup(stepData) end


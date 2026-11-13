---@meta
-- tim19Atlas stub generated from lua/ge/extensions/career/modules/tutorial/step05driveToDragStrip.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Étape 5 du tutoriel de carrière (« driveToDragStrip ») : le joueur conduit jusqu'au drag strip, avec guidage au sol et marqueur, puis gare le véhicule sur la place beforeDragStrip (immobile 1 s). Phases : waitPopup, driveToStrip, parkInStaging (déclenchée à moins de 25 m de la place). Ensuite l'étape 06dragStripBasics est activée. Active les zones drivingToDragBounds et parkingBounds.
--- Accès : extension `career_modules_tutorial_step05driveToDragStrip` : `extensions.load("career_modules_tutorial_step05driveToDragStrip")`, puis la globale `career_modules_tutorial_step05driveToDragStrip`
---@class career_modules_tutorial_step05driveToDragStrip
career_modules_tutorial_step05driveToDragStrip = {}

--- Retire le reset de zone, le guidage, la liste de tâches et les visuels de la place de parking.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/career/modules/tutorial/step05driveToDragStrip.lua:230
function career_modules_tutorial_step05driveToDragStrip.cleanup() end

--- Hook de sortie de zone : lance le reset de sortie de zone de l'étape.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/career/modules/tutorial/step05driveToDragStrip.lua:192
function career_modules_tutorial_step05driveToDragStrip.onCareerTutorialLeftBounds() end

--- Affiche la phase et un bouton « Skip Step 5 » (téléporte le véhicule sur beforeDragStrip puis active l'étape 6).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/career/modules/tutorial/step05driveToDragStrip.lua:237
---@param im table Table ui_imgui.
function career_modules_tutorial_step05driveToDragStrip.onDebugMenu(im) end

--- Hook de fermeture de popup : à la fermeture de v2/driveToDragStrip, passe en phase driveToStrip et affiche l'objectif.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/career/modules/tutorial/step05driveToDragStrip.lua:180
---@param id string Id de la popup.
function career_modules_tutorial_step05driveToDragStrip.onIntroPopupCareerClosed(id) end

--- Appelé chaque frame : suit la distance parcourue et la distance à la place, passe en phase de parking et valide l'objectif de parking avant d'activer 06dragStripBasics (après 1 s).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/career/modules/tutorial/step05driveToDragStrip.lua:196
---@param dtReal number Delta temps réel (s).
---@param dtSim number Delta simulation (s).
---@param dtRaw number Delta brut (s).
function career_modules_tutorial_step05driveToDragStrip.onUpdate(dtReal, dtSim, dtRaw) end

--- Appelé à l'activation : restaure le trafic, active les zones, installe le reset de sortie de zone (retour à simpleTimeTrialFinish), prépare le véhicule (allumage, dégel, joueur au volant), trace le guidage, crée le marqueur, affiche la popup v2/driveToDragStrip et bascule les préfabriqués.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/career/modules/tutorial/step05driveToDragStrip.lua:114
---@param stepData any Données de l'étape (non utilisées).
function career_modules_tutorial_step05driveToDragStrip.setup(stepData) end


---@meta
-- tim19Atlas stub generated from lua/ge/extensions/career/modules/tutorial/step06dragStripBasics.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Étape 6 du tutoriel de carrière (« dragStripBasics ») : apprendre une course de drag. Le joueur se place (staging), attend le compte à rebours, part, atteint la ligne d'arrivée, puis une popup de bulletin de temps (timeslip) conclut l'étape. Gère aussi les disqualifications (faux départ ou sortie de voie), des popups de coaching qui mettent le jeu en pause (simTimeAuthority) et un ralenti à la fin du compte à rebours. Les hooks dragRaceStarted, dragRaceEndLineReached, onDragRacersSetup et onRacerPhaseTransition sont émis par gameplay_drag_*.
--- Accès : extension `career_modules_tutorial_step06dragStripBasics` : `extensions.load("career_modules_tutorial_step06dragStripBasics")`, puis la globale `career_modules_tutorial_step06dragStripBasics`
---@class career_modules_tutorial_step06dragStripBasics
career_modules_tutorial_step06dragStripBasics = {}

--- Retire le reset de zone, lève la pause, remet le temps de simulation à 1 et supprime marqueurs, guidage et tâches.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/career/modules/tutorial/step06dragStripBasics.lua:609
function career_modules_tutorial_step06dragStripBasics.cleanup() end

--- Hook émis à l'arrivée du véhicule : démarre le flux de disqualification si le pilote est disqualifié, sinon valide l'objectif d'arrivée et ouvre la popup de timeslip après 2 s.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/career/modules/tutorial/step06dragStripBasics.lua:506
---@param vehId integer Id du véhicule.
function career_modules_tutorial_step06dragStripBasics.dragRaceEndLineReached(vehId) end

--- Hook émis au départ réel de la course : valide les objectifs « se placer » et « partir ».
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/career/modules/tutorial/step06dragStripBasics.lua:493
---@param vehId integer Id du véhicule.
function career_modules_tutorial_step06dragStripBasics.dragRaceStarted(vehId) end

--- Hook de sortie de zone : lance le reset de sortie de zone de l'étape.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/career/modules/tutorial/step06dragStripBasics.lua:412
function career_modules_tutorial_step06dragStripBasics.onCareerTutorialLeftBounds() end

--- Affiche la phase et l'état des objectifs ; bouton « Skip Step 6 » (marque tout comme fait et avance).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/career/modules/tutorial/step06dragStripBasics.lua:626
---@param im table Table ui_imgui.
function career_modules_tutorial_step06dragStripBasics.onDebugMenu(im) end

--- Hook émis quand les coureurs sont remis en place pour une nouvelle tentative : valide l'objectif « retourner au staging » après un faux départ et relance la tentative après 1 s.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/career/modules/tutorial/step06dragStripBasics.lua:594
---@param data table Données de mise en place (non utilisées).
function career_modules_tutorial_step06dragStripBasics.onDragRacersSetup(data) end

--- Hook de fermeture de popup : fait avancer la machine d'état (accueil terminé -> affiche les objectifs ; popup de disqualification -> reset ou retour au staging ; timeslip -> avance à l'étape suivante ; coaching -> reprise de la pause et éventuel ralenti).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/career/modules/tutorial/step06dragStripBasics.lua:416
---@param id string Id de la popup fermée.
function career_modules_tutorial_step06dragStripBasics.onIntroPopupCareerClosed(id) end

--- Hook de gameplay_drag : à la phase compte à rebours, valide l'objectif « se placer » et ouvre la popup de coaching du compte à rebours (une fois).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/career/modules/tutorial/step06dragStripBasics.lua:477
---@param vehId integer Id du véhicule.
---@param oldPhase integer Ancienne phase.
---@param newPhase integer Nouvelle phase (2 = compte à rebours).
---@param newPhaseName string Nom de la nouvelle phase (« countdown »).
function career_modules_tutorial_step06dragStripBasics.onRacerPhaseTransition(vehId, oldPhase, newPhase, newPhaseName) end

--- Appelé chaque frame : gère le ralenti de départ, déclenche la popup d'approche à moins de 15 m de la ligne de départ, masque le marqueur de ligne à moins de 5 m, et détecte les disqualifications.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/career/modules/tutorial/step06dragStripBasics.lua:543
---@param dtReal number Delta temps réel (s).
---@param dtSim number Delta simulation (s).
---@param dtRaw number Delta brut (s).
function career_modules_tutorial_step06dragStripBasics.onUpdate(dtReal, dtSim, dtRaw) end

--- Appelé à l'activation : réinitialise l'état, active les zones drivingToDragBounds et dragStripBounds, retrouve les places beforeDragStrip et dragStartLine, affiche la popup d'accueil v2/dragStripWelcome, bascule les préfabriqués et crée les marqueurs de direction (dragGuide1 à 3).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/career/modules/tutorial/step06dragStripBasics.lua:359
---@param stepData any Données de l'étape (non utilisées).
function career_modules_tutorial_step06dragStripBasics.setup(stepData) end


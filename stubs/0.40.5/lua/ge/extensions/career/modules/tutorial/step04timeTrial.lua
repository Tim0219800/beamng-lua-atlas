---@meta
-- tim19Atlas stub generated from lua/ge/extensions/career/modules/tutorial/step04timeTrial.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Étape 4 du tutoriel de carrière (« timeTrial ») : une popup d'intro lance la mission contre-la-montre west_coast_usa/timeTrial/tutorialSimple, avec guidage au sol (core_groundMarkers) construit à partir des prochains pathnodes de la course. À la fin, une popup propose un défi optionnel (tutorialAdvanced) ou le passage à la suite ; l'étape avance à la fin de la mission avancée ou si le joueur choisit autre chose. Phases : waitIntro, simpleMission, waitChoicePopup, waitPostSimplePopupClose, waitChoiceSelection, advancedMission. Active la zone de limites timeTrialBounds.
--- Accès : extension `career_modules_tutorial_step04timeTrial` : `extensions.load("career_modules_tutorial_step04timeTrial")`, puis la globale `career_modules_tutorial_step04timeTrial`
---@class career_modules_tutorial_step04timeTrial
career_modules_tutorial_step04timeTrial = {}

--- Appelé à la fin de l'étape : retire le reset de zone, efface le guidage et arrête la mission du tutoriel si elle est au premier plan.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/career/modules/tutorial/step04timeTrial.lua:280
function career_modules_tutorial_step04timeTrial.cleanup() end

--- Hook émis par le gestionnaire de missions. Sur « started » de la mission simple, mémorise la course ; sur « stopped », passe à la popup de bilan (mission simple) ou avance d'étape (mission avancée).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/career/modules/tutorial/step04timeTrial.lua:185
---@param state string État de la mission ("started", "stopped"…).
---@param mission table Mission concernée (id, race).
function career_modules_tutorial_step04timeTrial.onAnyMissionChanged(state, mission) end

--- Appelé depuis OptionalChallengeSelect.vue quand le joueur choisit : « advancedTimeTrial » lance la mission avancée, tout autre choix désactive le véhicule et passe à l'étape suivante.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/career/modules/tutorial/step04timeTrial.lua:257
---@param choice string Choix du joueur ("advancedTimeTrial" ou autre).
function career_modules_tutorial_step04timeTrial.onCareerTutorialAdvancedOrDragSelection(choice) end

--- Hook de sortie de zone : lance le reset de sortie de zone de l'étape.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/career/modules/tutorial/step04timeTrial.lua:276
function career_modules_tutorial_step04timeTrial.onCareerTutorialLeftBounds() end

--- Hook émis quand le joueur est resté trop longtemps hors zone : affiche un avertissement et relance la mission en cours.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/career/modules/tutorial/step04timeTrial.lua:211
function career_modules_tutorial_step04timeTrial.onCareerTutorialOutOfBoundsTimedOut() end

--- Bouton « Skip Step 4 » : arrête la mission, désactive le véhicule et avance.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/career/modules/tutorial/step04timeTrial.lua:298
---@param im table Table ui_imgui.
function career_modules_tutorial_step04timeTrial.onDebugMenu(im) end

--- Hook de fermeture de popup. v2/simpleTimeTrial : démarre la mission simple et, après 0,5 s, bascule les préfabriqués de piste (tutorialTrackOpen). v2/timeTrialAssessmentComplete : ouvre la popup de choix de défi optionnel.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/career/modules/tutorial/step04timeTrial.lua:146
---@param id string Id de la popup.
function career_modules_tutorial_step04timeTrial.onIntroPopupCareerClosed(id) end

--- Hook émis à chaque pathnode atteint : met à jour le guidage pour la course simple du tutoriel.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/career/modules/tutorial/step04timeTrial.lua:234
---@param data table Table avec le champ race.
function career_modules_tutorial_step04timeTrial.onRacePathnodeReached(data) end

--- Hook de départ de course : si c'est la course du tutoriel simple, la mémorise et trace le guidage.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/career/modules/tutorial/step04timeTrial.lua:224
---@param data table Table avec le champ race.
function career_modules_tutorial_step04timeTrial.onRaceStarted(data) end

--- Hook de fondu d'écran : quand l'état vaut 3 pendant waitChoicePopup, remet l'état de jeu « career » et ouvre la popup de bilan ou de choix.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/career/modules/tutorial/step04timeTrial.lua:242
---@param state integer État du fondu (3 = traité ici).
function career_modules_tutorial_step04timeTrial.onScreenFadeState(state) end

--- Appelé chaque frame : pendant la mission simple, met à jour le tracé de guidage vers les prochains pathnodes (ou vers l'arrivée).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/career/modules/tutorial/step04timeTrial.lua:171
---@param dtReal number Delta temps réel (s).
---@param dtSim number Delta simulation (s).
---@param dtRaw number Delta brut (s).
function career_modules_tutorial_step04timeTrial.onUpdate(dtReal, dtSim, dtRaw) end

--- Appelé à l'activation : active la zone timeTrialBounds, réinitialise les états, retrouve la place simpleTimeTrialFinish, remet le joueur dans le véhicule du tutoriel et ouvre la popup v2/simpleTimeTrial.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/career/modules/tutorial/step04timeTrial.lua:124
---@param stepData any Données de l'étape (non utilisées).
function career_modules_tutorial_step04timeTrial.setup(stepData) end


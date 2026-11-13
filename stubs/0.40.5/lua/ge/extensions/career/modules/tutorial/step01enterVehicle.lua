---@meta
-- tim19Atlas stub generated from lua/ge/extensions/career/modules/tutorial/step01enterVehicle.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Étape 1 du tutoriel de carrière (« enterVehicle ») : le joueur monte dans le véhicule du tutoriel, apprend les commandes de base (accélérer, freiner, tourner, objectifs validés à 0,75 / 0,75 / 0,5 de la valeur d'entrée), choisit son mode de boîte via une popup d'aides à la conduite, puis l'étape 02moveOff est activée. Fonctionne par phases : waitVehicleSetup, getInCar, waitBasicControlsPopup, controls, shiftMode, waitBeginFirstChallenge. Extension chargée par gameplay_tutorial_runtime (préfixe career_modules_tutorial_step).
--- Accès : extension `career_modules_tutorial_step01enterVehicle` : `extensions.load("career_modules_tutorial_step01enterVehicle")`, puis la globale `career_modules_tutorial_step01enterVehicle`
---@class career_modules_tutorial_step01enterVehicle
career_modules_tutorial_step01enterVehicle = {}

--- Appelé à la fin de l'étape ou du tutoriel : retire le gestionnaire de sortie de zone et le marqueur au-dessus du véhicule.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/career/modules/tutorial/step01enterVehicle.lua:131
function career_modules_tutorial_step01enterVehicle.cleanup() end

--- Hook émis quand le joueur quitte la zone autorisée : reset de position immédiat une seule fois au démarrage, puis reset standard de l'étape.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/career/modules/tutorial/step01enterVehicle.lua:59
function career_modules_tutorial_step01enterVehicle.onCareerTutorialLeftBounds() end

--- Ajoute au menu de debug un bouton « Skip Step 1 » (met le joueur au volant, allume le moteur, passe à l'étape suivante).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/career/modules/tutorial/step01enterVehicle.lua:226
---@param im table Table ui_imgui.
function career_modules_tutorial_step01enterVehicle.onDebugMenu(im) end

--- Hook émis à la fermeture d'une popup d'intro. Selon l'id : v2/approachVehicle affiche l'objectif « monter dans la voiture » et un marqueur ; v2/basicControls active le suivi des entrées et allume le moteur ; v2/beginFirstChallenge active l'étape 02moveOff.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/career/modules/tutorial/step01enterVehicle.lua:142
---@param id string Id de la popup (ex. "v2/basicControls").
function career_modules_tutorial_step01enterVehicle.onIntroPopupCareerClosed(id) end

--- Appelé depuis GearboxSelect.vue quand le joueur confirme le mode de boîte (phase shiftMode) : applique setGearboxMode sur le véhicule puis affiche la popup beginFirstChallenge.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/career/modules/tutorial/step01enterVehicle.lua:183
---@param data table Table avec le champ mode (mode de boîte choisi).
function career_modules_tutorial_step01enterVehicle.onShiftModeSelectedViaPopup(data) end

--- Appelé chaque frame pendant l'étape. Gère les phases : lance les popups d'introduction, détecte que le joueur est monté (gameplay_walk), puis valide les objectifs throttle/brake/steer et ouvre la popup d'aides à la conduite.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/career/modules/tutorial/step01enterVehicle.lua:70
---@param dtReal number Delta temps réel (s).
---@param dtSim number Delta simulation (s).
---@param dtRaw number Delta brut (s).
function career_modules_tutorial_step01enterVehicle.onUpdate(dtReal, dtSim, dtRaw) end

--- Appelé à l'activation de l'étape : remet les objectifs à zéro, passe en phase waitVehicleSetup, installe le gestionnaire de sortie de zone (retour au départ du parking), active la zone evalZone, le suivi de dégâts, les réglages de récupération du tutoriel et affiche l'app de tâches.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/career/modules/tutorial/step01enterVehicle.lua:36
---@param stepData any Données de l'étape fournies par le runtime (non utilisées).
function career_modules_tutorial_step01enterVehicle.setup(stepData) end


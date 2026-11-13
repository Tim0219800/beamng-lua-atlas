---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/tutorial/setup.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Mise en place de la scène du didacticiel : préfabs, sites (zones de stationnement), véhicule du didacticiel (sunburst2, config apmTutorial_sunburst), placement du joueur à pied, blocage d'actions d'entrée, et réinitialisation « hors limites » avec fondu d'écran. Utilisé par gameplay_tutorial_runtime et par les étapes ; il ne retient que l'id du véhicule, pas l'objet.
--- Accès : extension `gameplay_tutorial_setup` : `extensions.load("gameplay_tutorial_setup")`, puis la globale `gameplay_tutorial_setup`
---@class gameplay_tutorial_setup
---@field blockedActions table<string, boolean> Actions d'entrée individuelles bloquées (gear1..8, gearN, gearR, shiftUp, shiftDown, setShifterMode : toutes à true par défaut).
---@field blockedActionsTemplates table<string, boolean> Groupes d'actions (aiControls, bigMap, freeCam, resetPhysics, walkingMode, vehicleSwitching…) bloqués quand la valeur est true.
---@field loadingScreenFadeoutComplete boolean true après onLoadingScreenFadeout.
---@field outOfBoundsSystemActive boolean true après activateOutOfBoundsSystem().
---@field tutorialSites table|nil Sites chargés (parkingSpots, etc.) ; nil tant que loadTutorialSites n'a pas réussi.
---@field tutorialVehicleId integer|nil Id du véhicule du didacticiel (nil avant spawn et après cleanup). Les étapes utilisent getObjectByID dessus.
---@field vehicleSetupComplete boolean true quand le véhicule est prêt et le joueur placé (fin de setupPlayer).
gameplay_tutorial_setup = {}

--- Active le système de limites de zone (outOfBoundsSystemActive = true).
---Source : lua/ge/extensions/gameplay/tutorial/setup.lua:39
function gameplay_tutorial_setup.activateOutOfBoundsSystem() end

--- Remet tout à zéro : drapeaux, handlers de reset, préfabs créés (supprimés, collision rechargée) et tutorialVehicleId.
---Source : lua/ge/extensions/gameplay/tutorial/setup.lua:115
function gameplay_tutorial_setup.cleanup() end

--- Indique si la réinitialisation hors limites est autorisée.
---Source : lua/ge/extensions/gameplay/tutorial/setup.lua:31
---@return boolean
function gameplay_tutorial_setup.isOutOfBoundsResetAllowed() end

--- Charge le fichier de sites du didacticiel via gameplay_sites_sitesManager.loadSites et le stocke dans tutorialSites.
---Source : lua/ge/extensions/gameplay/tutorial/setup.lua:144
---@return table|nil  Sites chargés, nil en cas d'échec.
function gameplay_tutorial_setup.loadTutorialSites() end

--- Hook appelé à la fin du fondu de l'écran de chargement ; passe loadingScreenFadeoutComplete à true.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/tutorial/setup.lua:195
function gameplay_tutorial_setup.onLoadingScreenFadeout() end

--- Hook appelé lors des changements d'état du fondu d'écran ; à l'état 2 et si un reset est en attente, exécute le callback, arrête le fondu et affiche l'avertissement.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/tutorial/setup.lua:339
---@param state integer État du fondu (2 = écran complètement noirci, déduit du code).
function gameplay_tutorial_setup.onScreenFadeState(state) end

--- Met le joueur à pied et le téléporte au site dragPlayerStart (ou 6 m derrière dragCarStart), orienté vers l'avant.
---Source : lua/ge/extensions/gameplay/tutorial/setup.lua:353
function gameplay_tutorial_setup.placePlayerAtDragStart() end

--- Remet le joueur dans le véhicule du didacticiel s'il marche ou conduit autre chose.
---Source : lua/ge/extensions/gameplay/tutorial/setup.lua:376
function gameplay_tutorial_setup.placePlayerBackInTutorialVehicle() end

--- Téléporte le joueur : à pied, au site playerWalkingStart ; en véhicule, le véhicule du didacticiel à tutorialCarStart, et fait monter le joueur dedans s'il n'y est pas.
---Source : lua/ge/extensions/gameplay/tutorial/setup.lua:288
function gameplay_tutorial_setup.placePlayerBackToParkingStart() end

--- Lance le reset hors limites avec le handler de l'étape courante, sinon avec le placement au point de départ.
---Source : lua/ge/extensions/gameplay/tutorial/setup.lua:322
function gameplay_tutorial_setup.runCurrentStepOutOfBoundsReset() end

--- Lance un fondu d'écran de 0,3 s ; le callback sera exécuté à l'état 2 du fondu. Ignoré si un reset est déjà en attente.
---Source : lua/ge/extensions/gameplay/tutorial/setup.lua:315
---@param resetCallback function|nil Callback de reset ; placePlayerBackToParkingStart si nil.
function gameplay_tutorial_setup.runOutOfBoundsResetWithFade(resetCallback) end

--- Active ou désactive des préfabs de gameplay/tutorials/ selon une table id -> booléen ; ne touche que ceux dont l'état change. Recharge la collision si quelque chose a changé.
---Source : lua/ge/extensions/gameplay/tutorial/setup.lua:69
---@param prefabStates table<string, boolean> Id de préfab -> actif ou non.
function gameplay_tutorial_setup.setActivePrefabs(prefabStates) end

--- Autorise ou non la réinitialisation hors limites (à autoriser une fois les pop-ups d'accueil fermés).
---Source : lua/ge/extensions/gameplay/tutorial/setup.lua:27
---@param allowed boolean true pour autoriser.
function gameplay_tutorial_setup.setOutOfBoundsResetAllowed(allowed) end

--- Définit le callback de réinitialisation propre à l'étape courante (sinon placePlayerBackToParkingStart est utilisé).
---Source : lua/ge/extensions/gameplay/tutorial/setup.lua:35
---@param resetCallback function|nil Fonction sans argument.
function gameplay_tutorial_setup.setOutOfBoundsResetHandler(resetCallback) end

--- Construit la liste d'actions bloquées (modèles de groupes à true + actions individuelles à true) et l'enregistre comme groupe tutorialBlockedActions du filtre d'actions du joueur 0.
---Source : lua/ge/extensions/gameplay/tutorial/setup.lua:390
function gameplay_tutorial_setup.setupBlockedActions() end

--- Met le joueur en mode marche à la position playerWalkingStart (ou à une position par défaut codée en dur) puis le replace au point de départ ; passe vehicleSetupComplete à true.
---Source : lua/ge/extensions/gameplay/tutorial/setup.lua:199
function gameplay_tutorial_setup.setupPlayer() end

--- Remet à false les drapeaux de préparation, puis fait apparaître le véhicule du didacticiel et appelle setupPlayer une fois prêt.
---Source : lua/ge/extensions/gameplay/tutorial/setup.lua:189
function gameplay_tutorial_setup.setupVehicles() end

--- Affiche pendant 3 s une tâche message « Please stay inside of the evaluation zone. » dans la liste de tâches de l'interface (SetTasklistTask puis DiscardTasklistItem).
---Source : lua/ge/extensions/gameplay/tutorial/setup.lua:331
function gameplay_tutorial_setup.showOutOfBoundsWarning() end

--- Fait apparaître un préfab dans MissionGroup (canSave = false) et le mémorise pour le nettoyage.
---Source : lua/ge/extensions/gameplay/tutorial/setup.lua:43
---@param prefabPath string Chemin du fichier prefab.
---@param pos vec3 Position.
---@param rot quat Rotation.
---@param name string|nil Nom de l'objet ; généré (tutorial_prefab_…) si absent.
---@return userdata|nil  Objet préfab, nil en cas d'échec.
function gameplay_tutorial_setup.spawnPrefab(prefabPath, pos, rot, name) end

--- Fait apparaître la sunburst2 du didacticiel au site tutorialCarStart (sans y entrer), enregistre son id, règle la boîte en realistic, gèle le véhicule et coupe le contact, puis appelle thenFunction.
---Source : lua/ge/extensions/gameplay/tutorial/setup.lua:223
---@param thenFunction function|nil Appelée quand le véhicule a répondu à la requête mainController/gearboxMode.
---@return userdata|nil  Objet véhicule, nil si l'apparition a échoué.
function gameplay_tutorial_setup.spawnTutorialVehicle(thenFunction) end

--- Met toutes les actions de vitesse de blockedActions à false et réapplique le filtre.
---Source : lua/ge/extensions/gameplay/tutorial/setup.lua:281
function gameplay_tutorial_setup.unblockGearActions() end


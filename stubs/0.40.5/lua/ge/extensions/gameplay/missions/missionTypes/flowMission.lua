---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/missions/missionTypes/flowMission.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classe de base d'une mission flowgraph. L'objet porte les champs de la mission (id, missionFolder, setupModules, missionTypeData, careerSetup, additionalAttributes, fgPath, fgVariables, progress, userSettings...) et, une fois démarré, self.mgr (le gestionnaire de flowgraph).
---@class gameplay_missions_missionTypes_flowMission
local gameplay_missions_missionTypes_flowMission = {}

--- Modifie la valeur de base d'une variable existante du flowgraph. Types acceptés : boolean, string, number, table de 3 (vec3) ou 4 (quat) éléments. Si la variable n'existe pas dans le flowgraph, elle est ignorée.
---Source : lua/ge/extensions/gameplay/missions/missionTypes/flowMission.lua:569
---@param name string Nom de la variable.
---@param value boolean|string|number|table Nouvelle valeur.
---@return boolean|nil  true en cas d'erreur, nil sinon.
function gameplay_missions_missionTypes_flowMission:addOrSetVariable(name, value) end

--- Si le flowgraph contient un nœud pour le hook onRequestAbandon, le diffuse et renvoie true (le flowgraph gère l'abandon) ; sinon renvoie nil.
---Source : lua/ge/extensions/gameplay/missions/missionTypes/flowMission.lua:560
---@return boolean|nil  true si le flowgraph prend en charge la demande d'abandon.
function gameplay_missions_missionTypes_flowMission:attemptAbandonMission() end

--- Construit la liste des réglages utilisateur communs à tous les types de mission : sélection du véhicule (setupModuleVehicles, avec option véhicule personnalisé), trafic (setupModuleTraffic) et heure du jour (setupModuleEnvironmentTime). Pendant la construction des réglages par défaut (_buildingDefaultUserSettings), ne renvoie que {key, value} par module activé.
---Source : lua/ge/extensions/gameplay/missions/missionTypes/flowMission.lua:111
---@return table[]  Liste de définitions de réglages ({key, value, ...} ou de type select pour les véhicules).
function gameplay_missions_missionTypes_flowMission:getCommonSettingsData() end

--- Point d'extension pour une récompense d'étoile dépendant des réglages ; vide dans la base (renvoie nil).
---Source : lua/ge/extensions/gameplay/missions/missionTypes/flowMission.lua:420
---@param key string Clé de l'étoile.
---@param userSettings table|nil Réglages utilisateur.
function gameplay_missions_missionTypes_flowMission:getDynamicStarReward(key, userSettings) end

--- Renvoie les frais d'entrée de la mission (careerSetup.entryFee) sous forme de table attributeKey -> montant, ou nil s'il n'y en a pas. Accepte l'ancien format liste {attributeKey, rewardAmount}.
---Source : lua/ge/extensions/gameplay/missions/missionTypes/flowMission.lua:409
---@param userSettings table|nil Réglages utilisateur (non utilisés ici).
---@return table<string, number>|nil  Frais par attribut, ou nil.
function gameplay_missions_missionTypes_flowMission:getEntryFee(userSettings) end

--- Diffuse le hook flowgraph onGatherGameContextUiButtons, fusionne les boutons par id (un bouton actif l'emporte sur un inactif) et les trie par order puis label.
---Source : lua/ge/extensions/gameplay/missions/missionTypes/flowMission.lua:616
---@return table[]|nil  Liste de boutons {id, label, order, active, ...} ; nil si le flowgraph n'est pas créé.
function gameplay_missions_missionTypes_flowMission:getGameContextUiButtons() end

--- Renvoie la clé de traduction d'une clé de progression, ou la clé elle-même si elle est inconnue.
---Source : lua/ge/extensions/gameplay/missions/missionTypes/flowMission.lua:63
---@param progressKey string Clé de progression.
---@return string  Clé de traduction ou progressKey.
function gameplay_missions_missionTypes_flowMission:getProgressKeyTranslation(progressKey) end

--- Appelé à la création de la mission. Définit missionTypeLabel, progressKeyTranslations, defaultPreviewFile (/gameplay/missionTypes/<type>/defaultPreview.jpg s'il existe, résultat mis en cache) et ignoreUserSettingsKeyForActiveStars. Charge aussi les données progressSetup du type mais ne les copie pas (la copie est commentée).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/missions/missionTypes/flowMission.lua:37
function gameplay_missions_missionTypes_flowMission:init() end

--- Relaie à self.script (s'il existe) le démarrage d'un état du flowgraph.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/missions/missionTypes/flowMission.lua:491
---@param stateName string Nom de l'état.
---@param state table Objet état.
---@param transData any Données de transition.
function gameplay_missions_missionTypes_flowMission:onFlowgraphStateStarted(stateName, state, transData) end

--- Relaie à self.script l'arrêt d'un état du flowgraph.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/missions/missionTypes/flowMission.lua:497
---@param stateName string Nom de l'état.
---@param state table Objet état.
function gameplay_missions_missionTypes_flowMission:onFlowgraphStateStopped(stateName, state) end

--- Appelé quand l'écran de mission (début ou fin) est prêt. Relaie au script ; en mode « startScreen », remet l'heure du monde à l'heure de la mission si timeScale > 0.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/missions/missionTypes/flowMission.lua:503
---@param mode string Mode de l'écran, par ex. « startScreen ».
function gameplay_missions_missionTypes_flowMission:onMissionScreenReady(mode) end

--- Démarre la mission : journalise les problèmes (logMissionIssues), appelle onPreStart s'il existe, crée le flowgraph si besoin (preprocessMissionTypeData et getFgPath optionnels), injecte les variables de progression et les réglages utilisateur (puis les vide), lance le flowgraph s'il est arrêté, et appelle script:onStart.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/missions/missionTypes/flowMission.lua:423
---@return boolean|nil  true si la mise en place du flowgraph a échoué.
function gameplay_missions_missionTypes_flowMission:onStart() end

--- Arrête le flowgraph (instantanément si data.stopInstant), crée une tentative « abandoned » si data.abandoned, émet le hook onMissionProgressChanged, relaie à script:onStop puis appelle onPostStop s'il existe.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/missions/missionTypes/flowMission.lua:537
---@param data table|nil Champs utilisés : stopInstant, abandoned, attempt.
function gameplay_missions_missionTypes_flowMission:onStop(data) end

--- Appelé à chaque frame : relaie au script et réapplique le vent de l'environnement à tous les véhicules prêts.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/missions/missionTypes/flowMission.lua:520
---@param dtReal number Temps réel (s).
---@param dtSim number Temps de simulation (s).
---@param dtRaw number Temps brut (s).
function gameplay_missions_missionTypes_flowMission:onUpdate(dtReal, dtSim, dtRaw) end

--- Hook relayé à self.script.onVehicleReset si le script le définit (généré dans une boucle sur la liste scriptHooks).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/missions/missionTypes/flowMission.lua:dyn
---@param ... any Arguments du hook.
function gameplay_missions_missionTypes_flowMission:onVehicleReset(...) end

--- Applique les réglages communs choisis par le joueur à self.setupModules : véhicule choisi (index, véhicule personnalisé, usePlayerVehicle, useCustomConfig), trafic (useTraffic) et heure de l'environnement. Ne doit pas être appelée pendant qu'une mission est active (erreur loguée sinon).
---Source : lua/ge/extensions/gameplay/missions/missionTypes/flowMission.lua:295
---@param flatSettings table<string, any> Réglages à plat clé -> valeur.
function gameplay_missions_missionTypes_flowMission:processCommonSettings(flatSettings) end

--- Mémorise les réglages utilisateur dans self.userSettings ; ils sont injectés dans le flowgraph à onStart.
---Source : lua/ge/extensions/gameplay/missions/missionTypes/flowMission.lua:324
---@param settings table<string, any> Réglages à plat clé -> valeur.
function gameplay_missions_missionTypes_flowMission:processUserSettings(settings) end

--- Relit dans le flowgraph la valeur de chaque variable de progression et la copie dans self.progress ; logue une erreur pour celles introuvables.
---Source : lua/ge/extensions/gameplay/missions/missionTypes/flowMission.lua:598
function gameplay_missions_missionTypes_flowMission:retrieveProgressFromFlowgraph() end

--- Convertit les anciens formats de mission vers les setupModules actuels : variables flowgraph presetVehicleActive/playerModel/..., ancien mode de véhicule (own/choice/provided), timeOfDay numérique ou objet vers environment, valeurs par défaut de cloudCover/cloudWindSpeed. Génère aussi l'attribut additionalAttributes.vehicle (own/provided/choice) s'il manque.
---Source : lua/ge/extensions/gameplay/missions/missionTypes/flowMission.lua:329
---@param keyAliases table<string, string>|nil Alias des noms de variables de missionTypeData (presetVehicleActive, playerModel, playerConfig, playerConfigPath).
function gameplay_missions_missionTypes_flowMission:setBackwardsCompatibility(keyAliases) end

--- Pour chaque réglage de type select de sélection de véhicule, complète les options « custom » (liées à setupModuleVehiclesCustom) avec la vignette, le libellé « Custom: <marque modèle> » et la classe de véhicule (gameplay_vehiclePerformance.getClassFromConfig). Affiche « Custom: (None Selected) » si le modèle ou la config n'est pas choisi.
---Source : lua/ge/extensions/gameplay/missions/missionTypes/flowMission.lua:241
---@param userSettings table[]|nil Liste des réglages utilisateur (modifiée en place).
function gameplay_missions_missionTypes_flowMission:setPreviewsForCustomVehicles(userSettings) end

--- Localise le fichier flowgraph (chemin relatif au dossier de la mission, sinon chemin absolu), le charge avec core_flowgraphManager.loadManager (transient=true, activity=self), puis définit les variables de progression (valeur sauvegardée prioritaire sur la valeur de la dernière tentative) et les variables de `variables`.
---Source : lua/ge/extensions/gameplay/missions/missionTypes/flowMission.lua:69
---@param fgFile string Nom du fichier flowgraph, relatif au dossier de la mission ou absolu.
---@param variables table<string, any>|nil Variables à injecter (fgVariables).
---@return boolean|nil  true en cas d'erreur (fichier introuvable, nom réservé, variable invalide), nil sinon.
function gameplay_missions_missionTypes_flowMission:setupFlowgraphManager(fgFile, variables) end


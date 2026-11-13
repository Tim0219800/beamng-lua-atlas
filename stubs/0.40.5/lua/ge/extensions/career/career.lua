---@meta
-- tim19Atlas stub generated from lua/ge/extensions/career/career.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Point d'entrée du mode carrière. Il active et désactive la carrière : charge le niveau (west_coast_usa par défaut, ou celui de la sauvegarde), charge tous les modules de lua/ge/extensions/career/modules/ (sauf /tutorial/step), bloque certaines actions d'entrée (vehicleTeleporting, vehicleMenues, physicsControls, aiControls…), affiche un menu de debug imgui, gère les modes de départ (startingModes), le véhicule de départ, les interactions avec les organisations, la liste des profils/sauvegardes envoyée à l'UI et la sauvegarde de general.json (niveau, options de départ, boughtStarterVehicle, organizationInteraction).
--- Accès : extension `career_career` : `extensions.load("career_career")`, puis la globale `career_career`
---@class career_career
---@field dependencies string[] career_saveSystem, core_recoveryPrompt, gameplay_traffic.
---@field startingOptions table Options de départ de la partie (par ex. startMode), venues de createOrLoadCareerAndStart ou de la sauvegarde.
---@field tutorialEnabled boolean Vrai pendant le tutoriel de la carrière (voir notes).
career_career = {}

--- Active la carrière pour le profil courant (career_saveSystem.getCurrentProfile) : sans effet si déjà active ou sans profil. Charge le niveau et les modules (voir notes).
---Source : lua/ge/extensions/career/career.lua:257
---@param removeVehicles boolean|nil Supprimer tous les véhicules du niveau déjà chargé ; true par défaut.
function career_career.activateCareer(removeVehicles) end

--- Ferme les menus en naviguant vers l'écran « play ».
---Source : lua/ge/extensions/career/career.lua:715
function career_career.closeAllMenus() end

--- Sélectionne (ou crée) un profil de sauvegarde avec career_saveSystem.setProfile puis active la carrière avec les options de départ données.
---Source : lua/ge/extensions/career/career.lua:342
---@param name string Nom du profil.
---@param specificAutosave string|nil Nom d'une autosave précise à charger.
---@param startingOptions table|nil Options de départ (copiées).
---@return boolean  false si le profil n'a pas pu être sélectionné.
function career_career.createOrLoadCareerAndStart(name, specificAutosave, startingOptions) end

--- Désactive la carrière : décharge les modules, débloque les actions, remet les valeurs de récupération du freeroam et cache la liste des tâches.
---Source : lua/ge/extensions/career/career.lua:317
---@param saveCareer boolean|nil Non utilisé.
function career_career.deactivateCareer(saveCareer) end

--- Désactive la carrière puis relance le niveau courant en freeroam.
---Source : lua/ge/extensions/career/career.lua:332
---@param saveCareer boolean|nil Transmis à deactivateCareer.
function career_career.deactivateCareerAndReloadLevel(saveCareer) end

--- Boutons ajoutés au menu pause : carte (ou « mon chargement » en livraison), progression (si le véhicule de départ est acheté et hors tutoriel), annulation de certification, annulation d'essai routier.
---Source : lua/ge/extensions/career/career.lua:728
---@return table[]  Boutons {label, luaFun, showIndicator?}.
function career_career.getAdditionalMenuButtons() end

--- Pour chaque dossier de sauvegarde du profil, retourne le contenu de playerAttributes.json avec id et autosaveName.
---Source : lua/ge/extensions/career/career.lua:599
---@param profile string Nom du profil.
---@return table[]  Attributs de chaque autosave.
function career_career.getAutosavesForProfile(profile) end

--- Calcule le niveau BeamXP : seuils 0, 100, 300, 600, 1000. Retourne -1 pour les valeurs de progression s'il n'y a pas de niveau suivant.
---Source : lua/ge/extensions/career/career.lua:451
---@param xp number Valeur de BeamXP.
---@return integer  Niveau (1 à 5).
---@return number  Progression dans le niveau courant (-1 au maximum).
---@return number  Seuil requis pour le niveau suivant (-1 au maximum).
function career_career.getBeamXPLevel(xp) end

--- Retourne la définition complète du mode de départ de la partie courante (startingOptions.startMode), ou nil.
---Source : lua/ge/extensions/career/career.lua:398
---@return table|nil  Données du mode de départ.
function career_career.getCurrentStartingModeData() end

--- Retourne la liste des dossiers de sauvegarde d'un profil avec ce qu'il faut à l'UI pour choisir (nom, dates, version, corrupted, isCurrent, incompatibleVersion, outdatedVersion, money, beamXP, vehicleCount), triée du plus récent au plus ancien.
---Source : lua/ge/extensions/career/career.lua:614
---@param profile string|nil Nom du profil ; liste vide si nil.
---@return table[]  Dossiers de sauvegarde.
function career_career.getSaveFoldersForProfile(profile) end

--- Liste les modes de départ (fichiers *.lua de lua/ge/extensions/career/startingModes/ exécutés par dofile, sauf ceux avec ignore) et retourne pour l'UI : id, order, tier, title, description, image, tag, triés par order puis id.
---Source : lua/ge/extensions/career/career.lua:359
---@return table[]  Modes de départ.
function career_career.getStartingModeOptions() end

--- Indique si le joueur a acheté son véhicule de départ.
---Source : lua/ge/extensions/career/career.lua:688
---@return boolean|nil  Résultat.
function career_career.hasBoughtStarterVehicle() end

--- Indique si le joueur a déjà interagi avec une organisation.
---Source : lua/ge/extensions/career/career.lua:692
---@param id string Identifiant de l'organisation.
---@return boolean|nil  true si déjà interagi.
function career_career.hasInteractedWithOrganization(id) end

--- Note que le joueur a interagi avec une organisation (sauvegardé dans general.json).
---Source : lua/ge/extensions/career/career.lua:696
---@param id string Identifiant de l'organisation.
function career_career.interactWithOrganization(id) end

--- Indique si la carrière est active.
---Source : lua/ge/extensions/career/career.lua:338
---@return boolean  true si active.
function career_career.isActive() end

--- Indique si l'autosave est autorisé.
---Source : lua/ge/extensions/career/career.lua:720
---@return boolean  État.
function career_career.isAutosaveEnabled() end

--- Hook de changement d'état d'un défi : bloque les actions d'entrée quand il s'arrête (« stopped ») et les débloque quand il démarre (« started »).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/career/career.lua:677
---@param state string « started » ou « stopped ».
---@param mission table|nil Défi concerné.
function career_career.onAnyMissionChanged(state, mission) end

--- Hook appelé avant de changer de profil : désactive la carrière si elle est active.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/career/career.lua:438
---@param currentSavePath string Dossier de sauvegarde courant.
function career_career.onBeforeSetProfile(currentSavePath) end

--- Hook de changement de mode caméra : met à jour le blocage du nodegrabber si la carrière est active.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/career/career.lua:69
---@param modeName string Nom du mode.
function career_career.onCameraModeChanged(modeName) end

--- Hook onCareerActive reçu par ce module lui-même (émis par initAfterLevelLoad et deactivateCareer). À l'activation : applique les valeurs de récupération carrière ou tutoriel, vide la liste de tâches et les POI bruts, installe M.onUpdate (menu debug), bloque les actions d'entrée et passe l'état de jeu à « career ». Ne fait rien si active est faux.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/career/career.lua:158
---@param active boolean true à l'activation.
function career_career.onCareerActive(active) end

--- Hook de fin de niveau : désactive la carrière si le niveau est west_coast_usa.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/career/career.lua:654
---@param levelPath string Chemin du niveau qui se termine.
function career_career.onClientEndMission(levelPath) end

--- Hook après le démarrage d'un niveau : exécute l'initialisation différée de la carrière (émet onCareerActive(true, newSave)).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/career/career.lua:240
function career_career.onClientPostStartMission() end

--- Hook après rechargement : réactive la carrière (activateCareer(false)) si v.reactivate.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/career/career.lua:671
---@param v table Données de onSerialize.
function career_career.onDeserialized(v) end

--- Hook de changement de caméra globale : met à jour le blocage du nodegrabber.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/career/career.lua:74
---@param modeName string Nom du mode.
function career_career.onGlobalCameraSet(modeName) end

--- Navigue vers « play » exactement une fois, à la fin du fondu de l'écran de chargement qui suit l'activation (le routeur renvoie la demande jusqu'à ce que l'UI confirme).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/career/career.lua:250
function career_career.onLoadingScreenFadeout() end

--- Hook de sauvegarde du profil : écrit career/general.json (niveau, startingOptions, boughtStarterVehicle, organizationInteraction, états des fenêtres de debug).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/career/career.lua:417
---@param currentSavePath string Dossier de sauvegarde.
function career_career.onSaveCurrentProfile(currentSavePath) end

--- Hook de rechargement des extensions : désactive la carrière et note reactivate = true si elle était active.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/career/career.lua:662
---@return table  Données ({reactivate = true} si active).
function career_career.onSerialize() end

--- Hook d'ajout d'un véhicule à l'inventaire : marque le véhicule de départ comme acheté (sauvegarde immédiate) et débloque le succès FIRST_SET_OF_KEYS pour un achat instantané chez apmStarterVehicles.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/career/career.lua:701
---@param data table Contient purchaseData et vehicleInfo.
function career_career.onVehicleAddedToInventory(data) end

--- Construit les infos de chaque profil (argent, beamXP, vouchers, score d'assurance, branches « apm », véhicule courant, nombre de véhicules, versions) et les envoie à l'UI via guihooks « allCareerProfiles » ; trie par creationDate.
---Source : lua/ge/extensions/career/career.lua:569
---@return table[]  Données des profils.
function career_career.sendAllCareerProfilesData() end

--- Retourne les infos du profil courant (même format qu'un profil de sendAllCareerProfilesData). Nil si la carrière n'est pas active.
---Source : lua/ge/extensions/career/career.lua:591
---@return table|nil  Données du profil.
function career_career.sendCurrentProfileData() end

--- Active ou coupe l'autosave.
---Source : lua/ge/extensions/career/career.lua:724
---@param enabled boolean Nouvel état.
function career_career.setAutosaveEnabled(enabled) end

--- Active ou coupe le menu de debug imgui de la carrière.
---Source : lua/ge/extensions/career/career.lua:749
---@param enabled boolean Nouvel état.
function career_career.setDebugMenuEnabled(enabled) end


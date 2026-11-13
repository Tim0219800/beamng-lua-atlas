---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/missions/missionScreen.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Pont entre le système de missions et l'interface (UI Vue) : prépare les données de l'écran de mission (missions au marqueur courant, mission en cours, tuiles de la liste, étoiles actives selon les réglages, options de démarrage, frais d'entrée, réparation, classe de véhicule exigée), lance ou arrête une mission depuis l'UI, gère la navigation vers une mission sur la grande carte et les sons de l'écran de fin. Presque toutes ses fonctions sont appelées par l'interface via des commandes Lua (par ex. gameplay_missions_missionScreen.startMissionById) ; les résultats repartent par guihooks.trigger.
--- Accès : extension `gameplay_missions_missionScreen` : `extensions.load("gameplay_missions_missionScreen")`, puis la globale `gameplay_missions_missionScreen`
---@class gameplay_missions_missionScreen
---@field dependencies string[] Extensions chargées avant : gameplay_missions_missions, gameplay_markerInteraction, gameplay_playmodeMarkers.
---@field savedLayouts table[]|nil Mises en page de test lues dans /gameplay/testing/*.json par discoverLayouts ; nil avant le premier appel.
---@field testLayout table|nil Mise en page de test renvoyée par onRequestMissionScreenData quand le mode contient « test » ; nil par défaut.
---@field uiLayoutHistory table[] Les 20 dernières mises en page d'écran de mission reçues par onMissionScreenReady (avec recordedAt et recordedAtFormatted).
gameplay_missions_missionScreen = {}

--- Abandonne la mission en cours comme si le joueur avait appuyé sur le bouton d'abandon.
---Source : lua/ge/extensions/gameplay/missions/missionScreen.lua:822
function gameplay_missions_missionScreen.abandonCurrentMission() end

--- Joue (avec la hauteur donnée) ou arrête les sons de comptage de l'écran de fin (money, xp, vouchers).
---Source : lua/ge/extensions/gameplay/missions/missionScreen.lua:1012
---@param soundLabel string money, xp ou vouchers.
---@param active boolean true pour jouer ; false arrête tous les sons de comptage.
---@param pitch number|nil Paramètre « pitch » (1 par défaut).
function gameplay_missions_missionScreen.activateSound(soundLabel, active, pitch) end

--- Active ou désactive le flou audio (core_sounds.setAudioBlur) pendant l'écran de mission.
---Source : lua/ge/extensions/gameplay/missions/missionScreen.lua:894
---@param active boolean true pour activer.
function gameplay_missions_missionScreen.activateSoundBlur(active) end

--- Appelée quand le joueur change un réglage : détermine la clé de progression correspondante (mission:getProgressKeyForUserSetting) et envoie à l'UI, par guihooks « missionProgressKeyChanged », {progressKey, translation, progress} avec les agrégats reformatés. Utilise la mission parente si missionIdForAttempt est défini. Malgré son nom, elle ne modifie aucun réglage.
---Source : lua/ge/extensions/gameplay/missions/missionScreen.lua:824
---@param id string Id de la mission.
---@param settings table[] Liste {key, value}.
function gameplay_missions_missionScreen.changeUserSettings(id, settings) end

--- Fenêtre imgui de debug, utilisée comme onUpdate quand enableDebug(true).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/missions/missionScreen.lua:1291
---@param dt number Temps écoulé (s).
function gameplay_missions_missionScreen.debugOnUpdate(dt) end

--- Outil de debug : lit les mises en page JSON de /gameplay/testing dans M.savedLayouts.
---Source : lua/ge/extensions/gameplay/missions/missionScreen.lua:1269
function gameplay_missions_missionScreen.discoverLayouts() end

--- Outil de debug : active/désactive la fenêtre imgui de l'historique des mises en page (affecte M.onUpdate).
---Source : lua/ge/extensions/gameplay/missions/missionScreen.lua:1281
---@param enable boolean true pour activer.
function gameplay_missions_missionScreen.enableDebug(enable) end

--- Met une mission au format attendu par l'UI (id, nom traduit, icône, description, aperçu, libellé de type, étoiles, réglages, classe exigée, ligues en carrière, etc.).
---Source : lua/ge/extensions/gameplay/missions/missionScreen.lua:111
---@param m table Mission construite.
---@return table  Données formatées pour l'interface.
function gameplay_missions_missionScreen.formatMission(m) end

--- Détermine quelles étoiles sont actives, visibles et activées pour des réglages donnés (après recalcul des récompenses dynamiques, en ignorant les clés de ignoreUserSettingsKeyForActiveStars). Mémorise les réglages dans m._lastUserSettingsOutsideOfMission.
---Source : lua/ge/extensions/gameplay/missions/missionScreen.lua:599
---@param id string Id de la mission.
---@param userSettings table Liste {key, value} ou table à plat clé -> valeur.
---@return table  Table contenant notamment starInfo par clé d'étoile ; table vide si la mission n'existe pas.
function gameplay_missions_missionScreen.getActiveStarsForUserSettings(id, userSettings) end

--- Données de l'écran de mission : si une mission est en cours, renvoie le contexte « ongoingMission » (mission en cours, options de récupération, boutons masqués pendant le tutoriel ou le rallye en boucle) ; sinon contexte « availableMissions » (missions du marqueur ou liste personnalisée, tuiles, mission/page présélectionnées, avertissement de livraison en cours) ou « empty ».
---Source : lua/ge/extensions/gameplay/missions/missionScreen.lua:308
---@return table  Table avec le champ context et les données associées.
function gameplay_missions_missionScreen.getMissionScreenData() end

--- Construit les tuiles de la liste des missions du niveau courant (filtres, groupes par difficulté et « all », tris). Sans ids, ne garde que les missions visibles en freeroam ; avec ids, seulement celles-ci.
---Source : lua/ge/extensions/gameplay/missions/missionScreen.lua:1096
---@param ids table<string, boolean>|nil Ensemble d'ids à inclure.
---@return table  Table dont tilesById, et les groupes triés (détail dans le code).
function gameplay_missions_missionScreen.getMissionTiles(ids) end

--- Liste des missions du marqueur où se trouve le joueur, déjà formatées et triées par profondeur de déblocage ; nil si l'état de jeu n'a pas de marqueurs de playmode.
---Source : lua/ge/extensions/gameplay/missions/missionScreen.lua:258
---@return table[]|nil  Missions formatées.
function gameplay_missions_missionScreen.getMissionsAtCurrentLocationFormatted() end

--- Données du menu pause (composant Vue MissionObjectives) : fusionne les étoiles débloquées avec les règles d'étoiles actives pour les réglages de la mission en cours.
---Source : lua/ge/extensions/gameplay/missions/missionScreen.lua:713
---@return table  {stars, message, showMessage} ; stars est vide s'il n'y a pas de mission ou d'étoiles.
function gameplay_missions_missionScreen.getPauseMissionObjectivesData() end

--- Coût de la réparation proposée au départ d'une mission en carrière : « moneyRepair » -> {money=1000}, « voucherRepair » -> {vouchers=1}, sinon nil.
---Source : lua/ge/extensions/gameplay/missions/missionScreen.lua:13
---@param type string moneyRepair ou voucherRepair.
---@return table<string, number>|nil  Coût par attribut.
function gameplay_missions_missionScreen.getRepairCostForStartingRepairType(type) end

--- Indique si une mission de premier plan est en cours.
---Source : lua/ge/extensions/gameplay/missions/missionScreen.lua:1405
---@return boolean  true si une mission est active.
function gameplay_missions_missionScreen.isAnyMissionActive() end

--- Diffuse le hook onGetIsMissionStartOrEndScreenActive ; un module qui affiche l'écran de début/fin de mission y répond en ajoutant une valeur.
---Source : lua/ge/extensions/gameplay/missions/missionScreen.lua:1406
---@return any  Première valeur ajoutée par un écouteur, ou false.
function gameplay_missions_missionScreen.isMissionStartOrEndScreenActive() end

--- Ouvre la grande carte centrée sur une mission (freeroam_bigMapMode.enterBigMap, instantané) ; la sélection du POI et la navigation sont faites ensuite par onBigMapActivated.
---Source : lua/ge/extensions/gameplay/missions/missionScreen.lua:972
---@param id string Id de la mission.
---@param routeTarget string|nil Route cible de l'UI.
---@param routeParams table|nil Paramètres de route (autoSelectPoiId = id par défaut).
function gameplay_missions_missionScreen.navigateToMission(id, routeTarget, routeParams) end

--- Hook appelé à l'ouverture de la grande carte : si une navigation vers une mission est en attente (et vieille de plus de 3 s), sélectionne le POI et lance la navigation.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/missions/missionScreen.lua:991
function gameplay_missions_missionScreen.onBigMapActivated() end

--- Hook à la fin du niveau ; ne fait rien (code commenté).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/missions/missionScreen.lua:927
---@param levelPath string Chemin du niveau.
function gameplay_missions_missionScreen.onClientEndMission(levelPath) end

--- Hook à la décharge de l'extension ; ne fait rien (code commenté).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/missions/missionScreen.lua:923
function gameplay_missions_missionScreen.onExtensionUnloaded() end

--- Hook envoyé quand l'écran de mission est affiché : mémorise la mise en page UI reçue (20 dernières).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/missions/missionScreen.lua:1380
---@param mode string Mode de l'écran.
---@param uiLayout table Mise en page envoyée par l'UI (reçoit recordedAt).
function gameplay_missions_missionScreen.onMissionScreenReady(mode, uiLayout) end

--- Test (« Todo: Remove ») : si le mode contient « test », renvoie à l'UI une copie de M.testLayout par guihooks « onRequestMissionScreenDataReady ».
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/missions/missionScreen.lua:1393
---@param mode string Mode demandé.
function gameplay_missions_missionScreen.onRequestMissionScreenData(mode) end

--- Ouvre l'écran des défis de la carrière (missions de départ « league » du niveau courant, filtrées par branche et compétence) via ui_router.navigate (« mission.details » par défaut).
---Source : lua/ge/extensions/gameplay/missions/missionScreen.lua:937
---@param branch string|nil Branche ; « undefined » = nil.
---@param skill string|nil Compétence ; « undefined » ou « all » = nil.
---@param routeTarget string|nil Route cible de l'UI.
---@param routeParams table|nil Paramètres de route (pathId = branch par défaut).
function gameplay_missions_missionScreen.openAPMChallenges(branch, skill, routeTarget, routeParams) end

--- Ouvre le sélecteur de véhicule pour le réglage « véhicule personnalisé » d'une mission, puis revient à la page « settings » de la mission avec le modèle et la config choisis.
---Source : lua/ge/extensions/gameplay/missions/missionScreen.lua:1038
---@param mId string Id de la mission.
---@param settingKey string Clé du réglage de sélection de véhicule.
function gameplay_missions_missionScreen.openVehicleSelectorForMissionBySetting(mId, settingKey) end

--- Calcule les options de démarrage pour les réglages donnés et les envoie à l'UI par guihooks « missionStartingOptionsForUserSettingsReady » ({missionId, options, entryFee}). Vérifie : mission démarrable, véhicule perso choisi, démarrage à pied impossible, frais d'entrée payables, classe de véhicule, et propose la réparation payante en carrière si le véhicule est endommagé.
---Source : lua/ge/extensions/gameplay/missions/missionScreen.lua:421
---@param id string Id de la mission.
---@param userSettings table[] Liste de réglages {key, value}.
function gameplay_missions_missionScreen.requestStartingOptionsForUserSettings(id, userSettings) end

--- Classe du véhicule que la mission utiliserait par défaut (option présélectionnée dans ses réglages). Les règles de choix sont dans gameplay_vehiclePerformance.getDefaultMissionVehicleSpec ; pour un véhicule imposé (preset) la classe vient de getClassFromConfig, sinon on retombe sur celle du joueur.
---Source : lua/ge/extensions/gameplay/missions/missionScreen.lua:42
---@param m table Mission construite.
---@return table|nil  Données de classe.
function gameplay_missions_missionScreen.resolveDefaultMissionVehicleClass(m) end

--- Renvoie la classe de véhicule exigée par la mission (missionTypeData.vehicleGroupByClassActive et vehicleGroupByClass), construite avec gameplay_vehiclePerformance.buildClassRequirement ; « auto » prend la classe du joueur (B par défaut), « userSetting » donne nil (choix dans les réglages).
---Source : lua/ge/extensions/gameplay/missions/missionScreen.lua:73
---@param m table Mission construite.
---@return table|nil  Exigence de classe, ou nil s'il n'y en a pas.
function gameplay_missions_missionScreen.resolveMissionVehicleClassRequirement(m) end

--- Classe de performance du véhicule du joueur sous forme {class={name, description, minPI}, performanceIndex} : véhicule d'inventaire actif en carrière, sinon véhicule joueur actuel via gameplay_vehiclePerformance.getClassFromVehId.
---Source : lua/ge/extensions/gameplay/missions/missionScreen.lua:22
---@return table|nil  Données de classe, ou nil si indisponible.
function gameplay_missions_missionScreen.resolvePlayerVehicleClass() end

--- Compare la classe courante et la classe exigée par noms : « met » si identiques, « unmet » si différentes, « unknown » si l'une manque.
---Source : lua/ge/extensions/gameplay/missions/missionScreen.lua:60
---@param currentClass table|nil Classe actuelle {class={name}}.
---@param requiredClass table|nil Classe exigée.
---@return string  met, unmet ou unknown.
function gameplay_missions_missionScreen.resolveRequirementState(currentClass, requiredClass) end

--- Définit la mission présélectionnée à l'ouverture de l'écran de mission.
---Source : lua/ge/extensions/gameplay/missions/missionScreen.lua:882
---@param mId string|nil Id de mission.
function gameplay_missions_missionScreen.setPreselectedMissionId(mId) end

--- Définit la page de l'écran de mission à ouvrir (utilisée une seule fois par getMissionScreenData).
---Source : lua/ge/extensions/gameplay/missions/missionScreen.lua:877
---@param page string|nil Nom de la page, par ex. « settings ».
function gameplay_missions_missionScreen.setPreselectedPage(page) end

--- Redémarre/reconfigure une mission depuis une mission en cours (aplatit les réglages puis appelle missionManager.startFromWithinMission).
---Source : lua/ge/extensions/gameplay/missions/missionScreen.lua:1250
---@param id string Id de la mission à démarrer.
---@param settings table[]|nil Liste {key, value}.
function gameplay_missions_missionScreen.startFromWithinMission(id, settings) end

--- Démarre une mission avec fondu (gameplay_missions_missionManager.startWithFade) après avoir aplati les réglages. Logue une erreur si l'id est invalide ou si la mission n'est pas démarrable.
---Source : lua/ge/extensions/gameplay/missions/missionScreen.lua:790
---@param id string Id de la mission.
---@param userSettings table[]|nil Liste {key, value}.
---@param startingOptions table|nil Options (startedFrom, skipUnlockCheck, skipPartConditionSnapshot...).
function gameplay_missions_missionScreen.startMissionById(id, userSettings, startingOptions) end

--- Demande l'abandon (avec fondu) de la mission d'id donné, ou de la mission de premier plan si id est nil.
---Source : lua/ge/extensions/gameplay/missions/missionScreen.lua:813
---@param id string|nil Id de la mission.
---@param force boolean|nil Transmis à attemptAbandonMissionWithFade (non utilisé là).
---@param abandonButtonPressed boolean|nil true si c'est le joueur qui abandonne.
function gameplay_missions_missionScreen.stopMissionById(id, force, abandonButtonPressed) end


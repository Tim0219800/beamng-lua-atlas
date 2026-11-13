---@meta
-- tim19Atlas stub generated from lua/ge/extensions/freeroam/crashCamMode.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Caméra de crash (ralenti automatique) du mode freeroam. Chaque image, il prédit (0,2 s à l'avance) si le véhicule du joueur va percuter un véhicule de trafic/garé, un mur (rayons statiques) ou subit un brusque changement de vitesse ; si la différence de vitesse dépasse 13 m/s, il passe en ralenti (simTimeAuthority 0,15), cache l'interface et bascule sur la caméra 'crash' ou sur un chemin de caméra. Il restaure ensuite vitesse, interface et caméra précédentes et émet onCrashCamEnded. Chargé par freeroam_crashCamModeLoader selon le réglage enableCrashCam.
--- Accès : extension `freeroam_crashCamMode` : `extensions.load("freeroam_crashCamMode")`, puis la globale `freeroam_crashCamMode`
---@class freeroam_crashCamMode
freeroam_crashCamMode = {}

--- Renvoie le mode de suivi actuel.
---Source : lua/ge/extensions/freeroam/crashCamMode.lua:707
---@return integer  1 (trafic et murs) ou 2 (tous les véhicules actifs et murs).
function freeroam_crashCamMode.getTrackingMode() end

--- Hook appelé quand une mission change d'état : désactive la caméra de crash au démarrage ('started'), la réactive à l'arrêt ('stopped').
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/freeroam/crashCamMode.lua:691
---@param state string État de la mission : 'started' ou 'stopped' (les autres valeurs sont ignorées).
function freeroam_crashCamMode.onAnyMissionChanged(state) end

--- Hook appelé juste avant l'ouverture de la grande carte : arrête la caméra de crash.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/freeroam/crashCamMode.lua:668
function freeroam_crashCamMode.onBeforeBigMapActivated() end

--- Hook appelé avant l'ouverture d'un menu : arrête la caméra de crash si elle est active.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/freeroam/crashCamMode.lua:678
function freeroam_crashCamMode.onBeforeMenuOpened() end

--- Hook appelé à la fin du niveau : désactive la caméra de crash.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/freeroam/crashCamMode.lua:643
---@param levelPath string Chemin du niveau quitté (non utilisé).
function freeroam_crashCamMode.onClientEndMission(levelPath) end

--- Hook appelé au démarrage du niveau : active la caméra de crash si l'état de jeu est 'freeroam'.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/freeroam/crashCamMode.lua:647
function freeroam_crashCamMode.onClientStartMission() end

--- Hook appelé au chargement : renvoie false si le réglage enableCrashCam est désactivé.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/freeroam/crashCamMode.lua:653
---@return boolean|nil  false si désactivée, nil sinon.
function freeroam_crashCamMode.onExtensionLoaded() end

--- Hook appelé au déchargement : arrête proprement la caméra de crash (restaure vitesse, interface et caméra).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/freeroam/crashCamMode.lua:657
function freeroam_crashCamMode.onExtensionUnloaded() end

--- Hook appelé quand l'état du replay change : arrête la caméra de crash.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/freeroam/crashCamMode.lua:635
---@param state string Nouvel état du replay (non utilisé).
function freeroam_crashCamMode.onReplayStateChanged(state) end

--- Hook appelé avant un rechargement des extensions : arrête la caméra de crash.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/freeroam/crashCamMode.lua:639
function freeroam_crashCamMode.onSerialize() end

--- Hook appelé à la mise en pause ou reprise du jeu : arrête la caméra de crash si elle est active.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/freeroam/crashCamMode.lua:672
function freeroam_crashCamMode.onTogglePause() end

--- Hook appelé à chaque image : détecte les crashs imminents (trafic, mur, variation de vitesse) quand la caméra de crash est inactive ; quand elle est active, suit sa durée, vérifie l'impact entre véhicules, lance le chemin de caméra en mode 3 et l'arrête après 4 s ou en cas de téléportation.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/freeroam/crashCamMode.lua:535
---@param dtReal number Temps réel écoulé (s).
---@param dtSim number Temps de simulation écoulé (s).
function freeroam_crashCamMode.onUpdate(dtReal, dtSim) end

--- Hook appelé quand un véhicule est remis en place : arrête la caméra de crash si c'est le véhicule du joueur.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/freeroam/crashCamMode.lua:629
---@param vehId integer Id du véhicule réinitialisé.
function freeroam_crashCamMode.onVehicleResetted(vehId) end

--- Hook appelé au changement de véhicule joueur : si la caméra de crash est active, remet la caméra précédente sur l'ancien véhicule, puis arrête la caméra de crash.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/freeroam/crashCamMode.lua:684
---@param oldVehId integer Id de l'ancien véhicule du joueur.
function freeroam_crashCamMode.onVehicleSwitched(oldVehId) end

--- Force l'exécution de la détection même hors freeroam ou si la caméra de crash est désactivée.
---Source : lua/ge/extensions/freeroam/crashCamMode.lua:711
---@param enabled boolean true pour forcer.
function freeroam_crashCamMode.setForcedEnabled(enabled) end

--- Choisit le mode de suivi (1 ou 2, voir notes).
---Source : lua/ge/extensions/freeroam/crashCamMode.lua:703
---@param mode integer 1 ou 2.
function freeroam_crashCamMode.setTrackingMode(mode) end

--- À appeler quand l'utilisateur change de mode de caméra : arrête la caméra de crash si elle est active (aucun appelant dans ce fichier).
---Source : lua/ge/extensions/freeroam/crashCamMode.lua:662
function freeroam_crashCamMode.trackCamMode() end

--- Arrête la caméra de crash (appelée en cas de reset du véhicule ; contrairement à onVehicleResetted, ne vérifie pas quel véhicule).
---Source : lua/ge/extensions/freeroam/crashCamMode.lua:699
function freeroam_crashCamMode.trackVehReset() end


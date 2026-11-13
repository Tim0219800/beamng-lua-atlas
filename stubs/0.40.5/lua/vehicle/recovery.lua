---@meta
-- tim19Atlas stub generated from lua/vehicle/recovery.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Système de récupération (touche « recover ») du véhicule. En roulant, enregistre toutes les 0,2 s un historique de positions/orientations (jusqu'à 700 points, un point au moins 2 m après le précédent). Quand on maintient la récupération, le véhicule « rembobine » ce chemin à vitesse croissante (3 -> 20 -> 50 m/s) avec une caméra de récupération et un fil de fer des poutres, puis est téléporté au point atteint à la relâche. Gère aussi le point « home » (saveHome/loadHome) et le mode multijoueur (validation par le serveur).
--- Accès : globale `recovery`
---@class recovery
---@field recoveryHooksOnly boolean Si vrai, l'entrée de récupération n'émet que les hooks sans modifier le véhicule (tutoriel First Drive). Faux par défaut.
---@field recoveryPoints dequeue Historique des points de récupération ({pos=vec3, dirFront=vec3, dirUp=vec3}), du plus ancien (gauche) au plus récent (droite).
---@field updateGFX function nop au chargement, puis remplacée par updateGFXRecord (enregistrement) ou updateGFXRecovery (rembobinage). ⚠ référence nop non définie dans le fichier (global du jeu).
recovery = {}

--- Finalise une récupération : remet à zéro les poutres de flexmesh cassées, libère les noeuds fixés par le grabber, affiche le message adapté, ferme la caméra et émet le hook GE onStopRecovering.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/recovery.lua:283
---@param timer number|string|nil Durée de la récupération en secondes (défaut : durée mesurée).
function recovery.afterStopRecovering(timer) end

--- Entre réellement en mode rembobinage : crée un point de départ, passe updateGFX sur updateGFXRecovery, émet le hook GE onStartRecovering. Appelé par startRecovering ou après autorisation MP.
---Source : lua/vehicle/recovery.lua:491
---@param useAltMode boolean|nil Voir startRecovering.
function recovery.beginRecoveringPreview(useAltMode) end

--- Annule la récupération en cours sans téléporter : remet l'enregistrement, réinitialise les matériaux et ferme la caméra de récupération.
---Source : lua/vehicle/recovery.lua:260
function recovery.cancelRecoveringPreview() end

--- Vide l'historique des points, supprime homePoint et invalide le dernier point de récupération.
---Source : lua/vehicle/recovery.lua:50
function recovery.clear() end

--- Passe en mode enregistrement, mémorise le nombre de poutres et précalcule les positions relatives des noeuds par rapport au noeud de référence (pour dessiner le fil de fer).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/recovery.lua:559
---@param path string Non utilisé (déduit du code).
function recovery.init(path) end

--- Demande le retour au point home (ne fait rien s'il n'y en a pas). Passe par multiplayer_vehicleSync.requestLoadHome si présent, sinon rappelle loadHomeLocal côté véhicule.
---Source : lua/vehicle/recovery.lua:507
---@param moveTraffic boolean|nil Transmis à spawn.safeTeleport : déplacer aussi le trafic gênant.
function recovery.loadHome(moveTraffic) end

--- Téléporte immédiatement le véhicule au point home et affiche 'vehicle.recovery.loadHome'. Appelé par loadHome (ou le serveur MP).
---Source : lua/vehicle/recovery.lua:521
---@param moveTraffic boolean|nil Voir loadHome.
function recovery.loadHomeLocal(moveTraffic) end

--- Applique un point de récupération validé par le serveur multijoueur : téléporte le véhicule (smart spawn ou vehicleSetPositionRotation) puis notifie multiplayer_vehicleSync.onVehicleRecoveryApplied.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/recovery.lua:180
---@param requestId integer Identifiant de la requête MP.
---@param action string Nom de l'action renvoyé au serveur.
---@param px number Position X (m).
---@param py number Position Y (m).
---@param pz number Position Z (m).
---@param fx number Direction avant X.
---@param fy number Direction avant Y.
---@param fz number Direction avant Z.
---@param ux number Direction haut X.
---@param uy number Direction haut Y.
---@param uz number Direction haut Z.
---@param useSmartSpawnParam boolean|nil Forcer/interdire le smart spawn (sinon valeur interne).
---@param player any Joueur concerné, transmis à safeTeleport.
---@param moveTraffic boolean|nil Déplacer le trafic gênant.
function recovery.mpApplyRecoveryPoint(requestId, action, px, py, pz, fx, fy, fz, ux, uy, uz, useSmartSpawnParam, player, moveTraffic) end

--- Hook de désérialisation (rechargement du Lua véhicule) : fusionne l'état sauvegardé dans M et reconstruit la file recoveryPoints.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/recovery.lua:56
---@param v table Données sauvegardées.
function recovery.onDeserialized(v) end

--- Hook appelé en multijoueur quand le serveur autorise la récupération : mémorise requestId et lance beginRecoveringPreview.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/recovery.lua:546
---@param requestId integer Identifiant de requête.
---@param useAltMode boolean|string Mode alternatif (true ou la chaîne 'true').
function recovery.onRecoveringBeginAllowed(requestId, useAltMode) end

--- Hook appelé en multijoueur quand le serveur refuse la récupération : annule l'état d'attente.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/recovery.lua:551
function recovery.onRecoveringBeginDenied() end

--- Remet le véhicule d'aplomb à sa position actuelle (point de récupération = état courant, appliqué tout de suite).
---Source : lua/vehicle/recovery.lua:555
function recovery.recoverInPlace() end

--- Mémorise un point home. Sans argument, utilise la position/orientation actuelle et affiche le message 'vehicle.recovery.saveHome'.
---Source : lua/vehicle/recovery.lua:223
---@param point table|nil Point {pos, dirFront, dirUp} ; position actuelle si nil.
function recovery.saveHome(point) end

--- Démarre la récupération (appui sur la touche). En solo lance directement beginRecoveringPreview ; en multijoueur demande d'abord l'autorisation au serveur. Ignoré si déjà en cours.
---Source : lua/vehicle/recovery.lua:527
---@param useAltMode boolean|nil Mode alternatif : inverse le réglage 'enableSmartRecovery' (faux par défaut).
function recovery.startRecovering(useAltMode) end

--- Demande l'arrêt de la récupération (relâche de la touche) ; l'arrêt effectif et la téléportation ont lieu à la prochaine updateGFX.
---Source : lua/vehicle/recovery.lua:274
---@param player any Joueur à l'origine de la demande, transmis à la téléportation (déduit du code).
function recovery.stopRecovering(player) end


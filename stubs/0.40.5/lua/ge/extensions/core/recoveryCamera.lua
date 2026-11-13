---@meta
-- tim19Atlas stub generated from lua/ge/extensions/core/recoveryCamera.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Caméra libre temporaire pendant le « recovery » (retour en arrière/réapparition) d'un véhicule. beginRecoveryCamera bascule le joueur assis dans ce véhicule en caméra libre, setRecoveryCameraPosRot la déplace, endRecoveryCamera restaure la caméra de jeu. Si le joueur était déjà en caméra libre, rien n'est modifié. Appelé en pratique depuis le code de recovery du véhicule.
--- Accès : extension `core_recoveryCamera` : `extensions.load("core_recoveryCamera")`, puis la globale `core_recoveryCamera`
---@class core_recoveryCamera
core_recoveryCamera = {}

--- Démarre la caméra de recovery pour le joueur assis dans le véhicule : mémorise s'il était déjà en caméra libre, sinon appelle commands.setFreeCamera(player).
---Source : lua/ge/extensions/core/recoveryCamera.lua:27
---@param vehicleId integer Id du véhicule en recovery.
function core_recoveryCamera.beginRecoveryCamera(vehicleId) end

--- Termine le recovery : oublie l'état et remet la caméra de jeu (commands.setGameCamera) si la caméra libre avait été activée par beginRecoveryCamera.
---Source : lua/ge/extensions/core/recoveryCamera.lua:45
---@param vehicleId integer Id du véhicule.
function core_recoveryCamera.endRecoveryCamera(vehicleId) end

--- Hook appelé quand un objet est supprimé : oublie un recovery en cours pour ce véhicule.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/recoveryCamera.lua:52
---@param vehicleId integer Id de l'objet supprimé.
function core_recoveryCamera.onDespawnObject(vehicleId) end

--- Place la caméra du joueur (core_camera.setPosRot). Sans effet si aucun recovery actif pour ce véhicule ou si le joueur était déjà en caméra libre.
---Source : lua/ge/extensions/core/recoveryCamera.lua:38
---@param vehicleId integer Id du véhicule.
---@param px number Position x (m).
---@param py number Position y (m).
---@param pz number Position z (m).
---@param qx number Quaternion x.
---@param qy number Quaternion y.
---@param qz number Quaternion z.
---@param qw number Quaternion w.
function core_recoveryCamera.setRecoveryCameraPosRot(vehicleId, px, py, pz, qx, qy, qz, qw) end


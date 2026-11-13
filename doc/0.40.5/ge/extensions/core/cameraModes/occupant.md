# `core_cameraModes_occupant`

*Fichier : `lua/ge/extensions/core/cameraModes/occupant.lua` · VM : Game Engine (GE) · 468 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/core/cameraModes/occupant")` (fichier sous extensions/ mais pas une extension classique)

Caméra « tête de l'occupant » (conducteur ou passager, vue cockpit) définie par le jbeam du véhicule. La caméra suit un nœud de la tête avec un mélange réglable position statique / physique (réglage cameraDriverPhysics), verrouille horizon et tangage (cameraDriverStableHorizon/Pitch), anticipe le virage (look-ahead, algorithme « caillou sur une ficelle »), permet de tourner la tête jusqu'à 160 degrés (lacet) et ±80 (tangage), de se pencher par-dessus l'épaule (profils shoulderLeft/Right) et de régler le siège (inclinaison -30 à 20 degrés, position y et z limitée à ±0.4 m), sauvegardé par véhicule dans le réglage 'cameraDriverVehicleConfigs'. Gère le zoom du conducteur (DriverCameraZoom) et les options VR (snap turn, verrouillage d'horizon). Renvoie un constructeur.

## Remarques

- Champs jbeam utilisés : seatSide ('left'|'right'|'center'), seatId, shoulderLeft/shoulderRight (startYaw, lateralOffset, forwardOffset, verticalOffset, forwardMultiplier, verticalMultiplier), lookBack{side, yaw}, idRefOccupant/idLeftOccupant/idBackOccupant, camNodeID, refNodes.
- Pendant les 3 premières images après un changement de configuration (cameraResetted), update place seulement la caméra sur le véhicule (données peu fiables) et ne renvoie rien.
- Réglages lus : cameraDriverPhysics, cameraDriverAutocenter, cameraDriverAllowSeatAdjustments, cameraDriverStableHorizon, cameraDriverStablePitch, cameraDriverLookAheadAngle, cameraDriverLookAheadSmoothness, cameraDriverFov, openXRsnapTurnDriver, openXRhorizonLockDriver.
- Un commentaire FIXME du code signale que camPosInitialLocal peut être calculé n'importe quand (par exemple après des dégâts).

## Classe `C`

Mode caméra occupant. Champs : camRot, relativeYaw/Pitch, seatPosition (vec3), seatRotation (degrés), manualzoom, occupantDetached, icon 'personSolid', canUseVehicleTriggerCrosshair = true.

Le module renvoie un constructeur : `local obj = require("core_cameraModes_occupant")(options)`.

| Méthode | Description | Ligne |
|---|---|---|
| `C:init()` | Crée lissages, profils d'épaule et paramètres, puis appelle onVehicleCameraConfigChanged et onSettingsChanged. | 60 |
| `C:mouseLocked(locked)` | Indique que la souris est verrouillée ou non ; au déverrouillage avec recentrage automatique et véhicule en mouvement, recentre la tête. | 451 |
| `C:onCameraChanged(focused)` | Hook : au gain de focus pousse l'action map « DriverCameraZoom » ; à la perte, la retire et remet le zoom conducteur à 0. | 108 |
| `C:onDeserialized()` | Hook : après rechargement d'extensions, recharge la config et réinitialise. | 161 |
| `C:onOccupantDetached(breakGroup)` | Hook : l'occupant est détaché (groupe de rupture « ocpAttach<seatId> ») : la caméra suivra les nœuds occupant. | 100 |
| `C:onSettingsChanged()` | Hook : relit les réglages cameraDriver* et OpenXR. | 123 |
| `C:onVehicleCameraConfigChanged()` | Hook : réinitialise la position du siège et les nœuds de référence occupant ; rechargera la config de siège au prochain update. | 88 |
| `C:onVehicleResetted()` | Hook : le véhicule a été remis à neuf, l'occupant n'est plus détaché. | 104 |
| `C:reset()` | Recentre la tête, remet le balancement et le zoom conducteur à zéro. | 153 |
| `C:resetSeat()` | Remet le siège (position, inclinaison) à zéro pour ce véhicule et l'enregistre immédiatement. | 136 |
| `C:resetSeatAll()` | Remet le siège à zéro et efface la config de siège de tous les véhicules (cameraDriverVehicleConfigs = {}). | 145 |
| `C:setRefNodes(centerNodeID, leftNodeID, backNodeID)` | Définit les nœuds de référence ; si l'un des trois est nil, utilise les nœuds idRef/Left/BackOccupant. | 443 |
| `C:update(data)` | Calcule position et orientation de la tête et le FOV, gère réglage du siège et sauvegarde différée (1 s), écrit data.res. | 179 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/core/cameraModes/occupant.lua`.*

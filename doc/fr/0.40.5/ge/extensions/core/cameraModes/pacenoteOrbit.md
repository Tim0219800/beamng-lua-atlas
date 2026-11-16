# `core_cameraModes_pacenoteOrbit`

*Fichier : `lua/ge/extensions/core/cameraModes/pacenoteOrbit.lua` · VM : Game Engine (GE) · 144 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/core/cameraModes/pacenoteOrbit")` (fichier sous extensions/ mais pas une extension classique)

Caméra orbitale globale autour d'un point fixe (fixedTargetPos), utilisée par les outils d'annotations de rallye (pacenotes). Rotation à la souris, aux touches (gauche/droite, avant/arrière) ou aux entrées de lacet/tangage ; zoom entre 10 et 1500 m (300 par défaut), FOV 65. La caméra est maintenue à au moins 1 m au-dessus du terrain (core_terrain). Renvoie un constructeur.

## Remarques

- update remet MoveManager.zoomIn/zoomOut à zéro après les avoir lus (le zoom continu est donc limité à l'image).
- reset teste self.cameraResetted == 0 alors que ce champ n'est jamais défini dans ce fichier (nil) : la fonction ne fait rien (code mort) ; camLastTargetPos2 non plus.
- onSettingsChanged appelle core_camera.clearInputs() (commentaire du code : « is this really necessary? »).

## Classe `C`

Orbite autour d'un point. Champs : fixedTargetPos, fov, camRot (vec3 degrés : x lacet, y tangage), camDist, defaultDistance, camMinDist, camMaxDist.

Le module renvoie un constructeur : `local obj = require("core_cameraModes_pacenoteOrbit")(options)`.

| Méthode | Description | Ligne |
|---|---|---|
| `C:init()` | isGlobal = true, FOV 65, puis setupStuff, onSettingsChanged, reset. | 10 |
| `C:onSettingsChanged()` | Hook : relit les réglages cameraOrbit* (fovModifier, relaxation, maxDynamicFov, maxDynamicPitch, maxDynamicOffset, smoothing). | 35 |
| `C:reset()` | Code mort (voir notes). | 45 |
| `C:setDefaultDistance(d)` | Change defaultDistance (sans modifier la distance courante camDist). | 56 |
| `C:setRef(center, left, back)` | Définit le point autour duquel orbiter ; seul center est utilisé. | 52 |
| `C:setupStuff()` | Définit rotation par défaut (0, -17, 0), bornes de distance 10-1500 m et distance par défaut 300 m. | 22 |
| `C:update(data)` | Calcule la position orbitale, la clippe au terrain et écrit data.res (collisionCompatible = true). | 60 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/core/cameraModes/pacenoteOrbit.lua`.*

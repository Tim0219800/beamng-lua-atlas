# `core_cameraModes_scriptedFree`

*Fichier : `lua/ge/extensions/core/cameraModes/scriptedFree.lua` · VM : Game Engine (GE) · 440 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/core/cameraModes/scriptedFree")` (fichier sous extensions/ mais pas une extension classique)

Caméra libre pilotée par script (globale, masquée) : la pose (position, lacet, tangage vers le bas, roulis en degrés) est possédée à chaque image par le script, avec option de regard à la souris ou de déplacement manuel. Permet des vols animés (setTarget avec durée, courbe et callback), un lissage continu (setSmooth), le verrouillage de la position (locked), l'interdiction de tourner (driveRot) ou de bouger. Renvoie un constructeur.

## Exemple

```lua
core_camera.setByName(0, 'scriptedFree', false, {pos = vec3(0,0,50), yawDeg = 90, locked = true})
local cam = core_camera.getGlobalCameras().scriptedFree
cam:setTarget({pos = vec3(100,0,30), lookAt = vec3(0,0,0), time = 3, ease = 'easeInOut', onDone = function() print('fini') end})
```

## Remarques

- Convention : pitchDeg positif = regarde vers le bas (comme setFreeCameraYawPitchRollDeg). Tangage manuel limité à ±85 degrés.
- locked = true : le script possède la position (pas de touches de déplacement) ; allowLookWhenLocked = true laisse tourner la tête ; driveRot = false : setPose/setTarget ignorent la rotation (l'utilisateur vise pendant qu'un chemin pilote la position).
- dt est plafonné à 0.05 s dans update. Vitesse manuelle par défaut 30 m/s (x5 avec fastSpeedModifier) ; sensibilité de regard 2.2 ; FOV 65.
- setTarget verrouille la caméra pendant l'animation sauf si lockDuring = false.

## Classe `C`

Mode caméra libre scriptée. Champs : pos (vec3), yawDeg, pitchDeg, rollDeg, fov, locked, driveRot, allowLookWhenLocked, allowLook, allowMove, manualSpeed, lookSens, smoothPos, smoothRot, anim.

Le module renvoie un constructeur : `local obj = require("core_cameraModes_scriptedFree")(options)`.

| Méthode | Description | Ligne |
|---|---|---|
| `C:cancelTarget()` | Annule l'animation en cours (la caméra reste à sa position actuelle, sans rappel onDone). | 227 |
| `C:getPose()` | Pose courante. | 215 |
| `C:getQuat()` | Orientation courante en quaternion. | 219 |
| `C:init()` | Valeurs par défaut (voir module). | 78 |
| `C:isAnimating()` | Indique si un setTarget est en cours. | 223 |
| `C:setAllowLookWhenLocked(enabled)` | Autorise le regard à la souris pendant le verrouillage. | 202 |
| `C:setCustomData(data)` | Applique en une fois des réglages (appelé par setByName / setGlobalCameraByName) : pos, yawDeg, pitchDeg, rollDeg, locked, driveRot, allowLookWhenLocked, manualSpeed, lookSens, fov, allowLook, allowMove, smoothPos, smoothRot ; les clés absentes sont inchangées. | 104 |
| `C:setDriveRot(enabled)` | Autorise setPose/setTarget à piloter la rotation. | 198 |
| `C:setFOV(fovDeg)` | Fixe le FOV. | 210 |
| `C:setLocked(locked)` | Verrouille la position (le script la possède, pas de WASD). | 194 |
| `C:setManualSpeed(mps)` | Vitesse de déplacement manuelle. | 206 |
| `C:setPose(pos, yawDeg, pitchDeg, rollDeg)` | Fixe la pose cible (instantanée, ou lissée si smoothPos/smoothRot > 0) et annule une animation en cours. La rotation est ignorée si driveRot est faux. | 163 |
| `C:setPosition(position)` | Place la caméra (et son but de lissage) sans animation ; ignore nil. | 127 |
| `C:setRotation(rotation)` | Oriente la caméra depuis un quaternion. | 135 |
| `C:setSmooth(posSec, rotSec)` | Temps de lissage continu (secondes pour atteindre ~63 %) ; 0 = setPose instantané. | 189 |
| `C:setTarget(opts)` | Vol vers une pose pendant une durée. Sans durée (<= 0), applique la pose immédiatement puis appelle onDone. | 249 |
| `C:setYawPitchRollDeg(yawDeg, pitchDownDeg, rollDeg)` | Fixe les angles (les arguments nil sont inchangés). | 148 |
| `C:update(data)` | Applique l'animation, le regard, le déplacement manuel ou le lissage et écrit data.res.pos / rot / fov. | 380 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/core/cameraModes/scriptedFree.lua`.*

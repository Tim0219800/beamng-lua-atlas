# `core_cameraModes_free`

*Fichier : `lua/ge/extensions/core/cameraModes/free.lua` · VM : Game Engine (GE) · 295 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/core/cameraModes/free")` (fichier sous extensions/ mais pas une extension classique)

Caméra libre (vol libre, caméra globale du groupe « world », masquée, ordre 10). Position et rotation sont pilotées par MoveManager (translation right/left/forward/backward/up/down + axes absolus, rotation yaw/pitch/roll) avec une physique « newtonienne » optionnelle (force, masse, traînée) pour la translation et la rotation ; mode lissé (setSmoothedCam(true), utilisé par smoothFree) plus mou. Mode de translation planaire optionnel qui suit la hauteur du terrain (core_terrain). Un manualzoom (FOV 65 par défaut) gère le zoom. Renvoie un constructeur.

## Exemple

```lua
local cam = core_camera.getCameraDataById ... -- ou directement :
local free = require('core/cameraModes/free')()
free:setPosition(vec3(0, 0, 100))
free:setRotation(quatFromDir(vec3(0, 1, 0)))
free:setFOV(70)
```

## Remarques

- Vitesse de translation : ((speed^2)/30)/40 (speed = data.speed du contexte, triplée avec data.fastSpeedModifier) ; sans physique newtonienne la vitesse vaut cette valeur * 15 m/s.
- Paramètres par défaut non lissé : angularForce 400, angularDrag 16, mass 1, translationForce 250, translationDrag 17 ; lissé : 150, 2.5, 10, 600, 2.
- self.rot est un vec3 (yaw, pitch, roll en radians), pitch limité à ±1.5706. setRotation inverse le signe de y (conversion YXZ).
- La page extraite indique setPlanarTranslationInput(active) mais le code est setPlanarTranslationInput(velocity, active).

## Classe `C`

Mode caméra libre. Champs : pos (vec3), rot (vec3 radians), velocity, angularVelocity, planarVelocity, manualzoom, smoothed, newtonTranslation, newtonRotation, planarTranslation (et planarTranslationScale/Drag/Response/SpeedMultiplier pour le mode planaire), group = 'world', groupOrder.

Le module renvoie un constructeur : `local obj = require("core_cameraModes_free")(options)`.

| Méthode | Description | Ligne |
|---|---|---|
| `C:clearAngularMotion()` | Annule la vitesse angulaire. | 122 |
| `C:clearMotion()` | Annule les vitesses de translation, planaire et angulaire. | 116 |
| `C:clearPlanarTranslationInput()` | Annule l'entrée planaire externe. | 135 |
| `C:clearPlanarTranslationMotion()` | Annule la vitesse planaire et l'entrée planaire externe. | 140 |
| `C:init()` | Définit les valeurs par défaut (isGlobal, group, hidden, canUseVehicleTriggerCrosshair, physique non lissée) puis reset. | 50 |
| `C:listParams(ctxId)` | Réglages exposés à l'UI de contrôle caméra / flux vidéo : speed (2-100 m/s, lu via core_camera.getSpeed), smooth, newtonRot, newtonTrans, fov (10-140). | 92 |
| `C:onCameraChanged(focused)` | Hook : au gain de focus, appelle reset. | 145 |
| `C:reset()` | Annule vitesses et roulis, recrée le zoom manuel à 65 degrés. | 21 |
| `C:setFOV(fovDeg)` | Réinitialise le zoom manuel avec ce FOV. | 77 |
| `C:setNewtonRotation(enabled)` | Active la rotation avec inertie. | 81 |
| `C:setNewtonTranslation(enabled)` | Active la translation avec inertie. | 85 |
| `C:setParam(key, value, ctxId)` | Modifie un réglage de listParams (speed passe par core_camera.setSpeed). | 102 |
| `C:setPlanarTranslationInput(velocity, active)` | Fournit une vitesse planaire externe (par exemple depuis un gamepad) pour l'image ; effacée après chaque update. | 126 |
| `C:setPosition(position)` | Fixe la position de la caméra (la table est conservée par référence). | 73 |
| `C:setRotation(rotation)` | Fixe l'orientation depuis un quaternion. | 110 |
| `C:setSmoothedCam(smoothed)` | Choisit le jeu de paramètres de physique (lissé ou non lissé). | 32 |
| `C:update(data)` | Intègre rotation et translation à partir de MoveManager et écrit data.res.pos / rot, puis applique le zoom. | 237 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/core/cameraModes/free.lua`.*

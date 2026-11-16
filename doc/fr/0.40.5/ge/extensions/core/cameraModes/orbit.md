# `core_cameraModes_orbit`

*Fichier : `lua/ge/extensions/core/cameraModes/orbit.lua` · VM : Game Engine (GE) · 601 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/core/cameraModes/orbit")` (fichier sous extensions/ mais pas une extension classique)

Caméra orbitale de poursuite, mode principal « extérieur » d'un véhicule. Tourne autour du point cible (nœud ref du véhicule + décalage offset, ou point imposé par setRef) à une distance camDist ; rotation souris/clavier (tangage limité à ±85 degrés), zoom (distance entre camMinDist et camMaxDist), lissage, relaxation derrière le véhicule, FOV dynamique selon la vitesse (effet dolly zoom qui conserve la taille apparente de l'arrière du véhicule), décalage de hauteur dynamique et inclinaison dynamique au-dessus de 10 m/s. Utilise le filtre collision pour ne pas traverser les décors. Utilisé aussi par d'autres extensions (couplerCameraModifier). Renvoie un constructeur.

## Exemple

```lua
-- via core_camera, par exemple pour régler la caméra orbit d'un véhicule :
core_camera.setDistance({vehId = id, camName = 'orbit'}, 8)
core_camera.setDefaultDistance({vehId = id, camName = 'orbit'}, 8)
```

## Remarques

- Champs de configuration jbeam : distance (5 par défaut), distanceMin (3), defaultRotation (vec3 degrés, défaut (0, -17, 0)), offset, mode ('ref' par défaut), fov (65), skipFovModifier, refNodes. camMaxDist = 10 * distanceMin (ou 50 si distanceMin est nil, déduit du code : (distanceMin or 5) * 10).
- Réglages lus : cameraOrbitFovModifier, cameraOrbitRelaxation (3), cameraOrbitMaxDynamicFov (35), cameraOrbitMaxDrivingPitch, cameraOrbitMaxDynamicOffset, cameraOrbitSmoothing, multiseat (en multiseat l'inclinaison dynamique est désactivée).
- FOV dynamique : fov = fov + fovModifier + maxDynamicFov * min(1, vitesse/130). Hauteur dynamique : jusqu'à 1.4 * maxDynamicOffset vers 70 m/s.
- La page extraite indique calculateDynamicPitchLimit(targetPos) mais le code prend (data, targetPos) ; setTargetMode(targetMode, camBase) et setRef(center, left, back) ont aussi plus de paramètres que listé.
- Le lissage de lacet est limité à la vitesse maxRot (4.5 rad... valeur 4.5 par seconde en entrée automatique, 1000 si l'utilisateur tourne la caméra) ; onSettingsChanged appelle core_camera.clearInputs() (commentaire du code : « is this really necessary? »).

## Classe `C`

Mode orbit. Champs : camRot (vec3 degrés : x lacet, y tangage), camDist, camMinDist, camMaxDist, defaultDistance, defaultRotation, fov, offset, orbitOffset, mode, target, lockCamera, collision (instance du filtre collision), smoothingEnabled.

Le module renvoie un constructeur : `local obj = require("core_cameraModes_orbit")(options)`.

| Méthode | Description | Ligne |
|---|---|---|
| `C:calculateDynamicPitchLimit(data, targetPos)` | Calcule (une fois, mis en cache dans dynamicPitchLimit) l'inclinaison maximale vers le bas qui garde le bas de l'arrière du véhicule dans le champ de vision. | 53 |
| `C:deserialize(s)` | Restaure l'état de serialize et garde la rotation restaurée. | 153 |
| `C:init()` | Crée l'état, le filtre collision, puis appelle onVehicleCameraConfigChanged, onSettingsChanged et reset. | 27 |
| `C:listParams()` | Réglages exposés à l'UI de contrôle caméra : dist, smooth, fov. | 169 |
| `C:onSettingsChanged()` | Hook : relit les réglages cameraOrbit* et transmet au filtre collision. | 115 |
| `C:onVehicleCameraConfigChanged()` | Hook : recharge distances, rotation par défaut, mode, FOV et réinitialise l'inclinaison dynamique. | 91 |
| `C:onVehicleSwitched()` | Hook : transmet au filtre collision. | 127 |
| `C:reset()` | Replanifie le recentrage de la caméra (3 images) et réinitialise le filtre collision ; sans effet si un recentrage est déjà en cours. | 131 |
| `C:serialize()` | État pour les vues flux vidéo (core_camera get/setContextCameraState) : rotation, distance, FOV. | 145 |
| `C:setDefaultDistance(d)` | Définit la distance par défaut (utilisée au recentrage). | 210 |
| `C:setDefaultRotation(rot)` | Définit la rotation par défaut au recentrage. | 222 |
| `C:setDistance(d)` | Définit la distance courante. | 214 |
| `C:setFOV(fov)` | Fixe le FOV de base. | 164 |
| `C:setMaxDistance(d)` | Définit la distance maximale de zoom. | 218 |
| `C:setOffset(v)` | Définit orbitOffset, décalage monde ajouté à la position de caméra. | 183 |
| `C:setParam(key, value)` | Modifie dist, smooth ou fov. | 177 |
| `C:setRef(center, left, back)` | Impose le point cible et le repère en coordonnées monde (center nil = retour au suivi des nœuds du véhicule ; un changement déclenche reset). | 196 |
| `C:setRefNodes(centerNodeID, leftNodeID, backNodeID, dynamicFovRearNodeID)` | Définit les nœuds de référence du véhicule et le nœud arrière pour le FOV dynamique. | 187 |
| `C:setRotation(rot)` | Fixe la rotation d'orbite. | 139 |
| `C:setSkipFovModifier(skip)` | Désactive le FOV dynamique selon la vitesse. | 226 |
| `C:setTargetMode(targetMode, camBase)` | Choisit le mode de cible ('ref' par défaut) et la base de décalage de caméra. | 205 |
| `C:update(data)` | Calcule la pose de l'orbite et écrit data.res (pos, rot, fov, targetPos, collisionCompatible = true), puis applique le filtre collision. | 248 |

## Appels vers le moteur (C++)

- `be:` `getObjectOOBBCenterXYZ`, `getObjectOOBBHalfAxisXYZ`, `getObjectOOBBHalfExtentsXYZ`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/core/cameraModes/orbit.lua`.*

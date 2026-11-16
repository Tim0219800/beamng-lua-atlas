# `core_cameraModes_chase`

*Fichier : `lua/ge/extensions/core/cameraModes/chase.lua` · VM : Game Engine (GE) · 275 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/core/cameraModes/chase")` (fichier sous extensions/ mais pas une extension classique)

Mode de caméra 'chase' (poursuite) lié au véhicule : la caméra se place derrière le véhicule, à distance fixe (par défaut 5 m, FOV 65), regarde la cible et suit son cap avec un lissage ; elle bascule automatiquement devant le véhicule quand il recule. Choix du mode : camera.lua charge chaque fichier de cameraModes et crée, pour chaque véhicule, une instance par mode (ici sous le nom 'chase'), configurée par la section jbeam de caméra (cameraChase est converti en 'chase' par jbeam/sections/camera.lua). 'chase' figure dans la liste de configuration par défaut {orbit, driver, onboard.hood, external, relative, chase, droneChase} mais disabledByDefault = true : elle n'est pas dans le cycle de touches tant que l'utilisateur ne l'active pas dans Options > Caméras ; on peut aussi l'appeler explicitement via core_camera.setByName(player, 'chase'). Le module renvoie un constructeur : require('core/cameraModes/chase')(options).

## Exemple

```lua
core_camera.setByName(0, 'chase', true)
```

## Remarques

- Contrôles : yaw/pitch (relatifs ou axes) ne tournent pas librement : au-delà du seuil 0.05 la caméra saute à des positions fixes (gauche/droite à ±90°, derrière à 180°, plus haut de 30° en pitch) ; le zoom bascule entre la distance min (distanceMin, 3 m par défaut), la distance par défaut (distance, 5 m par défaut) et le double de la distance.
- Options de configuration jbeam utilisées : defaultRotation (vec3 degrés ; son y est inversé, défaut (0,-17,0)), distance, distanceMin, mode ('ref' par défaut ou 'center' qui vise le centre de la boîte du véhicule), fov, offset (vec3, mis à l'échelle par les longueurs des axes du véhicule).
- Réglages utilisateur : cameraOrbitRelaxation (défaut 3, lue mais non utilisée dans update) et cameraChaseRollSmoothing (défaut 1 ; 0 ou presque désactive le roulis et garde la caméra à l'horizontale).
- La caméra se retourne devant le véhicule quand la vitesse avant lissée dépasse -1.5 m/s en marche arrière (et revient derrière au-delà de +1.5 m/s).
- update met data.res.collisionCompatible = true et délègue à cameraModes/collision pour éviter que la caméra traverse le décor ; si les noeuds de référence sont confondus (longueur nulle) il renvoie false avec une orientation par défaut.
- setRefNodes a pour vraie signature (centerNodeID, leftNodeID, backNodeID) (l'index automatique en affiche deux).

## Classe `C`

Instance du mode 'chase' pour un véhicule. Champs principaux : defaultRotation, camRot, distance, defaultDistance, camMinDist, camDist, mode, fov, offset, refNodes {ref,left,back}, forwardLooking, rollSmoothing, collision.

Le module renvoie un constructeur : `local obj = require("core_cameraModes_chase")(options)`.

| Méthode | Description | Ligne |
|---|---|---|
| `C:init()` | Initialise les lisseurs, l'état de suivi, le module de collision et applique la configuration, les réglages et un reset. Appelé par le constructeur. | 13 |
| `C:listParams()` | Renvoie la liste des réglages ajustables pour l'UI de contrôle de caméra / flux vidéo : uniquement le FOV (10 à 140 degrés, pas 1, défaut 65) car la distance est recalculée à chaque frame. | 62 |
| `C:mouseLocked(locked)` | Hook appelé quand la souris est verrouillée ou libérée : à la libération, remet à zéro l'entrée relative accumulée (relYaw, relPitch). | 261 |
| `C:onSettingsChanged()` | Relit les réglages (cameraOrbitRelaxation, cameraChaseRollSmoothing), prévient le module de collision et fait un reset. Appelé quand les réglages changent. | 54 |
| `C:onVehicleCameraConfigChanged()` | Applique la configuration jbeam de la caméra : defaultRotation (y inversé, défaut (0,-17,0)), distances, mode ('ref' par défaut), FOV (65 par défaut), offset. Appelé à la création et quand les données jbeam du véhicule changent. | 35 |
| `C:reset()` | Remet la caméra derrière le véhicule (rotation par défaut, x à 0, regard vers l'avant) et force un recalage au prochain frame. | 72 |
| `C:setParam(key, value)` | Applique un réglage ajustable. Seule la clé 'fov' est gérée. | 68 |
| `C:setRefNodes(centerNodeID, leftNodeID, backNodeID)` | Mémorise les noeuds de référence du véhicule (centre, gauche, arrière), appelé par camera.lua à la création de la caméra. | 254 |
| `C:update(data)` | Calcul par frame, appelé par cameraUpdate quand ce mode est la caméra focalisée : lit les entrées MoveManager, calcule la direction et le haut du véhicule depuis les noeuds de référence, positionne la caméra derrière la cible (lissage de rotation et de distance) et écrit data.res.pos, rot, fov, targetPos, puis applique la collision. | 82 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/core/cameraModes/chase.lua`.*

# `core_cameraModes_path`

*Fichier : `lua/ge/extensions/core/cameraModes/path.lua` · VM : Game Engine (GE) · 582 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/core/cameraModes/path")` (fichier sous extensions/ mais pas une extension classique)

Caméra qui suit un chemin de caméra (core_paths : marqueurs avec position, rotation, FOV, temps). Interpole la position par Catmull-Rom chordal avec temps normalisé (Steffen monotone), la rotation par Catmull-Rom centripète (nlerp) et le FOV/nearClip par Steffen. Gère : coupures (marker.cut), marqueurs attachés au véhicule (attachToVehicle, poses en repère véhicule), suivi du véhicule (trackPosition, avec décalage trackOffset), courbes de mouvement Bézier par marqueur (motion*, rotMotion*, yaw/pitch/rollMotion*), départs/arrivées en mouvement (movingStart/movingEnd), zoom manuel (path.manualFov), bouclage (path.looped) et chemins liés à un replay (path.replay, vitesse bullettime). Renvoie un constructeur.

## Exemple

```lua
-- le chemin vient de core_paths ; customData peut fournir getNextPath(), onNextControlPoint(n, total), finishedPath(), reset(), useJsonVersion, useDtReal, offset, path
core_camera.setByName(0, 'path', false, {getNextPath = function() return 'monChemin' end})
```

## Remarques

- Deux modes : useJsonVersion = true (customData.getNextPath renvoie la table du chemin, temps absolus par marqueur) ; sinon le chemin est cherché par nom (core_paths.getPath(pathName)) et marker.time est la durée jusqu'au marqueur suivant (cumulée).
- Ne fait rien s'il y a moins de 2 marqueurs. Utilise data.dtSim (ou dtReal si customData.useDtReal).
- Ensemble des champs de marqueur lus : pos, rot, fov, nearClip, time, cut, attachToVehicle, trackPosition, trackOffset{x,y,z}, movingStart, movingEnd, positionSmooth, motion*(Out|In|OutTime|InTime), bullettime.
- Le décalage de suivi (tracking offset) vient des marqueurs sinon, en secours, de editor_camPathEditor ou d'une extension pathCameraEditor.getTrackingOffset().
- Un TODO du code signale que la rotation avec movingEnd n'a pas le bon timing.
- Les signatures de la page extraite sont inexactes : getTimeToNext(path, index) et getGlobalTime(path, index, looped).
- update modifie les quaternions des marqueurs (inversion de signe) pour éviter les sauts d'interpolation.

## Classe `C`

Mode chemin. Champs : ctrlPoint, camT (temps courant en s), customData, path, pathName, fovOffset.

Le module renvoie un constructeur : `local obj = require("core_cameraModes_path")(options)`.

| Méthode | Description | Ligne |
|---|---|---|
| `C:getGlobalTime(path, index, looped)` | Temps absolu du marqueur index depuis le début du chemin. | 174 |
| `C:getTimeToNext(path, index)` | Durée entre le marqueur index et le suivant (dernier marqueur : durée de boucle ou 2 s en mode JSON). | 165 |
| `C:init()` | isGlobal = true, hidden = true, état initial. | 16 |
| `C:reset()` | Remet temps, point de contrôle, décalage FOV et noms de chemin à zéro (appelle customData:reset s'il existe). | 560 |
| `C:setCustomData(data)` | Réinitialise le mode et fixe les données du parcours ; temps de départ = customData.offset. Si le chemin a un replay, le charge (ou l'ignore s'il n'existe pas). | 545 |
| `C:update(data)` | Avance le temps, interpole la caméra et écrit data.res (pos, rot, fov, nearClip), appelle les callbacks de customData et gère la fin/boucle du chemin. | 221 |

## Appels vers le moteur (C++)

- `FS:` `fileExists`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/core/cameraModes/path.lua`.*

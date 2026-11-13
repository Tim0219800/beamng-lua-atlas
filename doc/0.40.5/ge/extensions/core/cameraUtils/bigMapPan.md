# `core_cameraUtils_bigMapPan`

*Fichier : `lua/ge/extensions/core/cameraUtils/bigMapPan.lua` · VM : Game Engine (GE) · 62 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `core_cameraUtils_bigMapPan` : `extensions.load("core_cameraUtils_bigMapPan")`, puis la globale `core_cameraUtils_bigMapPan`

Aide partagée de déplacement et de zoom fluides pour les modes de caméra de la grande carte (bigMap / bigMapOrtho). Placée hors de cameraModes/ car les fichiers de ce dossier sont chargés automatiquement comme constructeurs de caméra. Les fonctions modifient directement les champs du mode de caméra passé en paramètre (cam).

## Exemple

```lua
local pan = core_cameraUtils_bigMapPan
pan.setTarget(cam, vec3(100, 200, 0), cam.camToLookAtPoint)
pan.zoomToFactor(cam, 0.5)
-- à chaque image dans cam:update :
pan.update(cam, data.dt, userMoving)
```

## Remarques

- Champs lus/écrits sur cam : bigMapCamPosition (vec3), panTarget, zoomTarget, fovMin, fovMax, manualzoom.fov.
- Le lissage utilise t = clamp(dt*6, 0, 1) ; la cible est supprimée quand l'écart est inférieur à 0.1 m (carré < 0.01) pour le déplacement, ou 0.01 pour le zoom (fov).
- update lit MoveManager.zoomIn / zoomOut : un zoom manuel annule zoomTarget ; un déplacement utilisateur annule panTarget et zoomTarget.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `core_cameraUtils_bigMapPan.setTarget(cam, worldPos, lookAtOffset)` | Fixe cam.panTarget pour centrer la vue sur worldPos : x,y = worldPos moins le décalage ; z = celui de cam.bigMapCamPosition (sinon celui de worldPos). Ne fait rien si worldPos est nil. | 11 |
| `core_cameraUtils_bigMapPan.update(cam, dt, userMoving)` | À appeler à chaque image : rapproche manualzoom.fov de zoomTarget et bigMapCamPosition (x,y) de panTarget, et annule les cibles si l'utilisateur bouge ou zoome. | 25 |
| `core_cameraUtils_bigMapPan.zoomToFactor(cam, factor)` | Fixe cam.zoomTarget par interpolation entre fovMax (facteur 0, dézoomé) et fovMin (facteur 1, zoomé). | 19 |

### Détail des paramètres

#### `core_cameraUtils_bigMapPan.setTarget(cam, worldPos, lookAtOffset)`

Fixe cam.panTarget pour centrer la vue sur worldPos : x,y = worldPos moins le décalage ; z = celui de cam.bigMapCamPosition (sinon celui de worldPos). Ne fait rien si worldPos est nil.

- `cam` (*table*) : mode de caméra appelant
- `worldPos` (*vec3|nil*) : point du monde à centrer
- `lookAtOffset` (*vec3|nil*) : vecteur caméra -> point visé (camToLookAtPoint) du mode appelant ; (0,0,0) par défaut

#### `core_cameraUtils_bigMapPan.update(cam, dt, userMoving)`

À appeler à chaque image : rapproche manualzoom.fov de zoomTarget et bigMapCamPosition (x,y) de panTarget, et annule les cibles si l'utilisateur bouge ou zoome.

- `cam` (*table*) : mode de caméra appelant
- `dt` (*number*) : durée de l'image en secondes
- `userMoving` (*boolean*) : vrai si l'utilisateur déplace la caméra (annule les cibles)

#### `core_cameraUtils_bigMapPan.zoomToFactor(cam, factor)`

Fixe cam.zoomTarget par interpolation entre fovMax (facteur 0, dézoomé) et fovMin (facteur 1, zoomé).

- `cam` (*table*) : mode de caméra appelant
- `factor` (*number*) : 0 = dézoomé (fovMax), 1 = zoomé (fovMin) ; borné à [0,1], non numérique = 0

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/core/cameraUtils/bigMapPan.lua`.*

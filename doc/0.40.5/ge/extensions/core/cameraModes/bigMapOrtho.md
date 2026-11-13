# `core_cameraModes_bigMapOrtho`

*Fichier : `lua/ge/extensions/core/cameraModes/bigMapOrtho.lua` · VM : Game Engine (GE) · 248 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/core/cameraModes/bigMapOrtho")` (fichier sous extensions/ mais pas une extension classique)

Caméra globale 'bigMapOrtho' (isGlobal, hidden) : variante orthographique de la caméra de grande carte. Même logique que bigMap (zoom, déplacement, glisser de souris, recentrage animé, limites de carte), mais la vue est orthographique via core_orthoCamera : data.res.fov est utilisé comme taille de la vue ortho (fovMin 50, fovMax 1000, puis fovMax = taille moyenne de la carte). Choix du mode : freeroam/bigMapMode.lua choisit le nom 'bigMapOrtho' si useOrthoCamera est vrai (constante locale à false dans cette version : la caméra n'est donc normalement jamais activée) et l'active avec core_camera.setByName(0, 'bigMapOrtho', false, {initialCamData = {...}}). Elle n'apparaît pas dans le cycle de caméras. Le module renvoie un constructeur : require('core/cameraModes/bigMapOrtho')(options).

## Exemple

```lua
core_camera.setByName(0, 'bigMapOrtho', false, {initialCamData = {pos = vec3(0,0,500), rot = quatFromDir(vec3(0,0,-1), vec3(0,1,0))}})
```

## Remarques

- setCustomData exige mapBoundaries (self.mapBoundaries:getExtents()) et active core_orthoCamera.enable(true, {size = tailleMoyenneCarte}).
- À la désactivation (onCameraChanged(false)), core_orthoCamera.enable(false) est appelé.
- update règle core_orthoCamera.setOptions({size = fov, nearClip, farClip}) : nearClip = altitude * lerp(0.5, 0.6, 1 - zoomRelatif), farClip = altitude * 5.
- Différence avec bigMap : pas de data.res.nearClip, pas de fond perspective ; le zoom de palier appelle toujours freeroam_bigMapMode.updateMergeRadius.
- Le même défaut de parenthèses que bigMap existe dans setCustomData (camLookAtPoint - initialCamData.pos or ...).
- L'objet n'est pas exposé sous un autre nom que celui du fichier (bigMapOrtho).

## Classe `C`

Instance de la caméra bigMapOrtho. Champs : fovMin (50), fovMax (1000, remplacé par la taille de carte), angle, rotAngle, posTransitionTime (2.4), movementSpeed (20), nearClipValue, drawIcons, initialCamData, mapBoundaries, manualzoom, bigMapCamPosition, bigMapCamRotation.

Le module renvoie un constructeur : `local obj = require("core_cameraModes_bigMapOrtho")(options)`.

| Méthode | Description | Ligne |
|---|---|---|
| `C:getZoomStage(fov)` | Niveau de zoom relatif en trois étages : 0, 0.5 ou 1. | 108 |
| `C:init()` | Initialise les paramètres par défaut, marque la caméra globale et cachée, crée le zoom manuel. | 19 |
| `C:onCameraChanged(focused)` | Gain ou perte de focus : distance de rendu du véhicule portée à 5000 (puis restaurée) ; à la perte de focus, désactive la caméra orthographique (core_orthoCamera.enable(false)) et abandonne le glisser. | 47 |
| `C:onDeserialized()` | Après rechargement Lua : init puis reconstruit mapBoundaries en Box3F. | 230 |
| `C:onMouseButton(buttonDown, mouseDragging)` | Début/fin du glisser de carte. | 215 |
| `C:onSerialize()` | Convertit mapBoundaries (Box3F) en table avant rechargement Lua. | 224 |
| `C:panToWorldPos(worldPos)` | Recentre en douceur sur une position monde (bigMapPan.setTarget). | 116 |
| `C:reset()` | Remet le zoom manuel à zéro. | 39 |
| `C:setCustomData(data)` | Reçoit {initialCamData = {pos, rot}}, calcule le point regardé, active la caméra orthographique à la taille moyenne de la carte et règle fovMax. | 90 |
| `C:setLevelProperties()` | Réinitialise (appelle init) pour appliquer les propriétés du niveau. | 43 |
| `C:update(data)` | Calcul par frame (comme bigMap) puis règle les options de la caméra ortho (size, nearClip, farClip) via core_orthoCamera.setOptions. | 125 |
| `C:zoom(value)` | Applique un cran de zoom (molette) avec accélération et mémorise le point de sol sous la souris. | 76 |
| `C:zoomToFactor(factor)` | Zoome en douceur vers un facteur donné. | 120 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/core/cameraModes/bigMapOrtho.lua`.*

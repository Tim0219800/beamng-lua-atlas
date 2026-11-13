# `core_cameraModes_bigMap`

*Fichier : `lua/ge/extensions/core/cameraModes/bigMap.lua` · VM : Game Engine (GE) · 236 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/core/cameraModes/bigMap")` (fichier sous extensions/ mais pas une extension classique)

Caméra globale 'bigMap' (isGlobal, hidden) : vue de dessus en perspective de la grande carte (mode 'BigMap' du jeu libre). Elle gère le zoom (par FOV via manualzoom, de fovMin à fovMax), le déplacement au clavier et le glisser de souris, le recentrage animé (bigMapPan) et garde la caméra dans les limites de la carte (mapBoundaries). Choix du mode : freeroam_bigMapMode (extension freeroam/bigMapMode.lua) la sélectionne avec core_camera.setByName(0, 'bigMap', false, {initialCamData = {pos, rot}}) à l'ouverture de la carte et revient à la caméra précédente à la fermeture ; elle n'apparaît pas dans le cycle de caméras (hidden). Une variante orthographique, 'bigMapOrtho', existe mais bigMapMode.lua a useOrthoCamera = false. Le module renvoie un constructeur : require('core/cameraModes/bigMap')(options).

## Exemple

```lua
-- Géré par freeroam_bigMapMode. Accès à l'instance :
local cam = core_camera.getGlobalCameras().bigMap
cam:panToWorldPos(vec3(100, 200, 0))
```

## Remarques

- setCustomData(data) doit recevoir {initialCamData = {pos, rot}} (position et rotation de départ). Il calcule le point regardé sur le plan du terrain.
- bigMapMode.lua écrase fovMin selon la taille de la carte (commentaire du code) et fournit mapBoundaries (Box3F) ; sans mapBoundaries, update plante (self.mapBoundaries:getExtents()).
- Pendant que la caméra est active, la distance de rendu du véhicule du joueur est portée à 5000 m (et restaurée ensuite).
- Zoom : C:zoom(value) accumule un facteur croissant (stopZooming += 0.1 par appel, puis décroît) et appelle core_camera.cameraZoom ; le zoom se centre sur la position de la souris. Le changement de palier de zoom (0, 0.5, 1 selon fov) appelle freeroam_bigMapMode.updateMergeRadius.
- Incohérence : setCustomData(nil) puis `camLookAtPoint - self.initialCamData.pos or ...` n'a pas de parenthèses : l'opérateur or ne protège pas l'indexation de initialCamData nil ; ne pas appeler avec data sans initialCamData.pos.
- onSerialize/onDeserialized convertissent mapBoundaries entre Box3F et table pour survivre à un rechargement Lua.

## Classe `C`

Instance de la caméra bigMap. Champs : fovMin (25), fovMax (42), angle (53), rotAngle (25), posTransitionTime (2.4), transitionActive, movementSpeed (20), nearClipValue (100), drawIcons, initialCamData, mapBoundaries (Box3F), manualzoom, bigMapCamPosition, bigMapCamRotation.

Le module renvoie un constructeur : `local obj = require("core_cameraModes_bigMap")(options)`.

| Méthode | Description | Ligne |
|---|---|---|
| `C:getZoomStage(fov)` | Niveau de zoom relatif en trois étages d'après le FOV : 0 (proche, <= 33 %), 0.5, 1 (large). | 102 |
| `C:init()` | Initialise les paramètres par défaut, marque la caméra globale et cachée, crée le zoom manuel (de fovMax vers fovMin). | 18 |
| `C:onCameraChanged(focused)` | Appelée par camera.lua quand la caméra gagne ou perd le focus : à l'activation, mémorise et porte la distance de rendu du véhicule à 5000 ; à la désactivation, restaure la distance et abandonne un éventuel glisser de souris. | 46 |
| `C:onDeserialized()` | Après rechargement Lua : réinitialise (init) et reconstruit mapBoundaries en Box3F. | 218 |
| `C:onMouseButton(buttonDown, mouseDragging)` | Appelée à l'appui/relâchement du bouton de souris : démarre ou arrête le glisser de la carte. | 203 |
| `C:onSerialize()` | Prépare la sérialisation avant rechargement Lua : convertit mapBoundaries (Box3F) en table. | 212 |
| `C:panToWorldPos(worldPos)` | Recentre en douceur la caméra pour que la position monde (au sol) soit au centre de l'écran (bigMapPan.setTarget). | 110 |
| `C:reset()` | Remet le zoom manuel à zéro. | 38 |
| `C:setCustomData(data)` | Reçoit les données d'activation {initialCamData = {pos, rot}} de setByName, calcule le vecteur caméra vers le point regardé et prépare le zoom. | 88 |
| `C:setLevelProperties()` | Réinitialise (appelle init) pour appliquer les propriétés du niveau (taille de carte). | 42 |
| `C:update(data)` | Calcul par frame : applique zoom, glisser de souris, déplacement clavier (MoveManager.forward/backward/left/right), recentrage animé, limites de carte, puis écrit data.res.pos, rot, fov et nearClip (100). | 118 |
| `C:zoom(value)` | Applique un cran de zoom (molette) : accélère progressivement et mémorise le point de sol sous la souris pour garder le curseur en place. | 74 |
| `C:zoomToFactor(factor)` | Zoome en douceur vers un facteur donné (bigMapPan.zoomToFactor). | 114 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/core/cameraModes/bigMap.lua`.*

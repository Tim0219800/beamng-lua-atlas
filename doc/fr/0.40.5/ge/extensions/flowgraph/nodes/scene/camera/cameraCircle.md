# `flowgraph_nodes_scene_camera_cameraCircle`

*Fichier : `lua/ge/extensions/flowgraph/nodes/scene/camera/cameraCircle.lua` · VM : Game Engine (GE) · 90 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/scene/camera/cameraCircle")` (fichier sous extensions/ mais pas une extension classique)

Noeud flowgraph 'Camera Auto Circle' (categorie once_p_duration). Fait tourner la camera libre en cercle autour d'un vehicule (vehId, defaut vehicule joueur) ou d'un point (centerPos) : rayon 'radius' (5 par defaut), hauteur 'height', vitesse angulaire 'speed' en degres/s (10 par defaut, negatif pour le sens inverse), angle de depart 'startAngle' (relatif a l'orientation du vehicule si vehId est donne), 'snapHeight' pour suivre le relief. La camera regarde toujours le centre.

## Remarques

- L'angle avance avec mgr.dtReal (temps reel, pas simulation).
- Le centre suit le centre de la boite englobante (OOBB) du vehicule a chaque frame.

## Classe `C`

Classe du noeud flowgraph (creee par _flowgraph_createNode(C)). Les methodes sont appelees par le gestionnaire flowgraph ou l'editeur.

| Méthode | Description | Ligne |
|---|---|---|
| `C:_executionStarted()` | Appelle onNodeReset. | 28 |
| `C:onNodeReset()` | Remet centre, decalage, position camera et angle a zero. | 32 |
| `C:work()` | Calcule le centre, la position sur le cercle, la hauteur (avec lissage 5 % si snapHeight), oriente la camera vers le centre (core_camera.setPosRot) puis incremente l'angle de dtReal * speed. | 54 |
| `C:workOnce()` | Passe en camera libre et fixe l'angle de depart (+180 degres, plus l'orientation du vehicule si vehId). | 39 |

## Appels vers le moteur (C++)

- `be:` `getPlayerVehicleID`, `getSurfaceHeightBelow`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/scene/camera/cameraCircle.lua`.*

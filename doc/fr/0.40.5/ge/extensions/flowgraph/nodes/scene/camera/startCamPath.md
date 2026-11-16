# `flowgraph_nodes_scene_camera_startCamPath`

*Fichier : `lua/ge/extensions/flowgraph/nodes/scene/camera/startCamPath.lua` · VM : Game Engine (GE) · 55 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/scene/camera/startCamPath")` (fichier sous extensions/ mais pas une extension classique)

Noeud flowgraph « Start Cam Path » (once_instant). Fait suivre a la camera le chemin d'un objet CameraPath (fichier .camPath.json). Entrees : pathName (string), loop (bool). Sorties : activated (flow impulsion, une seule frame) et id (number) du chemin. Utilise le module flowgraph camera (self.mgr.modules.camera).

## Classe `C`

Classe du noeud flowgraph (retournee par _flowgraph_createNode(C)). Les methodes sont appelees par le gestionnaire flowgraph ou l'editeur.

| Méthode | Description | Ligne |
|---|---|---|
| `C:drawMiddle(builder, style)` | Zone centrale du noeud (rien d'affiche). | 49 |
| `C:init()` | Rien a initialiser. | 24 |
| `C:postInit()` | Restreint le pin pathName au selecteur de fichiers « Camera Path Files » (.camPath.json). | 27 |
| `C:work()` | Retombe activated a false a la frame suivant l'activation (flag activatedFlag). | 41 |
| `C:workOnce()` | Trouve le chemin (modules.camera:findPath), le demarre (startPath avec loop), ecrit id et leve l'impulsion activated. | 33 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/scene/camera/startCamPath.lua`.*

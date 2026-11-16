# `flowgraph_nodes_scene_camera_cameraPath`

*Fichier : `lua/ge/extensions/flowgraph/nodes/scene/camera/cameraPath.lua` · VM : Game Engine (GE) · 95 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/scene/camera/cameraPath")` (fichier sous extensions/ mais pas une extension classique)

Noeud flowgraph 'Simple Cam Path' (categorie once_f_duration, fichier cameraPath). Lance une trajectoire de camera (fichier .camPath.json designe par 'pathName') via le module camera du gestionnaire, avec option 'loop'. Sorties : id de la trajectoire, impulsion 'activated' au demarrage, 'inactive' si la trajectoire n'est plus active, 'duration'. L'etat de duree passe a 'finished' quand la trajectoire est complete.

## Remarques

- legacyPins renvoie vers 'complete' et 'flow', des pins qui n'existent pas dans le schema actuel.

## Classe `C`

Classe du noeud flowgraph (creee par _flowgraph_createNode(C)). Les methodes sont appelees par le gestionnaire flowgraph ou l'editeur.

| Méthode | Description | Ligne |
|---|---|---|
| `C:_executionStarted()` | Remet activatedFlag et l'etat de duree 'inactive'. | 45 |
| `C:_onDeserialized(data)` | Migre l'ancien champ data.loop vers le pin code en dur 'loop'. | 89 |
| `C:drawMiddle(builder, style)` | Dessine le milieu du noeud (vide). | 86 |
| `C:init()` | Vide. | 36 |
| `C:onNodeReset()` | Meme remise a zero. | 50 |
| `C:postInit()` | Restreint le pin pathName aux fichiers '.camPath.json'. | 39 |
| `C:work()` | Pendant l'etat started : gere l'impulsion activated, met inactive/duration selon que la trajectoire est active, passe a 'finished' quand isPathComplete. | 64 |
| `C:workOnce()` | Trouve la trajectoire (camera:findPath), la demarre (startPath), ecrit id, activated=true et passe a l'etat 'started'. | 55 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/scene/camera/cameraPath.lua`.*

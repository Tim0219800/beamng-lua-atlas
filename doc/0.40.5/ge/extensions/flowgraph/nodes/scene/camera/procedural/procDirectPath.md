# `flowgraph_nodes_scene_camera_procedural_procDirectPath`

*Fichier : `lua/ge/extensions/flowgraph/nodes/scene/camera/procedural/procDirectPath.lua` · VM : Game Engine (GE) · 118 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/scene/camera/procedural/procDirectPath")` (fichier sous extensions/ mais pas une extension classique)

Noeud flowgraph 'Procedural Direct Campath' (categorie once_p_duration). Genere une trajectoire de camera qui survole le trajet direct de 'from' a 'to' (survol depuis derriere le depart, montee a 180 m, puis regard vers l'arrivee avec zoom FOV 50 puis 30), de duree 'duration' (14 s par defaut) ; en option 'loop' ajoute des cles de retour. Le chemin est enregistre via camera:addCustomPath et son nom sort sur 'pathName'.

## Remarques

- Les temps des cles sont exprimes en quatorziemes de 'duration'.
- La variable locale 'fLen' (longueur bornee entre 300 et 1000) est calculee mais jamais utilisee, et 'mid' est calcule mais seul 'mid2' est inclus dans la trajectoire.
- Le commentaire du code indique que la categorie devrait etre f_duration.

## Classe `C`

Classe du noeud flowgraph (creee par _flowgraph_createNode(C)). Les methodes sont appelees par le gestionnaire flowgraph ou l'editeur.

| Méthode | Description | Ligne |
|---|---|---|
| `C:workOnce()` | Calcule les marqueurs (from, from2, mid2, to, to2 et, si loop, out/back/back2) en fonction de la direction horizontale from vers to, puis cree le chemin et ecrit pathName. | 24 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/scene/camera/procedural/procDirectPath.lua`.*

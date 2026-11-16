# `flowgraph_nodes_scene_camera_setCameraPosition`

*Fichier : `lua/ge/extensions/flowgraph/nodes/scene/camera/setCameraPosition.lua` · VM : Game Engine (GE) · 110 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/scene/camera/setCameraPosition")` (fichier sous extensions/ mais pas une extension classique)

Noeud flowgraph « Set Camera Position » (repeat_instant). Deplace la camera libre a une position, saisie dans le noeud (mode 'custom') ou fournie par un pin vec3 'pos' (mode 'from Pin', pin cree dynamiquement). La rotation courante de la camera est conservee. Le pin de sortie value (vec3) renvoie la position appliquee.

## Remarques

- Le pin 'value' est declare en direction 'out' (vec3) alors que la description dit « position to set camera to » : c'est bien une sortie qui reflete la position appliquee.
- Les valeurs vec3 sont des tables {x,y,z}.

## Classe `C`

Classe du noeud flowgraph (retournee par _flowgraph_createNode(C)). Les methodes sont appelees par le gestionnaire flowgraph ou l'editeur.

| Méthode | Description | Ligne |
|---|---|---|
| `C:SetCamera()` | Appelle core_camera.setPosRot(0, ...) avec la position du noeud et la rotation courante de la camera (core_camera.getQuat). | 88 |
| `C:_onDeserialized(nodeData)` | Restaure position et mode ; recree le pin 'pos' en mode 'from Pin'. | 101 |
| `C:_onSerialize(res)` | Sauvegarde la position (res.ppos) et le mode (res.mode). | 95 |
| `C:drawCustomProperties()` | Panneau de proprietes de l'editeur : choix du mode, champs x/y/z, boutons « Set from camera » et « Preview ». Cree ou supprime le pin 'pos' selon le mode. Renvoie une chaine de raison si une modification a eu lieu. | 27 |
| `C:drawMiddle(builder, style)` | Zone centrale du noeud dans l'editeur (rien d'affiche). | 84 |
| `C:init()` | Initialise la position a (0,0,0), le mode a 'custom' et la liste des modes {'custom','from Pin'}. | 21 |
| `C:work()` | Passe en camera libre si besoin, lit la position du pin 'pos' en mode 'from Pin', applique la position (SetCamera) et ecrit le pin value. | 73 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/scene/camera/setCameraPosition.lua`.*

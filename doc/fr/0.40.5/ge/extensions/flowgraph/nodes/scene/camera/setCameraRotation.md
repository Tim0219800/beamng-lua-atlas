# `flowgraph_nodes_scene_camera_setCameraRotation`

*Fichier : `lua/ge/extensions/flowgraph/nodes/scene/camera/setCameraRotation.lua` · VM : Game Engine (GE) · 111 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/scene/camera/setCameraRotation")` (fichier sous extensions/ mais pas une extension classique)

Noeud flowgraph « Set Camera Rotation » (repeat_instant). Applique une rotation (quaternion) a la camera libre, saisie dans le noeud (mode 'custom') ou fournie par un pin quat 'rot' (mode 'from Pin'). La position courante de la camera est conservee. Le pin de sortie value (quat) renvoie la rotation appliquee.

## Remarques

- La rotation par defaut quat(0,0,0,0) n'est pas un quaternion valide (non normalise) : elle n'est normalisee que si l'utilisateur edite les champs.

## Classe `C`

Classe du noeud flowgraph (retournee par _flowgraph_createNode(C)). Les methodes sont appelees par le gestionnaire flowgraph ou l'editeur.

| Méthode | Description | Ligne |
|---|---|---|
| `C:SetCamera()` | Appelle core_camera.setPosRot(0, ...) avec la position courante de la camera et la rotation du noeud. | 88 |
| `C:_onDeserialized(nodeData)` | Restaure rotation et mode ; recree le pin 'rot' si besoin. | 102 |
| `C:_onSerialize(res)` | Sauvegarde la rotation (res.rot) et le mode. | 97 |
| `C:drawCustomProperties()` | Panneau de proprietes de l'editeur : choix du mode, champs x/y/z/w (normalises), boutons « Set from camera » et « Preview ». Cree/supprime le pin 'rot'. | 28 |
| `C:drawMiddle(builder, style)` | Zone centrale du noeud (rien d'affiche). | 84 |
| `C:init()` | Initialise la rotation a quat(0,0,0,0), le mode a 'custom' et la liste des modes. | 22 |
| `C:work()` | Passe en camera libre si besoin, lit le pin 'rot' en mode 'from Pin', applique la rotation (SetCamera) et ecrit le pin value. | 73 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/scene/camera/setCameraRotation.lua`.*

# `editor_crawlEditor_waypoints`

*Fichier : `lua/ge/extensions/editor/crawlEditor/waypoints.lua` · VM : Game Engine (GE) · 636 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/editor/crawlEditor/waypoints")` (fichier sous extensions/ mais pas une extension classique)

Sous-outil « Pathnodes » (points de passage) de l'éditeur Crawl. Le module renvoie un constructeur de classe C. Il édite les nœuds d'un chemin (path.pathnodes, path.segments) : sélection à la souris, création manuelle (Maj+clic), déplacement/rotation de la normale/mise à l'échelle du rayon avec le gizmo d'axes, et champs personnalisés. Il dessine les nœuds, les segments reliant les nœuds triés et un texte de sélection. Toutes les modifications passent par editor.history (annulation/rétablissement).

## Remarques

- Dans selectPathnode, setSelectedPathnodeIndex et selectedPathnode, « index » est l'id du nœud (clé de path.pathnodes.objects), pas sa position dans la liste triée.
- Maj enfoncé : on est en mode création de nœud manuel (rayon par défaut 5.0, relié par un segment au dernier nœud trié s'il existe).
- L'échelle du gizmo ne modifie que le rayon du nœud (valeur négative ramenée à 0).
- Le gizmo n'est utilisé que si crawlEditor.allowGizmo() renvoie une valeur vraie.
- Un texte de statut est dessiné à l'écran en (10, 10, 0) : « Selected Pathnode: <nom> <id> » ou « No pathnode selected ».

## Classe `C`

Instance de l'outil. Champs : crawlEditor (éditeur parent), path (chemin édité), index (id du nœud sélectionné, -1 par défaut), mouseInfo (dernières infos souris), fields (buffers ImGui des champs personnalisés).

Le module renvoie un constructeur : `local obj = require("editor_crawlEditor_waypoints")(options)`.

| Méthode | Description | Ligne |
|---|---|---|
| `C:beginDrag()` | Début de manipulation du gizmo : mémorise l'état sérialisé, la rotation et le rayon du nœud. | 86 |
| `C:createManualPathnode()` | Affiche « Add manual Pathnode (Click to place) » au point visé ; au clic, crée (annulable) un nœud au point de raycast, rayon 5.0, nom « Pathnode », et un segment depuis le dernier nœud trié. | 179 |
| `C:dragging()` | Pendant la manipulation : translation (position du gizmo), rotation (nouvelle normale, si le nœud en a une) ou échelle (rayon). | 97 |
| `C:draw(mouseInfo)` | Appelé à chaque frame : mémorise mouseInfo et, si le gizmo est autorisé, met à jour le gizmo et traite l'entrée. | 328 |
| `C:drawCustomFields(fields)` | Dessine l'éditeur des champs personnalisés d'un nœud (tables names/types/values ; type string édité via un champ de 4096 caractères). Crée les tables si absentes. | 546 |
| `C:drawPathnodeDetail(pathnode, index)` | Dessine le panneau de détail d'un nœud (nom, position, rayon, normale, champs personnalisés…) avec historique d'annulation. | 461 |
| `C:drawPathnodeList(trail)` | Dessine la liste des nœuds du trail avec le bouton « Add Pathnode » (crée un nœud à la position de la caméra, rayon 5.0). | 366 |
| `C:drawPathnodeSegments()` | Dessine un prisme entre chaque paire de nœuds consécutifs triés avec l'étiquette « Segment from-to » ; plus opaque en mode « Edit Pathnodes ». | 278 |
| `C:drawPathnodeSelectionIndicators()` | Dessine tous les nœuds (mode highlight, normal ou faded selon la sélection et le mode d'édition « Edit Pathnodes »), les segments et le texte de statut. | 247 |
| `C:endDragging()` | Fin de manipulation : enregistre l'action « Manipulated Pathnode via Gizmo » dans l'historique avec l'ancien et le nouvel état. | 139 |
| `C:getSelectedPathnodeIndex()` | Renvoie l'id du nœud sélectionné. | 538 |
| `C:handleMouseDown(hovered)` | Clic : sélectionne le nœud survolé, ou désélectionne si on ne clique pas sur le gizmo. | 167 |
| `C:init(crawlEditorParam)` | Constructeur : mémorise l'éditeur Crawl parent et initialise sélection, champs et données de glisser. | 33 |
| `C:input()` | Traite l'entrée : indicateurs, création manuelle avec Maj, survol et sélection au clic. Ne fait rien si mouseInfo.valid est faux. | 336 |
| `C:mouseOverPathnodes()` | Cherche le nœud le plus proche de la caméra dont la distance au rayon de la souris est ≤ 1.0 m. | 222 |
| `C:selectPathnode(id)` | Sélectionne le nœud d'id donné : met à jour le mode de dessin (highlight/normal) des nœuds, place le gizmo dessus et vide les champs personnalisés. Ne fait rien si id est nil. | 48 |
| `C:selectedPathnode()` | Renvoie le nœud sélectionné, ou nil s'il n'y en a pas ou s'il est marqué missing. | 159 |
| `C:setPath(pathParam)` | Définit le chemin dont on édite les nœuds. | 44 |
| `C:setSelectedPathnodeIndex(indexParam)` | Définit l'id sélectionné sans mettre à jour le gizmo ni le dessin (contrairement à selectPathnode). | 542 |
| `C:updateTransform(index)` | Place le gizmo sur la position du nœud (orienté selon sa normale en alignement local). Sans effet si le gizmo n'est pas autorisé. | 65 |

## Appels vers le moteur (C++)

- `debugDrawer:` `drawSphere`, `drawSquarePrism`, `drawTextAdvanced`
- `scenetree.` `findClassObjects`
- `worldEditorCppApi.` `getAxisGizmoScale`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/crawlEditor/waypoints.lua`.*

# `editor_toolUtilities_cornerHandles`

*Fichier : `lua/ge/extensions/editor/toolUtilities/cornerHandles.lua` · VM : Game Engine (GE) · 247 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_toolUtilities_cornerHandles` : `extensions.load("editor_toolUtilities_cornerHandles")`, puis la globale `editor_toolUtilities_cornerHandles`

Poignées dans le viewport pour les virages de la géométrie « engineered » des outils de route de l'éditeur : un bouton de rayon (à l'extérieur du virage, ancré à l'apex) et une poignée de déplacement sur la courbe quand le nœud PI est très éloigné de son virage. Gère le survol, le clic, le glisser et l'enregistrement d'une action d'historique annulable via le contexte fourni par l'outil.

## Remarques

- Le groupe g doit avoir g.nodes (>= 3 points {x,y,z}), g.corners, et facultativement g.discMap, g.divPoints, g.cornerR, g.engRadiusM.
- Rayon par défaut 40 m, plafond 300 m ; MAJ (shift) divise la sensibilité par 10.
- La poignée de déplacement n'apparaît que si le PI est à plus de 25 m de l'apex.
- Les nœuds ont priorité : si le curseur est sur un nœud, les poignées ne prennent pas la souris.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_toolUtilities_cornerHandles.apex(g, i)` | Apex du virage intérieur i sur la route réelle : l'échantillon au milieu de l'arc ancré à discMap[i]. Reste près de la route même si le PI est très loin (épingle ~180°). Retombe sur le nœud avant construction. | 46 |
| `editor_toolUtilities_cornerHandles.draggingGroupIdx()` | Indice du groupe qui possède le glissé en cours (pour savoir quelle route masquer), ou nil. | 237 |
| `editor_toolUtilities_cornerHandles.isDragging()` | true tant qu'un glissé de poignée de virage est en cours (l'outil s'en sert pour masquer la route et différer la reconstruction). | 234 |
| `editor_toolUtilities_cornerHandles.moveHandle(g, i, ap)` | Poignée de déplacement sur la courbe pour le virage i (comme la poignée de milieu de Civil3D) : n'existe que lorsque le PI est à plus de 25 m de son virage ; sinon le nœud est sur la route et se déplace directement. | 83 |
| `editor_toolUtilities_cornerHandles.update(g, ctx)` | Dessine les poignées de virage intérieur (bouton de rayon + poignée de déplacement) et gère leur clic/glisser. Renvoie (consumed, hovering) : consumed = elle possède la souris cette frame ; hovering = simple survol (l'appelant doit couper l'ajout de nœud mais continuer sa passe d'événements). | 100 |

### Détail des paramètres

#### `editor_toolUtilities_cornerHandles.apex(g, i)`

Apex du virage intérieur i sur la route réelle : l'échantillon au milieu de l'arc ancré à discMap[i]. Reste près de la route même si le PI est très loin (épingle ~180°). Retombe sur le nœud avant construction.

- `g` (*table*) : Groupe (discMap, divPoints, nodes).
- `i` (*integer*) : Indice du nœud intérieur.
- **renvoie** : table Point {x,y,z} de l'apex (ou le nœud i).

#### `editor_toolUtilities_cornerHandles.draggingGroupIdx()`

Indice du groupe qui possède le glissé en cours (pour savoir quelle route masquer), ou nil.

- **renvoie** : integer|nil 

#### `editor_toolUtilities_cornerHandles.isDragging()`

true tant qu'un glissé de poignée de virage est en cours (l'outil s'en sert pour masquer la route et différer la reconstruction).

- **renvoie** : boolean 

#### `editor_toolUtilities_cornerHandles.moveHandle(g, i, ap)`

Poignée de déplacement sur la courbe pour le virage i (comme la poignée de milieu de Civil3D) : n'existe que lorsque le PI est à plus de 25 m de son virage ; sinon le nœud est sur la route et se déplace directement.

- `g` (*table*) : Groupe.
- `i` (*integer*) : Indice du nœud intérieur.
- `ap` (*table|nil*) : Apex déjà calculé (évite une recherche).
- **renvoie** : vec3|nil Position de la poignée (apex, z+0.15) ou nil.

#### `editor_toolUtilities_cornerHandles.update(g, ctx)`

Dessine les poignées de virage intérieur (bouton de rayon + poignée de déplacement) et gère leur clic/glisser. Renvoie (consumed, hovering) : consumed = elle possède la souris cette frame ; hovering = simple survol (l'appelant doit couper l'ajout de nœud mais continuer sa passe d'événements).

- `g` (*table*) : Groupe/route (nodes, corners, discMap, divPoints…).
- `ctx` (*table*) : { selGroupIdx, selNodeIdx, setSelNode(i), minRadius(g)->number, deepCopy(g)->snapshot, undo, redo, ensureOverride(g,i)->ov }
- **renvoie** : boolean consumed
- **renvoie** : boolean|nil hovering (absent quand rien n'est survolé).

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/toolUtilities/cornerHandles.lua`.*

# `editor_roadDecorations`

*Fichier : `lua/ge/extensions/editor/roadDecorations.lua` · VM : Game Engine (GE) · 183 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_roadDecorations` : `extensions.load("editor_roadDecorations")`, puis la globale `editor_roadDecorations`

Place automatiquement des objets décoratifs (TSStatic, par exemple des réflecteurs ou des poteaux) de chaque côté d'un DecalRoad, à intervalle régulier. Les objets sont posés sur la hauteur du terrain, enregistrés sous « decoration.<route>.<fichier>.<n> » et regroupés dans un SimGroup ajouté à MissionGroup. Un moddeur l'appelle depuis un script d'éditeur.

## Exemple

```lua
-- un réflecteur à 2 m du bord, tous les 25 m, côtés gauche/droit alignés
local grp = editor_roadDecorations.decorateProps('myRoad', 'levels/driver_training/art/shapes/objects/reflector.dae', 2, 25, nil, 0, true)
```

## Remarques

- BUG : le nom du groupe est construit avec string.format('decorations.%d', tostring(roadName)) ; %d exige un nombre, donc un nom de route non numérique (chaîne) fait lever une erreur. Seul un nom numérique (ex. "9459") fonctionne.
- La documentation du code dit que la fonction renvoie la table des objets créés, mais elle renvoie en fait group:getID() (identifiant du SimGroup) ; la table props est construite mais jamais renvoyée. Renvoie nil si la route n'existe pas.
- Les props sont orientés parallèlement à la route (quatFromDir de la direction à plat) ; le paramètre rotation est un quaternion multiplié à cette rotation (déduit du code), nil pour aucune.
- Chaque ligne a 2 objets (droite puis gauche) par pas ; la boucle s'arrête quand l'un des deux côtés dépasse la fin de la route.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_roadDecorations.decorateProps(roadName, shapeName, distance, period, rotation, zOff, align)` | Crée un SimGroup et y place, tous les `period` mètres, un TSStatic de chaque côté de la route (collisionType 'Collision Mesh', échelle 1). Les positions sont recalées sur le terrain (core_terrain.getTerrainHeight) puis décalées de zOff. | 112 |
| `editor_roadDecorations.findOffsetPoint(spline, length, distance, left)` | Cherche sur une polyligne (bord de route) le point situé à la longueur donnée depuis le début, puis le décale latéralement. Renvoie nil si la longueur dépasse la polyligne. | 7 |

### Détail des paramètres

#### `editor_roadDecorations.decorateProps(roadName, shapeName, distance, period, rotation, zOff, align)`

Crée un SimGroup et y place, tous les `period` mètres, un TSStatic de chaque côté de la route (collisionType 'Collision Mesh', échelle 1). Les positions sont recalées sur le terrain (core_terrain.getTerrainHeight) puis décalées de zOff.

- `roadName` (*string|integer*) : Nom unique du DecalRoad (voir bug : doit être numérique).
- `shapeName` (*string*) : Chemin du fichier .dae à placer.
- `distance` (*number*) : Décalage latéral par rapport au bord de la route, en mètres.
- `period` (*number*) : Intervalle entre deux paires d'objets, en mètres.
- `rotation` (*quat|nil*) : Rotation supplémentaire appliquée aux objets (nil = aucune).
- `zOff` (*number*) : Décalage vertical ajouté à la hauteur du terrain.
- `align` (*boolean*) : true : le côté gauche est placé à l'opposé exact du côté droit (même longueur de route).
- **renvoie** : integer|nil Identifiant du SimGroup créé, ou nil si la route n'existe pas.

#### `editor_roadDecorations.findOffsetPoint(spline, length, distance, left)`

Cherche sur une polyligne (bord de route) le point situé à la longueur donnée depuis le début, puis le décale latéralement. Renvoie nil si la longueur dépasse la polyligne.

- `spline` (*table<integer, vec3>*) : Points du bord de la route (au moins 2).
- `length` (*number*) : Distance depuis le début, en mètres.
- `distance` (*number*) : Décalage latéral vers l'extérieur de la route, en mètres.
- `left` (*boolean*) : true pour le bord gauche (direction inversée), false pour le bord droit.
- **renvoie** : table|nil {point = vec3 décalé, rotation = quat, edgePos = vec3 sur le bord, edgeIdx = integer (indice C++, base 0)} ou nil.

## Appels vers le moteur (C++)

- `scenetree.` `findObject`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/roadDecorations.lua`.*

# `editor_roadArchitect_groups`

*Fichier : `lua/ge/extensions/editor/roadArchitect/groups.lua` · VM : Game Engine (GE) · 473 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_roadArchitect_groups` : `extensions.load("editor_roadArchitect_groups")`, puis la globale `editor_roadArchitect_groups`

Gestion des groupes de Road Architect (éditeur GE). Deux notions coexistent : les groupes prefab (modèles de routes réutilisables, comme carrefours ou ronds-points, chargés depuis des fichiers JSON ou créés par l'utilisateur) et les groupes placés (ensembles de nœuds de routes déjà présents dans la session). Le module sait auditionner un prefab (caméra en rotation à 1000 m d'altitude), le placer dans la session, créer un groupe à partir d'un polygone, sérialiser, sauvegarder, charger et déplacer la caméra sur un groupe.

## Exemple

```lua
local g = extensions.editor_roadArchitect_groups
g.getDefaultGroups()
local noms = g.addGroupToRoadsPlace(1, false) -- renvoie les noms (UUID) des routes ajoutées
```

## Remarques

- Les données par défaut sont lues via jsonReadFile dans roadArchitect/groups/*.json (12 prefabs : Urban Block, Staggered Junction, Double Roundabout, RIRO Intersection, etc.) ; getDefaultGroups ne fait rien si groups contient déjà des éléments.
- importGroup (création d'un prefab à partir de routes) est local et n'est pas exporté ; on y accède via load() ou getDefaultGroups().
- Les noms de groupes placés sont des tampons imgui (im.ArrayChar(32, nom)), pas des strings Lua ; copyPlacedGroup les convertit avec ffi.string.
- Les routes d'audition sont déplacées de -centre et élevées de 1000 m (auditionHeight) et restent cachées (isHidden = true).
- Le fichier groupe sauvegardé a la forme { data = { group = {name, roads} } }.
- save(idx) et load() manipulent un seul groupe à la fois malgré leur description (« collection ») : save écrit groups[idx], load ajoute un groupe.
- createGroup modifie gPolygon en place (z mis à 0) et ignore les routes de jonction (isJctRoad) et les ponts (isBridge).

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_roadArchitect_groups.addGroupToRoadsAudition(gIdx)` | Copie les routes du groupe prefab gIdx dans roadMgr.roads pour l'audition : routes centrées sur l'origine, élevées à la pose d'audition (+1000 m) et cachées. Recalcule la carte des routes, et recadre la caméra si on est déjà en vue de groupe. | 117 |
| `editor_roadArchitect_groups.addGroupToRoadsPlace(gIdx, isConformGroupToTerrain)` | Place le groupe prefab gIdx dans la session : copie ses routes avec des noms UUID uniques (Engine.generateUUID), visibles, enregistre un groupe placé (nom 32 caractères, liste des nœuds) puis supprime les routes cachées. | 158 |
| `editor_roadArchitect_groups.copyPlacedGroup(pg)` | Copie profonde d'un groupe placé, avec le nom converti du tampon imgui en string. | 240 |
| `editor_roadArchitect_groups.createGroup(gPolygon, roads)` | Crée un groupe placé à partir des nœuds de routes situés dans un polygone 2D (le polygone est aplati à z = 0 en place). Les routes de jonction et les ponts sont ignorés. Ne crée rien si aucun nœud n'est dans le polygone ; le groupe est nommé « New Group ». | 207 |
| `editor_roadArchitect_groups.createPrefabGroup(g)` | Transforme un groupe placé en groupe prefab : copie chaque route concernée (une fois) avec un nouveau nom UUID et ajoute à groups un élément nommé « User N ». | 247 |
| `editor_roadArchitect_groups.deserialiseGroup(gSer)` | Reconstruit un groupe prefab à partir d'un groupe sérialisé via roadMgr.deserialiseRoad. | 315 |
| `editor_roadArchitect_groups.getDefaultGroups()` | Charge les 12 groupes prefab par défaut depuis les fichiers JSON roadArchitect/groups/. Ne fait rien si groups n'est pas vide. | 351 |
| `editor_roadArchitect_groups.getPlacedGroups()` | Renvoie la collection des groupes placés de la session. | 380 |
| `editor_roadArchitect_groups.goToGroupView(gIdx, timer, time)` | Place la caméra en vue d'audition du groupe si on n'y est pas déjà : mémorise la pose de caméra actuelle, remet le chrono à zéro et appelle la mise à jour de pose. Renvoie le temps ajusté. | 105 |
| `editor_roadArchitect_groups.goToOldView()` | Rend la caméra à la pose mémorisée avant la vue de groupe et quitte l'état de vue de groupe. | 297 |
| `editor_roadArchitect_groups.goToPlacedGroup(idx)` | Met la caméra libre à la verticale du groupe placé, regardant vers le bas, à une hauteur calculée d'après le champ de vision pour tout cadrer. Ne fait rien si l'emprise est inférieure à 0,1 m en x et y. | 405 |
| `editor_roadArchitect_groups.load()` | Ouvre une boîte de dialogue d'ouverture JSON, lit le groupe (data.group), le désérialise et l'ajoute à groups via importGroup. | 338 |
| `editor_roadArchitect_groups.manageRotateCam()` | Fait tourner la caméra d'audition d'un pas de pi/500 autour du centre d'audition (appelé à chaque frame par l'interface). *(interne)* | 198 |
| `editor_roadArchitect_groups.removePlacedGroupHard(groupIdx)` | Retire un groupe placé et supprime ses routes, sauf celles qui appartiennent encore à un autre groupe. Appelle ensuite updateGroupsAfterRoadRemove. | 389 |
| `editor_roadArchitect_groups.removePlacedGroupSoft(groupIdx)` | Retire un groupe placé de la collection sans toucher aux routes qu'il contient. | 386 |
| `editor_roadArchitect_groups.save(idx)` | Ouvre une boîte de dialogue d'enregistrement JSON et écrit groups[idx] (sérialisé) dans le fichier choisi, sous la forme { data = { group = ... } }. | 325 |
| `editor_roadArchitect_groups.serialiseGroup(g)` | Sérialise un groupe prefab en table { name, roads } via roadMgr.serialiseRoad. | 305 |
| `editor_roadArchitect_groups.setPlacedGroups(pg)` | Remplace la collection des groupes placés. | 383 |
| `editor_roadArchitect_groups.updateGroupsAfterRoadRemove()` | Parcourt les groupes placés et supprime ceux dont au moins une route n'existe plus dans roadMgr. | 364 |

### Détail des paramètres

#### `editor_roadArchitect_groups.addGroupToRoadsAudition(gIdx)`

Copie les routes du groupe prefab gIdx dans roadMgr.roads pour l'audition : routes centrées sur l'origine, élevées à la pose d'audition (+1000 m) et cachées. Recalcule la carte des routes, et recadre la caméra si on est déjà en vue de groupe.

- `gIdx` (*integer*) : Indice du groupe dans groups.

#### `editor_roadArchitect_groups.addGroupToRoadsPlace(gIdx, isConformGroupToTerrain)`

Place le groupe prefab gIdx dans la session : copie ses routes avec des noms UUID uniques (Engine.generateUUID), visibles, enregistre un groupe placé (nom 32 caractères, liste des nœuds) puis supprime les routes cachées.

- `gIdx` (*integer*) : Indice du groupe dans groups.
- `isConformGroupToTerrain` (*boolean*) : Si vrai, les routes copiées sont plaquées au terrain.
- **renvoie** : string[] Noms (UUID) des routes ajoutées.

#### `editor_roadArchitect_groups.copyPlacedGroup(pg)`

Copie profonde d'un groupe placé, avec le nom converti du tampon imgui en string.

- `pg` (*table*) : Groupe placé { name = tampon imgui, list = {{r = nom de route, n = indice de nœud}} }.
- **renvoie** : table { name = string, list = table }.

#### `editor_roadArchitect_groups.createGroup(gPolygon, roads)`

Crée un groupe placé à partir des nœuds de routes situés dans un polygone 2D (le polygone est aplati à z = 0 en place). Les routes de jonction et les ponts sont ignorés. Ne crée rien si aucun nœud n'est dans le polygone ; le groupe est nommé « New Group ».

- `gPolygon` (*vec3[]*) : Sommets du polygone ; modifiés en place (z = 0).
- `roads` (*table[]*) : Routes à tester.

#### `editor_roadArchitect_groups.createPrefabGroup(g)`

Transforme un groupe placé en groupe prefab : copie chaque route concernée (une fois) avec un nouveau nom UUID et ajoute à groups un élément nommé « User N ».

- `g` (*table*) : Groupe placé (champ list de {r, n}).

#### `editor_roadArchitect_groups.deserialiseGroup(gSer)`

Reconstruit un groupe prefab à partir d'un groupe sérialisé via roadMgr.deserialiseRoad.

- `gSer` (*table*) : Groupe sérialisé { name, roads }.
- **renvoie** : table Groupe { name, roads }.

#### `editor_roadArchitect_groups.getPlacedGroups()`

Renvoie la collection des groupes placés de la session.

- **renvoie** : table[] Groupes placés.

#### `editor_roadArchitect_groups.goToGroupView(gIdx, timer, time)`

Place la caméra en vue d'audition du groupe si on n'y est pas déjà : mémorise la pose de caméra actuelle, remet le chrono à zéro et appelle la mise à jour de pose. Renvoie le temps ajusté.

- `gIdx` (*integer*) : Indice du groupe à auditionner.
- `timer` (*table*) : Chronomètre ; appelle timer:stopAndReset() à l'entrée en vue de groupe.
- `time` (*number*) : Temps courant ; remplacé par 0 lors du premier appel.
- **renvoie** : number 0.0 si la vue vient d'être activée, sinon time inchangé.

#### `editor_roadArchitect_groups.goToPlacedGroup(idx)`

Met la caméra libre à la verticale du groupe placé, regardant vers le bas, à une hauteur calculée d'après le champ de vision pour tout cadrer. Ne fait rien si l'emprise est inférieure à 0,1 m en x et y.

- `idx` (*integer*) : Indice du groupe placé.

#### `editor_roadArchitect_groups.removePlacedGroupHard(groupIdx)`

Retire un groupe placé et supprime ses routes, sauf celles qui appartiennent encore à un autre groupe. Appelle ensuite updateGroupsAfterRoadRemove.

- `groupIdx` (*integer*) : Indice du groupe placé.

#### `editor_roadArchitect_groups.removePlacedGroupSoft(groupIdx)`

Retire un groupe placé de la collection sans toucher aux routes qu'il contient.

- `groupIdx` (*integer*) : Indice du groupe placé.

#### `editor_roadArchitect_groups.save(idx)`

Ouvre une boîte de dialogue d'enregistrement JSON et écrit groups[idx] (sérialisé) dans le fichier choisi, sous la forme { data = { group = ... } }.

- `idx` (*integer*) : Indice du groupe à sauvegarder.

#### `editor_roadArchitect_groups.serialiseGroup(g)`

Sérialise un groupe prefab en table { name, roads } via roadMgr.serialiseRoad.

- `g` (*table*) : Groupe prefab { name, roads }.
- **renvoie** : table Groupe sérialisé, utilisable par jsonWriteFile.

#### `editor_roadArchitect_groups.setPlacedGroups(pg)`

Remplace la collection des groupes placés.

- `pg` (*table[]*) : Nouvelle collection.

## Champs

| Champ | Type | Description |
|---|---|---|
| `groups` | table | Tableau des modèles de groupes prefab disponibles, chaque élément ayant la forme { name = string, roads = table[] }. C'est la même table que celle remplie par getDefaultGroups, createPrefabGroup et load. |

## Appels vers le moteur (C++)

- `Engine.` `generateUUID`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/roadArchitect/groups.lua`.*

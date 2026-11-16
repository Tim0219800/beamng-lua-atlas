# `mcp_tools_scene`

*Fichier : `lua/ge/extensions/mcp/tools/scene.lua` · VM : Game Engine (GE) · 226 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `mcp_tools_scene` : `extensions.load("mcp_tools_scene")`, puis la globale `mcp_tools_scene`

Outils MCP pour le scenetree : trouver des objets (par classe ou nom), les inspecter comme l'inspecteur de l'éditeur, modifier leurs champs, les supprimer, les sérialiser, lister les objets visibles dans le champ de la caméra et lancer un raycast.

## Remarques

- set_object_field convertit toutes les valeurs en chaîne (setField) puis appelle postApply ; une position s'écrit '1 2 3'. delete_object est définitif pour la session.
- find_objects renvoie au plus 500 objets ; view_objects aussi (triés par distance, maxDist défaut 1000 m).
- view_objects : class accepte un mot-clé (vehicles défaut, static, item, player, terrain, water) ou un nom de classe exact ; un `mask` brut prime. Utilise sceneGetVisibleObjectIds (requête frustum C++).
- raycast : par défaut depuis la caméra dans sa direction, longueur 1000 ; includeTerrain true par défaut, renderGeometry false ; renvoie pt, norm et les champs scalaires du résultat de castRay.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `mcp_tools_scene.delete_object(args)` | Supprime un objet de la scène (obj:deleteObject()). | 86 |
| `mcp_tools_scene.find_objects(args)` | Trouve des objets par nom exact ou par classe (avec filtre optionnel de sous-chaîne). | 20 |
| `mcp_tools_scene.get_object(args)` | Inspecte un objet : id, name, class, champs statiques non vides, champs dynamiques, position. | 43 |
| `mcp_tools_scene.raycast(args)` | Lance un rayon et renvoie le premier impact. | 139 |
| `mcp_tools_scene.serialize_object(args)` | Sérialise l'objet en JSON/texte comme dans un fichier de niveau ou de prefab (obj:serialize). | 95 |
| `mcp_tools_scene.set_object_field(args)` | Écrit un ou plusieurs champs d'un objet puis appelle postApply. | 70 |
| `mcp_tools_scene.view_objects(args)` | Liste les objets dans le champ de la caméra, triés par distance. | 113 |

### Détail des paramètres

#### `mcp_tools_scene.delete_object(args)`

Supprime un objet de la scène (obj:deleteObject()).

- `args` (*table*) : {id?: integer, name?: string}
- **renvoie** : string Message.
- **renvoie** : boolean true si introuvable.

#### `mcp_tools_scene.find_objects(args)`

Trouve des objets par nom exact ou par classe (avec filtre optionnel de sous-chaîne).

- `args` (*table*) : {class?: string, pattern?: string, name?: string}
- **renvoie** : string JSON {count, objects:[{id, name, class}]}.
- **renvoie** : boolean true si ni class ni name.

#### `mcp_tools_scene.get_object(args)`

Inspecte un objet : id, name, class, champs statiques non vides, champs dynamiques, position.

- `args` (*table*) : {id?: integer, name?: string}
- **renvoie** : string JSON.
- **renvoie** : boolean true si introuvable.

#### `mcp_tools_scene.raycast(args)`

Lance un rayon et renvoie le premier impact.

- `args` (*table|nil*) : {from?: {x,y,z}, to?: {x,y,z}, dir?: {x,y,z}, length?: number m, includeTerrain?: boolean, renderGeometry?: boolean}
- **renvoie** : string JSON {hit=false, from, to} ou {hit=true, pt, norm, …}.
- **renvoie** : boolean true si aucune origine.

#### `mcp_tools_scene.serialize_object(args)`

Sérialise l'objet en JSON/texte comme dans un fichier de niveau ou de prefab (obj:serialize).

- `args` (*table*) : {id?|name?, pretty?: boolean (défaut true)}
- **renvoie** : string Texte sérialisé.
- **renvoie** : boolean true si introuvable.

#### `mcp_tools_scene.set_object_field(args)`

Écrit un ou plusieurs champs d'un objet puis appelle postApply.

- `args` (*table*) : {id?|name?, field?: string, value?: any, fields?: table<string, any>, index?: string (défaut '0')}
- **renvoie** : string Message récapitulatif.
- **renvoie** : boolean true en cas d'erreur.

#### `mcp_tools_scene.view_objects(args)`

Liste les objets dans le champ de la caméra, triés par distance.

- `args` (*table|nil*) : {class?: string, mask?: integer, maxDist?: number m}
- **renvoie** : string JSON {count, objects:[{id, name, class, dist, pos, jbeam?}]}.
- **renvoie** : boolean true si sceneGetVisibleObjectIds absent.

## Champs

| Champ | Type | Description |
|---|---|---|
| `schemas` | table<string, table> | Schémas des outils scène. |

## Appels vers le moteur (C++)

- `obj:` `deleteObject`, `getClassName`, `getDynamicFields`, `getField`, `getFields`, `getID`, `getName`, `getPosition`, `postApply`, `serialize`, `setField`
- `scenetree.` `findClassObjects`, `findObject`, `findObjectById`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/mcp/tools/scene.lua`.*

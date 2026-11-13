# `mcp_tools_editor`

*Fichier : `lua/ge/extensions/mcp/tools/editor.lua` · VM : Game Engine (GE) · 577 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `mcp_tools_editor` : `extensions.load("mcp_tools_editor")`, puis la globale `mcp_tools_editor`

Outils MCP pour le World Editor : activer/désactiver, état, sélection, annuler/rétablir, modes d'édition, ouvrir/sauvegarder un niveau, lister les classes, créer des objets et modifier leur transformation, avec historique d'annulation. Charge editor_main à la demande.

## Remarques

- La plupart des outils exigent que l'éditeur soit actif (set_editor_active active=true, asynchrone sur quelques frames ; vérifier avec editor_status), sinon ils renvoient une erreur explicite.
- editor_load_level force ensuite editor.active=false : le code explique qu'openLevel met editor.active=true avant le démarrage de la mission, ce qui ferait ignorer le chemin d'activation F11 ; le remettre à false permet de relancer l'activation complète.
- create_editor_object et set_editor_transform passent par editor.history (annulables) et marquent l'éditeur « dirty » ; create_editor_object sélectionne le nouvel objet. Par défaut : classe TSStatic, forme no_mesh.dae, collisionType et decalType 'Collision Mesh', position à 10 m devant la caméra, parent = parent sélectionné ou MissionGroup.
- Rotation de set_editor_transform : euler {x,y,z} en degrés ou quaternion rot {x,y,z,w} (rot prime) ; scale nombre uniforme ou {x,y,z}. Seules les composantes fournies changent.
- editor_save_level écrit le niveau sur disque ; à utiliser avec précaution.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `mcp_tools_editor.clear_editor_selection()` | Vide la sélection. | 112 |
| `mcp_tools_editor.create_editor_object(args)` | Crée un objet de scène (worldEditorCppApi.createObject), configure champs, nom, position, échelle, yaw, l'ajoute au parent et enregistre une action d'historique CreateObject. | 293 |
| `mcp_tools_editor.delete_editor_selection()` | Supprime les objets sélectionnés (annulable). | 120 |
| `mcp_tools_editor.editor_load_level(args)` | Ouvre un niveau dans l'éditeur (editor.openLevel, perd les modifications non sauvegardées, asynchrone). Ajoute un '/' final à un dossier. | 205 |
| `mcp_tools_editor.editor_redo(args)` | Rétablit des étapes de l'historique. | 141 |
| `mcp_tools_editor.editor_save_level()` | Sauvegarde le niveau courant (editor.saveLevel). | 223 |
| `mcp_tools_editor.editor_status()` | État de l'éditeur : active, initialized, dirty, levelName, levelPath, editMode, selectionCount, undoCount, redoCount, headless. | 68 |
| `mcp_tools_editor.editor_undo(args)` | Annule des étapes de l'historique. | 133 |
| `mcp_tools_editor.fit_view_to_selection()` | Cadre la caméra de l'éditeur sur la sélection (fitViewToSelectionSmooth ou fitViewToSelection). | 171 |
| `mcp_tools_editor.get_editor_selection()` | Objets actuellement sélectionnés. | 95 |
| `mcp_tools_editor.list_edit_modes()` | Liste les modes d'édition enregistrés et le mode courant. | 149 |
| `mcp_tools_editor.list_editor_classes(args)` | Liste (500 max, triée) les classes dérivées de SimObject via Sim.getSimObjectDerivedClassNames. | 273 |
| `mcp_tools_editor.select_editor_objects(args)` | Sélectionne des objets par id, ids[] ou name. | 103 |
| `mcp_tools_editor.set_edit_mode(args)` | Change de mode d'édition par nom (editor.selectEditMode). | 159 |
| `mcp_tools_editor.set_editor_active(args)` | Active ou désactive le World Editor (editor.setEditorActive). | 86 |
| `mcp_tools_editor.set_editor_transform(args)` | Applique position/rotation/échelle à des objets en une transaction d'historique annulable. | 435 |

### Détail des paramètres

#### `mcp_tools_editor.clear_editor_selection()`

Vide la sélection.

- **renvoie** : string Message.
- **renvoie** : boolean true en cas d'erreur.

#### `mcp_tools_editor.create_editor_object(args)`

Crée un objet de scène (worldEditorCppApi.createObject), configure champs, nom, position, échelle, yaw, l'ajoute au parent et enregistre une action d'historique CreateObject.

- `args` (*table|nil*) : {class?|classname?: string, shape?|shapeName?: string, name?: string, pos?: {x,y,z}, scale?: number|{x,y,z}, yaw?: number°, parent?: string, parentId?: integer, fields?: table, field?: string, value?: any, index?: string, collisionType?: string, decalType?: string}
- **renvoie** : string JSON {id, name, class, parentId, shapeName?}.
- **renvoie** : boolean true en cas d'erreur.

#### `mcp_tools_editor.delete_editor_selection()`

Supprime les objets sélectionnés (annulable).

- **renvoie** : string Message.
- **renvoie** : boolean true si rien n'est sélectionné ou erreur.

#### `mcp_tools_editor.editor_load_level(args)`

Ouvre un niveau dans l'éditeur (editor.openLevel, perd les modifications non sauvegardées, asynchrone). Ajoute un '/' final à un dossier.

- `args` (*table*) : {name?: string, path?: string}
- **renvoie** : string Message.
- **renvoie** : boolean true en cas d'erreur.

#### `mcp_tools_editor.editor_redo(args)`

Rétablit des étapes de l'historique.

- `args` (*table|nil*) : {steps?: integer (défaut 1)}
- **renvoie** : string Message.
- **renvoie** : boolean true en cas d'erreur.

#### `mcp_tools_editor.editor_save_level()`

Sauvegarde le niveau courant (editor.saveLevel).

- **renvoie** : string « saved level: … ».
- **renvoie** : boolean true si aucun chemin de niveau.

#### `mcp_tools_editor.editor_status()`

État de l'éditeur : active, initialized, dirty, levelName, levelPath, editMode, selectionCount, undoCount, redoCount, headless.

- **renvoie** : string JSON.
- **renvoie** : boolean true si editor_main ne charge pas.

#### `mcp_tools_editor.editor_undo(args)`

Annule des étapes de l'historique.

- `args` (*table|nil*) : {steps?: integer (défaut 1)}
- **renvoie** : string Message.
- **renvoie** : boolean true en cas d'erreur.

#### `mcp_tools_editor.fit_view_to_selection()`

Cadre la caméra de l'éditeur sur la sélection (fitViewToSelectionSmooth ou fitViewToSelection).

- **renvoie** : string Message.
- **renvoie** : boolean true si rien n'est sélectionné ou erreur.

#### `mcp_tools_editor.get_editor_selection()`

Objets actuellement sélectionnés.

- **renvoie** : string JSON {count, objects:[{id, name, class}]}.
- **renvoie** : boolean true en cas d'erreur.

#### `mcp_tools_editor.list_edit_modes()`

Liste les modes d'édition enregistrés et le mode courant.

- **renvoie** : string JSON {current, modes}.
- **renvoie** : boolean true en cas d'erreur.

#### `mcp_tools_editor.list_editor_classes(args)`

Liste (500 max, triée) les classes dérivées de SimObject via Sim.getSimObjectDerivedClassNames.

- `args` (*table|nil*) : {pattern?: string} sous-chaîne insensible à la casse.
- **renvoie** : string JSON {count, classes}.
- **renvoie** : boolean true en cas d'erreur.

#### `mcp_tools_editor.select_editor_objects(args)`

Sélectionne des objets par id, ids[] ou name.

- `args` (*table*) : {id?, ids?: integer[], name?: string, mode?: 'new'|'add'|'remove'|'toggle' (défaut new)}
- **renvoie** : string JSON {count, ids}.
- **renvoie** : boolean true en cas d'erreur.

#### `mcp_tools_editor.set_edit_mode(args)`

Change de mode d'édition par nom (editor.selectEditMode).

- `args` (*table*) : {name: string} (de list_edit_modes).
- **renvoie** : string Message.
- **renvoie** : boolean true en cas d'erreur.

#### `mcp_tools_editor.set_editor_active(args)`

Active ou désactive le World Editor (editor.setEditorActive).

- `args` (*table*) : {active: boolean, safeMode?: boolean}
- **renvoie** : string « editor activating/deactivating ».
- **renvoie** : boolean true en cas d'erreur.

#### `mcp_tools_editor.set_editor_transform(args)`

Applique position/rotation/échelle à des objets en une transaction d'historique annulable.

- `args` (*table*) : {items?: {id|name, pos?, euler?|rot?, scale?}[], id?, ids?, name?, pos?, euler?, rot?, rotation?, scale?}. Sans cible, utilise la sélection.
- **renvoie** : string JSON {count, ids}.
- **renvoie** : boolean true en cas d'erreur.

## Champs

| Champ | Type | Description |
|---|---|---|
| `schemas` | table<string, table> | Schémas des outils d'éditeur. |

## Appels vers le moteur (C++)

- `Engine.` `getSystemTimeMS`
- `Sim.` `deserializeObjectsFromText`, `findObjectById`, `getSimObjectDerivedClassNames`, `getUniqueName`, `upcast`
- `obj:` `delete`, `getClassName`, `getField`, `getID`, `getName`, `getPosition`, `getScale`, `getTransform`, `isSubClassOf`, `postApply`, `registerObject`, `serialize`, `setField`, `setPosition`, `setScale`, `setTransform`
- `scenetree.` `findObject`, `findObjectById`
- `worldEditorCppApi.` `createObject`

**Charge les extensions :** `editor_main`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/mcp/tools/editor.lua`.*

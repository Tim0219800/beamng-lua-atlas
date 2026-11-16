# `editor_api_material`

*Fichier : `lua/ge/extensions/editor/api/material.lua` · VM : Game Engine (GE) · 388 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_api_material` : `extensions.load("editor_api_material")`, puis la globale `editor_api_material`

API de l'éditeur pour manipuler les matériaux (objets `Material`, fichiers materials.json) : création, copie, déplacement vers un autre fichier, modification d'une propriété, suppression. `initialize` installe les fonctions sur l'objet `editor`. Les écritures disque passent par le PersistenceManager `scenetree.matLuaEd_PersistMan` ; la suppression d'une entrée JSON se fait par manipulation de texte pour ne pas réordonner tout le fichier (jsonWriteFile trie les clés).

## Exemple

```lua
editor.createMaterial("mon_mat", "levels/mymap/art/materials.json", "mon_mat")
editor.setMaterialProperty("mon_mat", "diffuseColor", 0, "1 0 0 1")
```

## Remarques

- Les fonctions acceptent un objet Material ou son nom (string), résolu par scenetree.findObject.
- Matériaux v1.5 : 4 couches maximum (copie des champs sur les couches 0 à 3).
- Champs non copiés par copyMaterial/copyMaterialAsNew : name, mapTo, persistentId, parentGroup, internalName, class, className, superClass, hidden, locked, canSave, canSaveDynamicFields.
- Incohérence : `initialize` crée l'objet `materialPersistMan` s'il manque, mais toutes les fonctions utilisent `scenetree.matLuaEd_PersistMan` (créé ailleurs).
- Les messages d'erreur utilisent `logTag`, qui n'est pas défini dans ce fichier (nil sauf global ailleurs).
- `createMaterial` annonce materialMapTo comme `number` mais le traite comme une chaîne (`#materialMapTo`) ; passer une string.
- `setMaterialProperty` et `deleteMaterial` plantent si le nom ne correspond à aucun objet (material nil indexé).

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_api_material.initialize(editorInstance)` | Enregistre un PersistenceManager 'materialPersistMan' s'il n'existe pas, mémorise l'éditeur et y installe createMaterial, setMaterialProperty, removeMaterialFromJson, moveMaterial, copyMaterial, copyMaterialAsNew, deleteMaterial. *(interne)* | 369 |

### Détail des paramètres

#### `editor_api_material.initialize(editorInstance)`

Enregistre un PersistenceManager 'materialPersistMan' s'il n'existe pas, mémorise l'éditeur et y installe createMaterial, setMaterialProperty, removeMaterialFromJson, moveMaterial, copyMaterial, copyMaterialAsNew, deleteMaterial.

- `editorInstance` (*table*) : objet `editor`

## Classe `editor`

Fonctions ajoutées à `editor` par initialize.

Objet `editor` construit dans le module (par ex. par `new`), avec ces méthodes :

| Méthode | Description | Ligne |
|---|---|---|
| `editor.copyMaterial(source, target)` | Copie tous les paramètres (toutes couches et champs dynamiques) d'un matériau source sur un matériau cible existant, en gardant nom, mapTo et fichier de la cible. La cible doit être dans un .json ; elle est rechargée et sauvegardée. | 285 |
| `editor.copyMaterialAsNew(source, newName, newFilename)` | Copie un matériau dans un nouveau matériau (name et mapTo = newName) écrit dans le fichier donné. | 315 |
| `editor.createMaterial(materialName, materialFilename, materialMapTo)` | Crée un nouveau Material (version 1.5) et l'écrit sur disque. Échoue si le nom est vide, déjà pris, ou si le dossier n'existe pas. Si mapTo est vide, le nom du matériau est utilisé. | 12 |
| `editor.deleteMaterial(material)` | Supprime l'objet Material de la scène et son entrée dans son fichier JSON (via removeMaterialFromJson). | 351 |
| `editor.moveMaterial(material, newFilename)` | Déplace un matériau vers un autre fichier (le sauvegarde dans le nouveau) puis retire son entrée de l'ancien fichier s'il s'agissait d'un .json existant. | 188 |
| `editor.removeMaterialFromJson(materialName, materialFilename)` | Supprime l'entrée de premier niveau `materialName` d'un fichier materials.json par édition de texte (gère les virgules, indépendant de l'indentation) et réécrit le fichier. Logue une erreur/avertissement et ne renvoie rien si le fichier ou l'entrée est introuvable. | 79 |
| `editor.setMaterialProperty(material, property, layer, value)` | Fixe un champ du matériau sur une couche puis recharge le matériau (ne sauvegarde pas sur disque). | 60 |

## Appels vers le moteur (C++)

- `FS:` `directoryExists`, `fileExists`
- `scenetree.` `findObject`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/api/material.lua`.*

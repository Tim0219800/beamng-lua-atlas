# `editor_api_forest`

*Fichier : `lua/ge/extensions/editor/api/forest.lua` · VM : Game Engine (GE) · 118 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_api_forest` : `extensions.load("editor_api_forest")`, puis la globale `editor_api_forest`

API de l'éditeur pour manipuler les éléments de forêt (arbres, rochers… instanciés via ForestData). initialize(editor) ajoute sur editor des fonctions pour ajouter, retirer, mettre à jour, tourner et sélectionner des ForestItem. Les fonctions qui modifient la forêt mettent editor.forestDirty = true et appellent editor.setDirty().

## Remarques

- updateForestItem et rotateForestSelection remplacent l'item : il faut utiliser l'objet renvoyé (updateItem renvoie un nouvel item).
- rotateForestSelection n'agit que sur editor.selection.forestItem ; une seule sélection tourne autour de son axe (ou du monde selon editor.getAxisGizmoAlignment()), plusieurs tournent autour de centerPoint.
- rotateForestSelection ne marque pas forestDirty lui-même.
- Le commentaire de createForestItem dit « from where to remove the item » pour forestData (copié-collé), il s'agit en fait de la forêt où l'item est créé.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_api_forest.initialize(editorInstance)` | Installe les fonctions de ce module sur l'objet editor. *(interne)* | 104 |

### Détail des paramètres

#### `editor_api_forest.initialize(editorInstance)`

Installe les fonctions de ce module sur l'objet editor.

- `editorInstance` (*table*) : Objet editor

## Classe `editor`

Fonctions ajoutées à l'objet editor par initialize.

Objet `editor` construit dans le module (par ex. par `new`), avec ces méthodes :

| Méthode | Description | Ligne |
|---|---|---|
| `editor.addForestItem(forestData, item)` | Ajoute un ForestItem existant à la forêt. | 47 |
| `editor.createForestItem(forestData, itemData, transform, scale)` | Crée un nouvel item en prenant un item existant comme modèle, avec une transformation et une échelle. | 68 |
| `editor.removeForestItem(forestData, item)` | Retire un ForestItem de la forêt. | 56 |
| `editor.rotateForestSelection(forestData, deltaEulerRotation, centerPoint, originalTransforms)` | Applique une rotation delta aux items de forêt sélectionnés à partir de leurs transformations d'origine. | 16 |
| `editor.setForestItemCustomData(forestData, key, customData)` | Définit la donnée personnalisée opaque d'un item. | 94 |
| `editor.setForestItemSelected(forestData, key, selected)` | Marque un item comme sélectionné ou non (ne marque pas la forêt modifiée). | 100 |
| `editor.updateForestItem(forestData, key, keyPos, newData, newTrans, newScale, newUid)` | Met à jour les informations d'une instance (données, transformation, échelle, uid). | 83 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/api/forest.lua`.*

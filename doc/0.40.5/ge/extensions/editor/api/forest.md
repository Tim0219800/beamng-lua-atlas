# `editor_api_forest`

*Fichier : `lua/ge/extensions/editor/api/forest.lua` · VM : Game Engine (GE) · 118 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_api_forest` : `extensions.load("editor_api_forest")`, puis la globale `editor_api_forest`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_api_forest.initialize(editorInstance)` |  | 104 |

## Classe `editor`

Objet `editor` construit dans le module (par ex. par `new`), avec ces méthodes :

| Méthode | Description | Ligne |
|---|---|---|
| `editor.addForestItem(forestData, item)` | Add a new forest item to the forest data.<br> @param forestData the ForestData C++ class where to add the item<br> @param item the C++ ForestItem to be added | 47 |
| `editor.createForestItem(forestData, itemData, transform, scale)` | Add and transform a forest item, by using an existing item as a template<br> @param forestData the ForestData C++ class from where to remove the item<br> @param itemData the stored data of an existing C++ ForestItem<br> @param transform the new transform (MatrixF)<br> @param scale the new scale (number)<br> @return the newly created forest item | 68 |
| `editor.removeForestItem(forestData, item)` | Remove a forest item<br> @param forestData the ForestData C++ class from where to remove the item<br> @param item the C++ ForestItem to be removed | 56 |
| `editor.rotateForestSelection(forestData, deltaEulerRotation, centerPoint, originalTransforms)` | Rotate forest items selection.<br> @param forestData the ForestData C++ class where the forest items are held<br> @param deltaEulerRotation eurler rotation to be added<br> @param centerPoint center point around where rotation will happen<br> @param originalTransforms the previous transforms of the forest items | 16 |
| `editor.setForestItemCustomData(forestData, key, customData)` | Set the opaque per-instance custom data of a forest item<br> @param forestData the ForestData C++ class that contains the item<br> @param key the key of the item<br> @param customData the packed custom data value (-1 = none)<br> @return the forest item | 94 |
| `editor.setForestItemSelected(forestData, key, selected)` |  | 100 |
| `editor.updateForestItem(forestData, key, keyPos, newData, newTrans, newScale, newUid)` | Update a forest item instance information<br> @param forestData the ForestData C++ class that contains the item<br> @param key the key of the item<br> @param keyPos the original position of the item<br> @param newData the stored data of the item<br> @param newTrans the new transform (MatrixF)<br> @param newScale the new scale (number)<br> @param newUid unique id<br> @return the forest item | 83 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/api/forest.lua`.*

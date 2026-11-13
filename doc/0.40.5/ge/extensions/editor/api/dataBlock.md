# `editor_api_dataBlock`

*Fichier : `lua/ge/extensions/editor/api/dataBlock.lua` · VM : Game Engine (GE) · 120 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_api_dataBlock` : `extensions.load("editor_api_dataBlock")`, puis la globale `editor_api_dataBlock`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_api_dataBlock.initialize(editorInstance)` |  | 99 |

## Classe `editor`

Objet `editor` construit dans le module (par ex. par `new`), avec ces méthodes :

| Méthode | Description | Ligne |
|---|---|---|
| `editor.createDataBlock(name, type, copyFrom, filename)` | Create a new data block.<br> @param name the data block unique name<br> @param type the data block type<br> @param copyFrom the data block to be copied, can be nil<br> @param filename the data block filename | 13 |
| `editor.findDataBlock(name)` | Returns the datablock object by its name, or nil if none found<br> @param name the name of the data block to find | 92 |
| `editor.getDataBlocks()` | Returns the data block objects array | 86 |
| `editor.isDataBlockDirty(dataBlock)` | Returns true if data block was modified | 75 |
| `editor.removeDataBlockFromFile(dataBlock)` | Delete a data block from its containing file.<br> @param dataBlock the data block object to be removed from the file | 51 |
| `editor.saveDataBlockToFile(dataBlock, filename)` | Save a data block to a file.<br> @param dataBlock the data block to be saved into the file<br> @param filename the file where to save the data block | 69 |
| `editor.saveDirtyDataBlock(dataBlock)` | Save a modified data block.<br> @param dataBlock the data block object to be saved if dirty (modified) | 45 |
| `editor.setDataBlockDirty(dataBlock)` | Set the dirty state (was modified) of the data block.<br> @param dataBlock the datablock to report as modified | 81 |

## Appels vers le moteur (C++)

- `Sim.` `getDataBlockSet`
- `scenetree.` `findObject`
- `worldEditorCppApi.` `createObject`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/api/dataBlock.lua`.*

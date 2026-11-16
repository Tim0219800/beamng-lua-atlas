# `editor_api_dataBlock`

*Fichier : `lua/ge/extensions/editor/api/dataBlock.lua` · VM : Game Engine (GE) · 120 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_api_dataBlock` : `extensions.load("editor_api_dataBlock")`, puis la globale `editor_api_dataBlock`

API de l'éditeur pour gérer les datablocks du moteur (objets de données partagés : sons, particules, matériaux physiques…). initialize(editor) ajoute les fonctions de création, recherche, sauvegarde et suppression sur l'objet editor ; la persistance passe par un PersistenceManager nommé dataBlockPersistMan. Fichier par défaut : art/datablocks/managedDatablocks.json.

## Remarques

- Bug : initialize assigne editor.addDataBlockToFile = addDataBlockToFile, mais la fonction locale s'appelle addDatablockToFile (casse différente). editor.addDataBlockToFile vaut donc nil.
- createDataBlock renvoie l'ID de l'objet (getID()), pas l'objet.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_api_dataBlock.initialize(editorInstance)` | Crée le PersistenceManager dataBlockPersistMan s'il n'existe pas et installe les fonctions sur l'objet editor. *(interne)* | 99 |

### Détail des paramètres

#### `editor_api_dataBlock.initialize(editorInstance)`

Crée le PersistenceManager dataBlockPersistMan s'il n'existe pas et installe les fonctions sur l'objet editor.

- `editorInstance` (*table*) : Objet editor

## Classe `editor`

Fonctions ajoutées à l'objet editor par initialize.

Objet `editor` construit dans le module (par ex. par `new`), avec ces méthodes :

| Méthode | Description | Ligne |
|---|---|---|
| `editor.createDataBlock(name, type, copyFrom, filename)` | Crée un datablock du type donné, copie éventuellement les champs d'un existant, l'enregistre, le nomme, l'ajoute au groupe dataBlockGroup et au set de datablocks, puis le marque modifié pour le fichier. | 13 |
| `editor.findDataBlock(name)` | Cherche un datablock par son nom en parcourant le set. | 92 |
| `editor.getDataBlocks()` | Renvoie le set de tous les datablocks (Sim.getDataBlockSet()). | 86 |
| `editor.isDataBlockDirty(dataBlock)` | Indique si le datablock a été modifié. | 75 |
| `editor.removeDataBlockFromFile(dataBlock)` | Retire le datablock du set et, s'il a un nom de fichier, le supprime de son fichier. | 51 |
| `editor.saveDataBlockToFile(dataBlock, filename)` | Associe le datablock à un fichier (par défaut son fichier actuel) puis le sauvegarde immédiatement. | 69 |
| `editor.saveDirtyDataBlock(dataBlock)` | Sauvegarde le datablock s'il est modifié. | 45 |
| `editor.setDataBlockDirty(dataBlock)` | Marque le datablock comme modifié (fichier = son fichier, sinon le fichier par défaut). | 81 |

## Appels vers le moteur (C++)

- `Sim.` `getDataBlockSet`
- `scenetree.` `findObject`
- `worldEditorCppApi.` `createObject`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/api/dataBlock.lua`.*

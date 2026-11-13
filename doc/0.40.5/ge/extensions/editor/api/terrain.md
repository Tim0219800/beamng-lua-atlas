# `editor_api_terrain`

*Fichier : `lua/ge/extensions/editor/api/terrain.lua` · VM : Game Engine (GE) · 259 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_api_terrain` : `extensions.load("editor_api_terrain")`, puis la globale `editor_api_terrain`

Squelette d'API de l'éditeur pour le terrain (sculpture, peinture de matériaux, feuillage). initialize(editor) ajoute 46 fonctions à l'objet editor, mais toutes ont un corps vide (commentaire TODO) : elles ne font rien et renvoient nil. Les hooks prévus sont cités en commentaire : onEditorTerrainCreated, onEditorTerrainDelete, onEditorTerrainHeightBrushChanged, onEditorTerrainHeightChanged, onEditorTerrainCleared, onEditorTerrainRestored.

## Remarques

- Toutes les fonctions sont des stubs (TODO) : ne pas s'attendre à un effet. Les noms indiquent l'intention prévue ; les types des paramètres sont déduits des noms.
- Les hooks onEditorTerrain* ne sont que des commentaires, rien ne les appelle ici.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_api_terrain.initialize(editorInstance)` | Ajoute à l'objet editor toutes les fonctions terrain/feuillage listées dans la classe editor. Appelé par le chargeur de l'API de l'éditeur. *(interne)* | 205 |

### Détail des paramètres

#### `editor_api_terrain.initialize(editorInstance)`

Ajoute à l'objet editor toutes les fonctions terrain/feuillage listées dans la classe editor. Appelé par le chargeur de l'API de l'éditeur.

- `editorInstance` (*table*) : Objet editor global.

## Classe `editor`

Fonctions ajoutées à editor. Toutes sont des stubs vides (TODO).

Objet `editor` construit dans le module (par ex. par `new`), avec ces méthodes :

| Méthode | Description | Ligne |
|---|---|---|
| `editor.addFoliageBrushToGroup(groupName, foliageBrush)` | Prévu : ajouter une brosse de feuillage à un groupe. Stub vide. | 157 |
| `editor.alignTerrainWithMesh(x, y, topOrBottom, amount)` | Prévu : aligner le terrain sur un maillage (haut ou bas). Stub vide. | 97 |
| `editor.applyTerrainHeightBrushPreset(name)` | Prévu : appliquer un preset de brosse de hauteur. Stub vide. | 41 |
| `editor.averageSmoothTerrain(x, y, amount)` | Prévu : lissage par moyenne. Stub vide. | 73 |
| `editor.clearTerrain(x, y)` | Prévu : effacer le terrain en (x, y) (hook onEditorTerrainCleared). Stub vide. | 89 |
| `editor.createFoliageGroup(name)` | Prévu : créer un groupe de feuillage. Stub vide. | 137 |
| `editor.createFoliageMesh(foliageMesh)` | Prévu : créer un maillage de feuillage. Stub vide. | 145 |
| `editor.createTerrain(terrainInfo)` | Prévu : créer un terrain. Stub vide. | 17 |
| `editor.createTerrainPaintMaterial(mtl)` | Prévu : créer un matériau de peinture. Stub vide. | 109 |
| `editor.deleteFoliageBrush(name)` | Prévu : supprimer une brosse de feuillage. Stub vide. | 161 |
| `editor.deleteFoliageGroup(name)` | Prévu : supprimer un groupe de feuillage. Stub vide. | 141 |
| `editor.deleteFoliageMesh(foliageMeshName)` | Prévu : supprimer un maillage de feuillage. Stub vide. | 149 |
| `editor.deleteTerrain(terrainObjectId)` | Prévu : supprimer un terrain. Stub vide. | 21 |
| `editor.deleteTerrainHeightBrushPreset(name)` | Prévu : supprimer un preset de brosse de hauteur. Stub vide. | 45 |
| `editor.deleteTerrainPaintBrushPreset(name)` | Prévu : supprimer un preset de brosse de peinture. Stub vide. | 129 |
| `editor.eraseFoliage(x, y)` | Prévu : effacer du feuillage en (x, y). Stub vide. | 181 |
| `editor.eraseSetFoliageBrushOrGroup(x, y)` | Prévu : effacer les éléments de la brosse/groupe actif en (x, y). Stub vide. | 185 |
| `editor.exportTerrainHeightmap(terrainObjectId, filename)` | Prévu : exporter la heightmap d'un terrain. Stub vide. | 29 |
| `editor.flattenTerrain(x, y, amount)` | Prévu : aplatir le terrain. Stub vide. | 81 |
| `editor.getFoliageMeshes()` | Prévu : lister les maillages de feuillage. Stub vide. | 153 |
| `editor.getTerrainHeightBrushPresets()` | Prévu : lister les presets de brosse de hauteur. Stub vide. | 49 |
| `editor.getTerrainPaintBrushPresets()` | Prévu : lister les presets de brosse de peinture. Stub vide. | 133 |
| `editor.grabTerrain(x, y, amount)` | Prévu : outil « saisir » le terrain en (x, y). Stub vide. | 53 |
| `editor.importTerrainHeightmap(importInfo)` | Prévu : importer une heightmap. Stub vide. | 25 |
| `editor.loadTerrainPaintBrushPreset(name)` | Prévu : charger un preset de brosse de peinture. Stub vide. | 125 |
| `editor.lowerTerrain(x, y, amount)` | Prévu : abaisser le terrain en (x, y). Stub vide. | 61 |
| `editor.noiseTerrain(x, y, amount)` | Prévu : ajouter du bruit au terrain. Stub vide. | 77 |
| `editor.paintFoliage(x, y)` | Prévu : peindre du feuillage en (x, y). Stub vide. | 177 |
| `editor.paintTerrain(x, y)` | Prévu : peindre le terrain en (x, y). Stub vide. | 113 |
| `editor.raiseTerrain(x, y, amount)` | Prévu : lever le terrain en (x, y). Stub vide. | 57 |
| `editor.restoreTerrain(x, y)` | Prévu : restaurer le terrain en (x, y) (hook onEditorTerrainRestored). Stub vide. | 93 |
| `editor.rotateFoliageSelection(delta)` | Prévu : tourner la sélection de feuillage. Stub vide. | 193 |
| `editor.saveTerrainHeightBrushPreset(name)` | Prévu : sauvegarder un preset de brosse de hauteur. Stub vide. | 37 |
| `editor.saveTerrainPaintBrushPreset(name)` | Prévu : sauvegarder un preset de brosse de peinture. Stub vide. | 121 |
| `editor.scaleFoliageSelection(delta)` | Prévu : mettre à l'échelle la sélection de feuillage. Stub vide. | 197 |
| `editor.selectFoliage(x, y)` | Prévu : sélectionner du feuillage en (x, y). Stub vide. | 201 |
| `editor.selectTerrainPaintMaterial(mtl)` | Prévu : choisir le matériau de peinture. Stub vide. | 105 |
| `editor.setFoliageBrush(brushName)` | Prévu : choisir la brosse de feuillage active. Stub vide. | 169 |
| `editor.setFoliageBrushGroup(name)` | Prévu : choisir le groupe de brosses actif. Stub vide. | 165 |
| `editor.setFoliagePaintBrushSettings(brush)` | Prévu : régler la brosse de peinture de feuillage. Stub vide. | 173 |
| `editor.setTerrainHeight(x, y, amount)` | Prévu : fixer la hauteur du terrain. Stub vide. | 85 |
| `editor.setTerrainHeightBrush(brush)` | Prévu : définir la brosse de hauteur. Stub vide. | 33 |
| `editor.setTerrainPaintBrush(brush)` | Prévu : définir la brosse de peinture. Stub vide. | 117 |
| `editor.smoothSlopeTerrain(x, y, amount)` | Prévu : lisser la pente. Stub vide. | 69 |
| `editor.smoothTerrain(x, y, amount)` | Prévu : lisser le terrain. Stub vide. | 65 |
| `editor.subtractMeshFromTerrain(x, y)` | Prévu : soustraire un maillage du terrain. Stub vide. | 101 |
| `editor.translateFoliageSelection(delta)` | Prévu : translater la sélection de feuillage. Stub vide. | 189 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/api/terrain.lua`.*

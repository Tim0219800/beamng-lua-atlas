# `editor_api_material`

*Fichier : `lua/ge/extensions/editor/api/material.lua` · VM : Game Engine (GE) · 388 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_api_material` : `extensions.load("editor_api_material")`, puis la globale `editor_api_material`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_api_material.initialize(editorInstance)` |  | 369 |

## Classe `editor`

Objet `editor` construit dans le module (par ex. par `new`), avec ces méthodes :

| Méthode | Description | Ligne |
|---|---|---|
| `editor.copyMaterial(source, target)` | Copies all parameters of a material onto an existing material, keeping the target's name, mapTo and file.<br> param 'source'; type 'class<Material>' \|\| 'string';<br> param 'target'; type 'class<Material>' \|\| 'string';<br> returns; type 'bool'; | 285 |
| `editor.copyMaterialAsNew(source, newName, newFilename)` | Copies a material into a new material with the given name, written to the given materials.json file.<br> param 'source'; type 'class<Material>' \|\| 'string';<br> param 'newName'; type 'string';<br> param 'newFilename'; type 'string';<br> returns; type 'bool'; | 315 |
| `editor.createMaterial(materialName, materialFilename, materialMapTo)` | Creates a new material object with given params and writes it to disk.<br> param 'materialName'; type 'string';<br> param 'materialFilename'; type 'string';<br> param 'materialMapTo'; type 'number';<br> returns; type 'bool'; | 12 |
| `editor.deleteMaterial(material)` |  | 351 |
| `editor.moveMaterial(material, newFilename)` | Moves a material to another materials.json file (existing or new) and removes it from its source file.<br> param 'material'; type 'class<Material>' \|\| 'string';<br> param 'newFilename'; type 'string';<br> returns; type 'bool'; | 188 |
| `editor.removeMaterialFromJson(materialName, materialFilename)` | Removes a single material entry from a materials.json file using text manipulation.<br> This avoids re-serializing the whole file (jsonWriteFile sorts keys alphabetically),<br> which would otherwise reorder every entry and produce huge diffs in version control. | 79 |
| `editor.setMaterialProperty(material, property, layer, value)` | Sets a property of a material.<br> param 'material'; type 'class<Material>' \|\| 'string';<br> param 'property'; type 'string';<br> param 'layer'; type 'number';<br> param 'value'; type 'string';<br> returns; type 'bool'; | 60 |

## Appels vers le moteur (C++)

- `FS:` `directoryExists`, `fileExists`
- `scenetree.` `findObject`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/api/material.lua`.*

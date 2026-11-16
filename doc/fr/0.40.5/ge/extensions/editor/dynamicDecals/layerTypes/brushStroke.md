# `editor_dynamicDecals_layerTypes_brushStroke`

*Fichier : `lua/ge/extensions/editor/dynamicDecals/layerTypes/brushStroke.lua` · VM : Game Engine (GE) · 609 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_dynamicDecals_layerTypes_brushStroke` : `extensions.load("editor_dynamicDecals_layerTypes_brushStroke")`, puis la globale `editor_dynamicDecals_layerTypes_brushStroke`

Type de calque « Brush Stroke » de l'outil Dynamic Decals : un coup de pinceau virtuel qui pose un decal à chaque frame pendant le déplacement et interpole des decals entre les frames. Il partage les propriétés d'un calque decal. Ce module fournit la section « Brush Stroke Properties » (nombre d'étapes d'interpolation, ordre 1070), la GUI d'inspecteur du type brushStroke (uid, nom, enabled, couleur, échelle, rotation, masque alpha, SDF, textures, dataPoints, etc.) et les pages de documentation (Brush Stroke Layers, Properties).

## Remarques

- Dans l'inspecteur, les points de données (dataPoints) sont dessinés dans le monde 3D avec debugDrawer:drawSphere et drawTextAdvanced (index du point), taille/couleur selon les préférences `dynamicDecalsTool.general.dataPointSphereSize` / `dataPointSphereColor`.
- La page « Properties » liste api.properties["Brush Stroke Layer"] et un bouton « Highlight » ouvre la section « Decal Properties » et surligne le widget correspondant.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_dynamicDecals_layerTypes_brushStroke.editorPreferenceValueChanged(path, value)` | Hook appelé quand une préférence change. Ne fait rien ici. *(interne)* | 544 |
| `editor_dynamicDecals_layerTypes_brushStroke.registerEditorPreferences(prefsRegistry)` | Ne déclare aucune préférence (corps commenté). *(interne)* | 538 |
| `editor_dynamicDecals_layerTypes_brushStroke.setup(tool_in)` | Appelé par l'outil : récupère les modules liés, enregistre la section « Brush Stroke Properties », la GUI d'inspecteur du type brushStroke et les pages de documentation. *(interne)* | 589 |

### Détail des paramètres

#### `editor_dynamicDecals_layerTypes_brushStroke.editorPreferenceValueChanged(path, value)`

Hook appelé quand une préférence change. Ne fait rien ici.

- `path` (*string*) : Chemin de la préférence.
- `value` (*any*) : Nouvelle valeur.

#### `editor_dynamicDecals_layerTypes_brushStroke.registerEditorPreferences(prefsRegistry)`

Ne déclare aucune préférence (corps commenté).

- `prefsRegistry` (*table*) : Registre de préférences de l'éditeur.

#### `editor_dynamicDecals_layerTypes_brushStroke.setup(tool_in)`

Appelé par l'outil : récupère les modules liés, enregistre la section « Brush Stroke Properties », la GUI d'inspecteur du type brushStroke et les pages de documentation.

- `tool_in` (*table*) : Référence à l'outil editor_dynamicDecalsTool.

## Appels vers le moteur (C++)

- `debugDrawer:` `drawSphere`, `drawTextAdvanced`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/dynamicDecals/layerTypes/brushStroke.lua`.*

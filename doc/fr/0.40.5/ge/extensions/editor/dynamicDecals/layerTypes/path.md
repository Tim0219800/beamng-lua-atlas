# `editor_dynamicDecals_layerTypes_path`

*Fichier : `lua/ge/extensions/editor/dynamicDecals/layerTypes/path.lua` · VM : Game Engine (GE) · 793 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_dynamicDecals_layerTypes_path` : `extensions.load("editor_dynamicDecals_layerTypes_path")`, puis la globale `editor_dynamicDecals_layerTypes_path`

Type de calque « Path » de l'outil Dynamic Decals : des decals posés le long d'un chemin (points de contrôle interpolés en linéaire ou en courbe de Bézier), éventuellement orientés selon la courbure, ou remplacés par les caractères d'un texte avec une police (atlas généré par le module fonts). Fournit la section « Path Properties » (orientation, type de chemin, police, texte, étapes d'interpolation ; ordre 80), la GUI d'inspecteur du type path, des boutons de barre d'actions « Finish path layer » et « Remove last path layer data point » (visibles seulement pendant la création d'un chemin) et les pages de doc.

## Remarques

- La barre d'actions n'affiche ses boutons que si api.getEnablePathLayer() et api.hasActivePathLayer() sont vrais ; ils appellent api.finishPathLayer() et api.removeLastPathLayerPoint().
- Quand un texte est défini, le champ d'étapes d'interpolation est désactivé (les caractères remplacent les decals interpolés).
- Dans l'inspecteur, les dataPoints et les positions de caractères sont tracés dans le monde (debugDrawer:drawSphere et drawTextAdvanced avec l'index).
- La page « Properties » liste api.properties["Path Layer"] ; son bouton « Highlight » ouvre la section « Decal Properties » et surligne le widget correspondant.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_dynamicDecals_layerTypes_path.editorPreferenceValueChanged(path, value)` | Hook appelé quand une préférence change. Ne fait rien ici. *(interne)* | 718 |
| `editor_dynamicDecals_layerTypes_path.registerEditorPreferences(prefsRegistry)` | Ne déclare aucune préférence (corps commenté). *(interne)* | 712 |
| `editor_dynamicDecals_layerTypes_path.setup(tool_in)` | Appelé par l'outil : récupère les modules liés (dont fonts), enregistre la section « Path Properties » (avec bouton d'aide), la GUI d'inspecteur du type path, l'élément de barre d'actions « path layer » (ordre 40) et les pages de documentation. *(interne)* | 769 |

### Détail des paramètres

#### `editor_dynamicDecals_layerTypes_path.editorPreferenceValueChanged(path, value)`

Hook appelé quand une préférence change. Ne fait rien ici.

- `path` (*string*) : Chemin de la préférence.
- `value` (*any*) : Nouvelle valeur.

#### `editor_dynamicDecals_layerTypes_path.registerEditorPreferences(prefsRegistry)`

Ne déclare aucune préférence (corps commenté).

- `prefsRegistry` (*table*) : Registre de préférences de l'éditeur.

#### `editor_dynamicDecals_layerTypes_path.setup(tool_in)`

Appelé par l'outil : récupère les modules liés (dont fonts), enregistre la section « Path Properties » (avec bouton d'aide), la GUI d'inspecteur du type path, l'élément de barre d'actions « path layer » (ordre 40) et les pages de documentation.

- `tool_in` (*table*) : Référence à l'outil editor_dynamicDecalsTool.

## Appels vers le moteur (C++)

- `debugDrawer:` `drawSphere`, `drawTextAdvanced`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/dynamicDecals/layerTypes/path.lua`.*

# `editor_dynamicDecals_inspector`

*Fichier : `lua/ge/extensions/editor/dynamicDecals/inspector.lua` · VM : Game Engine (GE) · 144 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_dynamicDecals_inspector` : `extensions.load("editor_dynamicDecals_inspector")`, puis la globale `editor_dynamicDecals_inspector`

Inspecteur de l'outil Dynamic Decals : affiche et permet de modifier toutes les propriétés des calques (layers) sélectionnés (`editor.selection["dynamicDecalLayer"]`) ou de la brosse sélectionnée (`editor.selection["dynamicDecalBrush"]`). Les champs communs (uid, nom, type, enabled) sont dessinés ici ; le reste est délégué à une fonction GUI enregistrée par type de calque via registerLayerGui (par les modules layerTypes/*).

## Remarques

- Si aucune GUI n'est enregistrée pour un type de calque, un texte « No layerGui available for '<type>' » est affiché.
- En multi-sélection, chaque calque est dans un TreeNode « uid - nom ».
- Le bouton « Dump » appelle dump(layer) ; un second bouton dumpz(layer, 3) apparaît si la préférence `dynamicDecalsTool.general.debug` est active.
- Le tooltip du champ uid dit « Read-only type » (copier-coller).

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_dynamicDecals_inspector.editorPreferenceValueChanged(path, value)` | Hook appelé quand une préférence change. Ne fait rien ici. *(interne)* | 104 |
| `editor_dynamicDecals_inspector.inspectorGuiBrush(inspectorInfo)` | Si une brosse est sélectionnée, appelle brushes.inspectorGui(brush). *(interne)* | 91 |
| `editor_dynamicDecals_inspector.inspectorGuiLayer(inspectorInfo)` | Dessine l'inspecteur des calques sélectionnés (un seul directement, plusieurs dans des TreeNode). Ne fait rien si la sélection est nil. *(interne)* | 64 |
| `editor_dynamicDecals_inspector.registerEditorPreferences(prefsRegistry)` | Enregistre la préférence float `dynamicDecalsTool.inspector.texturePreviewSize` (défaut 128, de 32 à 512). *(interne)* | 98 |
| `editor_dynamicDecals_inspector.registerLayerGui(layerTypeId, guiFn)` | Enregistre la fonction qui dessine les propriétés spécifiques d'un type de calque ; elle est appelée avec (layer, guiId). | 133 |
| `editor_dynamicDecals_inspector.setup(tool_in)` | Appelé par l'outil : récupère API, brushes, docs, widgets et helper, installe une GUI par défaut pour chaque type de calque d'api.layerTypes et enregistre la page de doc « Inspector ». *(interne)* | 118 |

### Détail des paramètres

#### `editor_dynamicDecals_inspector.editorPreferenceValueChanged(path, value)`

Hook appelé quand une préférence change. Ne fait rien ici.

- `path` (*string*) : Chemin de la préférence.
- `value` (*any*) : Nouvelle valeur.

#### `editor_dynamicDecals_inspector.inspectorGuiBrush(inspectorInfo)`

Si une brosse est sélectionnée, appelle brushes.inspectorGui(brush).

- `inspectorInfo` (*table*) : Informations de l'inspecteur (non utilisées).

#### `editor_dynamicDecals_inspector.inspectorGuiLayer(inspectorInfo)`

Dessine l'inspecteur des calques sélectionnés (un seul directement, plusieurs dans des TreeNode). Ne fait rien si la sélection est nil.

- `inspectorInfo` (*table*) : Informations de l'inspecteur de l'éditeur (non utilisées ici).

#### `editor_dynamicDecals_inspector.registerEditorPreferences(prefsRegistry)`

Enregistre la préférence float `dynamicDecalsTool.inspector.texturePreviewSize` (défaut 128, de 32 à 512).

- `prefsRegistry` (*table*) : Registre de préférences de l'éditeur.

#### `editor_dynamicDecals_inspector.registerLayerGui(layerTypeId, guiFn)`

Enregistre la fonction qui dessine les propriétés spécifiques d'un type de calque ; elle est appelée avec (layer, guiId).

- `layerTypeId` (*integer*) : Identifiant du type de calque (valeur de api.layerTypes).
- `guiFn` (*function*) : function(layer, guiId) qui dessine l'interface.

#### `editor_dynamicDecals_inspector.setup(tool_in)`

Appelé par l'outil : récupère API, brushes, docs, widgets et helper, installe une GUI par défaut pour chaque type de calque d'api.layerTypes et enregistre la page de doc « Inspector ».

- `tool_in` (*table*) : Référence à l'outil editor_dynamicDecalsTool.

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/dynamicDecals/inspector.lua`.*

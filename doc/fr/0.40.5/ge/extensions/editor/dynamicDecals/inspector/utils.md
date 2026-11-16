# `editor_dynamicDecals_inspector_utils`

*Fichier : `lua/ge/extensions/editor/dynamicDecals/inspector/utils.lua` · VM : Game Engine (GE) · 152 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_dynamicDecals_inspector_utils` : `extensions.load("editor_dynamicDecals_inspector_utils")`, puis la globale `editor_dynamicDecals_inspector_utils`

Widgets ImGui réutilisables par les GUI de calques de l'inspecteur Dynamic Decals : sélecteur de texture (champ en lecture seule, bouton dossier, bouton de remise à zéro, aperçu, dépôt par glisser-déposer) et éditeur de dégradé à quatre coins pour un calque decal. Chaque modification appelle api.setLayer(layer, true). Dépend de editor_api_dynamicDecals.

## Remarques

- Bug : decalTextureWidgetInspect utilise une variable `propert` (faute de frappe de `property`, globale nil) dans les identifiants ImGui ; les widgets de deux propriétés texture d'un même calque partagent donc le même identifiant.
- Le glisser-déposer accepte la charge « DynDecalTextureDrapDrop » (faute de frappe dans le nom) ; la charge doit faire 256 octets (assert), et contient le chemin de la texture.
- Le dégradé lit decalGradientColor{TopLeft,TopRight,BottomLeft,BottomRight} (ColorI 0..255) et les réécrit en ColorI.
- L'aperçu de texture est limité par la préférence `dynamicDecalsTool.inspector.texturePreviewSize`.

**Dépendances (chargées avant) :** `editor_api_dynamicDecals`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_dynamicDecals_inspector_utils.decalColorGradientWidgetInspect(k, layer, guiId)` | Dessine un carré dégradé à quatre coins avec un sélecteur de couleur RGBA à chaque coin ; met à jour les propriétés decalGradientColor* du calque. | 56 |
| `editor_dynamicDecals_inspector_utils.decalTextureWidgetInspect(layer, property, guiId, removeTextureOverridePath)` | Dessine un sélecteur de texture pour layer[property] : chemin en lecture seule, ouverture d'une boîte de fichier (png/jpg/jpeg, dossier par défaut /art/decals/dynDecals/), suppression, aperçu et zone de dépôt. Affecte layer[property] puis appelle api.setLayer(layer, true). | 17 |
| `editor_dynamicDecals_inspector_utils.editorPreferenceValueChanged(path, value)` | Hook appelé quand une préférence change. Ne fait rien ici. *(interne)* | 136 |
| `editor_dynamicDecals_inspector_utils.onGui()` | Fonction vide. *(interne)* *(hook)* | 126 |
| `editor_dynamicDecals_inspector_utils.registerEditorPreferences(prefsRegistry)` | Ne déclare aucune préférence (corps commenté). *(interne)* | 130 |
| `editor_dynamicDecals_inspector_utils.setup(tool_in)` | Appelé par l'outil : mémorise l'outil et l'API. *(interne)* | 140 |

### Détail des paramètres

#### `editor_dynamicDecals_inspector_utils.decalColorGradientWidgetInspect(k, layer, guiId)`

Dessine un carré dégradé à quatre coins avec un sélecteur de couleur RGBA à chaque coin ; met à jour les propriétés decalGradientColor* du calque.

- `k` (*any*) : Non utilisé dans le corps de la fonction.
- `layer` (*table*) : Calque decal contenant les quatre couleurs de dégradé.
- `guiId` (*string*) : Suffixe d'identifiant ImGui.

#### `editor_dynamicDecals_inspector_utils.decalTextureWidgetInspect(layer, property, guiId, removeTextureOverridePath)`

Dessine un sélecteur de texture pour layer[property] : chemin en lecture seule, ouverture d'une boîte de fichier (png/jpg/jpeg, dossier par défaut /art/decals/dynDecals/), suppression, aperçu et zone de dépôt. Affecte layer[property] puis appelle api.setLayer(layer, true).

- `layer` (*table*) : Données du calque.
- `property` (*string*) : Nom du champ contenant le chemin de texture.
- `guiId` (*string*) : Suffixe d'identifiant ImGui.
- `removeTextureOverridePath` (*string|nil*) : Valeur mise dans la propriété par le bouton supprimer ; défaut « / ».

#### `editor_dynamicDecals_inspector_utils.editorPreferenceValueChanged(path, value)`

Hook appelé quand une préférence change. Ne fait rien ici.

- `path` (*string*) : Chemin de la préférence.
- `value` (*any*) : Nouvelle valeur.

#### `editor_dynamicDecals_inspector_utils.registerEditorPreferences(prefsRegistry)`

Ne déclare aucune préférence (corps commenté).

- `prefsRegistry` (*table*) : Registre de préférences de l'éditeur.

#### `editor_dynamicDecals_inspector_utils.setup(tool_in)`

Appelé par l'outil : mémorise l'outil et l'API.

- `tool_in` (*table*) : Référence à l'outil editor_dynamicDecalsTool.

## Champs

| Champ | Type | Description |
|---|---|---|
| `dependencies` | string[] | Extensions chargées avant celle-ci : {"editor_api_dynamicDecals"}. |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/dynamicDecals/inspector/utils.lua`.*

# `editor_dynamicDecals_layerTypes_decal`

*Fichier : `lua/ge/extensions/editor/dynamicDecals/layerTypes/decal.lua` · VM : Game Engine (GE) · 1254 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_dynamicDecals_layerTypes_decal` : `extensions.load("editor_dynamicDecals_layerTypes_decal")`, puis la globale `editor_dynamicDecals_layerTypes_decal`

Type de calque « Decal » de l'outil Dynamic Decals, le plus important : un decal unique avec couleur, textures (color, alpha, metallic, normal, roughness), échelle, rotation, skew, UV, masque alpha, miroir, dégradé et propriétés SDF (Signed Distance Fields : contours, adoucissement). Fournit la section « Decal Properties » (réglages du decal courant, ordre 60), la GUI d'inspecteur du type decal, la fenêtre d'introduction SDF, la fenêtre de choix d'un caractère de police et les pages de documentation (Decal Layers, Properties, SDF).

## Remarques

- Une texture est « compatible SDF » si son fichier sidecar (texturesApi.readSidecarFile) contient isSdfCompatible = true.
- La fenêtre d'intro SDF s'ouvre à l'apparition d'une texture couleur compatible SDF, tant que la préférence `dynamicDecalsTool.decalProperties.doNotShowSdfIntroAgain` est false et que la fenêtre n'a pas été fermée dans la session.
- Dans l'inspecteur, la mise à jour de decalScale n'écrit que .x et .z (pas .y) ; les modifications d'un widget passent par widgets.draw puis api.setLayer(layer, true) quand l'édition est terminée.
- La préférence `dynamicDecalsTool.inspector.applyMirroredPropertyToChildren` (défaut true) propage mirrored et flipMirroredDecal aux calques enfants (via setPropertyInChildrenRec).
- Le fichier enregistre aussi deux propriétés ajoutées localement : « mirroredDebug » (trace la ligne du plan de miroir sur la forme) et « mirrorOffsetProperty » (décale le plan, de -1 à 1).

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_dynamicDecals_layerTypes_decal.checkColorDecalTexturesSdfCompatible()` | Si la texture couleur courante est compatible SDF, affiche la fenêtre d'introduction SDF (sauf si elle a été fermée ou si la préférence doNotShowSdfIntroAgain est vraie). | 77 |
| `editor_dynamicDecals_layerTypes_decal.editModeUpdate(dtReal, dtSim, dtRaw)` | Appelé à chaque frame par le mode d'édition (via tool.registerEditorOnUpdateFn) : décompte le minuteur de mise en évidence des propriétés SDF. *(interne)* | 1154 |
| `editor_dynamicDecals_layerTypes_decal.editorPreferenceValueChanged(path, value)` | Hook appelé quand une préférence change. Ne fait rien ici. *(interne)* | 1146 |
| `editor_dynamicDecals_layerTypes_decal.hideSdfIntroWindow()` | Ferme la fenêtre d'introduction SDF. | 1247 |
| `editor_dynamicDecals_layerTypes_decal.isTexturesSdfCompatible(texturePath)` | Indique si la texture donnée est compatible SDF, d'après son fichier de métadonnées. | 67 |
| `editor_dynamicDecals_layerTypes_decal.registerEditorPreferences(prefsRegistry)` | Enregistre `dynamicDecalsTool.decalProperties` : scaleStep (float 0.025, de 0.001 à 0.25), rotationStep (float 15 degrés, de 1 à 360), texturePreviewSize (float 128, de 32 à 512), doNotShowSdfIntroAgain (bool false) ; et `dynamicDecalsTool.inspector.applyMirroredPropertyToChildren` (bool true). *(interne)* | 1134 |
| `editor_dynamicDecals_layerTypes_decal.setup(tool_in)` | Appelé par l'outil : récupère les modules liés, enregistre les fenêtres (SDF 400x400, caractère de police 550x550), la section « Decal Properties », les callbacks d'update et de GUI, la GUI d'inspecteur du type decal, les pages de documentation et la liste des blend modes. *(interne)* | 1211 |
| `editor_dynamicDecals_layerTypes_decal.showSdfIntroWindow()` | Ouvre la fenêtre « Dynamic Decals - SDF Introduction ». | 1246 |

### Détail des paramètres

#### `editor_dynamicDecals_layerTypes_decal.editModeUpdate(dtReal, dtSim, dtRaw)`

Appelé à chaque frame par le mode d'édition (via tool.registerEditorOnUpdateFn) : décompte le minuteur de mise en évidence des propriétés SDF.

- `dtReal` (*number*) : Delta temps réel (s).
- `dtSim` (*number*) : Delta temps simulation (s).
- `dtRaw` (*number*) : Delta temps brut (s).

#### `editor_dynamicDecals_layerTypes_decal.editorPreferenceValueChanged(path, value)`

Hook appelé quand une préférence change. Ne fait rien ici.

- `path` (*string*) : Chemin de la préférence.
- `value` (*any*) : Nouvelle valeur.

#### `editor_dynamicDecals_layerTypes_decal.isTexturesSdfCompatible(texturePath)`

Indique si la texture donnée est compatible SDF, d'après son fichier de métadonnées.

- `texturePath` (*string|nil*) : Chemin de la texture ; par défaut la texture couleur courante du decal (api.getDecalTexturePath("color")).
- **renvoie** : boolean true si la métadonnée isSdfCompatible est vraie.

#### `editor_dynamicDecals_layerTypes_decal.registerEditorPreferences(prefsRegistry)`

Enregistre `dynamicDecalsTool.decalProperties` : scaleStep (float 0.025, de 0.001 à 0.25), rotationStep (float 15 degrés, de 1 à 360), texturePreviewSize (float 128, de 32 à 512), doNotShowSdfIntroAgain (bool false) ; et `dynamicDecalsTool.inspector.applyMirroredPropertyToChildren` (bool true).

- `prefsRegistry` (*table*) : Registre de préférences de l'éditeur.

#### `editor_dynamicDecals_layerTypes_decal.setup(tool_in)`

Appelé par l'outil : récupère les modules liés, enregistre les fenêtres (SDF 400x400, caractère de police 550x550), la section « Decal Properties », les callbacks d'update et de GUI, la GUI d'inspecteur du type decal, les pages de documentation et la liste des blend modes.

- `tool_in` (*table*) : Référence à l'outil editor_dynamicDecalsTool.

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/dynamicDecals/layerTypes/decal.lua`.*

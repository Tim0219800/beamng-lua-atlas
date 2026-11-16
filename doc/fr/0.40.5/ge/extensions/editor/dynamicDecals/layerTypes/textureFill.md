# `editor_dynamicDecals_layerTypes_textureFill`

*Fichier : `lua/ge/extensions/editor/dynamicDecals/layerTypes/textureFill.lua` · VM : Game Engine (GE) · 203 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_dynamicDecals_layerTypes_textureFill` : `extensions.load("editor_dynamicDecals_layerTypes_textureFill")`, puis la globale `editor_dynamicDecals_layerTypes_textureFill`

Type de calque « Texture Fill » de l'outil Dynamic Decals : remplit le véhicule avec un motif basé sur une texture d'entrée, avec couleur (ou palette du véhicule), échelle et décalage (offset). Fournit la fenêtre « Add Texture Fill Layer » (OK appelle api.addTextureFillLayer), le bouton de barre d'outils (ordre 20), la GUI d'inspecteur du type textureFill (fillTexturePath, colorPaletteMapId, color, scale, offset) et la page de doc.

## Remarques

- colorPaletteMapId : 0 = couleur du calque ; 1 = couleur du véhicule ; 2 = colorPalette0 ; 3 = colorPalette1. Avec une valeur autre que 0 le champ couleur est désactivé.
- La fenêtre d'ajout réutilise les réglages « fill layer » de l'API (api.getFillLayerColor / setFillLayerColorPaletteMapId) pour la couleur, mais les propriétés de texture (api.getFillTexturePath, getTextureFillLayerScale, getTextureFillOffset) pour le reste.
- Le code lit getPlayerVehicle(0) sans vérifier qu'il n'est pas nil quand une palette est choisie.
- lockFillTextureLayerScaleRatio est déclaré mais jamais utilisé ; le réglage du blend mode est commenté (« heavily WIP »).

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_dynamicDecals_layerTypes_textureFill.editorPreferenceValueChanged(path, value)` | Hook appelé quand une préférence change. Ne fait rien ici. *(interne)* | 161 |
| `editor_dynamicDecals_layerTypes_textureFill.openAddLayerWindow()` | Ouvre la fenêtre « Add Texture Fill Layer ». | 165 |
| `editor_dynamicDecals_layerTypes_textureFill.registerEditorPreferences(prefsRegistry)` | Ne déclare aucune préférence (corps commenté). *(interne)* | 155 |
| `editor_dynamicDecals_layerTypes_textureFill.setup(tool_in)` | Appelé par l'outil : récupère les modules liés, enregistre le dessin de la fenêtre d'ajout, la GUI d'inspecteur du type textureFill, l'élément de barre d'outils « textureFill », la page de documentation et la fenêtre (450x310). *(interne)* | 181 |

### Détail des paramètres

#### `editor_dynamicDecals_layerTypes_textureFill.editorPreferenceValueChanged(path, value)`

Hook appelé quand une préférence change. Ne fait rien ici.

- `path` (*string*) : Chemin de la préférence.
- `value` (*any*) : Nouvelle valeur.

#### `editor_dynamicDecals_layerTypes_textureFill.registerEditorPreferences(prefsRegistry)`

Ne déclare aucune préférence (corps commenté).

- `prefsRegistry` (*table*) : Registre de préférences de l'éditeur.

#### `editor_dynamicDecals_layerTypes_textureFill.setup(tool_in)`

Appelé par l'outil : récupère les modules liés, enregistre le dessin de la fenêtre d'ajout, la GUI d'inspecteur du type textureFill, l'élément de barre d'outils « textureFill », la page de documentation et la fenêtre (450x310).

- `tool_in` (*table*) : Référence à l'outil editor_dynamicDecalsTool.

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/dynamicDecals/layerTypes/textureFill.lua`.*

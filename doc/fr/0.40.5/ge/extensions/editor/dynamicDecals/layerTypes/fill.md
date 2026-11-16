# `editor_dynamicDecals_layerTypes_fill`

*Fichier : `lua/ge/extensions/editor/dynamicDecals/layerTypes/fill.lua` · VM : Game Engine (GE) · 165 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_dynamicDecals_layerTypes_fill` : `extensions.load("editor_dynamicDecals_layerTypes_fill")`, puis la globale `editor_dynamicDecals_layerTypes_fill`

Type de calque « Fill » de l'outil Dynamic Decals : remplit tout le véhicule avec une couleur unie, utile comme base d'un design. Fournit la fenêtre « Add Fill Layer » (palette de couleur + couleur, OK appelle api.addFillLayer puis ajoute la couleur à l'historique), le bouton de barre d'outils (ordre 10), la GUI d'inspecteur du type fill et la page de documentation.

## Remarques

- colorPaletteMapId : 0 = couleur propre du calque (fill_color) ; 1 = couleur du véhicule (vehicleObj.color) ; 2 = colorPalette0 ; 3 = colorPalette1. Pour les valeurs différentes de 0 le champ couleur est désactivé et l'aperçu montre la couleur de la palette du véhicule.
- Le code lit getPlayerVehicle(0) sans vérifier qu'il n'est pas nil quand une palette est choisie.
- Le réglage du blend mode du fill layer est commenté (« heavily WIP »).

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_dynamicDecals_layerTypes_fill.editorPreferenceValueChanged(path, value)` | Hook appelé quand une préférence change. Ne fait rien ici. *(interne)* | 125 |
| `editor_dynamicDecals_layerTypes_fill.openAddLayerWindow()` | Ouvre la fenêtre « Add Fill Layer ». | 129 |
| `editor_dynamicDecals_layerTypes_fill.registerEditorPreferences(prefsRegistry)` | Ne déclare aucune préférence (corps commenté). *(interne)* | 119 |
| `editor_dynamicDecals_layerTypes_fill.setup(tool_in)` | Appelé par l'outil : récupère les modules liés, enregistre la fenêtre d'ajout (360x140), le dessin de cette fenêtre, la GUI d'inspecteur du type fill, l'élément de barre d'outils « fill » et la page de documentation. *(interne)* | 143 |

### Détail des paramètres

#### `editor_dynamicDecals_layerTypes_fill.editorPreferenceValueChanged(path, value)`

Hook appelé quand une préférence change. Ne fait rien ici.

- `path` (*string*) : Chemin de la préférence.
- `value` (*any*) : Nouvelle valeur.

#### `editor_dynamicDecals_layerTypes_fill.registerEditorPreferences(prefsRegistry)`

Ne déclare aucune préférence (corps commenté).

- `prefsRegistry` (*table*) : Registre de préférences de l'éditeur.

#### `editor_dynamicDecals_layerTypes_fill.setup(tool_in)`

Appelé par l'outil : récupère les modules liés, enregistre la fenêtre d'ajout (360x140), le dessin de cette fenêtre, la GUI d'inspecteur du type fill, l'élément de barre d'outils « fill » et la page de documentation.

- `tool_in` (*table*) : Référence à l'outil editor_dynamicDecalsTool.

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/dynamicDecals/layerTypes/fill.lua`.*

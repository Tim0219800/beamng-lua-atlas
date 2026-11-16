# `editor_dynamicDecals_debugSection`

*Fichier : `lua/ge/extensions/editor/dynamicDecals/debugSection.lua` · VM : Game Engine (GE) · 193 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_dynamicDecals_debugSection` : `extensions.load("editor_dynamicDecals_debugSection")`, puis la globale `editor_dynamicDecals_debugSection`

Section « Debug » (ordre 1010) de l'outil Dynamic Decals : une série de boutons de test pour développeurs. Ils appellent l'API editor_api_dynamicDecals (reprojection des calques, bake de brosse, dump du layerStack, noms des matériaux, profondeur/normale de surface, mise à jour des matériaux du véhicule), les autres modules de l'outil (textures, gizmo, notification, docs, widgets, settings) et un générateur de matériaux dynamiques pour tous les véhicules.

## Remarques

- Le bouton « Generate Materials » parcourt /vehicles/*, lit <véhicule>/main.materials.json et, pour chaque matériau utilisé (settings.getUsedMaterialNames) dont `mapTo` correspond, crée un matériau « <nom>.skin.dynamicTextures » dont l'étape 2 utilise les textures @DynamicTextureBaseColor / ColorPalette / Metallic / Roughness. Le résultat est écrit dans <véhicule>/dynamicDecals/main.materials.json : écriture dans les fichiers du jeu, à utiliser avec précaution.
- Ce code suppose que dynamicDecal Stages[2] existe dans chaque matériau lu ; sinon il lève une erreur.
- La case « Reproject Layers every frame » appelle api.reprojectLayers() à chaque frame d'affichage de la section : coûteux.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_dynamicDecals_debugSection.editorPreferenceValueChanged(path, value)` | Hook appelé quand une préférence change. Ne fait rien ici. *(interne)* | 172 |
| `editor_dynamicDecals_debugSection.registerEditorPreferences(prefsRegistry)` | Ne déclare aucune préférence (le corps est entièrement commenté). *(interne)* | 166 |
| `editor_dynamicDecals_debugSection.setup(tool_in)` | Appelé par l'outil : récupère l'API et les modules textures, gizmo, notification, docs, widgets, settings, puis enregistre la section « Debug » (ordre 1010). *(interne)* | 176 |

### Détail des paramètres

#### `editor_dynamicDecals_debugSection.editorPreferenceValueChanged(path, value)`

Hook appelé quand une préférence change. Ne fait rien ici.

- `path` (*string*) : Chemin de la préférence.
- `value` (*any*) : Nouvelle valeur.

#### `editor_dynamicDecals_debugSection.registerEditorPreferences(prefsRegistry)`

Ne déclare aucune préférence (le corps est entièrement commenté).

- `prefsRegistry` (*table*) : Registre de préférences de l'éditeur.

#### `editor_dynamicDecals_debugSection.setup(tool_in)`

Appelé par l'outil : récupère l'API et les modules textures, gizmo, notification, docs, widgets, settings, puis enregistre la section « Debug » (ordre 1010).

- `tool_in` (*table*) : Référence à l'outil editor_dynamicDecalsTool.

## Appels vers le moteur (C++)

- `FS:` `fileExists`, `findFiles`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/dynamicDecals/debugSection.lua`.*

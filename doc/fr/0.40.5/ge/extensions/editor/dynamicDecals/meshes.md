# `editor_dynamicDecals_meshes`

*Fichier : `lua/ge/extensions/editor/dynamicDecals/meshes.lua` · VM : Game Engine (GE) · 62 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_dynamicDecals_meshes` : `extensions.load("editor_dynamicDecals_meshes")`, puis la globale `editor_dynamicDecals_meshes`

Module (expérimental, désactivé) de l'outil Dynamic Decals pour changer le fichier de forme (.dae) sur lequel les decals sont projetés. Le code de la section existe mais l'enregistrement de la section « Meshes (Experimental) » est commenté dans setup : aucune interface n'est visible.

## Remarques

- sectionGui appelle api.getShapepath() (casse différente de api.getShapePath() utilisé juste avant) : probable faute de frappe qui lèverait une erreur si la section était activée.
- Le logTag est bien « editor_dynamicDecals_meshes ».

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_dynamicDecals_meshes.editorPreferenceValueChanged(path, value)` | Hook appelé quand une préférence change. Ne fait rien ici. *(interne)* | 46 |
| `editor_dynamicDecals_meshes.registerEditorPreferences(prefsRegistry)` | Ne déclare aucune préférence (corps commenté). *(interne)* | 40 |
| `editor_dynamicDecals_meshes.setup(tool_in)` | Appelé par l'outil : mémorise l'outil, l'API et le module settings. N'enregistre aucune section (ligne commentée). *(interne)* | 50 |

### Détail des paramètres

#### `editor_dynamicDecals_meshes.editorPreferenceValueChanged(path, value)`

Hook appelé quand une préférence change. Ne fait rien ici.

- `path` (*string*) : Chemin de la préférence.
- `value` (*any*) : Nouvelle valeur.

#### `editor_dynamicDecals_meshes.registerEditorPreferences(prefsRegistry)`

Ne déclare aucune préférence (corps commenté).

- `prefsRegistry` (*table*) : Registre de préférences de l'éditeur.

#### `editor_dynamicDecals_meshes.setup(tool_in)`

Appelé par l'outil : mémorise l'outil, l'API et le module settings. N'enregistre aucune section (ligne commentée).

- `tool_in` (*table*) : Référence à l'outil editor_dynamicDecalsTool.

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/dynamicDecals/meshes.lua`.*

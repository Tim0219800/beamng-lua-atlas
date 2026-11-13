# `editor_dynamicDecals_debugTextures`

*Fichier : `lua/ge/extensions/editor/dynamicDecals/debugTextures.lua` · VM : Game Engine (GE) · 63 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_dynamicDecals_debugTextures` : `extensions.load("editor_dynamicDecals_debugTextures")`, puis la globale `editor_dynamicDecals_debugTextures`

Section de debug « Debug Textures » de l'outil Dynamic Decals. Affiche, dans des en-têtes repliables, les textures internes de l'API editor_api_dynamicDecals : dynamiques, baked, highlight, decal (entrée des brosses) et masques. La largeur maximale des aperçus vient de la préférence `dynamicDecalsTool.debugTextures.maxImageWidgetWidth` (défaut 512).

## Remarques

- La variable textureSet n'est jamais renseignée (son affectation est commentée), donc l'en-tête « Combined Textures » n'apparaît jamais.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_dynamicDecals_debugTextures.editorPreferenceValueChanged(path, value)` | Hook appelé quand une préférence change. Ne fait rien ici. *(interne)* | 48 |
| `editor_dynamicDecals_debugTextures.registerEditorPreferences(prefsRegistry)` | Enregistre la préférence float `dynamicDecalsTool.debugTextures.maxImageWidgetWidth` (défaut 512). *(interne)* | 42 |
| `editor_dynamicDecals_debugTextures.setup(tool_in)` | Appelé par l'outil : récupère l'API et enregistre la section « Debug Textures » (ordre 1130). *(interne)* | 52 |

### Détail des paramètres

#### `editor_dynamicDecals_debugTextures.editorPreferenceValueChanged(path, value)`

Hook appelé quand une préférence change. Ne fait rien ici.

- `path` (*string*) : Chemin de la préférence.
- `value` (*any*) : Nouvelle valeur.

#### `editor_dynamicDecals_debugTextures.registerEditorPreferences(prefsRegistry)`

Enregistre la préférence float `dynamicDecalsTool.debugTextures.maxImageWidgetWidth` (défaut 512).

- `prefsRegistry` (*table*) : Registre de préférences de l'éditeur.

#### `editor_dynamicDecals_debugTextures.setup(tool_in)`

Appelé par l'outil : récupère l'API et enregistre la section « Debug Textures » (ordre 1130).

- `tool_in` (*table*) : Référence à l'outil editor_dynamicDecalsTool.

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/dynamicDecals/debugTextures.lua`.*

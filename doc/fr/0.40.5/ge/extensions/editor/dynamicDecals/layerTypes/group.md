# `editor_dynamicDecals_layerTypes_group`

*Fichier : `lua/ge/extensions/editor/dynamicDecals/layerTypes/group.lua` · VM : Game Engine (GE) · 69 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_dynamicDecals_layerTypes_group` : `extensions.load("editor_dynamicDecals_layerTypes_group")`, puis la globale `editor_dynamicDecals_layerTypes_group`

Type de calque « Group » de l'outil Dynamic Decals : un calque conteneur qui regroupe d'autres calques ; le désactiver masque tous ses enfants. Ce module ajoute le bouton « Add group » dans la barre d'outils (api.addGroup), enregistre une GUI d'inspecteur vide pour ce type et la page de documentation « Layer Types / Group Layers ».

## Remarques

- inspectLayerGui et sectionGui (exporté sous le nom onGui) sont des fonctions vides : un groupe n'a pas de propriété propre dans l'inspecteur au-delà du nom et de enabled.
- L'enregistrement de la section « Group Properties » est commenté.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_dynamicDecals_layerTypes_group.editorPreferenceValueChanged(path, value)` | Hook appelé quand une préférence change. Ne fait rien ici. *(interne)* | 37 |
| `editor_dynamicDecals_layerTypes_group.onGui(guiId)` | Fonction vide (section non utilisée). *(interne)* *(hook)* | 27 |
| `editor_dynamicDecals_layerTypes_group.registerEditorPreferences(prefsRegistry)` | Ne déclare aucune préférence (corps commenté). *(interne)* | 31 |
| `editor_dynamicDecals_layerTypes_group.setup(tool_in)` | Appelé par l'outil : enregistre la GUI d'inspecteur du type group, l'élément de barre d'outils « group » (ordre 30) et la page de documentation. *(interne)* | 52 |

### Détail des paramètres

#### `editor_dynamicDecals_layerTypes_group.editorPreferenceValueChanged(path, value)`

Hook appelé quand une préférence change. Ne fait rien ici.

- `path` (*string*) : Chemin de la préférence.
- `value` (*any*) : Nouvelle valeur.

#### `editor_dynamicDecals_layerTypes_group.onGui(guiId)`

Fonction vide (section non utilisée).

- `guiId` (*string*) : Suffixe d'identifiant ImGui (non utilisé).

#### `editor_dynamicDecals_layerTypes_group.registerEditorPreferences(prefsRegistry)`

Ne déclare aucune préférence (corps commenté).

- `prefsRegistry` (*table*) : Registre de préférences de l'éditeur.

#### `editor_dynamicDecals_layerTypes_group.setup(tool_in)`

Appelé par l'outil : enregistre la GUI d'inspecteur du type group, l'élément de barre d'outils « group » (ordre 30) et la page de documentation.

- `tool_in` (*table*) : Référence à l'outil editor_dynamicDecalsTool.

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/dynamicDecals/layerTypes/group.lua`.*

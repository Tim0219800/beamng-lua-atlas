# `editor_dynamicDecals_layerStack`

*Fichier : `lua/ge/extensions/editor/dynamicDecals/layerStack.lua` · VM : Game Engine (GE) · 850 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_dynamicDecals_layerStack` : `extensions.load("editor_dynamicDecals_layerStack")`, puis la globale `editor_dynamicDecals_layerStack`

Section « Decal Stack / Layers » (ordre 140) de l'outil Dynamic Decals : liste hiérarchique de tous les calques du design, avec icône colorée par type, sélection (via le module selection), activation, duplication, suppression, édition de masque, miroir et réorganisation par glisser-déposer (changement d'ordre et de parent, dans des groupes). L'ordre d'affichage est configurable (haut vers bas ou bas vers haut).

## Remarques

- Préférences `dynamicDecalsTool.layerStack` : topToBottomLayerStructure (bool, vrai) et layerTypeIconColor (table type -> RGBA : decal rouge, fill vert, textureFill bleu, group jaune, brushStroke cyan, path magenta, linkedSet orange).
- registerLayerElementGui est une fonction vide (point d'extension non implémenté).
- Le fichier fait environ 850 lignes ; la fonction layerElement (dessin d'un calque) en représente la majeure partie.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_dynamicDecals_layerStack.editorPreferenceValueChanged(path, value)` | Hook appelé quand une préférence change. Ne fait rien ici. *(interne)* | 805 |
| `editor_dynamicDecals_layerStack.registerEditorPreferences(prefsRegistry)` | Enregistre la sous-catégorie `dynamicDecalsTool.layerStack` : topToBottomLayerStructure et layerTypeIconColor (avec un éditeur graphique de couleurs par type). *(interne)* | 787 |
| `editor_dynamicDecals_layerStack.registerLayerElementGui()` | Fonction vide, sans effet (point d'extension prévu pour des éléments d'interface de calque). *(interne)* | 840 |
| `editor_dynamicDecals_layerStack.setup(tool_in)` | Appelé par l'outil : récupère l'API et les modules (fill, textureFill, gizmo, selection, helper, docs), enregistre la section « Decal Stack / Layers » (ordre 140, ouverte par défaut) et la page de documentation « Layer Stack ». *(interne)* | 821 |

### Détail des paramètres

#### `editor_dynamicDecals_layerStack.editorPreferenceValueChanged(path, value)`

Hook appelé quand une préférence change. Ne fait rien ici.

- `path` (*string*) : Chemin de la préférence.
- `value` (*any*) : Nouvelle valeur.

#### `editor_dynamicDecals_layerStack.registerEditorPreferences(prefsRegistry)`

Enregistre la sous-catégorie `dynamicDecalsTool.layerStack` : topToBottomLayerStructure et layerTypeIconColor (avec un éditeur graphique de couleurs par type).

- `prefsRegistry` (*table*) : Registre de préférences de l'éditeur.

#### `editor_dynamicDecals_layerStack.setup(tool_in)`

Appelé par l'outil : récupère l'API et les modules (fill, textureFill, gizmo, selection, helper, docs), enregistre la section « Decal Stack / Layers » (ordre 140, ouverte par défaut) et la page de documentation « Layer Stack ».

- `tool_in` (*table*) : Référence à l'outil editor_dynamicDecalsTool.

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/dynamicDecals/layerStack.lua`.*

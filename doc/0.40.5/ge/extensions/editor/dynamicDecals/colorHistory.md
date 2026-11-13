# `editor_dynamicDecals_colorHistory`

*Fichier : `lua/ge/extensions/editor/dynamicDecals/colorHistory.lua` · VM : Game Engine (GE) · 93 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_dynamicDecals_colorHistory` : `extensions.load("editor_dynamicDecals_colorHistory")`, puis la globale `editor_dynamicDecals_colorHistory`

Section « Color History » de l'outil Dynamic Decals. Garde en préférence editor (`dynamicDecalsTool.colorHistory.history`) la liste des dernières couleurs utilisées (RGBA) et permet de les réappliquer comme couleur de decal ou de fill layer, ou de les supprimer. La taille maximale est la préférence `maxHistoryCount` (défaut 10, de 2 à 128).

## Exemple

```lua
extensions.editor_dynamicDecals_colorHistory.addColorToHistory(Point4F(1, 0, 0, 1))
```

## Remarques

- addColorToHistory lit color.x/.y/.z/.w : il faut une valeur type Point4F/vec4, pas une table {r,g,b,a}.
- Dans addColorToHistory, table.remove est appelé pendant ipairs : au plus un doublon est correctement géré.
- La suppression d'une couleur dans onGui modifie la table pendant ipairs ; sans conséquence puisque la boucle continue sur la table raccourcie.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_dynamicDecals_colorHistory.addColorToHistory(color)` | Ajoute la couleur en tête de l'historique (retire d'abord une entrée identique), tronque à maxHistoryCount et enregistre la préférence. | 15 |
| `editor_dynamicDecals_colorHistory.editorPreferenceValueChanged(path, value)` | Hook appelé quand une préférence change. Ne fait rien ici. *(interne)* | 61 |
| `editor_dynamicDecals_colorHistory.onGui(guiId)` | Dessine la liste : pour chaque couleur un widget, les boutons « Set as decal color » (api.setDecalColor), « Set as fill layer color » (api.setFillLayerColor) et une icône de suppression. Utilisé comme contenu de la section et de l'éditeur de la préférence `history`. *(interne)* *(hook)* | 29 |
| `editor_dynamicDecals_colorHistory.registerEditorPreferences(prefsRegistry)` | Enregistre la sous-catégorie `dynamicDecalsTool.colorHistory` : `history` (table, éditée par onGui) et `maxHistoryCount` (int, défaut 10, min 2, max 128). *(interne)* | 52 |
| `editor_dynamicDecals_colorHistory.setup(tool_in)` | Appelé par l'outil : récupère l'API et docs, enregistre la section « Color History » (ordre 122) et sa page de documentation. *(interne)* | 76 |

### Détail des paramètres

#### `editor_dynamicDecals_colorHistory.addColorToHistory(color)`

Ajoute la couleur en tête de l'historique (retire d'abord une entrée identique), tronque à maxHistoryCount et enregistre la préférence.

- `color` (*Point4F*) : Couleur avec champs x, y, z, w (RGBA).

#### `editor_dynamicDecals_colorHistory.editorPreferenceValueChanged(path, value)`

Hook appelé quand une préférence change. Ne fait rien ici.

- `path` (*string*) : Chemin de la préférence.
- `value` (*any*) : Nouvelle valeur.

#### `editor_dynamicDecals_colorHistory.onGui(guiId)`

Dessine la liste : pour chaque couleur un widget, les boutons « Set as decal color » (api.setDecalColor), « Set as fill layer color » (api.setFillLayerColor) et une icône de suppression. Utilisé comme contenu de la section et de l'éditeur de la préférence `history`.

- `guiId` (*string*) : Suffixe pour rendre les identifiants ImGui uniques.

#### `editor_dynamicDecals_colorHistory.registerEditorPreferences(prefsRegistry)`

Enregistre la sous-catégorie `dynamicDecalsTool.colorHistory` : `history` (table, éditée par onGui) et `maxHistoryCount` (int, défaut 10, min 2, max 128).

- `prefsRegistry` (*table*) : Registre de préférences de l'éditeur.

#### `editor_dynamicDecals_colorHistory.setup(tool_in)`

Appelé par l'outil : récupère l'API et docs, enregistre la section « Color History » (ordre 122) et sa page de documentation.

- `tool_in` (*table*) : Référence à l'outil editor_dynamicDecalsTool.

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/dynamicDecals/colorHistory.lua`.*

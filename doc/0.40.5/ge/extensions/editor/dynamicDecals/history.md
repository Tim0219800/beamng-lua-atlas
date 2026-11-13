# `editor_dynamicDecals_history`

*Fichier : `lua/ge/extensions/editor/dynamicDecals/history.lua` · VM : Game Engine (GE) · 104 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_dynamicDecals_history` : `extensions.load("editor_dynamicDecals_history")`, puis la globale `editor_dynamicDecals_history`

Section « History » de l'outil Dynamic Decals. Affiche les piles d'annulation (Undo) et de rétablissement (Redo) de l'objet d'historique de l'API (api.getHistory()), permet d'annuler/rétablir jusqu'à une entrée choisie, de vider l'historique, et montre le contenu d'une action en info-bulle (dump tronqué à 20 lignes de 100 caractères).

## Remarques

- « Delete All History » vide seulement les piles : les modifications déjà faites restent, et l'action est irréversible.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_dynamicDecals_history.editorPreferenceValueChanged(path, value)` | Hook appelé quand une préférence change. Ne fait rien ici. *(interne)* | 89 |
| `editor_dynamicDecals_history.registerEditorPreferences(prefsRegistry)` | Enregistre la préférence float `dynamicDecalsTool.history.sectionHeight` (défaut 256, de 64 à 1024). *(interne)* | 83 |
| `editor_dynamicDecals_history.setup(tool_in)` | Appelé par l'outil : récupère l'API et enregistre la section « History » (ordre 1045). *(interne)* | 93 |

### Détail des paramètres

#### `editor_dynamicDecals_history.editorPreferenceValueChanged(path, value)`

Hook appelé quand une préférence change. Ne fait rien ici.

- `path` (*string*) : Chemin de la préférence.
- `value` (*any*) : Nouvelle valeur.

#### `editor_dynamicDecals_history.registerEditorPreferences(prefsRegistry)`

Enregistre la préférence float `dynamicDecalsTool.history.sectionHeight` (défaut 256, de 64 à 1024).

- `prefsRegistry` (*table*) : Registre de préférences de l'éditeur.

#### `editor_dynamicDecals_history.setup(tool_in)`

Appelé par l'outil : récupère l'API et enregistre la section « History » (ordre 1045).

- `tool_in` (*table*) : Référence à l'outil editor_dynamicDecalsTool.

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/dynamicDecals/history.lua`.*

# `editor_prefabInstanceEditor`

*Fichier : `lua/ge/extensions/editor/prefabInstanceEditor.lua` · VM : Game Engine (GE) · 63 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_prefabInstanceEditor` : `extensions.load("editor_prefabInstanceEditor")`, puis la globale `editor_prefabInstanceEditor`

Ajoute une section « PrefabInstance » en tête de l'inspecteur de l'éditeur quand tous les objets sélectionnés sont des PrefabInstance. Si au moins une instance ne correspond plus à son modèle parent (matchesParentTemplate), il affiche les boutons « Make new template » et « Apply to parent ».

## Remarques

- Les deux boutons n'ont aucune action associée dans le code (blocs if vides) : la fonctionnalité est un squelette non terminé.
- Le module ne lit que inspectorInfo.previousSelectedIds.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_prefabInstanceEditor.onEditorInitialized()` | Appelé à l'initialisation de l'éditeur ; écrit seulement une ligne de log (niveau I). *(interne)* *(hook)* | 15 |
| `editor_prefabInstanceEditor.onEditorInspectorHeaderGui(inspectorInfo)` | Appelé à chaque frame en tête de l'inspecteur. Affiche l'en-tête repliable « PrefabInstance » seulement si toute la sélection est composée de PrefabInstance ; les boutons n'apparaissent que si une instance diffère de son parent. *(interne)* *(hook)* | 19 |

### Détail des paramètres

#### `editor_prefabInstanceEditor.onEditorInspectorHeaderGui(inspectorInfo)`

Appelé à chaque frame en tête de l'inspecteur. Affiche l'en-tête repliable « PrefabInstance » seulement si toute la sélection est composée de PrefabInstance ; les boutons n'apparaissent que si une instance diffère de son parent.

- `inspectorInfo` (*table*) : Informations de l'inspecteur ; le champ previousSelectedIds (liste d'IDs d'objets) est utilisé.

## Appels vers le moteur (C++)

- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/prefabInstanceEditor.lua`.*

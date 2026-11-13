# `editor_meshRoadEditor`

*Fichier : `lua/ge/extensions/editor/meshRoadEditor.lua` · VM : Game Engine (GE) · 58 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_meshRoadEditor` : `extensions.load("editor_meshRoadEditor")`, puis la globale `editor_meshRoadEditor`

Extension du world editor qui fournit le mode « Edit MeshRoad » (routes en mesh). Elle charge editor/meshEditor.lua avec dofile(), lui fixe type = "MeshRoad", preferencesName = "meshRoadEditor" et niceName = "Mesh Road", puis enregistre le mode d'édition meshRoadEditMode (action map MeshRoadEditor, icône create_road_mesh). Alt+clic gauche crée une route ou ajoute un nœud ; copier/coller transfère les propriétés.

## Remarques

- Toute la logique est dans meshEditor.lua ; ce fichier ne fait que le configurer et relayer ses hooks.
- Bug : M.onEditorGui, M.deleteNodeAM et M.selectAllNodes sont affectés depuis meshEditor.onEditorGui_, .deleteNodeAM et .selectAllNodes, qui n'existent pas dans meshEditor.lua : ces trois champs valent nil. La suppression et la sélection totale passent en réalité par onDeleteSelection et onSelectAll du mode d'édition.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_meshRoadEditor.onEditorInitialized()` | Hook appelé à l'initialisation du world editor : crée editor.editModes.meshRoadEditMode (nom « Edit MeshRoad », onActivate, onUpdate, onToolbar, onDeselect, copier/coller, suppression, tout sélectionner) et ses raccourcis auxiliaires (Alt+LMB, copier, coller). *(interne)* *(hook)* | 17 |
| `editor_meshRoadEditor.onExtensionLoaded()` | Hook appelé au chargement de l'extension : écrit « initialized » dans le log (niveau D). *(interne)* *(hook)* | 41 |

## Champs

| Champ | Type | Description |
|---|---|---|
| `deleteNodeAM` | nil | Relais de meshEditor.deleteNodeAM, inexistant : vaut nil. |
| `onEditorAxisGizmoAligmentChanged` | function | Relais de meshEditor.onEditorAxisGizmoAligmentChanged_. |
| `onEditorGui` | nil | Prévu pour relayer meshEditor.onEditorGui_, mais cette fonction n'existe pas : vaut nil. |
| `onEditorInspectorFieldChanged` | function | Relais de meshEditor.onEditorInspectorFieldChanged_ (régénère la route si segmentLength ou subdivideLength change). |
| `onEditorInspectorHeaderGui` | function | Relais de meshEditor.onEditorInspectorHeaderGui_ (panneau des nœuds dans l'inspecteur). |
| `onEditorObjectSelectionChanged` | function | Relais de meshEditor.onEditorObjectSelectionChanged_. |
| `onEditorPreferenceValueChanged` | function | Relais de meshEditor.onEditorPreferenceValueChanged_. |
| `onEditorRegisterPreferences` | function | Relais de meshEditor.onEditorRegisterPreferences_ (préférences meshRoadEditor.general.*). |
| `selectAllNodes` | nil | Relais de meshEditor.selectAllNodes, inexistant : vaut nil. |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/meshRoadEditor.lua`.*

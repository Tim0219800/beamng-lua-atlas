# `editor_riverEditor`

*Fichier : `lua/ge/extensions/editor/riverEditor.lua` · VM : Game Engine (GE) · 57 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_riverEditor` : `extensions.load("editor_riverEditor")`, puis la globale `editor_riverEditor`

Mode d'édition « River » de l'éditeur de monde. Ce fichier est une fine enveloppe : il charge la logique générique de meshEditor.lua (via dofile), la configure avec type = "River" (preferencesName "riverEditor", niceName "River") et réexpose ses callbacks d'éditeur. Il enregistre le mode riverEditMode (icône create_river, action map "RiverEditor", classe éditée River) avec les raccourcis Alt + clic gauche (créer une rivière / ajouter un nœud), copier et coller les propriétés de la rivière.

## Remarques

- Presque tout le comportement vient de meshEditor.lua ; les champs exportés sont des alias directs vers meshEditor.xxx_ (nil si meshEditor ne les définit pas).
- Le même schéma est probablement utilisé par les autres éditeurs de mesh (routes, etc.), mais seul River est configuré ici.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_riverEditor.onEditorInitialized()` | Hook appelé quand l'éditeur est initialisé. Crée editor.editModes.riverEditMode (onActivate, onUpdate, onToolbar, copier/coller, suppression, tout sélectionner, icône, auxShortcuts) et ajoute les raccourcis auxiliaires « Create river / Add node » (LMB + Alt), « Copy river properties » et « Paste river properties ». *(interne)* *(hook)* | 17 |
| `editor_riverEditor.onExtensionLoaded()` | Hook appelé au chargement de l'extension ; écrit seulement « initialized » dans le log (niveau D). *(interne)* *(hook)* | 40 |

## Champs

| Champ | Type | Description |
|---|---|---|
| `deleteNodeAM` | function | Alias de meshEditor.deleteNodeAM : suppression d'un nœud, destinée à l'action map. |
| `onEditorAxisGizmoAligmentChanged` | function | Alias de meshEditor.onEditorAxisGizmoAligmentChanged_ : changement d'alignement du gizmo d'axes (l'orthographe « Aligment » est celle du code). |
| `onEditorGui` | function | Alias de meshEditor.onEditorGui_ : dessine l'interface ImGui du mode. |
| `onEditorInspectorFieldChanged` | function | Alias de meshEditor.onEditorInspectorFieldChanged_ : réagit à la modification d'un champ dans l'inspecteur. |
| `onEditorInspectorHeaderGui` | function | Alias de meshEditor.onEditorInspectorHeaderGui_ : en-tête personnalisé de l'inspecteur. |
| `onEditorObjectSelectionChanged` | function | Alias de meshEditor.onEditorObjectSelectionChanged_ : la sélection d'objets a changé. |
| `onEditorPreferenceValueChanged` | function | Alias de meshEditor.onEditorPreferenceValueChanged_ : réagit au changement d'une préférence. |
| `onEditorRegisterPreferences` | function | Alias de meshEditor.onEditorRegisterPreferences_ : déclare les préférences de l'éditeur de rivière. |
| `selectAllNodes` | function | Alias de meshEditor.selectAllNodes : sélectionne tous les nœuds de la rivière. |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/riverEditor.lua`.*

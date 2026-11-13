# `editor_dynamicDecals_selection`

*Fichier : `lua/ge/extensions/editor/dynamicDecals/selection.lua` · VM : Game Engine (GE) · 159 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_dynamicDecals_selection` : `extensions.load("editor_dynamicDecals_selection")`, puis la globale `editor_dynamicDecals_selection`

Gère la sélection des calques (layers) de l'outil Dynamic Decals. selectLayer copie le calque dans `editor.selection["dynamicDecalLayer"][uid]` (ce que l'inspecteur lit) et configure le gizmo : transform de départ et callbacks translate/rotate/scale selon le type (decal, brushStroke, path, group). deselectLayer vide la sélection et désactive le gizmo.

## Remarques

- La sélection stocke une copie profonde (deepcopy) du calque : la modifier ne modifie pas la pile de calques ; il faut passer par api.setLayer.
- Rotation et échelle ne sont gérées que pour les decals ; brushStroke, path et group ne gèrent que la translation (via api.moveLayerLocalPos).
- Pour un group, le gizmo se place sur le premier enfant déplaçable. getDraggableChildLayer retourne dès le premier enfant (le `return` est dans la boucle) : seul le premier enfant est examiné.
- Sans addToSelection, `editor.selection` est entièrement remis à {} (toutes les sélections de l'éditeur sont perdues).
- deselectLayer remet toolMode à tool.toolModes.decal.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_dynamicDecals_selection.deselectLayer(uid)` | Retire le calque `uid` de la sélection, ou toute la sélection si uid est nil. Désactive le gizmo (mode none, callbacks et data réinitialisés). | 119 |
| `editor_dynamicDecals_selection.editorPreferenceValueChanged(path, value)` | Hook appelé quand une préférence change. Ne fait rien ici. *(interne)* | 142 |
| `editor_dynamicDecals_selection.registerEditorPreferences(prefsRegistry)` | Ne déclare aucune préférence (corps commenté). *(interne)* | 136 |
| `editor_dynamicDecals_selection.selectLayer(uid, addToSelection)` | Sélectionne le calque `uid` (remplace la sélection, sauf si addToSelection) et prépare le gizmo (type « drag », objectType, transform, callbacks). | 28 |
| `editor_dynamicDecals_selection.setup(tool_in)` | Appelé par l'outil : récupère l'outil, l'API et le module gizmo. *(interne)* | 146 |

### Détail des paramètres

#### `editor_dynamicDecals_selection.deselectLayer(uid)`

Retire le calque `uid` de la sélection, ou toute la sélection si uid est nil. Désactive le gizmo (mode none, callbacks et data réinitialisés).

- `uid` (*string|integer|nil*) : Calque à désélectionner.

#### `editor_dynamicDecals_selection.editorPreferenceValueChanged(path, value)`

Hook appelé quand une préférence change. Ne fait rien ici.

- `path` (*string*) : Chemin de la préférence.
- `value` (*any*) : Nouvelle valeur.

#### `editor_dynamicDecals_selection.registerEditorPreferences(prefsRegistry)`

Ne déclare aucune préférence (corps commenté).

- `prefsRegistry` (*table*) : Registre de préférences de l'éditeur.

#### `editor_dynamicDecals_selection.selectLayer(uid, addToSelection)`

Sélectionne le calque `uid` (remplace la sélection, sauf si addToSelection) et prépare le gizmo (type « drag », objectType, transform, callbacks).

- `uid` (*string|integer*) : Identifiant du calque ; un avertissement est loggé s'il est nil.
- `addToSelection` (*boolean|nil*) : Si vrai, ajoute à la sélection existante.

#### `editor_dynamicDecals_selection.setup(tool_in)`

Appelé par l'outil : récupère l'outil, l'API et le module gizmo.

- `tool_in` (*table*) : Référence à l'outil editor_dynamicDecalsTool.

## Appels vers le moteur (C++)

- `worldEditorCppApi.` `getAxisGizmoRotateOffset`, `getAxisGizmoScaleOffset`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/dynamicDecals/selection.lua`.*

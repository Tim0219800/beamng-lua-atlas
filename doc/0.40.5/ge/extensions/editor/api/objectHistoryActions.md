# `editor_api_objectHistoryActions`

*Fichier : `lua/ge/extensions/editor/api/objectHistoryActions.lua` · VM : Game Engine (GE) · 412 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/editor/api/objectHistoryActions")` (fichier sous extensions/ mais pas une extension classique)

## Classe `editor`

Objet `editor` construit dans le module (par ex. par `new`), avec ces méthodes :

| Méthode | Description | Ligne |
|---|---|---|
| `editor.hideObjectSelectionWithUndo()` |  | 343 |
| `editor.lockObjectSelectionWithUndo()` |  | 335 |
| `editor.showObjectSelectionWithUndo()` |  | 347 |
| `editor.unlockObjectSelectionWithUndo()` |  | 339 |

## Hooks émis

Évènements diffusés aux extensions par `extensions.hook` :

- `onEditorInspectorDynFieldChanged` — écouté par 1 module(s)
- `onEditorInspectorFieldChanged` — écouté par 9 module(s)
- `onEditorObjectAdded` — écouté par 3 module(s)
- `onEditorObjectSelectionChanged` — écouté par 8 module(s)

## Appels vers le moteur (C++)

- `Sim.` `deserializeObjectsFromText`, `findObjectById`, `upcast`
- `obj:` `delete`, `getClassName`, `getDynDataFieldbyName`, `getField`, `getGroup`, `getId`, `isLocked`, `isSubClassOf`, `registerObject`, `serialize`, `setScale`, `setTransform`
- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/api/objectHistoryActions.lua`.*

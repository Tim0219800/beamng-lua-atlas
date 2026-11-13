# `editor_ezObjectSelect_selectionQuery`

*Fichier : `lua/ge/extensions/editor/ezObjectSelect/selectionQuery.lua` · VM : Game Engine (GE) · 624 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_ezObjectSelect_selectionQuery` : `extensions.load("editor_ezObjectSelect_selectionQuery")`, puis la globale `editor_ezObjectSelect_selectionQuery`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_ezObjectSelect_selectionQuery.activate()` |  | 606 |
| `editor_ezObjectSelect_selectionQuery.gather(options)` |  | 396 |
| `editor_ezObjectSelect_selectionQuery.getCacheStatus()` |  | 614 |
| `editor_ezObjectSelect_selectionQuery.invalidateCache(reason)` |  | 610 |
| `editor_ezObjectSelect_selectionQuery.validatePatternList(value)` |  | 618 |

## Appels vers le moteur (C++)

- `Sim.` `upcast`
- `obj:` `getClassName`, `getField`, `getID`, `getInternalName`, `getModelFile`, `getName`, `getObjBox`, `getWorldBox`, `isHidden`, `isLocked`
- `scenetree.` `findObjectById`
- `ui_imgui.` `GetMousePos`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/ezObjectSelect/selectionQuery.lua`.*

# `editor_groundCoverEditor`

*Fichier : `lua/ge/extensions/editor/groundCoverEditor.lua` · VM : Game Engine (GE) · 1978 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_groundCoverEditor` : `extensions.load("editor_groundCoverEditor")`, puis la globale `editor_groundCoverEditor`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_groundCoverEditor.onEditorGui()` | *(hook)* | 1914 |
| `editor_groundCoverEditor.onEditorInitialized()` | *(hook)* | 1960 |
| `editor_groundCoverEditor.onEditorObjectSelectionChanged()` | *(hook)* | 1952 |
| `editor_groundCoverEditor.show()` |  | 1943 |

## Appels vers le moteur (C++)

- `Sim.` `getUniqueName`
- `obj:` `getClassName`, `getField`, `getID`, `getId`, `getName`, `postApply`, `registerObject`, `setField`
- `scenetree.` `findClassObjects`, `findObject`, `findObjectById`

**Charge les extensions :** `editor_inspector`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/groundCoverEditor.lua`.*

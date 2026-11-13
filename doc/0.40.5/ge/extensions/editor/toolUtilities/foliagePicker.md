# `editor_toolUtilities_foliagePicker`

*Fichier : `lua/ge/extensions/editor/toolUtilities/foliagePicker.lua` · VM : Game Engine (GE) · 150 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_toolUtilities_foliagePicker` : `extensions.load("editor_toolUtilities_foliagePicker")`, puis la globale `editor_toolUtilities_foliagePicker`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_toolUtilities_foliagePicker.draw(target, opts)` | Draws the picker for `target` (needs .species and .speciesWeights tables). opts:<br>   id           unique imgui id suffix, required (e.g. 'ts', 'fze', 'plHatch')<br>   height       listbox height in px (default 150)<br>   onBeginEdit()          -> token   optional undo snapshot, captured before a mutation<br>   onCommit(label, token)            optional history commit after a mutation<br>   onChange()                        optional dirty mark after any mutation | 53 |
| `editor_toolUtilities_foliagePicker.getList()` | Cached species list, scanning lazily on first use. | 32 |
| `editor_toolUtilities_foliagePicker.refresh()` | Rescans the level's ForestItemData into the shared cache. | 26 |
| `editor_toolUtilities_foliagePicker.setTicked(target, nm, on)` | Ticks a species (giving it a default weight) or unticks it. | 38 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/toolUtilities/foliagePicker.lua`.*

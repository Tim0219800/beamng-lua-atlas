# `editor_toolUtilities_bake`

*Fichier : `lua/ge/extensions/editor/toolUtilities/bake.lua` · VM : Game Engine (GE) · 196 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_toolUtilities_bake` : `extensions.load("editor_toolUtilities_bake")`, puis la globale `editor_toolUtilities_bake`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_toolUtilities_bake.burnById(spec, id)` | Master-Spline propagation: bake the spline with `id` (typically a LINKED child) WITHOUT opening its own history<br> transaction -- the Master Spline wraps the whole multi-tool burn in one action. Returns { manifest, folderId } so the<br> Master's undo can delete exactly these objects and reset the folder. Returns nil when the id isn't found. | 166 |
| `editor_toolUtilities_bake.renderButton(spec)` | Column variant: draws the Bake button as ONE column cell (call after the tool's other top-row column cells; the caller<br> must widen its im.Columns count by 1). When there is no bakeable spline selected the cell is a blank Dummy, matching<br> how these tools blank other unavailable buttons. | 142 |
| `editor_toolUtilities_bake.renderButtonInline(spec)` | Inline variant: draws the Bake button (or a blank Dummy) with NO column handling, for tools whose top row is a plain<br> im.SameLine sequence. The caller adds its own im.SameLine() beforehand to keep it on the same row. | 151 |
| `editor_toolUtilities_bake.rowButton(spec, spline)` | Row variant: draws the Bake button for ONE list row's spline (small icon, spec's red colour), or a blank Dummy when that<br> spline isn't bakeable. A click bakes it immediately and returns true -- the caller MUST then editor.endWindow() + return,<br> exactly like its delete button does, because the bake mutated the tool's item list mid-iteration. Draw this as its own<br> column cell (widen the row's im.Columns count by 1) and follow it with im.NextColumn() like the other row buttons. | 178 |
| `editor_toolUtilities_bake.setLocked(spec, spline, isLocked)` | Locks/unlocks `spline` as one undoable history transaction. Used by both the flame button and the tool's lock toggle. | 114 |
| `editor_toolUtilities_bake.unburn(data)` | Take one bake back out of the level: delete the burned objects and planted items, and reset their folder to transient.<br> `data` is what doBake (or burnById) recorded. | 72 |

## Appels vers le moteur (C++)

- `be:` `reloadCollision`
- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/toolUtilities/bake.lua`.*

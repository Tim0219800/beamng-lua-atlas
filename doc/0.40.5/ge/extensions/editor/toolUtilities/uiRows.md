# `editor_toolUtilities_uiRows`

*Fichier : `lua/ge/extensions/editor/toolUtilities/uiRows.lua` · VM : Game Engine (GE) · 121 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_toolUtilities_uiRows` : `extensions.load("editor_toolUtilities_uiRows")`, puis la globale `editor_toolUtilities_uiRows`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_toolUtilities_uiRows.beginSliderRow(id, atDefault, onReset)` | Reset icon left of the slider (spacer when already at default); caller draws the slider between begin/endSliderRow. | 31 |
| `editor_toolUtilities_uiRows.beginSubTab(label, flags)` |  | 92 |
| `editor_toolUtilities_uiRows.endSliderRow()` |  | 45 |
| `editor_toolUtilities_uiRows.endSubTab()` | Every sub-tab closes with a line under its content. | 99 |
| `editor_toolUtilities_uiRows.markSep()` | A list's closing line, remembered so the sub-tab holding it does not draw a second one straight under it. | 87 |
| `editor_toolUtilities_uiRows.mixRow(opts, id, has, offCol)` | A row of option buttons any number of which can be lit at once, for a choice that is a mix. `has(id)` says which are lit.<br>Takes the bare { id, tip, icon } rows and the kit's named records alike. `offCol` is the unlit button, as the tool's own<br>option rows draw it. Answers the id clicked, or nil. | 70 |
| `editor_toolUtilities_uiRows.optIcon(name)` | The icon button throws on a nil glyph, so an unknown name falls back to a plain square. | 63 |
| `editor_toolUtilities_uiRows.rowLabel(label, tip, col)` | Label to the left of a row of buttons. | 53 |

## Champs

| Champ | Type | Description |
|---|---|---|
| `LABEL_COL_W` | number | Public interface. |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/toolUtilities/uiRows.lua`.*

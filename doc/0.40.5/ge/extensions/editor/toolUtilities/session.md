# `editor_toolUtilities_session`

*Fichier : `lua/ge/extensions/editor/toolUtilities/session.lua` · VM : Game Engine (GE) · 387 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_toolUtilities_session` : `extensions.load("editor_toolUtilities_session")`, puis la globale `editor_toolUtilities_session`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_toolUtilities_session.attachment(toolId)` | Which file the document is attached to and whether it has unsaved changes. | 109 |
| `editor_toolUtilities_session.boundPath(toolId)` | The bound path on its own, for callers that run every frame and should not allocate a table to read it. | 114 |
| `editor_toolUtilities_session.itemToTable(item, emptyKeys, nilKeys)` | Deep-copies an item through the buffer codec. | 138 |
| `editor_toolUtilities_session.loadFromFile(path, spec, replace)` |  | 209 |
| `editor_toolUtilities_session.loadJson(j, spec, replace)` | Applies a decoded session JSON. `replace` wipes current items first; otherwise the loaded items are MERGED (an incoming id that<br> clashes with a live item gets a fresh one so nothing is clobbered). Returns ok, countOrError. | 183 |
| `editor_toolUtilities_session.markEdited(toolId)` | Marks a tool's document as having unsaved changes. Tools call this from their dirty/rebuild pass (once per pass, when something<br> actually rebuilt). The load guard swallows exactly one call so the forced rebuild a fresh Load triggers doesn't flip the doc dirty. | 92 |
| `editor_toolUtilities_session.reattach(toolId, at)` |  | 131 |
| `editor_toolUtilities_session.rehydrateVec3Array(arr)` | Rehydrates an array of node positions loaded from JSON (plain {x,y,z}) back into vec3, in place. Idempotent: entries that are<br> already vec3 (the buffer/undo path) have a :distance method and are left as-is. Safe on nil / non-table. | 147 |
| `editor_toolUtilities_session.renderButtons(spec)` | Inline variant: draws Save (once a file is known) + Save As (when non-empty) + Load side-by-side + the modal. | 345 |
| `editor_toolUtilities_session.renderButtonsColumns(spec)` | Column variant: draws Save + Save As + Load as three grid cells. | 357 |
| `editor_toolUtilities_session.saveIfEdited(spec)` | Writes an edited document back over the file it is bound to, for a tool whose work should never wait on a Save press. | 173 |
| `editor_toolUtilities_session.saveToFile(path, spec)` | Writes every item to `path` as a portable session JSON. Returns ok, count. | 156 |
| `editor_toolUtilities_session.unbind(toolId)` | Detaches a tool from its file, so the next Save has to ask where instead of writing silently over whatever was last loaded. | 104 |
| `editor_toolUtilities_session.windowTitle(toolId, label, id, newName)` |  | 121 |

## Appels vers le moteur (C++)

- `Engine.` `generateUUID`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/toolUtilities/session.lua`.*

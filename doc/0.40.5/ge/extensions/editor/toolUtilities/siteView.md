# `editor_toolUtilities_siteView`

*Fichier : `lua/ge/extensions/editor/toolUtilities/siteView.lua` · VM : Game Engine (GE) · 161 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_toolUtilities_siteView` : `extensions.load("editor_toolUtilities_siteView")`, puis la globale `editor_toolUtilities_siteView`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_toolUtilities_siteView.activate(m)` | Take the editor camera over and frame the selection. | 65 |
| `editor_toolUtilities_siteView.clickMode(m)` | What a camera button does: switch to that camera, or re-frame it when it is already the one driving. That second press<br>is how the tools go to the site, which is why none of them carries a Go To button of its own. Free is the user's camera,<br>so pressing it again deliberately does nothing. | 104 |
| `editor_toolUtilities_siteView.drive(blocked)` | Per-frame drive. `blocked` suppresses movement during the tool's own modal interactions (drawing, dragging a handle). | 116 |
| `editor_toolUtilities_siteView.focus(m)` | Fly whichever camera is driving onto the selection. | 56 |
| `editor_toolUtilities_siteView.followSelection()` | Re-frame when the panel is pointed at something else. Free mode is the user's camera and is left alone. | 109 |
| `editor_toolUtilities_siteView.getMode()` |  | 133 |
| `editor_toolUtilities_siteView.getStep()` |  | 132 |
| `editor_toolUtilities_siteView.handBack()` | Hand the editor camera back, on the way out of the tool. | 121 |
| `editor_toolUtilities_siteView.init(c)` | Bind to the host tool. `ring` returns the outline to frame, `terrainZ` the ground under a point, `selIndex` what is<br>selected right now (so a change of selection can re-frame), and `onStep` is told when the step changes. | 32 |
| `editor_toolUtilities_siteView.isShaping()` |  | 131 |
| `editor_toolUtilities_siteView.reset()` | Where the tool opens: design, in orbit. Footprint mode is a deliberate trip. | 126 |
| `editor_toolUtilities_siteView.setMode(m)` |  | 71 |
| `editor_toolUtilities_siteView.setStep(key)` | Switch editing step. Footprint mode borrows the pan camera whatever was picked before -- the nodes are drawn flat on the<br>ground and are unusable from an angle -- and gives the choice back on the way out. A camera deliberately handed back<br>stays handed back. | 86 |

## Champs

| Champ | Type | Description |
|---|---|---|
| `modes` | table |  |
| `steps` | table | Public interface. |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/toolUtilities/siteView.lua`.*

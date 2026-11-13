# `editor_toolUtilities_panCamera`

*Fichier : `lua/ge/extensions/editor/toolUtilities/panCamera.lua` · VM : Game Engine (GE) · 85 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_toolUtilities_panCamera` : `extensions.load("editor_toolUtilities_panCamera")`, puis la globale `editor_toolUtilities_panCamera`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_toolUtilities_panCamera.close()` | Hand the editor's free camera back. | 52 |
| `editor_toolUtilities_panCamera.configure(opts)` | Host registers a fn() -> points (current selection) so toggle-on / open frames what you're looking at. | 29 |
| `editor_toolUtilities_panCamera.drive(blocked)` | Per-frame drive (RMB-drag pan + wheel zoom). `blocked` suppresses movement during the tool's own modal interactions<br> (polygon drawing, node/gizmo drag, placement...). | 71 |
| `editor_toolUtilities_panCamera.gotoPoints(points)` | Go-to routing: when the pan camera (or a host's own use of the tool camera) is driving, fly IT to `points` and report<br> handled; otherwise let the caller do its normal free-camera jump. | 63 |
| `editor_toolUtilities_panCamera.isOn()` |  | 33 |
| `editor_toolUtilities_panCamera.open()` | Take over the camera and go top-down: frame the current selection if there is one, else just tilt to top-down where the<br> camera already is. | 39 |
| `editor_toolUtilities_panCamera.toggle()` |  | 57 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/toolUtilities/panCamera.lua`.*

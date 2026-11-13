# `editor_toolUtilities_cameraRig`

*Fichier : `lua/ge/extensions/editor/toolUtilities/cameraRig.lua` · VM : Game Engine (GE) · 252 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_toolUtilities_cameraRig` : `extensions.load("editor_toolUtilities_cameraRig")`, puis la globale `editor_toolUtilities_cameraRig`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_toolUtilities_cameraRig.focusFootprint(originXY, terrainH, height)` | Seed the PAN sub-state on the footprint origin and return its top-down target pose. | 196 |
| `editor_toolUtilities_cameraRig.focusMassing(centroid, radius, yawDeg, pitchDeg)` | Seed the ORBIT sub-state on the building centroid and return its 3/4 target pose. | 209 |
| `editor_toolUtilities_cameraRig.getMode()` |  | 241 |
| `editor_toolUtilities_cameraRig.recenter(centroid)` | Move the orbit PIVOT to `centroid` while KEEPING the current yaw / pitch / dist, and return the pose whose eye preserves that<br> framing (eye translates with the pivot). | 223 |
| `editor_toolUtilities_cameraRig.settle()` | Kill any leftover inertia (call when a timed transition ends before interactive drive resumes, so the view doesn't<br> coast from a stale flick). | 234 |
| `editor_toolUtilities_cameraRig.update(dt, input)` | Advance the interactive camera one frame and return the pose to push (pos, yawDeg, pitchDeg, rollDeg). `input` is<br> { dragActive, dragDX, dragDY, wheel, groundZAt, limitXY } - screen-space drag delta in pixels and the wheel notches<br> this frame; groundZAt(x, y[, heightAbove]) -> ground z (the mean over the view when heightAbove is given);<br> limitXY(x, y) -> x, y pens the pan centre in. Pan drags<br> grab the ground (with inertia); orbit drags spin around the pivot (with inertia); the wheel zooms/dollies. pos is a<br> shared vec3 - copy it if you need to keep it. | 98 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/toolUtilities/cameraRig.lua`.*

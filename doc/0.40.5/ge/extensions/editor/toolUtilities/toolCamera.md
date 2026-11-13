# `editor_toolUtilities_toolCamera`

*Fichier : `lua/ge/extensions/editor/toolUtilities/toolCamera.lua` · VM : Game Engine (GE) · 216 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_toolUtilities_toolCamera` : `extensions.load("editor_toolUtilities_toolCamera")`, puis la globale `editor_toolUtilities_toolCamera`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_toolUtilities_toolCamera.drive(blocked)` | Per-frame interactive drive: gather the viewport RMB-drag + wheel (gated so UI / a host-declared busy state don't<br> pan/orbit) and push the rig pose to scriptedFree. | 183 |
| `editor_toolUtilities_toolCamera.flyOrbit(x, y, z, radius, yaw, pitch, time)` | Fly to an ORBIT focus framing (x,y,z) over `time` s (nil = scaled to the distance). radius (optional) sizes the dolly so the subject frames nicely; yaw /<br> pitch (optional) override the default 3/4 angle (used to approach a detail from a known outward direction). No-op unless<br> we're driving. | 160 |
| `editor_toolUtilities_toolCamera.flyPan(x, y, groundZ, height, time)` | Fly to a top-down PAN focus over `time` s (0 = snap, nil = scaled to the distance). | 137 |
| `editor_toolUtilities_toolCamera.handBack(animate)` | Hand the editor camera back. | 121 |
| `editor_toolUtilities_toolCamera.isActive()` |  | 132 |
| `editor_toolUtilities_toolCamera.recenterOrbit(x, y, z, time)` | Slide the orbit PIVOT onto (x,y,z) KEEPING the current yaw / pitch / dist, over a short ease. Unlike flyOrbit (a fresh 3/4<br> reframe) this preserves the viewing angle + zoom - the gentle "recentre on what I just selected" move. No-op unless we're<br> driving. | 172 |
| `editor_toolUtilities_toolCamera.takeOver()` | Take over the editor camera. | 96 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/toolUtilities/toolCamera.lua`.*

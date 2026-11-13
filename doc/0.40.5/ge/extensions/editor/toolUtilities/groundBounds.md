# `editor_toolUtilities_groundBounds`

*Fichier : `lua/ge/extensions/editor/toolUtilities/groundBounds.lua` · VM : Game Engine (GE) · 200 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_toolUtilities_groundBounds` : `extensions.load("editor_toolUtilities_groundBounds")`, puis la globale `editor_toolUtilities_groundBounds`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_toolUtilities_groundBounds.clip(ring, obs, owner, site)` | The outline minus everything above, as a list of `{ ring, holes, cut, flush }` to surface one at a time. | 122 |
| `editor_toolUtilities_groundBounds.largest(areas)` | The biggest of them, for a tool that lays ONE thing on its outline rather than one per piece. A car park cut in two by a<br>road is two car parks, and the second is a second lot to draw -- not something to infer from the first. | 157 |
| `editor_toolUtilities_groundBounds.obstacles(ring, owner, site, roadMargin)` | Everything near this outline that `owner` may not pave: road and junction surfaces, and every claim another ground tool<br>has staked -- a placed building's footprint, a park. `site` is the shelf folder of the site being edited, if it has one:<br>wherever a copy of it already stands, that copy is this outline and not something in its way. `roadMargin` keeps it<br>further off the roads than the default. | 40 |
| `editor_toolUtilities_groundBounds.pieceAt(areas, x, y)` | Which clipped piece a point is on, if it is on one at all. What everything standing round the perimeter asks before it<br>stands -- a flight of steps, a lamp on the wall -- and the flights want the piece itself, since the wall is laid one<br>piece at a time and a flight has to open the one it comes through. | 169 |
| `editor_toolUtilities_groundBounds.publish(owner, rings)` | Tell the other ground tools what this one is standing on. No margin: two surfaces meeting should read as one, and a gap<br>would show as a strip of bare terrain the width of whatever was allowed. | 184 |
| `editor_toolUtilities_groundBounds.sig()` | A fingerprint of everything outside an outline that its shape depends on, so a road or a building moved under one rebuilds<br>it. Asked every frame of every outline, so neither half builds a ring to answer: the roads fingerprint what a scan would<br>read without scanning, and a claim is counted when it is published rather than measured here. | 189 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/toolUtilities/groundBounds.lua`.*

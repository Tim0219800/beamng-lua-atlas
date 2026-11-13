# `editor_toolUtilities_networkState`

*Fichier : `lua/ge/extensions/editor/toolUtilities/networkState.lua` · VM : Game Engine (GE) · 166 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_toolUtilities_networkState` : `extensions.load("editor_toolUtilities_networkState")`, puis la globale `editor_toolUtilities_networkState`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_toolUtilities_networkState.applyCrossings(owner, list)` | The crossings this owner wants, as the sites above cut down to the ones it will have, in place of whatever it asked for<br>last time. An empty list takes its crossings back off the roads. Crossings placed by hand, or asked for by somebody<br>else, are left where they are. Answers how many were put down and how many were taken off. | 114 |
| `editor_toolUtilities_networkState.busy()` | Whether what the network answers now is still on its way to being right: not loaded yet, roads and junctions waiting<br>to be rebuilt, which after a load or a Lua reload goes on for many frames, or a node still being dragged. Ground laid<br>against the roads meanwhile is laid against half of them, so a tool doing that waits for this to clear. | 76 |
| `editor_toolUtilities_networkState.crossingSites(density, depthM)` | Where the network would take a pedestrian crossing, if somebody wanted one: a site on every approach of the junctions<br>that matter, `density` of them kept and `depthM` deep. Each site says which road it is on, where along it, and the two<br>points its band would reach to -- enough for a paver to keep only the ones it has paved both sides of, and no more than<br>that. Sites the road already carries a crossing at are left out, so a caller relaying its own takes those off first. | 106 |
| `editor_toolUtilities_networkState.features()` | What the network has told the terrain to do: the ground it has graded and the structures it has stood in it. | 88 |
| `editor_toolUtilities_networkState.footwayFor(groupId)` | Everything paved on one road's verges, merged across owners. Nil where nobody has paved it, which is what the network<br>reads as "paint the blend right along". | 129 |
| `editor_toolUtilities_networkState.groundSegs(road)` | Which of a road's segments lie on the ground, per divPoint segment, rather than on a flying deck or in a tunnel: a bridge's<br>abutments count, the ground being brought up level with the deck there. Nil when all do. | 42 |
| `editor_toolUtilities_networkState.heldPastEdge(paved)` | How far past a road's surface edge its grade still holds the ground at the road's own height, outranking anything a site<br>lays there. `paved` is for a verge somebody else has posted as footway, where the road keeps no bare shoulder of its own. | 96 |
| `editor_toolUtilities_networkState.invalidate()` | The surfaces are cached, and this is how a tool that has just moved something says so. | 63 |
| `editor_toolUtilities_networkState.overRoad(ring)` | Whether a ring lands on any of that. Asked of the network rather than worked out from `surfaces`, because a junction is<br>bounded partly by lines and testing against those is the network's own business. | 57 |
| `editor_toolUtilities_networkState.provide(t)` | The network's side of the board, filled in once as the road tool loads. Everything below is a thin pass to one of these.<br>Fields: roads, groundSegs, surfaces, invalidate, sig, rev, features, heldPastEdge, footwayChanged. | 29 |
| `editor_toolUtilities_networkState.publishFootway(owner, byGroup)` | The verges this owner has paved over, as `{ [groupId] = { left = spans, right = spans } }`, replacing whatever it posted<br>before. The network is told at once, because the blend under those slabs is painted terrain and has to be repainted. | 121 |
| `editor_toolUtilities_networkState.rev()` | Bumped whenever a road or junction is rebuilt, heights and all, for a tool that stands something on a road's surface. | 82 |
| `editor_toolUtilities_networkState.roads()` | Every road the network has laid, as its plan geometry: `id`, `divPoints`, `tangents`, `binormals`. Junction hubs and<br>anything else that is not a road are left out, so a reader never has to know what kinds there are. | 35 |
| `editor_toolUtilities_networkState.sig()` | Bumped whenever the network's surfaces change, for a tool that has to notice the road moved under its own ground. | 68 |
| `editor_toolUtilities_networkState.surfaces()` | Every stretch of ground the network has surfaced, in plan: the closed rings of carriageway and sealed junction, and the<br>edge lines that bound no area of their own. | 49 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/toolUtilities/networkState.lua`.*

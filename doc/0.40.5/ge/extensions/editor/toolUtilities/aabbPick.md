# `editor_toolUtilities_aabbPick`

*Fichier : `lua/ge/extensions/editor/toolUtilities/aabbPick.lua` · VM : Game Engine (GE) · 64 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_toolUtilities_aabbPick` : `extensions.load("editor_toolUtilities_aabbPick")`, puis la globale `editor_toolUtilities_aabbPick`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_toolUtilities_aabbPick.pickNearest(ox, oy, oz, dx, dy, dz, provider)` | Nearest box the ray (origin o*, dir d*) enters, chosen by entry distance. `provider(visit)` must call<br> visit(id, minx, miny, minz, maxx, maxy, maxz) once per candidate box. Returns the winning id (or nil) and its distance. | 49 |
| `editor_toolUtilities_aabbPick.rayAabb(ox, oy, oz, dx, dy, dz, minx, miny, minz, maxx, maxy, maxz)` | Ray (origin o*, direction d*, d need not be normalized) vs AABB [min*, max*]. Returns the entry distance t along the ray<br> (>= 0) if it hits, else nil. Standard slab method; a ray starting inside the box returns 0. | 16 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/toolUtilities/aabbPick.lua`.*

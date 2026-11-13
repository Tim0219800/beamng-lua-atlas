# `editor_toolUtilities_groundClaims`

*Fichier : `lua/ge/extensions/editor/toolUtilities/groundClaims.lua` · VM : Game Engine (GE) · 162 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_toolUtilities_groundClaims` : `extensions.load("editor_toolUtilities_groundClaims")`, puis la globale `editor_toolUtilities_groundClaims`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_toolUtilities_groundClaims.clear(owner)` |  | 71 |
| `editor_toolUtilities_groundClaims.extents(owner)` | Every other owner's fingerprint and the box its ground covers, margin included: what a tool diffs to find WHERE somebody<br>else's ground moved, rather than only that it did. | 63 |
| `editor_toolUtilities_groundClaims.keepOut(out, owner)` | The same, but each ring grown by the margin its owner asked for -- what to subtract from ground of your own, as against<br>what to test a seam against. A claim asking for nothing comes back unchanged, which is the flush join. | 92 |
| `editor_toolUtilities_groundClaims.obstructions(ring, owner, roadRings, roadMargin, pad, skip)` | Everything near `ring` that its owner may not surface: the road rings it is HANDED, grown by `roadMargin`, plus every<br>other tool's claim grown by whatever that tool asked for. `pad` widens the box what counts as near is taken from. `skip`<br>leaves out every ring tagged with it: a site opened for editing is not in the way of itself where a copy of it stands. | 107 |
| `editor_toolUtilities_groundClaims.others(out, owner, flushOnly, tags)` | Every claim except one owner's own, appended to `out`. The exclusion is what lets a tool read this without subtracting its<br>own ground from itself. `flushOnly` keeps only the claims asking for no margin: the ground a surface meets as one.<br>`tags`, when given, gets each ring's tag (false for none) at the ring's index in `out`. A ring tagged 'buried' is ground<br>held over something under it, a tunnel's cover: plants may stand on it. | 77 |
| `editor_toolUtilities_groundClaims.publish(owner, rings, margin, tags)` | Everything this owner holds, replacing whatever it held before, and how far off it everyone else stops. Rings are taken as<br>given and not copied: a caller that goes on mutating its own outlines has to publish again anyway, which is the same rule<br>its own rebuild follows. `tags`, when given, names what each ring is a copy of, so a tool editing that very thing can<br>leave its own copies out (see `obstructions`). | 32 |
| `editor_toolUtilities_groundClaims.sig()` | Bumped whenever anything is published. For a tool that has to notice somebody else's ground moved under its own, which it<br>cannot be told about directly without the two tools knowing each other. | 150 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/toolUtilities/groundClaims.lua`.*

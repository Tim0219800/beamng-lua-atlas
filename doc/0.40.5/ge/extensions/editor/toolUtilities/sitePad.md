# `editor_toolUtilities_sitePad`

*Fichier : `lua/ge/extensions/editor/toolUtilities/sitePad.lua` · VM : Game Engine (GE) · 258 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_toolUtilities_sitePad` : `extensions.load("editor_toolUtilities_sitePad")`, puis la globale `editor_toolUtilities_sitePad`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_toolUtilities_sitePad.carve(features, prio)` | Cut the site's own ground plan into the pad, so a sunk square, a terrace or a flight of steps can be SEEN while it is<br>being drawn instead of only once the site is placed. `features` is the same list the site bakes for the placer, so the<br>ground here and the ground there are cut from one answer.<br>The last cut is handed back first: a carve blends into the ground around it, and blending into ground the previous carve<br>already pulled down would eat further into the pad every time. Called with nothing, that hand-back is all it does.<br>On real ground `prio` is the site's band, and whatever outranks it nearby goes into the same pass at its own: the cut<br>gives way to a road's verge here exactly as the level's grade will make it. | 150 |
| `editor_toolUtilities_sitePad.cellZ(gx, gy)` | The same, by heightmap cell, in the grid's own units; nil off the pad. | 206 |
| `editor_toolUtilities_sitePad.centreFor(ring)` | Where a tool should centre its pad, given the bounds of what it already holds. The camera's aim when it holds nothing,<br>which is where the tools seed a starter shape, so a fresh site and its pad arrive in the same place. | 126 |
| `editor_toolUtilities_sitePad.drop()` | How far the pad's ground sits below the set-out level, nil with no pad down. | 229 |
| `editor_toolUtilities_sitePad.enter(cx, cy, drop, real)` | Take the square centred on (cx, cy) flat, remembering what was there so `leave` can put it back. A pad already down goes<br>back first: two overlapping pads would each remember the other's level as the original ground and lose the real one.<br>`drop` takes the ground that far BELOW the set-out level instead of level with it, which is how a tool whose site has<br>ground of its own under it -- a basement, an areaway -- gets to see into it. The site keeps standing at `level()`: the<br>two come apart, and everything that sets something out on the pad wants the set-out level and not the cut surface.<br>`real` leaves the ground as it is and only remembers it: a site drawn round its own plot is designed on the ground it<br>will stand on, and the carve and `leave` work the same. Such a pad has no set-out level; `level` is not for it. | 89 |
| `editor_toolUtilities_sitePad.groundZ(x, y)` | The ground at (x, y) as it was before the pad went down or anything was cut into it; nil off the pad. What a level is<br>measured from: measured off the cut instead, each cut moves the level the next one is cut to. | 219 |
| `editor_toolUtilities_sitePad.isDown()` |  | 203 |
| `editor_toolUtilities_sitePad.leave()` | The ground back as it was. Only heights: whatever the tool built on the pad comes down by its own teardown, and has to,<br>or it would be left standing at the pad's level over ground that is no longer there.<br>Anything carved INTO the pad goes with it: the pad remembers the real ground, which is older than any cut made in it. | 61 |
| `editor_toolUtilities_sitePad.level()` | The world level a site on the pad is SET OUT against. What anything standing on the drawing board should use in place of<br>sampling the ground, which once a site has cut its own shapes into the pad is not flat. | 239 |
| `editor_toolUtilities_sitePad.redrop(d)` | The pad cut again at another drop, where it stands. Its carve is dropped with it: that was cut into the old ground. | 232 |
| `editor_toolUtilities_sitePad.resume()` |  | 195 |
| `editor_toolUtilities_sitePad.setBeforeEnter(fn)` | Who gets the real ground once more before a pad remembers it: `fn()` runs as an editor comes in. | 215 |
| `editor_toolUtilities_sitePad.setHeld(fn)` | Who answers what outranks a site on real ground: `fn(x0, y0, x1, y1)` returns those features, each carrying its band. | 212 |
| `editor_toolUtilities_sitePad.suspend()` | The pad off the ground for the duration of a level save, and back down again afterwards. A save writes the terrain as it<br>finds it, so a drawing board left lying there would go into the level as real ground - a 300 m plateau where the map had<br>a hillside, saved because a tool happened to be open at the time. | 186 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/toolUtilities/sitePad.lua`.*

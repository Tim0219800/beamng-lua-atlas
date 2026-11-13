# `editor_toolUtilities_siteSpots`

*Fichier : `lua/ge/extensions/editor/toolUtilities/siteSpots.lua` · VM : Game Engine (GE) · 162 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_toolUtilities_siteSpots` : `extensions.load("editor_toolUtilities_siteSpots")`, puis la globale `editor_toolUtilities_siteSpots`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_toolUtilities_siteSpots.localise(list, ox, oy)` | The spots a site's own solver worked out, local to the bake origin.<br>Each one comes in as `{ x, y, yaw, w, d, n, dir }` in the frame the bake is being taken in: where its first bay's centre<br>is, which way a car parked in it faces, how wide and deep a bay is, how many bays the run holds, and which hand the run<br>steps along. Only the position is moved -- the heading stays as it was, and `place` adds the placement's own to it, the<br>same as every other list in a manifest. | 38 |
| `editor_toolUtilities_siteSpots.place(rec, px, py, yaw, ox, oy, groundZ)` | And back: the manifest's spots as `parkingSpot` records, stood where a placement is and turned onto its heading.<br>`ox, oy` is the point in the site's own frame the placement turns about -- the middle of its footprint rather than the<br>bake origin at a corner -- exactly as the marks and the kit are measured. `groundZ` answers the height at a point,<br>because a spot sits on the ground it is on and not at the placement's datum: a lot is graded flat, but its footway and<br>the street outside it are not, and the box has to sit where a car would.<br>No names here. Those have to be unique across the whole level file and are handed out by `write`. | 62 |
| `editor_toolUtilities_siteSpots.restore(undo)` | Undo a write: put the array back exactly as it was. | 145 |
| `editor_toolUtilities_siteSpots.write(spots, prefix)` | Add spots to the level's sites file, under names starting with `prefix`.<br>Added rather than replacing whatever was there: burning is a one-way handover, so a second burn has to stand beside the<br>first rather than on top of it. Names and ids carry on past whatever the file already holds, so two burns and a<br>hand-authored spot can share the file without colliding.<br>Answers what an undo needs -- the array exactly as it was -- or nothing when there was nothing to add. | 108 |

## Champs

| Champ | Type | Description |
|---|---|---|
| `SPOT_H` | number | Public interface. |

## Appels vers le moteur (C++)

- `FS:` `fileExists`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/toolUtilities/siteSpots.lua`.*

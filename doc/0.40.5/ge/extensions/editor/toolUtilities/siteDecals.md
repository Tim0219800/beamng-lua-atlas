# `editor_toolUtilities_siteDecals`

*Fichier : `lua/ge/extensions/editor/toolUtilities/siteDecals.lua` · VM : Game Engine (GE) · 144 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_toolUtilities_siteDecals` : `extensions.load("editor_toolUtilities_siteDecals")`, puis la globale `editor_toolUtilities_siteDecals`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_toolUtilities_siteDecals.build(plan, tag, terrainZ)` | A whole plan stamped at once, making whatever templates it calls for. `tag` names them apart from every other site's.<br>Answers the instances and the template ids, which are two different things to clean up: an instance goes when the site<br>does, a template is shared by all of that site's stamps. | 90 |
| `editor_toolUtilities_siteDecals.commit(tplIds)` | Hand the templates to the level, which is what makes the stamps off them survive a save. The persistence manager keeps<br>the instances against their template, so marking the few templates dirty writes out all the stamps -- there is nothing<br>per-stamp to flip. Per-site templates are what keeps this from writing out a neighbour's stamps too. | 119 |
| `editor_toolUtilities_siteDecals.emit(tpl, rec, terrainZ)` | One stamp, from the record that describes it. | 36 |
| `editor_toolUtilities_siteDecals.facing(tx, ty)` | The facing of a stamp, as an angle, from the direction vector a builder already has. | 130 |
| `editor_toolUtilities_siteDecals.localise(plan, ox, oy)` | The stamps as a manifest carries them, local to the bake origin. Grouped by template for the same reason the marks are<br>grouped by style: a lot stamps a few dozen glyphs off two sheets.<br>The facing is written down as an angle rather than the direction vector it came in as, so standing the site on a new<br>heading is one addition instead of a rotation per stamp. | 49 |
| `editor_toolUtilities_siteDecals.place(rec, px, py, yaw, ox, oy)` | And back: the manifest's stamps as a plan, stood where a placement is and turned onto its heading. `ox, oy` is the point<br>in the site's own frame the placement turns about, the same one everything else it stands is measured off. | 69 |
| `editor_toolUtilities_siteDecals.remove(objs)` | Take the stamps down again. | 110 |
| `editor_toolUtilities_siteDecals.template(name, spec)` | Get, or make, the DecalData one group of stamps comes off. Named after the site standing it, because burning a site<br>flips its own templates to persistent and must not flip a neighbour's. | 20 |

## Appels vers le moteur (C++)

- `scenetree.` `findObject`, `findObjectById`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/toolUtilities/siteDecals.lua`.*

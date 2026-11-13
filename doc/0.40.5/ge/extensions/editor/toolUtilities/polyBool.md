# `editor_toolUtilities_polyBool`

*Fichier : `lua/ge/extensions/editor/toolUtilities/polyBool.lua` · VM : Game Engine (GE) · 879 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_toolUtilities_polyBool` : `extensions.load("editor_toolUtilities_polyBool")`, puis la globale `editor_toolUtilities_polyBool`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_toolUtilities_polyBool.areas(regions)` | Sort a boolean result's flat ring list into outer rings each carrying its own holes, wound CCW outside and CW inside so a<br>triangulator can take them as they come. Nesting is by containment depth: even is solid, odd is a hole.<br>The companion to `difference` -- subtracting one shape from another is what produces a ring list that has to be read this<br>way, and every caller that cuts real ground out of real ground needs the same answer from it. | 829 |
| `editor_toolUtilities_polyBool.difference(subject, clip)` | Boolean difference: subject minus clip; accepts the same flexible input as normalize. Local-frame like unionMany. | 774 |
| `editor_toolUtilities_polyBool.unionMany(polys)` | Unions many polys. Works in a local frame near the origin so the absolute epsilon does not underflow at world coords. | 744 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/toolUtilities/polyBool.lua`.*

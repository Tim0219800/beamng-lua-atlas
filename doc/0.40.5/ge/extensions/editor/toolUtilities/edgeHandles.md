# `editor_toolUtilities_edgeHandles`

*Fichier : `lua/ge/extensions/editor/toolUtilities/edgeHandles.lua` · VM : Game Engine (GE) · 148 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_toolUtilities_edgeHandles` : `extensions.load("editor_toolUtilities_edgeHandles")`, puis la globale `editor_toolUtilities_edgeHandles`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_toolUtilities_edgeHandles.defaultGates(ring)` | A default pair of gates at opposite ends of the ring's long axis (entrance, exit). | 99 |
| `editor_toolUtilities_edgeHandles.drawHandle(gp, cp, e1, e2, base, glow, hovered)` | Draw the widget (given lifted points from handleGeom): a stalk from the edge to the floated bar, the bar with end dots, and<br> the centre grab knob (pulsing when hovered). `base`/`glow` are packed colours. | 127 |
| `editor_toolUtilities_edgeHandles.gateWorldDir(ring, gate)` | World position of a gate plus the OUTWARD unit normal of its edge (pointing away from the ring centre). Returns wx, wy, nx, ny. | 84 |
| `editor_toolUtilities_edgeHandles.handleGeom(ring, gate, outDist, halfWidth, liftFn)` | Geometry of the grabbable widget for `gate`: the bar is floated `outDist` m outside the edge and spans `halfWidth` m each<br> way along it. `liftFn(x,y) -> vec3` lifts a world point to the terrain (identity plane if omitted). Returns the edge point,<br> the bar centre (grab knob), and the two bar ends -- or nil if the gate is invalid. | 115 |
| `editor_toolUtilities_edgeHandles.nearestGate(ring, px, py)` | Snap a world point (px,py) to the nearest gate on the ring. Returns { edge, t }. | 68 |
| `editor_toolUtilities_edgeHandles.tagGates(gates)` | Every gate in the list given a name of its own, and the list handed back. A gate is otherwise known only by where it is<br> in its list, which shifts the moment one before it is removed -- no use to anything that has to keep hold of one. Called<br> from the accessors, so a list saved before this is named on the way out of the first one to ask for it. | 60 |

## Appels vers le moteur (C++)

- `Engine.` `generateUUID`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/toolUtilities/edgeHandles.lua`.*

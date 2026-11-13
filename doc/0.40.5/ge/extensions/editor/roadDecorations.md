# `editor_roadDecorations`

*Fichier : `lua/ge/extensions/editor/roadDecorations.lua` · VM : Game Engine (GE) · 183 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_roadDecorations` : `extensions.load("editor_roadDecorations")`, puis la globale `editor_roadDecorations`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_roadDecorations.decorateProps(roadName, shapeName, distance, period, rotation, zOff, align)` | Parameters:<br>  - roadName: The unique name of the DecalRoad to decorate<br>  - shapeName: Path to the shape file to decorate with<br>  - distance: Offset to the side of the road<br>  - period: Interval with which to place objects -- "Every x metres"<br>  - rotation: Direction vector by which to offset rotation. Props are already rotated to be facing parallel to the road<br>  - zOff: Vertical offset of the props. Props are placed at the height of the decalroad's closest node with the given offset added<br>  - align: boolean flag that dis/-enables objects always being placed along the same length of the road<br>Returns:<br>  A lua table of all objects created<br><br>Example call:<br>  decorateProps(9459, "levels/driver_training/art/shapes/objects/reflector.dae", 2, 25, nil, 0, true)<br>  Places a reflector 2 metres off the side of the road every 25 metres with no rotation and no z offset such<br>  that left and right are on the same length of the road.<br>-- | 112 |
| `editor_roadDecorations.findOffsetPoint(spline, length, distance, left)` |  | 7 |

## Appels vers le moteur (C++)

- `scenetree.` `findObject`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/roadDecorations.lua`.*

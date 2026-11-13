# `util_trackBuilder_pieces`

*Fichier : `lua/ge/extensions/util/trackBuilder/pieces.lua` · VM : Game Engine (GE) · 564 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `util_trackBuilder_pieces` : `extensions.load("util_trackBuilder_pieces")`, puis la globale `util_trackBuilder_pieces`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `util_trackBuilder_pieces.bezierCurve(radius, angle, direction, hardness, radiusMult)` |  | 118 |
| `util_trackBuilder_pieces.curve(radius, angle, direction, hardness, radiusMult)` | creates a track fo specified length. direction allows for turning in 60?-steps | 142 |
| `util_trackBuilder_pieces.customBezier(xOff, yOff, dirOff, forwardLen, backwardLen, isHex, absolute, empty)` |  | 193 |
| `util_trackBuilder_pieces.emptyOffset(xOff, yOff, zOff, dirOff, absolute, isHex)` |  | 510 |
| `util_trackBuilder_pieces.forward(length)` | creates a hexForward piece of the specified length. | 101 |
| `util_trackBuilder_pieces.freeSpiral(size, inside, dir, angle)` |  | 314 |
| `util_trackBuilder_pieces.fresnelSC(d)` | helper function for the hexLoop calculation. returns point from an euler hexSpiral. | 375 |
| `util_trackBuilder_pieces.getHdgVector(hdg)` |  | 87 |
| `util_trackBuilder_pieces.hexSpiral(size, inside, dir)` | this creates a hexSpiral piece, leading into a hexCurve. | 249 |
| `util_trackBuilder_pieces.initialTrackPiece(p)` | Hex Pieces | 91 |
| `util_trackBuilder_pieces.loop(xOffset, radius, isHex)` | creates a hexLooping. | 403 |
| `util_trackBuilder_pieces.offsetCurve(length, xOffset, hardness, isHex)` | this creates an S-hexCurve of specified length and offset to the left or right. | 165 |
| `util_trackBuilder_pieces.rotateVectorByQuat(v, q)` | helper function to rotate a vector by a quat. | 539 |
| `util_trackBuilder_pieces.squareSpiral(size, inside, dir)` | this creates a hexSpiral piece, leading into a hexCurve. | 282 |
| `util_trackBuilder_pieces.toSegment(piece, tip)` |  | 12 |

## Champs

| Champ | Type | Description |
|---|---|---|
| `splineTrack` | nil |  |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/util/trackBuilder/pieces.lua`.*

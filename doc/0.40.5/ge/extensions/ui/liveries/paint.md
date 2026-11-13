# `ui_liveries_paint`

*Fichier : `lua/ge/extensions/ui/liveries/paint.lua` · VM : Game Engine (GE) · 106 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `ui_liveries_paint` : `extensions.load("ui_liveries_paint")`, puis la globale `ui_liveries_paint`

**Dépendances (chargées avant) :** `editor_api_dynamicDecals`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `ui_liveries_paint.getLayerPaint(layerUid)` |  | 59 |
| `ui_liveries_paint.getVehiclePaintPresets()` | shared with the decal editor, which paints the live projection instead of a committed layer | 12 |
| `ui_liveries_paint.readNormalized(value, fallback)` | ui values are normalized, so anything out of range or non-numeric falls back to the layer's own | 21 |
| `ui_liveries_paint.setLayerPaint(layerUid, paint)` | the new values are applied to a copy of the layer, so the api's history don't get affected | 67 |

## Champs

| Champ | Type | Description |
|---|---|---|
| `EDITABLE_COLOR_PALETTE_MAP_ID` | number | palette map 0 is the only mode in which a layer renders its own color, every other id pulls<br> the color from a vehicle color palette slot instead and ignores the layer's own |
| `dependencies` | table |  |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/ui/liveries/paint.lua`.*

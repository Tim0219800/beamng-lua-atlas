# `editor_heroRoadEditor_profile`

*Fichier : `lua/ge/extensions/editor/heroRoadEditor/profile.lua` · VM : Game Engine (GE) · 375 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_heroRoadEditor_profile` : `extensions.load("editor_heroRoadEditor_profile")`, puis la globale `editor_heroRoadEditor_profile`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_heroRoadEditor_profile.build(group)` | Builds the per-station cross-sections + bank for the group.<br> Returns: stations (array over divPoints of { pts = {{o,dz}...}, bank = radians }), bandMat (material key per band). | 283 |
| `editor_heroRoadEditor_profile.minSafeRadius(group)` |  | 349 |
| `editor_heroRoadEditor_profile.previewCrossSection(group)` | Straight-section cross-section (full crown, no bank, no fold clamp) for the read-only UI preview. | 360 |

## Champs

| Champ | Type | Description |
|---|---|---|
| `MAT_ROAD` | any | Public interface. |
| `MAT_SHOULDER` | any |  |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/heroRoadEditor/profile.lua`.*

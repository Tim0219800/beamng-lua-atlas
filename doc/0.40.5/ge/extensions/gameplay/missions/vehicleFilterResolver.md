# `gameplay_missions_vehicleFilterResolver`

*Fichier : `lua/ge/extensions/gameplay/missions/vehicleFilterResolver.lua` · VM : Game Engine (GE) · 249 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `gameplay_missions_vehicleFilterResolver` : `extensions.load("gameplay_missions_vehicleFilterResolver")`, puis la globale `gameplay_missions_vehicleFilterResolver`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `gameplay_missions_vehicleFilterResolver.hasAnyConfiguration(filterData)` | Returns true if `filterData` has any filter, manual addition, or manual removal<br> that would meaningfully constrain the eligible vehicle set. | 172 |
| `gameplay_missions_vehicleFilterResolver.resolveFilteredConfigs(filterData)` | Resolves the given `filterData` into a flat list of `{model, config, name}` entries.<br> Always returns a table (possibly empty). Honors base filter, probability settings,<br> manual additions, manual removals, maxVehicles, and auxiliary/trailer flags. | 189 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/gameplay/missions/vehicleFilterResolver.lua`.*

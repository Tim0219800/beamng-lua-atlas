# `gameplay_vehiclePerformance`

*Fichier : `lua/ge/extensions/gameplay/vehiclePerformance.lua` · VM : Game Engine (GE) · 189 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `gameplay_vehiclePerformance` : `extensions.load("gameplay_vehiclePerformance")`, puis la globale `gameplay_vehiclePerformance`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `gameplay_vehiclePerformance.buildClassRequirement(name)` | Returns a PerformanceIndexSticker-shaped table for a class-only requirement.<br> Shape mirrors getClassFromData: { class = { name, description, minPI }, performanceIndex }.<br> The `isThreshold` flag tells the UI to render this as a minimum threshold (>=). | 150 |
| `gameplay_vehiclePerformance.getAggregateScores(testData)` |  | 48 |
| `gameplay_vehiclePerformance.getClassByName(name)` | Returns the row from `vehicleClasses` matching the given letter, or nil. | 131 |
| `gameplay_vehiclePerformance.getClassFromConfig(model, configName)` |  | 123 |
| `gameplay_vehiclePerformance.getClassFromConfigTable(configTable)` | Reads the class/PI already computed and saved by the automated performance test<br> (config["Performance Data"]). Falls back to computing it live from config["Drag Times"]<br> for configs that predate/lack that saved value. | 99 |
| `gameplay_vehiclePerformance.getClassFromData(testData)` |  | 85 |
| `gameplay_vehiclePerformance.getClassFromVehId(vehId)` |  | 116 |
| `gameplay_vehiclePerformance.getClassNames()` |  | 139 |
| `gameplay_vehiclePerformance.getDefaultMissionVehicleSpec(setupModule)` | Picks the spec of the "default" vehicle implied by a mission's<br> `setupModules.vehicles` block (i.e. the option that the mission settings UI<br> would initially pre-select). Returns one of:<br>   { kind = "player" }                              -- the player's own vehicle<br>   { kind = "preset", model = ..., config = ... }   -- a preset config from the mission<br>   nil                                              -- no default available | 166 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/gameplay/vehiclePerformance.lua`.*

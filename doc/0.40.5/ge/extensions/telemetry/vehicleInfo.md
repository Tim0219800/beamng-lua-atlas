# `telemetry_vehicleInfo`

*Fichier : `lua/ge/extensions/telemetry/vehicleInfo.lua` · VM : Game Engine (GE) · 50 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `telemetry_vehicleInfo` : `extensions.load("telemetry_vehicleInfo")`, puis la globale `telemetry_vehicleInfo`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `telemetry_vehicleInfo.getData(vid)` | Model and part config of a vehicle. A custom configuration reports as ":custom", so no<br> user built configuration ever leaves the machine. | 14 |
| `telemetry_vehicleInfo.getMod(model)` | The mod a vehicle model comes from, nil for stock content. The mod manager can only<br> resolve zipped mods, an unpacked mod returns nil. | 37 |

## Appels vers le moteur (C++)

- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/telemetry/vehicleInfo.lua`.*

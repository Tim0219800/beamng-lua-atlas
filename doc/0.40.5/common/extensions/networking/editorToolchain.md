# `networking_editorToolchain`

*Fichier : `lua/common/extensions/networking/editorToolchain.lua` · VM : Commun (GE + véhicule) · 214 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `networking_editorToolchain` : `extensions.load("networking_editorToolchain")`, puis la globale `networking_editorToolchain`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `networking_editorToolchain.onExtensionLoaded()` | *(hook)* | 183 |
| `networking_editorToolchain.onExtensionUnloaded()` | *(hook)* | 187 |
| `networking_editorToolchain.onInit()` | *(hook)* | 202 |
| `networking_editorToolchain.onPreRender(dtReal, dtSim, dtRaw)` | *(hook)* | 126 |
| `networking_editorToolchain.onVehicleSpawned(vehID)` | *(hook)* | 194 |
| `networking_editorToolchain.onVehicleSwitched(_, _, player)` | *(hook)* | 198 |

## Appels vers le moteur (C++)

- `FS:` `getGamePath`, `getUserPath`
- `be:` `getPlayerVehicleID`
- `debugDrawer:` `drawSphere`, `drawText`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/common/extensions/networking/editorToolchain.lua`.*

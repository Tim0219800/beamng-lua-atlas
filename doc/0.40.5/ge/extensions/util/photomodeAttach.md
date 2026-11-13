# `util_photomodeAttach`

*Fichier : `lua/ge/extensions/util/photomodeAttach.lua` · VM : Game Engine (GE) · 138 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `util_photomodeAttach` : `extensions.load("util_photomodeAttach")`, puis la globale `util_photomodeAttach`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `util_photomodeAttach.enable(en, opts)` |  | 50 |
| `util_photomodeAttach.onPreRender(dtReal, dtSim, dtRaw)` | *(hook)* | 134 |
| `util_photomodeAttach.syncCameraToVehicle()` |  | 100 |

## Champs

| Champ | Type | Description |
|---|---|---|
| `enabled` | boolean |  |
| `followRotation` | boolean |  |
| `offsetLocal` | nil |  |
| `offsetWorld` | nil |  |
| `rotOffset` | nil |  |

## Appels vers le moteur (C++)

- `be:` `getPlayerVehicleID`
- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/util/photomodeAttach.lua`.*

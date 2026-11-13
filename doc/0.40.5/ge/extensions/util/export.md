# `util_export`

*Fichier : `lua/ge/extensions/util/export.lua` · VM : Game Engine (GE) · 1311 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `util_export` : `extensions.load("util_export")`, puis la globale `util_export`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `util_export.export(handler)` |  | 1124 |
| `util_export.exportFile(filename)` |  | 1140 |
| `util_export.getGeInfo()` |  | 1284 |
| `util_export.startRecording(filename)` |  | 1248 |
| `util_export.stopRecording()` |  | 1253 |
| `util_export.suggestFilename()` | for the UI | 1263 |
| `util_export.updateGFX(dt)` |  | 1257 |

## Champs

| Champ | Type | Description |
|---|---|---|
| `embedBuffers` | boolean | public interface |
| `exportBeams` | boolean |  |
| `exportColors` | boolean |  |
| `exportNormals` | boolean |  |
| `exportTangents` | boolean |  |
| `exportTexCoords` | boolean |  |
| `gltfBinaryFormat` | boolean |  |

**Évènements UI (guihooks.trigger) :** `ThreeDExported`

## Appels vers le moteur (C++)

- `FS:` `fileExists`, `findFiles`
- `be:` `getPlayerVehicleID`
- `scenetree.` `findObject`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/util/export.lua`.*

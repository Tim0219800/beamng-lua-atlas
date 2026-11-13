# `ui_photomode_overlays`

*Fichier : `lua/ge/extensions/ui/photomode/overlays.lua` · VM : Game Engine (GE) · 553 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `ui_photomode_overlays` : `extensions.load("ui_photomode_overlays")`, puis la globale `ui_photomode_overlays`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `ui_photomode_overlays.cloneOverlay(sourceId, destId)` |  | 288 |
| `ui_photomode_overlays.createOverlay(destId, payload)` |  | 251 |
| `ui_photomode_overlays.deleteOverlay(id)` |  | 494 |
| `ui_photomode_overlays.discover()` |  | 206 |
| `ui_photomode_overlays.getOverlays()` |  | 211 |
| `ui_photomode_overlays.listLiveryGraphics()` |  | 443 |
| `ui_photomode_overlays.listUiApps()` |  | 401 |
| `ui_photomode_overlays.onExtensionLoaded()` | *(hook)* | 536 |
| `ui_photomode_overlays.onExtensionUnloaded()` | *(hook)* | 541 |
| `ui_photomode_overlays.onFilesChanged(files)` | *(hook)* | 525 |
| `ui_photomode_overlays.onUiReady()` | *(hook)* | 545 |
| `ui_photomode_overlays.renameOverlay(sourceId, destId, newName)` |  | 316 |
| `ui_photomode_overlays.saveOverlay(id, payload)` |  | 215 |

**Évènements UI (guihooks.trigger) :** `PhotomodeOverlaysChanged`

## Appels vers le moteur (C++)

- `FS:` `copyFile`, `directoryCreate`, `directoryRemove`, `fileExists`, `findFiles`, `getFileRealPath`, `getOriginArchivePathRelative`, `getUserPath`, `removeFile`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/ui/photomode/overlays.lua`.*

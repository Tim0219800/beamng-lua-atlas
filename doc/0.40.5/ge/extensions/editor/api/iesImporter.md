# `editor_api_iesImporter`

*Fichier : `lua/ge/extensions/editor/api/iesImporter.lua` · VM : Game Engine (GE) · 1318 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_api_iesImporter` : `extensions.load("editor_api_iesImporter")`, puis la globale `editor_api_iesImporter`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_api_iesImporter.buildCookieMetadata(ies, outPath, opts, saveInfo)` |  | 1107 |
| `editor_api_iesImporter.generateCookie(ies, opts)` |  | 663 |
| `editor_api_iesImporter.generateToFile(iesPath, outPath, opts)` | High-level generation | 1241 |
| `editor_api_iesImporter.getCookieMetadataPath(outPath)` | Sidecar metadata | 983 |
| `editor_api_iesImporter.getHeaderValue(meta, keys, fallback)` |  | 269 |
| `editor_api_iesImporter.getPeakDirection(ies)` |  | 458 |
| `editor_api_iesImporter.inferCookiePathFromIES(iesPath)` |  | 1308 |
| `editor_api_iesImporter.parseHeaderMetadata(path)` |  | 209 |
| `editor_api_iesImporter.parseIES(path)` |  | 332 |
| `editor_api_iesImporter.prepareHorizontalData(horizontalAngles, candela)` | Sampling | 501 |
| `editor_api_iesImporter.printIESInfo(ies)` |  | 484 |
| `editor_api_iesImporter.sampleIES(theta, phi, ies, prepared)` |  | 563 |
| `editor_api_iesImporter.saveImage(img, outPath, opts)` |  | 869 |
| `editor_api_iesImporter.writeCookieMetadata(ies, outPath, opts, saveInfo)` |  | 1230 |

## Appels vers le moteur (C++)

- `FS:` `directoryExists`, `fileExists`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/api/iesImporter.lua`.*

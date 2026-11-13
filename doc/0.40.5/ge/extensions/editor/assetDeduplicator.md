# `editor_assetDeduplicator`

*Fichier : `lua/ge/extensions/editor/assetDeduplicator.lua` · VM : Game Engine (GE) · 996 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_assetDeduplicator` : `extensions.load("editor_assetDeduplicator")`, puis la globale `editor_assetDeduplicator`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_assetDeduplicator.onEditorActivated()` | *(hook)* | 976 |
| `editor_assetDeduplicator.onEditorDeactivated()` | *(hook)* | 980 |
| `editor_assetDeduplicator.onEditorGui()` | *(hook)* | 849 |
| `editor_assetDeduplicator.onEditorInitialized()` | *(hook)* | 984 |
| `editor_assetDeduplicator.onWindowMenuItem()` | *(hook)* | 38 |

## Appels vers le moteur (C++)

- `FS:` `fileExists`, `fileSize`, `findFiles`, `getFileRealPath`, `getUserPath`, `hashFile`, `isLinkFile`, `removeFile`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/assetDeduplicator.lua`.*

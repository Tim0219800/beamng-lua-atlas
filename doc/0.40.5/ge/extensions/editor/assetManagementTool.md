# `editor_assetManagementTool`

*Fichier : `lua/ge/extensions/editor/assetManagementTool.lua` · VM : Game Engine (GE) · 2025 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_assetManagementTool` : `extensions.load("editor_assetManagementTool")`, puis la globale `editor_assetManagementTool`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_assetManagementTool.onEditorActivated()` | *(hook)* | 1989 |
| `editor_assetManagementTool.onEditorGui()` | *(hook)* | 1639 |
| `editor_assetManagementTool.onEditorInitialized()` | *(hook)* | 1996 |
| `editor_assetManagementTool.onExtensionLoaded()` | *(hook)* | 2017 |

## Appels vers le moteur (C++)

- `FS:` `convertLinkFileToTargetCopy`, `copyFile`, `deleteAssetFileForLinkFile`, `fileExists`, `findFiles`, `findHighestNumberedFolder`, `findLinkFiles`, `getGamePath`, `getHashFileAlgorithmId`, `getUserPath`, `hashFile`, `isLinkFile`, `native2Virtual`, `removeFile`
- `worldEditorCppApi.` `isSelectMultipleFilesAvailable`, `selectMultipleFiles`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/assetManagementTool.lua`.*

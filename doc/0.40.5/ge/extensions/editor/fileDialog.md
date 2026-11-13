# `editor_fileDialog`

*Fichier : `lua/ge/extensions/editor/fileDialog.lua` · VM : Game Engine (GE) · 980 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_fileDialog` : `extensions.load("editor_fileDialog")`, puis la globale `editor_fileDialog`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_fileDialog.onEditorActivated()` | *(hook)* | 918 |
| `editor_fileDialog.onEditorDeactivated()` | *(hook)* | 921 |
| `editor_fileDialog.onEditorGui()` | public interface *(hook)* | 409 |
| `editor_fileDialog.onEditorInitialized()` | *(hook)* | 924 |
| `editor_fileDialog.onEditorRegisterPreferences(prefsRegistry)` | *(hook)* | 956 |
| `editor_fileDialog.onExtensionLoaded()` | *(hook)* | 915 |
| `editor_fileDialog.openFile(callbackFn, filenameSuffix, selectFolder, defaultPath, preview, caseSensitivePattern)` |  | 907 |
| `editor_fileDialog.saveFile(callbackFn, filenameSuffix, selectFolder, defaultPath, overwriteDialogText)` |  | 911 |

## Appels vers le moteur (C++)

- `FS:` `directoryCreate`, `directoryExists`, `fileExists`, `findFiles`, `stat`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/fileDialog.lua`.*

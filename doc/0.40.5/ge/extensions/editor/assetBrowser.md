# `editor_assetBrowser`

*Fichier : `lua/ge/extensions/editor/assetBrowser.lua` · VM : Game Engine (GE) · 5849 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_assetBrowser` : `extensions.load("editor_assetBrowser")`, puis la globale `editor_assetBrowser`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_assetBrowser.clearSelectedAsset()` |  | 813 |
| `editor_assetBrowser.getAssetByPath(path)` |  | 1736 |
| `editor_assetBrowser.getSelectedAsset()` |  | 809 |
| `editor_assetBrowser.moveSelectionIndex(up)` |  | 5819 |
| `editor_assetBrowser.onEditorActivated()` | *(hook)* | 5255 |
| `editor_assetBrowser.onEditorGui()` | *(hook)* | 5407 |
| `editor_assetBrowser.onEditorInitialized()` | *(hook)* | 5213 |
| `editor_assetBrowser.onEditorPreferenceValueChanged(path, value)` | *(hook)* | 5595 |
| `editor_assetBrowser.onEditorRegisterPreferences(prefsRegistry)` | *(hook)* | 5651 |
| `editor_assetBrowser.onEditorToolWindowGotFocus(windowName)` | *(hook)* | 5624 |
| `editor_assetBrowser.onEditorToolWindowLostFocus(windowName)` | *(hook)* | 5630 |
| `editor_assetBrowser.onFileChanged(path, type)` | *(hook)* | 5313 |
| `editor_assetBrowser.selectFileByPath(path)` | public interface | 1673 |

## Appels vers le moteur (C++)

- `FS:` `directoryCreate`, `directoryExists`, `directoryRemove`, `fileExists`, `findFiles`, `removeFile`, `stat`
- `Sim.` `deserializeObjectsFromText`, `findObjectById`, `getUniqueName`
- `obj:` `getPosition`, `serialize`
- `scenetree.` `findObject`, `findObjectById`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/assetBrowser.lua`.*

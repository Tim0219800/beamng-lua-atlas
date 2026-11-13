# `editor_cameraBookmarks`

*Fichier : `lua/ge/extensions/editor/cameraBookmarks.lua` · VM : Game Engine (GE) · 143 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_cameraBookmarks` : `extensions.load("editor_cameraBookmarks")`, puis la globale `editor_cameraBookmarks`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_cameraBookmarks.onEditorGui()` | *(hook)* | 79 |
| `editor_cameraBookmarks.onEditorInitialized()` | *(hook)* | 133 |
| `editor_cameraBookmarks.onExtensionLoaded()` | *(hook)* | 130 |

## Appels vers le moteur (C++)

- `obj:` `deleteObject`, `getInternalName`, `getTransform`
- `scenetree.` `findObjectById`
- `worldEditorCppApi.` `createObject`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/cameraBookmarks.lua`.*

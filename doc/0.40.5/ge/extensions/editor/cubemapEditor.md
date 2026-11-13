# `editor_cubemapEditor`

*Fichier : `lua/ge/extensions/editor/cubemapEditor.lua` · VM : Game Engine (GE) · 760 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_cubemapEditor` : `extensions.load("editor_cubemapEditor")`, puis la globale `editor_cubemapEditor`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_cubemapEditor.onEditorGui()` | *(hook)* | 751 |
| `editor_cubemapEditor.onEditorInitialized()` | *(hook)* | 745 |
| `editor_cubemapEditor.show(onSelectCb, preselectName)` |  | 734 |

## Appels vers le moteur (C++)

- `FS:` `directoryCreate`, `directoryExists`, `fileExists`
- `obj:` `setField`
- `scenetree.` `findClassObjects`, `findObject`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/cubemapEditor.lua`.*

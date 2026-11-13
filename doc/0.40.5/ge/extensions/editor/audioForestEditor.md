# `editor_audioForestEditor`

*Fichier : `lua/ge/extensions/editor/audioForestEditor.lua` · VM : Game Engine (GE) · 1022 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_audioForestEditor` : `extensions.load("editor_audioForestEditor")`, puis la globale `editor_audioForestEditor`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_audioForestEditor.onDeserialized(data)` | Receives persisted editor state after level load. *(hook)* | 1005 |
| `editor_audioForestEditor.onEditorGui()` | Updates editor UI, picking, and node visualization. *(hook)* | 918 |
| `editor_audioForestEditor.onEditorInitialized()` | Registers the editor mode and tool window. *(hook)* | 991 |
| `editor_audioForestEditor.onSerialize()` | Serializes editor state for runtime and level persistence. *(hook)* | 113 |

## Appels vers le moteur (C++)

- `debugDrawer:` `drawSphere`
- `worldEditorCppApi.` `renderForestBBs`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/audioForestEditor.lua`.*

# `editor_audioRibbonEditor`

*Fichier : `lua/ge/extensions/editor/audioRibbonEditor.lua` · VM : Game Engine (GE) · 969 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_audioRibbonEditor` : `extensions.load("editor_audioRibbonEditor")`, puis la globale `editor_audioRibbonEditor`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_audioRibbonEditor.onEditorGui()` | World editor main callback for rendering the UI. *(hook)* | 900 |
| `editor_audioRibbonEditor.onEditorInitialized()` | Called upon world editor initialization. *(hook)* | 948 |
| `editor_audioRibbonEditor.onInit()` | Initialisation callback. *(hook)* | 325 |

## Appels vers le moteur (C++)

- `Engine.` `generateUUID`
- `scenetree.` `findClassObjects`, `findObject`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/audioRibbonEditor.lua`.*

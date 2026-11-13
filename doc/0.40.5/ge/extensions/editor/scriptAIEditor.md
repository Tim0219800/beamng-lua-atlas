# `editor_scriptAIEditor`

*Fichier : `lua/ge/extensions/editor/scriptAIEditor.lua` · VM : Game Engine (GE) · 3229 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_scriptAIEditor` : `extensions.load("editor_scriptAIEditor")`, puis la globale `editor_scriptAIEditor`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_scriptAIEditor.onDeserialized(dataIn)` | Deserialization function. *(hook)* | 3203 |
| `editor_scriptAIEditor.onEditorGui()` | Functions triggered by hooks. *(hook)* | 1989 |
| `editor_scriptAIEditor.onEditorInitialized()` | Called upon world editor initialization. *(hook)* | 3128 |
| `editor_scriptAIEditor.onSerialize()` | Serialization function. *(hook)* | 3186 |
| `editor_scriptAIEditor.onVehicleReplaced(vid)` | Triggered when a vehicle is replaced. *(hook)* | 3169 |
| `editor_scriptAIEditor.onVehicleSubmitRecording(vid, data)` | Triggering when a recording is stopped. *(hook)* | 3153 |

## Appels vers le moteur (C++)

- `be:` `enterVehicle`
- `debugDrawer:` `drawArrow`, `drawLineInstance`, `drawSphere`, `drawSquarePrism`, `drawTextAdvanced`
- `obj:` `getInitialHeight`, `getInitialLength`, `getInitialWidth`
- `scenetree.` `findObject`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/scriptAIEditor.lua`.*

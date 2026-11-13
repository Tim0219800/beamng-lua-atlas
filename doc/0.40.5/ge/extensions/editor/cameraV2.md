# `editor_cameraV2`

*Fichier : `lua/ge/extensions/editor/cameraV2.lua` · VM : Game Engine (GE) · 564 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_cameraV2` : `extensions.load("editor_cameraV2")`, puis la globale `editor_cameraV2`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_cameraV2.consumeFocusDoubleClick()` |  | 542 |
| `editor_cameraV2.onEditorActivated()` | *(hook)* | 504 |
| `editor_cameraV2.onEditorDeactivated()` | *(hook)* | 508 |
| `editor_cameraV2.onEditorGui()` | *(hook)* | 546 |
| `editor_cameraV2.onEditorInitialized()` | *(hook)* | 496 |
| `editor_cameraV2.onEditorPreferenceValueChanged(path, value)` | *(hook)* | 513 |
| `editor_cameraV2.onEditorRegisterPreferences(prefsRegistry)` | *(hook)* | 420 |
| `editor_cameraV2.onExtensionUnloaded()` | *(hook)* | 552 |
| `editor_cameraV2.onUpdate(dtReal)` | *(hook)* | 529 |
| `editor_cameraV2.setTemporaryEnabled(enabled)` |  | 205 |

## Appels vers le moteur (C++)

- `Engine.` `castRay`
- `debugDrawer:` `drawCylinder`, `drawSphere`
- `ui_imgui.` `Button`, `GetIO`, `ImVec2`, `ImVec4`, `PopStyleColor`, `PushStyleColor2`, `RadioButton1`, `SameLine`, `Separator`, `TextColored`, `TextUnformatted`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/cameraV2.lua`.*

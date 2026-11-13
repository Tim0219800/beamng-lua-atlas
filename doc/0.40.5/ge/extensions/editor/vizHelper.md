# `editor_vizHelper`

*Fichier : `lua/ge/extensions/editor/vizHelper.lua` · VM : Game Engine (GE) · 228 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_vizHelper` : `extensions.load("editor_vizHelper")`, puis la globale `editor_vizHelper`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_vizHelper.onDeserialized(data)` | *(hook)* | 211 |
| `editor_vizHelper.onEditorActivated()` | *(hook)* | 198 |
| `editor_vizHelper.onEditorDeactivated()` | *(hook)* | 201 |
| `editor_vizHelper.onEditorGui()` | *(hook)* | 50 |
| `editor_vizHelper.onEditorInitialized()` | *(hook)* | 185 |
| `editor_vizHelper.onExtensionLoaded()` | *(hook)* | 190 |
| `editor_vizHelper.onSerialize()` | *(hook)* | 205 |
| `editor_vizHelper.onUpdate()` | *(hook)* | 173 |
| `editor_vizHelper.openWindow()` | public interface | 37 |

## Champs

| Champ | Type | Description |
|---|---|---|
| `windowOpen` | any |  |

## Appels vers le moteur (C++)

- `FS:` `findFiles`
- `debugDrawer:` `drawSphere`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/vizHelper.lua`.*

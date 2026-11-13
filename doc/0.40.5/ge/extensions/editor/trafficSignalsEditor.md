# `editor_trafficSignalsEditor`

*Fichier : `lua/ge/extensions/editor/trafficSignalsEditor.lua` · VM : Game Engine (GE) · 1926 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_trafficSignalsEditor` : `extensions.load("editor_trafficSignalsEditor")`, puis la globale `editor_trafficSignalsEditor`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_trafficSignalsEditor.getCurrentElements()` |  | 257 |
| `editor_trafficSignalsEditor.getCurrentSignals()` |  | 261 |
| `editor_trafficSignalsEditor.loadFile(fileName)` |  | 295 |
| `editor_trafficSignalsEditor.onClientEndMission()` | *(hook)* | 1879 |
| `editor_trafficSignalsEditor.onDeserialized(data)` | *(hook)* | 1888 |
| `editor_trafficSignalsEditor.onEditorGui(dt)` | *(hook)* | 1735 |
| `editor_trafficSignalsEditor.onEditorInitialized()` | *(hook)* | 1900 |
| `editor_trafficSignalsEditor.onSerialize()` | *(hook)* | 1883 |
| `editor_trafficSignalsEditor.onWindowMenuItem()` | *(hook)* | 1894 |
| `editor_trafficSignalsEditor.saveFile(fileName)` |  | 308 |
| `editor_trafficSignalsEditor.setCurrentSignals(data)` |  | 265 |

## Appels vers le moteur (C++)

- `be:` `getEnabled`
- `debugDrawer:` `drawSquarePrism`, `drawTextAdvanced`
- `obj:` `getId`, `getInternalName`, `getPosition`, `getTransform`
- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/trafficSignalsEditor.lua`.*

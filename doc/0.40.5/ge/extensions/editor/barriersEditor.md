# `editor_barriersEditor`

*Fichier : `lua/ge/extensions/editor/barriersEditor.lua` · VM : Game Engine (GE) · 316 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_barriersEditor` : `extensions.load("editor_barriersEditor")`, puis la globale `editor_barriersEditor`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_barriersEditor.onDeserialized(data)` | *(hook)* | 303 |
| `editor_barriersEditor.onEditorGui()` | *(hook)* | 77 |
| `editor_barriersEditor.onEditorInitialized()` | *(hook)* | 286 |
| `editor_barriersEditor.onSerialize()` | *(hook)* | 300 |
| `editor_barriersEditor.show()` |  | 281 |

## Champs

| Champ | Type | Description |
|---|---|---|
| `onExtensionLoaded` | any |  ⚠ référence `onExtensionLoaded` non définie dans le fichier (vaut probablement nil) |

## Appels vers le moteur (C++)

- `FS:` `findFiles`
- `Sim.` `upcast`
- `debugDrawer:` `drawSphere`, `drawTextAdvanced`
- `obj:` `getClassName`, `getPosition`, `getRotation`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/barriersEditor.lua`.*

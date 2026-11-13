# `editor_roadArchitect`

*Fichier : `lua/ge/extensions/editor/roadArchitect.lua` · VM : Game Engine (GE) · 8144 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_roadArchitect` : `extensions.load("editor_roadArchitect")`, puis la globale `editor_roadArchitect`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_roadArchitect.onDeserialized()` | Deserialization function. *(hook)* | 8073 |
| `editor_roadArchitect.onEditorGui()` | World editor main callback for rendering the UI. *(hook)* | 7697 |
| `editor_roadArchitect.onEditorInitialized()` | Called upon world editor initialization. *(hook)* | 7947 |
| `editor_roadArchitect.onSerialize()` | Serialization function. *(hook)* | 7993 |

## Appels vers le moteur (C++)

- `Sim.` `getMaterialSet`
- `be:` `reloadCollision`
- `obj:` `getField`, `getName`
- `scenetree.` `findObject`, `findObjectById`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/roadArchitect.lua`.*

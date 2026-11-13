# `editor_terrainMaterialsEditor`

*Fichier : `lua/ge/extensions/editor/terrainMaterialsEditor.lua` · VM : Game Engine (GE) · 2296 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_terrainMaterialsEditor` : `extensions.load("editor_terrainMaterialsEditor")`, puis la globale `editor_terrainMaterialsEditor`

**Dépendances (chargées avant) :** `editor_terrainEditor`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_terrainMaterialsEditor.onEditorActivated()` | *(hook)* | 2282 |
| `editor_terrainMaterialsEditor.onEditorGui()` | *(hook)* | 1666 |
| `editor_terrainMaterialsEditor.onEditorInitialized()` | *(hook)* | 2272 |

## Champs

| Champ | Type | Description |
|---|---|---|
| `dependencies` | table | public interface |

## Appels vers le moteur (C++)

- `FS:` `directoryCreate`, `directoryExists`, `fileExists`, `findFiles`
- `obj:` `getField`, `getId`, `setField`
- `scenetree.` `findClassObjects`, `findObject`, `findObjectById`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/terrainMaterialsEditor.lua`.*

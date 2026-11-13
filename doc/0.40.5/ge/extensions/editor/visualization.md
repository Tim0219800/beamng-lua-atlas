# `editor_visualization`

*Fichier : `lua/ge/extensions/editor/visualization.lua` · VM : Game Engine (GE) · 542 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_visualization` : `extensions.load("editor_visualization")`, puis la globale `editor_visualization`

**Dépendances (chargées avant) :** `editor_aiViz`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_visualization.onEditorGui()` | *(hook)* | 225 |
| `editor_visualization.onEditorInitialized()` | *(hook)* | 440 |
| `editor_visualization.onEditorPreferenceValueChanged(path, value)` | *(hook)* | 359 |
| `editor_visualization.onEditorRegisterPreferences(prefsRegistry)` | *(hook)* | 401 |

## Champs

| Champ | Type | Description |
|---|---|---|
| `dependencies` | table |  |

## Appels vers le moteur (C++)

- `ResearchVerifier.` `isTechLicenseVerified`
- `debugDrawer:` `drawSphere`, `drawTextAdvanced`
- `obj:` `getClassName`, `getDynDataFieldbyName`, `getField`, `getName`, `getPosition`, `getWorldBox`, `isSubClassOf`
- `scenetree.` `findClassObjects`, `findObject`, `findSubClassObjects`
- `worldEditorCppApi.` `getObjectClassNames`, `getRenderableObjectClassNames`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/visualization.lua`.*

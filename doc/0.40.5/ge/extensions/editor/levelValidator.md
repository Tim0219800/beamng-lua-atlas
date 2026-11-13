# `editor_levelValidator`

*Fichier : `lua/ge/extensions/editor/levelValidator.lua` · VM : Game Engine (GE) · 993 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_levelValidator` : `extensions.load("editor_levelValidator")`, puis la globale `editor_levelValidator`

**Dépendances (chargées avant) :** `core_forest`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_levelValidator.getLevelLogs()` |  | 894 |
| `editor_levelValidator.getLevelLogsAggregated()` |  | 897 |
| `editor_levelValidator.onClientStartMission()` | *(hook)* | 876 |
| `editor_levelValidator.onEditorAfterSaveLevel(state)` | *(hook)* | 884 |
| `editor_levelValidator.onEditorGui()` | *(hook)* | 578 |
| `editor_levelValidator.onEditorInitialized()` | *(hook)* | 856 |
| `editor_levelValidator.onEditorPreferenceValueChanged(path, value)` | *(hook)* | 888 |
| `editor_levelValidator.onEditorRegisterPreferences(prefsRegistry)` | *(hook)* | 865 |
| `editor_levelValidator.onExtensionLoaded()` | *(hook)* | 861 |
| `editor_levelValidator.startLevelValidation()` |  | 567 |

## Champs

| Champ | Type | Description |
|---|---|---|
| `dependencies` | table |  |

## Classe `sortingFunctions`

| Méthode | Description | Ligne |
|---|---|---|
| `sortingFunctions.Code(a, b)` |  | 45 |
| `sortingFunctions.Description(a, b)` |  | 51 |
| `sortingFunctions.File(a, b)` |  | 71 |
| `sortingFunctions.Line(a, b)` |  | 77 |
| `sortingFunctions.LogLevel(a, b)` |  | 39 |
| `sortingFunctions.ObjectName(a, b)` |  | 63 |
| `sortingFunctions.Origin(a, b)` |  | 57 |

## Hooks émis

Évènements diffusés aux extensions par `extensions.hook` :

- `onLevelValidationFinished`

## Appels vers le moteur (C++)

- `Sim.` `deserializeObjectsFromText`, `findObjectById`
- `obj:` `deleteObject`, `getId`, `getWorldBox`, `isSubClassOf`, `serialize`
- `scenetree.` `findClassObjects`, `findObject`, `findObjectById`, `getAllObjects`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/levelValidator.lua`.*

# `editor_missionEditor`

*Fichier : `lua/ge/extensions/editor/missionEditor.lua` · VM : Game Engine (GE) · 1791 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_missionEditor` : `extensions.load("editor_missionEditor")`, puis la globale `editor_missionEditor`

**Dépendances (chargées avant) :** `gameplay_missions_missions`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_missionEditor.clickMission(m)` |  | 1730 |
| `editor_missionEditor.getCurrentEditorHelperWhenActive()` |  | 1752 |
| `editor_missionEditor.getMissionList()` |  | 1729 |
| `editor_missionEditor.getMissionTypeWindow()` |  | 1733 |
| `editor_missionEditor.getSelectedMissionId()` |  | 1786 |
| `editor_missionEditor.getStartTriggerWindow()` |  | 1732 |
| `editor_missionEditor.onConsoleLog(timer, lvl, origin, line)` | *(hook)* | 1782 |
| `editor_missionEditor.onDeserialized(data)` | *(hook)* | 1711 |
| `editor_missionEditor.onEditorGui()` | display window *(hook)* | 1074 |
| `editor_missionEditor.onEditorInitialized()` | *(hook)* | 1673 |
| `editor_missionEditor.onEditorRegisterPreferences(prefsRegistry)` | *(hook)* | 1689 |
| `editor_missionEditor.onSerialize()` | *(hook)* | 1703 |
| `editor_missionEditor.reloadMissionSystem()` |  | 1758 |
| `editor_missionEditor.setMissionById(id, instant)` |  | 1734 |
| `editor_missionEditor.show()` |  | 1668 |

## Champs

| Champ | Type | Description |
|---|---|---|
| `dependencies` | table |  |

**Évènements UI (guihooks.trigger) :** `MenuOpenModule`

## Appels vers le moteur (C++)

- `FS:` `directoryRemove`, `fileExists`, `findFiles`, `removeFile`

**Charge les extensions :** `career_modules_branches_leagues`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/missionEditor.lua`.*

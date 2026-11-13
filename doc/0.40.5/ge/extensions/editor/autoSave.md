# `editor_autoSave`

*Fichier : `lua/ge/extensions/editor/autoSave.lua` · VM : Game Engine (GE) · 174 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_autoSave` : `extensions.load("editor_autoSave")`, puis la globale `editor_autoSave`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_autoSave.onEditorGui(dtReal, dtSim, dtRaw)` | *(hook)* | 110 |
| `editor_autoSave.onEditorInitialized()` | public interface *(hook)* | 133 |
| `editor_autoSave.onEditorPreferenceValueChanged(path, value)` | *(hook)* | 138 |
| `editor_autoSave.onEditorRegisterPreferences(prefsRegistry)` | *(hook)* | 153 |

## Appels vers le moteur (C++)

- `FS:` `directoryList`, `stat`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/autoSave.lua`.*

# `editor_preferences`

*Fichier : `lua/ge/extensions/editor/preferences.lua` · VM : Game Engine (GE) · 461 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_preferences` : `extensions.load("editor_preferences")`, puis la globale `editor_preferences`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_preferences.onDeserialized(state)` | *(hook)* | 435 |
| `editor_preferences.onEditorActivated()` | *(hook)* | 447 |
| `editor_preferences.onEditorDeactivated()` | *(hook)* | 439 |
| `editor_preferences.onEditorGui()` | *(hook)* | 237 |
| `editor_preferences.onEditorInitialized()` | *(hook)* | 408 |
| `editor_preferences.onEditorPreferenceValueChanged(path, value)` | *(hook)* | 321 |
| `editor_preferences.onEditorRegisterPreferences(prefsRegistry)` | *(hook)* | 341 |
| `editor_preferences.onExtensionLoaded()` | *(hook)* | 309 |
| `editor_preferences.onSerialize(state)` | *(hook)* | 431 |

## Classe `editor`

Objet `editor` construit dans le module (par ex. par `new`), avec ces méthodes :

| Méthode | Description | Ligne |
|---|---|---|
| `editor.showPreferences(categoryName)` |  | 304 |
| `editor.updatePreferencePages()` |  | 386 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/preferences.lua`.*

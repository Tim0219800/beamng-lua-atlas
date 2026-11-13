# `ui_multiseat_generalSettings`

*Fichier : `lua/ge/extensions/ui/multiseat/generalSettings.lua` · VM : Game Engine (GE) · 226 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `ui_multiseat_generalSettings` : `extensions.load("ui_multiseat_generalSettings")`, puis la globale `ui_multiseat_generalSettings`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `ui_multiseat_generalSettings.onApplyMultiseatGameSettings(stagedSettings, _activeSettings, result)` | *(hook)* | 201 |
| `ui_multiseat_generalSettings.onGetMultiseatGameSettings(providers)` | *(hook)* | 107 |
| `ui_multiseat_generalSettings.onMultiseatGameSettingAction(providerId, fieldId, result, value)` | *(hook)* | 142 |
| `ui_multiseat_generalSettings.onMultiseatGameSettingChanged(providerId, fieldId, value)` | *(hook)* | 153 |
| `ui_multiseat_generalSettings.onValidateMultiseatGameSettings(stagedSettings, _activeSettings, result)` | *(hook)* | 166 |

## Appels vers le moteur (C++)

- `scenetree.` `findObject`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/ui/multiseat/generalSettings.lua`.*

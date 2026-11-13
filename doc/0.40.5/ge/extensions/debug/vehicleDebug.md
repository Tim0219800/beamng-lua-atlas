# `debug_vehicleDebug`

*Fichier : `lua/ge/extensions/debug/vehicleDebug.lua` · VM : Game Engine (GE) · 82 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `debug_vehicleDebug` : `extensions.load("debug_vehicleDebug")`, puis la globale `debug_vehicleDebug`

**Dépendances (chargées avant) :** `ui_imgui`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `debug_vehicleDebug.bdebugRequestViewportSize(vehId)` |  | 30 |
| `debug_vehicleDebug.getDebugEnabled()` |  | 21 |
| `debug_vehicleDebug.onDeserialized(serializedData)` | *(hook)* | 61 |
| `debug_vehicleDebug.onSerialize()` | *(hook)* | 67 |
| `debug_vehicleDebug.onUpdate(dt)` | *(hook)* | 38 |
| `debug_vehicleDebug.setDebugEnabled(value)` |  | 25 |
| `debug_vehicleDebug.toggleDebugEnabled()` |  | 16 |

## Champs

| Champ | Type | Description |
|---|---|---|
| `dependencies` | table |  |

**Évènements UI (guihooks.trigger) :** `vehicleDebugInfoEnabledChanged`

## Appels vers le moteur (C++)

- `debugDrawer:` `drawTextAdvanced`
- `ui_imgui.` `GetMainViewport`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/debug/vehicleDebug.lua`.*

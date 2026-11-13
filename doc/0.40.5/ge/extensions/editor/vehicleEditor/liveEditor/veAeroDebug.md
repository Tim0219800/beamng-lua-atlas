# `editor_vehicleEditor_liveEditor_veAeroDebug`

*Fichier : `lua/ge/extensions/editor/vehicleEditor/liveEditor/veAeroDebug.lua` · VM : Game Engine (GE) · 191 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_vehicleEditor_liveEditor_veAeroDebug` : `extensions.load("editor_vehicleEditor_liveEditor_veAeroDebug")`, puis la globale `editor_vehicleEditor_liveEditor_veAeroDebug`

**Dépendances (chargées avant) :** `editor_veMain`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_vehicleEditor_liveEditor_veAeroDebug.onDeserialized(data)` | *(hook)* | 175 |
| `editor_vehicleEditor_liveEditor_veAeroDebug.onEditorActivated()` | *(hook)* | 166 |
| `editor_vehicleEditor_liveEditor_veAeroDebug.onEditorDeactivated()` | *(hook)* | 160 |
| `editor_vehicleEditor_liveEditor_veAeroDebug.onSerialize()` | *(hook)* | 169 |
| `editor_vehicleEditor_liveEditor_veAeroDebug.onUpdate(dt)` | public interface *(hook)* | 61 |
| `editor_vehicleEditor_liveEditor_veAeroDebug.onVehicleSwitched(oldVehicle, newVehicle, player)` | Disable aeroDebug on old vehicle *(hook)* | 150 |
| `editor_vehicleEditor_liveEditor_veAeroDebug.open()` | helper function to open the window | 145 |

## Champs

| Champ | Type | Description |
|---|---|---|
| `dependencies` | table |  |
| `menuEntry` | string |  |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/vehicleEditor/liveEditor/veAeroDebug.lua`.*

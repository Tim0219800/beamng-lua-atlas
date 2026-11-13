# `ui_multiseat_multiseatConfiguration`

*Fichier : `lua/ge/extensions/ui/multiseat/multiseatConfiguration.lua` · VM : Game Engine (GE) · 913 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `ui_multiseat_multiseatConfiguration` : `extensions.load("ui_multiseat_multiseatConfiguration")`, puis la globale `ui_multiseat_multiseatConfiguration`

**Dépendances (chargées avant) :** `core_playerPersonas`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `ui_multiseat_multiseatConfiguration.begin(options)` |  | 328 |
| `ui_multiseat_multiseatConfiguration.clearCachedAssignments()` |  | 823 |
| `ui_multiseat_multiseatConfiguration.commit()` |  | 895 |
| `ui_multiseat_multiseatConfiguration.commitCore()` |  | 860 |
| `ui_multiseat_multiseatConfiguration.completeCommit()` |  | 873 |
| `ui_multiseat_multiseatConfiguration.cycleDevicePlayer(deviceId)` |  | 506 |
| `ui_multiseat_multiseatConfiguration.discard()` |  | 367 |
| `ui_multiseat_multiseatConfiguration.getCommitConfiguration()` |  | 658 |
| `ui_multiseat_multiseatConfiguration.getPersona(personaNumber)` |  | 575 |
| `ui_multiseat_multiseatConfiguration.getPlayers()` |  | 651 |
| `ui_multiseat_multiseatConfiguration.getPreview()` |  | 581 |
| `ui_multiseat_multiseatConfiguration.hasChanges()` |  | 834 |
| `ui_multiseat_multiseatConfiguration.hasUserChanges()` |  | 814 |
| `ui_multiseat_multiseatConfiguration.isActive()` |  | 363 |
| `ui_multiseat_multiseatConfiguration.joinDeviceGroup(groupId)` |  | 531 |
| `ui_multiseat_multiseatConfiguration.leavePlayer(player)` |  | 547 |
| `ui_multiseat_multiseatConfiguration.moveDevicePlayer(deviceId, direction)` |  | 456 |
| `ui_multiseat_multiseatConfiguration.onClientEndMission()` | *(hook)* | 902 |
| `ui_multiseat_multiseatConfiguration.onInputBindingsChanged()` | *(hook)* | 908 |
| `ui_multiseat_multiseatConfiguration.removeDevice(deviceId)` |  | 437 |
| `ui_multiseat_multiseatConfiguration.rollbackCommit()` |  | 886 |
| `ui_multiseat_multiseatConfiguration.setDevicePlayer(deviceId, personaNumber)` | personaNumber 1..MAX_PLAYERS assigns the device to that player, nil or 0 unassigns it | 418 |
| `ui_multiseat_multiseatConfiguration.setPersonaData(personaNumber, data, emitChange)` |  | 566 |
| `ui_multiseat_multiseatConfiguration.toggleDevicePlayer(deviceId)` |  | 397 |

## Champs

| Champ | Type | Description |
|---|---|---|
| `AUTOMATIC_COLOR_DEFAULT` | boolean |  |
| `dependencies` | table |  |

**Évènements UI (guihooks.trigger) :** `MultiseatConfigurationChanged`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/ui/multiseat/multiseatConfiguration.lua`.*

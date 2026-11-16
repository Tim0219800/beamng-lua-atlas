# `core_vehicleTriggersDebug`

*Fichier : `lua/ge/extensions/core/vehicleTriggersDebug.lua` · VM : Game Engine (GE) · 496 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `core_vehicleTriggersDebug` : `extensions.load("core_vehicleTriggersDebug")`, puis la globale `core_vehicleTriggersDebug`

Fenêtre imgui « Vehicle event debug » pour inspecter les triggers de véhicule : affiche l'état de core_vehicleTriggers (caméra, trigger tenu, position survolée, libellés), liste les véhicules avec leurs triggers, leurs liens d'action et les événements JBeam, et permet de les déclencher à la souris. Chargée par core_vehicleTriggers.enableDebugUI() et déchargée par disableDebugUI(). Un moddeur de véhicule s'en sert pour vérifier ses sections triggers et triggerEventLinks.

## Exemple

```lua
core_vehicleTriggers.enableDebugUI()  -- ouvre la fenêtre
core_vehicleTriggers.disableDebugUI() -- la ferme
```

## Remarques

- Ne s'utilise pas directement : elle dépend de core_vehicleTriggers et core_vehicle_vehicleTriggerHighlight et lit core_vehicleTriggers.state.
- Les boutons « trigger » exécutent les chaînes Lua onDown/onUp des événements dans le véhicule (queueLuaCommand) ; les liens passent par une copie locale de executeLink qui force le joueur 0 (différence avec la fonction locale executeLink de vehicleTriggers.lua, qui transmet le joueur).
- La copie locale de executeLink ne déclenche pas le hook onVehicleTriggersExecuteLink.

**Dépendances (chargées avant) :** `core_vehicleTriggers`, `core_vehicle_vehicleTriggerHighlight`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `core_vehicleTriggersDebug.onDeserialized(data)` | Hook appelé après un rechargement des extensions : restaure les triggers surlignés via core_vehicle_vehicleTriggerHighlight.setSerializedHighlightedTriggerData. *(interne)* *(hook)* | 485 |
| `core_vehicleTriggersDebug.onSerialize()` | Hook appelé avant un rechargement des extensions : sauvegarde les triggers surlignés. *(interne)* *(hook)* | 475 |
| `core_vehicleTriggersDebug.onUpdate(dtReal, dtSim, dtRaw)` | Hook appelé à chaque image : dessine la fenêtre imgui de debug. *(interne)* *(hook)* | 471 |

### Détail des paramètres

#### `core_vehicleTriggersDebug.onDeserialized(data)`

Hook appelé après un rechargement des extensions : restaure les triggers surlignés via core_vehicle_vehicleTriggerHighlight.setSerializedHighlightedTriggerData.

- `data` (*table|nil*) : Données de onSerialize ({highLightedTriggerData}).

#### `core_vehicleTriggersDebug.onSerialize()`

Hook appelé avant un rechargement des extensions : sauvegarde les triggers surlignés.

- **renvoie** : table {highLightedTriggerData = données de surbrillance ou nil}

#### `core_vehicleTriggersDebug.onUpdate(dtReal, dtSim, dtRaw)`

Hook appelé à chaque image : dessine la fenêtre imgui de debug.

- `dtReal` (*number*) : Temps réel écoulé (s).
- `dtSim` (*number*) : Temps de simulation écoulé (s).
- `dtRaw` (*number*) : Temps brut écoulé (s).

## Champs

| Champ | Type | Description |
|---|---|---|
| `dependencies` | string[] | core_vehicleTriggers et core_vehicle_vehicleTriggerHighlight. |

## Appels vers le moteur (C++)

- `be:` `getObject`, `getObjectCount`, `getPlayerVehicleID`
- `scenetree.` `findObject`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/core/vehicleTriggersDebug.lua`.*

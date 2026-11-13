# `gameplay_freeformDelivery_odometer`

*Fichier : `lua/ge/extensions/gameplay/freeformDelivery/odometer.lua` · VM : Game Engine (GE) · 251 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `gameplay_freeformDelivery_odometer` : `extensions.load("gameplay_freeformDelivery_odometer")`, puis la globale `gameplay_freeformDelivery_odometer`

**Dépendances (chargées avant) :** `core_vehicleBridge`, `gameplay_freeformDelivery_utils`, `gameplay_freeformDelivery_setup`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `gameplay_freeformDelivery_odometer.cleanup()` |  | 242 |
| `gameplay_freeformDelivery_odometer.getOdometerData(vehId)` | Get odometer data for a vehicle | 181 |
| `gameplay_freeformDelivery_odometer.getOdometerDataByDeliveryId(deliveryVehicleId)` | Get odometer data by delivery vehicle ID | 186 |
| `gameplay_freeformDelivery_odometer.isSetupComplete()` | Check if odometer requests are complete | 130 |
| `gameplay_freeformDelivery_odometer.setup(delivery)` | Setup odometer tracking for vehicles with the flag | 92 |
| `gameplay_freeformDelivery_odometer.update(dtReal)` | Update odometer values (called 8 times per second) | 135 |
| `gameplay_freeformDelivery_odometer.updateTasklistMessage()` |  | 197 |

## Champs

| Champ | Type | Description |
|---|---|---|
| `dependencies` | table |  |

**Évènements UI (guihooks.trigger) :** `DiscardTasklistItem`, `SetTasklistTask`

## Appels vers le moteur (C++)

- `be:` `getPlayerVehicleID`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/gameplay/freeformDelivery/odometer.lua`.*

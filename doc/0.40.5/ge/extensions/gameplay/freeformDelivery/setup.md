# `gameplay_freeformDelivery_setup`

*Fichier : `lua/ge/extensions/gameplay/freeformDelivery/setup.lua` · VM : Game Engine (GE) · 689 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `gameplay_freeformDelivery_setup` : `extensions.load("gameplay_freeformDelivery_setup")`, puis la globale `gameplay_freeformDelivery_setup`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `gameplay_freeformDelivery_setup.cleanup(delivery, keepVehicles)` |  | 568 |
| `gameplay_freeformDelivery_setup.freezeAllVehicles(freeze)` |  | 557 |
| `gameplay_freeformDelivery_setup.getAllCouplingSetup()` |  | 549 |
| `gameplay_freeformDelivery_setup.getPendingCouplings()` |  | 541 |
| `gameplay_freeformDelivery_setup.getSpawnedVehicles()` |  | 553 |
| `gameplay_freeformDelivery_setup.getVehicleId(deliveryVehicleId)` |  | 529 |
| `gameplay_freeformDelivery_setup.isSetupComplete()` |  | 466 |
| `gameplay_freeformDelivery_setup.isSetupInProgress()` |  | 533 |
| `gameplay_freeformDelivery_setup.restoreVehicleTransforms()` |  | 490 |
| `gameplay_freeformDelivery_setup.setup(delivery)` |  | 394 |
| `gameplay_freeformDelivery_setup.setupPlayer(delivery)` |  | 537 |

## Appels vers le moteur (C++)

- `FS:` `fileExists`
- `Sim.` `upcast`
- `be:` `exitVehicle`, `reloadCollision`
- `scenetree.` `findObjectById`

**Charge les extensions :** `util_stepHandler`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/gameplay/freeformDelivery/setup.lua`.*

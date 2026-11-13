# `gameplay_tutorial_setup`

*Fichier : `lua/ge/extensions/gameplay/tutorial/setup.lua` · VM : Game Engine (GE) · 409 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `gameplay_tutorial_setup` : `extensions.load("gameplay_tutorial_setup")`, puis la globale `gameplay_tutorial_setup`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `gameplay_tutorial_setup.activateOutOfBoundsSystem()` |  | 39 |
| `gameplay_tutorial_setup.cleanup()` |  | 115 |
| `gameplay_tutorial_setup.isOutOfBoundsResetAllowed()` |  | 31 |
| `gameplay_tutorial_setup.loadTutorialSites()` |  | 144 |
| `gameplay_tutorial_setup.onLoadingScreenFadeout()` | *(hook)* | 195 |
| `gameplay_tutorial_setup.onScreenFadeState(state)` | *(hook)* | 339 |
| `gameplay_tutorial_setup.placePlayerAtDragStart()` |  | 353 |
| `gameplay_tutorial_setup.placePlayerBackInTutorialVehicle()` |  | 376 |
| `gameplay_tutorial_setup.placePlayerBackToParkingStart()` |  | 288 |
| `gameplay_tutorial_setup.runCurrentStepOutOfBoundsReset()` |  | 322 |
| `gameplay_tutorial_setup.runOutOfBoundsResetWithFade(resetCallback)` |  | 315 |
| `gameplay_tutorial_setup.setActivePrefabs(prefabStates)` |  | 69 |
| `gameplay_tutorial_setup.setOutOfBoundsResetAllowed(allowed)` |  | 27 |
| `gameplay_tutorial_setup.setOutOfBoundsResetHandler(resetCallback)` |  | 35 |
| `gameplay_tutorial_setup.setupBlockedActions()` |  | 390 |
| `gameplay_tutorial_setup.setupPlayer()` |  | 199 |
| `gameplay_tutorial_setup.setupVehicles()` |  | 189 |
| `gameplay_tutorial_setup.showOutOfBoundsWarning()` |  | 331 |
| `gameplay_tutorial_setup.spawnPrefab(prefabPath, pos, rot, name)` |  | 43 |
| `gameplay_tutorial_setup.spawnTutorialVehicle(thenFunction)` |  | 223 |
| `gameplay_tutorial_setup.unblockGearActions()` |  | 281 |

## Champs

| Champ | Type | Description |
|---|---|---|
| `blockedActions` | table |  |
| `blockedActionsTemplates` | table |  |
| `loadingScreenFadeoutComplete` | boolean |  |
| `outOfBoundsSystemActive` | boolean |  |
| `tutorialSites` | nil |  |
| `tutorialVehicleId` | nil | Expose only vehicle IDs; steps use getObjectByID(setup.tutorialVehicleId) when they need the object |
| `vehicleSetupComplete` | boolean |  |

**Évènements UI (guihooks.trigger) :** `DiscardTasklistItem`, `SetTasklistTask`

## Appels vers le moteur (C++)

- `be:` `reloadCollision`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/gameplay/tutorial/setup.lua`.*

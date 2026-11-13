# `util_screenshotCreator_lightingSetup`

*Fichier : `lua/ge/extensions/util/screenshotCreator/lightingSetup.lua` · VM : Game Engine (GE) · 939 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `util_screenshotCreator_lightingSetup` : `extensions.load("util_screenshotCreator_lightingSetup")`, puis la globale `util_screenshotCreator_lightingSetup`

**Dépendances (chargées avant) :** `util_screenshotCreator_settings`, `util_screenshotCreator_vehicleSetup`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `util_screenshotCreator_lightingSetup.adjust(vehicle, camera)` |  | 876 |
| `util_screenshotCreator_lightingSetup.clearMarkupTags()` |  | 719 |
| `util_screenshotCreator_lightingSetup.getMarkupCount()` |  | 714 |
| `util_screenshotCreator_lightingSetup.hideReflectionCardsForTechCapture()` |  | 295 |
| `util_screenshotCreator_lightingSetup.restore()` |  | 334 |
| `util_screenshotCreator_lightingSetup.restoreReflectionCardsAfterTechCapture()` |  | 260 |
| `util_screenshotCreator_lightingSetup.selfCheck()` |  | 548 |

## Champs

| Champ | Type | Description |
|---|---|---|
| `dependencies` | table |  |
| `onClientEndMission` | any |  |
| `onExit` | any |  |
| `onExtensionUnloaded` | any |  |

## Appels vers le moteur (C++)

- `scenetree.` `findClassObjects`, `findObject`, `findObjectById`, `getAllObjects`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/util/screenshotCreator/lightingSetup.lua`.*

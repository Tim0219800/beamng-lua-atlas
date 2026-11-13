# `telemetry_configManager.test`

*Fichier : `lua/ge/extensions/telemetry/configManager.test.lua` · VM : Game Engine (GE) · 17 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `telemetry_configManager.test` : `extensions.load("telemetry_configManager.test")`, puis la globale `telemetry_configManager.test`

Test unitaire de telemetry/configManager (extensions.testFramework_TestManager:runTestFiles("configManager")).

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `telemetry_configManager.test.testMissingTrackerConfigIsDisabledAndAllocationFree(ctx)` | Vérifie qu'un tracker inconnu est désactivé par défaut et que getModuleConfig renvoie la même table à chaque appel (pas d'allocation). *(interne)* | 7 |

### Détail des paramètres

#### `telemetry_configManager.test.testMissingTrackerConfigIsDisabledAndAllocationFree(ctx)`

Vérifie qu'un tracker inconnu est désactivé par défaut et que getModuleConfig renvoie la même table à chaque appel (pas d'allocation).

- `ctx` (*table*) : Contexte du framework de test.

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/telemetry/configManager.test.lua`.*

# `telemetry_hardwareChanges.test`

*Fichier : `lua/ge/extensions/telemetry/hardwareChanges.test.lua` · VM : Game Engine (GE) · 73 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `telemetry_hardwareChanges.test` : `extensions.load("telemetry_hardwareChanges.test")`, puis la globale `telemetry_hardwareChanges.test`

Tests unitaires de telemetry/hardwareChanges (runTestFiles("hardwareChanges")).

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `telemetry_hardwareChanges.test.testConnectionChangesContainAddedAndRemovedDevices(ctx)` | Vérifie qu'un périphérique ajouté et un retiré donnent deux événements, connexion d'abord. *(interne)* | 30 |
| `telemetry_hardwareChanges.test.testControllerSnapshotFiltersNonControllerDevices(ctx)` | Vérifie que l'instantané ne garde que wheel, joystick, gamepad et xinput (4 entrées sur 8 périphériques). *(interne)* | 11 |
| `telemetry_hardwareChanges.test.testOnlyDirectWindowFullscreenTransitionsAreTracked(ctx)` | Vérifie que seules les transitions Window/Fullscreen directes sont suivies. *(interne)* | 64 |
| `telemetry_hardwareChanges.test.testReplacedDeviceSlotReportsBothTransitions(ctx)` | Vérifie qu'un volant remplacé dans le même emplacement signale la connexion du nouveau et la déconnexion de l'ancien. *(interne)* | 47 |

### Détail des paramètres

#### `telemetry_hardwareChanges.test.testConnectionChangesContainAddedAndRemovedDevices(ctx)`

Vérifie qu'un périphérique ajouté et un retiré donnent deux événements, connexion d'abord.

- `ctx` (*table*) : Contexte du framework de test.

#### `telemetry_hardwareChanges.test.testControllerSnapshotFiltersNonControllerDevices(ctx)`

Vérifie que l'instantané ne garde que wheel, joystick, gamepad et xinput (4 entrées sur 8 périphériques).

- `ctx` (*table*) : Contexte du framework de test.

#### `telemetry_hardwareChanges.test.testOnlyDirectWindowFullscreenTransitionsAreTracked(ctx)`

Vérifie que seules les transitions Window/Fullscreen directes sont suivies.

- `ctx` (*table*) : Contexte du framework de test.

#### `telemetry_hardwareChanges.test.testReplacedDeviceSlotReportsBothTransitions(ctx)`

Vérifie qu'un volant remplacé dans le même emplacement signale la connexion du nouveau et la déconnexion de l'ancien.

- `ctx` (*table*) : Contexte du framework de test.

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/telemetry/hardwareChanges.test.lua`.*

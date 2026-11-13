# `telemetry_hardwareInput.test`

*Fichier : `lua/ge/extensions/telemetry/hardwareInput.test.lua` · VM : Game Engine (GE) · 128 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `telemetry_hardwareInput.test` : `extensions.load("telemetry_hardwareInput.test")`, puis la globale `telemetry_hardwareInput.test`

Tests unitaires de telemetry/hardwareInput (runTestFiles("hardwareInput")).

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `telemetry_hardwareInput.test.testEnglishNameComesOnlyFromOfficialInputMap(ctx)` | Vérifie que le nom anglais est lu dans /settings/inputmaps/<vidpid>.json quand le fichier est officiel. *(interne)* | 69 |
| `telemetry_hardwareInput.test.testMapsEveryAvailableWheelField(ctx)` | Vérifie que tous les champs d'un volant (noms, vidpid, productId/vendorId, GUID, FFB, révisions, controls, controlCounts) sont repris. *(interne)* | 34 |
| `telemetry_hardwareInput.test.testNonWheelsKeepOnlyCommonIdentity(ctx)` | Vérifie qu'un périphérique qui n'est pas un volant ne garde que type, productName, vidpid et forceFeedback. *(interne)* | 100 |
| `telemetry_hardwareInput.test.testSymbolicDeviceIdentityKeepsItsCase(ctx)` | Vérifie qu'un identifiant symbolique (ex. 'XIDevice') n'est pas mis en majuscules. *(interne)* | 117 |
| `telemetry_hardwareInput.test.testUnknownDefaultUpdateRateStaysAbsent(ctx)` | Vérifie que sans période d'échantillonnage FFB valide, ni la période ni maxRawFfbUpdateRateHz ne sont renseignées. *(interne)* | 61 |
| `telemetry_hardwareInput.test.testUnofficialInputMapCannotSupplyTelemetryName(ctx)` | Vérifie qu'une table d'entrée non officielle ne peut pas fournir de nom. *(interne)* | 87 |

### Détail des paramètres

#### `telemetry_hardwareInput.test.testEnglishNameComesOnlyFromOfficialInputMap(ctx)`

Vérifie que le nom anglais est lu dans /settings/inputmaps/<vidpid>.json quand le fichier est officiel.

- `ctx` (*table*) : Contexte du framework de test.

#### `telemetry_hardwareInput.test.testMapsEveryAvailableWheelField(ctx)`

Vérifie que tous les champs d'un volant (noms, vidpid, productId/vendorId, GUID, FFB, révisions, controls, controlCounts) sont repris.

- `ctx` (*table*) : Contexte du framework de test.

#### `telemetry_hardwareInput.test.testNonWheelsKeepOnlyCommonIdentity(ctx)`

Vérifie qu'un périphérique qui n'est pas un volant ne garde que type, productName, vidpid et forceFeedback.

- `ctx` (*table*) : Contexte du framework de test.

#### `telemetry_hardwareInput.test.testSymbolicDeviceIdentityKeepsItsCase(ctx)`

Vérifie qu'un identifiant symbolique (ex. 'XIDevice') n'est pas mis en majuscules.

- `ctx` (*table*) : Contexte du framework de test.

#### `telemetry_hardwareInput.test.testUnknownDefaultUpdateRateStaysAbsent(ctx)`

Vérifie que sans période d'échantillonnage FFB valide, ni la période ni maxRawFfbUpdateRateHz ne sont renseignées.

- `ctx` (*table*) : Contexte du framework de test.

#### `telemetry_hardwareInput.test.testUnofficialInputMapCannotSupplyTelemetryName(ctx)`

Vérifie qu'une table d'entrée non officielle ne peut pas fournir de nom.

- `ctx` (*table*) : Contexte du framework de test.

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/telemetry/hardwareInput.test.lua`.*

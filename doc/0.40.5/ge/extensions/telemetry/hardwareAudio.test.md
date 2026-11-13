# `telemetry_hardwareAudio.test`

*Fichier : `lua/ge/extensions/telemetry/hardwareAudio.test.lua` · VM : Game Engine (GE) · 55 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `telemetry_hardwareAudio.test` : `extensions.load("telemetry_hardwareAudio.test")`, puis la globale `telemetry_hardwareAudio.test`

Tests unitaires de telemetry/hardwareAudio (runTestFiles("hardwareAudio")).

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `telemetry_hardwareAudio.test.testClassifiesKnownOutputTypes(ctx)` | Vérifie la classification casque, écran/TV, haut-parleurs et périphérique virtuel à partir de noms types. *(interne)* | 25 |
| `telemetry_hardwareAudio.test.testMissingDeviceIsNotReported(ctx)` | Vérifie que fromDeviceInfo(nil) renvoie nil. *(interne)* | 50 |
| `telemetry_hardwareAudio.test.testRawDeviceNameIsRemoved(ctx)` | Vérifie que le nom brut et les champs de diagnostic n'entrent pas dans la télémétrie, alors que sampleRateHz, speakerMode et channels sont conservés. *(interne)* | 36 |
| `telemetry_hardwareAudio.test.testUnknownNamesStayUnknown(ctx)` | Vérifie qu'un nom sans mot-clé (ex. 'WH-1000XM5') donne la catégorie 'unknown'. *(interne)* | 32 |

### Détail des paramètres

#### `telemetry_hardwareAudio.test.testClassifiesKnownOutputTypes(ctx)`

Vérifie la classification casque, écran/TV, haut-parleurs et périphérique virtuel à partir de noms types.

- `ctx` (*table*) : Contexte du framework de test.

#### `telemetry_hardwareAudio.test.testMissingDeviceIsNotReported(ctx)`

Vérifie que fromDeviceInfo(nil) renvoie nil.

- `ctx` (*table*) : Contexte du framework de test.

#### `telemetry_hardwareAudio.test.testRawDeviceNameIsRemoved(ctx)`

Vérifie que le nom brut et les champs de diagnostic n'entrent pas dans la télémétrie, alors que sampleRateHz, speakerMode et channels sont conservés.

- `ctx` (*table*) : Contexte du framework de test.

#### `telemetry_hardwareAudio.test.testUnknownNamesStayUnknown(ctx)`

Vérifie qu'un nom sans mot-clé (ex. 'WH-1000XM5') donne la catégorie 'unknown'.

- `ctx` (*table*) : Contexte du framework de test.

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/telemetry/hardwareAudio.test.lua`.*

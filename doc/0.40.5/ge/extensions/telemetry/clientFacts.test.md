# `telemetry_clientFacts.test`

*Fichier : `lua/ge/extensions/telemetry/clientFacts.test.lua` · VM : Game Engine (GE) · 160 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `telemetry_clientFacts.test` : `extensions.load("telemetry_clientFacts.test")`, puis la globale `telemetry_clientFacts.test`

Tests unitaires de telemetry/clientFacts, exécutés avec extensions.testFramework_TestManager:runTestFiles("clientFacts"). Chaque fonction testXxx(ctx) reçoit un contexte de test (ctx:assert, ctx:assertEqual). Aucun intérêt direct pour un moddeur, sinon comme exemple d'usage de clientFacts.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `telemetry_clientFacts.test.testCiProviderDetection(ctx)` | Vérifie que chaque variable d'environnement CI connue (JENKINS_URL, GITLAB_CI, GITHUB_ACTIONS, TF_BUILD, TEAMCITY_VERSION, BUILDKITE, CIRCLECI, TRAVIS, APPVEYOR, CI) donne le bon fournisseur. *(interne)* | 17 |
| `telemetry_clientFacts.test.testCiProviderPriority(ctx)` | Vérifie que jenkins l'emporte quand plusieurs variables CI sont définies. *(interne)* | 39 |
| `telemetry_clientFacts.test.testCollectedContextContract(ctx)` | Simule Engine, os.getenv et les globales beamng_*, appelle clientFacts.collect('30') puis vérifie les champs obtenus (plateforme 'pc', fournisseur gitlab, osVersion, deviceType 'desktop', mémoire, GPU, booléens false conservés, VR). Restaure ensuite les globales. *(interne)* | 64 |
| `telemetry_clientFacts.test.testDesktopPlatformNormalization(ctx)` | Vérifie normalizePlatform : '' donne 'pc', 'steamdeck' est conservé, nil reste nil. *(interne)* | 137 |
| `telemetry_clientFacts.test.testFalseCiFlags(ctx)` | Vérifie que les valeurs '0', 'false', 'FALSE' et '' ne déclenchent pas la détection CI. *(interne)* | 51 |
| `telemetry_clientFacts.test.testPreferredGpuSelection(ctx)` | Vérifie selectPreferredGPU : premier adaptateur dédié préféré, repli sur le premier, nil pour une liste vide. *(interne)* | 143 |

### Détail des paramètres

#### `telemetry_clientFacts.test.testCiProviderDetection(ctx)`

Vérifie que chaque variable d'environnement CI connue (JENKINS_URL, GITLAB_CI, GITHUB_ACTIONS, TF_BUILD, TEAMCITY_VERSION, BUILDKITE, CIRCLECI, TRAVIS, APPVEYOR, CI) donne le bon fournisseur.

- `ctx` (*table*) : Contexte du framework de test.

#### `telemetry_clientFacts.test.testCiProviderPriority(ctx)`

Vérifie que jenkins l'emporte quand plusieurs variables CI sont définies.

- `ctx` (*table*) : Contexte du framework de test.

#### `telemetry_clientFacts.test.testCollectedContextContract(ctx)`

Simule Engine, os.getenv et les globales beamng_*, appelle clientFacts.collect('30') puis vérifie les champs obtenus (plateforme 'pc', fournisseur gitlab, osVersion, deviceType 'desktop', mémoire, GPU, booléens false conservés, VR). Restaure ensuite les globales.

- `ctx` (*table*) : Contexte du framework de test.

#### `telemetry_clientFacts.test.testDesktopPlatformNormalization(ctx)`

Vérifie normalizePlatform : '' donne 'pc', 'steamdeck' est conservé, nil reste nil.

- `ctx` (*table*) : Contexte du framework de test.

#### `telemetry_clientFacts.test.testFalseCiFlags(ctx)`

Vérifie que les valeurs '0', 'false', 'FALSE' et '' ne déclenchent pas la détection CI.

- `ctx` (*table*) : Contexte du framework de test.

#### `telemetry_clientFacts.test.testPreferredGpuSelection(ctx)`

Vérifie selectPreferredGPU : premier adaptateur dédié préféré, repli sur le premier, nil pour une liste vide.

- `ctx` (*table*) : Contexte du framework de test.

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/telemetry/clientFacts.test.lua`.*

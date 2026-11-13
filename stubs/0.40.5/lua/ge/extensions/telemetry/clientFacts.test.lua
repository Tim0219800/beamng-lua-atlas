---@meta
-- tim19Atlas stub generated from lua/ge/extensions/telemetry/clientFacts.test.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Tests unitaires de telemetry/clientFacts, exécutés avec extensions.testFramework_TestManager:runTestFiles("clientFacts"). Chaque fonction testXxx(ctx) reçoit un contexte de test (ctx:assert, ctx:assertEqual). Aucun intérêt direct pour un moddeur, sinon comme exemple d'usage de clientFacts.
--- Accès : extension `telemetry_clientFacts.test` : `extensions.load("telemetry_clientFacts.test")`, puis la globale `telemetry_clientFacts.test`
---@class telemetry_clientFacts.test
telemetry_clientFacts.test = {}

--- Vérifie que chaque variable d'environnement CI connue (JENKINS_URL, GITLAB_CI, GITHUB_ACTIONS, TF_BUILD, TEAMCITY_VERSION, BUILDKITE, CIRCLECI, TRAVIS, APPVEYOR, CI) donne le bon fournisseur.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/telemetry/clientFacts.test.lua:17
---@param ctx table Contexte du framework de test.
function telemetry_clientFacts.test.testCiProviderDetection(ctx) end

--- Vérifie que jenkins l'emporte quand plusieurs variables CI sont définies.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/telemetry/clientFacts.test.lua:39
---@param ctx table Contexte du framework de test.
function telemetry_clientFacts.test.testCiProviderPriority(ctx) end

--- Simule Engine, os.getenv et les globales beamng_*, appelle clientFacts.collect('30') puis vérifie les champs obtenus (plateforme 'pc', fournisseur gitlab, osVersion, deviceType 'desktop', mémoire, GPU, booléens false conservés, VR). Restaure ensuite les globales.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/telemetry/clientFacts.test.lua:64
---@param ctx table Contexte du framework de test.
function telemetry_clientFacts.test.testCollectedContextContract(ctx) end

--- Vérifie normalizePlatform : '' donne 'pc', 'steamdeck' est conservé, nil reste nil.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/telemetry/clientFacts.test.lua:137
---@param ctx table Contexte du framework de test.
function telemetry_clientFacts.test.testDesktopPlatformNormalization(ctx) end

--- Vérifie que les valeurs '0', 'false', 'FALSE' et '' ne déclenchent pas la détection CI.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/telemetry/clientFacts.test.lua:51
---@param ctx table Contexte du framework de test.
function telemetry_clientFacts.test.testFalseCiFlags(ctx) end

--- Vérifie selectPreferredGPU : premier adaptateur dédié préféré, repli sur le premier, nil pour une liste vide.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/telemetry/clientFacts.test.lua:143
---@param ctx table Contexte du framework de test.
function telemetry_clientFacts.test.testPreferredGpuSelection(ctx) end


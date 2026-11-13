---@meta
-- tim19Atlas stub generated from lua/ge/extensions/telemetry/clientFacts.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Module (chargé par require, pas une extension) qui rassemble les « faits client » de la télémétrie : version du jeu, plateforme, type de build, OS, CPU, GPU préféré, mémoire, batterie, VR, mode headless, fournisseur d'intégration continue, licence tech, etc. configManager l'envoie au serveur lors de la récupération de la configuration de télémétrie. Les valeurs inconnues ou invalides sont omises (nil).
--- Accès : extension `telemetry_clientFacts` : `extensions.load("telemetry_clientFacts")`, puis la globale `telemetry_clientFacts`
---@class telemetry_clientFacts
telemetry_clientFacts = {}

--- Construit la table de faits client en interrogeant Engine.Platform (OS, CPU, mémoire, alimentation, GPU), Engine.Render (type d'adaptateur), les globales beamng_* , headless_mode, OnlineServiceProvider.branch, ResearchVerifier.isTechLicenseVerified() et render_openxr.state. Tolère l'absence de ces API.
---Source : lua/ge/extensions/telemetry/clientFacts.lua:101
---@param version string Version du schéma de télémétrie (telemetryVersion de configManager).
---@return table  Champs : version, product, productVersion, platform, buildType, buildNumber, arch, isCiRunner, ciProvider, osType, osBits, osVersion*, deviceType, systemMemoryBytes, cpu*, gpu*, gfxAdapterType, headless, distributionBranch, techLicense, batteryPresent, vrAvailable.
function telemetry_clientFacts.collect(version) end

--- Détecte un exécuteur d'intégration continue via les variables d'environnement. Ordre de priorité : jenkins (JENKINS_URL, JENKINS_HOME), gitlab (GITLAB_CI), github-actions, azure-pipelines (TF_BUILD), teamcity, buildkite, circleci, travis, appveyor, puis 'generic' si CI est défini. Une valeur '', '0' ou 'false' (insensible à la casse) compte comme non définie.
---Source : lua/ge/extensions/telemetry/clientFacts.lua:47
---@param getEnvironment function|nil Fonction nom -> valeur ; os.getenv par défaut (injectable pour les tests).
---@return boolean  true si un exécuteur CI est détecté.
---@return string|nil  Nom du fournisseur.
function telemetry_clientFacts.detectCiProvider(getEnvironment) end

--- Normalise le nom de plateforme : la chaîne vide (PC) devient 'pc', 'unknown' ou une valeur non textuelle devient nil, le reste est conservé.
---Source : lua/ge/extensions/telemetry/clientFacts.lua:62
---@param platform string|nil Valeur brute de Engine.Platform.getPlatform().
---@return string|nil  Plateforme normalisée.
function telemetry_clientFacts.normalizePlatform(platform) end

--- Choisit l'adaptateur graphique : le premier de type 'dedicated', sinon le premier de la liste ; nil si la liste est absente ou vide.
---Source : lua/ge/extensions/telemetry/clientFacts.lua:67
---@param adapters table[]|nil Liste issue de Engine.Platform.getGPUAdaptersInfo().
---@return table|nil  Adaptateur choisi.
function telemetry_clientFacts.selectPreferredGPU(adapters) end


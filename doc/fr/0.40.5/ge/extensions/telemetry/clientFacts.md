# `telemetry_clientFacts`

*Fichier : `lua/ge/extensions/telemetry/clientFacts.lua` · VM : Game Engine (GE) · 163 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `telemetry_clientFacts` : `extensions.load("telemetry_clientFacts")`, puis la globale `telemetry_clientFacts`

Module (chargé par require, pas une extension) qui rassemble les « faits client » de la télémétrie : version du jeu, plateforme, type de build, OS, CPU, GPU préféré, mémoire, batterie, VR, mode headless, fournisseur d'intégration continue, licence tech, etc. configManager l'envoie au serveur lors de la récupération de la configuration de télémétrie. Les valeurs inconnues ou invalides sont omises (nil).

## Remarques

- Les valeurs textuelles 'unknown' ou vides, les nombres <= 0 (ou < 0 selon le champ) et les booléens non booléens sont remplacés par nil.
- deviceType vaut 'steamdeck', 'laptop' ou 'desktop' (selon la présence d'une batterie, sur PC), sinon 'unknown'.
- osVersion est de la forme 'majeur.mineur.build' et n'est renseigné que si les trois nombres sont valides.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `telemetry_clientFacts.collect(version)` | Construit la table de faits client en interrogeant Engine.Platform (OS, CPU, mémoire, alimentation, GPU), Engine.Render (type d'adaptateur), les globales beamng_* , headless_mode, OnlineServiceProvider.branch, ResearchVerifier.isTechLicenseVerified() et render_openxr.state. Tolère l'absence de ces API. | 101 |
| `telemetry_clientFacts.detectCiProvider(getEnvironment)` | Détecte un exécuteur d'intégration continue via les variables d'environnement. Ordre de priorité : jenkins (JENKINS_URL, JENKINS_HOME), gitlab (GITLAB_CI), github-actions, azure-pipelines (TF_BUILD), teamcity, buildkite, circleci, travis, appveyor, puis 'generic' si CI est défini. Une valeur '', '0' ou 'false' (insensible à la casse) compte comme non définie. | 47 |
| `telemetry_clientFacts.normalizePlatform(platform)` | Normalise le nom de plateforme : la chaîne vide (PC) devient 'pc', 'unknown' ou une valeur non textuelle devient nil, le reste est conservé. | 62 |
| `telemetry_clientFacts.selectPreferredGPU(adapters)` | Choisit l'adaptateur graphique : le premier de type 'dedicated', sinon le premier de la liste ; nil si la liste est absente ou vide. | 67 |

### Détail des paramètres

#### `telemetry_clientFacts.collect(version)`

Construit la table de faits client en interrogeant Engine.Platform (OS, CPU, mémoire, alimentation, GPU), Engine.Render (type d'adaptateur), les globales beamng_* , headless_mode, OnlineServiceProvider.branch, ResearchVerifier.isTechLicenseVerified() et render_openxr.state. Tolère l'absence de ces API.

- `version` (*string*) : Version du schéma de télémétrie (telemetryVersion de configManager).
- **renvoie** : table Champs : version, product, productVersion, platform, buildType, buildNumber, arch, isCiRunner, ciProvider, osType, osBits, osVersion*, deviceType, systemMemoryBytes, cpu*, gpu*, gfxAdapterType, headless, distributionBranch, techLicense, batteryPresent, vrAvailable.

#### `telemetry_clientFacts.detectCiProvider(getEnvironment)`

Détecte un exécuteur d'intégration continue via les variables d'environnement. Ordre de priorité : jenkins (JENKINS_URL, JENKINS_HOME), gitlab (GITLAB_CI), github-actions, azure-pipelines (TF_BUILD), teamcity, buildkite, circleci, travis, appveyor, puis 'generic' si CI est défini. Une valeur '', '0' ou 'false' (insensible à la casse) compte comme non définie.

- `getEnvironment` (*function|nil*) : Fonction nom -> valeur ; os.getenv par défaut (injectable pour les tests).
- **renvoie** : boolean true si un exécuteur CI est détecté.
- **renvoie** : string|nil Nom du fournisseur.

#### `telemetry_clientFacts.normalizePlatform(platform)`

Normalise le nom de plateforme : la chaîne vide (PC) devient 'pc', 'unknown' ou une valeur non textuelle devient nil, le reste est conservé.

- `platform` (*string|nil*) : Valeur brute de Engine.Platform.getPlatform().
- **renvoie** : string|nil Plateforme normalisée.

#### `telemetry_clientFacts.selectPreferredGPU(adapters)`

Choisit l'adaptateur graphique : le premier de type 'dedicated', sinon le premier de la liste ; nil si la liste est absente ou vide.

- `adapters` (*table[]|nil*) : Liste issue de Engine.Platform.getGPUAdaptersInfo().
- **renvoie** : table|nil Adaptateur choisi.

## Appels vers le moteur (C++)

- `ResearchVerifier.` `isTechLicenseVerified`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/telemetry/clientFacts.lua`.*

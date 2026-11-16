# `telemetry_configManager`

*Fichier : `lua/ge/extensions/telemetry/configManager.lua` · VM : Game Engine (GE) · 257 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `telemetry_configManager` : `extensions.load("telemetry_configManager")`, puis la globale `telemetry_configManager`

Extension GE (dépend de telemetry_userIdentity) qui gère la configuration de la télémétrie : lecture du cache /telemetry/config.json, validation, récupération périodique auprès du serveur (s11/v1/telemetryConfig, avec les faits de clientFacts et l'identifiant anonyme), puis application via un callback. Elle indique quels modules/trackers sont activés (moduleConfigs). Le démarrage avec l'argument -telemetryLocal active tous les trackers avec leurs valeurs par défaut sans jamais contacter le serveur ni rien envoyer.

## Remarques

- Sans configuration valide, tout est désactivé : getModuleConfig renvoie toujours la même table {enabled = false} (pas d'allocation).
- Validation : enabled booléen ; runIds liste de <= 32 chaînes de 4 à 64 caractères de forme ^R[A-Z0-9]+$ ; ttlHours et reportIntervalHours numériques entre 1/60 et 168 h.
- Le cache est réutilisé tant que son âge est inférieur à ttlHours (24 h par défaut) ; nouvelle tentative de récupération au plus toutes les 300 s ; test d'expiration toutes les 60 s quand le polling est actif et que la session en ligne est authentifiée.
- En cas d'échec réseau, la dernière configuration serveur connue est conservée.
- La version du schéma de télémétrie est la chaîne '30'.
- L'extension est en mode de déchargement 'manual'.

**Dépendances (chargées avant) :** `telemetry_userIdentity`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `telemetry_configManager.checkConfigExpiry()` | Si le délai de reprise est écoulé et que le TTL de la config est dépassé, relance fetchConfigFromAPI et applique la nouvelle config. Au plus une tentative toutes les 300 s. | 145 |
| `telemetry_configManager.fetchConfigFromAPI(callback)` | Appelle core_online.apiCall('s11/v1/telemetryConfig') en envoyant les faits client et l'identifiant anonyme. Si la réponse est valide, la sauvegarde dans /telemetry/config.json et appelle callback ; sinon, appelle callback avec une config par défaut désactivée (sauf si une config existe déjà). | 105 |
| `telemetry_configManager.getConfig()` | Renvoie la configuration actuellement appliquée. | 158 |
| `telemetry_configManager.getModuleConfig(moduleName)` | Renvoie la configuration d'un module de télémétrie : {enabled = true} en mode local, la table moduleConfigs[moduleName] si elle existe, sinon la table partagée {enabled = false}. | 162 |
| `telemetry_configManager.getSurveyIntervalHours(moduleName, defaultHours)` | Intervalle d'échantillonnage d'un module en heures : surveyIntervalHours, ou surveyIntervalDays * 24 pour les anciens caches, sinon la valeur par défaut. Les anciens caches en jours restent lus jusqu'à ce que toutes les installations aient récupéré le format en heures. | 176 |
| `telemetry_configManager.getTelemetryVersion()` | Renvoie la version du schéma de télémétrie. | 187 |
| `telemetry_configManager.initializeConfig(callback)` | Charge la configuration : en mode local, applique une config par défaut activée ; sinon active le polling, applique le cache s'il est valide et récent, sinon une config par défaut désactivée (la récupération réelle a lieu après authentification en ligne). *(interne)* | 191 |
| `telemetry_configManager.isLocalOnly()` | Indique si le jeu a été lancé avec -telemetryLocal : tous les trackers sont actifs avec leurs valeurs par défaut, le serveur n'est jamais interrogé et rien n'est envoyé. | 31 |
| `telemetry_configManager.isModuleEnabled(moduleName)` | Indique si un module est activé (getModuleConfig(...).enabled == true). | 170 |
| `telemetry_configManager.onExtensionLoaded()` | Hook de chargement : passe l'extension en mode de déchargement manuel. *(interne)* *(hook)* | 241 |
| `telemetry_configManager.setPollingEnabled(enabled)` | Active ou coupe le polling : installe/retire les hooks onUpdate (test d'expiration toutes les 60 s si la session en ligne est authentifiée) et onOnlineStateChanged (test dès la connexion), puis appelle extensions.hookUpdate. | 230 |

### Détail des paramètres

#### `telemetry_configManager.fetchConfigFromAPI(callback)`

Appelle core_online.apiCall('s11/v1/telemetryConfig') en envoyant les faits client et l'identifiant anonyme. Si la réponse est valide, la sauvegarde dans /telemetry/config.json et appelle callback ; sinon, appelle callback avec une config par défaut désactivée (sauf si une config existe déjà).

- `callback` (*function|nil*) : Appelée avec la configuration obtenue.

#### `telemetry_configManager.getConfig()`

Renvoie la configuration actuellement appliquée.

- **renvoie** : table|nil Config (enabled, ttlHours, reportIntervalHours, runIds, moduleConfigs) ou nil avant initializeConfig.

#### `telemetry_configManager.getModuleConfig(moduleName)`

Renvoie la configuration d'un module de télémétrie : {enabled = true} en mode local, la table moduleConfigs[moduleName] si elle existe, sinon la table partagée {enabled = false}.

- `moduleName` (*string*) : Nom du module/tracker.
- **renvoie** : table Config du module (ne pas la modifier : elle peut être partagée).

#### `telemetry_configManager.getSurveyIntervalHours(moduleName, defaultHours)`

Intervalle d'échantillonnage d'un module en heures : surveyIntervalHours, ou surveyIntervalDays * 24 pour les anciens caches, sinon la valeur par défaut. Les anciens caches en jours restent lus jusqu'à ce que toutes les installations aient récupéré le format en heures.

- `moduleName` (*string*) : Nom du module.
- `defaultHours` (*number*) : Valeur renvoyée si rien n'est configuré.
- **renvoie** : number Intervalle en heures.

#### `telemetry_configManager.getTelemetryVersion()`

Renvoie la version du schéma de télémétrie.

- **renvoie** : string Actuellement '30'.

#### `telemetry_configManager.initializeConfig(callback)`

Charge la configuration : en mode local, applique une config par défaut activée ; sinon active le polling, applique le cache s'il est valide et récent, sinon une config par défaut désactivée (la récupération réelle a lieu après authentification en ligne).

- `callback` (*function|nil*) : Appelée avec la config à chaque application (et mémorisée pour les mises à jour ultérieures).

#### `telemetry_configManager.isLocalOnly()`

Indique si le jeu a été lancé avec -telemetryLocal : tous les trackers sont actifs avec leurs valeurs par défaut, le serveur n'est jamais interrogé et rien n'est envoyé.

- **renvoie** : boolean true si l'argument est présent.

#### `telemetry_configManager.isModuleEnabled(moduleName)`

Indique si un module est activé (getModuleConfig(...).enabled == true).

- `moduleName` (*string*) : Nom du module/tracker.
- **renvoie** : boolean true si activé.

#### `telemetry_configManager.setPollingEnabled(enabled)`

Active ou coupe le polling : installe/retire les hooks onUpdate (test d'expiration toutes les 60 s si la session en ligne est authentifiée) et onOnlineStateChanged (test dès la connexion), puis appelle extensions.hookUpdate.

- `enabled` (*boolean*) : true pour activer.

## Champs

| Champ | Type | Description |
|---|---|---|
| `dependencies` | string[] | {'telemetry_userIdentity'}. |

## Hooks émis

Évènements diffusés aux extensions par `extensions.hook` :

- `onOnlineStateChanged` — écouté par 3 module(s)
- `onUpdate` — écouté par 186 module(s)

## Appels vers le moteur (C++)

- `Engine.` `getStartingArgs`
- `FS:` `directoryCreate`, `directoryExists`, `fileExists`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/telemetry/configManager.lua`.*

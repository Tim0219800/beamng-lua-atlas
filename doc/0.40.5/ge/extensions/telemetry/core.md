# `telemetry_core`

*Fichier : `lua/ge/extensions/telemetry/core.lua` · VM : Game Engine (GE) · 507 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `telemetry_core` : `extensions.load("telemetry_core")`, puis la globale `telemetry_core`

Noyau de la télémétrie de BeamNG (extension GE telemetry_core, dépend de telemetry_configManager). Il décide si la télémétrie est active (consentement dans les réglages, arguments de lancement, config serveur), tamponne les événements envoyés par les trackers (addEvent), les écrit en JSON Lines dans /telemetry/sessions/<id>.jsonl, charge automatiquement les trackers du dossier telemetry/trackers/ activés par la config et le reporter jsonFileReporter qui envoie les sessions des exécutions précédentes. Un moddeur n'a normalement pas à l'appeler ; il peut seulement observer le hook onTelemetryEventAdded.

## Exemple

```lua
-- depuis un tracker : événement ponctuel et durée
telemetry_core.addEvent({name = "monEvenement", valeur = 3})
telemetry_core.startActivity("menu", {page = "options"})
telemetry_core.endActivity("menu")
```

## Remarques

- Désactivation : plateforme ps5/ps5pro ; argument -notelemetry (prioritaire sur tout) ; mode agent IA (Engine.isAgentMode) ; licence tech vérifiée ; sinon il faut settings onlineFeatures == 'enable' et telemetry == 'enable' (la valeur 'ask' garde la télémétrie coupée).
- Argument -telemetryLocal : tous les trackers actifs, aucun envoi, données dans /telemetry/local/. Argument -telemetry, ou toute build non shipping : télémétrie forcée (un commentaire du code dit que le cas non shipping est temporaire).
- Quand la télémétrie est coupée, eventBuffer vaut nil et addEvent renvoie false sans rien faire.
- Les événements sont écrits sur disque tous les 100 événements, à la désactivation et sur triggerReportWrite. Chaque événement reçoit un champ t = os.clockhp() ; ne pas définir event.t soi-même (une erreur est loguée).
- L'identifiant de session est 'AAAA-MM-JJTHH-MM-SSZ_<sha256 d'octets aléatoires>' (85 caractères). Après un rechargement des VM Lua (luaVmStartReason == 'reload'), la session est reprise si les runIds n'ont pas changé.
- Le tracker 'session' est chargé en premier (priorité 1), les autres à la priorité 500 ; au déchargement l'ordre est inversé. Un tracker absent ou désactivé dans moduleConfigs n'est pas chargé.
- Si les runIds changent après l'ouverture de la session, une nouvelle session est créée ; l'ancienne est supprimée si elle ne collectait pour aucune exécution (session « stub » du démarrage).

**Dépendances (chargées avant) :** `telemetry_configManager`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `telemetry_core.addEvent(event)` | Ajoute un événement au tampon de la session. L'événement doit être une table avec un champ name (chaîne non vide). Lui ajoute t = os.clockhp(), appelle le hook onTelemetryEventAdded(event), l'encode en JSON sur une ligne et vide le tampon sur disque tous les 100 événements. | 75 |
| `telemetry_core.endActivity(activityName, data)` | Ajoute l'événement {name = activityName, type = 'end'} fusionné avec data. | 479 |
| `telemetry_core.getDataFolder()` | Dossier des données de télémétrie : '/telemetry/local/' en mode -telemetryLocal (sessions et sondages séparés, jamais envoyés par le reporter d'une exécution normale), sinon '/telemetry/'. | 30 |
| `telemetry_core.getRunIds()` | Liste des exécutions de télémétrie (runIds de la config serveur) pour lesquelles la session collecte. Fixée avant le chargement des trackers. | 457 |
| `telemetry_core.getRunTime()` | Temps écoulé en secondes (os.clockhp()), utilisé par les trackers pour mesurer des durées. | 452 |
| `telemetry_core.getSessionFile()` | Fichier .jsonl de la session en cours. Le reporter ne doit ni l'envoyer ni le supprimer. | 40 |
| `telemetry_core.getSessionId()` | Identifiant de la session : horodatage plus octets aléatoires, sans lien avec le jeton de compte ni une identité. Sert à reconnaître un renvoi en double après une réponse perdue. | 47 |
| `telemetry_core.isPlatformSupported(platform)` | Renvoie false pour les plateformes 'ps5' et 'ps5pro', true sinon. | 123 |
| `telemetry_core.isSessionContinued()` | Indique si la session actuelle reprend celle d'avant un rechargement Lua. | 461 |
| `telemetry_core.onExit()` | Hook appelé à la fermeture du jeu ; même fonction que onExtensionUnloaded. *(interne)* *(hook)* | 436 |
| `telemetry_core.onExtensionLoaded(previousSession)` | Hook de chargement : met le mode de déchargement en manuel, active la télémétrie si shouldTelemetryBeActive() ; sinon clôt la session précédente et reste en mode sans effet. *(interne)* *(hook)* | 403 |
| `telemetry_core.onExtensionUnloaded()` | Hook de déchargement : désactive la télémétrie (écrit les événements restants, décharge trackers et reporter) et coupe le polling de la config. *(interne)* *(hook)* | 436 |
| `telemetry_core.onSerialize(reason)` | Hook de sérialisation : lors d'un rechargement Lua (reason == 'reload') avec une session valide, renvoie {sessionId, runIds} pour reprendre la session ensuite. *(interne)* *(hook)* | 443 |
| `telemetry_core.onSettingsChanged()` | Hook appelé quand les réglages changent : active ou désactive la télémétrie selon le consentement, et coupe le polling de config si elle est inactive. *(interne)* *(hook)* | 421 |
| `telemetry_core.startActivity(activityName, data)` | Ajoute l'événement {name = activityName, type = 'start'} fusionné avec data, pour mesurer une durée avec endActivity. | 473 |
| `telemetry_core.triggerReportWrite()` | Écrit immédiatement les événements en tampon dans le fichier de session, pour qu'ils survivent à un plantage. | 466 |

### Détail des paramètres

#### `telemetry_core.addEvent(event)`

Ajoute un événement au tampon de la session. L'événement doit être une table avec un champ name (chaîne non vide). Lui ajoute t = os.clockhp(), appelle le hook onTelemetryEventAdded(event), l'encode en JSON sur une ligne et vide le tampon sur disque tous les 100 événements.

- `event` (*table*) : Événement : name obligatoire, autres champs libres, t interdit.
- **renvoie** : boolean true si l'événement a été stocké, false s'il a été refusé (télémétrie inactive, table invalide, name manquant).

#### `telemetry_core.endActivity(activityName, data)`

Ajoute l'événement {name = activityName, type = 'end'} fusionné avec data.

- `activityName` (*string*) : Nom de l'activité commencée.
- `data` (*table|nil*) : Champs supplémentaires de l'événement.

#### `telemetry_core.getDataFolder()`

Dossier des données de télémétrie : '/telemetry/local/' en mode -telemetryLocal (sessions et sondages séparés, jamais envoyés par le reporter d'une exécution normale), sinon '/telemetry/'.

- **renvoie** : string Chemin du dossier.

#### `telemetry_core.getRunIds()`

Liste des exécutions de télémétrie (runIds de la config serveur) pour lesquelles la session collecte. Fixée avant le chargement des trackers.

- **renvoie** : string[]|nil Identifiants de run.

#### `telemetry_core.getRunTime()`

Temps écoulé en secondes (os.clockhp()), utilisé par les trackers pour mesurer des durées.

- **renvoie** : number Secondes.

#### `telemetry_core.getSessionFile()`

Fichier .jsonl de la session en cours. Le reporter ne doit ni l'envoyer ni le supprimer.

- **renvoie** : string|nil Chemin, ou nil si aucune session.

#### `telemetry_core.getSessionId()`

Identifiant de la session : horodatage plus octets aléatoires, sans lien avec le jeton de compte ni une identité. Sert à reconnaître un renvoi en double après une réponse perdue.

- **renvoie** : string|nil Identifiant de session.

#### `telemetry_core.isPlatformSupported(platform)`

Renvoie false pour les plateformes 'ps5' et 'ps5pro', true sinon.

- `platform` (*string*) : Valeur de Engine.Platform.getPlatform() ('' sur PC).
- **renvoie** : boolean true si la télémétrie peut tourner.

#### `telemetry_core.isSessionContinued()`

Indique si la session actuelle reprend celle d'avant un rechargement Lua.

- **renvoie** : boolean true si la session est reprise.

#### `telemetry_core.onExtensionLoaded(previousSession)`

Hook de chargement : met le mode de déchargement en manuel, active la télémétrie si shouldTelemetryBeActive() ; sinon clôt la session précédente et reste en mode sans effet.

- `previousSession` (*table|nil*) : Données renvoyées par onSerialize avant un rechargement Lua (sessionId, runIds).
- **renvoie** : boolean Toujours true (reste chargée).

#### `telemetry_core.onSerialize(reason)`

Hook de sérialisation : lors d'un rechargement Lua (reason == 'reload') avec une session valide, renvoie {sessionId, runIds} pour reprendre la session ensuite.

- `reason` (*string*) : Motif de la sérialisation ('reload'…).
- **renvoie** : table|nil Données de reprise.

#### `telemetry_core.startActivity(activityName, data)`

Ajoute l'événement {name = activityName, type = 'start'} fusionné avec data, pour mesurer une durée avec endActivity.

- `activityName` (*string*) : Nom de l'activité.
- `data` (*table|nil*) : Champs supplémentaires de l'événement.

## Champs

| Champ | Type | Description |
|---|---|---|
| `dependencies` | string[] | {'telemetry_configManager'} : déclarée mais non appelée à la demande, pour que les trackers ne démarrent pas avant l'initialisation de la config. |

## Hooks émis

Évènements diffusés aux extensions par `extensions.hook` :

- `onTelemetryEventAdded`

## Appels vers le moteur (C++)

- `Engine.` `getStartingArgs`, `isAgentMode`
- `FS:` `directoryCreate`, `directoryExists`, `fileExists`, `findFiles`, `removeFile`
- `ResearchVerifier.` `isTechLicenseVerified`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/telemetry/core.lua`.*
